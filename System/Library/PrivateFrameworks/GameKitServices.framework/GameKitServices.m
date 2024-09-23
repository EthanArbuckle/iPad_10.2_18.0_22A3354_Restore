void OUTLINED_FUNCTION_24(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Eu);
}

uint64_t OUTLINED_FUNCTION_9@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return objc_msgSend(a1, "length");
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x4Eu);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Cu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x22u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x28u);
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x22u);
}

uint64_t OUTLINED_FUNCTION_2_1@<X0>(id *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return objc_msgSend(*a1, "UTF8String");
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Cu);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x36u);
}

void OUTLINED_FUNCTION_7_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x28u);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, "serviceNameforDeviceID:playerID:", v2, a1);
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return objc_msgSend(a1, "description");
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 40), "playerID");
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return *(_QWORD *)(*(_QWORD *)a1 + 8);
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x22u);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

int *OUTLINED_FUNCTION_10_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 40) = a1;
  return __error();
}

int *OUTLINED_FUNCTION_15@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
  return __error();
}

void OUTLINED_FUNCTION_16_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_16_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_19_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x22u);
}

double micro()
{
  double v0;

  v0 = machTimeScale();
  return v0 * (double)(uint64_t)mach_absolute_time();
}

double machTimeScale()
{
  unint64_t v1;
  unint64_t v2;
  mach_timebase_info info;

  if ((machTimeScale_did_init & 1) == 0)
  {
    info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
    mach_timebase_info(&info);
    LODWORD(v2) = info.denom;
    LODWORD(v1) = info.numer;
    *(double *)&machTimeScale_timeScale = (double)v1 / (double)v2 / 1000000000.0;
    __dmb(0xBu);
    machTimeScale_did_init = 1;
  }
  return *(double *)&machTimeScale_timeScale;
}

uint64_t rijndaelKeySetupEnc(unsigned int *a1, unsigned int *a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v14;
  uint64_t v15;
  unsigned int *i;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int *j;
  int v21;
  int v22;
  int v23;

  v3 = bswap32(*a2);
  *a1 = v3;
  v4 = bswap32(a2[1]);
  a1[1] = v4;
  v5 = bswap32(a2[2]);
  a1[2] = v5;
  v6 = bswap32(a2[3]);
  a1[3] = v6;
  if (a3 == 128)
  {
    v7 = 0;
    v8 = a1 + 4;
    do
    {
      v9 = *(v8 - 1);
      v3 ^= (Te4[4 * BYTE2(v9) + 3] << 24) ^ (Te4[4 * BYTE1(v9) + 2] << 16) ^ (Te4[4 * v9 + 1] << 8) ^ Te4[(v9 >> 22) & 0x3FC] ^ rcon[v7];
      v10 = *(v8 - 2);
      v11 = *(v8 - 3) ^ v3;
      *v8 = v3;
      v8[1] = v11;
      v12 = v10 ^ v11;
      v8[2] = v12;
      v8[3] = v12 ^ v9;
      ++v7;
      v8 += 4;
    }
    while (v7 != 10);
    return 10;
  }
  else
  {
    a1[4] = bswap32(a2[4]);
    v14 = bswap32(a2[5]);
    a1[5] = v14;
    if (a3 == 192)
    {
      v15 = 0;
      for (i = a1 + 11; ; i += 6)
      {
        v3 ^= (Te4[4 * BYTE2(v14) + 3] << 24) ^ (Te4[4 * BYTE1(v14) + 2] << 16) ^ (Te4[4 * v14 + 1] << 8) ^ Te4[4 * HIBYTE(v14)] ^ rcon[v15];
        v4 ^= v3;
        *(i - 5) = v3;
        *(i - 4) = v4;
        v5 ^= v4;
        v6 ^= v5;
        *(i - 3) = v5;
        *(i - 2) = v6;
        if (v15 == 7)
          break;
        v17 = *(i - 7) ^ v6;
        v14 ^= v17;
        *(i - 1) = v17;
        *i = v14;
        ++v15;
      }
      return 12;
    }
    else
    {
      a1[6] = bswap32(a2[6]);
      v18 = bswap32(a2[7]);
      a1[7] = v18;
      if (a3 == 256)
      {
        v19 = 0;
        for (j = a1 + 8; ; j += 8)
        {
          v3 ^= (Te4[4 * BYTE2(v18) + 3] << 24) ^ (Te4[4 * BYTE1(v18) + 2] << 16) ^ (Te4[4 * v18 + 1] << 8) ^ Te4[4 * HIBYTE(v18)] ^ rcon[v19];
          v4 ^= v3;
          *j = v3;
          j[1] = v4;
          v5 ^= v4;
          v6 ^= v5;
          j[2] = v5;
          j[3] = v6;
          if (v19 == 6)
            break;
          v21 = *(j - 4) ^ (Te4[4 * HIBYTE(v6) + 3] << 24) ^ (Te4[4 * BYTE2(v6) + 2] << 16) ^ (Te4[4 * BYTE1(v6) + 1] << 8) ^ Te4[4 * v6];
          v22 = *(j - 3) ^ v21;
          j[4] = v21;
          j[5] = v22;
          v23 = *(j - 2) ^ v22;
          v18 ^= v23;
          j[6] = v23;
          j[7] = v18;
          ++v19;
        }
        return 14;
      }
      else
      {
        return 0;
      }
    }
  }
}

_DWORD *rijndaelEncrypt(_DWORD *result, int a2, unsigned int *a3, _DWORD *a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  _DWORD *v10;
  int i;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _DWORD *v31;

  v4 = bswap32(*a3) ^ *result;
  v5 = bswap32(a3[1]) ^ result[1];
  v6 = a3[3];
  v7 = bswap32(a3[2]) ^ result[2];
  v8 = bswap32(v6) ^ result[3];
  v9 = ((a2 >> 1) - 1);
  v10 = result + 6;
  for (i = (a2 >> 1) - 1; ; --i)
  {
    v12 = Te1[BYTE2(v5)] ^ Te0[HIBYTE(v4)] ^ Te2[BYTE1(v7)] ^ Te3[v8] ^ *(v10 - 2);
    v13 = Te1[BYTE2(v7)] ^ Te0[HIBYTE(v5)] ^ Te2[BYTE1(v8)] ^ Te3[v4] ^ *(v10 - 1);
    v14 = Te1[BYTE2(v8)] ^ Te0[HIBYTE(v7)] ^ Te2[BYTE1(v4)] ^ Te3[v5] ^ *v10;
    v15 = Te1[BYTE2(v4)] ^ Te0[HIBYTE(v8)] ^ Te2[BYTE1(v5)] ^ Te3[v7] ^ v10[1];
    v16 = HIBYTE(v12);
    v17 = HIBYTE(v13);
    v18 = BYTE1(v15);
    v19 = HIBYTE(v14);
    v20 = BYTE2(v15);
    v21 = BYTE1(v12);
    v22 = HIBYTE(v15);
    v23 = BYTE2(v12);
    if (!i)
      break;
    v24 = Te1[BYTE2(v13)] ^ Te0[v16] ^ Te2[BYTE1(v14)] ^ Te3[v15];
    v25 = v10[2];
    v26 = v10[3];
    v27 = v10[4];
    v28 = v10[5];
    v10 += 8;
    v4 = v24 ^ v25;
    v5 = Te1[BYTE2(v14)] ^ Te0[v17] ^ Te2[v18] ^ Te3[v12] ^ v26;
    v29 = Te0[v22];
    v30 = Te1[v23];
    v7 = Te1[v20] ^ Te0[v19] ^ Te2[v21] ^ Te3[v13] ^ v27;
    v8 = v30 ^ v29 ^ Te2[BYTE1(v13)] ^ Te3[v14] ^ v28;
  }
  v31 = &result[8 * v9];
  *a4 = bswap32(((Te4[4 * v16 + 3] << 24) | (Te4[4 * BYTE2(v13) + 2] << 16) | (Te4[4 * BYTE1(v14) + 1] << 8) | Te4[4 * v15]) ^ v31[8]);
  a4[1] = bswap32(((Te4[4 * v17 + 3] << 24) | (Te4[4 * BYTE2(v14) + 2] << 16) | (Te4[4 * BYTE1(v15) + 1] << 8) | Te4[4 * v12]) ^ v31[9]);
  a4[2] = bswap32(((Te4[4 * v19 + 3] << 24) | (Te4[4 * BYTE2(v15) + 2] << 16) | (Te4[4 * BYTE1(v12) + 1] << 8) | Te4[4 * v13]) ^ v31[10]);
  a4[3] = bswap32(((Te4[4 * v22 + 3] << 24) | (Te4[4 * BYTE2(v12) + 2] << 16) | (Te4[4 * BYTE1(v13) + 1] << 8) | Te4[4 * v14]) ^ v31[11]);
  return result;
}

_DWORD *kdf(_DWORD *result, unsigned __int8 (*a2)[4][4], char a3, int a4)
{
  unsigned int v4;
  _OWORD *v6;
  int v7;
  int v8;
  BOOL v9;
  __int128 __src;
  _BYTE v11[15];
  char v12;
  uint64_t v13;

  v4 = a4;
  v6 = result;
  v13 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)&__src + 1) = 0xAAAAAAAAAAAAAAAALL;
  memset(v11, 0, sizeof(v11));
  *(_QWORD *)&__src = 0xAAAAAAAAAAAAAAAALL;
  v11[7] = a3;
  v12 = 1;
  if (a4 < 16)
  {
    v8 = a4;
    if (!a4)
      return result;
    goto LABEL_5;
  }
  v7 = 2;
  do
  {
    result = rijndaelEncrypt(a2, 10, (unsigned int *)v11, &__src);
    v8 = v4 - 16;
    *v6++ = __src;
    v12 = v7++;
    v9 = v4 > 0x1F;
    v4 -= 16;
  }
  while (v9);
  if (v8)
  {
LABEL_5:
    rijndaelEncrypt(a2, 10, (unsigned int *)v11, &__src);
    return memcpy(v6, &__src, v8);
  }
  return result;
}

uint64_t poly_hash(uint64_t result, uint64_t a2)
{
  uint64_t i;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  for (i = 0; i != 32; i += 8)
  {
    v3 = *(_QWORD *)(a2 + i);
    v4 = result + i;
    v5 = *(_QWORD *)(result + i + 1208);
    v6 = *(_QWORD *)(result + i + 1176);
    v7 = v6 * (unint64_t)HIDWORD(v5) + HIDWORD(v6) * (unint64_t)v5;
    v8 = v6 * v5 + 59 * (HIDWORD(v7) + HIDWORD(v6) * (unint64_t)HIDWORD(v5));
    if (v8 < v7 << 32)
      v8 += 59;
    if (v3 < 0xFFFFFFFF00000000)
    {
      v17 = v8 + v3;
      if (__CFADD__(v8, v3))
        v17 = v8 + v3 + 59;
    }
    else
    {
      if (v8 > 0x3B)
        v9 = -1;
      else
        v9 = -60;
      v10 = v9 + v8;
      *(_QWORD *)(v4 + 1208) = v10;
      v11 = *(_QWORD *)(a2 + i);
      v12 = v11 - 59;
      v13 = HIDWORD(v10) * (unint64_t)v6 + v10 * (unint64_t)HIDWORD(v6);
      v14 = v10 * v6 + 59 * (HIDWORD(v13) + HIDWORD(v10) * (unint64_t)HIDWORD(v6));
      if (v14 < v13 << 32)
        v14 += 59;
      v15 = __CFADD__(v14, v12);
      v16 = v14 + v12;
      v17 = v14 + v11;
      if (!v15)
        v17 = v16;
    }
    *(_QWORD *)(v4 + 1208) = v17;
  }
  return result;
}

uint64_t ip_long(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = 0;
  v3 = result + 1208;
  v4 = 1240;
  do
  {
    v5 = *(_QWORD *)(v3 + 8 * v2);
    if (v5 >= 0xFFFFFFFFFFFFFFC5)
    {
      v5 += 59;
      *(_QWORD *)(v3 + 8 * v2) = v5;
    }
    v6 = *(_QWORD *)(result + v4) * HIWORD(v5)
       + *(_QWORD *)(result + v4 + 8) * WORD2(v5)
       + *(_QWORD *)(result + v4 + 16) * WORD1(v5)
       + *(_QWORD *)(result + v4 + 24) * (unsigned __int16)v5;
    v7 = 5 * (v6 >> 36) + (v6 & 0xFFFFFFFFFLL);
    if (v7 > 0xFFFFFFFFALL)
      LODWORD(v7) = v7 + 5;
    *(_DWORD *)(a2 + 4 * v2) = bswap32(*(_DWORD *)(result + 4 * v2 + 1368) ^ v7);
    ++v2;
    v4 += 32;
  }
  while (v2 != 4);
  return result;
}

uint64_t ip_short(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;

  v3 = a2[1];
  v4 = *(_QWORD *)(result + 1240) * HIWORD(*a2)
     + *(_QWORD *)(result + 1248) * (unsigned __int16)WORD2(*a2)
     + *(_QWORD *)(result + 1256) * WORD1(*a2)
     + *(_QWORD *)(result + 1264) * (unsigned __int16)*a2;
  v5 = 5 * (v4 >> 36) + (v4 & 0xFFFFFFFFFLL);
  if (v5 > 0xFFFFFFFFALL)
    LODWORD(v5) = 5 * (v4 >> 36) + v4 + 5;
  *a3 = bswap32(*(_DWORD *)(result + 1368) ^ v5);
  v6 = *(_QWORD *)(result + 1272) * HIWORD(v3)
     + *(_QWORD *)(result + 1280) * WORD2(v3)
     + *(_QWORD *)(result + 1288) * WORD1(v3)
     + *(_QWORD *)(result + 1296) * (unsigned __int16)v3;
  v7 = 5 * (v6 >> 36) + (v6 & 0xFFFFFFFFFLL);
  if (v7 > 0xFFFFFFFFALL)
    LODWORD(v7) = v7 + 5;
  a3[1] = bswap32(*(_DWORD *)(result + 1372) ^ v7);
  v8 = a2[3];
  v9 = *(_QWORD *)(result + 1304) * HIWORD(a2[2])
     + *(_QWORD *)(result + 1312) * (unsigned __int16)WORD2(a2[2])
     + *(_QWORD *)(result + 1320) * WORD1(a2[2])
     + *(_QWORD *)(result + 1328) * (unsigned __int16)a2[2];
  v10 = 5 * (v9 >> 36) + (v9 & 0xFFFFFFFFFLL);
  if (v10 > 0xFFFFFFFFALL)
    LODWORD(v10) = v10 + 5;
  a3[2] = bswap32(*(_DWORD *)(result + 1376) ^ v10);
  v11 = *(_QWORD *)(result + 1336) * HIWORD(v8)
      + *(_QWORD *)(result + 1344) * WORD2(v8)
      + *(_QWORD *)(result + 1352) * WORD1(v8)
      + *(_QWORD *)(result + 1360) * (unsigned __int16)v8;
  v12 = 5 * (v11 >> 36) + (v11 & 0xFFFFFFFFFLL);
  if (v12 <= 0xFFFFFFFFALL)
    v13 = v12;
  else
    v13 = v12 + 5;
  a3[3] = bswap32(*(_DWORD *)(result + 1380) ^ v13);
  return result;
}

uint64_t uhash(int64x2_t *a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  unsigned __int8 *v6;
  int64x2_t v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a2;
  v18 = *MEMORY[0x24BDAC8D0];
  v8.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v8.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v16 = v8;
  v17 = v8;
  if (a3 >= 1025)
  {
    v10 = a3 + 1024;
    v11 = a3 + 31;
    v12 = 8 * a3;
    v13 = -(int)a3;
    v15 = vdupq_n_s64(0x2000uLL);
    do
    {
      v16 = v15;
      v17 = v15;
      nh_aux(a1->i32, v6, v16.i64, 0x400u);
      poly_hash((uint64_t)a1, (uint64_t)&v16);
      v6 += 1024;
      v10 -= 1024;
      v11 -= 1024;
      v12 -= 0x2000;
      v13 += 1024;
    }
    while (v10 > 0x7FF);
    if (v10 != 1024)
    {
      zero_pad(&v6[v10 - 1024], v13 + (v11 & 0xFFFFFFE0));
      v16.i64[0] = v12 & 0xFFFFFFF8;
      v16.i64[1] = v16.i64[0];
      v17.i64[0] = v16.i64[0];
      v17.i64[1] = v16.i64[0];
      nh_aux(a1->i32, v6, v16.i64, v11 & 0xFFFFFFE0);
      poly_hash((uint64_t)a1, (uint64_t)&v16);
    }
    ip_long((uint64_t)a1, (uint64_t)a4);
  }
  else
  {
    if (a3)
      v9 = (a3 + 31) & 0xFFFFFFE0;
    else
      v9 = 32;
    zero_pad(&a2[a3], v9 - a3);
    v16.i64[0] = (8 * v5);
    v16.i64[1] = v16.i64[0];
    v17.i64[0] = v16.i64[0];
    v17.i64[1] = v16.i64[0];
    nh_aux(a1->i32, v6, v16.i64, v9);
    ip_short((uint64_t)a1, &v16, a4);
  }
  a1[73].i64[0] = 0;
  a1[72] = 0u;
  a1[71] = 0u;
  a1[86].i32[2] = 0;
  a1[75].i64[1] = 1;
  a1[76] = vdupq_n_s64(1uLL);
  a1[77].i64[0] = 1;
  return 1;
}

void zero_pad(unsigned __int8 *a1, int a2)
{
  int v2;
  unsigned __int8 *v3;
  size_t v4;
  int v5;
  uint64_t v6;

  v2 = a2;
  v3 = a1;
  if (a2 >= 8)
  {
    if ((a1 & 7) == 0
      || (v4 = (~(_BYTE)a1 & 7) + 1,
          bzero(a1, v4),
          v2 += v3 | 0xFFFFFFF8,
          v3 += v4,
          v2 >= 8))
    {
      if (v2 >= 15)
        v5 = 15;
      else
        v5 = v2;
      v6 = (v2 - v5 + 7) & 0xFFFFFFF8;
      bzero(v3, v6 + 8);
      v2 = v2 - v6 - 8;
      v3 += v6 + 8;
    }
  }
  if (v2)
    bzero(v3, v2);
}

uint64_t umac_delete(void *a1)
{
  free(a1);
  return 1;
}

void **umac_new(unsigned int *a1)
{
  void **v2;
  void **v3;
  __int128 v4;
  unsigned int *v5;
  _DWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  float *v11;
  int8x16_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int64x2_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t j;
  float *v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  _OWORD v24[11];
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
  uint64_t v43;
  float32x4x2_t v44;
  float32x4x2_t v45;
  float32x4x2_t v46;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)malloc_type_malloc(0x658uLL, 0x1020040B23A9D2DuLL);
  v3 = v2;
  if (v2)
  {
    *v2 = (void *)(((unint64_t)(v2 + 1) & 0xFFFFFFFFFFFFFFF0) + 16);
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24[9] = v4;
    v24[10] = v4;
    v24[7] = v4;
    v24[8] = v4;
    v24[5] = v4;
    v24[6] = v4;
    v24[3] = v4;
    v24[4] = v4;
    v24[1] = v4;
    v24[2] = v4;
    v24[0] = v4;
    rijndaelKeySetupEnc((unsigned int *)v24, a1, 128);
    v5 = (unsigned int *)*v3;
    v6 = (char *)*v3 + 1392;
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 0, 16);
    rijndaelKeySetupEnc(v5 + 356, (unsigned int *)&v25, 128);
    *((_QWORD *)v5 + 177) = 0;
    *((_QWORD *)v5 + 176) = 0;
    rijndaelEncrypt(v5 + 356, 10, v5 + 352, v6);
    v7 = (char *)*v3;
    v8 = (uint64_t)*v3 + 1176;
    bzero(*v3, 0x570uLL);
    kdf(v7, (unsigned __int8 (*)[4][4])v24, 1, 1072);
    for (i = 0; i != 1072; i += 16)
      *(int8x16_t *)&v7[i] = vrev32q_s8(*(int8x16_t *)&v7[i]);
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v41 = v10;
    v42 = v10;
    v39 = v10;
    v40 = v10;
    v37 = v10;
    v38 = v10;
    v35 = v10;
    v36 = v10;
    v33 = v10;
    v34 = v10;
    v31 = v10;
    v32 = v10;
    v29 = v10;
    v30 = v10;
    v27 = v10;
    v28 = v10;
    v25 = v10;
    v26 = v10;
    *((_QWORD *)v7 + 146) = 0;
    *((_OWORD *)v7 + 72) = 0u;
    *((_OWORD *)v7 + 71) = 0u;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 2, 288);
    v11 = (float *)(v7 + 1176);
    v12.i64[0] = __PAIR64__(DWORD2(v26), v25);
    v12.i64[1] = __PAIR64__(DWORD2(v29), v28);
    v13.i64[0] = v28;
    v13.i64[1] = *((_QWORD *)&v29 + 1);
    v14.i64[0] = v25;
    v14.i64[1] = *((_QWORD *)&v26 + 1);
    v45.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)vuzp2q_s32(v14, v13));
    v45.val[1] = (float32x4_t)vrev32q_s8(v12);
    vst2q_f32(v11, v45);
    v45.val[0] = (float32x4_t)(*(_OWORD *)(v8 + 16) & __PAIR128__(0x1FFFFFF01FFFFFFLL, 0x1FFFFFF01FFFFFFLL));
    v12.i64[0] = __PAIR64__(HIDWORD(*(_QWORD *)v8), *(_OWORD *)v8) & 0x1FFFFFF01FFFFFFLL;
    v12.i32[2] = *(_QWORD *)(v8 + 8) & 0x1FFFFFF;
    v12.i32[3] = HIDWORD(*(_QWORD *)v8) & 0x1FFFFFF;
    *(int8x16_t *)v8 = v12;
    *(float32x4_t *)(v8 + 16) = v45.val[0];
    v15 = vdupq_n_s64(1uLL);
    *(int64x2_t *)(v8 + 32) = v15;
    *(int64x2_t *)(v8 + 48) = v15;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 3, 288);
    v16 = 32;
    v17 = v7 + 1240;
    do
    {
      *v17 = *(__int128 *)((char *)&v25 + v16);
      v17[1] = *(__int128 *)((char *)&v25 + v16 + 16);
      v16 += 64;
      v17 += 2;
    }
    while (v16 != 288);
    for (j = 0; j != 128; j += 32)
    {
      v19 = (float *)&v7[j + 1240];
      v44 = vld2q_f32(v19);
      v46.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v44.val[1]);
      v46.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v44.val[0]);
      vst2q_f32(v19, v46);
    }
    v20 = 0;
    v21 = v7 + 1240;
    do
    {
      *(_QWORD *)&v22 = *(_QWORD *)&v21[v20] % 0xFFFFFFFFBuLL;
      *((_QWORD *)&v22 + 1) = *(_QWORD *)&v21[v20 + 8] % 0xFFFFFFFFBuLL;
      *(_OWORD *)&v21[v20] = v22;
      v20 += 16;
    }
    while (v20 != 128);
    kdf((_DWORD *)(v8 + 192), (unsigned __int8 (*)[4][4])v24, 4, 16);
    *(int8x16_t *)(v8 + 192) = vrev32q_s8(*(int8x16_t *)(v8 + 192));
  }
  return v3;
}

_DWORD *pdf_gen_xor(_DWORD *result, int *a2, _QWORD *a3)
{
  _QWORD *v4;
  unsigned int *v5;
  int v6;
  int v7;
  uint64_t v8;

  v4 = result;
  v5 = result + 4;
  v7 = *a2;
  v6 = a2[1];
  if (v6 != result[5] || v7 != *v5)
  {
    result[4] = v7;
    result[5] = v6;
    result = rijndaelEncrypt(result + 8, 10, v5, result);
  }
  v8 = a3[1];
  *a3 ^= *v4;
  a3[1] = v8 ^ v4[1];
  return result;
}

uint64_t umac(int64x2_t **a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4, int *a5)
{
  uhash(*a1, a2, a3, a4);
  pdf_gen_xor((int64x2_t *)(*a1)[87].i32, a5, a4);
  return 1;
}

uint64_t nh_aux(int *a1, _DWORD *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int *v15;
  char *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  unint64_t v43;
  int v44;
  uint64_t result;

  v4 = *a3;
  v5 = a3[1];
  v6 = a4 >> 5;
  v7 = a3[2];
  v8 = a3[3];
  v10 = *a1;
  v9 = a1[1];
  v12 = a1[2];
  v11 = a1[3];
  v14 = a1[4];
  v13 = a1[5];
  v15 = a1 + 10;
  v16 = (char *)(a1 + 10);
  v17 = a1[6];
  v18 = a1[7];
  do
  {
    v19 = a2[1];
    v20 = a2[4];
    v21 = a2[5];
    v22 = *(v15 - 2);
    v23 = *(v15 - 1);
    v24 = v4 + (v20 + v14) * (unint64_t)(*a2 + v10);
    v25 = v15[2];
    v26 = v15[3];
    v27 = v5 + (v22 + v20) * (unint64_t)(*a2 + v14);
    v28 = v8 + (v15[6] + v20) * (unint64_t)(v25 + *a2);
    v29 = a2[2];
    v30 = a2[3];
    v31 = v24 + (v21 + v13) * (unint64_t)(v19 + v9);
    v32 = v27 + (v23 + v21) * (unint64_t)(v19 + v13);
    v33 = v7
        + (v25 + v20) * (unint64_t)(v22 + *a2)
        + (v26 + v21) * (unint64_t)(v23 + v19);
    v34 = a2[6];
    v35 = a2[7];
    v36 = v15[7] + v21;
    v37 = *v15;
    v38 = v15[1];
    v39 = v28 + v36 * (unint64_t)(v26 + v19);
    v40 = v31 + (v34 + v17) * (unint64_t)(v29 + v12);
    v41 = v29 + v17;
    v17 = v15[4];
    v42 = v15[5];
    v43 = v33 + (v17 + v34) * (unint64_t)(*v15 + v29);
    v44 = *((_DWORD *)v16 + 8);
    v16 += 32;
    result = (v17 + v29);
    v4 = v40 + (v35 + v18) * (unint64_t)(v30 + v11);
    v5 = v32
       + (*v15 + v34) * (unint64_t)v41
       + (v38 + v35) * (unint64_t)(v30 + v18);
    v7 = v43 + (v42 + v35) * (unint64_t)(v38 + v30);
    v8 = v39
       + (v44 + v34) * (unint64_t)result
       + (v15[9] + v35) * (unint64_t)(v42 + v30);
    a2 += 8;
    v15 = (int *)v16;
    v10 = v22;
    v9 = v23;
    v12 = v37;
    v11 = v38;
    v14 = v25;
    v13 = v26;
    v18 = v42;
    --v6;
  }
  while (v6);
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

void sub_215C61C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C61CAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C62058(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C620B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C6213C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C624A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C625E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C6274C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C64B34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CDX_SCDynamicStoreCallBack(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a3[129])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v4;
        v8 = 2080;
        v9 = "CDX_SCDynamicStoreCallBack";
        v10 = 1024;
        v11 = 1090;
        _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d network-did-change", (uint8_t *)&v6, 0x1Cu);
      }
    }
    a3[129] = 1;
    objc_msgSend(a3, "performSelector:withObject:afterDelay:", sel_networkDidChange, 0, 1.5);
  }
}

void sub_215C64F44(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_215C65278(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_215C65464(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

_DWORD *CDXVendorCreate(unsigned int *a1, int a2, unsigned int *a3)
{
  _DWORD *v6;
  _DWORD *v7;

  v6 = malloc_type_calloc(0x200uLL, 1uLL, 0xBDC66430uLL);
  v7 = v6;
  if (v6)
  {
    v6[126] = rijndaelKeySetupEnc(v6 + 4, a1, 128);
    rijndaelKeySetupEnc(v7 + 64, a3, 128);
    *(_QWORD *)v7 = umac_new(a1);
    *((_QWORD *)v7 + 1) = umac_new(a3);
    *((_QWORD *)v7 + 62) = a2;
  }
  return v7;
}

_DWORD *CDXVendorCreateWithSingleKey(unsigned int *a1)
{
  return CDXVendorCreate(a1, 0, a1);
}

void CDXVendorRelease(void **a1)
{
  umac_delete(*a1);
  umac_delete(a1[1]);
  free(a1);
}

uint64_t CDXVendorCreateTicket(uint64_t a1, _BYTE *a2, size_t *a3, _QWORD *a4, const void *a5, size_t a6, unsigned int a7, unsigned int a8, uint64_t a9, char a10)
{
  time_t v18;
  size_t v19;
  FILE *v20;
  int v21;
  time_t v22;
  size_t v23;
  unint64_t v24;
  time_t v26;
  time_t v27;
  BOOL v28;
  _BOOL4 v29;
  _DWORD *v30;
  int64x2_t **v31;
  size_t v32;
  const double *v33;
  int8x16_t v34;
  int8x16_t *v35;
  int v36;
  int8x16_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v18 = time(0);
  if (a3)
  {
    v19 = *a3;
    if (a1)
      goto LABEL_3;
LABEL_10:
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 102;
    goto LABEL_22;
  }
  v19 = 0;
  if (!a1)
    goto LABEL_10;
LABEL_3:
  if (!a2)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 103;
    goto LABEL_22;
  }
  if (!a3)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 104;
    goto LABEL_22;
  }
  if (!a4)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 105;
    goto LABEL_22;
  }
  if (!a5 && a6)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 106;
LABEL_22:
    fprintf(v20, "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", v21, "");
    return 4294967294;
  }
  if (a8 >= a7)
  {
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = 107;
    goto LABEL_22;
  }
  if ((a10 & 4) != 0)
    v22 = 0;
  else
    v22 = v18;
  v23 = a6 + 15;
  v24 = ((a6 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  *a3 = v24;
  if (v24 >= 0x500 && (a10 & 2) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 116, "");
    return 4294967291;
  }
  if (v24 >= v19)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 119, "");
    return 4294967293;
  }
  v26 = v22 + a9;
  bzero(a2, v19);
  *a2 = 0;
  a2[1] = a7;
  a2[2] = a8;
  *((_DWORD *)a2 + 3) = bswap32(v26);
  a2[3] = v23 >> 4;
  *(_QWORD *)(a2 + 4) = *a4;
  v27 = *(_QWORD *)(a1 + 496);
  v28 = v26 < v27;
  v29 = v26 >= v27;
  LODWORD(v23) = (v23 >> 4);
  if (v28)
    v30 = (_DWORD *)(a1 + 16);
  else
    v30 = (_DWORD *)(a1 + 256);
  v31 = *(int64x2_t ***)(a1 + 8 * v29);
  memcpy(a2 + 16, a5, a6);
  if ((a10 & 1) != 0)
  {
    if ((a6 & 0xF) != 0)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 150, "");
      return 4294967292;
    }
  }
  else if ((_DWORD)v23)
  {
    v32 = 0;
    v33 = (const double *)(a2 + 4);
    v34 = (int8x16_t)vld1q_dup_f64(v33);
    v35 = (int8x16_t *)(a2 + 16);
    do
    {
      v36 = *(_DWORD *)(a1 + 504);
      *v35 = veorq_s8(*v35, v34);
      rijndaelEncrypt(v30, v36, (unsigned int *)v35, v35);
      v37 = *v35++;
      v34 = v37;
      ++v32;
      v23 = a2[3];
    }
    while (v32 < v23);
    LOBYTE(a8) = a2[2];
  }
  v38[0] = *(_QWORD *)(a2 + 4);
  LOBYTE(v38[0]) = a8;
  umac(v31, a2, 16 * v23 + 16, &a2[16 * v23 + 16], (int *)v38);
  return 0;
}

unsigned __int8 *CDXGetPreblobLength(unsigned __int8 *result)
{
  unint64_t v1;

  if (result)
  {
    v1 = *result;
    if (v1 < 7 && ((0x53u >> v1) & 1) != 0)
    {
      return (unsigned __int8 *)qword_215CDD798[(char)v1];
    }
    else if ((v1 & 0x80) != 0)
    {
      return (unsigned __int8 *)(v1 - 127);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CDXVerifyPreblob(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v4;

  result = 0;
  if (a1 && (unint64_t)(a2 - 1) <= 0x1F)
  {
    v4 = *a1;
    if (v4 < 2)
      return a2 == 1;
    if (v4 == 4)
      return a2 == 7;
    if (v4 == 6)
      return a2 == 19;
    result = 0;
    if ((char)v4 < 0 && (v4 - 127) == a2)
      return 1;
  }
  return result;
}

uint64_t AGPSendingSetElement::buffer(CAGP **this, unsigned __int8 *a2, unsigned int a3, unsigned int a4, unsigned int a5, char a6)
{
  pthread_mutex_t *v12;
  int can_buffer;
  unsigned int v14;
  uint64_t v15;
  CAGP **v16;
  int v17;
  int v18;
  CAGP *v19;
  char v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CAGP *v25;
  int v26;
  int v27;
  CAGP *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[6];
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  can_buffer = AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
  if (a2 && a3 - 1 <= 0x5DB && can_buffer && a4 <= a5)
  {
    v14 = *((unsigned __int8 *)this + 699);
    if (v14 <= 0x3F)
    {
      *((_BYTE *)this + 699) = v14 + 1;
      v15 = *((unsigned __int8 *)this + 697);
      *((_BYTE *)this + 697) = (v15 + 1) & 0x3F;
      v16 = &this[v15];
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFFFFE | AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1) ^ 1;
      *((_DWORD *)v16[15] + 2) |= 2u;
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFC0FF | ((v15 & 0x3F) << 8);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFFF03 | (4 * (*((_BYTE *)this + 698) & 0x3F));
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0x3FFFFFF | (*((unsigned __int8 *)this + 697) << 26);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFC0FF | ((v15 & 0x3F) << 8);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFF03FFF | ((a4 & 0x3F) << 14);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFC0FFFFF | ((a5 & 0x3F) << 20);
      v17 = *((_DWORD *)this + 27);
      *((_DWORD *)this + 27) = v17 + 1;
      *(_DWORD *)v16[15] = v17;
      v18 = CAGP::current_timestamp(this[1]);
      v19 = v16[15];
      *((_DWORD *)v19 + 1) = v18;
      *((_DWORD *)v19 + 3) = a3;
      *((_BYTE *)this + v15 + 632) = a6;
      memcpy((char *)v16[15] + 16, a2, a3);
      v20 = v15 - 32;
      if (v15 < 0x20)
        v20 = v15;
      v21 = 1 << v20;
      v22 = 100;
      if (v15 < 0x20)
        v22 = 96;
      *(_DWORD *)((char *)this + v22) |= v21;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v25 = this[1];
          v27 = *((_DWORD *)this + 24);
          v26 = *((_DWORD *)this + 25);
          v39 = 136316418;
          v40 = v23;
          v41 = 2080;
          v42 = "buffer";
          v43 = 1024;
          v44 = 734;
          v45 = 2048;
          *(_QWORD *)v46 = v25;
          *(_WORD *)&v46[8] = 1024;
          *(_DWORD *)v47 = v26;
          *(_WORD *)&v47[4] = 1024;
          v48 = v27;
          _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p buffer: send bitmap == %08X%08X", (uint8_t *)&v39, 0x32u);
        }
      }
      v28 = this[1];
      ++*((_DWORD *)v28 + 92);
      *((_DWORD *)v28 + 93) += a3;
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v31 = *((_DWORD *)this + 27);
        v39 = 136316418;
        v40 = v29;
        v41 = 2080;
        v42 = "buffer";
        v43 = 1024;
        v44 = 738;
        v45 = 1024;
        *(_DWORD *)v46 = v31;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = a4;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = a5;
        _os_log_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d buffer: MAXIMUM PACKET WINDOW COUNT USED (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
      }
    }
  }
  if ((AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1) & 1) == 0
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v38 = *((_DWORD *)this + 27);
      v39 = 136316418;
      v40 = v32;
      v41 = 2080;
      v42 = "buffer";
      v43 = 1024;
      v44 = 744;
      v45 = 1024;
      *(_DWORD *)v46 = v38;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = a4;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = a5;
      _os_log_error_impl(&dword_215C5C000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d buffer: CAN'T BUFFER (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v37 = *((_DWORD *)this + 27);
      v39 = 136316418;
      v40 = v34;
      v41 = 2080;
      v42 = "buffer";
      v43 = 1024;
      v44 = 746;
      v45 = 1024;
      *(_DWORD *)v46 = v37;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = a4;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = a5;
      _os_log_error_impl(&dword_215C5C000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d buffer: FAILED TO BUFFER A RELIABLE PACKET SERIALNUMBER (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
    }
  }
  v15 = 0xFFFFFFFFLL;
LABEL_25:
  pthread_mutex_unlock(v12);
  return v15;
}

uint64_t AGPAssociationSetElement::can_buffer(AGPAssociationSetElement *this, int a2)
{
  pthread_mutex_t *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  v5 = *((unsigned __int8 *)this + 698);
  v6 = *((unsigned __int8 *)this + 696);
  if (v5 == v6)
  {
    v7 = 0;
    if (!a2)
      goto LABEL_6;
  }
  else
  {
    v7 = ((((v6 - v5) & ~((v6 - v5) >> 31)) + v5 - v6 + 63) & 0xFFFFFFC0) + v6 - v5;
    if (!a2)
      goto LABEL_6;
  }
  if (64 - v7 - *((unsigned __int8 *)this + 699) >= a2)
  {
    v10 = 1;
    goto LABEL_11;
  }
LABEL_6:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v12 = *((unsigned __int8 *)this + 699);
      v13 = *((unsigned __int8 *)this + 696);
      v14 = *((unsigned __int8 *)this + 698);
      v15 = 136316930;
      v16 = v8;
      v17 = 2080;
      v18 = "can_buffer";
      v19 = 1024;
      v20 = 434;
      v21 = 1024;
      v22 = a2;
      v23 = 1024;
      v24 = v12;
      v25 = 1024;
      v26 = v13;
      v27 = 1024;
      v28 = v14;
      v29 = 1024;
      v30 = v7;
      _os_log_error_impl(&dword_215C5C000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d CAN'T BUFFER: num_packets == %d, used == %d, head == %d base == %d reserved == %d", (uint8_t *)&v15, 0x3Au);
    }
  }
  v10 = 0;
LABEL_11:
  pthread_mutex_unlock(v4);
  return v10;
}

uint64_t CAGP::current_timestamp(CAGP *this)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  timeval v6;

  v2 = *((unsigned int *)this + 52);
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  if (!gettimeofday(&v6, 0))
  {
    v3 = (v6.tv_usec / 1000 + 1000 * (SLODWORD(v6.tv_sec) % 604800)) % 0x240C8400u;
    v2 = *((unsigned int *)this + 52);
    if ((_DWORD)v2 == -1
      || (v2 > v3 ? (v4 = (v2 - v3) >= 0x12064201) : (v4 = 1), v4))
    {
      *((_DWORD *)this + 52) = v3;
      return v3;
    }
  }
  return v2;
}

uint64_t AGPSendingSetElement::search(AGPSendingSetElement *this, int a2)
{
  pthread_mutex_t *v4;
  int v5;
  uint64_t v6;

  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  v5 = *((unsigned __int8 *)this + 699);
  if (*((_BYTE *)this + 699))
  {
    v6 = *((unsigned __int8 *)this + 696);
    while (**((_DWORD **)this + v6 + 15) != a2)
    {
      v6 = ((int)v6 + 1) & 0x3FLL;
      if (!--v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0xFFFFFFFFLL;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t AGPSendingSetElement::remove(AGPSendingSetElement *this, unsigned int a2)
{
  pthread_mutex_t *v4;
  char *v5;
  _DWORD *v6;
  char *v7;
  _DWORD *v8;
  int v9;
  int v10;
  CAGP *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;
  int v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  int v41;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  if (a2 > 0x3F
    || (v5 = (char *)this + 8 * a2, v8 = (_DWORD *)*((_QWORD *)v5 + 15), v7 = v5 + 120, v6 = v8, (v9 = v8[3]) == 0))
  {
    v15 = 0;
    goto LABEL_38;
  }
  v10 = v6[379];
  v11 = (CAGP *)*((_QWORD *)this + 1);
  *((_DWORD *)v11 + 94) += v10;
  *((_DWORD *)v11 + 95) += v10 * v9;
  v6[3] = 0;
  if (v6[1] != -1)
  {
    v12 = CAGP::current_timestamp(v11) - *(_DWORD *)(*(_QWORD *)v7 + 4);
    if (v12 < 0)
    {
      if (v12 >= 0xEDF9BE01)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            AGPSendingSetElement::remove(v13, v14);
        }
        goto LABEL_13;
      }
      v12 += 604800000;
    }
    if (v12 >= 1)
    {
      pthread_mutex_lock(v4);
      UpdateRTO((unsigned int *)this + 175, v12);
      pthread_mutex_unlock(v4);
    }
  }
LABEL_13:
  *(_DWORD *)(*(_QWORD *)v7 + 1516) = 0;
  *((_BYTE *)this + a2 + 632) = 0x80;
  *(_DWORD *)(*(_QWORD *)v7 + 4) = -1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v19 = *((_QWORD *)this + 1);
      v21 = *((_DWORD *)this + 24);
      v20 = *((_DWORD *)this + 25);
      *(_DWORD *)buf = 136316418;
      v45 = v17;
      v46 = 2080;
      v47 = "remove";
      v48 = 1024;
      v49 = 817;
      v50 = 2048;
      v51 = v19;
      v52 = 1024;
      v53 = v20;
      v54 = 1024;
      v55 = v21;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: send bitmap == %08X%08X", buf, 0x32u);
    }
  }
  v22 = a2 - 32;
  if (a2 < 0x20)
    v22 = a2;
  v23 = 1 << v22;
  v24 = 100;
  if (a2 < 0x20)
    v24 = 96;
  *(_DWORD *)((char *)this + v24) &= ~v23;
  if (*((_BYTE *)this + 699))
  {
    v25 = *((_BYTE *)this + 696);
    *(_QWORD *)&v16 = 136316418;
LABEL_22:
    if (*((unsigned __int8 *)this + 696) == v25)
    {
      v26 = *((_QWORD *)this + v25 + 15);
      if (!*(_DWORD *)(v26 + 12))
      {
        v27 = ((*(_DWORD *)(v26 + 8) >> 20) & 0x3F) + 1;
        v28 = v25;
        v29 = v27;
        while (1)
        {
          v30 = *((_QWORD *)this + v28 + 15);
          if (*(_DWORD *)(v30 + 12) || (*(_BYTE *)(v30 + 8) & 2) == 0)
            break;
          v28 = (v28 + 1) & 0x3F;
          if (!(_BYTE)--v29)
          {
            v43 = v16;
            do
            {
              --v27;
              --*((_BYTE *)this + 699);
              v31 = *((_QWORD *)this + v25 + 15);
              *(_DWORD *)(v31 + 8) &= ~2u;
              v25 = (*((_BYTE *)this + 696) + 1) & 0x3F;
              *((_BYTE *)this + 696) = v25;
            }
            while ((_BYTE)v27);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v32 = VRTraceErrorLogLevelToCSTR();
              v33 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v34 = *((_QWORD *)this + 1);
                v35 = *((unsigned __int8 *)this + 696);
                v36 = *((_DWORD *)this + 26);
                *(_DWORD *)buf = v43;
                v45 = v32;
                v46 = 2080;
                v47 = "remove";
                v48 = 1024;
                v49 = 858;
                v50 = 2048;
                v51 = v34;
                v52 = 1024;
                v53 = v35;
                v54 = 1024;
                v55 = v36;
                _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: SET HEAD (%02d) FOR (%08X)...", buf, 0x32u);
              }
            }
            v16 = v43;
            if (*((_BYTE *)this + 699))
              goto LABEL_22;
            break;
          }
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v37 = VRTraceErrorLogLevelToCSTR();
    v38 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v39 = *((_QWORD *)this + 1);
      v41 = *((_DWORD *)this + 24);
      v40 = *((_DWORD *)this + 25);
      *(_DWORD *)buf = 136316418;
      v45 = v37;
      v46 = 2080;
      v47 = "remove";
      v48 = 1024;
      v49 = 861;
      v50 = 2048;
      v51 = v39;
      v52 = 1024;
      v53 = v40;
      v54 = 1024;
      v55 = v41;
      _os_log_impl(&dword_215C5C000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: done bitmap == %08X%08X", buf, 0x32u);
    }
  }
  v15 = 1;
LABEL_38:
  pthread_mutex_unlock(v4);
  return v15;
}

BOOL associationSetElementEqual(_DWORD *a1, _DWORD *a2)
{
  return a1[26] == a2[26];
}

uint64_t associationSetElementHashCode(unsigned int *a1)
{
  return a1[26];
}

const void *retainAssociationSetElement(const __CFAllocator *a1, const void *a2)
{
  return a2;
}

void releaseAssociationSetElement(const __CFAllocator *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  a2[2] = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 200) = a2;
}

uint64_t checkSendingSet(char *a1, char *a2)
{
  int v4;
  uint64_t v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  pthread_mutex_t *v20;
  int *v21;
  uint8_t v22[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint8_t buf[4];
  uint64_t v37;
  _DWORD v38[373];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v20 = (pthread_mutex_t *)(a2 + 64);
  pthread_mutex_lock((pthread_mutex_t *)a2 + 1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 32));
  v4 = 0;
  v21 = (int *)(a1 + 104);
  do
  {
    v5 = ((_BYTE)v4 + a1[698]) & 0x3F;
    v6 = *(unsigned __int8 **)&a1[8 * v5 + 120];
    if (v6 && *((_DWORD *)v6 + 3) && (v6[8] & 2) != 0 && *((_DWORD *)v6 + 1) != -1)
    {
      v7 = CAGP::current_timestamp((CAGP *)a2);
      v8 = v7 - *((_DWORD *)v6 + 1);
      if (v8 < 0)
      {
        if (v8 < 0xEDF9BE01)
        {
          v8 += 604800000;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v37 = v9;
            LOWORD(v38[0]) = 2080;
            *(_QWORD *)((char *)v38 + 2) = "checkSendingSet";
            HIWORD(v38[2]) = 1024;
            v38[3] = 926;
            _os_log_error_impl(&dword_215C5C000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T RESEND (BAD TIMESTAMP) !!!!!!!!!!!!", buf, 0x1Cu);
          }
        }
      }
      v11 = *((_DWORD *)a1 + 178);
      if (v11 && v8 > 3 * v11)
      {
        memset(v38, 170, 0x5D0uLL);
        buf[0] = 5;
        buf[1] = a1[v5 + 632];
        *(_WORD *)&buf[2] = 0;
        v12 = *((_DWORD *)a1 + 26);
        LODWORD(v37) = *((_DWORD *)a2 + 4);
        HIDWORD(v37) = v12;
        v38[0] = *(_DWORD *)v6;
        v38[1] = *((_DWORD *)v6 + 2) & 0x3FFFF03 | (4 * (a1[698] & 0x3F)) | (a1[697] << 26);
        *((_DWORD *)v6 + 1) = v7;
        ++*((_DWORD *)v6 + 379);
        memcpy(&v38[2], v6 + 16, *((unsigned int *)v6 + 3));
        *(_WORD *)&buf[2] = agp_control::generate_checksum((agp_control *)buf, v6 + 16, *((_DWORD *)v6 + 3));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_DWORD *)v6;
            v16 = *v21;
            *(_DWORD *)v22 = 136316674;
            v23 = v13;
            v24 = 2080;
            v25 = "checkSendingSet";
            v26 = 1024;
            v27 = 957;
            v28 = 2048;
            v29 = a2;
            v30 = 1024;
            v31 = v15;
            v32 = 1024;
            v33 = v16;
            v34 = 1024;
            v35 = v5;
            _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p check: RESEND serial number %08X to destination %08X INDEX %d", v22, 0x38u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v22 = 136316162;
            v23 = v17;
            v24 = 2080;
            v25 = "checkSendingSet";
            v26 = 1024;
            v27 = 959;
            v28 = 2048;
            v29 = a2;
            v30 = 1024;
            v31 = v5;
            _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p check: RESEND INDEX %d", v22, 0x2Cu);
          }
        }
        GCKSessionSendTo(*((_QWORD *)a2 + 3), (uint64_t)v21, 1, (uint64_t)buf, (*((_DWORD *)v6 + 3) + 20), 0, 64, 0, 0, 0, 0);
      }
    }
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 32));
  return pthread_mutex_unlock(v20);
}

uint64_t agp_control::generate_checksum(agp_control *this, unsigned __int8 *a2, int a3)
{
  __int16 v3;
  int v4;
  __int16 v5;
  unsigned int v6;
  __int16 v7;

  if (*(_BYTE *)this)
  {
    v3 = 0;
    v4 = 2 * *(unsigned __int8 *)this;
    do
    {
      v5 = *(_WORD *)this;
      this = (agp_control *)((char *)this + 2);
      v3 += v5;
      --v4;
    }
    while (v4);
    if (!a2)
      return (unsigned __int16)~v3;
  }
  else
  {
    v3 = 0;
    if (!a2)
      return (unsigned __int16)~v3;
  }
  if (a3 >= 2)
  {
    v6 = a3 >> 1;
    do
    {
      v7 = *(_WORD *)a2;
      a2 += 2;
      v3 += v7;
      --v6;
    }
    while (v6);
  }
  if ((a3 & 1) != 0)
    v3 += *a2;
  return (unsigned __int16)~v3;
}

uint64_t AGPTransportCallback(uint64_t a1, unsigned int *a2, int a3, unsigned __int8 *a4, int a5, unsigned __int8 *a6, unsigned int a7, char a8, unsigned __int8 a9, unsigned __int8 a10)
{
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unsigned __int8 *v20;
  CAGP **v21;
  int v22;
  CAGP **v23;
  CAGP *v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int *v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  _QWORD *i;
  unsigned int v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  _QWORD *j;
  uint64_t v53;
  const __CFData *v54;
  uint64_t v55;
  UInt8 *BytePtr;
  int Length;
  _QWORD *v58;
  const void *v59;
  agp_control *v61;
  void *value;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v16 = CheckInHandleDebug();
  if (v16)
  {
    v17 = v16;
    if (a3 < 1)
    {
      if (a3)
      {
        v38 = -a3;
        AGPDataQueue::disconnect((uint64_t **)(v16 + 216), a2, -a3);
        pthread_mutex_lock((pthread_mutex_t *)(v17 + 64));
        v39 = v38;
        v40 = a2;
        do
        {
          v41 = *v40;
          *(_DWORD *)(*(_QWORD *)(v17 + 48) + 104) = *v40;
          value = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v42 = VRTraceErrorLogLevelToCSTR();
            v43 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v65 = v42;
              v66 = 2080;
              v67 = "AGPTransportCallback";
              v68 = 1024;
              v69 = 1065;
              v70 = 1024;
              LODWORD(v71) = v41;
              _os_log_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnect: search for existing sending set element(%08X)...", buf, 0x22u);
            }
          }
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v17 + 40), *(const void **)(v17 + 48), (const void **)&value))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v44 = VRTraceErrorLogLevelToCSTR();
              v45 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v65 = v44;
                v66 = 2080;
                v67 = "AGPTransportCallback";
                v68 = 1024;
                v69 = 1069;
                v70 = 1024;
                LODWORD(v71) = v41;
                _os_log_impl(&dword_215C5C000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnect: remove sending set element(%08X)...", buf, 0x22u);
              }
            }
            CFSetRemoveValue(*(CFMutableSetRef *)(v17 + 40), value);
          }
          ++v40;
          --v39;
        }
        while (v39);
        for (i = *(_QWORD **)(v17 + 200); i; i = *(_QWORD **)(v17 + 200))
        {
          *(_QWORD *)(v17 + 200) = i[2];
          (*(void (**)(_QWORD *))(*i + 8))(i);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v17 + 64));
        pthread_mutex_lock((pthread_mutex_t *)(v17 + 128));
        do
        {
          v47 = *a2;
          *(_DWORD *)(*(_QWORD *)(v17 + 56) + 104) = *a2;
          value = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v48 = VRTraceErrorLogLevelToCSTR();
            v49 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v65 = v48;
              v66 = 2080;
              v67 = "AGPTransportCallback";
              v68 = 1024;
              v69 = 1094;
              v70 = 1024;
              LODWORD(v71) = v47;
              _os_log_impl(&dword_215C5C000, v49, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnect: search for existing receive set element(%08X)...", buf, 0x22u);
            }
          }
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v17 + 32), *(const void **)(v17 + 56), (const void **)&value))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v50 = VRTraceErrorLogLevelToCSTR();
              v51 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v65 = v50;
                v66 = 2080;
                v67 = "AGPTransportCallback";
                v68 = 1024;
                v69 = 1098;
                v70 = 1024;
                LODWORD(v71) = v47;
                _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnect: remove receive set element(%08X)...", buf, 0x22u);
              }
            }
            CFSetRemoveValue(*(CFMutableSetRef *)(v17 + 32), value);
          }
          ++a2;
          --v38;
        }
        while (v38);
        for (j = *(_QWORD **)(v17 + 200); j; j = *(_QWORD **)(v17 + 200))
        {
          *(_QWORD *)(v17 + 200) = j[2];
          (*(void (**)(_QWORD *))(*j + 8))(j);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v17 + 128));
      }
      else
      {
        pthread_mutex_lock((pthread_mutex_t *)(v16 + 224));
        while (1)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v17 + 224));
          v53 = *(_QWORD *)(v17 + 216);
          pthread_mutex_unlock((pthread_mutex_t *)(v17 + 224));
          if (!v53)
            break;
          v54 = *(const __CFData **)(v53 + 80);
          if (v54)
          {
            v55 = *(unsigned int *)(v53 + 72);
            BytePtr = (UInt8 *)CFDataGetBytePtr(v54);
            Length = CFDataGetLength(*(CFDataRef *)(v53 + 80));
            if (AGPSessionSendTo(a1, (_DWORD *)(v53 + 8), v55, BytePtr, Length, 0, 2, *(_DWORD *)(v53 + 88)))break;
          }
          pthread_mutex_lock((pthread_mutex_t *)(v17 + 224));
          v58 = *(_QWORD **)(v17 + 216);
          *(_QWORD *)(v17 + 216) = *v58;
          pthread_mutex_unlock((pthread_mutex_t *)(v17 + 224));
          v59 = (const void *)v58[10];
          if (v59)
          {
            CFRelease(v59);
            v58[10] = 0;
          }
          MEMORY[0x2199EF4DC](v58, 0x1060C40E2738600);
        }
        pthread_mutex_lock((pthread_mutex_t *)(v17 + 64));
        CFSetApplyFunction(*(CFSetRef *)(v17 + 40), (CFSetApplierFunction)checkSendingSet, (void *)v17);
        pthread_mutex_unlock((pthread_mutex_t *)(v17 + 64));
        pthread_mutex_unlock((pthread_mutex_t *)(v17 + 224));
      }
    }
    else if ((a8 & 0x40) == 0)
    {
      *a4 = 0;
      a4[1] = a8;
      *((_WORD *)a4 + 1) = 0;
      v61 = (agp_control *)a4;
      if ((a8 & 2) != 0)
      {
        v18 = (_DWORD)a4 + 4;
      }
      else
      {
        *((_DWORD *)a4 + 1) = *(_DWORD *)(v16 + 16);
        v18 = (_DWORD)a4 + 8;
        v19 = a3;
        v20 = a4 + 8;
        do
        {
          v21 = (CAGP **)CAGP::sendingSetElement((CAGP *)v17, *a2);
          v22 = AGPSendingSetElement::buffer(v21, a6, a7, a9, a10, a8);
          if (v22 < 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v35 = VRTraceErrorLogLevelToCSTR();
              v36 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v65 = v35;
                v66 = 2080;
                v67 = "AGPTransportCallback";
                v68 = 1024;
                v69 = 1025;
                _os_log_error_impl(&dword_215C5C000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d tran: FAILED TO BUFFER A RELIABLE PACKET ...", buf, 0x1Cu);
              }
            }
          }
          else
          {
            *(_DWORD *)v20 = *a2;
            v23 = &v21[v22];
            v24 = v23[15];
            v23 += 15;
            *((_DWORD *)v20 + 1) = *(_DWORD *)v24;
            v25 = *((_DWORD *)v20 + 2) & 0xFFFFFFFC | AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)v21, 1) ^ 1 | 2;
            *((_DWORD *)v20 + 2) = v25;
            v26 = v25 & 0xFFFFFF03 | (4 * ((*((_DWORD *)*v23 + 2) >> 2) & 0x3F));
            *((_DWORD *)v20 + 2) = v26;
            v27 = v26 & 0xFFFFC0FF | (((*((_DWORD *)*v23 + 2) >> 8) & 0x3F) << 8);
            *((_DWORD *)v20 + 2) = v27;
            v28 = v27 & 0xFFF03FFF | (((*((_DWORD *)*v23 + 2) >> 14) & 0x3F) << 14);
            *((_DWORD *)v20 + 2) = v28;
            v29 = v28 & 0xFC0FFFFF | (((*((_DWORD *)*v23 + 2) >> 20) & 0x3F) << 20);
            *((_DWORD *)v20 + 2) = v29;
            *((_DWORD *)v20 + 2) = *((_DWORD *)*v23 + 2) & 0xFC000000 | v29 & 0x3FFFFFF;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v30 = VRTraceErrorLogLevelToCSTR();
              v31 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v33 = *((_DWORD *)v20 + 1);
                v32 = *((_DWORD *)v20 + 2);
                v34 = *(_DWORD *)v20;
                *(_DWORD *)buf = 136316930;
                v65 = v30;
                v66 = 2080;
                v67 = "AGPTransportCallback";
                v68 = 1024;
                v69 = 1022;
                v70 = 2048;
                v71 = v17;
                v72 = 1024;
                v73 = v33;
                v74 = 1024;
                v75 = (v32 >> 14) & 0x3F;
                v76 = 1024;
                v77 = (v32 >> 20) & 0x3F;
                v78 = 1024;
                v79 = v34;
                _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p tran: BUFFERED A NEW RELIABLE PACKET SERIALNUMBER (%08X:%02d:%02d) to (%08X)...", buf, 0x3Eu);
              }
            }
            v18 += 12;
            v20 += 12;
          }
          ++a2;
          --v19;
        }
        while (v19);
      }
      *(_BYTE *)v61 = (v18 - (_DWORD)v61 + 3) >> 2;
      *((_WORD *)v61 + 1) = agp_control::generate_checksum(v61, a6, a7);
      v37 = 4 * *(unsigned __int8 *)v61;
      goto LABEL_54;
    }
    v37 = 0;
LABEL_54:
    CheckOutHandleDebug();
    return v37;
  }
  return 0xFFFFFFFFLL;
}

void sub_215C6749C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void *CAGP::sendingSetElement(CAGP *this, int a2)
{
  pthread_mutex_t *v4;
  const __CFSet *v5;
  _DWORD *v6;
  AGPSendingSetElement *v7;
  void *value;

  v4 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  v5 = (const __CFSet *)*((_QWORD *)this + 5);
  v6 = (_DWORD *)*((_QWORD *)this + 6);
  v6[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(v5, v6, (const void **)&value))
  {
    v7 = (AGPSendingSetElement *)operator new();
    AGPSendingSetElement::AGPSendingSetElement(v7, this);
    value = v7;
    *((_DWORD *)v7 + 26) = a2;
    CFSetAddValue(*((CFMutableSetRef *)this + 5), v7);
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_215C67560(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::disconnect(uint64_t **this, unsigned int *a2, int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  if (a3 >= 1)
  {
    v7 = 0;
    v8 = *this;
    do
    {
      if (v8)
      {
        v9 = a2[v7];
        v10 = v8;
        do
        {
          v11 = *((unsigned int *)v10 + 18);
          if ((int)v11 >= 1)
          {
            v12 = 0;
            while (*((_DWORD *)v10 + v12 + 2) != v9)
            {
              if (v11 == ++v12)
                goto LABEL_13;
            }
            LODWORD(v11) = v11 - 1;
            if ((int)v11 > (int)v12)
            {
              do
              {
                *((_DWORD *)v10 + v12 + 2) = *((_DWORD *)v10 + v12 + 3);
                v11 = *((int *)v10 + 18) - 1;
                ++v12;
              }
              while (v12 < v11);
            }
            *((_DWORD *)v10 + 18) = v11;
          }
LABEL_13:
          v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      ++v7;
    }
    while (v7 != a3);
  }
  return pthread_mutex_unlock(v6);
}

uint64_t AGPSessionSendTo(uint64_t a1, _DWORD *a2, uint64_t a3, UInt8 *a4, int a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  UInt8 *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  int v17;
  char v18;
  UInt8 *v19;
  unint64_t v20;
  int v21;
  unsigned __int8 v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  AGPAssociationSetElement *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  uint64_t v39;
  int v40;
  UInt8 *bytes;
  char v42;
  int v45;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  _OWORD v58[16];
  _OWORD v59[32];
  uint64_t v60;

  v8 = 0;
  v60 = *MEMORY[0x24BDAC8D0];
  if ((int)a3 < 1)
    return v8;
  v9 = a4;
  if (!a4)
    return v8;
  v10 = a5;
  if (a5 < 1)
    return v8;
  v11 = CheckInHandleDebug();
  if (!v11)
  {
    v8 = 2149187586;
    goto LABEL_58;
  }
  v12 = v11;
  if (a7 == 2)
  {
    v13 = 0;
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)(v11 + 224));
    v14 = *(_QWORD *)(v12 + 216);
    pthread_mutex_unlock((pthread_mutex_t *)(v12 + 224));
    v13 = v14 != 0;
  }
  v48 = 0;
  v40 = 1218 - 16 * a3;
  v39 = v12 + 216;
  v50 = v12;
  while (1)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v59[30] = v15;
    v59[31] = v15;
    v59[28] = v15;
    v59[29] = v15;
    v59[26] = v15;
    v59[27] = v15;
    v59[24] = v15;
    v59[25] = v15;
    v59[22] = v15;
    v59[23] = v15;
    v59[20] = v15;
    v59[21] = v15;
    v59[18] = v15;
    v59[19] = v15;
    v59[16] = v15;
    v59[17] = v15;
    v59[14] = v15;
    v59[15] = v15;
    v59[12] = v15;
    v59[13] = v15;
    v59[10] = v15;
    v59[11] = v15;
    v59[8] = v15;
    v59[9] = v15;
    v59[6] = v15;
    v59[7] = v15;
    v59[4] = v15;
    v59[5] = v15;
    v59[2] = v15;
    v59[3] = v15;
    v59[0] = v15;
    v59[1] = v15;
    v58[14] = v15;
    v58[15] = v15;
    v58[12] = v15;
    v58[13] = v15;
    v58[10] = v15;
    v58[11] = v15;
    v58[8] = v15;
    v58[9] = v15;
    v58[6] = v15;
    v58[7] = v15;
    v58[4] = v15;
    v58[5] = v15;
    v58[2] = v15;
    v58[3] = v15;
    v58[0] = v15;
    v58[1] = v15;
    if (v40 < 0)
      break;
    v45 = v13;
    v16 = 0;
    v17 = 0;
    v18 = 1;
    v19 = v9;
    do
    {
      v20 = v16;
      *((_QWORD *)v59 + v16) = v19;
      if (v10 >= v40)
        v21 = 1218 - 16 * a3;
      else
        v21 = v10;
      *((_DWORD *)v58 + v16) = v21;
      v22 = v18;
      v17 += v21;
      v10 -= v21;
      v19 += v21;
      ++v16;
      if (v20 > 6)
        break;
      ++v18;
    }
    while (v10 > 0);
    v23 = a7;
    if ((_BYTE)v20)
      v24 = a7 == 1;
    else
      v24 = 0;
    if (v24)
      v23 = 0;
    a7 = v23;
    bytes = v9;
    if (v23)
    {
      if (v23 == 1)
      {
        v42 = 1;
        v25 = 2;
      }
      else
      {
        if (v23 != 2)
          break;
        v25 = v10 > 0;
        v42 = 1;
      }
    }
    else
    {
      v25 = v10 > 0;
      if ((v13 & 1) != 0)
      {
        v26 = 0;
        v27 = 0;
        LODWORD(v28) = v48;
        goto LABEL_43;
      }
      v42 = 0;
    }
    v29 = 0;
LABEL_31:
    v30 = 0;
    v49 = v29;
    v31 = v16 - v29;
    while (1)
    {
      v32 = (AGPAssociationSetElement *)CAGP::sendingSetElement((CAGP *)v50, a2[v30]);
      if (v25 < 2 && !AGPAssociationSetElement::can_buffer(v32, v31))
        break;
      if (a3 == ++v30)
      {
        ++*(_DWORD *)(v50 + 360);
        v33 = *((unsigned int *)v58 + v49);
        *(_DWORD *)(v50 + 364) += v33;
        GCKSessionSendTo(*(_QWORD *)(v50 + 24), (uint64_t)a2, a3, *((_QWORD *)v59 + v49), v33, a6, v25, v49, v20, 0, a8);
        v28 = v48;
        v26 = v49;
        if (!v48)
        {
          v48 = 0;
          v29 = v49 + 1;
          if (v49 + 1 != v22)
            goto LABEL_31;
          v26 = v22;
          v28 = 0;
        }
        goto LABEL_41;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v34 = VRTraceErrorLogLevelToCSTR(),
          v35 = *MEMORY[0x24BDFDC28],
          !os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
    {
      v28 = 2149318657;
      v26 = v49;
LABEL_41:
      v27 = v28;
      goto LABEL_42;
    }
    *(_DWORD *)buf = 136315650;
    v53 = v34;
    v54 = 2080;
    v55 = "AGPSessionSendTo";
    v56 = 1024;
    v57 = 1324;
    _os_log_error_impl(&dword_215C5C000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d AGPSessionSendTo:: NOT ENOUGH TRANSMISSON WINDOW BUFFERS AVAILABLE!", buf, 0x1Cu);
    v27 = -2145648639;
    v28 = 2149318657;
    v26 = v49;
LABEL_42:
    if ((v42 & 1) != 0)
      goto LABEL_57;
LABEL_43:
    v48 = v28;
    if ((v45 & 1) != 0)
      v8 = v27;
    else
      v8 = 0;
    v13 = v45 | (v27 != 0) | (v10 > 0);
    if (v26 <= v20 && v45 & 1 | (v27 != 0) | (v10 > 0))
    {
      v36 = operator new();
      *(_QWORD *)v36 = 0;
      *(_QWORD *)(v36 + 80) = 0;
      memcpy((void *)(v36 + 8), a2, 4 * a3);
      *(_DWORD *)(v36 + 72) = a3;
      *(_DWORD *)(v36 + 88) = a8;
      if (v10)
        v37 = v17 + 1;
      else
        v37 = v17;
      *(_QWORD *)(v36 + 80) = CFDataCreate(0, bytes, v37);
      AGPDataQueue::add_tail(v39, (_QWORD *)v36);
      v13 = 1;
    }
    if (!(_DWORD)v8)
    {
      v9 = v19;
      if (v10 > 0)
        continue;
    }
    goto LABEL_58;
  }
  v28 = 2149318657;
LABEL_57:
  v8 = v28;
LABEL_58:
  CheckOutHandleDebug();
  return v8;
}

uint64_t AGPSessionCreate(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t Handle;
  uint64_t v13;

  v10 = 2149187586;
  if (CheckInHandleDebug())
  {
    CheckOutHandleDebug();
    v11 = operator new();
    CAGP::CAGP((CAGP *)v11);
    Handle = CreateHandle();
    if (Handle == 0xFFFFFFFFLL)
    {
      CAGP::~CAGP((pthread_mutex_t *)v11);
      MEMORY[0x2199EF4DC](v11, 0x10A0C40A2D6C30DLL);
      return 2149187589;
    }
    else
    {
      v13 = Handle;
      v10 = GCKSessionRegisterReliableTransportCallback(a1, (uint64_t)AGPTransportCallback, Handle);
      if ((_DWORD)v10)
      {
        AGPSessionRelease();
      }
      else
      {
        *(_DWORD *)(v11 + 16) = a2;
        *(_QWORD *)(v11 + 24) = a1;
        *(_QWORD *)v11 = a3;
        *(_QWORD *)(v11 + 8) = a4;
        *a5 = v13;
      }
    }
  }
  return v10;
}

void sub_215C67C68(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPSessionRelease()
{
  uint64_t v0;
  NSObject *v1;
  pthread_mutex_t *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v0;
      v11 = 2080;
      v12 = "AGPSessionRelease";
      v13 = 1024;
      v14 = 1193;
      _os_log_impl(&dword_215C5C000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d agpsessionrelease: entering...", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v2 = (pthread_mutex_t *)CheckInHandleDebug();
  if (!v2)
    return 2149187586;
  CheckOutHandleDebug();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v3;
      v11 = 2080;
      v12 = "AGPSessionRelease";
      v13 = 1024;
      v14 = 1201;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d agpsessionrelease: delete...", (uint8_t *)&v9, 0x1Cu);
    }
  }
  CAGP::~CAGP(v2);
  MEMORY[0x2199EF4DC](v2, 0x10A0C40A2D6C30DLL);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v9 = 136315650;
    v10 = v5;
    v11 = 2080;
    v12 = "AGPSessionRelease";
    v13 = 1024;
    v14 = 1205;
    _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d agpsessionrelease: done...", (uint8_t *)&v9, 0x1Cu);
  }
  return 0;
}

void sub_215C67F10(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::add_tail(uint64_t a1, _QWORD *a2)
{
  _QWORD **v3;
  pthread_mutex_t *v4;
  _QWORD *i;

  v3 = (_QWORD **)a1;
  v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  for (i = *v3; i; i = (_QWORD *)*i)
  {
    v3 = (_QWORD **)i;
    if (i == a2)
      a2 = 0;
  }
  *v3 = a2;
  return pthread_mutex_unlock(v4);
}

uint64_t AGPSessionSendAudioTo()
{
  uint64_t v0;
  uint64_t v1;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  v1 = GCKSessionSendAudioTo(*(_QWORD *)(v0 + 24));
  CheckOutHandleDebug();
  return v1;
}

uint64_t AGPSessionRecvFrom(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  pthread_mutex_t *v7;
  AGPSendingSetElement *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v13;
  int checksum;
  unsigned int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  AGPSendingSetElement *v25;
  int v26;
  char *v27;
  pthread_mutex_t *v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  __int128 v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  const char *v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  unsigned __int8 *v52;
  unsigned __int8 *v53;
  uint64_t v54;
  NSObject *v55;
  int v56;
  int v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  char v66;
  unsigned __int8 *v67;
  unsigned __int8 *v68;
  uint64_t v69;
  NSObject *v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  uint32_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  int v85;
  AGPSendingSetElement *v86;
  int v87;
  unsigned __int8 *v88;
  int v89;
  uint64_t v90;
  NSObject *v91;
  int v92;
  int v93;
  AGPSendingSetElement *v94;
  unint64_t v95;
  _DWORD *v96;
  unsigned __int8 *v97;
  uint64_t v98;
  NSObject *v99;
  int v100;
  uint64_t v101;
  NSObject *v102;
  int v103;
  unsigned __int8 *v104;
  uint64_t v105;
  NSObject *v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  int v111;
  unsigned __int8 *v112;
  unsigned int v113;
  unsigned int v114;
  __int128 v115;
  int ErrorLogLevelForModule;
  uint64_t v117;
  NSObject *v118;
  int v119;
  int v120;
  int v121;
  char v122;
  uint64_t v123;
  int *v124;
  unsigned int v125;
  uint64_t v126;
  NSObject *v127;
  uint64_t v128;
  NSObject *v129;
  int v130;
  int v131;
  int v132;
  int v133;
  AGPSendingSetElement *v134;
  int v135;
  uint64_t v136;
  NSObject *v137;
  _BOOL4 v138;
  int v139;
  AGPDataQueue *v140;
  unsigned int v141;
  uint64_t v142;
  char *v143;
  size_t v144;
  int v145;
  BOOL v146;
  int v147;
  char *v148;
  int v149;
  _DWORD *v150;
  uint64_t v151;
  NSObject *v152;
  int v153;
  unsigned int v154;
  uint64_t v155;
  NSObject *v156;
  int v157;
  unsigned int v158;
  uint64_t v159;
  __CFData *Mutable;
  AGPDataQueue *i;
  AGPDataQueue *v162;
  const __CFData *v163;
  const UInt8 *BytePtr;
  CFIndex Length;
  AGPDataQueue *v166;
  AGPDataQueue *v167;
  const void *v168;
  _DWORD *v169;
  uint64_t v170;
  uint64_t v171;
  NSObject *v172;
  int v173;
  NSObject *v174;
  const char *v175;
  int v176;
  int v177;
  int v178;
  uint64_t v179;
  NSObject *v180;
  int v181;
  uint64_t v182;
  NSObject *v183;
  int v184;
  uint64_t v185;
  NSObject *v186;
  int v187;
  uint64_t v188;
  NSObject *v189;
  int v190;
  uint64_t v191;
  NSObject *v192;
  int v193;
  uint64_t v194;
  NSObject *v195;
  int v196;
  int v197;
  int v198;
  int v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  NSObject *v203;
  int v204;
  int v205;
  unsigned __int8 *v206;
  unsigned int v207;
  unsigned int v208;
  _BOOL4 v209;
  int v210;
  uint64_t v211;
  NSObject *v212;
  int v213;
  uint64_t v214;
  NSObject *v215;
  int v216;
  uint64_t v217;
  char v218;
  int v219;
  uint64_t v220;
  int v221;
  int v222;
  int v223;
  uint64_t v224;
  NSObject *v225;
  uint64_t v226;
  __int16 v227;
  int v228;
  uint64_t v229;
  int v230;
  uint64_t v232;
  NSObject *v233;
  int v234;
  __int128 v235;
  __int128 v236;
  unsigned __int8 *v237;
  pthread_mutex_t *v238;
  pthread_mutex_t *v239;
  unsigned __int8 *v240;
  os_log_t v241;
  __int128 v242;
  _BYTE *v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  unsigned int v248;
  pthread_mutex_t *v249;
  __int128 v250;
  AGPSendingSetElement *v251;
  unsigned int v252;
  _BYTE v253[28];
  __int16 v254;
  uint64_t v255;
  __int16 v256;
  int v257;
  int v258;
  uint64_t v259;
  _BYTE v260[10];
  __int16 v261;
  int v262;
  __int16 v263;
  _BYTE v264[10];
  _BYTE v265[6];
  _BYTE v266[6];
  int v267;
  __int16 v268;
  int v269;
  uint64_t v270;

  v3 = 0;
  v270 = *MEMORY[0x24BDAC8D0];
  v252 = a2;
  if (!a1 || !a3)
    return v3;
  if (!*(_QWORD *)(a3 + 8) || (*(_DWORD *)(a3 + 16) - 1) > 0x5DB)
    return 0;
  v7 = (pthread_mutex_t *)(a1 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 128));
  v8 = (AGPSendingSetElement *)CAGP::receiveSetElement((CAGP *)a1, a2);
  v9 = *(unsigned __int8 **)(a3 + 8);
  v10 = 4 * *v9;
  v11 = *(_DWORD *)(a3 + 16);
  if (v11 < (int)v10 || v8 == 0)
    goto LABEL_10;
  v251 = v8;
  v13 = *((unsigned __int16 *)v9 + 1);
  *((_WORD *)v9 + 1) = 0;
  checksum = agp_control::generate_checksum((agp_control *)v9, &v9[v10], v11 - (int)v10);
  if (v13 != checksum)
  {
    v16 = checksum;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v258 = 136316162;
        v259 = v17;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1461;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v13;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: packet checksum == (%04x)...", (uint8_t *)&v258, 0x2Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_10;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x24BDFDC28];
    v3 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v258 = 136316162;
    v259 = v19;
    *(_WORD *)v260 = 2080;
    *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
    v261 = 1024;
    v262 = 1462;
    v263 = 2048;
    *(_QWORD *)v264 = a1;
    *(_WORD *)&v264[8] = 1024;
    *(_DWORD *)v265 = v16;
    v21 = " [%s] %s:%d %p recv: calculated checksum == (%04x)...";
LABEL_23:
    v22 = v20;
    v23 = 44;
LABEL_24:
    _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v258, v23);
    goto LABEL_10;
  }
  v15 = v9[1];
  if (v15 >= 2 && v15 != 11)
  {
    if (v15 == 2)
    {
      *(_QWORD *)(a3 + 8) += v10;
      *(_DWORD *)(a3 + 16) -= v10;
      v3 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v3 = 0;
LABEL_11:
    pthread_mutex_unlock(v7);
    return v3;
  }
  v24 = 0;
  v25 = v251;
  do
  {
    if (v24 + 20 > v10)
      goto LABEL_10;
    v26 = *(_DWORD *)&v9[v24 + 8];
    v24 += 12;
  }
  while (v26 != *(_DWORD *)(a1 + 16));
  *(_QWORD *)(a3 + 8) += v10;
  *(_DWORD *)(a3 + 16) -= v10;
  if (v15 < 2)
  {
    v39 = *(_DWORD *)&v9[v24];
    v40 = *((_DWORD *)v25 + 27);
    if (v39 < v40 && *((_DWORD *)v25 + 28) != -1)
    {
      v41 = CAGP::current_timestamp((CAGP *)a1) - *((_DWORD *)v25 + 28);
      if (v41 <= -302400000)
        v42 = v41 + 604800000;
      else
        v42 = v41;
      if (v42 > 1000)
      {
        v239 = v7;
        v240 = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v258 = 136316418;
            v259 = v43;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1500;
            v263 = 2048;
            *(_QWORD *)v264 = a1;
            *(_WORD *)&v264[8] = 1024;
            *(_DWORD *)v265 = v42;
            *(_WORD *)&v265[4] = 1024;
            *(_DWORD *)v266 = a2;
            v45 = " [%s] %s:%d %p recv: FORCE ACK ONLY for timeout %08X from remoteID %08X";
            v46 = v44;
            goto LABEL_43;
          }
        }
        goto LABEL_224;
      }
      v39 = *(_DWORD *)&v9[v24];
      v40 = *((_DWORD *)v25 + 27);
    }
    if (v39 < v40)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_10;
      v90 = VRTraceErrorLogLevelToCSTR();
      v91 = *MEMORY[0x24BDFDC28];
      v3 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v92 = *(_DWORD *)&v9[v24];
      v93 = *((_DWORD *)v25 + 27);
      v258 = 136316162;
      v259 = v90;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1784;
      v263 = 1024;
      *(_DWORD *)v264 = v92;
      *(_WORD *)&v264[4] = 1024;
      *(_DWORD *)&v264[6] = v93;
      v21 = " [%s] %s:%d recv: SERIAL NUMBER MISMATCH (%08X:%08X)...";
      v22 = v91;
      v23 = 40;
      goto LABEL_24;
    }
    v94 = v25;
    v95 = ((unint64_t)*(unsigned int *)&v9[v24 + 4] >> 8) & 0x3F;
    v96 = (_DWORD *)*((_QWORD *)v94 + v95 + 15);
    if (!v96)
    {
LABEL_110:
      v104 = v9;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v105 = VRTraceErrorLogLevelToCSTR();
        v106 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v107 = *(_DWORD *)&v104[v24];
          v258 = 136316674;
          v259 = v105;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1534;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v95;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v107;
          *(_WORD *)&v266[4] = 1024;
          v267 = a2;
          _os_log_impl(&dword_215C5C000, v106, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: DISCARD NO BUFFER AVAILABLE %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v258, 0x38u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_10;
      v108 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      v3 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v258 = 136316162;
      v259 = v108;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1536;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = v95;
      v21 = " [%s] %s:%d %p recv: ERROR NO BUFFER %d";
      goto LABEL_23;
    }
    if (v96[3])
    {
      if (v39 == *v96)
      {
        v97 = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v98 = VRTraceErrorLogLevelToCSTR();
          v99 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v100 = *(_DWORD *)&v97[v24];
            v258 = 136316674;
            v259 = v98;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1530;
            v263 = 2048;
            *(_QWORD *)v264 = a1;
            *(_WORD *)&v264[8] = 1024;
            *(_DWORD *)v265 = v95;
            *(_WORD *)&v265[4] = 1024;
            *(_DWORD *)v266 = v100;
            *(_WORD *)&v266[4] = 1024;
            v267 = a2;
            _os_log_impl(&dword_215C5C000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: DISCARD DUPLICATE %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v258, 0x38u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_10;
        v101 = VRTraceErrorLogLevelToCSTR();
        v102 = *MEMORY[0x24BDFDC28];
        v3 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        v103 = *(_DWORD *)&v97[v24];
        v258 = 136316418;
        v259 = v101;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1532;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v95;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v103;
        v21 = " [%s] %s:%d %p recv: ERROR DUPLICATE %d for packet serial_number %08X";
        v22 = v102;
        v23 = 50;
        goto LABEL_24;
      }
      goto LABEL_110;
    }
    v237 = &v9[v24];
    v239 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v109 = VRTraceErrorLogLevelToCSTR();
      v110 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v111 = *(_DWORD *)&v9[v24];
        v258 = 136316674;
        v259 = v109;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1521;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v95;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v111;
        *(_WORD *)&v266[4] = 1024;
        v267 = a2;
        _os_log_impl(&dword_215C5C000, v110, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: INCOMING BUFFER %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v258, 0x38u);
      }
    }
    *((_BYTE *)v251 + v95 + 632) = v9[1];
    memcpy(v96 + 4, *(const void **)(a3 + 8), *(int *)(a3 + 16));
    *v96 = *(_DWORD *)&v9[v24];
    v112 = v237;
    v96[2] = *((_DWORD *)v237 + 1);
    v96[3] = *(_DWORD *)(a3 + 16);
    v240 = v9;
    v113 = *((_DWORD *)v112 + 1);
    v114 = v113 >> 14;
    LODWORD(v112) = (v113 >> 14) & 0x3F;
    LODWORD(v247) = *(_DWORD *)&v9[v24] - (_DWORD)v112;
    v248 = v113;
    v249 = (pthread_mutex_t *)(((v113 >> 8) & 0x3F) - v112);
    *(_QWORD *)&v246 = a1 + 288;
    v238 = (pthread_mutex_t *)(a1 + 296);
    *(_QWORD *)&v115 = 136316930;
    v236 = v115;
    *(_QWORD *)&v115 = 136316418;
    v245 = v115;
    *(_QWORD *)&v115 = 136316674;
    v244 = v115;
    *(_QWORD *)&v115 = 136316162;
    v235 = v115;
    while (1)
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      LODWORD(v242) = (v248 >> 20) & 0x3F;
      LODWORD(v250) = v242 + 1;
      if (ErrorLogLevelForModule >= 7)
      {
        v117 = VRTraceErrorLogLevelToCSTR();
        v118 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v119 = *(_DWORD *)&v240[v24];
          v120 = (*((_DWORD *)v237 + 1) >> 8) & 0x3F;
          v258 = v236;
          v259 = v117;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1555;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = (v114 & 0x3F) + 1;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v250;
          *(_WORD *)&v266[4] = 1024;
          v267 = v119;
          v268 = 1024;
          v269 = v120;
          _os_log_impl(&dword_215C5C000, v118, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: got chunk segment %d of %d segments (%08X) @index %d", (uint8_t *)&v258, 0x3Eu);
        }
      }
      v121 = 0;
      v122 = 1;
      LODWORD(v243) = 1;
      do
      {
        v123 = ((_BYTE)v249 + (_BYTE)v121) & 0x3F;
        v124 = (int *)*((_QWORD *)v251 + v123 + 15);
        if (v124 && v124[3] && (v125 = v124[2], ((v125 ^ v248) & 0x3F00000) == 0) && (_DWORD)v247 + v121 == *v124)
        {
          if (v121 != ((v125 >> 14) & 0x3F) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v126 = VRTraceErrorLogLevelToCSTR();
            v127 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v131 = *v124;
              v132 = (v124[2] >> 14) & 0x3F;
              v258 = v244;
              v259 = v126;
              *(_WORD *)v260 = 2080;
              *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
              v261 = 1024;
              v262 = 1569;
              v263 = 1024;
              *(_DWORD *)v264 = v123;
              *(_WORD *)&v264[4] = 1024;
              *(_DWORD *)&v264[6] = v131;
              *(_WORD *)v265 = 1024;
              *(_DWORD *)&v265[2] = v132;
              *(_WORD *)v266 = 1024;
              *(_DWORD *)&v266[2] = v121;
              _os_log_error_impl(&dword_215C5C000, v127, OS_LOG_TYPE_ERROR, " [%s] %s:%d FAIL: message fragment @index %d ser %08X seg_idx %d should be %d", (uint8_t *)&v258, 0x34u);
            }
          }
          LODWORD(v243) = (*((_BYTE *)v251 + v123 + 632) != 1) & v243;
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v128 = VRTraceErrorLogLevelToCSTR();
            v129 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              if (v124)
                v130 = *v124;
              else
                v130 = 0;
              v258 = v245;
              v259 = v128;
              *(_WORD *)v260 = 2080;
              *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
              v261 = 1024;
              v262 = 1565;
              v263 = 1024;
              *(_DWORD *)v264 = v123;
              *(_WORD *)&v264[4] = 1024;
              *(_DWORD *)&v264[6] = v130;
              *(_WORD *)v265 = 1024;
              *(_DWORD *)&v265[2] = v247 + v121;
              _os_log_error_impl(&dword_215C5C000, v129, OS_LOG_TYPE_ERROR, " [%s] %s:%d fail: message fragment @index %d ser %08X should be %08X", (uint8_t *)&v258, 0x2Eu);
            }
          }
          v122 = 0;
        }
        ++v121;
      }
      while ((_DWORD)v250 != v121);
      if ((v122 & 1) == 0)
        goto LABEL_224;
      v133 = v249;
      v134 = v251;
      if (v249 != *((unsigned __int8 *)v251 + 696))
      {
        v135 = VRTraceGetErrorLogLevelForModule();
        v134 = v251;
        if (v135 >= 7)
        {
          v136 = VRTraceErrorLogLevelToCSTR();
          v137 = *MEMORY[0x24BDFDC28];
          v138 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
          v134 = v251;
          if (v138)
          {
            v139 = *((unsigned __int8 *)v251 + 696);
            v258 = v235;
            v259 = v136;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1580;
            v263 = 1024;
            *(_DWORD *)v264 = v133;
            *(_WORD *)&v264[4] = 1024;
            *(_DWORD *)&v264[6] = v139;
            _os_log_impl(&dword_215C5C000, v137, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d START %d != HEAD %d", (uint8_t *)&v258, 0x28u);
          }
        }
      }
      if ((_DWORD)v247 != *((_DWORD *)v134 + 27))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v232 = VRTraceErrorLogLevelToCSTR();
          v233 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v234 = *((_DWORD *)v251 + 27);
            v258 = v245;
            v259 = v232;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1684;
            v263 = 2048;
            *(_QWORD *)v264 = a1;
            *(_WORD *)&v264[8] = 1024;
            *(_DWORD *)v265 = v247;
            *(_WORD *)&v265[4] = 1024;
            *(_DWORD *)v266 = v234;
            v45 = " [%s] %s:%d %p recv: MESSAGE SERIAL_NUMBASE %08X ARRIVED OUT-OF-SEQUENCE %08X";
            v46 = v233;
LABEL_43:
            _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)&v258, 0x32u);
          }
        }
LABEL_224:
        *(_QWORD *)&v253[20] = 0;
        v205 = *(_DWORD *)(a1 + 16);
        *(_DWORD *)v253 = 2823;
        *(_DWORD *)&v253[4] = v205;
        *(_DWORD *)&v253[8] = v252;
        v206 = &v240[v24];
        *(_DWORD *)&v253[12] = *(_DWORD *)&v240[v24];
        *(_DWORD *)&v253[16] = *(_DWORD *)&v240[v24 + 4] & 0xFFFFFF03 | (4 * (*((_BYTE *)v251 + 696) & 0x3F));
        v207 = *(_DWORD *)&v240[v24 + 4];
        v208 = v207 >> 2;
        if ((v207 & 1) != 0)
        {
          v209 = v208 == v207 >> 26;
          v210 = VRTraceGetErrorLogLevelForModule();
          if (v209)
          {
            if (v210 >= 7)
            {
              v211 = VRTraceErrorLogLevelToCSTR();
              v212 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v258 = 136316162;
                v259 = v211;
                *(_WORD *)v260 = 2080;
                *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
                v261 = 1024;
                v262 = 1713;
                v263 = 2048;
                *(_QWORD *)v264 = a1;
                *(_WORD *)&v264[8] = 1024;
                *(_DWORD *)v265 = v208;
                _os_log_impl(&dword_215C5C000, v212, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: FORCE FULL BUFFER INDEX %d", (uint8_t *)&v258, 0x2Cu);
              }
            }
            v213 = 1;
LABEL_234:
            v216 = 0;
            if ((v213 & 1) != 0)
              goto LABEL_236;
            while (1)
            {
              if (v208 == *((_DWORD *)v206 + 1) >> 26)
              {
                v222 = *(_DWORD *)&v253[20];
                v223 = *(_DWORD *)&v253[24];
                if (*(_QWORD *)&v253[20])
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v224 = VRTraceErrorLogLevelToCSTR();
                    v225 = *MEMORY[0x24BDFDC28];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                    {
                      v258 = 136316418;
                      v259 = v224;
                      *(_WORD *)v260 = 2080;
                      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
                      v261 = 1024;
                      v262 = 1762;
                      v263 = 2048;
                      *(_QWORD *)v264 = a1;
                      *(_WORD *)&v264[8] = 1024;
                      *(_DWORD *)v265 = v223;
                      *(_WORD *)&v265[4] = 1024;
                      *(_DWORD *)v266 = v222;
                      _os_log_impl(&dword_215C5C000, v225, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p data: sack bitmap == %08X%08X", (uint8_t *)&v258, 0x32u);
                    }
                  }
                }
                v226 = 0;
                v227 = 0;
                do
                {
                  v227 += *(_WORD *)&v253[v226];
                  v226 += 2;
                }
                while ((_DWORD)v226 != 28);
                *(_WORD *)&v253[2] = ~v227;
                *(int32x2_t *)(a1 + 384) = vadd_s32(*(int32x2_t *)(a1 + 384), (int32x2_t)0x1C00000001);
                v228 = CAGP::current_timestamp((CAGP *)a1);
                *((_DWORD *)v251 + 28) = v228;
                pthread_mutex_unlock(v239);
                GCKSessionSendTo(*(_QWORD *)(a1 + 24), (uint64_t)&v252, 1, (uint64_t)v253, 28, 0, 64, 0, 0, 0, *(_DWORD *)a3 == 6);
                return 0;
              }
LABEL_236:
              v216 |= (v208 == *((unsigned __int8 *)v251 + 696)) & (v213 ^ 1);
              if ((v216 & 1) != 0)
              {
                v217 = *((_QWORD *)v251 + v208 + 15);
                if (v217)
                {
                  v218 = v208 - 32;
                  if (v208 < 0x20)
                    v218 = v208;
                  v219 = 1 << v218;
                  if (v208 >= 0x20)
                    v220 = 24;
                  else
                    v220 = 20;
                  if (*(_DWORD *)(v217 + 12) || (*(_BYTE *)(v217 + 8) & 2) != 0)
                    v221 = *(_DWORD *)&v253[v220] & ~v219;
                  else
                    v221 = *(_DWORD *)&v253[v220] | v219;
                  *(_DWORD *)&v253[v220] = v221;
                }
              }
              v213 = 0;
              v208 = (v208 + 1) & 0x3F;
            }
          }
          if (v210 >= 3)
          {
            v214 = VRTraceErrorLogLevelToCSTR();
            v215 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v258 = 136316162;
              v259 = v214;
              *(_WORD *)v260 = 2080;
              *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
              v261 = 1024;
              v262 = 1716;
              v263 = 2048;
              *(_QWORD *)v264 = a1;
              *(_WORD *)&v264[8] = 1024;
              *(_DWORD *)v265 = v208;
              _os_log_error_impl(&dword_215C5C000, v215, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p recv: ERROR FULL BUFFER INDEX MISMATCH %d", (uint8_t *)&v258, 0x2Cu);
            }
          }
        }
        v213 = 0;
        goto LABEL_234;
      }
      v140 = AGPDataQueue::peek_head_for_participant((AGPDataQueue *)v246, v252);
      v241 = (os_log_t)&v235;
      v141 = v243 ^ 1;
      *(_OWORD *)v253 = *(_OWORD *)a3;
      *(_QWORD *)&v253[16] = *(_QWORD *)(a3 + 16);
      MEMORY[0x24BDAC7A8](v140);
      v143 = (char *)&v235 - v142;
      memset((char *)&v235 - v142, 170, v144);
      v145 = 0;
      if ((_DWORD)v242)
        v146 = 0;
      else
        v146 = v140 == 0;
      v147 = !v146;
      v248 = v147 | v141;
      v148 = v143;
      v149 = (int)v143;
      *(_QWORD *)&v247 = v143;
      do
      {
        v150 = (_DWORD *)*((_QWORD *)v251 + ((v249 + v145) & 0x3F) + 15);
        *((_BYTE *)v251 + 696) = (*((_BYTE *)v251 + 696) + 1) & 0x3F;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v151 = VRTraceErrorLogLevelToCSTR();
          v152 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v153 = *v150;
            v154 = v150[2];
            v258 = v244;
            v259 = v151;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1612;
            v263 = 1024;
            *(_DWORD *)v264 = v153;
            *(_WORD *)&v264[4] = 1024;
            *(_DWORD *)&v264[6] = (v154 >> 14) & 0x3F;
            *(_WORD *)v265 = 1024;
            *(_DWORD *)&v265[2] = (v154 >> 20) & 0x3F;
            *(_WORD *)v266 = 1024;
            *(_DWORD *)&v266[2] = v252;
            _os_log_impl(&dword_215C5C000, v152, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d recv : deliver (%08X:%02d:%02d) from remoteID %08X...", (uint8_t *)&v258, 0x34u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v155 = VRTraceErrorLogLevelToCSTR();
          v156 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v157 = *v150;
            v158 = v150[2];
            v258 = v245;
            v259 = v155;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1614;
            v263 = 1024;
            *(_DWORD *)v264 = v157;
            *(_WORD *)&v264[4] = 1024;
            *(_DWORD *)&v264[6] = (v158 >> 14) & 0x3F;
            *(_WORD *)v265 = 1024;
            *(_DWORD *)&v265[2] = (v158 >> 20) & 0x3F;
            _os_log_impl(&dword_215C5C000, v156, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d recv : deliver (%08X:%02d:%02d)...", (uint8_t *)&v258, 0x2Eu);
          }
        }
        ++*((_DWORD *)v251 + 27);
        if ((v248 & 1) != 0)
          memcpy(v148, v150 + 4, v150[3]);
        else
          *(_QWORD *)&v247 = v150 + 4;
        v148 += v150[3];
        *v150 = 0;
        *((_QWORD *)v150 + 1) = 0;
        ++v145;
      }
      while ((_DWORD)v250 != v145);
      *(_QWORD *)&v253[8] = v247;
      *(_DWORD *)&v253[16] = (_DWORD)v148 - v149;
      if ((v248 & 1) != 0)
      {
        v159 = operator new();
        *(_QWORD *)v159 = 0;
        *(_DWORD *)(v159 + 72) = 0;
        *(_QWORD *)(v159 + 80) = 0;
        *(_DWORD *)(v159 + 88) = 0;
        *(_QWORD *)(v159 + 80) = CFDataCreate(0, *(const UInt8 **)&v253[8], *(int *)&v253[16]);
        *(_DWORD *)(v159 + 8) = v252;
        *(_DWORD *)(v159 + 72) = 1;
        AGPDataQueue::add_tail(v246, (_QWORD *)v159);
        if ((v243 & 1) == 0)
          goto LABEL_181;
        Mutable = CFDataCreateMutable(0, 0);
        pthread_mutex_lock(v238);
        for (i = AGPDataQueue::peek_head_for_participant((AGPDataQueue *)v246, v252);
              ;
              i = AGPDataQueue::peek_head_for_participant((AGPDataQueue *)v246, v252))
        {
          v162 = i;
          if (!i)
            break;
          v163 = (const __CFData *)*((_QWORD *)i + 10);
          if (v163)
          {
            BytePtr = CFDataGetBytePtr(v163);
            Length = CFDataGetLength(*((CFDataRef *)v162 + 10));
            CFDataAppendBytes(Mutable, BytePtr, Length);
          }
          v166 = AGPDataQueue::pop_head_for_participant((AGPDataQueue **)v246, v252);
          v167 = v166;
          if (v166)
          {
            v168 = (const void *)*((_QWORD *)v166 + 10);
            if (v168)
            {
              CFRelease(v168);
              *((_QWORD *)v167 + 10) = 0;
            }
            MEMORY[0x2199EF4DC](v167, 0x1060C40E2738600);
          }
        }
        pthread_mutex_unlock(v238);
        *(_QWORD *)&v253[8] = CFDataGetBytePtr(Mutable);
        *(_DWORD *)&v253[16] = CFDataGetLength(Mutable);
      }
      else
      {
        if ((v243 & 1) == 0)
          goto LABEL_181;
        Mutable = 0;
      }
      (*(void (**)(_QWORD, _QWORD, _BYTE *))a1)(*(_QWORD *)(a1 + 8), v252, v253);
      if ((v248 & 1) != 0)
        CFRelease(Mutable);
LABEL_181:
      v249 = (pthread_mutex_t *)*((unsigned __int8 *)v251 + 696);
      v169 = (_DWORD *)*((_QWORD *)v251 + (_QWORD)v249 + 15);
      if (!v169 || !v169[3] || *v169 != *((_DWORD *)v251 + 27))
        goto LABEL_224;
      LODWORD(v247) = *v169;
      v248 = v169[2];
      v114 = v248 >> 14;
    }
  }
  pthread_mutex_unlock(v7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  v27 = (char *)CAGP::sendingSetElement((CAGP *)a1, a2);
  v28 = (pthread_mutex_t *)(v27 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v27 + 32));
  v29 = v27[696];
  v30 = v27[699];
  v251 = (AGPSendingSetElement *)v27;
  v249 = (pthread_mutex_t *)(a1 + 64);
  if (!v30)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v47 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(_DWORD *)&v9[v24];
        v49 = **((_DWORD **)v251 + ((v29 - 1) & 0x3F) + 15) + 1;
        v258 = 136316418;
        v259 = v47;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1967;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v48;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v49;
        v38 = " [%s] %s:%d %p sack: RECEIVED SACK WITH LOWER SERIAL NUMBER [%08X] THAN NEXT [%08X], SKIPPING";
        goto LABEL_259;
      }
    }
    goto LABEL_260;
  }
  v31 = **(_DWORD **)&v27[8 * v29 + 120];
  v32 = *(_DWORD *)&v9[v24];
  v33 = VRTraceGetErrorLogLevelForModule();
  if (v32 < v31)
  {
    if (v33 >= 7)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_DWORD *)&v9[v24];
        v258 = 136316418;
        v259 = v35;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1963;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v37;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v31;
        v38 = " [%s] %s:%d %p sack: RECEIVED SACK WITH LOWER SERIAL NUMBER [%08X] THAN HEAD [%08X], SKIPPING";
        goto LABEL_259;
      }
    }
    goto LABEL_260;
  }
  *(_QWORD *)&v245 = v28;
  *(_QWORD *)&v250 = &v9[v24 + 8];
  if (v33 >= 7)
  {
    v50 = VRTraceErrorLogLevelToCSTR();
    v51 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v258 = 136316162;
      v259 = v50;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1817;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = a2;
      _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: PROCESS SACK PACKET FROM (%08X)...", (uint8_t *)&v258, 0x2Cu);
    }
  }
  v240 = v9;
  v52 = &v9[v24];
  v53 = &v9[v24 + 12];
  if (*(_DWORD *)v53 || *(_DWORD *)v250)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v54 = VRTraceErrorLogLevelToCSTR();
      v55 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v56 = *((_DWORD *)v52 + 3);
        v57 = *(_DWORD *)v250;
        v258 = 136316418;
        v259 = v54;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1821;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v56;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v57;
        _os_log_impl(&dword_215C5C000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: sack bitmap == %08X%08X", (uint8_t *)&v258, 0x32u);
      }
    }
    if (*((_DWORD *)v52 + 3) || *(_DWORD *)v250)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v58 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v60 = *((unsigned __int8 *)v251 + 698);
          v61 = *((unsigned __int8 *)v251 + 696);
          v62 = *((unsigned __int8 *)v251 + 697);
          v63 = *((unsigned __int8 *)v251 + 699);
          v258 = 136316930;
          v259 = v58;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1829;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v60;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v61;
          *(_WORD *)&v266[4] = 1024;
          v267 = v62;
          v268 = 1024;
          v269 = v63;
          _os_log_impl(&dword_215C5C000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: RECEIVER CLAIMS TO BE MISSING PACKETS (sender base %02d head %02d tail %02d used %02d", (uint8_t *)&v258, 0x3Eu);
        }
      }
      v64 = 0;
      v243 = v260;
      *(_QWORD *)&v244 = &v260[8];
      *(_QWORD *)&v34 = 136316674;
      v247 = v34;
      *(_QWORD *)&v34 = 136316162;
      v246 = v34;
      *(_QWORD *)&v34 = 136315650;
      v242 = v34;
      while (1)
      {
        v65 = ((_BYTE)v64 + *((_BYTE *)v251 + 698)) & 0x3F;
        if ((((_BYTE)v64 + *((_BYTE *)v251 + 698)) & 0x20) != 0)
          v66 = v65 - 32;
        else
          v66 = (v64 + *((_BYTE *)v251 + 698)) & 0x3F;
        v67 = (unsigned __int8 *)v250;
        if ((((_BYTE)v64 + *((_BYTE *)v251 + 698)) & 0x20) != 0)
          v67 = v53;
        if (((*(_DWORD *)v67 >> v66) & 1) == 0)
          goto LABEL_93;
        v68 = (unsigned __int8 *)*((_QWORD *)v251 + ((v64 + *((_BYTE *)v251 + 698)) & 0x3F) + 15);
        if (!v68)
          goto LABEL_93;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v69 = VRTraceErrorLogLevelToCSTR();
          v70 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v71 = *((_DWORD *)v68 + 3);
            v72 = (*((_DWORD *)v68 + 2) >> 1) & 1;
            v258 = v247;
            v259 = v69;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1848;
            v263 = 2048;
            *(_QWORD *)v264 = a1;
            *(_WORD *)&v264[8] = 1024;
            *(_DWORD *)v265 = v65;
            *(_WORD *)&v265[4] = 1024;
            *(_DWORD *)v266 = v71;
            *(_WORD *)&v266[4] = 1024;
            v267 = v72;
            _os_log_impl(&dword_215C5C000, v70, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: TEST INDEX %d len == %d ack_pending = %01d ", (uint8_t *)&v258, 0x38u);
          }
        }
        if (!*((_DWORD *)v68 + 3) || (v68[8] & 2) == 0 || *((_DWORD *)v68 + 1) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_93;
          v76 = VRTraceErrorLogLevelToCSTR();
          v77 = *MEMORY[0x24BDFDC28];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            goto LABEL_93;
          v258 = v246;
          v259 = v76;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1897;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v65;
          v78 = v77;
          v79 = " [%s] %s:%d %p sack: CAN'T RESEND INDEX %d";
          v80 = 44;
          goto LABEL_82;
        }
        v73 = CAGP::current_timestamp((CAGP *)a1);
        v74 = v73 - *((_DWORD *)v68 + 1);
        if (v74 >= 0)
          goto LABEL_84;
        if (v74 <= 0xEDF9BE00)
          break;
        v248 = v73 - *((_DWORD *)v68 + 1);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v75 = VRTraceErrorLogLevelToCSTR();
          v241 = (os_log_t)*MEMORY[0x24BDFDC28];
          if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
          {
            v258 = v242;
            v259 = v75;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1856;
            _os_log_error_impl(&dword_215C5C000, v241, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T RESEND (BAD TIMESTAMP) !!!!!!!!!!!!", (uint8_t *)&v258, 0x1Cu);
          }
        }
LABEL_85:
        if ((signed int)v248 > *((_DWORD *)v251 + 178))
        {
          memset(v243, 170, 0x5D0uLL);
          LOBYTE(v258) = 5;
          BYTE1(v258) = *((_BYTE *)v251 + v65 + 632);
          HIWORD(v258) = 0;
          LODWORD(v259) = *(_DWORD *)(a1 + 16);
          HIDWORD(v259) = v252;
          *(_DWORD *)v260 = *(_DWORD *)v68;
          *(_DWORD *)&v260[4] = *((_DWORD *)v68 + 2) & 0x3FFFF03 | (4 * (*((_BYTE *)v251 + 698) & 0x3F)) | (*((unsigned __int8 *)v251 + 697) << 26);
          *((_DWORD *)v68 + 1) = v73;
          ++*((_DWORD *)v68 + 379);
          memcpy((void *)v244, v68 + 16, *((unsigned int *)v68 + 3));
          HIWORD(v258) = agp_control::generate_checksum((agp_control *)&v258, v68 + 16, *((_DWORD *)v68 + 3));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v81 = VRTraceErrorLogLevelToCSTR();
            v82 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v253 = v246;
              *(_QWORD *)&v253[4] = v81;
              *(_WORD *)&v253[12] = 2080;
              *(_QWORD *)&v253[14] = "AGPSessionRecvFrom";
              *(_WORD *)&v253[22] = 1024;
              *(_DWORD *)&v253[24] = 1888;
              v254 = 2048;
              v255 = a1;
              v256 = 1024;
              v257 = v65;
              _os_log_impl(&dword_215C5C000, v82, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: RESEND INDEX %d", v253, 0x2Cu);
            }
          }
          GCKSessionSendTo(*(_QWORD *)(a1 + 24), (uint64_t)&v252, 1, (uint64_t)&v258, (*((_DWORD *)v68 + 3) + 20), 0, 64, 0, 0, 0, *(_DWORD *)a3 == 6);
          goto LABEL_93;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v83 = VRTraceErrorLogLevelToCSTR();
          v84 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v85 = *((_DWORD *)v251 + 178);
            v258 = v247;
            v259 = v83;
            *(_WORD *)v260 = 2080;
            *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
            v261 = 1024;
            v262 = 1894;
            v263 = 2048;
            *(_QWORD *)v264 = a1;
            *(_WORD *)&v264[8] = 1024;
            *(_DWORD *)v265 = v65;
            *(_WORD *)&v265[4] = 1024;
            *(_DWORD *)v266 = v248;
            *(_WORD *)&v266[4] = 1024;
            v267 = v85;
            v78 = v84;
            v79 = " [%s] %s:%d %p sack: RESEND ABORT %d ELAPSED_TIME (%04d) < RTO (%04d)";
            v80 = 56;
LABEL_82:
            _os_log_impl(&dword_215C5C000, v78, OS_LOG_TYPE_DEFAULT, v79, (uint8_t *)&v258, v80);
          }
        }
LABEL_93:
        if (++v64 == 64)
          goto LABEL_94;
      }
      v74 += 604800000;
LABEL_84:
      v248 = v74;
      goto LABEL_85;
    }
  }
LABEL_94:
  v86 = v251;
  v87 = *((unsigned __int8 *)v251 + 698);
  v88 = &v240[v24];
  if (*(_DWORD *)&v240[v24 + 4] >> 2 == v87)
  {
    v89 = 0;
    goto LABEL_212;
  }
  v89 = 0;
  *(_QWORD *)&v34 = 136316418;
  v250 = v34;
  do
  {
    v170 = *((_QWORD *)v86 + v87 + 15);
    if (!v170)
      break;
    if (!*(_DWORD *)(v170 + 12) || (*(_BYTE *)(v170 + 8) & 2) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_205;
      v171 = VRTraceErrorLogLevelToCSTR();
      v172 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_205;
      v173 = *(_DWORD *)v170;
      v258 = v250;
      v259 = v171;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1930;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = v173;
      *(_WORD *)&v265[4] = 1024;
      *(_DWORD *)v266 = v252;
      v174 = v172;
      v175 = " [%s] %s:%d %p sack: BUFFER MISSING SERIAL NUMBER (%08X) FROM (%08X)...";
      goto LABEL_192;
    }
    v176 = AGPSendingSetElement::search(v86, *(_DWORD *)v170);
    if (v176 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_205;
      v182 = VRTraceErrorLogLevelToCSTR();
      v183 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_205;
      v184 = *(_DWORD *)v170;
      v258 = v250;
      v259 = v182;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1926;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = v184;
      *(_WORD *)&v265[4] = 1024;
      *(_DWORD *)v266 = v252;
      v174 = v183;
      v175 = " [%s] %s:%d %p sack: SEARCH FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
      goto LABEL_192;
    }
    v177 = AGPSendingSetElement::remove(v251, v176);
    v178 = VRTraceGetErrorLogLevelForModule();
    if (v177)
    {
      if (v178 >= 7)
      {
        v179 = VRTraceErrorLogLevelToCSTR();
        v180 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v181 = *(_DWORD *)v170;
          v258 = v250;
          v259 = v179;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1921;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v181;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v252;
          _os_log_impl(&dword_215C5C000, v180, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: REMOVED PACKET SERIAL NUMBER (%08X) FROM (%08X)...", (uint8_t *)&v258, 0x32u);
        }
      }
      v89 = 1;
      goto LABEL_205;
    }
    if (v178 >= 7)
    {
      v185 = VRTraceErrorLogLevelToCSTR();
      v186 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v187 = *(_DWORD *)v170;
        v258 = v250;
        v259 = v185;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1923;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v187;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v252;
        v174 = v186;
        v175 = " [%s] %s:%d %p sack: REMOVE FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
LABEL_192:
        _os_log_impl(&dword_215C5C000, v174, OS_LOG_TYPE_DEFAULT, v175, (uint8_t *)&v258, 0x32u);
      }
    }
LABEL_205:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v188 = VRTraceErrorLogLevelToCSTR();
      v189 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v190 = *((unsigned __int8 *)v251 + 698);
        v258 = v250;
        v259 = v188;
        *(_WORD *)v260 = 2080;
        *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
        v261 = 1024;
        v262 = 1934;
        v263 = 2048;
        *(_QWORD *)v264 = a1;
        *(_WORD *)&v264[8] = 1024;
        *(_DWORD *)v265 = v190;
        *(_WORD *)&v265[4] = 1024;
        *(_DWORD *)v266 = v252;
        _os_log_impl(&dword_215C5C000, v189, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: INC BASE (%02d) FOR (%08X)...", (uint8_t *)&v258, 0x32u);
      }
    }
    v86 = v251;
    v87 = (*((_BYTE *)v251 + 698) + 1) & 0x3F;
    *((_BYTE *)v251 + 698) = v87;
  }
  while (*((_DWORD *)v88 + 1) >> 2 != v87);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v191 = VRTraceErrorLogLevelToCSTR();
    v192 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v193 = *((unsigned __int8 *)v251 + 698);
      v258 = v250;
      v259 = v191;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1939;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = v193;
      *(_WORD *)&v265[4] = 1024;
      *(_DWORD *)v266 = v252;
      _os_log_impl(&dword_215C5C000, v192, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: SET BASE (%02d) FOR (%08X)...", (uint8_t *)&v258, 0x32u);
    }
  }
LABEL_212:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v194 = VRTraceErrorLogLevelToCSTR();
    v195 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v196 = *((unsigned __int8 *)v251 + 698);
      v258 = 136316418;
      v259 = v194;
      *(_WORD *)v260 = 2080;
      *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
      v261 = 1024;
      v262 = 1942;
      v263 = 2048;
      *(_QWORD *)v264 = a1;
      *(_WORD *)&v264[8] = 1024;
      *(_DWORD *)v265 = v196;
      *(_WORD *)&v265[4] = 1024;
      *(_DWORD *)v266 = v252;
      _os_log_impl(&dword_215C5C000, v195, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: CUR BASE (%02d) FOR (%08X)...", (uint8_t *)&v258, 0x32u);
    }
  }
  v197 = AGPSendingSetElement::search(v251, *(_DWORD *)&v240[v24]);
  if (v197 < 0)
  {
    v28 = (pthread_mutex_t *)v245;
    if (!v89)
    {
      v28 = (pthread_mutex_t *)v245;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v202 = VRTraceErrorLogLevelToCSTR();
        v203 = *MEMORY[0x24BDFDC28];
        v28 = (pthread_mutex_t *)v245;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          v204 = *(_DWORD *)&v240[v24];
          v258 = 136316418;
          v259 = v202;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1957;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v204;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v252;
          _os_log_error_impl(&dword_215C5C000, v203, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p sack: SEARCH FAILURE SERIAL NUMBER (%08X) FROM (%08X)...", (uint8_t *)&v258, 0x32u);
        }
      }
    }
  }
  else
  {
    v198 = AGPSendingSetElement::remove(v251, v197);
    v199 = VRTraceGetErrorLogLevelForModule();
    if (v198)
    {
      v28 = (pthread_mutex_t *)v245;
      if (v199 >= 7)
      {
        v200 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x24BDFDC28];
        v28 = (pthread_mutex_t *)v245;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v201 = *(_DWORD *)&v240[v24];
          v258 = 136316418;
          v259 = v200;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1950;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v201;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v252;
          v38 = " [%s] %s:%d %p sack: REMOVED PACKET SERIAL NUMBER (%08X) FROM (%08X)...";
          goto LABEL_259;
        }
      }
    }
    else
    {
      v28 = (pthread_mutex_t *)v245;
      if (v199 >= 7)
      {
        v229 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x24BDFDC28];
        v28 = (pthread_mutex_t *)v245;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v230 = *(_DWORD *)&v240[v24];
          v258 = 136316418;
          v259 = v229;
          *(_WORD *)v260 = 2080;
          *(_QWORD *)&v260[2] = "AGPSessionRecvFrom";
          v261 = 1024;
          v262 = 1952;
          v263 = 2048;
          *(_QWORD *)v264 = a1;
          *(_WORD *)&v264[8] = 1024;
          *(_DWORD *)v265 = v230;
          *(_WORD *)&v265[4] = 1024;
          *(_DWORD *)v266 = v252;
          v38 = " [%s] %s:%d %p sack: REMOVE FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
LABEL_259:
          _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v258, 0x32u);
        }
      }
    }
  }
LABEL_260:
  pthread_mutex_unlock(v28);
  pthread_mutex_unlock(v249);
  return 0;
}

void sub_215C6A990(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void *CAGP::receiveSetElement(CAGP *this, int a2)
{
  pthread_mutex_t *v4;
  _DWORD *v5;
  AGPReceiveSetElement *v6;
  void *value;

  v4 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  v5 = (_DWORD *)*((_QWORD *)this + 7);
  v5[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(*((CFSetRef *)this + 4), v5, (const void **)&value))
  {
    v6 = (AGPReceiveSetElement *)operator new();
    AGPReceiveSetElement::AGPReceiveSetElement(v6, this);
    value = v6;
    *((_DWORD *)v6 + 26) = a2;
    CFSetAddValue(*((CFMutableSetRef *)this + 4), v6);
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_215C6AA58(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

AGPDataQueue *AGPDataQueue::peek_head_for_participant(AGPDataQueue *this, int a2)
{
  AGPDataQueue *v3;
  pthread_mutex_t *v4;

  v3 = this;
  v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  do
    v3 = *(AGPDataQueue **)v3;
  while (v3 && (*((_DWORD *)v3 + 18) != 1 || *((_DWORD *)v3 + 2) != a2));
  pthread_mutex_unlock(v4);
  return v3;
}

AGPDataQueue *AGPDataQueue::pop_head_for_participant(AGPDataQueue **this, int a2)
{
  pthread_mutex_t *v4;
  AGPDataQueue *v5;
  AGPDataQueue *v6;
  AGPDataQueue *v7;
  AGPDataQueue *v8;

  v4 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  v5 = *this;
  if (*this)
  {
    v6 = 0;
    v7 = *this;
    while (1)
    {
      v8 = v7;
      if (*((_DWORD *)v7 + 18) == 1 && *((_DWORD *)v7 + 2) == a2)
        break;
      v7 = *(AGPDataQueue **)v7;
      v6 = v8;
      if (!*(_QWORD *)v8)
        goto LABEL_6;
    }
    if (v6)
      v5 = v7;
    else
      v6 = (AGPDataQueue *)this;
    *(_QWORD *)v6 = *(_QWORD *)v5;
  }
  else
  {
LABEL_6:
    v8 = 0;
  }
  pthread_mutex_unlock(v4);
  return v8;
}

uint64_t AGPSessionEvent(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t result;
  void (**v6)(uint64_t, uint64_t, __int128 *);
  void (*v7)(uint64_t, uint64_t, __int128 *);
  void (*v8)(uint64_t, uint64_t, __int128 *);
  __int128 v9;
  uint64_t v10;

  result = CheckInHandleDebug();
  if (result)
  {
    v6 = (void (**)(uint64_t, uint64_t, __int128 *))result;
    v7 = *(void (**)(uint64_t, uint64_t, __int128 *))result;
    if (!*(_QWORD *)result)
      return CheckOutHandleDebug();
    if (!a3)
      return CheckOutHandleDebug();
    v8 = *(void (**)(uint64_t, uint64_t, __int128 *))(result + 8);
    if (!v8)
      return CheckOutHandleDebug();
    v9 = *a3;
    v10 = *((_QWORD *)a3 + 2);
    if ((v9 | 2) == 6)
    {
      if (!AGPSessionRecvFrom((uint64_t)v6, a2, (uint64_t)&v9))
        return CheckOutHandleDebug();
      v7 = *v6;
      v8 = v6[1];
    }
    v7((uint64_t)v8, a2, &v9);
    return CheckOutHandleDebug();
  }
  return result;
}

uint64_t AGPSessionBroadcast(uint64_t a1, UInt8 *a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  pthread_mutex_t *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  _DWORD *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = 2149187586;
  if (CheckInHandleDebug())
  {
    v9 = CheckInHandleDebug();
    if (v9)
    {
      v10 = v9;
      v11 = (pthread_mutex_t *)(v9 + 7800);
      v12 = pthread_mutex_lock((pthread_mutex_t *)(v9 + 7800));
      v13 = *(unsigned int *)(v10 + 112);
      MEMORY[0x24BDAC7A8](v12);
      v15 = (_DWORD *)((char *)v20 - ((v14 + 15) & 0x7FFFFFFF0));
      if ((_DWORD)v13)
      {
        memset((char *)v20 - ((v14 + 15) & 0x7FFFFFFF0), 170, v14);
        if ((int)v13 >= 2)
        {
          v16 = (_DWORD *)(v10 + 596);
          v17 = v13 - 1;
          v18 = v15;
          do
          {
            *v18++ = *v16;
            v16 += 120;
            --v17;
          }
          while (v17);
        }
      }
      pthread_mutex_unlock(v11);
      CheckOutHandleDebug();
      CheckOutHandleDebug();
      return AGPSessionSendTo(a1, v15, (v13 - 1), a2, a3, 0, a4, 0);
    }
    else
    {
      CheckOutHandleDebug();
    }
  }
  return v8;
}

void monitorSendingSet(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _DWORD *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[26];
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "monitorSendingSet";
      v12 = 1024;
      v13 = 2107;
      v14 = 2048;
      v15 = a2;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p monitor: participant (%08X)...", (uint8_t *)&v8, 0x2Cu);
    }
  }
  v7 = a1[175];
  a2[98] += v7;
  a2[99] += a1[178] * v7;
}

__CFString *copyAGPSessionStatistics()
{
  pthread_mutex_t *v0;
  __CFString *v1;
  __int128 v2;
  unsigned int info;
  int data;
  char __str[16];
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
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v0 = (pthread_mutex_t *)CheckInHandleDebug();
  v1 = (__CFString *)v0;
  if (v0)
  {
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36 = v2;
    v37 = v2;
    v34 = v2;
    v35 = v2;
    v32 = v2;
    v33 = v2;
    v30 = v2;
    v31 = v2;
    v28 = v2;
    v29 = v2;
    v26 = v2;
    v27 = v2;
    v24 = v2;
    v25 = v2;
    v22 = v2;
    v23 = v2;
    v20 = v2;
    v21 = v2;
    v18 = v2;
    v19 = v2;
    v16 = v2;
    v17 = v2;
    v14 = v2;
    v15 = v2;
    v12 = v2;
    v13 = v2;
    v10 = v2;
    v11 = v2;
    v8 = v2;
    v9 = v2;
    *(_OWORD *)__str = v2;
    v7 = v2;
    pthread_mutex_lock(v0 + 1);
    v1[12].info = 0;
    LODWORD(v1[12].data) = 0;
    CFSetApplyFunction((CFSetRef)v1[1].info, (CFSetApplierFunction)monitorSendingSet, v1);
    info = v1[12].info;
    if (info)
    {
      data = HIDWORD(v1[12].info) / info;
      LODWORD(v1[12].data) = data;
    }
    else
    {
      data = (int)v1[12].data;
    }
    snprintf(__str, 0x200uLL, "sent %d data packets : rush (%d packets %d bytes): rely (%d packets %d bytes) : rtry (%d packets %d bytes) : sack (%d packets %d bytes) : current weighted average rtt (%d ms)", LODWORD(v1[11].length) + LODWORD(v1[11].info) + LODWORD(v1[12].isa), LODWORD(v1[11].info) - LODWORD(v1[11].data), HIDWORD(v1[11].info) - HIDWORD(v1[11].data), LODWORD(v1[11].data), HIDWORD(v1[11].data), LODWORD(v1[11].length), HIDWORD(v1[11].length), LODWORD(v1[12].isa), HIDWORD(v1[12].isa), data);
    pthread_mutex_unlock((pthread_mutex_t *)&v1[2]);
    v1 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], __str, 0x600u);
    CheckOutHandleDebug();
  }
  return v1;
}

void AGPSendingSetElement::AGPSendingSetElement(AGPSendingSetElement *this, CAGP *a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  AGPAssociationSetElement::AGPAssociationSetElement(this, a2);
  *v3 = &off_24D466240;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *((_DWORD *)this + 26);
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "AGPSendingSetElement";
      v11 = 1024;
      v12 = 501;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CREATING sending set element %08X", (uint8_t *)&v7, 0x22u);
    }
  }
}

void sub_215C6B1D8(_Unwind_Exception *a1)
{
  AGPAssociationSetElement *v1;

  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPAssociationSetElement::AGPAssociationSetElement(AGPAssociationSetElement *this, CAGP *a2)
{
  unsigned int *v3;
  pthread_mutex_t *v4;
  int v5;
  uint64_t i;
  _DWORD *v7;
  pthread_mutexattr_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 12) = 0;
  *(_QWORD *)this = &off_24D4662A0;
  *((_QWORD *)this + 1) = a2;
  *((_DWORD *)this + 27) = 0;
  v3 = (unsigned int *)((char *)this + 700);
  v4 = (pthread_mutex_t *)((char *)this + 32);
  *(_OWORD *)((char *)this + 696) = 0u;
  *((_DWORD *)this + 178) = 0;
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  UpdateRTO(v3, 250);
  pthread_mutex_unlock(v4);
  *((_DWORD *)this + 28) = -1;
  v8.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v8.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_mutexattr_init(&v8))
  {
    pthread_mutexattr_settype(&v8, 2);
    pthread_mutex_init(v4, &v8);
    pthread_mutexattr_destroy(&v8);
  }
  v5 = 0;
  for (i = 0; i != 64; ++i)
  {
    v7 = (_DWORD *)operator new();
    v7[379] = 0;
    v7[2] = v5;
    v7[3] = 0;
    *((_QWORD *)this + i + 15) = v7;
    v7[1] = -1;
    *((_BYTE *)this + i + 632) = 0x80;
    v5 += 256;
  }
}

void AGPAssociationSetElement::~AGPAssociationSetElement(AGPAssociationSetElement *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  *(_QWORD *)this = &off_24D4662A0;
  do
  {
    *((_BYTE *)this + v2 + 632) = 0x80;
    v3 = *((_QWORD *)this + v2 + 15);
    if (v3)
      MEMORY[0x2199EF4DC](v3, 0x1000C40D24D2377);
    ++v2;
  }
  while (v2 != 64);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 32));
}

{
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
  JUMPOUT(0x2199EF4DCLL);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void AGPSendingSetElement::~AGPSendingSetElement(AGPSendingSetElement *this)
{
  AGPSendingSetElement::~AGPSendingSetElement(this);
  JUMPOUT(0x2199EF4DCLL);
}

{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_24D466240;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *((_DWORD *)this + 26);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "~AGPSendingSetElement";
      v9 = 1024;
      v10 = 505;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DELETING sending set element %08X", (uint8_t *)&v5, 0x22u);
    }
  }
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

void sub_215C6B408(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_215C6B464(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_215C6B598(_Unwind_Exception *a1)
{
  AGPAssociationSetElement *v1;

  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void CAGP::CAGP(CAGP *this)
{
  AGPReceiveSetElement *v2;
  AGPSendingSetElement *v3;
  pthread_mutexattr_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 216));
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 288));
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 4) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  *((_QWORD *)this + 5) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  v2 = (AGPReceiveSetElement *)operator new();
  AGPReceiveSetElement::AGPReceiveSetElement(v2, this);
  *((_QWORD *)this + 7) = v2;
  v3 = (AGPSendingSetElement *)operator new();
  AGPSendingSetElement::AGPSendingSetElement(v3, this);
  *((_QWORD *)this + 6) = v3;
  v4.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v4.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_mutexattr_init(&v4))
  {
    pthread_mutexattr_settype(&v4, 2);
    pthread_mutex_init((pthread_mutex_t *)this + 1, &v4);
    pthread_mutex_init((pthread_mutex_t *)this + 2, &v4);
    pthread_mutexattr_destroy(&v4);
  }
  *((_DWORD *)this + 52) = -1;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 388) = 0u;
}

void sub_215C6B71C(_Unwind_Exception *a1)
{
  AGPDataQueue *v1;
  AGPDataQueue *v2;
  uint64_t v3;

  MEMORY[0x2199EF4DC](v3, 0x10A1C404616C3E8);
  AGPDataQueue::~AGPDataQueue(v2);
  AGPDataQueue::~AGPDataQueue(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::AGPDataQueue(AGPDataQueue *this)
{
  pthread_mutexattr_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = 0;
  v2.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v2.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_mutexattr_init(&v2))
  {
    pthread_mutexattr_settype(&v2, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), &v2);
    pthread_mutexattr_destroy(&v2);
  }
}

void AGPReceiveSetElement::AGPReceiveSetElement(AGPReceiveSetElement *this, CAGP *a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  AGPAssociationSetElement::AGPAssociationSetElement(this, a2);
  *v3 = &off_24D4662C0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *((_DWORD *)this + 26);
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "AGPReceiveSetElement";
      v11 = 1024;
      v12 = 516;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CREATING receive set element %08X", (uint8_t *)&v7, 0x22u);
    }
  }
}

void sub_215C6B914(_Unwind_Exception *a1)
{
  AGPAssociationSetElement *v1;

  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPReceiveSetElement::~AGPReceiveSetElement(AGPReceiveSetElement *this)
{
  AGPReceiveSetElement::~AGPReceiveSetElement(this);
  JUMPOUT(0x2199EF4DCLL);
}

{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_24D4662C0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *((_DWORD *)this + 26);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "~AGPReceiveSetElement";
      v9 = 1024;
      v10 = 520;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DELETING receive set element %08X", (uint8_t *)&v5, 0x22u);
    }
  }
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

void sub_215C6B978(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_215C6BAAC(_Unwind_Exception *a1)
{
  AGPAssociationSetElement *v1;

  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::~AGPDataQueue(AGPDataQueue *this)
{
  _QWORD *i;
  const void *v3;

  for (i = *(_QWORD **)this; *(_QWORD *)this; i = *(_QWORD **)this)
  {
    *(_QWORD *)this = *i;
    v3 = (const void *)i[10];
    if (v3)
    {
      CFRelease(v3);
      i[10] = 0;
    }
    MEMORY[0x2199EF4DC](i, 0x1060C40E2738600);
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_215C6BB48(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2199EF4DC](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void CAGP::~CAGP(pthread_mutex_t *this)
{
  const void *v2;
  const void *v3;
  _QWORD *sig;
  __CFSet *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(const void **)&this->__opaque[32];
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)&this->__opaque[32] = 0;
  }
  v3 = *(const void **)&this->__opaque[24];
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)&this->__opaque[24] = 0;
  }
  while (1)
  {
    sig = (_QWORD *)this[3].__sig;
    if (!sig)
      break;
    v5 = (__CFSet *)sig[3];
    this[3].__sig = sig[2];
    CFSetRemoveValue(v5, sig);
  }
  while (1)
  {
    v6 = *(_QWORD **)this[3].__opaque;
    if (!v6)
      break;
    *(_QWORD *)this[3].__opaque = v6[2];
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
  pthread_mutex_destroy(this + 1);
  pthread_mutex_destroy(this + 2);
  v7 = *(_QWORD *)&this->__opaque[40];
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *(_QWORD *)&this->__opaque[48];
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[4].__opaque[24]);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[3].__opaque[16]);
}

void sub_215C6BC28(_Unwind_Exception *a1)
{
  uint64_t v1;

  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)(v1 + 216));
  _Unwind_Resume(a1);
}

uint64_t PostEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6)
{
  uint64_t v6;
  pthread_mutex_t *v13;
  _DWORD *v14;
  _DWORD *v15;
  void *v16;
  _DWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = 2149187587;
  if (a1)
  {
    v13 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    if (*(_DWORD *)(a1 + 4))
    {
      v6 = 2149187606;
LABEL_14:
      pthread_mutex_unlock(v13);
      return v6;
    }
    if (a4 && a5)
    {
      v14 = malloc_type_malloc(a5 + 48, 0xE32982CCuLL);
      if (!v14)
        goto LABEL_14;
      v15 = v14;
      *v14 = a2;
      v14[2] = a3;
      v16 = v14 + 12;
      *((_QWORD *)v15 + 2) = v16;
      v15[6] = a5;
      v15[7] = a6;
      memcpy(v16, a4, a5);
    }
    else
    {
      v17 = malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
      if (!v17)
        goto LABEL_14;
      v15 = v17;
      *v17 = a2;
      v17[2] = a3;
      *((_QWORD *)v17 + 2) = 0;
      v17[6] = 0;
      v17[7] = a6;
    }
    *((_QWORD *)v15 + 5) = 0;
    v18 = (_QWORD *)(a1 + 40);
    do
    {
      v19 = v18;
      v20 = *v18;
      v18 = (_QWORD *)(*v18 + 40);
    }
    while (v20);
    *v19 = v15;
    pthread_cond_signal((pthread_cond_t *)(a1 + 112));
    v6 = 0;
    goto LABEL_14;
  }
  return 2149187585;
}

uint64_t WaitEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6, double a7)
{
  uint64_t v7;
  pthread_mutex_t *v15;
  pthread_mutex_t *v16;
  double *v17;
  double *v18;
  void *v19;
  double *v20;
  uint64_t v21;
  double **v22;
  uint64_t v23;
  uint64_t v24;

  v7 = 2149187587;
  if (a1)
  {
    v15 = (pthread_mutex_t *)(a1 + 248);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
    v16 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    if (*(_DWORD *)(a1 + 4))
    {
      v7 = 2149187606;
LABEL_19:
      pthread_mutex_unlock(v16);
      pthread_mutex_unlock(v15);
      return v7;
    }
    if (a4 && a5)
    {
      v17 = (double *)malloc_type_malloc(a5 + 48, 0x78C5AD35uLL);
      if (!v17)
        goto LABEL_19;
      v18 = v17;
      v17[4] = a7;
      *(_DWORD *)v17 = a2;
      *((_DWORD *)v17 + 2) = a3;
      v19 = v17 + 6;
      *((_QWORD *)v18 + 2) = v19;
      *((_DWORD *)v18 + 6) = a5;
      *((_DWORD *)v18 + 7) = a6;
      memcpy(v19, a4, a5);
    }
    else
    {
      v20 = (double *)malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
      if (!v20)
        goto LABEL_19;
      v18 = v20;
      v20[4] = a7;
      *(_DWORD *)v20 = a2;
      *((_DWORD *)v20 + 2) = a3;
      v20[2] = 0.0;
      *((_DWORD *)v20 + 6) = 0;
      *((_DWORD *)v20 + 7) = a6;
    }
    v18[5] = 0.0;
    v23 = *(_QWORD *)(a1 + 240);
    v22 = (double **)(a1 + 240);
    v21 = v23;
    if (v23)
    {
      if (*(double *)(v21 + 32) > a7)
      {
LABEL_16:
        *((_QWORD *)v18 + 5) = v21;
      }
      else
      {
        while (1)
        {
          v24 = v21;
          v21 = *(_QWORD *)(v21 + 40);
          if (!v21)
            break;
          if (*(double *)(v21 + 32) > a7)
          {
            v22 = (double **)(v24 + 40);
            goto LABEL_16;
          }
        }
        v22 = (double **)(v24 + 40);
      }
    }
    v7 = 0;
    *v22 = v18;
    goto LABEL_19;
  }
  return 2149187585;
}

uint64_t ServiceWaitEventCallbacks(uint64_t a1, double a2)
{
  uint64_t v2;
  pthread_mutex_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = 2149187606;
  if (!a1)
    return 2149187585;
  v5 = (pthread_mutex_t *)(a1 + 248);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  if (*(_DWORD *)(a1 + 4))
  {
LABEL_3:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    pthread_mutex_unlock(v5);
  }
  else
  {
    v6 = (uint64_t *)(a1 + 240);
    v7 = *(_QWORD *)(a1 + 240);
    if (v7)
    {
      do
      {
        v8 = (uint64_t *)(v7 + 40);
        if (*(double *)(v7 + 32) <= a2)
        {
          *v6 = *v8;
          *v8 = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_DWORD *)(v7 + 8);
              v12 = *(_DWORD *)v7;
              *(_DWORD *)buf = 136316162;
              v15 = v9;
              v16 = 2080;
              v17 = "ServiceWaitEventCallbacks";
              v18 = 1024;
              v19 = 197;
              v20 = 1024;
              v21 = v11;
              v22 = 1024;
              v23 = v12;
              _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ServiceWaitEventCallbacks: post delayed event of type %d to participant %08X", buf, 0x28u);
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
          PostEventCallback(a1, *(_DWORD *)v7, *(_DWORD *)(v7 + 8), *(const void **)(v7 + 16), *(_DWORD *)(v7 + 24), *(_DWORD *)(v7 + 28));
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
          free((void *)v7);
          if (*(_DWORD *)(a1 + 4))
            goto LABEL_3;
        }
        else
        {
          v6 = (uint64_t *)(v7 + 40);
        }
        v7 = *v6;
      }
      while (*v6);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    pthread_mutex_unlock(v5);
    return 0;
  }
  return v2;
}

uint64_t StartEventCallbackThread(_DWORD *a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  __int128 v4;
  pthread_attr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 2149187585;
  v2 = (pthread_mutex_t *)(a1 + 12);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 12));
  if (*a1)
  {
    pthread_mutex_unlock(v2);
    return 0;
  }
  else
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v6.__opaque[24] = v4;
    *(_OWORD *)&v6.__opaque[40] = v4;
    *(_OWORD *)&v6.__sig = v4;
    *(_OWORD *)&v6.__opaque[8] = v4;
    pthread_attr_init(&v6);
    pthread_attr_setdetachstate(&v6, 2);
    v3 = pthread_create((pthread_t *)a1 + 20, 0, (void *(__cdecl *)(void *))EventCBProc, a1);
    pthread_attr_destroy(&v6);
    if ((_DWORD)v3)
      v3 = v3 | 0xC01A0000;
    else
      *a1 = 1;
    pthread_mutex_unlock(v2);
  }
  return v3;
}

uint64_t EventCBProc(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pthread_setname_np("com.apple.gamekitservices.eventcallback.eventcbproc");
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    while (1)
    {
      v2 = *(_QWORD **)(a1 + 40);
      if (v2)
        break;
      if (*(_DWORD *)(a1 + 4))
        goto LABEL_8;
      pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48));
    }
    if (*(_DWORD *)(a1 + 4))
      break;
    *(_QWORD *)(a1 + 40) = v2[5];
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    (*(void (**)(_QWORD, _QWORD, _QWORD *))(a1 + 8))(*(_QWORD *)(a1 + 16), *(unsigned int *)v2, v2 + 1);
    free(v2);
  }
LABEL_8:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "EventCBProc";
      v10 = 1024;
      v11 = 38;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d EventCallbackThread ends.", (uint8_t *)&v6, 0x1Cu);
    }
  }
  return 0;
}

uint64_t StopEventCallbackThread(uint64_t a1)
{
  pthread_mutex_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 2149187585;
  v2 = (pthread_mutex_t *)(a1 + 48);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  *(_DWORD *)(a1 + 4) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 112));
  v3 = *(_QWORD **)(a1 + 40);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)v3[5];
      free(v3);
      v3 = v4;
    }
    while (v4);
  }
  *(_QWORD *)(a1 + 40) = 0;
  pthread_mutex_unlock(v2);
  pthread_join(*(pthread_t *)(a1 + 160), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "CleanupWaitEventCallbacks";
      v13 = 1024;
      v14 = 226;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CleanupWaitEventCallbacks", (uint8_t *)&v9, 0x1Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  while (1)
  {
    v7 = *(_QWORD **)(a1 + 240);
    if (!v7)
      break;
    *(_QWORD *)(a1 + 240) = v7[5];
    free(v7);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
  pthread_mutex_destroy(v2);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 248));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 112));
  free((void *)a1);
  return 0;
}

int *GCKSessionDecodeChannelStatistics(uint64_t a1, char *a2, unsigned int a3)
{
  int *v5;
  int *v6;

  if (!CheckInHandleDebug())
    return 0;
  v5 = (int *)GCKSessionDecodeChannelStatisticsInternal(a2, a3);
  v6 = v5;
  if (v5)
    TracePrintChanStats(v5);
  CheckOutHandleDebug();
  return v6;
}

void *GCKSessionDecodeChannelStatisticsInternal(char *a1, unsigned int a2)
{
  void *v4;
  __int128 v5;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  XDR v8;

  v4 = malloc_type_calloc(1uLL, 0x98uLL, 0x102004012D539F1uLL);
  if (v4)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v8.x_public = v5;
    *(_OWORD *)&v8.x_base = v5;
    *(_OWORD *)&v8.x_op = v5;
    xdrmem_create(&v8, a1, a2, XDR_DECODE);
    if (!xdr_chanstat_node(&v8, (uint64_t)v4))
    {
      free(v4);
      v4 = 0;
    }
    x_destroy = v8.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&v8);
  }
  return v4;
}

uint64_t TracePrintChanStats(int *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  double v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  const char *v51;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  _BYTE v60[28];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    v4 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *a1;
        v6 = a1[1];
        v7 = a1[16];
        *(_DWORD *)buf = 136316418;
        v54 = v2;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 74;
        v59 = 1024;
        *(_DWORD *)v60 = v5;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v6;
        *(_WORD *)&v60[10] = 1024;
        *(_DWORD *)&v60[12] = v7;
        _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====> report (hostID %08X iIFIndex %d chanID %d)", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    v10 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = a1[17];
        v12 = *((unsigned __int16 *)a1 + 4);
        v13 = *((unsigned __int16 *)a1 + 5);
        *(_DWORD *)buf = 136316418;
        v54 = v8;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 75;
        v59 = 1024;
        *(_DWORD *)v60 = v11;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v12;
        *(_WORD *)&v60[10] = 1024;
        *(_DWORD *)&v60[12] = v13;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (peerID %08X type %d rsvd %d)", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    v16 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = a1[3];
        v18 = *((_QWORD *)a1 + 2);
        v19 = *((_QWORD *)a1 + 3);
        *(_DWORD *)buf = 136316418;
        v54 = v14;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 76;
        v59 = 1024;
        *(_DWORD *)v60 = v17;
        *(_WORD *)&v60[4] = 2048;
        *(_QWORD *)&v60[6] = v18;
        *(_WORD *)&v60[14] = 2048;
        *(_QWORD *)&v60[16] = v19;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (rtt %d recv %ld send %ld)", buf, 0x36u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    v22 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = a1[8];
        v24 = a1[9];
        *(_DWORD *)buf = 136316162;
        v54 = v20;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 78;
        v59 = 1024;
        *(_DWORD *)v60 = v23;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v24;
        _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (rbw %d sbw %d)", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x24BDFDC28];
    v27 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *((float *)a1 + 10);
        v29 = *((float *)a1 + 11);
        v30 = *((float *)a1 + 12);
        *(_DWORD *)buf = 136316418;
        v54 = v25;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 79;
        v59 = 2048;
        *(double *)v60 = v28;
        *(_WORD *)&v60[8] = 2048;
        *(double *)&v60[10] = v29;
        *(_WORD *)&v60[18] = 2048;
        *(double *)&v60[20] = v30;
        _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (up %f irate %f orate %f)", buf, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x24BDFDC28];
    v33 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *((float *)a1 + 13);
        v35 = *((float *)a1 + 14);
        *(_DWORD *)buf = 136316162;
        v54 = v31;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 80;
        v59 = 2048;
        *(double *)v60 = v34;
        *(_WORD *)&v60[8] = 2048;
        *(double *)&v60[10] = v35;
        _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (iloss %f oloss %f)", buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x24BDFDC28];
    v38 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = a1[18];
        *(_DWORD *)buf = 136315906;
        v54 = v36;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 81;
        v59 = 1024;
        *(_DWORD *)v60 = v39;
        _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (ndst %d)", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_2();
    }
  }
  if (a1[18] >= 1)
  {
    v40 = 0;
    v41 = a1 + 19;
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x24BDFDC28];
        v44 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = v41[v40];
            *(_DWORD *)buf = 136316162;
            v54 = v42;
            v55 = 2080;
            v56 = "TracePrintChanStats";
            v57 = 1024;
            v58 = 83;
            v59 = 1024;
            *(_DWORD *)v60 = v40;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v45;
            _os_log_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>         (dstID %d %08X)", buf, 0x28u);
          }
        }
        else if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v46 = v41[v40];
          *(_DWORD *)buf = 136316162;
          v54 = v42;
          v55 = 2080;
          v56 = "TracePrintChanStats";
          v57 = 1024;
          v58 = 83;
          v59 = 1024;
          *(_DWORD *)v60 = v40;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v46;
          _os_log_debug_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ====>         (dstID %d %08X)", buf, 0x28u);
        }
      }
      ++v40;
    }
    while (v40 < a1[18]);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v47 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x24BDFDC28];
    v49 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *((_QWORD *)a1 + 18);
        *(_DWORD *)buf = 136315906;
        if (v50)
          v51 = "YES";
        else
          v51 = "NO";
        v54 = v47;
        v55 = 2080;
        v56 = "TracePrintChanStats";
        v57 = 1024;
        v58 = 85;
        v59 = 2080;
        *(_QWORD *)v60 = v51;
        _os_log_impl(&dword_215C5C000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (next == %s)", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_1();
    }
  }
  result = *((_QWORD *)a1 + 18);
  if (result)
    return TracePrintChanStats();
  return result;
}

void GCKSession_TrimLocalInterfaceList(int **a1, int *a2, int a3)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  int *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  int *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      v5 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v29 = v3;
          v30 = 2080;
          v31 = "GCKSession_TrimLocalInterfaceList";
          v32 = 1024;
          v33 = 306;
          _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter not trimming interfaces for local gaming.", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        GCKSession_TrimLocalInterfaceList_cold_1();
      }
    }
  }
  else
  {
    v27 = 0;
    if (a1 && a2 && (v8 = *a1) != 0)
    {
      v26 = 0;
      if (*a2 < 1)
      {
        v11 = 0;
        v10 = 0;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = v8 + 1;
        while (1)
        {
          if (strncmp((const char *)v8 + 4, "en", 2uLL) || v10)
          {
            if ((*(_BYTE *)v8 & 4) != 0 && !v11)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                v17 = VRTraceErrorLogLevelToCSTR();
                v18 = *MEMORY[0x24BDFDC28];
                v19 = *MEMORY[0x24BDFDC28];
                if (*MEMORY[0x24BDFDC18])
                {
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    v20 = *v8;
                    *(_DWORD *)buf = 136316162;
                    v29 = v17;
                    v30 = 2080;
                    v31 = "GCKSession_TrimLocalInterfaceList";
                    v32 = 1024;
                    v33 = 323;
                    v34 = 1024;
                    v35 = v20;
                    v36 = 2080;
                    v37 = v12;
                    _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter found an carrier IPPort. Try to use it as first pdpIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                  }
                }
                else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  v22 = *v8;
                  *(_DWORD *)buf = 136316162;
                  v29 = v17;
                  v30 = 2080;
                  v31 = "GCKSession_TrimLocalInterfaceList";
                  v32 = 1024;
                  v33 = 323;
                  v34 = 1024;
                  v35 = v22;
                  v36 = 2080;
                  v37 = v12;
                  _os_log_debug_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEBUG, " [%s] %s:%d InterfaceFilter found an carrier IPPort. Try to use it as first pdpIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                }
              }
              v11 = _GCKSession_AddOneIPPortToInterfaceList((void **)&v27, (__int128 *)v8, (unsigned int *)&v26);
            }
          }
          else
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x24BDFDC28];
              v15 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = *v8;
                  *(_DWORD *)buf = 136316162;
                  v29 = v13;
                  v30 = 2080;
                  v31 = "GCKSession_TrimLocalInterfaceList";
                  v32 = 1024;
                  v33 = 320;
                  v34 = 1024;
                  v35 = v16;
                  v36 = 2080;
                  v37 = v12;
                  _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter found an en IPPort. Try to use it as first enIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                }
              }
              else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v21 = *v8;
                *(_DWORD *)buf = 136316162;
                v29 = v13;
                v30 = 2080;
                v31 = "GCKSession_TrimLocalInterfaceList";
                v32 = 1024;
                v33 = 320;
                v34 = 1024;
                v35 = v21;
                v36 = 2080;
                v37 = v12;
                _os_log_debug_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d InterfaceFilter found an en IPPort. Try to use it as first enIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
              }
            }
            v10 = _GCKSession_AddOneIPPortToInterfaceList((void **)&v27, (__int128 *)v8, (unsigned int *)&v26);
          }
          if (v26 >= 2)
            break;
          ++v9;
          v8 += 10;
          v12 += 10;
          if (v9 >= *a2)
            goto LABEL_40;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x24BDFDC28];
          v25 = *MEMORY[0x24BDFDC28];
          if (*MEMORY[0x24BDFDC18])
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v29 = v23;
              v30 = 2080;
              v31 = "GCKSession_TrimLocalInterfaceList";
              v32 = 1024;
              v33 = 327;
              _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter got 2 or more interfaces already. skip the rest of the list.", buf, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            GCKSession_TrimLocalInterfaceList_cold_4();
          }
        }
      }
LABEL_40:
      if ((v26 - 3) <= 0xFFFFFFFD && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCKSession_TrimLocalInterfaceList_cold_3();
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCKSession_TrimLocalInterfaceList_cold_2();
      }
      v11 = 0;
      v10 = 0;
    }
    if (v10 || v11)
    {
      *a2 = v26;
      FreeLocalInterfaceList();
      *a1 = v27;
    }
    else
    {
      FreeLocalInterfaceList();
    }
  }
}

BOOL _GCKSession_AddOneIPPortToInterfaceList(void **a1, __int128 *a2, unsigned int *a3)
{
  unsigned int v6;
  void *v7;
  char *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  _BOOL8 result;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _GCKSession_AddOneIPPortToInterfaceList_cold_1();
    }
    return 0;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _GCKSession_AddOneIPPortToInterfaceList_cold_2();
    }
    return 0;
  }
  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _GCKSession_AddOneIPPortToInterfaceList_cold_3();
    }
    return 0;
  }
  if (*a3 >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      v19 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (!v20)
          return result;
        v21 = 136315650;
        v22 = v17;
        v23 = 2080;
        v24 = "_GCKSession_AddOneIPPortToInterfaceList";
        v25 = 1024;
        v26 = 280;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bailing due to: invalid numberOfIPPortsToUse.", (uint8_t *)&v21, 0x1Cu);
      }
      else
      {
        result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (!result)
          return result;
        _GCKSession_AddOneIPPortToInterfaceList_cold_4();
      }
    }
    return 0;
  }
  v6 = *a3 + 1;
  v7 = *a1;
  if (!*a1)
  {
    v8 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
    v9 = v8;
    if (v8)
      goto LABEL_9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _GCKSession_AddOneIPPortToInterfaceList_cold_5();
    }
    return 0;
  }
  v8 = (char *)malloc_type_realloc(v7, 40 * v6, 0x100004053E81896uLL);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _GCKSession_AddOneIPPortToInterfaceList_cold_7();
    }
    return 0;
  }
  v9 = v8 + 40;
LABEL_9:
  v10 = *a2;
  v11 = a2[1];
  *((_QWORD *)v9 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v9 = v10;
  *((_OWORD *)v9 + 1) = v11;
  *a3 = v6;
  *a1 = v8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    v14 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_DWORD *)a2;
        v21 = 136316162;
        v22 = v12;
        v23 = 2080;
        v24 = "_GCKSession_AddOneIPPortToInterfaceList";
        v25 = 1024;
        v26 = 297;
        v27 = 1024;
        v28 = v15;
        v29 = 2080;
        v30 = (uint64_t)a2 + 4;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully added an IPPort to ipPortList. Added IPPort:\tflag(%02X)\tszIfName=%s", (uint8_t *)&v21, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      _GCKSession_AddOneIPPortToInterfaceList_cold_6();
    }
  }
  return 1;
}

uint64_t UpdateRTO(unsigned int *a1, int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  if (a2 >= 1)
  {
    v3 = *a1;
    v2 = a1[1];
    v4 = *a1 + 1;
    *a1 = v4;
    if (v3 <= 0x3F)
    {
      v5 = v2 + a2;
      v6 = (v2 + a2) / v4;
      v7 = a2 - v6;
      if ((int)(a2 - v6) < 0)
        v7 = v6 - a2;
      v8 = a1[2] - ((int)a1[2] >> 5) + v7;
      a1[1] = v5;
      a1[2] = v8;
      goto LABEL_11;
    }
    v9 = a2 - (v2 >> 6);
    if (v9 >= 0)
      v10 = a2 - (v2 >> 6);
    else
      v10 = (v2 >> 6) - a2;
    v11 = a1[2];
    if (v10 < (3 * v11) >> 5)
    {
      v12 = v9 + v2;
      v13 = v10 - (v11 >> 5) + v11;
      a1[1] = v12;
      a1[2] = v13;
      v6 = (v13 >> 5) + (v12 >> 6);
LABEL_11:
      a1[3] = v6;
    }
  }
  return a1[3];
}

uint64_t GCKSessionCreateUniqueID()
{
  return arc4random() & 0x7FFFFFFF;
}

uint64_t GCKSessionGetLocalServicePort()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  socklen_t v8;
  _BYTE v9[22];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = CheckInHandleDebug();
  if (!v0)
    return 0;
  v1 = *(_DWORD *)(v0 + 16);
  if (v1 == -1)
  {
    v4 = 0;
  }
  else
  {
    memset(v9, 170, 16);
    v8 = 16;
    v2 = getsockname(v1, (sockaddr *)v9, &v8);
    v3 = bswap32(*(unsigned __int16 *)&v9[2]) >> 16;
    if (v2)
      v4 = 0;
    else
      v4 = v3;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v9 = 136315906;
      *(_QWORD *)&v9[4] = v5;
      *(_WORD *)&v9[12] = 2080;
      *(_QWORD *)&v9[14] = "GCKSessionGetLocalServicePort";
      v10 = 1024;
      v11 = 6370;
      v12 = 1024;
      v13 = v4;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Listening on port %u", v9, 0x22u);
    }
  }
  CheckOutHandleDebug();
  return v4;
}

uint64_t GCKSessionSetDisconnectTimeout(double a1)
{
  uint64_t v2;
  double v3;

  v2 = CheckInHandleDebug();
  if (!v2)
    return 2149187586;
  v3 = 5.0;
  if (a1 >= 5.0)
    v3 = a1;
  *(double *)(v2 + 24) = v3;
  *(double *)(v2 + 32) = v3 * 0.5;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionCreate(int a1, int a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t Handle;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  int v31;
  uint64_t started;
  uint64_t v33;
  NSObject *v34;
  _BYTE buf[22];
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((GCKSessionCreate_s_fInit & 1) == 0)
  {
    GCKSessionCreate_s_fInit = 1;
    if (a1 == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "GCKSessionCreate";
          v36 = 1024;
          v37 = 6416;
          v12 = " [%s] %s:%d localscopelaunch";
          goto LABEL_10;
        }
      }
    }
    else if (!a1 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "GCKSessionCreate";
        v36 = 1024;
        v37 = 6413;
        v12 = " [%s] %s:%d globalscopelaunch";
LABEL_10:
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
      }
    }
  }
  v14 = (char *)malloc_type_calloc(1uLL, 0x2138uLL, 0x10E004096A975A5uLL);
  if (!v14)
  {
    v16 = 2149187587;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        GCKSessionCreate_cold_1();
    }
    return v16;
  }
  v15 = v14;
  v16 = 2149187587;
  v17 = malloc_type_calloc(1uLL, 0x138uLL, 0x10A00406F2D52ADuLL);
  *((_QWORD *)v15 + 12) = v17;
  if (!v17)
  {
    free(v15);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        GCKSessionCreate_cold_2();
    }
    return v16;
  }
  Handle = CreateHandle();
  if (Handle == 0xFFFFFFFFLL)
  {
    free(v15);
    return 2149187589;
  }
  v19 = (void *)Handle;
  *((_DWORD *)v15 + 27) = a2;
  v20 = (_QWORD *)*((_QWORD *)v15 + 12);
  v20[1] = a3;
  v20[2] = a4;
  v20[3] = 0;
  v20[4] = 0;
  *((_QWORD *)v15 + 10) = 0xFFFFFFFFLL;
  *(_QWORD *)(v15 + 12) = -1;
  *((_QWORD *)v15 + 9) = 0xFFFFFFFFLL;
  *((_DWORD *)v15 + 22) = 0;
  *((_DWORD *)v15 + 26) = a1;
  *(_OWORD *)(v15 + 24) = xmmword_215CDD8C0;
  *((_DWORD *)v15 + 10) = 1;
  pthread_mutex_init((pthread_mutex_t *)(v15 + 7800), 0);
  pthread_rwlock_init((pthread_rwlock_t *)(v15 + 7904), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 8112), 0);
  pthread_cond_init((pthread_cond_t *)(v15 + 8176), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 8232), 0);
  pthread_cond_init((pthread_cond_t *)(*((_QWORD *)v15 + 12) + 112), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((_QWORD *)v15 + 12) + 48), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((_QWORD *)v15 + 12) + 248), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 8328), 0);
  pthread_mutex_init((pthread_mutex_t *)(v15 + 8400), 0);
  v15[8464] = 0;
  *((_QWORD *)v15 + 1060) = 0;
  *((_DWORD *)v15 + 2122) = 0;
  __sprintf_chk(v15 + 125, 0, 0x100uLL, "%08X", a2);
  v15[124] = 8;
  *((_DWORD *)v15 + 29) = a2;
  *((_DWORD *)v15 + 30) = a2;
  *((_DWORD *)v15 + 96) = 0;
  *((_WORD *)v15 + 194) = 0;
  *((_DWORD *)v15 + 98) = 0;
  *((_DWORD *)v15 + 99) = a2;
  *((_DWORD *)v15 + 100) = 0;
  *((_DWORD *)v15 + 28) = 1;
  if (a1 != 1)
  {
    if (a1)
    {
      v16 = 2149187585;
LABEL_50:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCKSessionCreate_cold_3();
      }
      goto LABEL_53;
    }
    if (CheckInHandleDebug())
    {
      GKSConnectivitySettings_GetICETimeout();
      qword_254DFE298 = 0x404E000000000000;
      v16 = ICECreateHandle();
      CheckOutHandleDebug();
    }
    else
    {
      v16 = 2149187586;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "GCKSessionCreate";
        v36 = 1024;
        v37 = 6497;
        v27 = " [%s] %s:%d globalscoperequest";
LABEL_44:
        _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0x1Cu);
        goto LABEL_45;
      }
    }
    goto LABEL_45;
  }
  memset(buf, 170, 16);
  v21 = CheckInHandleDebug();
  if (v21)
  {
    v22 = v21;
    v23 = ICECreateHandle();
    if ((v23 & 0x80000000) != 0)
    {
      v16 = v23;
    }
    else
    {
      v24 = socket(2, 1, 6);
      *(_DWORD *)(v22 + 16) = v24;
      if (v24 != -1)
      {
        *(_QWORD *)buf = 528;
        *(_QWORD *)&buf[8] = 0;
        if (bind(v24, (const sockaddr *)buf, 0x10u) != -1 && listen(*(_DWORD *)(v22 + 16), 2) != -1)
        {
          v16 = 0;
LABEL_40:
          CheckOutHandleDebug();
          goto LABEL_41;
        }
      }
      v16 = *__error() | 0xC01A0000;
    }
    close(*(_DWORD *)(v22 + 16));
    ICECloseHandle();
    goto LABEL_40;
  }
  v16 = 2149187586;
LABEL_41:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "GCKSessionCreate";
      v36 = 1024;
      v37 = 6502;
      v27 = " [%s] %s:%d localscoperequest";
      goto LABEL_44;
    }
  }
LABEL_45:
  if ((v16 & 0x80000000) != 0)
    goto LABEL_50;
  ICECreateHandle();
  v29 = pthread_create((pthread_t *)v15 + 984, 0, (void *(__cdecl *)(void *))gckSessionRecvProc, v19);
  if (v29)
  {
    v16 = v29 | 0xC01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        GCKSessionCreate_cold_6();
    }
LABEL_53:
    GCKSessionRelease();
    return v16;
  }
  v31 = pthread_create((pthread_t *)v15 + 985, 0, (void *(__cdecl *)(void *))gckSessionSendProc, v19);
  if (v31)
  {
    v16 = v31 | 0xC01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        GCKSessionCreate_cold_5();
    }
    goto LABEL_53;
  }
  if (a1 == 1)
  {
    started = StartEventCallbackThread(*((_DWORD **)v15 + 12));
    if ((started & 0x80000000) != 0)
    {
      v16 = started;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCKSessionCreate_cold_4();
      }
      goto LABEL_53;
    }
  }
  *a5 = v19;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "GCKSessionCreate";
      v36 = 1024;
      v37 = 6552;
      v38 = 2080;
      v39 = "Aug  3 2024";
      v40 = 2080;
      v41 = "10:29:55";
      _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionCreate: [GKS: %s - %s] ------", buf, 0x30u);
    }
  }
  if (*((_DWORD *)v15 + 26))
    return 0;
  else
    return gckRegisterForNetworkChanges(v19);
}

uint64_t GCKSessionRelease()
{
  int ErrorLogLevelForModule;
  os_log_t *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  char v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  char v18;
  char v19;
  uint64_t *v20;
  uint64_t i;
  int v22;
  uint64_t v23;
  pthread_rwlock_t *v24;
  int v25;
  uint64_t j;
  int v27;
  char v28;
  char v29;
  uint64_t *v30;
  uint64_t k;
  int v32;
  _opaque_pthread_t *v33;
  _opaque_pthread_t *v34;
  IONotificationPort *v35;
  pthread_rwlock_t *v36;
  char v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  NSObject **v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  int v55;
  int v56;
  _QWORD *v57;
  pthread_mutex_t *v58;
  timeval v59;
  _BYTE buf[12];
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  _BYTE v66[10];
  const char *v67;
  double v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v1 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v2;
      v61 = 2080;
      v62 = "GCKSessionRelease";
      v63 = 1024;
      v64 = 6571;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gcksession-released", buf, 0x1Cu);
    }
  }
  v59 = (timeval)xmmword_215CDD8D0;
  v59.tv_usec = 50000;
  v4 = CheckInHandleDebug();
  if (!v4)
    return 2149187586;
  v5 = v4;
  v6 = *(const void **)(v4 + 8296);
  if (v6)
    CFRelease(v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v7;
      v61 = 2080;
      v62 = "GCKSessionRelease";
      v63 = 1024;
      v64 = 6589;
      v65 = 2080;
      *(_QWORD *)v66 = "Aug  3 2024";
      *(_WORD *)&v66[8] = 2080;
      v67 = "10:29:55";
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionRelease: Disposing all connections... [GKS: %s - %s] ------", buf, 0x30u);
    }
  }
  gckSessionDisposeAllConnections(v5);
  v9 = micro() + 1.0;
  do
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7904));
    v10 = 1;
    while (1)
    {
      v11 = v10;
      v12 = (uint64_t *)((v10 & 1) != 0 ? v5 + 7888 : v5 + 7896);
      v13 = *v12;
      if (*v12)
        break;
LABEL_20:
      v10 = 0;
      if ((v11 & 1) == 0)
      {
        pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7904));
        goto LABEL_25;
      }
    }
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v13 + 664));
      v14 = *(_QWORD *)(v13 + 496);
      if (v14)
        break;
LABEL_19:
      pthread_mutex_unlock((pthread_mutex_t *)(v13 + 664));
      v13 = *(_QWORD *)(v13 + 728);
      if (!v13)
        goto LABEL_20;
    }
    while (*(_BYTE *)v14 != 4)
    {
      v14 = *(_QWORD *)(v14 + 64);
      if (!v14)
        goto LABEL_19;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v13 + 664));
    pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7904));
    select(0, 0, 0, 0, &v59);
  }
  while (micro() < v9);
LABEL_25:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v16;
      v61 = 2080;
      v62 = "GCKSessionRelease";
      v63 = 1024;
      v64 = 6620;
      v65 = 2080;
      *(_QWORD *)v66 = "Aug  3 2024";
      *(_WORD *)&v66[8] = 2080;
      v67 = "10:29:55";
      _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionRelease: Stop ICE connectionchecks... [GKS: %s - %s] ------", buf, 0x30u);
    }
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7904));
  v18 = 1;
  do
  {
    v19 = v18;
    if ((v18 & 1) != 0)
      v20 = (uint64_t *)(v5 + 7888);
    else
      v20 = (uint64_t *)(v5 + 7896);
    for (i = *v20; i; i = *(_QWORD *)(i + 728))
    {
      ICEStopConnectivityCheck();
      ICEStopConnectivityCheck();
    }
    v18 = 0;
  }
  while ((v19 & 1) != 0);
  *(_QWORD *)v5 = 0x100000001;
  v22 = *(_DWORD *)(v5 + 12);
  if (v22 != -1)
  {
    *(_DWORD *)(v5 + 12) = -1;
    close(v22);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7904));
  do
  {
    do
      select(0, 0, 0, 0, &v59);
    while (*(_QWORD *)(v5 + 7880) && !*(_DWORD *)(v5 + 8308));
  }
  while (*(_QWORD *)(v5 + 7872) && !*(_DWORD *)(v5 + 8304));
  CheckOutHandleDebug();
  v23 = CheckInHandleDebug();
  v24 = (pthread_rwlock_t *)(v23 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v23 + 7904));
  v25 = *(_DWORD *)(v23 + 16);
  if (v25 != -1)
  {
    close(v25);
    *(_DWORD *)(v23 + 16) = -1;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 8232));
  for (j = *(_QWORD *)(v23 + 8224); j; j = *(_QWORD *)(j + 16))
  {
    if (*(_DWORD *)j != -1)
      close(*(_DWORD *)j);
    *(_DWORD *)j = -1;
    v27 = *(_DWORD *)(j + 4);
    if (v27 != -1)
      close(v27);
    *(_DWORD *)(j + 4) = -1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8232));
  v28 = 1;
  do
  {
    v29 = v28;
    if ((v28 & 1) != 0)
      v30 = (uint64_t *)(v23 + 7888);
    else
      v30 = (uint64_t *)(v23 + 7896);
    for (k = *v30; k; k = *(_QWORD *)(k + 728))
    {
      ICERemoveOneInterface();
      ICERemoveOneInterface();
      if (*(_DWORD *)k != -1)
      {
        close(*(_DWORD *)k);
        *(_DWORD *)k = -1;
      }
      v32 = *(_DWORD *)(k + 72);
      if (v32 != -1)
      {
        shutdown(v32, 2);
        close(*(_DWORD *)(k + 72));
        *(_DWORD *)(k + 72) = -1;
      }
    }
    v28 = 0;
  }
  while ((v29 & 1) != 0);
  pthread_rwlock_unlock(v24);
  v33 = *(_opaque_pthread_t **)(v23 + 7872);
  if (v33)
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    pthread_join(v33, (void **)buf);
  }
  v34 = *(_opaque_pthread_t **)(v23 + 7880);
  if (v34)
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    pthread_join(v34, (void **)buf);
  }
  if (!*(_DWORD *)(v23 + 104) && *(_DWORD *)(v23 + 8320))
    *(_DWORD *)(v23 + 8320) = 0;
  CheckOutHandleDebug();
  StopEventCallbackThread(*(_QWORD *)(v23 + 96));
  *(_QWORD *)(v23 + 96) = 0;
  if (!*(_DWORD *)(v23 + 104))
  {
    v35 = *(IONotificationPort **)(v23 + 8312);
    if (v35)
    {
      IONotificationPortDestroy(v35);
      *(_QWORD *)(v23 + 8312) = 0;
    }
  }
  ICECloseHandle();
  ICECloseHandle();
  v36 = (pthread_rwlock_t *)(v23 + 7904);
  pthread_rwlock_wrlock(v24);
  v37 = 1;
  do
  {
    v38 = v37;
    if ((v37 & 1) != 0)
      v39 = (uint64_t *)(v23 + 7888);
    else
      v39 = (uint64_t *)(v23 + 7896);
    v40 = *v39;
    if (*v39)
    {
      do
      {
        v41 = *(_QWORD *)(v40 + 728);
        pthread_mutex_lock((pthread_mutex_t *)(v40 + 664));
        v42 = *(_QWORD **)(v40 + 496);
        if (v42)
        {
          do
          {
            v43 = (_QWORD *)v42[8];
            v44 = (void *)v42[5];
            if (v44)
              free(v44);
            free(v42);
            v42 = v43;
          }
          while (v43);
        }
        freeOptionsList((uint64_t *)(v40 + 512));
        freeOptionsList((uint64_t *)(v40 + 520));
        pthread_mutex_unlock((pthread_mutex_t *)(v40 + 664));
        pthread_mutex_destroy((pthread_mutex_t *)(v40 + 664));
        BWE_CloseObject(v40);
        free((void *)v40);
        v40 = v41;
      }
      while (v41);
    }
    v37 = 0;
  }
  while ((v38 & 1) != 0);
  pthread_rwlock_unlock(v36);
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 8112));
  v45 = *(_QWORD **)(v23 + 8104);
  if (v45)
  {
    do
    {
      v46 = (_QWORD *)v45[525];
      free(v45);
      v45 = v46;
    }
    while (v46);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8112));
  v58 = (pthread_mutex_t *)(v23 + 8232);
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 8232));
  v47 = *(_QWORD **)(v23 + 8224);
  v48 = (NSObject **)MEMORY[0x24BDFDC28];
  if (v47)
  {
    do
    {
      v49 = (_QWORD *)v47[2];
      free(v47);
      v47 = v49;
    }
    while (v49);
  }
  pthread_mutex_unlock(v58);
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 8328));
  while (1)
  {
    v50 = *(_QWORD **)(v23 + 8392);
    if (!v50)
      break;
    *(_QWORD *)(v23 + 8392) = v50[18];
    free(v50);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8328));
  pthread_mutex_destroy((pthread_mutex_t *)(v23 + 8328));
  pthread_mutex_destroy((pthread_mutex_t *)(v23 + 7800));
  pthread_rwlock_destroy(v36);
  pthread_mutex_destroy((pthread_mutex_t *)(v23 + 8112));
  pthread_cond_destroy((pthread_cond_t *)(v23 + 8176));
  pthread_mutex_destroy(v58);
  pthread_mutex_destroy((pthread_mutex_t *)(v23 + 8400));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v51 = VRTraceErrorLogLevelToCSTR();
    v52 = *v48;
    v53 = *v48;
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = *(_DWORD *)(v23 + 8484);
        v55 = *(_DWORD *)(v23 + 8488);
        v56 = *(_DWORD *)(v23 + 8480);
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v51;
        v61 = 2080;
        v62 = "GCKSessionRelease";
        v63 = 1024;
        v64 = 6792;
        v65 = 1024;
        *(_DWORD *)v66 = v54;
        *(_WORD *)&v66[4] = 1024;
        *(_DWORD *)&v66[6] = v55;
        LOWORD(v67) = 1024;
        *(_DWORD *)((char *)&v67 + 2) = v56;
        HIWORD(v67) = 2048;
        v68 = (double)(v55 + v54) / (double)v56;
        _os_log_impl(&dword_215C5C000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionRelease: InterruptedSeqCount_byBWESeqPkts/InterruptedSeqCount_byRegularPkts/iTotalRecvdBWESeqCount: %d/%d/%d (interrupted seq ratio: %f) ", buf, 0x38u);
      }
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      GCKSessionRelease_cold_1();
    }
  }
  while (1)
  {
    v57 = *(_QWORD **)(v23 + 8496);
    if (!v57)
      break;
    *(_QWORD *)(v23 + 8496) = v57[7];
    free(v57);
  }
  free((void *)v23);
  return 0;
}

uint64_t gckSessionSendUDPPacket(uint64_t a1, uint64_t a2, _WORD *a3, uint64_t a4, int *a5, __int128 *a6)
{
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];
  _BYTE v40[22];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = CheckInHandleDebug();
  if (v10)
  {
    v11 = v10;
    *(_QWORD *)&v40[14] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39[3] = v12;
    *(_OWORD *)v40 = v12;
    v39[2] = v12;
    *(_QWORD *)((char *)v39 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v38 = v12;
    v39[0] = v12;
    v37 = v12;
    if (a5 && a6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v28 = v13;
          v29 = 2080;
          v30 = "gckSessionSendUDPPacket";
          v31 = 1024;
          v32 = 704;
          v33 = 2080;
          v34 = IPPORTToStringWithSize();
          v35 = 2080;
          v36 = IPPORTToStringWithSize();
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d send udp packet from %s to %s ...", buf, 0x30u);
        }
      }
    }
    else
    {
      if (!a6)
      {
        v15 = 0;
LABEL_19:
        CheckOutHandleDebug();
        return v15;
      }
      if (!a5)
      {
        v22 = a6[1];
        v24 = *a6;
        v25 = v22;
        v26 = *((_QWORD *)a6 + 4);
LABEL_18:
        v15 = SendUDPPacket(v11, a3, a4, (uint64_t)a5, (uint64_t)&v24);
        goto LABEL_19;
      }
    }
    v16 = *a5;
    v17 = a6[1];
    v24 = *a6;
    v25 = v17;
    v26 = *((_QWORD *)a6 + 4);
    if ((v16 & 1) != 0 && (*(_BYTE *)a6 & 1) == 0)
    {
      if (*(_DWORD *)GCKGetNAT64Prefix(v11, (uint64_t)a5))
      {
        synthesizeIPPORTv6FromIPv4();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v20 = IPPORTToStringWithSize();
            v21 = IPPORTToStringWithSize();
            *(_DWORD *)buf = 136316162;
            v28 = v18;
            v29 = 2080;
            v30 = "gckSessionSendUDPPacket";
            v31 = 1024;
            v32 = 717;
            v33 = 2080;
            v34 = v20;
            v35 = 2080;
            v36 = v21;
            _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionSendUDPPacket: NAT64 adjustment caused changing destination addres. Will send udp packet from %s to %s ...", buf, 0x30u);
          }
        }
      }
    }
    goto LABEL_18;
  }
  return 2149187586;
}

uint64_t gckSessionRecvUDPPacketWithTimeout(uint64_t a1, int a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, _QWORD *a7, int a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t *v19;
  double v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  double v26;
  __darwin_time_t v27;
  uint64_t v28;
  int v29;
  int v30;
  size_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD *v37;
  timespec v38;

  v15 = 2149187614;
  v16 = CheckInHandleDebug();
  if (!v16)
    return 2149187586;
  v17 = v16;
  v18 = micro();
  pthread_mutex_lock((pthread_mutex_t *)(v17 + 8112));
  if (*(_DWORD *)(v17 + 8))
  {
LABEL_3:
    v15 = 0;
LABEL_4:
    *(_DWORD *)(v17 + 8) = 0;
  }
  else
  {
    v37 = a7;
    v19 = (uint64_t *)(v17 + 8104);
    v20 = (double)a8 / 1000.0;
    while (1)
    {
      v21 = *v19;
      if (*v19)
        break;
LABEL_20:
      v26 = v20 - (micro() - v18);
      if (v26 < 0.0)
        goto LABEL_3;
      v38.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v38.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      convertTimeoutToRelativeTimespec(v26);
      v38.tv_sec = v27;
      v38.tv_nsec = v28;
      v29 = pthread_cond_timedwait_relative_np((pthread_cond_t *)(v17 + 8176), (pthread_mutex_t *)(v17 + 8112), &v38);
      if (v29)
      {
        if (v29 == 60)
          v15 = 2149187607;
        else
          v15 = v29 | 0xC01A0000;
        goto LABEL_4;
      }
      v30 = *(_DWORD *)(v17 + 8);
      if (*(_DWORD *)v17)
      {
        if (v30)
          v15 = 2149187614;
        else
          v15 = 0;
        goto LABEL_4;
      }
      if (v30)
        goto LABEL_4;
    }
    if (a2)
      v22 = *(_DWORD *)(v17 + 48) == 0;
    else
      v22 = 0;
    v23 = !v22;
    v24 = (uint64_t *)(v17 + 8104);
    v25 = *v19;
    if (v22)
    {
      while (*(_DWORD *)(v25 + 4104) != a2)
      {
        if (!*(_QWORD *)(v25 + 4200))
          goto LABEL_20;
        v24 = (uint64_t *)(v25 + 4200);
        v25 = *(_QWORD *)(v25 + 4200);
        if ((v23 & 1) != 0)
          goto LABEL_26;
      }
      v21 = v25;
      v19 = v24;
    }
LABEL_26:
    v31 = *(int *)(v21 + 4100);
    *a4 = v31;
    memcpy(a3, (const void *)v21, v31);
    v32 = *(_QWORD *)(v21 + 4140);
    v33 = *(_OWORD *)(v21 + 4124);
    *(_OWORD *)a5 = *(_OWORD *)(v21 + 4108);
    *(_OWORD *)(a5 + 16) = v33;
    *(_QWORD *)(a5 + 32) = v32;
    v35 = *(_OWORD *)(v21 + 4148);
    v34 = *(_OWORD *)(v21 + 4164);
    *(_QWORD *)(a6 + 32) = *(_QWORD *)(v21 + 4180);
    *(_OWORD *)a6 = v35;
    *(_OWORD *)(a6 + 16) = v34;
    if (v37)
      *v37 = *(_QWORD *)(v21 + 4192);
    *v19 = *(_QWORD *)(v21 + 4200);
    free((void *)v21);
    v15 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v17 + 8112));
  CheckOutHandleDebug();
  return v15;
}

uint64_t gckSessionReconnectedCallback(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSObject *v16;
  pthread_rwlock_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int ErrorLogLevelForModule;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[22];
  __int128 v71;
  __int128 v72;
  _OWORD v73[4];
  _OWORD v74[4];
  _BYTE v75[22];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v49 = v5;
  if (a3)
  {
    *(_QWORD *)&v75[14] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v74[3] = v6;
    *(_OWORD *)v75 = v6;
    v74[2] = v6;
    *(_QWORD *)((char *)v74 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v73[3] = v6;
    v74[0] = v6;
    v73[2] = v6;
    *(_QWORD *)((char *)v73 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v72 = v6;
    v73[0] = v6;
    v71 = v6;
    *(_QWORD *)&v70[14] = 0xAAAAAAAAAAAAAAAALL;
    v69 = v6;
    *(_OWORD *)v70 = v6;
    v68 = v6;
    while (1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_DWORD *)(a3 + 16);
          v10 = IPPORTToStringWithSize();
          v11 = IPPORTToStringWithSize();
          v12 = IPPORTToStringWithSize();
          v13 = IPPORTToStringWithSize();
          *(_DWORD *)buf = 136317186;
          v51 = v7;
          v52 = 2080;
          v53 = "gckSessionReconnectedCallback";
          v54 = 1024;
          v55 = 6137;
          v56 = 1024;
          v57 = a2;
          v58 = 1024;
          v59 = v9;
          v60 = 2080;
          v61 = v10;
          v62 = 2080;
          v63 = v11;
          v64 = 2080;
          v65 = v12;
          v66 = 2080;
          v67 = v13;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RETRY ICE check succeeded with %08X: proto %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x50u);
        }
      }
      if (*(_DWORD *)(a3 + 16) == 6 && *(_DWORD *)a3 == a2)
        break;
      a3 = *(_QWORD *)(a3 + 304);
      if (!a3)
        goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v51 = v15;
        v52 = 2080;
        v53 = "gckSessionReconnectedCallback";
        v54 = 1024;
        v55 = 6140;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d PROTO_GCK found!", buf, 0x1Cu);
      }
    }
    gckSessionSetupChannelCList(v49, a2, a3);
    if (!*(_DWORD *)(v49 + 104))
      gckSessionAddNode(v49, a2, 255);
    v17 = (pthread_rwlock_t *)(v49 + 7904);
    v18 = a3;
    do
    {
      if (*(_DWORD *)(v18 + 16) == 6 && *(_DWORD *)v18 == a2)
      {
        v19 = *(_DWORD *)(v18 + 312);
        if ((v19 & 0x80000000) == 0)
        {
          pthread_rwlock_rdlock((pthread_rwlock_t *)(v49 + 7904));
          v20 = *(_QWORD *)(v49 + 7888);
          if (v20)
          {
            while (*(_DWORD *)(v20 + 116) != a2 || v19 != *(_DWORD *)(v20 + 100))
            {
              v20 = *(_QWORD *)(v20 + 728);
              if (!v20)
                goto LABEL_28;
            }
            if (!*(_DWORD *)(v20 + 108))
              gckSessionUpdateNode(v49, a2, *(_DWORD *)(a3 + 268), 0);
          }
LABEL_28:
          pthread_rwlock_unlock((pthread_rwlock_t *)(v49 + 7904));
        }
      }
      v18 = *(_QWORD *)(v18 + 304);
    }
    while (v18);
    gckSessionChangeState(v49, a2, 8);
    do
    {
      if (*(_DWORD *)(a3 + 16) != 6 || *(_DWORD *)a3 != a2)
        goto LABEL_68;
      v21 = *(_DWORD *)(a3 + 312);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v21 < 0)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v30 = *(_DWORD *)a3;
            *(_DWORD *)buf = 136316162;
            v51 = v28;
            v52 = 2080;
            v53 = "gckSessionReconnectedCallback";
            v54 = 1024;
            v55 = 6230;
            v56 = 1024;
            v57 = a2;
            v58 = 1024;
            v59 = v30;
            _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IGNORING FIRST HELLO TO %08X ON CHANNEL %d...", buf, 0x28u);
          }
        }
        goto LABEL_68;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v51 = v23;
          v52 = 2080;
          v53 = "gckSessionReconnectedCallback";
          v54 = 1024;
          v55 = 6189;
          v56 = 1024;
          v57 = a2;
          v58 = 1024;
          v59 = v21;
          _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CONNECTED TO %08X ON CHANNEL %d...", buf, 0x28u);
        }
      }
      v25 = *(_DWORD *)(a3 + 28);
      v26 = v49;
      if ((v25 & 8) != 0 && (v25 & 4) == 0 && (*(_DWORD *)(a3 + 68) & 0xC) == 8)
      {
        pthread_rwlock_rdlock(v17);
        v27 = *(_QWORD *)(v49 + 7888);
        if (v27)
        {
          while (*(_DWORD *)(v27 + 116) != a2 || v21 != *(_DWORD *)(v27 + 100))
          {
            v27 = *(_QWORD *)(v27 + 728);
            if (!v27)
              goto LABEL_52;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v31 = VRTraceErrorLogLevelToCSTR();
            v32 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v51 = v31;
              v52 = 2080;
              v53 = "gckSessionReconnectedCallback";
              v54 = 1024;
              v55 = 6202;
              v56 = 1024;
              v57 = v21;
              _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d QUICK DISCONNECT ENABLED ON CHANNEL %d...", buf, 0x22u);
            }
          }
          *(_QWORD *)(v27 + 392) = 0x4025FAE147AE147BLL;
          v26 = v49;
        }
LABEL_52:
        pthread_rwlock_unlock(v17);
      }
      v33 = *(_DWORD *)(v26 + 108);
      v34 = VRTraceGetErrorLogLevelForModule();
      if (v33 >= a2)
      {
        if (v34 >= 7)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v51 = v43;
            v52 = 2080;
            v53 = "gckSessionReconnectedCallback";
            v54 = 1024;
            v55 = 6221;
            v56 = 1024;
            v57 = a2;
            v58 = 1024;
            v59 = v21;
            _os_log_impl(&dword_215C5C000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WAITING FIRST HELLO TO %08X ON CHANNEL %d...", buf, 0x28u);
          }
        }
        v45 = gckSessionWaitForHello(v49, a2, v21);
        if ((v45 & 0x80000000) == 0)
          goto LABEL_68;
        v46 = v45;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_67;
        v47 = VRTraceErrorLogLevelToCSTR();
        v48 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        *(_DWORD *)buf = 136316162;
        v51 = v47;
        v52 = 2080;
        v53 = "gckSessionReconnectedCallback";
        v54 = 1024;
        v55 = 6225;
        v56 = 1024;
        v57 = 6225;
        v58 = 1024;
        v59 = v46;
        v41 = v48;
        v42 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSe"
              "ssion.c:%d: gckSessionWaitForHello failed(%X)";
      }
      else
      {
        if (v34 >= 7)
        {
          v35 = VRTraceErrorLogLevelToCSTR();
          v36 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v51 = v35;
            v52 = 2080;
            v53 = "gckSessionReconnectedCallback";
            v54 = 1024;
            v55 = 6213;
            v56 = 1024;
            v57 = a2;
            v58 = 1024;
            v59 = v21;
            _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SENDING FIRST HELLO TO %08X ON CHANNEL %d...", buf, 0x28u);
          }
        }
        v37 = gckSessionSendHello(v49, a2, 1, 1, (int)*(double *)(v49 + 24), v21);
        if ((v37 & 0x80000000) == 0)
          goto LABEL_68;
        v38 = v37;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_67;
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        *(_DWORD *)buf = 136316162;
        v51 = v39;
        v52 = 2080;
        v53 = "gckSessionReconnectedCallback";
        v54 = 1024;
        v55 = 6217;
        v56 = 1024;
        v57 = 6217;
        v58 = 1024;
        v59 = v38;
        v41 = v40;
        v42 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSe"
              "ssion.c:%d: gckSessionSendHello failed(%X)";
      }
      _os_log_error_impl(&dword_215C5C000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0x28u);
LABEL_67:
      gckSessionChangeState(v49, a2, 5);
LABEL_68:
      a3 = *(_QWORD *)(a3 + 304);
    }
    while (a3);
  }
LABEL_10:
  gckSessionCheckPendingConnections(v49, 1);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionCancelRecvUDP()
{
  uint64_t v0;
  uint64_t v1;
  pthread_mutex_t *v2;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  v1 = v0;
  v2 = (pthread_mutex_t *)(v0 + 8112);
  pthread_mutex_lock((pthread_mutex_t *)(v0 + 8112));
  *(_DWORD *)(v1 + 8) = 1;
  pthread_cond_signal((pthread_cond_t *)(v1 + 8176));
  pthread_mutex_unlock(v2);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionRecvProc(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  NSObject *global_queue;
  NSObject *v7;
  uint64_t v8;
  os_log_t *v9;
  const double *v10;
  float64x2_t v11;
  uint64_t v12;
  double v13;
  int v14;
  double v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int ErrorLogLevelForModule;
  uint64_t v30;
  NSObject *v31;
  uint64_t i;
  __int128 v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  unsigned __int8 *j;
  uint64_t v41;
  NSObject *v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _QWORD *v50;
  _BYTE *v51;
  _WORD *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  os_log_t v56;
  NSObject *v57;
  double v58;
  uint32_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  double v68;
  uint64_t v69;
  os_log_t v70;
  int v71;
  int v72;
  int v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  os_log_t v81;
  int v82;
  int v83;
  int v84;
  uint64_t v85;
  os_log_t v86;
  int v87;
  int v88;
  int v89;
  double v90;
  double v91;
  uint64_t v92;
  NSObject *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  os_log_t v99;
  int v100;
  int v101;
  int v102;
  uint64_t v103;
  int v104;
  void *v105;
  double v106;
  double v107;
  uint64_t v108;
  os_log_t v109;
  double v110;
  unsigned __int8 *v111;
  unsigned __int8 *v112;
  int v113;
  BOOL v114;
  unsigned __int8 *v115;
  void *v116;
  uint64_t v117;
  NSObject *v118;
  int v119;
  float64x2_t v120;
  uint64_t v121;
  NSObject *v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  unint64_t v128;
  int v129;
  double v130;
  double v131;
  BOOL v132;
  double v133;
  uint64_t v134;
  int v135;
  unsigned int v136;
  float v137;
  double v138;
  BOOL v139;
  float v140;
  float v141;
  uint64_t v142;
  unsigned int v143;
  int v144;
  char *v145;
  __int128 v146;
  int v147;
  uint64_t v148;
  NSObject *v149;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  NSObject *v154;
  int v155;
  float v156;
  double v157;
  uint64_t v159;
  char *v160;
  char *v161;
  _QWORD *v162;
  _QWORD *v163;
  uint64_t *v164;
  uint64_t v165;
  _BYTE *v166;
  _DWORD *v167;
  _DWORD *v168;
  _QWORD *v169;
  _QWORD *v170;
  uint64_t *v171;
  uint64_t v172;
  _BYTE *v173;
  double v174;
  double v175;
  int v177;
  int v178;
  float64x2_t v179;
  double v180;
  dispatch_time_t v181;
  int v182;
  double v183;
  double v184;
  unint64_t v185;
  uint64_t v186;
  NSObject *v187;
  unint64_t v188;
  int v189;
  int v190;
  __int128 v191;
  uint64_t v192;
  NSObject *v193;
  uint64_t v194;
  _DWORD *v195;
  int v196;
  uint64_t v197;
  int v198;
  int v199;
  uint64_t v200;
  NSObject *v201;
  int v202;
  char **k;
  char *v204;
  char ***v205;
  char ***v206;
  char **v207;
  unint64_t v208;
  double v209;
  NSObject *v210;
  signed int v211;
  int v212;
  uint64_t v213;
  NSObject *v214;
  float64_t v216;
  uint64_t v217;
  NSObject *source;
  double v219;
  pthread_rwlock_t *v220;
  pthread_mutex_t *v221;
  uint64_t *v222;
  double v223;
  uint64_t *v224;
  unsigned __int8 **v225;
  double *v226;
  int v227;
  pthread_mutex_t *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  _QWORD *v232;
  uint64_t v233;
  pthread_t v234;
  socklen_t v235;
  _QWORD handler[9];
  fd_set v237;
  sockaddr v238;
  uint8_t v239[4];
  uint64_t v240;
  __int16 v241;
  const char *v242;
  __int16 v243;
  int v244;
  __int16 v245;
  _BYTE v246[10];
  XDR v247;
  __int128 v248;
  __int128 v249;
  _OWORD v250[8];
  pthread_attr_t buf;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  uint64_t v257;
  uint64_t v258;

  v258 = *MEMORY[0x24BDAC8D0];
  v2 = -2145779708;
  memset(&handler[5], 170, 32);
  pthread_setname_np("com.apple.gamekitservices.gcksession.recvproc");
  v3 = CheckInHandleDebug();
  if (!v3)
    return -2145779710;
  v4 = v3;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v237.fds_bits[24] = v5;
  *(_OWORD *)&v237.fds_bits[28] = v5;
  *(_OWORD *)&v237.fds_bits[16] = v5;
  *(_OWORD *)&v237.fds_bits[20] = v5;
  *(_OWORD *)&v237.fds_bits[12] = v5;
  *(_OWORD *)&v237.fds_bits[4] = v5;
  *(_OWORD *)&v237.fds_bits[8] = v5;
  *(_OWORD *)v237.fds_bits = v5;
  global_queue = dispatch_get_global_queue(2, 0);
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, global_queue);
  if (v7)
  {
    v217 = a1;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __gckSessionRecvProc_block_invoke;
    handler[3] = &__block_descriptor_tmp_39;
    handler[4] = v4;
    source = v7;
    dispatch_source_set_event_handler(v7, handler);
    v8 = 0;
    v221 = (pthread_mutex_t *)(v4 + 7800);
    v219 = micro() + 30.0;
    v220 = (pthread_rwlock_t *)(v4 + 7904);
    v222 = (uint64_t *)(v4 + 7888);
    v9 = (os_log_t *)MEMORY[0x24BDFDC28];
    v10 = (const double *)&qword_215CDD880;
    v11 = vld1q_dup_f64(v10);
    v216 = v11.f64[1];
    while (1)
    {
      if ((int)*MEMORY[0x24BDFDC10] >= 7)
      {
        v209 = micro();
        if (v209 - *(double *)(v4 + 7864) > 15.0)
        {
          pthread_mutex_lock(v221);
          *(double *)(v4 + 7864) = v209;
          TracePrintNodesX(*(_DWORD *)(v4 + 112), v4 + 116);
          pthread_mutex_unlock(v221);
        }
      }
      memset(&v237, 0, sizeof(v237));
      v12 = *(_QWORD *)(v4 + 96);
      v13 = micro();
      ServiceWaitEventCallbacks(v12, v13);
      pthread_rwlock_wrlock(v220);
      if (*(_DWORD *)v4)
      {
        v211 = v8;
        pthread_rwlock_unlock(v220);
        goto LABEL_333;
      }
      if (*(_DWORD *)(v4 + 12) == -1)
      {
        v14 = socket(2, 1, 6);
        *(_DWORD *)(v4 + 12) = v14;
        if (v14 == -1)
        {
          v211 = *__error() | 0xC01A0000;
          v210 = source;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
              gckSessionRecvProc_cold_2();
          }
          pthread_rwlock_unlock(v220);
          goto LABEL_341;
        }
      }
      v15 = micro();
      if (v15 >= v219)
        break;
      v16 = *(_DWORD *)(v4 + 12);
      if (__darwin_check_fd_set_overflow(v16, &v237, 0))
        *(__int32_t *)((char *)v237.fds_bits + (((unint64_t)v16 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v16;
      v17 = *(_DWORD *)(v4 + 12);
      v18 = *(int *)(v4 + 16);
      if ((_DWORD)v18 != -1)
      {
        if (__darwin_check_fd_set_overflow(*(_DWORD *)(v4 + 16), &v237, 0))
          *(__int32_t *)((char *)v237.fds_bits + ((v18 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v18;
        if (*(_DWORD *)(v4 + 16) > v17)
          v17 = *(_DWORD *)(v4 + 16);
      }
      v227 = v17;
      v19 = *v222;
      if (*v222)
      {
        v223 = v15 + 0.015;
        v20 = v15 + 0.5;
        v21 = v219;
        v22 = (uint64_t *)(v4 + 7888);
        while (1)
        {
          v224 = v22;
          v228 = (pthread_mutex_t *)(v19 + 664);
          v229 = v8;
          pthread_mutex_lock((pthread_mutex_t *)(v19 + 664));
          if ((*(_BYTE *)(v19 + 56) & 2) != 0 && (*(_DWORD *)(v19 + 108) & 0x80000000) == 0)
          {
            v23 = *(_QWORD *)(v19 + 496);
            if (!v23)
              goto LABEL_33;
            v24 = 0;
            v25 = (_QWORD *)(v19 + 496);
            do
            {
              if (*(_BYTE *)v23 == 8)
              {
                if (v24)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v26 = VRTraceErrorLogLevelToCSTR();
                    v27 = *MEMORY[0x24BDFDC28];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf.__sig) = 136315650;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v26;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 4621;
                      _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d removing duplicate heartbeat", (uint8_t *)&buf, 0x1Cu);
                    }
                  }
                  free(*(void **)(v24 + 40));
                  free((void *)v24);
                }
                v28 = *(_QWORD *)(v23 + 64);
                *v25 = v28;
                v24 = v23;
              }
              else
              {
                v28 = *(_QWORD *)(v23 + 64);
                v25 = (_QWORD *)(v23 + 64);
              }
              v23 = v28;
            }
            while (v28);
            if (v24)
            {
              *v25 = v24;
              *(_QWORD *)(v24 + 64) = 0;
              v9 = (os_log_t *)MEMORY[0x24BDFDC28];
            }
            else
            {
LABEL_33:
              ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
              v9 = (os_log_t *)MEMORY[0x24BDFDC28];
              if (ErrorLogLevelForModule >= 3)
              {
                v30 = VRTraceErrorLogLevelToCSTR();
                v31 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                {
                  v177 = *(_DWORD *)(v19 + 116);
                  v178 = *(_DWORD *)(v19 + 100);
                  LODWORD(buf.__sig) = 136316162;
                  *(uint64_t *)((char *)&buf.__sig + 4) = v30;
                  *(_WORD *)&buf.__opaque[4] = 2080;
                  *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                  *(_WORD *)&buf.__opaque[14] = 1024;
                  *(_DWORD *)&buf.__opaque[16] = 4635;
                  *(_WORD *)&buf.__opaque[20] = 1024;
                  *(_DWORD *)&buf.__opaque[22] = v177;
                  *(_WORD *)&buf.__opaque[26] = 1024;
                  *(_DWORD *)&buf.__opaque[28] = v178;
                  _os_log_error_impl(&dword_215C5C000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d Expected heartbeat in the retry list not found for participant [%08X] channel [%d]", (uint8_t *)&buf, 0x28u);
                }
              }
              for (i = *v222; i; i = *(_QWORD *)(i + 728))
              {
                *(_QWORD *)((char *)v250 + 14) = 0xAAAAAAAAAAAAAAAALL;
                *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v249 = v33;
                v250[0] = v33;
                v248 = v33;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v34 = VRTraceErrorLogLevelToCSTR();
                  v35 = *v9;
                  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                  {
                    v36 = *(_DWORD *)(i + 116);
                    v38 = *(_DWORD *)(i + 88);
                    v37 = *(_DWORD *)(i + 92);
                    v39 = IPPORTToStringWithSize();
                    LODWORD(buf.__sig) = 136316674;
                    *(uint64_t *)((char *)&buf.__sig + 4) = v34;
                    *(_WORD *)&buf.__opaque[4] = 2080;
                    *(_QWORD *)&buf.__opaque[6] = "gckSessionPrintRetryLists";
                    *(_WORD *)&buf.__opaque[14] = 1024;
                    *(_DWORD *)&buf.__opaque[16] = 4507;
                    *(_WORD *)&buf.__opaque[20] = 1024;
                    *(_DWORD *)&buf.__opaque[22] = v36;
                    *(_WORD *)&buf.__opaque[26] = 1024;
                    *(_DWORD *)&buf.__opaque[28] = v38;
                    v9 = (os_log_t *)MEMORY[0x24BDFDC28];
                    *(_WORD *)&buf.__opaque[32] = 1024;
                    *(_DWORD *)&buf.__opaque[34] = v37;
                    *(_WORD *)&buf.__opaque[38] = 2080;
                    *(_QWORD *)&buf.__opaque[40] = v39;
                    _os_log_impl(&dword_215C5C000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant %08X: sentDD [%d], receivedDD [%d] address [%s]", (uint8_t *)&buf, 0x38u);
                  }
                }
                for (j = *(unsigned __int8 **)(i + 496); j; j = (unsigned __int8 *)*((_QWORD *)j + 8))
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v41 = VRTraceErrorLogLevelToCSTR();
                    v42 = *v9;
                    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    {
                      v43 = *j;
                      v44 = *((double *)j + 1);
                      v45 = *((double *)j + 2);
                      if (v44 == 0.0)
                        v46 = 0.0;
                      else
                        v46 = v15 - v44;
                      if (v45 == 0.0)
                        v47 = 0.0;
                      else
                        v47 = v45 - v15;
                      v48 = *((double *)j + 4);
                      v114 = v48 == 0.0;
                      v49 = v48 - v15;
                      if (v114)
                        v49 = 0.0;
                      LODWORD(buf.__sig) = 136316674;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v41;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionPrintRetryLists";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 4514;
                      *(_WORD *)&buf.__opaque[20] = 1024;
                      *(_DWORD *)&buf.__opaque[22] = v43;
                      *(_WORD *)&buf.__opaque[26] = 2048;
                      *(double *)&buf.__opaque[28] = v46;
                      *(_WORD *)&buf.__opaque[36] = 2048;
                      *(double *)&buf.__opaque[38] = v47;
                      *(_WORD *)&buf.__opaque[46] = 2048;
                      *(double *)&buf.__opaque[48] = v49;
                      _os_log_impl(&dword_215C5C000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d     WairFor [%d] timerAdd [%.1lf] nextFire [%.1lf] waitUntil [%.1lf]", (uint8_t *)&buf, 0x40u);
                    }
                  }
                }
              }
            }
          }
          v50 = (_QWORD *)(v19 + 496);
          v51 = *(_BYTE **)(v19 + 496);
          v225 = (unsigned __int8 **)(v19 + 496);
          if (v51)
          {
            v232 = (_QWORD *)(v19 + 544);
            v8 = v229;
            while (1)
            {
              if (*((double *)v51 + 2) == 0.0)
              {
                v52 = (_WORD *)*((_QWORD *)v51 + 5);
                if (v52)
                {
                  v53 = SendUDPPacketCList(v4, v19, v52, *((unsigned int *)v51 + 12), 0, 1);
                  v8 = v53;
                  if ((v53 & 0x80000000) != 0 && (_DWORD)v53 != -1072037876)
                  {
                    v54 = *v51;
                    if (v54 != 8 && v54 != 1 || !*(_DWORD *)(v19 + 108))
                    {
                      *v50 = *((_QWORD *)v51 + 8);
                      free(*((void **)v51 + 5));
                      free(v51);
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        v55 = VRTraceErrorLogLevelToCSTR();
                        v56 = *v9;
                        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(buf.__sig) = 136316162;
                          *(uint64_t *)((char *)&buf.__sig + 4) = v55;
                          *(_WORD *)&buf.__opaque[4] = 2080;
                          *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                          *(_WORD *)&buf.__opaque[14] = 1024;
                          *(_DWORD *)&buf.__opaque[16] = 4666;
                          *(_WORD *)&buf.__opaque[20] = 1024;
                          *(_DWORD *)&buf.__opaque[22] = 4666;
                          *(_WORD *)&buf.__opaque[26] = 1024;
                          *(_DWORD *)&buf.__opaque[28] = v8;
                          v57 = v56;
LABEL_143:
                          _os_log_error_impl(&dword_215C5C000, v57, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: SendUDPPacketCList failed(%X)", (uint8_t *)&buf, 0x28u);
                        }
                      }
LABEL_144:
                      gckSessionChangeStateCList(v4, v19, 5);
                      goto LABEL_138;
                    }
                    *(_DWORD *)(v19 + 108) = -1;
                    *v232 = 0;
                    *(_QWORD *)(v19 + 552) = 0;
                  }
                  if ((_DWORD)v53 == -1072037876)
                  {
                    *((double *)v51 + 4) = v15 + *((double *)v51 + 4) - *((double *)v51 + 2) + 0.5;
                    *((double *)v51 + 2) = v20;
                    v8 = 3222929420;
                  }
                  else if (*v51 == 1 && *((_DWORD *)v51 + 6))
                  {
                    *((double *)v51 + 2) = v223 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
                    *((double *)v51 + 4) = v15 + *((double *)v51 + 4);
                    --*((_DWORD *)v51 + 6);
                  }
                  else
                  {
                    *((_DWORD *)v51 + 6) = 0;
                    v58 = v15 + *((double *)v51 + 1);
                    v59 = arc4random();
                    *((double *)v51 + 4) = v15 + *((double *)v51 + 4);
                    v60 = *((double *)v51 + 1) + *((double *)v51 + 1);
                    *((double *)v51 + 1) = v60;
                    *((double *)v51 + 2) = v58 + (double)(v59 & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
                    if (v60 > 1.0)
                      *((double *)v51 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
                  }
                }
              }
              if (*v51 == 1 && !*((_QWORD *)v51 + 5) && v15 >= *((double *)v51 + 4))
              {
                v61 = *(double *)(v19 + 32);
                v62 = *(double *)(v19 + 384);
                if (v15 - v61 < v62)
                {
                  *((_QWORD *)v51 + 1) = 0x3FB0A3D70A3D70A4;
                  v63 = v61 + v62;
                  *((double *)v51 + 4) = v63;
                  *((double *)v51 + 2) = v63;
                }
              }
              if (v15 >= *((double *)v51 + 4))
              {
                v64 = *(double *)(v19 + 760);
                if (v64 == 0.0)
                {
                  v65 = v8;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v66 = VRTraceErrorLogLevelToCSTR();
                    v67 = *v9;
                    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf.__sig) = 136316418;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v66;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 4702;
                      *(_WORD *)&buf.__opaque[20] = 2048;
                      *(_QWORD *)&buf.__opaque[22] = v4;
                      *(_WORD *)&buf.__opaque[30] = 2048;
                      *(_QWORD *)&buf.__opaque[32] = v19;
                      *(_WORD *)&buf.__opaque[40] = 2048;
                      *(_QWORD *)&buf.__opaque[42] = v51;
                      _os_log_impl(&dword_215C5C000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timeout verification initiated for pGCKSession=%08lX, pClist=%08lX, pRetry=%08lX", (uint8_t *)&buf, 0x3Au);
                    }
                  }
                  *(double *)(v19 + 760) = v15 + 0.2;
                  v8 = v65;
                }
                else if (v15 >= v64)
                {
                  v76 = v8;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v77 = VRTraceErrorLogLevelToCSTR();
                    v78 = *v9;
                    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf.__sig) = 136316418;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v77;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 4706;
                      *(_WORD *)&buf.__opaque[20] = 2048;
                      *(_QWORD *)&buf.__opaque[22] = v4;
                      *(_WORD *)&buf.__opaque[30] = 2048;
                      *(_QWORD *)&buf.__opaque[32] = v19;
                      *(_WORD *)&buf.__opaque[40] = 2048;
                      *(_QWORD *)&buf.__opaque[42] = v51;
                      _os_log_impl(&dword_215C5C000, v78, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timeout sustained for pGCKSession=%08lX, pClist=%08lX, pRetry=%08lX", (uint8_t *)&buf, 0x3Au);
                    }
                  }
                  *v50 = *((_QWORD *)v51 + 8);
                  v79 = (void *)*((_QWORD *)v51 + 5);
                  if (v79)
                    free(v79);
                  free(v51);
                  attempt_failover(v4, v19);
                  goto LABEL_113;
                }
              }
              v68 = *((double *)v51 + 2);
              if (v15 < v68 || !*((_QWORD *)v51 + 5))
              {
LABEL_136:
                v50 = v51 + 64;
                if (v21 > v68)
                  v21 = v68;
                goto LABEL_138;
              }
              switch(*v51)
              {
                case 1:
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    goto LABEL_118;
                  v69 = VRTraceErrorLogLevelToCSTR();
                  v70 = *v9;
                  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_118;
                  v71 = *((unsigned __int16 *)v51 + 28);
                  v72 = *(_DWORD *)(v19 + 116);
                  v73 = *(_DWORD *)(v19 + 100);
                  LODWORD(buf.__sig) = 136316418;
                  *(uint64_t *)((char *)&buf.__sig + 4) = v69;
                  *(_WORD *)&buf.__opaque[4] = 2080;
                  *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                  *(_WORD *)&buf.__opaque[14] = 1024;
                  *(_DWORD *)&buf.__opaque[16] = 4722;
                  *(_WORD *)&buf.__opaque[20] = 1024;
                  *(_DWORD *)&buf.__opaque[22] = v71;
                  *(_WORD *)&buf.__opaque[26] = 1024;
                  *(_DWORD *)&buf.__opaque[28] = v72;
                  *(_WORD *)&buf.__opaque[32] = 1024;
                  *(_DWORD *)&buf.__opaque[34] = v73;
                  v74 = v70;
                  v75 = " [%s] %s:%d Retransmitting HELLO with SN [%d] to participant [%08X] over channel [%d]";
                  goto LABEL_117;
                case 2:
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    goto LABEL_118;
                  v85 = VRTraceErrorLogLevelToCSTR();
                  v86 = *v9;
                  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_118;
                  v87 = *((unsigned __int16 *)v51 + 28);
                  v88 = *(_DWORD *)(v19 + 116);
                  v89 = *(_DWORD *)(v19 + 100);
                  LODWORD(buf.__sig) = 136316418;
                  *(uint64_t *)((char *)&buf.__sig + 4) = v85;
                  *(_WORD *)&buf.__opaque[4] = 2080;
                  *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                  *(_WORD *)&buf.__opaque[14] = 1024;
                  *(_DWORD *)&buf.__opaque[16] = 4724;
                  *(_WORD *)&buf.__opaque[20] = 1024;
                  *(_DWORD *)&buf.__opaque[22] = v87;
                  *(_WORD *)&buf.__opaque[26] = 1024;
                  *(_DWORD *)&buf.__opaque[28] = v88;
                  *(_WORD *)&buf.__opaque[32] = 1024;
                  *(_DWORD *)&buf.__opaque[34] = v89;
                  v74 = v86;
                  v75 = " [%s] %s:%d Retransmitting DD with SN [%d] to participant [%08X] over channel [%d]";
                  goto LABEL_117;
                case 4:
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    goto LABEL_118;
                  v80 = VRTraceErrorLogLevelToCSTR();
                  v81 = *v9;
                  if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_118;
                  v82 = *((unsigned __int16 *)v51 + 28);
                  v83 = *(_DWORD *)(v19 + 116);
                  v84 = *(_DWORD *)(v19 + 100);
                  LODWORD(buf.__sig) = 136316418;
                  *(uint64_t *)((char *)&buf.__sig + 4) = v80;
                  *(_WORD *)&buf.__opaque[4] = 2080;
                  *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                  *(_WORD *)&buf.__opaque[14] = 1024;
                  *(_DWORD *)&buf.__opaque[16] = 4726;
                  *(_WORD *)&buf.__opaque[20] = 1024;
                  *(_DWORD *)&buf.__opaque[22] = v82;
                  *(_WORD *)&buf.__opaque[26] = 1024;
                  *(_DWORD *)&buf.__opaque[28] = v83;
                  *(_WORD *)&buf.__opaque[32] = 1024;
                  *(_DWORD *)&buf.__opaque[34] = v84;
                  v74 = v81;
                  v75 = " [%s] %s:%d Retransmitting LSA with SN [%d] to participant [%08X] over channel [%d]";
                  goto LABEL_117;
                case 8:
                  v76 = v8;
                  v90 = *(double *)(v19 + 392);
                  v91 = *(double *)(v19 + 64) + v90 * 0.5;
                  if (v91 >= *(double *)(v19 + 32) + v90 * 0.5)
                    v91 = *(double *)(v19 + 32) + v90 * 0.5;
                  *((double *)v51 + 2) = v91;
                  *((double *)v51 + 4) = v91 + v90 * 0.5;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v92 = VRTraceErrorLogLevelToCSTR();
                    v93 = *v9;
                    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    {
                      v94 = *(_DWORD *)(v19 + 116);
                      v95 = *((_QWORD *)v51 + 2);
                      v96 = *((_QWORD *)v51 + 4);
                      LODWORD(buf.__sig) = 136316674;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v92;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 4735;
                      *(_WORD *)&buf.__opaque[20] = 1024;
                      *(_DWORD *)&buf.__opaque[22] = v94;
                      *(_WORD *)&buf.__opaque[26] = 2048;
                      *(double *)&buf.__opaque[28] = v15;
                      *(_WORD *)&buf.__opaque[36] = 2048;
                      *(_QWORD *)&buf.__opaque[38] = v95;
                      *(_WORD *)&buf.__opaque[46] = 2048;
                      *(_QWORD *)&buf.__opaque[48] = v96;
                      _os_log_impl(&dword_215C5C000, v93, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Heartbeat state for [%08X]: Now [%.3lf] NextFire [%.3lf] WaitUntil [%.3lf]", (uint8_t *)&buf, 0x40u);
                    }
                  }
                  v97 = *((double *)v51 + 2);
                  if (v15 >= v97)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v98 = VRTraceErrorLogLevelToCSTR();
                      v99 = *v9;
                      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                      {
                        v100 = *((unsigned __int16 *)v51 + 28);
                        v101 = *(_DWORD *)(v19 + 116);
                        v102 = *(_DWORD *)(v19 + 100);
                        LODWORD(buf.__sig) = 136316418;
                        *(uint64_t *)((char *)&buf.__sig + 4) = v98;
                        *(_WORD *)&buf.__opaque[4] = 2080;
                        *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                        *(_WORD *)&buf.__opaque[14] = 1024;
                        *(_DWORD *)&buf.__opaque[16] = 4748;
                        *(_WORD *)&buf.__opaque[20] = 1024;
                        *(_DWORD *)&buf.__opaque[22] = v100;
                        *(_WORD *)&buf.__opaque[26] = 1024;
                        *(_DWORD *)&buf.__opaque[28] = v101;
                        *(_WORD *)&buf.__opaque[32] = 1024;
                        *(_DWORD *)&buf.__opaque[34] = v102;
                        v74 = v99;
                        v75 = " [%s] %s:%d Retransmitting Heartbeat with SN [%d] to participant [%08X] over channel [%d]";
LABEL_117:
                        _os_log_impl(&dword_215C5C000, v74, OS_LOG_TYPE_DEFAULT, v75, (uint8_t *)&buf, 0x2Eu);
                      }
                    }
LABEL_118:
                    v103 = SendUDPPacketCList(v4, v19, *((_WORD **)v51 + 5), *((unsigned int *)v51 + 12), 0, 1);
                    v8 = v103;
                    v104 = *v51;
                    if ((v103 & 0x80000000) == 0 || (_DWORD)v103 == -1072037876)
                      goto LABEL_124;
                    if ((v104 == 8 || v104 == 1) && *(_DWORD *)(v19 + 108))
                    {
                      *(_DWORD *)(v19 + 108) = -1;
                      *v232 = 0;
                      *(_QWORD *)(v19 + 552) = 0;
LABEL_124:
                      if ((_DWORD)v103 != -1072037876 || v104 == 8)
                      {
                        if (v104 == 1 && *((_DWORD *)v51 + 6))
                        {
                          v68 = v223 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
                          *((double *)v51 + 2) = v68;
                          --*((_DWORD *)v51 + 6);
                        }
                        else
                        {
                          *((_DWORD *)v51 + 6) = 0;
                          v106 = v15 + *((double *)v51 + 1);
                          v68 = v106 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
                          v107 = *((double *)v51 + 1) + *((double *)v51 + 1);
                          *((double *)v51 + 1) = v107;
                          *((double *)v51 + 2) = v68;
                          if (v107 > 1.0)
                          {
                            *((double *)v51 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
                            v68 = *((double *)v51 + 2);
                          }
                        }
                      }
                      else
                      {
                        *((double *)v51 + 4) = v15 + *((double *)v51 + 4) - *((double *)v51 + 2) + 0.5;
                        *((double *)v51 + 2) = v20;
                        v68 = v15 + 0.5;
                        v8 = 3222929420;
                      }
                      goto LABEL_136;
                    }
                    *v50 = *((_QWORD *)v51 + 8);
                    v105 = (void *)*((_QWORD *)v51 + 5);
                    if (v105)
                      free(v105);
                    free(v51);
                    if (v104 == 8)
                    {
                      attempt_failover(v4, v19);
                      goto LABEL_138;
                    }
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v108 = VRTraceErrorLogLevelToCSTR();
                      v109 = *v9;
                      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(buf.__sig) = 136316162;
                        *(uint64_t *)((char *)&buf.__sig + 4) = v108;
                        *(_WORD *)&buf.__opaque[4] = 2080;
                        *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                        *(_WORD *)&buf.__opaque[14] = 1024;
                        *(_DWORD *)&buf.__opaque[16] = 4778;
                        *(_WORD *)&buf.__opaque[20] = 1024;
                        *(_DWORD *)&buf.__opaque[22] = 4778;
                        *(_WORD *)&buf.__opaque[26] = 1024;
                        *(_DWORD *)&buf.__opaque[28] = v8;
                        v57 = v109;
                        goto LABEL_143;
                      }
                    }
                    goto LABEL_144;
                  }
                  v50 = v51 + 64;
                  if (v21 > v97)
                    v21 = *((double *)v51 + 2);
                  break;
                default:
                  goto LABEL_118;
              }
LABEL_113:
              v8 = v76;
LABEL_138:
              v51 = (_BYTE *)*v50;
              if (!*v50)
                goto LABEL_146;
            }
          }
          v8 = v229;
LABEL_146:
          v110 = *(double *)(v19 + 24);
          if (*(_DWORD *)(v19 + 84) && v110 == 0.0)
          {
            v111 = *v225;
            if (*v225)
            {
              v112 = *v225;
              while (1)
              {
                v113 = *v112;
                v114 = v113 == 8 || v113 == 1;
                if (!v114)
                  break;
                v112 = (unsigned __int8 *)*((_QWORD *)v112 + 8);
                if (!v112)
                {
                  if (v111)
                  {
                    do
                    {
                      v115 = (unsigned __int8 *)*((_QWORD *)v111 + 8);
                      v116 = (void *)*((_QWORD *)v111 + 5);
                      if (v116)
                        free(v116);
                      free(v111);
                      v111 = v115;
                    }
                    while (v115);
                  }
                  goto LABEL_160;
                }
              }
            }
            else
            {
LABEL_160:
              *(_QWORD *)(v19 + 496) = 0;
              if (!*(_DWORD *)(v19 + 4))
                goto LABEL_175;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v117 = VRTraceErrorLogLevelToCSTR();
                v118 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                {
                  v119 = *(_DWORD *)(v19 + 116);
                  LODWORD(buf.__sig) = 136315906;
                  *(uint64_t *)((char *)&buf.__sig + 4) = v117;
                  *(_WORD *)&buf.__opaque[4] = 2080;
                  *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                  *(_WORD *)&buf.__opaque[14] = 1024;
                  *(_DWORD *)&buf.__opaque[16] = 4844;
                  *(_WORD *)&buf.__opaque[20] = 1024;
                  *(_DWORD *)&buf.__opaque[22] = v119;
                  _os_log_impl(&dword_215C5C000, v118, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Discarding relay binding for [%08X]", (uint8_t *)&buf, 0x22u);
                }
              }
              ICEDiscardRelayBinding();
              v110 = micro() + 1.0;
              *(double *)(v19 + 24) = v110;
            }
          }
          if (v110 != 0.0 && v110 <= micro())
          {
LABEL_175:
            pthread_mutex_unlock(v228);
            v125 = GCKInvalidateOneCList(v4, (int *)v19);
            v22 = v224;
            if (v125)
              v22 = (uint64_t *)(v4 + 7888);
            goto LABEL_188;
          }
          if (*(_DWORD *)(v19 + 504) && *(double *)(v19 + 24) == 0.0)
          {
            v130 = micro();
            v226 = (double *)(v19 + 544);
            v131 = *(double *)(v19 + 544);
            v132 = v131 == 0.0 || v131 > v130;
            *(double *)&v233 = v130;
            if (!v132 || (v133 = *(double *)(v19 + 552), v133 != 0.0) && v133 <= *(double *)(v19 + 64))
            {
              pthread_mutex_lock(v221);
              v134 = *(unsigned int *)(v4 + 112);
              v257 = 0;
              v255 = 0u;
              v256 = 0u;
              v253 = 0u;
              v254 = 0u;
              v252 = 0u;
              memset(&buf, 0, sizeof(buf));
              *(_OWORD *)&buf.__opaque[8] = *(_OWORD *)(v19 + 576);
              v136 = *(_DWORD *)(v19 + 100);
              v135 = *(_DWORD *)(v19 + 104);
              LODWORD(buf.__sig) = *(_DWORD *)(v4 + 108);
              HIDWORD(buf.__sig) = v135;
              *(_QWORD *)&v252 = __PAIR64__(*(_DWORD *)(v19 + 116), v136);
              *(_WORD *)buf.__opaque = *(_WORD *)(v19 + 568);
              *(_DWORD *)&buf.__opaque[4] = *(_DWORD *)(v19 + 572);
              *(_QWORD *)&buf.__opaque[24] = *(_QWORD *)(v19 + 592);
              v137 = *(float *)(v19 + 600);
              v138 = *(double *)&v233 - v137;
              *(float *)&v138 = v138;
              v139 = v137 == 0.0;
              v140 = 0.0;
              if (!v139)
                v140 = *(float *)&v138;
              *(float *)&buf.__opaque[32] = v140;
              if (v139)
              {
                *(_DWORD *)&buf.__opaque[40] = 0;
                v141 = 0.0;
              }
              else
              {
                *(float32x2_t *)&buf.__opaque[36] = vdiv_f32(*(float32x2_t *)(v19 + 604), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v138, 0));
                *(float *)&buf.__opaque[44] = *(float *)(v19 + 612) / *(float *)&v138;
                v141 = *(float *)(v19 + 616) / *(float *)&v138;
              }
              *(float *)&buf.__opaque[48] = v141;
              if ((int)v134 >= 1)
              {
                v142 = 0;
                v143 = 0;
                do
                {
                  if (!v142 || *(_DWORD *)(v19 + 116) == *(_DWORD *)(v4 + v142 + 120))
                  {
                    v144 = *(_DWORD *)(v4 + v142 + 116);
                    v145 = (char *)&buf + 4 * v143++;
                    DWORD2(v252) = v143;
                    *((_DWORD *)v145 + 19) = v144;
                  }
                  v142 += 480;
                }
                while (480 * v134 != v142);
              }
              v249 = 0u;
              memset(v250, 0, 118);
              v248 = 0u;
              *(_QWORD *)&v146 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v146 + 1) = 0xAAAAAAAAAAAAAAAALL;
              *(_OWORD *)&v247.x_public = v146;
              *(_OWORD *)&v247.x_base = v146;
              *(_OWORD *)&v247.x_op = v146;
              xdrmem_create(&v247, (char *)&v248, 0x96u, XDR_ENCODE);
              v230 = v8;
              if (xdr_chanstat_node(&v247, (uint64_t)&buf))
                v147 = ((uint64_t (*)(XDR *))v247.x_ops->x_getpostn)(&v247);
              else
                v147 = 0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v148 = VRTraceErrorLogLevelToCSTR();
                v149 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v239 = 136315906;
                  v240 = v148;
                  v241 = 2080;
                  v242 = "gckSessionRecvProc";
                  v243 = 1024;
                  v244 = 4919;
                  v245 = 1024;
                  *(_DWORD *)v246 = v147;
                  _os_log_impl(&dword_215C5C000, v149, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MARSHALLED CHANNEL STATUS REPORT (SIZE %d BYTES)...", v239, 0x22u);
                }
              }
              x_destroy = v247.x_ops->x_destroy;
              if (x_destroy)
                ((void (*)(XDR *))x_destroy)(&v247);
              if (v147 && (int)v134 >= 1)
              {
                v151 = 0;
                v152 = 480 * v134;
                do
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v153 = VRTraceErrorLogLevelToCSTR();
                    v154 = *MEMORY[0x24BDFDC28];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                    {
                      v155 = *(_DWORD *)(v4 + v151 + 116);
                      *(_DWORD *)v239 = 136316162;
                      v240 = v153;
                      v241 = 2080;
                      v242 = "gckSessionRecvProc";
                      v243 = 1024;
                      v244 = 4924;
                      v245 = 1024;
                      *(_DWORD *)v246 = v155;
                      *(_WORD *)&v246[4] = 1024;
                      *(_DWORD *)&v246[6] = v252;
                      _os_log_impl(&dword_215C5C000, v154, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SEND STATUS REPORT TO %08X ON CHANNEL %d...", v239, 0x28u);
                    }
                  }
                  GCKSessionSendDOOB(v4, *(_DWORD *)(v4 + v151 + 116), (const UInt8 *)&v248, v147, 0xAu, 0.0);
                  v151 += 480;
                }
                while (v152 != v151);
              }
              pthread_mutex_unlock(v221);
              v130 = *(double *)&v233;
              v156 = *(double *)&v233;
              *(float *)(v19 + 600) = v156;
              *v226 = 0.0;
              *(_QWORD *)(v19 + 552) = 0;
              *(_QWORD *)(v19 + 576) = 0;
              *(_QWORD *)(v19 + 584) = 0;
              *(_QWORD *)(v19 + 612) = 0;
              *(_QWORD *)(v19 + 604) = 0;
              v9 = (os_log_t *)MEMORY[0x24BDFDC28];
              v8 = v230;
            }
            v157 = *(double *)(v19 + 528);
            if (v157 == 0.0 || v157 > v130)
              goto LABEL_171;
            v159 = v8;
            *(_QWORD *)(v19 + 528) = 0;
            v160 = (char *)malloc_type_calloc(1uLL, 0x18uLL, 0x1000040D315E998uLL);
            if (v160)
            {
              v161 = v160;
              v162 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
              if (v162)
              {
                v163 = v162;
                *(_QWORD *)buf.__opaque = 0;
                buf.__sig = 0;
                *(_DWORD *)v161 = 16778509;
                if (OSPFWriteTimeval(v161 + 4, 0x14uLL, (uint64_t)&buf))
                  v161[2] = 1;
                *v163 = v161;
                v164 = (uint64_t *)(v19 + 512);
                v165 = *(_QWORD *)(v19 + 512);
                if (v165)
                {
                  do
                  {
                    v166 = *(_BYTE **)v165;
                    if (*(_QWORD *)v165 && *v166 == 13 && v166[3] == 1 && v166[2] == 1)
                    {
                      *v164 = *(_QWORD *)(v165 + 8);
                      *(_QWORD *)(v165 + 8) = 0;
                      free(*(void **)v165);
                      free((void *)v165);
                    }
                    else
                    {
                      v164 = (uint64_t *)(v165 + 8);
                    }
                    v165 = *v164;
                  }
                  while (*v164);
                }
                *v164 = (uint64_t)v163;
              }
              else
              {
                free(v161);
              }
            }
            v167 = malloc_type_calloc(1uLL, 0xCuLL, 0x10000403E1C8BA9uLL);
            if (v167)
            {
              v168 = v167;
              v169 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
              if (v169)
              {
                v170 = v169;
                *(_QWORD *)v168 = 16843278;
                v168[2] = 0;
                *v169 = v168;
                v171 = (uint64_t *)(v19 + 512);
                v172 = *(_QWORD *)(v19 + 512);
                if (v172)
                {
                  do
                  {
                    v173 = *(_BYTE **)v172;
                    if (*(_QWORD *)v172 && *v173 == 14 && v173[3] == 1 && v173[2] == 1)
                    {
                      *v171 = *(_QWORD *)(v172 + 8);
                      *(_QWORD *)(v172 + 8) = 0;
                      free(*(void **)v172);
                      free((void *)v172);
                    }
                    else
                    {
                      v171 = (uint64_t *)(v172 + 8);
                    }
                    v172 = *v171;
                  }
                  while (*v171);
                }
                *v171 = (uint64_t)v170;
              }
              else
              {
                free(v168);
              }
            }
            v174 = *(double *)(v19 + 536);
            v8 = v159;
            if (v174 == 0.0)
              goto LABEL_171;
            *(double *)(v19 + 528) = *(double *)&v233 + v174;
            if (*(_DWORD *)(v19 + 108) || *v226 != 0.0)
              goto LABEL_171;
            v175 = *(double *)(v19 + 64);
            if (v175 == 0.0 || v175 + 10.99 > *(double *)&v233)
            {
              *(double *)(v19 + 544) = *(double *)&v233 + 10.99;
              *(_QWORD *)(v19 + 552) = 0;
              goto LABEL_171;
            }
            v179.f64[1] = v216;
            v179.f64[0] = *(float64_t *)(v19 + 392);
            v120 = vaddq_f64((float64x2_t)vdupq_lane_s64(v233, 0), v179);
          }
          else
          {
            v120 = 0uLL;
          }
          *(float64x2_t *)(v19 + 544) = v120;
LABEL_171:
          pthread_mutex_unlock(v228);
          if (*(_DWORD *)(v19 + 408) == 4)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v121 = VRTraceErrorLogLevelToCSTR();
              v122 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
              {
                v123 = *(_DWORD *)v19;
                v124 = *(_DWORD *)(v19 + 116);
                LODWORD(buf.__sig) = 136316162;
                *(uint64_t *)((char *)&buf.__sig + 4) = v121;
                *(_WORD *)&buf.__opaque[4] = 2080;
                *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                *(_WORD *)&buf.__opaque[14] = 1024;
                *(_DWORD *)&buf.__opaque[16] = 5086;
                *(_WORD *)&buf.__opaque[20] = 1024;
                *(_DWORD *)&buf.__opaque[22] = v123;
                *(_WORD *)&buf.__opaque[26] = 1024;
                *(_DWORD *)&buf.__opaque[28] = v124;
                _os_log_impl(&dword_215C5C000, v122, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DON'T READ FROM SOCKET %d FOR DISCONNECTED REMOTE_ID %08X", (uint8_t *)&buf, 0x28u);
              }
            }
          }
          else
          {
            v126 = *(_DWORD *)v19;
            if (__darwin_check_fd_set_overflow(*(_DWORD *)v19, &v237, 0))
              *(__int32_t *)((char *)v237.fds_bits + (((unint64_t)v126 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v126;
          }
          v22 = (uint64_t *)(v19 + 728);
          v127 = v227;
          if (*(_DWORD *)v19 > v227)
            v127 = *(_DWORD *)v19;
          v227 = v127;
          v128 = *(int *)(v19 + 72);
          if ((_DWORD)v128 != -1)
          {
            if (__darwin_check_fd_set_overflow(*(_DWORD *)(v19 + 72), &v237, 0))
              *(__int32_t *)((char *)v237.fds_bits + ((v128 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v128;
            v129 = v227;
            if (*(_DWORD *)(v19 + 72) > v227)
              v129 = *(_DWORD *)(v19 + 72);
            v227 = v129;
            v22 = (uint64_t *)(v19 + 728);
          }
LABEL_188:
          v19 = *v22;
          if (!*v22)
            goto LABEL_264;
        }
      }
      v21 = v219;
LABEL_264:
      pthread_rwlock_unlock(v220);
      v180 = v21 - v15;
      if (v180 > 0.0)
      {
        v181 = dispatch_time(0, (uint64_t)(v180 * 1000000000.0));
        dispatch_source_set_timer(source, v181, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v180 / 10.0 * 1000000000.0));
        dispatch_resume(source);
        handler[7] = (int)v180;
        LODWORD(handler[8]) = (int)((v180 - (double)(int)v180) * 1000000.0);
        v182 = select(v227 + 1, &v237, 0, 0, (timeval *)&handler[7]);
        dispatch_suspend(source);
        v183 = micro();
        if (v182 == -1)
        {
          if (*__error() != 9)
          {
            v211 = *__error() | 0xC01A0000;
            v212 = VRTraceGetErrorLogLevelForModule();
            if (v212 >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v210 = source;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                gckSessionRecvProc_cold_3();
              goto LABEL_341;
            }
LABEL_333:
            v210 = source;
LABEL_341:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v213 = VRTraceErrorLogLevelToCSTR();
              v214 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__sig) = 136315906;
                *(uint64_t *)((char *)&buf.__sig + 4) = v213;
                *(_WORD *)&buf.__opaque[4] = 2080;
                *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                *(_WORD *)&buf.__opaque[14] = 1024;
                *(_DWORD *)&buf.__opaque[16] = 5293;
                *(_WORD *)&buf.__opaque[20] = 1024;
                *(_DWORD *)&buf.__opaque[22] = v211;
                _os_log_impl(&dword_215C5C000, v214, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionRecvProc thread end(%X)...", (uint8_t *)&buf, 0x22u);
              }
            }
            *(_DWORD *)(v4 + 8304) = 1;
            dispatch_resume(v210);
            dispatch_source_cancel(v210);
            dispatch_release(v210);
            CheckOutHandleDebug();
            return v211;
          }
        }
        else
        {
          v184 = v183;
          if (v182)
            gettimeofday((timeval *)&handler[5], 0);
          if (v184 > v21)
          {
            v219 = micro() + 30.0;
            gckSessionSendHBs(v4);
          }
          if (v182)
          {
            v231 = v8;
            v185 = *(int *)(v4 + 12);
            if ((_DWORD)v185 != -1)
            {
              if (__darwin_check_fd_set_overflow(*(_DWORD *)(v4 + 12), &v237, 0))
              {
                if (((*(unsigned int *)((char *)v237.fds_bits + ((v185 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v185) & 1) != 0)
                {
                  close(*(_DWORD *)(v4 + 12));
                  *(_DWORD *)(v4 + 12) = -1;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
                  {
                    v186 = VRTraceErrorLogLevelToCSTR();
                    v187 = *v9;
                    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf.__sig) = 136315650;
                      *(uint64_t *)((char *)&buf.__sig + 4) = v186;
                      *(_WORD *)&buf.__opaque[4] = 2080;
                      *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                      *(_WORD *)&buf.__opaque[14] = 1024;
                      *(_DWORD *)&buf.__opaque[16] = 5156;
                      _os_log_impl(&dword_215C5C000, v187, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Read condition for pGCKSession->sReset", (uint8_t *)&buf, 0x1Cu);
                    }
                  }
                }
              }
            }
            v188 = *(int *)(v4 + 16);
            if ((_DWORD)v188 != -1)
            {
              if (__darwin_check_fd_set_overflow(*(_DWORD *)(v4 + 16), &v237, 0))
              {
                if (((*(unsigned int *)((char *)v237.fds_bits + ((v188 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v188) & 1) != 0)
                {
                  *(_QWORD *)&v238.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
                  *(_QWORD *)&v238.sa_len = 0xAAAAAAAAAAAAAAAALL;
                  v235 = 16;
                  v189 = accept(*(_DWORD *)(v4 + 16), &v238, &v235);
                  if (v189 != -1)
                  {
                    v190 = v189;
                    *(_QWORD *)&v191 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v191 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    *(_OWORD *)&buf.__opaque[24] = v191;
                    *(_OWORD *)&buf.__opaque[40] = v191;
                    *(_OWORD *)&buf.__sig = v191;
                    *(_OWORD *)&buf.__opaque[8] = v191;
                    v234 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
                    v247.x_base = (char *)0xAAAAAAAAAAAAAAAALL;
                    *(_OWORD *)&v247.x_op = v191;
                    *(_OWORD *)&v247.x_public = v191;
                    *(_QWORD *)((char *)v250 + 14) = 0xAAAAAAAAAAAAAAAALL;
                    v249 = v191;
                    v250[0] = v191;
                    v248 = v191;
                    SAToIPPORT();
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v192 = VRTraceErrorLogLevelToCSTR();
                      v193 = *v9;
                      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                      {
                        v194 = IPPORTToStringWithSize();
                        *(_DWORD *)v239 = 136315906;
                        v240 = v192;
                        v241 = 2080;
                        v242 = "gckSessionRecvProc";
                        v243 = 1024;
                        v244 = 5173;
                        v245 = 2080;
                        *(_QWORD *)v246 = v194;
                        _os_log_impl(&dword_215C5C000, v193, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection request from %s...", v239, 0x26u);
                      }
                    }
                    v195 = malloc_type_malloc(0x10uLL, 0x10200403A5D3213uLL);
                    *(_QWORD *)v195 = v217;
                    v195[2] = v190;
                    pthread_attr_init(&buf);
                    pthread_attr_setdetachstate(&buf, 2);
                    v196 = pthread_create(&v234, &buf, (void *(__cdecl *)(void *))gckSessionLocalServerProc, v195);
                    pthread_attr_destroy(&buf);
                    if (v196 == -1)
                      free(v195);
                  }
                }
              }
            }
            pthread_rwlock_rdlock(v220);
            v197 = *v222;
            if (*v222)
            {
              while (1)
              {
                v198 = *(_DWORD *)v197;
                if (__darwin_check_fd_set_overflow(*(_DWORD *)v197, &v237, 0)
                  && ((*(unsigned int *)((char *)v237.fds_bits + (((unint64_t)v198 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v198) & 1) != 0)
                {
                  handler[7] = 0;
                  LODWORD(handler[8]) = 0;
                  do
                  {
                    v199 = *(_DWORD *)v197;
                    if (!__darwin_check_fd_set_overflow(*(_DWORD *)v197, &v237, 0)
                      || ((*(unsigned int *)((char *)v237.fds_bits
                                           + (((unint64_t)v199 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v199) & 1) == 0)
                    {
                      break;
                    }
                    micro();
                    if (gckSessionRecvMessage(v4) == -1072037831)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v200 = VRTraceErrorLogLevelToCSTR();
                        v201 = *v9;
                        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                        {
                          v202 = *(_DWORD *)v197;
                          LODWORD(buf.__sig) = 136315906;
                          *(uint64_t *)((char *)&buf.__sig + 4) = v200;
                          *(_WORD *)&buf.__opaque[4] = 2080;
                          *(_QWORD *)&buf.__opaque[6] = "gckSessionRecvProc";
                          *(_WORD *)&buf.__opaque[14] = 1024;
                          *(_DWORD *)&buf.__opaque[16] = 5201;
                          *(_WORD *)&buf.__opaque[20] = 1024;
                          *(_DWORD *)&buf.__opaque[22] = v202;
                          _os_log_impl(&dword_215C5C000, v201, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d socket %d is no longer connected", (uint8_t *)&buf, 0x22u);
                        }
                      }
                      gckSessionChangeStateCList(v4, v197, 5);
                      break;
                    }
                  }
                  while (select(v227 + 1, &v237, 0, 0, (timeval *)&handler[7]) > 0);
                  pthread_mutex_lock((pthread_mutex_t *)(v197 + 664));
                  for (k = *(char ***)(v197 + 520); k; k = *(char ***)(v197 + 520))
                  {
                    *(_QWORD *)(v197 + 520) = k[1];
                    k[1] = 0;
                    v204 = *k;
                    if (*k)
                    {
                      if (*v204 == 13 && v204[3] == 1)
                      {
                        switch(v204[2])
                        {
                          case 1:
                          case 2:
                          case 4:
                            v204[2] = 0;
                            goto LABEL_315;
                          case 3:
                            v204[2] = 4;
                            v205 = (char ***)(v197 + 512);
                            do
                            {
                              v206 = v205;
                              v207 = *v205;
                              v205 = (char ***)(*v205 + 1);
                            }
                            while (v207);
                            *v206 = k;
                            break;
                          case 6:
                            *(_QWORD *)buf.__opaque = 0;
                            buf.__sig = 0;
                            v204[2] = 6;
                            if (OSPFReadTimeval((unint64_t *)(v204 + 4), 4 * v204[1], (uint64_t)&buf))*(_DWORD *)(v197 + 572) = UpdateRTO((unsigned int *)(v197 + 624), *(_DWORD *)buf.__opaque + 1000000 * LODWORD(buf.__sig));
                            v204 = *k;
                            goto LABEL_315;
                          default:
                            goto LABEL_315;
                        }
                        continue;
                      }
LABEL_315:
                      free(v204);
                    }
                    free(k);
                  }
                  pthread_mutex_unlock((pthread_mutex_t *)(v197 + 664));
                }
                v208 = *(int *)(v197 + 72);
                if ((_DWORD)v208 != -1
                  && __darwin_check_fd_set_overflow(*(_DWORD *)(v197 + 72), &v237, 0)
                  && ((*(unsigned int *)((char *)v237.fds_bits + ((v208 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v208) & 1) != 0)
                {
                  gckSessionRecvTCPMessage(v4);
                }
                v197 = *(_QWORD *)(v197 + 728);
                v8 = v231;
                if (!v197)
                  goto LABEL_269;
              }
            }
            v8 = v231;
LABEL_269:
            pthread_rwlock_unlock(v220);
          }
        }
      }
    }
    v219 = v15 + 30.0;
    gckSessionSendHBs(v4);
    goto LABEL_269;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gckSessionRecvProc_cold_1();
  }
  return v2;
}

uint64_t gckSessionSendProc()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  timeval v14;
  _BYTE buf[48];
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  pthread_setname_np("com.apple.gamekitservices.gcksession.sendproc");
  v0 = CheckInHandleDebug();
  if (!v0)
    return -2145779710;
  v1 = v0;
  while (!*(_DWORD *)(v1 + 4))
  {
    v2 = *(_QWORD *)(v1 + 96);
    if (v2 && *(_QWORD *)(v2 + 24))
    {
      *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&buf[32] = v3;
      v16 = v3;
      *(_OWORD *)buf = v3;
      *(_OWORD *)&buf[16] = v3;
      pthread_mutex_lock((pthread_mutex_t *)(v1 + 7800));
      v4 = *(_QWORD *)(v1 + 96);
      v5 = *(_DWORD *)(v4 + 168);
      if (v5 < 1)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7800));
      }
      else
      {
        v6 = 0;
        do
        {
          if (v5 <= 0x10)
          {
            *(_DWORD *)&buf[4 * v6++] = *(_DWORD *)(v4 + 4 * (v5 - 1) + 172);
            v5 = *(_DWORD *)(v4 + 168);
          }
          v7 = __OFSUB__(v5--, 1);
          *(_DWORD *)(v4 + 168) = v5;
        }
        while (!((v5 < 0) ^ v7 | (v5 == 0)));
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7800));
        if (v6 >= 1)
        {
          v8 = v6;
          v9 = buf;
          do
          {
            LOWORD(v13) = 0;
            (*(void (**)(_QWORD, _BYTE *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(*(_QWORD *)(v1 + 96) + 24))(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 32), v9, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, v13);
            v9 += 4;
            --v8;
          }
          while (v8);
        }
      }
      LOWORD(v13) = 0;
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(*(_QWORD *)(v1 + 96)
                                                                                                  + 24))(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 32), 0, 0, 0, 0, 0, 0, 0, v13);
    }
    v14.tv_sec = 0;
    v14.tv_usec = 25000;
    select(0, 0, 0, 0, &v14);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "gckSessionSendProc";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 5360;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 0;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionSendProc thread end(%X)...", buf, 0x22u);
    }
  }
  *(_DWORD *)(v1 + 8308) = 1;
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckRegisterForNetworkChanges(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  pid_t v5;
  __int128 v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  SCDynamicStoreRef v9;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  CFStringRef v13;
  CFStringRef v14;
  const __CFArray *v15;
  const __SCDynamicStore *v16;
  NSObject *global_queue;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  const __CFDictionary *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  CFDictionaryRef v29;
  CFIndex Count;
  uint64_t v31;
  const __CFDictionary *v32;
  size_t v33;
  char *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  const __CFString *v38;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  const char *CStringPtr;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  const void *v51;
  uint64_t v53;
  const __CFArray *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  const __CFString *v58;
  CFDictionaryRef v59;
  int v60;
  __int128 v61;
  SCDynamicStoreContext context;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  const char *v72;
  void *values[2];
  char cStr[16];
  __int128 v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v2 = 2149187588;
  v3 = CheckInHandleDebug();
  if (v3)
  {
    v4 = v3;
    if (*(_QWORD *)(v3 + 8296))
    {
      v2 = 0;
LABEL_55:
      CheckOutHandleDebug();
      return v2;
    }
    v5 = getpid();
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)cStr = v6;
    v75 = v6;
    __sprintf_chk(cStr, 0, 0x20uLL, "GCK%d", v5);
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = a1;
    v9 = SCDynamicStoreCreate(v7, v8, (SCDynamicStoreCallBack)gckNetworkMonitorCallback, &context);
    *(_QWORD *)(v4 + 8296) = v9;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!v9)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v64 = v23;
          v65 = 2080;
          v66 = "gckRegisterForNetworkChanges";
          v67 = 1024;
          v68 = 5869;
          _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SCDynamicStoreCreate failed", buf, 0x1Cu);
        }
      }
      goto LABEL_54;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v64 = v11;
        v65 = 2080;
        v66 = "gckRegisterForNetworkChanges";
        v67 = 1024;
        v68 = 5794;
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SCDynamicStoreCreate succeeded", buf, 0x1Cu);
      }
    }
    v13 = CFStringCreateWithCString(v7, "State:/Network/Interface/[^/]+/Link", 0x8000100u);
    v14 = CFStringCreateWithCString(v7, "State:/Network/Interface/[^/]+/IPv4", 0x8000100u);
    values[0] = (void *)v13;
    values[1] = (void *)v14;
    v15 = CFArrayCreate(v7, (const void **)values, 2, MEMORY[0x24BDBD690]);
    if (SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v4 + 8296), 0, v15))
    {
      v16 = *(const __SCDynamicStore **)(v4 + 8296);
      global_queue = dispatch_get_global_queue(0, 0);
      if (SCDynamicStoreSetDispatchQueue(v16, global_queue))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v64 = v18;
            v65 = 2080;
            v66 = "gckRegisterForNetworkChanges";
            v67 = 1024;
            v68 = 5808;
            _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SCDynamicStoreSetNotificationKeys/SCDynamicStoreSetDispatchQueue succeeded", buf, 0x1Cu);
          }
        }
        v2 = 0;
        v20 = 1;
        goto LABEL_23;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 0;
LABEL_23:
        v60 = v20;
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315650;
      v64 = v21;
      v65 = 2080;
      v66 = "gckRegisterForNetworkChanges";
      v67 = 1024;
      v68 = 5812;
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SCDynamicStoreSetNotificationKeys/SCDynamicStoreSetDispatchQueue failed", buf, 0x1Cu);
    }
    v60 = 0;
LABEL_24:
    v25 = SCDynamicStoreCopyMultiple(*(SCDynamicStoreRef *)(v4 + 8296), 0, v15);
    v26 = VRTraceGetErrorLogLevelForModule();
    if (v25)
    {
      v59 = v25;
      v57 = v14;
      v58 = v13;
      if (v26 >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v64 = v27;
          v65 = 2080;
          v66 = "gckRegisterForNetworkChanges";
          v67 = 1024;
          v68 = 5818;
          _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d first SCDynamicStoreCopyMultiple succeeded", buf, 0x1Cu);
        }
      }
      v29 = v59;
      Count = CFDictionaryGetCount(v59);
      if (Count)
      {
        v31 = Count;
        v54 = v15;
        v55 = v8;
        v56 = a1;
        v53 = (uint64_t)&v53;
        v32 = v59;
        v33 = 8 * Count;
        MEMORY[0x24BDAC7A8](Count);
        v34 = (char *)&v53 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
        v35 = memset(v34, 170, v33);
        MEMORY[0x24BDAC7A8](v35);
        memset(v34, 170, v33);
        CFDictionaryGetKeysAndValues(v32, (const void **)v34, (const void **)v34);
        if (v31 >= 1)
        {
          v37 = 0;
          *(_QWORD *)&v36 = 136316162;
          v61 = v36;
          do
          {
            v38 = *(const __CFString **)&v34[8 * v37];
            if (v38)
            {
              Length = CFStringGetLength(*(CFStringRef *)&v34[8 * v37]);
              MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
              v41 = MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
              v43 = (char *)&v53 - v42;
              if (v41)
                memset((char *)&v53 - v42, 170, MaximumSizeForEncoding);
              CStringPtr = CFStringGetCStringPtr(v38, 0x8000100u);
              if (!CStringPtr)
              {
                if (CFStringGetCString(v38, v43, MaximumSizeForEncoding, 0x8000100u))
                  CStringPtr = v43;
                else
                  CStringPtr = 0;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v45 = VRTraceErrorLogLevelToCSTR();
                v46 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v61;
                  v64 = v45;
                  v65 = 2080;
                  v66 = "gckRegisterForNetworkChanges";
                  v67 = 1024;
                  v68 = 5847;
                  v69 = 1024;
                  v70 = v37;
                  v71 = 2080;
                  v72 = CStringPtr;
                  _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v47 = VRTraceErrorLogLevelToCSTR();
              v48 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v61;
                v64 = v47;
                v65 = 2080;
                v66 = "gckRegisterForNetworkChanges";
                v67 = 1024;
                v68 = 5849;
                v69 = 1024;
                v70 = v37;
                v71 = 2080;
                v72 = "NULL";
                _os_log_impl(&dword_215C5C000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
              }
            }
            ++v37;
          }
          while (v31 != v37);
        }
        v8 = v55;
        v15 = v54;
        v29 = v59;
      }
      CFRelease(v29);
      v13 = v58;
      v14 = v57;
    }
    else if (v26 >= 7)
    {
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v64 = v49;
        v65 = 2080;
        v66 = "gckRegisterForNetworkChanges";
        v67 = 1024;
        v68 = 5857;
        _os_log_impl(&dword_215C5C000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SCDynamicStoreCopyMultiple failed", buf, 0x1Cu);
      }
    }
    CFRelease(v14);
    CFRelease(v13);
    CFRelease(v15);
    if ((v60 & 1) == 0)
    {
      SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(v4 + 8296), 0);
      v51 = *(const void **)(v4 + 8296);
      if (v51)
      {
        CFRelease(v51);
        *(_QWORD *)(v4 + 8296) = 0;
      }
    }
LABEL_54:
    CFRelease(v8);
    goto LABEL_55;
  }
  return 2149187586;
}

uint64_t gckSessionDisposeAllConnections(uint64_t a1)
{
  pthread_rwlock_t *v2;
  _DWORD __dst[120];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  memcpy(__dst, (const void *)(a1 + 116), sizeof(__dst));
  __dst[71] = 0;
  ++LOWORD(__dst[68]);
  __dst[69] = 1;
  gckSessionSendLSA(a1, 1, __dst, -1, 1);
  *(_DWORD *)(a1 + 400) = 0;
  *(_WORD *)(a1 + 388) = __dst[68];
  gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
  gckSessionCleanupNodes(a1, -1, 0);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  return pthread_rwlock_unlock(v2);
}

uint64_t BWE_CloseObject(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 736) != 0xFFFFFFFFLL)
  {
    v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x24BDFDC28];
      v4 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_QWORD *)(v1 + 736);
          v6 = *(_DWORD *)(v1 + 116);
          v7 = *(unsigned __int16 *)(v1 + 744);
          v11 = 136316418;
          v12 = v2;
          v13 = 2080;
          v14 = "BWE_CloseObject";
          v15 = 1024;
          v16 = 8800;
          v17 = 2048;
          v18 = v5;
          v19 = 1024;
          v20 = v6;
          v21 = 1024;
          v22 = v7;
          _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d **Deleted BWE %p for node %d (wProbeSeqId %d)", (uint8_t *)&v11, 0x32u);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(v1 + 736);
        v9 = *(_DWORD *)(v1 + 116);
        v10 = *(unsigned __int16 *)(v1 + 744);
        v11 = 136316418;
        v12 = v2;
        v13 = 2080;
        v14 = "BWE_CloseObject";
        v15 = 1024;
        v16 = 8800;
        v17 = 2048;
        v18 = v8;
        v19 = 1024;
        v20 = v9;
        v21 = 1024;
        v22 = v10;
        _os_log_debug_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d **Deleted BWE %p for node %d (wProbeSeqId %d)", (uint8_t *)&v11, 0x32u);
      }
    }
    result = GCK_BWE_CloseHandle();
    *(_QWORD *)(v1 + 736) = 0xFFFFFFFFLL;
    *(_WORD *)(v1 + 744) = 0;
  }
  return result;
}

uint64_t GCKSessionSetLocalName(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187586;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      v6 = CheckInHandleDebug();
      if (v6)
      {
        if (a3 < 0x100)
        {
          v7 = v6;
          v8 = v6 + 125;
          memcpy((void *)(v6 + 125), a2, a3);
          *(_BYTE *)(v7 + 124) = a3;
          *(_BYTE *)(v8 + a3) = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v12 = 136315906;
              v13 = v9;
              v14 = 2080;
              v15 = "GCKSessionSetLocalName";
              v16 = 1024;
              v17 = 6828;
              v18 = 2080;
              v19 = v8;
              _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SetLocalName: \"%s\"", (uint8_t *)&v12, 0x26u);
            }
          }
          CheckOutHandleDebug();
          return 0;
        }
        else
        {
          CheckOutHandleDebug();
          return 2149187585;
        }
      }
    }
  }
  return v3;
}

uint64_t GCKSessionConnectToLocalService(uint64_t a1, int a2, uint64_t a3, int a4, void *a5, double a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  _DWORD *v24;
  int v25;
  _DWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *__src;
  pthread_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  pthread_attr_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v12 = 2149187587;
  v13 = CheckInHandleDebug();
  if (v13)
  {
    v14 = v13;
    v44 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v53.__sig = v15;
    *(_OWORD *)&v53.__opaque[8] = v15;
    *(_OWORD *)&v53.__opaque[24] = v15;
    *(_OWORD *)&v53.__opaque[40] = v15;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v46 = v16;
        v47 = 2080;
        v48 = "GCKSessionConnectToLocalService";
        v49 = 1024;
        v50 = 6852;
        v51 = 1024;
        v52 = a2;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connecting to local service [%08X]", buf, 0x22u);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(v14 + 7800));
    v18 = *(unsigned int *)(v14 + 400);
    if ((int)v18 < 1)
    {
      LODWORD(v19) = 0;
    }
    else
    {
      v19 = 0;
      v20 = (int *)(v14 + 404);
      while (1)
      {
        v21 = *v20;
        v20 += 3;
        if (v21 == a2)
          break;
        if (v18 == ++v19)
          goto LABEL_13;
      }
    }
    if ((_DWORD)v19 != (_DWORD)v18)
    {
      v12 = 2149187625;
LABEL_32:
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 7800));
      v22 = v12;
LABEL_33:
      CheckOutHandleDebug();
      return v22;
    }
LABEL_13:
    v22 = gckSessionAddNode(v14, a2, 1);
    pthread_mutex_unlock((pthread_mutex_t *)(v14 + 7800));
    if ((v22 & 0x80000000) != 0)
      goto LABEL_33;
    __src = a5;
    v23 = malloc_type_malloc(0x18uLL, 0x10200406E52F545uLL);
    if (!v23)
      goto LABEL_31;
    v24 = v23;
    v23[2] = a2;
    *v23 = -1;
    v25 = socket(2, 1, 6);
    v24[1] = v25;
    if (v25 == -1)
    {
      v12 = *__error() | 0xC01A0000;
    }
    else
    {
      v26 = malloc_type_malloc(0x30uLL, 0x10B0040073811C5uLL);
      if (v26)
      {
        v27 = v26;
        *(_QWORD *)v26 = a1;
        v26[2] = a2;
        *((double *)v26 + 2) = a6;
        v41 = a4;
        v28 = malloc_type_calloc(a4, 8uLL, 0x2004093837F09uLL);
        *((_QWORD *)v27 + 3) = v28;
        if (v28)
        {
          v42 = a4;
          if (a4 < 1)
          {
LABEL_22:
            *((_DWORD *)v27 + 8) = v42;
            v31 = malloc_type_malloc(4 * v41, 0x100004052888210uLL);
            *((_QWORD *)v27 + 5) = v31;
            if (v31)
            {
              memcpy(v31, __src, 4 * v41);
              pthread_mutex_lock((pthread_mutex_t *)(v14 + 8232));
              *((_QWORD *)v24 + 2) = *(_QWORD *)(v14 + 8224);
              *(_QWORD *)(v14 + 8224) = v24;
              pthread_mutex_unlock((pthread_mutex_t *)(v14 + 8232));
              pthread_attr_init(&v53);
              pthread_attr_setdetachstate(&v53, 2);
              v32 = pthread_create(&v44, &v53, (void *(__cdecl *)(void *))gckSessionLocalClientProc, v27);
              pthread_attr_destroy(&v53);
              if (v32 != -1)
                goto LABEL_33;
              v36 = (uint64_t *)(v14 + 8224);
              v37 = *__error();
              v38 = (void *)*((_QWORD *)v27 + 3);
              if (v38)
              {
                if (v42 >= 1)
                {
                  v39 = 0;
                  do
                  {
                    free(*(void **)(*((_QWORD *)v27 + 3) + v39));
                    v39 += 8;
                  }
                  while (8 * v42 != v39);
                  v38 = (void *)*((_QWORD *)v27 + 3);
                }
                free(v38);
              }
              v12 = v37 | 0xC01A0000;
              free(v27);
              pthread_mutex_lock((pthread_mutex_t *)(v14 + 8232));
              while (1)
              {
                v40 = *v36;
                if (!*v36)
                  break;
                if (*(_DWORD *)(v40 + 8) == a2)
                {
                  close(*(_DWORD *)(v40 + 4));
                  *v36 = *(_QWORD *)(v40 + 16);
                  free((void *)v40);
                }
                else
                {
                  v36 = (uint64_t *)(v40 + 16);
                }
              }
              pthread_mutex_unlock((pthread_mutex_t *)(v14 + 8232));
              goto LABEL_31;
            }
            close(v24[1]);
            free(v24);
          }
          else
          {
            v29 = 0;
            while (1)
            {
              *(_QWORD *)(*((_QWORD *)v27 + 3) + 8 * v29) = malloc_type_malloc(**(unsigned __int8 **)(a3 + 8 * v29), 0x6CFB70C6uLL);
              v30 = *(void **)(*((_QWORD *)v27 + 3) + 8 * v29);
              if (!v30)
                break;
              memcpy(v30, *(const void **)(a3 + 8 * v29), **(unsigned __int8 **)(a3 + 8 * v29));
              if (v42 == ++v29)
                goto LABEL_22;
            }
            close(v24[1]);
            free(v24);
            if (v29)
            {
              v35 = v29 + 1;
              do
                free(*(void **)(*((_QWORD *)v27 + 3) + 8 * (v35-- - 2)));
              while (v35 > 1);
            }
          }
          free(*((void **)v27 + 3));
          free(v27);
LABEL_31:
          pthread_mutex_lock((pthread_mutex_t *)(v14 + 7800));
          gckSessionDeleteNode(v14, a2, 0);
          goto LABEL_32;
        }
        close(v24[1]);
        free(v24);
        v33 = v27;
LABEL_30:
        free(v33);
        goto LABEL_31;
      }
      close(v24[1]);
    }
    v33 = v24;
    goto LABEL_30;
  }
  return 2149187586;
}

uint64_t gckSessionAddNode(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int *)(a1 + 400);
  if ((int)v3 <= 15)
  {
    if ((int)v3 < 1)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      v7 = 0;
      v8 = (_DWORD *)(a1 + 412);
      while (*(v8 - 2) != a2)
      {
        ++v7;
        v8 += 3;
        if (v3 == v7)
          goto LABEL_13;
      }
      *v8 |= a3;
    }
    if ((_DWORD)v7 == (_DWORD)v3)
    {
LABEL_13:
      v4 = 0;
      v9 = (_DWORD *)(a1 + 12 * v3);
      v9[101] = a2;
      v9[102] = -1;
      v9[103] = a3;
      *(_DWORD *)(a1 + 400) = v3 + 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v4 = 2149187603;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v5;
        v13 = 2080;
        v14 = "gckSessionAddNode";
        v15 = 1024;
        v16 = 1021;
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Max # of nodes reached", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
  return v4;
}

uint64_t gckSessionLocalClientProc(unsigned int *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  double v5;
  const sockaddr **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  int *v17;
  int *v18;
  int v19;
  int v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  int v27;
  __int128 v28;
  uint64_t v29;
  double v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  int v38;
  size_t v39;
  uint64_t v40;
  int *v41;
  __int128 v42;
  int v43;
  void *v44;
  const void *v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  const sockaddr **v50;
  int v51;
  __int128 v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int *v59;
  int v60;
  char v61;
  char v62;
  uint64_t v63;
  int v64;
  unint64_t v65;
  int v66;
  int v67;
  __int128 v68;
  int v69;
  uint64_t v70;
  uint64_t i;
  int v72;
  int *v73;
  int ErrorLogLevelForModule;
  int v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  pthread_rwlock_t *v79;
  uint64_t v80;
  int v81;
  uint64_t j;
  uint64_t v83;
  NSObject *v84;
  int v85;
  uint64_t v86;
  pthread_mutex_t *v87;
  __int128 v88;
  char *v89;
  void **v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  const sockaddr **v97;
  void **v98;
  int *v100;
  size_t v101;
  int v102;
  unsigned int v103;
  uint64_t v104;
  pthread_rwlock_t *v105;
  unsigned int v106;
  uint64_t *v107;
  void *v108;
  uint64_t v109;
  const sockaddr **v110;
  int *v111;
  __int128 v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  unsigned int v118;
  signed int v119;
  unsigned int v120;
  void *v121;
  timeval v122;
  fd_set v123;
  fd_set v124;
  fd_set v125;
  _BYTE v126[64];
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
  __int128 v138;
  _BYTE buf[40];
  int v140;
  _BYTE v141[40];
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v2 = -2145779711;
  v122.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v122.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  v121 = 0;
  v119 = 1500;
  pthread_setname_np("com.apple.gamekitservices.gcksession.localclientproc");
  if (a1)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v125.fds_bits[24] = v3;
    *(_OWORD *)&v125.fds_bits[28] = v3;
    *(_OWORD *)&v125.fds_bits[16] = v3;
    *(_OWORD *)&v125.fds_bits[20] = v3;
    *(_OWORD *)&v125.fds_bits[8] = v3;
    *(_OWORD *)&v125.fds_bits[12] = v3;
    *(_OWORD *)v125.fds_bits = v3;
    *(_OWORD *)&v125.fds_bits[4] = v3;
    *(_OWORD *)v124.fds_bits = v3;
    *(_OWORD *)&v124.fds_bits[4] = v3;
    *(_OWORD *)&v124.fds_bits[8] = v3;
    *(_OWORD *)&v124.fds_bits[12] = v3;
    *(_OWORD *)&v124.fds_bits[16] = v3;
    *(_OWORD *)&v124.fds_bits[20] = v3;
    *(_OWORD *)&v124.fds_bits[24] = v3;
    *(_OWORD *)&v124.fds_bits[28] = v3;
    *(_OWORD *)v123.fds_bits = v3;
    *(_OWORD *)&v123.fds_bits[4] = v3;
    *(_OWORD *)&v123.fds_bits[8] = v3;
    *(_OWORD *)&v123.fds_bits[12] = v3;
    *(_OWORD *)&v123.fds_bits[16] = v3;
    *(_OWORD *)&v123.fds_bits[20] = v3;
    *(_OWORD *)&v123.fds_bits[24] = v3;
    *(_OWORD *)&v123.fds_bits[28] = v3;
    v4 = *(_QWORD *)a1;
    v118 = a1[2];
    v5 = *((double *)a1 + 2);
    v6 = (const sockaddr **)*((_QWORD *)a1 + 3);
    v7 = a1[8];
    v111 = (int *)*((_QWORD *)a1 + 5);
    v8 = CheckInHandleDebug();
    if (v8)
    {
      v9 = v8;
      v109 = v4;
      v120 = -1431655766;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v126 = 136316162;
          *(_QWORD *)&v126[4] = v10;
          *(_WORD *)&v126[12] = 2080;
          *(_QWORD *)&v126[14] = "gckSessionLocalClientProc";
          *(_WORD *)&v126[22] = 1024;
          *(_DWORD *)&v126[24] = 4008;
          *(_WORD *)&v126[28] = 1024;
          *(_DWORD *)&v126[30] = v118;
          *(_WORD *)&v126[34] = 1024;
          *(_DWORD *)&v126[36] = v7;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to connect to %08X(# of addrs = %d)...", v126, 0x28u);
        }
      }
      v12 = micro();
      v107 = &v104;
      v13 = 4 * v7;
      MEMORY[0x24BDAC7A8](v14);
      v114 = v7;
      v115 = v9;
      *(_QWORD *)&v117 = (char *)&v104 - ((4 * v7 + 15) & 0x7FFFFFFF0);
      v108 = a1;
      v110 = v6;
      if ((_DWORD)v7 && (memset((char *)&v104 - ((v13 + 15) & 0x7FFFFFFF0), 170, 4 * v7), (int)v7 >= 1))
      {
        memset((char *)&v104 - ((v13 + 15) & 0x7FFFFFFF0), 255, 4 * v7);
        *(_QWORD *)&v15 = 136316162;
        v116 = v15;
        v16 = v7;
        v17 = (int *)((char *)&v104 - ((v13 + 15) & 0x7FFFFFFF0));
        v18 = v111;
        do
        {
          if ((*v6)->sa_family == 2)
          {
            v19 = socket(2, 1, 6);
            *v17 = v19;
            if (v19 == -1 || (v20 = v19, v21 = fcntl(v19, 3, 0), v21 == -1) || fcntl(v20, 4, v21 | 4u) == -1)
            {
              LODWORD(v39) = 0;
              v44 = 0;
              v45 = 0;
              v47 = *__error() | 0xC01A0000;
              v31 = -1;
              v43 = 1;
              v9 = v115;
              goto LABEL_137;
            }
            *(_QWORD *)&v141[32] = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)v141 = v22;
            *(_OWORD *)&v141[16] = v22;
            *(_QWORD *)&v126[46] = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&v126[16] = v22;
            *(_OWORD *)&v126[32] = v22;
            *(_OWORD *)v126 = v22;
            SAToIPPORT();
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v25 = IPPORTToStringWithSize();
                v26 = *v18;
                *(_DWORD *)buf = v116;
                *(_QWORD *)&buf[4] = v23;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "gckSessionLocalClientProc";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 4046;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = v25;
                *(_WORD *)&buf[38] = 1024;
                v140 = v26;
                _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connecting to %s... (IF: %u)", buf, 0x2Cu);
              }
            }
            if (*v18 != -1)
              setsockopt(v20, 0, 25, v18, 4u);
            if (connect(v20, *v6, (*v6)->sa_len) == -1 && *__error() != 36)
            {
              close(v20);
              *v17 = -1;
            }
          }
          ++v18;
          ++v17;
          ++v6;
          --v16;
        }
        while (v16);
        v27 = 1;
        v9 = v115;
      }
      else
      {
        v27 = 0;
      }
      *((_QWORD *)&v28 + 1) = 0;
      memset(&v124, 0, sizeof(v124));
      memset(&v123, 0, sizeof(v123));
      *(_QWORD *)&v112 = 2149187606;
      if (!v27)
      {
        v43 = 0;
        LODWORD(v39) = 0;
        v44 = 0;
        v45 = 0;
        v31 = -1;
        goto LABEL_72;
      }
      v113 = v27;
      v29 = 0;
      v30 = v5 + v12;
      *(_QWORD *)&v116 = v9 + 8232;
      v106 = -2145779689;
      v31 = -1;
      v32 = v117;
      do
      {
LABEL_26:
        v33 = *(int *)(v32 + 4 * v29);
        if ((_DWORD)v33 != -1)
        {
          if ((int)v33 > v31)
            v31 = *(_DWORD *)(v32 + 4 * v29);
          v34 = v33 >> 3;
          if (__darwin_check_fd_set_overflow(*(_DWORD *)(v32 + 4 * v29), &v124, 0))
            *(__int32_t *)((char *)v124.fds_bits + (v34 & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v33;
          if (__darwin_check_fd_set_overflow(v33, &v123, 0))
            *(__int32_t *)((char *)v123.fds_bits + (v34 & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v33;
          v32 = v117;
        }
        ++v29;
      }
      while (v29 != v7);
      if (v31 == -1)
      {
        LODWORD(v39) = 0;
        v44 = 0;
        v45 = 0;
        v31 = -1;
        v43 = v113;
        goto LABEL_72;
      }
      pthread_mutex_lock((pthread_mutex_t *)v116);
      v35 = *(_QWORD *)(v9 + 8224);
      if (v35)
      {
        while (*(_DWORD *)(v35 + 8) != v118)
        {
          v35 = *(_QWORD *)(v35 + 16);
          if (!v35)
            goto LABEL_47;
        }
        v36 = *(int *)(v35 + 4);
        if ((_DWORD)v36 == -1)
        {
          pthread_mutex_unlock((pthread_mutex_t *)v116);
          LODWORD(v39) = 0;
          v44 = 0;
          v45 = 0;
          v47 = 2149187614;
          v31 = -1;
          goto LABEL_94;
        }
        if (__darwin_check_fd_set_overflow(*(_DWORD *)(v35 + 4), &v124, 0))
          *(__int32_t *)((char *)v124.fds_bits + ((v36 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v36;
        v37 = *(_DWORD *)(v35 + 4);
        if (__darwin_check_fd_set_overflow(v37, &v123, 0))
          *(__int32_t *)((char *)v123.fds_bits + (((unint64_t)v37 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v37;
        if (*(_DWORD *)(v35 + 4) > v31)
          v31 = *(_DWORD *)(v35 + 4);
      }
LABEL_47:
      pthread_mutex_unlock((pthread_mutex_t *)v116);
      *(double *)&v28 = v30 - micro();
      if (*(double *)&v28 < 0.0)
      {
        LODWORD(v39) = 0;
        goto LABEL_93;
      }
      v122.tv_sec = (int)*(double *)&v28;
      v122.tv_usec = (int)((*(double *)&v28 - (double)(int)*(double *)&v28) * 1000000.0);
      v38 = select(v31 + 1, 0, &v124, &v123, &v122);
      if (v38 != -1)
      {
        LODWORD(v39) = v38;
        if (v38)
        {
          v40 = v7;
          v41 = (int *)v117;
          if (!v113)
          {
            v43 = 0;
            LODWORD(v39) = 0;
            v44 = 0;
            v45 = 0;
            *((_QWORD *)&v28 + 1) = 0;
            memset(&v124, 0, sizeof(v124));
            memset(&v123, 0, sizeof(v123));
            v31 = -1;
            v7 = v114;
            v9 = v115;
            goto LABEL_72;
          }
          while (1)
          {
            v31 = *v41;
            if (*v41 != -1)
            {
              if (__darwin_check_fd_set_overflow(*v41, &v124, 0)
                && (v124.fds_bits[(unint64_t)v31 >> 5] & (1 << v31)) != 0)
              {
                *(_DWORD *)v126 = -1431655766;
                *(_DWORD *)buf = 4;
                if (getsockopt(v31, 0xFFFF, 4103, v126, (socklen_t *)buf) != -1 && !*(_DWORD *)v126)
                {
                  v7 = v114;
                  if (v113)
                  {
                    *(_QWORD *)&v42 = 136315906;
                    v112 = v42;
                    v48 = v114;
                    v49 = (int *)v117;
                    v50 = v110;
                    do
                    {
                      v51 = *v49;
                      if (*v49 != -1)
                      {
                        if (v51 == v31)
                        {
                          *(_QWORD *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
                          *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          *(_OWORD *)buf = v52;
                          *(_OWORD *)&buf[16] = v52;
                          *(_QWORD *)&v126[46] = 0xAAAAAAAAAAAAAAAALL;
                          *(_OWORD *)&v126[16] = v52;
                          *(_OWORD *)&v126[32] = v52;
                          *(_OWORD *)v126 = v52;
                          SAToIPPORT();
                          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                          {
                            v53 = VRTraceErrorLogLevelToCSTR();
                            v54 = *MEMORY[0x24BDFDC28];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                            {
                              v55 = IPPORTToStringWithSize();
                              *(_DWORD *)v141 = v112;
                              *(_QWORD *)&v141[4] = v53;
                              *(_WORD *)&v141[12] = 2080;
                              *(_QWORD *)&v141[14] = "gckSessionLocalClientProc";
                              *(_WORD *)&v141[22] = 1024;
                              *(_DWORD *)&v141[24] = 4158;
                              *(_WORD *)&v141[28] = 2080;
                              *(_QWORD *)&v141[30] = v55;
                              _os_log_impl(&dword_215C5C000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connected to %s!", v141, 0x26u);
                            }
                          }
                        }
                        else
                        {
                          close(v51);
                          *v49 = -1;
                        }
                      }
                      ++v50;
                      ++v49;
                      --v48;
                    }
                    while (v48);
                  }
                  v56 = fcntl(v31, 3, 0);
                  if (v56 == -1)
                  {
                    LODWORD(v39) = 0;
                    v44 = 0;
                    v45 = 0;
                    v47 = *__error() | 0xC01A0000;
                    v9 = v115;
                  }
                  else
                  {
                    v57 = fcntl(v31, 4, v56 & 0xFFFFFFFB);
                    v9 = v115;
                    if (v57 != -1)
                    {
                      pthread_mutex_lock((pthread_mutex_t *)v116);
                      v58 = *(_QWORD *)(v9 + 8224);
                      if (v58)
                      {
                        while (*(_DWORD *)(v58 + 8) != v118)
                        {
                          v58 = *(_QWORD *)(v58 + 16);
                          if (!v58)
                            goto LABEL_99;
                        }
                        *(_DWORD *)v58 = v31;
                      }
LABEL_99:
                      pthread_mutex_unlock((pthread_mutex_t *)v116);
                      v120 = bswap32(*(_DWORD *)(v9 + 108));
                      v60 = send(v31, &v120, 4uLL, 0);
                      v43 = v113;
                      if (v60 == 4
                        && send(v31, (const void *)(v9 + 124), 1uLL, 0) == 1
                        && send(v31, (const void *)(v9 + 125), *(unsigned __int8 *)(v9 + 124), 0) == *(unsigned __int8 *)(v9 + 124))
                      {
                        *(_QWORD *)&v112 = 0;
                        LODWORD(v39) = 0;
                        v105 = (pthread_rwlock_t *)(v9 + 7904);
                        v61 = 1;
                        while (1)
                        {
                          v62 = v61;
                          memset(&v125, 0, sizeof(v125));
                          if (__darwin_check_fd_set_overflow(v31, &v125, 0))
                            v125.fds_bits[(unint64_t)v31 >> 5] |= 1 << v31;
                          pthread_mutex_lock((pthread_mutex_t *)v116);
                          v63 = *(_QWORD *)(v9 + 8224);
                          v64 = v31;
                          if (v63)
                          {
                            while (*(_DWORD *)(v63 + 8) != v118)
                            {
                              v63 = *(_QWORD *)(v63 + 16);
                              if (!v63)
                              {
                                v64 = v31;
                                goto LABEL_115;
                              }
                            }
                            v65 = *(int *)(v63 + 4);
                            if ((_DWORD)v65 == -1)
                            {
                              pthread_mutex_unlock((pthread_mutex_t *)v116);
                              v44 = 0;
                              v47 = 2149187614;
LABEL_214:
                              v7 = v114;
LABEL_215:
                              v43 = v113;
                              goto LABEL_216;
                            }
                            if (__darwin_check_fd_set_overflow(*(_DWORD *)(v63 + 4), &v125, 0))
                              *(__int32_t *)((char *)v125.fds_bits + ((v65 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v65;
                            if (*(_DWORD *)(v63 + 4) <= v31)
                              v64 = v31;
                            else
                              v64 = *(_DWORD *)(v63 + 4);
                          }
LABEL_115:
                          pthread_mutex_unlock((pthread_mutex_t *)v116);
                          *(double *)&v28 = v30 - micro();
                          if (*(double *)&v28 < 0.0)
                          {
                            v44 = 0;
                            v47 = v106;
                            goto LABEL_214;
                          }
                          v122.tv_sec = (int)*(double *)&v28;
                          v122.tv_usec = (int)((*(double *)&v28 - (double)(int)*(double *)&v28) * 1000000.0);
                          v66 = select(v64 + 1, &v125, 0, 0, &v122);
                          v7 = v114;
                          if (!v66)
                          {
                            v44 = 0;
                            v47 = v106;
                            goto LABEL_215;
                          }
                          if (v66 == -1)
                            break;
                          v67 = recv(v31, &v120, 4uLL, 0);
                          if ((v62 & 1) == 0)
                          {
                            v45 = (const void *)v112;
                            if (v67 != 4 || (v101 = bswap32(v120), (v101 - 1501) < 0xFFFFFA24))
                            {
                              v44 = 0;
                              v47 = 2149187618;
                              goto LABEL_94;
                            }
                            v44 = malloc_type_malloc(v101, 0xE83B148AuLL);
                            if (v44)
                            {
                              if ((_DWORD)v101 == recv(v31, v44, v101, 0))
                                v47 = GCKSessionEstablishConnectionWithRelayInfo(v109, v118, (uint64_t)v44, v101, 0);
                              else
                                v47 = 2149187618;
                            }
                            else
                            {
                              v47 = 2149187587;
                            }
                            v7 = v114;
                            v9 = v115;
                            goto LABEL_215;
                          }
                          v43 = v113;
                          if (v67 != 4)
                            goto LABEL_195;
                          if (v120 == -1)
                          {
                            v102 = recv(v31, &v120, 4uLL, 0);
                            v45 = (const void *)v112;
                            if (v102 == 4)
                            {
                              v103 = bswap32(v120);
                              v120 = v103;
                              if (v103 == 1)
                              {
                                v44 = 0;
                                v47 = 2149187625;
                              }
                              else
                              {
                                v44 = 0;
                                if (v103 == 2)
                                  v47 = 2149187603;
                                else
                                  v47 = 2149187632;
                              }
                            }
                            else
                            {
                              v44 = 0;
                              v47 = 2149187618;
                            }
                            goto LABEL_137;
                          }
                          if (bswap32(v120) != v118 || (buf[0] = -86, recv(v31, buf, 1uLL, 0) != 1))
                          {
LABEL_195:
                            v44 = 0;
                            v47 = 2149187618;
                            goto LABEL_216;
                          }
                          *(_QWORD *)&v68 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          v137 = v68;
                          v138 = v68;
                          v135 = v68;
                          v136 = v68;
                          v133 = v68;
                          v134 = v68;
                          v131 = v68;
                          v132 = v68;
                          v129 = v68;
                          v130 = v68;
                          v127 = v68;
                          v128 = v68;
                          *(_OWORD *)&v126[32] = v68;
                          *(_OWORD *)&v126[48] = v68;
                          *(_OWORD *)v126 = v68;
                          *(_OWORD *)&v126[16] = v68;
                          v69 = recv(v31, v126, buf[0], 0);
                          if (v69 != buf[0])
                          {
                            v47 = 2149187618;
                            goto LABEL_210;
                          }
                          v70 = GCKSessionPrepareConnectionWithRelayInfo(v109, v118, (uint64_t)&v121, (uint64_t)&v119, 0, 0);
                          if ((v70 & 0x80000000) != 0)
                          {
                            v47 = v70;
                            goto LABEL_210;
                          }
                          pthread_rwlock_wrlock(v105);
                          for (i = *(_QWORD *)(v9 + 7888); i; i = *(_QWORD *)(i + 728))
                          {
                            if (*(_DWORD *)(i + 116) == v118)
                            {
                              v39 = buf[0];
                              *(_DWORD *)(i + 376) = buf[0];
                              memcpy((void *)(i + 120), v126, v39);
                              *(_QWORD *)&v112 = i + 120;
                              *(_BYTE *)(i + 120 + v39) = 0;
                            }
                          }
                          pthread_rwlock_unlock(v105);
                          v120 = bswap32(v119);
                          if (send(v31, &v120, 4uLL, 0) != 4
                            || (v72 = send(v31, v121, v119, 0), v119 != v72))
                          {
                            v47 = *__error() | 0xC01A0000;
                            v43 = v113;
LABEL_210:
                            v44 = 0;
                            goto LABEL_216;
                          }
                          v61 = 0;
                          v43 = v113;
                          if ((v62 & 1) == 0)
                          {
                            v44 = 0;
                            v47 = 0;
LABEL_216:
                            v45 = (const void *)v112;
                            goto LABEL_137;
                          }
                        }
                        v100 = __error();
                        v43 = v113;
                        v45 = (const void *)v112;
                        if (*v100 == 9)
                        {
                          v44 = 0;
                          v47 = 2149187614;
                          goto LABEL_137;
                        }
                        v73 = __error();
                        v44 = 0;
                      }
                      else
                      {
                        v73 = __error();
                        LODWORD(v39) = 0;
                        v44 = 0;
                        v45 = 0;
                      }
                      v47 = *v73 | 0xC01A0000;
                      goto LABEL_137;
                    }
                    LODWORD(v39) = 0;
                    v44 = 0;
                    v45 = 0;
                    v47 = *__error() | 0xC01A0000;
                  }
LABEL_94:
                  v43 = v113;
                  goto LABEL_137;
                }
              }
              else if (!__darwin_check_fd_set_overflow(v31, &v123, 0)
                     || ((*(unsigned int *)((char *)v123.fds_bits + (((unint64_t)v31 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v31) & 1) == 0)
              {
                goto LABEL_60;
              }
              close(v31);
              *v41 = -1;
            }
LABEL_60:
            ++v41;
            if (!--v40)
            {
              v29 = 0;
              *((_QWORD *)&v28 + 1) = 0;
              memset(&v124, 0, sizeof(v124));
              memset(&v123, 0, sizeof(v123));
              v31 = -1;
              v7 = v114;
              v9 = v115;
              v32 = v117;
              if ((v113 & 1) == 0)
              {
                v43 = 0;
                LODWORD(v39) = 0;
                v44 = 0;
                v45 = 0;
LABEL_72:
                v47 = v112;
                goto LABEL_137;
              }
              goto LABEL_26;
            }
          }
        }
LABEL_93:
        v44 = 0;
        v45 = 0;
        v31 = -1;
        v47 = v106;
        goto LABEL_94;
      }
      v59 = __error();
      v43 = v113;
      LODWORD(v39) = 0;
      v44 = 0;
      v45 = 0;
      if (*v59 == 9)
        v47 = 2149187614;
      else
        v47 = *__error() | 0xC01A0000;
      v31 = -1;
LABEL_137:
      if (v121)
        free(v121);
      if (v44)
        free(v44);
      if ((v47 & 0x80000000) != 0)
      {
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if ((_DWORD)v47 == -2145779682)
        {
          if (ErrorLogLevelForModule >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              gckSessionLocalClientProc_cold_1();
          }
        }
        else
        {
          v75 = v43;
          if (ErrorLogLevelForModule >= 3)
          {
            v76 = VRTraceErrorLogLevelToCSTR();
            v77 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v126 = 136316162;
              *(_QWORD *)&v126[4] = v76;
              *(_WORD *)&v126[12] = 2080;
              *(_QWORD *)&v126[14] = "gckSessionLocalClientProc";
              *(_WORD *)&v126[22] = 1024;
              *(_DWORD *)&v126[24] = 4373;
              *(_WORD *)&v126[28] = 1024;
              *(_DWORD *)&v126[30] = v118;
              *(_WORD *)&v126[34] = 1024;
              *(_DWORD *)&v126[36] = v47;
              _os_log_error_impl(&dword_215C5C000, v77, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection failed to %08X(%08X)", v126, 0x28u);
            }
          }
          PostEventCallback(*(_QWORD *)(v9 + 96), v118, 2, v45, v39, v47);
          v43 = v75;
        }
        gckSessionDisconnectNeighbor(v9, v118, 1);
        v31 = -1;
      }
      *(_QWORD *)&v112 = v47;
      v113 = v43;
      if (v43)
      {
        v78 = 0;
        v79 = (pthread_rwlock_t *)(v115 + 7904);
        *(_QWORD *)&v28 = 136316418;
        v116 = v28;
        v80 = v117;
        do
        {
          v81 = *(_DWORD *)(v80 + 4 * v78);
          if (v81 != -1)
          {
            if (v81 == v31)
            {
              pthread_rwlock_wrlock(v79);
              for (j = *(_QWORD *)(v115 + 7888); j; j = *(_QWORD *)(j + 728))
              {
                if (*(_DWORD *)(j + 116) == v118)
                {
                  *(_DWORD *)(j + 72) = dup(v31);
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v83 = VRTraceErrorLogLevelToCSTR();
                    v84 = *MEMORY[0x24BDFDC28];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                    {
                      v85 = *(_DWORD *)(j + 72);
                      *(_DWORD *)v126 = v116;
                      *(_QWORD *)&v126[4] = v83;
                      *(_WORD *)&v126[12] = 2080;
                      *(_QWORD *)&v126[14] = "gckSessionLocalClientProc";
                      *(_WORD *)&v126[22] = 1024;
                      *(_DWORD *)&v126[24] = 4393;
                      *(_WORD *)&v126[28] = 1024;
                      *(_DWORD *)&v126[30] = v31;
                      *(_WORD *)&v126[34] = 1024;
                      *(_DWORD *)&v126[36] = v85;
                      *(_WORD *)&v126[40] = 1024;
                      *(_DWORD *)&v126[42] = v118;
                      _os_log_impl(&dword_215C5C000, v84, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d client dup TCP socket (%d->%d) for server ID %08X\n", v126, 0x2Eu);
                    }
                  }
                }
              }
              pthread_rwlock_unlock(v79);
              v7 = v114;
            }
            else
            {
              shutdown(*(_DWORD *)(v80 + 4 * v78), 2);
            }
            close(v81);
            v80 = v117;
          }
          ++v78;
        }
        while (v78 != v7);
      }
      v86 = v115;
      v87 = (pthread_mutex_t *)(v115 + 8232);
      pthread_mutex_lock((pthread_mutex_t *)(v115 + 8232));
      v89 = *(char **)(v86 + 8224);
      if (v89)
      {
        v90 = (void **)(v86 + 8224);
        *(_QWORD *)&v88 = 136315906;
        v117 = v88;
        v91 = v112;
        while (*((_DWORD *)v89 + 2) != v118)
        {
          v90 = (void **)(v89 + 16);
LABEL_180:
          v89 = (char *)*v90;
          if (!*v90)
            goto LABEL_185;
        }
        *v90 = (void *)*((_QWORD *)v89 + 2);
        v92 = *(_DWORD *)v89;
        if (v31 == -1 || v92 != v31)
          close(v92);
        v93 = *((_DWORD *)v89 + 1);
        if (v93 != -1)
        {
          close(v93);
LABEL_179:
          free(v89);
          goto LABEL_180;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3
          && (v94 = VRTraceErrorLogLevelToCSTR(),
              v95 = *MEMORY[0x24BDFDC28],
              os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)v126 = v117;
          *(_QWORD *)&v126[4] = v94;
          *(_WORD *)&v126[12] = 2080;
          *(_QWORD *)&v126[14] = "gckSessionLocalClientProc";
          *(_WORD *)&v126[22] = 1024;
          *(_DWORD *)&v126[24] = 4417;
          *(_WORD *)&v126[28] = 1024;
          *(_DWORD *)&v126[30] = v118;
          _os_log_error_impl(&dword_215C5C000, v95, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection cancelled to %08X", v126, 0x22u);
          if (v91 < 0)
            goto LABEL_178;
        }
        else if (v91 < 0)
        {
LABEL_178:
          v91 = -2145779682;
          goto LABEL_179;
        }
        gckSessionDisconnectNeighbor(v115, v118, 1);
        goto LABEL_178;
      }
      v91 = v112;
LABEL_185:
      pthread_mutex_unlock(v87);
      v96 = v108;
      v97 = v110;
      if (v110)
      {
        if (v113)
        {
          v98 = (void **)v110;
          do
          {
            if (*v98)
              free(*v98);
            ++v98;
            --v7;
          }
          while (v7);
        }
        free(v97);
        free(v111);
      }
      free(v96);
      CheckOutHandleDebug();
      return v91;
    }
    else
    {
      if (v6)
      {
        if ((int)v7 >= 1)
        {
          v46 = (void **)v6;
          do
          {
            if (*v46)
              free(*v46);
            ++v46;
            --v7;
          }
          while (v7);
        }
        free(v6);
      }
      free(a1);
      return -2145779710;
    }
  }
  return v2;
}

uint64_t gckSessionDeleteNode(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  int v13;
  _DWORD *v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315906;
      v21 = v6;
      v22 = 2080;
      v23 = "gckSessionDeleteNode";
      v24 = 1024;
      v25 = 1229;
      v26 = 1024;
      v27 = a2;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Deleting a node %08X", (uint8_t *)&v20, 0x22u);
    }
  }
  result = 2149187606;
  v9 = *(unsigned int *)(a1 + 400);
  v10 = a1 + 404;
  if ((int)v9 < 1)
  {
    LODWORD(v11) = 0;
  }
  else
  {
    v11 = 0;
    v12 = (int *)(a1 + 404);
    while (1)
    {
      v13 = *v12;
      v12 += 3;
      if (v13 == a2)
        break;
      if (v9 == ++v11)
        return result;
    }
  }
  if ((_DWORD)v11 != (_DWORD)v9)
  {
    v14 = (_DWORD *)(v10 + 12 * v11);
    v15 = v14[1];
    memmove(v14, (const void *)(v10 + 12 * (v11 + 1)), 12 * ((int)v9 + ~(_DWORD)v11));
    --*(_DWORD *)(a1 + 400);
    if (v15 != -1 || a3 != 0)
    {
      ++*(_WORD *)(a1 + 388);
      *(_DWORD *)(a1 + 392) = 1;
      v17 = *(unsigned int *)(a1 + 112);
      if (a3 && (int)v17 > 0)
      {
        v18 = 0;
        v19 = a1;
        while (*(_DWORD *)(v19 + 116) != a2)
        {
          ++v18;
          v19 += 480;
          if (v17 == v18)
            goto LABEL_22;
        }
        memmove((void *)(v19 + 116), (const void *)(v19 + 596), 480 * (~(_DWORD)v18 + (int)v17));
        LODWORD(v17) = *(_DWORD *)(a1 + 112) - 1;
        *(_DWORD *)(a1 + 112) = v17;
      }
LABEL_22:
      gckSessionFindShortestPath(v17, (_DWORD *)(a1 + 116));
    }
    return 0;
  }
  return result;
}

uint64_t GCKSessionCancelConnectToLocalService(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "GCKSessionCancelConnectToLocalService";
      v15 = 1024;
      v16 = 7000;
      v17 = 1024;
      v18 = a2;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling connection attempt to local service [%08X]", (uint8_t *)&v11, 0x22u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 8232));
  v7 = *(_QWORD *)(v4 + 8224);
  if (v7)
  {
    while (*(_DWORD *)(v7 + 8) != a2)
    {
      v7 = *(_QWORD *)(v7 + 16);
      if (!v7)
        goto LABEL_11;
    }
    close(*(_DWORD *)(v7 + 4));
    *(_DWORD *)(v7 + 4) = -1;
  }
LABEL_11:
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 8232));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 7904));
  v9 = *(_QWORD *)(v4 + 7888);
  if (v9)
  {
    v10 = 0;
    do
    {
      if (*(_DWORD *)(v9 + 116) == a2)
      {
        if (*(_DWORD *)(v9 + 408) > 1u)
          v10 = 1;
        else
          *(_DWORD *)(v9 + 80) = 1;
      }
      v9 = *(_QWORD *)(v9 + 728);
    }
    while (v9);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 7904));
    if (v10)
      gckSessionDisconnectNeighbor(v4, a2, 1);
  }
  else
  {
    pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 7904));
  }
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionDisconnectNeighbor(uint64_t a1, int a2, int a3)
{
  int v6;
  uint64_t v7;
  int *v8;
  int v9;
  uint64_t v10;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v16;
  BOOL v17;
  _DWORD *v18;
  int v19;
  pthread_rwlock_t *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  _DWORD __dst[120];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v20 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  memcpy(__dst, (const void *)(a1 + 116), sizeof(__dst));
  v6 = __dst[71];
  if (__dst[71] < 1)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    v7 = 0;
    v8 = &__dst[72];
    while (1)
    {
      v9 = *v8;
      v8 += 3;
      if (v9 == a2)
        break;
      if (__dst[71] == ++v7)
        goto LABEL_8;
    }
  }
  if ((_DWORD)v7 != __dst[71])
  {
    v16 = a1 + 12 * v7;
    v17 = (*(_DWORD *)(v16 + 412) & ~a3) == 0;
    *(_DWORD *)(v16 + 412) &= ~a3;
    if (!v17)
    {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
      return pthread_rwlock_unlock(v20);
    }
    v18 = &__dst[3 * v7 + 72];
    v19 = v18[1];
    memmove(v18, &__dst[3 * (v7 + 1) + 72], 12 * (v6 + ~(_DWORD)v7));
    --__dst[71];
    if (v19 == -1)
    {
      memcpy((void *)(a1 + 116), __dst, 0x1E0uLL);
      *(_DWORD *)(a1 + 392) = 0;
    }
    else
    {
      ++LOWORD(__dst[68]);
      __dst[69] = 1;
      gckSessionSendLSA(a1, 1, __dst, -1, 1);
      memcpy((void *)(a1 + 116), __dst, 0x1E0uLL);
      *(_DWORD *)(a1 + 392) = 0;
      gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
    }
  }
LABEL_8:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  v10 = *(_QWORD *)(a1 + 7888);
  if (v10)
  {
    v11 = (os_log_t *)MEMORY[0x24BDFDC28];
    do
    {
      if (*(_DWORD *)(v10 + 116) == a2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_DWORD *)(v10 + 116);
            *(_DWORD *)buf = 136315906;
            v22 = v12;
            v23 = 2080;
            v24 = "gckSessionDisconnectNeighbor";
            v25 = 1024;
            v26 = 3131;
            v27 = 1024;
            v28 = v14;
            _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionDisconnectNeighbor closing (%d)", buf, 0x22u);
          }
        }
        *(_DWORD *)(v10 + 84) = 1;
      }
      v10 = *(_QWORD *)(v10 + 728);
    }
    while (v10);
  }
  return pthread_rwlock_unlock(v20);
}

uint64_t GCKSessionRespondToInvitation(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "GCKSessionRespondToInvitation";
      v15 = 1024;
      v16 = 7049;
      v17 = 1024;
      v18 = a2;
      v19 = 1024;
      v20 = a3;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d acceptInvitation from [%08X]: %d", (uint8_t *)&v11, 0x28u);
    }
  }
  if (a3)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 7904));
    v9 = gckSessionSendDD(v6, a2, 1);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 7904));
  }
  else
  {
    gckSessionDisconnectNeighbor(v6, a2, 2);
    v9 = 0;
  }
  CheckOutHandleDebug();
  return v9;
}

uint64_t gckSessionSendDD(uint64_t a1, unsigned int a2, int a3)
{
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  pthread_mutex_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v6;
  v28 = v6;
  v26 = (void *)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = " back";
      *(_DWORD *)buf = 136316162;
      if (a3)
        v9 = "";
      v30 = v7;
      v31 = 2080;
      v32 = "gckSessionSendDD";
      v33 = 1024;
      v34 = 1718;
      v35 = 2080;
      v36 = v9;
      v37 = 1024;
      v38 = a2;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending DD%s to [%08X]", buf, 0x2Cu);
    }
  }
  v10 = 2149187606;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  v11 = *(_DWORD *)(a1 + 112);
  HIDWORD(v27) = v11;
  *(_QWORD *)&v28 = a1 + 116;
  v12 = *(_QWORD *)(a1 + 7888);
  if (!v12)
  {
LABEL_9:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
    return v10;
  }
  while (*(_DWORD *)(v12 + 116) != a2)
  {
    v12 = *(_QWORD *)(v12 + 728);
    if (!v12)
      goto LABEL_9;
  }
  if (!*(_DWORD *)(v12 + 88))
  {
    ++*(_WORD *)(a1 + 388);
    *(_DWORD *)(a1 + 392) = 1;
  }
  TracePrintNodes(v11, a1 + 116);
  v14 = OSPFMakeDD((Bytef **)&v26, (uint64_t)&v27, 0, *(_DWORD *)(a1 + 108), a2, *(_DWORD *)(v12 + 48));
  *(_DWORD *)(v12 + 88) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  if ((v14 & 0x80000000) != 0)
    return 2149187618;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = v15;
      v31 = 2080;
      v32 = "gckSessionSendDD";
      v33 = 1024;
      v34 = 1753;
      v35 = 1024;
      LODWORD(v36) = v14;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Made DD of %d bytes", buf, 0x22u);
    }
  }
  if (!a3)
  {
    v10 = SendUDPPacketToParticipantChannelID(a1, v26, v14, a2, 0, -1, 0);
LABEL_26:
    free(v26);
    return v10;
  }
  v17 = *(_QWORD *)(a1 + 7888);
  if (!v17)
  {
LABEL_21:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionSendDD_cold_1();
    }
    goto LABEL_26;
  }
  while (*(_DWORD *)(v17 + 116) != a2)
  {
    v17 = *(_QWORD *)(v17 + 728);
    if (!v17)
      goto LABEL_21;
  }
  v18 = (pthread_mutex_t *)(v17 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v17 + 664));
  v19 = *(_QWORD *)(v17 + 496);
  if (v19)
  {
    while (1)
    {
      v20 = v19;
      if (*(_BYTE *)v19 == 2)
        break;
      v19 = *(_QWORD *)(v19 + 64);
      if (!v19)
      {
        v21 = (_QWORD *)(v20 + 64);
        goto LABEL_32;
      }
    }
    *(_OWORD *)(v19 + 8) = xmmword_215CDD8E0;
    *(_QWORD *)(v19 + 32) = 0x4082BFEB851EB852;
    v24 = *(void **)(v19 + 40);
    if (v24)
      free(v24);
    *(_QWORD *)(v20 + 40) = v26;
    *(_DWORD *)(v20 + 48) = v14;
    *(_DWORD *)(v20 + 52) = a2;
  }
  else
  {
    v21 = (_QWORD *)(v17 + 496);
LABEL_32:
    v22 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *v22 = 2;
    *(_OWORD *)(v22 + 8) = xmmword_215CDD8E0;
    v23 = v26;
    *((_QWORD *)v22 + 4) = 0x4082BFEB851EB852;
    *((_QWORD *)v22 + 5) = v23;
    *((_DWORD *)v22 + 12) = v14;
    *((_DWORD *)v22 + 13) = a2;
    *v21 = v22;
  }
  pthread_mutex_unlock(v18);
  v25 = *(_DWORD *)(a1 + 12);
  if (v25 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v25);
  }
  return 0;
}

uint64_t GCKSessionPrepareConnection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return GCKSessionPrepareConnectionWithRelayInfo(a1, a2, a3, a4, 0, 0);
}

uint64_t GCKSessionPrepareConnectionWithRelayInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int ErrorLogLevelForModule;
  _BYTE *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  int v39;
  int v40;
  pthread_rwlock_t *v41;
  int *v42;
  int *v43;
  int LocalInterfaceListWithOptions;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v9 = 2149187606;
  v42 = 0;
  v10 = CheckInHandleDebug();
  if (v10)
  {
    v11 = v10;
    LocalInterfaceListWithOptions = -1431655766;
    v43 = (int *)0xAAAAAAAAAAAAAAAALL;
    if (a5)
      goto LABEL_3;
    _os_feature_enabled_impl();
    LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
    if (!LocalInterfaceListWithOptions)
    {
      FreeLocalInterfaceList();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCKSessionPrepareConnectionWithRelayInfo_cold_1();
      }
      goto LABEL_56;
    }
    v39 = a6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v46 = v13;
        v47 = 2080;
        v48 = "GCKSessionPrepareConnectionWithRelayInfo";
        v49 = 1024;
        v50 = 7101;
        v51 = 1024;
        v52 = a2;
        v53 = 1024;
        v54 = LocalInterfaceListWithOptions;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d interfaces found.\n", buf, 0x28u);
      }
    }
    if (_os_feature_enabled_impl())
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v16 = (_BYTE *)MEMORY[0x24BDFDC18];
      if (ErrorLogLevelForModule >= 8)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x24BDFDC28];
        v19 = *MEMORY[0x24BDFDC28];
        if (*v16)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v46 = v17;
            v47 = 2080;
            v48 = "GCKSessionPrepareConnectionWithRelayInfo";
            v49 = 1024;
            v50 = 7104;
            v51 = 1024;
            v52 = LocalInterfaceListWithOptions;
            _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter trimming interface list from all interfaces. count=%d", buf, 0x22u);
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          GCKSessionPrepareConnectionWithRelayInfo_cold_3();
        }
      }
      GCKSession_TrimLocalInterfaceList(&v43, &LocalInterfaceListWithOptions, v39 != 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x24BDFDC28];
        v22 = *MEMORY[0x24BDFDC28];
        if (*v16)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v46 = v20;
            v47 = 2080;
            v48 = "GCKSessionPrepareConnectionWithRelayInfo";
            v49 = 1024;
            v50 = 7106;
            v51 = 1024;
            v52 = LocalInterfaceListWithOptions;
            _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter job done. Remaining interfaces count=%d.", buf, 0x22u);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          GCKSessionPrepareConnectionWithRelayInfo_cold_2();
        }
      }
    }
    if (LocalInterfaceListWithOptions < 1)
    {
      v35 = 0;
    }
    else
    {
      v23 = 0;
      v24 = 0;
      v40 = 0;
      v41 = (pthread_rwlock_t *)(v11 + 7904);
      do
      {
        v25 = if_nametoindex((const char *)&v43[10 * v23 + 1]);
        if ((gckSessionCreateSocketAndBind((__int128 *)&v43[10 * v23], a2, *(_DWORD *)(v11 + 88), &v42) & 0x80000000) == 0)
        {
          v26 = v42;
          *((_QWORD *)v42 + 67) = 0x3FB999999999999ALL;
          *((_QWORD *)v26 + 49) = 0x404DFEB851EB851FLL;
          *((_QWORD *)v26 + 48) = *(_QWORD *)(v11 + 24);
          v26[26] = v25;
          if ((ICEAddOneInterface() & 0x80000000) != 0)
          {
            close(*v26);
            freeOptionsList((uint64_t *)v26 + 64);
            freeOptionsList((uint64_t *)v26 + 65);
            pthread_mutex_destroy((pthread_mutex_t *)(v26 + 166));
            BWE_CloseObject((uint64_t)v26);
            free(v26);
          }
          else
          {
            v27 = a2;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v28 = VRTraceErrorLogLevelToCSTR();
              v29 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                v46 = v28;
                v47 = 2080;
                v48 = "GCKSessionPrepareConnectionWithRelayInfo";
                v49 = 1024;
                v50 = 7136;
                v51 = 1024;
                v52 = v27;
                v53 = 1024;
                v54 = 6;
                _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionPrepareConnectionWithRelayInfo: SUCCESS adding interface for remoteID[%08X]: proto %d", buf, 0x28u);
              }
            }
            if ((v26[103] & 1) != 0)
            {
              GCKGetNAT64Prefix(v11, (uint64_t)(v26 + 103));
              ICEUpdateNAT64FlagForInterface();
            }
            *((_OWORD *)v26 + 34) = 0u;
            *((_WORD *)v26 + 284) = 1;
            *((_WORD *)v26 + 309) = 0;
            *(_OWORD *)((char *)v26 + 570) = 0u;
            *(_OWORD *)((char *)v26 + 586) = 0u;
            *(_OWORD *)((char *)v26 + 602) = 0u;
            pthread_rwlock_wrlock(v41);
            v30 = v11 + 7888;
            if (*(_QWORD *)(v11 + 7888))
            {
              v30 = v11 + 7888;
              do
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v31 = VRTraceErrorLogLevelToCSTR();
                  v32 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    v33 = *(_DWORD *)(*(_QWORD *)v30 + 116);
                    *(_DWORD *)buf = 136315906;
                    v46 = v31;
                    v47 = 2080;
                    v48 = "GCKSessionPrepareConnectionWithRelayInfo";
                    v49 = 1024;
                    v50 = 7163;
                    v51 = 1024;
                    v52 = v33;
                    _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** %08X", buf, 0x22u);
                  }
                }
                v30 = *(_QWORD *)v30 + 728;
              }
              while (*(_QWORD *)v30);
            }
            *(_QWORD *)v30 = v26;
            pthread_rwlock_unlock(v41);
            ++*(_DWORD *)(v11 + 88);
            ++v40;
            v24 = 1;
            a2 = v27;
          }
        }
        ++v23;
      }
      while (v23 < LocalInterfaceListWithOptions);
      v9 = 2149187606;
      if (v24)
      {
        pthread_rwlock_rdlock(v41);
        v34 = *(_DWORD *)(v11 + 12);
        v35 = v40;
        if (v34 != -1)
        {
          *(_DWORD *)(v11 + 12) = -1;
          close(v34);
        }
        pthread_rwlock_unlock(v41);
      }
      else
      {
        v35 = v40;
      }
    }
    FreeLocalInterfaceList();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v46 = v36;
        v47 = 2080;
        v48 = "GCKSessionPrepareConnectionWithRelayInfo";
        v49 = 1024;
        v50 = 7183;
        v51 = 1024;
        v52 = a2;
        v53 = 1024;
        v54 = v35;
        _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d valid interfaces found.\n", buf, 0x28u);
      }
    }
    if (v35)
    {
LABEL_3:
      v12 = ICEGetCandidates();
      if ((v12 & 0x80000000) == 0)
      {
        v9 = 0;
LABEL_58:
        CheckOutHandleDebug();
        return v9;
      }
      v9 = v12;
    }
LABEL_56:
    if (*(_DWORD *)(v11 + 104) == 1)
      gckSessionDisconnectNeighbor(v11, a2, 255);
    goto LABEL_58;
  }
  return 2149187586;
}

uint64_t gckSessionCreateSocketAndBind(__int128 *a1, int a2, int a3, int **a4)
{
  sockaddr v8;
  char *v9;
  int *v10;
  __int128 v11;
  __int128 v12;
  int v13;
  int ai_family;
  const char *v15;
  uint64_t v16;
  int v18;
  addrinfo *v19;
  addrinfo *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  sockaddr *ai_addr;
  unsigned int v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  int v33;
  int v34;
  int v35;
  addrinfo *v36;
  addrinfo v37;
  socklen_t v38;
  char v39[8];
  _BYTE buf[22];
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  _DWORD *v48;
  __int16 v49;
  int v50;
  sockaddr v51;
  sockaddr v52;
  sockaddr v53;
  sockaddr v54;
  sockaddr v55;
  sockaddr v56;
  sockaddr v57;
  sockaddr v58;
  sockaddr v59;
  sockaddr v60;
  unint64_t v61;
  sockaddr v62;
  sockaddr v63;
  _OWORD v64[5];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v64[3] = v8;
  v64[4] = v8;
  v64[2] = v8;
  *(_QWORD *)((char *)v64 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v63 = v8;
  v64[0] = v8;
  v62 = v8;
  v38 = -1431655766;
  memset(v39, 170, 6);
  v61 = 0xAAAAAAAAAAAAAAAALL;
  v59 = v8;
  v60 = v8;
  *(sockaddr *)&v37.ai_addrlen = v8;
  *(sockaddr *)&v37.ai_addr = v8;
  *(sockaddr *)&v37.ai_flags = v8;
  v36 = (addrinfo *)0xAAAAAAAAAAAAAAAALL;
  v57 = v8;
  v58 = v8;
  v55 = v8;
  v56 = v8;
  v53 = v8;
  v54 = v8;
  v51 = v8;
  v52 = v8;
  v9 = (char *)malloc_type_calloc(1uLL, 0x300uLL, 0x10200408D2C4DCCuLL);
  if (!v9)
  {
    v16 = 2149187587;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionCreateSocketAndBind_cold_1();
    }
    return v16;
  }
  v10 = (int *)v9;
  *((_DWORD *)v9 + 29) = a2;
  *((_DWORD *)v9 + 25) = a3;
  *(_QWORD *)(v9 + 108) = -1;
  *((_DWORD *)v9 + 102) = 0;
  v11 = *a1;
  v12 = a1[1];
  *(_QWORD *)(v9 + 444) = *((_QWORD *)a1 + 4);
  *(_OWORD *)(v9 + 412) = v11;
  *(_OWORD *)(v9 + 428) = v12;
  v13 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 1) != 0)
    ai_family = 30;
  else
    ai_family = 2;
  memset(&v37.ai_socktype, 0, 40);
  v37.ai_flags = 5;
  v37.ai_family = ai_family;
  v37.ai_socktype = 2;
  if ((v13 & 1) != 0)
  {
    if (*(_QWORD *)((char *)a1 + 20) != *MEMORY[0x24BDAE878]
      || *(_QWORD *)((char *)a1 + 28) != *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
    {
      goto LABEL_7;
    }
LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
  if (!*((_DWORD *)a1 + 5))
    goto LABEL_16;
LABEL_7:
  v15 = (const char *)IPToString();
LABEL_17:
  __sprintf_chk(v39, 0, 6uLL, "%u", *((unsigned __int16 *)a1 + 18));
  v18 = getaddrinfo(v15, v39, &v37, &v36);
  if (v18)
  {
    v16 = v18 | 0xB01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionCreateSocketAndBind_cold_7();
    }
LABEL_62:
    free(v10);
    return v16;
  }
  v19 = v36;
  if (v36)
  {
    v20 = v36;
    while (v20->ai_family != ai_family)
    {
      v20 = v20->ai_next;
      if (!v20)
      {
        ai_family = v36->ai_family;
        goto LABEL_30;
      }
    }
    v19 = v20;
LABEL_30:
    v10[18] = -1;
    v21 = socket(ai_family, v19->ai_socktype, v19->ai_protocol);
    *v10 = v21;
    if (v21 == -1)
    {
      v16 = *__error() | 0xC00F0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionCreateSocketAndBind_cold_3();
      }
      freeaddrinfo(v36);
      goto LABEL_62;
    }
    v35 = 1;
    if ((v13 & 1) != 0)
    {
      setsockopt(v21, 41, 27, &v35, 4u);
      if ((*((_BYTE *)a1 + 1) & 1) != 0)
      {
        *(_DWORD *)buf = 1;
        setsockopt(*v10, 0xFFFF, 4356, buf, 4u);
      }
      v22 = *v10;
      v23 = 41;
      v24 = 61;
    }
    else
    {
      *(_DWORD *)buf = if_nametoindex((const char *)a1 + 4);
      setsockopt(*v10, 0, 25, buf, 4u);
      setsockopt(*v10, 0, 7, &v35, 4u);
      v22 = *v10;
      v23 = 0;
      v24 = 20;
    }
    setsockopt(v22, v23, v24, &v35, 4u);
    v34 = 1;
    setsockopt(*v10, 0xFFFF, 4130, &v34, 4u);
    v33 = 500;
    setsockopt(*v10, 0xFFFF, 4230, &v33, 4u);
    ai_addr = v19->ai_addr;
    v26 = 16402;
    do
    {
      *(_WORD *)ai_addr->sa_data = bswap32(v26) >> 16;
      if (!bind(*v10, v19->ai_addr, v19->ai_addrlen))
      {
        freeaddrinfo(v36);
        goto LABEL_48;
      }
      --v26;
    }
    while ((unsigned __int16)v26 >= 0x4000u);
    *(_WORD *)ai_addr->sa_data = 0;
    v27 = bind(*v10, v19->ai_addr, v19->ai_addrlen);
    freeaddrinfo(v36);
    if (v27)
    {
      v16 = *__error() | 0xC00F0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionCreateSocketAndBind_cold_6();
      }
LABEL_61:
      close(*v10);
      goto LABEL_62;
    }
LABEL_48:
    v38 = 128;
    if (getsockname(*v10, &v51, &v38) == -1)
    {
      v16 = *__error() | 0xC01A0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionCreateSocketAndBind_cold_4();
      }
      goto LABEL_61;
    }
    SAToIPPORT();
    *((_WORD *)v10 + 224) = WORD2(v61);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v30 = IPPORTToStringWithSize();
        v31 = *v10;
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "gckSessionCreateSocketAndBind";
        v41 = 1024;
        v42 = 982;
        v43 = 1024;
        v44 = a2;
        v45 = 2080;
        v46 = v30;
        v47 = 2080;
        v48 = v10 + 104;
        v49 = 1024;
        v50 = v31;
        _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: Start listening on %s(%s) sock %d\n", buf, 0x3Cu);
      }
    }
    *((_QWORD *)v10 + 50) = 0;
    memset(buf, 170, 16);
    if (!pthread_mutexattr_init((pthread_mutexattr_t *)buf))
    {
      pthread_mutexattr_settype((pthread_mutexattr_t *)buf, 2);
      pthread_mutex_init((pthread_mutex_t *)(v10 + 166), (const pthread_mutexattr_t *)buf);
      pthread_mutexattr_destroy((pthread_mutexattr_t *)buf);
      v16 = 0;
      *((_QWORD *)v10 + 92) = 0xFFFFFFFFLL;
      *((_WORD *)v10 + 372) = 0;
      *(_QWORD *)(v10 + 187) = 0;
      *a4 = v10;
      return v16;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionCreateSocketAndBind_cold_5();
    }
    close(*v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gckSessionCreateSocketAndBind_cold_2();
  }
  free(v10);
  return 2149187588;
}

char *GCKGetNAT64Prefix(uint64_t a1, uint64_t a2)
{
  char *v4;
  int v5;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  const char *v12;
  int v13;
  int ErrorLogLevelForModule;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = *(char **)(a1 + 8496);
  if (v4)
  {
    v5 = *(_DWORD *)a2 & 1;
    do
    {
      if ((*(_DWORD *)v4 & 1) == v5)
      {
        if (v5)
        {
          if (*(_QWORD *)(v4 + 20) == *(_QWORD *)(a2 + 20) && *(_QWORD *)(v4 + 28) == *(_QWORD *)(a2 + 28))
          {
LABEL_12:
            if (*((unsigned __int16 *)v4 + 18) == *(unsigned __int16 *)(a2 + 36))
              return v4 + 40;
          }
        }
        else if (*((_DWORD *)v4 + 5) == *(_DWORD *)(a2 + 20))
        {
          goto LABEL_12;
        }
      }
      v4 = (char *)*((_QWORD *)v4 + 7);
      *(_QWORD *)(a1 + 8496) = v4;
    }
    while (v4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    v9 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v25 = v7;
        v26 = 2080;
        v27 = "GCKGetNAT64Prefix";
        v28 = 1024;
        v29 = 447;
        v30 = 2080;
        v31 = (const char *)(a2 + 4);
        v32 = 2048;
        v33 = micro();
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: start NAT64 prefix resolution for %s at %f", buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      GCKGetNAT64Prefix_cold_3();
    }
  }
  v4 = (char *)malloc_type_calloc(1uLL, 0x40uLL, 0x10200406CABA15FuLL);
  *(_QWORD *)(a1 + 8496) = v4;
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v11;
  *((_QWORD *)v4 + 4) = v10;
  v12 = (const char *)(a2 + 4);
  if_nametoindex(v12);
  v13 = nw_nat64_copy_prefixes();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v13 < 1)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      v21 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = micro();
          *(_DWORD *)buf = 136316162;
          v25 = v19;
          v26 = 2080;
          v27 = "GCKGetNAT64Prefix";
          v28 = 1024;
          v29 = 458;
          v30 = 2080;
          v31 = v12;
          v32 = 2048;
          v33 = v22;
          _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: no NAT64 prefix discovered for %s at %f", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        GCKGetNAT64Prefix_cold_2();
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      v17 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = micro();
          *(_DWORD *)buf = 136316162;
          v25 = v15;
          v26 = 2080;
          v27 = "GCKGetNAT64Prefix";
          v28 = 1024;
          v29 = 454;
          v30 = 2080;
          v31 = v12;
          v32 = 2048;
          v33 = v18;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: NAT64 prefix resolved for %s at %f", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        GCKGetNAT64Prefix_cold_1();
      }
    }
    *(_OWORD *)(v4 + 40) = MEMORY[0];
    free(0);
  }
  return v4 + 40;
}

uint64_t GCKSessionEstablishConnection(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return GCKSessionEstablishConnectionWithRelayInfo(a1, a2, a3, a4, 0);
}

uint64_t GCKSessionEstablishConnectionWithRelayInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  int ErrorLogLevelForModule;
  uint64_t v27;
  NSObject *v28;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = 2149187616;
  v8 = CheckInHandleDebug();
  if (v8)
  {
    v9 = v8;
    v10 = ICEGetCallInfoForConnectionData();
    if ((v10 & 0x80000000) != 0)
    {
      v19 = 0;
    }
    else
    {
      if (*(_DWORD *)(v9 + 48))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_DWORD *)(v9 + 108);
            *(_DWORD *)buf = 136316418;
            v31 = v11;
            v32 = 2080;
            v33 = "GCKSessionEstablishConnectionWithRelayInfo";
            v34 = 1024;
            v35 = 7295;
            v36 = 1024;
            v37 = -1431655766;
            v38 = 1024;
            v39 = v13;
            v40 = 1024;
            v41 = a2;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ICCL:%08X, LID:%08X, P:%08X", buf, 0x2Eu);
          }
        }
        *(_DWORD *)(v9 + 44) = -1431655766;
        v14 = *(_QWORD *)(v9 + 7888);
        if (v14)
        {
          v15 = *(_DWORD *)(v9 + 108);
          do
          {
            if (*(_DWORD *)(v14 + 116) == v15)
              *(_DWORD *)(v14 + 116) = -1431655766;
            v14 = *(_QWORD *)(v14 + 728);
          }
          while (v14);
        }
        v16 = gckSessionAddNode(v9, -1431655766, 255);
        if ((v16 & 0x80000000) == 0)
        {
          *(_DWORD *)buf = a5 != 0;
          v16 = ICEStartConnectivityCheck();
          if ((v16 & 0x80000000) == 0)
          {
            v17 = *(_DWORD *)(v9 + 44);
            v18 = v9;
LABEL_40:
            gckSessionChangeState(v18, v17, 0);
            v7 = 0;
LABEL_41:
            CheckOutHandleDebug();
            return v7;
          }
        }
        v7 = v16;
        goto LABEL_19;
      }
      if (*(_DWORD *)(v9 + 108) != -1431655766)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v22 = *(_DWORD *)(v9 + 108);
            *(_DWORD *)buf = 136316418;
            v31 = v20;
            v32 = 2080;
            v33 = "GCKSessionEstablishConnectionWithRelayInfo";
            v34 = 1024;
            v35 = 7249;
            v36 = 1024;
            v37 = 7249;
            v38 = 1024;
            v39 = -1431655766;
            v40 = 1024;
            v41 = v22;
            _os_log_error_impl(&dword_215C5C000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Wrong Connection Data. Participant ID from remote connection data = %08X, local participant ID = %08X\n", buf, 0x2Eu);
          }
        }
LABEL_19:
        v19 = 0;
        goto LABEL_20;
      }
      if (*(_DWORD *)(v9 + 104))
      {
        v19 = 0;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v31 = v23;
            v32 = 2080;
            v33 = "GCKSessionEstablishConnectionWithRelayInfo";
            v34 = 1024;
            v35 = 7254;
            v36 = 1024;
            v37 = a2;
            _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GK START ICE check with peer %08X", buf, 0x22u);
          }
        }
        pthread_mutex_lock((pthread_mutex_t *)(v9 + 7800));
        v25 = *(_DWORD *)(v9 + 400);
        v7 = gckSessionAddNode(v9, a2, 255);
        v19 = v25 != *(_DWORD *)(v9 + 400);
        pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7800));
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if ((v7 & 0x80000000) != 0)
        {
          if (ErrorLogLevelForModule >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              GCKSessionEstablishConnectionWithRelayInfo_cold_1();
          }
          goto LABEL_20;
        }
        if (ErrorLogLevelForModule >= 7)
        {
          v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v31 = v27;
            v32 = 2080;
            v33 = "GCKSessionEstablishConnectionWithRelayInfo";
            v34 = 1024;
            v35 = 7268;
            v36 = 1024;
            v37 = a2;
            _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GK update ice role with peer %08X", buf, 0x22u);
          }
        }
        ICEUpdateRole();
      }
      *(_DWORD *)buf = a5 != 0;
      v10 = ICEStartConnectivityCheck();
      if ((v10 & 0x80000000) == 0)
      {
        v18 = v9;
        v17 = a2;
        goto LABEL_40;
      }
    }
    v7 = v10;
LABEL_20:
    if (v19 || *(_DWORD *)(v9 + 104) == 1)
      gckSessionDisconnectNeighbor(v9, a2, 255);
    goto LABEL_41;
  }
  return 2149187586;
}

uint64_t gckSessionChangeState(uint64_t a1, int a2, int a3)
{
  pthread_rwlock_t *v6;
  uint64_t i;

  v6 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  for (i = *(_QWORD *)(a1 + 7888); i; i = *(_QWORD *)(i + 728))
  {
    if (*(_DWORD *)(i + 116) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 664));
      gckSessionChangeStateCList(a1, i, a3);
      pthread_mutex_unlock((pthread_mutex_t *)(i + 664));
    }
  }
  return pthread_rwlock_unlock(v6);
}

uint64_t gckHandleRetryICEReport(uint64_t a1, int a2, char *a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  pthread_mutex_t *v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  NSObject *v15;
  int *v17;
  int *v18;
  uint64_t *v19;
  __int128 v20;
  int *v21;
  int64x2_t *v22;
  int64x2_t *v23;
  uint64_t ErrorLogLevelForModule;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  float v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  size_t v41;
  char *v42;
  __int128 v43;
  int v44;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  pthread_mutex_t *v51;
  __int128 v52;
  uint8_t v53[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  XDR buf;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = 2149187630;
  v9 = CheckInHandleDebug();
  if (!v9)
    return 2149187586;
  v10 = v9;
  v11 = (pthread_mutex_t *)(v9 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 7800));
  v12 = *(unsigned int *)(v10 + 112);
  if ((int)v12 < 1)
  {
LABEL_6:
    pthread_mutex_unlock(v11);
    goto LABEL_7;
  }
  v13 = (_DWORD *)(v10 + 116);
  while (*v13 != a2)
  {
    v13 += 120;
    if (!--v12)
      goto LABEL_6;
  }
  pthread_mutex_unlock(v11);
  v17 = (int *)GCKSessionDecodeChannelStatisticsInternal(a3, a4);
  if (!v17)
  {
LABEL_7:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        buf.x_op = 136315906;
        *(_QWORD *)(&buf.x_op + 1) = v14;
        WORD2(buf.x_ops) = 2080;
        *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
        HIWORD(buf.x_public) = 1024;
        LODWORD(buf.x_private) = 7457;
        WORD2(buf.x_private) = 1024;
        *(_DWORD *)((char *)&buf.x_private + 6) = a2;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEReport: invalid report target %08X OOB", (uint8_t *)&buf, 0x22u);
      }
    }
    goto LABEL_10;
  }
  v18 = v17;
  v50 = a1;
  v51 = (pthread_mutex_t *)(v10 + 8328);
  pthread_mutex_lock((pthread_mutex_t *)(v10 + 8328));
  v19 = (uint64_t *)(v10 + 8392);
  *(_QWORD *)&v20 = 136315906;
  v52 = v20;
  do
  {
    v21 = (int *)*((_QWORD *)v18 + 18);
    *((_QWORD *)v18 + 18) = 0;
    v22 = (int64x2_t *)*v19;
    v23 = (int64x2_t *)(v10 + 8392);
    if (*v19)
    {
      v23 = (int64x2_t *)(v10 + 8392);
      while (v22->i32[0] != *v18 || v22[4].i32[1] != v18[17])
      {
        v23 = v22 + 9;
        v22 = (int64x2_t *)v22[9].i64[0];
        if (!v22)
          goto LABEL_20;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v30 = *v18;
          buf.x_op = v52;
          *(_QWORD *)(&buf.x_op + 1) = v28;
          WORD2(buf.x_ops) = 2080;
          *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
          HIWORD(buf.x_public) = 1024;
          LODWORD(buf.x_private) = 7387;
          WORD2(buf.x_private) = 1024;
          *(_DWORD *)((char *)&buf.x_private + 6) = v30;
          _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d UPDATE OLD CHANNEL STATUS REPORT (%08X)...", (uint8_t *)&buf, 0x22u);
        }
      }
      v23->i64[0] = (uint64_t)v18;
      if (v22[4].i32[0] == v18[16] && (v31 = *((float *)v18 + 10), v31 > 0.0))
      {
        *((float *)v18 + 10) = v31 + *(float *)&v22[2].i32[2];
        *((int64x2_t *)v18 + 1) = vaddq_s64(*((int64x2_t *)v18 + 1), v22[1]);
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_36;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v34 = *v18;
        buf.x_op = v52;
        *(_QWORD *)(&buf.x_op + 1) = v32;
        WORD2(buf.x_ops) = 2080;
        *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
        HIWORD(buf.x_public) = 1024;
        LODWORD(buf.x_private) = 7395;
        WORD2(buf.x_private) = 1024;
        *(_DWORD *)((char *)&buf.x_private + 6) = v34;
        v35 = v33;
        v36 = " [%s] %s:%d AGGREGATED CHANNEL STATUS REPORT (%08X)...";
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_36;
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v39 = *v18;
        buf.x_op = v52;
        *(_QWORD *)(&buf.x_op + 1) = v37;
        WORD2(buf.x_ops) = 2080;
        *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
        HIWORD(buf.x_public) = 1024;
        LODWORD(buf.x_private) = 7397;
        WORD2(buf.x_private) = 1024;
        *(_DWORD *)((char *)&buf.x_private + 6) = v39;
        v35 = v38;
        v36 = " [%s] %s:%d REPLACED A CHANNEL STATUS REPORT (%08X)...";
      }
      _os_log_impl(&dword_215C5C000, v35, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)&buf, 0x22u);
LABEL_36:
      *((_QWORD *)v18 + 18) = v22[9].i64[0];
      free(v22);
      goto LABEL_37;
    }
LABEL_20:
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((int)ErrorLogLevelForModule >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x24BDFDC28];
      ErrorLogLevelForModule = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)ErrorLogLevelForModule)
      {
        v27 = *v18;
        buf.x_op = v52;
        *(_QWORD *)(&buf.x_op + 1) = v25;
        WORD2(buf.x_ops) = 2080;
        *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
        HIWORD(buf.x_public) = 1024;
        LODWORD(buf.x_private) = 7403;
        WORD2(buf.x_private) = 1024;
        *(_DWORD *)((char *)&buf.x_private + 6) = v27;
        _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FILE A NEW CHANNEL STATUS REPORT (%08X)...", (uint8_t *)&buf, 0x22u);
      }
    }
    v23->i64[0] = (uint64_t)v18;
LABEL_37:
    v18 = v21;
  }
  while (v21);
  v40 = *v19;
  if (*v19)
  {
    LODWORD(v41) = 0;
    do
    {
      v40 = *(_QWORD *)(v40 + 144);
      v41 = (v41 + 150);
    }
    while (v40);
    MEMORY[0x24BDAC7A8](ErrorLogLevelForModule);
    v42 = (char *)&v50 - ((v41 + 15) & 0x1FFFFFFF0);
    memset(v42, 170, v41);
    *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf.x_public = v43;
    *(_OWORD *)&buf.x_base = v43;
    *(_OWORD *)&buf.x_op = v43;
    xdrmem_create(&buf, v42, v41, XDR_ENCODE);
    if (xdr_chanstat_node(&buf, *v19))
      v44 = ((uint64_t (*)(XDR *))buf.x_ops->x_getpostn)(&buf);
    else
      v44 = 0;
    x_destroy = buf.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&buf);
    if (v44)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v46 = VRTraceErrorLogLevelToCSTR();
        v47 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = v52;
          v54 = v46;
          v55 = 2080;
          v56 = "gckHandleRetryICEReport";
          v57 = 1024;
          v58 = 7433;
          v59 = 1024;
          v60 = v44;
          _os_log_impl(&dword_215C5C000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d PROPOGATING CHANNEL STATUS REPORT (SIZE %d BYTES)...", v53, 0x22u);
        }
      }
      PostEventCallback(*(_QWORD *)(v10 + 96), a2, 12, v42, v44, 0);
    }
  }
  pthread_mutex_unlock(v51);
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
  {
    v8 = 0;
  }
  else
  {
    v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      buf.x_op = v52;
      *(_QWORD *)(&buf.x_op + 1) = v48;
      WORD2(buf.x_ops) = 2080;
      *(const __rpc_xdr::xdr_ops **)((char *)&buf.x_ops + 6) = (const __rpc_xdr::xdr_ops *)"gckHandleRetryICEReport";
      HIWORD(buf.x_public) = 1024;
      LODWORD(buf.x_private) = 7449;
      WORD2(buf.x_private) = 1024;
      *(_DWORD *)((char *)&buf.x_private + 6) = a2;
      _os_log_impl(&dword_215C5C000, v49, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEReport: update net status for %08X OOB", (uint8_t *)&buf, 0x22u);
    }
    v8 = 0;
  }
LABEL_10:
  CheckOutHandleDebug();
  return v8;
}

uint64_t xdr_chanstat_node(XDR *a1, uint64_t a2)
{
  uint64_t v4;

  if (xdr_u_int32_t(a1, (u_int32_t *)a2)
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 4))
    && xdr_u_int16_t(a1, (u_int16_t *)(a2 + 8))
    && xdr_u_int16_t(a1, (u_int16_t *)(a2 + 10))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 12))
    && xdr_u_int64_t(a1, (u_int64_t *)(a2 + 16))
    && xdr_u_int64_t(a1, (u_int64_t *)(a2 + 24))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 32))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 36))
    && xdr_float(a1, (float *)(a2 + 40))
    && xdr_float(a1, (float *)(a2 + 44))
    && xdr_float(a1, (float *)(a2 + 48))
    && xdr_float(a1, (float *)(a2 + 52))
    && xdr_float(a1, (float *)(a2 + 56))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 64))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 68))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 72)))
  {
    v4 = 0;
    while (xdr_u_int32_t(a1, (u_int32_t *)(a2 + 76 + v4)))
    {
      v4 += 4;
      if (v4 == 64)
        return xdr_pointer(a1, (char **)(a2 + 144), 0x98u, (xdrproc_t)xdr_chanstat_node);
    }
  }
  return 0;
}

uint64_t gckHandleRetryICEPreparation(uint64_t a1, int a2, int *a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = 2149187585;
  v8 = CheckInHandleDebug();
  if (v8)
  {
    v9 = v8;
    if (*(_DWORD *)(v8 + 108) == a2)
    {
      v10 = 0;
      v7 = 2149187630;
      if (a3 && a4 == 4)
      {
        v10 = *a3;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v22 = v11;
            v23 = 2080;
            v24 = "gckHandleRetryICEPreparation";
            v25 = 1024;
            v26 = 7489;
            v27 = 1024;
            v28 = v10;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEPreparation: prepare retry ice with remoteID %08X OOB", buf, 0x22u);
          }
        }
        v13 = GCKSessionPrepareRetryICE(v9, v10);
        if ((v13 & 0x80000000) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v19 = VRTraceErrorLogLevelToCSTR();
            v20 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v22 = v19;
              v23 = 2080;
              v24 = "gckHandleRetryICEPreparation";
              v25 = 1024;
              v26 = 7514;
              v27 = 1024;
              v28 = v10;
              _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEPreparation: remoteID %08X OOB", buf, 0x22u);
            }
          }
          v7 = 0;
LABEL_18:
          CheckOutHandleDebug();
          return v7;
        }
        v7 = v13;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v22 = v14;
          v23 = 2080;
          v24 = "gckHandleRetryICEPreparation";
          v25 = 1024;
          v26 = 7476;
          v27 = 1024;
          v28 = 0;
          _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEPreparation: localParticpantID check is invalid %08X OOB", buf, 0x22u);
        }
      }
      v10 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v16;
        v23 = 2080;
        v24 = "gckHandleRetryICEPreparation";
        v25 = 1024;
        v26 = 7522;
        v27 = 1024;
        v28 = v10;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEPreparation: null action for remoteID %08X OOB", buf, 0x22u);
      }
    }
    goto LABEL_18;
  }
  return 2149187586;
}

uint64_t GCKSessionPrepareRetryICE(uint64_t a1, int a2)
{
  uint64_t v3;
  int LocalInterfaceListWithOptions;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  pthread_rwlock_t *v9;
  uint64_t *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  pthread_rwlock_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int *v17;
  int v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  int v23;
  int ErrorLogLevelForModule;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int *v31;
  int v32;
  int **v33;
  int **v34;
  int *v35;
  BOOL v36;
  int *v37;
  int v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  int **v42;
  int **v43;
  int *v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v55;
  uint64_t v56;
  int *v58;
  int *v59;
  unint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187606;
  v59 = 0;
  v60 = 0xAAAAAAAAAAAAAAAALL;
  LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  if (!LocalInterfaceListWithOptions)
  {
    FreeLocalInterfaceList();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        GCKSessionPrepareRetryICE_cold_1();
    }
    v48 = 0;
LABEL_76:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v62 = v52;
        v63 = 2080;
        v64 = "GCKSessionPrepareRetryICE";
        v65 = 1024;
        v66 = 2130;
        v67 = 1024;
        v68 = a2;
        v69 = 1024;
        v70 = v48;
        _os_log_error_impl(&dword_215C5C000, v53, OS_LOG_TYPE_ERROR, " [%s] %s:%d remoteID[%08X]: %d valid interfaces found", buf, 0x28u);
      }
    }
    return v3;
  }
  v5 = LocalInterfaceListWithOptions;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v62 = v6;
      v63 = 2080;
      v64 = "GCKSessionPrepareRetryICE";
      v65 = 1024;
      v66 = 2001;
      v67 = 1024;
      v68 = a2;
      v69 = 1024;
      v70 = v5;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d interfaces found.\n", buf, 0x28u);
    }
  }
  if (v5 < 1)
  {
    v48 = 0;
    goto LABEL_70;
  }
  v8 = 0;
  v55 = 0;
  v9 = (pthread_rwlock_t *)(a1 + 7904);
  v10 = (uint64_t *)(a1 + 7888);
  v56 = v5;
  do
  {
    v11 = if_nametoindex((const char *)(v60 + 40 * v8 + 4));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v62 = v12;
        v63 = 2080;
        v64 = "GCKSessionPrepareRetryICE";
        v65 = 1024;
        v66 = 2006;
        v67 = 1024;
        v68 = v8;
        v69 = 1024;
        v70 = v11;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d check %d iIFIndex %d", buf, 0x28u);
      }
    }
    v58 = 0;
    pthread_rwlock_wrlock(v9);
    v14 = v9;
    v15 = *v10;
    v59 = (int *)v15;
    if (!v15)
    {
      pthread_rwlock_unlock(v14);
      v59 = 0;
      v19 = a2;
      v9 = v14;
      goto LABEL_47;
    }
    v16 = v10;
    v17 = 0;
    v18 = 0;
    v19 = a2;
    do
    {
      if (*(_DWORD *)(v15 + 104) != v11 || *(_DWORD *)(v15 + 116) != v19)
        goto LABEL_22;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_DWORD *)(v15 + 100);
          *(_DWORD *)buf = 136316162;
          v62 = v20;
          v63 = 2080;
          v64 = "GCKSessionPrepareRetryICE";
          v65 = 1024;
          v66 = 2019;
          v67 = 1024;
          v68 = v22;
          v69 = 1024;
          v70 = v11;
          _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d found channel %d iIFIndex %d", buf, 0x28u);
        }
      }
      v23 = *(_DWORD *)(v15 + 108);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((v23 & 0x80000000) == 0)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_DWORD *)(v15 + 108);
            *(_DWORD *)buf = 136316162;
            v62 = v25;
            v63 = 2080;
            v64 = "GCKSessionPrepareRetryICE";
            v65 = 1024;
            v66 = 2022;
            v67 = 1024;
            v68 = v27;
            v69 = 1024;
            v70 = v11;
            _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d channel priority %d iIFIndex %d", buf, 0x28u);
          }
        }
        v18 = 1;
        v19 = a2;
LABEL_22:
        v16 = (uint64_t *)(v15 + 728);
        goto LABEL_23;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_DWORD *)(v15 + 112);
          *(_DWORD *)buf = 136316162;
          v62 = v28;
          v63 = 2080;
          v64 = "GCKSessionPrepareRetryICE";
          v65 = 1024;
          v66 = 2025;
          v67 = 1024;
          v68 = v30;
          v69 = 1024;
          v70 = v11;
          _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remove original %d iIFIndex %d", buf, 0x28u);
        }
      }
      *v16 = *(_QWORD *)(v15 + 728);
      v17 = v59;
      *((_QWORD *)v59 + 91) = v58;
      v58 = v17;
      v19 = a2;
LABEL_23:
      v15 = *v16;
      v59 = (int *)v15;
    }
    while (v15);
    v9 = (pthread_rwlock_t *)(a1 + 7904);
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
    if (v17)
    {
      do
      {
        v31 = v17;
        v58 = (int *)*((_QWORD *)v17 + 91);
        if (*v17 != -1)
        {
          close(*v17);
          *v17 = -1;
        }
        v32 = v17[18];
        if (v32 != -1)
        {
          close(v32);
          v17[18] = -1;
        }
        ICERemoveOneInterface();
        v33 = &v58;
        do
        {
          v34 = v33;
          v35 = *v33;
          v33 = (int **)(*v33 + 182);
          if (v35)
            v36 = v35 == v17;
          else
            v36 = 1;
        }
        while (!v36);
        if (v35)
        {
          *v34 = (int *)*((_QWORD *)v35 + 91);
          *((_QWORD *)v35 + 91) = *(_QWORD *)(a1 + 7896);
          *(_QWORD *)(a1 + 7896) = v35;
        }
        v17 = v58;
      }
      while (v58);
    }
    else
    {
      v31 = 0;
    }
    v59 = v31;
    v10 = (uint64_t *)(a1 + 7888);
    if (!v18)
    {
LABEL_47:
      if ((gckSessionCreateSocketAndBind((__int128 *)(v60 + 40 * v8), v19, *(_DWORD *)(a1 + 88), &v59) & 0x80000000) == 0)
      {
        v37 = v59;
        *((_QWORD *)v59 + 49) = 0x404DFEB851EB851FLL;
        *((_QWORD *)v37 + 48) = *(_QWORD *)(a1 + 24);
        v37[26] = v11;
        v38 = ICEAddOneInterface();
        v39 = VRTraceGetErrorLogLevelForModule();
        if (v38 < 0)
        {
          if (v39 >= 3)
          {
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v62 = v45;
              v63 = 2080;
              v64 = "GCKSessionPrepareRetryICE";
              v65 = 1024;
              v66 = 2059;
              v67 = 1024;
              v68 = a2;
              v69 = 1024;
              v70 = 6;
              _os_log_error_impl(&dword_215C5C000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d GCKSessionPrepareRetryICE: FAILURE adding interface for remoteID[%08X]: proto %d", buf, 0x28u);
            }
          }
          close(*v37);
          freeOptionsList((uint64_t *)v37 + 64);
          freeOptionsList((uint64_t *)v37 + 65);
          pthread_mutex_destroy((pthread_mutex_t *)(v37 + 166));
          BWE_CloseObject((uint64_t)v37);
          free(v37);
        }
        else
        {
          if (v39 >= 7)
          {
            v40 = VRTraceErrorLogLevelToCSTR();
            v41 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v62 = v40;
              v63 = 2080;
              v64 = "GCKSessionPrepareRetryICE";
              v65 = 1024;
              v66 = 2069;
              v67 = 1024;
              v68 = a2;
              v69 = 1024;
              v70 = 6;
              _os_log_impl(&dword_215C5C000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionPrepareRetryICE: SUCCESS adding interface for remoteID[%08X]: proto %d", buf, 0x28u);
            }
          }
          *((_OWORD *)v37 + 34) = 0u;
          *((_WORD *)v37 + 284) = 1;
          *((_WORD *)v37 + 309) = 0;
          *(_OWORD *)((char *)v37 + 570) = 0u;
          *(_OWORD *)((char *)v37 + 586) = 0u;
          *(_OWORD *)((char *)v37 + 602) = 0u;
          pthread_rwlock_wrlock(v9);
          v42 = (int **)v10;
          do
          {
            v43 = v42;
            v44 = *v42;
            v42 = (int **)(*v42 + 182);
          }
          while (v44);
          *v43 = v37;
          pthread_rwlock_unlock(v9);
          ++*(_DWORD *)(a1 + 88);
          LODWORD(v55) = 1;
          ++HIDWORD(v55);
        }
      }
    }
    ++v8;
  }
  while (v8 != v56);
  if ((_DWORD)v55)
  {
    pthread_rwlock_rdlock(v9);
    v47 = *(_DWORD *)(a1 + 12);
    v3 = 2149187606;
    v48 = HIDWORD(v55);
    if (v47 != -1)
    {
      *(_DWORD *)(a1 + 12) = -1;
      close(v47);
    }
    pthread_rwlock_unlock(v9);
  }
  else
  {
    v3 = 2149187606;
    v48 = HIDWORD(v55);
  }
LABEL_70:
  FreeLocalInterfaceList();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v49 = VRTraceErrorLogLevelToCSTR();
    v50 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v62 = v49;
      v63 = 2080;
      v64 = "GCKSessionPrepareRetryICE";
      v65 = 1024;
      v66 = 2112;
      v67 = 1024;
      v68 = a2;
      v69 = 1024;
      v70 = v48;
      _os_log_impl(&dword_215C5C000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d valid interfaces found.\n", buf, 0x28u);
    }
  }
  if (!v48)
    goto LABEL_76;
  v51 = ICEGetCandidates();
  v3 = 0;
  if ((v51 & 0x80000000) != 0)
  {
    v3 = v51;
    goto LABEL_76;
  }
  return v3;
}

void GCKSessionSendDOOB(uint64_t a1, int a2, const UInt8 *a3, int a4, unsigned int a5, double a6)
{
  __CFData *Mutable;
  uint64_t v12;
  int v13;
  const UInt8 *BytePtr;
  int Length;
  double v16;
  UInt8 bytes[2];

  *(_WORD *)bytes = __rev16(a5);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataAppendBytes(Mutable, bytes, 2);
  if (a3 && a4)
    CFDataAppendBytes(Mutable, a3, a4);
  v12 = *(_QWORD *)(a1 + 96);
  if (*(_DWORD *)(a1 + 108) == a2)
    v13 = 8;
  else
    v13 = 7;
  BytePtr = CFDataGetBytePtr(Mutable);
  Length = CFDataGetLength(Mutable);
  if (a6 <= 0.0)
  {
    PostEventCallback(v12, a2, v13, BytePtr, Length, 1);
  }
  else
  {
    v16 = micro();
    WaitEventCallback(v12, a2, v13, BytePtr, Length, 1, v16 + a6);
  }
  CFRelease(Mutable);
}

uint64_t gckHandleRetryICEValidationTimeout(uint64_t a1, int a2, int *a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  pthread_rwlock_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = CheckInHandleDebug();
  if (v7)
  {
    v8 = v7;
    if (*(_DWORD *)(v7 + 108) == a2)
    {
      v9 = 0;
      v10 = 2149187616;
      if (a3 && a4 == 4)
      {
        v9 = *a3;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v28 = 136315906;
            v29 = v11;
            v30 = 2080;
            v31 = "gckHandleRetryICEValidationTimeout";
            v32 = 1024;
            v33 = 7550;
            v34 = 1024;
            v35 = v9;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidationTimeout: check currently connected remoteID %08X OOB", (uint8_t *)&v28, 0x22u);
          }
        }
        v13 = (pthread_rwlock_t *)(v8 + 7904);
        pthread_rwlock_wrlock((pthread_rwlock_t *)(v8 + 7904));
        v14 = *(_QWORD *)(v8 + 7888);
        if (v14)
        {
          while (*(_DWORD *)(v14 + 108) || v9 != *(_DWORD *)(v14 + 116))
          {
            v14 = *(_QWORD *)(v14 + 728);
            if (!v14)
              goto LABEL_12;
          }
          if (*(double *)(v14 + 400) != 0.0)
          {
            v20 = *(_DWORD *)(v14 + 96);
            ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (!v20)
            {
              if (ErrorLogLevelForModule >= 7)
              {
                v24 = VRTraceErrorLogLevelToCSTR();
                v25 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v28 = 136315906;
                  v29 = v24;
                  v30 = 2080;
                  v31 = "gckHandleRetryICEValidationTimeout";
                  v32 = 1024;
                  v33 = 7559;
                  v34 = 1024;
                  v35 = v9;
                  _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timeout: forcibly disconnecting remoteID %08X OOB", (uint8_t *)&v28, 0x22u);
                }
              }
              gckSessionChangeStateCList(v8, v14, 11);
              pthread_rwlock_unlock((pthread_rwlock_t *)(v8 + 7904));
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v26 = VRTraceErrorLogLevelToCSTR();
                v27 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v28 = 136315906;
                  v29 = v26;
                  v30 = 2080;
                  v31 = "gckHandleRetryICEValidationTimeout";
                  v32 = 1024;
                  v33 = 7578;
                  v34 = 1024;
                  v35 = v9;
                  _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidationTimeout: forcibly disconnected remoteID %08X OOB", (uint8_t *)&v28, 0x22u);
                }
              }
              v10 = 0;
              goto LABEL_21;
            }
            if (ErrorLogLevelForModule >= 7)
            {
              v22 = VRTraceErrorLogLevelToCSTR();
              v23 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v28 = 136315906;
                v29 = v22;
                v30 = 2080;
                v31 = "gckHandleRetryICEValidationTimeout";
                v32 = 1024;
                v33 = 7564;
                v34 = 1024;
                v35 = v9;
                _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timeout: but already connected remoteID %08X OOB", (uint8_t *)&v28, 0x22u);
              }
            }
          }
        }
LABEL_12:
        pthread_rwlock_unlock(v13);
        v10 = 2149187616;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136315906;
          v29 = v15;
          v30 = 2080;
          v31 = "gckHandleRetryICEValidationTimeout";
          v32 = 1024;
          v33 = 7542;
          v34 = 1024;
          v35 = 0;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidationTimeout: localParticpantID check is invalid %08X OOB", (uint8_t *)&v28, 0x22u);
        }
      }
      v9 = 0;
      v10 = 2149187585;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v28 = 136315906;
        v29 = v17;
        v30 = 2080;
        v31 = "gckHandleRetryICEValidationTimeout";
        v32 = 1024;
        v33 = 7586;
        v34 = 1024;
        v35 = v9;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidationTimeout: null action for validation timeout %08X OOB", (uint8_t *)&v28, 0x22u);
      }
    }
LABEL_21:
    CheckOutHandleDebug();
    return v10;
  }
  return 2149187586;
}

uint64_t gckSessionChangeStateCList(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  int v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v51;
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187628;
  v7 = *(_DWORD *)(a2 + 408);
  switch(a3)
  {
    case 0:
      if (v7 <= 1)
        v8 = 1;
      else
        v8 = *(_DWORD *)(a2 + 408);
      goto LABEL_26;
    case 1:
    case 2:
      if (v7 == 1)
        v8 = 2;
      else
        v8 = *(_DWORD *)(a2 + 408);
      goto LABEL_26;
    case 3:
      if (v7 <= 3)
        v8 = 3;
      else
        v8 = *(_DWORD *)(a2 + 408);
      goto LABEL_26;
    case 4:
      if (v7 > 3 || v7 == 1)
        return v3;
      v8 = 4;
      goto LABEL_27;
    case 5:
    case 11:
      v9 = *(_DWORD *)(a1 + 104);
      if (v9 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v51 = 136315650;
            v52 = v14;
            v53 = 2080;
            v54 = "gckSessionChangeStateCList";
            v55 = 1024;
            v56 = 2225;
            v12 = " [%s] %s:%d localscopeDisconnectedForced";
            goto LABEL_24;
          }
        }
      }
      else if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v51 = 136315650;
          v52 = v10;
          v53 = 2080;
          v54 = "gckSessionChangeStateCList";
          v55 = 1024;
          v56 = 2221;
          v12 = " [%s] %s:%d globalscopeDisconnectedForced";
LABEL_24:
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v51, 0x1Cu);
        }
      }
      v8 = 4;
LABEL_26:
      if (v7 == v8)
        return v3;
LABEL_27:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_DWORD *)(a2 + 116);
          v51 = 136316674;
          v52 = v15;
          v53 = 2080;
          v54 = "gckSessionChangeStateCList";
          v55 = 1024;
          v56 = 2232;
          v57 = 1024;
          v58 = v17;
          v59 = 1024;
          v60 = a3;
          v61 = 1024;
          v62 = v7;
          v63 = 1024;
          v64 = v8;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%08X] State Change with event %d: %d -> %d", (uint8_t *)&v51, 0x34u);
        }
      }
      if (v8 != 4)
        goto LABEL_89;
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
      if (a3 != 4)
        goto LABEL_56;
      v18 = *(_DWORD *)(a1 + 104);
      if (v18 == 1 || v7 != 3)
        goto LABEL_56;
      if (*(double *)(a2 + 400) != 0.0)
        goto LABEL_58;
      v19 = *(unsigned int *)(a1 + 400);
      if ((int)v19 < 1)
      {
        LODWORD(v20) = 0;
      }
      else
      {
        v20 = 0;
        v21 = (int *)(a1 + 404);
        while (1)
        {
          v22 = *v21;
          v21 += 3;
          if (v22 == *(_DWORD *)(a2 + 116))
            break;
          if (v19 == ++v20)
            goto LABEL_56;
        }
      }
      if ((_DWORD)v20 != (_DWORD)v19)
      {
        v23 = a1 + 404 + 12 * v20;
        v25 = *(_DWORD *)(v23 + 4);
        v24 = (_DWORD *)(v23 + 4);
        if (v25 != -1)
        {
          *v24 = -1;
          gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
          v26 = *(unsigned int *)(a1 + 112);
          if ((int)v26 >= 1)
          {
            v27 = 0;
            v28 = (int *)(a2 + 116);
            v29 = 480 * v26;
            while (*(_DWORD *)(a1 + v27 + 116) != *(_DWORD *)(a2 + 116))
            {
              v27 += 480;
              if (v29 == v27)
                goto LABEL_56;
            }
            if (*(_DWORD *)(a1 + v27 + 120) != -1)
            {
              *(double *)(a2 + 400) = micro();
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v30 = VRTraceErrorLogLevelToCSTR();
                v31 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v32 = *v28;
                  v51 = 136315906;
                  v52 = v30;
                  v53 = 2080;
                  v54 = "gckSessionChangeStateCList";
                  v55 = 1024;
                  v56 = 2281;
                  v57 = 1024;
                  v58 = v32;
                  _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== remain connected to peer (%08X) =====", (uint8_t *)&v51, 0x22u);
                }
              }
              gckSessionSendLSA(a1, *(_DWORD *)(a1 + 112), (void *)(a1 + 116), *v28, 0);
              gckSessionCleanupNodes(a1, -1, 0);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v33 = VRTraceErrorLogLevelToCSTR();
                v34 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v35 = *v28;
                  v51 = 136315906;
                  v52 = v33;
                  v53 = 2080;
                  v54 = "gckSessionChangeStateCList";
                  v55 = 1024;
                  v56 = 2286;
                  v57 = 1024;
                  v58 = v35;
                  _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== async validate viability (%08X) =====", (uint8_t *)&v51, 0x22u);
                }
              }
              GCKSessionSendDOOB(a1, *v28, 0, 0, 6u, 10.0);
              GCKSessionSendDOOB(a1, *(_DWORD *)(a1 + 108), (const UInt8 *)(a2 + 116), 4, 8u, 17.0);
              v8 = 3;
              goto LABEL_88;
            }
          }
        }
      }
LABEL_56:
      if (a3 != 4)
        goto LABEL_67;
      v18 = *(_DWORD *)(a1 + 104);
LABEL_58:
      if (v18 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v39 = VRTraceErrorLogLevelToCSTR();
          v37 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v51 = 136315650;
            v52 = v39;
            v53 = 2080;
            v54 = "gckSessionChangeStateCList";
            v55 = 1024;
            v56 = 2301;
            v38 = " [%s] %s:%d localscopeDisconnectedTimeout";
            goto LABEL_66;
          }
        }
      }
      else if (!v18 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v51 = 136315650;
          v52 = v36;
          v53 = 2080;
          v54 = "gckSessionChangeStateCList";
          v55 = 1024;
          v56 = 2297;
          v38 = " [%s] %s:%d globalscopeDisconnectedTimeout";
LABEL_66:
          _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v51, 0x1Cu);
        }
      }
LABEL_67:
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v42 = *(_DWORD *)(a2 + 116);
          v51 = 136315906;
          v52 = v40;
          v53 = 2080;
          v54 = "gckSessionChangeStateCList";
          v55 = 1024;
          v56 = 2306;
          v57 = 1024;
          v58 = v42;
          _os_log_impl(&dword_215C5C000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== disconnected from a peer (%08X) =====", (uint8_t *)&v51, 0x22u);
        }
      }
      if (!*(_DWORD *)(a1 + 48) && !*(_DWORD *)(a1 + 104))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v45 = *(_DWORD *)(a2 + 116);
            v51 = 136315906;
            v52 = v43;
            v53 = 2080;
            v54 = "gckSessionChangeStateCList";
            v55 = 1024;
            v56 = 2308;
            v57 = 1024;
            v58 = v45;
            _os_log_impl(&dword_215C5C000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d XX: STOP ICE check with peer %08X", (uint8_t *)&v51, 0x22u);
          }
        }
        ICEStopConnectivityCheck();
        ICEStopConnectivityCheck();
      }
      v46 = a3 == 11 || a3 == 4;
      v47 = gckSessionDeleteNode(a1, *(_DWORD *)(a2 + 116), a3 == 11);
      gckSessionSendLSA(a1, *(_DWORD *)(a1 + 112), (void *)(a1 + 116), *(_DWORD *)(a2 + 116), 0);
      gckSessionCleanupNodes(a1, *(_DWORD *)(a2 + 116), v46);
      v8 = 4;
      if (a3 == 4 && v47 == -2145779690)
      {
        v48 = *(unsigned int *)(a1 + 112);
        if ((int)v48 >= 1)
        {
          v49 = a1;
          while (*(_DWORD *)(v49 + 116) != *(_DWORD *)(a2 + 116))
          {
            v49 += 480;
            if (!--v48)
              goto LABEL_87;
          }
          memmove((void *)(v49 + 116), (const void *)(v49 + 596), 480 * ((int)v48 - 1));
          --*(_DWORD *)(a1 + 112);
LABEL_87:
          v8 = 4;
        }
      }
LABEL_88:
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
LABEL_89:
      v3 = 0;
      *(_DWORD *)(a2 + 408) = v8;
      return v3;
    default:
      return v3;
  }
}

uint64_t gckHandleRetryICEViable(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187586;
  v4 = CheckInHandleDebug();
  if (v4)
  {
    v5 = v4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v6;
        v14 = 2080;
        v15 = "gckHandleRetryICEViable";
        v16 = 1024;
        v17 = 7604;
        v18 = 1024;
        v19 = a2;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEViable : receive confirmation from remoteID %08X OOB", (uint8_t *)&v12, 0x22u);
      }
    }
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 7904));
    v8 = *(_QWORD *)(v5 + 7888);
    if (v8)
    {
      while (*(_DWORD *)(v8 + 108) || *(_DWORD *)(v8 + 116) != a2)
      {
        v8 = *(_QWORD *)(v8 + 728);
        if (!v8)
          goto LABEL_9;
      }
      *(_QWORD *)(v8 + 400) = 0;
      pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7904));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v10;
          v14 = 2080;
          v15 = "gckHandleRetryICEViable";
          v16 = 1024;
          v17 = 7622;
          v18 = 1024;
          v19 = a2;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEViable: reset viability indicator remoteID %08X OOB", (uint8_t *)&v12, 0x22u);
        }
      }
      v3 = 0;
    }
    else
    {
LABEL_9:
      pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7904));
      v3 = 2149187616;
    }
    CheckOutHandleDebug();
  }
  return v3;
}

uint64_t gckHandleRetryICEValidate(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  pthread_rwlock_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187616;
  v4 = CheckInHandleDebug();
  if (!v4)
    return 2149187586;
  v5 = v4;
  v6 = (pthread_rwlock_t *)(v4 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 7904));
  v7 = *(_QWORD *)(v5 + 7888);
  if (v7)
  {
    while (*(_DWORD *)(v7 + 108) || *(_DWORD *)(v7 + 116) != a2)
    {
      v7 = *(_QWORD *)(v7 + 728);
      if (!v7)
        goto LABEL_6;
    }
    pthread_rwlock_unlock(v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v11;
        v15 = 2080;
        v16 = "gckHandleRetryICEValidate";
        v17 = 1024;
        v18 = 7661;
        v19 = 1024;
        v20 = a2;
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidate: send viability indication remoteID %08X OOB", (uint8_t *)&v13, 0x22u);
      }
    }
    GCKSessionSendDOOB(v5, a2, 0, 0, 7u, 0.0);
    v3 = 0;
  }
  else
  {
LABEL_6:
    pthread_rwlock_unlock(v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "gckHandleRetryICEValidate";
        v17 = 1024;
        v18 = 7671;
        v19 = 1024;
        v20 = a2;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEValidate: null viability indication remoteID %08X OOB", (uint8_t *)&v13, 0x22u);
      }
    }
  }
  CheckOutHandleDebug();
  return v3;
}

uint64_t gckHandleRetryICEResponse(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187616;
  v4 = CheckInHandleDebug();
  if (v4)
  {
    v5 = v4;
    v6 = ICEGetCallInfoForConnectionData();
    if ((v6 & 0x80000000) != 0)
    {
      v3 = v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v19 = v10;
          v20 = 2080;
          v21 = "gckHandleRetryICEResponse";
          v22 = 1024;
          v23 = 7693;
          v24 = 1024;
          v25 = a2;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEResponse: ICEGetCallInfoForConnectionData returned error for remoteID %08X OOB", buf, 0x22u);
        }
      }
    }
    else if (*(_DWORD *)(v5 + 108) == -1431655766)
    {
      v7 = ICEStartConnectivityCheckN();
      if ((v7 & 0x80000000) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v19 = v8;
            v20 = 2080;
            v21 = "gckHandleRetryICEResponse";
            v22 = 1024;
            v23 = 7712;
            v24 = 1024;
            v25 = a2;
            _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEResponse: retry ice started with remoteID %08X OOB", buf, 0x22u);
          }
        }
        gckSessionChangeState(v5, a2, 6);
        v3 = 0;
LABEL_21:
        CheckOutHandleDebug();
        return v3;
      }
      v3 = v7;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v17 = *(_DWORD *)(v5 + 108);
        *(_DWORD *)buf = 136316418;
        v19 = v12;
        v20 = 2080;
        v21 = "gckHandleRetryICEResponse";
        v22 = 1024;
        v23 = 7700;
        v24 = 1024;
        v25 = 7700;
        v26 = 1024;
        v27 = -1431655766;
        v28 = 1024;
        v29 = v17;
        _os_log_error_impl(&dword_215C5C000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Wrong Connection Data. Participant ID from remote connection data = %08X, local participant ID = %08X\n", buf, 0x2Eu);
      }
      v3 = 2149187616;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = v14;
        v20 = 2080;
        v21 = "gckHandleRetryICEResponse";
        v22 = 1024;
        v23 = 7723;
        v24 = 1024;
        v25 = a2;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEResponse: retry ice failed to start started with remoteID %08X OOB", buf, 0x22u);
      }
    }
    goto LABEL_21;
  }
  return 2149187586;
}

uint64_t gckHandleRetryICERequest(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  pthread_rwlock_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187616;
  v4 = CheckInHandleDebug();
  if (!v4)
    return 2149187586;
  v5 = v4;
  v6 = (pthread_rwlock_t *)(v4 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 7904));
  v7 = *(_QWORD *)(v5 + 7888);
  if (v7)
  {
    while (*(_DWORD *)(v7 + 108) || *(_DWORD *)(v7 + 116) != a2)
    {
      v7 = *(_QWORD *)(v7 + 728);
      if (!v7)
        goto LABEL_6;
    }
    pthread_rwlock_unlock(v6);
    v9 = GCKSessionPrepareRetryICE(v5, a2);
    if ((v9 & 0x80000000) != 0 || (v9 = ICEGetCallInfoForConnectionData(), (v9 & 0x80000000) != 0))
    {
      v3 = v9;
    }
    else if (*(_DWORD *)(v5 + 108) == -1431655766)
    {
      v10 = ICEStartConnectivityCheckN();
      if ((v10 & 0x80000000) != 0)
      {
        v3 = v10;
      }
      else
      {
        gckSessionChangeState(v5, a2, 6);
        v3 = 0;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v13 = *(_DWORD *)(v5 + 108);
        *(_DWORD *)buf = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "gckHandleRetryICERequest";
        v18 = 1024;
        v19 = 7794;
        v20 = 1024;
        v21 = 7794;
        v22 = 1024;
        v23 = -1431655766;
        v24 = 1024;
        v25 = v13;
        _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Wrong Connection Data. Participant ID from remote connection data = %08X, local participant ID = %08X\n", buf, 0x2Eu);
      }
    }
  }
  else
  {
LABEL_6:
    pthread_rwlock_unlock(v6);
    v3 = 2149187630;
  }
  CheckOutHandleDebug();
  return v3;
}

uint64_t gckHandleRetryICEEnforced(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187616;
  v4 = CheckInHandleDebug();
  if (!v4)
    return 2149187586;
  v5 = v4;
  v6 = ICEGetCallInfoForConnectionData();
  if ((v6 & 0x80000000) != 0)
  {
    v3 = v6;
  }
  else if (*(_DWORD *)(v5 + 108) == -1431655766)
  {
    v7 = ICEStartConnectivityCheckN();
    if ((v7 & 0x80000000) != 0)
    {
      v3 = v7;
    }
    else
    {
      gckSessionChangeState(v5, a2, 0);
      v3 = 0;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_DWORD *)(v5 + 108);
      *(_DWORD *)buf = 136316418;
      v13 = v8;
      v14 = 2080;
      v15 = "gckHandleRetryICEEnforced";
      v16 = 1024;
      v17 = 7841;
      v18 = 1024;
      v19 = 7841;
      v20 = 1024;
      v21 = -1431655766;
      v22 = 1024;
      v23 = v10;
      _os_log_error_impl(&dword_215C5C000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Wrong Connection Data. Participant ID from remote connection data = %08X, local participant ID = %08X\n", buf, 0x2Eu);
    }
  }
  CheckOutHandleDebug();
  return v3;
}

uint64_t gckHandleRetryICEForce(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187616;
  v4 = CheckInHandleDebug();
  if (v4)
  {
    v5 = v4;
    v6 = GCKSessionPrepareRetryICE(v4, a2);
    if ((v6 & 0x80000000) == 0)
    {
      v6 = ICEGetCallInfoForConnectionData();
      if ((v6 & 0x80000000) == 0)
      {
        if (*(_DWORD *)(v5 + 108) != -1431655766)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v12 = *(_DWORD *)(v5 + 108);
              *(_DWORD *)buf = 136316418;
              v14 = v10;
              v15 = 2080;
              v16 = "gckHandleRetryICEForce";
              v17 = 1024;
              v18 = 7915;
              v19 = 1024;
              v20 = 7915;
              v21 = 1024;
              v22 = -1431655766;
              v23 = 1024;
              v24 = v12;
              _os_log_error_impl(&dword_215C5C000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Wrong Connection Data. Participant ID from remote connection data = %08X, local participant ID = %08X\n", buf, 0x2Eu);
            }
          }
          goto LABEL_10;
        }
        v6 = ICEStartConnectivityCheckN();
        if ((v6 & 0x80000000) == 0)
        {
          gckSessionChangeState(v5, a2, 0);
          v3 = 0;
LABEL_13:
          CheckOutHandleDebug();
          return v3;
        }
      }
    }
    v3 = v6;
LABEL_10:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v14 = v7;
        v15 = 2080;
        v16 = "gckHandleRetryICEForce";
        v17 = 1024;
        v18 = 7936;
        v19 = 1024;
        v20 = v3;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckHandleRetryICEForce: error (%08X)", buf, 0x22u);
      }
    }
    goto LABEL_13;
  }
  return 2149187586;
}

uint64_t gckHandleRetryICEInit(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  pthread_rwlock_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = 2149187586;
  v4 = CheckInHandleDebug();
  if (v4)
  {
    v5 = v4;
    v6 = (pthread_rwlock_t *)(v4 + 7904);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 7904));
    v7 = *(_QWORD *)(v5 + 7888);
    if (v7)
    {
      while (*(_DWORD *)(v7 + 108) || *(_DWORD *)(v7 + 116) != a2)
      {
        v7 = *(_QWORD *)(v7 + 728);
        if (!v7)
          goto LABEL_6;
      }
      pthread_rwlock_unlock(v6);
      v9 = GCKSessionPrepareRetryICE(v5, a2);
      if ((v9 & 0x80000000) != 0)
        v3 = v9;
      else
        v3 = 0;
    }
    else
    {
LABEL_6:
      pthread_rwlock_unlock(v6);
      v3 = 2149187630;
    }
    CheckOutHandleDebug();
  }
  return v3;
}

uint64_t GCKSessionReceiveDOOB(uint64_t a1, int a2, char *a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *global_queue;
  _QWORD *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  _QWORD block[7];
  int v69;
  _QWORD v70[7];
  int v71;
  _QWORD v72[7];
  int v73;
  _QWORD v74[6];
  int v75;
  _QWORD v76[6];
  int v77;
  _QWORD v78[7];
  int v79;
  _QWORD v80[7];
  int v81;
  _QWORD v82[7];
  int v83;
  _QWORD v84[7];
  int v85;
  _QWORD v86[6];
  int v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  unsigned int v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v4 = 2149187618;
  if (a3)
  {
    v5 = a4 - 2;
    if (a4 >= 2)
    {
      v7 = bswap32(*(unsigned __int16 *)a3);
      v8 = HIWORD(v7);
      v9 = HIWORD(v7) - 1;
      if ((unsigned __int16)(HIWORD(v7) - 1) <= 9u)
      {
        v92 = 0;
        v93 = &v92;
        v94 = 0x2000000000;
        v95 = 0;
        v88 = 0;
        v89 = &v88;
        v90 = 0x2000000000;
        v91 = a4 - 2;
        if (v8 <= 0xA)
        {
          if (((1 << SBYTE2(v7)) & 0x614) != 0)
            goto LABEL_6;
          if (v8 == 1)
          {
            v91 = 0;
LABEL_6:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v14 = *((_DWORD *)v89 + 6);
                *(_DWORD *)buf = 136315906;
                v97 = v12;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8032;
                v102 = 1024;
                v103 = v14;
                _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: dispatch -- DataSize == %d...", buf, 0x22u);
              }
            }
            v15 = *((_DWORD *)v89 + 6);
            if (v15 && v15 <= 2000)
            {
              v16 = malloc_type_malloc(v15, 0xFADC0F76uLL);
              v93[3] = (uint64_t)v16;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v17;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8042;
                _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: ASYNCHRONOUS EVENT HANDLER...", buf, 0x1Cu);
              }
            }
            v19 = *((int *)v89 + 6);
            if ((_DWORD)v19)
            {
              v20 = (void *)v93[3];
              if (v20)
                memcpy(v20, a3 + 2, v19);
            }
            switch(v9)
            {
              case 0:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v21 = VRTraceErrorLogLevelToCSTR();
                  v22 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v21;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8050;
                    _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE init...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v86[0] = MEMORY[0x24BDAC760];
                v86[1] = 0x40000000;
                v86[2] = __GCKSessionReceiveDOOB_block_invoke;
                v86[3] = &unk_24D4662F0;
                v87 = a2;
                v86[4] = &v92;
                v86[5] = a1;
                v24 = v86;
                goto LABEL_74;
              case 1:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v33 = VRTraceErrorLogLevelToCSTR();
                  v34 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v33;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8061;
                    _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE request...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v84[0] = MEMORY[0x24BDAC760];
                v84[1] = 0x40000000;
                v84[2] = __GCKSessionReceiveDOOB_block_invoke_9;
                v84[3] = &unk_24D466318;
                v84[6] = a1;
                v85 = a2;
                v84[4] = &v92;
                v84[5] = &v88;
                v24 = v84;
                goto LABEL_74;
              case 2:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v35 = VRTraceErrorLogLevelToCSTR();
                  v36 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v35;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8072;
                    _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE response...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v82[0] = MEMORY[0x24BDAC760];
                v82[1] = 0x40000000;
                v82[2] = __GCKSessionReceiveDOOB_block_invoke_11;
                v82[3] = &unk_24D466340;
                v83 = a2;
                v82[4] = &v92;
                v82[5] = &v88;
                v82[6] = a1;
                v24 = v82;
                goto LABEL_74;
              case 3:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v37 = VRTraceErrorLogLevelToCSTR();
                  v38 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v37;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8083;
                    _os_log_impl(&dword_215C5C000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE force...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v80[0] = MEMORY[0x24BDAC760];
                v80[1] = 0x40000000;
                v80[2] = __GCKSessionReceiveDOOB_block_invoke_13;
                v80[3] = &unk_24D466368;
                v81 = a2;
                v80[4] = &v92;
                v80[5] = &v88;
                v80[6] = a1;
                v24 = v80;
                goto LABEL_74;
              case 4:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v39 = VRTraceErrorLogLevelToCSTR();
                  v40 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v39;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8094;
                    _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE enforced...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v78[0] = MEMORY[0x24BDAC760];
                v78[1] = 0x40000000;
                v78[2] = __GCKSessionReceiveDOOB_block_invoke_15;
                v78[3] = &unk_24D466390;
                v79 = a2;
                v78[4] = &v92;
                v78[5] = &v88;
                v78[6] = a1;
                v24 = v78;
                goto LABEL_74;
              case 5:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v41 = VRTraceErrorLogLevelToCSTR();
                  v42 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v41;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8105;
                    _os_log_impl(&dword_215C5C000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validate...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v76[0] = MEMORY[0x24BDAC760];
                v76[1] = 0x40000000;
                v76[2] = __GCKSessionReceiveDOOB_block_invoke_17;
                v76[3] = &unk_24D4663B8;
                v77 = a2;
                v76[4] = &v92;
                v76[5] = a1;
                v24 = v76;
                goto LABEL_74;
              case 6:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v43 = VRTraceErrorLogLevelToCSTR();
                  v44 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v43;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8116;
                    _os_log_impl(&dword_215C5C000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE viable...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v74[0] = MEMORY[0x24BDAC760];
                v74[1] = 0x40000000;
                v74[2] = __GCKSessionReceiveDOOB_block_invoke_19;
                v74[3] = &unk_24D4663E0;
                v75 = a2;
                v74[4] = &v92;
                v74[5] = a1;
                v24 = v74;
                goto LABEL_74;
              case 7:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v45 = VRTraceErrorLogLevelToCSTR();
                  v46 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v45;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8127;
                    _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validation check timeout...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v72[0] = MEMORY[0x24BDAC760];
                v72[1] = 0x40000000;
                v72[2] = __GCKSessionReceiveDOOB_block_invoke_21;
                v72[3] = &unk_24D466408;
                v73 = a2;
                v72[4] = &v92;
                v72[5] = &v88;
                v72[6] = a1;
                v24 = v72;
                goto LABEL_74;
              case 8:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v47 = VRTraceErrorLogLevelToCSTR();
                  v48 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v47;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8138;
                    _os_log_impl(&dword_215C5C000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE prepare...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v70[0] = MEMORY[0x24BDAC760];
                v70[1] = 0x40000000;
                v70[2] = __GCKSessionReceiveDOOB_block_invoke_23;
                v70[3] = &unk_24D466430;
                v71 = a2;
                v70[4] = &v92;
                v70[5] = &v88;
                v70[6] = a1;
                v24 = v70;
                goto LABEL_74;
              case 9:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v49 = VRTraceErrorLogLevelToCSTR();
                  v50 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v97 = v49;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8149;
                    _os_log_impl(&dword_215C5C000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE report...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 0x40000000;
                block[2] = __GCKSessionReceiveDOOB_block_invoke_25;
                block[3] = &unk_24D466458;
                v69 = a2;
                block[4] = &v92;
                block[5] = &v88;
                block[6] = a1;
                v24 = block;
LABEL_74:
                dispatch_async(global_queue, v24);
                v4 = 0;
                break;
              default:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v30 = VRTraceErrorLogLevelToCSTR();
                  v31 = *MEMORY[0x24BDFDC28];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    v97 = v30;
                    v98 = 2080;
                    v99 = "GCKSessionReceiveDOOB";
                    v100 = 1024;
                    v101 = 8160;
                    v102 = 1024;
                    v103 = v8;
                    _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received unknown message of obType == %d", buf, 0x22u);
                  }
                }
                v32 = (void *)v93[3];
                if (v32)
                  free(v32);
                break;
            }
LABEL_75:
            _Block_object_dispose(&v88, 8);
            _Block_object_dispose(&v92, 8);
            return v4;
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v97 = v25;
            v98 = 2080;
            v99 = "GCKSessionReceiveDOOB";
            v100 = 1024;
            v101 = 8167;
            _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: SYNCHRONOUS EVENT HANDLER...", buf, 0x1Cu);
          }
        }
        switch(v8)
        {
          case 3u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v27 = VRTraceErrorLogLevelToCSTR();
              v28 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v27;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8182;
                _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE response...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEResponse(a1, a2);
            goto LABEL_108;
          case 4u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v54 = VRTraceErrorLogLevelToCSTR();
              v55 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v54;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8188;
                _os_log_impl(&dword_215C5C000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE force...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEForce(a1, a2);
            goto LABEL_108;
          case 5u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v56 = VRTraceErrorLogLevelToCSTR();
              v57 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v56;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8194;
                _os_log_impl(&dword_215C5C000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE enforced...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEEnforced(a1, a2);
            goto LABEL_108;
          case 6u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v58 = VRTraceErrorLogLevelToCSTR();
              v59 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v58;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8200;
                _os_log_impl(&dword_215C5C000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validate...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEValidate(a1, a2);
            goto LABEL_108;
          case 7u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v60 = VRTraceErrorLogLevelToCSTR();
              v61 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v60;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8205;
                _os_log_impl(&dword_215C5C000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE viable...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEViable(a1, a2);
            goto LABEL_108;
          case 8u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v62 = VRTraceErrorLogLevelToCSTR();
              v63 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v62;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8210;
                _os_log_impl(&dword_215C5C000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validation check timeout...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEValidationTimeout(a1, a2, (int *)(a3 + 2), v5);
            goto LABEL_108;
          case 9u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v64 = VRTraceErrorLogLevelToCSTR();
              v65 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v64;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8216;
                _os_log_impl(&dword_215C5C000, v65, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE prepare...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEPreparation(a1, a2, (int *)(a3 + 2), v5);
            goto LABEL_108;
          case 0xAu:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v66 = VRTraceErrorLogLevelToCSTR();
              v67 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v97 = v66;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8222;
                _os_log_impl(&dword_215C5C000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE report...", buf, 0x1Cu);
              }
            }
            v29 = gckHandleRetryICEReport(a1, a2, a3 + 2, v5);
LABEL_108:
            v4 = v29;
            break;
          default:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v52 = VRTraceErrorLogLevelToCSTR();
              v53 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v97 = v52;
                v98 = 2080;
                v99 = "GCKSessionReceiveDOOB";
                v100 = 1024;
                v101 = 8228;
                v102 = 1024;
                v103 = v8;
                _os_log_impl(&dword_215C5C000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received unknown message of obType == %d", buf, 0x22u);
              }
            }
            break;
        }
        goto LABEL_75;
      }
    }
  }
  return v4;
}

uint64_t GCKSessionDisposeConnection(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  gckSessionDisconnectNeighbor(v3, a2, 255);
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionDisposeAllConnections()
{
  uint64_t v0;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  gckSessionDisposeAllConnections(v0);
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSendTo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, int a10, int a11)
{
  uint64_t v11;
  int v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  int *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  int *v30;
  _DWORD *v31;
  _DWORD *v32;
  int v33;
  uint64_t NextHop;
  __int128 v35;
  uint64_t v36;
  _DWORD *v37;
  _DWORD *v38;
  _DWORD *v39;
  _DWORD *v40;
  uint64_t v41;
  int v42;
  size_t v43;
  _DWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD *v47;
  _DWORD *v48;
  _DWORD *v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, unsigned __int16);
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  signed int v57;
  int v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  char *v66;
  uint64_t v68;
  os_log_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t *v72;
  char *v73;
  pthread_mutex_t *v74;
  int v75;
  int v76;
  int v77;
  pthread_rwlock_t *v78;
  int v79;
  int v80;
  uint64_t v81;
  unsigned int v82;
  _DWORD *v83;
  int *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[2];
  int v89;
  os_log_t v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  int v96;
  _WORD v97[2048];
  uint64_t v98;

  v11 = MEMORY[0x24BDAC7A8](a1);
  v76 = v12;
  v77 = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v84 = v22;
  v23 = v11;
  v98 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v88[0] = v24;
  v88[1] = v24;
  v25 = v20;
  MEMORY[0x24BDAC7A8](v11);
  v27 = (char *)&v68 - v26;
  if (v28)
    memset((char *)&v68 - v26, 170, 4 * v25);
  v83 = v27;
  memset(v97, 170, sizeof(v97));
  v87 = CheckInHandleDebug();
  if (!v87)
    return 2149187586;
  v71 = v23;
  v72 = &v68;
  *(_QWORD *)&v88[0] = v19;
  DWORD2(v88[0]) = v17;
  if (v21 >= 1)
  {
    v80 = a11;
    v79 = a10;
    v29 = v25;
    v31 = v83;
    v30 = v84;
    v32 = v15;
    v75 = a9;
    do
    {
      v33 = *v30++;
      NextHop = gckSessionFindNextHop(v87, v33);
      *v31 = NextHop;
      if (v15)
        *v32 = -2145779666;
      ++v32;
      ++v31;
      --v29;
    }
    while (v29);
    v81 = 4 * v25;
    v36 = 0;
    v78 = (pthread_rwlock_t *)(v87 + 7904);
    v74 = (pthread_mutex_t *)(v87 + 7800);
    v37 = v15 + 1;
    v38 = v83;
    v39 = v84 + 1;
    v40 = v83 + 1;
    v73 = (char *)(v87 + 125);
    v41 = 1;
    *(_QWORD *)&v35 = 136315906;
    v70 = v35;
    v82 = -2145779666;
    v86 = v25;
    while (1)
    {
      v42 = v38[v36];
      if (v42 != -1)
        break;
      ++v36;
LABEL_51:
      ++v41;
      ++v37;
      ++v39;
      ++v40;
      if (v36 == v25)
        goto LABEL_68;
    }
    v85 = &v68;
    MEMORY[0x24BDAC7A8](NextHop);
    v44 = (_DWORD *)((char *)&v68 - ((v43 + 15) & 0x7FFFFFFF0));
    memset(v44, 170, v43);
    *v44 = v84[v36];
    if (v15)
      v15[v36] = -1;
    if (++v36 >= v25)
    {
      v50 = 1;
    }
    else
    {
      v45 = 1;
      v46 = v25;
      v47 = v40;
      v48 = v39;
      v49 = v37;
      do
      {
        if (*v47 == v42)
        {
          v50 = (v45 + 1);
          v44[(int)v45] = *v48;
          *v47 = -1;
          if (v15)
            *v49 = -1;
        }
        else
        {
          v50 = v45;
        }
        ++v49;
        ++v48;
        ++v47;
        --v46;
        v45 = v50;
      }
      while (v41 != v46);
    }
    v51 = *(_DWORD *)(v87 + 108);
    v52 = *(_QWORD *)(v87 + 96);
    v53 = *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, unsigned __int16))(v52 + 24);
    v54 = *(_QWORD *)(v52 + 32);
    if (v79)
    {
      NextHop = OSPFMakeData((char *)v97, 4096, (uint64_t)v88, 0, v80, v51, v44, v50, v53, v54, 0x40u, 0, 0);
      if ((int)NextHop >= 1)
      {
        v55 = NextHop;
        pthread_rwlock_rdlock(v78);
        v56 = *(_QWORD *)(v87 + 7888);
        v57 = -2145779690;
        if (v56)
        {
          while (*(_DWORD *)(v56 + 116) != v42 || *(_DWORD *)(v56 + 408) != 3)
          {
            v56 = *(_QWORD *)(v56 + 728);
            if (!v56)
              goto LABEL_43;
          }
          v57 = 0;
          if (send(*(_DWORD *)(v56 + 72), v97, v55, 0) == -1)
            v57 = *__error() | 0xC01A0000;
        }
LABEL_43:
        NextHop = pthread_rwlock_unlock(v78);
LABEL_44:
        v82 &= v57 >> 31;
        v58 = v57;
LABEL_45:
        v63 = v86;
        v64 = v15;
        v38 = v83;
        do
        {
          if (v15)
          {
            if (*v64 == -1)
              *v64 = v58;
          }
          ++v64;
          --v63;
        }
        while (v63);
        v25 = v86;
        goto LABEL_51;
      }
    }
    else
    {
      NextHop = OSPFMakeData((char *)v97, 4096, (uint64_t)v88, 0, v80, v51, v44, v50, v53, v54, v76, v77, v75);
      if ((int)NextHop > 0)
      {
        NextHop = SendUDPPacketToParticipantChannelID(v87, v97, NextHop, v42, 1, -1, 1);
        v57 = NextHop;
        v58 = -2145779670;
        if ((_DWORD)NextHop == -2145779670)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v69 = (os_log_t)VRTraceErrorLogLevelToCSTR();
            v59 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v89 = v70;
              v90 = v69;
              v91 = 2080;
              v92 = "GCKSessionSendTo";
              v93 = 1024;
              v94 = 8383;
              v95 = 1024;
              v96 = v42;
              _os_log_impl(&dword_215C5C000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionSendTo: GCK_E_INVALIDSOCKET (nextHop == %08X)", (uint8_t *)&v89, 0x22u);
            }
          }
          pthread_mutex_lock(v74);
          v60 = *(_QWORD *)(v87 + 96);
          v61 = *(unsigned int *)(v60 + 168);
          if ((int)v61 < 1)
          {
            LODWORD(v62) = 0;
          }
          else
          {
            v62 = 0;
            while (*(_DWORD *)(v60 + 172 + 4 * v62) != v42)
            {
              if (v61 == ++v62)
              {
                LODWORD(v62) = *(_DWORD *)(v60 + 168);
                break;
              }
            }
          }
          if (v62 <= 0xF && (_DWORD)v62 == (_DWORD)v61)
          {
            *(_DWORD *)(v60 + 4 * v61 + 172) = v42;
            *(_DWORD *)(v60 + 168) = v61 + 1;
          }
          v65 = *(unsigned int *)(v87 + 112);
          v66 = v73;
          if ((int)v65 >= 1)
          {
            while (*(_DWORD *)(v66 - 9) != v42)
            {
              v66 += 480;
              if (!--v65)
                goto LABEL_65;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v68 = VRTraceErrorLogLevelToCSTR();
              v69 = (os_log_t)*MEMORY[0x24BDFDC28];
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                v89 = v70;
                v90 = (os_log_t)v68;
                v91 = 2080;
                v92 = "GCKSessionSendTo";
                v93 = 1024;
                v94 = 8409;
                v95 = 1024;
                v96 = v42;
                _os_log_impl(&dword_215C5C000, v69, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionSendTo: post event GCKSessionEvent_Disconnected (%08X)", (uint8_t *)&v89, 0x22u);
              }
            }
            PostEventCallback(*(_QWORD *)(v87 + 96), v42, 3, v66, *(v66 - 1), 0);
          }
LABEL_65:
          NextHop = pthread_mutex_unlock(v74);
          goto LABEL_45;
        }
        goto LABEL_44;
      }
    }
    v58 = -2145779698;
    goto LABEL_45;
  }
  v82 = -2145779666;
LABEL_68:
  CheckOutHandleDebug();
  return v82;
}

uint64_t gckSessionFindNextHop(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;

  v4 = (pthread_mutex_t *)(a1 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  v5 = *(unsigned int *)(a1 + 112);
  if ((int)v5 < 1)
  {
LABEL_5:
    v7 = 0xFFFFFFFFLL;
  }
  else
  {
    v6 = (unsigned int *)(a1 + 120);
    while (*(v6 - 1) != a2)
    {
      v6 += 120;
      if (!--v5)
        goto LABEL_5;
    }
    v7 = *v6;
  }
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t GCKSessionSendAudioTo(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int *v19;
  _DWORD *v20;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t NextHop;
  uint64_t v26;
  _DWORD *v27;
  _DWORD *v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  size_t v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  _DWORD *v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  _QWORD v46[4];
  uint64_t v47;
  _DWORD *v48;
  int *v49;
  unsigned int v50;
  _QWORD *v51;
  uint64_t v52;
  _OWORD v53[2];
  _WORD v54[2048];
  uint64_t v55;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v49 = v10;
  v11 = v1;
  v55 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[0] = v12;
  v53[1] = v12;
  MEMORY[0x24BDAC7A8](v1);
  v15 = (char *)v46 - v13;
  v52 = v14;
  v16 = 4 * v14;
  if (v17)
    memset((char *)v46 - v13, 170, 4 * v14);
  v48 = v15;
  memset(v54, 170, sizeof(v54));
  v47 = CheckInHandleDebug();
  if (!v47)
    return 2149187586;
  v46[1] = v11;
  v46[2] = v46;
  *(_QWORD *)&v53[0] = v7;
  DWORD2(v53[0]) = v5;
  if (v9 < 1)
  {
    v50 = -2145779666;
  }
  else
  {
    v46[3] = v16;
    v18 = v52;
    v20 = v48;
    v19 = v49;
    v21 = v48;
    v22 = v3;
    v23 = v47;
    do
    {
      v24 = *v19++;
      NextHop = gckSessionFindNextHop(v23, v24);
      *v21 = NextHop;
      if (v3)
        *v22 = -2145779666;
      ++v22;
      ++v21;
      --v18;
    }
    while (v18);
    v26 = 0;
    v27 = v3 + 1;
    v28 = v49 + 1;
    v29 = v20 + 1;
    v30 = 1;
    v50 = -2145779666;
    v31 = v52;
    do
    {
      v32 = v20[v26];
      if (v32 == -1)
      {
        ++v26;
      }
      else
      {
        v51 = v46;
        MEMORY[0x24BDAC7A8](NextHop);
        v34 = (_DWORD *)((char *)v46 - ((v33 + 15) & 0x7FFFFFFF0));
        memset(v34, 170, v33);
        *v34 = v49[v26];
        if (v3)
          v3[v26] = -1;
        ++v26;
        v35 = v52;
        if (v26 >= v52)
        {
          LODWORD(v40) = 1;
        }
        else
        {
          v36 = 1;
          v37 = v29;
          v38 = v28;
          v39 = v27;
          do
          {
            if (*v37 == v32)
            {
              v40 = (v36 + 1);
              v34[(int)v36] = *v38;
              *v37 = -1;
              if (v3)
                *v39 = -1;
            }
            else
            {
              v40 = v36;
            }
            ++v39;
            ++v38;
            ++v37;
            --v35;
            v36 = v40;
          }
          while (v30 != v35);
        }
        v41 = v47;
        v42 = OSPFMakeAudio((uint64_t)v54, 4096, (uint64_t)v53, 0, *(_DWORD *)(v47 + 108), v34, v40);
        if ((int)v42 < 1)
        {
          NextHop = 2149187598;
        }
        else
        {
          NextHop = SendUDPPacketToParticipantChannelID(v41, v54, v42, v32, 1, -1, 2);
          v50 &= (int)NextHop >> 31;
        }
        v20 = v48;
        v31 = v52;
        v43 = v52;
        v44 = v3;
        do
        {
          if (v3)
          {
            if (*v44 == -1)
              *v44 = NextHop;
          }
          ++v44;
          --v43;
        }
        while (v43);
      }
      ++v30;
      ++v27;
      ++v28;
      ++v29;
    }
    while (v26 != v31);
  }
  CheckOutHandleDebug();
  return v50;
}

uint64_t GCKSessionRegisterReliableTransportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = *(_QWORD *)(v5 + 96);
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetWifiEnabled(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = CheckInHandleDebug();
  if (!v3)
    return 2149187586;
  *(_DWORD *)(v3 + 40) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = *(_QWORD *)(v5 + 96);
  *(_QWORD *)(v6 + 8) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionStartEventCallbacks()
{
  uint64_t v0;
  uint64_t started;

  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149187586;
  started = StartEventCallbackThread(*(_DWORD **)(v0 + 96));
  if ((started & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      GCKSessionStartEventCallbacks_cold_1();
  }
  CheckOutHandleDebug();
  return started;
}

uint64_t GCKSessionInitiateRelay(uint64_t a1, int a2, const void *a3)
{
  uint64_t v5;
  uint64_t v6;
  CFDataRef v7;
  const __CFData *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  const UInt8 *BytePtr;
  int Length;
  pthread_rwlock_t *v22;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _WORD v31[9];

  *(_QWORD *)&v31[5] = *MEMORY[0x24BDAC8D0];
  error = 0;
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = v5;
  v7 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  v8 = v7;
  v9 = 4;
  if (!error && v7)
  {
    v22 = (pthread_rwlock_t *)(v6 + 7904);
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 7904));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(v6 + 7888);
        *(_DWORD *)buf = 136315906;
        v25 = v10;
        v26 = 2080;
        v27 = "GCKSessionInitiateRelay";
        v28 = 1024;
        v29 = 8652;
        v30 = 2048;
        *(_QWORD *)v31 = v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ********* GCKSessionInitiateRelay: about to check pCList: %p", buf, 0x26u);
      }
    }
    v13 = *(_QWORD *)(v6 + 7888);
    if (v13)
    {
      v14 = (os_log_t *)MEMORY[0x24BDFDC28];
      while (1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *(_DWORD *)(v13 + 116);
            *(_DWORD *)buf = 136316162;
            v25 = v15;
            v26 = 2080;
            v27 = "GCKSessionInitiateRelay";
            v28 = 1024;
            v29 = 8654;
            v30 = 1024;
            *(_DWORD *)v31 = a2;
            v31[2] = 1024;
            *(_DWORD *)&v31[3] = v17;
            _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ********* GCKSessionInitiateRelay: check pCList: %d == %d?", buf, 0x28u);
          }
        }
        if (*(_DWORD *)(v13 + 116) == a2)
          break;
        v13 = *(_QWORD *)(v13 + 728);
        if (!v13)
          goto LABEL_16;
      }
      v18 = *(_QWORD *)(v6 + 96);
      BytePtr = CFDataGetBytePtr(v8);
      Length = CFDataGetLength(v8);
      PostEventCallback(v18, a2, 9, BytePtr, Length, 0);
    }
LABEL_16:
    pthread_rwlock_unlock(v22);
    CheckOutHandleDebug();
    v9 = 0;
  }
  if (v8)
    CFRelease(v8);
  if (error)
    CFRelease(error);
  return v9;
}

uint64_t GCKSessionUpdateRelay(uint64_t a1, int a2, const void *a3)
{
  uint64_t v5;
  uint64_t v6;
  CFDataRef v7;
  const __CFData *v8;
  uint64_t v9;
  pthread_rwlock_t *v10;
  uint64_t v11;
  uint64_t v12;
  const UInt8 *BytePtr;
  int Length;
  CFErrorRef error;

  error = 0;
  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149187586;
  v6 = v5;
  v7 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  v8 = v7;
  v9 = 4;
  if (!error && v7)
  {
    v10 = (pthread_rwlock_t *)(v6 + 7904);
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 7904));
    v11 = *(_QWORD *)(v6 + 7888);
    if (v11)
    {
      while (*(_DWORD *)(v11 + 116) != a2)
      {
        v11 = *(_QWORD *)(v11 + 728);
        if (!v11)
          goto LABEL_9;
      }
      v12 = *(_QWORD *)(v6 + 96);
      BytePtr = CFDataGetBytePtr(v8);
      Length = CFDataGetLength(v8);
      PostEventCallback(v12, a2, 10, BytePtr, Length, 0);
    }
LABEL_9:
    pthread_rwlock_unlock(v10);
    CheckOutHandleDebug();
    v9 = 0;
  }
  if (v8)
    CFRelease(v8);
  if (error)
    CFRelease(error);
  return v9;
}

uint64_t GCKSessionIsParticipantConnected(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  pthread_rwlock_t *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = CheckInHandleDebug();
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (pthread_rwlock_t *)(v5 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7904));
  v8 = *(_QWORD *)(v6 + 7888);
  if (v8)
  {
    v9 = 0;
    do
    {
      if (*(_DWORD *)(v8 + 116) == a2)
        v9 |= *(_DWORD *)(v8 + 96);
      v8 = *(_QWORD *)(v8 + 728);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  pthread_rwlock_unlock(v7);
  v11 = v9 & 1;
  if (a3)
    v10 = v9 & 1;
  else
    v10 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v14 = &stru_24D466D90;
      v17 = 136316418;
      v18 = v12;
      v19 = 2080;
      if (v11)
        v15 = &stru_24D466D90;
      else
        v15 = CFSTR("not ");
      v20 = "GCKSessionIsParticipantConnected";
      if ((v10 & 2) == 0)
        v14 = CFSTR("not ");
      v21 = 1024;
      v22 = 8748;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v14;
      v27 = 1024;
      v28 = a2;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionIsParticipantConnected: %@connected directly, %@connected indirectly to participant '%08x'", (uint8_t *)&v17, 0x36u);
    }
  }
  CheckOutHandleDebug();
  return v10;
}

uint64_t gckSessionConnectedCallback(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  os_log_t *v8;
  _DWORD *v9;
  const char *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  os_log_t *v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v22;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v30;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  NSObject *v40;
  os_log_t *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  __int128 v54;
  uint64_t v55;
  NSObject *v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  const char *v64;
  os_log_t *v65;
  uint64_t v66;
  int v67;
  const char *v68;
  int v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  unsigned int v76;
  int ErrorLogLevelForModule;
  uint64_t v78;
  NSObject *v79;
  int v80;
  int v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  NSObject *v85;
  int v86;
  int v87;
  uint64_t v88;
  _DWORD *v89;
  uint64_t v90;
  pthread_rwlock_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  const char *v98;
  __int16 v99;
  int v100;
  __int16 v101;
  int v102;
  __int16 v103;
  _BYTE v104[50];
  _BYTE v105[10];
  __int128 v106;
  __int128 v107;
  _OWORD v108[2];
  __int128 v109;
  __int128 v110;
  _OWORD v111[2];
  __int128 v112;
  __int128 v113;
  _OWORD v114[2];
  __int128 v115;
  __int128 v116;
  _OWORD v117[4];
  _OWORD v118[4];
  _OWORD v119[4];
  _OWORD v120[4];
  _OWORD v121[4];
  _OWORD v122[4];
  _BYTE v123[22];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v4 = CheckInHandleDebug();
  if (!v4)
    return 2149187586;
  v5 = v4;
  v91 = (pthread_rwlock_t *)(v4 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v4 + 7904));
  *(_QWORD *)&v123[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v122[3] = v6;
  *(_OWORD *)v123 = v6;
  v122[2] = v6;
  *(_QWORD *)((char *)v122 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v121[3] = v6;
  v122[0] = v6;
  v121[2] = v6;
  *(_QWORD *)((char *)v121 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v120[3] = v6;
  v121[0] = v6;
  v120[2] = v6;
  *(_QWORD *)((char *)v120 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v119[3] = v6;
  v120[0] = v6;
  v119[2] = v6;
  *(_QWORD *)((char *)v119 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v118[3] = v6;
  v119[0] = v6;
  v118[2] = v6;
  *(_QWORD *)((char *)v118 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v117[3] = v6;
  v118[0] = v6;
  v117[2] = v6;
  v7 = *(_QWORD *)(v5 + 7888);
  v8 = (os_log_t *)MEMORY[0x24BDFDC28];
  v92 = v5;
  if (!v7)
  {
LABEL_49:
    pthread_rwlock_unlock(v91);
    goto LABEL_50;
  }
  v9 = (_DWORD *)(a3 + 28);
  v89 = (_DWORD *)(a3 + 68);
  v10 = "";
  v11 = 1;
  do
  {
    if (*(_DWORD *)(v7 + 116) != a2)
      goto LABEL_30;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v93 = IPPORTToStringWithSize();
        v90 = IPPORTToStringWithSize();
        v14 = v10;
        v15 = IPPORTToStringWithSize();
        v16 = v8;
        v17 = v9;
        v18 = IPPORTToStringWithSize();
        v19 = IPPORTToStringWithSize();
        v20 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136317442;
        v96 = v12;
        v97 = 2080;
        v98 = "gckSessionConnectedCallback";
        v99 = 1024;
        v100 = 5911;
        v101 = 1024;
        v102 = a2;
        v103 = 2080;
        *(_QWORD *)v104 = v93;
        *(_WORD *)&v104[8] = 2080;
        *(_QWORD *)&v104[10] = v90;
        *(_WORD *)&v104[18] = 2080;
        *(_QWORD *)&v104[20] = v15;
        v10 = v14;
        *(_WORD *)&v104[28] = 2080;
        *(_QWORD *)&v104[30] = v18;
        v9 = v17;
        v8 = v16;
        *(_WORD *)&v104[38] = 2080;
        *(_QWORD *)&v104[40] = v19;
        v5 = v92;
        *(_WORD *)&v104[48] = 2080;
        *(_QWORD *)v105 = v20;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Checking incoming ICE connection result for '%08X', CLIST local[%s] <->remote[%s],CONNRESULT local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x5Eu);
      }
    }
    if ((*v9 & 1) != (*(_DWORD *)(v7 + 412) & 1))
      goto LABEL_29;
    if ((*v9 & 1) != 0)
    {
      if (*(_QWORD *)(a3 + 48) != *(_QWORD *)(v7 + 432) || *(_QWORD *)(a3 + 56) != *(_QWORD *)(v7 + 440))
        goto LABEL_29;
    }
    else if (*(_DWORD *)(a3 + 48) != *(_DWORD *)(v7 + 432))
    {
      goto LABEL_29;
    }
    if (*(unsigned __int16 *)(a3 + 64) != *(unsigned __int16 *)(v7 + 448))
      goto LABEL_29;
    v22 = (_DWORD *)(v7 + 452);
    if (IsIPPORTValid())
    {
      if ((*v89 & 1) != (*v22 & 1))
        goto LABEL_32;
      if ((*v89 & 1) != 0)
      {
        if (*(_QWORD *)(a3 + 88) != *(_QWORD *)(v7 + 472) || *(_QWORD *)(a3 + 96) != *(_QWORD *)(v7 + 480))
        {
LABEL_32:
          v24 = (unsigned int *)(v7 + 96);
          while (1)
          {
            v25 = *v24;
            v26 = *v24 & 2;
            while (1)
            {
              v27 = __ldxr(v24);
              if (v27 != v25)
                break;
              if (!__stxr(v26, v24))
                goto LABEL_38;
            }
            __clrex();
          }
        }
      }
      else if (*(_DWORD *)(a3 + 88) != *(_DWORD *)(v7 + 472))
      {
        goto LABEL_32;
      }
      if (*(unsigned __int16 *)(a3 + 104) != *(unsigned __int16 *)(v7 + 488))
        goto LABEL_32;
LABEL_29:
      v11 = 0;
      goto LABEL_30;
    }
LABEL_38:
    v28 = (unsigned int *)(v7 + 96);
    while (!__ldxr(v28))
    {
      if (!__stxr(1u, v28))
      {
LABEL_48:
        v32 = *(_OWORD *)(a3 + 148);
        v33 = *(_OWORD *)(a3 + 164);
        *(_QWORD *)(v7 + 484) = *(_QWORD *)(a3 + 180);
        *(_OWORD *)v22 = v32;
        *(_OWORD *)(v7 + 468) = v33;
        goto LABEL_49;
      }
    }
    __clrex();
    while (1)
    {
      v30 = __ldxr(v28);
      if (v30 != 2)
        break;
      if (!__stxr(3u, v28))
        goto LABEL_48;
    }
    v11 = 0;
    __clrex();
LABEL_30:
    v7 = *(_QWORD *)(v7 + 728);
  }
  while (v7);
  pthread_rwlock_unlock(v91);
  if ((v11 & 1) == 0)
  {
    CheckOutHandleDebug();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v48 = VRTraceErrorLogLevelToCSTR();
      v49 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *(_DWORD *)(a3 + 16);
        v51 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136316418;
        v96 = v48;
        v97 = 2080;
        v98 = "gckSessionConnectedCallback";
        v99 = 1024;
        v100 = 5945;
        v101 = 1024;
        v102 = a2;
        v103 = 1024;
        *(_DWORD *)v104 = v50;
        *(_WORD *)&v104[4] = 2080;
        *(_QWORD *)&v104[6] = v51;
        _os_log_impl(&dword_215C5C000, v49, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignored duplicate ICE connectivity check results for '%08X': proto '%d', local[%s]\n", buf, 0x32u);
      }
    }
    return 0;
  }
LABEL_50:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7
    && (v34 = VRTraceErrorLogLevelToCSTR(), v35 = *v8, os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT)))
  {
    v36 = *(_DWORD *)(a3 + 16);
    v37 = IPPORTToStringWithSize();
    *(_DWORD *)buf = 136316418;
    v96 = v34;
    v97 = 2080;
    v98 = "gckSessionConnectedCallback";
    v99 = 1024;
    v100 = 5951;
    v101 = 1024;
    v102 = a2;
    v103 = 1024;
    *(_DWORD *)v104 = v36;
    *(_WORD *)&v104[4] = 2080;
    *(_QWORD *)&v104[6] = v37;
    _os_log_impl(&dword_215C5C000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Passed new ICE connectivity check results for '%08X': proto '%d', local[%s]\n", buf, 0x32u);
  }
  else if (!a3)
  {
    goto LABEL_62;
  }
  *(_QWORD *)((char *)v117 + 14) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v116 = v38;
  v117[0] = v38;
  v115 = v38;
  *(_QWORD *)((char *)v114 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v113 = v38;
  v114[0] = v38;
  v112 = v38;
  *(_QWORD *)((char *)v111 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v110 = v38;
  v111[0] = v38;
  v109 = v38;
  *(_QWORD *)((char *)v108 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v107 = v38;
  v108[0] = v38;
  v106 = v38;
  while (2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v8;
        v42 = *(_DWORD *)(a3 + 16);
        v43 = IPPORTToStringWithSize();
        v44 = IPPORTToStringWithSize();
        v45 = IPPORTToStringWithSize();
        v46 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136317186;
        v96 = v39;
        v97 = 2080;
        v98 = "gckSessionConnectedCallback";
        v99 = 1024;
        v100 = 5968;
        v101 = 1024;
        v102 = a2;
        v103 = 1024;
        *(_DWORD *)v104 = v42;
        v8 = v41;
        *(_WORD *)&v104[4] = 2080;
        *(_QWORD *)&v104[6] = v43;
        *(_WORD *)&v104[14] = 2080;
        *(_QWORD *)&v104[16] = v44;
        *(_WORD *)&v104[24] = 2080;
        *(_QWORD *)&v104[26] = v45;
        *(_WORD *)&v104[34] = 2080;
        *(_QWORD *)&v104[36] = v46;
        _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ICE check succeeded with %08X: proto %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x50u);
      }
    }
    if (*(_DWORD *)(a3 + 16) == 6 && *(_DWORD *)a3 == a2)
    {
      v5 = v92;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v96 = v52;
          v97 = 2080;
          v98 = "gckSessionConnectedCallback";
          v99 = 1024;
          v100 = 5970;
          _os_log_impl(&dword_215C5C000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d PROTO_GCK found!", buf, 0x1Cu);
        }
      }
      *(_QWORD *)((char *)v117 + 14) = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v116 = v54;
      v117[0] = v54;
      v115 = v54;
      *(_QWORD *)((char *)v114 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v113 = v54;
      v114[0] = v54;
      v112 = v54;
      *(_QWORD *)((char *)v111 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v110 = v54;
      v111[0] = v54;
      v109 = v54;
      *(_QWORD *)((char *)v108 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v107 = v54;
      v108[0] = v54;
      v106 = v54;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v55 = VRTraceErrorLogLevelToCSTR();
        v56 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v57 = *(_DWORD *)(v92 + 108);
          v58 = *(_DWORD *)(v92 + 44);
          v59 = IPPORTToStringWithSize();
          v60 = IPPORTToStringWithSize();
          v61 = IPPORTToStringWithSize();
          v62 = IPPORTToStringWithSize();
          v63 = *(_DWORD *)(a3 + 20);
          *(_DWORD *)buf = 136317698;
          v96 = v55;
          if (v63)
            v64 = "IS";
          else
            v64 = "NOT";
          v97 = 2080;
          v98 = "gckSessionConnectedCallback";
          v99 = 1024;
          v100 = 6002;
          v101 = 1024;
          v102 = a2;
          v103 = 1024;
          *(_DWORD *)v104 = v57;
          *(_WORD *)&v104[4] = 1024;
          *(_DWORD *)&v104[6] = v58;
          v5 = v92;
          *(_WORD *)&v104[10] = 2080;
          *(_QWORD *)&v104[12] = v59;
          *(_WORD *)&v104[20] = 2080;
          *(_QWORD *)&v104[22] = v60;
          *(_WORD *)&v104[30] = 2080;
          *(_QWORD *)&v104[32] = v61;
          *(_WORD *)&v104[40] = 2080;
          *(_QWORD *)&v104[42] = v62;
          *(_WORD *)v105 = 2080;
          *(_QWORD *)&v105[2] = v64;
          _os_log_impl(&dword_215C5C000, v56, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ICE check succeeded with %08X (L:%08X R:%08X): local[%s], src[%s] <-> dst[%s], remote[%s], RELAY %s USED\n", buf, 0x60u);
        }
      }
      v65 = v8;
      perfTimerStop();
      perfTimerStop();
      if (*(_DWORD *)(v5 + 48))
        a2 = *(_DWORD *)(v5 + 44);
      TimingLog(3, 0, (uint64_t)"ICE completed");
      gckSessionSetupChannelCList(v5, a2, a3);
      if (*(_DWORD *)(a3 + 312) == -1)
        goto LABEL_66;
      gckSessionUpdateNode(v5, a2, *(_DWORD *)(a3 + 268), 0);
      gckSessionChangeState(v5, a2, 2);
      pthread_rwlock_rdlock(v91);
      v66 = *(_QWORD *)(v5 + 7888);
      if (v66)
      {
        while (*(_DWORD *)(v66 + 116) != a2)
        {
          v66 = *(_QWORD *)(v66 + 728);
          if (!v66)
            goto LABEL_87;
        }
        v67 = *(_DWORD *)(v66 + 80);
        pthread_rwlock_unlock(v91);
        if (!v67)
          goto LABEL_92;
        gckSessionDisconnectNeighbor(v5, a2, 255);
        goto LABEL_66;
      }
LABEL_87:
      pthread_rwlock_unlock(v91);
      while (1)
      {
LABEL_92:
        if (*(_DWORD *)(a3 + 16) != 6 || *(_DWORD *)a3 != a2)
          goto LABEL_126;
        v69 = *(_DWORD *)(a3 + 312);
        if ((v69 & 0x80000000) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v70 = VRTraceErrorLogLevelToCSTR();
            v71 = *v65;
            if (os_log_type_enabled(*v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v96 = v70;
              v97 = 2080;
              v98 = "gckSessionConnectedCallback";
              v99 = 1024;
              v100 = 6055;
              v101 = 1024;
              v102 = a2;
              v103 = 1024;
              *(_DWORD *)v104 = v69;
              _os_log_impl(&dword_215C5C000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CONNECTED TO %08X ON CHANNEL %d...", buf, 0x28u);
            }
          }
          v72 = *(_DWORD *)(a3 + 28);
          if ((v72 & 8) != 0 && (v72 & 4) == 0 && (*(_DWORD *)(a3 + 68) & 0xC) == 8)
          {
            pthread_rwlock_rdlock(v91);
            v73 = *(_QWORD *)(v5 + 7888);
            if (v73)
            {
              while (*(_DWORD *)(v73 + 116) != a2 || v69 != *(_DWORD *)(v73 + 100))
              {
                v73 = *(_QWORD *)(v73 + 728);
                if (!v73)
                  goto LABEL_110;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v74 = VRTraceErrorLogLevelToCSTR();
                v75 = *v65;
                if (os_log_type_enabled(*v65, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  v96 = v74;
                  v97 = 2080;
                  v98 = "gckSessionConnectedCallback";
                  v99 = 1024;
                  v100 = 6068;
                  v101 = 1024;
                  v102 = v69;
                  _os_log_impl(&dword_215C5C000, v75, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d QUICK DISCONNECT ENABLED ON CHANNEL %d...", buf, 0x22u);
                }
              }
              *(_QWORD *)(v73 + 392) = 0x4025FAE147AE147BLL;
            }
LABEL_110:
            pthread_rwlock_unlock(v91);
          }
        }
        v76 = *(_DWORD *)(v5 + 108);
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (v76 >= a2)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            v84 = VRTraceErrorLogLevelToCSTR();
            v85 = *v65;
            if (os_log_type_enabled(*v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v96 = v84;
              v97 = 2080;
              v98 = "gckSessionConnectedCallback";
              v99 = 1024;
              v100 = 6090;
              v101 = 1024;
              v102 = a2;
              v103 = 1024;
              *(_DWORD *)v104 = v69;
              _os_log_impl(&dword_215C5C000, v85, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WAITING FIRST HELLO TO %08X ON CHANNEL %d...", buf, 0x28u);
            }
          }
          v86 = gckSessionWaitForHello(v5, a2, v69);
          if ((v86 & 0x80000000) == 0)
            goto LABEL_126;
          v87 = v86;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_125;
          v88 = VRTraceErrorLogLevelToCSTR();
          v83 = *v65;
          if (!os_log_type_enabled(*v65, OS_LOG_TYPE_ERROR))
            goto LABEL_125;
          *(_DWORD *)buf = 136316162;
          v96 = v88;
          v97 = 2080;
          v98 = "gckSessionConnectedCallback";
          v99 = 1024;
          v100 = 6094;
          v101 = 1024;
          v102 = 6094;
          v103 = 1024;
          *(_DWORD *)v104 = v87;
          v68 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCK"
                "Session.c:%d: gckSessionWaitForHello failed(%X)";
        }
        else
        {
          if (ErrorLogLevelForModule >= 7)
          {
            v78 = VRTraceErrorLogLevelToCSTR();
            v79 = *v65;
            if (os_log_type_enabled(*v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v96 = v78;
              v97 = 2080;
              v98 = "gckSessionConnectedCallback";
              v99 = 1024;
              v100 = 6081;
              v101 = 1024;
              v102 = a2;
              v103 = 1024;
              *(_DWORD *)v104 = v69;
              _os_log_impl(&dword_215C5C000, v79, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SENDING FIRST HELLO TO %08X ON CHANNEL %d...", buf, 0x28u);
            }
          }
          v80 = gckSessionSendHello(v5, a2, 1, 1, (int)*(double *)(v5 + 24), v69);
          if ((v80 & 0x80000000) == 0)
            goto LABEL_126;
          v81 = v80;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_125;
          v82 = VRTraceErrorLogLevelToCSTR();
          v83 = *v65;
          if (!os_log_type_enabled(*v65, OS_LOG_TYPE_ERROR))
            goto LABEL_125;
          *(_DWORD *)buf = 136316162;
          v96 = v82;
          v97 = 2080;
          v98 = "gckSessionConnectedCallback";
          v99 = 1024;
          v100 = 6085;
          v101 = 1024;
          v102 = 6085;
          v103 = 1024;
          *(_DWORD *)v104 = v81;
          v68 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCK"
                "Session.c:%d: gckSessionSendHello failed(%X)";
        }
        _os_log_error_impl(&dword_215C5C000, v83, OS_LOG_TYPE_ERROR, v68, buf, 0x28u);
LABEL_125:
        gckSessionChangeState(v5, a2, 5);
LABEL_126:
        a3 = *(_QWORD *)(a3 + 304);
        if (!a3)
          goto LABEL_66;
      }
    }
    a3 = *(_QWORD *)(a3 + 304);
    if (a3)
      continue;
    break;
  }
  v5 = v92;
LABEL_62:
  *(_DWORD *)buf = -1431655766;
  gckSessionUpdateNode(v5, a2, -1, (int *)buf);
  if (*(_DWORD *)buf)
    v47 = 1;
  else
    v47 = 5;
  gckSessionChangeState(v5, a2, v47);
LABEL_66:
  gckSessionCheckPendingConnections(v5, 1);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionUpdateNode(uint64_t a1, int a2, int a3, int *a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _BOOL4 v12;
  int v14;

  v8 = (pthread_mutex_t *)(a1 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  v9 = *(unsigned int *)(a1 + 400);
  if ((int)v9 < 1)
  {
    LODWORD(v10) = 0;
    v12 = 0;
    if (!a4)
      return pthread_mutex_unlock(v8);
  }
  else
  {
    v10 = 0;
    v11 = (_DWORD *)(a1 + 408);
    while (*(v11 - 1) != a2)
    {
      ++v10;
      v11 += 3;
      if (v9 == v10)
      {
        v12 = 0;
        LODWORD(v10) = *(_DWORD *)(a1 + 400);
        if (a4)
          goto LABEL_10;
        return pthread_mutex_unlock(v8);
      }
    }
    *v11 = a3;
    v12 = (int)v9 > 1;
    if (!a4)
      return pthread_mutex_unlock(v8);
  }
LABEL_10:
  v14 = (_DWORD)v10 == (_DWORD)v9 && (int)v9 > 0 || v12;
  *a4 = v14;
  return pthread_mutex_unlock(v8);
}

uint64_t gckSessionSetupChannelCList(uint64_t a1, int a2, uint64_t a3)
{
  pthread_rwlock_t *v6;
  int **v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  _DWORD *v12;
  int *v13;
  __int128 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  int Handle;
  __int128 v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  int *v41;
  int v42;
  int **v43;
  int v44;
  int **v45;
  int **v46;
  int *v47;
  BOOL v48;
  int v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  _BYTE buf[56];
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[2];
  __int128 v69;
  __int128 v70;
  _OWORD v71[2];
  __int128 v72;
  __int128 v73;
  _OWORD v74[2];
  __int128 v75;
  __int128 v76;
  _OWORD v77[2];
  _BYTE v78[54];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  v7 = (int **)(a1 + 7888);
  v8 = *(_QWORD *)(a1 + 7888);
  if (v8)
  {
    v9 = 0;
    do
    {
      if (*(_DWORD *)(v8 + 116) == a2)
      {
        v10 = *(_DWORD *)(v8 + 108);
        if (v10 >= v9)
          v9 = v10 + 1;
      }
      v8 = *(_QWORD *)(v8 + 728);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v58 = a1;
  pthread_rwlock_unlock(v6);
  v11 = 0;
  do
  {
    if (*(_DWORD *)(a3 + 16) != 6 || *(_DWORD *)a3 != a2)
      goto LABEL_31;
    v12 = (_DWORD *)(a3 + 28);
    pthread_rwlock_wrlock(v6);
    v13 = *v7;
    if (!*v7)
    {
LABEL_26:
      pthread_rwlock_unlock(v6);
      if (!v11)
      {
        *(_QWORD *)&v78[46] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v78[16] = v15;
        *(_OWORD *)&v78[32] = v15;
        *(_OWORD *)v78 = v15;
        *(_QWORD *)((char *)v77 + 14) = 0xAAAAAAAAAAAAAAAALL;
        v76 = v15;
        v77[0] = v15;
        v75 = v15;
        *(_QWORD *)((char *)v74 + 14) = 0xAAAAAAAAAAAAAAAALL;
        v73 = v15;
        v74[0] = v15;
        v72 = v15;
        *(_QWORD *)((char *)v71 + 14) = 0xAAAAAAAAAAAAAAAALL;
        v70 = v15;
        v71[0] = v15;
        v69 = v15;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v18 = IPPORTToStringWithSize();
            v19 = IPPORTToStringWithSize();
            v20 = IPPORTToStringWithSize();
            v21 = IPPORTToStringWithSize();
            *(_DWORD *)buf = 136317442;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "gckSessionSetupChannelCList";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 5450;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = -1;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = a2;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v9;
            *(_WORD *)&buf[46] = 2080;
            *(_QWORD *)&buf[48] = v18;
            v60 = 2080;
            v61 = v19;
            v62 = 2080;
            v63 = v20;
            v64 = 2080;
            v65 = v21;
            _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to setup channel %d with %08X: priority %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x56u);
          }
        }
        v11 = 0;
        *(_DWORD *)(a3 + 312) = -1;
      }
      goto LABEL_31;
    }
    while (1)
    {
      if ((v13[28] & 0x80000000) == 0 || v13[29] != a2 || (*v12 & 1) != (v13[103] & 1))
        goto LABEL_25;
      if ((*v12 & 1) != 0)
      {
        if (*(_QWORD *)(a3 + 48) != *((_QWORD *)v13 + 54) || *(_QWORD *)(a3 + 56) != *((_QWORD *)v13 + 55))
          goto LABEL_25;
      }
      else if (*(_DWORD *)(a3 + 48) != v13[108])
      {
        goto LABEL_25;
      }
      if (*(unsigned __int16 *)(a3 + 64) == *((unsigned __int16 *)v13 + 224))
        break;
LABEL_25:
      v13 = (int *)*((_QWORD *)v13 + 91);
      if (!v13)
        goto LABEL_26;
    }
    *(_QWORD *)((char *)v77 + 14) = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v76 = v22;
    v77[0] = v22;
    v75 = v22;
    *(_QWORD *)((char *)v74 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v73 = v22;
    v74[0] = v22;
    v72 = v22;
    *(_QWORD *)((char *)v71 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v70 = v22;
    v71[0] = v22;
    v69 = v22;
    *(_QWORD *)((char *)v68 + 14) = 0xAAAAAAAAAAAAAAAALL;
    v67 = v22;
    v68[0] = v22;
    v66 = v22;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v55 = v13[25];
        v52 = IPPORTToStringWithSize();
        v51 = IPPORTToStringWithSize();
        v25 = IPPORTToStringWithSize();
        v26 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136317442;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "gckSessionSetupChannelCList";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 5414;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v55;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a2;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v9;
        *(_WORD *)&buf[46] = 2080;
        *(_QWORD *)&buf[48] = v52;
        v60 = 2080;
        v61 = v51;
        v62 = 2080;
        v63 = v25;
        v64 = 2080;
        v65 = v26;
        _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setup channel %d with %08X: priority %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x56u);
      }
    }
    v27 = *(_OWORD *)(a3 + 148);
    v28 = *(_OWORD *)(a3 + 164);
    *(_QWORD *)(v13 + 121) = *(_QWORD *)(a3 + 180);
    *(_OWORD *)(v13 + 113) = v27;
    *(_OWORD *)(v13 + 117) = v28;
    v13[27] = v9;
    v13[28] = v9;
    v13[1] = *(_DWORD *)(a3 + 20);
    v13[140] = *(_DWORD *)(a3 + 268);
    *((_WORD *)v13 + 4) = *(_WORD *)(a3 + 26);
    Handle = GCK_BWE_CreateHandle((uint64_t *)v13 + 92, v13[29], 1238);
    *(_QWORD *)&buf[46] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[16] = v30;
    *(_OWORD *)&buf[32] = v30;
    *(_OWORD *)buf = v30;
    if ((int)VRTraceGetErrorLogLevelForModule() > 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x24BDFDC28];
      v33 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v53 = *((_QWORD *)v13 + 92);
          v56 = v13[29];
          v34 = IPPORTToStringWithSize();
          *(_DWORD *)v78 = 136316418;
          *(_QWORD *)&v78[4] = v31;
          *(_WORD *)&v78[12] = 2080;
          *(_QWORD *)&v78[14] = "BWE_CreateObject";
          *(_WORD *)&v78[22] = 1024;
          *(_DWORD *)&v78[24] = 8785;
          *(_WORD *)&v78[28] = 2048;
          *(_QWORD *)&v78[30] = v53;
          *(_WORD *)&v78[38] = 1024;
          *(_DWORD *)&v78[40] = v56;
          *(_WORD *)&v78[44] = 2080;
          *(_QWORD *)&v78[46] = v34;
          _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d **Created BWE %p for node %d %s ", v78, 0x36u);
        }
      }
      else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v54 = *((_QWORD *)v13 + 92);
        v57 = v13[29];
        v40 = IPPORTToStringWithSize();
        *(_DWORD *)v78 = 136316418;
        *(_QWORD *)&v78[4] = v31;
        *(_WORD *)&v78[12] = 2080;
        *(_QWORD *)&v78[14] = "BWE_CreateObject";
        *(_WORD *)&v78[22] = 1024;
        *(_DWORD *)&v78[24] = 8785;
        *(_WORD *)&v78[28] = 2048;
        *(_QWORD *)&v78[30] = v54;
        *(_WORD *)&v78[38] = 1024;
        *(_DWORD *)&v78[40] = v57;
        *(_WORD *)&v78[44] = 2080;
        *(_QWORD *)&v78[46] = v40;
        _os_log_debug_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d **Created BWE %p for node %d %s ", v78, 0x36u);
      }
    }
    *((_WORD *)v13 + 372) = 0;
    if (Handle)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v78 = 136315906;
          *(_QWORD *)&v78[4] = v35;
          *(_WORD *)&v78[12] = 2080;
          *(_QWORD *)&v78[14] = "BWE_CreateObject";
          *(_WORD *)&v78[22] = 1024;
          *(_DWORD *)&v78[24] = 8791;
          *(_WORD *)&v78[28] = 1024;
          *(_DWORD *)&v78[30] = Handle;
          _os_log_error_impl(&dword_215C5C000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d GCK_BWE_CreateHandle failed (%08X)", v78, 0x22u);
        }
      }
    }
    *(_DWORD *)(a3 + 312) = v13[25];
    v37 = v13[24];
    if ((v37 & 1) == 0)
    {
      v13[24] = v37 | 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "gckSessionSetupChannelCList";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 5428;
          _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d retryICE: setting fGotICEResultAlready", buf, 0x1Cu);
        }
      }
    }
    ++v9;
    pthread_rwlock_unlock(v6);
    v11 = 1;
LABEL_31:
    a3 = *(_QWORD *)(a3 + 304);
  }
  while (a3);
  pthread_rwlock_wrlock(v6);
  v41 = *v7;
  if (!*v7)
    return pthread_rwlock_unlock(v6);
  v42 = 0;
  while (2)
  {
    if (v41[29] == a2 && v41[27] < 0)
    {
      if (*v41 != -1)
      {
        close(*v41);
        *v41 = -1;
      }
      v44 = v41[18];
      if (v44 != -1)
      {
        close(v44);
        v41[18] = -1;
      }
      v45 = v7;
      do
      {
        v46 = v45;
        v47 = *v45;
        v45 = (int **)(*v45 + 182);
        if (v47)
          v48 = v47 == v41;
        else
          v48 = 1;
      }
      while (!v48);
      if (!v47)
      {
        v42 = 1;
        goto LABEL_55;
      }
      *v46 = (int *)*((_QWORD *)v47 + 91);
      *((_QWORD *)v47 + 91) = *(_QWORD *)(v58 + 7896);
      *(_QWORD *)(v58 + 7896) = v47;
      v42 = 1;
      v43 = v7;
    }
    else
    {
LABEL_55:
      v43 = (int **)(v41 + 182);
    }
    v41 = *v43;
    if (*v43)
      continue;
    break;
  }
  if (v42)
  {
    v49 = *(_DWORD *)(v58 + 12);
    if (v49 != -1)
    {
      *(_DWORD *)(v58 + 12) = -1;
      close(v49);
    }
  }
  return pthread_rwlock_unlock(v6);
}

uint64_t gckSessionSendHello(uint64_t a1, unsigned int a2, int a3, int a4, __int16 a5, int a6)
{
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  pthread_mutex_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  void *v31;
  int v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v12;
  v35 = v12;
  v33 = (void *)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v15 = " back";
      *(_DWORD *)buf = 136316162;
      if (a3)
        v15 = "";
      v37 = v13;
      v38 = 2080;
      v39 = "gckSessionSendHello";
      v40 = 1024;
      v41 = 1551;
      v42 = 2080;
      v43 = v15;
      v44 = 1024;
      v45 = a2;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending HELLO%s to [%08X]", buf, 0x2Cu);
    }
  }
  WORD6(v34) = a5;
  *(_QWORD *)&v35 = 0x8000000000000402;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v37 = v16;
      v38 = 2080;
      v39 = "gckSessionSendHello";
      v40 = 1024;
      v41 = 1554;
      v42 = 2048;
      v43 = (const char *)v35;
      _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before MakeHello: %llX", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v37 = v18;
      v38 = 2080;
      v39 = "gckSessionSendHello";
      v40 = 1024;
      v41 = 1556;
      v42 = 1024;
      LODWORD(v43) = a6;
      _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionSendHello: channel %d", buf, 0x22u);
    }
  }
  v20 = 2149187606;
  v21 = OSPFMakeHello(&v33, (uint64_t)&v34, *(_DWORD *)(a1 + 108), a2);
  if ((v21 & 0x80000000) != 0)
    return 2149187618;
  v22 = v21;
  if (!a3)
  {
    v20 = SendUDPPacketToParticipantChannelID(a1, v33, v21, a2, a4, a6, 0);
    goto LABEL_31;
  }
  if (a4)
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  v23 = *(_QWORD *)(a1 + 7888);
  if (!v23)
  {
LABEL_23:
    v24 = 1;
    if (!a4)
      goto LABEL_25;
    goto LABEL_24;
  }
  while (1)
  {
    if (*(_DWORD *)(v23 + 116) != a2)
      goto LABEL_22;
    if (a6 < 0)
      break;
    if (*(_DWORD *)(v23 + 100) == a6)
      goto LABEL_34;
LABEL_22:
    v23 = *(_QWORD *)(v23 + 728);
    if (!v23)
      goto LABEL_23;
  }
  if (*(_DWORD *)(v23 + 108))
    goto LABEL_22;
LABEL_34:
  v26 = (pthread_mutex_t *)(v23 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 664));
  v27 = *(_QWORD *)(v23 + 496);
  if (v27)
  {
    while (1)
    {
      v28 = v27;
      if (*(_BYTE *)v27 == 1)
        break;
      v27 = *(_QWORD *)(v27 + 64);
      if (!v27)
      {
        v29 = (_QWORD *)(v28 + 64);
        goto LABEL_39;
      }
    }
    *(_OWORD *)(v27 + 8) = xmmword_215CDD8F0;
    *(_QWORD *)(v27 + 32) = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v27 + 24) = 1;
    v31 = *(void **)(v27 + 40);
    if (v31)
      free(v31);
    *(_QWORD *)(v28 + 40) = v33;
    *(_DWORD *)(v28 + 48) = v22;
    *(_DWORD *)(v28 + 52) = a2;
  }
  else
  {
    v29 = (_QWORD *)(v23 + 496);
LABEL_39:
    v30 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *v30 = 1;
    *(_OWORD *)(v30 + 8) = xmmword_215CDD8F0;
    *((_QWORD *)v30 + 4) = *(_QWORD *)(a1 + 32);
    *((_QWORD *)v30 + 5) = v33;
    *((_DWORD *)v30 + 12) = v22;
    *((_DWORD *)v30 + 13) = a2;
    *v29 = v30;
  }
  pthread_mutex_unlock(v26);
  v32 = *(_DWORD *)(a1 + 12);
  if (v32 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v32);
  }
  v24 = 0;
  if (a4)
LABEL_24:
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
LABEL_25:
  if (!v24)
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gckSessionSendHello_cold_1();
  }
LABEL_31:
  free(v33);
  return v20;
}

uint64_t gckSessionWaitForHello(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  NSObject *v7;
  pthread_rwlock_t *v8;
  uint64_t v9;
  uint64_t v10;
  pthread_mutex_t *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double **v15;
  double *v16;
  int v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136316162;
      v20 = v6;
      v21 = 2080;
      v22 = "gckSessionWaitForHello";
      v23 = 1024;
      v24 = 1638;
      v25 = 1024;
      v26 = a2;
      v27 = 1024;
      v28 = 10;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for HELLO from [%08X] for %d seconds", (uint8_t *)&v19, 0x28u);
    }
  }
  v8 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  v9 = *(_QWORD *)(a1 + 7888);
  if (!v9)
  {
LABEL_11:
    v10 = 2149187606;
    pthread_rwlock_unlock(v8);
    if ((int)VRTraceGetErrorLogLevelForModule() > 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionWaitForHello_cold_1();
    }
    return v10;
  }
  while (1)
  {
    if (*(_DWORD *)(v9 + 116) != a2)
      goto LABEL_10;
    if (a3 < 0)
      break;
    if (*(_DWORD *)(v9 + 100) == a3)
      goto LABEL_14;
LABEL_10:
    v9 = *(_QWORD *)(v9 + 728);
    if (!v9)
      goto LABEL_11;
  }
  if (*(_DWORD *)(v9 + 108))
    goto LABEL_10;
LABEL_14:
  v11 = (pthread_mutex_t *)(v9 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 664));
  v12 = micro();
  v13 = *(_QWORD *)(v9 + 496);
  if (v13)
  {
    while (1)
    {
      v14 = v13;
      if (*(_BYTE *)v13 == 1)
        break;
      v13 = *(_QWORD *)(v13 + 64);
      if (!v13)
      {
        v15 = (double **)(v14 + 64);
        goto LABEL_19;
      }
    }
  }
  else
  {
    v15 = (double **)(v9 + 496);
LABEL_19:
    v16 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(_BYTE *)v16 = 1;
    v16[1] = 0.065;
    v16[2] = v12 + 10.0;
    v16[4] = v12 + 10.0;
    v16[5] = 0.0;
    *((_DWORD *)v16 + 12) = 0;
    *((_DWORD *)v16 + 13) = a2;
    *v15 = v16;
    v17 = *(_DWORD *)(a1 + 12);
    if (v17 != -1)
    {
      *(_DWORD *)(a1 + 12) = -1;
      close(v17);
    }
  }
  pthread_mutex_unlock(v11);
  pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
  return 0;
}

void gckSessionCheckPendingConnections(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a2)
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  v4 = *(unsigned int *)(a1 + 112);
  if ((int)v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    v6 = (_DWORD *)(a1 + 120);
    do
    {
      if (*v6 == -1)
        ++v5;
      v6 += 120;
      --v4;
    }
    while (v4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  v7 = *(_QWORD *)(a1 + 7888);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)(a1 + 7888);
    do
    {
      v8 += (*(_DWORD *)(v9 + 96) & 1) == 0;
      v9 = *(_QWORD *)(v9 + 728);
    }
    while (v9);
    v10 = 0;
    do
    {
      if (!*(_DWORD *)(v7 + 92))
        ++v10;
      v7 = *(_QWORD *)(v7 + 728);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3
    && (v11 = VRTraceErrorLogLevelToCSTR(),
        v12 = *MEMORY[0x24BDFDC28],
        os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
  {
    v13 = 136316418;
    v14 = v11;
    v15 = 2080;
    v16 = "gckSessionCheckPendingConnections";
    v17 = 1024;
    v18 = 1527;
    v19 = 1024;
    v20 = v8;
    v21 = 1024;
    v22 = v5;
    v23 = 1024;
    v24 = v10;
    _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d gckSessionCheckPendingConnections: iICEChecksLeft=%d, iUnconnectedNodeCount=%d, iDDsExpected=%d", (uint8_t *)&v13, 0x2Eu);
    if (v8)
      goto LABEL_25;
  }
  else if (v8)
  {
    goto LABEL_25;
  }
  if (!v5 && !v10)
    PostEventCallback(*(_QWORD *)(a1 + 96), 0, 11, 0, 0, 0);
LABEL_25:
  if (a2)
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
}

uint64_t SendUDPPacketToParticipantChannelID(uint64_t a1, _WORD *a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7;
  uint64_t i;
  double v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v7 = 0;
  v29 = *MEMORY[0x24BDAC8D0];
  if (a2 && (_DWORD)a3)
  {
    if (a5)
      pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
    v7 = 2149187606;
    for (i = *(_QWORD *)(a1 + 7888); i; i = *(_QWORD *)(i + 728))
    {
      if (*(_DWORD *)(i + 116) == a4)
      {
        if (a6 < 0)
        {
          if (*(_DWORD *)(i + 108))
            continue;
        }
        else if (*(_DWORD *)(i + 100) != a6)
        {
          continue;
        }
        if ((*(_DWORD *)(i + 408) & 0xFFFFFFFE) == 2)
        {
          v17 = micro();
          if (a7 && (*(_DWORD *)(a1 + 8320) || v17 <= *(double *)(i + 40)))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v21 = 136315906;
                v22 = v19;
                v23 = 2080;
                v24 = "SendUDPPacketToParticipantChannelID";
                v25 = 1024;
                v26 = 647;
                v27 = 1024;
                v28 = a4;
                _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %08X: DROP", (uint8_t *)&v21, 0x22u);
              }
            }
          }
          else
          {
            v18 = SendUDPPacketCList(a1, i, a2, a3, 0, 1);
            if (v18 == -1072037876)
              *(double *)(i + 40) = v17 + 3.0;
            if (v18 == -1072037856)
              v7 = 2149187626;
            else
              v7 = v18;
          }
          break;
        }
      }
    }
    if (a5)
      pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
  }
  return v7;
}

uint64_t SendUDPPacketCList(uint64_t a1, uint64_t a2, _WORD *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7;
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  int v17;
  __int16 v18;
  int v19;
  pthread_mutex_t *v20;
  unsigned __int8 ***v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v28;
  int ErrorLogLevelForModule;
  int *v30;
  int *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  NSObject *log;
  _QWORD v37[8];
  int v38;
  int v39;
  unint64_t v40;
  _BYTE v41[20];
  int v42;
  _QWORD v43[3];
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  int v49;
  _BYTE buf[40];
  __int16 v51;
  int v52;
  __int16 v53;
  double v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;

  v7 = a5;
  v57 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  v48 = -2145779690;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2000000000;
  v44 = 0;
  v55 = 0xAAAAAAAAAAAAAAAALL;
  v56 = 0xAAAAAAAAAAAAAAAALL;
  memset(v41, 170, sizeof(v41));
  v40 = 0xAAAAAAAAAAAAAAAALL;
  if (a5)
    goto LABEL_2;
  v7 = a2 + 452;
  if ((*(_BYTE *)(a2 + 452) & 1) == 0)
  {
    if (*(_DWORD *)(a2 + 472))
      goto LABEL_2;
LABEL_36:
    v25 = 0;
    goto LABEL_30;
  }
  if (*(_QWORD *)(a2 + 472) == *MEMORY[0x24BDAE878] && *(_QWORD *)(a2 + 480) == *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
    goto LABEL_36;
LABEL_2:
  v12 = (_BYTE *)(a2 + 412);
  if ((*(_BYTE *)(a2 + 412) & 1) != 0 && (*(_BYTE *)v7 & 1) == 0 && *(_DWORD *)GCKGetNAT64Prefix(a1, a2 + 412))
  {
    *(_QWORD *)&buf[32] = *(_QWORD *)(v7 + 32);
    v13 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)buf = *(_OWORD *)v7;
    *(_OWORD *)&buf[16] = v13;
    synthesizeIPPORTv6FromIPv4();
  }
  if ((*v12 & 1) != 0)
  {
    v42 = 28;
    v14 = IPPORTToSA6();
  }
  else
  {
    v42 = 16;
    v14 = IPPORTToSA();
  }
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 0x40000000;
  v37[2] = __SendUDPPacketCList_block_invoke;
  v37[3] = &unk_24D466480;
  v37[6] = v14;
  v37[7] = a2;
  v37[4] = v43;
  v37[5] = &v45;
  v38 = v42;
  v39 = a4;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
  if (g_iBWEstLogLevel_gck < 6)
    goto LABEL_10;
  ++SendUDPPacketCList_g_nPktCount;
  SendUDPPacketCList_g_nPktBytes += a4;
  v28 = micro();
  if (v28 - *(double *)&SendUDPPacketCList_g_dLastReport <= 1.0)
    goto LABEL_10;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v30 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
  v31 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
  if (ErrorLogLevelForModule >= 8)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x24BDFDC28];
    log = *MEMORY[0x24BDFDC28];
    if (!*MEMORY[0x24BDFDC18])
    {
      v35 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
      v31 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
      v30 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
      if (!v35)
        goto LABEL_44;
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "SendUDPPacketCList";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 559;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SendUDPPacketCList_g_nPktCount;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a4;
      v51 = 1024;
      v52 = SendUDPPacketCList_g_nPktCount - SendUDPPacketCList_g_nPktCount_LastReport;
      v53 = 2048;
      v54 = (double)(SendUDPPacketCList_g_nPktBytes - SendUDPPacketCList_g_nPktBytes_LastReport)
          * 8.0
          / (v28 - *(double *)&SendUDPPacketCList_g_dLastReport);
      _os_log_debug_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ***** SendUDPPacketCList (%d): %d bytes (count: %d rate: %f)", buf, 0x38u);
      goto LABEL_42;
    }
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    v31 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
    v30 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
    if (v34)
    {
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "SendUDPPacketCList";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 559;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SendUDPPacketCList_g_nPktCount;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a4;
      v51 = 1024;
      v52 = SendUDPPacketCList_g_nPktCount - SendUDPPacketCList_g_nPktCount_LastReport;
      v53 = 2048;
      v54 = (double)(SendUDPPacketCList_g_nPktBytes - SendUDPPacketCList_g_nPktBytes_LastReport)
          * 8.0
          / (v28 - *(double *)&SendUDPPacketCList_g_dLastReport);
      _os_log_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ***** SendUDPPacketCList (%d): %d bytes (count: %d rate: %f)", buf, 0x38u);
LABEL_42:
      v30 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
      v31 = &OBJC_IVAR___GKVoiceChatServicePrivate_state;
    }
  }
LABEL_44:
  SendUDPPacketCList_g_dLastReport = *(_QWORD *)&v28;
  v30[554] = SendUDPPacketCList_g_nPktCount;
  v31[555] = SendUDPPacketCList_g_nPktBytes;
LABEL_10:
  memset(buf, 170, 24);
  if (!*(_DWORD *)(a2 + 504) || (v15 = *(_QWORD *)(a2 + 736), v15 == 0xFFFFFFFFLL))
  {
    v16 = 0;
  }
  else
  {
    v49 = 0;
    v16 = 0;
    if (!GCK_BWE_GetProbeSeqSize(v15, *(_DWORD *)(a2 + 748), &v49))
    {
      v17 = v49;
      if (v49)
      {
        v18 = *(_WORD *)(a2 + 744);
        *(_WORD *)(a2 + 744) = v18 + 1;
        *(_QWORD *)buf = *(_QWORD *)(a2 + 736);
        *(_DWORD *)&buf[8] = v17;
        *(_WORD *)&buf[12] = v18;
        v19 = *(_DWORD *)(a2 + 116);
        *(_DWORD *)&buf[16] = *(_DWORD *)(a2 + 752);
        *(_DWORD *)&buf[20] = v19;
        v16 = buf;
      }
    }
  }
  v20 = (pthread_mutex_t *)(a1 + 8400);
  pthread_mutex_lock(v20);
  if (*(_DWORD *)(a2 + 504))
    v21 = (unsigned __int8 ***)(a2 + 512);
  else
    v21 = 0;
  if (a6)
    v22 = *(_DWORD *)(a2 + 4) != 0;
  else
    v22 = 0;
  v23 = OSPFAddDynamicOptions(v21, a3, a4, v22, *(unsigned __int16 *)(a2 + 8), (_DWORD *)(a2 + 624), (unint64_t)v16, (uint64_t)v37);
  pthread_mutex_unlock(v20);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 664));
  if (v23)
  {
    do
    {
      v24 = *(_QWORD *)(v23 + 8);
      if (*(_QWORD *)v23)
        free(*(void **)v23);
      free((void *)v23);
      v23 = v24;
    }
    while (v24);
  }
  v25 = *((unsigned int *)v46 + 6);
LABEL_30:
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);
  return v25;
}

uint64_t synthesizeIPPORTv6FromIPv4()
{
  uint64_t result;

  result = nw_nat64_synthesize_v6();
  if ((_DWORD)result)
    return SAToIPPORT();
  return result;
}

uint64_t SendUDPPacket(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  pthread_rwlock_t *v11;
  uint64_t v12;
  int v13;
  int v14;

  v5 = 0;
  if (!a2 || !(_DWORD)a3 || !a4 || !a5)
    return v5;
  v5 = 2149187606;
  v11 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  v12 = *(_QWORD *)(a1 + 7888);
  if (!v12)
    goto LABEL_30;
  v13 = *(_DWORD *)a4 & 1;
  while ((*(_DWORD *)(v12 + 412) & 1) != v13)
  {
LABEL_18:
    if ((*(_DWORD *)(v12 + 412) & 1) != 0)
      goto LABEL_21;
    if (!*(_DWORD *)(v12 + 432))
      goto LABEL_26;
LABEL_27:
    v12 = *(_QWORD *)(v12 + 728);
    if (!v12)
      goto LABEL_30;
  }
  if (!v13)
  {
    v14 = *(_DWORD *)(v12 + 432);
    if (v14 != *(_DWORD *)(a4 + 20))
    {
      if (!v14)
        goto LABEL_26;
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  if (*(_QWORD *)(v12 + 432) == *(_QWORD *)(a4 + 20) && *(_QWORD *)(v12 + 440) == *(_QWORD *)(a4 + 28))
  {
LABEL_17:
    if (*(unsigned __int16 *)(v12 + 448) == *(unsigned __int16 *)(a4 + 36))
      goto LABEL_29;
    goto LABEL_18;
  }
LABEL_21:
  if (*(_QWORD *)(v12 + 432) != *MEMORY[0x24BDAE878]
    || *(_QWORD *)(v12 + 440) != *(_QWORD *)(MEMORY[0x24BDAE878] + 8))
  {
    goto LABEL_27;
  }
LABEL_26:
  if (*(unsigned __int16 *)(v12 + 448) != *(unsigned __int16 *)(a4 + 36))
    goto LABEL_27;
LABEL_29:
  v5 = SendUDPPacketCList(a1, v12, a2, a3, a5, 0);
LABEL_30:
  pthread_rwlock_unlock(v11);
  return v5;
}

uint64_t __gckSessionRecvProc_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 7904));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 12);
  if (v3 != -1)
  {
    *(_DWORD *)(v2 + 12) = -1;
    close(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v2 + 7904));
}

void TracePrintNodesX(int a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  int *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[10];
  const char *v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = v3;
      v31 = 2080;
      v32 = "TracePrintNodesX";
      v33 = 1024;
      v34 = 2400;
      v35 = 1024;
      *(_DWORD *)v36 = a1;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ------ Report %d nodes ------", buf, 0x22u);
    }
  }
  if (a1 >= 1)
  {
    v5 = 0;
    v6 = (int *)(a2 + 292);
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v9 = (int *)(a2 + 480 * v5);
          v10 = *v9;
          v11 = v9[1];
          v12 = v9[67];
          v13 = *((unsigned __int16 *)v9 + 136);
          v14 = *((unsigned __int16 *)v9 + 137);
          v15 = v9[69];
          v16 = v9[70];
          v17 = v9[71];
          *(_DWORD *)buf = 136318210;
          v30 = v7;
          v31 = 2080;
          v32 = "TracePrintNodesX";
          v33 = 1024;
          v34 = 2406;
          v35 = 1024;
          *(_DWORD *)v36 = v5;
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = v10;
          LOWORD(v37) = 1024;
          *(_DWORD *)((char *)&v37 + 2) = v11;
          HIWORD(v37) = 1024;
          v38 = v12;
          v39 = 1024;
          v40 = v13;
          v41 = 1024;
          v42 = v14;
          v43 = 1024;
          v44 = v15;
          v45 = 1024;
          v46 = v16;
          v47 = 1024;
          v48 = v17;
          v49 = 2080;
          v50 = (uint64_t)v9 + 9;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d: %08X Next[%08X], dist[%u], SN[%u], LSASN[%u], New[%d], From[%08X], #NEIGHBOR[%d] \"%s\"", buf, 0x5Cu);
        }
      }
      v18 = a2 + 480 * v5;
      if (*(int *)(v18 + 284) >= 1)
      {
        v19 = 0;
        v20 = (int *)(v18 + 284);
        v21 = v6;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v24 = *(v21 - 1);
              v25 = *v21;
              *(_DWORD *)buf = 136316162;
              v30 = v22;
              v31 = 2080;
              v32 = "TracePrintNodesX";
              v33 = 1024;
              v34 = 2409;
              v35 = 1024;
              *(_DWORD *)v36 = v24;
              *(_WORD *)&v36[4] = 1024;
              *(_DWORD *)&v36[6] = v25;
              _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d     %08X, R[%u]", buf, 0x28u);
            }
          }
          ++v19;
          v21 += 3;
        }
        while (v19 < *v20);
      }
      ++v5;
      v6 += 120;
    }
    while (v5 != a1);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v30 = v26;
      v31 = 2080;
      v32 = "TracePrintNodesX";
      v33 = 1024;
      v34 = 2412;
      v35 = 2080;
      *(_QWORD *)v36 = "Aug  3 2024";
      *(_WORD *)&v36[8] = 2080;
      v37 = "10:29:55";
      _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ------[GKS: %s - %s] ------", buf, 0x30u);
    }
  }
}

void gckSessionSendHBs(uint64_t a1)
{
  uint64_t i;
  double v2;

  for (i = *(_QWORD *)(a1 + 7888); i; i = *(_QWORD *)(i + 728))
  {
    if (*(_DWORD *)(i + 4))
    {
      v2 = micro();
      if (v2 - *(double *)(i + 16) > 27.0)
      {
        ICERefreshRelayBinding();
        *(double *)(i + 16) = v2;
      }
    }
  }
}

void attempt_failover(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a2 + 108))
  {
LABEL_2:
    *(_DWORD *)(a2 + 108) = -1;
    *(_OWORD *)(a2 + 544) = 0u;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(a2 + 100);
        v7 = *(_DWORD *)(a2 + 112);
        v6 = *(_DWORD *)(a2 + 116);
        v16 = 136316418;
        v17 = v3;
        v18 = 2080;
        v19 = "attempt_failover";
        v20 = 1024;
        v21 = 4489;
        v22 = 1024;
        v23 = v5;
        v24 = 1024;
        v25 = v6;
        v26 = 1024;
        v27 = v7;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d demoted channel %d for %08X to inactive state: original priority %d", (uint8_t *)&v16, 0x2Eu);
      }
    }
    return;
  }
  v9 = *(_QWORD *)(a1 + 7888);
  if (v9)
  {
    v10 = 0;
    do
    {
      if (v9 != a2 && *(_DWORD *)(v9 + 116) == *(_DWORD *)(a2 + 116) && *(int *)(v9 + 108) >= 0)
        v10 = (_DWORD *)v9;
      v9 = *(_QWORD *)(v9 + 728);
    }
    while (v9);
    if (v10)
    {
      if (v10 != (_DWORD *)a2)
      {
        v10[27] = 0;
        gckSessionUpdateNode(a1, v10[29], v10[140], 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v13 = v10[25];
            v15 = v10[28];
            v14 = v10[29];
            v16 = 136316418;
            v17 = v11;
            v18 = 2080;
            v19 = "attempt_failover";
            v20 = 1024;
            v21 = 4482;
            v22 = 1024;
            v23 = v13;
            v24 = 1024;
            v25 = v14;
            v26 = 1024;
            v27 = v15;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d promoted channel %d for %08X to active status: original priority %d\n", (uint8_t *)&v16, 0x2Eu);
          }
        }
      }
      goto LABEL_2;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      attempt_failover_cold_1();
  }
  if (*(_DWORD *)(a2 + 408) != 6)
    gckSessionChangeStateCList(a1, a2, 4);
}

uint64_t GCKInvalidateOneCList(uint64_t a1, int *a2)
{
  int v4;
  _QWORD *v5;
  _QWORD *v6;
  int *v7;
  BOOL v8;

  if (*a2 != -1)
  {
    close(*a2);
    *a2 = -1;
  }
  v4 = a2[18];
  if (v4 != -1)
  {
    close(v4);
    a2[18] = -1;
  }
  ICERemoveOneInterface();
  v5 = (_QWORD *)(a1 + 7888);
  do
  {
    v6 = v5;
    v7 = (int *)*v5;
    v5 = (_QWORD *)(*v5 + 728);
    if (v7)
      v8 = v7 == a2;
    else
      v8 = 1;
  }
  while (!v8);
  if (!v7)
    return 0;
  *v6 = *((_QWORD *)v7 + 91);
  *((_QWORD *)v7 + 91) = *(_QWORD *)(a1 + 7896);
  *(_QWORD *)(a1 + 7896) = v7;
  return 1;
}

uint64_t gckSessionLocalServerProc(_DWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _DWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  pthread_mutex_t *v11;
  unsigned __int8 *v12;
  __int128 v13;
  char v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  int *v22;
  int v23;
  int v24;
  int v25;
  __int128 v26;
  int v27;
  int v28;
  uint64_t i;
  size_t v30;
  uint64_t j;
  int *v33;
  size_t v34;
  int ErrorLogLevelForModule;
  uint64_t v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  os_log_t *v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  _QWORD *v44;
  _QWORD *v45;
  int v46;
  BOOL v47;
  int v48;
  int v49;
  void *v50;
  int *v51;
  pthread_rwlock_t *v52;
  pthread_rwlock_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE __n[9];
  void *v57;
  timeval v58;
  fd_set v59;
  _OWORD __src[16];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v58.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v58.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  v57 = 0;
  *(_DWORD *)&__n[1] = 1500;
  pthread_setname_np("com.apple.gamekitservices.gcksession.localserverproc");
  v2 = *(_QWORD *)a1;
  v3 = a1[2];
  free(a1);
  v54 = v2;
  v4 = CheckInHandleDebug();
  if (!v4)
    return -2145779710;
  v5 = v4;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v59.fds_bits[24] = v6;
  *(_OWORD *)&v59.fds_bits[28] = v6;
  *(_OWORD *)&v59.fds_bits[16] = v6;
  *(_OWORD *)&v59.fds_bits[20] = v6;
  *(_OWORD *)&v59.fds_bits[8] = v6;
  *(_OWORD *)&v59.fds_bits[12] = v6;
  *(_OWORD *)v59.fds_bits = v6;
  *(_OWORD *)&v59.fds_bits[4] = v6;
  *(_DWORD *)&__n[5] = -1431655766;
  v7 = malloc_type_malloc(0x18uLL, 0x10200406E52F545uLL);
  v8 = v7;
  LODWORD(v9) = -1;
  v55 = v5;
  if (!v7)
  {
    v25 = -2145779709;
    goto LABEL_79;
  }
  *v7 = v3;
  v7[1] = -1;
  pthread_mutex_lock((pthread_mutex_t *)(v5 + 8232));
  v8[2] = *(_QWORD *)(v5 + 8224);
  *(_QWORD *)(v5 + 8224) = v8;
  pthread_mutex_unlock((pthread_mutex_t *)(v5 + 8232));
  v10 = 1;
  v11 = (pthread_mutex_t *)(v5 + 7800);
  v53 = (pthread_rwlock_t *)(v5 + 7904);
  v12 = (unsigned __int8 *)(v5 + 124);
  v50 = (void *)(v5 + 125);
  v51 = (int *)(v5 + 404);
  v13 = 0uLL;
  while (1)
  {
    v14 = v10;
    *(_OWORD *)&v59.fds_bits[24] = v13;
    *(_OWORD *)&v59.fds_bits[28] = v13;
    *(_OWORD *)&v59.fds_bits[16] = v13;
    *(_OWORD *)&v59.fds_bits[20] = v13;
    *(_OWORD *)&v59.fds_bits[8] = v13;
    *(_OWORD *)&v59.fds_bits[12] = v13;
    *(_OWORD *)v59.fds_bits = v13;
    *(_OWORD *)&v59.fds_bits[4] = v13;
    if (__darwin_check_fd_set_overflow(v3, &v59, 0))
      v59.fds_bits[(unint64_t)v3 >> 5] |= 1 << v3;
    v58.tv_sec = 5;
    v58.tv_usec = 0;
    v15 = select(v3 + 1, &v59, 0, 0, &v58);
    if (!v15)
    {
      v8 = 0;
      v25 = -2145779689;
      goto LABEL_79;
    }
    if (v15 == -1)
    {
      v33 = __error();
      v8 = 0;
      goto LABEL_46;
    }
    v16 = recv(v3, &__n[5], 4uLL, 0);
    v17 = v16;
    if ((v14 & 1) == 0)
      break;
    if (v16 != 4)
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_5();
      }
      goto LABEL_68;
    }
    if (*(_DWORD *)&__n[5] == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_1();
      }
      v8 = 0;
      LODWORD(v9) = -1;
      goto LABEL_61;
    }
    v9 = bswap32(*(unsigned int *)&__n[5]);
    pthread_mutex_lock(v11);
    v18 = *(unsigned int *)(v5 + 400);
    if ((int)v18 < 1)
    {
      v19 = 0;
    }
    else
    {
      v19 = 0;
      v20 = v51;
      while (1)
      {
        v21 = *v20;
        v20 += 3;
        if ((_DWORD)v9 == v21)
          break;
        if (v18 == ++v19)
          goto LABEL_23;
      }
      v19 = v19;
    }
    if (v19 != v18)
    {
      v22 = &v51[3 * v19];
      v24 = v22[1];
      v23 = v22[2];
      pthread_mutex_unlock(v11);
      v25 = -2145779671;
      if (v24 != -1)
      {
        v8 = 0;
        v5 = v55;
        goto LABEL_79;
      }
      v5 = v55;
      if (*(_DWORD *)(v55 + 108) >= v9 || (v23 & 2) != 0)
        goto LABEL_78;
    }
LABEL_23:
    v25 = gckSessionAddNode(v5, v9, 2);
    pthread_mutex_unlock(v11);
    if (v25 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_2();
      }
LABEL_78:
      v8 = 0;
      goto LABEL_79;
    }
    __n[0] = -86;
    v17 = recv(v3, __n, 1uLL, 0);
    if (v17 != 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_4();
      }
LABEL_68:
      v8 = 0;
      if (v17)
        v25 = -2145779678;
      else
        v25 = -2145779679;
      goto LABEL_79;
    }
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __src[14] = v26;
    __src[15] = v26;
    __src[12] = v26;
    __src[13] = v26;
    __src[10] = v26;
    __src[11] = v26;
    __src[8] = v26;
    __src[9] = v26;
    __src[6] = v26;
    __src[7] = v26;
    __src[4] = v26;
    __src[5] = v26;
    __src[2] = v26;
    __src[3] = v26;
    __src[0] = v26;
    __src[1] = v26;
    v27 = recv(v3, __src, __n[0], 0);
    if (v27 != __n[0])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_3();
      }
      if (v27)
        v25 = -2145779678;
      else
        v25 = -2145779679;
      goto LABEL_78;
    }
    v28 = GCKSessionPrepareConnectionWithRelayInfo(v54, v9, (uint64_t)&v57, (uint64_t)&__n[1], 0, 0);
    if (v28 < 0)
    {
      v25 = v28;
      goto LABEL_78;
    }
    pthread_rwlock_wrlock(v53);
    for (i = *(_QWORD *)(v5 + 7888); i; i = *(_QWORD *)(i + 728))
    {
      if (*(_DWORD *)(i + 116) == (_DWORD)v9)
      {
        v30 = __n[0];
        *(_DWORD *)(i + 376) = __n[0];
        memcpy((void *)(i + 120), __src, v30);
        *(_BYTE *)(i + 120 + v30) = 0;
      }
    }
    pthread_rwlock_unlock(v53);
    v5 = v55;
    *(_DWORD *)&__n[5] = bswap32(*(_DWORD *)(v55 + 108));
    if (send(v3, &__n[5], 4uLL, 0) != 4
      || send(v3, v12, 1uLL, 0) != 1
      || send(v3, v50, *v12, 0) != *v12)
    {
      v25 = *__error() | 0xC01A0000;
      goto LABEL_78;
    }
    v10 = 0;
    v13 = 0uLL;
    if ((v14 & 1) == 0)
    {
      v25 = 0;
      v8 = 0;
      goto LABEL_36;
    }
  }
  if (v16 != 4)
  {
    v46 = VRTraceGetErrorLogLevelForModule();
    if (v46 >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gckSessionLocalServerProc_cold_8();
    }
    v8 = 0;
    v47 = v17 == 0;
LABEL_119:
    if (v47)
      v25 = -2145779679;
    else
      v25 = -2145779678;
    goto LABEL_79;
  }
  v34 = bswap32(*(unsigned int *)&__n[5]);
  if ((v34 - 1501) > 0xFFFFFA23)
  {
    v8 = malloc_type_malloc(v34, 0xA9A9D9EAuLL);
    if (!v8)
    {
      v25 = -2145779709;
      goto LABEL_79;
    }
    v48 = recv(v3, v8, v34, 0);
    if ((_DWORD)v34 != v48)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gckSessionLocalServerProc_cold_7();
      }
      v47 = v48 == 0;
      goto LABEL_119;
    }
    *(_DWORD *)&__n[5] = bswap32(*(unsigned int *)&__n[1]);
    if (send(v3, &__n[5], 4uLL, 0) == 4)
    {
      v49 = send(v3, v57, *(int *)&__n[1], 0);
      if (*(_DWORD *)&__n[1] == v49)
      {
        v25 = GCKSessionEstablishConnectionWithRelayInfo(v54, v9, (uint64_t)v8, v34, 0);
        if ((v25 & 0x80000000) == 0)
        {
LABEL_36:
          pthread_rwlock_wrlock(v53);
          for (j = *(_QWORD *)(v5 + 7888); j; j = *(_QWORD *)(j + 728))
          {
            if (*(_DWORD *)(j + 116) == (_DWORD)v9)
              *(_DWORD *)(j + 76) = 1;
          }
          pthread_rwlock_unlock(v53);
        }
        goto LABEL_79;
      }
    }
    v33 = __error();
LABEL_46:
    v25 = *v33 | 0xC01A0000;
    goto LABEL_79;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gckSessionLocalServerProc_cold_6();
  }
  v8 = 0;
LABEL_61:
  v25 = -2145779678;
LABEL_79:
  if (v57)
    free(v57);
  if (v8)
    free(v8);
  if (v25 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__src[0]) = 136315906;
        *(_QWORD *)((char *)__src + 4) = v36;
        WORD6(__src[0]) = 2080;
        *(_QWORD *)((char *)__src + 14) = "gckSessionLocalServerProc";
        WORD3(__src[1]) = 1024;
        DWORD2(__src[1]) = 3902;
        WORD6(__src[1]) = 1024;
        *(_DWORD *)((char *)&__src[1] + 14) = v25;
        _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionLocalServerProc failed(%X)", (uint8_t *)__src, 0x22u);
      }
    }
    if (v3 != -1 && v25 != -2145779679)
    {
      *(_DWORD *)&__n[5] = -1;
      send(v3, &__n[5], 4uLL, 0);
      if (v25 == -2145779693)
      {
        v38 = 0x2000000;
LABEL_93:
        *(_DWORD *)&__n[5] = v38;
      }
      else
      {
        if (v25 == -2145779671)
        {
          v38 = 0x1000000;
          goto LABEL_93;
        }
        *(_DWORD *)&__n[5] = 0;
      }
      send(v3, &__n[5], 4uLL, 0);
    }
    if (v25 != -2145779671 && (_DWORD)v9 != -1)
      gckSessionDisconnectNeighbor(v5, v9, 2);
  }
  if (v3 != -1)
  {
    v52 = (pthread_rwlock_t *)(v5 + 7904);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 7904));
    v39 = *(_QWORD *)(v5 + 7888);
    if (v39)
    {
      v40 = (os_log_t *)MEMORY[0x24BDFDC28];
      do
      {
        if (*(_DWORD *)(v39 + 116) == (_DWORD)v9)
        {
          *(_DWORD *)(v39 + 72) = dup(v3);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v41 = VRTraceErrorLogLevelToCSTR();
            v42 = *v40;
            if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEFAULT))
            {
              v43 = *(_DWORD *)(v39 + 72);
              LODWORD(__src[0]) = 136316418;
              *(_QWORD *)((char *)__src + 4) = v41;
              WORD6(__src[0]) = 2080;
              *(_QWORD *)((char *)__src + 14) = "gckSessionLocalServerProc";
              WORD3(__src[1]) = 1024;
              DWORD2(__src[1]) = 3927;
              WORD6(__src[1]) = 1024;
              *(_DWORD *)((char *)&__src[1] + 14) = v3;
              WORD1(__src[2]) = 1024;
              DWORD1(__src[2]) = v43;
              WORD4(__src[2]) = 1024;
              *(_DWORD *)((char *)&__src[2] + 10) = v9;
              _os_log_impl(&dword_215C5C000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d server dup TCP socket (%d->%d) for client ID %08X\n", (uint8_t *)__src, 0x2Eu);
            }
          }
        }
        v39 = *(_QWORD *)(v39 + 728);
      }
      while (v39);
    }
    pthread_rwlock_unlock(v52);
    pthread_mutex_lock((pthread_mutex_t *)(v55 + 8232));
    close(v3);
    v44 = *(_QWORD **)(v55 + 8224);
    if (v44)
    {
      v45 = (_QWORD *)(v55 + 8224);
      do
      {
        if (*(_DWORD *)v44 == v3)
        {
          *v45 = v44[2];
          free(v44);
        }
        else
        {
          v45 = v44 + 2;
        }
        v44 = (_QWORD *)*v45;
      }
      while (*v45);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v55 + 8232));
  }
  CheckOutHandleDebug();
  return v25;
}

uint64_t gckSessionRecvMessage(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  ssize_t v10;
  ssize_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  const char *v19;
  NSObject *v20;
  __int128 v21;
  unsigned int *msg_control;
  unsigned int v23;
  _QWORD *v24;
  uint64_t ErrorLogLevelForModule;
  uint64_t v26;
  _DWORD *v27;
  int v28;
  __int128 v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  _QWORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  __int128 v42;
  __int128 v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _DWORD *v49;
  unint64_t v50;
  size_t v51;
  uint64_t v52;
  char *v53;
  int *v54;
  _DWORD *v55;
  int v56;
  int v57;
  uint64_t NextHop;
  unint64_t v59;
  unsigned int *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  int v64;
  uint64_t v65;
  unsigned int *v66;
  size_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  unsigned int *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  const void *v76;
  int v77;
  uint64_t v78;
  NSObject *v79;
  int v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  int v84;
  const char *v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int32x2_t *v102;
  uint64_t v103;
  NSObject *v104;
  NSObject *v105;
  _BOOL4 v106;
  int v107;
  uint64_t v108;
  int v109;
  __int128 v110;
  int v111;
  int v112;
  uint64_t v113;
  NSObject *v114;
  NSObject *v115;
  int v116;
  int v117;
  uint64_t v118;
  int v119;
  uint64_t v121;
  NSObject *v122;
  int v123;
  _BOOL4 v124;
  int v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  int v129;
  int v130;
  int v131;
  int v132;
  const char *v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  ssize_t v148;
  uint64_t *v149;
  _BOOL4 v150;
  int v151;
  int v152;
  char *v153;
  size_t v154;
  _DWORD *v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t *v158;
  _QWORD v159[7];
  uint64_t v160;
  int v161;
  _DWORD *v162;
  _DWORD *v163;
  msghdr v164;
  _DWORD v165[1024];
  __int128 v166;
  __int128 v167;
  _OWORD v168[2];
  _QWORD v169[2];
  _OWORD v170[2];
  _OWORD v171[8];
  __int128 v172;
  __int128 v173;
  unint64_t v174;
  __int128 v175;
  _BYTE v176[24];
  _WORD v177[2049];
  __int128 v178;
  __int128 v179;
  _BYTE v180[22];
  uint64_t v181;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v1;
  v181 = *MEMORY[0x24BDAC8D0];
  memset(v177, 170, 0x1001uLL);
  *(_QWORD *)&v176[16] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v175 = v9;
  *(_OWORD *)v176 = v9;
  v174 = 0xAAAAAAAAAAAAAAAALL;
  v172 = v9;
  v173 = v9;
  v171[6] = v9;
  v171[7] = v9;
  v171[4] = v9;
  v171[5] = v9;
  v171[2] = v9;
  v171[3] = v9;
  v171[0] = v9;
  v171[1] = v9;
  *(_QWORD *)&v164.msg_iovlen = 0xAAAAAAAA00000001;
  v170[0] = v9;
  v170[1] = v9;
  v169[0] = v177;
  v169[1] = 4096;
  v164.msg_name = v171;
  *(_QWORD *)&v164.msg_namelen = 0xAAAAAAAA00000080;
  v164.msg_iov = (iovec *)v169;
  v164.msg_control = v170;
  *(_QWORD *)&v164.msg_controllen = 32;
  v10 = recvmsg(*(_DWORD *)v7, &v164, 0);
  v11 = v10;
  if ((_DWORD)v10 == -1)
  {
    v14 = *__error() | 0xC01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return v14;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return v14;
    v18 = *(_DWORD *)v7;
    v165[0] = 136316418;
    *(_QWORD *)&v165[1] = v16;
    LOWORD(v165[3]) = 2080;
    *(_QWORD *)((char *)&v165[3] + 2) = "gckSessionRecvMessage";
    HIWORD(v165[5]) = 1024;
    v165[6] = 3334;
    LOWORD(v165[7]) = 1024;
    *(_DWORD *)((char *)&v165[7] + 2) = 3334;
    HIWORD(v165[8]) = 1024;
    v165[9] = v18;
    LOWORD(v165[10]) = 1024;
    *(_DWORD *)((char *)&v165[10] + 2) = v14;
    v19 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSessio"
          "n.c:%d: recvmsg(%d) failed(%X)";
    v20 = v17;
LABEL_9:
    _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v165, 0x2Eu);
    return v14;
  }
  if (!(_DWORD)v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 0;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    v14 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_DWORD *)v7;
      v165[0] = 136316162;
      *(_QWORD *)&v165[1] = v12;
      LOWORD(v165[3]) = 2080;
      *(_QWORD *)((char *)&v165[3] + 2) = "gckSessionRecvMessage";
      HIWORD(v165[5]) = 1024;
      v165[6] = 3330;
      LOWORD(v165[7]) = 1024;
      *(_DWORD *)((char *)&v165[7] + 2) = 3330;
      HIWORD(v165[8]) = 1024;
      v165[9] = v15;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recvmsg(%d) returned 0: empty message", (uint8_t *)v165, 0x28u);
      return 0;
    }
    return v14;
  }
  v156 = v8;
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 664));
  *(_QWORD *)(v7 + 576) += (int)v11;
  pthread_mutex_unlock((pthread_mutex_t *)(v7 + 664));
  v21 = *(_OWORD *)(v7 + 428);
  v175 = *(_OWORD *)(v7 + 412);
  *(_OWORD *)v176 = v21;
  *(_QWORD *)&v176[16] = *(_QWORD *)(v7 + 444);
  if (v164.msg_controllen >= 0xC)
  {
    msg_control = (unsigned int *)v164.msg_control;
    if (v164.msg_control)
    {
      while (msg_control[1] != 41 || msg_control[2] != 46)
      {
        msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
        if ((char *)(msg_control + 3) > (char *)v164.msg_control + v164.msg_controllen)
          goto LABEL_21;
      }
      if (msg_control[3] || msg_control[4] || msg_control[5] != -65536)
      {
        LODWORD(v175) = 1;
        *(_OWORD *)&v176[4] = *(_OWORD *)(msg_control + 3);
      }
      else
      {
        v23 = bswap32(msg_control[6]);
        LODWORD(v175) = v175 & 0xFFFFFFFE;
        *(_DWORD *)&v176[4] = v23;
      }
    }
  }
LABEL_21:
  SAToIPPORT();
  v162 = 0;
  v163 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  v161 = 0;
  v160 = 0;
  v159[0] = MEMORY[0x24BDAC760];
  v159[1] = 0x40000000;
  v159[2] = __gckSessionRecvMessage_block_invoke;
  v159[3] = &__block_descriptor_tmp_42;
  v159[4] = v7;
  v159[5] = v3;
  if (*(_DWORD *)(v7 + 504))
    v24 = v159;
  else
    v24 = 0;
  v159[6] = &v160;
  ErrorLogLevelForModule = OSPFParse((void **)&v163, &v162, v177, v11, 0, (uint64_t)v24);
  v26 = v156;
  if ((int)ErrorLogLevelForModule > 0
    || (v177[0] & 0xC0) == 0x40
    && (v38 = bswap32(v177[1]), (_DWORD)v11 - 4 == HIWORD(v38))
    && ((v11 = HIWORD(v38), __memmove_chk(), *(_DWORD *)(v7 + 504)) ? (v39 = v159) : (v39 = 0),
        ErrorLogLevelForModule = OSPFParse((void **)&v163, &v162, v177, v11, 0, (uint64_t)v39),
        (int)ErrorLogLevelForModule >= 1))
  {
    v148 = v11;
    v27 = v163;
    v28 = *((unsigned __int8 *)v163 + 1);
    *(double *)(v7 + 32) = v5;
    *(_QWORD *)(v7 + 760) = 0;
    v151 = v28;
    if (v28 == 6)
    {
      v30 = 6;
    }
    else
    {
      if (v28 == 1 && (v27[1] & 1) != 0)
        *(_DWORD *)(v7 + 48) = 1;
      *(_QWORD *)&v180[14] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v179 = v29;
      *(_OWORD *)v180 = v29;
      v178 = v29;
      *(_QWORD *)((char *)v168 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v167 = v29;
      v168[0] = v29;
      v166 = v29;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v30 = v151;
      if ((int)ErrorLogLevelForModule >= 8)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x24BDFDC28];
        v33 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          ErrorLogLevelForModule = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)ErrorLogLevelForModule)
          {
            v34 = IPPORTToStringWithSize();
            v35 = v163[3];
            v36 = IPPORTToStringWithSize();
            v37 = v163[2];
            v165[0] = 136317186;
            *(_QWORD *)&v165[1] = v31;
            LOWORD(v165[3]) = 2080;
            *(_QWORD *)((char *)&v165[3] + 2) = "gckSessionRecvMessage";
            HIWORD(v165[5]) = 1024;
            v165[6] = 3520;
            LOWORD(v165[7]) = 2080;
            *(_QWORD *)((char *)&v165[7] + 2) = v34;
            v30 = v151;
            HIWORD(v165[9]) = 1024;
            v165[10] = v35;
            LOWORD(v165[11]) = 2080;
            *(_QWORD *)((char *)&v165[11] + 2) = v36;
            HIWORD(v165[13]) = 1024;
            v165[14] = v37;
            LOWORD(v165[15]) = 1024;
            *(_DWORD *)((char *)&v165[15] + 2) = v148;
            HIWORD(v165[16]) = 1024;
            v165[17] = v151;
            _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v165, 0x48u);
          }
        }
        else
        {
          ErrorLogLevelForModule = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
          if ((_DWORD)ErrorLogLevelForModule)
          {
            v126 = IPPORTToStringWithSize();
            v127 = v163[3];
            v128 = IPPORTToStringWithSize();
            v129 = v163[2];
            v165[0] = 136317186;
            *(_QWORD *)&v165[1] = v31;
            LOWORD(v165[3]) = 2080;
            *(_QWORD *)((char *)&v165[3] + 2) = "gckSessionRecvMessage";
            HIWORD(v165[5]) = 1024;
            v165[6] = 3520;
            LOWORD(v165[7]) = 2080;
            *(_QWORD *)((char *)&v165[7] + 2) = v126;
            v30 = v151;
            HIWORD(v165[9]) = 1024;
            v165[10] = v127;
            LOWORD(v165[11]) = 2080;
            *(_QWORD *)((char *)&v165[11] + 2) = v128;
            HIWORD(v165[13]) = 1024;
            v165[14] = v129;
            LOWORD(v165[15]) = 1024;
            *(_DWORD *)((char *)&v165[15] + 2) = v148;
            HIWORD(v165[16]) = 1024;
            v165[17] = v151;
            _os_log_debug_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v165, 0x48u);
          }
        }
      }
      v27 = v163;
      v26 = v156;
    }
    v149 = &v145;
    v48 = v26 + 8464;
    v49 = v27 + 3;
    v50 = *(_BYTE *)v27 & 0xF;
    MEMORY[0x24BDAC7A8](ErrorLogLevelForModule);
    v53 = (char *)&v145 - v52;
    if (!(_DWORD)v50)
      goto LABEL_92;
    v146 = v26 + 8464;
    v154 = v51;
    memset((char *)&v145 - v52, 170, v51);
    v152 = 0;
    v157 = v50;
    v54 = v27 + 3;
    v55 = v53;
    do
    {
      v57 = *v54++;
      v56 = v57;
      if (v57 == *(_DWORD *)(v26 + 108))
      {
        v152 = 1;
        NextHop = 0xFFFFFFFFLL;
      }
      else
      {
        NextHop = gckSessionFindNextHop(v26, v56);
      }
      *v55++ = NextHop;
      --v50;
    }
    while (v50);
    v147 = v7;
    v59 = 0;
    v150 = v30 == 7;
    v60 = v27 + 4;
    v61 = v53 + 4;
    v62 = 1;
    v63 = v157;
    v155 = v49;
    v153 = v53;
    while (1)
    {
      v64 = *(_DWORD *)&v53[4 * v59];
      if (v64 != -1)
        break;
      ++v59;
LABEL_77:
      ++v62;
      ++v60;
      v61 += 4;
      if (v59 == v63)
      {
        v48 = v146;
        v7 = v147;
        v26 = v156;
        if (v152)
        {
          switch(v30)
          {
            case 7:
              goto LABEL_82;
            case 6:
              v73 = *(_QWORD *)(v156 + 96);
              v74 = v163[2];
              v76 = *(const void **)v162;
              v77 = v162[2];
              v75 = 5;
              goto LABEL_90;
            case 5:
LABEL_82:
              v73 = *(_QWORD *)(v156 + 96);
              v74 = v163[2];
              if (v30 == 7)
                v75 = 6;
              else
                v75 = 4;
              v76 = *(const void **)v162;
              v77 = v162[2];
LABEL_90:
              PostEventCallback(v73, v74, v75, v76, v77, 0);
              break;
            default:
              gckSessionProcessOSPFPacket(v156, v147, (uint64_t)v163, (uint64_t)v162);
              break;
          }
        }
LABEL_92:
        if (!(_BYTE)v160)
        {
          if (*(_BYTE *)v48)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v86 = VRTraceErrorLogLevelToCSTR();
              v87 = *MEMORY[0x24BDFDC28];
              v88 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  v89 = *(_DWORD *)(v156 + 8468);
                  v90 = *(_DWORD *)(v156 + 8472);
                  v91 = *(unsigned __int16 *)(v48 + 12);
                  v92 = *(_DWORD *)(v7 + 116);
                  v93 = *(_DWORD *)(v7 + 100);
                  v165[0] = 136317186;
                  *(_QWORD *)&v165[1] = v86;
                  LOWORD(v165[3]) = 2080;
                  *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                  HIWORD(v165[5]) = 1024;
                  v165[6] = 9053;
                  LOWORD(v165[7]) = 1024;
                  *(_DWORD *)((char *)&v165[7] + 2) = v89;
                  HIWORD(v165[8]) = 1024;
                  v165[9] = v90;
                  LOWORD(v165[10]) = 1024;
                  *(_DWORD *)((char *)&v165[10] + 2) = v91;
                  HIWORD(v165[11]) = 1024;
                  v165[12] = v92;
                  LOWORD(v165[13]) = 1024;
                  *(_DWORD *)((char *)&v165[13] + 2) = v93;
                  HIWORD(v165[14]) = 2048;
                  *(double *)&v165[15] = v5;
                  _os_log_impl(&dword_215C5C000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: SEQ CUT (%d/%d, %d) with a non-probe pkt from %d/%d  @%.3f ", (uint8_t *)v165, 0x44u);
                }
              }
              else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
              {
                v140 = *(_DWORD *)(v156 + 8468);
                v141 = *(_DWORD *)(v156 + 8472);
                v142 = *(unsigned __int16 *)(v48 + 12);
                v143 = *(_DWORD *)(v7 + 116);
                v144 = *(_DWORD *)(v7 + 100);
                v165[0] = 136317186;
                *(_QWORD *)&v165[1] = v86;
                LOWORD(v165[3]) = 2080;
                *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v165[5]) = 1024;
                v165[6] = 9053;
                LOWORD(v165[7]) = 1024;
                *(_DWORD *)((char *)&v165[7] + 2) = v140;
                HIWORD(v165[8]) = 1024;
                v165[9] = v141;
                LOWORD(v165[10]) = 1024;
                *(_DWORD *)((char *)&v165[10] + 2) = v142;
                HIWORD(v165[11]) = 1024;
                v165[12] = v143;
                LOWORD(v165[13]) = 1024;
                *(_DWORD *)((char *)&v165[13] + 2) = v144;
                HIWORD(v165[14]) = 2048;
                *(double *)&v165[15] = v5;
                _os_log_debug_impl(&dword_215C5C000, v87, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: SEQ CUT (%d/%d, %d) with a non-probe pkt from %d/%d  @%.3f ", (uint8_t *)v165, 0x44u);
              }
            }
            v108 = v156;
            BWE_EndCurrentSequence(v156, v5);
            ++*(_DWORD *)(v108 + 8488);
            goto LABEL_123;
          }
          goto LABEL_136;
        }
        v80 = WORD1(v160);
        if (*(_BYTE *)v48)
        {
          if (*(_DWORD *)(v7 + 116) == *(_DWORD *)(v26 + 8468)
            && *(_DWORD *)(v7 + 100) == *(_DWORD *)(v26 + 8472)
            && WORD1(v160) == *(unsigned __int16 *)(v48 + 12))
          {
            if (WORD2(v160) < 0x1000u)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 8)
                goto LABEL_123;
              v81 = VRTraceErrorLogLevelToCSTR();
              v82 = *MEMORY[0x24BDFDC28];
              v83 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  v84 = *(_DWORD *)(v7 + 116);
                  v165[0] = 136316418;
                  *(_QWORD *)&v165[1] = v81;
                  LOWORD(v165[3]) = 2080;
                  *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                  HIWORD(v165[5]) = 1024;
                  v165[6] = 9006;
                  LOWORD(v165[7]) = 1024;
                  *(_DWORD *)((char *)&v165[7] + 2) = v84;
                  HIWORD(v165[8]) = 1024;
                  v165[9] = v80;
                  LOWORD(v165[10]) = 2048;
                  *(double *)((char *)&v165[10] + 2) = v5;
                  v85 = " [%s] %s:%d ******* BWE_RCV: continuing the existing seq (%d): %d   @%.3f ";
                  goto LABEL_146;
                }
                goto LABEL_123;
              }
              if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                goto LABEL_123;
              v132 = *(_DWORD *)(v7 + 116);
              v165[0] = 136316418;
              *(_QWORD *)&v165[1] = v81;
              LOWORD(v165[3]) = 2080;
              *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v165[5]) = 1024;
              v165[6] = 9006;
              LOWORD(v165[7]) = 1024;
              *(_DWORD *)((char *)&v165[7] + 2) = v132;
              HIWORD(v165[8]) = 1024;
              v165[9] = v80;
              LOWORD(v165[10]) = 2048;
              *(double *)((char *)&v165[10] + 2) = v5;
              v133 = " [%s] %s:%d ******* BWE_RCV: continuing the existing seq (%d): %d   @%.3f ";
LABEL_153:
              _os_log_debug_impl(&dword_215C5C000, v82, OS_LOG_TYPE_DEBUG, v133, (uint8_t *)v165, 0x32u);
              goto LABEL_123;
            }
            *(_BYTE *)v48 = 0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 8)
              goto LABEL_123;
            v121 = VRTraceErrorLogLevelToCSTR();
            v82 = *MEMORY[0x24BDFDC28];
            v122 = *MEMORY[0x24BDFDC28];
            if (!*MEMORY[0x24BDFDC18])
            {
              if (!os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
                goto LABEL_123;
              v134 = *(_DWORD *)(v7 + 116);
              v165[0] = 136316418;
              *(_QWORD *)&v165[1] = v121;
              LOWORD(v165[3]) = 2080;
              *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v165[5]) = 1024;
              v165[6] = 9001;
              LOWORD(v165[7]) = 1024;
              *(_DWORD *)((char *)&v165[7] + 2) = v134;
              HIWORD(v165[8]) = 1024;
              v165[9] = v80;
              LOWORD(v165[10]) = 2048;
              *(double *)((char *)&v165[10] + 2) = v5;
              v133 = " [%s] %s:%d ******* BWE_RCV: last pkt of the existing seq (%d): %d   @%.3f ";
              goto LABEL_153;
            }
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
            {
              v123 = *(_DWORD *)(v7 + 116);
              v165[0] = 136316418;
              *(_QWORD *)&v165[1] = v121;
              LOWORD(v165[3]) = 2080;
              *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v165[5]) = 1024;
              v165[6] = 9001;
              LOWORD(v165[7]) = 1024;
              *(_DWORD *)((char *)&v165[7] + 2) = v123;
              HIWORD(v165[8]) = 1024;
              v165[9] = v80;
              LOWORD(v165[10]) = 2048;
              *(double *)((char *)&v165[10] + 2) = v5;
              v85 = " [%s] %s:%d ******* BWE_RCV: last pkt of the existing seq (%d): %d   @%.3f ";
LABEL_146:
              _os_log_impl(&dword_215C5C000, v82, OS_LOG_TYPE_DEFAULT, v85, (uint8_t *)v165, 0x32u);
            }
LABEL_123:
            if ((_BYTE)v160)
            {
              v109 = HIWORD(v160);
              *(_DWORD *)(v7 + 748) = HIWORD(v160);
              *(_DWORD *)(v7 + 596) = 125 * v109;
              *(_QWORD *)&v180[14] = 0xAAAAAAAAAAAAAAAALL;
              *(_QWORD *)&v110 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v110 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v179 = v110;
              *(_OWORD *)v180 = v110;
              v178 = v110;
              IPPORTToStringWithSize();
              v111 = VRTraceGetErrorLogLevelForModule();
              v112 = v148;
              if (v111 >= 8)
              {
                v113 = VRTraceErrorLogLevelToCSTR();
                v114 = *MEMORY[0x24BDFDC28];
                v115 = *MEMORY[0x24BDFDC28];
                if (*MEMORY[0x24BDFDC18])
                {
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                  {
                    v116 = *(_DWORD *)(v7 + 116);
                    v117 = *(_DWORD *)(v7 + 748);
                    v165[0] = 136317442;
                    *(_QWORD *)&v165[1] = v113;
                    LOWORD(v165[3]) = 2080;
                    *(_QWORD *)((char *)&v165[3] + 2) = "BWE_UpdateEstimate";
                    HIWORD(v165[5]) = 1024;
                    v165[6] = 8874;
                    LOWORD(v165[7]) = 1024;
                    *(_DWORD *)((char *)&v165[7] + 2) = v116;
                    HIWORD(v165[8]) = 2080;
                    *(_QWORD *)&v165[9] = &v178;
                    LOWORD(v165[11]) = 1024;
                    *(_DWORD *)((char *)&v165[11] + 2) = v112;
                    HIWORD(v165[12]) = 2048;
                    *(double *)&v165[13] = v5;
                    LOWORD(v165[15]) = 1024;
                    *(_DWORD *)((char *)&v165[15] + 2) = WORD1(v160);
                    HIWORD(v165[16]) = 1024;
                    v165[17] = WORD2(v160);
                    LOWORD(v165[18]) = 1024;
                    *(_DWORD *)((char *)&v165[18] + 2) = v117;
                    _os_log_impl(&dword_215C5C000, v114, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\npBwOption (from %d %s): %d   @%.3f (%d %x) upstream BW: %d kbps\n****************************************************\n", (uint8_t *)v165, 0x4Eu);
                  }
                }
                else if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
                {
                  v130 = *(_DWORD *)(v7 + 116);
                  v131 = *(_DWORD *)(v7 + 748);
                  v165[0] = 136317442;
                  *(_QWORD *)&v165[1] = v113;
                  LOWORD(v165[3]) = 2080;
                  *(_QWORD *)((char *)&v165[3] + 2) = "BWE_UpdateEstimate";
                  HIWORD(v165[5]) = 1024;
                  v165[6] = 8874;
                  LOWORD(v165[7]) = 1024;
                  *(_DWORD *)((char *)&v165[7] + 2) = v130;
                  HIWORD(v165[8]) = 2080;
                  *(_QWORD *)&v165[9] = &v178;
                  LOWORD(v165[11]) = 1024;
                  *(_DWORD *)((char *)&v165[11] + 2) = v112;
                  HIWORD(v165[12]) = 2048;
                  *(double *)&v165[13] = v5;
                  LOWORD(v165[15]) = 1024;
                  *(_DWORD *)((char *)&v165[15] + 2) = WORD1(v160);
                  HIWORD(v165[16]) = 1024;
                  v165[17] = WORD2(v160);
                  LOWORD(v165[18]) = 1024;
                  *(_DWORD *)((char *)&v165[18] + 2) = v131;
                  _os_log_debug_impl(&dword_215C5C000, v114, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\npBwOption (from %d %s): %d   @%.3f (%d %x) upstream BW: %d kbps\n****************************************************\n", (uint8_t *)v165, 0x4Eu);
                }
              }
              v118 = *(_QWORD *)(v7 + 736);
              if (v118 != 0xFFFFFFFFLL)
              {
                v119 = (*(_DWORD *)(v7 + 412) & 1) != 0 ? 48 : 28;
                if (!GCK_BWE_CalcRxEstimate(v5, v118, WORD2(v160) != 0, WORD1(v160), WORD2(v160) & 0xFFFu | (unsigned __int16)(16 * WORD1(v160)), v119 + v112, 1, WORD1(v160), WORD2(v160) > 0xFFFu, (_DWORD *)(v7 + 752)))*(_DWORD *)(v7 + 592) = 125 * *(_DWORD *)(v7 + 752);
              }
            }
LABEL_136:
            if (v163)
              free(v163);
            if (v162)
              free(v162);
            return 0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v94 = VRTraceErrorLogLevelToCSTR();
            v95 = *MEMORY[0x24BDFDC28];
            v96 = *MEMORY[0x24BDFDC28];
            if (*MEMORY[0x24BDFDC18])
            {
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                v97 = *(_DWORD *)(v156 + 8468);
                v98 = *(_DWORD *)(v156 + 8472);
                v99 = *(unsigned __int16 *)(v48 + 12);
                v100 = *(_DWORD *)(v7 + 116);
                v101 = *(_DWORD *)(v7 + 100);
                v165[0] = 136317442;
                *(_QWORD *)&v165[1] = v94;
                LOWORD(v165[3]) = 2080;
                *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v165[5]) = 1024;
                v165[6] = 9012;
                LOWORD(v165[7]) = 1024;
                *(_DWORD *)((char *)&v165[7] + 2) = v97;
                HIWORD(v165[8]) = 1024;
                v165[9] = v98;
                LOWORD(v165[10]) = 1024;
                *(_DWORD *)((char *)&v165[10] + 2) = v99;
                HIWORD(v165[11]) = 1024;
                v165[12] = v100;
                LOWORD(v165[13]) = 1024;
                *(_DWORD *)((char *)&v165[13] + 2) = v101;
                HIWORD(v165[14]) = 1024;
                v165[15] = v80;
                LOWORD(v165[16]) = 2048;
                *(double *)((char *)&v165[16] + 2) = v5;
                _os_log_impl(&dword_215C5C000, v95, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: SEQ OVERRIDE (%d/%d, %d) --> (%d/%d, %d)   @%.3f ", (uint8_t *)v165, 0x4Au);
              }
            }
            else if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              v135 = *(_DWORD *)(v156 + 8468);
              v136 = *(_DWORD *)(v156 + 8472);
              v137 = *(unsigned __int16 *)(v48 + 12);
              v138 = *(_DWORD *)(v7 + 116);
              v139 = *(_DWORD *)(v7 + 100);
              v165[0] = 136317442;
              *(_QWORD *)&v165[1] = v94;
              LOWORD(v165[3]) = 2080;
              *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v165[5]) = 1024;
              v165[6] = 9012;
              LOWORD(v165[7]) = 1024;
              *(_DWORD *)((char *)&v165[7] + 2) = v135;
              HIWORD(v165[8]) = 1024;
              v165[9] = v136;
              LOWORD(v165[10]) = 1024;
              *(_DWORD *)((char *)&v165[10] + 2) = v137;
              HIWORD(v165[11]) = 1024;
              v165[12] = v138;
              LOWORD(v165[13]) = 1024;
              *(_DWORD *)((char *)&v165[13] + 2) = v139;
              HIWORD(v165[14]) = 1024;
              v165[15] = v80;
              LOWORD(v165[16]) = 2048;
              *(double *)((char *)&v165[16] + 2) = v5;
              _os_log_debug_impl(&dword_215C5C000, v95, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: SEQ OVERRIDE (%d/%d, %d) --> (%d/%d, %d)   @%.3f ", (uint8_t *)v165, 0x4Au);
            }
          }
          v102 = (int32x2_t *)v156;
          BWE_EndCurrentSequence(v156, v5);
          v102[1060] = vadd_s32(v102[1060], (int32x2_t)0x100000001);
        }
        else
        {
          if (WORD2(v160) > 0xFFFu)
            goto LABEL_123;
          ++*(_DWORD *)(v26 + 8480);
          v102 = (int32x2_t *)v26;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v103 = VRTraceErrorLogLevelToCSTR();
            v104 = *MEMORY[0x24BDFDC28];
            v105 = *MEMORY[0x24BDFDC28];
            if (*MEMORY[0x24BDFDC18])
            {
              v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
              v102 = (int32x2_t *)v156;
              if (v106)
              {
                v107 = *(_DWORD *)(v7 + 116);
                v165[0] = 136316418;
                *(_QWORD *)&v165[1] = v103;
                LOWORD(v165[3]) = 2080;
                *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v165[5]) = 1024;
                v165[6] = 9035;
                LOWORD(v165[7]) = 1024;
                *(_DWORD *)((char *)&v165[7] + 2) = v107;
                HIWORD(v165[8]) = 1024;
                v165[9] = v80;
                LOWORD(v165[10]) = 2048;
                *(double *)((char *)&v165[10] + 2) = v5;
                _os_log_impl(&dword_215C5C000, v104, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: NEW SEQ (%d, %d) @%.3f ", (uint8_t *)v165, 0x32u);
              }
            }
            else
            {
              v124 = os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG);
              v102 = (int32x2_t *)v156;
              if (v124)
              {
                v125 = *(_DWORD *)(v7 + 116);
                v165[0] = 136316418;
                *(_QWORD *)&v165[1] = v103;
                LOWORD(v165[3]) = 2080;
                *(_QWORD *)((char *)&v165[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v165[5]) = 1024;
                v165[6] = 9035;
                LOWORD(v165[7]) = 1024;
                *(_DWORD *)((char *)&v165[7] + 2) = v125;
                HIWORD(v165[8]) = 1024;
                v165[9] = v80;
                LOWORD(v165[10]) = 2048;
                *(double *)((char *)&v165[10] + 2) = v5;
                _os_log_debug_impl(&dword_215C5C000, v104, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: NEW SEQ (%d, %d) @%.3f ", (uint8_t *)v165, 0x32u);
              }
            }
          }
        }
        *(_BYTE *)v48 = 1;
        v102[1058].i32[1] = *(_DWORD *)(v7 + 116);
        v102[1059].i32[0] = *(_DWORD *)(v7 + 100);
        *(_WORD *)(v48 + 12) = v80;
        goto LABEL_123;
      }
    }
    v158 = &v145;
    MEMORY[0x24BDAC7A8](NextHop);
    v66 = (unsigned int *)((char *)&v145 - v65);
    NextHop = (uint64_t)memset((char *)&v145 - v65, 170, v67);
    v63 = v157;
    *v66 = v49[v59++];
    v68 = 1;
    if (v59 < v63)
    {
      v69 = v63;
      v70 = v61;
      v71 = v60;
      do
      {
        if (*(_DWORD *)v70 == v64)
        {
          v66[(int)v68] = *v71;
          v68 = (v68 + 1);
          *(_DWORD *)v70 = -1;
        }
        ++v71;
        v70 += 4;
        --v69;
      }
      while (v62 != v69);
    }
    if (v30 != 7)
    {
      if (v30 == 6)
      {
        memset(v165, 170, sizeof(v165));
        NextHop = OSPFMakeAudio((uint64_t)v165, 4096, (uint64_t)v162, 0, v163[2], v66, v68);
        if ((int)NextHop >= 1)
          NextHop = SendUDPPacketToParticipantChannelID(v156, v165, NextHop, v64, 0, -1, 2);
        goto LABEL_75;
      }
      if (v30 != 5)
      {
LABEL_76:
        v49 = v155;
        v53 = v153;
        goto LABEL_77;
      }
    }
    memset(v165, 170, sizeof(v165));
    v72 = v156;
    NextHop = OSPFMakeData((char *)v165, 4096, (uint64_t)v162, 0, v150, v163[2], v66, v68, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, unsigned __int16))(*(_QWORD *)(v156 + 96) + 24), *(_QWORD *)(*(_QWORD *)(v156 + 96) + 32), 0x40u, 0, 0);
    if ((int)NextHop >= 1)
      NextHop = SendUDPPacketToParticipantChannelID(v72, v165, NextHop, v64, 0, -1, 1);
    v30 = v151;
LABEL_75:
    v63 = v157;
    goto LABEL_76;
  }
  if (!(_DWORD)ErrorLogLevelForModule)
  {
    v47 = v163;
    if (*((_BYTE *)v163 + 1) != 1 || (gckSessionProcessHello(v156, v7, (uint64_t)v162, 0), (v47 = v163) != 0))
      free(v47);
    if (v162)
      free(v162);
    return 0;
  }
  v40 = malloc_type_calloc(1uLL, 0x1070uLL, 0x10200407CC26935uLL);
  if (v40)
  {
    v41 = v40;
    v40[1026] = *(_DWORD *)(v7 + 116);
    __memcpy_chk();
    v41[1025] = v11;
    v42 = *(_OWORD *)v176;
    *(_OWORD *)(v41 + 1027) = v175;
    *(_OWORD *)(v41 + 1031) = v42;
    *(_QWORD *)(v41 + 1035) = *(_QWORD *)&v176[16];
    v43 = v173;
    *(_OWORD *)(v41 + 1037) = v172;
    *(_OWORD *)(v41 + 1041) = v43;
    *(_QWORD *)(v41 + 1045) = v174;
    *((double *)v41 + 524) = v5;
    pthread_mutex_lock((pthread_mutex_t *)(v26 + 8112));
    v44 = (_QWORD *)(v26 + 8104);
    do
    {
      v45 = v44;
      v46 = *v44;
      v44 = (_QWORD *)(*v44 + 4200);
    }
    while (v46);
    *v45 = v41;
    pthread_cond_broadcast((pthread_cond_t *)(v26 + 8176));
    pthread_mutex_unlock((pthread_mutex_t *)(v26 + 8112));
    return 0;
  }
  v14 = 2149187587;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v78 = VRTraceErrorLogLevelToCSTR();
    v79 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v165[0] = 136316418;
      *(_QWORD *)&v165[1] = v78;
      LOWORD(v165[3]) = 2080;
      *(_QWORD *)((char *)&v165[3] + 2) = "gckSessionRecvMessage";
      HIWORD(v165[5]) = 1024;
      v165[6] = 3633;
      LOWORD(v165[7]) = 1024;
      *(_DWORD *)((char *)&v165[7] + 2) = 3633;
      HIWORD(v165[8]) = 1024;
      v165[9] = 4208;
      LOWORD(v165[10]) = 1024;
      *(_DWORD *)((char *)&v165[10] + 2) = -2145779709;
      v19 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSess"
            "ion.c:%d: calloc(%d) failed(%X)";
      v20 = v79;
      goto LABEL_9;
    }
  }
  return v14;
}

void gckSessionRecvTCPMessage(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  ssize_t v5;
  ssize_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  __int128 v15;
  int v16;
  _WORD *v17;
  void *v18;
  uint64_t ErrorLogLevelForModule;
  unsigned int *v20;
  __int128 v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  _BYTE *v30;
  size_t v31;
  uint64_t v32;
  unint64_t v33;
  _DWORD *v34;
  unint64_t v35;
  int v36;
  int *v37;
  int v38;
  int v39;
  uint64_t NextHop;
  int v41;
  unsigned int *v42;
  _DWORD *v43;
  unint64_t v44;
  _DWORD *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  unsigned int *v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  _DWORD *v53;
  unsigned int *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  const void *v59;
  int v60;
  _WORD *v61;
  uint64_t v62;
  int v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  __int128 *v72;
  int v73;
  ssize_t v74;
  uint64_t v75;
  _WORD *v76;
  _BOOL4 v77;
  uint64_t v78;
  size_t v79;
  _DWORD *v80;
  unint64_t v81;
  int v82;
  __int128 *v83;
  int *v84;
  unsigned int *v85;
  _DWORD v86[1024];
  __int128 v87;
  __int128 v88;
  _OWORD v89[4];
  _BYTE v90[22];
  _BYTE v91[4097];
  uint64_t v92;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  v92 = *MEMORY[0x24BDAC8D0];
  memset(v91, 170, sizeof(v91));
  v75 = v3;
  v5 = recv(*(_DWORD *)(v3 + 72), v91, 0x1000uLL, 0);
  v6 = v5;
  if ((_DWORD)v5 == -1)
  {
    v10 = *__error();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_DWORD *)(v75 + 72);
        v86[0] = 136316418;
        *(_QWORD *)&v86[1] = v11;
        LOWORD(v86[3]) = 2080;
        *(_QWORD *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
        HIWORD(v86[5]) = 1024;
        v86[6] = 3158;
        LOWORD(v86[7]) = 1024;
        *(_DWORD *)((char *)&v86[7] + 2) = 3158;
        HIWORD(v86[8]) = 1024;
        v86[9] = v13;
        LOWORD(v86[10]) = 1024;
        *(_DWORD *)((char *)&v86[10] + 2) = v10 | 0xC01A0000;
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv(%d) failed(%X)", (uint8_t *)v86, 0x2Eu);
      }
    }
    return;
  }
  if (!(_DWORD)v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(v75 + 72);
        v86[0] = 136316162;
        *(_QWORD *)&v86[1] = v7;
        LOWORD(v86[3]) = 2080;
        *(_QWORD *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
        HIWORD(v86[5]) = 1024;
        v86[6] = 3149;
        LOWORD(v86[7]) = 1024;
        *(_DWORD *)((char *)&v86[7] + 2) = 3149;
        HIWORD(v86[8]) = 1024;
        v86[9] = v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv(%d) returned 0: Shutting down connection", (uint8_t *)v86, 0x28u);
      }
    }
    shutdown(*(_DWORD *)(v75 + 72), 2);
    close(*(_DWORD *)(v75 + 72));
    *(_DWORD *)(v75 + 72) = -1;
    return;
  }
  v85 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  v14 = OSPFGetLength((uint64_t)v91, v5);
  if (v14 < 1)
    return;
  v16 = v14;
  v69 = v75 + 452;
  v70 = v75 + 412;
  v17 = v91;
  *(_QWORD *)&v15 = 136317186;
  v68 = v15;
  v78 = v4;
  do
  {
    v84 = 0;
    if (*(_DWORD *)(v75 + 504))
      v18 = &__block_literal_global;
    else
      v18 = 0;
    ErrorLogLevelForModule = OSPFParse((void **)&v85, &v84, v17, v16, 0, (uint64_t)v18);
    if ((int)ErrorLogLevelForModule < 1)
    {
      if (!(_DWORD)ErrorLogLevelForModule)
      {
        v67 = v85;
        if (*((_BYTE *)v85 + 1) != 1)
        {
LABEL_73:
          free(v67);
LABEL_74:
          if (v84)
            free(v84);
          return;
        }
        gckSessionProcessHello(v4, v75, (uint64_t)v84, 0);
      }
      v67 = v85;
      if (!v85)
        goto LABEL_74;
      goto LABEL_73;
    }
    v76 = v17;
    v20 = v85;
    v82 = *((unsigned __int8 *)v85 + 1);
    if (v82 != 6)
    {
      *(_QWORD *)&v90[14] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)v90 = v21;
      v89[3] = v21;
      v89[2] = v21;
      *(_QWORD *)((char *)v89 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v89[0] = v21;
      v88 = v21;
      v87 = v21;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((int)ErrorLogLevelForModule >= 8)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x24BDFDC28];
        v24 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          ErrorLogLevelForModule = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)ErrorLogLevelForModule)
          {
            v25 = IPPORTToStringWithSize();
            v26 = v16;
            v27 = v85[3];
            v28 = IPPORTToStringWithSize();
            v29 = v85[2];
            v86[0] = v68;
            *(_QWORD *)&v86[1] = v22;
            LOWORD(v86[3]) = 2080;
            *(_QWORD *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
            HIWORD(v86[5]) = 1024;
            v86[6] = 3196;
            LOWORD(v86[7]) = 2080;
            *(_QWORD *)((char *)&v86[7] + 2) = v25;
            HIWORD(v86[9]) = 1024;
            v86[10] = v27;
            v16 = v26;
            LOWORD(v86[11]) = 2080;
            *(_QWORD *)((char *)&v86[11] + 2) = v28;
            HIWORD(v86[13]) = 1024;
            v86[14] = v29;
            LOWORD(v86[15]) = 1024;
            *(_DWORD *)((char *)&v86[15] + 2) = v6;
            HIWORD(v86[16]) = 1024;
            v86[17] = v82;
            _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCP: [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v86, 0x48u);
          }
        }
        else
        {
          ErrorLogLevelForModule = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
          if ((_DWORD)ErrorLogLevelForModule)
          {
            v62 = IPPORTToStringWithSize();
            v63 = v16;
            v64 = v85[3];
            v65 = IPPORTToStringWithSize();
            v66 = v85[2];
            v86[0] = v68;
            *(_QWORD *)&v86[1] = v22;
            LOWORD(v86[3]) = 2080;
            *(_QWORD *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
            HIWORD(v86[5]) = 1024;
            v86[6] = 3196;
            LOWORD(v86[7]) = 2080;
            *(_QWORD *)((char *)&v86[7] + 2) = v62;
            HIWORD(v86[9]) = 1024;
            v86[10] = v64;
            v16 = v63;
            LOWORD(v86[11]) = 2080;
            *(_QWORD *)((char *)&v86[11] + 2) = v65;
            HIWORD(v86[13]) = 1024;
            v86[14] = v66;
            LOWORD(v86[15]) = 1024;
            *(_DWORD *)((char *)&v86[15] + 2) = v6;
            HIWORD(v86[16]) = 1024;
            v86[17] = v82;
            _os_log_debug_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCP: [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v86, 0x48u);
          }
        }
      }
      v20 = v85;
    }
    v30 = v20 + 3;
    v31 = 4 * (*(_BYTE *)v20 & 0xF);
    MEMORY[0x24BDAC7A8](ErrorLogLevelForModule);
    v34 = (_DWORD *)((char *)&v68 - v32);
    if (!(_DWORD)v33)
      goto LABEL_62;
    v72 = &v68;
    v73 = v16;
    v74 = v6;
    v35 = v33;
    memset((char *)&v68 - v32, 170, v31);
    v36 = 0;
    v80 = v34;
    v81 = v35;
    v37 = (int *)(v20 + 3);
    do
    {
      v39 = *v37++;
      v38 = v39;
      if (v39 == *(_DWORD *)(v4 + 108))
      {
        v36 = 1;
        NextHop = 0xFFFFFFFFLL;
      }
      else
      {
        NextHop = gckSessionFindNextHop(v4, v38);
      }
      *v34++ = NextHop;
      --v35;
    }
    while (v35);
    v71 = v36;
    v41 = v82;
    v77 = v82 == 7;
    v42 = v20 + 4;
    v43 = v80;
    v44 = v81;
    v45 = v80 + 1;
    v46 = 1;
    v79 = v31;
    do
    {
      v47 = v43[v35];
      if (v47 == -1)
      {
        ++v35;
        goto LABEL_50;
      }
      v83 = &v68;
      MEMORY[0x24BDAC7A8](NextHop);
      v49 = (unsigned int *)((char *)&v68 - v48);
      NextHop = (uint64_t)memset((char *)&v68 - v48, 170, v31);
      v44 = v81;
      v50 = v30;
      *v49 = *(_DWORD *)&v30[4 * v35++];
      v51 = 1;
      if (v35 >= v44)
      {
        v41 = v82;
      }
      else
      {
        v52 = v44;
        v53 = v45;
        v54 = v42;
        v41 = v82;
        do
        {
          if (*v53 == v47)
          {
            v49[(int)v51] = *v54;
            v51 = (v51 + 1);
            *v53 = -1;
          }
          ++v54;
          ++v53;
          --v52;
        }
        while (v46 != v52);
      }
      switch(v41)
      {
        case 7:
LABEL_43:
          memset(v86, 170, sizeof(v86));
          v55 = v78;
          NextHop = OSPFMakeData((char *)v86, 4096, (uint64_t)v84, 0, v77, v85[2], v49, v51, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, unsigned __int16))(*(_QWORD *)(v78 + 96) + 24), *(_QWORD *)(*(_QWORD *)(v78 + 96) + 32), 0x40u, 0, 0);
          if ((int)NextHop >= 1)
            NextHop = SendUDPPacketToParticipantChannelID(v55, v86, NextHop, v47, 0, -1, 1);
LABEL_48:
          v41 = v82;
          v44 = v81;
          break;
        case 6:
          memset(v86, 170, sizeof(v86));
          NextHop = OSPFMakeAudio((uint64_t)v86, 4096, (uint64_t)v84, 0, v85[2], v49, v51);
          if ((int)NextHop >= 1)
            NextHop = SendUDPPacketToParticipantChannelID(v78, v86, NextHop, v47, 0, -1, 2);
          goto LABEL_48;
        case 5:
          goto LABEL_43;
      }
      v30 = v50;
      v31 = v79;
      v43 = v80;
LABEL_50:
      ++v46;
      ++v42;
      ++v45;
    }
    while (v35 != v44);
    v4 = v78;
    LODWORD(v6) = v74;
    v16 = v73;
    if (v71)
    {
      switch(v41)
      {
        case 7:
          goto LABEL_55;
        case 6:
          v56 = *(_QWORD *)(v78 + 96);
          v57 = v85[2];
          v59 = *(const void **)v84;
          v60 = v84[2];
          v58 = 5;
          goto LABEL_60;
        case 5:
LABEL_55:
          v56 = *(_QWORD *)(v78 + 96);
          v57 = v85[2];
          if (v41 == 7)
            v58 = 6;
          else
            v58 = 4;
          v59 = *(const void **)v84;
          v60 = v84[2];
LABEL_60:
          PostEventCallback(v56, v57, v58, v59, v60, 0);
          break;
        default:
          gckSessionProcessOSPFPacket(v78, v75, (uint64_t)v85, (uint64_t)v84);
          break;
      }
    }
LABEL_62:
    if (v85)
      free(v85);
    v61 = v76;
    if (v84)
      free(v84);
    v6 = (v6 - v16);
    if ((int)v6 < 1)
      break;
    v17 = (_WORD *)((char *)v61 + v16);
    v16 = OSPFGetLength((uint64_t)v17, v6);
  }
  while (v16 > 0);
}

uint64_t __gckSessionRecvMessage_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;
  _QWORD *v19;
  _QWORD *v20;
  size_t v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = *(_QWORD *)(result + 32);
  ++*(_DWORD *)(v3 + 652);
  if (a3)
  {
    v6 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 664));
    if (a3 >= 1)
    {
      v7 = 0;
      v8 = a3;
      do
      {
        v9 = *(unsigned __int8 **)(a2 + 8 * v7);
        if (v9)
        {
          v10 = v9[1];
          v11 = *v9;
          if ((v11 - 13) >= 2)
          {
            if (v11 == 15)
            {
              v26 = *(_QWORD *)(v6 + 48);
              if (!*(_BYTE *)v26)
              {
                *(_BYTE *)v26 = 1;
                *(_DWORD *)(v26 + 8) = 4 * v10;
                *(_WORD *)(v26 + 6) = bswap32(*((unsigned __int16 *)v9 + 1)) >> 16;
                *(_WORD *)(v26 + 2) = bswap32(*((unsigned __int16 *)v9 + 2)) >> 16;
                *(_WORD *)(v26 + 4) = bswap32(*((unsigned __int16 *)v9 + 3)) >> 16;
              }
            }
          }
          else
          {
            v12 = *(_DWORD **)(v6 + 32);
            v13 = v12[161];
            v14 = v12[165];
            if ((OSPFProcessDynamicOption(v12 + 156, v9, *(timeval **)(v6 + 40)) & 1) == 0)
            {
              v15 = *(_QWORD *)(v6 + 32);
              v16 = *(_DWORD *)(v15 + 644);
              v17 = v16 >= v13;
              v18 = v16 - v13;
              *(float *)(v15 + 604) = *(float *)(v15 + 604) + (float)v18;
              if (v18 != 0 && v17)
                *(float *)(v15 + 612) = *(float *)(v15 + 612) + (float)(*(_DWORD *)(v15 + 660) - v14);
              v19 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
              if (v19)
              {
                v20 = v19;
                v21 = 4 * v10 + 4;
                v22 = malloc_type_calloc(1uLL, v21, 0x952A29A6uLL);
                *v20 = v22;
                if (v22)
                {
                  memcpy(v22, *(const void **)(a2 + 8 * v7), v21);
                  v23 = (_QWORD *)(*(_QWORD *)(v6 + 32) + 520);
                  do
                  {
                    v24 = v23;
                    v25 = *v23;
                    v23 = (_QWORD *)(*v23 + 8);
                  }
                  while (v25);
                  *v24 = v20;
                }
                else
                {
                  free(v20);
                }
              }
            }
          }
        }
        ++v7;
      }
      while (v7 != v8);
    }
    return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(v6 + 32) + 664));
  }
  return result;
}

void gckSessionProcessOSPFPacket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  pthread_mutex_t *v11;
  _BYTE *v12;
  _QWORD *v13;
  void *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int ErrorLogLevelForModule;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  double v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  int v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BYTE v47[10];
  _BYTE v48[6];
  unsigned int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  switch(*(_BYTE *)(a3 + 1))
  {
    case 1:
      gckSessionProcessHello(a1, a2, a4, 1);
      return;
    case 2:
      gckSessionProcessDD(a1, a2, a4);
      return;
    case 3:
      gckSessionProcessLSA(a1, (_DWORD *)a2, a4);
      return;
    case 4:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_DWORD *)(a1 + 108);
          v10 = *(_DWORD *)(a2 + 116);
          *(_DWORD *)buf = 136316162;
          v41 = v7;
          v42 = 2080;
          v43 = "gckSessionProcessLSAACK";
          v44 = 1024;
          v45 = 3031;
          v46 = 1024;
          *(_DWORD *)v47 = v9;
          *(_WORD *)&v47[4] = 1024;
          *(_DWORD *)&v47[6] = v10;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== LSAACK from %08X", buf, 0x28u);
        }
      }
      v11 = (pthread_mutex_t *)(a2 + 664);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
      v12 = *(_BYTE **)(a2 + 496);
      if (v12)
      {
        v13 = (_QWORD *)(a2 + 496);
        do
        {
          if (*v12 == 4 && *((unsigned __int16 *)v12 + 28) == *(unsigned __int16 *)(a4 + 12))
          {
            *v13 = *((_QWORD *)v12 + 8);
            v14 = (void *)*((_QWORD *)v12 + 5);
            if (v14)
              free(v14);
            free(v12);
          }
          else
          {
            v13 = v12 + 64;
          }
          v12 = (_BYTE *)*v13;
        }
        while (*v13);
      }
      goto LABEL_44;
    case 8:
      v15 = micro();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v18 = "request";
          v19 = *(unsigned __int16 *)(a4 + 14);
          v20 = *(_DWORD *)(a2 + 116);
          if ((*(_WORD *)(a4 + 12) & 2) == 0)
            v18 = "response";
          v21 = *(_DWORD *)(a2 + 100);
          *(_DWORD *)buf = 136316674;
          v41 = v16;
          v42 = 2080;
          v43 = "gckSessionProcessHeartbeat";
          v44 = 1024;
          v45 = 2594;
          v46 = 2080;
          *(_QWORD *)v47 = v18;
          *(_WORD *)&v47[8] = 1024;
          *(_DWORD *)v48 = v19;
          *(_WORD *)&v48[4] = 1024;
          v49 = v20;
          v50 = 1024;
          v51 = v21;
          _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received Heartbeat (%s) with SN [%d] from participant [%08X] over channel [%d]", buf, 0x38u);
        }
      }
      if ((*(_WORD *)(a4 + 12) & 2) == 0)
      {
        v11 = (pthread_mutex_t *)(a2 + 664);
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
        v22 = *(_QWORD *)(a2 + 496);
        if (v22)
        {
          while (*(_BYTE *)v22 != 8)
          {
            v22 = *(_QWORD *)(v22 + 64);
            if (!v22)
              goto LABEL_44;
          }
          if (*(unsigned __int16 *)(v22 + 56) == *(unsigned __int16 *)(a4 + 14))
          {
            *(_QWORD *)(v22 + 8) = 0x3FC999999999999ALL;
            v34 = *(double *)(a2 + 392);
            *(double *)(v22 + 32) = v15 + v34;
            *(double *)(v22 + 16) = v15 + v34 * 0.5;
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v35 = VRTraceErrorLogLevelToCSTR();
            v36 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(unsigned __int16 *)(a4 + 14);
              v38 = *(unsigned __int16 *)(v22 + 56);
              *(_DWORD *)buf = 136316162;
              v41 = v35;
              v42 = 2080;
              v43 = "gckSessionProcessHeartbeat";
              v44 = 1024;
              v45 = 2617;
              v46 = 1024;
              *(_DWORD *)v47 = v37;
              *(_WORD *)&v47[4] = 1024;
              *(_DWORD *)&v47[6] = v38;
              _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received SN [%u] doesn't match the expected SN [%u]", buf, 0x28u);
            }
          }
        }
LABEL_44:
        pthread_mutex_unlock(v11);
        return;
      }
      v23 = *(_DWORD *)(a2 + 116);
      v24 = *(unsigned __int16 *)(a4 + 14);
      v25 = *(_DWORD *)(a2 + 100);
      v39 = (void *)0xAAAAAAAAAAAAAAAALL;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v41 = v26;
          v42 = 2080;
          v43 = "gckSessionSendHeartbeat";
          v44 = 1024;
          v45 = 1689;
          v46 = 1024;
          *(_DWORD *)v47 = v23;
          _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending Heartbeat to [%08X]", buf, 0x22u);
        }
      }
      v28 = OSPFMakeHeartbeat(&v39, *(_DWORD *)(a1 + 108), v23, 0, v24);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((v28 & 0x80000000) != 0)
      {
        if (ErrorLogLevelForModule >= 3)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v41 = v32;
            v42 = 2080;
            v43 = "gckSessionSendHeartbeat";
            v44 = 1024;
            v45 = 1694;
            v46 = 1024;
            *(_DWORD *)v47 = v23;
            *(_WORD *)&v47[4] = 1024;
            *(_DWORD *)&v47[6] = v24;
            *(_WORD *)v48 = 1024;
            *(_DWORD *)&v48[2] = v25;
            _os_log_error_impl(&dword_215C5C000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d OSPFMakeHeartbeat failed for participant [%08X], SN [%d], channel [%d]", buf, 0x2Eu);
          }
        }
      }
      else
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            v41 = v30;
            v42 = 2080;
            v43 = "gckSessionSendHeartbeat";
            v44 = 1024;
            v45 = 1698;
            v46 = 2080;
            *(_QWORD *)v47 = "response";
            *(_WORD *)&v47[8] = 1024;
            *(_DWORD *)v48 = v24;
            *(_WORD *)&v48[4] = 1024;
            v49 = v23;
            v50 = 1024;
            v51 = v25;
            _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending Heartbeat (%s) with SN [%d] to participant [%08X] over channel [%d]", buf, 0x38u);
          }
        }
        SendUDPPacketToParticipantChannelID(a1, v39, v28, v23, 0, v25, 0);
        free(v39);
      }
      return;
    default:
      return;
  }
}

uint64_t gckSessionProcessHello(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double **v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  double *v28;
  double v29;
  double v30;
  double v31;
  double **v32;
  double *v33;
  os_log_t *v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  double *v43;
  double v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  int v48;
  int v49;
  double v50;
  int v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  unsigned int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  double v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  int v67;
  unint64_t v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  _BYTE v76[10];
  _QWORD v77[3];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v67 = *(_DWORD *)(a2 + 408);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_DWORD *)(a2 + 116);
      v11 = *(_DWORD *)(a2 + 100);
      v12 = *(_QWORD *)(a3 + 16);
      *(_DWORD *)buf = 136316418;
      v70 = v8;
      v71 = 2080;
      v72 = "gckSessionProcessHello";
      v73 = 1024;
      v74 = 2423;
      v75 = 1024;
      *(_DWORD *)v76 = v10;
      *(_WORD *)&v76[4] = 1024;
      *(_DWORD *)&v76[6] = v11;
      LOWORD(v77[0]) = 2048;
      *(_QWORD *)((char *)v77 + 2) = v12;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received Hello from participant [%08X] over channel [%d]. Hello Flags [%llX]", buf, 0x32u);
    }
  }
  v13 = micro();
  if (a4)
  {
    v14 = gckSessionChangeStateCList(a1, a2, 3);
    v15 = *(unsigned __int16 *)(a3 + 12);
    v16 = *(double *)(a1 + 24);
    if (v16 < (double)v15)
      v15 = (int)v16;
    if (v15 <= 5)
      v17 = 5;
    else
      v17 = v15;
  }
  else
  {
    v17 = 0;
    v14 = 0;
  }
  v18 = *(_DWORD *)(a2 + 116);
  if (*(_DWORD *)(a1 + 108) > v18)
  {
    v19 = gckSessionSendHello(a1, v18, 0, 0, v17, *(_DWORD *)(a2 + 100));
    if (v19 < 0 && v19 != -1072037876)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3
        && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
      {
        gckSessionProcessHello_cold_2();
        if (a4)
          goto LABEL_17;
      }
      else if (a4)
      {
LABEL_17:
        gckSessionChangeStateCList(a1, a2, 5);
        goto LABEL_19;
      }
      return 0;
    }
  }
  if (!a4)
    return 0;
LABEL_19:
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
  v20 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a2 + 56) = v20;
  if ((v20 & 2) != 0)
  {
    if ((v20 & 0x400) != 0 && *(_DWORD *)(a1 + 104) != 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x24BDFDC28];
        v27 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v70 = v25;
            v71 = 2080;
            v72 = "gckSessionProcessHello";
            v73 = 1024;
            v74 = 2467;
            _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FLOW CONTROL enabled.", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          gckSessionProcessHello_cold_1();
        }
      }
      *(_DWORD *)(a2 + 504) = 1;
    }
    v32 = (double **)(a2 + 496);
    v33 = *(double **)(a2 + 496);
    if (!v33)
    {
LABEL_51:
      v68 = 0xAAAAAAAAAAAAAAAALL;
      v41 = OSPFMakeHeartbeat(&v68, *(_DWORD *)(a1 + 108), *(_DWORD *)(a2 + 116), 1, 1u);
      if ((v41 & 0x80000000) == 0)
      {
        v42 = v41;
        v43 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(_BYTE *)v43 = 8;
        v43[1] = 0.2;
        v44 = *(double *)(a2 + 392);
        v43[4] = v13 + v44;
        v43[2] = v13 + v44 * 0.5;
        *((_QWORD *)v43 + 5) = v68;
        *((_DWORD *)v43 + 12) = v42;
        *((_WORD *)v43 + 28) = 1;
        *((_DWORD *)v43 + 13) = *(_DWORD *)(a2 + 116);
        *v32 = v43;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v47 = *((unsigned __int16 *)v43 + 28);
            v48 = *(_DWORD *)(a2 + 116);
            v49 = *(_DWORD *)(a2 + 100);
            *(_DWORD *)buf = 136316418;
            v70 = v45;
            v71 = 2080;
            v72 = "gckSessionProcessHello";
            v73 = 1024;
            v74 = 2510;
            v75 = 1024;
            *(_DWORD *)v76 = v47;
            *(_WORD *)&v76[4] = 1024;
            *(_DWORD *)&v76[6] = v48;
            LOWORD(v77[0]) = 1024;
            *(_DWORD *)((char *)v77 + 2) = v49;
            _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Schedule a Heartbeat with SN [%d] for participant [%08X] over channel [%d].", buf, 0x2Eu);
          }
        }
        if (*(_DWORD *)(a2 + 504))
        {
          if (*(double *)(a2 + 528) == 0.0)
          {
            v50 = *(double *)(a2 + 536);
            if (v50 != 0.0)
            {
              ++*(_DWORD *)(a2 + 652);
              *(double *)(a2 + 528) = v13 + v50;
            }
          }
        }
      }
      v14 = v14;
      goto LABEL_60;
    }
    v34 = (os_log_t *)MEMORY[0x24BDFDC28];
    while (1)
    {
      v35 = *(unsigned __int8 *)v33;
      if (v35 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *v34;
          if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
          {
            v38 = *(_DWORD *)(a2 + 116);
            v39 = *(_DWORD *)(a2 + 100);
            *(_DWORD *)buf = 136316162;
            v70 = v36;
            v71 = 2080;
            v72 = "gckSessionProcessHello";
            v73 = 1024;
            v74 = 2474;
            v75 = 1024;
            *(_DWORD *)v76 = v38;
            *(_WORD *)&v76[4] = 1024;
            *(_DWORD *)&v76[6] = v39;
            _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remove Hello from the retry list for participant [%08X] channel [%d]", buf, 0x28u);
          }
        }
        *v32 = (double *)*((_QWORD *)v33 + 8);
        v40 = (void *)*((_QWORD *)v33 + 5);
        if (v40)
          free(v40);
        free(v33);
      }
      else
      {
        if (v35 == 8)
        {
          v33[1] = 0.2;
          v61 = *(double *)(a2 + 392);
          v33[4] = v13 + v61;
          v33[2] = v13 + v61 * 0.5;
          v14 = v14;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v62 = VRTraceErrorLogLevelToCSTR();
            v63 = *v34;
            if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
            {
              v64 = *((_QWORD *)v33 + 2);
              v65 = *((_QWORD *)v33 + 4);
              *(_DWORD *)buf = 136316162;
              v70 = v62;
              v71 = 2080;
              v72 = "gckSessionProcessHello";
              v73 = 1024;
              v74 = 2485;
              v75 = 2048;
              *(_QWORD *)v76 = v64;
              *(_WORD *)&v76[8] = 2048;
              v77[0] = v65;
              _os_log_impl(&dword_215C5C000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Heartbeat queued. Updated state to: nextFire [%.1lf] waitUntil [%.1lf]", buf, 0x30u);
            }
          }
          goto LABEL_60;
        }
        v32 = (double **)(v33 + 8);
      }
      v33 = *v32;
      if (!*v32)
        goto LABEL_51;
    }
  }
  v21 = *(_QWORD *)(a2 + 496);
  if (v21)
  {
    while (1)
    {
      v22 = v21;
      if (*(_BYTE *)v21 == 1)
        break;
      v21 = *(_QWORD *)(v21 + 64);
      if (!v21)
      {
        v23 = v14;
        v24 = (double **)(v22 + 64);
        goto LABEL_31;
      }
    }
    *(_QWORD *)(v21 + 8) = 0x3FB0A3D70A3D70A4;
    v30 = v13 + (double)v17;
    *(double *)(v21 + 32) = v30;
    if (*(_QWORD *)(v21 + 40))
      v31 = *(double *)(a1 + 32);
    else
      v31 = 0.0;
    *(double *)(v21 + 16) = v30 - v31;
  }
  else
  {
    v23 = v14;
    v24 = (double **)(a2 + 496);
LABEL_31:
    v28 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(_BYTE *)v28 = 1;
    v28[1] = 0.065;
    v29 = v13 + (double)v17;
    v28[4] = v29;
    v28[2] = v29;
    v28[5] = 0.0;
    *((_DWORD *)v28 + 12) = 0;
    *((_DWORD *)v28 + 13) = *(_DWORD *)(a2 + 116);
    *v24 = v28;
    v14 = v23;
  }
LABEL_60:
  v51 = *(_DWORD *)(a1 + 12);
  if (v51 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v51);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 664));
  if ((v14 & 0x80000000) == 0)
  {
    if (*(_DWORD *)(a1 + 104))
    {
      v52 = *(_DWORD *)(a2 + 84);
      if (*(_DWORD *)(a2 + 76))
      {
        if (!v52)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v53 = VRTraceErrorLogLevelToCSTR();
            v54 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v70 = v53;
              v71 = 2080;
              v72 = "gckSessionProcessHello";
              v73 = 1024;
              v74 = 2554;
              v75 = 2080;
              *(_QWORD *)v76 = a2 + 120;
              _os_log_impl(&dword_215C5C000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invitation from \"%s\"", buf, 0x26u);
            }
          }
          PostEventCallback(*(_QWORD *)(a1 + 96), *(_DWORD *)(a2 + 116), 0, (const void *)(a2 + 120), *(_DWORD *)(a2 + 376), 0);
        }
        return v14;
      }
      if (v52 || v67 == 3 || *(_DWORD *)(a1 + 108) >= *(_DWORD *)(a2 + 116) || *(_DWORD *)(a2 + 108))
        return v14;
      v56 = v14;
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
      v57 = *(_DWORD *)(a1 + 112);
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
      if (v57 < 2)
        return v56;
      v14 = v56;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v58 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v60 = *(_DWORD *)(a2 + 116);
          *(_DWORD *)buf = 136315906;
          v70 = v58;
          v71 = 2080;
          v72 = "gckSessionProcessHello";
          v73 = 1024;
          v74 = 2571;
          v75 = 1024;
          *(_DWORD *)v76 = v60;
          _os_log_impl(&dword_215C5C000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Send DD to %08X (local)", buf, 0x22u);
        }
      }
      v55 = *(_DWORD *)(a2 + 116);
    }
    else
    {
      if (v67 == 3)
        return v14;
      v55 = *(_DWORD *)(a2 + 116);
      if (*(_DWORD *)(a1 + 108) >= v55)
        return v14;
    }
    gckSessionSendDD(a1, v55, 1);
  }
  return v14;
}

void gckSessionProcessDD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  unsigned int v17;
  _DWORD *v18;
  pthread_mutex_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  char *v26;
  __int128 v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _DWORD *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int v38;
  _DWORD *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  int v58;
  int v59;
  int *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  unsigned int *v72;
  int v74;
  int v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  os_log_t v83;
  pthread_mutex_t *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint8_t buf[4];
  os_log_t v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  _BYTE v99[10];
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  uint64_t v104;

  v4 = a1;
  v104 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned int *)(a1 + 112);
  v90 = a2;
  if ((int)v5 < 1)
  {
    v8 = 0;
  }
  else
  {
    v6 = 0;
    v7 = (_DWORD *)(a1 + 396);
    v8 = 1;
    do
    {
      if (*(v7 - 1) && *v7 != *(_DWORD *)(a2 + 116))
        break;
      v8 = ++v6 < v5;
      v7 += 120;
    }
    while (v5 != v6);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_DWORD *)(v4 + 108);
      v12 = *(_DWORD *)(v90 + 116);
      *(_DWORD *)buf = 136316162;
      v93 = (os_log_t)v9;
      v94 = 2080;
      v95 = "gckSessionProcessDD";
      v96 = 1024;
      v97 = 2667;
      v98 = 1024;
      *(_DWORD *)v99 = v11;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v12;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== DD from %08X", buf, 0x28u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a3 + 12), *(_QWORD *)(a3 + 16));
  if (!*(_DWORD *)(v4 + 48) && !*(_DWORD *)(v4 + 104))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_DWORD *)(v90 + 116);
        *(_DWORD *)buf = 136315906;
        v93 = (os_log_t)v13;
        v94 = 2080;
        v95 = "gckSessionProcessDD";
        v96 = 1024;
        v97 = 2671;
        v98 = 1024;
        *(_DWORD *)v99 = v15;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: STOP ICE check with peer %08X", buf, 0x22u);
      }
    }
    ICEStopConnectivityCheck();
    ICEStopConnectivityCheck();
  }
  v16 = *(_DWORD *)(v4 + 104);
  if (v16 == 1)
  {
    if (*(_DWORD *)(v90 + 76))
      goto LABEL_24;
    v17 = *(_DWORD *)(v90 + 116);
    goto LABEL_23;
  }
  if (!v16)
  {
    v17 = *(_DWORD *)(v90 + 116);
    if (*(_DWORD *)(v4 + 108) > v17)
LABEL_23:
      gckSessionSendDD(v4, v17, 0);
  }
LABEL_24:
  v18 = (_DWORD *)(v4 + 116);
  v19 = (pthread_mutex_t *)(v90 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v90 + 664));
  v20 = *(_QWORD **)(v90 + 496);
  if (v20)
  {
    v21 = (_QWORD *)(v90 + 496);
    do
    {
      if (*(_BYTE *)v20 == 2)
      {
        *v21 = v20[8];
        v22 = (void *)v20[5];
        if (v22)
          free(v22);
        free(v20);
      }
      else
      {
        v21 = v20 + 8;
      }
      v20 = (_QWORD *)*v21;
    }
    while (*v21);
  }
  v23 = pthread_mutex_unlock(v19);
  v24 = *(unsigned int *)(a3 + 12);
  *(_QWORD *)&v88 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v82 - ((v25 + 15) & 0x7FFFFFFF0);
  v89 = v4;
  v91 = v26;
  if (!(_DWORD)v24)
  {
    v84 = (pthread_mutex_t *)(v4 + 7800);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 7800));
    goto LABEL_67;
  }
  memset((char *)&v82 - ((v25 + 15) & 0x7FFFFFFF0), 170, v25);
  v84 = (pthread_mutex_t *)(v4 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 7800));
  if ((int)v24 < 1)
  {
LABEL_67:
    v29 = 0;
    goto LABEL_68;
  }
  v28 = 0;
  v29 = 0;
  v85 = v4 + 125;
  *(_QWORD *)&v27 = 136315906;
  v87 = v27;
  *(_QWORD *)&v27 = 136316162;
  v86 = v27;
  do
  {
    v30 = *(unsigned int *)(v4 + 112);
    if ((int)v30 < 1)
    {
      v33 = 0;
      goto LABEL_51;
    }
    v31 = v24;
    v32 = 0;
    v33 = 0;
    v34 = (_DWORD *)(v88 + 480 * v28);
    while (1)
    {
      v35 = v4 + v32;
      if (*v34 == *(_DWORD *)(v4 + v32 + 116))
        break;
      ++v33;
      v32 += 480;
      if (480 * v30 == v32)
      {
        v24 = v31;
        goto LABEL_52;
      }
    }
    if (*(unsigned __int16 *)(v88 + 480 * v28 + 272) <= *(unsigned __int16 *)(v35 + 388))
      goto LABEL_50;
    v36 = (int *)(v35 + 116);
    memcpy((void *)(v35 + 116), v34, 0x1E0uLL);
    if (*(_DWORD *)(v90 + 108) || *(_DWORD *)(v90 + 116) != *v36)
      goto LABEL_49;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v82 = VRTraceErrorLogLevelToCSTR();
      v83 = (os_log_t)*MEMORY[0x24BDFDC28];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v87;
        v93 = (os_log_t)v82;
        v94 = 2080;
        v95 = "gckSessionProcessDD";
        v96 = 1024;
        v97 = 2718;
        v98 = 2080;
        *(_QWORD *)v99 = v85 + v32;
        _os_log_impl(&dword_215C5C000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (promote direct)", buf, 0x26u);
      }
    }
    if (*(_DWORD *)(v89 + 104) == 1)
    {
      v37 = v90;
      if ((isInNeighbor((uint64_t)v18, 1, *(_DWORD *)(v90 + 116)) & 1) != 0)
      {
LABEL_49:
        v4 = v89;
      }
      else
      {
        v4 = v89;
        if ((gckSessionAddNode(v89, *(_DWORD *)(v37 + 116), 255) & 0x80000000) == 0)
        {
          gckSessionUpdateNode(v4, *(_DWORD *)(v37 + 116), *(_DWORD *)(v37 + 560), 0);
          ++*(_WORD *)(v4 + 388);
          v8 = 1;
          *(_DWORD *)(v4 + 392) = 1;
        }
      }
LABEL_50:
      v24 = v31;
      goto LABEL_51;
    }
    v24 = v31;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v83 = (os_log_t)VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v43 = *v36;
        *(_DWORD *)buf = v87;
        v93 = v83;
        v94 = 2080;
        v95 = "gckSessionProcessDD";
        v96 = 1024;
        v97 = 2726;
        v98 = 1024;
        *(_DWORD *)v99 = v43;
        _os_log_impl(&dword_215C5C000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessDD: init RetryICE w/ remoteID %08X OOB", buf, 0x22u);
      }
    }
    v44 = *v36;
    v4 = v89;
    GCKSessionSendDOOB(v89, v44, 0, 0, 1u, 0.0);
LABEL_51:
    if (v33 == (_DWORD)v30)
    {
LABEL_52:
      v38 = *(_DWORD *)(v4 + 112);
      if (v38 > 15)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v40 = VRTraceErrorLogLevelToCSTR();
          v41 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v45 = *(_DWORD *)(v88 + 480 * v28);
            *(_DWORD *)buf = v86;
            v93 = (os_log_t)v40;
            v94 = 2080;
            v95 = "gckSessionProcessDD";
            v96 = 1024;
            v97 = 2754;
            v98 = 1024;
            *(_DWORD *)v99 = 2754;
            *(_WORD *)&v99[4] = 1024;
            *(_DWORD *)&v99[6] = v45;
            _os_log_error_impl(&dword_215C5C000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Maximum # of nodes reached.  Ignoring node [%08X]\n", buf, 0x28u);
          }
          v4 = v89;
        }
      }
      else
      {
        v39 = (_DWORD *)(v88 + 480 * v28);
        memcpy(&v18[120 * v38], v39, 0x1E0uLL);
        ++*(_DWORD *)(v4 + 112);
        *(_DWORD *)&v91[4 * v29++] = *v39;
      }
    }
    ++v28;
  }
  while (v28 != v24);
  v26 = v91;
LABEL_68:
  gckSessionFindShortestPath(*(_DWORD *)(v4 + 112), v18);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v46 = VRTraceErrorLogLevelToCSTR();
    v47 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v93 = (os_log_t)v46;
      v94 = 2080;
      v95 = "gckSessionProcessDD";
      v96 = 1024;
      v97 = 2760;
      _os_log_impl(&dword_215C5C000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== After processing incoming DD", buf, 0x1Cu);
    }
  }
  TracePrintNodes(*(_DWORD *)(v4 + 112), (uint64_t)v18);
  if (v8)
    v48 = -1;
  else
    v48 = *(_DWORD *)(v90 + 116);
  gckSessionSendLSA(v4, *(_DWORD *)(v4 + 112), v18, v48, 0);
  gckSessionCleanupNodes(v4, -1, 0);
  v49 = *(unsigned int *)(v4 + 112);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v51 = VRTraceErrorLogLevelToCSTR();
    v52 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v93 = (os_log_t)v51;
      v94 = 2080;
      v95 = "gckSessionProcessDD";
      v96 = 1024;
      v97 = 2770;
      v98 = 1024;
      *(_DWORD *)v99 = v29;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v49;
      _os_log_impl(&dword_215C5C000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== iNewNodeIDs = %d, iNodes = %d", buf, 0x28u);
    }
  }
  if (v29 >= 1)
  {
    v53 = 0;
    v85 = v29;
    *(_QWORD *)&v50 = 136316674;
    v88 = v50;
    *(_QWORD *)&v50 = 136315906;
    v87 = v50;
    *(_QWORD *)&v50 = 136315650;
    v86 = v50;
    while ((int)v49 < 1)
    {
LABEL_122:
      if (++v53 == v85)
        goto LABEL_123;
    }
    v54 = 0;
    while (2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
      {
        v58 = *(_DWORD *)&v26[4 * v53];
      }
      else
      {
        v55 = VRTraceErrorLogLevelToCSTR();
        v56 = *MEMORY[0x24BDFDC28];
        v57 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
        v58 = *(_DWORD *)&v26[4 * v53];
        if (v57)
        {
          v59 = v18[120 * v54];
          *(_DWORD *)buf = v88;
          v93 = (os_log_t)v55;
          v94 = 2080;
          v95 = "gckSessionProcessDD";
          v96 = 1024;
          v97 = 2773;
          v98 = 1024;
          *(_DWORD *)v99 = v53;
          *(_WORD *)&v99[4] = 1024;
          *(_DWORD *)&v99[6] = v54;
          v100 = 1024;
          v101 = v58;
          v102 = 1024;
          v103 = v59;
          _os_log_impl(&dword_215C5C000, v56, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== @ %d (%08X), %d (%08X)", buf, 0x34u);
        }
      }
      v60 = &v18[120 * v54];
      if (v58 == *v60 && v18[120 * v54 + 1] != -1)
      {
        v61 = v90;
        reportingGKLog();
        if (*(_DWORD *)(v61 + 108) || *(_DWORD *)(v61 + 116) != *v60)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v69 = VRTraceErrorLogLevelToCSTR();
            v70 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v87;
              v93 = (os_log_t)v69;
              v94 = 2080;
              v95 = "gckSessionProcessDD";
              v96 = 1024;
              v97 = 2794;
              v98 = 2080;
              *(_QWORD *)v99 = (char *)&v18[120 * v54 + 2] + 1;
              _os_log_impl(&dword_215C5C000, v70, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (new connection)", buf, 0x26u);
            }
          }
          v65 = v89;
          v64 = v90;
          v71 = *(_QWORD *)(v89 + 7888);
          if (v71)
          {
            while (*(_DWORD *)(v71 + 116) != *v60)
            {
              v71 = *(_QWORD *)(v71 + 728);
              if (!v71)
                goto LABEL_109;
            }
            v72 = (unsigned int *)(v71 + 96);
            while (!__ldxr(v72))
            {
              if (!__stxr(2u, v72))
                goto LABEL_109;
            }
            __clrex();
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v62 = VRTraceErrorLogLevelToCSTR();
            v63 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v87;
              v93 = (os_log_t)v62;
              v94 = 2080;
              v95 = "gckSessionProcessDD";
              v96 = 1024;
              v97 = 2782;
              v98 = 2080;
              *(_QWORD *)v99 = (char *)&v18[120 * v54 + 2] + 1;
              _os_log_impl(&dword_215C5C000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (direct connection)", buf, 0x26u);
            }
          }
          v65 = v89;
          v64 = v90;
          if (*(_DWORD *)(v89 + 104) != 1)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v66 = VRTraceErrorLogLevelToCSTR();
              v67 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v68 = *v60;
                *(_DWORD *)buf = v87;
                v93 = (os_log_t)v66;
                v94 = 2080;
                v95 = "gckSessionProcessDD";
                v96 = 1024;
                v97 = 2790;
                v98 = 1024;
                *(_DWORD *)v99 = v68;
                _os_log_impl(&dword_215C5C000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessDD: init RetryICE w/ remoteID %08X OOB", buf, 0x22u);
              }
            }
            v65 = v89;
            GCKSessionSendDOOB(v89, *v60, 0, 0, 1u, 0.0);
            v64 = v90;
          }
        }
LABEL_109:
        if (*(_DWORD *)(v64 + 4))
          v74 = 13;
        else
          v74 = 1;
        PostEventCallback(*(_QWORD *)(v65 + 96), *v60, v74, (char *)&v18[120 * v54 + 2] + 1, LOBYTE(v18[120 * v54 + 2]), 0);
        v75 = *(_DWORD *)(v65 + 104);
        if (v75 == 1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v80 = VRTraceErrorLogLevelToCSTR();
            v81 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v86;
              v93 = (os_log_t)v80;
              v94 = 2080;
              v95 = "gckSessionProcessDD";
              v96 = 1024;
              v97 = 2817;
              v78 = v81;
              v79 = " [%s] %s:%d localscopeconnected";
LABEL_120:
              _os_log_impl(&dword_215C5C000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 0x1Cu);
            }
          }
        }
        else if (!v75 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v76 = VRTraceErrorLogLevelToCSTR();
          v77 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v86;
            v93 = (os_log_t)v76;
            v94 = 2080;
            v95 = "gckSessionProcessDD";
            v96 = 1024;
            v97 = 2813;
            v78 = v77;
            v79 = " [%s] %s:%d globalscopeconnected";
            goto LABEL_120;
          }
        }
      }
      ++v54;
      v26 = v91;
      if (v54 == v49)
        goto LABEL_122;
      continue;
    }
  }
LABEL_123:
  *(_DWORD *)(v90 + 92) = 1;
  pthread_mutex_unlock(v84);
  gckSessionCheckPendingConnections(v89, 0);
}

void gckSessionProcessLSA(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  BOOL v13;
  _DWORD *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  char v19;
  __int128 v20;
  int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  unint64_t v29;
  int v30;
  int *v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  _DWORD *v40;
  int *v41;
  int v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  int v47;
  int v48;
  _DWORD *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  int v57;
  unsigned int v58;
  __int16 v59;
  __int128 v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  int *v70;
  uint64_t v71;
  NSObject *v72;
  _DWORD *v73;
  uint64_t v74;
  NSObject *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  unsigned int *v79;
  int v81;
  int v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  __int128 v87;
  uint64_t v88;
  pthread_mutex_t *v89;
  char *v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  _DWORD *v95;
  uint64_t v96;
  _WORD *v97;
  _OWORD v98[2];
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  const char *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  _QWORD v106[4];

  *(_QWORD *)((char *)&v106[2] + 2) = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a3 + 24);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v87 - ((v7 + 15) & 0x7FFFFFFF0);
  *(_QWORD *)&v94 = v9;
  if ((_DWORD)v9)
    memset((char *)&v87 - ((v7 + 15) & 0x7FFFFFFF0), 170, v7);
  v10 = *(unsigned int *)(a1 + 112);
  if ((int)v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (_DWORD *)(a1 + 396);
    v13 = 1;
    do
    {
      if (*(v12 - 1) && *v12 != a2[29])
        break;
      v13 = ++v11 < v10;
      v12 += 120;
    }
    while (v10 != v11);
  }
  v14 = (_DWORD *)(a1 + 116);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_DWORD *)(a1 + 108);
      v18 = a2[29];
      *(_DWORD *)buf = 136316162;
      v100 = v15;
      v101 = 2080;
      v102 = "gckSessionProcessLSA";
      v103 = 1024;
      v104 = 2855;
      v105 = 1024;
      LODWORD(v106[0]) = v17;
      WORD2(v106[0]) = 1024;
      *(_DWORD *)((char *)v106 + 6) = v18;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== LSA from %08X", buf, 0x28u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  v19 = isInNeighbor(v6, v94, *(_DWORD *)(a1 + 108));
  v21 = *(_DWORD *)(a3 + 16);
  v22 = a1;
  v96 = a1;
  if (v21 == 1)
  {
    v23 = *(_DWORD *)v6 == a2[29] ? v19 : 1;
    if ((v23 & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v100 = v27;
          v101 = 2080;
          v102 = "gckSessionProcessLSA";
          v103 = 1024;
          v104 = 2869;
          _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got declining LSA", buf, 0x1Cu);
        }
      }
      v22 = v96;
      v29 = *(unsigned int *)(v96 + 112);
      v30 = *(_DWORD *)v6;
      if ((int)v29 < 1)
        goto LABEL_31;
      if (*v14 != v30)
      {
        v31 = (int *)(v96 + 596);
        v32 = 1;
        do
        {
          v33 = v32;
          if (v29 == v32)
            break;
          v34 = *v31;
          ++v32;
          v31 += 120;
        }
        while (v34 != v30);
        if (v33 >= v29)
LABEL_31:
          PostEventCallback(*(_QWORD *)(v96 + 96), v30, 3, (const void *)(v6 + 9), *(unsigned __int8 *)(v6 + 8), 0);
      }
      a2[21] = 1;
      v35 = *(_DWORD *)(v22 + 12);
      if (v35 != -1)
      {
        *(_DWORD *)(v22 + 12) = -1;
        close(v35);
      }
      goto LABEL_34;
    }
  }
  if (a2[23])
  {
LABEL_34:
    v88 = a3;
    v89 = (pthread_mutex_t *)(a1 + 7800);
    v90 = v8;
    v95 = a2;
    if ((int)v94 >= 1)
    {
      v36 = 0;
      LODWORD(v92) = 0;
      v93 = v22 + 404;
      *(_QWORD *)&v20 = 136315650;
      v91 = v20;
      *(_QWORD *)&v20 = 136316162;
      v87 = v20;
      while (1)
      {
        v37 = *(unsigned int *)(v22 + 112);
        if ((int)v37 < 1)
        {
          LODWORD(v38) = 0;
        }
        else
        {
          v38 = 0;
          v39 = (_DWORD *)(v6 + 480 * v36);
          while (*v39 != *(_DWORD *)(v22 + 116))
          {
            ++v38;
            v22 += 480;
            if (v37 == v38)
              goto LABEL_45;
          }
          if (*(unsigned __int16 *)(v6 + 480 * v36 + 272) > *(unsigned __int16 *)(v22 + 388))
          {
            v40 = (_DWORD *)(v22 + 116);
            memcpy((void *)(v22 + 116), v39, 0x1E0uLL);
            if (!*(_DWORD *)(v22 + 400))
            {
              v54 = v96;
              v55 = *(unsigned int *)(v96 + 400);
              if ((int)v55 > 0)
              {
                v56 = (_DWORD *)v93;
                while (*v56 != *v40)
                {
                  v56 += 3;
                  if (!--v55)
                    goto LABEL_44;
                }
                memmove(v56, v56 + 3, 12 * ((int)v55 - 1));
                --*(_DWORD *)(v54 + 400);
                ++*(_WORD *)(v54 + 388);
                *(_DWORD *)(v54 + 392) = 1;
              }
            }
          }
        }
LABEL_44:
        if ((_DWORD)v38 != (_DWORD)v37)
          goto LABEL_60;
LABEL_45:
        v41 = (int *)(v6 + 480 * v36);
        if (!v41[71])
        {
          v22 = v96;
          v46 = *(unsigned int *)(v96 + 400);
          if ((int)v46 >= 1)
          {
            v47 = *v41;
            v48 = 1;
            v49 = (_DWORD *)v93;
            while (*v49 != v47)
            {
              v49 += 3;
              ++v48;
              if (!--v46)
                goto LABEL_61;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v52 = VRTraceErrorLogLevelToCSTR();
              v53 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v91;
                v100 = v52;
                v101 = 2080;
                v102 = "gckSessionProcessLSA";
                v103 = 1024;
                v104 = 2922;
                _os_log_impl(&dword_215C5C000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removing Disconnecting Node", buf, 0x1Cu);
              }
            }
            v22 = v96;
            memmove(v49, v49 + 3, 12 * (*(_DWORD *)(v96 + 400) - v48));
            --*(_DWORD *)(v22 + 400);
            ++*(_WORD *)(v22 + 388);
            *(_DWORD *)(v22 + 392) = 1;
            a2 = v95;
          }
          goto LABEL_61;
        }
        v22 = v96;
        v42 = *(_DWORD *)(v96 + 112);
        if (v42 <= 15)
          break;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v50 = VRTraceErrorLogLevelToCSTR();
          v51 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v57 = *v41;
            *(_DWORD *)buf = v87;
            v100 = v50;
            v101 = 2080;
            v102 = "gckSessionProcessLSA";
            v103 = 1024;
            v104 = 2941;
            v105 = 1024;
            LODWORD(v106[0]) = 2941;
            WORD2(v106[0]) = 1024;
            *(_DWORD *)((char *)v106 + 6) = v57;
            _os_log_error_impl(&dword_215C5C000, v51, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Maximum # of nodes reached.  Ignoring node [%08X]\n", buf, 0x28u);
          }
          a2 = v95;
LABEL_60:
          v22 = v96;
        }
LABEL_61:
        if (++v36 == (_QWORD)v94)
          goto LABEL_75;
      }
      memcpy(&v14[120 * v42], (const void *)(v6 + 480 * v36), 0x1E0uLL);
      ++*(_DWORD *)(v22 + 112);
      v43 = v92 + 1;
      *(_DWORD *)&v90[4 * (int)v92] = *v41;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      {
        LODWORD(v92) = v43;
        goto LABEL_61;
      }
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v91;
        v100 = v44;
        v101 = 2080;
        v102 = "gckSessionProcessLSA";
        v103 = 1024;
        v104 = 2937;
        _os_log_impl(&dword_215C5C000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Added one node", buf, 0x1Cu);
      }
      LODWORD(v92) = v43;
      goto LABEL_60;
    }
    LODWORD(v92) = 0;
LABEL_75:
    gckSessionFindShortestPath(*(_DWORD *)(v22 + 112), v14);
    TracePrintNodes(*(_DWORD *)(v22 + 112), (uint64_t)v14);
    v58 = a2[29];
    v59 = *(_WORD *)(v88 + 12);
    *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v98[0] = v60;
    v98[1] = v60;
    v97 = (_WORD *)0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v61 = VRTraceErrorLogLevelToCSTR();
      v62 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v100 = v61;
        v101 = 2080;
        v102 = "gckSessionSendLSAACK";
        v103 = 1024;
        v104 = 1906;
        v105 = 1024;
        LODWORD(v106[0]) = v58;
        _os_log_impl(&dword_215C5C000, v62, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSAACK to [%08X]", buf, 0x22u);
      }
    }
    WORD6(v98[0]) = v59;
    v63 = v96;
    v64 = OSPFMakeLSAACK(&v97, (uint64_t)v98, 0, *(_DWORD *)(v96 + 108), v58);
    if ((v64 & 0x80000000) == 0)
    {
      SendUDPPacketToParticipantChannelID(v63, v97, v64, v58, 0, -1, 0);
      free(v97);
    }
    if (v13)
      v65 = -1;
    else
      v65 = a2[29];
    gckSessionSendLSA(v63, *(_DWORD *)(v63 + 112), v14, v65, 0);
    gckSessionCleanupNodes(v63, -1, 0);
    if ((int)v92 < 1)
    {
LABEL_118:
      pthread_mutex_unlock(v89);
      return;
    }
    v93 = 0;
    *(_QWORD *)&v91 = v92;
    v67 = *(unsigned int *)(v96 + 112);
    *(_QWORD *)&v66 = 136315906;
    v94 = v66;
    *(_QWORD *)&v66 = 136315650;
    v92 = v66;
    while ((int)v67 < 1)
    {
LABEL_117:
      if (++v93 == (_QWORD)v91)
        goto LABEL_118;
    }
    v68 = 0;
    v69 = *(_DWORD *)&v90[4 * v93];
    while (1)
    {
      v70 = &v14[120 * v68];
      if (v69 == *v70 && v14[120 * v68 + 1] != -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v71 = VRTraceErrorLogLevelToCSTR();
          v72 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v94;
            v100 = v71;
            v101 = 2080;
            v102 = "gckSessionProcessLSA";
            v103 = 1024;
            v104 = 2964;
            v105 = 2080;
            v106[0] = (char *)&v14[120 * v68 + 2] + 1;
            _os_log_impl(&dword_215C5C000, v72, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LSA: Connected to \"%s\" (new connection) ", buf, 0x26u);
          }
        }
        v73 = v95;
        reportingGKLog();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v74 = VRTraceErrorLogLevelToCSTR();
          v75 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v76 = *v70;
            *(_DWORD *)buf = v94;
            v100 = v74;
            v101 = 2080;
            v102 = "gckSessionProcessLSA";
            v103 = 1024;
            v104 = 2974;
            v105 = 1024;
            LODWORD(v106[0]) = v76;
            _os_log_impl(&dword_215C5C000, v75, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessLSA: async RetryICE w/ remoteID %08X OOB", buf, 0x22u);
          }
        }
        v77 = v96;
        v78 = *(_QWORD *)(v96 + 7888);
        if (v78)
        {
          while (*(_DWORD *)(v78 + 116) != *v70)
          {
            v78 = *(_QWORD *)(v78 + 728);
            if (!v78)
              goto LABEL_98;
          }
          v79 = (unsigned int *)(v78 + 96);
          while (!__ldxr(v79))
          {
            if (!__stxr(2u, v79))
              goto LABEL_105;
          }
          __clrex();
        }
        else
        {
LABEL_98:
          if (*(_DWORD *)(v96 + 104) != 1)
            GCKSessionSendDOOB(v96, *(_DWORD *)(v96 + 108), (const UInt8 *)&v14[120 * v68], 4, 9u, 5.0);
        }
LABEL_105:
        if (v73[1])
          v81 = 13;
        else
          v81 = 1;
        PostEventCallback(*(_QWORD *)(v77 + 96), *v70, v81, (char *)&v14[120 * v68 + 2] + 1, LOBYTE(v14[120 * v68 + 2]), 0);
        v82 = *(_DWORD *)(v77 + 104);
        if (v82 == 1)
          goto LABEL_113;
        if (!v82)
          break;
      }
LABEL_116:
      if (++v68 == v67)
        goto LABEL_117;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v83 = VRTraceErrorLogLevelToCSTR();
      v84 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v92;
        v100 = v83;
        v101 = 2080;
        v102 = "gckSessionProcessLSA";
        v103 = 1024;
        v104 = 3013;
        _os_log_impl(&dword_215C5C000, v84, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d globalscopeconnected", buf, 0x1Cu);
      }
    }
LABEL_113:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v85 = VRTraceErrorLogLevelToCSTR();
      v86 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v92;
        v100 = v85;
        v101 = 2080;
        v102 = "gckSessionProcessLSA";
        v103 = 1024;
        v104 = 3015;
        _os_log_impl(&dword_215C5C000, v86, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localscopeconnected", buf, 0x1Cu);
      }
    }
    goto LABEL_116;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v26 = a2[29];
      *(_DWORD *)buf = 136315906;
      v100 = v24;
      v101 = 2080;
      v102 = "gckSessionProcessLSA";
      v103 = 1024;
      v104 = 2887;
      v105 = 1024;
      LODWORD(v106[0]) = v26;
      _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Premature LSA from %08X: ignoring...", buf, 0x22u);
    }
  }
}

void TracePrintNodes(int a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int *v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  int *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v32 = v3;
      v33 = 2080;
      v34 = "TracePrintNodes";
      v35 = 1024;
      v36 = 2382;
      v37 = 1024;
      v38 = a1;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== %d nodes =====", buf, 0x22u);
    }
  }
  if (a1 >= 1)
  {
    v5 = 0;
    v6 = (int *)(a2 + 292);
    v7 = (_BYTE *)MEMORY[0x24BDFDC18];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v10 = (int *)(a2 + 480 * v5);
          v11 = *v10;
          v12 = v10[1];
          v13 = v10[67];
          v14 = *((unsigned __int16 *)v10 + 136);
          v15 = v10[69];
          v16 = v10[70];
          v17 = v10[71];
          v18 = (uint64_t)v10 + 9;
          LODWORD(v10) = *((unsigned __int8 *)v10 + 8);
          *(_DWORD *)buf = 136318210;
          v32 = v8;
          v33 = 2080;
          v34 = "TracePrintNodes";
          v35 = 1024;
          v36 = 2389;
          v37 = 1024;
          v38 = v5;
          v39 = 1024;
          v40 = v11;
          v41 = 1024;
          v42 = v12;
          v43 = 1024;
          v44 = v13;
          v45 = 1024;
          v46 = v14;
          v47 = 1024;
          v48 = v15;
          v49 = 1024;
          v50 = v16;
          v51 = 1024;
          v52 = v17;
          v53 = 2080;
          v54 = v18;
          v55 = 1024;
          v56 = (int)v10;
          _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d: %08X Next[%08X], dist[%u], SN[%u], New[%d], From[%08X], #NEIGHBOR[%d] \"%s\"[%u]\n", buf, 0x5Cu);
        }
      }
      v19 = a2 + 480 * v5;
      if (*(int *)(v19 + 284) >= 1)
      {
        v20 = 0;
        v21 = (int *)(v19 + 284);
        v22 = v6;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            v24 = *MEMORY[0x24BDFDC28];
            v25 = *MEMORY[0x24BDFDC28];
            if (*v7)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = *(v22 - 1);
                v27 = *v22;
                *(_DWORD *)buf = 136316162;
                v32 = v23;
                v33 = 2080;
                v34 = "TracePrintNodes";
                v35 = 1024;
                v36 = 2392;
                v37 = 1024;
                v38 = v26;
                v39 = 1024;
                v40 = v27;
                _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d     %08X, RTT[%u]", buf, 0x28u);
              }
            }
            else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v28 = *(v22 - 1);
              v29 = *v22;
              *(_DWORD *)buf = 136316162;
              v32 = v23;
              v33 = 2080;
              v34 = "TracePrintNodes";
              v35 = 1024;
              v36 = 2392;
              v37 = 1024;
              v38 = v28;
              v39 = 1024;
              v40 = v29;
              _os_log_debug_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEBUG, " [%s] %s:%d     %08X, RTT[%u]", buf, 0x28u);
            }
          }
          ++v20;
          v22 += 3;
        }
        while (v20 < *v21);
      }
      ++v5;
      v6 += 120;
    }
    while (v5 != a1);
  }
}

uint64_t isInNeighbor(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a2 < 1)
  {
    v14 = 0;
  }
  else
  {
    v4 = 0;
    v14 = 0;
    v16 = a2;
    v5 = (int *)(a1 + 288);
    v15 = a1;
    do
    {
      v6 = a1 + 480 * v4;
      if (*(int *)(v6 + 284) >= 1)
      {
        v7 = 0;
        v8 = (int *)(v6 + 284);
        v9 = v5;
        while (*v9 != a3)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v12 = *v9;
              *(_DWORD *)buf = 136315906;
              v18 = v10;
              v19 = 2080;
              v20 = "isInNeighbor";
              v21 = 1024;
              v22 = 2652;
              v23 = 1024;
              v24 = v12;
              _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Neighbor %08X", buf, 0x22u);
            }
          }
          ++v7;
          v9 += 3;
          if (v7 >= *v8)
            goto LABEL_12;
        }
        v14 = 1;
LABEL_12:
        a1 = v15;
      }
      ++v4;
      v5 += 120;
    }
    while (v4 != v16);
  }
  return v14 & 1;
}

void gckSessionFindShortestPath(int a1, _DWORD *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  void *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int i;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v35 - v6;
  v8 = 4 * v4;
  if (v5)
  {
    v9 = memset((char *)v35 - v6, 170, 4 * v4);
    MEMORY[0x24BDAC7A8](v9);
    v10 = (char *)v35 - ((v8 + 15) & 0x7FFFFFFF0);
    v11 = memset(v10, 170, 4 * v4);
    MEMORY[0x24BDAC7A8](v11);
    v12 = v10;
    memset(v10, 170, 4 * v4);
  }
  else
  {
    v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
    v10 = (char *)v35 - ((v8 + 15) & 0x7FFFFFFF0);
    MEMORY[0x24BDAC7A8](v13);
    v12 = (_DWORD *)((char *)v35 - v14);
  }
  memset(v12, 255, 4 * a1);
  memset(v7, 255, 4 * a1);
  bzero(v10, 4 * a1);
  *v12 = 0;
  if (a1 >= 1)
  {
    v15 = 0;
    v16 = -1;
    for (i = -1; ; i = -1)
    {
      do
      {
        if (!*(_DWORD *)&v10[4 * v15] && v12[v15] < v16)
        {
          i = v15;
          v16 = v12[v15];
        }
        ++v15;
      }
      while (v15 != v4);
      if (i == -1)
        break;
      *(_DWORD *)&v10[4 * i] = 1;
      v18 = &a2[120 * i];
      v19 = v18[71];
      if ((int)v19 >= 1)
      {
        v20 = 0;
        v21 = v18 + 72;
        do
        {
          v22 = 0;
          v23 = a2;
          while (*v23 != v21[3 * v20])
          {
            v23 += 120;
            if (v4 == ++v22)
              goto LABEL_19;
          }
          if ((_DWORD)v22 != a1 && !*(_DWORD *)&v10[4 * v22])
          {
            v24 = v21[3 * v20 + 1];
            if (v24 != -1)
            {
              v25 = v24 + v16;
              if (v25 < v12[v22])
              {
                v12[v22] = v25;
                *(_DWORD *)&v7[4 * v22] = i;
              }
            }
          }
LABEL_19:
          ++v20;
        }
        while (v20 != v19);
      }
      v15 = 0;
      v16 = -1;
    }
  }
  v26 = a2[71];
  if ((int)v26 >= 1)
  {
    v27 = 0;
    v28 = a2 + 72;
    do
    {
      if (a1 < 1)
      {
        LODWORD(v29) = 0;
      }
      else
      {
        v29 = 0;
        v30 = a2;
        while (*v30 != v28[3 * v27])
        {
          v30 += 120;
          if (v4 == ++v29)
            goto LABEL_36;
        }
      }
      if ((_DWORD)v29 != a1 && v28[3 * v27 + 1] != -1)
        *(_DWORD *)&v7[4 * v29] = 0;
LABEL_36:
      ++v27;
    }
    while (v27 != v26);
  }
  if (a1 > 1)
  {
    v31 = 1;
    do
    {
      v32 = v31;
      while (1)
      {
        v33 = v32;
        v32 = *(_DWORD *)&v7[4 * v32];
        if (v32 == -1)
          break;
        if (!v32)
        {
          a2[120 * v31 + 1] = a2[120 * v33];
          v34 = v12[v31];
          goto LABEL_44;
        }
      }
      v34 = -1;
      a2[120 * v31 + 1] = -1;
LABEL_44:
      a2[120 * v31++ + 67] = v34;
    }
    while (v31 != v4);
  }
}

void gckSessionSendLSA(uint64_t a1, int a2, void *a3, int a4, int a5)
{
  int ErrorLogLevelForModule;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;
  int v20;
  os_log_t *v22;
  uint64_t v23;
  NSObject *v24;
  pthread_mutex_t *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  int v35;
  void *v36[5];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  memset(v36, 170, 32);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v11 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(a1 + 400);
      *(_DWORD *)buf = 136315906;
      v38 = v12;
      v39 = 2080;
      v40 = "gckSessionSendLSA";
      v41 = 1024;
      v42 = 1830;
      v43 = 1024;
      v44 = v14;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSA to %2d neighbors", buf, 0x22u);
    }
  }
  LODWORD(v36[3]) = a2;
  v36[4] = a3;
  if (*(int *)(a1 + 400) >= 1)
  {
    v15 = 0;
    v35 = a5;
    do
    {
      v16 = *(_DWORD *)(a1 + 12 * v15 + 404);
      if (v16 != a4)
      {
        v17 = *(_WORD *)(a1 + 20);
        *(_WORD *)(a1 + 20) = v17 + 1;
        WORD2(v36[2]) = v17;
        v18 = OSPFMakeLSA((Bytef **)v36, (uint64_t)&v36[1], 0, *(_DWORD *)(a1 + 108), v16, 0);
        if ((v18 & 0x80000000) == 0)
        {
          v19 = *(_QWORD *)(a1 + 7888);
          if (!v19)
            goto LABEL_25;
          v20 = v18;
          while (v16 != *(_DWORD *)(v19 + 116) || *(_DWORD *)(v19 + 108))
          {
            v19 = *(_QWORD *)(v19 + 728);
            if (!v19)
              goto LABEL_25;
          }
          if (!*(_DWORD *)(v19 + 88) && a5 == 0)
          {
LABEL_25:
            free(v36[0]);
          }
          else
          {
            v22 = v11;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *v11;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v38 = v23;
                v39 = 2080;
                v40 = "gckSessionSendLSA";
                v41 = 1024;
                v42 = 1857;
                v43 = 1024;
                v44 = v16;
                _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSA to [%08X]", buf, 0x22u);
              }
            }
            v25 = (pthread_mutex_t *)(v19 + 664);
            pthread_mutex_lock((pthread_mutex_t *)(v19 + 664));
            v26 = (_QWORD *)(v19 + 496);
            do
            {
              v27 = v26;
              v28 = *v26;
              v26 = (_QWORD *)(*v26 + 64);
            }
            while (v28);
            v29 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
            *v29 = 4;
            *(_OWORD *)(v29 + 8) = xmmword_215CDD8E0;
            v30 = v36[0];
            *((_QWORD *)v29 + 4) = 0x4082BFEB851EB852;
            *((_QWORD *)v29 + 5) = v30;
            *((_DWORD *)v29 + 12) = v20;
            *((_DWORD *)v29 + 13) = v16;
            *((_WORD *)v29 + 28) = WORD2(v36[2]);
            *v27 = v29;
            pthread_mutex_unlock(v25);
            v31 = *(_DWORD *)(a1 + 12);
            v11 = v22;
            a5 = v35;
            if (v31 != -1)
            {
              *(_DWORD *)(a1 + 12) = -1;
              close(v31);
            }
          }
        }
      }
      ++v15;
    }
    while (v15 < *(int *)(a1 + 400));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_DWORD *)(a1 + 108);
      *(_DWORD *)buf = 136315906;
      v38 = v32;
      v39 = 2080;
      v40 = "gckSessionSendLSA";
      v41 = 1024;
      v42 = 1894;
      v43 = 1024;
      v44 = v34;
      _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ========= After sending all LSAs...", buf, 0x22u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a1 + 112), a1 + 116);
}

void gckSessionCleanupNodes(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int *v9;
  int v10;
  int i;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  _DWORD *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  int v44;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  LODWORD(v5) = *(_DWORD *)(a1 + 112);
  if ((int)v5 < 1)
    goto LABEL_42;
  v6 = 0;
  v44 = 0;
  v7 = a3 ? -2145779689 : 0;
  v43 = v7;
  do
  {
    v8 = a1 + 480 * v6;
    if (*(_DWORD *)(v8 + 120) == -1)
    {
      v9 = (int *)(v8 + 116);
      v10 = *(_DWORD *)(a1 + 400);
      if (v10 >= 1)
      {
        for (i = 0; i < v10; ++i)
        {
          v12 = a1 + 12 * i;
          if (*(_DWORD *)(v12 + 404) == *v9)
          {
            memmove((void *)(v12 + 404), (const void *)(a1 + 12 * i + 416), 12 * (v10 + ~i));
            v10 = *(_DWORD *)(a1 + 400) - 1;
            *(_DWORD *)(a1 + 400) = v10;
            --i;
          }
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *v9;
          *(_DWORD *)buf = 136316162;
          v47 = v13;
          v48 = 2080;
          v49 = "gckSessionCleanupNodes";
          v50 = 1024;
          v51 = 1320;
          v52 = 2080;
          v53 = a1 + 480 * v6 + 125;
          v54 = 1024;
          v55 = v15;
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disconnected from \"%s\"[%08X]", buf, 0x2Cu);
        }
      }
      v16 = *(_QWORD *)(a1 + 96);
      v17 = *(unsigned int *)(v16 + 168);
      v18 = *v9;
      if ((int)v17 < 1)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        v19 = 0;
        while (*(_DWORD *)(v16 + 172 + 4 * v19) != v18)
        {
          if (v17 == ++v19)
          {
            LODWORD(v19) = *(_DWORD *)(v16 + 168);
            break;
          }
        }
      }
      if (v19 <= 0xF && (_DWORD)v19 == (_DWORD)v17)
      {
        *(_DWORD *)(v16 + 4 * v17 + 172) = v18;
        *(_DWORD *)(v16 + 168) = v17 + 1;
        v18 = *v9;
      }
      PostEventCallback(v16, v18, 3, (const void *)(a1 + 480 * v6 + 125), *(unsigned __int8 *)(a1 + 480 * v6 + 124), v43);
      v20 = v44;
      if (*v9 == a2)
        v20 = 1;
      v44 = v20;
      for (j = *(_QWORD *)(a1 + 7888); j; j = *(_QWORD *)(j + 728))
      {
        if (*(_DWORD *)(j + 116) == *v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v24 = *(_DWORD *)(j + 116);
              *(_DWORD *)buf = 136315906;
              v47 = v22;
              v48 = 2080;
              v49 = "gckSessionCleanupNodes";
              v50 = 1024;
              v51 = 1357;
              v52 = 1024;
              LODWORD(v53) = v24;
              _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes closing invalid (%08X)", buf, 0x22u);
            }
          }
          *(_DWORD *)(j + 84) = 1;
          if (a3)
          {
            *(double *)(j + 24) = micro();
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v25 = VRTraceErrorLogLevelToCSTR();
              v26 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v47 = v25;
                v48 = 2080;
                v49 = "gckSessionCleanupNodes";
                v50 = 1024;
                v51 = 1362;
                _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes: timed out, enforcing clean up", buf, 0x1Cu);
              }
            }
          }
        }
      }
      memmove(v9, (const void *)(a1 + 480 * v6 + 596), 480 * (*(_DWORD *)(a1 + 112) + ~v6));
      LODWORD(v5) = *(_DWORD *)(a1 + 112) - 1;
      *(_DWORD *)(a1 + 112) = v5;
      --v6;
    }
    ++v6;
  }
  while (v6 < (int)v5);
  if ((int)v5 >= 1)
  {
    v5 = v5;
    v27 = (_DWORD *)(a1 + 392);
    do
    {
      *v27 = 0;
      v27 += 120;
      --v5;
    }
    while (v5);
  }
  if (!v44)
  {
LABEL_42:
    v28 = *(_QWORD *)(a1 + 7888);
    if (v28)
    {
      v29 = 0;
      if (a3)
        v30 = -2145779689;
      else
        v30 = 0;
      do
      {
        if (*(_DWORD *)(v28 + 116) == a2)
        {
          if (!v29)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v31 = VRTraceErrorLogLevelToCSTR();
              v32 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v33 = *(_DWORD *)(v28 + 116);
                *(_DWORD *)buf = 136316162;
                v47 = v31;
                v48 = 2080;
                v49 = "gckSessionCleanupNodes";
                v50 = 1024;
                v51 = 1384;
                v52 = 2080;
                v53 = v28 + 120;
                v54 = 1024;
                v55 = v33;
                _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disconnected from \"%s\"[%08X]", buf, 0x2Cu);
              }
            }
            v34 = *(_QWORD *)(a1 + 96);
            v35 = *(unsigned int *)(v34 + 168);
            v36 = *(_DWORD *)(v28 + 116);
            if ((int)v35 < 1)
            {
              LODWORD(v37) = 0;
            }
            else
            {
              v37 = 0;
              while (*(_DWORD *)(v34 + 172 + 4 * v37) != v36)
              {
                if (v35 == ++v37)
                {
                  LODWORD(v37) = *(_DWORD *)(v34 + 168);
                  break;
                }
              }
            }
            if (v37 <= 0xF && (_DWORD)v37 == (_DWORD)v35)
            {
              *(_DWORD *)(v34 + 4 * v35 + 172) = v36;
              *(_DWORD *)(v34 + 168) = v35 + 1;
              v36 = *(_DWORD *)(v28 + 116);
            }
            PostEventCallback(v34, v36, 3, (const void *)(v28 + 120), *(_DWORD *)(v28 + 376), v30);
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v38 = VRTraceErrorLogLevelToCSTR();
            v39 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v40 = *(_DWORD *)(v28 + 116);
              *(_DWORD *)buf = 136315906;
              v47 = v38;
              v48 = 2080;
              v49 = "gckSessionCleanupNodes";
              v50 = 1024;
              v51 = 1416;
              v52 = 1024;
              LODWORD(v53) = v40;
              _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes closing disconnectID (%d)", buf, 0x22u);
            }
          }
          v29 = 1;
          *(_DWORD *)(v28 + 84) = 1;
          if (a3)
          {
            *(double *)(v28 + 24) = micro();
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v41 = VRTraceErrorLogLevelToCSTR();
              v42 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v47 = v41;
                v48 = 2080;
                v49 = "gckSessionCleanupNodes";
                v50 = 1024;
                v51 = 1421;
                _os_log_impl(&dword_215C5C000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes: timed out, enforcing clean up", buf, 0x1Cu);
              }
            }
            v29 = 1;
          }
        }
        v28 = *(_QWORD *)(v28 + 728);
      }
      while (v28);
    }
  }
}

void BWE_EndCurrentSequence(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int16 v6;
  unsigned int v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _OWORD *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  _OWORD v35[2];
  _BYTE v36[22];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 8464;
  v3 = *(_QWORD *)(a1 + 7888);
  if (v3)
  {
    while (*(_DWORD *)(v3 + 116) != *(_DWORD *)(a1 + 8468) || *(_DWORD *)(v3 + 100) != *(_DWORD *)(a1 + 8472))
    {
      v3 = *(_QWORD *)(v3 + 728);
      if (!v3)
        goto LABEL_5;
    }
    v5 = *(_QWORD *)(v3 + 736);
    if (v5 != 0xFFFFFFFFLL)
    {
      v6 = *(_WORD *)(v2 + 12);
      v7 = *(_DWORD *)&v6 | 0xFFFF0000;
      if ((*(_DWORD *)(v3 + 412) & 1) != 0)
        v8 = 48;
      else
        v8 = 28;
      if (!GCK_BWE_CalcRxEstimate(a2, v5, 0, *(_DWORD *)&v6 | 0xFFFF0000, 16 * (v6 & 0xFFFu), v8, 1, *(_DWORD *)&v6 | 0xFFFF0000, 0, (_DWORD *)(v3 + 752)))*(_DWORD *)(v3 + 592) = 125 * *(_DWORD *)(v3 + 752);
      *(_QWORD *)&v36[14] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35[1] = v9;
      *(_OWORD *)v36 = v9;
      v35[0] = v9;
      IPPORTToStringWithSize();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        v12 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_DWORD *)(v3 + 116);
            v14 = *(_DWORD *)(v3 + 752);
            *(_DWORD *)buf = 136317186;
            v18 = v10;
            v19 = 2080;
            v20 = "BWE_EndCurrentSequence";
            v21 = 1024;
            v22 = 8972;
            v23 = 1024;
            v24 = v13;
            v25 = 2080;
            v26 = v35;
            v27 = 1024;
            v28 = 0;
            v29 = 2048;
            v30 = a2;
            v31 = 1024;
            v32 = v7;
            v33 = 1024;
            v34 = v14;
            _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_EndCurrentSequence for (%d %s): %d   @%.3f with fake SeqID %d --> downstream BW: %d kbps\n****************************************************\n", buf, 0x48u);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v15 = *(_DWORD *)(v3 + 116);
          v16 = *(_DWORD *)(v3 + 752);
          *(_DWORD *)buf = 136317186;
          v18 = v10;
          v19 = 2080;
          v20 = "BWE_EndCurrentSequence";
          v21 = 1024;
          v22 = 8972;
          v23 = 1024;
          v24 = v15;
          v25 = 2080;
          v26 = v35;
          v27 = 1024;
          v28 = 0;
          v29 = 2048;
          v30 = a2;
          v31 = 1024;
          v32 = v7;
          v33 = 1024;
          v34 = v16;
          _os_log_debug_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_EndCurrentSequence for (%d %s): %d   @%.3f with fake SeqID %d --> downstream BW: %d kbps\n****************************************************\n", buf, 0x48u);
        }
      }
    }
  }
LABEL_5:
  *(_BYTE *)v2 = 0;
}

void __gckSessionRecvTCPMessage_block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v2 = 136315650;
      v3 = v0;
      v4 = 2080;
      v5 = "gckSessionRecvTCPMessage_block_invoke";
      v6 = 1024;
      v7 = 3179;
      _os_log_impl(&dword_215C5C000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionRecvTCPMessage: optionHandler invoked...", (uint8_t *)&v2, 0x1Cu);
    }
  }
}

void gckNetworkMonitorCallback(uint64_t a1, const __CFArray *a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  _BYTE *v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFArray *v27;
  __int128 v28;
  CFIndex v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *ValueAtIndex;
  const __CFString *v33;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  const char *CStringPtr;
  uint64_t v40;
  NSObject *v41;
  const __CFDictionary *v42;
  const __CFDictionary *v43;
  CFTypeID v44;
  CFTypeID TypeID;
  int ErrorLogLevelForModule;
  uint64_t v47;
  NSObject *v48;
  CFIndex v49;
  uint64_t v50;
  size_t v51;
  _BYTE *v52;
  void *v53;
  uint64_t i;
  const __CFString *v55;
  const void *v56;
  CFIndex v57;
  CFIndex v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  const __CFString *v65;
  CFIndex v66;
  CFIndex v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  int CString;
  uint64_t v72;
  NSObject *v73;
  char *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  const __CFAllocator *v79;
  const __CFString *v80;
  const __CFString *v81;
  CFStringRef v82;
  const __CFString *v83;
  CFTypeID v84;
  CFIndex v85;
  CFIndex v86;
  CFIndex v87;
  CFIndex v88;
  CFIndex Bytes;
  size_t v90;
  char *v91;
  CFStringRef v92;
  CFStringRef v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  uint64_t v102;
  NSObject *v103;
  CFArrayRef v104;
  CFIndex v105;
  uint64_t v106;
  NSObject *v107;
  const UInt8 *v108;
  size_t v109;
  unsigned __int8 *v110;
  uint64_t j;
  BOOL v112;
  size_t v113;
  const UInt8 *v114;
  _BYTE *v115;
  int v116;
  size_t v117;
  _BYTE v119[4];
  int v120;
  unsigned __int8 *v121;
  size_t v122;
  const UInt8 *v123;
  _BYTE *v124;
  uint64_t v125;
  CFArrayRef Mutable;
  uint64_t v127;
  _BYTE *v128;
  CFAllocatorRef v129;
  __int128 v130;
  __int128 v131;
  CFDictionaryRef v132;
  __int128 v133;
  CFArrayRef v134;
  CFIndex Count;
  _BYTE *v136;
  _BYTE *v137;
  CFStringRef v138;
  _BYTE *v139;
  CFIndex v140;
  void *value;
  uint8_t buf[4];
  uint64_t v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  int v147;
  __int16 v148;
  _WORD v149[13];
  CFRange v150;
  CFRange v151;

  *(_QWORD *)&v149[9] = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v143 = v5;
      v144 = 2080;
      v145 = "gckNetworkMonitorCallback";
      v146 = 1024;
      v147 = 5500;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: ...", buf, 0x1Cu);
    }
  }
  v7 = CheckInHandleDebug();
  if (!v7)
    return;
  v8 = v7;
  if (!*(_QWORD *)(v7 + 8296))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v143 = v23;
        v144 = 2080;
        v145 = "gckNetworkMonitorCallback";
        v146 = 1024;
        v147 = 5764;
        _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: dynamic store missing ...", buf, 0x1Cu);
      }
    }
    CheckOutHandleDebug();
    return;
  }
  v134 = a2;
  v9 = pthread_mutex_lock((pthread_mutex_t *)(v7 + 7800));
  v124 = v119;
  v10 = *(unsigned int *)(v8 + 112);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v12 = (4 * v10 + 15) & 0x7FFFFFFF0;
  v13 = &v119[-v12];
  v14 = 8 * v10;
  v122 = v10;
  if ((_DWORD)v10)
  {
    v15 = memset(&v119[-v12], 170, 4 * v10);
    MEMORY[0x24BDAC7A8](v15);
    v16 = &v119[-((v10 + 15) & 0x1FFFFFFF0)];
    v17 = memset(v16, 170, v10);
    MEMORY[0x24BDAC7A8](v17);
    v18 = &v119[-((v14 + 15) & 0xFFFFFFFF0)];
    v19 = memset(v18, 170, 8 * v10);
    MEMORY[0x24BDAC7A8](v19);
    v20 = &v119[-v12];
    memset(&v119[-v12], 170, 4 * v10);
    if ((int)v10 >= 2)
    {
      bzero(&v119[-((v10 + 15) & 0x1FFFFFFF0)], (v10 - 1));
      bzero(v18, 8 * (v10 - 1));
      memset_pattern16(v20, &unk_215CDD900, 4 * (v10 - 1));
      v21 = 0;
      v22 = (_DWORD *)(v8 + 596);
      do
      {
        *(_DWORD *)&v13[4 * v21++] = *v22;
        v22 += 120;
      }
      while (v10 - 1 != v21);
      v120 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v25 = MEMORY[0x24BDAC7A8](v11);
    v16 = &v119[-((v10 + 15) & 0x1FFFFFFF0)];
    v26 = MEMORY[0x24BDAC7A8](v25);
    v18 = &v119[-((v14 + 15) & 0xFFFFFFFF0)];
    MEMORY[0x24BDAC7A8](v26);
    v20 = &v119[-v12];
  }
  v120 = 0;
  v21 = 0;
LABEL_17:
  v125 = a3;
  v123 = &v119[-v12];
  *(_DWORD *)&v13[4 * v21] = -1;
  v121 = v16;
  v16[v21] = 0;
  *(_QWORD *)&v18[8 * v21] = 0;
  *(_DWORD *)&v20[4 * v21] = 1500;
  pthread_mutex_unlock((pthread_mutex_t *)(v8 + 7800));
  v129 = (CFAllocatorRef)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable(v129, 0, MEMORY[0x24BDBD690]);
  v27 = v134;
  if (v134)
  {
    Count = CFArrayGetCount(v134);
    if (Count >= 1)
    {
      v29 = 0;
      *(_QWORD *)&v28 = 136315650;
      v131 = v28;
      *(_QWORD *)&v28 = 136315906;
      v130 = v28;
      *(_QWORD *)&v28 = 136316162;
      v133 = v28;
      v127 = v8;
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v131;
            v143 = v30;
            v144 = 2080;
            v145 = "gckNetworkMonitorCallback";
            v146 = 1024;
            v147 = 5539;
            _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: notification: ", buf, 0x1Cu);
          }
        }
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v27, v29);
        if (ValueAtIndex)
        {
          v33 = ValueAtIndex;
          Length = CFStringGetLength(ValueAtIndex);
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
          v136 = v119;
          v36 = MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
          v38 = &v119[-v37];
          if (v36)
            memset(&v119[-v37], 170, MaximumSizeForEncoding);
          v138 = v33;
          CStringPtr = CFStringGetCStringPtr(v33, 0x8000100u);
          if (!CStringPtr)
          {
            if (CFStringGetCString(v138, v38, MaximumSizeForEncoding, 0x8000100u))
              CStringPtr = v38;
            else
              CStringPtr = 0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v40 = VRTraceErrorLogLevelToCSTR();
            v41 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v133;
              v143 = v40;
              v144 = 2080;
              v145 = "gckNetworkMonitorCallback";
              v146 = 1024;
              v147 = 5557;
              v148 = 1024;
              *(_DWORD *)v149 = v29;
              v149[2] = 2080;
              *(_QWORD *)&v149[3] = CStringPtr;
              _os_log_impl(&dword_215C5C000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
            }
          }
          v42 = (const __CFDictionary *)SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(v8 + 8296), v138);
          v27 = v134;
          if (v42)
          {
            v43 = v42;
            v44 = CFGetTypeID(v42);
            TypeID = CFDictionaryGetTypeID();
            ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (v44 == TypeID)
            {
              if (ErrorLogLevelForModule >= 7)
              {
                v47 = VRTraceErrorLogLevelToCSTR();
                v48 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v131;
                  v143 = v47;
                  v144 = 2080;
                  v145 = "gckNetworkMonitorCallback";
                  v146 = 1024;
                  v147 = 5567;
                  _os_log_impl(&dword_215C5C000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DICTIONARY PROPERTY TYPE FOR REFERERNCE", buf, 0x1Cu);
                }
              }
              v132 = v43;
              v49 = CFDictionaryGetCount(v43);
              if (v49)
              {
                v50 = v49;
                v128 = v119;
                v51 = 8 * v49;
                MEMORY[0x24BDAC7A8](v49);
                v52 = &v119[-((v51 + 15) & 0xFFFFFFFFFFFFFFF0)];
                v53 = memset(v52, 170, v51);
                MEMORY[0x24BDAC7A8](v53);
                memset(v52, 170, v51);
                v139 = v52;
                v137 = v52;
                CFDictionaryGetKeysAndValues(v132, (const void **)v52, (const void **)v52);
                if (v50 >= 1)
                {
                  for (i = 0; i != v50; ++i)
                  {
                    v55 = *(const __CFString **)&v139[8 * i];
                    if (v55)
                    {
                      v56 = *(const void **)&v137[8 * i];
                      v57 = CFStringGetLength(*(CFStringRef *)&v139[8 * i]);
                      v58 = CFStringGetMaximumSizeForEncoding(v57, 0x8000100u);
                      v59 = MEMORY[0x24BDAC7A8](v58);
                      v61 = &v119[-v60];
                      if (v59)
                        memset(&v119[-v60], 170, v58);
                      v62 = CFStringGetCStringPtr(v55, 0x8000100u);
                      if (!v62)
                      {
                        if (CFStringGetCString(v55, v61, v58, 0x8000100u))
                          v62 = v61;
                        else
                          v62 = 0;
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v63 = VRTraceErrorLogLevelToCSTR();
                        v64 = *MEMORY[0x24BDFDC28];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = v133;
                          v143 = v63;
                          v144 = 2080;
                          v145 = "gckNetworkMonitorCallback";
                          v146 = 1024;
                          v147 = 5595;
                          v148 = 1024;
                          *(_DWORD *)v149 = i;
                          v149[2] = 2080;
                          *(_QWORD *)&v149[3] = v62;
                          _os_log_impl(&dword_215C5C000, v64, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dictionary key[%d] == %s", buf, 0x2Cu);
                        }
                      }
                      if (v56)
                      {
                        v65 = CFCopyDescription(v56);
                        v66 = CFStringGetLength(v65);
                        v67 = CFStringGetMaximumSizeForEncoding(v66, 0x8000100u);
                        v68 = MEMORY[0x24BDAC7A8](v67);
                        v70 = &v119[-v69];
                        if (v68)
                          memset(&v119[-v69], 170, v67);
                        CString = CFStringGetCString(v65, v70, v67, 0x8000100u);
                        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                        {
                          v72 = VRTraceErrorLogLevelToCSTR();
                          v73 = *MEMORY[0x24BDFDC28];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = v130;
                            if (CString)
                              v74 = v70;
                            else
                              v74 = 0;
                            v143 = v72;
                            v144 = 2080;
                            v145 = "gckNetworkMonitorCallback";
                            v146 = 1024;
                            v147 = 5605;
                            v148 = 2080;
                            *(_QWORD *)v149 = v74;
                            _os_log_impl(&dword_215C5C000, v73, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d description == %s", buf, 0x26u);
                          }
                        }
                        CFRelease(v65);
                      }
                      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v77 = VRTraceErrorLogLevelToCSTR();
                        v78 = *MEMORY[0x24BDFDC28];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = v133;
                          v143 = v77;
                          v144 = 2080;
                          v145 = "gckNetworkMonitorCallback";
                          v146 = 1024;
                          v147 = 5608;
                          v148 = 1024;
                          *(_DWORD *)v149 = i;
                          v149[2] = 2080;
                          *(_QWORD *)&v149[3] = "NULL";
                          _os_log_impl(&dword_215C5C000, v78, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dictionary val[%d] == %s", buf, 0x2Cu);
                        }
                      }
                    }
                    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v75 = VRTraceErrorLogLevelToCSTR();
                      v76 = *MEMORY[0x24BDFDC28];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = v133;
                        v143 = v75;
                        v144 = 2080;
                        v145 = "gckNetworkMonitorCallback";
                        v146 = 1024;
                        v147 = 5611;
                        v148 = 1024;
                        *(_DWORD *)v149 = i;
                        v149[2] = 2080;
                        *(_QWORD *)&v149[3] = "NULL";
                        _os_log_impl(&dword_215C5C000, v76, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dictionary key[%d] == %s", buf, 0x2Cu);
                      }
                    }
                  }
                }
              }
              v79 = v129;
              v80 = CFStringCreateWithCString(v129, "State:/Network/Interface/", 0x8000100u);
              v81 = CFStringCreateWithCString(v79, "/IPv4", 0x8000100u);
              v82 = CFStringCreateWithCString(v79, "Addresses", 0x8000100u);
              value = 0;
              v83 = v138;
              if (CFStringHasPrefix(v138, v80))
              {
                if (CFStringHasSuffix(v83, v81))
                {
                  if (CFDictionaryGetValueIfPresent(v132, v82, (const void **)&value))
                  {
                    if (value)
                    {
                      v84 = CFGetTypeID(value);
                      if (v84 == CFArrayGetTypeID())
                      {
                        if (CFArrayGetCount((CFArrayRef)value))
                        {
                          v140 = 0;
                          v85 = CFStringGetLength(v80);
                          v86 = CFStringGetLength(v83);
                          v87 = CFStringGetLength(v80);
                          v88 = v86 - (v87 + CFStringGetLength(v81));
                          v150.location = v85;
                          v150.length = v88;
                          Bytes = CFStringGetBytes(v83, v150, 0x8000100u, 0, 0, 0, 256, &v140);
                          if (Bytes)
                          {
                            MEMORY[0x24BDAC7A8](Bytes);
                            v91 = &v119[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)];
                            if (v90)
                              memset(&v119[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)], 170, v90);
                            v151.location = v85;
                            v151.length = v88;
                            if (CFStringGetBytes(v138, v151, 0x8000100u, 0, 0, (UInt8 *)v91, v140, &v140))
                            {
                              v91[v140] = 0;
                              v92 = CFStringCreateWithCString(v129, v91, 0x8000100u);
                              if (v92)
                              {
                                v93 = v92;
                                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                                {
                                  v94 = VRTraceErrorLogLevelToCSTR();
                                  v95 = *MEMORY[0x24BDFDC28];
                                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = v130;
                                    v143 = v94;
                                    v144 = 2080;
                                    v145 = "gckNetworkMonitorCallback";
                                    v146 = 1024;
                                    v147 = 5702;
                                    v148 = 2080;
                                    *(_QWORD *)v149 = v91;
                                    _os_log_impl(&dword_215C5C000, v95, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d INTERFACE NAME == '%s'...", buf, 0x26u);
                                  }
                                }
                                CFArrayAppendValue(Mutable, v93);
                                CFRelease(v93);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              CFRelease(v82);
              CFRelease(v81);
              CFRelease(v80);
              v8 = v127;
              v27 = v134;
              v43 = v132;
            }
            else if (ErrorLogLevelForModule >= 7)
            {
              v100 = VRTraceErrorLogLevelToCSTR();
              v101 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v131;
                v143 = v100;
                v144 = 2080;
                v145 = "gckNetworkMonitorCallback";
                v146 = 1024;
                v147 = 5717;
                _os_log_impl(&dword_215C5C000, v101, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d UNKNOWN PROPERTY TYPE FOR REFRERNCE", buf, 0x1Cu);
              }
            }
            CFRelease(v43);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v98 = VRTraceErrorLogLevelToCSTR();
            v99 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v131;
              v143 = v98;
              v144 = 2080;
              v145 = "gckNetworkMonitorCallback";
              v146 = 1024;
              v147 = 5722;
              _os_log_impl(&dword_215C5C000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NO PROPERTY REFERENCE FOR KEY", buf, 0x1Cu);
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v96 = VRTraceErrorLogLevelToCSTR();
          v97 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v130;
            v143 = v96;
            v144 = 2080;
            v145 = "gckNetworkMonitorCallback";
            v146 = 1024;
            v147 = 5725;
            v148 = 1024;
            *(_DWORD *)v149 = v29;
            _os_log_impl(&dword_215C5C000, v97, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == NULL", buf, 0x22u);
          }
        }
        ++v29;
      }
      while (v29 != Count);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v102 = VRTraceErrorLogLevelToCSTR();
    v103 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v143 = v102;
      v144 = 2080;
      v145 = "gckNetworkMonitorCallback";
      v146 = 1024;
      v147 = 5729;
      _os_log_impl(&dword_215C5C000, v103, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: no changed keys...", buf, 0x1Cu);
    }
  }
  v104 = Mutable;
  v105 = CFArrayGetCount(Mutable);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v106 = VRTraceErrorLogLevelToCSTR();
    v107 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v143 = v106;
      v144 = 2080;
      v145 = "gckNetworkMonitorCallback";
      v146 = 1024;
      v147 = 5733;
      v148 = 1024;
      *(_DWORD *)v149 = v105;
      _os_log_impl(&dword_215C5C000, v107, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: %d new active interfaces...", buf, 0x22u);
    }
  }
  v108 = v123;
  v109 = v122;
  v110 = v121;
  if (v105)
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v8 + 7904));
    for (j = *(_QWORD *)(v8 + 7888); j; j = *(_QWORD *)(j + 728))
    {
      if (*(_DWORD *)(j + 108))
        v112 = 1;
      else
        v112 = (int)v109 < 2;
      if (!v112)
      {
        v113 = v109 - 1;
        v114 = v108;
        v115 = v110;
        while (1)
        {
          v116 = *(_DWORD *)v114;
          v114 += 4;
          if (v116 == *(_DWORD *)(j + 116))
            break;
          ++v115;
          if (!--v113)
            goto LABEL_113;
        }
        *v115 = 1;
      }
LABEL_113:
      ;
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v8 + 7904));
    if (v120)
    {
      v117 = v109 - 1;
      do
      {
        if (*v110++)
          GCKSessionSendDOOB(v8, *(_DWORD *)(v8 + 108), v108, 4, 9u, 5.0);
        v108 += 4;
        --v117;
      }
      while (v117);
    }
  }
  gckDisplayNetworkState(v8);
  CheckOutHandleDebug();
  CFRelease(v104);
}

void gckDisplayNetworkState(uint64_t a1)
{
  uint64_t v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  const __CFAllocator *v6;
  CFStringRef v7;
  CFStringRef v8;
  const __CFArray *v9;
  CFDictionaryRef v10;
  const __CFDictionary *v11;
  uint64_t v12;
  NSObject *v13;
  CFIndex Count;
  uint64_t v15;
  size_t v16;
  char *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  const __CFString *v21;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  const char *CStringPtr;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const __CFArray *v35;
  const __CFString *v36;
  const __CFString *v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _QWORD v46[3];
  void *values[3];

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8296);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = v4;
        v41 = 2080;
        v42 = "gckDisplayNetworkState";
        v43 = 1024;
        v44 = 1438;
        _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckDisplayNetworkState: ...", buf, 0x1Cu);
      }
    }
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], "State:/Network/Interface/[^/]+/Link", 0x8000100u);
    v8 = CFStringCreateWithCString(v6, "State:/Network/Interface/[^/]+/IPv4", 0x8000100u);
    values[0] = (void *)v7;
    values[1] = (void *)v8;
    v9 = CFArrayCreate(v6, (const void **)values, 2, MEMORY[0x24BDBD690]);
    v10 = SCDynamicStoreCopyMultiple(*(SCDynamicStoreRef *)(a1 + 8296), 0, v9);
    if (v10)
    {
      v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = v12;
          v41 = 2080;
          v42 = "gckDisplayNetworkState";
          v43 = 1024;
          v44 = 1453;
          _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d first SCDynamicStoreCopyMultiple succeeded", buf, 0x1Cu);
        }
      }
      Count = CFDictionaryGetCount(v11);
      if (Count)
      {
        v15 = Count;
        v35 = v9;
        v36 = v8;
        v37 = v7;
        v34 = (uint64_t)&v34;
        v16 = 8 * Count;
        MEMORY[0x24BDAC7A8](Count);
        v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        v18 = memset(v17, 170, v16);
        MEMORY[0x24BDAC7A8](v18);
        memset(v17, 170, v16);
        CFDictionaryGetKeysAndValues(v11, (const void **)v17, (const void **)v17);
        if (v15 >= 1)
        {
          v20 = 0;
          *(_QWORD *)&v19 = 136316162;
          v38 = v19;
          do
          {
            v21 = *(const __CFString **)&v17[8 * v20];
            if (v21)
            {
              Length = CFStringGetLength(*(CFStringRef *)&v17[8 * v20]);
              MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
              v24 = MEMORY[0x24BDAC7A8](MaximumSizeForEncoding);
              v26 = (char *)&v34 - v25;
              if (v24)
                memset((char *)&v34 - v25, 170, MaximumSizeForEncoding);
              CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
              if (!CStringPtr)
              {
                if (CFStringGetCString(v21, v26, MaximumSizeForEncoding, 0x8000100u))
                  CStringPtr = v26;
                else
                  CStringPtr = 0;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v28 = VRTraceErrorLogLevelToCSTR();
                v29 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v38;
                  v40 = v28;
                  v41 = 2080;
                  v42 = "gckDisplayNetworkState";
                  v43 = 1024;
                  v44 = 1482;
                  v45 = 1024;
                  LODWORD(v46[0]) = v20;
                  WORD2(v46[0]) = 2080;
                  *(_QWORD *)((char *)v46 + 6) = CStringPtr;
                  _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v30 = VRTraceErrorLogLevelToCSTR();
              v31 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v38;
                v40 = v30;
                v41 = 2080;
                v42 = "gckDisplayNetworkState";
                v43 = 1024;
                v44 = 1484;
                v45 = 1024;
                LODWORD(v46[0]) = v20;
                WORD2(v46[0]) = 2080;
                *(_QWORD *)((char *)v46 + 6) = "NULL";
                _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
              }
            }
            ++v20;
          }
          while (v15 != v20);
        }
        v9 = v35;
        v8 = v36;
        v7 = v37;
      }
      CFRelease(v11);
    }
    CFRelease(v8);
    CFRelease(v7);
    CFRelease(v9);
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v40 = v32;
      v41 = 2080;
      v42 = "gckDisplayNetworkState";
      v43 = 1024;
      v44 = 1499;
      v45 = 2048;
      v46[0] = a1;
      _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckDisplayNetworkState: error %p", buf, 0x26u);
    }
  }
}

void freeOptionsList(uint64_t *a1)
{
  uint64_t i;

  for (i = *a1; *a1; i = *a1)
  {
    *a1 = *(_QWORD *)(i + 8);
    *(_QWORD *)(i + 8) = 0;
    if (*(_QWORD *)i)
      free(*(void **)i);
    free((void *)i);
  }
}

void sub_215C8A18C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, __int128 a13, uint64_t a14)
{
  const char *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  const char *Name;
  uint64_t v19;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(exception_object);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        Name = sel_getName(v14);
        v19 = objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        LODWORD(a9) = 136316162;
        *(_QWORD *)((char *)&a9 + 4) = v16;
        WORD6(a9) = 2080;
        *(_QWORD *)((char *)&a9 + 14) = "+[GKConnection externalAddressForSelfConnectionData:]";
        a12 = 1024;
        LODWORD(a13) = 357;
        WORD2(a13) = 2080;
        *(_QWORD *)((char *)&a13 + 6) = Name;
        HIWORD(a13) = 2080;
        a14 = v19;
        _os_log_error_impl(&dword_215C5C000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d +[GKConnection %s]: Exception thrown: %s", (uint8_t *)&a9, 0x30u);
      }
    }
    objc_end_catch();
    JUMPOUT(0x215C8A15CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_215C8A2F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, __int128 a13, uint64_t a14)
{
  const char *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  const char *Name;
  uint64_t v19;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(exception_object);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        Name = sel_getName(v14);
        v19 = objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        LODWORD(a9) = 136316162;
        *(_QWORD *)((char *)&a9 + 4) = v16;
        WORD6(a9) = 2080;
        *(_QWORD *)((char *)&a9 + 14) = "+[GKConnection externalAddressForCDXSelfConnectionData:]";
        a12 = 1024;
        LODWORD(a13) = 367;
        WORD2(a13) = 2080;
        *(_QWORD *)((char *)&a13 + 6) = Name;
        HIWORD(a13) = 2080;
        a14 = v19;
        _os_log_error_impl(&dword_215C5C000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d +[GKConnection %s]: Exception thrown: %s", (uint8_t *)&a9, 0x30u);
      }
    }
    objc_end_catch();
    JUMPOUT(0x215C8A2C4);
  }
  _Unwind_Resume(exception_object);
}

void GCKEventListenerForGKConnection(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v6;
      v11 = 2080;
      v12 = "GCKEventListenerForGKConnection";
      v13 = 1024;
      v14 = 158;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKEventListenerForGKConnection", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(a1, "addEvent:remotePeer:", a3, a2);

}

void sub_215C8CA14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C8D50C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C8DDC8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_215C8E178(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(exception_object);
}

void sub_215C8FB9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C8FC2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C8FF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_215C90350(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C906FC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_215C90D94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C912E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C919F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

dispatch_object_t dispatch_value_callback_retain(int a1, dispatch_object_t object)
{
  dispatch_retain(object);
  return object;
}

void dispatch_value_callback_release(int a1, dispatch_object_t object)
{
  dispatch_release(object);
}

id GCKGameConnectivityKitBundle()
{
  id result;

  result = (id)GCKGameConnectivityKitBundle_cachedBundle;
  if (!GCKGameConnectivityKitBundle_cachedBundle)
  {
    result = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    GCKGameConnectivityKitBundle_cachedBundle = (uint64_t)result;
  }
  return result;
}

void AGPNetworkEventListener(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  GCKOOBMessage *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v7 = a1;
  if (*(_DWORD *)a3 != 5)
  {
    if (*(_DWORD *)a3 == 7)
    {
      v10 = *(_OWORD *)a3;
      v11 = *(_QWORD *)(a3 + 16);
      v8 = objc_alloc_init(GCKOOBMessage);
      v8->type = 1000;
      v8->band = *(_DWORD *)(a3 + 20);
      v8->data = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *(_QWORD *)(a3 + 8), *(int *)(a3 + 16), v10, v11);
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 0, 0);
      LODWORD(v11) = objc_msgSend(v9, "length");
      *((_QWORD *)&v10 + 1) = objc_msgSend(v9, "bytes");
      AGPSessionEvent(objc_msgSend(a1, "agpSessionRef"), a2, &v10);

    }
    else
    {
      AGPSessionEvent(objc_msgSend(a1, "agpSessionRef"), a2, (__int128 *)a3);
    }
  }

}

void GKNetworkEventListener(void *a1, uint64_t a2, __int128 *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD *v13;
  objc_class *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  __int128 v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v21 = *a3;
  v22 = *((_QWORD *)a3 + 2);
  if (*(_DWORD *)a3 == 6)
  {
    HIDWORD(v22) = 0;
    v7 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *((_QWORD *)a3 + 1), *((int *)a3 + 4));
    if (!v7)
      goto LABEL_18;
    v8 = v7;
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0, v21, v22);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v8, 0);
    v13 = (id)objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x24BDD0E88]);
    objc_msgSend(v12, "finishDecoding");

    if (!v13)
      goto LABEL_13;
    v14 = (objc_class *)objc_opt_class();
    if (v14 == objc_getClass("GCKOOBMessage") && objc_msgSend(v13, "data"))
    {
      if (v13[2] == 1000)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v24 = v16;
            v25 = 2080;
            v26 = "GKNetworkEventListener";
            v27 = 1024;
            v28 = 1420;
            _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oobMessage of type GCKOOBInternal", buf, 0x1Cu);
          }
        }
        LODWORD(v22) = objc_msgSend((id)objc_msgSend(v13, "data"), "length");
        *((_QWORD *)&v21 + 1) = objc_msgSend((id)objc_msgSend(v13, "data"), "bytes");
        HIDWORD(v22) = objc_msgSend(v13, "band");
LABEL_13:
        v15 = 1;
        goto LABEL_14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x24BDFDC28];
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
        v15 = 0;
        if (!v20)
        {
LABEL_14:
          if (!v15)
            goto LABEL_16;
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315650;
        v24 = v18;
        v25 = 2080;
        v26 = "GKNetworkEventListener";
        v27 = 1024;
        v28 = 1428;
        _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oobMessage w/unrecognized type...", buf, 0x1Cu);
      }
    }
    v15 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:
  objc_msgSend(a1, "sendCallbacksToDelegate:remotePeer:", &v21, a2);
LABEL_16:
  if (v13)

LABEL_18:
}

void sub_215C9D2E0(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_215C9D318(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, int a19)
{
  uint64_t v19;
  NSObject *v20;

  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(a1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315650;
          *(_QWORD *)((char *)&buf + 4) = v19;
          WORD6(buf) = 2080;
          *(_QWORD *)((char *)&buf + 14) = "GKNetworkEventListener";
          a18 = 1024;
          a19 = 1407;
          _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oob event with unrecognized message archive...", (uint8_t *)&buf, 0x1Cu);
        }
      }
      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x215C9D0C4);
  }
  JUMPOUT(0x215C9D310);
}

id NSStringCreateTruncatedStringWithMaxBytesInUTF8Encoding(void *a1)
{
  const char *v1;
  uint64_t v3;
  int v4;

  v1 = (const char *)objc_msgSend(a1, "UTF8String");
  if ((int)strlen(v1) < 41)
    return a1;
  v3 = 40;
  do
    v4 = v1[v3--] & 0xC0;
  while (v4 == 128);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v1, v3 + 1, 4);
}

uint64_t gkResolveCallback(uint64_t a1, int a2, uint64_t a3, int a4, const char *a5, const char *a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10)
{
  int ErrorLogLevelForModule;
  os_log_t *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  uint64_t v26;
  unsigned int v27;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[10];
  const char *v37;
  _BYTE v38[6];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v18 = (os_log_t *)MEMORY[0x24BDFDC28];
  v27 = __rev16(a7);
  if (ErrorLogLevelForModule >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317698;
      v30 = v19;
      v31 = 2080;
      v32 = "gkResolveCallback";
      v33 = 1024;
      v34 = 4442;
      v35 = 1024;
      *(_DWORD *)v36 = a1;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = a2;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = a3;
      HIWORD(v37) = 1024;
      *(_DWORD *)v38 = a4;
      *(_WORD *)&v38[4] = 2080;
      v39 = a5;
      v40 = 2080;
      v41 = a6;
      v42 = 1024;
      v43 = v27;
      v44 = 1024;
      v45 = a8;
      _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceResolve callback: Ref=%x, Flags=%x, IFIndex=%d, ErrorType=%d fullname=%s hosttarget=%s port=%u txtLen=%u", buf, 0x54u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "null";
      *(_DWORD *)buf = 136316674;
      if (a5)
        v24 = a5;
      else
        v24 = "null";
      v30 = v21;
      v31 = 2080;
      v32 = "gkResolveCallback";
      if (a6)
        v23 = a6;
      v33 = 1024;
      v34 = 4444;
      v35 = 2080;
      *(_QWORD *)v36 = v24;
      *(_WORD *)&v36[8] = 2080;
      v37 = v23;
      *(_WORD *)v38 = 1024;
      *(_DWORD *)&v38[2] = v27;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = a4;
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************* fullname: %s, hosttarget: %s port: %u error: %d", buf, 0x3Cu);
    }
  }
  BYTE4(v26) = a2 & 1;
  LODWORD(v26) = a4;
  return objc_msgSend((id)objc_msgSend(a10, "session"), "didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:", a1, a10, a6, v27, a3, a8, a9, v26);
}

uint64_t gkRegisterCallback(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136317186;
      v18 = v14;
      v19 = 2080;
      v20 = "gkRegisterCallback";
      v21 = 1024;
      v22 = 3714;
      v23 = 1024;
      v24 = a1;
      v25 = 1024;
      v26 = a2;
      v27 = 1024;
      v28 = a3;
      v29 = 2080;
      v30 = a4;
      v31 = 2080;
      v32 = a5;
      v33 = 2080;
      v34 = a6;
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceRegister callback: Ref=%x, Flags=%x, ErrorType=%d name=%s regtype=%s domain=%s", (uint8_t *)&v17, 0x4Cu);
    }
  }
  return objc_msgSend(a7, "didPublishWithError:", a3);
}

uint64_t gkQueryRecordCallback(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9, int a10, void *a11)
{
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  char v48[16];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  memset(v48, 170, sizeof(v48));
  if (!if_indextoname(a3, v48))
    v48[0] = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318210;
      v23 = v17;
      v24 = 2080;
      v25 = "gkQueryRecordCallback";
      v26 = 1024;
      v27 = 3904;
      v28 = 1024;
      v29 = a1;
      v30 = 1024;
      v31 = a2;
      v32 = 1024;
      v33 = a3;
      v34 = 2080;
      v35 = v48;
      v36 = 1024;
      v37 = a4;
      v38 = 2080;
      v39 = a5;
      v40 = 1024;
      v41 = a6;
      v42 = 1024;
      v43 = a7;
      v44 = 1024;
      v45 = a8;
      v46 = 1024;
      v47 = a10;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceQueryRecord callback: Ref=%x, Flags=%x, IFIndex=%d (name=[%s]), ErrorType=%d fullname=%s rrtype=%u rrclass=%u rdlen=%u ttl=%u", buf, 0x60u);
    }
  }
  return objc_msgSend((id)objc_msgSend(a11, "session"), "didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:", a11, v48, a8, a9, a4, a2 & 1);
}

uint64_t gkBrowseCallback(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16;
  NSObject *v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  uint64_t v32;
  _BYTE v33[10];
  _BYTE v34[6];
  _BYTE v35[10];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  char v39[16];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  memset(v39, 170, sizeof(v39));
  if (!if_indextoname(a3, v39))
    v39[0] = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136317698;
      v25 = v16;
      v26 = 2080;
      v27 = "gkBrowseCallback";
      v28 = 1024;
      v29 = 4106;
      v30 = 1024;
      *(_DWORD *)v31 = a1;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = a2;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = a3;
      HIWORD(v32) = 2080;
      *(_QWORD *)v33 = v39;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)v34 = a4;
      *(_WORD *)&v34[4] = 2080;
      *(_QWORD *)v35 = a5;
      *(_WORD *)&v35[8] = 2080;
      v36 = a6;
      v37 = 2080;
      v38 = a7;
      _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceBrowse callback: Ref=%x, Flags=%x, IFIndex=%d (name=[%s]), ErrorType=%d name=%s regtype=%s domain=%s", (uint8_t *)&v24, 0x5Cu);
    }
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((a2 & 2) != 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136317186;
        v25 = v22;
        v26 = 2080;
        v27 = "gkBrowseCallback";
        v28 = 1024;
        v29 = 4111;
        v30 = 2080;
        *(_QWORD *)v31 = a5;
        *(_WORD *)&v31[8] = 2080;
        v32 = a6;
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = a7;
        *(_WORD *)v34 = 1024;
        *(_DWORD *)&v34[2] = a3;
        *(_WORD *)v35 = 2080;
        *(_QWORD *)&v35[2] = v39;
        LOWORD(v36) = 1024;
        *(_DWORD *)((char *)&v36 + 2) = a4;
        _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse add: [%s][%s][%s] from %d [%s] (%d)", (uint8_t *)&v24, 0x50u);
      }
    }
    return objc_msgSend(a8, "didFindService:fromIF:withError:moreComing:", a5, v39, a4, a2 & 1);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136317186;
        v25 = v19;
        v26 = 2080;
        v27 = "gkBrowseCallback";
        v28 = 1024;
        v29 = 4114;
        v30 = 2080;
        *(_QWORD *)v31 = a5;
        *(_WORD *)&v31[8] = 2080;
        v32 = a6;
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = a7;
        *(_WORD *)v34 = 1024;
        *(_DWORD *)&v34[2] = a3;
        *(_WORD *)v35 = 2080;
        *(_QWORD *)&v35[2] = v39;
        LOWORD(v36) = 1024;
        *(_DWORD *)((char *)&v36 + 2) = a4;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse rmv: [%s][%s][%s] from %d [%s] (%d)", (uint8_t *)&v24, 0x50u);
      }
    }
    return objc_msgSend(a8, "didRemoveService:fromIF:withError:moreComing:", a5, v39, a4, a2 & 1);
  }
}

void hostnameLookupCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v21 = v15;
      v22 = 2080;
      v23 = "hostnameLookupCallback";
      v24 = 1024;
      v25 = 4317;
      v26 = 1024;
      *(_DWORD *)v27 = a1;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a2;
      v28 = 1024;
      v29 = a3;
      v30 = 1024;
      v31 = a4;
      v32 = 2080;
      v33 = a5;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceGetAddrInfo callback: Ref=%x, Flags=%x, IFIndex=%d, ErrorType=%d hostname=%s", buf, 0x3Eu);
    }
  }
  if (*(_BYTE *)(a6 + 1) == 2)
  {
    LOBYTE(v19) = a2 & 1;
    objc_msgSend((id)objc_msgSend(a8, "session"), "didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:", a1, a8, a5, a6, a3, a4, v19);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v17;
      v22 = 2080;
      v23 = "hostnameLookupCallback";
      v24 = 1024;
      v25 = 4320;
      v26 = 2080;
      *(_QWORD *)v27 = a5;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hostname lookup got non-AF_INET address for %s", buf, 0x26u);
    }
  }
}

void sub_215CA7278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint8_t buf)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215CA7F34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215CAB700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215CADBEC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_215CB0464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __hasMicPermission_block_invoke(uint64_t a1, int a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t OSPFProcessDynamicOption(_DWORD *a1, unsigned __int8 *a2, timeval *a3)
{
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  __darwin_time_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  __darwin_time_t v22;
  unint64_t v23;
  timeval v24[2];

  if (a2)
  {
    v4 = *a2;
    if (v4 == 13)
    {
      if (a2[3] == 1)
      {
        memset(v24, 170, sizeof(v24));
        v23 = 0xAAAAAAAAAAAAAAAALL;
        v10 = a2[2];
        if (v10 <= 5 && ((1 << v10) & 0x36) != 0)
        {
          if (!OSPFReadTimeval((unint64_t *)(a2 + 4), 4 * a2[1], (uint64_t)&v24[1]))
            goto LABEL_33;
          if (!a3)
          {
            a3 = v24;
            if (gettimeofday(v24, 0))
              goto LABEL_33;
          }
          v13 = a3->tv_sec - v24[1].tv_sec;
          v22 = v13;
          v14 = a3->tv_usec - v24[1].tv_usec;
          LODWORD(v23) = v14;
          if (v14 < 0)
          {
            v22 = v13 - 1;
            LODWORD(v23) = v14 + 1000000;
          }
          if (!OSPFWriteTimeval(a2 + 4, 4 * a2[1], (uint64_t)&v22))
          {
LABEL_33:
            v9 = 0;
            v6 = 1;
            goto LABEL_34;
          }
          v10 = a2[2];
        }
        if (v10 - 1 <= 4)
        {
          v6 = 0;
          v9 = v10 + 1;
          goto LABEL_34;
        }
      }
      return 0;
    }
    if (v4 != 14 || a2[3] != 1)
      return 0;
    v5 = a2[2];
    if (v5 != 2)
    {
      if (v5 == 1)
      {
        if (a2[1] >= 2u)
        {
          v6 = 0;
          v7 = a1[4];
          v8 = v7 - a1[6];
          a1[6] = v7;
          *((_DWORD *)a2 + 1) = bswap32(v7);
          *((_DWORD *)a2 + 2) = bswap32(v8);
          v9 = 2;
LABEL_34:
          a2[2] = v9;
          return v6;
        }
        return 1;
      }
      return 0;
    }
    if (a2[1] < 2u)
      return 1;
    v15 = bswap32(*((_DWORD *)a2 + 1));
    v16 = bswap32(*((_DWORD *)a2 + 2));
    v17 = a1[5];
    if (v15 - v16 != v17)
    {
      if (v15 - v16 <= v17)
      {
        v16 = 0;
        v20 = 0;
        goto LABEL_35;
      }
      v16 = v15 - v17;
    }
    v18 = a1[7];
    v19 = v15 >= v18;
    v20 = v15 - v18;
    if (!v19)
      v20 = 0;
    a1[7] = v15;
    a1[5] = v15;
LABEL_35:
    *((_DWORD *)a2 + 1) = bswap32(v16);
    *((_DWORD *)a2 + 2) = bswap32(v20);
    a2[2] = 3;
    if (v20)
    {
      v6 = 0;
      a1[9] += v20;
      return v6;
    }
    return 0;
  }
  return 0;
}

uint64_t OSPFReadTimeval(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  __int128 v6;
  int v7;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  int v9;
  void (__cdecl *v10)(__rpc_xdr *);
  unint64_t v11;
  char v12[8];
  XDR v13;
  int64_t v14;
  int64_t v15;

  result = 0;
  v14 = 0;
  v15 = 0;
  if (a2 >= 0x10 && a1 && a3)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v13.x_public = v6;
    *(_OWORD *)&v13.x_base = v6;
    *(_OWORD *)&v13.x_op = v6;
    v11 = bswap64(*a1);
    xdrmem_create(&v13, (char *)&v11, 8u, XDR_DECODE);
    v7 = xdr_int64_t(&v13, &v15);
    x_destroy = v13.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&v13);
    *(_QWORD *)v12 = bswap64(a1[1]);
    xdrmem_create(&v13, v12, 8u, XDR_DECODE);
    v9 = xdr_int64_t(&v13, &v14);
    v10 = v13.x_ops->x_destroy;
    if (v10)
      ((void (*)(XDR *))v10)(&v13);
    result = 0;
    if (v7)
    {
      if (v9)
      {
        *(_QWORD *)a3 = v15;
        *(_DWORD *)(a3 + 8) = v14;
        return 1;
      }
    }
  }
  return result;
}

uint64_t OSPFWriteTimeval(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  __int128 v5;
  int v6;
  void (__cdecl *x_destroy)(__rpc_xdr *);
  int64_t v8;
  int v9;
  void (__cdecl *v10)(__rpc_xdr *);
  int64_t v11;
  unint64_t v12;
  int v13;
  int64_t v15;
  int64_t v16;
  XDR v17;
  char v18[8];
  char v19[8];
  char v20[24];
  uint64_t v21;

  result = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v18 = 0;
  *(_QWORD *)v19 = 0;
  if (a1 && a3)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v17.x_public = v5;
    *(_OWORD *)&v17.x_base = v5;
    *(_OWORD *)&v17.x_op = v5;
    v16 = *(_QWORD *)a3;
    v15 = *(int *)(a3 + 8);
    xdrmem_create(&v17, v18, 8u, XDR_ENCODE);
    v6 = xdr_int64_t(&v17, &v16);
    x_destroy = v17.x_ops->x_destroy;
    if (x_destroy)
      ((void (*)(XDR *))x_destroy)(&v17);
    memset(v20, 170, 17);
    v13 = v6;
    if (v6)
    {
      v8 = v16;
      __sprintf_chk(v20, 0, 0x11uLL, "%02X", HIBYTE(v16));
      __sprintf_chk(&v20[2], 0, 0xFuLL, "%02X", BYTE6(v8));
      __sprintf_chk(&v20[4], 0, 0xDuLL, "%02X", BYTE5(v8));
      __sprintf_chk(&v20[6], 0, 0xBuLL, "%02X", BYTE4(v8));
      __sprintf_chk(&v20[8], 0, 9uLL, "%02X", BYTE3(v8));
      __sprintf_chk(&v20[10], 0, 7uLL, "%02X", BYTE2(v8));
      __sprintf_chk(&v20[12], 0, 5uLL, "%02X", BYTE1(v8));
      __sprintf_chk(&v20[14], 0, 3uLL, "%02X", v8);
      v20[16] = 0;
    }
    xdrmem_create(&v17, v19, 8u, XDR_ENCODE);
    v9 = xdr_int64_t(&v17, &v15);
    v10 = v17.x_ops->x_destroy;
    if (v10)
      ((void (*)(XDR *))v10)(&v17);
    if (v9)
    {
      v11 = v15;
      __sprintf_chk(v20, 0, 0x11uLL, "%02X", HIBYTE(v15));
      __sprintf_chk(&v20[2], 0, 0xFuLL, "%02X", BYTE6(v11));
      __sprintf_chk(&v20[4], 0, 0xDuLL, "%02X", BYTE5(v11));
      __sprintf_chk(&v20[6], 0, 0xBuLL, "%02X", BYTE4(v11));
      __sprintf_chk(&v20[8], 0, 9uLL, "%02X", BYTE3(v11));
      __sprintf_chk(&v20[10], 0, 7uLL, "%02X", BYTE2(v11));
      __sprintf_chk(&v20[12], 0, 5uLL, "%02X", BYTE1(v11));
      __sprintf_chk(&v20[14], 0, 3uLL, "%02X", v11);
      result = 0;
      if (a2 >= 0x10)
      {
        if (v13)
        {
          v12 = bswap64(*(unint64_t *)v19);
          *a1 = bswap64(*(unint64_t *)v18);
          a1[1] = v12;
          return 1;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t OSPFMakeHello(_QWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  char *v8;
  uint64_t v9;
  unsigned int v10;

  v8 = (char *)malloc_type_calloc(1uLL, 0x22uLL, 0xB6FAA202uLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = 0;
  LOWORD(v10) = 0;
  *(_WORD *)v8 = 449;
  *(_DWORD *)(v8 + 2) = 50340352;
  *((_DWORD *)v8 + 2) = bswap32(a3);
  *((_DWORD *)v8 + 3) = bswap32(a4);
  *((_WORD *)v8 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  *(_DWORD *)(v8 + 18) = 268435960;
  *(_DWORD *)(v8 + 22) = 523;
  *(_QWORD *)(v8 + 26) = bswap64(*(_QWORD *)(a2 + 16));
  do
    v10 = CRC16Table[(v8[v9++] ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
  while (v9 != 34);
  *((_WORD *)v8 + 3) = bswap32(v10) >> 16;
  *a1 = v8;
  return 34;
}

uint64_t OSPFMakeHeartbeat(_QWORD *a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  _DWORD *v10;
  uint64_t v11;
  unsigned int v12;

  v10 = malloc_type_calloc(1uLL, 0x14uLL, 0xF6A69FCuLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = 0;
  LOWORD(v12) = 0;
  *(_WORD *)v10 = 2241;
  *(_DWORD *)((char *)v10 + 2) = 5120;
  v10[2] = bswap32(a2);
  v10[3] = bswap32(a3);
  *((_WORD *)v10 + 8) = (a4 != 0) << 9;
  *((_WORD *)v10 + 9) = __rev16(a5);
  do
    v12 = CRC16Table[(*((_BYTE *)v10 + v11++) ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
  while (v11 != 20);
  *((_WORD *)v10 + 3) = bswap32(v12) >> 16;
  *a1 = v10;
  return 20;
}

uint64_t OSPFMakeDD(Bytef **a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Bytef *v17;
  Bytef *v18;
  uint64_t v19;
  _WORD *v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unsigned int *v27;
  unsigned int v28;
  uint64_t v29;
  Bytef **v30;
  unsigned int v31;
  uint64_t v32;
  Bytef *v33;
  char v34;
  uint64_t v36;
  Bytef **v37;
  int v38;
  unsigned int v39;
  Bytef *v40;

  v10 = *(unsigned int *)(a2 + 12);
  v11 = *(_QWORD *)(a2 + 16);
  if ((int)v10 < 1)
  {
    v12 = 0;
    v13 = 2;
  }
  else
  {
    v12 = 0;
    v13 = 2;
    v14 = *(unsigned int *)(a2 + 12);
    v15 = *(_QWORD *)(a2 + 16);
    do
    {
      if (*(_DWORD *)v15 != a5)
      {
        v13 += *(unsigned __int8 *)(v15 + 8) + 8 * *(_DWORD *)(v15 + 284) + 9;
        ++v12;
      }
      v15 += 480;
      --v14;
    }
    while (v14);
  }
  v16 = (v13 + 16);
  v17 = (Bytef *)malloc_type_calloc(1uLL, (int)v16, 0x8EFA3056uLL);
  if (!v17)
    return 0xFFFFFFFFLL;
  v18 = v17;
  v38 = a6;
  v36 = v16;
  v37 = a1;
  *(_WORD *)v17 = 705;
  *((_WORD *)v17 + 1) = bswap32(v16) >> 16;
  *((_DWORD *)v17 + 2) = bswap32(a4);
  *((_DWORD *)v17 + 3) = bswap32(a5);
  *((_WORD *)v17 + 8) = bswap32(v12) >> 16;
  if ((int)v10 >= 1)
  {
    v19 = 0;
    v20 = v17 + 18;
    v21 = (unsigned int *)(v11 + 292);
    do
    {
      v22 = *(_DWORD *)(v11 + 480 * v19);
      if (v22 != a5)
      {
        v23 = v11 + 480 * v19;
        v24 = *(unsigned int *)(v23 + 284);
        *(_DWORD *)v20 = bswap32(v22);
        v20[2] = bswap32(*(unsigned __int16 *)(v23 + 272)) >> 16;
        *((_BYTE *)v20 + 6) = *(_BYTE *)(v23 + 8);
        v25 = (char *)v20 + 7;
        memcpy((char *)v20 + 7, (const void *)(v23 + 9), *(unsigned __int8 *)(v23 + 8));
        v26 = &v25[*(unsigned __int8 *)(v23 + 8)];
        *(_WORD *)v26 = bswap32(v24) >> 16;
        v20 = v26 + 2;
        if ((int)v24 >= 1)
        {
          v27 = v21;
          do
          {
            *(_DWORD *)v20 = bswap32(*(v27 - 1));
            v28 = *v27;
            v27 += 3;
            *((_DWORD *)v20 + 1) = bswap32(v28);
            v20 += 4;
            --v24;
          }
          while (v24);
        }
      }
      ++v19;
      v21 += 120;
    }
    while (v19 != v10);
  }
  if (v38)
  {
    v40 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
    v39 = -1431655766;
    v29 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v18, v36))
    {
      free(v18);
      v18 = v40;
      v29 = v39;
    }
    v30 = v37;
  }
  else
  {
    v29 = v36;
    v30 = v37;
  }
  if ((int)v29 < 1)
  {
    v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    v32 = v29;
    v33 = v18;
    do
    {
      v34 = *v33++;
      v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  *((_WORD *)v18 + 3) = bswap32(v31) >> 16;
  *v30 = v18;
  return v29;
}

uint64_t ospfTryCompressPacket(Bytef **a1, unsigned int *a2, uint64_t a3, signed int a4)
{
  signed int v7;
  uLong v8;
  Bytef *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned __int16 v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t result;
  const char *v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  const char *v24;
  uLongf destLen;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BYTE v34[10];
  _BYTE v35[10];
  __int16 v36;
  signed int v37;
  __int16 v38;
  uLong v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a4 - 16;
  v8 = compressBound(a4 - 16);
  destLen = v8;
  v9 = (Bytef *)malloc_type_malloc(v8 + 18, 0xCE0E22E0uLL);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v28 = v10;
      v29 = 2080;
      v30 = "ospfTryCompressPacket";
      v31 = 1024;
      v32 = 628;
      v33 = 1024;
      *(_DWORD *)v34 = 16;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = 2;
      *(_WORD *)v35 = 2048;
      *(_QWORD *)&v35[2] = v8;
      v36 = 1024;
      v37 = v7;
      v38 = 2048;
      v39 = v8 + 18;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ospfTryCompressPacket: %u + %u + %lu(%d) = %lu", buf, 0x42u);
    }
  }
  if (!v9)
    return 1;
  if (compress2(v9 + 18, &destLen, (const Bytef *)(a3 + 16), v7, 9) || (v12 = destLen, (int)destLen + 2 >= v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(unsigned __int8 *)(a3 + 1);
        v24 = "OSPF";
        if (v23 == 3)
          v24 = "LSA";
        *(_DWORD *)buf = 136316418;
        v28 = v21;
        v29 = 2080;
        v30 = "ospfTryCompressPacket";
        if (v23 == 2)
          v24 = "DD";
        v31 = 1024;
        v32 = 645;
        v33 = 2080;
        *(_QWORD *)v34 = v24;
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)v35 = v7;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = destLen;
        _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s compressed body %u => %u+2 (not performed)", buf, 0x32u);
      }
    }
    free(v9);
    return 1;
  }
  *(_OWORD *)v9 = *(_OWORD *)a3;
  *((_WORD *)v9 + 8) = bswap32(v7) >> 16;
  *((_WORD *)v9 + 2) = 256;
  v13 = v12 + 18;
  *((_WORD *)v9 + 1) = bswap32(v13) >> 16;
  *a1 = v9;
  *a2 = v13;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v16)
      return result;
    v18 = "OSPF";
    v19 = *(unsigned __int8 *)(a3 + 1);
    v20 = *a2;
    if (v19 == 3)
      v18 = "LSA";
    *(_DWORD *)buf = 136316930;
    v28 = v14;
    v29 = 2080;
    v30 = "ospfTryCompressPacket";
    if (v19 == 2)
      v18 = "DD";
    v31 = 1024;
    v32 = 642;
    v33 = 2080;
    *(_QWORD *)v34 = v18;
    *(_WORD *)&v34[8] = 1024;
    *(_DWORD *)v35 = v7;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = v12;
    v36 = 1024;
    v37 = a4;
    v38 = 1024;
    LODWORD(v39) = v20;
    _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s compressed body %u => %u+2, total size: %d => %d", buf, 0x3Eu);
  }
  return 0;
}

uint64_t OSPFMakeLSA(Bytef **a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v6;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Bytef *v18;
  Bytef *v19;
  uint64_t v20;
  _WORD *v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned int *v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  Bytef *v33;
  char v34;
  uint64_t v36;
  int v37;
  Bytef **v38;
  unsigned int v39;
  Bytef *v40;

  v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1)
    return 0xFFFFFFFFLL;
  v11 = 0;
  v12 = *(unsigned __int16 *)(a2 + 12);
  v13 = *(_QWORD *)(a2 + 24);
  v14 = 4;
  v15 = *(unsigned int *)(a2 + 16);
  v16 = v13;
  do
  {
    if (*(_DWORD *)v16 != a5 && *(_DWORD *)(v16 + 276) && *(_DWORD *)(v16 + 280) != a5)
    {
      v14 += *(unsigned __int8 *)(v16 + 8) + 8 * *(_DWORD *)(v16 + 284) + 9;
      ++v11;
    }
    v16 += 480;
    --v15;
  }
  while (v15);
  if (!(_WORD)v11)
    return 0xFFFFFFFFLL;
  v17 = (v14 + 16);
  v18 = (Bytef *)malloc_type_calloc(1uLL, (int)v17, 0x973799F8uLL);
  if (!v18)
    return 0xFFFFFFFFLL;
  v19 = v18;
  v37 = a6;
  v38 = a1;
  v20 = 0;
  *(_WORD *)v18 = 961;
  v36 = v17;
  *((_WORD *)v18 + 1) = bswap32(v17) >> 16;
  *((_DWORD *)v18 + 2) = bswap32(a4);
  *((_DWORD *)v18 + 3) = bswap32(a5);
  *((_WORD *)v18 + 8) = __rev16(v12);
  *((_WORD *)v18 + 9) = bswap32(v11) >> 16;
  v21 = v18 + 20;
  v22 = (unsigned int *)(v13 + 292);
  do
  {
    v23 = *(_DWORD *)(v13 + 480 * v20);
    if (v23 != a5)
    {
      if (*(_DWORD *)(v13 + 480 * v20 + 276))
      {
        if (*(_DWORD *)(v13 + 480 * v20 + 280) != a5)
        {
          v24 = v13 + 480 * v20;
          v25 = *(unsigned int *)(v24 + 284);
          *(_DWORD *)v21 = bswap32(v23);
          v21[2] = bswap32(*(unsigned __int16 *)(v24 + 272)) >> 16;
          *((_BYTE *)v21 + 6) = *(_BYTE *)(v24 + 8);
          v26 = (char *)v21 + 7;
          memcpy((char *)v21 + 7, (const void *)(v24 + 9), *(unsigned __int8 *)(v24 + 8));
          v27 = &v26[*(unsigned __int8 *)(v24 + 8)];
          *(_WORD *)v27 = bswap32(v25) >> 16;
          v21 = v27 + 2;
          if ((int)v25 >= 1)
          {
            v28 = v22;
            do
            {
              *(_DWORD *)v21 = bswap32(*(v28 - 1));
              v29 = *v28;
              v28 += 3;
              *((_DWORD *)v21 + 1) = bswap32(v29);
              v21 += 4;
              --v25;
            }
            while (v25);
          }
        }
      }
    }
    ++v20;
    v22 += 120;
  }
  while (v20 != v6);
  if (v37)
  {
    v40 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
    v39 = -1431655766;
    v30 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v19, v36))
    {
      free(v19);
      v19 = v40;
      v30 = v39;
    }
  }
  else
  {
    v30 = v36;
  }
  if ((int)v30 < 1)
  {
    v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    v32 = v30;
    v33 = v19;
    do
    {
      v34 = *v33++;
      v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  *((_WORD *)v19 + 3) = bswap32(v31) >> 16;
  *v38 = v19;
  return v30;
}

uint64_t OSPFMakeLSAACK(_QWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  _DWORD *v9;
  uint64_t v10;
  unsigned int v11;

  v9 = malloc_type_calloc(1uLL, 0x12uLL, 0x87F1BE7uLL);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = 0;
  LOWORD(v11) = 0;
  *v9 = 301991105;
  v9[2] = bswap32(a4);
  v9[3] = bswap32(a5);
  *((_WORD *)v9 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  do
    v11 = CRC16Table[(*((_BYTE *)v9 + v10++) ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
  while (v10 != 18);
  *((_WORD *)v9 + 3) = bswap32(v11) >> 16;
  *a1 = v9;
  return 18;
}

uint64_t OSPFMakeData(char *a1, int a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, unsigned int *a7, uint64_t a8, uint64_t (*a9)(uint64_t, unsigned int *, uint64_t, char *, _QWORD, _QWORD, _QWORD, _QWORD, unsigned __int16), uint64_t a10, unsigned __int8 a11, unsigned __int8 a12, unsigned __int8 a13)
{
  int v13;
  unsigned int *v14;
  char *v19;
  char *v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _WORD *v24;
  char v25;
  uint64_t v26;
  _DWORD *v27;
  unsigned int v28;
  uint64_t v29;
  char v30;

  v13 = a8;
  v14 = a7;
  v19 = a1;
  v20 = &a1[4 * (int)a8];
  if (a9)
  {
    v21 = a9(a10, a7, a8, v20 + 12, (1488 - 4 * a8), *(_QWORD *)a3, *(unsigned int *)(a3 + 8), a11, __PAIR16__(a13, a12));
    if (v21 < 0)
    {
      v22 = 0;
      v23 = 0;
      *((_WORD *)v19 + 2) = 0;
      v24 = v19 + 6;
LABEL_18:
      *v24 = bswap32(v23) >> 16;
      return v22;
    }
  }
  else
  {
    v21 = 0;
  }
  v22 = (4 * v13 + v21 + *(_DWORD *)(a3 + 8) + 12);
  if ((int)v22 <= a2)
  {
    *v19 = v13 & 0xF | 0xC0;
    if (a5)
      v25 = 7;
    else
      v25 = 5;
    v19[1] = v25;
    *((_WORD *)v19 + 1) = bswap32(v22) >> 16;
    *((_DWORD *)v19 + 2) = bswap32(a6);
    if (v13 >= 1)
    {
      v26 = v13;
      v27 = v19 + 12;
      do
      {
        v28 = *v14++;
        *v27++ = bswap32(v28);
        --v26;
      }
      while (v26);
    }
    memcpy(&v20[v21 + 12], *(const void **)a3, *(int *)(a3 + 8));
    *((_DWORD *)v19 + 1) = 0;
    v24 = v19 + 6;
    if ((int)v22 < 1)
    {
      v23 = 0;
    }
    else
    {
      LOWORD(v23) = 0;
      v29 = v22;
      do
      {
        v30 = *v19++;
        v23 = CRC16Table[(v30 ^ v23)] ^ ((unsigned __int16)(v23 & 0xFF00) >> 8);
        --v29;
      }
      while (v29);
    }
    goto LABEL_18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t OSPFMakeAudio(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6, int a7)
{
  uint64_t v7;
  uint64_t v9;
  _DWORD *v10;
  unsigned int v11;
  unsigned int v12;
  char *v13;
  uint64_t v14;
  char v15;

  v7 = (*(_DWORD *)(a3 + 8) + 4 * a7 + 12);
  if ((int)v7 > a2)
    return 0xFFFFFFFFLL;
  *(_BYTE *)a1 = a7 & 0xF | 0xC0;
  *(_BYTE *)(a1 + 1) = 6;
  *(_WORD *)(a1 + 2) = bswap32(v7) >> 16;
  *(_DWORD *)(a1 + 8) = bswap32(a5);
  if (a7 >= 1)
  {
    v9 = a7;
    v10 = (_DWORD *)(a1 + 12);
    do
    {
      v11 = *a6++;
      *v10++ = bswap32(v11);
      --v9;
    }
    while (v9);
  }
  memcpy((void *)(a1 + 4 * a7 + 12), *(const void **)a3, *(int *)(a3 + 8));
  *(_DWORD *)(a1 + 4) = 0;
  if ((int)v7 < 1)
  {
    v12 = 0;
  }
  else
  {
    LOWORD(v12) = 0;
    v13 = (char *)a1;
    v14 = v7;
    do
    {
      v15 = *v13++;
      v12 = CRC16Table[(v15 ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
      --v14;
    }
    while (v14);
  }
  *(_WORD *)(a1 + 6) = bswap32(v12) >> 16;
  return v7;
}

uint64_t OSPFGetLength(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  BOOL v6;
  uint64_t result;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  char *v12;
  char v13;
  unsigned int v14;
  int ErrorLogLevelForModule;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (a2 <= 15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0xFFFFFFFFLL;
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return 0xFFFFFFFFLL;
    v33 = 136315650;
    v34 = v2;
    v35 = 2080;
    v36 = "OSPFGetLength";
    v37 = 1024;
    v38 = 921;
    v4 = " [%s] %s:%d OSPFGetLength: buffer is too short...";
LABEL_5:
    _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v33, 0x1Cu);
    return 0xFFFFFFFFLL;
  }
  v6 = (*(_BYTE *)a1 & 0xF0) != 0xC0 || (*(_BYTE *)a1 & 0xF) == 0;
  if (v6 || *(unsigned __int8 *)(a1 + 1) - 1 > 8)
    return 0xFFFFFFFFLL;
  result = bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
  if (result > a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0xFFFFFFFFLL;
    v8 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return 0xFFFFFFFFLL;
    v33 = 136315650;
    v34 = v8;
    v35 = 2080;
    v36 = "OSPFGetLength";
    v37 = 1024;
    v38 = 941;
    v4 = " [%s] %s:%d OSPFGetLength: Length doesn't fit in buffer ...";
    goto LABEL_5;
  }
  LOWORD(v9) = 0;
  v10 = *(unsigned __int16 *)(a1 + 6);
  *(_WORD *)(a1 + 6) = 0;
  v11 = a2;
  v12 = (char *)a1;
  do
  {
    v13 = *v12++;
    v9 = CRC16Table[(v13 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
    --v11;
  }
  while (v11);
  v14 = bswap32(v9) >> 16;
  *(_WORD *)(a1 + 6) = v14;
  if (v14 != v10)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v16 = (os_log_t *)MEMORY[0x24BDFDC28];
    if (ErrorLogLevelForModule >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315650;
        v34 = v17;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 948;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: bad checksum...", (uint8_t *)&v33, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315906;
        v34 = v19;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 949;
        v39 = 1024;
        v40 = v10;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: checksum == %04X NO...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(unsigned __int16 *)(a1 + 6);
        v33 = 136315906;
        v34 = v21;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 950;
        v39 = 1024;
        v40 = v23;
        _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: shouldbe == %04X OK...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(unsigned __int8 *)(a1 + 1);
        v33 = 136315906;
        v34 = v24;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 951;
        v39 = 1024;
        v40 = v26;
        _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: pkttype == %d ...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v29 = bswap32(*(unsigned __int16 *)(a1 + 4)) >> 16;
        v33 = 136315906;
        v34 = v27;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 952;
        v39 = 1024;
        v40 = v29;
        _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: flags == %04X ...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        v32 = bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
        v33 = 136315906;
        v34 = v30;
        v35 = 2080;
        v36 = "OSPFGetLength";
        v37 = 1024;
        v38 = 953;
        v39 = 1024;
        v40 = v32;
        _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: length == %d ...", (uint8_t *)&v33, 0x22u);
      }
    }
    *(_WORD *)(a1 + 6) = v10;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t OSPFParse_ParsePacketHeader(_WORD *a1, int a2, unsigned int **a3, _DWORD *a4)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  unsigned int *v13;
  char v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t i;
  uint64_t v20;

  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_1();
    }
    return 0;
  }
  if (a2 <= 15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_2();
    }
    return 0;
  }
  v8 = 0;
  LOWORD(v9) = 0;
  v10 = (unsigned __int16)a1[3];
  a1[3] = 0;
  do
    v9 = CRC16Table[(*((_BYTE *)a1 + v8++) ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
  while (a2 != v8);
  a1[3] = v10;
  if (__rev16(v10) != (unsigned __int16)v9)
    return 0;
  if ((*(_BYTE *)a1 & 0xF) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_3();
    }
    return 0;
  }
  v11 = 4 * (*(_BYTE *)a1 & 0xF);
  v12 = v11 + 12;
  if ((int)v11 + 12 > a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_4();
    }
    return 0;
  }
  v13 = (unsigned int *)malloc_type_malloc(v11 + 12, 0x2B35E4F2uLL);
  memcpy(v13, a1, v12);
  v14 = *(_BYTE *)v13;
  v15 = *((unsigned __int8 *)v13 + 1);
  if ((*(_BYTE *)v13 & 0xF0) == 0xC0)
  {
    if ((v15 - 1) >= 9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          OSPFParse_ParsePacketHeader_cold_6();
      }
LABEL_44:
      v20 = 0;
LABEL_23:
      free(v13);
      return v20;
    }
  }
  else if (v15 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_7();
    }
    goto LABEL_44;
  }
  v16 = *((unsigned __int16 *)v13 + 1);
  *((_WORD *)v13 + 3) = bswap32(*((unsigned __int16 *)v13 + 3)) >> 16;
  v17 = bswap32(v16) >> 16;
  *((_WORD *)v13 + 1) = v17;
  if (v17 != a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        OSPFParse_ParsePacketHeader_cold_5();
    }
    goto LABEL_44;
  }
  *((_WORD *)v13 + 2) = bswap32(*((unsigned __int16 *)v13 + 2)) >> 16;
  v13[2] = bswap32(v13[2]);
  v18 = v14 & 0xF;
  if ((_DWORD)v18)
  {
    for (i = 0; i < v18; ++i)
      v13[i + 3] = bswap32(v13[i + 3]);
  }
  if (a3)
  {
    *a3 = v13;
    v13 = 0;
  }
  if (a4)
    *a4 = v12;
  v20 = 1;
  if (v13)
    goto LABEL_23;
  return v20;
}

uint64_t _OSPFParse_ParseDecompress(uint64_t a1, const Bytef *a2, unsigned int a3, Bytef **a4, _DWORD *a5, _BYTE *a6)
{
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v18;
  _BOOL4 v19;
  uLongf v21;
  Bytef *v22;
  Bytef *v23;
  uLong v24;
  int v25;
  uLongf v26;
  int ErrorLogLevelForModule;
  uint64_t v28;
  NSObject *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  const char *v38;
  uLongf destLen;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (!a2 || !a4 || !a5 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    *(_DWORD *)buf = 136315650;
    v41 = v11;
    v42 = 2080;
    v43 = "_OSPFParse_ParseDecompress";
    v44 = 1024;
    v45 = 1139;
    v14 = " [%s] %s:%d Invalid parameter...";
    goto LABEL_11;
  }
  *a6 = 0;
  if ((*(_BYTE *)(a1 + 1) & 0xFE) != 2 || (*(_WORD *)(a1 + 4) & 1) == 0)
    return 1;
  if (a3 > 2)
  {
    v21 = bswap32(*(unsigned __int16 *)a2) >> 16;
    destLen = v21;
    v22 = (Bytef *)malloc_type_malloc(v21, 0x6D9F3B3AuLL);
    if (v22)
    {
      v23 = v22;
      v24 = a3 - 2;
      v25 = uncompress(v22, &destLen, a2 + 2, v24);
      v26 = destLen;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v25 || v26 != v21)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v35 = VRTraceErrorLogLevelToCSTR();
          v36 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v37 = *(unsigned __int8 *)(a1 + 1);
            v38 = "OSPF";
            if (v37 == 3)
              v38 = "LSA";
            *(_DWORD *)buf = 136316674;
            v41 = v35;
            v42 = 2080;
            v43 = "_OSPFParse_ParseDecompress";
            if (v37 == 2)
              v38 = "DD";
            v44 = 1024;
            v45 = 1172;
            v46 = 2080;
            v47 = v38;
            v48 = 1024;
            v49 = destLen;
            v50 = 1024;
            v51 = v21;
            v52 = 1024;
            v53 = v25;
            _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s uncompressed body (real %u =? %u) failed (%d)", buf, 0x38u);
          }
        }
        free(v23);
        return 0;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(unsigned __int8 *)(a1 + 1);
          v31 = "OSPF";
          if (v30 == 3)
            v31 = "LSA";
          *(_DWORD *)buf = 136316674;
          v41 = v28;
          v42 = 2080;
          v43 = "_OSPFParse_ParseDecompress";
          if (v30 == 2)
            v31 = "DD";
          v44 = 1024;
          v45 = 1176;
          v46 = 2080;
          v47 = v31;
          v48 = 1024;
          v49 = v24;
          v50 = 1024;
          v51 = destLen;
          v52 = 1024;
          v53 = v21;
          _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s uncompressed body %u+2 => %u (stated %u)", buf, 0x38u);
        }
      }
      *a4 = v23;
      *a5 = destLen;
      result = 1;
      *a6 = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x24BDFDC28];
      v34 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v34)
      {
        *(_DWORD *)buf = 136315906;
        v41 = v32;
        v42 = 2080;
        v43 = "_OSPFParse_ParseDecompress";
        v44 = 1024;
        v45 = 1166;
        v46 = 1024;
        LODWORD(v47) = v21;
        v14 = " [%s] %s:%d Failed to allocate packet size=%d";
        v15 = v33;
        v16 = 34;
        goto LABEL_12;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v18 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    v19 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v19)
    {
      *(_DWORD *)buf = 136315650;
      v41 = v18;
      v42 = 2080;
      v43 = "_OSPFParse_ParseDecompress";
      v44 = 1024;
      v45 = 1153;
      v14 = " [%s] %s:%d Size is too small...";
LABEL_11:
      v15 = v12;
      v16 = 28;
LABEL_12:
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      return 0;
    }
  }
  return result;
}

BOOL _OSPFParse_ParseExtractOptions(uint64_t a1, unsigned __int8 *a2, int a3, _QWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  _BOOL8 result;
  int v25;
  char *v29;
  int v30;
  unsigned __int8 *v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  int v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  int v53;
  uint64_t v54;
  NSObject *v55;
  int v56;
  int v57;
  int ErrorLogLevelForModule;
  uint64_t v59;
  NSObject *v60;
  _BOOL4 v61;
  int v62;
  int v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  int v70;
  uint32_t v71;
  uint64_t v72;
  NSObject *v73;
  int v74;
  int v75;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  __int16 v93;
  int v94;
  uint64_t v95;

  v6 = a1;
  v95 = *MEMORY[0x24BDAC8D0];
  *a6 = -1;
  if (a3 <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136315906;
        v78 = v7;
        v79 = 2080;
        v80 = "ospfVerifyOptions";
        v81 = 1024;
        v82 = 1027;
        v83 = 1024;
        v84 = v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: missing options info", buf, 0x22u);
      }
    }
    v10 = 1;
    goto LABEL_16;
  }
  if (*a2 != 248)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(unsigned __int8 *)(v6 + 1);
        v20 = *a2;
        *(_DWORD *)buf = 136316162;
        v78 = v17;
        v79 = 2080;
        v80 = "ospfVerifyOptions";
        v81 = 1024;
        v82 = 1032;
        v83 = 1024;
        v84 = v19;
        v85 = 1024;
        v86 = v20;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: expecting options info, got %d", buf, 0x28u);
      }
    }
    v10 = 2;
    goto LABEL_16;
  }
  v13 = __rev16(*((unsigned __int16 *)a2 + 1));
  if (v13 > a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136316418;
        v78 = v14;
        v79 = 2080;
        v80 = "ospfVerifyOptions";
        v81 = 1024;
        v82 = 1037;
        v83 = 1024;
        v84 = v16;
        v85 = 1024;
        v86 = v13;
        v87 = 1024;
        v88 = a3;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: body offset %d > %d", buf, 0x2Eu);
      }
    }
    v10 = 3;
    goto LABEL_16;
  }
  v29 = (char *)(a2 + 4);
  if (a2[1])
  {
    v30 = 0;
    v31 = a2 + 4;
    while (1)
    {
      v32 = (_DWORD)v31 - (_DWORD)a2;
      v33 = v13 - (v31 - a2);
      if (v33 <= 3)
      {
        v49 = a2[1];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v50 = VRTraceErrorLogLevelToCSTR();
          v51 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v52 = *(unsigned __int8 *)(a1 + 1);
            *(_DWORD *)buf = 136316418;
            v78 = v50;
            v79 = 2080;
            v80 = "ospfVerifyOptions";
            v81 = 1024;
            v82 = 1049;
            v83 = 1024;
            v84 = v52;
            v85 = 1024;
            v86 = v30;
            v6 = a1;
            v87 = 1024;
            v88 = v49;
            _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: option %d of %d: not enough option header", buf, 0x2Eu);
            v10 = 4;
            goto LABEL_16;
          }
        }
        v10 = 4;
        goto LABEL_52;
      }
      v34 = 4 * v31[1] + 4;
      if (v33 < v34)
        break;
      v31 += v34;
      if (a2[1] == ++v30)
      {
        v6 = a1;
        goto LABEL_28;
      }
    }
    v53 = a2[1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v54 = VRTraceErrorLogLevelToCSTR();
      v55 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v56 = *(unsigned __int8 *)(a1 + 1);
        *(_DWORD *)buf = 136317186;
        v78 = v54;
        v79 = 2080;
        v80 = "ospfVerifyOptions";
        v81 = 1024;
        v82 = 1055;
        v83 = 1024;
        v84 = v56;
        v85 = 1024;
        v86 = v30;
        v6 = a1;
        v87 = 1024;
        v88 = v53;
        v89 = 1024;
        v90 = v32;
        v91 = 1024;
        v92 = v13;
        v93 = 1024;
        v94 = v34;
        _os_log_impl(&dword_215C5C000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: option %d of %d: @%d/%d, size=%d", buf, 0x40u);
        v10 = 5;
        goto LABEL_16;
      }
    }
    v10 = 5;
LABEL_52:
    v6 = a1;
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      v23 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v23)
        return result;
      v25 = *(unsigned __int8 *)(v6 + 1);
      *(_DWORD *)buf = 136316162;
      v78 = v21;
      v79 = 2080;
      v80 = "_OSPFParse_ParseExtractOptions";
      v81 = 1024;
      v82 = 1193;
      v83 = 1024;
      v84 = v25;
      v85 = 1024;
      v86 = v10;
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d msg: %d: options verification failed (%d)", buf, 0x28u);
    }
    return 0;
  }
  v31 = a2 + 4;
LABEL_28:
  v35 = (_DWORD)v31 - (_DWORD)a2;
  if (v31 - a2 != v13)
  {
    v45 = a2[1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136316674;
        v78 = v46;
        v79 = 2080;
        v80 = "ospfVerifyOptions";
        v81 = 1024;
        v82 = 1063;
        v83 = 1024;
        v84 = v48;
        v85 = 1024;
        v86 = v45;
        v87 = 1024;
        v88 = v35;
        v89 = 1024;
        v90 = v13;
        _os_log_impl(&dword_215C5C000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: %d options used %d bytes != %d offset", buf, 0x34u);
      }
    }
    v10 = 6;
    goto LABEL_16;
  }
  v36 = a2[1];
  v37 = malloc_type_malloc(8 * v36, 0x2004093837F09uLL);
  if (v37)
  {
    v38 = v37;
    v39 = v36;
    if (!(_DWORD)v36)
    {
LABEL_39:
      *a5 = v39;
      *a4 = v37;
      result = 1;
      *a6 = v13;
      return result;
    }
    v40 = v6;
    v41 = 0;
    v42 = a3 - 4;
    v43 = *(_WORD *)(v40 + 4);
    while (1)
    {
      *((_QWORD *)v37 + v41) = v29;
      if ((v43 & 2) == 0 || !v42)
        goto LABEL_59;
      if (v42 <= 3)
      {
        v57 = v39;
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        LODWORD(v39) = v57;
        if (ErrorLogLevelForModule >= 7)
        {
          v59 = VRTraceErrorLogLevelToCSTR();
          v60 = *MEMORY[0x24BDFDC28];
          v61 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
          LODWORD(v39) = v57;
          if (v61)
          {
            v62 = *(unsigned __int8 *)(v40 + 1);
            *(_DWORD *)buf = 136316162;
            v78 = v59;
            v79 = 2080;
            v80 = "ospfParseOption";
            v81 = 1024;
            v82 = 980;
            v83 = 1024;
            v84 = v62;
            v85 = 1024;
            v86 = v42;
            _os_log_impl(&dword_215C5C000, v60, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ParseOption: msg: %d: option too small: %d", buf, 0x28u);
            LODWORD(v39) = v57;
          }
        }
LABEL_59:
        v63 = v39;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v64 = VRTraceErrorLogLevelToCSTR();
          v65 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v78 = v64;
            v79 = 2080;
            v80 = "_OSPFParse_ParseExtractOptions";
            v81 = 1024;
            v82 = 1211;
            v83 = 1024;
            v84 = v41;
            v85 = 1024;
            v86 = v63;
            v66 = " [%s] %s:%d expecting option %d of %d";
            v67 = v65;
            goto LABEL_68;
          }
        }
        goto LABEL_70;
      }
      v44 = 4 * v29[1] + 4;
      if (v42 < v44)
        break;
      if (!*v29)
        goto LABEL_70;
      if (*v29 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v72 = VRTraceErrorLogLevelToCSTR();
          v73 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v74 = *(unsigned __int8 *)(v40 + 1);
            v75 = *v29;
            *(_DWORD *)buf = 136316162;
            v78 = v72;
            v79 = 2080;
            v80 = "ospfParseOption";
            v81 = 1024;
            v82 = 1001;
            v83 = 1024;
            v84 = v74;
            v85 = 1024;
            v86 = v75;
            v66 = " [%s] %s:%d ParseOption: msg: %d: unsupported required option: %d";
            v67 = v73;
LABEL_68:
            v71 = 40;
LABEL_69:
            _os_log_impl(&dword_215C5C000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v71);
            goto LABEL_70;
          }
        }
        goto LABEL_70;
      }
      v29 += v44;
      ++v41;
      v42 -= v44;
      if (v39 == v41)
        goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v68 = VRTraceErrorLogLevelToCSTR();
      v69 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v70 = *(unsigned __int8 *)(v40 + 1);
        *(_DWORD *)buf = 136316418;
        v78 = v68;
        v79 = 2080;
        v80 = "ospfParseOption";
        v81 = 1024;
        v82 = 988;
        v83 = 1024;
        v84 = v70;
        v85 = 1024;
        v86 = v44;
        v87 = 1024;
        v88 = v42;
        v66 = " [%s] %s:%d ParseOption: msg: %d: incorrect option size: %d > %d";
        v67 = v69;
        v71 = 46;
        goto LABEL_69;
      }
    }
LABEL_70:
    free(v38);
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    return 0;
  VRTraceErrorLogLevelToCSTR();
  result = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
  if (result)
  {
    _OSPFParse_ParseExtractOptions_cold_1();
    return 0;
  }
  return result;
}

uint64_t OSPFParse(void **a1, _QWORD *a2, _WORD *a3, int a4, unsigned __int8 **a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned __int8 *v15;
  Bytef *v16;
  _WORD *v17;
  int v18;
  void *v19;
  unsigned int v21;
  unsigned __int8 *v22;
  int v23;
  _WORD *v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  char v29;
  unsigned int v30;
  Bytef *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v31 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
  v30 = -1431655766;
  v29 = 0;
  v27 = 0;
  v28 = 0;
  v12 = 0xFFFFFFFFLL;
  v25 = -1;
  v26 = 0;
  if (!OSPFParse_ParsePacketHeader(a3, a4, (unsigned int **)&v28, &v25) || !v28)
    return v12;
  if (!a2 && (*((_WORD *)v28 + 2) & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = v13;
        v34 = 2080;
        v35 = "OSPFParse";
        v36 = 1024;
        v37 = 1523;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Flow control: returning -1 when message is compressed and ppOSPFBody is NULL", buf, 0x1Cu);
      }
    }
    goto LABEL_15;
  }
  v31 = (Bytef *)a3 + v25;
  v30 = a4 - v25;
  if ((_OSPFParse_ParseDecompress((uint64_t)v28, v31, a4 - v25, &v31, &v30, &v29) & 1) == 0)
  {
LABEL_15:
    v17 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  v15 = v31;
  if (v29)
    v16 = v31;
  else
    v16 = 0;
  if (*((_BYTE *)v28 + 1) != 1)
  {
    LOWORD(v21) = 0;
    goto LABEL_30;
  }
  if (v30 > 1)
  {
    v15 = v31 + 2;
    v21 = bswap32(*(unsigned __int16 *)v31) >> 16;
    v31 += 2;
    v30 -= 2;
LABEL_30:
    if ((*((_WORD *)v28 + 2) & 2) != 0)
    {
      if (!_OSPFParse_ParseExtractOptions((uint64_t)v28, v15, v30, &v27, &v26, &v25))
      {
        v17 = 0;
        goto LABEL_18;
      }
      v15 = &v31[v25];
      v31 = v15;
      v30 -= v25;
    }
    if (a5)
    {
      if (v16)
        v22 = 0;
      else
        v22 = v15;
      *a5 = v22;
    }
    if (a6)
      (*(void (**)(uint64_t, void *, _QWORD))(a6 + 16))(a6, v27, v26);
    v17 = 0;
    if (a2)
    {
      v25 = -1;
      v19 = v28;
      v23 = 0;
      switch(*((_BYTE *)v28 + 1))
      {
        case 1:
          v17 = _OSPFParse_ParsePacketHello(v21, (uint64_t)v27, v26);
          if ((*(_BYTE *)v28 & 0xF0) == 0xC0)
            goto LABEL_56;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              OSPFParse_cold_1();
          }
          v23 = 1;
          break;
        case 2:
          v24 = _OSPFParse_ParsePacketDD((uint64_t)v28, (unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 3:
          v24 = _OSPFParse_ParsePacketLSA((uint64_t)v28, (unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 4:
          v24 = _OSPFParse_ParsePacketLSAAck((unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 5:
        case 7:
          v24 = _OSPFParse_ParsePacketData((uint64_t)v31, v30, &v25);
          goto LABEL_55;
        case 6:
          v24 = _OSPFParse_ParsePacketAudio((uint64_t)v31, v30, &v25);
          goto LABEL_55;
        case 8:
          v24 = _OSPFParse_ParsePacketHeartbeat((unsigned __int16 *)v31, v30, &v25);
LABEL_55:
          v17 = v24;
LABEL_56:
          v23 = 0;
          break;
        case 9:
          break;
        default:
          goto LABEL_19;
      }
      if (*((_BYTE *)v28 + 1) != 9 && !v17)
        goto LABEL_16;
    }
    else
    {
      v23 = 0;
    }
    if (a1)
    {
      *a1 = v28;
      v28 = 0;
    }
    if (a2)
    {
      *a2 = v17;
      v17 = 0;
    }
    if (v23)
      v18 = 0;
    else
      v18 = a4;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_16:
  v18 = -1;
LABEL_17:
  v25 = v18;
LABEL_18:
  v19 = v28;
  if (v28)
LABEL_19:
    free(v19);
  if (v17)
    free(v17);
  if (v16)
    free(v16);
  if (v27)
    free(v27);
  return v25;
}

_WORD *_OSPFParse_ParsePacketHello(__int16 a1, uint64_t a2, unsigned int a3)
{
  _WORD *v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300409059B04AuLL);
  v7 = v6;
  if (v6)
  {
    v6[6] = a1;
    *(_QWORD *)v6 = 0;
    *((_DWORD *)v6 + 2) = 0;
    if (a3)
    {
      v8 = a3;
      do
      {
        if (**(_BYTE **)a2 == 11)
          *((_QWORD *)v6 + 2) = bswap64(*(_QWORD *)(*(_QWORD *)a2 + 4));
        a2 += 8;
        --v8;
      }
      while (v8);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v9;
      v14 = 2080;
      v15 = "_OSPFParse_ParsePacketHello";
      v16 = 1024;
      v17 = 1236;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v12, 0x1Cu);
    }
  }
  return v7;
}

_DWORD *_OSPFParse_ParsePacketHeartbeat(unsigned __int16 *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  _DWORD *result;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        _OSPFParse_ParsePacketHeartbeat_cold_1();
    }
    return 0;
  }
  if (a2 <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return 0;
    v14 = 136315906;
    v15 = v4;
    v16 = 2080;
    v17 = "_OSPFParse_ParsePacketHeartbeat";
    v18 = 1024;
    v19 = 1267;
    v20 = 1024;
    v21 = a2;
    v6 = " [%s] %s:%d Payload size=%d is too small";
    v7 = v5;
    v8 = 34;
    goto LABEL_14;
  }
  result = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL);
  if (result)
  {
    *(_QWORD *)result = 0;
    result[2] = 0;
    *((_WORD *)result + 6) = bswap32(*a1) >> 16;
    *((_WORD *)result + 7) = bswap32(a1[1]) >> 16;
    *a3 = 4;
    return result;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "_OSPFParse_ParsePacketHeartbeat";
      v18 = 1024;
      v19 = 1274;
      v6 = " [%s] %s:%d Failed to allocate buffer";
      v7 = v13;
      v8 = 28;
LABEL_14:
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
    }
  }
  return 0;
}

void *_OSPFParse_ParsePacketDD(uint64_t a1, unsigned __int16 *a2, unsigned int a3, _DWORD *a4)
{
  unsigned int v4;
  int v6;
  unsigned __int16 *v8;
  unsigned int v9;
  char *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  *a4 = 0;
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        _OSPFParse_ParsePacketDD_cold_1();
    }
    return 0;
  }
  v4 = a3 - 2;
  if (a3 < 2)
    return 0;
  v6 = (int)a2;
  v8 = a2 + 1;
  v9 = bswap32(*a2) >> 16;
  v10 = (char *)malloc_type_malloc((480 * v9) | 0x18, 0x942DA601uLL);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v12;
        v18 = 2080;
        v19 = "_OSPFParse_ParsePacketDD";
        v20 = 1024;
        v21 = 1479;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", buf, 0x1Cu);
      }
    }
    return 0;
  }
  v11 = v10;
  *(_QWORD *)v10 = 0;
  *((_DWORD *)v10 + 2) = 0;
  *((_DWORD *)v10 + 3) = v9;
  *((_QWORD *)v10 + 2) = v10 + 24;
  if ((_OSPFParse_ParseNodes(a1, (uint64_t)(v10 + 24), v9, v8, v4, &v15) & 1) == 0)
  {
    free(v11);
    return 0;
  }
  *a4 = (_DWORD)v8 + v15 - v6;
  return v11;
}

void *_OSPFParse_ParsePacketLSA(uint64_t a1, unsigned __int16 *a2, unsigned int a3, _DWORD *a4)
{
  unsigned int v4;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  *a4 = 0;
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        _OSPFParse_ParsePacketLSA_cold_1();
    }
    return 0;
  }
  v4 = a3 - 4;
  if (a3 < 4)
    return 0;
  v8 = *a2;
  v9 = bswap32(a2[1]) >> 16;
  v10 = (char *)malloc_type_malloc(480 * v9 + 32, 0xF419A8DBuLL);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v12;
        v18 = 2080;
        v19 = "_OSPFParse_ParsePacketLSA";
        v20 = 1024;
        v21 = 1408;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", buf, 0x1Cu);
      }
    }
    return 0;
  }
  v11 = v10;
  *(_QWORD *)v10 = 0;
  *((_DWORD *)v10 + 2) = 0;
  *((_WORD *)v10 + 6) = __rev16(v8);
  *((_DWORD *)v10 + 4) = v9;
  *((_QWORD *)v10 + 3) = v10 + 32;
  if ((_OSPFParse_ParseNodes(a1, (uint64_t)(v10 + 32), v9, a2 + 2, v4, &v15) & 1) == 0)
  {
    free(v11);
    return 0;
  }
  *a4 = v15 + 4;
  return v11;
}

_DWORD *_OSPFParse_ParsePacketLSAAck(unsigned __int16 *a1, unsigned int a2, _DWORD *a3)
{
  _DWORD *result;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *a3 = 0;
    if (a2 >= 2)
    {
      result = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040F51ADB7CuLL);
      if (result)
      {
        *(_QWORD *)result = 0;
        result[2] = 0;
        *((_WORD *)result + 6) = bswap32(*a1) >> 16;
        *a3 = 2;
        return result;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315650;
          v9 = v6;
          v10 = 2080;
          v11 = "_OSPFParse_ParsePacketLSAAck";
          v12 = 1024;
          v13 = 1443;
          _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      _OSPFParse_ParsePacketLSAAck_cold_1();
  }
  return 0;
}

_DWORD *_OSPFParse_ParsePacketData(uint64_t a1, int a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)v6 = a1;
    v6[2] = a2;
    *a3 = a2;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v8;
      v13 = 2080;
      v14 = "_OSPFParse_ParsePacketData";
      v15 = 1024;
      v16 = 1298;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7;
}

_DWORD *_OSPFParse_ParsePacketAudio(uint64_t a1, int a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)v6 = a1;
    v6[2] = a2;
    *a3 = a2;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v8;
      v13 = 2080;
      v14 = "_OSPFParse_ParsePacketAudio";
      v15 = 1024;
      v16 = 1312;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7;
}

uint64_t OSPFAddDynamicOptions(unsigned __int8 ***a1, _WORD *a2, uint64_t a3, int a4, unsigned int a5, _DWORD *a6, unint64_t a7, uint64_t a8)
{
  uint64_t v12;
  int v13;
  int v14;
  size_t v15;
  _WORD *v16;
  void *v17;
  size_t v18;
  char *v19;
  char v20;
  __int128 v21;
  uint64_t *v22;
  unsigned __int8 **v23;
  int v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  int v39;
  BOOL v40;
  _QWORD *v41;
  _DWORD *v42;
  unsigned __int8 v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  int v47;
  char v48;
  unsigned int v49;
  __int128 v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  char *v58;
  int v59;
  size_t v60;
  unint64_t *v61;
  int v62;
  int v63;
  unsigned __int16 v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unsigned int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  char *v74;
  char v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  unint64_t v81;
  unint64_t v82;
  signed int v83;
  int v84;
  signed int v85;
  uint64_t v86;
  char v87;
  char *v88;
  size_t v89;
  int v90;
  _QWORD *v91;
  _BYTE *v92;
  unsigned __int8 *v93;
  int v94;
  size_t v95;
  unsigned int v96;
  uint64_t v97;
  char *v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char v103;
  unsigned __int8 *v104;
  uint64_t v105;
  char v106;
  int v107;
  _QWORD *v108;
  _BYTE *v109;
  _QWORD *v110;
  void *v111;
  unint64_t v112;
  int v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  int v121;
  signed int v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  unsigned int v127;
  int v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _BYTE *v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  _DWORD *v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  unsigned int v144;
  __int128 v145;
  int v146;
  unsigned __int8 *v147;
  uint64_t v148;
  _QWORD v149[5];
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  char v153;
  __int16 v154;
  __int16 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  void *v159;
  _OWORD v160[4];
  uint8_t buf[4];
  uint64_t v162;
  __int16 v163;
  const char *v164;
  __int16 v165;
  int v166;
  __int16 v167;
  int v168;
  __int16 v169;
  int v170;
  __int16 v171;
  int v172;
  __int16 v173;
  int v174;
  __int16 v175;
  unsigned int v176;
  __int16 v177;
  unsigned int v178;
  uint64_t v179;

  v135 = a7;
  v179 = *MEMORY[0x24BDAC8D0];
  v159 = 0;
  v154 = -21846;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  memset(v160, 0, sizeof(v160));
  v143 = a4;
  if (a4)
  {
    v154 = __rev16(a5);
    *(_QWORD *)&v160[0] = &v154;
    *((_QWORD *)&v160[0] + 1) = 4;
    DWORD2(v157) = 1;
  }
  v155 = -21846;
  v150 = 0;
  v151 = &v150;
  v152 = 0x2000000000;
  v153 = 0;
  v148 = 0;
  v149[0] = MEMORY[0x24BDAC760];
  v149[1] = 0x40000000;
  v149[2] = __OSPFAddDynamicOptions_block_invoke;
  v149[3] = &unk_24D466780;
  v149[4] = &v150;
  v138 = a3;
  v12 = OSPFGetLength((uint64_t)a2, a3);
  v13 = v12;
  if ((int)v12 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = 1238 - v12;
    ++a6[4];
  }
  v137 = &v124;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (_WORD *)((char *)&v124 - ((v15 + 15) & 0x1FFFFFFF0));
  v17 = memset(v16, 170, v15);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v124 - ((v18 + 15) & 0x1FFFFFFF0);
  if ((v20 & 1) == 0)
    memset((char *)&v124 - ((v18 + 15) & 0x1FFFFFFF0), 170, v18);
  v134 = v19;
  v147 = 0;
  v139 = a2;
  v136 = (unint64_t)a6;
  if (v13 < 1 || v14 < 1 || !a1)
  {
    v146 = -1431655766;
    if (!a1)
    {
LABEL_48:
      v38 = DWORD2(v157);
      v39 = v138;
      if (DWORD2(v157))
        v155 = bswap32(v138) >> 16;
      *(_QWORD *)&v145 = 0;
      v40 = 0;
      v41 = &v160[SDWORD2(v157)];
      v42 = v139;
      *v41 = v139;
      v41[1] = v39;
      DWORD2(v157) = v38 + 1;
      v142 = 170;
      v144 = 43690;
      v141 = 170;
      v140 = 170;
      v43 = -86;
      v44 = 43690;
      LODWORD(v45) = 43690;
      v133 = 170;
      v132 = 170;
      v131 = 170;
      v46 = -1431655766;
      goto LABEL_51;
    }
    v22 = v151;
    goto LABEL_41;
  }
  v13 = OSPFParse(&v159, 0, a2, v13, &v147, (uint64_t)v149);
  v22 = v151;
  if (v13 < 1)
  {
    v146 = -1431655766;
    goto LABEL_41;
  }
  v146 = -1431655766;
  if (*((_BYTE *)v151 + 24) || !v147)
  {
LABEL_41:
    if (!*((_BYTE *)v22 + 24))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v162 = v34;
          v163 = 2080;
          v164 = "OSPFAddDynamicOptions";
          v165 = 1024;
          v166 = 1754;
          v167 = 1024;
          v168 = v13;
          _os_log_impl(&dword_215C5C000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: fail iOSPFLen == %d)", buf, 0x22u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v162 = v36;
          v163 = 2080;
          v164 = "OSPFAddDynamicOptions";
          v165 = 1024;
          v166 = 1755;
          v167 = 1024;
          v168 = v138;
          _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: iLen == %d)", buf, 0x22u);
        }
      }
    }
    goto LABEL_48;
  }
  v23 = *a1;
  v125 = a8;
  if (!v23)
  {
    v24 = 0;
    v33 = 0;
LABEL_103:
    v81 = v135;
    v42 = v139;
    goto LABEL_107;
  }
  if (v14 < 4)
  {
    v24 = 0;
    goto LABEL_106;
  }
  v24 = 0;
  *(_QWORD *)&v21 = 136315906;
  v145 = v21;
  do
  {
    if (*v23)
    {
      v25 = 4 * (*v23)[1];
      if (v14 < (v25 + 8))
      {
        a1 = (unsigned __int8 ***)(v23 + 1);
        goto LABEL_31;
      }
      *a1 = (unsigned __int8 **)v23[1];
      v23[1] = 0;
      if ((OSPFProcessDynamicOption(a6, *v23, 0) & 1) == 0)
      {
        v14 -= v25 + 4;
        v29 = &v148;
        do
        {
          v30 = v29;
          v31 = *v29;
          v29 = (uint64_t *)(*v29 + 8);
        }
        while (v31);
        v24 += v25 + 4;
        *v30 = (uint64_t)v23;
        goto LABEL_31;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v28 = **v23;
          *(_DWORD *)buf = v145;
          v162 = v26;
          v163 = 2080;
          v164 = "OSPFAddDynamicOptions";
          v165 = 1024;
          v166 = 1795;
          v167 = 1024;
          v168 = v28;
          _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: error processing option node (type == %d)", buf, 0x22u);
        }
      }
      if (*v23)
        free(*v23);
    }
    else
    {
      *a1 = (unsigned __int8 **)v23[1];
    }
    free(v23);
LABEL_31:
    v23 = *a1;
    if (*a1)
      v32 = v14 <= 3;
    else
      v32 = 1;
  }
  while (!v32);
  if (v24)
  {
    v33 = (v24 + 4);
    a8 = v125;
    goto LABEL_103;
  }
  a8 = v125;
LABEL_106:
  v81 = v135;
  v42 = v139;
  v33 = 0;
LABEL_107:
  v82 = 0;
  v144 = 43690;
  if (v81 && v14 >= 12)
  {
    if (*(_QWORD *)v81 == 0xFFFFFFFFLL
      || !*(_DWORD *)(v81 + 8)
      || (v13 + v24 + 8 >= 196 ? (v83 = 8) : (v83 = ((191 - (v13 + v24)) & 0xFFFFFFFC) + 8), v14 - v83 < 4))
    {
      v82 = 0;
      v142 = 170;
      v144 = 43690;
      v141 = 170;
      v140 = 170;
      v130 = 170;
      v129 = 43690;
      v45 = 43690;
      v133 = 170;
      v132 = 170;
      v131 = 170;
      goto LABEL_117;
    }
    *(_QWORD *)&v145 = v33;
    v109 = malloc_type_malloc(v83 + 4, 0x3FFED812uLL);
    v110 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
    v111 = v110;
    v84 = v138;
    if (v109 && v110)
    {
      v112 = v135;
      v113 = *(_DWORD *)(v135 + 16);
      *v109 = 15;
      v109[1] = (v83 + 1020) >> 2;
      v109[2] = BYTE1(v113);
      v109[3] = v113;
      *((_WORD *)v109 + 3) = 0;
      *((_WORD *)v109 + 2) = bswap32(*(unsigned __int16 *)(v112 + 12)) >> 16;
      *v110 = v109;
      v110[1] = 0;
      v114 = &v148;
      do
      {
        v115 = v114;
        v116 = *v114;
        v114 = (uint64_t *)(*v114 + 8);
      }
      while (v116);
      *(_QWORD *)&v145 = (v24 + 4 + v83);
      *v115 = (uint64_t)v110;
      v117 = *(_QWORD *)v109 >> 8;
      v130 = *(_QWORD *)v109;
      v131 = v117;
      v118 = v130 >> 16;
      v119 = v130 >> 24;
      v45 = HIDWORD(v130);
      v129 = HIWORD(v130);
      buf[0] = 0;
      v120 = v135;
      GCK_BWE_TrackLargeFrameState(*(_QWORD *)v135, *(_DWORD *)(v135 + 8), 0, (char *)buf);
      v133 = v119;
      if (buf[0])
      {
        v121 = *(_DWORD *)(v120 + 8);
        v82 = (v121 + 1027) / 0x404uLL;
        v122 = (v121 + (int)v82 - 1) / v82;
        v123 = v122 & 3;
        if (v122 <= 0)
          v123 = -(-v122 & 3);
        if (v123)
          v122 = v122 - v123 + 4;
        v144 = v45;
        v142 = v119;
        v140 = ((unint64_t)(v122 + 1020) + 1020) >> 2;
        v141 = v118;
      }
      else
      {
        v82 = 0;
        v142 = 170;
        v144 = 43690;
        v141 = 170;
        v140 = 170;
        v130 = 170;
      }
      v42 = v139;
      v132 = v118;
    }
    else
    {
      free(v109);
      free(v111);
      v82 = 0;
      v142 = 170;
      v144 = 43690;
      v141 = 170;
      v140 = 170;
      v130 = 170;
      v129 = 43690;
      v45 = 43690;
      v133 = 170;
      v132 = 170;
      v131 = 170;
      v42 = v139;
    }
    LODWORD(v33) = v145;
  }
  else
  {
    v140 = 170;
    v141 = 170;
    v130 = 170;
    v129 = 43690;
    v45 = 43690;
    v132 = 170;
    v133 = 170;
    v142 = 170;
    v131 = 170;
LABEL_117:
    v84 = v138;
  }
  *(_QWORD *)&v145 = v82;
  v40 = (_DWORD)v82 != 0;
  if ((_DWORD)v82)
    v46 = v33 + v84;
  else
    v46 = 0;
  if ((_DWORD)v33)
  {
    v85 = v33;
    v138 = v45;
    v86 = v148;
    if (v148)
    {
      v87 = 0;
      v88 = v134 + 4;
      do
      {
        v89 = 4 * *(unsigned __int8 *)(*(_QWORD *)v86 + 1) + 4;
        memcpy(v88, *(const void **)v86, v89);
        v88 += v89;
        ++v87;
        v86 = *(_QWORD *)(v86 + 8);
      }
      while (v86);
    }
    else
    {
      v87 = 0;
    }
    v92 = v134;
    *v134 = -8;
    v92[1] = v87;
    *((_WORD *)v92 + 1) = bswap32(v85) >> 16;
    v93 = v147;
    v94 = (_DWORD)v147 - (_DWORD)v139;
    v95 = (int)v147 - (int)v139;
    memcpy(v16, v139, v95);
    v16[2] |= 0x200u;
    v16[1] = bswap32(v85 + (bswap32((unsigned __int16)v16[1]) >> 16)) >> 16;
    v16[3] = 0;
    if (v94 < 1)
    {
      v96 = 0;
      a8 = v125;
    }
    else
    {
      LOWORD(v96) = 0;
      v97 = v94;
      v98 = (char *)v16;
      a8 = v125;
      do
      {
        v99 = *v98++;
        v96 = CRC16Table[(v99 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
        --v97;
      }
      while (v97);
    }
    v100 = (v13 - v94);
    if (v85 < 1)
    {
      LODWORD(v45) = v138;
    }
    else
    {
      v101 = v85;
      v102 = v134;
      LODWORD(v45) = v138;
      do
      {
        v103 = *v102++;
        v96 = CRC16Table[(v103 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
        --v101;
      }
      while (v101);
    }
    if ((int)v100 >= 1)
    {
      v104 = v93;
      v105 = v100;
      do
      {
        v106 = *v104++;
        v96 = CRC16Table[(v106 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
        --v105;
      }
      while (v105);
    }
    v16[3] = bswap32(v96) >> 16;
    v107 = DWORD2(v157);
    if (DWORD2(v157))
      v155 = bswap32(v85 + v13) >> 16;
    v108 = &v160[SDWORD2(v157)];
    *v108 = v16;
    v108[1] = v95;
    v108[2] = v134;
    v108[3] = v85;
    v108[4] = v93;
    v108[5] = (int)v100;
    DWORD2(v157) = v107 + 3;
    v42 = v139;
  }
  else
  {
    v90 = DWORD2(v157);
    if (DWORD2(v157))
      v155 = bswap32(v13) >> 16;
    v91 = &v160[SDWORD2(v157)];
    *v91 = v42;
    v91[1] = v13;
    DWORD2(v157) = v90 + 1;
  }
  v44 = v129;
  v43 = v130;
LABEL_51:
  *(_QWORD *)&v157 = v160;
  if (v159)
    free(v159);
  if (!a8)
  {
LABEL_62:
    ++*(_DWORD *)(v136 + 32);
    v54 = v148;
    if (v148)
    {
      do
      {
        v55 = *(_QWORD *)(v54 + 8);
        if (*(_QWORD *)v54)
          free(*(void **)v54);
        free((void *)v54);
        v54 = v55;
      }
      while (v55);
    }
    goto LABEL_101;
  }
  v47 = (*(uint64_t (**)(uint64_t, __int128 *))(a8 + 16))(a8, &v156);
  v48 = !v40;
  if (!v47)
    v48 = 1;
  if ((v48 & 1) != 0)
  {
    if (v47)
      goto LABEL_100;
    goto LABEL_62;
  }
  v49 = v45;
  LODWORD(v138) = v42[2];
  LODWORD(v130) = *(_DWORD *)(v135 + 20);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v51 = VRTraceErrorLogLevelToCSTR();
    v52 = *MEMORY[0x24BDFDC28];
    v53 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v162 = v51;
        v163 = 2080;
        v164 = "BWE_SendProbePkts";
        v165 = 1024;
        v166 = 481;
        v167 = 1024;
        v168 = v130;
        v169 = 1024;
        v170 = v46;
        v171 = 1024;
        v172 = 4 * v131;
        v173 = 1024;
        v174 = v133 | (v132 << 8);
        v175 = 1024;
        v176 = bswap32(v49) >> 16;
        v177 = 1024;
        v178 = __rev16(v44);
        _os_log_impl(&dword_215C5C000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
      }
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136317186;
      v162 = v51;
      v163 = 2080;
      v164 = "BWE_SendProbePkts";
      v165 = 1024;
      v166 = 481;
      v167 = 1024;
      v168 = v130;
      v169 = 1024;
      v170 = v46;
      v171 = 1024;
      v172 = 4 * v131;
      v173 = 1024;
      v174 = v133 | (v132 << 8);
      v175 = 1024;
      v176 = bswap32(v49) >> 16;
      v177 = 1024;
      v178 = __rev16(v44);
      _os_log_debug_impl(&dword_215C5C000, v52, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
    }
  }
  v56 = v145;
  if ((int)v145 < 1)
  {
    v58 = 0;
  }
  else
  {
    v57 = a8;
    v58 = 0;
    LODWORD(v134) = bswap32(v130);
    v133 = (uint64_t)&v160[v143 != 0];
    v132 = v133 | 8;
    v59 = 4 * v140;
    v60 = (v59 + 24);
    v136 = (unint64_t)(unsigned __int16)v144 << 32;
    LODWORD(v139) = __rev16(v60);
    LODWORD(v129) = v59;
    LODWORD(v131) = __rev16(v59 + 8);
    v128 = v142 | (v141 << 8);
    v127 = bswap32(v144) >> 16;
    v61 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
    v62 = 1;
    *(_QWORD *)&v50 = 136317186;
    v126 = v50;
    v135 = ((unint64_t)v142 << 24) | ((unint64_t)v141 << 16) | ((unint64_t)v140 << 8) | v43;
    do
    {
      if (v62 == v56)
        v63 = 61440;
      else
        v63 = 0;
      v64 = v63 | v62;
      v65 = bswap32(v63 | v62) >> 16;
      if (v62 == 1)
      {
        v66 = (char *)malloc_type_calloc(1uLL, v60, 0xD3EB463FuLL);
        if (!v66)
          break;
        v67 = 0;
        LOWORD(v68) = 0;
        v58 = v66;
        *(_WORD *)v66 = 2497;
        *((_WORD *)v66 + 1) = (_WORD)v139;
        *((_WORD *)v66 + 2) = 512;
        v69 = (int)v134;
        *((_DWORD *)v66 + 2) = v138;
        *((_DWORD *)v66 + 3) = v69;
        *((_WORD *)v66 + 8) = 504;
        *((_WORD *)v66 + 9) = v131;
        *((_WORD *)v66 + 13) = v65;
        v66[20] = 15;
        v61 = (unint64_t *)(v66 + 20);
        v66[21] = v140;
        v66[22] = v141;
        v66[23] = v142;
        *((_WORD *)v66 + 12) = v144;
        do
          v68 = CRC16Table[(v66[v67++] ^ v68)] ^ ((unsigned __int16)(v68 & 0xFF00) >> 8);
        while (v60 != v67);
        *((_WORD *)v66 + 3) = bswap32(v68) >> 16;
        if (v143)
        {
          v155 = (__int16)v139;
          v70 = 2;
        }
        else
        {
          v70 = 1;
        }
        *(_QWORD *)v133 = v66;
        *(_QWORD *)v132 = v60;
        DWORD2(v157) = v70;
        v71 = v60;
        *(_QWORD *)&v157 = v160;
      }
      else
      {
        *v61 = v136 | (v65 << 48) | v135;
        *((_WORD *)v58 + 3) = 0;
        v71 = v146;
        if (v146 < 1)
        {
          v72 = 0;
        }
        else
        {
          LOWORD(v72) = 0;
          v73 = v146;
          v74 = v58;
          do
          {
            v75 = *v74++;
            v72 = CRC16Table[(v75 ^ v72)] ^ ((unsigned __int16)(v72 & 0xFF00) >> 8);
            --v73;
          }
          while (v73);
        }
        *((_WORD *)v58 + 3) = bswap32(v72) >> 16;
      }
      if (!(*(unsigned int (**)(uint64_t, __int128 *))(v57 + 16))(v57, &v156))
        break;
      v146 = v71;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x24BDFDC28];
        v78 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v126;
            v162 = v76;
            v163 = 2080;
            v164 = "BWE_SendProbePkts";
            v165 = 1024;
            v166 = 540;
            v167 = 1024;
            v168 = v130;
            v169 = 1024;
            v170 = v146;
            v171 = 1024;
            v172 = v129;
            v173 = 1024;
            v174 = v128;
            v175 = 1024;
            v176 = v127;
            v177 = 1024;
            v178 = v64;
            _os_log_impl(&dword_215C5C000, v77, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
          }
        }
        else if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v126;
          v162 = v76;
          v163 = 2080;
          v164 = "BWE_SendProbePkts";
          v165 = 1024;
          v166 = 540;
          v167 = 1024;
          v168 = v130;
          v169 = 1024;
          v170 = v146;
          v171 = 1024;
          v172 = v129;
          v173 = 1024;
          v174 = v128;
          v175 = 1024;
          v176 = v127;
          v177 = 1024;
          v178 = v64;
          _os_log_debug_impl(&dword_215C5C000, v77, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
        }
      }
      v56 = v145;
    }
    while (v62++ != (_DWORD)v145);
  }
  free(v58);
LABEL_100:
  v54 = v148;
LABEL_101:
  _Block_object_dispose(&v150, 8);
  return v54;
}

uint64_t _OSPFParse_ParseNodes(uint64_t a1, uint64_t a2, unsigned int a3, unsigned __int16 *a4, unsigned int a5, _DWORD *a6)
{
  unsigned __int16 *v6;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  size_t v14;
  char *v15;
  char *v16;
  unsigned int v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t result;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  int v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = (int)a4;
  LODWORD(v6) = (_DWORD)a4;
  if (a3)
  {
    v9 = 0;
    v10 = (_DWORD *)(a2 + 292);
    v6 = a4;
    v11 = a3;
    while (1)
    {
      v12 = a5 - 7;
      if (a5 < 7)
        return 0;
      v13 = a2 + 480 * v9;
      *(_DWORD *)v13 = bswap32(*(_DWORD *)v6);
      *(_DWORD *)(v13 + 4) = -1;
      *(_DWORD *)(v13 + 268) = -1;
      *(_WORD *)(v13 + 272) = bswap32(v6[2]) >> 16;
      *(_DWORD *)(v13 + 276) = 1;
      *(_DWORD *)(v13 + 280) = *(_DWORD *)(a1 + 8);
      v14 = *((unsigned __int8 *)v6 + 6);
      *(_BYTE *)(v13 + 8) = v14;
      if (v12 < (int)v14 + 2)
        return 0;
      v15 = (char *)v6 + 7;
      memcpy((void *)(a2 + 480 * v9 + 9), (char *)v6 + 7, v14);
      v16 = &v15[v14];
      *(_BYTE *)(a2 + 480 * v9 + 9 + v14) = 0;
      v17 = *(unsigned __int16 *)v16;
      v18 = __rev16(v17);
      if (v18 >= 0x11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          v23 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (!v23)
            return result;
          *(_DWORD *)buf = 136315906;
          v27 = v21;
          v28 = 2080;
          v29 = "_OSPFParse_ParseNodes";
          v30 = 1024;
          v31 = 1360;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Too many neighbors. Count=%d", buf, 0x22u);
        }
        return 0;
      }
      a5 = v12 - v14 - 2;
      *(_DWORD *)(a2 + 480 * v9 + 284) = v18;
      if (a5 < 8 * (int)v18)
        return 0;
      v6 = (unsigned __int16 *)(v16 + 2);
      if (v17)
      {
        v19 = v10;
        do
        {
          *(v19 - 1) = bswap32(*(_DWORD *)v6);
          *v19 = bswap32(*((_DWORD *)v6 + 1));
          v19 += 3;
          v6 += 4;
          a5 -= 8;
          --v18;
        }
        while (v18);
      }
      ++v9;
      v10 += 120;
      if (v9 == v11)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    *a6 = (_DWORD)v6 - v25;
    return 1;
  }
}

uint64_t TimingLog(int a1, int a2, uint64_t a3)
{
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = micro();
  v7 = v6;
  if (a2)
  {
    g_resetTime = *(_QWORD *)&v6;
    pthread_mutex_lock(&g_xTimingLog);
    if (a1 != 3)
    {
      if (a1 == 2)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "**TIME** %0.3lf (T0 ---): %s\n");
      }
      else if (a1 == 1)
      {
        NSLog(CFSTR("**TIME** %0.3lf (T0 ---): %s"), *(_QWORD *)&v7, a3);
      }
      return pthread_mutex_unlock(&g_xTimingLog);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return pthread_mutex_unlock(&g_xTimingLog);
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return pthread_mutex_unlock(&g_xTimingLog);
    *(_DWORD *)buf = 136316162;
    v17 = v8;
    v18 = 2080;
    v19 = "TimingLog";
    v20 = 1024;
    v21 = 28;
    v22 = 2048;
    v23 = v7;
    v24 = 2080;
    v25 = *(double *)&a3;
    v10 = " [%s] %s:%d **TIME** %0.3lf (T0 ---): %s";
    v11 = v9;
    v12 = 48;
LABEL_18:
    _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return pthread_mutex_unlock(&g_xTimingLog);
  }
  pthread_mutex_lock(&g_xTimingLog);
  switch(a1)
  {
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return pthread_mutex_unlock(&g_xTimingLog);
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        return pthread_mutex_unlock(&g_xTimingLog);
      *(_DWORD *)buf = 136316418;
      v17 = v13;
      v18 = 2080;
      v19 = "TimingLog";
      v20 = 1024;
      v21 = 45;
      v22 = 2048;
      v23 = v7;
      v24 = 2048;
      v25 = v7 - *(double *)&g_resetTime;
      v26 = 2080;
      v27 = a3;
      v10 = " [%s] %s:%d **TIME** %0.3lf (T+%0.3lf): %s";
      v11 = v14;
      v12 = 58;
      goto LABEL_18;
    case 2:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "**TIME** %0.3lf (T+%0.3lf): %s\n");
      break;
    case 1:
      NSLog(CFSTR("**TIME** %0.3lf (T+%0.3lf): %s"), *(_QWORD *)&v7, v7 - *(double *)&g_resetTime, a3);
      break;
  }
  return pthread_mutex_unlock(&g_xTimingLog);
}

void UpdateRxEstimate(uint64_t a1, int a2, int a3, int *a4, double a5, double a6, double a7)
{
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  double v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  int v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  int v32;
  uint64_t v33;
  int *v34;
  int v35;
  double v36;
  double v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  double v43;
  int v44;
  uint64_t v45;
  char v46;
  double v47;
  char v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 356))
  {
    UpdateRxEstimate_v1(a1, a2, a3, a4, a5, a6, a7);
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a1 + 320);
    return;
  }
  if (*(_BYTE *)(a1 + 357))
  {
    v59 = -1;
    UpdateRxEstimate_v1(a1, a2, a3, &v59, a5, a6, a7);
  }
  v14 = *(_DWORD *)(a1 + 92);
  if (v14 == 2)
    v15 = 0;
  else
    v15 = 3;
  v16 = *(double *)(a1 + 264);
  if (v16 != 0.0)
  {
    if (!a2 || a3 < 250)
      return;
    if (dbl_215CDDC70[v14 == 2] <= a6)
    {
      *(_DWORD *)(a1 + 296) = 0;
    }
    else
    {
      v22 = *(_DWORD *)(a1 + 296);
      if (v22 < v15)
        *(_DWORD *)(a1 + 296) = ++v22;
      if (v22 < v15)
        return;
    }
  }
  if (a5 <= 0.0)
    return;
  if (dbl_215CDDC80[v14 == 2] >= a5)
    v17 = a5;
  else
    v17 = dbl_215CDDC80[v14 == 2];
  *(double *)(a1 + 464) = *(double *)(a1 + 464) + a5;
  ++*(_DWORD *)(a1 + 472);
  if (v14 != 2)
  {
    if (v14 == 1)
      v20 = 4;
    else
      v20 = 3;
    v21 = 0.0;
    v19 = 4.0;
    if (v14 != 1)
      v19 = 0.0;
    v18 = v19;
LABEL_30:
    v23 = v17 <= v16 * 0.5;
    if (v16 - v17 > 200000.0)
      v23 = 1;
    v24 = v17 - v16 > 200000.0 || v17 >= v16 * 1.5;
    v25 = v16 - v17 > v21 && v23;
    v26 = v17 - v16 > v21 && v24;
    if (v16 == 0.0)
    {
      v27 = 0;
      v28 = 100000.0;
      if (v17 >= 100000.0)
        v28 = v17;
      *(double *)(a1 + 264) = v28;
      goto LABEL_98;
    }
    if (!v25 && !v26)
    {
      if (v14 == 2)
      {
        v33 = *(unsigned int *)(a1 + 220);
        if ((int)v33 >= 1)
        {
          v34 = (int *)(a1 + 100);
          do
          {
            v35 = *v34++;
            v16 = (double)v35 * 0.05 + v16 * 0.95;
            --v33;
          }
          while (v33);
          *(_DWORD *)(a1 + 220) = 0;
        }
        v36 = v17 * 0.075;
        v37 = 0.925;
      }
      else
      {
        v36 = v17 * 0.1;
        v37 = 0.9;
      }
      *(double *)(a1 + 264) = v36 + v16 * v37;
      *(_DWORD *)(a1 + 280) = 0;
      v27 = 1;
      *(_QWORD *)(a1 + 272) = 0;
      goto LABEL_98;
    }
    if ((v14 - 1) > 1)
    {
      v29 = 0;
    }
    else
    {
      if (*(int *)(a1 + 280) < 0)
        v19 = v18;
      v29 = a7 - *(double *)(a1 + 288) < v19;
    }
    if (v25)
    {
      v38 = *(_DWORD *)(a1 + 280);
      if (v38 < 0)
      {
        v39 = v38 - 1;
      }
      else
      {
        *(_QWORD *)(a1 + 272) = 0;
        *(double *)(a1 + 288) = a7;
        v39 = -1;
      }
      *(_DWORD *)(a1 + 280) = v39;
      v42 = -10;
    }
    else
    {
      if (!v26)
      {
LABEL_76:
        v43 = v17 + *(double *)(a1 + 272);
        *(double *)(a1 + 272) = v43;
        v44 = *(_DWORD *)(a1 + 280);
        if (v44 < 0)
          v44 = -v44;
        if (v14 == 2)
        {
          v45 = *(int *)(a1 + 220);
          if ((int)v45 <= 29)
          {
            *(_DWORD *)(a1 + 4 * v45 + 100) = (int)v17;
            ++*(_DWORD *)(a1 + 220);
          }
          v46 = v44 < v20 || v29;
          if ((v46 & 1) != 0)
            goto LABEL_99;
          v47 = v43 / (double)v44;
          if ((*(_DWORD *)(a1 + 280) & 0x80000000) == 0)
            v47 = v47 * 0.9 + v16 * 0.1;
        }
        else
        {
          v48 = v44 < v20 || v29;
          if ((v48 & 1) != 0)
          {
LABEL_99:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v50 = VRTraceErrorLogLevelToCSTR();
              v51 = *MEMORY[0x24BDFDC28];
              v52 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  v53 = (int)*(double *)(a1 + 264);
                  v54 = *a4;
                  v55 = *(_DWORD *)(a1 + 280);
                  v59 = 136316674;
                  v60 = v50;
                  v61 = 2080;
                  v62 = "UpdateRxEstimate";
                  v63 = 1024;
                  v64 = 817;
                  v65 = 1024;
                  v66 = (int)v17;
                  v67 = 1024;
                  v68 = v53;
                  v69 = 1024;
                  v70 = v54;
                  v71 = 1024;
                  v72 = v55;
                  _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d \t\t\t\t\t\t\t\t ------ dBWD: %d Rx: %d  \t %d %d", (uint8_t *)&v59, 0x34u);
                }
              }
              else if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                v56 = (int)*(double *)(a1 + 264);
                v57 = *a4;
                v58 = *(_DWORD *)(a1 + 280);
                v59 = 136316674;
                v60 = v50;
                v61 = 2080;
                v62 = "UpdateRxEstimate";
                v63 = 1024;
                v64 = 817;
                v65 = 1024;
                v66 = (int)v17;
                v67 = 1024;
                v68 = v56;
                v69 = 1024;
                v70 = v57;
                v71 = 1024;
                v72 = v58;
                _os_log_debug_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\t\t\t\t\t\t\t ------ dBWD: %d Rx: %d  \t %d %d", (uint8_t *)&v59, 0x34u);
              }
            }
            return;
          }
          v47 = v43 / (double)v44;
        }
        *(double *)(a1 + 264) = v47;
        *(_DWORD *)(a1 + 280) = 0;
        *(_QWORD *)(a1 + 272) = 0;
        if (*a4 == -10)
          v49 = -100;
        else
          v49 = 200;
        if (*a4 == 10)
          v27 = 100;
        else
          v27 = v49;
LABEL_98:
        *a4 = v27;
        goto LABEL_99;
      }
      v40 = *(_DWORD *)(a1 + 280);
      if (v40 <= 0)
      {
        *(_QWORD *)(a1 + 272) = 0;
        *(double *)(a1 + 288) = a7;
        v41 = 1;
      }
      else
      {
        v41 = v40 + 1;
      }
      *(_DWORD *)(a1 + 280) = v41;
      v42 = 10;
    }
    *a4 = v42;
    goto LABEL_76;
  }
  if (*(_BYTE *)(a1 + 97))
  {
    v18 = 7.0;
    v19 = 10.0;
    v20 = 6;
    v21 = 100000.0;
    goto LABEL_30;
  }
  v30 = 200000.0;
  if (v17 <= 200000.0)
    v30 = v17;
  v31 = v30 + *(double *)(a1 + 272);
  *(double *)(a1 + 272) = v31;
  v32 = *(_DWORD *)(a1 + 280);
  *(_DWORD *)(a1 + 280) = v32 + 1;
  if (v32 > 8 || a7 - *(double *)(a1 + 288) >= 7.0)
  {
    *(_BYTE *)(a1 + 97) = 1;
    *(double *)(a1 + 264) = v31 / (double)(v32 + 1);
    *(_QWORD *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 280) = 0;
  }
}

uint64_t UpdateRxEstimate_v1(uint64_t result, int a2, int a3, int *a4, double a5, double a6, double a7)
{
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  double v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  int v21;
  int v22;

  v8 = *(double *)(result + 320);
  if (v8 != 0.0)
  {
    if (!a2 || a3 < 250)
      return result;
    if (a6 >= 0.008)
    {
      *(_DWORD *)(result + 352) = 0;
    }
    else
    {
      v14 = *(_DWORD *)(result + 352);
      if (v14 <= 2)
      {
        *(_DWORD *)(result + 352) = v14 + 1;
        if (v14 != 2)
          return result;
      }
    }
  }
  if (a5 <= 0.0)
    return result;
  v9 = 2300000.0;
  if (a5 <= 2300000.0)
    v9 = a5;
  v10 = v9 <= v8 * 0.5;
  if (v8 - v9 > 200000.0)
    v10 = 1;
  v11 = v9 >= v8 * 1.5;
  if (v9 - v8 > 200000.0)
    v11 = 1;
  if (v8 == 0.0)
  {
    v12 = 0;
    v13 = 100000.0;
    if (v9 >= 100000.0)
      v13 = v9;
    *(double *)(result + 320) = v13;
    goto LABEL_43;
  }
  if (!v10 && !v11)
  {
    *(double *)(result + 320) = v9 * 0.1 + v8 * 0.9;
    *(_DWORD *)(result + 336) = 0;
    *(_QWORD *)(result + 328) = 0;
    v12 = 1;
LABEL_43:
    *a4 = v12;
    return result;
  }
  if (v10)
  {
    v15 = *(_DWORD *)(result + 336);
    if (v15 < 0)
    {
      v16 = v15 - 1;
    }
    else
    {
      *(_QWORD *)(result + 328) = 0;
      *(double *)(result + 344) = a7;
      v16 = -1;
    }
    *(_DWORD *)(result + 336) = v16;
    v19 = -10;
  }
  else
  {
    if (!v11)
      goto LABEL_34;
    v17 = *(_DWORD *)(result + 336);
    if (v17 <= 0)
    {
      *(_QWORD *)(result + 328) = 0;
      *(double *)(result + 344) = a7;
      v18 = 1;
    }
    else
    {
      v18 = v17 + 1;
    }
    *(_DWORD *)(result + 336) = v18;
    v19 = 10;
  }
  *a4 = v19;
LABEL_34:
  v20 = v9 + *(double *)(result + 328);
  *(double *)(result + 328) = v20;
  v21 = *(_DWORD *)(result + 336);
  if (v21 < 0)
    v21 = -v21;
  if (v21 >= 3)
  {
    *(double *)(result + 320) = v20 / (double)v21;
    *(_DWORD *)(result + 336) = 0;
    *(_QWORD *)(result + 328) = 0;
    if (*a4 == -10)
      v22 = -100;
    else
      v22 = 200;
    if (*a4 == 10)
      v12 = 100;
    else
      v12 = v22;
    goto LABEL_43;
  }
  return result;
}

uint64_t GCK_BWE_CalcRxEstimate(double a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8, char a9, _DWORD *a10)
{
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  pthread_mutex_t *v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int ErrorLogLevelForModule;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  int v42;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  char v48;
  _DWORD *v49;
  int v50;
  int v51;
  int v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  double v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  __int128 v66;
  _QWORD *v67;
  int v68;
  _DWORD *v69;
  int v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  const char *v74;
  NSObject *v75;
  uint32_t v76;
  uint64_t v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  NSObject *v92;
  uint32_t v93;
  int v94;
  int v95;
  char v96;
  pthread_mutex_t *v97;
  char v100[1024];
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  double v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  __int16 v113;
  _BYTE *v114;
  _BYTE v115[257];
  _BYTE v116[31];
  char v117[24];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v16 = CheckInHandleDebug();
  if (!v16)
    return 2149908482;
  v17 = v16;
  v18 = a10;
  v19 = (pthread_mutex_t *)(v16 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v16 + 16));
  bzero(v100, 0x400uLL);
  if (*(_BYTE *)(v17 + 89))
  {
    if (!*(_BYTE *)(v17 + 300))
    {
      v20 = a8 - 1;
      if (!a7)
        v20 = a4;
      *(_DWORD *)(v17 + 304) = v20;
      *(_DWORD *)(v17 + 568) = a4 - 1;
      *(_DWORD *)(v17 + 572) = a4 - 1;
      *(double *)(v17 + 576) = a1;
      *(_DWORD *)(v17 + 668) = 0;
      *(_QWORD *)(v17 + 584) = 0;
      *(_BYTE *)(v17 + 97) = 0;
      *(double *)(v17 + 288) = a1;
      *(_DWORD *)(v17 + 280) = 0;
      *(_DWORD *)(v17 + 220) = 0;
      *(_BYTE *)(v17 + 300) = 1;
    }
    v97 = v19;
    if (!*(_BYTE *)(v17 + 560))
    {
LABEL_47:
      v48 = a9;
      v49 = v18;
      v50 = *(_DWORD *)(v17 + 308);
      v51 = *(_DWORD *)(v17 + 312);
      v52 = v50;
      if (!a7)
        goto LABEL_52;
      v52 = *(_DWORD *)(v17 + 308);
      if (*(_DWORD *)(v17 + 304) != a8)
        goto LABEL_52;
      v53 = *(double *)(v17 + 240);
      if (v53 < a1)
        v53 = a1;
      *(double *)(v17 + 240) = v53;
      v52 = v50 + a6;
      *(_DWORD *)(v17 + 308) = v50 + a6;
      *(_DWORD *)(v17 + 312) = v51 + 1;
      if ((v48 & 1) == 0)
      {
        v59 = BWE_CalcRxEstimate_New_g_in_rtp_counter++;
        *(_DWORD *)buf = -1;
        v60 = 0.0;
      }
      else
      {
LABEL_52:
        if (v52)
        {
          v54 = *(double *)(v17 + 240) - *(double *)(v17 + 232);
          v55 = 0.0;
          if (v52 >= 251)
          {
            v55 = (double)(8 * v52) / v54;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v56 = VRTraceErrorLogLevelToCSTR();
              v57 = *MEMORY[0x24BDFDC28];
              v58 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v115 = 136316418;
                  *(_QWORD *)&v115[4] = v56;
                  *(_WORD *)&v115[12] = 2080;
                  *(_QWORD *)&v115[14] = "BWE_CalcRxEstimate_New";
                  *(_WORD *)&v115[22] = 1024;
                  *(_DWORD *)&v115[24] = 892;
                  *(_WORD *)&v115[28] = 2048;
                  *(double *)&v115[30] = (double)(8 * v52) / v54;
                  *(_WORD *)&v115[38] = 1024;
                  *(_DWORD *)&v115[40] = v52;
                  *(_WORD *)&v115[44] = 2048;
                  *(double *)&v115[46] = v54;
                  _os_log_impl(&dword_215C5C000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ***** dBWD: %f = %d / %f ", v115, 0x36u);
                }
              }
              else if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v115 = 136316418;
                *(_QWORD *)&v115[4] = v56;
                *(_WORD *)&v115[12] = 2080;
                *(_QWORD *)&v115[14] = "BWE_CalcRxEstimate_New";
                *(_WORD *)&v115[22] = 1024;
                *(_DWORD *)&v115[24] = 892;
                *(_WORD *)&v115[28] = 2048;
                *(double *)&v115[30] = (double)(8 * v52) / v54;
                *(_WORD *)&v115[38] = 1024;
                *(_DWORD *)&v115[40] = v52;
                *(_WORD *)&v115[44] = 2048;
                *(double *)&v115[46] = v54;
                _os_log_debug_impl(&dword_215C5C000, v57, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ***** dBWD: %f = %d / %f ", v115, 0x36u);
              }
            }
          }
          v51 = *(_DWORD *)(v17 + 312);
        }
        else
        {
          v55 = 0.0;
          v54 = 0.0;
        }
        *(_DWORD *)(v17 + 304) = a4;
        *(_QWORD *)(v17 + 308) = 0;
        *(double *)(v17 + 232) = a1;
        *(_DWORD *)(v17 + 248) = a6;
        *(_QWORD *)(v17 + 240) = 0;
        v59 = BWE_CalcRxEstimate_New_g_in_rtp_counter++;
        *(_DWORD *)buf = -1;
        if (v55 <= 0.0)
          v60 = v55;
        else
          UpdateRxEstimate(v17, v51, v52, (int *)buf, v55, v54, a1);
      }
      v18 = v49;
      if (!g_iBWEstLogLevel_gck)
        goto LABEL_93;
      v61 = *(_DWORD *)(v17 + 428);
      if (v61 == -2)
      {
        if (v60 == 0.0)
          v100[0] = 0;
        else
          __sprintf_chk(v100, 0, 0x400uLL, "NEW AFRCCalcRxEstimate: [%d]  (%d %d)  //////\n");
      }
      else if (v61)
      {
        __sprintf_chk(v100, 0, 0x400uLL, "NEW AFRCCalcRxEstimate: [%d]  //////\n");
      }
      else
      {
        __sprintf_chk(v100, 0, 0x400uLL, "NEW AFRCCalcRxEstimate [%d]: [%f] //////\n/////tp: %d  ts/arr: %d/%f \t seq: %d sz: %d \t path: %d (%d)  BWD: %f/%f  Est: %f\n///// \t TS: %d  \t arrival: %f/%f \t total: %d/%d (%.1f ms) ref_size: %d\n", v59, *(_QWORD *)&a1, a3, a4);
      }
      if ((_DWORD)a3 == 1)
        v62 = 440;
      else
        v62 = 452;
      v63 = 460;
      if ((_DWORD)a3 == 1)
        v63 = 448;
      v64 = *(_DWORD *)(v17 + v63);
      if ((_DWORD)a3 == 1)
        v65 = 444;
      else
        v65 = 456;
      *(_DWORD *)(v17 + v63) = v64 + 1;
      if (*(_WORD *)(v17 + v65) && a5 - *(unsigned __int16 *)(v17 + v65) >= 2)
      {
        if (*(int *)(v17 + 428) <= 0)
        {
          *(_QWORD *)&v66 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v66 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v115[240] = v66;
          *(_OWORD *)&v115[224] = v66;
          *(_OWORD *)&v115[208] = v66;
          *(_OWORD *)&v115[192] = v66;
          *(_OWORD *)&v115[176] = v66;
          *(_OWORD *)&v115[160] = v66;
          *(_OWORD *)&v115[144] = v66;
          *(_OWORD *)&v115[128] = v66;
          *(_OWORD *)&v115[112] = v66;
          *(_OWORD *)&v115[96] = v66;
          *(_OWORD *)&v115[80] = v66;
          *(_OWORD *)&v115[64] = v66;
          *(_OWORD *)&v115[48] = v66;
          *(_OWORD *)&v115[32] = v66;
          *(_OWORD *)&v115[16] = v66;
          *(_OWORD *)v115 = v66;
          __sprintf_chk(v115, 0, 0x100uLL, "///// \t LOSS [%d/%d] @ %d: //////\n", *(_DWORD *)(v17 + v62), v64 + 1, a5);
          __strlcat_chk();
        }
        ++*(_DWORD *)(v17 + v62);
      }
      *(_WORD *)(v17 + v65) = a5;
      if (*(double *)(v17 + 496) == 0.0)
        *(double *)(v17 + 496) = a1;
      *(double *)(v17 + 504) = a1;
      if ((_DWORD)a3 == 1)
      {
        v67 = (_QWORD *)(v17 + 480);
      }
      else
      {
        if ((_DWORD)a3)
        {
LABEL_93:
          v19 = v97;
          goto LABEL_94;
        }
        v67 = (_QWORD *)(v17 + 488);
      }
      *v67 += a6;
      goto LABEL_93;
    }
    v21 = *(_DWORD *)(v17 + 568);
    if (v21 == (_DWORD)a4 || v21 == *(_DWORD *)(v17 + 572))
    {
LABEL_43:
      if ((_DWORD)a3 == 1)
      {
        v47 = *(_DWORD *)(v17 + 668);
        if (!v47)
          *(double *)(v17 + 672) = a1;
        *(double *)(v17 + 680) = a1;
        *(_DWORD *)(v17 + 668) = v47 + a6;
        *(_BYTE *)(v17 + 688) = a7;
        *(_DWORD *)(v17 + 568) = a4;
      }
      goto LABEL_47;
    }
    v22 = *(double *)(v17 + 264);
    v23 = *(double *)(v17 + 680) - *(double *)(v17 + 672);
    v24 = 0.0;
    if (v22 > 0.0)
      v24 = (double)(8 * *(_DWORD *)(v17 + 668)) / v22;
    if (v24 > v23)
      v23 = v24;
    if (v23 >= 0.1)
    {
      v25 = *(int *)(v17 + 584);
      if ((int)v25 <= 14)
      {
        v26 = v17 + 568 + 2 * v25;
        *(_WORD *)(v26 + 24) = *(_DWORD *)(v17 + 668);
        *(_WORD *)(v26 + 54) = (int)(v23 * 1000.0);
        *(_BYTE *)(v17 + 568 + v25 + 84) = *(_BYTE *)(v17 + 688);
      }
      *(_DWORD *)(v17 + 584) = v25 + 1;
    }
    ++*(_DWORD *)(v17 + 588);
    if (a1 - *(double *)(v17 + 576) <= 5.0)
    {
LABEL_42:
      *(_DWORD *)(v17 + 572) = v21;
      *(_DWORD *)(v17 + 668) = 0;
      goto LABEL_43;
    }
    v27 = *(_DWORD *)(v17 + 584);
    if (v27 < 1)
    {
LABEL_41:
      *(_DWORD *)(v17 + 588) = 0;
      *(double *)(v17 + 576) = a1;
      goto LABEL_42;
    }
    v96 = a9;
    v28 = 0;
    memset(v117, 170, 18);
    *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v116 = v29;
    *(_OWORD *)&v116[15] = v29;
    *(_OWORD *)&v115[241] = v29;
    *(_OWORD *)&v115[225] = v29;
    *(_OWORD *)&v115[209] = v29;
    *(_OWORD *)&v115[193] = v29;
    *(_OWORD *)&v115[177] = v29;
    *(_OWORD *)&v115[161] = v29;
    *(_OWORD *)&v115[145] = v29;
    *(_OWORD *)&v115[129] = v29;
    *(_OWORD *)&v115[113] = v29;
    *(_OWORD *)&v115[97] = v29;
    *(_OWORD *)&v115[81] = v29;
    *(_OWORD *)&v115[65] = v29;
    *(_OWORD *)&v115[49] = v29;
    *(_OWORD *)&v115[33] = v29;
    *(_OWORD *)&v115[17] = v29;
    if (v27 >= 0xF)
      v30 = 15;
    else
      v30 = v27;
    v31 = v17 + 652;
    *(_OWORD *)&v115[1] = v29;
    v115[0] = 0;
    do
    {
      v32 = v31 + 2 * v28;
      v33 = *(unsigned __int16 *)(v32 - 30);
      v34 = *(unsigned __int16 *)(v32 - 60);
      if (*(_BYTE *)(v31 + v28))
        v35 = 33;
      else
        v35 = 32;
      __sprintf_chk(v117, 0, 0x12uLL, "%ums(%u)%c ", v33, v34, v35);
      __strlcat_chk();
      ++v28;
    }
    while (v30 != v28);
    v36 = g_iBWEstLogLevel_gck;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v36)
    {
      a9 = v96;
      if (ErrorLogLevelForModule < 8)
        goto LABEL_40;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x24BDFDC28];
      v40 = *MEMORY[0x24BDFDC28];
      if (!*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v94 = *(_DWORD *)(v17 + 584);
          v95 = *(_DWORD *)(v17 + 588);
          *(_DWORD *)buf = 136316674;
          v102 = v38;
          v103 = 2080;
          v104 = "UpdateBigFrameReporter";
          v105 = 1024;
          v106 = 271;
          v107 = 2048;
          v108 = a1;
          v109 = 1024;
          v110 = v94;
          v111 = 1024;
          v112 = v95;
          v113 = 2080;
          v114 = v115;
          _os_log_debug_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\tBIG FRAME report at %.3f, %d/%d frames: %s", buf, 0x3Cu);
        }
        goto LABEL_40;
      }
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:
        *(_DWORD *)(v17 + 584) = 0;
        v21 = *(_DWORD *)(v17 + 568);
        v18 = a10;
        goto LABEL_41;
      }
      v41 = *(_DWORD *)(v17 + 584);
      v42 = *(_DWORD *)(v17 + 588);
      *(_DWORD *)buf = 136316674;
      v102 = v38;
      v103 = 2080;
      v104 = "UpdateBigFrameReporter";
      v105 = 1024;
      v106 = 271;
      v107 = 2048;
      v108 = a1;
      v109 = 1024;
      v110 = v41;
      v111 = 1024;
      v112 = v42;
      v113 = 2080;
      v114 = v115;
    }
    else
    {
      a9 = v96;
      if (ErrorLogLevelForModule < 7)
        goto LABEL_40;
      v44 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v45 = *(_DWORD *)(v17 + 584);
      v46 = *(_DWORD *)(v17 + 588);
      *(_DWORD *)buf = 136316674;
      v102 = v44;
      v103 = 2080;
      v104 = "UpdateBigFrameReporter";
      v105 = 1024;
      v106 = 274;
      v107 = 2048;
      v108 = a1;
      v109 = 1024;
      v110 = v45;
      v111 = 1024;
      v112 = v46;
      v113 = 2080;
      v114 = v115;
    }
    _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d \t\tBIG FRAME report at %.3f, %d/%d frames: %s", buf, 0x3Cu);
    goto LABEL_40;
  }
LABEL_94:
  v68 = GCK_BWE_CalcRxEstimate_g_in_rtp_counter++;
  pthread_mutex_unlock(v19);
  if (!g_iBWEstLogLevel_gck)
    goto LABEL_155;
  if (*(double *)(v17 + 528) == 0.0)
    *(double *)(v17 + 528) = a1;
  *(double *)(v17 + 536) = a1;
  if ((_DWORD)a3)
  {
    if ((_DWORD)a3 != 1)
      goto LABEL_102;
    *(_DWORD *)(v17 + 544) += a6;
    v69 = (_DWORD *)(v17 + 548);
  }
  else
  {
    *(_DWORD *)(v17 + 552) += a6;
    v69 = (_DWORD *)(v17 + 556);
  }
  ++*v69;
LABEL_102:
  v70 = *(_DWORD *)(v17 + 428);
  if (!*(_BYTE *)(v17 + 89))
  {
    if (!v70)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_155;
      v86 = VRTraceErrorLogLevelToCSTR();
      v87 = *MEMORY[0x24BDFDC28];
      v88 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v115 = 136318466;
          *(_QWORD *)&v115[4] = v86;
          *(_WORD *)&v115[12] = 2080;
          *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
          *(_WORD *)&v115[22] = 1024;
          *(_DWORD *)&v115[24] = 1292;
          *(_WORD *)&v115[28] = 1024;
          *(_DWORD *)&v115[30] = v68;
          *(_WORD *)&v115[34] = 1024;
          *(_DWORD *)&v115[36] = a3;
          *(_WORD *)&v115[40] = 1024;
          *(_DWORD *)&v115[42] = a4;
          *(_WORD *)&v115[46] = 2048;
          *(double *)&v115[48] = a1;
          *(_WORD *)&v115[56] = 1024;
          *(_DWORD *)&v115[58] = a5;
          *(_WORD *)&v115[62] = 1024;
          *(_DWORD *)&v115[64] = a6;
          *(_WORD *)&v115[68] = 1024;
          *(_DWORD *)&v115[70] = -1;
          *(_WORD *)&v115[74] = 1024;
          *(_DWORD *)&v115[76] = -1;
          *(_WORD *)&v115[80] = 2048;
          *(_QWORD *)&v115[82] = 0;
          *(_WORD *)&v115[90] = 2048;
          *(_QWORD *)&v115[92] = 0;
          *(_WORD *)&v115[100] = 2048;
          *(_QWORD *)&v115[102] = 0xBFF0000000000000;
          v74 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\n"
                "/////tp: %d  ts/arr: %d/%f \t seq: %d sz: %d \t path: %d (%d)  BWD: %f/%f  Est: %f\n";
          v75 = v87;
          v76 = 110;
          goto LABEL_132;
        }
        goto LABEL_155;
      }
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        goto LABEL_155;
      *(_DWORD *)v115 = 136318466;
      *(_QWORD *)&v115[4] = v86;
      *(_WORD *)&v115[12] = 2080;
      *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
      *(_WORD *)&v115[22] = 1024;
      *(_DWORD *)&v115[24] = 1292;
      *(_WORD *)&v115[28] = 1024;
      *(_DWORD *)&v115[30] = v68;
      *(_WORD *)&v115[34] = 1024;
      *(_DWORD *)&v115[36] = a3;
      *(_WORD *)&v115[40] = 1024;
      *(_DWORD *)&v115[42] = a4;
      *(_WORD *)&v115[46] = 2048;
      *(double *)&v115[48] = a1;
      *(_WORD *)&v115[56] = 1024;
      *(_DWORD *)&v115[58] = a5;
      *(_WORD *)&v115[62] = 1024;
      *(_DWORD *)&v115[64] = a6;
      *(_WORD *)&v115[68] = 1024;
      *(_DWORD *)&v115[70] = -1;
      *(_WORD *)&v115[74] = 1024;
      *(_DWORD *)&v115[76] = -1;
      *(_WORD *)&v115[80] = 2048;
      *(_QWORD *)&v115[82] = 0;
      *(_WORD *)&v115[90] = 2048;
      *(_QWORD *)&v115[92] = 0;
      *(_WORD *)&v115[100] = 2048;
      *(_QWORD *)&v115[102] = 0xBFF0000000000000;
      v91 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\n"
            "/////tp: %d  ts/arr: %d/%f \t seq: %d sz: %d \t path: %d (%d)  BWD: %f/%f  Est: %f\n";
      v92 = v87;
      v93 = 110;
LABEL_147:
      _os_log_debug_impl(&dword_215C5C000, v92, OS_LOG_TYPE_DEBUG, v91, v115, v93);
      goto LABEL_155;
    }
    if (v70 != -2 || !v100[0])
    {
      if (v70 != -1 && a1 - *(double *)(v17 + 432) <= (double)v70 / 1000000.0)
        goto LABEL_155;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_154;
      v89 = VRTraceErrorLogLevelToCSTR();
      v83 = *MEMORY[0x24BDFDC28];
      v90 = *MEMORY[0x24BDFDC28];
      if (!*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
          GCK_BWE_CalcRxEstimate_cold_2();
        goto LABEL_154;
      }
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v115 = 136316162;
        *(_QWORD *)&v115[4] = v89;
        *(_WORD *)&v115[12] = 2080;
        *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
        *(_WORD *)&v115[22] = 1024;
        *(_DWORD *)&v115[24] = 1306;
        *(_WORD *)&v115[28] = 1024;
        *(_DWORD *)&v115[30] = -1;
        *(_WORD *)&v115[34] = 2080;
        *(_QWORD *)&v115[36] = v100;
        v85 = " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n";
        goto LABEL_139;
      }
LABEL_154:
      *(double *)(v17 + 432) = a1;
      goto LABEL_155;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_155;
    v77 = VRTraceErrorLogLevelToCSTR();
    v78 = *MEMORY[0x24BDFDC28];
    v79 = *MEMORY[0x24BDFDC28];
    if (!*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        GCK_BWE_CalcRxEstimate_cold_1();
      goto LABEL_155;
    }
    if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      goto LABEL_155;
    *(_DWORD *)v115 = 136316162;
    *(_QWORD *)&v115[4] = v77;
    *(_WORD *)&v115[12] = 2080;
    *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
    *(_WORD *)&v115[22] = 1024;
    *(_DWORD *)&v115[24] = 1300;
    *(_WORD *)&v115[28] = 1024;
    *(_DWORD *)&v115[30] = -1;
    *(_WORD *)&v115[34] = 2080;
    *(_QWORD *)&v115[36] = v100;
    v74 = " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n";
LABEL_122:
    v75 = v78;
    v76 = 44;
    goto LABEL_132;
  }
  if (v70 == -2)
  {
    if (!v100[0] || (int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_155;
    v80 = VRTraceErrorLogLevelToCSTR();
    v78 = *MEMORY[0x24BDFDC28];
    v81 = *MEMORY[0x24BDFDC28];
    if (!*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        GCK_BWE_CalcRxEstimate_cold_4();
      goto LABEL_155;
    }
    if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      goto LABEL_155;
    *(_DWORD *)v115 = 136316162;
    *(_QWORD *)&v115[4] = v80;
    *(_WORD *)&v115[12] = 2080;
    *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
    *(_WORD *)&v115[22] = 1024;
    *(_DWORD *)&v115[24] = 1268;
    *(_WORD *)&v115[28] = 1024;
    *(_DWORD *)&v115[30] = -1;
    *(_WORD *)&v115[34] = 2080;
    *(_QWORD *)&v115[36] = v100;
    v74 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s\n";
    goto LABEL_122;
  }
  if (v70 == -1)
  {
LABEL_124:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v82 = VRTraceErrorLogLevelToCSTR();
      v83 = *MEMORY[0x24BDFDC28];
      v84 = *MEMORY[0x24BDFDC28];
      if (!*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          GCK_BWE_CalcRxEstimate_cold_3();
        goto LABEL_154;
      }
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v115 = 136316162;
        *(_QWORD *)&v115[4] = v82;
        *(_WORD *)&v115[12] = 2080;
        *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
        *(_WORD *)&v115[22] = 1024;
        *(_DWORD *)&v115[24] = 1275;
        *(_WORD *)&v115[28] = 1024;
        *(_DWORD *)&v115[30] = -1;
        *(_WORD *)&v115[34] = 2080;
        *(_QWORD *)&v115[36] = v100;
        v85 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s";
LABEL_139:
        _os_log_impl(&dword_215C5C000, v83, OS_LOG_TYPE_DEFAULT, v85, v115, 0x2Cu);
        goto LABEL_154;
      }
    }
    goto LABEL_154;
  }
  if (v70)
  {
    if (a1 - *(double *)(v17 + 432) <= (double)v70 / 1000000.0)
      goto LABEL_155;
    goto LABEL_124;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_155;
  v71 = VRTraceErrorLogLevelToCSTR();
  v72 = *MEMORY[0x24BDFDC28];
  v73 = *MEMORY[0x24BDFDC28];
  if (!*MEMORY[0x24BDFDC18])
  {
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      goto LABEL_155;
    *(_DWORD *)v115 = 136318722;
    *(_QWORD *)&v115[4] = v71;
    *(_WORD *)&v115[12] = 2080;
    *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
    *(_WORD *)&v115[22] = 1024;
    *(_DWORD *)&v115[24] = 1260;
    *(_WORD *)&v115[28] = 1024;
    *(_DWORD *)&v115[30] = v68;
    *(_WORD *)&v115[34] = 1024;
    *(_DWORD *)&v115[36] = a3;
    *(_WORD *)&v115[40] = 1024;
    *(_DWORD *)&v115[42] = a4;
    *(_WORD *)&v115[46] = 2048;
    *(double *)&v115[48] = a1;
    *(_WORD *)&v115[56] = 1024;
    *(_DWORD *)&v115[58] = a5;
    *(_WORD *)&v115[62] = 1024;
    *(_DWORD *)&v115[64] = a6;
    *(_WORD *)&v115[68] = 1024;
    *(_DWORD *)&v115[70] = -1;
    *(_WORD *)&v115[74] = 1024;
    *(_DWORD *)&v115[76] = -1;
    *(_WORD *)&v115[80] = 2048;
    *(_QWORD *)&v115[82] = 0;
    *(_WORD *)&v115[90] = 2048;
    *(_QWORD *)&v115[92] = 0;
    *(_WORD *)&v115[100] = 2048;
    *(_QWORD *)&v115[102] = 0xBFF0000000000000;
    *(_WORD *)&v115[110] = 2080;
    *(_QWORD *)&v115[112] = v100;
    v91 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\n"
          "/////tp: %d  ts/arr: %d/%f \t seq: %d sz: %d \t path: %d (%d)  BWD: %f/%f  Est: %f\n"
          "%s";
    v92 = v72;
    v93 = 120;
    goto LABEL_147;
  }
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v115 = 136318722;
    *(_QWORD *)&v115[4] = v71;
    *(_WORD *)&v115[12] = 2080;
    *(_QWORD *)&v115[14] = "GCK_BWE_CalcRxEstimate";
    *(_WORD *)&v115[22] = 1024;
    *(_DWORD *)&v115[24] = 1260;
    *(_WORD *)&v115[28] = 1024;
    *(_DWORD *)&v115[30] = v68;
    *(_WORD *)&v115[34] = 1024;
    *(_DWORD *)&v115[36] = a3;
    *(_WORD *)&v115[40] = 1024;
    *(_DWORD *)&v115[42] = a4;
    *(_WORD *)&v115[46] = 2048;
    *(double *)&v115[48] = a1;
    *(_WORD *)&v115[56] = 1024;
    *(_DWORD *)&v115[58] = a5;
    *(_WORD *)&v115[62] = 1024;
    *(_DWORD *)&v115[64] = a6;
    *(_WORD *)&v115[68] = 1024;
    *(_DWORD *)&v115[70] = -1;
    *(_WORD *)&v115[74] = 1024;
    *(_DWORD *)&v115[76] = -1;
    *(_WORD *)&v115[80] = 2048;
    *(_QWORD *)&v115[82] = 0;
    *(_WORD *)&v115[90] = 2048;
    *(_QWORD *)&v115[92] = 0;
    *(_WORD *)&v115[100] = 2048;
    *(_QWORD *)&v115[102] = 0xBFF0000000000000;
    *(_WORD *)&v115[110] = 2080;
    *(_QWORD *)&v115[112] = v100;
    v74 = " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\n"
          "/////tp: %d  ts/arr: %d/%f \t seq: %d sz: %d \t path: %d (%d)  BWD: %f/%f  Est: %f\n"
          "%s";
    v75 = v72;
    v76 = 120;
LABEL_132:
    _os_log_impl(&dword_215C5C000, v75, OS_LOG_TYPE_DEFAULT, v74, v115, v76);
  }
LABEL_155:
  *(_QWORD *)(v17 + 256) = 0xBFF0000000000000;
  *v18 = (*(double *)(v17 + 264) / 1000.0);
  CheckOutHandleDebug();
  return 0;
}

uint64_t BWEstCheckIfLargeFrameNeeded(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = micro();
  if (*(double *)(a1 + 360) == 0.0)
  {
    *(double *)(a1 + 400) = v2;
    v3 = v2;
  }
  else
  {
    v3 = *(double *)(a1 + 400);
  }
  v4 = v2 - v3;
  v5 = 2.0;
  if (v4 >= 10.0 && *(int *)(a1 + 408) >= 5)
    v5 = 10.0;
  if (*(_BYTE *)(a1 + 416))
    *(_BYTE *)(a1 + 416) = 0;
  v6 = 5 * *(_DWORD *)(a1 + 8);
  v7 = (v6 >> 1) & 0x1FFFFFFF;
  if (((v6 >> 2) & 0xFFFFFFF) < 0x55F)
  {
    v9 = 20 * *(_DWORD *)(a1 + 8);
    v10 = v9 >> 4;
    if (v9 <= 0x897)
      v7 = 257;
    if (v10 <= 0x100)
      v11 = 256;
    else
      v11 = v9 >> 4;
    if (v9 >= 0xFA0)
      v12 = 2;
    else
      v12 = 1;
    if (v9 >= 0xFA0)
      v7 = v11 + 1;
    if (v10 >= 0x36B)
      v8 = 3;
    else
      v8 = v12;
    if (v10 >= 0x36B)
      v7 = (unsigned __int16)(20 * *(_WORD *)(a1 + 8)) / 0x18u + 1;
  }
  else
  {
    v8 = 2;
    do
      ++v8;
    while (v7 / v8 > *(_DWORD *)(a1 + 84));
    v7 = v7 / v8 + 1;
  }
  *(_DWORD *)(a1 + 388) = v7;
  *(_DWORD *)(a1 + 392) = v8;
  v13 = v7 * v8;
  *(_DWORD *)(a1 + 380) = v13;
  if (v2 - *(double *)(a1 + 368) < v5)
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    v16 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315906;
        v19 = v14;
        v20 = 2080;
        v21 = "BWEstCheckIfLargeFrameNeeded";
        v22 = 1024;
        v23 = 1730;
        v24 = 1024;
        v25 = v13;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ LARGE frame req'd of %d ", (uint8_t *)&v18, 0x22u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BWEstCheckIfLargeFrameNeeded_cold_1();
    }
  }
  return v13;
}

uint64_t GCK_BWE_TrackLargeFrameState(uint64_t a1, unsigned int a2, unsigned int a3, char *a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  double v25;
  int v26;
  double v27;
  unsigned int v28;
  double v29;
  double v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  double v36;
  int v37;
  double v38;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  int v43;
  int v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  unsigned int v66;
  int v67;
  int v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  _BYTE v78[10];
  _BYTE v79[10];
  __int16 v80;
  unsigned int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 9)
    v6 = a3;
  else
    v6 = 0;
  v7 = CheckInHandleDebug();
  if (!v7)
    return 2149908482;
  v8 = v7;
  v9 = *(_BYTE *)(v7 + 88);
  if (v9)
  {
    v10 = *(_DWORD *)(v7 + 380);
    if (!v10)
    {
      v9 = *(_BYTE *)(v7 + 384) != 0;
      if (!a4)
        goto LABEL_33;
      goto LABEL_32;
    }
    if (v10 > a2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x24BDFDC28];
        v13 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v71 = 136315906;
            v72 = v11;
            v73 = 2080;
            v74 = "GCK_BWE_TrackLargeFrameState";
            v75 = 1024;
            v76 = 1864;
            v77 = 1024;
            *(_DWORD *)v78 = a2;
            _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ new frame of %d ", (uint8_t *)&v71, 0x22u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          GCK_BWE_TrackLargeFrameState_cold_1();
        }
      }
      goto LABEL_30;
    }
    v15 = *(double *)(v7 + 224);
    v16 = v15 * 0.5;
    v17 = v16 + v16;
    v18 = micro();
    if (*(_DWORD *)(v8 + 376))
    {
      v19 = v15 + *(double *)(v8 + 360);
      *(double *)(v8 + 360) = v19;
      if (v19 < v18 - v17)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x24BDFDC28];
          v22 = *MEMORY[0x24BDFDC28];
          if (*MEMORY[0x24BDFDC18])
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = *(_QWORD *)(v8 + 360);
              v71 = 136316162;
              v72 = v20;
              v73 = 2080;
              v74 = "GCK_BWE_TrackLargeFrameState";
              v75 = 1024;
              v76 = 1890;
              v77 = 2048;
              *(_QWORD *)v78 = v23;
              *(_WORD *)&v78[8] = 2048;
              *(double *)v79 = v18 - v17;
              _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ detected GAP; adusting ProbeSeq from %.3f to %.3f ",
                (uint8_t *)&v71,
                0x30u);
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v69 = *(_QWORD *)(v8 + 360);
            v71 = 136316162;
            v72 = v20;
            v73 = 2080;
            v74 = "GCK_BWE_TrackLargeFrameState";
            v75 = 1024;
            v76 = 1890;
            v77 = 2048;
            *(_QWORD *)v78 = v69;
            *(_WORD *)&v78[8] = 2048;
            *(double *)v79 = v18 - v17;
            _os_log_debug_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ^^^^^ detected GAP; adusting ProbeSeq from %.3f to %.3f ",
              (uint8_t *)&v71,
              0x30u);
          }
        }
        *(double *)(v8 + 360) = v18 - v17;
      }
      v36 = *(double *)(v8 + 368);
      *(double *)(v8 + 368) = v18;
      v37 = *(_DWORD *)(v8 + 408) + 1;
      *(_DWORD *)(v8 + 408) = v37;
      v38 = *(double *)(v8 + 400);
      v39 = *(_DWORD *)(v8 + 412) + v6;
      *(_DWORD *)(v8 + 412) = v39;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v40 = v18 - v36;
        v41 = v18 - v38;
        v42 = (v18 - v38) / (double)v37;
        v43 = (int)((double)(8 * v6) / v40);
        v44 = (int)((double)(int)(8 * v39) / v41);
        v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x24BDFDC28];
        v47 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = *(_DWORD *)(v8 + 380);
            v71 = 136317186;
            v72 = v45;
            v73 = 2080;
            v74 = "GCK_BWE_TrackLargeFrameState";
            v75 = 1024;
            v76 = 1915;
            v77 = 1024;
            *(_DWORD *)v78 = a2;
            *(_WORD *)&v78[4] = 1024;
            *(_DWORD *)&v78[6] = v48;
            *(_WORD *)v79 = 2048;
            *(double *)&v79[2] = v42;
            v80 = 1024;
            v81 = v6;
            v82 = 1024;
            v83 = v43;
            v84 = 1024;
            v85 = v44;
            _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ requested LARGE frame of %d size ARRIVED (req %d) rate: %.3f \t waste: %d (%d %d)", (uint8_t *)&v71, 0x44u);
          }
        }
        else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v68 = *(_DWORD *)(v8 + 380);
          v71 = 136317186;
          v72 = v45;
          v73 = 2080;
          v74 = "GCK_BWE_TrackLargeFrameState";
          v75 = 1024;
          v76 = 1915;
          v77 = 1024;
          *(_DWORD *)v78 = a2;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v68;
          *(_WORD *)v79 = 2048;
          *(double *)&v79[2] = v42;
          v80 = 1024;
          v81 = v6;
          v82 = 1024;
          v83 = v43;
          v84 = 1024;
          v85 = v44;
          _os_log_debug_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ^^^^^ requested LARGE frame of %d size ARRIVED (req %d) rate: %.3f \t waste: %d (%d %d)", (uint8_t *)&v71, 0x44u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v49 = VRTraceErrorLogLevelToCSTR();
        v50 = *MEMORY[0x24BDFDC28];
        v51 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          v52 = *(_DWORD *)v8;
          v53 = *(_DWORD *)(v8 + 4);
          v54 = *(_DWORD *)v8 / 0x3E8u;
          v55 = *(_DWORD *)(v8 + 8);
          v71 = 136316674;
          v72 = v49;
          v73 = 2080;
          v74 = "GCK_BWE_TrackLargeFrameState";
          v75 = 1024;
          v76 = 1921;
          v77 = 1024;
          *(_DWORD *)v78 = v54;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v55;
          *(_WORD *)v79 = 2048;
          *(double *)&v79[2] = (double)v6 * 100.0 * 8.0 / (double)v52;
          v80 = 1024;
          v81 = v53 / 0x3E8;
          v56 = " [%s] %s:%d \t\t\t\t\t\t\t\t\t\t\t^^^^^ Tx/RxRate: %d/%d  (LF waste ratio: %.1f%%) Avg: %d  ";
          v57 = v50;
          v58 = 56;
LABEL_55:
          _os_log_impl(&dword_215C5C000, v57, OS_LOG_TYPE_DEFAULT, v56, (uint8_t *)&v71, v58);
          goto LABEL_58;
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v59 = *(_DWORD *)v8;
          v60 = *(_DWORD *)(v8 + 4);
          v61 = *(_DWORD *)v8 / 0x3E8u;
          v62 = *(_DWORD *)(v8 + 8);
          v71 = 136316674;
          v72 = v49;
          v73 = 2080;
          v74 = "GCK_BWE_TrackLargeFrameState";
          v75 = 1024;
          v76 = 1921;
          v77 = 1024;
          *(_DWORD *)v78 = v61;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v62;
          *(_WORD *)v79 = 2048;
          *(double *)&v79[2] = (double)v6 * 100.0 * 8.0 / (double)v59;
          v80 = 1024;
          v81 = v60 / 0x3E8;
          _os_log_debug_impl(&dword_215C5C000, v50, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\t\t\t\t\t\t\t\t\t\t^^^^^ Tx/RxRate: %d/%d  (LF waste ratio: %.1f%%) Avg: %d  ", (uint8_t *)&v71, 0x38u);
        }
      }
    }
    else
    {
      v24 = v18 - *(double *)(v8 + 368);
      if (v24 <= v16)
      {
LABEL_30:
        v9 = 0;
        *(_BYTE *)(v8 + 384) = 0;
        goto LABEL_31;
      }
      v25 = v15 + *(double *)(v8 + 360);
      if (v25 > v18 + v17)
        v25 = v18 + v17;
      *(double *)(v8 + 360) = v25;
      *(double *)(v8 + 368) = v18;
      v26 = *(_DWORD *)(v8 + 408) + 1;
      *(_DWORD *)(v8 + 408) = v26;
      v27 = *(double *)(v8 + 400);
      v28 = *(_DWORD *)(v8 + 412) + v6;
      *(_DWORD *)(v8 + 412) = v28;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v29 = v18 - v27;
        v30 = (v18 - v27) / (double)v26;
        v31 = (int)((double)(int)(8 * v28) / v29);
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x24BDFDC28];
        v34 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(_DWORD *)(v8 + 380);
            v71 = 136317186;
            v72 = v32;
            v73 = 2080;
            v74 = "GCK_BWE_TrackLargeFrameState";
            v75 = 1024;
            v76 = 1975;
            v77 = 1024;
            *(_DWORD *)v78 = a2;
            *(_WORD *)&v78[4] = 1024;
            *(_DWORD *)&v78[6] = v35;
            *(_WORD *)v79 = 2048;
            *(double *)&v79[2] = v30;
            v80 = 1024;
            v81 = v6;
            v82 = 1024;
            v83 = (int)((double)(8 * v6) / v24);
            v84 = 1024;
            v85 = v31;
            _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ a LARGE frame of %d size OBSERVED (req %d) rate: %.3f \t waste: %d (%d %d)", (uint8_t *)&v71, 0x44u);
          }
        }
        else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v70 = *(_DWORD *)(v8 + 380);
          v71 = 136317186;
          v72 = v32;
          v73 = 2080;
          v74 = "GCK_BWE_TrackLargeFrameState";
          v75 = 1024;
          v76 = 1975;
          v77 = 1024;
          *(_DWORD *)v78 = a2;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v70;
          *(_WORD *)v79 = 2048;
          *(double *)&v79[2] = v30;
          v80 = 1024;
          v81 = v6;
          v82 = 1024;
          v83 = (int)((double)(8 * v6) / v24);
          v84 = 1024;
          v85 = v31;
          _os_log_debug_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ^^^^^ a LARGE frame of %d size OBSERVED (req %d) rate: %.3f \t waste: %d (%d %d)", (uint8_t *)&v71, 0x44u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v63 = VRTraceErrorLogLevelToCSTR();
        v64 = *MEMORY[0x24BDFDC28];
        v65 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          v66 = *(_DWORD *)v8 / 0x3E8u;
          v67 = *(_DWORD *)(v8 + 8);
          v71 = 136316162;
          v72 = v63;
          v73 = 2080;
          v74 = "GCK_BWE_TrackLargeFrameState";
          v75 = 1024;
          v76 = 1977;
          v77 = 1024;
          *(_DWORD *)v78 = v66;
          *(_WORD *)&v78[4] = 1024;
          *(_DWORD *)&v78[6] = v67;
          v56 = " [%s] %s:%d \t\t\t\t\t\t\t\t\t\t\t^^^^^ Tx/RxRate: %d/%d  ";
          v57 = v64;
          v58 = 40;
          goto LABEL_55;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          GCK_BWE_TrackLargeFrameState_cold_2(v63, (unsigned int *)v8, v64);
      }
    }
LABEL_58:
    v9 = 1;
    *(_BYTE *)(v8 + 384) = 1;
    if (!a4)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_31:
  if (a4)
LABEL_32:
    *a4 = v9;
LABEL_33:
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCK_BWE_CreateHandle(uint64_t *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t Handle;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  CFIndex AppIntegerValue;
  BOOL v14;
  char v15;
  CFIndex v16;
  BOOL v17;
  char v18;
  double v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  CFIndex v26;
  BOOL v27;
  char v28;
  CFIndex v29;
  BOOL v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  int v49;
  int v50;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  _BYTE v71[14];
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v6 = malloc_type_calloc(1uLL, 0x2B8uLL, 0x1000040040ACAD7uLL);
  if (v6)
  {
    v7 = v6;
    Handle = CreateHandle();
    *a1 = Handle;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (Handle == 0xFFFFFFFFLL)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCK_BWE_CreateHandle_cold_3();
      }
      free(v7);
      return 2149908485;
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *a1;
          *(_DWORD *)buf = 136316162;
          v63 = v10;
          v64 = 2080;
          v65 = "GCK_BWE_CreateHandle";
          v66 = 1024;
          v67 = 2057;
          v68 = 1024;
          v69 = v12;
          v70 = 2048;
          *(_QWORD *)v71 = v7;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCK_BWE_CreateHandle: %d/%p ", buf, 0x2Cu);
        }
      }
      *v7 = 0;
      *((_DWORD *)v7 + 2) = 0;
      pthread_mutex_init((pthread_mutex_t *)(v7 + 2), 0);
      v7[36] = 0;
      *((_BYTE *)v7 + 300) = 0;
      v7[38] = 0;
      *((_DWORD *)v7 + 78) = 0;
      *((_DWORD *)v7 + 74) = 0;
      v7[54] = 0;
      *((_BYTE *)v7 + 416) = 0;
      *((_DWORD *)v7 + 110) = 0;
      *((_WORD *)v7 + 222) = 0;
      v7[56] = 0;
      *((_WORD *)v7 + 228) = 0;
      v7[29] = 0;
      v7[30] = 0;
      *((_DWORD *)v7 + 62) = 0;
      v7[33] = 0;
      v7[34] = 0;
      v7[32] = 0;
      *((_DWORD *)v7 + 70) = 0;
      *(_QWORD *)((char *)v7 + 468) = 0;
      *(_QWORD *)((char *)v7 + 460) = 0;
      *((_OWORD *)v7 + 30) = 0u;
      *((_OWORD *)v7 + 31) = 0u;
      *(_OWORD *)((char *)v7 + 508) = 0u;
      *((_OWORD *)v7 + 33) = 0u;
      *((_OWORD *)v7 + 34) = 0u;
      keyExistsAndHasValidFormat = 0;
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BWEstEnableNewEstSenderSide"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v14 = AppIntegerValue == 0;
      else
        v14 = 0;
      v15 = !v14;
      *((_BYTE *)v7 + 90) = v15;
      v16 = CFPreferencesGetAppIntegerValue(CFSTR("BWEstEnableNewEstRecvrSide"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v17 = v16 == 0;
      else
        v17 = 0;
      v18 = !v17;
      *((_BYTE *)v7 + 91) = v18;
      v19 = (double)(int)CFPreferencesGetAppIntegerValue(CFSTR("BWEstProbeInterval"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat)/ 1000000.0;
      if (!keyExistsAndHasValidFormat)
        v19 = 0.666;
      *((double *)v7 + 28) = v19;
      v20 = CFPreferencesGetAppIntegerValue(CFSTR("BWEstLogType"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v21 = v20;
      else
        v21 = 0;
      *((_DWORD *)v7 + 106) = v21;
      v22 = CFPreferencesGetAppIntegerValue(CFSTR("BWEstLogLevel"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v23 = v22;
      else
        v23 = 0;
      g_iBWEstLogLevel_gck = v23;
      v24 = CFPreferencesGetAppIntegerValue(CFSTR("BWEstDemoLogInterval"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v25 = v24;
      else
        v25 = 1000000;
      *((_DWORD *)v7 + 107) = v25;
      v26 = CFPreferencesGetAppIntegerValue(CFSTR("HackUploadBW"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v27 = v26 == 0;
      else
        v27 = 1;
      v28 = !v27;
      *((_BYTE *)v7 + 357) = v28;
      v29 = CFPreferencesGetAppIntegerValue(CFSTR("V1BWE"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v30 = v29 == 0;
      else
        v30 = 1;
      v31 = !v30;
      *((_BYTE *)v7 + 356) = v31;
      if ((int)VRTraceGetErrorLogLevelForModule() > 7)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x24BDFDC28];
        v34 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *((unsigned __int8 *)v7 + 357);
            v36 = *((unsigned __int8 *)v7 + 356);
            *(_DWORD *)buf = 136316162;
            v63 = v32;
            v64 = 2080;
            v65 = "BWEstConfigureDefaults";
            v66 = 1024;
            v67 = 1394;
            v68 = 1024;
            v69 = v35;
            v70 = 1024;
            *(_DWORD *)v71 = v36;
            _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HackUploadBW: %d  V1BWE: %d ", buf, 0x28u);
          }
        }
        else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          v52 = *((unsigned __int8 *)v7 + 357);
          v53 = *((unsigned __int8 *)v7 + 356);
          *(_DWORD *)buf = 136316162;
          v63 = v32;
          v64 = 2080;
          v65 = "BWEstConfigureDefaults";
          v66 = 1024;
          v67 = 1394;
          v68 = 1024;
          v69 = v52;
          v70 = 1024;
          *(_DWORD *)v71 = v53;
          _os_log_debug_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEBUG, " [%s] %s:%d HackUploadBW: %d  V1BWE: %d ", buf, 0x28u);
        }
      }
      *((_WORD *)v7 + 44) = 0;
      *((_BYTE *)v7 + 560) = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x24BDFDC28];
        v40 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = *((unsigned __int8 *)v7 + 91);
            v42 = *((unsigned __int8 *)v7 + 90);
            v43 = v7[28];
            v44 = *((_DWORD *)v7 + 107);
            v45 = *((_DWORD *)v7 + 106);
            *(_DWORD *)buf = 136317186;
            v63 = v38;
            v64 = 2080;
            v65 = "BWEstInit";
            v66 = 1024;
            v67 = 1485;
            v68 = 1024;
            v69 = v41;
            v70 = 1024;
            *(_DWORD *)v71 = v42;
            *(_WORD *)&v71[4] = 2048;
            *(_QWORD *)&v71[6] = v43;
            v72 = 1024;
            v73 = v44;
            v74 = 1024;
            v75 = v45;
            v76 = 1024;
            v77 = g_iBWEstLogLevel_gck;
            _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ////^^^^ Initial BWEstEnableNewst_Recvr/_Sender %d/%d  \t BWEstProbeInterval: %f  BWEstDemoLogInterval: %d  BWEstLogType: %d  BWEstLogLevel: %x \n", buf, 0x44u);
          }
        }
        else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v54 = *((unsigned __int8 *)v7 + 91);
          v55 = *((unsigned __int8 *)v7 + 90);
          v56 = v7[28];
          v57 = *((_DWORD *)v7 + 107);
          v58 = *((_DWORD *)v7 + 106);
          *(_DWORD *)buf = 136317186;
          v63 = v38;
          v64 = 2080;
          v65 = "BWEstInit";
          v66 = 1024;
          v67 = 1485;
          v68 = 1024;
          v69 = v54;
          v70 = 1024;
          *(_DWORD *)v71 = v55;
          *(_WORD *)&v71[4] = 2048;
          *(_QWORD *)&v71[6] = v56;
          v72 = 1024;
          v73 = v57;
          v74 = 1024;
          v75 = v58;
          v76 = 1024;
          v77 = g_iBWEstLogLevel_gck;
          _os_log_debug_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ////^^^^ Initial BWEstEnableNewst_Recvr/_Sender %d/%d  \t BWEstProbeInterval: %f  BWEstDemoLogInterval: %d  BWEstLogType: %d  BWEstLogLevel: %x \n", buf, 0x44u);
        }
      }
      if (*((_BYTE *)v7 + 357) || *((_BYTE *)v7 + 356))
      {
        v7[43] = 0;
        *((_DWORD *)v7 + 88) = 0;
        v7[40] = 0;
        v7[41] = 0;
        *((_DWORD *)v7 + 84) = 0;
      }
      *((_DWORD *)v7 + 20) = a2;
      *((_DWORD *)v7 + 21) = a3;
      if (!*((_BYTE *)v7 + 88) && !*((_BYTE *)v7 + 89))
      {
        *((_WORD *)v7 + 44) = *((_WORD *)v7 + 45);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v46 = VRTraceErrorLogLevelToCSTR();
          v47 = *MEMORY[0x24BDFDC28];
          v48 = *MEMORY[0x24BDFDC28];
          if (*MEMORY[0x24BDFDC18])
          {
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = *((unsigned __int8 *)v7 + 88);
              v50 = *((unsigned __int8 *)v7 + 89);
              *(_DWORD *)buf = 136316162;
              v63 = v46;
              v64 = 2080;
              v65 = "BWE_SetBWEstMode";
              v66 = 1024;
              v67 = 2026;
              v68 = 1024;
              v69 = v49;
              v70 = 1024;
              *(_DWORD *)v71 = v50;
              _os_log_impl(&dword_215C5C000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ////^^^^ AFRCSetBWEstMode: Sender/Recvr %d/%d ", buf, 0x28u);
            }
          }
          else if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v59 = *((unsigned __int8 *)v7 + 88);
            v60 = *((unsigned __int8 *)v7 + 89);
            *(_DWORD *)buf = 136316162;
            v63 = v46;
            v64 = 2080;
            v65 = "BWE_SetBWEstMode";
            v66 = 1024;
            v67 = 2026;
            v68 = 1024;
            v69 = v59;
            v70 = 1024;
            *(_DWORD *)v71 = v60;
            _os_log_debug_impl(&dword_215C5C000, v47, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ////^^^^ AFRCSetBWEstMode: Sender/Recvr %d/%d ", buf, 0x28u);
          }
        }
        *((_BYTE *)v7 + 96) = 1;
      }
      v37 = 0;
      *((_DWORD *)v7 + 23) = *((unsigned __int8 *)v7 + 96);
    }
  }
  else
  {
    v37 = 2149908483;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          GCK_BWE_CreateHandle_cold_1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_FAULT))
      {
        GCK_BWE_CreateHandle_cold_2();
      }
    }
  }
  return v37;
}

uint64_t GCK_BWE_CloseHandle()
{
  uint64_t v0;
  uint64_t v1;
  int ErrorLogLevelForModule;
  _BYTE *v3;
  NSObject **v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  int v15;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  int v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  double v36;
  int v37;
  double v38;
  int v39;
  int v40;
  double v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  int v47;
  int v48;
  double v49;
  int v50;
  double v51;
  int v52;
  double v53;
  int v54;
  int v55;
  double v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  _BYTE v66[10];
  _BYTE v67[14];
  _BYTE v68[42];
  __int16 v69;
  _BYTE v70[14];
  __int16 v71;
  _BYTE v72[14];
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v0 = CheckInHandleDebug();
  if (!v0)
    return 2149908482;
  v1 = v0;
  CheckOutHandleDebug();
  pthread_mutex_destroy((pthread_mutex_t *)(v1 + 16));
  if (g_iBWEstLogLevel_gck)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v3 = (_BYTE *)MEMORY[0x24BDFDC18];
    v4 = (NSObject **)MEMORY[0x24BDFDC28];
    if (ErrorLogLevelForModule >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      v7 = *v4;
      if (*v3)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_DWORD *)(v1 + 440);
          v9 = *(_DWORD *)(v1 + 448);
          v10 = *(unsigned __int16 *)(v1 + 444);
          v11 = *(_DWORD *)(v1 + 452);
          v12 = *(_DWORD *)(v1 + 460);
          v13 = *(unsigned __int16 *)(v1 + 456);
          v14 = *(double *)(v1 + 464);
          v15 = *(_DWORD *)(v1 + 472);
          v59 = 136317698;
          v60 = v5;
          v61 = 2080;
          v62 = "BWEstUninit";
          v63 = 1024;
          v64 = 1513;
          v65 = 1024;
          *(_DWORD *)v66 = v8;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v9;
          *(_WORD *)v67 = 1024;
          *(_DWORD *)&v67[2] = v10;
          *(_WORD *)&v67[6] = 1024;
          *(_DWORD *)&v67[8] = v11;
          *(_WORD *)&v67[12] = 1024;
          *(_DWORD *)v68 = v12;
          *(_WORD *)&v68[4] = 1024;
          *(_DWORD *)&v68[6] = v13;
          *(_WORD *)&v68[10] = 2048;
          *(double *)&v68[12] = v14 / (double)v15;
          *(_WORD *)&v68[20] = 1024;
          *(_DWORD *)&v68[22] = v15;
          _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ////////////////// Loss event reports //////////////////////////\n///// Video: %d/%d\tlast seq#: %d \t\t Audio: %d/%d last seq#: %d\n///// Avg. BW: %f  \t  with %d reports\n///////////////////////////////////////////////////////\n", (uint8_t *)&v59, 0x50u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        GCK_BWE_CloseHandle_cold_1(v5, v1, v6);
      }
    }
    v18 = *(double *)(v1 + 496);
    v17 = *(double *)(v1 + 504);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v19 = v17 - v18;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *v4;
      v22 = *v4;
      if (*v3)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(v1 + 480);
          v24 = *(_QWORD *)(v1 + 488);
          v25 = (double)v23 * 0.0009765625;
          v26 = *(_DWORD *)(v1 + 448);
          v27 = (int)((double)v23 / (double)v26);
          v28 = (double)(8 * v23) / v19;
          LODWORD(v23) = *(_DWORD *)(v1 + 460);
          v59 = 136318466;
          v60 = v20;
          v61 = 2080;
          v62 = "BWEstUninit";
          v63 = 1024;
          v64 = 1522;
          v65 = 2048;
          *(double *)v66 = v19;
          *(_WORD *)&v66[8] = 2048;
          *(double *)v67 = v25;
          *(_WORD *)&v67[8] = 1024;
          *(_DWORD *)&v67[10] = v26;
          *(_WORD *)v68 = 1024;
          *(_DWORD *)&v68[2] = v27;
          *(_WORD *)&v68[6] = 2048;
          *(double *)&v68[8] = v28;
          *(_WORD *)&v68[16] = 2048;
          *(double *)&v68[18] = (double)v26 / v19;
          *(_WORD *)&v68[26] = 2048;
          *(double *)&v68[28] = (double)v24 * 0.0009765625;
          *(_WORD *)&v68[36] = 1024;
          *(_DWORD *)&v68[38] = v23;
          v69 = 1024;
          *(_DWORD *)v70 = (int)((double)v24 / (double)(int)v23);
          *(_WORD *)&v70[4] = 2048;
          *(double *)&v70[6] = (double)(8 * v24) / v19;
          v71 = 2048;
          *(double *)v72 = (double)(int)v23 / v19;
          _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d //////\n////// In %.1f seconds: Video: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n//////                  Audio: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n", (uint8_t *)&v59, 0x7Au);
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v44 = *(_QWORD *)(v1 + 480);
        v45 = *(_QWORD *)(v1 + 488);
        v46 = (double)v44 * 0.0009765625;
        v47 = *(_DWORD *)(v1 + 448);
        v48 = (int)((double)v44 / (double)v47);
        v49 = (double)(8 * v44) / v19;
        LODWORD(v44) = *(_DWORD *)(v1 + 460);
        v59 = 136318466;
        v60 = v20;
        v61 = 2080;
        v62 = "BWEstUninit";
        v63 = 1024;
        v64 = 1522;
        v65 = 2048;
        *(double *)v66 = v19;
        *(_WORD *)&v66[8] = 2048;
        *(double *)v67 = v46;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v47;
        *(_WORD *)v68 = 1024;
        *(_DWORD *)&v68[2] = v48;
        *(_WORD *)&v68[6] = 2048;
        *(double *)&v68[8] = v49;
        *(_WORD *)&v68[16] = 2048;
        *(double *)&v68[18] = (double)v47 / v19;
        *(_WORD *)&v68[26] = 2048;
        *(double *)&v68[28] = (double)v45 * 0.0009765625;
        *(_WORD *)&v68[36] = 1024;
        *(_DWORD *)&v68[38] = v44;
        v69 = 1024;
        *(_DWORD *)v70 = (int)((double)v45 / (double)(int)v44);
        *(_WORD *)&v70[4] = 2048;
        *(double *)&v70[6] = (double)(8 * v45) / v19;
        v71 = 2048;
        *(double *)v72 = (double)(int)v44 / v19;
        _os_log_debug_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEBUG, " [%s] %s:%d //////\n////// In %.1f seconds: Video: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n//////                  Audio: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n", (uint8_t *)&v59, 0x7Au);
      }
    }
    v29 = *(double *)(v1 + 536);
    v30 = *(double *)(v1 + 528);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v31 = v29 - v30;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *v4;
      v34 = *v4;
      if (*v3)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = *(_DWORD *)(v1 + 520);
          v36 = *(double *)(v1 + 512) / (double)v35;
          v37 = *(_DWORD *)(v1 + 544);
          v38 = (double)v37 * 0.0009765625;
          v39 = *(_DWORD *)(v1 + 548);
          v40 = (int)((double)v37 / (double)v39);
          v41 = (double)(8 * v37) / v31;
          v42 = *(_DWORD *)(v1 + 552);
          v43 = *(_DWORD *)(v1 + 556);
          v59 = 136318978;
          v60 = v32;
          v61 = 2080;
          v62 = "BWEstUninit";
          v63 = 1024;
          v64 = 1534;
          v65 = 2048;
          *(double *)v66 = v36;
          *(_WORD *)&v66[8] = 1024;
          *(_DWORD *)v67 = v35;
          *(_WORD *)&v67[4] = 2048;
          *(double *)&v67[6] = v31;
          *(_WORD *)v68 = 2048;
          *(double *)&v68[2] = v38;
          *(_WORD *)&v68[10] = 1024;
          *(_DWORD *)&v68[12] = v39;
          *(_WORD *)&v68[16] = 1024;
          *(_DWORD *)&v68[18] = v40;
          *(_WORD *)&v68[22] = 2048;
          *(double *)&v68[24] = v41;
          *(_WORD *)&v68[32] = 2048;
          *(double *)&v68[34] = (double)v39 / v31;
          v69 = 2048;
          *(double *)v70 = (double)v42 * 0.0009765625;
          *(_WORD *)&v70[8] = 1024;
          *(_DWORD *)&v70[10] = v43;
          v71 = 1024;
          *(_DWORD *)v72 = (int)((double)v42 / (double)v43);
          *(_WORD *)&v72[4] = 2048;
          *(double *)&v72[6] = (double)(8 * v42) / v31;
          v73 = 2048;
          v74 = (double)v43 / v31;
          _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d \n///// Avg. BW (ORG Scheme): %f  \t  with %d reports\n////// In %.1f seconds: Video: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n//////                  Audio: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n///////////////////////////////////////////////////////\n", (uint8_t *)&v59, 0x8Au);
        }
      }
      else if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v50 = *(_DWORD *)(v1 + 520);
        v51 = *(double *)(v1 + 512) / (double)v50;
        v52 = *(_DWORD *)(v1 + 544);
        v53 = (double)v52 * 0.0009765625;
        v54 = *(_DWORD *)(v1 + 548);
        v55 = (int)((double)v52 / (double)v54);
        v56 = (double)(8 * v52) / v31;
        v57 = *(_DWORD *)(v1 + 552);
        v58 = *(_DWORD *)(v1 + 556);
        v59 = 136318978;
        v60 = v32;
        v61 = 2080;
        v62 = "BWEstUninit";
        v63 = 1024;
        v64 = 1534;
        v65 = 2048;
        *(double *)v66 = v51;
        *(_WORD *)&v66[8] = 1024;
        *(_DWORD *)v67 = v50;
        *(_WORD *)&v67[4] = 2048;
        *(double *)&v67[6] = v31;
        *(_WORD *)v68 = 2048;
        *(double *)&v68[2] = v53;
        *(_WORD *)&v68[10] = 1024;
        *(_DWORD *)&v68[12] = v54;
        *(_WORD *)&v68[16] = 1024;
        *(_DWORD *)&v68[18] = v55;
        *(_WORD *)&v68[22] = 2048;
        *(double *)&v68[24] = v56;
        *(_WORD *)&v68[32] = 2048;
        *(double *)&v68[34] = (double)v54 / v31;
        v69 = 2048;
        *(double *)v70 = (double)v57 * 0.0009765625;
        *(_WORD *)&v70[8] = 1024;
        *(_DWORD *)&v70[10] = v58;
        v71 = 1024;
        *(_DWORD *)v72 = (int)((double)v57 / (double)v58);
        *(_WORD *)&v72[4] = 2048;
        *(double *)&v72[6] = (double)(8 * v57) / v31;
        v73 = 2048;
        v74 = (double)v58 / v31;
        _os_log_debug_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \n///// Avg. BW (ORG Scheme): %f  \t  with %d reports\n////// In %.1f seconds: Video: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n//////                  Audio: %f KB/%d = %d B  avg. %.1f kbits/s  %.1f pkts/s \n///////////////////////////////////////////////////////\n", (uint8_t *)&v59, 0x8Au);
      }
    }
  }
  free((void *)v1);
  return 0;
}

uint64_t GCK_BWE_GetProbeSeqSize(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  v5 = CheckInHandleDebug();
  if (!v5)
    return 2149908482;
  v6 = v5;
  *(_DWORD *)(v5 + 8) = a2;
  if (a3)
  {
    if (*(_BYTE *)(v5 + 88))
    {
      v7 = BWEstCheckIfLargeFrameNeeded(v5);
      *(_DWORD *)(v6 + 376) = v7;
    }
    else
    {
      v7 = 0;
    }
    *a3 = v7;
  }
  CheckOutHandleDebug();
  return 0;
}

void sub_215CBF97C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

double convertTimeoutToRelativeTimespec(double a1)
{
  return (a1 - (double)(int)a1) * 1000000000.0;
}

void gkDiscoveryBrowseCallback(int a1, int a2, uint32_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  _QWORD v26[6];
  uint32_t v27;
  int v28;
  char v29;
  DNSServiceRef sdRef;
  _BYTE buf[24];
  __int128 v32;
  uint64_t v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint8_t v41[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  sdRef = (DNSServiceRef)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317442;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "gkDiscoveryBrowseCallback";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 253;
      WORD2(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 6) = a1;
      WORD5(v32) = 1024;
      HIDWORD(v32) = a2;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = a3;
      HIWORD(v33) = 1024;
      v34 = a4;
      v35 = 2080;
      v36 = a5;
      v37 = 2080;
      v38 = a6;
      v39 = 2080;
      v40 = a7;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour browse callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, serviceName=%s, regtype=%s, replyDomain=%s", buf, 0x52u);
    }
  }
  if (a8)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gkDiscoveryBrowseCallback_cold_6();
      }
      return;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    *(_QWORD *)&v32 = __Block_byref_object_copy__0;
    *((_QWORD *)&v32 + 1) = __Block_byref_object_dispose__0;
    v33 = a8;
    if (a5)
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a5);
    else
      v17 = 0;
    v18 = a2 & 2;
    if (!v18)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "browseCallback"))
      {
        v19 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "browseCallback");
        (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(v19 + 16))(v19, 0, v17, a3, 0, 0);
      }
LABEL_43:
      _Block_object_dispose(buf, 8);
      return;
    }
    if (a5 && a6 && a7)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.%s%s"), a5, a6, a7);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (v20)
            v23 = (const char *)objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
          else
            v23 = "<nil>";
          *(_DWORD *)v41 = 136315906;
          v42 = v21;
          v43 = 2080;
          v44 = "generateFullName";
          v45 = 1024;
          v46 = 236;
          v47 = 2080;
          v48 = v23;
          _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gkDiscovery: generated fullname %s for TxT record", v41, 0x26u);
        }
      }
      if (v20)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __gkDiscoveryBrowseCallback_block_invoke;
        v26[3] = &unk_24D466A70;
        v29 = v18 >> 1;
        v26[4] = v17;
        v26[5] = buf;
        v27 = a3;
        v28 = 0;
        v24 = (void *)objc_msgSend(v26, "copy");
        if (DNSServiceQueryRecord(&sdRef, 0x20000u, a3, (const char *)objc_msgSend(v20, "UTF8String"), 0x10u, 1u, (DNSServiceQueryRecordReply)gkDiscoveryTxtCallback, v24))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              gkDiscoveryBrowseCallback_cold_4();
          }

        }
        else if (DNSServiceSetDispatchQueue(sdRef, MEMORY[0x24BDAC9B8]))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              gkDiscoveryBrowseCallback_cold_3();
          }
        }
        goto LABEL_43;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gkDiscoveryBrowseCallback_cold_5();
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gkDiscoveryBrowseCallback_cold_2();
    }
    goto LABEL_43;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gkDiscoveryBrowseCallback_cold_1();
  }
}

void sub_215CC5630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void gkDiscoveryResolveCallback(int a1, int a2, uint32_t a3, uint64_t a4, uint64_t a5, const char *a6, unsigned int a7, int a8, uint64_t a9, void *a10)
{
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  DNSServiceErrorType AddrInfo;
  void *v25;
  DNSServiceErrorType v26;
  DNSServiceErrorType v27;
  _QWORD block[5];
  DNSServiceErrorType v30;
  _QWORD v31[5];
  __int16 v32;
  _BYTE buf[12];
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint32_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317698;
      *(_QWORD *)&buf[4] = v17;
      v34 = 2080;
      v35 = "gkDiscoveryResolveCallback";
      v36 = 1024;
      v37 = 401;
      v38 = 1024;
      v39 = a1;
      v40 = 1024;
      v41 = a2;
      v42 = 1024;
      v43 = a3;
      v44 = 1024;
      v45 = a4;
      v46 = 2080;
      v47 = a5;
      v48 = 2080;
      v49 = a6;
      v50 = 1024;
      v51 = __rev16(a7);
      v52 = 1024;
      v53 = a8;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour resolve callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, fullname=%s, hosttarget=%s, port=%d, txtLen=%d", buf, 0x54u);
    }
  }
  if (a10)
  {
    v19 = objc_msgSend((id)objc_msgSend(a10, "context"), "resolveContainersSyncQueue");
    v20 = objc_msgSend(a10, "resolveCompletionHandler");
    v21 = v20;
    if ((_DWORD)a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gkDiscoveryResolveCallback_cold_4();
      }
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(v21 + 16))(v21, 0, 0, 0, a4);
      return;
    }
    v22 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __gkDiscoveryResolveCallback_block_invoke;
    v31[3] = &unk_24D466A98;
    v31[4] = v20;
    v32 = a7;
    v23 = (void *)objc_msgSend(v31, "copy");
    *(_QWORD *)buf = 0;
    AddrInfo = DNSServiceGetAddrInfo((DNSServiceRef *)buf, 0x20000u, a3, 0, a6, (DNSServiceGetAddrInfoReply)gkDiscoveryGetAddrCallback, v23);
    if (AddrInfo || (v26 = DNSServiceSetDispatchQueue(*(DNSServiceRef *)buf, v19)) == 0)
    {
      if (*(_QWORD *)buf)
      {
        v25 = (void *)objc_msgSend(a10, "serviceRefList");
        objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)buf));
      }
      if (!AddrInfo)
        return;
    }
    else
    {
      v27 = v26;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gkDiscoveryResolveCallback_cold_3();
      }
      if (*(_QWORD *)buf)
      {
        DNSServiceRefDeallocate(*(DNSServiceRef *)buf);
        *(_QWORD *)buf = 0;
      }
      AddrInfo = v27;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR)))
    {
      gkDiscoveryResolveCallback_cold_2();
      if (!v21)
        return;
    }
    else if (!v21)
    {
      return;
    }
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __gkDiscoveryResolveCallback_block_invoke_126;
    block[3] = &unk_24D466A20;
    block[4] = v21;
    v30 = AddrInfo;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gkDiscoveryResolveCallback_cold_1();
  }
}

void sub_215CC6DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void gkDiscoveryRegisterCallback(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136317186;
      v17 = v14;
      v18 = 2080;
      v19 = "gkDiscoveryRegisterCallback";
      v20 = 1024;
      v21 = 738;
      v22 = 1024;
      v23 = a1;
      v24 = 1024;
      v25 = a2;
      v26 = 1024;
      v27 = a3;
      v28 = 2080;
      v29 = a4;
      v30 = 2080;
      v31 = a5;
      v32 = 2080;
      v33 = a6;
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour register callback - sdRef=%x, flags=%x, errorCode=%d, name=%s, regtype=%s, domain=%s", (uint8_t *)&v16, 0x4Cu);
    }
  }
  if (a3)
  {
    if (a3 == -65548)
    {
      (*(void (**)(uint64_t))(a7 + 16))(a7);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        gkDiscoveryRegisterCallback_cold_1();
    }
  }
}

uint64_t __gkDiscoveryBrowseCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "browseCallback");
  if (result)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "browseCallback");
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(v5 + 16))(v5, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), a2, *(unsigned int *)(a1 + 52));
  }
  return result;
}

void gkDiscoveryTxtCallback(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8, const void *a9, int a10, void (**a11)(_QWORD, _QWORD))
{
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint16_t v21;
  __int128 v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _DNSServiceRef_t *sdRef;
  void *value;
  uint8_t valueLen;
  _BYTE buf[48];
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
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317954;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "gkDiscoveryTxtCallback";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 190;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = a1;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a2;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = a3;
      *(_WORD *)&buf[46] = 1024;
      LODWORD(v32) = a4;
      WORD2(v32) = 2080;
      *(_QWORD *)((char *)&v32 + 6) = a5;
      HIWORD(v32) = 1024;
      LODWORD(v33) = a6;
      WORD2(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 6) = a7;
      WORD5(v33) = 1024;
      HIDWORD(v33) = a8;
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = a10;
      _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour txt callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, fullname=%s, rrtype=%u, rrclass=%u, rdlen=%u, ttl=%u", buf, 0x56u);
    }
  }
  if (a11)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gkDiscoveryTxtCallback_cold_2();
      }
    }
    v20 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a1);
    if (TXTRecordGetCount(a8, a9))
    {
      v21 = 0;
      do
      {
        *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v43 = v22;
        v44 = v22;
        v41 = v22;
        v42 = v22;
        v39 = v22;
        v40 = v22;
        v37 = v22;
        v38 = v22;
        v35 = v22;
        v36 = v22;
        v33 = v22;
        v34 = v22;
        *(_OWORD *)&buf[32] = v22;
        v32 = v22;
        *(_OWORD *)buf = v22;
        *(_OWORD *)&buf[16] = v22;
        valueLen = -86;
        value = (void *)0xAAAAAAAAAAAAAAAALL;
        TXTRecordGetItemAtIndex(a8, a9, v21, 0x100u, buf, &valueLen, (const void **)&value);
        v23 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
        v24 = objc_alloc(MEMORY[0x24BDD17C8]);
        v25 = (id)objc_msgSend(v24, "initWithBytes:length:encoding:", value, valueLen, 4);
        if (v23)
        {
          v26 = v25;
          if (objc_msgSend(v23, "length"))
          {
            if (v26)
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v23);
          }
        }
        ++v21;
      }
      while (TXTRecordGetCount(a8, a9) > v21);
    }
    ((void (**)(_QWORD, void *))a11)[2](a11, v20);
    if ((a2 & 1) == 0)
    {
      if (sdRef)
        DNSServiceRefDeallocate(sdRef);

    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gkDiscoveryTxtCallback_cold_1();
  }
}

uint64_t __gkDiscoveryResolveCallback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3, *(unsigned __int16 *)(a1 + 40), a4);
}

void gkDiscoveryGetAddrCallback(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, int a7, void (**a8)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  int v16;
  const void *v17;
  char *v18;
  int v19;
  socklen_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  char v43[16];
  _WORD v44[15];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a8)
  {
    if ((_DWORD)a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          gkDiscoveryGetAddrCallback_cold_2();
      }
      a8[2](a8, 0, 0, a4);
      return;
    }
    *(_OWORD *)v43 = 0u;
    memset(v44, 0, sizeof(v44));
    v16 = a6[1];
    if (v16 == 30)
    {
      v17 = a6 + 8;
      v18 = v43;
      v19 = 30;
      v20 = 46;
    }
    else
    {
      if (v16 != 2)
      {
        v18 = "unknown address";
LABEL_16:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v23 = 136317442;
            v24 = v21;
            v25 = 2080;
            v26 = "gkDiscoveryGetAddrCallback";
            v27 = 1024;
            v28 = 378;
            v29 = 1024;
            v30 = a1;
            v31 = 1024;
            v32 = a2;
            v33 = 1024;
            v34 = a3;
            v35 = 1024;
            v36 = 0;
            v37 = 2080;
            v38 = a5;
            v39 = 2080;
            v40 = v18;
            v41 = 1024;
            v42 = a7;
            _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour getAddr callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, hostname=%s, sockaddr=%s, ttl=%d", (uint8_t *)&v23, 0x4Eu);
          }
        }
        ((void (**)(_QWORD, uint64_t, unsigned __int8 *, _QWORD))a8)[2](a8, a3, a6, 0);
        if ((a2 & 1) == 0)

        return;
      }
      v17 = a6 + 4;
      v18 = v43;
      v19 = 2;
      v20 = 16;
    }
    inet_ntop(v19, v17, v43, v20);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      gkDiscoveryGetAddrCallback_cold_1();
  }
}

uint64_t __gkDiscoveryResolveCallback_block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0, *(unsigned int *)(a1 + 40));
}

void *copysockaddr(unsigned __int8 *a1)
{
  int v2;
  size_t v3;
  void *v4;
  void *v5;

  v2 = a1[1];
  if (v2 == 2)
  {
    v3 = 16;
  }
  else
  {
    if (v2 != 30)
      return 0;
    v3 = 28;
  }
  v4 = malloc_type_malloc(v3, 0xAD7D1E36uLL);
  v5 = v4;
  if (v4)
    memcpy(v4, a1, v3);
  return v5;
}

void sub_215CCF194(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215CCF1F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void AGPSendingSetElement::remove(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "remove";
  v6 = 1024;
  v7 = 802;
  _os_log_error_impl(&dword_215C5C000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T UPDATE (BAD TIMESTAMP) !!!!!!!!!!!!", (uint8_t *)&v2, 0x1Cu);
}

void TracePrintChanStats_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
  OUTLINED_FUNCTION_12();
}

void TracePrintChanStats_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_215C5C000, v0, v1, " [%s] %s:%d ====>        (ndst %d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void TracePrintChanStats_cold_3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x30u);
  OUTLINED_FUNCTION_19();
}

void TracePrintChanStats_cold_4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x3Au);
}

void TracePrintChanStats_cold_5()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x28u);
  OUTLINED_FUNCTION_12();
}

void TracePrintChanStats_cold_6()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x36u);
  OUTLINED_FUNCTION_19();
}

void TracePrintChanStats_cold_7()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];
  int v5;
  int v6;
  int v7;

  OUTLINED_FUNCTION_29();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "TracePrintChanStats";
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(&dword_215C5C000, v1, v2, " [%s] %s:%d ====>        (peerID %08X type %d rsvd %d)", v3, *(const char **)v4, (unint64_t)"TracePrintChanStats" >> 16, v5, v6, v7);
  OUTLINED_FUNCTION_19();
}

void TracePrintChanStats_cold_8()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];
  int v5;
  int v6;
  int v7;

  OUTLINED_FUNCTION_29();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "TracePrintChanStats";
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(&dword_215C5C000, v1, v2, " [%s] %s:%d ====> report (hostID %08X iIFIndex %d chanID %d)", v3, *(const char **)v4, (unint64_t)"TracePrintChanStats" >> 16, v5, v6, v7);
  OUTLINED_FUNCTION_19();
}

void GCKSession_TrimLocalInterfaceList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d InterfaceFilter not trimming interfaces for local gaming.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSession_TrimLocalInterfaceList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d ipPortList must not be nil and ipPortListCount must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSession_TrimLocalInterfaceList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d InterfaceFilter found an invalid number after actions done. We should not update the interface list.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSession_TrimLocalInterfaceList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d InterfaceFilter got 2 or more interfaces already. skip the rest of the list.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d newIPPortToAdd must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d ipPortListCount must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d ipPortList must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d Bailing due to: invalid numberOfIPPortsToUse.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Bailing due to: failed to calloc ipPorts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_6()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x2Cu);
  OUTLINED_FUNCTION_19();
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Bailing due to: failed to reallocate ipPorts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_4_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_4_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: gckSessionCreate failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: StartEventCallbackThread failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_create failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionCreate_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_create failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionRelease_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x38u);
  OUTLINED_FUNCTION_19();
}

void gckSessionRecvProc_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d gckSessionRecvProc: ERROR: Cannot create timer source   ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionRecvProc_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: socket failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionRecvProc_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: select failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalClientProc_cold_1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v4 = 4377;
  v5 = v0;
  v6 = v1;
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v2, (uint64_t)v2, " [%s] %s:%d Connection cancelled to %08X", v3);
  OUTLINED_FUNCTION_12();
}

void gckSessionSendDD_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No network interface found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_215C5C000, v0, v1, " [%s] %s:%d InterfaceFilter job done. Remaining interfaces count=%d.", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17(&dword_215C5C000, v0, v1, " [%s] %s:%d InterfaceFilter trimming interface list from all interfaces. count=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[36];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_31();
  v3 = 768;
  OUTLINED_FUNCTION_4_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getaddrinfo returned NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: socket failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getsockname failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[36];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_31();
  v3 = -2145779708;
  OUTLINED_FUNCTION_4_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_mutexattr_init failed(%X)", v2);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: bind failed(%X) for all ports in range", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionCreateSocketAndBind_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getaddrinfo failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKGetNAT64Prefix_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  micro();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_16_0(&dword_215C5C000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: NAT64 prefix resolved for %s at %f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_20();
}

void GCKGetNAT64Prefix_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  micro();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_16_0(&dword_215C5C000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: no NAT64 prefix discovered for %s at %f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_20();
}

void GCKGetNAT64Prefix_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  micro();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_0(&dword_215C5C000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: start NAT64 prefix resolution for %s at %f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_20();
}

void GCKSessionEstablishConnectionWithRelayInfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: cannot add any more nodes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionPrepareRetryICE_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No network interface found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCKSessionStartEventCallbacks_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: StartEventCallbackThread failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionSendHello_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionWaitForHello_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void attempt_failover_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d Connection timed out for [%08X] (in clstate %d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: remoteID is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_10_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No more node allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: iRemoteConnectionDataSize wrong(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionLocalServerProc_cold_8()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionProcessHello_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d FLOW CONTROL enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gckSessionProcessHello_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  int v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_215C5C000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: gckSessionSendHello failed(%X)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Buffer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d bufferLength=%d is too small for header", v2, v3, v4, 1082);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d Bad destination count=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d bufferLength=%d is too small", v2, v3, v4, 1103);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d Length=%d doesn't match", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d Bad packet type=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_ParsePacketHeader_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Bad version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _OSPFParse_ParseExtractOptions_cold_1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v3 = 1203;
  v4 = v0;
  v5 = 1203;
  _os_log_error_impl(&dword_215C5C000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/OSPF.c:%d: malloc failed", v2, 0x22u);
  OUTLINED_FUNCTION_12();
}

void OSPFParse_cold_1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4();
  v4 = 1577;
  v5 = v0;
  v6 = 12;
  v7 = v0;
  v8 = v1;
  _os_log_error_impl(&dword_215C5C000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d OSPF version mismatch: expected %d, got %d\n", v3, 0x28u);
  OUTLINED_FUNCTION_12();
}

void _OSPFParse_ParsePacketHeartbeat_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _OSPFParse_ParsePacketDD_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _OSPFParse_ParsePacketLSA_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void _OSPFParse_ParsePacketLSAAck_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_CalcRxEstimate_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_215C5C000, v0, v1, " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void GCK_BWE_CalcRxEstimate_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_215C5C000, v0, v1, " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void GCK_BWE_CalcRxEstimate_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_215C5C000, v0, v1, " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void GCK_BWE_CalcRxEstimate_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;
  const char *v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_215C5C000, v0, v1, " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void BWEstCheckIfLargeFrameNeeded_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17(&dword_215C5C000, v0, v1, " [%s] %s:%d ^^^^^ LARGE frame req'd of %d ", v2, v3, v4, 1730);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_TrackLargeFrameState_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17(&dword_215C5C000, v0, v1, " [%s] %s:%d ^^^^^ new frame of %d ", v2, v3, v4, 1864);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_TrackLargeFrameState_cold_2(uint64_t a1, unsigned int *a2, os_log_t log)
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = a2[2];
  v5 = 136316162;
  v6 = a1;
  v7 = 2080;
  v8 = "GCK_BWE_TrackLargeFrameState";
  v10 = 1977;
  v9 = 1024;
  v11 = 1024;
  v12 = v3 / 0x3E8;
  v13 = 1024;
  v14 = v4;
  _os_log_debug_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\t\t\t\t\t\t\t\t\t\t^^^^^ Tx/RxRate: %d/%d  ", (uint8_t *)&v5, 0x28u);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_CreateHandle_cold_1()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(&dword_215C5C000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: calloc(%d) failed", v1, 0x28u);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_CreateHandle_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2();
  _os_log_fault_impl(&dword_215C5C000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: calloc(%d) failed", v1, 0x28u);
  OUTLINED_FUNCTION_12();
}

void GCK_BWE_CreateHandle_cold_3()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v3 = 2049;
  v4 = v0;
  v5 = 2049;
  _os_log_error_impl(&dword_215C5C000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: GCK_BWE_CreateHandle failed", v2, 0x22u);
  OUTLINED_FUNCTION_12();
}

double GCK_BWE_CloseHandle_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  double v9;
  int v10;
  double result;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a2 + 440);
  v4 = *(_DWORD *)(a2 + 448);
  v5 = *(unsigned __int16 *)(a2 + 444);
  v6 = *(_DWORD *)(a2 + 452);
  v7 = *(_DWORD *)(a2 + 460);
  v8 = *(unsigned __int16 *)(a2 + 456);
  v9 = *(double *)(a2 + 464);
  v10 = *(_DWORD *)(a2 + 472);
  v12 = 136317698;
  v13 = a1;
  v14 = 2080;
  v15 = "BWEstUninit";
  v16 = 1024;
  v17 = 1513;
  v18 = 1024;
  v19 = v3;
  v20 = 1024;
  v21 = v4;
  v22 = 1024;
  v23 = v5;
  v24 = 1024;
  v25 = v6;
  v26 = 1024;
  v27 = v7;
  v28 = 1024;
  v29 = v8;
  v30 = 2048;
  v31 = v9 / (double)v10;
  v32 = 1024;
  v33 = v10;
  _os_log_debug_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ////////////////// Loss event reports //////////////////////////\n///// Video: %d/%d\tlast seq#: %d \t\t Audio: %d/%d last seq#: %d\n///// Avg. BW: %f  \t  with %d reports\n///////////////////////////////////////////////////////\n", (uint8_t *)&v12, 0x50u);
  return result;
}

void gkDiscoveryBrowseCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryBrowseCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d cannot resolve full name!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryBrowseCallback_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryBrowseCallback_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d service query record failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryBrowseCallback_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d gkDiscovery: failed to generate fullname, invalid inputs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryBrowseCallback_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d browse callback called with error [%d] - ignoring.", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryResolveCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryResolveCallback_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d service get addr info failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryResolveCallback_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryResolveCallback_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d getAddrCallback called with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryRegisterCallback_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d discovery register callback called with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryTxtCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryTxtCallback_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d txtCallback called with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryGetAddrCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void gkDiscoveryGetAddrCallback_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d getAddrCallback called with error [%d]", v2, v3, v4, v5);
  OUTLINED_FUNCTION_12();
}

uint64_t BTLocalDeviceSupportsService()
{
  return MEMORY[0x24BE67050]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x24BDBC410](theSet, candidate, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t CheckInHandleDebug()
{
  return off_24D465618();
}

uint64_t CheckOutHandleDebug()
{
  return off_24D465620();
}

uint64_t CreateHandle()
{
  return off_24D465628();
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x24BDAC3E8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x24BDAC3F0](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x24BDAC3F8](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x24BDAC408](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x24BDAC410](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x24BDAC418](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x24BDAC428](sdRef);
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x24BDAC430](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x24BDAC438](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x24BDAC448](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x24BDAC450](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x24BDAC458](sdRef, recordRef, *(_QWORD *)&flags, rdlen, rdata, *(_QWORD *)&ttl);
}

uint64_t FreeLocalInterfaceList()
{
  return MEMORY[0x24BDFDAC0]();
}

uint64_t GKSConnectivitySettings_GetICETimeout()
{
  return off_24D4656A0();
}

uint64_t GetLocalIFIndexForBoundSocket()
{
  return MEMORY[0x24BDFDAC8]();
}

uint64_t GetLocalInterfaceListWithOptions()
{
  return MEMORY[0x24BDFDAD0]();
}

uint64_t ICEAddOneInterface()
{
  return MEMORY[0x24BDFDAD8]();
}

uint64_t ICECloseHandle()
{
  return MEMORY[0x24BDFDAE0]();
}

uint64_t ICECreateHandle()
{
  return MEMORY[0x24BDFDAE8]();
}

uint64_t ICEDiscardRelayBinding()
{
  return MEMORY[0x24BDFDB00]();
}

uint64_t ICEGetCallInfoForConnectionData()
{
  return MEMORY[0x24BDFDB08]();
}

uint64_t ICEGetCandidates()
{
  return MEMORY[0x24BDFDB10]();
}

uint64_t ICERefreshRelayBinding()
{
  return MEMORY[0x24BDFDB18]();
}

uint64_t ICERemoveOneInterface()
{
  return MEMORY[0x24BDFDB20]();
}

uint64_t ICEStartConnectivityCheck()
{
  return MEMORY[0x24BDFDB28]();
}

uint64_t ICEStartConnectivityCheckN()
{
  return MEMORY[0x24BDFDB30]();
}

uint64_t ICEStopConnectivityCheck()
{
  return MEMORY[0x24BDFDB38]();
}

uint64_t ICEUpdateNAT64FlagForInterface()
{
  return MEMORY[0x24BDFDB40]();
}

uint64_t ICEUpdateRole()
{
  return MEMORY[0x24BDFDB48]();
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

uint64_t IPPORTToSA()
{
  return MEMORY[0x24BDFDB50]();
}

uint64_t IPPORTToSA6()
{
  return MEMORY[0x24BDFDB58]();
}

uint64_t IPPORTToStringWithSize()
{
  return MEMORY[0x24BDFDB68]();
}

uint64_t IPToString()
{
  return MEMORY[0x24BDFDB70]();
}

uint64_t IsIPPORTValid()
{
  return MEMORY[0x24BDFDB78]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x24BDD0B40](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t SAToIPPORT()
{
  return MEMORY[0x24BDFDB80]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5668](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDF5680](allocator, store, order);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x24BDF5708]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x24BEB37B0]();
}

int TXTRecordContainsKey(uint16_t txtLen, const void *txtRecord, const char *key)
{
  return MEMORY[0x24BDAC550](txtLen, txtRecord, key);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x24BDAC558](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x24BDAC560](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x24BDAC568](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x24BDAC570](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x24BDAC578](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x24BDAC580](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x24BDAC588](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x24BDAC590](txtRecord, key, valueSize, value);
}

uint64_t VRTraceErrorLogLevelToCSTR()
{
  return MEMORY[0x24BDFDBD0]();
}

uint64_t VRTraceGetErrorLogLevelForModule()
{
  return MEMORY[0x24BDFDBD8]();
}

uint64_t VRTraceIsOSFaultDisabled()
{
  return MEMORY[0x24BDFDBE0]();
}

uint64_t VRTracePrintLoggingInfo()
{
  return MEMORY[0x24BDFDBE8]();
}

uint64_t VRTraceReset()
{
  return MEMORY[0x24BDFDBF0]();
}

uint64_t VRTraceSetErrorLogLevel()
{
  return MEMORY[0x24BDFDBF8]();
}

uint64_t VRTraceVariable_()
{
  return MEMORY[0x24BDFDC00]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _SCNetworkInterfaceIsBluetoothP2P()
{
  return MEMORY[0x24BDF5900]();
}

uint64_t _SCNetworkInterfaceIsBluetoothPAN()
{
  return MEMORY[0x24BDF5908]();
}

uint64_t _SCNetworkInterfaceIsBluetoothPAN_NAP()
{
  return MEMORY[0x24BDF5910]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24D465AD0();
}

uint64_t operator new()
{
  return off_24D465AD8();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x24BEDF1B0](dest, destLen, source, sourceLen, *(_QWORD *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x24BEDF1B8](sourceLen);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t connectingGKLog()
{
  return MEMORY[0x24BDFDC08]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE598](*(_QWORD *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  return (hostent *)MEMORY[0x24BDAE648](a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x24BDAE890](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x24BDE14E8]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x24BDE14F0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t perfTimerStart()
{
  return MEMORY[0x24BDFDC30]();
}

uint64_t perfTimerStop()
{
  return MEMORY[0x24BDFDC38]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF948](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x24BDAFAE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFAF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t reportingGKAppInfo()
{
  return MEMORY[0x24BDFDC40]();
}

uint64_t reportingGKLog()
{
  return MEMORY[0x24BDFDC48]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFCF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x24BDAFCF8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x24BDAFDB0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x24BEDF298](dest, destLen, source, sourceLen);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

int xdr_float(XDR *a1, float *a2)
{
  return MEMORY[0x24BDB0590](a1, a2);
}

int xdr_int64_t(XDR *a1, int64_t *a2)
{
  return MEMORY[0x24BDB0598](a1, a2);
}

int xdr_pointer(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  return MEMORY[0x24BDB05A0](a1, a2, *(_QWORD *)&a3, a4);
}

int xdr_u_int16_t(XDR *a1, u_int16_t *a2)
{
  return MEMORY[0x24BDB05A8](a1, a2);
}

int xdr_u_int32_t(XDR *a1, u_int32_t *a2)
{
  return MEMORY[0x24BDB05B0](a1, a2);
}

int xdr_u_int64_t(XDR *a1, u_int64_t *a2)
{
  return MEMORY[0x24BDB05B8](a1, a2);
}

void xdrmem_create(XDR *a1, char *a2, unsigned int a3, xdr_op a4)
{
  MEMORY[0x24BDB05C0](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

