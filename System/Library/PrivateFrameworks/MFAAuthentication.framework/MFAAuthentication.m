void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

double OUTLINED_FUNCTION_4_0()
{
  return 2.0542726e-289;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_1_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Au);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Cu);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  char v12;
  __int16 v13;

  if (a3 >= 2)
  {
    v3 = 0;
    v4 = a3 >> 1;
    do
    {
      v5 = 0;
      v13 = -21846;
      v6 = 1;
      do
      {
        v7 = v6;
        v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        v9 = v8 - 48;
        v10 = v8 - 65;
        if ((v8 - 97) >= 6)
          v11 = 0;
        else
          v11 = v8 - 87;
        v12 = v8 - 55;
        if (v10 > 5)
          v12 = v11;
        if (v9 < 0xA)
          v12 = v9;
        *((_BYTE *)&v13 + v5) = v12;
        v5 = 1;
        v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(_BYTE *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v7;
  unsigned int v8;

  if (result)
  {
    v4 = a2;
    if (a2)
    {
      v7 = result;
      do
      {
        v8 = *v7++;
        result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
        return (unsigned __int8 *)putchar(10);
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10)
    a1[v2 - 1] = 0;
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  size_t v5;
  char *result;
  char *v7;
  unint64_t v8;
  char *v9;
  char *v10;
  size_t v11;
  char *v12;
  size_t v13;
  char *v14;

  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        v5 = (2 * a2) | 1;
LABEL_10:
        v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          v8 = 0;
          v9 = v7;
          v14 = v7;
          v10 = v7;
          v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              v12 = v10;
              v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8)
              return v14;
          }
          v12 = v9;
          v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result)
    strcpy(result, "(null)");
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __int128 v6;
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
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
  int v33;

  v33 = -1431655766;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  v18 = v6;
  v16 = v6;
  v17 = v6;
  v14 = v6;
  v15 = v6;
  v12 = v6;
  v13 = v6;
  *(_OWORD *)task_info_out = v6;
  v11 = v6;
  task_info_outCnt = 93;
  v7 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1)
      *a1 = v11;
    if (a2)
      *a2 = *(_QWORD *)task_info_out;
    if (a3)
      *a3 = v19;
  }
  return v7 == 0;
}

void sub_21283974C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL mfaa_verify_veridian_signature(void *a1, uint64_t a2, const __CFData *a3, uint64_t a4)
{
  __SecCertificate *CertificateRefWithData;
  __SecCertificate *v8;
  SecKeyRef v9;
  __SecKey *v10;
  void *v11;
  id v12;
  const uint8_t *v13;
  size_t v14;
  const uint8_t *BytePtr;
  size_t Length;
  uint64_t v17;
  _BOOL8 v18;

  CertificateRefWithData = (__SecCertificate *)createCertificateRefWithData(a1, 1);
  if (!CertificateRefWithData)
    return 0;
  v8 = CertificateRefWithData;
  v9 = SecCertificateCopyKey(CertificateRefWithData);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", a4);
    SecSHA256DigestCreateFromData();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const uint8_t *)objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "length");
    BytePtr = CFDataGetBytePtr(a3);
    Length = CFDataGetLength(a3);
    v17 = SecKeyRawVerify(v10, 0x4000u, v13, v14, BytePtr, Length);
    v18 = (_DWORD)v17 == 0;
    if ((_DWORD)v17)
      NSLog(CFSTR("SecKeyRawVerify osStatus:%02X\n"), v17);
    else
      NSLog(CFSTR("authPassed!!!"));
    CFRelease(v10);

  }
  else
  {
    v18 = 0;
  }
  CFRelease(v8);
  return v18;
}

uint64_t getNumRevokedAuthICBatches()
{
  return 65;
}

void *getRevokedAuthICBatches()
{
  return &prefix;
}

SecKeyRef CreateKeyForAuthFeature(int a1, void *a2)
{
  if (a1)
    return 0;
  else
    return _CreateKeyForMFi4UserPublicKey(a2, 0, 0);
}

SecKeyRef _CreateKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SecKeyRef v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  CFErrorRef error;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  -[NSObject dataUsingEncoding:](v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9060];
  v9 = *MEMORY[0x24BDE9048];
  v30[0] = *MEMORY[0x24BDE9050];
  v30[1] = v9;
  v31[0] = v8;
  v31[1] = &unk_24CE39EF8;
  v10 = *MEMORY[0x24BDE8F60];
  v31[2] = *MEMORY[0x24BDE8F68];
  v11 = *MEMORY[0x24BDE9468];
  v30[2] = v10;
  v30[3] = v11;
  v12 = *MEMORY[0x24BDE8FB8];
  v28[0] = *MEMORY[0x24BDE9018];
  v28[1] = v12;
  v29[0] = MEMORY[0x24BDBD1C8];
  v29[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a2)
  {
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
    if (v6)
      objc_msgSend(v16, "setObject:forKey:", v6, *MEMORY[0x24BDE9138]);
    objc_msgSend(v16, "setObject:forKey:", CFSTR("com.apple.mfiaccessory"), *MEMORY[0x24BDE8F50]);
  }
  error = 0;
  v17 = SecKeyCreateRandomKey((CFDictionaryRef)v16, &error);
  if (v17)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_212836000, v18, OS_LOG_TYPE_DEFAULT, "Successfully generated key pair for featureTag %@", buf, 0xCu);
    }
  }
  else
  {
    v18 = error;
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v19 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "error %@, unable to generate key for featureTag %@", buf, 0x16u);
    }

  }
  return v17;
}

CFTypeRef CopyKeyForAuthFeature(int a1, void *a2)
{
  if (a1)
    return 0;
  else
    return _CopyKeyForMFi4UserPublicKey(a2, 0, 0);
}

CFTypeRef _CopyKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  OSStatus v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  OSStatus v22;
  BOOL v23;
  int v24;
  id v25;
  const char *v26;
  id v27;
  id v28;
  CFTypeRef v29;
  CFTypeRef result;
  uint8_t buf[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[6];

  v35[5] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9248];
  v9 = *MEMORY[0x24BDE8FB8];
  v34[0] = *MEMORY[0x24BDE9220];
  v34[1] = v9;
  v35[0] = v8;
  v35[1] = v7;
  v10 = *MEMORY[0x24BDE9060];
  v11 = *MEMORY[0x24BDE8F60];
  v34[2] = *MEMORY[0x24BDE9050];
  v34[3] = v11;
  v12 = *MEMORY[0x24BDE8F68];
  v35[2] = v10;
  v35[3] = v12;
  v34[4] = *MEMORY[0x24BDE94D8];
  v35[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a2)
  {
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
    if (v6)
      objc_msgSend(v15, "setObject:forKey:", v6, *MEMORY[0x24BDE9138]);
    objc_msgSend(v15, "setObject:forKey:", CFSTR("com.apple.mfiaccessory"), *MEMORY[0x24BDE8F50]);
  }
  result = 0;
  v16 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
  if (gLogObjects)
    v17 = gNumLogObjects <= 4;
  else
    v17 = 1;
  v18 = !v17;
  if (!v16)
  {
    if (v18)
    {
      v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    v26 = "found valid key for featureTag %@ with access group check";
    goto LABEL_48;
  }
  if (v18)
  {
    v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v19 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@ with access group check", buf, 0xCu);
  }

  if (a2)
  {
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x24BDE8F50]);
    v22 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
    if (gLogObjects)
      v23 = gNumLogObjects <= 4;
    else
      v23 = 1;
    v24 = !v23;
    if (v22)
    {
      if (v24)
      {
        v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v20 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      *(_DWORD *)buf = 138412290;
      v33 = v5;
      v26 = "Unable to fetch key for featureTag %@ without access group check";
    }
    else
    {
      if (v24)
      {
        v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v20 = MEMORY[0x24BDACB70];
        v28 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      *(_DWORD *)buf = 138412290;
      v33 = v5;
      v26 = "found valid key for featureTag %@ without access group check";
    }
LABEL_48:
    _os_log_impl(&dword_212836000, v20, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
LABEL_49:

  }
  v29 = result;

  return v29;
}

void DeleteKeyForAuthFeature(int a1, void *a2)
{
  if (!a1)
    _DeleteKeyForMFi4UserPublicKey(a2, 0, 0);
}

void _DeleteKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  OSStatus v15;
  BOOL v16;
  int v17;
  OSStatus v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  OSStatus v22;
  BOOL v23;
  int v24;
  OSStatus v25;
  id v26;
  const char *v27;
  id v28;
  NSObject *v29;
  uint32_t v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  OSStatus v35;
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9248];
  v9 = *MEMORY[0x24BDE8FB8];
  v36[0] = *MEMORY[0x24BDE9220];
  v36[1] = v9;
  v37[0] = v8;
  v37[1] = v7;
  v10 = *MEMORY[0x24BDE9060];
  v11 = *MEMORY[0x24BDE94D8];
  v36[2] = *MEMORY[0x24BDE9050];
  v36[3] = v11;
  v37[2] = v10;
  v37[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a2)
  {
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
    if (v6)
      objc_msgSend(v14, "setObject:forKey:", v6, *MEMORY[0x24BDE9138]);
    objc_msgSend(v14, "setObject:forKey:", CFSTR("com.apple.mfiaccessory"), *MEMORY[0x24BDE8F50]);
  }
  v15 = SecItemDelete((CFDictionaryRef)v14);
  if (gLogObjects)
    v16 = gNumLogObjects <= 4;
  else
    v16 = 1;
  v17 = !v16;
  if (!v15)
  {
    if (v17)
    {
      v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    v27 = "Deleted key for featureTag %@ with access group";
    goto LABEL_48;
  }
  v18 = v15;
  if (v17)
  {
    v19 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v19 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v5;
    v34 = 1024;
    v35 = v18;
    _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "Unable to delete key for featureTag %@, status = %d", buf, 0x12u);
  }

  if (a2)
  {
    objc_msgSend(v14, "removeObjectForKey:", *MEMORY[0x24BDE8F50]);
    v22 = SecItemDelete((CFDictionaryRef)v14);
    if (gLogObjects)
      v23 = gNumLogObjects <= 4;
    else
      v23 = 1;
    v24 = !v23;
    if (v22)
    {
      v25 = v22;
      if (v24)
      {
        v20 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v20 = MEMORY[0x24BDACB70];
        v28 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_50;
      *(_DWORD *)buf = 138412546;
      v33 = v5;
      v34 = 1024;
      v35 = v25;
      v27 = "Unable to delete key for featureTag %@, without access group, status = %d";
      v29 = v20;
      v30 = 18;
LABEL_49:
      _os_log_impl(&dword_212836000, v29, OS_LOG_TYPE_DEFAULT, v27, buf, v30);
LABEL_50:

      goto LABEL_51;
    }
    if (v24)
    {
      v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    v27 = "Deleted key for featureTag %@ without access group";
LABEL_48:
    v29 = v20;
    v30 = 12;
    goto LABEL_49;
  }
LABEL_51:

}

SecKeyRef CopyPublicKeyForAuthFeature(int a1, void *a2)
{
  if (a1)
    return 0;
  else
    return _CopyPublicKeyForMFi4UserPublicKey(a2, 0, 0);
}

SecKeyRef _CopyPublicKeyForMFi4UserPublicKey(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  OSStatus v16;
  BOOL v17;
  int v18;
  OSStatus v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  OSStatus v23;
  BOOL v24;
  int v25;
  NSObject *v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  id v33;
  SecKeyRef v34;
  id v35;
  void *v37;
  CFTypeRef result;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  OSStatus v42;
  _QWORD v43[5];
  _QWORD v44[6];

  v44[5] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9248];
  v9 = *MEMORY[0x24BDE8FB8];
  v43[0] = *MEMORY[0x24BDE9220];
  v43[1] = v9;
  v44[0] = v8;
  v44[1] = v7;
  v10 = *MEMORY[0x24BDE9060];
  v11 = *MEMORY[0x24BDE8F60];
  v43[2] = *MEMORY[0x24BDE9050];
  v43[3] = v11;
  v12 = *MEMORY[0x24BDE8F68];
  v44[2] = v10;
  v44[3] = v12;
  v43[4] = *MEMORY[0x24BDE94D8];
  v44[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a2)
  {
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
    if (v6)
      objc_msgSend(v15, "setObject:forKey:", v6, *MEMORY[0x24BDE9138]);
    objc_msgSend(v15, "setObject:forKey:", CFSTR("com.apple.mfiaccessory"), *MEMORY[0x24BDE8F50]);
  }
  v37 = v6;
  result = 0;
  v16 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
  if (gLogObjects)
    v17 = gNumLogObjects <= 4;
  else
    v17 = 1;
  v18 = !v17;
  if (v16)
  {
    v19 = v16;
    if (v18)
    {
      v20 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v20 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v5;
      v41 = 1024;
      v42 = v19;
      _os_log_impl(&dword_212836000, v20, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@ with access group check, status=%d", buf, 0x12u);
    }

    if (!a2)
      goto LABEL_61;
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x24BDE8F50], v6);
    v23 = SecItemCopyMatching((CFDictionaryRef)v15, &result);
    if (gLogObjects)
      v24 = gNumLogObjects <= 4;
    else
      v24 = 1;
    v25 = !v24;
    if (v23)
    {
      if (v25)
      {
        v26 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v26 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      *(_DWORD *)buf = 138412290;
      v40 = v5;
      v30 = "Unable to fetch private key for featureTag %@ without access group check";
      v31 = v26;
      v32 = 12;
LABEL_59:
      _os_log_impl(&dword_212836000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_60:

LABEL_61:
      v34 = 0;
      goto LABEL_62;
    }
    if (v25)
    {
      v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v21 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v5;
      v28 = "found valid private key for featureTag %@ without access group check";
      goto LABEL_48;
    }
  }
  else
  {
    if (v18)
    {
      v21 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v21 = MEMORY[0x24BDACB70];
      v27 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v5;
      v28 = "found private valid key for featureTag %@ with access group check";
LABEL_48:
      _os_log_impl(&dword_212836000, v21, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    }
  }

  if (!result || (v34 = SecKeyCopyPublicKey((SecKeyRef)result)) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v26 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v26 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v30 = "ERROR: No publicKey for Private Key!";
    v31 = v26;
    v32 = 2;
    goto LABEL_59;
  }
LABEL_62:

  return v34;
}

BOOL _UpdateMFi4FeatureKeyAttributes(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  OSStatus v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  _BOOL8 v21;
  id v22;
  NSObject *v23;
  id v24;
  OSStatus v25;
  BOOL v26;
  int v27;
  OSStatus v28;
  NSObject *v29;
  id v30;
  id v31;
  id v33;
  CFTypeRef result;
  uint8_t buf[4];
  id v36;
  _QWORD v37[4];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9248];
  v9 = *MEMORY[0x24BDE8FB8];
  v37[0] = *MEMORY[0x24BDE9220];
  v37[1] = v9;
  v38[0] = v8;
  v38[1] = v7;
  v10 = *MEMORY[0x24BDE9060];
  v11 = *MEMORY[0x24BDE94D8];
  v37[2] = *MEMORY[0x24BDE9050];
  v37[3] = v11;
  v38[2] = v10;
  v38[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a2)
  {
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
    if (v6)
      objc_msgSend(v14, "setObject:forKey:", v6, *MEMORY[0x24BDE9138]);
  }
  result = 0;
  v15 = SecItemCopyMatching((CFDictionaryRef)v14, &result);
  if (gLogObjects)
    v16 = gNumLogObjects <= 4;
  else
    v16 = 1;
  v17 = !v16;
  if (v15)
  {
    if (v17)
    {
      v18 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl(&dword_212836000, v18, OS_LOG_TYPE_DEFAULT, "Unable to fetch key for featureTag %@, unable to update", buf, 0xCu);
    }
    v21 = 0;
  }
  else
  {
    if (v17)
    {
      v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v19 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, "found private valid key for featureTag %@, update to support new attributes", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v18, "setObject:forKey:", *MEMORY[0x24BDE8F68], *MEMORY[0x24BDE8F60]);
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v23 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v23 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    v33 = v6;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      _UpdateMFi4FeatureKeyAttributes_cold_3((uint64_t)v18, v23);

    v25 = SecItemUpdate((CFDictionaryRef)v14, (CFDictionaryRef)v18);
    v21 = v25 == 0;
    if (gLogObjects)
      v26 = gNumLogObjects <= 4;
    else
      v26 = 1;
    v27 = !v26;
    if (v25)
    {
      v28 = v25;
      if (v27)
      {
        v29 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v29 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = v28;
        _os_log_impl(&dword_212836000, v29, OS_LOG_TYPE_DEFAULT, "Unable to update attributes, status=%d", buf, 8u);
      }
      v6 = v33;
    }
    else
    {
      if (v27)
      {
        v29 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v29 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212836000, v29, OS_LOG_TYPE_DEFAULT, "Updated attributes for key", buf, 2u);
      }
    }

    if (result)
      CFRelease(result);
  }

  return v21;
}

void _DeleteAllSynchronizableKeysForMFi4(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  OSStatus v8;
  BOOL v9;
  int v10;
  OSStatus v11;
  NSObject *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  OSStatus v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = *MEMORY[0x24BDE9050];
  v23[0] = *MEMORY[0x24BDE9220];
  v23[1] = v4;
  v5 = *MEMORY[0x24BDE9060];
  v24[0] = *MEMORY[0x24BDE9248];
  v24[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE9140]);
  if (v3)
  {
    objc_msgSend(v7, "setObject:forKey:", v3, *MEMORY[0x24BDE9138]);
    if ((a2 & 1) == 0)
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE9548]);
    v8 = SecItemDelete((CFDictionaryRef)v7);
    if (gLogObjects)
      v9 = gNumLogObjects <= 4;
    else
      v9 = 1;
    v10 = !v9;
    if (v8)
    {
      v11 = v8;
      if (v10)
      {
        v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v12 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v3;
        v21 = 1024;
        v22 = v11;
        v14 = "Unable to delete key for all authFeatureGroup %@, status=%d";
        v15 = v12;
        v16 = 18;
LABEL_33:
        _os_log_impl(&dword_212836000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
      }
    }
    else
    {
      if (v10)
      {
        v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v12 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v3;
        v14 = "Deleted keys for authFeatureGroup %@";
        v15 = v12;
        v16 = 12;
        goto LABEL_33;
      }
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v12 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MFAATokenManager _init].cold.2();
      v12 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v14 = "NO authFeatureGroup, returning without deleting!";
      v15 = v12;
      v16 = 2;
      goto LABEL_33;
    }
  }

}

SecKeyRef CreateSynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (a1)
    return 0;
  else
    return _CreateKeyForMFi4UserPublicKey(a2, 1, a3);
}

CFTypeRef CopySynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (a1)
    return 0;
  else
    return _CopyKeyForMFi4UserPublicKey(a2, 1, a3);
}

void DeleteSynchronizableKeyForAuthFeature(int a1, void *a2, void *a3)
{
  if (!a1)
    _DeleteKeyForMFi4UserPublicKey(a2, 1, a3);
}

SecKeyRef CopyPublicKeyForSynchronizableAuthFeature(int a1, void *a2, void *a3)
{
  if (a1)
    return 0;
  else
    return _CopyPublicKeyForMFi4UserPublicKey(a2, 1, a3);
}

void DeleteAllSynchronizableFeatureKeysForFeature(int a1, void *a2, char a3)
{
  if (!a1)
    _DeleteAllSynchronizableKeysForMFi4(a2, a3);
}

uint64_t MFi4AuthFeatureGroup()
{
  return *MEMORY[0x24BDE91A0];
}

_QWORD *MFAACreateCertificateCache(CFStringRef theString)
{
  CFMutableStringRef MutableCopy;
  CFMutableStringRef v3;
  CFMutableStringRef v4;
  CFMutableStringRef v5;
  __int16 v6;
  __CFString *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  _OWORD *v12;
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  uint64_t *v16;
  CFTypeRef v17;
  uint64_t *v18;
  CFTypeRef v19;
  uint64_t *v20;
  int AppBooleanValue;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  _QWORD *v36;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  _QWORD block[9];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t buf[4];
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  if (MFAACreateCertificateCache_onceToken != -1)
    dispatch_once(&MFAACreateCertificateCache_onceToken, &__block_literal_global);
  v65 = 0;
  v66 = &v65;
  v67 = 0x2000000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2000000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2000000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2000000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2000000000;
  v52 = 0;
  if (theString && CFStringGetCStringPtr(theString, 0x8000100u))
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
    v62[3] = (uint64_t)MutableCopy;
    v3 = CFStringCreateMutableCopy(0, 0, theString);
    v58[3] = (uint64_t)v3;
    v4 = CFStringCreateMutableCopy(0, 0, theString);
    v54[3] = (uint64_t)v4;
    v5 = CFStringCreateMutableCopy(0, 0, theString);
    v6 = (__int16)v5;
    v50[3] = (uint64_t)v5;
    v7 = (__CFString *)v62[3];
    if (v7 && v58[3] && v54[3] && v5)
    {
      CFStringAppend(v7, CFSTR(".authCertCache"));
      CFStringAppend((CFMutableStringRef)v58[3], CFSTR(".authSyncQueue"));
      CFStringAppend((CFMutableStringRef)v54[3], CFSTR(".authRefsCount"));
      CFStringAppend((CFMutableStringRef)v50[3], CFSTR(".authCertChainCache"));
      v8 = malloc_type_malloc(0x50uLL, 0x106004047A38092uLL);
      v66[3] = (uint64_t)v8;
      if (v8)
      {
        v9 = MFAAIsDevelopmentHW();
        v10 = MFAAIsInternalBuild();
        v11 = MFAAIsDesenseBuild();
        v12 = (_OWORD *)v66[3];
        *v12 = 0u;
        v12[1] = 0u;
        v12[2] = 0u;
        v12[3] = 0u;
        v12[4] = 0u;
        v13 = CFRetain(theString);
        *(_QWORD *)v66[3] = v13;
        v14 = CFRetain((CFTypeRef)v58[3]);
        *(_QWORD *)(v66[3] + 8) = v14;
        v15 = CFRetain((CFTypeRef)v54[3]);
        v16 = v66;
        *(_QWORD *)(v66[3] + 16) = v15;
        *(_QWORD *)(v16[3] + 24) = 0;
        v17 = CFRetain((CFTypeRef)v62[3]);
        v18 = v66;
        *(_QWORD *)(v66[3] + 32) = v17;
        *(_QWORD *)(v18[3] + 40) = 0;
        *(_BYTE *)(v18[3] + 48) = 0;
        v19 = CFRetain((CFTypeRef)v50[3]);
        v20 = v66;
        *(_QWORD *)(v66[3] + 56) = v19;
        *(_QWORD *)(v20[3] + 64) = 0;
        *(_BYTE *)(v20[3] + 72) = 0;
        if (v9)
        {
          if (v10 | v11)
          {
            AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AuthCertNotCached"), CFSTR("com.apple.accessoryd"), 0);
            *(_BYTE *)(v66[3] + 48) = AppBooleanValue != 0;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              v70 = AppBooleanValue != 0;
              _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Auth flag bCertNotCached:%d\n", buf, 8u);
            }
          }
        }
      }
      else
      {
        v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v38)
          MFAACreateCertificateCache_cold_3(v38, v39, v40, v41, v42, v43, v44, v45);
      }
      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v46 = v58[3] & 0xFFF;
      v47 = v54[3] & 0xFFF;
      *(_DWORD *)buf = 67109888;
      v70 = (unsigned __int16)v7 & 0xFFF;
      v71 = 1024;
      v72 = v6 & 0xFFF;
      v73 = 1024;
      v74 = v46;
      v75 = 1024;
      v76 = v47;
      _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "CFStringCreateMutableCopy fail pCFStrCacheNameKey:%04X, pCFStrChainCacheNameKey:%04X, pCFStrSyncQueueKey:%04X, pCFStrRefsCountKey:%04X\n", buf, 0x1Au);
      v7 = (__CFString *)v62[3];
      if (!v7)
        goto LABEL_19;
    }
    else if (!v7)
    {
LABEL_19:
      v29 = (const void *)v50[3];
      if (v29)
      {
        CFRelease(v29);
        v50[3] = 0;
      }
      v30 = (const void *)v58[3];
      if (v30)
      {
        CFRelease(v30);
        v58[3] = 0;
      }
      v31 = (const void *)v54[3];
      if (v31)
      {
        CFRelease(v31);
        v54[3] = 0;
      }
      goto LABEL_25;
    }
    CFRelease(v7);
    v62[3] = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    MFAACreateCertificateCache_cold_2((uint64_t)theString, v22, v23, v24, v25, v26, v27, v28);
LABEL_25:
  if (gCertCacheDomainList && v66[3])
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertificateCache_block_invoke_14;
    block[3] = &unk_24CE34AB0;
    block[4] = &v61;
    block[5] = &v53;
    block[6] = &v57;
    block[7] = &v65;
    block[8] = &v49;
    dispatch_sync((dispatch_queue_t)gCertCacheDomainQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertificateCache_cold_1();
  }
  v32 = (const void *)v62[3];
  if (v32)
  {
    CFRelease(v32);
    v62[3] = 0;
  }
  v33 = (const void *)v58[3];
  if (v33)
  {
    CFRelease(v33);
    v58[3] = 0;
  }
  v34 = (const void *)v54[3];
  if (v34)
  {
    CFRelease(v34);
    v54[3] = 0;
  }
  v35 = (const void *)v50[3];
  if (v35)
  {
    CFRelease(v35);
    v50[3] = 0;
  }
  v36 = (_QWORD *)v66[3];
  if (v36 && (!*v36 || !v36[4] || !v36[1] || !v36[2] || !v36[5] || !v36[3]))
  {
    MFAADeallocCertificateCache(v66[3]);
    v36 = 0;
    v66[3] = 0;
  }
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  return v36;
}

uint64_t ValidateCertificateCache(const __CFDictionary *a1)
{
  CFTypeID TypeID;
  CFTypeID v3;
  CFIndex Count;
  size_t v5;
  unint64_t v6;
  CFTypeRef *v7;
  void *v8;
  const void **v9;
  __int128 v10;
  uint64_t v11;
  const __CFData *v12;
  const void *v13;
  BOOL v14;
  CFTypeID v15;
  CFTypeID v16;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v18;
  CFTypeID v19;
  uint64_t Length;
  const __CFData *v21;
  CFTypeID v22;
  const __CFData *v23;
  const __CFData *v24;
  __int128 v26;
  CFTypeID v27;
  CFTypeID v28;
  uint64_t valuePtr;
  void *values;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const __CFData *v34;
  __int16 v35;
  const __CFData *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  v28 = CFDataGetTypeID();
  v3 = CFArrayGetTypeID();
  v27 = CFNumberGetTypeID();
  Count = CFDictionaryGetCount(a1);
  v5 = 8 * Count;
  v6 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (CFTypeRef *)((char *)&v26 - v6);
  if (((uint64_t (*)(void))MEMORY[0x24BDAC7A8])())
  {
    v8 = memset((char *)&v26 - v6, 170, v5);
    MEMORY[0x24BDAC7A8](v8);
    v9 = (const void **)((char *)&v26 - v6);
    memset((char *)&v26 - v6, 170, v5);
    CFDictionaryGetKeysAndValues(a1, (const void **)((char *)&v26 - v6), (const void **)((char *)&v26 - v6));
    if (Count >= 1)
    {
      v11 = 0;
      *(_QWORD *)&v10 = 136315650;
      v26 = v10;
      while (1)
      {
        v12 = (const __CFData *)*v7;
        v13 = *v9;
        if (*v7)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (v14)
        {
          v15 = 0;
          v16 = 0;
        }
        else
        {
          v15 = CFGetTypeID(*v7);
          v16 = CFGetTypeID(v13);
        }
        if (v15 != TypeID || v16 != v3 || (valuePtr = 0, CFDataGetLength(v12), CFArrayGetCount((CFArrayRef)v13) != 2))
        {
LABEL_34:
          CFDictionaryRemoveValue(a1, *v7);
          ++v11;
          goto LABEL_35;
        }
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
        v18 = ValueAtIndex;
        if (ValueAtIndex)
        {
          v19 = CFGetTypeID(ValueAtIndex);
          if (v19 == v27)
            LODWORD(v18) = CFNumberGetValue(v18, kCFNumberLongType, &valuePtr);
          else
            LODWORD(v18) = 0;
        }
        Length = (uint64_t)CFArrayGetValueAtIndex((CFArrayRef)v13, 1);
        v21 = (const __CFData *)Length;
        if (!Length)
          goto LABEL_20;
        v22 = CFGetTypeID((CFTypeRef)Length);
        if (v22 == v28)
          break;
        Length = 0;
        if (!(_DWORD)v18)
          goto LABEL_34;
LABEL_23:
        if (!valuePtr || Length < 512 || Length > 2048)
          goto LABEL_34;
        v23 = (const __CFData *)MFAACreateCertificateSerialNumber((uint64_t)v21);
        v24 = MFAACreateSerialNumberStringFromData(v23);
        if (v24
          && CFStringCompare((CFStringRef)v12, (CFStringRef)v24, 1uLL)
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v26;
          v32 = "ValidateCertificateCache";
          v33 = 2112;
          v34 = v12;
          v35 = 2112;
          v36 = v24;
          _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: key and cert serial doesn't match but allow, key %@, certSerial %@", buf, 0x20u);
        }
        if (v23)
          CFRelease(v23);
        if (!v24)
          goto LABEL_34;
        CFRelease(v24);
LABEL_35:
        ++v9;
        ++v7;
        if (!--Count)
          return v11;
      }
      Length = CFDataGetLength(v21);
LABEL_20:
      if (!(_DWORD)v18)
        goto LABEL_34;
      goto LABEL_23;
    }
  }
  else
  {
    CFDictionaryGetKeysAndValues(a1, (const void **)((char *)&v26 - v6), (const void **)&values);
  }
  return 0;
}

uint64_t CertCacheReferenceCountUpdate(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (a1 && (v2 = *(NSObject **)(a1 + 24)) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __CertCacheReferenceCountUpdate_block_invoke;
    block[3] = &unk_24CE34C10;
    block[4] = &v7;
    block[5] = a1;
    v6 = a2;
    dispatch_sync(v2, block);
    v3 = *((unsigned int *)v8 + 6);
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void PrintCertCacheContents(uint64_t a1, CFTypeRef cf)
{
  CFIndex Count;
  CFIndex v5;
  char *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  const __CFString *v11;
  const void *v12;
  CFIndex v13;
  CFIndex v14;
  CFTypeID v15;
  const char *CStringPtr;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  CFTypeID v20;
  CFIndex v21;
  const void *ValueAtIndex;
  const void *v23;
  CFTypeID v24;
  CFIndex v25;
  CFIndex v26;
  int Value;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  CFTypeID v34;
  CFIndex v35;
  CFIndex v36;
  CFIndex Length;
  __int128 v38;
  __int128 v39;
  __int128 *v40;
  CFTypeID v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CFTypeID v46;
  CFTypeID v47;
  CFTypeID TypeID;
  const void **v49;
  const void **v50;
  uint64_t valuePtr;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  _BYTE v57[40];
  uint64_t v58;

  Count = 0;
  v58 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  if (a1 && cf)
  {
    v5 = CFGetRetainCount(cf);
    if (v5 < 1)
    {
      Count = 0;
    }
    else
    {
      Count = CFDictionaryGetCount((CFDictionaryRef)cf);
      if (Count >= 1)
      {
        TypeID = CFStringGetTypeID();
        v46 = CFDataGetTypeID();
        v47 = CFArrayGetTypeID();
        v41 = CFNumberGetTypeID();
        v40 = &v38;
        MEMORY[0x24BDAC7A8](v41);
        v6 = (char *)&v38 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0);
        v7 = memset(v6, 170, 8 * Count);
        MEMORY[0x24BDAC7A8](v7);
        memset(v6, 170, 8 * Count);
        v50 = (const void **)v6;
        bzero(v6, 8 * Count);
        v49 = (const void **)v6;
        bzero(v6, 8 * Count);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v53 = "PrintCertCacheContents";
          v54 = 2112;
          v55 = a1;
          v56 = 1024;
          *(_DWORD *)v57 = (unsigned __int16)cf & 0xFFF;
          *(_WORD *)&v57[4] = 2048;
          *(_QWORD *)&v57[6] = v5;
          *(_WORD *)&v57[14] = 2048;
          *(_QWORD *)&v57[16] = Count;
          _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s (%@) pkCertCacheDict:%04X, dictRetainCount:%02lX, dictEntryCount:%02lX", buf, 0x30u);
        }
        CFDictionaryGetKeysAndValues((CFDictionaryRef)cf, v50, v49);
        v8 = 0;
        v9 = MEMORY[0x24BDACB70];
        *(_QWORD *)&v10 = 136316674;
        v44 = v10;
        *(_QWORD *)&v10 = 136316418;
        v45 = v10;
        *(_QWORD *)&v10 = 136315906;
        v43 = v10;
        *(_QWORD *)&v10 = 136316162;
        v42 = v10;
        *(_QWORD *)&v10 = 136315394;
        v38 = v10;
        *(_QWORD *)&v10 = 136315650;
        v39 = v10;
        while (1)
        {
          v11 = (const __CFString *)v50[v8];
          v12 = v49[v8];
          if (v11)
          {
            v13 = CFGetRetainCount(v50[v8]);
            if (v12)
              goto LABEL_10;
          }
          else
          {
            v13 = 0;
            if (v12)
            {
LABEL_10:
              v14 = CFGetRetainCount(v12);
              goto LABEL_13;
            }
          }
          v14 = 0;
LABEL_13:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            v53 = "PrintCertCacheContents";
            v54 = 2112;
            v55 = a1;
            v56 = 2048;
            *(_QWORD *)v57 = v8;
            *(_WORD *)&v57[8] = 1024;
            *(_DWORD *)&v57[10] = (unsigned __int16)v11 & 0xFFF;
            *(_WORD *)&v57[14] = 2048;
            *(_QWORD *)&v57[16] = v13;
            *(_WORD *)&v57[24] = 1024;
            *(_DWORD *)&v57[26] = (unsigned __int16)v12 & 0xFFF;
            *(_WORD *)&v57[30] = 2048;
            *(_QWORD *)&v57[32] = v14;
            _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) [%02lX] pkKey:%04X, keyRetainCount:%02lX, pkVal:%04X, valRetainCount:%02lX", buf, 0x40u);
          }
          if (v11 && v13 >= 1)
          {
            v15 = CFGetTypeID(v11);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v45;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v56 = 1024;
              *(_DWORD *)v57 = (unsigned __int16)v11 & 0xFFF;
              *(_WORD *)&v57[4] = 2048;
              *(_QWORD *)&v57[6] = v13;
              *(_WORD *)&v57[14] = 2048;
              *(_QWORD *)&v57[16] = v15;
              *(_WORD *)&v57[24] = 2048;
              *(_QWORD *)&v57[26] = TypeID;
              _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkKey:%04X, keyRetainCount:%02lX, typeID:%02lX (strID:%02lX)", buf, 0x3Au);
            }
            if (v15 == TypeID && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
              *(_DWORD *)buf = v43;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v56 = 2048;
              *(_QWORD *)v57 = v8;
              *(_WORD *)&v57[8] = 2080;
              *(_QWORD *)&v57[10] = CStringPtr;
              _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictKeys [%02lX] str:[%s]", buf, 0x2Au);
            }
            if (v15 == v46)
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v43;
                v53 = "PrintCertCacheContents";
                v54 = 2112;
                v55 = a1;
                v56 = 2048;
                *(_QWORD *)v57 = v8;
                *(_WORD *)&v57[8] = 2112;
                *(_QWORD *)&v57[10] = v11;
                _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictKeys [%02lX] hash:[%@]", buf, 0x2Au);
                if (!v12)
                  goto LABEL_65;
                goto LABEL_30;
              }
LABEL_29:
              if (!v12)
                goto LABEL_65;
              goto LABEL_30;
            }
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              goto LABEL_29;
            *(_DWORD *)buf = v42;
            v53 = "PrintCertCacheContents";
            v54 = 2112;
            v55 = a1;
            v56 = 2048;
            *(_QWORD *)v57 = v8;
            *(_WORD *)&v57[8] = 2048;
            *(_QWORD *)&v57[10] = v15;
            *(_WORD *)&v57[18] = 2048;
            *(_QWORD *)&v57[20] = TypeID;
            v17 = v9;
            v18 = "%s (%@) ERROR pkDictKeys [%02lX] typeID:%02lX, expectID:%02lX";
            v19 = 52;
          }
          else
          {
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              goto LABEL_29;
            *(_DWORD *)buf = v42;
            v53 = "PrintCertCacheContents";
            v54 = 2112;
            v55 = a1;
            v56 = 2048;
            *(_QWORD *)v57 = v8;
            *(_WORD *)&v57[8] = 1024;
            *(_DWORD *)&v57[10] = (unsigned __int16)v11 & 0xFFF;
            *(_WORD *)&v57[14] = 2048;
            *(_QWORD *)&v57[16] = v13;
            v17 = v9;
            v18 = "%s (%@) ERROR pkDictKeys [%02lX]:%04X, keyRetainCount:%02lX";
            v19 = 48;
          }
          _os_log_error_impl(&dword_212836000, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
          if (!v12)
          {
LABEL_65:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v56 = 2048;
              *(_QWORD *)v57 = v8;
              *(_WORD *)&v57[8] = 1024;
              *(_DWORD *)&v57[10] = (unsigned __int16)v12 & 0xFFF;
              *(_WORD *)&v57[14] = 2048;
              *(_QWORD *)&v57[16] = v14;
              v28 = v9;
              v29 = "%s (%@) ERROR pkDictVals [%02lX]:%04X, valRetainCount:%02lX";
              goto LABEL_69;
            }
            goto LABEL_66;
          }
LABEL_30:
          if (v14 < 1)
            goto LABEL_65;
          v20 = CFGetTypeID(v12);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            v53 = "PrintCertCacheContents";
            v54 = 2112;
            v55 = a1;
            v56 = 1024;
            *(_DWORD *)v57 = (unsigned __int16)v12 & 0xFFF;
            *(_WORD *)&v57[4] = 2048;
            *(_QWORD *)&v57[6] = v14;
            *(_WORD *)&v57[14] = 2048;
            *(_QWORD *)&v57[16] = v20;
            *(_WORD *)&v57[24] = 2048;
            *(_QWORD *)&v57[26] = v47;
            _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkVal:%04X valRetainCount:%02lX, typeID:%02lX (arrayID:%02lX)", buf, 0x3Au);
          }
          if (v20 == v47)
          {
            v21 = CFArrayGetCount((CFArrayRef)v12);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v43;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v56 = 2048;
              *(_QWORD *)v57 = v8;
              *(_WORD *)&v57[8] = 2048;
              *(_QWORD *)&v57[10] = v21;
              _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) pkDictVals [%02lX] arrayCount:[%02lX]", buf, 0x2Au);
            }
            if (v21 != 2)
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v42;
                v53 = "PrintCertCacheContents";
                v54 = 2112;
                v55 = a1;
                v56 = 2048;
                *(_QWORD *)v57 = v8;
                *(_WORD *)&v57[8] = 2048;
                *(_QWORD *)&v57[10] = v21;
                *(_WORD *)&v57[18] = 1024;
                *(_DWORD *)&v57[20] = 2;
                v28 = v9;
                v29 = "%s (%@) ERROR pkDictVals [%02lX] arrayCount:%02lX, arrayCountExpect:%02X";
LABEL_69:
                v30 = 48;
                goto LABEL_70;
              }
              goto LABEL_66;
            }
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v12, 0);
            v23 = CFArrayGetValueAtIndex((CFArrayRef)v12, 1);
            if (ValueAtIndex)
            {
              v24 = CFGetTypeID(ValueAtIndex);
              v25 = CFGetRetainCount(ValueAtIndex);
              v26 = v25;
              if (v24 == v41 && v25 >= 1)
              {
                valuePtr = 0;
                Value = CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberLongType, &valuePtr);
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v45;
                  v53 = "PrintCertCacheContents";
                  v54 = 2112;
                  v55 = a1;
                  v56 = 2048;
                  *(_QWORD *)v57 = v41;
                  *(_WORD *)&v57[8] = 2048;
                  *(_QWORD *)&v57[10] = v26;
                  *(_WORD *)&v57[18] = 1024;
                  *(_DWORD *)&v57[20] = Value;
                  *(_WORD *)&v57[24] = 2048;
                  *(_QWORD *)&v57[26] = valuePtr;
                  _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) usageTypeID:%02lX, usageRetainCount:%02lX, bUsageValid:%d, certUsage:%02lX", buf, 0x3Au);
                  if (!v23)
                    goto LABEL_73;
                  goto LABEL_52;
                }
LABEL_51:
                if (!v23)
                  goto LABEL_73;
LABEL_52:
                v34 = CFGetTypeID(v23);
                v35 = CFGetRetainCount(v23);
                v36 = v35;
                if (v34 == v46 && v35 >= 1)
                {
                  Length = CFDataGetLength((CFDataRef)v23);
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = v43;
                    v53 = "PrintCertCacheContents";
                    v54 = 2112;
                    v55 = a1;
                    v56 = 2048;
                    *(_QWORD *)v57 = v46;
                    *(_WORD *)&v57[8] = 2048;
                    *(_QWORD *)&v57[10] = v36;
                    _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) certTypeID:%02lX, certRetainCount:%02lX", buf, 0x2Au);
                  }
                  if ((unint64_t)(Length - 512) <= 0x600)
                  {
                    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v39;
                      v53 = "PrintCertCacheContents";
                      v54 = 2112;
                      v55 = a1;
                      v56 = 2048;
                      *(_QWORD *)v57 = Length;
                      _os_log_impl(&dword_212836000, v9, OS_LOG_TYPE_DEFAULT, "%s (%@) Valid certDataLen:%02lX", buf, 0x20u);
                    }
                    goto LABEL_66;
                  }
                  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v39;
                    v53 = "PrintCertCacheContents";
                    v54 = 2112;
                    v55 = a1;
                    v56 = 2048;
                    *(_QWORD *)v57 = Length;
                    v28 = v9;
                    v29 = "%s (%@) ERROR invalid certDataLen:%02lX";
                    v30 = 32;
                    goto LABEL_70;
                  }
                }
                else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v42;
                  v53 = "PrintCertCacheContents";
                  v54 = 2112;
                  v55 = a1;
                  v56 = 2048;
                  *(_QWORD *)v57 = v34;
                  *(_WORD *)&v57[8] = 2048;
                  *(_QWORD *)&v57[10] = v46;
                  *(_WORD *)&v57[18] = 2048;
                  *(_QWORD *)&v57[20] = v36;
                  v28 = v9;
                  v29 = "%s (%@) ERROR certTypeID:%02lX, expectTypeID:%02lX, certRetainCount:%02lX";
                  goto LABEL_45;
                }
                goto LABEL_66;
              }
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                goto LABEL_51;
              *(_DWORD *)buf = v42;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v56 = 2048;
              *(_QWORD *)v57 = v24;
              *(_WORD *)&v57[8] = 2048;
              *(_QWORD *)&v57[10] = v41;
              *(_WORD *)&v57[18] = 2048;
              *(_QWORD *)&v57[20] = v26;
              v31 = v9;
              v32 = "%s (%@) ERROR usageTypeID:%02lX, expectTypeID:%02lX, usageRetainCount:%02lX";
              v33 = 52;
            }
            else
            {
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                goto LABEL_51;
              *(_DWORD *)buf = v38;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v31 = v9;
              v32 = "%s (%@) ERROR pkUsageCount = NULL !";
              v33 = 22;
            }
            _os_log_error_impl(&dword_212836000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
            if (!v23)
            {
LABEL_73:
              if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                goto LABEL_66;
              *(_DWORD *)buf = v38;
              v53 = "PrintCertCacheContents";
              v54 = 2112;
              v55 = a1;
              v28 = v9;
              v29 = "%s (%@) ERROR pkCertData = NULL !";
              v30 = 22;
              goto LABEL_70;
            }
            goto LABEL_52;
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            v53 = "PrintCertCacheContents";
            v54 = 2112;
            v55 = a1;
            v56 = 2048;
            *(_QWORD *)v57 = v8;
            *(_WORD *)&v57[8] = 2048;
            *(_QWORD *)&v57[10] = v20;
            *(_WORD *)&v57[18] = 2048;
            *(_QWORD *)&v57[20] = v47;
            v28 = v9;
            v29 = "%s (%@) ERROR pkDictVals [%02lX] typeID:%02lX, expectID:%02lX";
LABEL_45:
            v30 = 52;
LABEL_70:
            _os_log_error_impl(&dword_212836000, v28, OS_LOG_TYPE_ERROR, v29, buf, v30);
          }
LABEL_66:
          if (Count == ++v8)
            return;
        }
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v53 = "PrintCertCacheContents";
    v54 = 2112;
    v55 = a1;
    v56 = 1024;
    *(_DWORD *)v57 = (unsigned __int16)cf & 0xFFF;
    *(_WORD *)&v57[4] = 2048;
    *(_QWORD *)&v57[6] = v5;
    *(_WORD *)&v57[14] = 2048;
    *(_QWORD *)&v57[16] = Count;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s (%@) Print of cache contents bypassed due to pkCertCacheDict:%04X, dictRetainCount:%02lX, or dictEntryCount:%02lX", buf, 0x30u);
  }
}

BOOL SyncCertCacheContentsToPreferencesFile(uint64_t key, const void *a2)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (const __CFString *)key;
  LODWORD(key) = 0;
  if (v2)
  {
    if (a2)
    {
      v3 = (const __CFString *)*MEMORY[0x24BDBD590];
      v4 = (const __CFString *)*MEMORY[0x24BDBD588];
      CFPreferencesSetValue(v2, a2, CFSTR("com.apple.accessoryd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
      LODWORD(key) = CFPreferencesSynchronize(CFSTR("com.apple.accessoryd"), v3, v4);
      if (!(_DWORD)key)
      {
        key = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if ((_DWORD)key)
        {
          SyncCertCacheContentsToPreferencesFile_cold_1(key, v5, v6, v7, v8, v9, v10, v11);
          LODWORD(key) = 0;
        }
      }
    }
  }
  return (_DWORD)key != 0;
}

void MFAADeallocCertificateCache(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  NSObject *v22;
  _QWORD block[5];

  if (a1)
  {
    if (gCertCacheDomainList)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __MFAADeallocCertificateCache_block_invoke;
      block[3] = &__block_descriptor_tmp_20;
      block[4] = a1;
      dispatch_sync((dispatch_queue_t)gCertCacheDomainQueue, block);
    }
    else
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        MFAADeallocCertificateCache_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    if (*(_QWORD *)a1)
    {
      CFRelease(*(CFTypeRef *)a1);
      *(_QWORD *)a1 = 0;
    }
    v18 = *(const void **)(a1 + 32);
    if (v18)
    {
      CFRelease(v18);
      *(_QWORD *)(a1 + 32) = 0;
    }
    v19 = *(const void **)(a1 + 8);
    if (v19)
    {
      CFRelease(v19);
      *(_QWORD *)(a1 + 8) = 0;
    }
    v20 = *(const void **)(a1 + 16);
    if (v20)
    {
      CFRelease(v20);
      *(_QWORD *)(a1 + 16) = 0;
    }
    v21 = *(const void **)(a1 + 40);
    if (v21)
    {
      CFRelease(v21);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v22 = *(NSObject **)(a1 + 24);
    if (v22)
      dispatch_release(v22);
    free((void *)a1);
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      MFAADeallocCertificateCache_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t MFAACreateCertDataFromSerialNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1 && a2 && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertDataFromSerialNumber_block_invoke;
    block[3] = &unk_24CE34AF8;
    block[4] = v10;
    block[5] = &v6;
    block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertDataFromSerialNumber_cold_1();
  }
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t MFAAAddCertDataEntryToCache(uint64_t a1, uint64_t a2)
{
  const __CFData *v4;
  const __CFData *v5;
  const __CFData *v6;
  uint64_t v7;

  v4 = (const __CFData *)MFAACreateCertificateSerialNumber(a2);
  if (!v4)
    return MFAAAddCertDataEntryToCacheForSerialNumber(a1, a2, 0);
  v5 = v4;
  v6 = MFAACreateSerialNumberStringFromData(v4);
  v7 = MFAAAddCertDataEntryToCacheForSerialNumber(a1, a2, (uint64_t)v6);
  CFRelease(v5);
  if (v6)
    CFRelease(v6);
  return v7;
}

const __CFData *MFAACreateSerialNumberStringFromData(const __CFData *result)
{
  const __CFData *v1;
  CFIndex Length;
  size_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  char *v9;
  int v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    Length = CFDataGetLength(result);
    MEMORY[0x24BDAC7A8]();
    v5 = (v4 + 19) & 0xFFFFFFFFFFFFFFF0;
    v6 = (char *)v11 - v5;
    if (v3)
      memset((char *)v11 - v5, 170, v3);
    BytePtr = CFDataGetBytePtr(v1);
    if (Length >= 1)
    {
      v8 = BytePtr;
      v9 = (char *)v6;
      do
      {
        v10 = *v8++;
        sprintf(v9, "%02X", v10);
        v9 += 2;
        --Length;
      }
      while (Length);
    }
    return (const __CFData *)CFStringCreateWithCString(0, v6, 0x8000100u);
  }
  return result;
}

uint64_t MFAAAddCertDataEntryToCacheForSerialNumber(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v6;
  _QWORD block[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && a2 && a3 && !*(_BYTE *)(a1 + 48))
  {
    v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke;
    block[3] = &unk_24CE34B20;
    block[6] = a3;
    block[7] = a2;
    block[4] = v12;
    block[5] = &v8;
    block[8] = a1;
    dispatch_sync(v6, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAAAddCertDataEntryToCacheForSerialNumber_cold_1();
  }
  v4 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v4;
}

uint64_t IncrementCertEntryUsageCount(uint64_t a1, void *key)
{
  uint64_t result;
  const __CFArray *Value;
  const __CFArray *v6;
  const void *v7;
  CFIndex Count;
  uint64_t valuePtr;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !key || *(_BYTE *)(a1 + 48))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    IncrementCertEntryUsageCount_cold_2();
    return 0;
  }
  valuePtr = 0;
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), key);
  v6 = Value;
  if (!Value)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    Count = 0;
LABEL_16:
    IncrementCertEntryUsageCount_cold_1((__int16)v6, buf, Count);
    return 0;
  }
  if (CFArrayGetCount(Value) != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    Count = CFArrayGetCount(v6);
    goto LABEL_16;
  }
  result = (uint64_t)CFArrayGetValueAtIndex(v6, 0);
  if (result)
  {
    result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongType, &valuePtr);
    if ((_DWORD)result)
    {
      *(_QWORD *)buf = valuePtr + 1;
      result = (uint64_t)CFNumberCreate(0, kCFNumberLongType, buf);
      if (result)
      {
        v7 = (const void *)result;
        CFArraySetValueAtIndex(v6, 0, (const void *)result);
        CFRelease(v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, v6);
        return 1;
      }
    }
  }
  return result;
}

uint64_t MFAARemoveCertDataEntryFromCache(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1 && a2 && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAARemoveCertDataEntryFromCache_block_invoke;
    block[3] = &unk_24CE34B48;
    block[4] = v10;
    block[5] = &v6;
    block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAARemoveCertDataEntryFromCache_cold_1();
  }
  v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t MFAACreateMatchingHashForCertChainFromHashLSB(uint64_t a1, CFStringRef theString)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  CFStringRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (a1 && theString && CFStringGetLength(theString) == 2 && (v3 = v14[3], !*(_BYTE *)(v3 + 48)))
  {
    v6 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAACreateMatchingHashForCertChainFromHashLSB_block_invoke;
    block[3] = &unk_24CE34B70;
    block[4] = &v13;
    block[5] = &v9;
    block[6] = theString;
    dispatch_sync(v6, block);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v10[3];
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = theString;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Found hash %@ for LSB %@\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAACreateMatchingHashForCertChainFromHashLSB_cold_1();
  }
  v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t MFAACreateCertChainDataFromHash(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1 && a2 && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAACreateCertChainDataFromHash_block_invoke;
    block[3] = &unk_24CE34B98;
    block[4] = v10;
    block[5] = &v6;
    block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAACreateCertChainDataFromHash_cold_1();
  }
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t MFAAAddCertChainDataEntryToCacheForHash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v6;
  _QWORD block[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1 && a2 && a3 && !*(_BYTE *)(a1 + 48))
  {
    v6 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAAAddCertChainDataEntryToCacheForHash_block_invoke;
    block[3] = &unk_24CE34BC0;
    block[6] = a3;
    block[7] = a2;
    block[4] = v12;
    block[5] = &v8;
    block[8] = a1;
    dispatch_sync(v6, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAAAddCertChainDataEntryToCacheForHash_cold_1();
  }
  v4 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);
  return v4;
}

uint64_t MFAARemoveCertChainDataEntryFromCache(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[4];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1 && a2 && !*(_BYTE *)(a1 + 48))
  {
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __MFAARemoveCertChainDataEntryFromCache_block_invoke;
    block[3] = &unk_24CE34BE8;
    block[4] = v10;
    block[5] = &v6;
    block[6] = a2;
    dispatch_sync(v4, block);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAARemoveCertChainDataEntryFromCache_cold_1();
  }
  v2 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

CFDataRef MFAACreateSerialNumberDataFromString(const __CFString *a1)
{
  __int128 v1;
  CFIndex Length;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  char v13;
  char v14;
  char v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  char v20;
  char v21;
  CFDataRef result;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[2];
  char buffer[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v52 = -86;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v50 = v1;
  v51 = v1;
  *(_OWORD *)buffer = v1;
  v49 = v1;
  v47[0] = v1;
  v47[1] = v1;
  if (!a1)
  {
    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v31)
      MFAACreateSerialNumberDataFromString_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    return 0;
  }
  Length = CFStringGetLength(a1);
  v4 = Length;
  if (Length < 1 || (unint64_t)Length > 0x40 || (Length & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAACreateSerialNumberDataFromString_cold_4(v4);
    return 0;
  }
  if (!CFStringGetCString(a1, buffer, 65, 0x600u))
  {
    v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v39)
      MFAACreateSerialNumberDataFromString_cold_2(v39, v40, v41, v42, v43, v44, v45, v46);
    return 0;
  }
  v5 = v4 >> 1;
  if (v4 >= 2)
  {
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v4 >> 1;
    v7 = &buffer[1];
    v8 = v47;
    do
    {
      v9 = *(v7 - 1);
      v10 = v9 - 48;
      v11 = v9 - 97;
      if ((v9 - 65) >= 6)
        v12 = 0;
      else
        v12 = v9 - 55;
      v13 = v9 - 87;
      if (v11 > 5)
        v13 = v12;
      if (v10 < 0xA)
        v13 = v10;
      v14 = 16 * v13;
      v16 = *v7;
      v7 += 2;
      v15 = v16;
      v17 = v16 - 48;
      v18 = v16 - 97;
      v19 = v16 - 55;
      if ((v16 - 65) >= 6)
        v20 = 0;
      else
        v20 = v19;
      v21 = v15 - 87;
      if (v18 > 5)
        v21 = v20;
      if (v17 < 0xA)
        v21 = v17;
      *v8++ = v21 + v14;
      --v6;
    }
    while (v6);
  }
  result = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v47, v5);
  if (!result)
  {
    v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v23)
      MFAACreateSerialNumberDataFromString_cold_3(v23, v24, v25, v26, v27, v28, v29, v30);
    return 0;
  }
  return result;
}

uint64_t *MFAACreateCapsFromAuthCert(const __CFData *a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  const void *v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFData *v38;
  const __CFData *v39;
  unint64_t *BytePtr;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v57;
  _BYTE v58[18];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (!v2)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      MFAACreateCapsFromAuthCert_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  v3 = v2;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  if (!a1)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      MFAACreateCapsFromAuthCert_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_36;
  }
  v4 = MFAACreateSecurityCertificateReference(a1);
  if (!v4)
  {
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
      MFAACreateCapsFromAuthCert_cold_4(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_36;
  }
  v5 = (const void *)v4;
  v6 = SecCertificateGetiAuthVersion();
  v7 = v6;
  if (v6 == 5 || v6 == 3)
  {
    v38 = (const __CFData *)SecCertificateCopyiAPAuthCapabilities();
    if (v38)
    {
      v39 = v38;
      BytePtr = (unint64_t *)CFDataGetBytePtr(v38);
      if (CFDataGetLength(v39) == 32)
      {
        v41 = bswap64(*BytePtr);
        v42 = bswap64(BytePtr[1]);
        v43 = bswap64(BytePtr[2]);
        v44 = bswap64(BytePtr[3]);
        v45 = v44 & 0xFFFFFFFFFFFFD0F9;
        if ((v44 & 0xC000) == 0)
          v45 = v44;
        v46 = v45 | 0x2F00;
        if ((v45 & 4) == 0)
          v46 = v45;
        if ((v45 & 2) != 0)
          v47 = v45 | 0xF00;
        else
          v47 = v46;
        CFRelease(v39);
        *v3 = v47;
        v3[1] = v43;
        v3[2] = v42;
        v3[3] = v41;
        if (v7 != 3 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          goto LABEL_29;
        v57 = 134218240;
        *(_QWORD *)v58 = v44;
        *(_WORD *)&v58[8] = 2048;
        *(_QWORD *)&v58[10] = v47;
        v11 = MEMORY[0x24BDACB70];
        v12 = "AuthV3 orig authCertCaps0:%08llX -> final authCertCaps0:%08llX\n";
        v13 = 22;
        goto LABEL_28;
      }
      CFRelease(v39);
    }
    else
    {
      v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v48)
        MFAACreateCapsFromAuthCert_cold_6(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_35;
  }
  if (v6 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAACreateCapsFromAuthCert_cold_5((unsigned __int16)v5, v7);
    goto LABEL_35;
  }
  v8 = MFAACertificateAuthV2Class((uint64_t)a1);
  if (v8 >= 0xD)
  {
LABEL_35:
    CFRelease(v5);
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAACreateCapsFromAuthCert_cold_2();
    free(v3);
    return 0;
  }
  v9 = v8;
  v10 = GetAccessoryCaps_kCertAccessoryCaps[v8];
  *v3 = v10;
  v3[2] = 0;
  v3[3] = 0;
  v3[1] = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v57 = 67109376;
    *(_DWORD *)v58 = v9;
    *(_WORD *)&v58[4] = 2048;
    *(_QWORD *)&v58[6] = v10;
    v11 = MEMORY[0x24BDACB70];
    v12 = "AuthV2 authCertClass:%02X -> authCertCaps0:%08llX\n";
    v13 = 18;
LABEL_28:
    _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v57, v13);
  }
LABEL_29:
  CFRelease(v5);
  return v3;
}

void MFAADeallocAuthCertCaps(void *a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    free(a1);
  }
  else
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      MFAADeallocAuthCertCaps_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t MFAACanChargeHighVoltage(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 1) & 1;
  return result;
}

uint64_t MFAACanChargeInductive(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 1) & 1;
  return result;
}

_QWORD *MFAACanUseAccPwrUHPM(_QWORD *result)
{
  if (result)
  {
    if ((*result & 0x400) != 0)
      return (_QWORD *)((*result >> 10) & 1);
    else
      return (_QWORD *)((*result & 0x410) != 0);
  }
  return result;
}

unsigned __int8 *MFAAIsAppleMFiAccessory(unsigned __int8 *result)
{
  if (result)
    return (unsigned __int8 *)((*result >> 4) & 1);
  return result;
}

uint64_t MFAACanUseAccPwrLoV(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 3) & 1;
  return result;
}

uint64_t MFAAIsMagSafeAccessory(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 4) & 1;
  return result;
}

uint64_t MFAACanReceiveInductivePower(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 5) & 1;
  return result;
}

_BYTE *MFAAIsAppleAccessory(_BYTE *result)
{
  if (result)
    return (_BYTE *)((*result & 0x18) == 0);
  return result;
}

unsigned __int8 *MFAAIsAppleHWModule(unsigned __int8 *result)
{
  if (result)
    return (unsigned __int8 *)((*result >> 3) & 1);
  return result;
}

uint64_t MFAAIsAppleBatteryModule(uint64_t result)
{
  if (result)
    return *(unsigned __int8 *)(result + 1) >> 7;
  return result;
}

uint64_t MFAAIsAppleTouchControllerModule(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 6) & 1;
  return result;
}

uint64_t mfaa_certificateManager_SWAuthCertType(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  init_logging();
  if (gLogObjects)
    v2 = gNumLogObjects < 2;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_212836000, v4, OS_LOG_TYPE_INFO, "Checking SW Auth cert type...", (uint8_t *)&v17, 2u);
  }

  if (a1)
  {
    v5 = (void *)SecCertificateCopyIssuerSummary();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Test Accessories Software Authentication Root CA"));

    if ((v6 & 1) != 0)
    {
      v13 = 3;
    }
    else
    {
      v7 = (void *)SecCertificateCopyiAPSWAuthCapabilities();
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v8 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[MFAATokenManager _init].cold.2();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v7;
        _os_log_impl(&dword_212836000, v8, OS_LOG_TYPE_INFO, "generalData: %@", (uint8_t *)&v17, 0xCu);
      }

      if (v7
        && (unint64_t)objc_msgSend(v7, "length") >= 2
        && (v10 = objc_retainAutorelease(v7), *(unsigned __int8 *)objc_msgSend(v10, "bytes") == 255)
        && (v11 = objc_retainAutorelease(v10), !*(_BYTE *)(objc_msgSend(v11, "bytes") + 1))
        && (unint64_t)objc_msgSend(v11, "length") >= 3)
      {
        v12 = objc_retainAutorelease(v11);
        if (*(_BYTE *)(objc_msgSend(v12, "bytes") + 2) == 1)
          v13 = 1;
        else
          v13 = 2 * (*(_BYTE *)(objc_msgSend(objc_retainAutorelease(v12), "bytes") + 2) == 0);
      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v14 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    LODWORD(v18) = v13;
    _os_log_impl(&dword_212836000, v14, OS_LOG_TYPE_DEFAULT, "certType: %{coreacc:MFAACertificateManager_SWAuth_CertType_t}d", (uint8_t *)&v17, 8u);
  }

  return v13;
}

id logObjectForModule(int a1)
{
  BOOL v1;
  id v2;
  id v3;

  if (a1 < 0 || (gLogObjects ? (v1 = gNumLogObjects <= a1) : (v1 = 1), v1))
  {
    if (a1 != -1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      logObjectForModule_cold_1();
    v2 = (id)MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)(gLogObjects + 8 * a1);
  }
  return v2;
}

__CFArray *_createCertificateArrayForCert(const void *a1)
{
  __CFArray *Mutable;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, a1);
  return Mutable;
}

id _anchorCertsForComponentAuth()
{
  BOOL v0;
  id v1;
  NSObject *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_anchorCertsForComponentAuth_onceToken != -1)
    dispatch_once(&_anchorCertsForComponentAuth_onceToken, &__block_literal_global_176);
  if (gLogObjects)
    v0 = gNumLogObjects < 2;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MFAATokenManager _init].cold.2();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)(gLogObjects + 8);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = objc_msgSend((id)_anchorCertsForComponentAuth_anchorCerts, "count");
    _os_log_impl(&dword_212836000, v2, OS_LOG_TYPE_INFO, "%lu anchor cert(s) returned for Component Auth", (uint8_t *)&v4, 0xCu);
  }

  return (id)_anchorCertsForComponentAuth_anchorCerts;
}

void sub_212847F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_212848438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void ___anchorCertsForMFi2_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForMFi2_anchorCerts;
  _anchorCertsForMFi2_anchorCerts = v0;

}

void ___anchorCertsForMFi3_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForMFi3_anchorCerts;
  _anchorCertsForMFi3_anchorCerts = v0;

}

void ___anchorCertsForSWAuth_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForSWAuth_anchorCerts;
  _anchorCertsForSWAuth_anchorCerts = v0;

}

void ___anchorCertsForComponentAuth_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForComponentAuth_anchorCerts;
  _anchorCertsForComponentAuth_anchorCerts = v0;

}

void ___anchorCertsForBAAUser_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForBAAUser_anchorCerts;
  _anchorCertsForBAAUser_anchorCerts = v0;

}

void ___anchorCertsForDEVN_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 32);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForDEVN_anchorCerts;
  _anchorCertsForDEVN_anchorCerts = v0;

}

void ___anchorCertsForProvenance_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 64);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForProvenance_anchorCerts;
  _anchorCertsForProvenance_anchorCerts = v0;

}

void ___anchorCertsForWPC_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", 128);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_anchorCertsForWPC_anchorCerts;
  _anchorCertsForWPC_anchorCerts = v0;

}

void OUTLINED_FUNCTION_21(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

const __CFString *errorDescription(void *a1, unint64_t a2)
{
  id v3;
  __CFString **v4;
  const __CFString *v5;

  v3 = a1;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MFAACertificateManagerErrorDomain"))
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("MFAATokenManagerErrorDomain")))
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MFAAPairingManagerErrorDomain")))
    {
      v5 = CFSTR("An unknown error has occurred.");
      goto LABEL_11;
    }
    if (a2 > 0xFFFFFFFFFFFFFFFBLL)
    {
      v4 = &off_24CE34FB8[a2 + 4];
      goto LABEL_5;
    }
LABEL_9:
    v5 = 0;
    goto LABEL_11;
  }
  if (a2 <= 0xFFFFFFFFFFFFFFF9)
    goto LABEL_9;
  v4 = &off_24CE34F88[a2 + 6];
LABEL_5:
  v5 = *v4;
LABEL_11:

  return v5;
}

uint64_t MFAAVerifyPublicCertificate(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    MFAAVerifyPublicCertificate_cold_4();
    if (a1)
      goto LABEL_3;
LABEL_18:
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v20)
      MFAAVerifyPublicCertificate_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    v16 = 0;
    v17 = 0;
    v3 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  if (!a1)
    goto LABEL_18;
LABEL_3:
  +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyParsedCertificateChainInfo:", a1);

  if (v3)
  {
    +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copyEvaluatedCertificateChainInfo:", v3);

    if (v5)
    {
      v6 = v5;

      v7 = +[MFAACertificateManager isMFi2_3CertInfo:](MFAACertificateManager, "isMFi2_3CertInfo:", v6);
      v3 = v6;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("LeafCertData"));
    v16 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v17 = 1;
      v18 = (void *)v16;
      goto LABEL_14;
    }
    a1 = v16;
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      MFAAVerifyPublicCertificate_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = 0;
    v3 = 0;
  }
  v18 = (void *)v16;
  MFAAPrintCertSerialNumber(a1);
  v17 = 0;
  v16 = a1;
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    MFAAVerifyPublicCertificate_cold_1(v16, v17);

  return v17;
}

uint64_t MFAAVerifyPublicCertificateChain(const __CFArray *a1)
{
  const __CFData *ValueAtIndex;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  CFIndex Count;
  __CFArray *Mutable;
  CFIndex v8;
  const __CFData *v9;
  const void *v10;
  const void *v11;
  __CFArray *v12;
  __CFArray *v13;
  int v14;
  uint64_t v15;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  SecTrustRef trust;

  trust = 0;
  v50 = 0;
  if (!a1)
    return 0;
  ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(a1, 0);
  v3 = MFAACertificateAuthVersionNumber(ValueAtIndex);
  v4 = SecPolicyCreateiAP();
  if (!v4)
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      MFAAVerifyPublicCertificateChain_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  v5 = (const void *)v4;
  Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  if (!Mutable)
  {
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      MFAAVerifyPublicCertificateChain_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_34;
  }
  if (CFArrayGetCount(a1) >= 1)
  {
    v8 = 0;
    do
    {
      v9 = (const __CFData *)CFArrayGetValueAtIndex(a1, v8);
      if (v9)
      {
        v10 = (const void *)MFAACreateSecurityCertificateReference(v9);
        if (v10)
        {
          v11 = v10;
          CFArrayAppendValue(Mutable, v10);
          CFRelease(v11);
        }
      }
      ++v8;
    }
    while (CFArrayGetCount(a1) > v8);
  }
  SecTrustCreateWithCertificates(Mutable, v5, &trust);
  if (!trust)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      -[MFAACertificateManager verifyNonceSignature:nonce:signature:].cold.12(v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_34;
  }
  v12 = MFAACreateAnchorCertificateAuthorityArray(v3);
  if (!v12)
  {
    v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v41)
      MFAAVerifyPublicCertificateChain_cold_4(v41, v42, v43, v44, v45, v46, v47, v48);
LABEL_34:
    v13 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  SecTrustSetAnchorCertificates(trust, v12);
  v14 = MEMORY[0x212BF51D4](trust, &v50);
  if (v14)
  {
    v49 = v14;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAAVerifyPublicCertificateChain_cold_6(v49);
  }
  else
  {
    v15 = 1;
    if (v50 == 1 || v50 == 4)
      goto LABEL_18;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAAVerifyPublicCertificateChain_cold_5(&v50);
  }
LABEL_17:
  v15 = 0;
LABEL_18:
  CFRelease(v5);
  if (trust)
    CFRelease(trust);
  if (Mutable)
    CFRelease(Mutable);
  if (v13)
    CFRelease(v13);
  return v15;
}

uint64_t MFAAVerifyCertificateSerialNumber(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  if (a1)
  {
    +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copyParsedCertificateChainInfo:", a1);
    if (v3)
    {
      v4 = (void *)v3;
      v5 = objc_msgSend(v2, "verifyCertificateChainInfoSerialNumber:", v3);

      if ((v5 & 1) != 0)
        return 1;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        MFAAVerifyCertificateSerialNumber_cold_2();

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    MFAAVerifyCertificateSerialNumber_cold_1();
  }
  MFAAPrintCertSerialNumber(a1);
  return 0;
}

uint64_t MFAAVerifyCertificateSerialNumberBySerialNumber(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verifyCertificateSerialNumberBySerialNumber:authVer:", a1, a2);

    return v5;
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[MFAACertificateManager verifyCertificateSerialNumberBySerialNumber:authVer:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
}

uint64_t MFAAVerifyNonceSignature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!a1)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      MFAAVerifyNonceSignature_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_15;
  }
  if (!a2)
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      MFAAVerifyNonceSignature_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_15;
  }
  if (!a3)
  {
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v27)
      MFAAVerifyNonceSignature_cold_3(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_15;
  }
  v8 = objc_msgSend(v6, "copyParsedCertificateChainInfo:", a1);
  if (!v8)
  {
    v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v35)
      MFAAVerifyNonceSignature_cold_4(v35, v36, v37, v38, v39, v40, v41, v42);
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v9 = (void *)v8;
  if ((objc_msgSend(v7, "verifyNonceSignature:nonce:signature:", v8, a2, a3) & 1) == 0)
  {
LABEL_16:
    MFAAPrintCertSerialNumber(a1);
    v10 = 0;
    goto LABEL_17;
  }
  v10 = 1;
LABEL_17:

  return v10;
}

uint64_t MFAACreateCertificateSerialNumber(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1)
  {
    +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "copyParsedCertificateChainInfo:", a1);

    if (!v3
      || (+[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "copyLeafCertificateSerialNumber:", v3),
          v4,
          !v5))
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        MFAACreateCertificateSerialNumber_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
      v5 = 0;
    }

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      MFAACreateCertificateSerialNumber_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  return v5;
}

CFDataRef MFAACreateRandomNonce(const __CFData *a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  int v4;
  const void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFDataRef v14;
  size_t v15;
  uint64_t v16;
  uint8_t *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      MFAACreateCertificateSerialNumber_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  v1 = MFAACreateSecurityCertificateReference(a1);
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  v3 = SecCertificateGetiAuthVersion();
  if ((_DWORD)v3 == 2)
  {
    v15 = 20;
  }
  else
  {
    v4 = v3;
    if ((_DWORD)v3 != 3)
    {
      v5 = (const void *)SecCertificateCopyComponentType();
      if (v5)
      {
        CFRelease(v5);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v28 = v4;
          _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SecCertificateGetiAuthVersion invalid auth version: %{coreacc:SeciAuthVersion}d, and no SecCertificateCopyComponentType", buf, 8u);
        }
        v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v3)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using AUTH_V300_LENGTH_KEY_256 for default length", buf, 2u);
        }
      }
    }
    v15 = 32;
  }
  MEMORY[0x24BDAC7A8](v3);
  v17 = &buf[-v16];
  memset(&buf[-v16], 170, v15);
  arc4random_buf(v17, v15);
  v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v17, v15);
  if (!v14)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      MFAACreateRandomNonce_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  CFRelease(v2);
  return v14;
}

uint64_t MFAAComponentAuthCreateSignature(uint64_t a1, const __CFData *a2, _QWORD *a3, int a4, uint64_t a5)
{
  const __CFData *v8;
  const __CFData *v9;
  io_service_t AuthCP;
  kern_return_t v11;
  int v12;
  const __CFData *v13;
  int v14;
  CFDataRef v15;
  int v16;
  uint64_t v17;
  NSObject *v19;
  const char *v20;
  kern_return_t v21;
  int v22;
  uint32_t v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  int v28;
  uint64_t v29;
  io_connect_t connect;
  CFDataRef v31;
  CFDataRef v32;
  CFDataRef v33;
  uint8_t buf[8];
  uint64_t v35;

  v8 = a2;
  v35 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v33 = 0;
  v31 = 0;
  connect = 0;
  v29 = 0;
  if (a5 == 2)
  {
    if (!a2)
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 8);
      v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      goto LABEL_6;
    }
  }
  else if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "!challenge\n", buf, 2u);
    }
    v17 = 0;
    v13 = 0;
    v15 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
LABEL_6:
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "!response\n";
LABEL_36:
    v23 = 2;
    goto LABEL_37;
  }
  AuthCP = __findAuthCP();
  if (!AuthCP)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "!moduleAuthService\n";
    goto LABEL_36;
  }
  v11 = IOServiceOpen(AuthCP, *MEMORY[0x24BDAEC58], 0, &connect);
  if (v11)
  {
    v21 = v11;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    v19 = MEMORY[0x24BDACB70];
    v20 = "IOServiceOpen failed: 0x%x\n";
LABEL_33:
    v23 = 8;
LABEL_37:
    _os_log_impl(&dword_212836000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v23);
    goto LABEL_38;
  }
  if (!connect)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "!connect\n", buf, 2u);
    }
    v13 = 0;
    v15 = 0;
    goto LABEL_18;
  }
  v12 = cpCreateFormattedChallengeFromServerRequest(connect, v8, &v33);
  if (v12)
  {
    v22 = v12;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v22;
    v19 = MEMORY[0x24BDACB70];
    v20 = "cpCreateFormattedChallengeFromServerRequest failed: 0x%x\n";
    goto LABEL_33;
  }
  v13 = v33;
  if (!v33)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x24BDACB70];
      v20 = "formattedChallengeCF==NULL\n";
      goto LABEL_36;
    }
LABEL_38:
    v17 = 0;
    v13 = 0;
LABEL_45:
    v15 = 0;
    goto LABEL_19;
  }
  if (!-[__CFData length](v33, "length"))
    goto LABEL_44;
  v14 = cpCreateSignatureWithIndexAndToken(connect, v13, &v32, &v29, a4);
  if (v14)
  {
    v24 = v14;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      v25 = MEMORY[0x24BDACB70];
      v26 = "cpCreateSignatureWithIndexAndToken failed: 0x%x\n";
      v27 = 8;
LABEL_43:
      _os_log_impl(&dword_212836000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    }
LABEL_44:
    v17 = 0;
    goto LABEL_45;
  }
  v15 = v32;
  if (!v32)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = MEMORY[0x24BDACB70];
      v26 = "signatureCF==NULL\n";
      v27 = 2;
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v16 = cpCreateFormattedResponseForServerResponse(connect, v32, &v31, a5);
  if (!v16)
  {
    if (v31)
      *a3 = v31;
LABEL_18:
    v17 = 1;
    goto LABEL_19;
  }
  v28 = v16;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v28;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "cpCreateFormattedResponseForServerResponse failed: 0x%x\n", buf, 8u);
  }
  v17 = 0;
LABEL_19:
  if (connect)
    IOServiceClose(connect);

  return v17;
}

uint64_t __findAuthCP()
{
  const __CFDictionary *v0;
  uint64_t v1;
  const __CFAllocator *v2;
  NSObject *v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;
  NSObject *v7;
  const char *v8;
  io_iterator_t existing[2];
  uint8_t buf[4];
  io_iterator_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)existing = 0;
  v0 = IOServiceMatching("AppleAuthCP");
  if (!v0)
  {
    v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v1;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "!matchingDict\n";
LABEL_25:
    _os_log_impl(&dword_212836000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    return 0;
  }
  if (IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v0, &existing[1]))
  {
    v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v1;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "IOServiceGetMatchingServices failed\n";
    goto LABEL_25;
  }
  if (!existing[1])
  {
    v1 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v1;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "!iter\n";
    goto LABEL_25;
  }
  v1 = IOIteratorNext(existing[1]);
  if (!(_DWORD)v1)
    goto LABEL_17;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = MEMORY[0x24BDACB70];
  while (1)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v1, CFSTR("flags"), v2, 0);
    if (!CFProperty)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212836000, v3, OS_LOG_TYPE_DEFAULT, "numberref is NULL\n", buf, 2u);
      }
      goto LABEL_14;
    }
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, existing))
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = existing[0];
        _os_log_impl(&dword_212836000, v3, OS_LOG_TYPE_DEFAULT, "tmpAuthFlags=%d\n", buf, 8u);
      }
      if (BYTE2(existing[0]) << 16 == 0x40000)
        break;
    }
    CFRelease(v5);
LABEL_14:
    IOObjectRelease(v1);
    v1 = IOIteratorNext(existing[1]);
    if (!(_DWORD)v1)
      goto LABEL_17;
  }
  CFRelease(v5);
LABEL_17:
  IOObjectRelease(existing[1]);
  return v1;
}

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v5, "length"))
    {
      v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < objc_msgSend(v5, "length"));
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_24CE383E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  size_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  unint64_t v19;
  void *v20;
  __int16 v22;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "hexadecimalCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invertedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", &stru_24CE383E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = objc_retainAutorelease(v5);
    v6 = (const char *)objc_msgSend(v1, "UTF8String");
    v7 = strlen(v6) >> 1;
    v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)objc_msgSend(v1, "length") >= 2)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = 0;
        v22 = -21846;
        v12 = 1;
        do
        {
          v13 = v12;
          v14 = v6[v11 | (2 * v10)];
          v15 = v14 - 48;
          v16 = v14 - 65;
          if ((v14 - 97) >= 6)
            v17 = 0;
          else
            v17 = v14 - 87;
          v18 = v14 - 55;
          if (v16 > 5)
            v18 = v17;
          if (v15 < 0xA)
            v18 = v15;
          *((_BYTE *)&v22 + v11) = v18;
          v11 = 1;
          v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        v9 = (v10 + 1);
        v19 = objc_msgSend(v1, "length");
        v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      free(v8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, _QWORD *a5)
{
  Protocol *v9;
  void *v10;
  objc_method_description *v11;
  objc_method_description *v12;
  unint64_t v13;
  SEL *p_name;
  void *v15;
  uint64_t v16;
  unsigned int outCount;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  v12 = v11;
  if (outCount)
  {
    v13 = 0;
    p_name = &v11->name;
    do
    {
      if ((objc_msgSend(a1, "instancesRespondToSelector:", *p_name) & 1) == 0)
      {
        NSStringFromSelector(*p_name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && objc_msgSend(v10, "count"))
  {
    v16 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v16 = 1;
  if (a5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 1;
  v1 = (void *)MEMORY[0x24BDBCEF8];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((isNSObjectNull(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = v1;

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

id castNSObjectToType(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id readJSONFile(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_5;
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v1, 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v5)
  {

LABEL_5:
    v3 = 0;
  }

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (!v4)
    goto LABEL_7;
  if (!v3)
    v3 = (id)MEMORY[0x24BDBD1B8];
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "writeToFile:atomically:", v4, 1);

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "base64EncodedStringWithOptions:", 0, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BDBCE50]);
        v10 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (_QWORD)v12);
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t getNumRevokedAuth3Wafers()
{
  return 26;
}

void *getRevokedAuth3Wafers()
{
  return &wafers;
}

uint64_t MFAACreateSecurityCertificateReference(const __CFData *a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  const void *ValueAtIndex;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  v3 = v2;
  if (v2 && CFArrayGetCount(v2) >= 1)
  {
    Count = CFArrayGetCount(v3);
    ValueAtIndex = CFArrayGetValueAtIndex(v3, Count - 1);
    v6 = (uint64_t)ValueAtIndex;
    if (ValueAtIndex)
      CFRetain(ValueAtIndex);
    goto LABEL_6;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v6 = SecCertificateCreateWithBytes();
  if (v3)
LABEL_6:
    CFRelease(v3);
  if (!v6)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      MFAACreateSecurityCertificateReference_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return v6;
}

uint64_t MFAACreateSecurityCertificateReferenceFromBytes(UInt8 *bytes, CFIndex length)
{
  const __CFData *v2;
  const __CFData *v3;
  uint64_t v4;

  if (!bytes)
    return 0;
  if (!length)
    return 0;
  v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = MFAACreateSecurityCertificateReference(v2);
  CFRelease(v3);
  return v4;
}

__CFArray *MFAACreateAnchorCertificateAuthorityArray(uint64_t a1)
{
  __CFArray *Mutable;
  const void *v3;
  const void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const void *v65;
  const void *v66;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const void *v75;
  const void *v76;
  _BOOL8 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const void *v85;
  const void *v86;
  _BOOL8 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const void *v95;
  const void *v96;
  _BOOL8 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const void *v105;
  _BOOL8 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  if (MFAAIsInternalBuild_onceToken != -1)
    dispatch_once(&MFAAIsInternalBuild_onceToken, &__block_literal_global_1);
  if (MFAAIsDesenseBuild_onceToken != -1)
    dispatch_once(&MFAAIsDesenseBuild_onceToken, &__block_literal_global_4);
  if (MFAAIsDevelopmentHW_onceToken != -1)
    dispatch_once(&MFAAIsDevelopmentHW_onceToken, &__block_literal_global_14);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    switch((_DWORD)a1)
    {
      case 5:
        v13 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kCertDER_Mfi4_Root, 504);
        if (v13)
        {
          v14 = v13;
          CFArrayAppendValue(Mutable, v13);
          CFRelease(v14);
        }
        else
        {
          v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v41)
            MFAACreateAnchorCertificateAuthorityArray_cold_12(v41, v42, v43, v44, v45, v46, v47, v48);
        }
        if (gbIsInternalBuild | gbIsDesenseBuild)
        {
          v32 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kCertDER_Mfi4_Root_Test, 505);
          if (v32)
            goto LABEL_52;
          v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v49)
            MFAACreateAnchorCertificateAuthorityArray_cold_11(v49, v50, v51, v52, v53, v54, v55, v56);
        }
        break;
      case 3:
        v15 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kiPodAccessoryTestAuth3CA, 667);
        if (v15)
        {
          v16 = v15;
          CFArrayAppendValue(Mutable, v15);
          CFRelease(v16);
        }
        else
        {
          v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v57)
            MFAACreateAnchorCertificateAuthorityArray_cold_10(v57, v58, v59, v60, v61, v62, v63, v64);
        }
        v65 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCADev, 667);
        if (v65)
        {
          v66 = v65;
          CFArrayAppendValue(Mutable, v65);
          CFRelease(v66);
        }
        else
        {
          v67 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v67)
            MFAACreateAnchorCertificateAuthorityArray_cold_9(v67, v68, v69, v70, v71, v72, v73, v74);
        }
        v75 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCAProd, 667);
        if (v75)
        {
          v76 = v75;
          CFArrayAppendValue(Mutable, v75);
          CFRelease(v76);
        }
        else
        {
          v77 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v77)
            MFAACreateAnchorCertificateAuthorityArray_cold_8(v77, v78, v79, v80, v81, v82, v83, v84);
        }
        if (gbIsInternalBuild | gbIsDesenseBuild)
        {
          v85 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kiPodAccessoryTestCAProto, 637);
          if (v85)
          {
            v86 = v85;
            CFArrayAppendValue(Mutable, v85);
            CFRelease(v86);
          }
          else
          {
            v87 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v87)
              MFAACreateAnchorCertificateAuthorityArray_cold_7(v87, v88, v89, v90, v91, v92, v93, v94);
          }
          v95 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCASimu, 667);
          if (v95)
          {
            v96 = v95;
            CFArrayAppendValue(Mutable, v95);
            CFRelease(v96);
          }
          else
          {
            v97 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v97)
              MFAACreateAnchorCertificateAuthorityArray_cold_6(v97, v98, v99, v100, v101, v102, v103, v104);
          }
          v32 = (const void *)MFAACreateSecurityCertificateReferenceFromBytes(kAuth3ECSSubCADev0, 667);
          if (v32)
            goto LABEL_52;
          v107 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v107)
            MFAACreateAnchorCertificateAuthorityArray_cold_5(v107, v108, v109, v110, v111, v112, v113, v114);
        }
        break;
      case 2:
        v3 = (const void *)SecCertificateCreateWithBytes();
        if (v3)
        {
          v4 = v3;
          CFArrayAppendValue(Mutable, v3);
          CFRelease(v4);
        }
        else
        {
          v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v24)
            MFAACreateAnchorCertificateAuthorityArray_cold_4(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        v32 = (const void *)SecCertificateCreateWithBytes();
        if (!v32)
        {
          v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v33)
            MFAACreateAnchorCertificateAuthorityArray_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
          return Mutable;
        }
LABEL_52:
        v105 = v32;
        CFArrayAppendValue(Mutable, v32);
        CFRelease(v105);
        return Mutable;
      default:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          MFAACreateAnchorCertificateAuthorityArray_cold_2(a1, v17, v18, v19, v20, v21, v22, v23);
        break;
    }
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      MFAACreateAnchorCertificateAuthorityArray_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  return Mutable;
}

uint64_t MFAAIsInternalBuild()
{
  if (MFAAIsInternalBuild_onceToken != -1)
    dispatch_once(&MFAAIsInternalBuild_onceToken, &__block_literal_global_1);
  return gbIsInternalBuild;
}

uint64_t MFAAIsDesenseBuild()
{
  if (MFAAIsDesenseBuild_onceToken != -1)
    dispatch_once(&MFAAIsDesenseBuild_onceToken, &__block_literal_global_4);
  return gbIsDesenseBuild;
}

uint64_t MFAAIsDevelopmentHW()
{
  if (MFAAIsDevelopmentHW_onceToken != -1)
    dispatch_once(&MFAAIsDevelopmentHW_onceToken, &__block_literal_global_14);
  return gbIsDevelopmentHW;
}

uint64_t MFAACertificateAuthVersionNumber(const __CFData *a1)
{
  uint64_t v1;
  const void *v2;
  unsigned int v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v1 = MFAACreateSecurityCertificateReference(a1);
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  v3 = SecCertificateGetiAuthVersion();
  if (v3 - 2 >= 4)
    v4 = 0;
  else
    v4 = v3;
  CFRelease(v2);
  return v4;
}

uint64_t MFAACertificateAuthV2Class(uint64_t a1)
{
  const __CFData *v1;
  const __CFData *v2;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (const __CFData *)MFAACreateCertificateSerialNumber(a1);
  if (v1)
  {
    v2 = v1;
    BytePtr = CFDataGetBytePtr(v1);
    Length = CFDataGetLength(v2);
    if (BytePtr && Length == 15)
    {
      if (BytePtr[7] <= 0x10u && BytePtr[2] == 170 && BytePtr[6] == 170)
      {
        v5 = 0x7FFFFFFFLL;
        if (BytePtr[8] == 170)
        {
          if (BytePtr[11] == 170)
            v5 = BytePtr[7];
          else
            v5 = 0x7FFFFFFFLL;
        }
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      MFAACertificateAuthV2Class_cold_2();
    }
    v5 = 0x7FFFFFFFLL;
LABEL_17:
    CFRelease(v2);
    return v5;
  }
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v6)
    MFAACertificateAuthV2Class_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  return 0x7FFFFFFFLL;
}

void MFAAPrintCertSerialNumber(uint64_t a1)
{
  const __CFData *v1;
  const __CFData *v2;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = (const __CFData *)MFAACreateCertificateSerialNumber(a1);
  if (v1)
  {
    v2 = v1;
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v1);
    Length = CFDataGetLength(v2);
    MFAAPrintCertSerialNumberBytes(BytePtr, Length);
    CFRelease(v2);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      MFAACertificateAuthV2Class_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void MFAAPrintCertSerialNumberBytes(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14[16];
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
  _BYTE v28[31];
  uint64_t v29;

  v2 = a2;
  v3 = a1;
  v29 = *MEMORY[0x24BDAC8D0];
  if (a1 && (unint64_t)(a2 - 1) <= 0xF)
  {
    v27 = 0u;
    memset(v28, 0, sizeof(v28));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v14;
    *(_OWORD *)v14 = 0u;
    while (1)
    {
      v5 = sprintf(v4, "%02X", *v3);
      v6 = v5;
      if ((int)v5 < 1)
        break;
      ++v3;
      v4 += v5;
      if (!--v2)
        goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAAPrintCertSerialNumberBytes_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_11:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAAPrintCertSerialNumberBytes_cold_1((uint64_t)v14);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    MFAAPrintCertSerialNumberBytes_cold_3();
  }
}

uint64_t MFAAIsDeveloperBuild()
{
  if (MFAAIsDeveloperBuild_onceToken != -1)
    dispatch_once(&MFAAIsDeveloperBuild_onceToken, &__block_literal_global_8);
  return gbIsDeveloperBuild;
}

double MFAACreateDEVNCertCapsForCable()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v0)
  {
    result = *(double *)&MFAACreateDEVNCertCapsForCable_kDEVNTempCertCapsForCable;
    *v0 = MFAACreateDEVNCertCapsForCable_kDEVNTempCertCapsForCable;
    v0[1] = unk_2128C9778;
  }
  return result;
}

uint64_t MFAAPrefixesBinarySearch(uint64_t a1, unint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a3 - 1;
  if (a3 >= 1)
  {
    v4 = 0;
    do
    {
      v5 = ((v4 + v3) / 2);
      v6 = *(_QWORD *)(a1 + 24 * (int)v5);
      if (v6 <= a2)
      {
        if (v6 >= a2)
          return v5;
        v4 = v5 + 1;
      }
      else
      {
        v3 = v5 - 1;
      }
    }
    while (v4 <= v3);
  }
  return 0xFFFFFFFFLL;
}

BOOL MFAABatchBinarySearch(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;

  v3 = 0;
LABEL_2:
  v4 = v3;
  do
  {
    v3 = v4;
    if ((int)v4 >= a3)
      break;
    v5 = ((int)v4 + a3 - 1) / 2;
    v6 = (*(unsigned __int8 *)(a1 + 3 * v5) << 16) | (*(unsigned __int8 *)(a1 + 3 * v5 + 1) << 8) | *(unsigned __int8 *)(a1 + 3 * v5 + 2);
    if (v6 > a2)
    {
      a3 = v5;
      goto LABEL_2;
    }
    v4 = (v5 + 1);
  }
  while (v6 < a2);
  return (int)v3 < a3;
}

BOOL MFAAWaferBinarySearch(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;

  v3 = 0;
LABEL_2:
  v4 = v3;
  do
  {
    v3 = v4;
    if ((int)v4 >= a3)
      break;
    v5 = ((int)v4 + a3 - 1) / 2;
    v6 = *(_QWORD *)(a1 + 8 * v5);
    if (v6 > a2)
    {
      a3 = v5;
      goto LABEL_2;
    }
    v4 = (v5 + 1);
  }
  while (v6 < a2);
  return (int)v3 < a3;
}

uint64_t MFAADeviceIdentityRequestCertificate(const void *a1, int a2, _QWORD *a3, _QWORD *a4)
{
  id v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int *v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  _QWORD *v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  id v64;
  const void *v65;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  dispatch_semaphore_t v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  NSObject *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  const void *v87;
  char v88;
  CFTypeRef v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  id v110;
  _QWORD v111[10];
  _QWORD v112[10];
  __int128 v113;
  __int128 v114;
  _BYTE buf[32];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v113 = 0u;
  v114 = 0u;
  v78 = dispatch_semaphore_create(0);
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__0;
  v108 = __Block_byref_object_dispose__0;
  v109 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__0;
  v102 = __Block_byref_object_dispose__0;
  v103 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x2020000000;
  v93 = 0;
  if (!DeviceIdentityFrameworkAvailable_available)
  {
    if (!DeviceIdentityLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_24CE35100;
      *(_QWORD *)&buf[16] = 0;
      DeviceIdentityLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (DeviceIdentityLibraryCore_frameworkLibrary)
    {
      DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc();
      DeviceIdentityFrameworkAvailable_available = DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc != 0;
      if (DeviceIdentityIssueClientCertificateWithCompletionSymbolLoc)
        goto LABEL_2;
    }
    else
    {
      DeviceIdentityFrameworkAvailable_available = 0;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAADeviceIdentityRequestCertificate_cold_1();
    v79 = 0;
    v52 = 0;
    v58 = 1;
    goto LABEL_87;
  }
LABEL_2:
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)v105[5];
  v105[5] = (uint64_t)v4;

  HIWORD(v114) = 770;
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v113, 32);
  v89 = 0;
  v6 = (const void *)SecAccessControlCreate();
  if (v6)
  {
    v7 = *MEMORY[0x24BDE8F88];
    if ((SecAccessControlSetProtection() & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "MFAADeviceIdentityRequestCertificate";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 93;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v6;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d localAccessControl %@", buf, 0x1Cu);
      }
      v8 = (void *)MEMORY[0x24BDBCED8];
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v9 = (id *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
      *(_QWORD *)&buf[24] = getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
      if (!getkMAOptionsBAAKeychainLabelSymbolLoc_ptr)
      {
        v10 = (void *)DeviceIdentityLibrary();
        v9 = (id *)dlsym(v10, "kMAOptionsBAAKeychainLabel");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
        getkMAOptionsBAAKeychainLabelSymbolLoc_ptr = (uint64_t)v9;
      }
      v73 = v8;
      _Block_object_dispose(buf, 8);
      if (v9)
      {
        v72 = *v9;
        v111[0] = v72;
        v112[0] = a1;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v11 = (id *)getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr;
        *(_QWORD *)&buf[24] = getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr;
        if (!getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr)
        {
          v12 = (void *)DeviceIdentityLibrary();
          v11 = (id *)dlsym(v12, "kMAOptionsBAAKeychainAccessGroup");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v11;
          getkMAOptionsBAAKeychainAccessGroupSymbolLoc_ptr = (uint64_t)v11;
        }
        _Block_object_dispose(buf, 8);
        if (v11)
        {
          v71 = *v11;
          v111[1] = v71;
          v112[1] = CFSTR("com.apple.mfiaccessory");
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v13 = (id *)getkMAOptionsResuseExistingKeySymbolLoc_ptr;
          *(_QWORD *)&buf[24] = getkMAOptionsResuseExistingKeySymbolLoc_ptr;
          if (!getkMAOptionsResuseExistingKeySymbolLoc_ptr)
          {
            v14 = (void *)DeviceIdentityLibrary();
            v13 = (id *)dlsym(v14, "kMAOptionsResuseExistingKey");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
            getkMAOptionsResuseExistingKeySymbolLoc_ptr = (uint64_t)v13;
          }
          _Block_object_dispose(buf, 8);
          if (v13)
          {
            v15 = *v13;
            v16 = MEMORY[0x24BDBD1C8];
            v70 = v15;
            v111[2] = v15;
            if (a2)
              v17 = MEMORY[0x24BDBD1C0];
            else
              v17 = MEMORY[0x24BDBD1C8];
            v112[2] = v17;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v18 = (id *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
            *(_QWORD *)&buf[24] = getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
            if (!getkMAOptionsBAAAccessControlsSymbolLoc_ptr)
            {
              v19 = (void *)DeviceIdentityLibrary();
              v18 = (id *)dlsym(v19, "kMAOptionsBAAAccessControls");
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v18;
              getkMAOptionsBAAAccessControlsSymbolLoc_ptr = (uint64_t)v18;
            }
            _Block_object_dispose(buf, 8);
            if (v18)
            {
              v69 = *v18;
              v111[3] = v69;
              v112[3] = v6;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v20 = (id *)getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr;
              *(_QWORD *)&buf[24] = getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr;
              if (!getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr)
              {
                v21 = (void *)DeviceIdentityLibrary();
                v20 = (id *)dlsym(v21, "kMAOptionsBAASkipNetworkRequest");
                *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
                getkMAOptionsBAASkipNetworkRequestSymbolLoc_ptr = (uint64_t)v20;
              }
              _Block_object_dispose(buf, 8);
              if (v20)
              {
                v68 = *v20;
                v111[4] = v68;
                v112[4] = v17;
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x2020000000;
                v22 = (id *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
                *(_QWORD *)&buf[24] = getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
                if (!getkMAOptionsBAASCRTAttestationSymbolLoc_ptr)
                {
                  v23 = (void *)DeviceIdentityLibrary();
                  v22 = (id *)dlsym(v23, "kMAOptionsBAASCRTAttestation");
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
                  getkMAOptionsBAASCRTAttestationSymbolLoc_ptr = (uint64_t)v22;
                }
                _Block_object_dispose(buf, 8);
                if (v22)
                {
                  v67 = *v22;
                  v111[5] = v67;
                  v112[5] = v16;
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x2020000000;
                  v24 = (id *)getkMAOptionsBAAValiditySymbolLoc_ptr;
                  *(_QWORD *)&buf[24] = getkMAOptionsBAAValiditySymbolLoc_ptr;
                  if (!getkMAOptionsBAAValiditySymbolLoc_ptr)
                  {
                    v25 = (void *)DeviceIdentityLibrary();
                    v24 = (id *)dlsym(v25, "kMAOptionsBAAValidity");
                    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v24;
                    getkMAOptionsBAAValiditySymbolLoc_ptr = (uint64_t)v24;
                  }
                  _Block_object_dispose(buf, 8);
                  if (v24)
                  {
                    v26 = *v24;
                    v111[6] = v26;
                    v112[6] = &unk_24CE39F88;
                    *(_QWORD *)buf = 0;
                    *(_QWORD *)&buf[8] = buf;
                    *(_QWORD *)&buf[16] = 0x2020000000;
                    v27 = (id *)getkMAOptionsBAACertTypeSymbolLoc_ptr;
                    *(_QWORD *)&buf[24] = getkMAOptionsBAACertTypeSymbolLoc_ptr;
                    if (!getkMAOptionsBAACertTypeSymbolLoc_ptr)
                    {
                      v28 = (void *)DeviceIdentityLibrary();
                      v27 = (id *)dlsym(v28, "kMAOptionsBAACertType");
                      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
                      getkMAOptionsBAACertTypeSymbolLoc_ptr = (uint64_t)v27;
                    }
                    _Block_object_dispose(buf, 8);
                    if (v27)
                    {
                      v29 = *v27;
                      v111[7] = v29;
                      v30 = (void *)MEMORY[0x24BDD16E0];
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = buf;
                      *(_QWORD *)&buf[16] = 0x2020000000;
                      v31 = (unsigned int *)getkMAOptionsBAACertTypeMFiSymbolLoc_ptr;
                      *(_QWORD *)&buf[24] = getkMAOptionsBAACertTypeMFiSymbolLoc_ptr;
                      if (!getkMAOptionsBAACertTypeMFiSymbolLoc_ptr)
                      {
                        v32 = (void *)DeviceIdentityLibrary();
                        v31 = (unsigned int *)dlsym(v32, "kMAOptionsBAACertTypeMFi");
                        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v31;
                        getkMAOptionsBAACertTypeMFiSymbolLoc_ptr = (uint64_t)v31;
                      }
                      _Block_object_dispose(buf, 8);
                      if (v31)
                      {
                        objc_msgSend(v30, "numberWithUnsignedInt:", *v31);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v112[7] = v33;
                        *(_QWORD *)buf = 0;
                        *(_QWORD *)&buf[8] = buf;
                        *(_QWORD *)&buf[16] = 0x2020000000;
                        v34 = (id *)getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr;
                        *(_QWORD *)&buf[24] = getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr;
                        if (!getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr)
                        {
                          v35 = (void *)DeviceIdentityLibrary();
                          v34 = (id *)dlsym(v35, "kMAOptionsBAAMFiProperties");
                          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v34;
                          getkMAOptionsBAAMFiPropertiesSymbolLoc_ptr = (uint64_t)v34;
                        }
                        _Block_object_dispose(buf, 8);
                        if (v34)
                        {
                          v36 = *v34;
                          v111[8] = v36;
                          v112[8] = v79;
                          *(_QWORD *)buf = 0;
                          *(_QWORD *)&buf[8] = buf;
                          *(_QWORD *)&buf[16] = 0x2020000000;
                          v37 = (id *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
                          *(_QWORD *)&buf[24] = getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
                          if (!getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr)
                          {
                            v38 = (void *)DeviceIdentityLibrary();
                            v37 = (id *)dlsym(v38, "kMAOptionsBAAOIDSToInclude");
                            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v37;
                            getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr = (uint64_t)v37;
                          }
                          _Block_object_dispose(buf, 8);
                          if (v37)
                          {
                            v39 = *v37;
                            v111[9] = v39;
                            *(_QWORD *)buf = 0;
                            *(_QWORD *)&buf[8] = buf;
                            *(_QWORD *)&buf[16] = 0x2020000000;
                            v40 = (id *)getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr;
                            *(_QWORD *)&buf[24] = getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr;
                            if (!getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr)
                            {
                              v41 = (void *)DeviceIdentityLibrary();
                              v40 = (id *)dlsym(v41, "kMAOptionsBAAOIDMFiAccessoryProperties");
                              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v40;
                              getkMAOptionsBAAOIDMFiAccessoryPropertiesSymbolLoc_ptr = (uint64_t)v40;
                            }
                            _Block_object_dispose(buf, 8);
                            if (v40)
                            {
                              v42 = *v40;
                              v110 = v42;
                              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v110, 1);
                              v43 = (void *)objc_claimAutoreleasedReturnValue();
                              v112[9] = v43;
                              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 10);
                              v44 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v73, "dictionaryWithDictionary:", v44);
                              v45 = (void *)objc_claimAutoreleasedReturnValue();

                              CFRelease(v6);
                              if (!a2)
                              {
LABEL_50:
                                CFRetain(a1);
                                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                                v49 = (void *)objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 136315650;
                                  *(_QWORD *)&buf[4] = "MFAADeviceIdentityRequestCertificate";
                                  *(_WORD *)&buf[12] = 2112;
                                  *(_QWORD *)&buf[14] = a1;
                                  *(_WORD *)&buf[22] = 2112;
                                  *(_QWORD *)&buf[24] = v45;
                                  _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %@, options %@\n\n", buf, 0x20u);
                                }
                                v80[0] = MEMORY[0x24BDAC760];
                                v80[1] = 3221225472;
                                v80[2] = __MFAADeviceIdentityRequestCertificate_block_invoke;
                                v80[3] = &unk_24CE350E0;
                                v83 = &v98;
                                v84 = &v94;
                                v85 = &v104;
                                v50 = v49;
                                v88 = a2;
                                v81 = v50;
                                v86 = &v90;
                                v87 = a1;
                                v51 = v78;
                                v82 = v51;
                                v52 = v45;
                                v53 = v80;
                                v54 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc();
                                if (v54)
                                {
                                  ((void (*)(_QWORD, id, _QWORD *))v54)(0, v52, v53);

                                  dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
                                  if (*((_BYTE *)v91 + 24))
                                  {
                                    if (v99[5])
                                    {
                                      v55 = MEMORY[0x24BDACB70];
                                      v56 = MEMORY[0x24BDACB70];
                                      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                                      {
                                        objc_msgSend((id)v99[5], "description");
                                        v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                        MFAADeviceIdentityRequestCertificate_cold_4(objc_msgSend(v57, "UTF8String"), buf, v57);
                                      }

                                    }
                                    if (a3)
                                      *a3 = (id)v105[5];
                                    v58 = 0;
                                    if (a4)
                                      *a4 = v95[3];
                                  }
                                  else
                                  {
                                    v62 = MEMORY[0x24BDACB70];
                                    v63 = MEMORY[0x24BDACB70];
                                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                                    {
                                      objc_msgSend((id)v99[5], "description");
                                      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                      MFAADeviceIdentityRequestCertificate_cold_3(objc_msgSend(v64, "UTF8String"), buf, v64);
                                    }

                                    v65 = (const void *)v95[3];
                                    if (v65)
                                    {
                                      CFRelease(v65);
                                      v95[3] = 0;
                                    }
                                    v58 = 1;
                                  }

                                  goto LABEL_87;
                                }
                                dlerror();
                                abort_report_np();
LABEL_90:
                                __break(1u);
                              }
                              *(_QWORD *)buf = 0;
                              *(_QWORD *)&buf[8] = buf;
                              *(_QWORD *)&buf[16] = 0x2020000000;
                              v46 = (id *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
                              *(_QWORD *)&buf[24] = getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
                              if (!getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr)
                              {
                                v47 = (void *)DeviceIdentityLibrary();
                                v46 = (id *)dlsym(v47, "kMAOptionsBAAIgnoreExistingKeychainItems");
                                *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v46;
                                getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr = (uint64_t)v46;
                              }
                              _Block_object_dispose(buf, 8);
                              if (v46)
                              {
                                v48 = *v46;
                                objc_msgSend(v45, "setValue:forKey:", MEMORY[0x24BDBD1C8], v48);

                                goto LABEL_50;
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
      dlerror();
      abort_report_np();
      goto LABEL_90;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAADeviceIdentityRequestCertificate_cold_5(v7, (uint64_t *)&v89);
    if (v89)
      CFRelease(v89);
    v52 = 0;
    v58 = 14;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MFAADeviceIdentityRequestCertificate_cold_2((uint64_t *)&v89, v60, v61);
    if (v89)
      CFRelease(v89);
    v52 = 0;
    v58 = 12;
  }
LABEL_87:
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  return v58;
}

void sub_21284CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void *getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
  v6 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
  if (!getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr)
  {
    v1 = (void *)DeviceIdentityLibrary();
    v0 = dlsym(v1, "DeviceIdentityIssueClientCertificateWithCompletion");
    v4[3] = (uint64_t)v0;
    getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21284D34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t DeviceIdentityLibrary()
{
  uint64_t v0;
  void *v2;

  if (!DeviceIdentityLibraryCore_frameworkLibrary)
    DeviceIdentityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = DeviceIdentityLibraryCore_frameworkLibrary;
  if (!DeviceIdentityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t createCertificateRefWithData(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v13 = 134218240;
    v14 = objc_msgSend(v3, "length");
    v15 = 1024;
    v16 = a2;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "_createCertificateRefWithData (certData.length: %lu, optimize: %{coreacc:CertificateType_t}d)", (uint8_t *)&v13, 0x12u);
  }
  if (!v3)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  if (a2 != 2)
  {
    v9 = objc_retainAutorelease(v3);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = SecCertificateCreateWithBytes();
    if (v10)
    {
      v7 = v10;
      v8 = 1;
      goto LABEL_16;
    }
    v11 = (void *)SecCMSCertificatesOnlyMessageCopyCertificates();
    v5 = v11;
    if (!v11 || !objc_msgSend(v11, "count"))
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v4 = (void *)SecCMSCertificatesOnlyMessageCopyCertificates();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
LABEL_13:
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 2;
    goto LABEL_15;
  }
  v6 = objc_retainAutorelease(v3);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v7 = SecCertificateCreateWithBytes();
  v8 = v7 != 0;
LABEL_15:

LABEL_16:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v13 = 67109120;
    LODWORD(v14) = v8;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "certType: %{coreacc:CertificateType_t}d", (uint8_t *)&v13, 8u);
  }

  return v7;
}

uint64_t createCertificateRefWithBytes(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  uint64_t CertificateRefWithData;

  if (!a1 || !a2)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CertificateRefWithData = createCertificateRefWithData(v4, a3);

  return CertificateRefWithData;
}

char *MFAACreateSignatureContext(int a1)
{
  char *v2;
  char *v3;

  v2 = (char *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)v2 = a1;
    CC_SHA1_Init((CC_SHA1_CTX *)(v2 + 4));
  }
  return v3;
}

BOOL MFAAUpdateDataSignature(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unint64_t Length;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(theData);
    if (HIDWORD(Length) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = Length;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Losing integer precision on dataSignLen 0x%08lX\n", (uint8_t *)&v15, 0xCu);
    }
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 4), BytePtr, Length);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      MFAAUpdateDataSignature_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return a1 != 0;
}

uint64_t MFAAFinalizeDataSignature(int *a1, void **a2, size_t *a3)
{
  uint64_t ConnectionToAuthDaemon;
  int v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *v10;
  const void *data;
  void *v12;
  size_t v13;
  malloc_type_id_t v14;
  xpc_object_t v15;
  size_t v16;
  NSObject *v17;
  uint8_t v19[8];
  size_t length;

  ConnectionToAuthDaemon = 0;
  if (a1 && a2 && a3)
  {
    v7 = *a1;
    if (*a1 == 1)
    {
      ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
      if (ConnectionToAuthDaemon)
      {
        v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v8, "requestType", "finalTagging");
        xpc_dictionary_set_data(v8, "signingContext", a1 + 1, 0x60uLL);
        v15 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v8);
        if (v15)
        {
          v10 = v15;
          length = 0;
          if (xpc_dictionary_get_BOOL(v15, "isValid"))
          {
            data = xpc_dictionary_get_data(v10, "signedTagData", &length);
            v12 = *a2;
            if (!*a2)
            {
              v13 = length;
              v14 = 3864207848;
LABEL_28:
              v12 = malloc_type_malloc(v13, v14);
              *a2 = v12;
              v16 = length;
              *a3 = length;
              if (v12)
              {
LABEL_29:
                memcpy(v12, data, v16);
                *a3 = length;
                ConnectionToAuthDaemon = 1;
                goto LABEL_30;
              }
LABEL_26:
              ConnectionToAuthDaemon = 0;
LABEL_30:
              xpc_release(v10);
              goto LABEL_31;
            }
LABEL_15:
            v16 = length;
            if (*a3 >= length)
              goto LABEL_29;
            goto LABEL_26;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            goto LABEL_26;
          *(_WORD *)v19 = 0;
          v17 = MEMORY[0x24BDACB70];
LABEL_25:
          _os_log_impl(&dword_212836000, v17, OS_LOG_TYPE_INFO, "isValid from authd is false!", v19, 2u);
          goto LABEL_26;
        }
LABEL_20:
        ConnectionToAuthDaemon = 0;
LABEL_31:
        xpc_release(v8);
      }
    }
    else if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        MFAAFinalizeDataSignature_cold_1(v7);
      return 0;
    }
    else
    {
      ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
      if (ConnectionToAuthDaemon)
      {
        v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v8, "requestType", "finalSports");
        xpc_dictionary_set_data(v8, "signingContext", a1 + 1, 0x60uLL);
        v9 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v8);
        if (v9)
        {
          v10 = v9;
          length = 0;
          if (xpc_dictionary_get_BOOL(v9, "isValid"))
          {
            data = xpc_dictionary_get_data(v10, "signedSportsData", &length);
            v12 = *a2;
            if (!*a2)
            {
              v13 = length;
              v14 = 1734000561;
              goto LABEL_28;
            }
            goto LABEL_15;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            goto LABEL_26;
          *(_WORD *)v19 = 0;
          v17 = MEMORY[0x24BDACB70];
          goto LABEL_25;
        }
        goto LABEL_20;
      }
    }
  }
  return ConnectionToAuthDaemon;
}

void MFAADeallocSignatureContext(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t GetConnectionToAuthDaemon()
{
  _xpc_connection_s *mach_service;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!gAuthdXPCConnection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.authd.xpc", 0, 0);
    gAuthdXPCConnection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_2);
      xpc_connection_resume((xpc_connection_t)gAuthdXPCConnection);
    }
    else
    {
      v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v1)
        GetConnectionToAuthDaemon_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  return gAuthdXPCConnection;
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t MFAADeviceIdentityInitCertStates()
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (__initMFAADeviceIdentity_onceToken != -1)
    dispatch_once(&__initMFAADeviceIdentity_onceToken, &__block_literal_global_4);
  if ((MFAADeviceIdentityCertsExist() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v1 = 136315138;
      v2 = "MFAADeviceIdentityInitCertStates";
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: no valid certs, schedule refresh", (uint8_t *)&v1, 0xCu);
    }
    _scheduleRefreshCertificates((uint64_t)CFSTR("mfi-baa"));
  }
  return 0;
}

uint64_t MFAADeviceIdentityCertsExist()
{
  uint64_t v0;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = (gCertificateRefreshState != 0) & ~acc_userDefaults_BOOLForKey((uint64_t)CFSTR("PretendNoDeviceIdentityCerts"));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "MFAADeviceIdentityCertsExist";
    v4 = 1024;
    v5 = v0;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: deviceIdentityCertsExist %d", (uint8_t *)&v2, 0x12u);
  }
  return v0;
}

void _scheduleRefreshCertificates(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  int v7;

  v2 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = 10000000000;
  do
  {
    v5 = dispatch_time(0, v4);
    v6[0] = v3;
    v6[1] = 0x40000000;
    v6[2] = ___scheduleRefreshCertificates_block_invoke;
    v6[3] = &__block_descriptor_tmp_9;
    v7 = v2;
    v6[4] = a1;
    dispatch_after(v5, (dispatch_queue_t)gSerialQueue, v6);
    v4 += 10000000000;
    ++v2;
  }
  while (v2 != 4);
}

CFDataRef MFAACreateDeviceDataCertificate(unsigned int a1)
{
  __SecCertificate *v1;
  __SecCertificate *v2;
  CFDataRef v3;

  if (a1 > 2)
    return 0;
  lLcAnSGNpbJv(*MEMORY[0x24BDBD240], 318767107 - a1);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = SecCertificateCopyData(v1);
  CFRelease(v2);
  return v3;
}

CFDataRef MFAACreateDeviceNonceSignature(const __CFData *a1)
{
  uint64_t v2;
  __SecKey *v3;
  const uint8_t *BytePtr;
  size_t Length;
  uint64_t v6;
  OSStatus v7;
  size_t v8;
  BOOL v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFDataRef v33;
  size_t sigLen;
  uint8_t sig[16];
  __int128 v37;
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
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = fukQllQ9ln(*MEMORY[0x24BDBD240], 318767105);
    if (v2)
    {
      v3 = (__SecKey *)v2;
      BytePtr = CFDataGetBytePtr(a1);
      Length = CFDataGetLength(a1);
      v6 = Length;
      if (BytePtr && Length)
      {
        sigLen = 256;
        *(_OWORD *)sig = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v7 = SecKeyRawSign(v3, 0x8002u, BytePtr, Length, sig, &sigLen);
        v8 = sigLen;
        if (v7)
          v9 = 1;
        else
          v9 = sigLen == 0;
        if (!v9)
        {
          v33 = CFDataCreate(0, sig, sigLen);
LABEL_20:
          CFRelease(v3);
          return v33;
        }
        v10 = v7;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          MFAACreateDeviceNonceSignature_cold_3(v10, v8);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        MFAACreateDeviceNonceSignature_cold_4((uint64_t)BytePtr, v6, v27, v28, v29, v30, v31, v32);
      }
      v33 = 0;
      goto LABEL_20;
    }
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      MFAACreateDeviceNonceSignature_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      MFAACreateDeviceNonceSignature_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  return 0;
}

uint64_t MFAADeviceIdentityCopyCertificate(const __CFString *a1, uint64_t a2, int a3, CFTypeRef *a4, CFTypeRef *a5)
{
  const __CFString *v9;
  _BOOL4 v10;
  uint64_t *v11;
  int v12;
  uint64_t v13;
  _QWORD v15[10];
  _QWORD v16[3];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  v17 = 1;
  if (!a1 || (v9 = a1, !CFEqual(a1, CFSTR("mfi-baa"))))
    v9 = CFSTR("mfi-baa");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "MFAADeviceIdentityCopyCertificate";
    v24 = 2112;
    v25 = v9;
    v26 = 1024;
    v27 = a3;
    v28 = 2112;
    v29 = a2;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: label %@, requestNew %d, refreshPolicy %@\n", buf, 0x26u);
  }
  if (a2 && a5 && a4)
  {
    if (__initMFAADeviceIdentity_onceToken != -1)
      dispatch_once(&__initMFAADeviceIdentity_onceToken, &__block_literal_global_4);
    *a4 = 0;
    *a5 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = __MFAADeviceIdentityCopyCertificate_block_invoke;
    v15[3] = &unk_24CE356F8;
    v15[6] = a2;
    v15[7] = v9;
    v15[4] = v16;
    v15[5] = &v18;
    v15[8] = a4;
    v15[9] = a5;
    dispatch_sync((dispatch_queue_t)gSerialQueue, v15);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "MFAADeviceIdentityCopyCertificate";
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: _scheduleRefreshCertificates %@", buf, 0x16u);
    }
    _scheduleRefreshCertificates((uint64_t)v9);
  }
  if (a4 && a5 && !*((_BYTE *)v19 + 24))
  {
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    if (*a5)
    {
      CFRelease(*a5);
      *a5 = 0;
    }
  }
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  v11 = v19;
  if (v10)
  {
    v12 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315394;
    v23 = "MFAADeviceIdentityCopyCertificate";
    v24 = 1024;
    LODWORD(v25) = v12;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: success:%d\n", buf, 0x12u);
    v11 = v19;
  }
  v13 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v13;
}

BOOL _storeRefreshStateToDisk()
{
  const __CFAllocator *v0;
  __CFArray *Mutable;
  CFIndex i;
  CFNumberRef v3;
  CFNumberRef v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeRefreshStateToDisk\n", v14, 2u);
  }
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    for (i = 0; i != 4; ++i)
    {
      v3 = CFNumberCreate(v0, kCFNumberSInt8Type, (char *)&gCertificateRefreshState + i);
      if (v3)
      {
        v4 = v3;
        CFArraySetValueAtIndex(Mutable, i, v3);
        CFRelease(v4);
      }
    }
    acc_userDefaults_setArrayForKey((uint64_t)CFSTR("IdentityCertRefreshState"), (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      _storeRefreshStateToDisk_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return Mutable != 0;
}

uint64_t _fetchAllCertificates(const __CFString *a1)
{
  uint64_t v2;
  char v3;
  NSObject *v4;
  int v5;
  int v6;
  CFTypeRef v8;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BYTE v13[14];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "_fetchAllCertificates";
    v12 = 2112;
    *(_QWORD *)v13 = a1;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %@, ENTER", buf, 0x16u);
  }
  v2 = 0;
  v3 = 0;
  v4 = MEMORY[0x24BDACB70];
  do
  {
    v8 = 0;
    cf = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "_fetchAllCertificates";
      v12 = 1024;
      *(_DWORD *)v13 = v2;
      *(_WORD *)&v13[4] = 2112;
      *(_QWORD *)&v13[6] = a1;
      _os_log_impl(&dword_212836000, v4, OS_LOG_TYPE_DEFAULT, "%s: i %d, call _copyCertificateForIndex %@", buf, 0x1Cu);
    }
    v5 = _copyCertificateForIndex(a1, v2, 1, 0, &cf, &v8);
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "_fetchAllCertificates";
        v12 = 1024;
        *(_DWORD *)v13 = v6;
        _os_log_error_impl(&dword_212836000, v4, OS_LOG_TYPE_ERROR, "%s: _copyCertificateForIndex: error %d\n", buf, 0x12u);
      }
      *((_BYTE *)&gCertificateRefreshState + v2) = 0;
      v3 = 1;
    }
    else if (!*((_BYTE *)&gCertificateRefreshState + v2))
    {
      v3 = 1;
      *((_BYTE *)&gCertificateRefreshState + v2) = 1;
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (v8)
      CFRelease(v8);
    ++v2;
  }
  while (v2 != 4);
  if ((v3 & 1) != 0)
    _storeRefreshStateToDisk();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "_fetchAllCertificates";
    v12 = 1024;
    *(_DWORD *)v13 = 586;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = a1;
    v14 = 1024;
    v15 = 1;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d %@, EXIT success %d", buf, 0x22u);
  }
  return 1;
}

uint64_t _findValidIndex()
{
  uint64_t v0;
  CFTypeID v1;
  const __CFNumber *Value;
  const __CFNumber *v3;
  CFTypeID v4;
  unsigned int v5;
  const __CFAllocator *v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  CFAbsoluteTime v10;
  CFAbsoluteTime Current;
  const __CFDate *v12;
  const __CFDate *v13;
  double TimeIntervalSinceDate;
  uint64_t v15;
  int v16;
  NSObject *v17;
  int v18;
  CFAbsoluteTime v19;
  CFAbsoluteTime v20;
  const __CFDate *v21;
  const __CFDate *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  double valuePtr;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v0 = gCertificateIndex;
  valuePtr = NAN;
  if (gCertificateRefreshPolicy)
  {
    v1 = CFGetTypeID((CFTypeRef)gCertificateRefreshPolicy);
    if (v1 == CFDictionaryGetTypeID())
    {
      Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)gCertificateRefreshPolicy, CFSTR("RefreshInterval"));
      if (Value)
      {
        v3 = Value;
        v4 = CFGetTypeID(Value);
        if (v4 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v3, kCFNumberDoubleType, &valuePtr);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v30 = 669;
            v31 = 1024;
            v32 = gCertificateIndex;
            _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: start index: %d\n", buf, 0xEu);
          }
          v5 = 0;
          v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v7 = 1;
          v8 = MEMORY[0x24BDACB70];
          while (1)
          {
            if ((int)(v5 + gCertificateIndex) <= 0)
              v0 = -(-(v5 + gCertificateIndex) & 3);
            else
              v0 = (v5 + gCertificateIndex) & 3;
            v9 = *((unsigned __int8 *)&gCertificateRefreshState + (int)v0);
            if (v9 == 2)
            {
              v10 = *(double *)&gCertificateUseTimestamp[(int)v0];
              Current = CFAbsoluteTimeGetCurrent();
              v12 = CFDateCreate(v6, Current);
              v13 = CFDateCreate(v6, v10);
              TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v12, v13);
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109888;
                v30 = 687;
                v31 = 1024;
                v32 = v0;
                v33 = 2048;
                v34 = TimeIntervalSinceDate;
                v35 = 2048;
                v36 = valuePtr;
                _os_log_impl(&dword_212836000, v8, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: elapsed: %f <? %f\n", buf, 0x22u);
              }
              if (TimeIntervalSinceDate < valuePtr)
              {
                if ((int)(gCertificateIndex + v5) <= 0)
                  v0 = -(-(gCertificateIndex + v5) & 3);
                else
                  v0 = (gCertificateIndex + v5) & 3;
LABEL_25:
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  v30 = 706;
                  v31 = 1024;
                  v32 = v0;
                  _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d\n", buf, 0xEu);
                }
                v15 = 0;
                while (*((_BYTE *)&gCertificateRefreshState + v15) != 4)
                {
                  if (++v15 == 4)
                  {
                    if (v7)
                      goto LABEL_52;
                    goto LABEL_33;
                  }
                }
                *((_BYTE *)&gCertificateRefreshState + v15) = 3;
                if (v7)
                  goto LABEL_52;
LABEL_33:
                v16 = 0;
                v17 = MEMORY[0x24BDACB70];
                while (1)
                {
                  if (v16 + gCertificateIndex <= 0)
                    v18 = -(-(v16 + gCertificateIndex) & 3);
                  else
                    v18 = (v16 + gCertificateIndex) & 3;
                  if (*((_BYTE *)&gCertificateRefreshState + v18) == 4)
                  {
                    v19 = *(double *)&gCertificateUseTimestamp[v18];
                    v20 = CFAbsoluteTimeGetCurrent();
                    v21 = CFDateCreate(v6, v20);
                    v22 = CFDateCreate(v6, v19);
                    v23 = CFDateGetTimeIntervalSinceDate(v21, v22);
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109888;
                      v30 = 743;
                      v31 = 1024;
                      v32 = v18;
                      v33 = 2048;
                      v34 = v23;
                      v35 = 2048;
                      v36 = valuePtr;
                      _os_log_impl(&dword_212836000, v17, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: elapsed: %f <? %f\n", buf, 0x22u);
                    }
                    if (v23 < valuePtr)
                    {
LABEL_46:
                      if (gCertificateIndex + v16 <= 0)
                        v0 = -(-(gCertificateIndex + v16) & 3);
                      else
                        v0 = (gCertificateIndex + v16) & 3;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109376;
                        v30 = 757;
                        v31 = 1024;
                        v32 = v0;
                        v24 = MEMORY[0x24BDACB70];
                        v25 = "MFAADeviceIdentity: _findValidIndex:%d: %d\n";
                        v26 = 14;
                        goto LABEL_51;
                      }
                      goto LABEL_52;
                    }
                    *((_BYTE *)&gCertificateRefreshState + v18) = 3;
                  }
                  else
                  {
                    if (*((_BYTE *)&gCertificateRefreshState + v18))
                      goto LABEL_46;
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      v30 = 730;
                      v31 = 1024;
                      v32 = v18;
                      _os_log_impl(&dword_212836000, v17, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: skip invalid cert\n", buf, 0xEu);
                    }
                  }
                  if (++v16 == 4)
                    goto LABEL_46;
                }
              }
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                v30 = 695;
                v31 = 1024;
                v32 = v0;
                _os_log_impl(&dword_212836000, v8, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex:%d: %d: expired\n", buf, 0xEu);
              }
              *((_BYTE *)&gCertificateRefreshState + (int)v0) = 3;
            }
            else if (v9 == 1)
            {
              gCertificateUseTimestamp[(int)v0] = 0;
              goto LABEL_25;
            }
            v7 = v5++ < 3;
            if (v5 == 4)
              goto LABEL_33;
          }
        }
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x24BDACB70];
    v25 = "MFAADeviceIdentity: _findValidIndex: error\n";
    v26 = 2;
LABEL_51:
    _os_log_impl(&dword_212836000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
  }
LABEL_52:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = v0;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _findValidIndex: %d\n", buf, 8u);
  }
  return v0;
}

uint64_t _copyCertificateForIndex(const __CFString *a1, int a2, int a3, int a4, CFTypeRef *a5, CFTypeRef *a6)
{
  const __CFAllocator *v12;
  CFIndex Length;
  __CFString *MutableCopy;
  __CFString *v15;
  _BOOL4 v16;
  CFTypeRef *v17;
  CFTypeRef v18;
  CFTypeRef *v19;
  uint64_t v20;
  const __CFString *v21;
  CFTypeRef *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BYTE v29[10];
  _BYTE v30[10];
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Length = CFStringGetLength(a1);
  MutableCopy = CFStringCreateMutableCopy(v12, Length + 1, a1);
  v15 = MutableCopy;
  if (MutableCopy)
  {
    v23 = a6;
    CFStringAppendFormat(MutableCopy, 0, CFSTR("%d"), (a2 + 1));
    if (*((_BYTE *)&gCertificateRefreshState + a2))
    {
      if (gCertificateDeviceIdentityCerts[a2])
        v16 = gCertificateDeviceIdentityKeyRefs[a2] == 0;
      else
        v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "_copyCertificateForIndex";
      v26 = 1024;
      v27 = 480;
      v28 = 2112;
      *(_QWORD *)v29 = v15;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)v30 = a3;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = a4;
      v31 = 1024;
      v32 = v16;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d %@, requestInit %d, requestNew %d, needInitCertKeyCache %d\n", buf, 0x2Eu);
    }
    v17 = (CFTypeRef *)&gCertificateDeviceIdentityCerts[a2];
    v18 = *v17;
    if ((a3 | a4 | v16) != 1)
    {
      if (!v18 || !gCertificateDeviceIdentityKeyRefs[a2])
        goto LABEL_25;
      goto LABEL_19;
    }
    if (v18)
    {
      CFRelease(v18);
      *v17 = 0;
    }
    v19 = &gCertificateDeviceIdentityKeyRefs[a2];
    if (*v19)
    {
      CFRelease(*v19);
      *v19 = 0;
    }
    v20 = MFAADeviceIdentityRequestCertificate(v15, a4, v17, &gCertificateDeviceIdentityKeyRefs[a2]);
    if (!(_DWORD)v20)
    {
      if (!*((_BYTE *)&gCertificateRefreshState + a2))
      {
        *((_BYTE *)&gCertificateRefreshState + a2) = 1;
        _storeRefreshStateToDisk();
      }
LABEL_19:
      if (*v17 && gCertificateDeviceIdentityKeyRefs[a2])
      {
        if (a5)
          *a5 = CFRetain(*v17);
        v20 = 0;
        if (v23)
          *v23 = CFRetain(gCertificateDeviceIdentityKeyRefs[a2]);
        goto LABEL_26;
      }
LABEL_25:
      v20 = 96;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _copyCertificateForIndex_cold_1();
    v20 = 0xFFFFFFFFLL;
  }
LABEL_26:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v21 = v15;
    else
      v21 = a1;
    *(_DWORD *)buf = 136316418;
    v25 = "_copyCertificateForIndex";
    v26 = 1024;
    v27 = 531;
    v28 = 1024;
    *(_DWORD *)v29 = a2;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = a4;
    *(_WORD *)v30 = 2112;
    *(_QWORD *)&v30[2] = v21;
    v31 = 1024;
    v32 = v20;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d index %d, requestNew %d, %@, error %d\n", buf, 0x2Eu);
  }
  if (v15)
    CFRelease(v15);
  return v20;
}

uint64_t MFAADeviceIdentityCreateSignature(const __CFString *cf1, uint64_t a2, uint64_t a3)
{
  const __CFString *v5;
  uint64_t v6;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  if (a3)
  {
    v5 = cf1;
    if (!cf1 || !CFEqual(cf1, CFSTR("mfi-baa")))
      v5 = CFSTR("mfi-baa");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = __MFAADeviceIdentityCreateSignature_block_invoke;
    v16[3] = &unk_24CE35720;
    v16[4] = &v17;
    v16[5] = a2;
    v16[6] = a3;
    v16[7] = v5;
    dispatch_sync((dispatch_queue_t)gSerialQueue, v16);
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      MFAADeviceIdentityCreateSignature_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v6 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v6;
}

uint64_t _storeStateToDisk(uint64_t a1, int a2)
{
  _storeIndexToDisk(a1, a2);
  _storeUseTimeToDisk();
  _storeRefreshStateToDisk();
  _storeIsClassDToDisk();
  return 1;
}

void ___scheduleRefreshCertificates_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  uint64_t v9;
  CFTypeRef v10;
  CFTypeRef cf;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = *(int *)(a1 + 40);
  v2 = *((unsigned __int8 *)&gCertificateRefreshState + v1);
  if (v2 == 3 || v2 == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v13 = 608;
      v14 = 1024;
      v15 = v1;
      _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: refresh: %d\n", buf, 0xEu);
      LODWORD(v1) = *(_DWORD *)(a1 + 40);
    }
    v10 = 0;
    cf = 0;
    v5 = _copyCertificateForIndex(*(const __CFString **)(a1 + 32), v1, 0, 1, &cf, &v10);
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        v7 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        v13 = 628;
        v14 = 1024;
        v15 = v7;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: error refreshing: %d\n", buf, 0xEu);
      }
    }
    else
    {
      if (v6)
      {
        v8 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 67109376;
        v13 = 617;
        v14 = 1024;
        v15 = v8;
        _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _scheduleRefreshCertificates:%d: refreshed: %d\n", buf, 0xEu);
      }
      *((_BYTE *)&gCertificateRefreshState + *(int *)(a1 + 40)) = 1;
      v9 = *(int *)(a1 + 40);
      gCertificateUseTimestamp[v9] = 0;
      gCertificateIsClassD[v9] = 1;
      _storeRefreshStateToDisk();
      _storeUseTimeToDisk();
      _storeIsClassDToDisk();
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (v10)
      CFRelease(v10);
  }
}

BOOL _storeUseTimeToDisk()
{
  const __CFAllocator *v0;
  __CFArray *Mutable;
  CFIndex v2;
  char *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v2 = 0;
    v3 = (char *)&gCertificateUseTimestamp;
    do
    {
      v4 = CFNumberCreate(v0, kCFNumberDoubleType, v3);
      if (v4)
      {
        v5 = v4;
        CFArraySetValueAtIndex(Mutable, v2, v4);
        CFRelease(v5);
      }
      ++v2;
      v3 += 8;
    }
    while (v2 != 4);
    acc_userDefaults_setArrayForKey((uint64_t)CFSTR("IdentityCertUseTime"), (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      _storeUseTimeToDisk_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return Mutable != 0;
}

BOOL _storeIsClassDToDisk()
{
  const __CFAllocator *v0;
  __CFArray *Mutable;
  CFIndex i;
  CFNumberRef v3;
  CFNumberRef v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14[8];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 0;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeIsClassDToDisk\n", (uint8_t *)v14, 2u);
  }
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    for (i = 0; i != 4; ++i)
    {
      v3 = CFNumberCreate(v0, kCFNumberSInt8Type, &gCertificateIsClassD[i]);
      if (v3)
      {
        v4 = v3;
        CFArraySetValueAtIndex(Mutable, i, v3);
        CFRelease(v4);
      }
    }
    acc_userDefaults_setArrayForKey((uint64_t)CFSTR("IdentityCertIsClassD"), (uint64_t)Mutable);
    CFRelease(Mutable);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      _storeIsClassDToDisk_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return Mutable != 0;
}

uint64_t _storeIndexToDisk(uint64_t a1, int a2)
{
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: _storeIndexToDisk: %d\n", (uint8_t *)v4, 8u);
  }
  acc_userDefaults_setIntegerForKey((uint64_t)CFSTR("IdentityCertUseIndex"), a2);
  return 1;
}

uint64_t _readStateFromDisk()
{
  const __CFArray *v0;
  const __CFArray *v1;
  const __CFArray *v2;
  unsigned int v3;
  int v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t k;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  void *values[2];
  __int128 v25;
  uint64_t v26;
  CFRange v27;
  CFRange v28;
  CFRange v29;

  v26 = *MEMORY[0x24BDAC8D0];
  v0 = (const __CFArray *)acc_userDefaults_copyArrayForKey((uint64_t)CFSTR("IdentityCertUseTime"));
  v1 = (const __CFArray *)acc_userDefaults_copyArrayForKey((uint64_t)CFSTR("IdentityCertRefreshState"));
  v2 = (const __CFArray *)acc_userDefaults_copyArrayForKey((uint64_t)CFSTR("IdentityCertIsClassD"));
  v3 = acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("IdentityCertUseIndex"));
  if (v3 <= 3)
    v4 = v3;
  else
    v4 = 0;
  gCertificateIndex = v4;
  if (v0 && CFArrayGetCount(v0) <= 4)
  {
    *(_OWORD *)values = 0u;
    v25 = 0u;
    v27.length = CFArrayGetCount(v0);
    v27.location = 0;
    CFArrayGetValues(v0, v27, (const void **)values);
    for (i = 0; i != 4; ++i)
      CFNumberGetValue((CFNumberRef)values[i], kCFNumberDoubleType, &gCertificateUseTimestamp[i]);
    v6 = 0;
    v7 = MEMORY[0x24BDACB70];
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = gCertificateUseTimestamp[v6];
        *(_DWORD *)buf = 136315650;
        v19 = "_readStateFromDisk";
        v20 = 1024;
        v21 = v6;
        v22 = 2048;
        v23 = v8;
        _os_log_impl(&dword_212836000, v7, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateUseTimestamp[%d]:%f\n", buf, 0x1Cu);
      }
      ++v6;
    }
    while (v6 != 4);
    CFRelease(v0);
  }
  if (v1 && CFArrayGetCount(v1) <= 4)
  {
    *(_OWORD *)values = 0u;
    v25 = 0u;
    v28.length = CFArrayGetCount(v1);
    v28.location = 0;
    CFArrayGetValues(v1, v28, (const void **)values);
    for (j = 0; j != 4; ++j)
      CFNumberGetValue((CFNumberRef)values[j], kCFNumberSInt8Type, (char *)&gCertificateRefreshState + j);
    v10 = 0;
    v11 = MEMORY[0x24BDACB70];
    do
    {
      v12 = *((unsigned __int8 *)&gCertificateRefreshState + v10);
      if (v12 >= 5)
      {
        v12 = 0;
        *((_BYTE *)&gCertificateRefreshState + v10) = 0;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "_readStateFromDisk";
        v20 = 1024;
        v21 = v10;
        v22 = 1024;
        LODWORD(v23) = v12;
        _os_log_impl(&dword_212836000, v11, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateRefreshState[%d]:%d\n", buf, 0x18u);
      }
      ++v10;
    }
    while (v10 != 4);
    CFRelease(v1);
  }
  if (v2 && CFArrayGetCount(v2) <= 4)
  {
    *(_OWORD *)values = 0u;
    v25 = 0u;
    v29.length = CFArrayGetCount(v2);
    v29.location = 0;
    CFArrayGetValues(v2, v29, (const void **)values);
    for (k = 0; k != 4; ++k)
      CFNumberGetValue((CFNumberRef)values[k], kCFNumberSInt8Type, &gCertificateIsClassD[k]);
    v14 = 0;
    v15 = MEMORY[0x24BDACB70];
    do
    {
      if (gCertificateIsClassD[v14])
      {
        v16 = 1;
        gCertificateIsClassD[v14] = 1;
      }
      else
      {
        v16 = 0;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "_readStateFromDisk";
        v20 = 1024;
        v21 = v14;
        v22 = 1024;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_212836000, v15, OS_LOG_TYPE_DEFAULT, "MFAADeviceIdentity: %s: gCertificateIsClassD[%d]:%d\n", buf, 0x18u);
      }
      ++v14;
    }
    while (v14 != 4);
    CFRelease(v2);
  }
  return 1;
}

uint64_t ____initMFAADeviceIdentity_block_invoke()
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "__initMFAADeviceIdentity_block_invoke";
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: do once", (uint8_t *)&v1, 0xCu);
  }
  gSerialQueue = (uint64_t)dispatch_queue_create("MFAADeviceIdentity", 0);
  _readStateFromDisk();
  return _fetchAllCertificates(CFSTR("mfi-baa"));
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 5, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

unint64_t systemInfo_getCurrentUnixTime()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1)
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_5);
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1)
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2_0);
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_7);
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_10);
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("AudioAccessory"));

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  CFTypeID v0;
  uint64_t result;

  if (systemInfo_copyRegionCode_onceToken != -1)
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_15);
  if (systemInfo_copyRegionCode_regionCode)
  {
    v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID())
      return systemInfo_copyRegionCode_regionCode;
  }
  result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  char **__ptr32 *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_212871000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_212836000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_212836000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_212836000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_212871000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 47);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  char **__ptr32 *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_212871000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_212836000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_212836000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_212836000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_212871000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 47);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t mfaa_certificateManager_validateCertificate(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MFAACertificateManager sharedManager](MFAACertificateManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "validateCertificate:realtime:error:", a1, a2, 0);

  return v5;
}

uint64_t mfaa_certificateManager_copyAnchorCertificates(uint64_t a1)
{
  +[MFAACertificateManager anchorCertificatesForTypes:](MFAACertificateManager, "anchorCertificatesForTypes:", a1);
  return objc_claimAutoreleasedReturnValue();
}

_QWORD *sub_21285123C(_QWORD *result)
{
  *result = ++qword_254B5B430;
  return result;
}

void sub_212851258(uint64_t a1)
{
  int v1;
  int v2;
  int v3;

  v1 = *(_DWORD *)a1 ^ (940831517 * (a1 ^ 0xA299CC3C));
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  if (v2 + 2103497250 < 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  else
    v3 = 87972796 - v2;
  if ((v3 + 2103497250) > 0x80000000)
    ++v1;
  __asm { BR              X13 }
}

uint64_t sub_212851370@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  int v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;

  v16 = v15 < v12;
  if (v16 == v13 + 393703043 < v12)
    v16 = v13 + 393703043 < v15;
  *((_DWORD *)&a12 + v13 + a3) = *(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * (v13 + a3));
  return ((uint64_t (*)(void))((char *)&loc_212851384 + *(int *)(a1 + 4 * (v14 + v16 + 25))))();
}

void sub_2128513E0()
{
  JUMPOUT(0x212851384);
}

uint64_t sub_2128513EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  _BOOL4 v8;

  if (a6 + 15597856 < -2087899394 != v6 - 303821947 < -2087899394)
    v8 = a6 + 15597856 < -2087899394;
  else
    v8 = v6 - 303821947 < a6 + 15597856;
  return ((uint64_t (*)())((char *)sub_2128513EC + *(int *)(a4 + 4 * (v8 + v7))))();
}

uint64_t sub_212851460@<X0>(uint64_t a1@<X3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v16 = v14 < v12;
  *(_DWORD *)(a10 + 4 * (v11 + a2)) = v15;
  v17 = v10 + v11 + 1;
  v18 = v16 ^ (v17 < v12);
  v19 = v17 < v14;
  if (!v18)
    v16 = v19;
  return ((uint64_t (*)(void))((char *)sub_212851460 + *(int *)(a1 + 4 * (v16 + v13))))();
}

uint64_t sub_2128514C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;

  if ((a6 + a3) <= 0x80000000)
    v7 = v6;
  else
    v7 = v6 + 1;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)sub_2128514C0 + *(int *)(a4 + 4 * v7)))(a1, a2);
}

uint64_t sub_21285150C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, _DWORD *a17)
{
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  _BOOL4 v22;

  v19 = (*(_DWORD *)(*(_QWORD *)(a12 + 32) + 16) - 2131292695) * (*a17 - 154173337);
  v20 = 704005591 * ((v18 - 128) ^ 0xF7D78CF0);
  *(_DWORD *)(v18 - 112) = (v17 - 21) ^ v20;
  *(_DWORD *)(v18 - 108) = (v19 ^ 0x55FD3FFA) - v20 + ((2 * v19) & 0xABFA7FF4) - 1074081808;
  *(_QWORD *)(v18 - 120) = &a16;
  *(_DWORD *)(v18 - 128) = 43986398 - v20;
  *(_QWORD *)(v18 - 104) = a13;
  v21 = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + v17 - 23) - 15))(v18 - 128);
  v22 = a11 + 1983530591 > 2027516990;
  if (a11 + 1983530591 < -119966659)
    v22 = 1;
  return ((uint64_t (*)(uint64_t))((char *)sub_212851664 + dword_2128C9A00[v22 + 5 + v17]))(v21);
}

uint64_t sub_212851994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  uint64_t (*v15)(uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v23 = 520147679 * ((v22 - 128) ^ 0xD061A127);
  *(_DWORD *)(v22 - 112) = v17 - v23 - 26;
  *(_QWORD *)(v22 - 120) = &a13;
  *(_DWORD *)(v22 - 128) = ((v19 ^ 0xFCF9FFE3) + ((2 * v19) & 0xF9F3FFC6) + 1607390976) ^ v23;
  sub_212853628((_DWORD *)(v22 - 128));
  *(_DWORD *)(v22 - 112) = v17 - 9 - ((v22 - 128) ^ v21) * v20 - 8;
  *(_QWORD *)(v22 - 128) = a12;
  *(_QWORD *)(v22 - 120) = &a15;
  v24 = v15(v22 - 128);
  return ((uint64_t (*)(uint64_t))((char *)&sub_212851BFC
                                          + *(int *)(v18
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v22 - 108) + v16) >> 31) + v17 - 9))))(v24);
}

uint64_t sub_212851C08(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v1 = 1638185881 * (a1 ^ 0x11FD620);
  v2 = *(_DWORD *)(a1 + 12) + v1;
  v3 = *(_DWORD *)(a1 + 16) ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  if (v4 + 2103497250 >= 0)
    v4 = 87972796 - v4;
  if (4 * (unint64_t)(v4 - 43986398) <= (v3 - 1963474407))
    v5 = v2;
  else
    v5 = v2 + 1;
  return ((uint64_t (*)(void))((char *)&loc_212851C74 + dword_2128C9D00[v5]))();
}

uint64_t sub_212851CA4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v4 = v2 - 4 * v3;
  if (v0 == 1963474407)
    v5 = v4 + 1;
  else
    v5 = v4;
  return ((uint64_t (*)())((char *)sub_212851CA4 + *(int *)(v1 + 4 * v5)))();
}

uint64_t sub_212851CDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 8) = v1;
  return result;
}

uint64_t sub_212851CE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))((char *)sub_212851D84
                                                                    + *(int *)(v2 + 4 * (10 * v5 + 4 * v4 + v3 - 7))))(a1, (10 * v5 + 4 * v4 + v3 - 2), 154173337, v1);
}

uint64_t sub_212851D40@<X0>(_QWORD *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  char v7;
  int v8;

  *(_BYTE *)(*a1 + (a4 + a5)) = (a3 - 154173337) >> v7;
  if (a4 - 1 == v6)
    v8 = a2 + 1;
  else
    v8 = a2;
  return ((uint64_t (*)())((char *)sub_212851D40 + *(int *)(v5 + 4 * v8)))();
}

uint64_t sub_212851D84(uint64_t a1, int a2, uint64_t a3, char a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;

  v9 = v7 + 8;
  v10 = a2 - ((4 * a5) | (2 * (a4 & 1)));
  v11 = v10 + 4 * (v9 != 32) + 6 * (v9 == 32);
  if (v9 == 32)
    ++v10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(int *)(v6 + 4 * v10) + v8))(a1, v11, a3, v5);
}

uint64_t sub_212851DC0(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _BOOL4 v6;

  if (v2 + 407558316 < -1695938934 != v5 + 287246936 < -1695938934)
    v6 = v2 + 407558316 < -1695938934;
  else
    v6 = v5 + 287246936 < v2 + 407558316;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))((char *)sub_212851DC0
                                                                    + *(int *)(v4 + 4 * (a2 + v6))))(a1, (v6 & 0xFFFFFFFD | (2 * v6)) - 2 * !v6 + a2, 154173337, v3);
}

uint64_t sub_212851E40@<X0>(_QWORD *a1@<X0>, int a2@<W4>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  int v5;

  return sub_212851D40(a1, a2 - 5, *(_DWORD *)(*(_QWORD *)(v3 + 8) + 4 * (v5 - 164297778)), v4, a3);
}

uint64_t sub_212851E68()
{
  return sub_212854BA8();
}

uint64_t sub_212851E7C(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
  if (v1 + 2103497250 >= 0)
    v1 = 87972796 - v1;
  v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 5;
  if ((v1 + 2103497250) > 0x80000000)
    v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 4;
  return ((uint64_t (*)())((char *)sub_212851F5C + dword_2128C9BD0[v2]))();
}

uint64_t sub_212851F10@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  if (*(_DWORD *)(*(_QWORD *)(v2 + 8) + 4 * (a1 - 43986399)) == 154173337)
    v4 = v3 + 1;
  else
    v4 = v3;
  return ((uint64_t (*)())((char *)sub_212851F10 + *(int *)(v1 + 4 * v4)))();
}

uint64_t sub_212851F5C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  if ((a1 - 1 + v2) > 0x80000000)
    ++v4;
  return ((uint64_t (*)(void))(*(int *)(v1 + 4 * v4) + v3))();
}

_DWORD *sub_212851F9C(_DWORD *result)
{
  *result = 193169492;
  return result;
}

uint64_t sub_212851FAC()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  if (v2 - 154173337 < 0)
    v3 = v1 + 7;
  else
    v3 = v1 + 8;
  return ((uint64_t (*)())((char *)sub_212851FF4 + *(int *)(v0 + 4 * v3)))();
}

_DWORD *sub_21285201C@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  int v2;

  *result = v2 + 32 * a2 - 1214395275;
  return result;
}

void sub_212852034()
{
  uint64_t v0;
  int v1;

  v0 = MEMORY[0x24BDAC7A8]();
  v1 = *(_DWORD *)(v0 + 8) ^ (601157143 * (v0 ^ 0x5103A544));
  if (*(_DWORD *)(*(_QWORD *)(v0 + 32) + 4) == 43986398)
    ++v1;
  __asm { BR              X10 }
}

uint64_t sub_212852158()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v7;

  *(_DWORD *)(v2 + 4) = v0;
  *(_QWORD *)(v5 - 144) = &v7;
  *(_QWORD *)(v5 - 136) = v2;
  *(_DWORD *)(v5 - 128) = v4 - 37 + ((v5 - 144) ^ v3) * v1;
  return sub_212857054(v5 - 144);
}

void sub_21285310C(_DWORD *a1)
{
  unsigned int v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = a1[2] ^ (2145031067 * (a1 ^ 0x1E282685));
  v2 = *(_QWORD *)a1;
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  if (v3 + 2103497250 < 0)
    v4 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  else
    v4 = 87972796 - v3;
  v7 = v1 - 1748787863 * (&v6 ^ 0x81BAC106) - 4;
  v6 = v2;
  sub_212857910((uint64_t)&v6);
  if ((v4 + 2103497250) <= 0x80000000)
    v5 = v1;
  else
    v5 = v1 + 1;
  __asm { BR              X11 }
}

uint64_t sub_212853240@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v4 = v2 + 4 * v1;
  if (v3)
    v5 = v4;
  else
    v5 = v4 + 1;
  return ((uint64_t (*)())((char *)sub_212853240 + *(int *)(a1 + 4 * v5)))();
}

uint64_t sub_212853274@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v7 = v1 + 1;
  *(_DWORD *)(*(_QWORD *)(v2 + 8) + 4 * (v3 + v5 + v4 + 499540002)) = *(_DWORD *)(*(_QWORD *)(v2 + 8)
                                                                                  + 4 * (v3 - 43986399));
  if ((v6 + v3 - 1) > 0x80000000)
    v7 = v1 + 2;
  return ((uint64_t (*)())((char *)sub_2128532E0 + *(int *)(a1 + 4 * v7)))();
}

void sub_2128532E0()
{
  JUMPOUT(0x2128532B4);
}

uint64_t sub_2128532F4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(_QWORD))((char *)sub_2128532F4
                                         + *(int *)(a1 + 4 * (int)(v1 + ((v3 + v2 - 1) >> 31)))))((((v3 + v2 - 1) >> 31) | (8 * ((v3 + v2 - 1) >> 31)))- ((-(v3 + v2) >> 30) & 2)+ v1);
}

void sub_212853628(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 520147679 * (a1 ^ 0xD061A127);
  v2 = a1[4] + v1;
  if ((*a1 ^ v1) + 590817565 > 0x80000000)
    ++v2;
  __asm { BR              X14 }
}

uint64_t sub_2128536D4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v6;
  int v7;
  unsigned int v8;

  v4 = 2145031067 * (&v6 ^ 0x1E282685);
  v7 = (v2 + 3) ^ v4;
  v8 = v1 - v4 - ((v3 + 1181635130) & 0x828CF85A) - 461527734;
  v6 = a1;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_24CE36550 + v2 + 34) - 10))(&v6);
}

void sub_2128537D0(uint64_t a1)
{
  int v1;

  if (*(_QWORD *)(a1 + 24))
    v1 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  else
    v1 = (*(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5))) + 1;
  __asm { BR              X12 }
}

uint64_t sub_2128538A0@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)())((char *)sub_2128538A0
                                   + *(int *)(v3
                                            + 4
                                            * (((*(_DWORD *)(v4 + 40) + a1 == 1378624176) | (*(_QWORD *)(v4 + 32) == 0x5F40CF076E63375DLL) & (*(_QWORD *)(v4 + 8) == 0x78AECEE7BAC7D299))
                                             + v1
                                             + 2 * v2))))();
}

uint64_t sub_212853914()
{
  int v0;
  int v1;
  uint64_t v2;
  _QWORD *v3;

  return ((uint64_t (*)())((char *)sub_212853914
                                   + *(int *)(v2
                                            + 4
                                            * ((v3[6] == 0 || v3[2] == 0 && v3[8] == 0x33B0908EC5FFAF74)
                                             + v0
                                             + 2 * ((v1 ^ 1) - v1)))))();
}

uint64_t sub_212853974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  if (a9 == 0x78AECEE7BAC7D299)
    v12 = v9 - 6 * (v10 ^ 1) - 4 * v10 + 1;
  else
    v12 = v9 - 6 * (v10 ^ 1) - 4 * v10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_212853974 + *(int *)(v11 + 4 * v12)))(a1, a2, a3, a4, a5, a6, a7, a8, a1);
}

uint64_t sub_212853A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char *a18, char *a19, uint64_t a20,char a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26,char a27,uint64_t a28,char a29)
{
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  void (*v39)(uint64_t);
  char *v40;
  int v41;
  void (*v42)(uint64_t);
  int v43;
  void (*v44)(uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  void (*v56)(uint64_t);

  v36 = v30 - 2;
  v37 = 1836812333 * ((v35 - 144) ^ 0x4065F266);
  *(_DWORD *)(v35 - 128) = v37 + v31 + 401354436;
  *(_QWORD *)(v35 - 136) = v29;
  *(_DWORD *)(v35 - 112) = v37 + v30 - 8;
  *(_QWORD *)(v35 - 120) = &a21;
  ((void (*)(uint64_t))(*(_QWORD *)(v32 + 8 * (v30 + 46)) - 7))(v35 - 144);
  a18 = &a29;
  a19 = &a23;
  HIDWORD(v55) = v36 - 8;
  *(_QWORD *)(v35 - 128) = v34;
  *(_QWORD *)(v35 - 144) = &a18;
  v38 = v36 - 8 + 520147679 * ((v35 - 144) ^ 0xD061A127);
  *(_DWORD *)(v35 - 136) = v38;
  v56 = (void (*)(uint64_t))(*(_QWORD *)(v32 + 8 * (v36 + 41)) - 10);
  v56(v35 - 144);
  LODWORD(v55) = (v36 - 3) ^ (940831517 * ((v35 - 144) ^ 0xA299CC3C));
  *(_DWORD *)(v35 - 144) = v55;
  *(_QWORD *)(v35 - 136) = v34;
  *(_QWORD *)(v35 - 128) = &a25;
  *(_QWORD *)(v35 - 120) = &a21;
  *(_QWORD *)(v35 - 112) = &a18;
  v39 = (void (*)(uint64_t))(*(_QWORD *)(v32 + 8 * (v36 + 32)) - 7);
  v39(v35 - 144);
  v40 = a19;
  *(_QWORD *)(v35 - 120) = v34;
  *(_QWORD *)(v35 - 112) = v40;
  *(_QWORD *)(v35 - 136) = &a25;
  *(_QWORD *)(v35 - 128) = &a25;
  v41 = v36 - 704005591 * ((v35 - 144) ^ 0xF7D78CF0);
  *(_DWORD *)(v35 - 104) = v41;
  *(_QWORD *)(v35 - 144) = &a18;
  v42 = (void (*)(uint64_t))(*(_QWORD *)(v32 + 8 * (v36 + 10)) - 3);
  v42(v35 - 144);
  *(_QWORD *)(v35 - 128) = &a25;
  *(_QWORD *)(v35 - 120) = a14;
  *(_QWORD *)(v35 - 144) = v34;
  *(_QWORD *)(v35 - 112) = &a25;
  *(_QWORD *)(v35 - 104) = &a18;
  v43 = (v36 - 9) ^ (601157143 * ((v35 - 144) ^ 0x5103A544));
  *(_DWORD *)(v35 - 136) = v43;
  v44 = (void (*)(uint64_t))(*(_QWORD *)(v32 + 8 * (v36 + 36)) - 11);
  v44(v35 - 144);
  *(_QWORD *)(v35 - 128) = v33;
  *(_DWORD *)(v35 - 136) = v38;
  *(_QWORD *)(v35 - 144) = &a18;
  v56(v35 - 144);
  *(_QWORD *)(v35 - 136) = v33;
  *(_QWORD *)(v35 - 128) = &a27;
  *(_DWORD *)(v35 - 144) = v55;
  *(_QWORD *)(v35 - 120) = &a21;
  *(_QWORD *)(v35 - 112) = &a18;
  v39(v35 - 144);
  v45 = a19;
  *(_QWORD *)(v35 - 144) = &a18;
  *(_QWORD *)(v35 - 136) = &a27;
  *(_DWORD *)(v35 - 104) = v41;
  *(_QWORD *)(v35 - 120) = v33;
  *(_QWORD *)(v35 - 112) = v45;
  *(_QWORD *)(v35 - 128) = &a27;
  v42(v35 - 144);
  *(_QWORD *)(v35 - 128) = &a27;
  *(_QWORD *)(v35 - 120) = a12;
  *(_QWORD *)(v35 - 144) = v33;
  *(_QWORD *)(v35 - 112) = &a27;
  *(_QWORD *)(v35 - 104) = &a18;
  *(_DWORD *)(v35 - 136) = v43;
  v44(v35 - 144);
  *(_QWORD *)(v35 - 136) = &a25;
  *(_QWORD *)(v35 - 128) = &a27;
  *(_DWORD *)(v35 - 144) = (v36 - 5) ^ (56516261 * ((v35 - 144) ^ 0x15EBF17D));
  ((void (*)(uint64_t))((char *)*(&off_24CE36550 + v36 + 26) - 3))(v35 - 144);
  *(_DWORD *)(v35 - 132) = v36 - 8 - 1748787863 * ((v35 - 144) ^ 0x81BAC106);
  *(_QWORD *)(v35 - 144) = &a27;
  sub_212857910(v35 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))((char *)&loc_212853AC0 + dword_2128C9CA0[(*(_DWORD *)(v35 - 136) + 860424136 >= 0) + v36]))(v46, v47, v48, v49, v50, v51, v52, v53, a9, v55, v42);
}

uint64_t sub_212853D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(uint64_t), uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,char a27)
{
  int v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;

  *(_QWORD *)(v31 - 136) = v28;
  *(_QWORD *)(v31 - 128) = v29;
  *(_DWORD *)(v31 - 144) = (v27 + 1) ^ (191237807 * ((v31 - 144) ^ 0xDBC9B6B1));
  v30(v31 - 144);
  v32 = a19;
  v33 = v27 - 704005591 * ((v31 - 144) ^ 0xF7D78CF0) + 7;
  *(_DWORD *)(v31 - 104) = v33;
  *(_QWORD *)(v31 - 120) = v28;
  *(_QWORD *)(v31 - 112) = v32;
  *(_QWORD *)(v31 - 136) = &a27;
  *(_QWORD *)(v31 - 128) = &a27;
  *(_QWORD *)(v31 - 144) = &a18;
  a11(v31 - 144);
  *(_QWORD *)(v31 - 128) = a13;
  *(_QWORD *)(v31 - 120) = v28;
  *(_DWORD *)(v31 - 104) = v33;
  *(_QWORD *)(v31 - 144) = &a18;
  *(_QWORD *)(v31 - 136) = &a27;
  *(_QWORD *)(v31 - 112) = &a27;
  a11(v31 - 144);
  *(_QWORD *)(v31 - 144) = a14;
  *(_QWORD *)(v31 - 128) = &a27;
  *(_DWORD *)(v31 - 136) = (v27 - 191875500) ^ (520147679 * ((v31 - 144) ^ 0xD061A127));
  sub_21285B980(v31 - 144);
  *(_DWORD *)(v31 - 144) = (v27 + 1) ^ (191237807 * ((v31 - 144) ^ 0xDBC9B6B1));
  *(_QWORD *)(v31 - 136) = &a25;
  *(_QWORD *)(v31 - 128) = &a27;
  v30(v31 - 144);
  *(_QWORD *)(v31 - 144) = &a27;
  *(_QWORD *)(v31 - 136) = &a25;
  *(_DWORD *)(v31 - 128) = v27 + 523995289 * ((v31 - 144) ^ 0x98567068) - 2;
  v34 = sub_212857054(v31 - 144);
  if (a15 == 0x33B0908EC5FFAF74)
    v35 = v27 + 1;
  else
    v35 = v27;
  return ((uint64_t (*)(uint64_t))((char *)&loc_212853D84 + dword_2128C9CA0[v35 + 10]))(v34);
}

uint64_t sub_212853F0C@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  _DWORD *v7;
  int v8;

  v4 = 1638185881 * ((v3 - 144) ^ 0x11FD620);
  *(_QWORD *)(v3 - 144) = v6;
  *(_QWORD *)(v3 - 120) = v2;
  *(_DWORD *)(v3 - 132) = a1 - v4 - 12;
  *(_DWORD *)(v3 - 128) = (v8 + 584850231) ^ v4;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + a1 - 1) - 15))(v3 - 144);
  *v7 = v8;
  *v1 = 55259370;
  return result;
}

void sub_21285401C(_DWORD *a1)
{
  unsigned int v1;
  int v2;

  v1 = 523995289 * (a1 ^ 0x98567068);
  v2 = a1[4] ^ v1;
  if (*a1 - v1 + 855302443 > 0x80000000)
    ++v2;
  __asm { BR              X12 }
}

uint64_t sub_2128540B8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v7;
  uint64_t v8;
  int v9;

  v4 = 520147679 * (&v7 ^ 0xD061A127);
  v5 = v2 + 2;
  v9 = v5 + v4;
  v7 = v1 + v4 - ((v3 + 1710604886) & 0x5050D09A) - 618444424;
  v8 = a1;
  return ((uint64_t (*)(int *))((char *)*(&off_24CE36550 + v5) - 3))(&v7);
}

void sub_2128541C4(_QWORD *a1)
{
  int v1;
  int v2;
  int v3;
  int v4;

  v1 = *(_DWORD *)(a1[2] + 4);
  v2 = 87972796 - v1;
  if (v1 + 2103497250 < 0)
    v2 = *(_DWORD *)(a1[2] + 4);
  v3 = *(_DWORD *)(*a1 + 4);
  if (v3 + 2103497250 < 0)
    v4 = *(_DWORD *)(*a1 + 4);
  else
    v4 = 87972796 - v3;
  __asm { BR              X15 }
}

void sub_2128542B0(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_DWORD *)(v2 + 4) = a2;
}

void sub_2128548B8(_QWORD *a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = *(_DWORD *)(a1[1] + 4) + 551755899;
  v2 = *(_DWORD *)(*a1 + 4) + 551755899;
  v3 = (v1 < -1551741351) ^ (v2 < -1551741351);
  v4 = v1 > v2;
  if (v3)
    v5 = v1 < -1551741351;
  else
    v5 = v4;
  __asm { BR              X15 }
}

uint64_t sub_21285494C(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v6 = v3 - ((v5 ^ 1) & 0xFFFFFFFB | (4 * ((v5 ^ 1) & 1)));
  v7 = v4 + 674204201;
  v8 = v7 < -1429293049;
  v9 = a2 + 674204201 < v7;
  if (a2 + 674204201 < -1429293049 != v8)
    v9 = v8;
  return ((uint64_t (*)())((char *)sub_21285494C + *(int *)(v2 + 4 * (v6 + v9))))();
}

uint64_t sub_2128549B4(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  if (a2 + 2103497250 < 0)
    v5 = a2;
  else
    v5 = 87972796 - a2;
  return ((uint64_t (*)(uint64_t, _QWORD))((char *)sub_212854B18
                                                  + *(int *)(v2
                                                           + 4
                                                           * (int)(((v5 + 2103497249) >> 31)
                                                                 + (v4 & 0xFFFFFFF9 | (4 * (v4 & 1)) | (2 * ((v4 ^ 1) & 1)))
                                                                 + v3
                                                                 + 1))))(a1, (v5 - 1));
}

uint64_t sub_212854A54@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v7 = 4 * (a2 - 43986399);
  v8 = *(_DWORD *)(*(_QWORD *)(a3 + 8) + v7);
  LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(v3 + 8) + v7) + v6;
  v9 = v7 < v5;
  v10 = v7 > v8 + v6;
  if (v9 != v8 + v6 < v5)
    v11 = v9;
  else
    v11 = v10;
  return ((uint64_t (*)())((char *)sub_212854A54 + *(int *)(v4 + 4 * (v11 + a1))))();
}

uint64_t sub_212854ABC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v11 = a4 - 2 * (a8 ^ 1) + 7 * a8;
  v12 = a5 + v10;
  v13 = a6 + v10;
  v14 = (v12 < v9) ^ (v13 < v9);
  v15 = v12 < v13;
  if (v14)
    v15 = v13 < v9;
  return ((uint64_t (*)())((char *)sub_212854ABC + *(int *)(v8 + 4 * (v11 + v15))))();
}

uint64_t sub_212854B84(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8);
  **(_DWORD **)(v1 + 8) = 154173338;
  *(_DWORD *)(v1 + 4) = 43986399;
  return result;
}

uint64_t sub_212854BA8()
{
  return 1;
}

uint64_t sub_212854BB0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))((char *)&loc_212854BD0 + dword_2128C9CE8[(a2 != 0 && a3 == 8 && a4 == 100) + 1]))();
}

uint64_t sub_212854BF0(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 0;
  **(_DWORD **)(a1 + 24) = *a2 - ((2 * *a2) & 0x1B7B7214) + 230537482;
  return result;
}

uint64_t sub_212854C24()
{
  return 4294967246;
}

uint64_t sub_212854C2C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;

  v1 = *(_DWORD *)a1 ^ (523995289 * (a1 ^ 0x98567068));
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
  if (v2 + 2103497250 < 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
  else
    v3 = 87972796 - v2;
  v4 = v1 + 3;
  if ((v3 + 2103497250) > 0x80000000)
    v4 = v1 + 4;
  return ((uint64_t (*)())((char *)sub_212854D14 + dword_2128C9B60[v4]))();
}

uint64_t sub_212854CD8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * v1) == 154173337)
    v4 = v3 + 1;
  else
    v4 = v3;
  return ((uint64_t (*)())((char *)sub_212854CD8 + *(int *)(v2 + 4 * v4)))();
}

uint64_t sub_212854D14()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v6 = v3 - v5 + 2 * v4;
  if ((v0 - 1) <= 0x80000000)
    v7 = v6;
  else
    v7 = v6 + 1;
  return ((uint64_t (*)(void))(*(int *)(v1 + 4 * v7) + v2))();
}

uint64_t sub_212854D5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 4) = v1;
  return result;
}

void sub_212854D64(uint64_t a1)
{
  int v1;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 4) == 43986398)
    v1 = (*(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1))) + 1;
  else
    v1 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  __asm { BR              X14 }
}

uint64_t sub_212854DD8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4) == v3)
    v5 = v1 + 2 * v4 + 1;
  else
    v5 = v1 + 2 * v4;
  return ((uint64_t (*)())((char *)sub_212854DD8 + *(int *)(v2 + 4 * v5)))();
}

uint64_t sub_212854E14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v4 = a1;
  v5 = v1;
  v6 = v2 + 523995289 * (&v4 ^ 0x98567068) - 2;
  return sub_212857054((uint64_t)&v4);
}

uint64_t sub_212854F4C(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  int v4;

  v1 = 1748787863 * (a1 ^ 0x81BAC106);
  v2 = a1[2] - v1;
  v3 = a1[3] ^ v1;
  if (v3 + 2010670055 >= 0)
    v3 = 273627186 - v3;
  v4 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  if (v4 + 2103497250 >= 0)
    v4 = 87972796 - v4;
  return ((uint64_t (*)(void))((char *)&loc_212854FFC
                            + dword_2128C9BC0[v2
                                            + (v4 + 1412415966 < -691081284
                                            || (int)(((v3 - 136813593) >> 5) + 1456402364) < v4 + 1412415966)]))();
}

uint64_t sub_21285501C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  unsigned int v3;

  *(_DWORD *)(result + 16) = (((*(_DWORD *)(*(_QWORD *)(a2 + 8) + 4 * v3) - 154173337) >> (v2 + 7)) & 1 | 0xADF37A3C)
                           + 2130702336;
  return result;
}

uint64_t sub_212855058(uint64_t result)
{
  *(_DWORD *)(result + 16) = 754149948;
  return result;
}

void sub_212855068(uint64_t a1)
{
  int v1;

  if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 4) - 43986398) * (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4) - 43986398))
    v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  else
    v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0) + 1;
  __asm { BR              X17 }
}

void sub_212855150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;

  *(_DWORD *)(a3 + 4) = v3;
}

uint64_t sub_212855F68(uint64_t result)
{
  **(_DWORD **)(result + 24) = 230537482;
  return result;
}

int *sub_212855F7C(int *result)
{
  int v1;

  if (((result[2] ^ (520147679 * (result ^ 0x5061A127))) & 0x40000000) != 0)
    v1 = 1632539679;
  else
    v1 = 1632539680;
  *result = v1;
  return result;
}

void sub_212855FB4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  _BOOL4 v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 24) + 56516261 * (a1 ^ 0x15EBF17D);
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_DWORD *)(v2 + 4);
  if (v3 + 2103497250 < 0)
    v4 = *(_DWORD *)(v2 + 4);
  else
    v4 = 87972796 - v3;
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 4);
  if (v5 + 2103497250 < 0)
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 4);
  else
    v6 = 87972796 - v5;
  v11 = v1 - 1748787863 * (&v10 ^ 0x81BAC106) - 7;
  v10 = v2;
  sub_212857910((uint64_t)&v10);
  v7 = v4 + 1776303881 < v6 + 1776303881;
  if (v4 + 1776303881 < -327193369 != v6 + 1776303881 < -327193369)
    v7 = v6 + 1776303881 < -327193369;
  if (v7)
    v8 = v4;
  else
    v8 = v6;
  if ((v8 + 2103497250) <= 0x80000000)
    v9 = v1;
  else
    v9 = v1 + 1;
  __asm { BR              X0 }
}

uint64_t sub_212856160()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;

  v11 = v7 + 1;
  v12 = v6 < v10;
  v13 = 4 * (v5 + v1);
  v14 = v2 - 1103106517 + *(_DWORD *)(*(_QWORD *)(v9 + 8) + v13) + v3 + *(_DWORD *)(*(_QWORD *)(v8 + 8) + v13) + v3;
  *(_DWORD *)(*(_QWORD *)(v0 + 8) + v13) = (v14 ^ 0x6BB07FDF) + ((2 * v14) & 0xD760FFBE) - 1652555846;
  if (v12 == v5 - 1303012281 < v10)
    v12 = v5 - 1303012281 < v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))((char *)&sub_212856264 + *(int *)(v4 + 4 * (v12 + v11))))(1806729183, 3613458366, 2642411450, 0xFFF7F2FEFE7FFFEFLL, 0x1FCFFFFDELL, 0x3CFFBD53BFBFEE3CLL, 2991955015);
}

uint64_t sub_212856268()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;

  v4 = v3 + 984662679;
  if (v3 + 984662679 < -1118834571 != v1 - 1082083370 < -1118834571)
    v5 = v4 < -1118834571;
  else
    v5 = v1 - 1082083370 < v4;
  return ((uint64_t (*)())((char *)sub_212856268 + *(int *)(v0 + 4 * (v5 + v2))))();
}

uint64_t sub_2128562D0(int a1, int a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;

  v12 = a3 < a2;
  v13 = a1 + v8 + 1;
  v14 = v12 ^ (v13 < a2);
  v15 = v13 < a3;
  if (!v14)
    v12 = v15;
  v16 = 4 * (v8 + v4);
  v17 = v9 + v5 + *(_DWORD *)(*(_QWORD *)(v11 + 8) + v16) + v6;
  *(_DWORD *)(*(_QWORD *)(v3 + 8) + v16) = (v17 ^ 0xEB75FFBF) + ((2 * v17) & 0xD6EBFF7E) + 498761690;
  return ((uint64_t (*)(void))((char *)&sub_2128563AC + *(int *)(v7 + 4 * (v10 + v12 + 2))))();
}

uint64_t sub_2128563B0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v4;

  v4 = v1 - 1201591223 < v3 + 865154826;
  if (v3 + 865154826 < -1238342424 != v1 - 1201591223 < -1238342424)
    v4 = v3 + 865154826 < -1238342424;
  return ((uint64_t (*)())((char *)sub_2128563B0 + *(int *)(v0 + 4 * (v4 + v2))))();
}

uint64_t sub_21285641C(int a1, int a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  int v16;
  _BOOL4 v17;

  v12 = v11 + 9;
  v13 = a3 < a2;
  v14 = 4 * (v8 + v4);
  v15 = v9 + v5 + *(_DWORD *)(*(_QWORD *)(v10 + 8) + v14) + v6;
  *(_DWORD *)(*(_QWORD *)(v3 + 8) + v14) = (v15 ^ 0x4B757FFD) + ((2 * v15) & 0x96EAFFFA) - 1111818340;
  v16 = a1 + v8 + 1;
  LODWORD(v14) = v13 ^ (v16 < a2);
  v17 = v16 < a3;
  if (!(_DWORD)v14)
    v13 = v17;
  return ((uint64_t (*)(void))((char *)&sub_2128564F8 + *(int *)(v7 + 4 * (v13 + v12))))();
}

uint64_t sub_2128564FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  if (v2 == v0)
    v4 = v3 + 1;
  else
    v4 = v3;
  return ((uint64_t (*)())((char *)sub_2128564FC + *(int *)(v1 + 4 * v4)))();
}

void sub_212856518(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;

  *(_DWORD *)(v1 + 4) = (((v3 + v2) * (a1 - 1287059512)) ^ 0x179FFDDE)
                      + ((2 * (v3 + v2) * (a1 - 1287059512)) & 0x2F3FFBBC)
                      - 352374784;
}

void sub_2128565D8(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 2145031067 * (a1 ^ 0x1E282685);
  if ((*(_DWORD *)(a1 + 24) - v1 - 1753086949) <= 0x100)
    v2 = *(_DWORD *)(a1 + 28) ^ v1;
  else
    v2 = (*(_DWORD *)(a1 + 28) ^ v1) + 1;
  __asm { BR              X11 }
}

_DWORD *sub_212856644(_DWORD *result)
{
  *result = -26763466;
  return result;
}

void lLcAnSGNpbJv(uint64_t a1, int a2)
{
  int v2;

  if ((a2 & 0x3F000000) == 0x13000000)
    v2 = 6;
  else
    v2 = 5;
  __asm { BR              X9 }
}

uint64_t sub_2128569EC@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = a1 & 0xFFFFFF | 0x1000000;
  HIDWORD(a3) = (-1936509886 * a2 + 1166996055) ^ (704005591 * (&a3 ^ 0xF7D78CF0));
  v5 = nullsub_1(&a3);
  if (v4 <= 16781312)
  {
    switch(v4)
    {
      case 16777217:
        v6 = 5;
        goto LABEL_17;
      case 16777218:
        v6 = 7;
        goto LABEL_17;
      case 16777219:
        v6 = 9;
        goto LABEL_17;
    }
    return ((uint64_t (*)(uint64_t))((char *)&loc_212856CB0 + *(int *)(v3 + 36)))(v5);
  }
  if (v4 > 16785409)
  {
    if (v4 == 16785410)
    {
      v6 = 2;
      goto LABEL_17;
    }
    if (v4 == 16785411)
    {
      v6 = 3;
      goto LABEL_17;
    }
    return ((uint64_t (*)(uint64_t))((char *)&loc_212856CB0 + *(int *)(v3 + 36)))(v5);
  }
  v6 = 0;
  if (v4 != 16781313)
  {
    if (v4 == 16781314)
    {
      v6 = 1;
      goto LABEL_17;
    }
    return ((uint64_t (*)(_QWORD))((char *)&loc_212856CB0 + *(int *)(v3 + 36)))(v5);
  }
LABEL_17:
  v7 = MEMORY[0x191D655E4]((dword_24CE363B0[6 * v6] - 1377164859));
  if (v7)
    v8 = 7;
  else
    v8 = 8;
  return ((uint64_t (*)(uint64_t))((char *)&loc_212856B44 + *(int *)(v3 + 4 * v8)))(v7);
}

uint64_t sub_212856CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;

  v11 = a3 + v4 * (v9 + 6);
  v12 = v10 - 1377164863;
  if (!v3)
    v12 = -4;
  if (v5 == v8)
    v13 = v12;
  else
    v13 = 4294967292;
  if (v6 + 4 <= v6)
    v14 = v11;
  else
    v14 = v11 + 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)sub_212856CEC + *(int *)(v7 + 4 * v14)))(a1, a2, v13);
}

uint64_t sub_212856D68()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  if (v2 != v1)
    v4 = v0;
  else
    v4 = v0 + 1;
  return ((uint64_t (*)())((char *)sub_212856D68 + *(int *)(v3 + 4 * v4)))();
}

uint64_t sub_212856D98()
{
  unsigned int v0;
  uint64_t v1;
  int v2;
  int v3;

  if (v0 >= 0x20)
    v3 = v2;
  else
    v3 = v2 + 1;
  return ((uint64_t (*)())((char *)sub_212856D98 + *(int *)(v1 + 4 * v3)))();
}

uint64_t sub_212856DDC()
{
  int v0;
  int v1;
  _OWORD *v2;
  uint64_t v3;
  int v4;
  __int128 v5;
  int v6;

  v4 = v1 + 9;
  v5 = *(_OWORD *)((char *)v2 + 20);
  *v2 = *(_OWORD *)((char *)v2 + 4);
  v2[1] = v5;
  if ((v0 & 0xFFFFFFE0) == 0x20)
    v6 = v4 + 1;
  else
    v6 = v4;
  return ((uint64_t (*)())((char *)sub_212856E20 + *(int *)(v3 + 4 * v6)))();
}

uint64_t sub_212856E20()
{
  int v0;
  uint64_t v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  int v6;

  v5 = *v2;
  *(__int128 *)((char *)v2 - 20) = *(v2 - 1);
  *(__int128 *)((char *)v2 - 4) = v5;
  if (v3)
    v6 = v0;
  else
    v6 = v0 + 1;
  return ((uint64_t (*)(void))(*(int *)(v4 + 4 * v6) + v1))();
}

uint64_t sub_212856E50()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  if (v1 == v0)
    v4 = v2 + 1;
  else
    v4 = v2;
  return ((uint64_t (*)())((char *)sub_212856E50 + *(int *)(v3 + 4 * v4)))();
}

uint64_t sub_212856E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  *(_BYTE *)(v3 + v2) = *(_BYTE *)(a1 + v2);
  if (v2 + 1 == v1)
    v6 = v5 + 6;
  else
    v6 = v5 + 5;
  return ((uint64_t (*)())((char *)sub_212856EB8 + *(int *)(v4 + 4 * v6)))();
}

uint64_t sub_212856EB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  *(_BYTE *)(v4 + v2) = *(_BYTE *)(a1 + v2);
  if (v2 + 1 == v1)
    v7 = v6 + 1;
  else
    v7 = v6;
  return ((uint64_t (*)(void))(*(int *)(v5 + 4 * v7) + v3))();
}

uint64_t sub_21285702C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return sub_212854BB0(a1, a2, a3, a4);
}

uint64_t sub_212857040(uint64_t a1)
{
  return sub_212855F68(a1);
}

uint64_t sub_212857054(uint64_t a1)
{
  int v1;

  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8))
    v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068) + 1;
  else
    v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  return ((uint64_t (*)(void))((char *)&loc_212857074 + dword_2128C9800[v1]))();
}

uint64_t sub_21285709C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v5 = v3 + 2 * v4;
  v6 = *(_DWORD *)(a1 + 4);
  if (v6 + 2103497250 < 0)
    v7 = *(_DWORD *)(a1 + 4);
  else
    v7 = 87972796 - v6;
  *(_DWORD *)(v1 + 4) = v6;
  if (v7 == 43986398)
    v8 = v5 + 1;
  else
    v8 = v5;
  return ((uint64_t (*)())((char *)sub_21285709C + *(int *)(v2 + 4 * v8)))();
}

uint64_t sub_2128570F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v8 = v4 + 4 * v7 - 2 * v5 - 2;
  *(_DWORD *)(*(_QWORD *)(v1 + 8) + 4 * (v6 - 43986399)) = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * (v6 - 43986399));
  if (v6 - 1 == v3)
    v9 = v8 + 1;
  else
    v9 = v8;
  return ((uint64_t (*)())((char *)sub_212857148 + *(int *)(v2 + 4 * v9)))();
}

uint64_t sub_212857148@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_DWORD *)(*(_QWORD *)(v1 + 8) + 4 * (v5 + v4)) = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4 * (v5 + v4));
  if (v5 - 1 == v3)
    v8 = v6 + 1;
  else
    v8 = v6;
  return ((uint64_t (*)(void))(*(int *)(v2 + 4 * v8) + v7))();
}

void Xzz3XGhEjs(uint64_t a1, int a2)
{
  int v2;

  if ((a2 & 0x3F000000) == 0x13000000)
    v2 = 6;
  else
    v2 = 5;
  __asm { BR              X9 }
}

uint64_t sub_212857214(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, unsigned int a12)
{
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  v15 = a2 & 0xFFFFFF | 0x1000000;
  a12 = (v14 - 1036443534) ^ (704005591 * (&a11 ^ 0xF7D78CF0));
  v16 = nullsub_1(&a11);
  if (v15 <= 16781312)
  {
    switch(v15)
    {
      case 16777217:
        v17 = 5;
        goto LABEL_16;
      case 16777218:
        v17 = 7;
        goto LABEL_16;
      case 16777219:
        v17 = 9;
        goto LABEL_16;
    }
    return ((uint64_t (*)(uint64_t))((char *)&loc_2128574C8 + *(int *)(v12 + 72)))(v16);
  }
  if (v15 > 16785409)
  {
    if (v15 == 16785410)
    {
      v17 = 2;
      goto LABEL_16;
    }
    if (v15 == 16785411)
    {
      v17 = 3;
      goto LABEL_16;
    }
    return ((uint64_t (*)(uint64_t))((char *)&loc_2128574C8 + *(int *)(v12 + 72)))(v16);
  }
  v17 = 0;
  if (v15 != 16781313)
  {
    if (v15 == 16781314)
    {
      v17 = 1;
      goto LABEL_16;
    }
    return ((uint64_t (*)(_QWORD))((char *)&loc_2128574C8 + *(int *)(v12 + 72)))(v16);
  }
LABEL_16:
  v18 = ((uint64_t (*)(_QWORD))((char *)*(&off_24CE36550 + v13 - 266929693) - 2))((*(_DWORD *)((char *)*(&off_24CE36550 + v13 - 266929659) + 24 * v17 + 14) - 1377164859));
  if (v18)
    v21 = v13 - 266929696;
  else
    v21 = v13 - 266929695;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&loc_212857358 + *(int *)(v12 + 4 * (v21 + 4))))(v18, v19, v20);
}

uint64_t sub_212857510(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v9 = (v7 + v6);
  if (!v2)
    v9 = 4294967292;
  if (v3)
    v10 = v9;
  else
    v10 = 4294967292;
  if (v4 + 4 <= v4)
    v11 = v8;
  else
    v11 = v8 + 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)sub_212857510 + *(int *)(v5 + 4 * v11)))(a1, a2, v10);
}

void sub_212857910(uint64_t a1)
{
  int v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 12) + 1748787863 * (a1 ^ 0x81BAC106);
  v4 = *(_QWORD *)a1;
  v3[0] = (523995289 * (v3 ^ 0x98567068)) ^ (v1 - 1);
  sub_212854C2C((uint64_t)v3);
  if (v3[1] == 1171369712)
    v2 = v1 + 1;
  else
    v2 = v1;
  __asm { BR              X9 }
}

void sub_2128579C4(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  if ((*(_DWORD *)(v2 + 4) + 2103497250) > 0x80000000)
    a1 += 2;
  *(_DWORD *)(v1 + 8) = a1;
}

void sub_212857A20(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 1836812333 * (a1 ^ 0x4065F266);
  if ((*(_DWORD *)(a1 + 16) - v1 - 1779978612) <= 0x100)
    v2 = *(_DWORD *)(a1 + 32) - v1;
  else
    v2 = *(_DWORD *)(a1 + 32) - v1 + 1;
  __asm { BR              X11 }
}

_DWORD *sub_212857A90(_DWORD *result)
{
  *result = 2052067711;
  return result;
}

void sub_212857DC0(_DWORD *a1)
{
  unsigned int v1;

  if (*(_DWORD *)(*(_QWORD *)a1 + 4) == 43986398)
    v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266) + 1;
  else
    v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  __asm { BR              X14 }
}

uint64_t sub_212858A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20)
{
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;

  v29 = 520147679 * ((v28 - 120) ^ 0xD061A127);
  *(_QWORD *)(v28 - 112) = &a18;
  *(_DWORD *)(v28 - 120) = ((v23 ^ 0xDDEAD7E7) + ((2 * v23) & 0xBBD5AFCE) + 2128477948) ^ v29;
  *(_DWORD *)(v28 - 104) = v27 - v29 - 22;
  sub_212853628((_DWORD *)(v28 - 120));
  *(_QWORD *)(v28 - 120) = v20;
  *(_QWORD *)(v28 - 112) = &a20;
  *(_DWORD *)(v28 - 104) = v27 + 2 - ((v28 - 120) ^ v24) * v25 - 15;
  v30 = v21(v28 - 120);
  return ((uint64_t (*)(uint64_t))((char *)&sub_212858C60
                                          + *(int *)(v22
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v28 - 100) + v26) >> 31) + v27 + 2))))(v30);
}

uint64_t sub_212858AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)(v25 - 120) = &a18;
  *(_QWORD *)(v25 - 112) = v24;
  *(_DWORD *)(v25 - 104) = v23 - ((v25 - 120) ^ v20) * v21 - 9;
  v26 = v18(v25 - 120);
  return ((uint64_t (*)(uint64_t))((char *)sub_212858AE4
                                          + *(int *)(v19
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v25 - 100) + v22) >> 31) + v23))))(v26);
}

uint64_t sub_212858B44@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;

  v16 = a1 + 5;
  *(_QWORD *)(v15 - 112) = &a11;
  *(_QWORD *)(v15 - 104) = &a13;
  *(_DWORD *)(v15 - 120) = (a1 - 19) ^ (56516261 * ((v15 - 120) ^ 0x15EBF17D));
  v17 = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + a1 + 12) - 3))(v15 - 120);
  if (v14 == 1)
    v18 = v16 + 1;
  else
    v18 = v16;
  return ((uint64_t (*)(uint64_t))((char *)sub_212858BC8 + *(int *)(v13 + 4 * v18)))(v17);
}

uint64_t sub_212858BC8@<X0>(int a1@<W8>)
{
  uint64_t v1;

  return ((uint64_t (*)())((char *)sub_212858BC8 + *(int *)(v1 + 4 * a1)))();
}

uint64_t sub_212858BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;

  *(_DWORD *)(v25 - 104) = v24 - ((v25 - 120) ^ v21) * v22 - 17;
  *(_QWORD *)(v25 - 120) = v18;
  *(_QWORD *)(v25 - 112) = &a18;
  v26 = v19(v25 - 120);
  if ((*(_DWORD *)(v25 - 100) + v23) <= 0x80000000)
    v27 = v24;
  else
    v27 = v24 + 1;
  return ((uint64_t (*)(uint64_t))((char *)sub_212858BFC + *(int *)(v20 + 4 * v27)))(v26);
}

void sub_212858C68(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  if (v1 + 2103497250 >= 0)
    v1 = 87972796 - v1;
  if ((v1 + 2103497250) <= 0x80000000)
    v2 = *(_DWORD *)(a1 + 16) ^ (704005591 * (a1 ^ 0xF7D78CF0));
  else
    v2 = (*(_DWORD *)(a1 + 16) ^ (704005591 * (a1 ^ 0xF7D78CF0))) + 1;
  __asm { BR              X12 }
}

uint64_t sub_212858D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;

  v14 = v13 - 5;
  v15 = a11 + 2010700264;
  if (a11 + 2010700264 < -92796986 != v11 + 2010700264 < -92796986)
    v16 = v15 < -92796986;
  else
    v16 = v11 + 2010700264 < v15;
  return ((uint64_t (*)())((char *)sub_212858F2C + *(int *)(v12 + 4 * (v16 + v14))))();
}

uint64_t sub_212858E88(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  _BOOL4 v24;

  v22 = v21 - 2;
  v23 = v12 + v10 + *(_DWORD *)(v13 + 4 * v9) + v11 + (*(_DWORD *)(*(_QWORD *)(v14 + 8) + 4 * v19) + v11) * a5;
  *(_DWORD *)(v13 + 4 * v9) = (v23 ^ a8) + (v15 & (2 * v23)) + v16;
  v24 = v19 + v17 < a2;
  if (a2 < a7 != v19 + 1 > v18)
    v24 = a2 < a7;
  return ((uint64_t (*)(void))(*(int *)(v8 + 4 * (v22 + v24)) + v20))();
}

void sub_212858F2C()
{
  JUMPOUT(0x212858E24);
}

uint64_t sub_212858F34()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;

  if (v1 == 0x13F8CA6A4C4C33DBLL)
    v3 = v2 + 1;
  else
    v3 = v2;
  return ((uint64_t (*)())((char *)sub_212858F34 + *(int *)(v0 + 4 * v3)))();
}

uint64_t sub_212858F74@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v4 = *(_DWORD *)(a1 + 4) + 133649238;
  v5 = (v1 + 133649238 < -1969848012) ^ (v4 < -1969848012);
  v6 = v1 + 133649238 > v4;
  if (v5)
    v6 = v1 + 133649238 < -1969848012;
  return ((uint64_t (*)())((char *)sub_212858F74 + *(int *)(v2 + 4 * (v6 + v3))))();
}

void sub_212858FCC(uint64_t a1@<X8>)
{
  int v1;

  *(_DWORD *)(a1 + 4) = v1;
}

uint64_t sub_212858FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;

  v14 = v13 + 1;
  v15 = a11 + 604374080 < -1499123170;
  if (v15 == v11 + 604374080 < -1499123170)
    v15 = v11 + 604374080 < a11 + 604374080;
  return ((uint64_t (*)(void))((char *)&sub_212859138 + *(int *)(v12 + 4 * (v15 + v14))))();
}

uint64_t sub_2128590BC(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  int v18;

  v16 = v14 - 4;
  v17 = v12 - 0x13F8CA6A4C4C33DBLL + (*(_DWORD *)(v9 + 4 * v15) + v11);
  *(_DWORD *)(v9 + 4 * v15) = (v17 ^ a3) + (a4 & (2 * v17)) + a5;
  if ((a6 ^ HIDWORD(v17)) + (a7 & (v17 >> 31)) + a8 == v10)
    v18 = v16 + 1;
  else
    v18 = v16;
  return ((uint64_t (*)(void))(*(int *)(v8 + 4 * v18) + v13))();
}

void sub_21285913C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)a1 + 1638185881 * (a1 ^ 0x11FD620);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  if (v2 + 2103497250 < 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  else
    v3 = 87972796 - v2;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
  if (v4 + 2103497250 < 0)
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
  else
    v5 = 87972796 - v4;
  v9 = *(_QWORD *)(a1 + 24);
  v10 = v1 - 1748787863 * (&v9 ^ 0x81BAC106) - 6;
  sub_212857910((uint64_t)&v9);
  v6 = v3 + 284898161 < v5 + 284898161;
  if (v3 + 284898161 < -1818599089 != v5 + 284898161 < -1818599089)
    v6 = v5 + 284898161 < -1818599089;
  if (v6)
    v7 = v3;
  else
    v7 = v5;
  if ((v7 + 2103497250) <= 0x80000000)
    v8 = v1;
  else
    v8 = v1 + 1;
  __asm { BR              X16 }
}

uint64_t sub_2128599CC()
{
  return 128;
}

void sub_2128599D4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) - 520147679 * (a1 ^ 0xD061A127);
  v2 = *(_QWORD *)(a1 + 8);
  v4[0] = (523995289 * (v4 ^ 0x98567068)) ^ (v1 - 5);
  v5 = v2;
  sub_212854C2C((uint64_t)v4);
  if (v4[1] == 1171369712)
    v3 = v1 + 1;
  else
    v3 = v1;
  __asm { BR              X10 }
}

uint64_t sub_212859B04@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v5 = v4 - 2 * v1;
  v6 = v3 + 547817196 > v2 - 1516561325;
  if (v3 + 547817196 < -1555680054 != v2 - 1516561325 < -1555680054)
    v6 = v3 + 547817196 < -1555680054;
  return ((uint64_t (*)())((char *)sub_212859B04 + *(int *)(a1 + 4 * (v5 + v6))))();
}

uint64_t sub_212859B64@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;

  v4 = ((-3 * v2) & 0xFFFFFFFD | (2 * ((v2 ^ 1) & 1))) + v1;
  if (!v3)
    ++v4;
  return ((uint64_t (*)())((char *)sub_212859B64 + *(int *)(a1 + 4 * v4)))();
}

void nvIb10An(uint64_t a1, int a2)
{
  __asm { BR              X10 }
}

uint64_t sub_212859EFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10)
{
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v12 = 1602850951 * v10 - a9 + 5;
  if (((((2 * (int)a2) & 0x79B7BC | 0x2000000) + (a2 & 0xFFFFFF ^ 0xFE3CDBDE) + 12788770) & 0x3000000) == 0x1000000)
    v13 = v12 + 1;
  else
    v13 = v12;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_21285A70C + *(int *)(v11 + 4 * v13)))(a1, a2, a3, a4, a5, a6, a7, a8, a10);
}

void sub_21285AAB4(uint64_t a1)
{
  int v1;

  if (a1)
    v1 = 1;
  else
    v1 = 2;
  __asm { BR              X10 }
}

uint64_t sub_21285AAF8()
{
  return 4294925273;
}

void pbx7(uint64_t a1, int a2)
{
  int v2;

  if ((a2 & 0x3F000000) == 0x13000000)
    v2 = 2;
  else
    v2 = 1;
  __asm { BR              X8 }
}

uint64_t sub_21285AC10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t v10;
  int v11;
  int v12;

  v11 = v9 + 2;
  if (((((2 * (int)a2) & 0xEDF5D4 | 0x2000000) + (a2 & 0xFFFFFF ^ 0xEE76FAEA) + 8979734) & 0x3000000) == 0x1000000)
    v12 = v11 + 1;
  else
    v12 = v11;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_21285B400 + *(int *)(v10 + 4 * v12)))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_21285ACF0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(_QWORD), uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15)
{
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  int v36;
  uint64_t v38;

  v38 = v16;
  a15 = (v18 + a1 * a4 + 28 * v15 + v17 - 1514781635) ^ (704005591 * (&a14 ^ 0xF7D78CF0));
  nullsub_1(&a14);
  if (SHIDWORD(a4) > 654375625)
  {
    if (SHIDWORD(a4) <= 956357320)
    {
      if (HIDWORD(a4) == 654375626)
      {
        v27 = 2;
        goto LABEL_23;
      }
      if (HIDWORD(a4) == 654375627)
      {
        v27 = 3;
        goto LABEL_23;
      }
    }
    else
    {
      switch(HIDWORD(a4))
      {
        case 0x3900DAC9:
          v27 = 4;
          goto LABEL_23;
        case 0x3900DACA:
          v27 = 6;
          goto LABEL_23;
        case 0x3900DACB:
          v27 = 8;
          goto LABEL_23;
      }
    }
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_21285B128 + *(int *)(v19 + 216)))(0, v20, v21, v22, v23, v24, v25, v26, a2, a3, a4, v38, a6);
  }
  if (SHIDWORD(a4) <= 654367434)
  {
    if (HIDWORD(a4) == 654367433)
    {
      v27 = 5;
      goto LABEL_23;
    }
    if (HIDWORD(a4) == 654367434)
    {
      v27 = 7;
      goto LABEL_23;
    }
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_21285B128 + *(int *)(v19 + 216)))(0, v20, v21, v22, v23, v24, v25, v26, a2, a3, a4, v38, a6);
  }
  if (HIDWORD(a4) == 654367435)
  {
    v27 = 9;
    goto LABEL_23;
  }
  v27 = 0;
  if (HIDWORD(a4) != 654371529)
  {
    if (HIDWORD(a4) == 654371530)
    {
      v27 = 1;
      goto LABEL_23;
    }
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))((char *)&loc_21285B128 + *(int *)(v19 + 216)))(0, v20, v21, v22, v23, v24, v25, v26, a2, a3, a4, v38, a6);
  }
LABEL_23:
  v28 = a10((*(_DWORD *)((char *)*(&off_24CE36550 + v18 - 745267718) + 24 * v27 + 14) - 1377164859));
  v36 = v18 - 745267717;
  if (v28)
    v36 = v18 - 745267718;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_21285AF80 + *(int *)(v19 + 4 * v36)))(v28, v29, v30, v31, v32, v33, v34, v35, a2, a3, a4, v38, a6);
}

uint64_t sub_21285B19C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  int v21;
  uint64_t v22;

  return ((uint64_t (*)(void))((char *)sub_21285B19C
                            + *(int *)(v22 + 4 * (v20 + (a17 == 0 || a20 - 1377164863 + v21 > a16)))))();
}

uint64_t sub_21285B204@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  int v5;

  v4 = v2 + 613508796 - ((2 * v2 + 1540637570) & 0xED4E89F6);
  if ((v4 ^ 0xE198B506) + 1875283832 + ((2 * v4) & 0x2E7FE3FA ^ 0x2C4E81F2) == v1)
    v5 = a1 + 1;
  else
    v5 = a1;
  return ((uint64_t (*)(void))((char *)sub_21285B204 + *(int *)(v3 + 4 * v5)))();
}

uint64_t sub_21285B29C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_BYTE *)(v1 + (v3 + v6)) = *(_BYTE *)(v2 + (v3 + v6));
  if (v3 - 1 == v5)
    v8 = a1 + 1;
  else
    v8 = a1;
  return ((uint64_t (*)(void))(*(int *)(v7 + 4 * v8) + v4))();
}

uint64_t sub_21285B2CC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))((char *)sub_21285B2CC
                            + *(int *)(v3 + 4 * (((v2 == v4) & (v1 != 637590216)) + v0))))();
}

uint64_t sub_21285B314@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;

  if (v1 == v3)
    ++a1;
  return ((uint64_t (*)(void))((char *)sub_21285B314 + *(int *)(v2 + 4 * a1)))();
}

uint64_t sub_21285B344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  return v7(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_21285B364()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;

  if (v1 == v3)
    v4 = -745267750;
  else
    v4 = -745267751;
  return ((uint64_t (*)())((char *)sub_21285B364 + *(int *)(v2 + 4 * (v4 + v0 + 20))))();
}

uint64_t sub_21285B3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16, uint64_t a17, uint64_t (*a18)(_QWORD))
{
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  v20 = a18(a16);
  if (v20)
    v28 = v18;
  else
    v28 = v18 + 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_21285B3B4 + *(int *)(v19 + 4 * v28)))(v20, v21, v22, v23, v24, v25, v26, v27);
}

void sub_21285B400()
{
  JUMPOUT(0x21285AC9CLL);
}

uint64_t sub_21285B40C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;

  if (v1 == v3)
    v4 = -745267750;
  else
    v4 = -745267751;
  return ((uint64_t (*)())((char *)sub_21285B40C + *(int *)(v2 + 4 * (v4 + v0 + 5))))();
}

uint64_t sub_21285B454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  uint64_t v11;
  int v12;

  if (((uint64_t (*)(uint64_t, uint64_t, char *))((char *)*(&off_24CE36550 + v10 + 1) - 2))(a10, 3, (char *)*(&off_24CE36550 + v10 - 13) - 14))
  {
    v12 = v10;
  }
  else
  {
    v12 = v10 + 1;
  }
  return ((uint64_t (*)(void))((char *)sub_21285B454 + *(int *)(v11 + 4 * v12)))();
}

uint64_t sub_21285B4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  int v16;
  uint64_t v17;

  return ((uint64_t (*)(void))((char *)sub_21285B4B0
                            + *(int *)(v17 + 4 * (v16 + (a16 > 0x90EF4642 || a16 + 1863367101 > 0x6F10B9BD)))))();
}

uint64_t sub_21285B51C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;

  if (*(_BYTE *)(a16 + (v16 + v18 - 2)) == 48)
    v20 = v17 + 1;
  else
    v20 = v17;
  return ((uint64_t (*)(void))((char *)sub_21285B51C + *(int *)(v19 + 4 * v20)))();
}

uint64_t sub_21285B564@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  int v10;
  int v11;

  if (*(char *)(a9 + (a1 - 1)) < 0)
    v11 = v10;
  else
    v11 = v10 + 1;
  return ((uint64_t (*)(void))((char *)sub_21285B564 + *(int *)(v9 + 4 * v11)))();
}

uint64_t sub_21285B598@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;

  v8 = v7 + 745267739 * v4 + 10 * v5 - 5;
  if (((uint64_t (*)(uint64_t, uint64_t, _QWORD))((char *)*(&off_24CE36550 + 745267739 * v4 + 10 * v5 + v7 + 20)
                                                         - 3))(a4, a1, (a2 + 2)))
  {
    v9 = v8;
  }
  else
  {
    v9 = v8 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_21285B62C + *(int *)(v6 + 4 * v9)))();
}

uint64_t sub_21285B680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t), uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  unsigned int v24;
  int v25;
  _BOOL4 v26;

  ((void (*)(uint64_t, uint64_t))((char *)*(&off_24CE36550 + v21 - 20) - 2))(v16, a1);
  v23 = a9(a1);
  v24 = v17 + v19 + 697497859;
  v25 = (a16 > 0x90EF4642) ^ (v24 < 0x6F10B9BD);
  v26 = v24 < v18;
  if (v25)
    v26 = a16 > 0x90EF4642;
  return ((uint64_t (*)(uint64_t))((char *)sub_21285B680 + *(int *)(v20 + 4 * (v21 + v26))))(v23);
}

uint64_t sub_21285B794@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  va_list va;

  va_start(va, a12);
  v17 = v13 + 2 * a1 + v12 * (v14 - 6);
  if (((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * (v17 + 16)) - 2))(a3, *(_QWORD *)(v15 + 8 * (v17 + 41)) - 7, va, 8, 100))
  {
    v18 = v17;
  }
  else
  {
    v18 = v17 + 1;
  }
  return ((uint64_t (*)(void))((char *)sub_21285B794 + *(int *)(v16 + 4 * v18)))();
}

uint64_t sub_21285B7F4()
{
  uint64_t v0;
  void (*v2)(uint64_t);

  v2(v0);
  return 0;
}

uint64_t sub_21285B8F8(uint64_t a1, char a2)
{
  return ((uint64_t (*)(void))((char *)*(&off_24CE36550
                                      + (((((((((char)((a2 >> 3) + 49) >> 7) + 103) >> 2) & 0x3E ^ 0x7D)
                                          / 0x2E) | 0x29)
                                        - 126) & 0x2F)
                                      - 18)
                            - 11))();
}

uint64_t sub_21285B96C()
{
  return sub_2128599CC();
}

uint64_t sub_21285B980(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) ^ (520147679 * (a1 ^ 0xD061A127));
  v2 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)a1;
  v4 = v2;
  v1 += 191875502;
  v5 = v1 - 191237807 * (&v4 ^ 0xDBC9B6B1) + 3;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_24CE36550 + v1) - 10))(&v4);
}

uint64_t fukQllQ9ln(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v6;

  v2 = (int)(((((char)(((char)a2 % 47) % 0x85u + 20) >> 5) | 3) - 89) << 24) >> 25;
  v3 = (uint64_t)*(&off_24CE36550 + (((v2 % 0xB2u) & v2) - 44) - 189);
  v6 = a2;
  v4 = ((2078209981 * (unint64_t)(((v2 + 58) * (v2 + 58)) >> 1)) >> 32)
     - (((v2 + 58) * (v2 + 58)) >> 1);
  return ((uint64_t (*)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))(v3 - 2))(a1, (char *)*(&off_24CE36550+ ((((((((((char)((v4 >> 5) + (v4 < 0) + 13) % 104) & v2) | 0x38u)% 0xE1) >> 1) & 0x3F)+ 23) >> 4) | 0xDA)- 170)- 7, &v6, 8, 100);
}

void sub_21285BB90(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21285BBEC@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v3 = 235968474 * v1;
  v4 = v3 - 4 * a1 + 6;
  if (((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + v3 - 4 * a1 + 14) - 2))(200))
    v5 = v4;
  else
    v5 = v4 + 1;
  return ((uint64_t (*)())((char *)sub_21285BBEC + *(int *)(v2 + 4 * v5)))();
}

uint64_t sub_21285BC54@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  _QWORD *v2;
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v9;
  int v10;

  v9 = ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 8 * (v7 + a2 * (v5 - 2) - 235968469)) - 3))(a1, 0);
  if (v9 == 16)
  {
    v4 -= 3;
    goto LABEL_7;
  }
  if (v9 == 12)
  {
LABEL_7:
    ((void (*)(uint64_t))(*(_QWORD *)(v6 + 8 * (v5 - 235968448)) - 2))(a1);
    v10 = v4;
    return v10 ^ v3;
  }
  if (v9)
  {
    v4 -= 2;
    goto LABEL_7;
  }
  *v2 = a1;
  v10 = 423463137;
  return v10 ^ v3;
}

void sub_21285BCE4(uint64_t a1)
{
  int v1;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 4) == 43986398)
    v1 = (*(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D))) + 1;
  else
    v1 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  __asm { BR              X16 }
}

uint64_t sub_21285BEE4(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v1 = 523995289 * (a1 ^ 0x98567068);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = *(_DWORD *)(a1 + 12) ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4);
  if (v4 + 2103497250 >= 0)
    v4 = 87972796 - v4;
  if (4 * (unint64_t)(v4 - 43986398) <= (v3 - 495746625))
    v5 = v2;
  else
    v5 = v2 + 1;
  return ((uint64_t (*)(void))((char *)&loc_21285BF50 + dword_2128CECF0[v5]))();
}

uint64_t sub_21285BF80()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v4 = v2 - 2 * v3;
  if (v0 == 495746625)
    v5 = v4 + 1;
  else
    v5 = v4;
  return ((uint64_t (*)())((char *)sub_21285BF80 + *(int *)(v1 + 4 * v5)))();
}

uint64_t sub_21285BFB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 16) = v1;
  return result;
}

uint64_t sub_21285BFC0(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  return ((uint64_t (*)(uint64_t))((char *)sub_21285C084 + *(int *)(v1 + 4 * (6 * v4 + 2 * v3 + v2 + 4))))(a1);
}

uint64_t sub_21285C034@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W4>, int a4@<W8>)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  char v7;
  int v8;

  *(_BYTE *)(v6 + (a3 + a4)) = ((a2 - 154173337) >> v7)
                                           - ((2 * ((a2 - 154173337) >> v7)) & 0xE3)
                                           + 113;
  if (a3 - 1 == v5)
    v8 = a1 + 1;
  else
    v8 = a1;
  return ((uint64_t (*)())((char *)sub_21285C034 + *(int *)(v4 + 4 * v8)))();
}

uint64_t sub_21285C084(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;

  v8 = (a6 & 0xFFFFFFFB | (4 * (a6 & 1))) - 2 * a5 + a3;
  if (v7 == 24)
    v9 = v8 + 1;
  else
    v9 = v8;
  return ((uint64_t (*)(uint64_t))(*(int *)(v6 + 4 * v9) + a2))(a1);
}

uint64_t sub_21285C0C0(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;

  if (v3 + 1813906772 < -289590478 != v6 + 466118190 < -289590478)
    v7 = v3 + 1813906772 < -289590478;
  else
    v7 = v6 + 466118190 < v3 + 1813906772;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))((char *)sub_21285C0C0
                                                                             + *(int *)(v5 + 4 * (a3 + v7))))(a1, a2, -3 * !v7 + 4 * v7 + a3, 154173337, v4);
}

uint64_t sub_21285C140@<X0>(int a1@<W5>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  int v4;

  return sub_21285C034(a1 - 7, *(_DWORD *)(*(_QWORD *)(v2 + 8) + 4 * (v4 - 1391774980)), v3, a2);
}

void sub_21285C168(uint64_t a1)
{
  __asm { BR              X3 }
}

void sub_21285C288()
{
  JUMPOUT(0x21285C250);
}

uint64_t sub_21285C2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v21 = 32 * v15 - 1407564736;
  *(_DWORD *)(a11 + 16) = -467127413 - v16;
  v22 = 1638185881 * ((v20 - 136) ^ 0x11FD620);
  *(_DWORD *)(v20 - 136) = (v19 - 21985946) ^ v22;
  *(_DWORD *)(v20 - 132) = v22 + 474351149;
  *(_QWORD *)(v20 - 128) = v17;
  sub_212854B84(v20 - 136);
  v23 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - 4 - v23;
  *(_DWORD *)(v20 - 136) = ((v21 ^ 0xDFCDDFF7) + ((2 * v21) & 0xBF9BBFC0) + 2096821996) ^ v23;
  *(_QWORD *)(v20 - 128) = v17;
  sub_212853628((_DWORD *)(v20 - 136));
  *(_QWORD *)(v20 - 136) = a14;
  *(_QWORD *)(v20 - 128) = &a15;
  *(_DWORD *)(v20 - 120) = v19 - 4 + 523995289 * ((v20 - 136) ^ 0x98567068);
  sub_212857054(v20 - 136);
  *(_DWORD *)(v20 - 120) = v19 - v22 + 5;
  *(_QWORD *)(v20 - 136) = a14;
  *(_QWORD *)(v20 - 128) = v17;
  v24 = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + v19 + 33) - 3))(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C2B0
                                          + *(int *)(v18
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v20 - 116) + 1431020167) >> 31)
                                                         + v19))))(v24);
}

uint64_t sub_21285C450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(v15 - 120) = v14 + 523995289 * ((v15 - 136) ^ 0x98567068);
  *(_QWORD *)(v15 - 136) = v11;
  *(_QWORD *)(v15 - 128) = v12;
  v16 = sub_212857054(v15 - 136);
  if (a11 >= 1)
    v17 = v14 + 8;
  else
    v17 = v14 + 9;
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C4BC + *(int *)(v13 + 4 * v17)))(v16);
}

uint64_t sub_21285C4BC()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;

  if (v0 <= v2)
    v5 = v4;
  else
    v5 = v4 + 1;
  return ((uint64_t (*)(void))(*(int *)(v3 + 4 * v5) + v1))();
}

uint64_t sub_21285C4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  int v20;
  uint64_t v21;

  *(_QWORD *)(v19 - 136) = a14;
  *(_QWORD *)(v19 - 128) = &a15;
  *(_DWORD *)(v19 - 120) = v17 - 2 + 523995289 * ((v19 - 136) ^ 0x98567068);
  sub_212857054(v19 - 136);
  v20 = 520147679 * ((v19 - 136) ^ 0xD061A127);
  *(_DWORD *)(v19 - 120) = v17 - 2 - v20;
  *(_DWORD *)(v19 - 136) = v20 ^ 0x5CC8D6E4;
  *(_QWORD *)(v19 - 128) = v15;
  sub_212853628((_DWORD *)(v19 - 136));
  *(_DWORD *)(v19 - 120) = v17 - 1638185881 * ((v19 - 136) ^ 0x11FD620) + 7;
  *(_QWORD *)(v19 - 136) = a14;
  *(_QWORD *)(v19 - 128) = v15;
  v21 = v18(v19 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C4E0
                                          + *(int *)(v16
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v19 - 116) + 1431020167) >> 31)
                                                         + v17))))(v21);
}

uint64_t sub_21285C6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  uint64_t v12;
  int v13;
  int v14;

  if ((a12 - 1571160019) <= 0x80000001)
    v14 = v13;
  else
    v14 = v13 + 1;
  return ((uint64_t (*)(void))((char *)sub_21285C6B0 + *(int *)(v12 + 4 * v14)))();
}

uint64_t sub_21285C708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;

  *(_QWORD *)(v19 - 112) = a14;
  *(_QWORD *)(v19 - 104) = v17;
  *(_DWORD *)(v19 - 120) = v14 + 1836812333 * ((v19 - 136) ^ 0x4065F266) - 10;
  *(_QWORD *)(v19 - 136) = v17;
  *(_QWORD *)(v19 - 128) = a11;
  v20 = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + v14 + 49) - 11))(v19 - 136);
  v21 = v15 - 1487239123;
  if (v15 - 1487239123 < 0)
    v21 = v15 - 1487239122;
  if ((((v21 & 0xBB4BFFA6) + ((v21 >> 1) ^ 0xDDA5FFD3) + 576323629) & v16) != 0)
    v22 = v14;
  else
    v22 = v14 + 1;
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C708 + *(int *)(v18 + 4 * v22)))(v20);
}

uint64_t sub_21285C7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  int v21;
  uint64_t v22;

  v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v18 - 14 - v21;
  *(_DWORD *)(v20 - 136) = v21 ^ 0x5CC8D6E4;
  *(_QWORD *)(v20 - 128) = v16;
  sub_212853628((_DWORD *)(v20 - 136));
  *(_QWORD *)(v20 - 136) = a14;
  *(_QWORD *)(v20 - 128) = &a15;
  *(_DWORD *)(v20 - 120) = v18 - 14 + 523995289 * ((v20 - 136) ^ 0x98567068);
  sub_212857054(v20 - 136);
  *(_QWORD *)(v20 - 136) = a14;
  *(_QWORD *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v18 - 1638185881 * ((v20 - 136) ^ 0x11FD620) - 5;
  v22 = v19(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C7E4
                                          + *(int *)(v17
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v18))))(v22);
}

uint64_t sub_21285C8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;

  v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 27;
  *(_DWORD *)(v20 - 136) = ((v15 ^ 0xFFCCFFF7) + ((2 * v15) & 0xFF99FFEE) + 1560008428) ^ v21;
  *(_QWORD *)(v20 - 128) = &a15;
  sub_212853628((_DWORD *)(v20 - 136));
  v22 = v19 + 3;
  *(_DWORD *)(v20 - 120) = v22 - 1638185881 * ((v20 - 136) ^ 0x11FD620) - 21;
  *(_QWORD *)(v20 - 136) = a14;
  *(_QWORD *)(v20 - 128) = v16;
  v23 = v18(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)&sub_21285CBAC
                                          + *(int *)(v17
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v20 - 116) + 1431020167) >> 31)
                                                         + v22))))(v23);
}

uint64_t sub_21285C9F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t (*v4)(uint64_t);
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(v6 - 120) = v3 - 1638185881 * ((v6 - 136) ^ v5) - 3;
  *(_QWORD *)(v6 - 136) = v2;
  *(_QWORD *)(v6 - 128) = v0;
  v7 = v4(v6 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_21285C9F4
                                          + *(int *)(v1
                                                   + 4
                                                   * (int)(((*(_DWORD *)(v6 - 116) + 1431020167) >> 31)
                                                         + v3))))(v7);
}

uint64_t sub_21285CA80@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t), uint64_t a7, char a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;

  v12 = a1 - 6;
  *(_QWORD *)(v11 - 128) = &a8;
  *(_QWORD *)(v11 - 120) = v9;
  *(_DWORD *)(v11 - 136) = (a1 - 18) ^ (56516261 * ((v11 - 136) ^ 0x15EBF17D));
  v13 = a6(v11 - 136);
  if (v8 == 1)
    v14 = v12 + 1;
  else
    v14 = v12;
  return ((uint64_t (*)(uint64_t))((char *)sub_21285CB04 + *(int *)(v10 + 4 * v14)))(v13);
}

void sub_21285D0F0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  _QWORD v10[41];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];
  uint64_t v16;

  v10[40] = a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (((unint64_t)&v10[0xFE0588DFA92FB4DFLL] + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  v14 = 16
      * (_QWORD)((char *)&v10[0xFE0588DFA92FB4DFLL]
               - 7 * ((v5 + (((unint64_t)&v10[0xFE0588DFA92FB4DFLL] - v5 + 6) >> 1)) >> 2)
               + 6);
  v6 = **(_DWORD **)(a1 + 24);
  v10[39] = a4;
  v11 = a2;
  if ((v6 & 0x3E000000 ^ 0xC000000 | 0x1000000) != 0x13000000)
    JUMPOUT(0x212861584);
  v10[38] = 0x78AECEE7BAC7D299;
  LODWORD(v13) = 1377164859;
  v15[1] = (704005591 * (v15 ^ 0xF7D78CF0)) ^ 0xD2222699;
  nullsub_1(v15);
  v7 = v6 ^ 0xDBDB90A;
  v12 = 0x191D655E4;
  if ((v6 ^ 0xDBDB90A) > 16785409)
  {
    if (v7 <= 318767104)
    {
      if (v7 == 16785410)
      {
        v8 = 2;
      }
      else
      {
        if (v7 != 16785411)
          goto LABEL_24;
        v8 = 3;
      }
    }
    else
    {
      switch(v7)
      {
        case 318767105:
          v8 = 4;
          break;
        case 318767106:
          v8 = 6;
          break;
        case 318767107:
          v8 = 8;
          break;
        default:
          goto LABEL_24;
      }
    }
  }
  else if (v7 <= 16777218)
  {
    if (v7 == 16777217)
    {
      v8 = 5;
    }
    else
    {
      if (v7 != 16777218)
        goto LABEL_24;
      v8 = 7;
    }
  }
  else
  {
    switch(v7)
    {
      case 16777219:
        v8 = 9;
        break;
      case 16781313:
        v8 = 0;
        break;
      case 16781314:
        v8 = 1;
        break;
      default:
LABEL_24:
        JUMPOUT(0x212861034);
    }
  }
  if (((uint64_t (*)(_QWORD))v12)((dword_24CE363B0[6 * v8] - 1377164859)))
    v9 = 10;
  else
    v9 = 11;
  __asm { BR              X10 }
}

uint64_t sub_212861064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55)
{
  int v55;
  int v56;
  int v57;
  _QWORD *v58;
  uint64_t v59;
  int v60;

  v60 = v56 + v55 * (v57 + 116);
  if (*v58 < (unint64_t)(((2 * (8 * a55 - 351891184)) & 0xA4596D60)
                               + ((8 * a55 - 351891184) ^ 0x522CB6B3)
                               - 1378662067))
    ++v60;
  return ((uint64_t (*)(void))((char *)sub_212861064 + *(int *)(v59 + 4 * v60)))();
}

uint64_t sub_2128610D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  int v65;
  int v66;
  uint64_t v67;
  int v68;

  v62 = v55 - 37891;
  if (a51 == 1)
  {
    LOWORD(STACK[0x6D0]) = 8739;
    if ((unint64_t)(v56 + ~a48) <= 2)
      v65 = v59;
    else
      v65 = v59 + 1;
    return ((uint64_t (*)(void))((char *)&loc_212861304 + *(int *)(v60 + 4 * (v65 + v58 + 130))))();
  }
  else if (a51)
  {
    LODWORD(STACK[0x6C4]) = v62;
    v66 = 1685429429 * ((v61 - 168) ^ 0x377F83D5);
    *(_QWORD *)(v61 - 104) = 0x33B0908EC5FFAF74;
    *(_QWORD *)(v61 - 120) = &STACK[0x6C4];
    *(_QWORD *)(v61 - 144) = &a55;
    *(_QWORD *)(v61 - 136) = 0x5F40CF076E63375DLL;
    *(_DWORD *)(v61 - 128) = v62 - v66;
    *(_DWORD *)(v61 - 112) = (v59 + 1227424107) ^ v66;
    *(_QWORD *)(v61 - 160) = &STACK[0x78AECEE7BAC7D969];
    *(_QWORD *)(v61 - 152) = a49;
    v67 = ((uint64_t (*)(uint64_t))((char *)*(&off_24CE36550 + v59 + 1227424159) - 14))(v61 - 168);
    if (*(_DWORD *)(v61 - 168) == v57)
      v68 = v59 + 1227424116;
    else
      v68 = v59 + 1227424115;
    return ((uint64_t (*)(uint64_t))((char *)&loc_2128614A0 + *(int *)(v60 + 4 * (v68 + 145))))(v67);
  }
  else
  {
    if (v56 == a48)
      v63 = v59 + 1;
    else
      v63 = v59;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&loc_2128610F4
                                                              + *(int *)(v60 + 4 * (v63 + v58 + 109))))(a48, a2, 1227424115);
  }
}

uint64_t sub_212861568()
{
  _QWORD *v0;
  int v2;

  *v0 = (v2 - 1378624176);
  return 0;
}

uint64_t cpGetDeviceInfo(io_registry_entry_t entry, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11;
  CFAllocatorRef *v12;
  const __CFNumber *CFProperty;
  const __CFNumber *v15;
  int Value;
  const __CFNumber *v17;
  const __CFNumber *v18;
  int v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  int v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  int v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  int v28;

  v11 = 3758097084;
  v12 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a2)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("DeviceVersion"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty)
      return 3758097136;
    v15 = CFProperty;
    Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, a2);
    CFRelease(v15);
    if (!Value)
      return v11;
  }
  if (a3)
  {
    v17 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("FirmwareVersion"), *v12, 0);
    if (!v17)
      return 3758097136;
    v18 = v17;
    v19 = CFNumberGetValue(v17, kCFNumberSInt8Type, a3);
    CFRelease(v18);
    if (!v19)
      return v11;
  }
  if (a4)
  {
    v20 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("AuthMajorVersion"), *v12, 0);
    if (!v20)
      return 3758097136;
    v21 = v20;
    v22 = CFNumberGetValue(v20, kCFNumberSInt8Type, a4);
    CFRelease(v21);
    if (!v22)
      return v11;
  }
  if (a5)
  {
    v23 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("AuthMinorVersion"), *v12, 0);
    if (!v23)
      return 3758097136;
    v24 = v23;
    v25 = CFNumberGetValue(v23, kCFNumberSInt8Type, a5);
    CFRelease(v24);
    if (!v25)
      return v11;
  }
  if (!a6)
    return 0;
  v26 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("DeviceID"), *v12, 0);
  if (!v26)
    return 3758097136;
  v27 = v26;
  v28 = CFNumberGetValue(v26, kCFNumberSInt32Type, a6);
  CFRelease(v27);
  if (v28)
    return 0;
  return v11;
}

uint64_t cpGetDeviceIDSN(io_registry_entry_t a1, UInt8 **a2, CFIndex *a3)
{
  uint64_t v3;
  const __CFData *CFProperty;
  const __CFData *v7;
  CFIndex Length;
  UInt8 *v9;
  UInt8 *v10;
  CFRange v12;

  v3 = 3758097090;
  if (a2)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IDSN"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      Length = CFDataGetLength(CFProperty);
      v9 = (UInt8 *)malloc_type_malloc(Length, 0xC0846878uLL);
      if (v9)
      {
        v10 = v9;
        v12.location = 0;
        v12.length = Length;
        CFDataGetBytes(v7, v12, v9);
        v3 = 0;
        *a2 = v10;
        *a3 = Length;
      }
      else
      {
        v3 = 3758097115;
      }
      CFRelease(v7);
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

CFTypeRef cpCopyCertificate(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("AccessoryCertificate"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpClearCertificate(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0xDu, 0, 0, 0, 0);
}

CFTypeRef cpCopyCertificateSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("AccessoryCertificateSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpGetChallengeSignatureLengths(mach_port_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  output = 0;
  v10 = 0;
  outputCnt = 2;
  puts("cpGetChallengeSignatureLengths");
  result = IOConnectCallScalarMethod(a1, 0x14u, 0, 0, &output, &outputCnt);
  v7 = v10;
  *a2 = output;
  *a3 = v7;
  return result;
}

uint64_t cpCreateFormattedChallengeFromServerRequest(mach_port_t a1, const __CFData *a2, CFDataRef *a3)
{
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v8;
  size_t outputStructCnt;
  _OWORD outputStruct[8];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  puts("cpCreateFormattedChallengeFromServerRequest");
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(a2);
  Length = CFDataGetLength(a2);
  v8 = IOConnectCallStructMethod(a1, 0x15u, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!(_DWORD)v8 && outputStructCnt)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)outputStruct, outputStructCnt);
  return v8;
}

uint64_t cpCreateFormattedResponseForServerResponse(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t a4)
{
  const UInt8 *BytePtr;
  size_t v8;
  uint64_t v9;
  CFIndex length;
  uint64_t input;
  UInt8 bytes[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  input = a4;
  puts("cpCreateFormattedResponseForServerResponse");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)bytes = 0u;
  v14 = 0u;
  length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  v8 = CFDataGetLength(a2);
  v9 = IOConnectCallMethod(a1, 0x16u, &input, 1u, BytePtr, v8, 0, 0, bytes, (size_t *)&length);
  if (!(_DWORD)v9)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length);
  return v9;
}

uint64_t cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  const UInt8 *BytePtr;
  size_t v7;
  uint64_t v8;
  CFIndex length;
  UInt8 outputStruct[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  length = 128;
  BytePtr = CFDataGetBytePtr(theData);
  v7 = CFDataGetLength(theData);
  v8 = IOConnectCallStructMethod(a1, 0, BytePtr, v7, outputStruct, (size_t *)&length);
  if (!(_DWORD)v8)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], outputStruct, length);
  return v8;
}

uint64_t cpCreateSignatureWithIndexAndToken(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t *a4, int a5)
{
  CFIndex v10;
  const UInt8 *BytePtr;
  size_t v12;
  uint64_t v13;
  CFIndex length;
  uint32_t outputCnt;
  uint64_t input[3];
  UInt8 bytes[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  puts("cpCreateSignatureWithIndexAndToken");
  if (a2)
  {
    v10 = CFDataGetLength(a2);
    if (v10)
      CFDataGetBytePtr(a2);
  }
  else
  {
    v10 = 0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)bytes = 0u;
  v19 = 0u;
  input[0] = a5;
  input[1] = v10;
  input[2] = 128;
  outputCnt = 1;
  length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  v12 = CFDataGetLength(a2);
  v13 = IOConnectCallMethod(a1, 0x13u, input, 3u, BytePtr, v12, a4, &outputCnt, bytes, (size_t *)&length);
  if (!(_DWORD)v13)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length);
  return v13;
}

CFTypeRef cpCopyDeviceNonce(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceNonce"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpSetAuthStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatusForUI(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t cpSetFdrValidationStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t cpSetAuthFullPass(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0);
}

uint64_t cpSetAuthErrorDescription(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
      v4 = IOConnectCallStructMethod(a1, 0xBu, v7, v5, 0, 0);
    else
      v4 = 3758097090;
    free(v7);
  }
  return v4;
}

uint64_t cpSetAuthError(mach_port_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t input;

  v3 = a2;
  printf("cpSetAuthError %d\n", a2);
  input = v3;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t cpCopyDownstreamCertificateSerialNumber(mach_port_t a1, CFStringRef *a2)
{
  uint64_t v3;
  CFStringRef v4;
  size_t outputStructCnt;
  char outputStruct[33];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  outputStructCnt = 33;
  v3 = IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, &outputStructCnt);
  v4 = 0;
  if (!(_DWORD)v3)
    v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], outputStruct, 0x600u);
  *a2 = v4;
  return v3;
}

uint64_t cpSetDownstreamRevokeStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 2u, &input, 1u, 0, 0);
}

uint64_t cpGetDownstreamAuthMajorVer(mach_port_t a1, _BYTE *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(a1, 3u, 0, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

uint64_t cpClearAuthState(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
}

uint64_t cpRequestAuthRestart(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t cpSetExpectedPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      v4 = IOConnectCallStructMethod(a1, 0x11u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetExpectedPairedCertSN: !CFStringGetCString");
      v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetActualPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      v4 = IOConnectCallStructMethod(a1, 0x12u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetActualPairedCertSN: !CFStringGetCString");
      v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpGetTransportEntryId(mach_port_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(a1, 0x10u, 0, 0, &output, &outputCnt);
  v4 = v3;
  if ((_DWORD)v3)
    printf("cpGetTransportEntryId: IOConnectCallScalarMethod failed: 0x%x\n", v3);
  else
    *a2 = output;
  return v4;
}

uint64_t cpGetUpstreamAccessoryManager(io_registry_entry_t a1)
{
  io_registry_entry_t parent;

  parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent))
    return 0;
  else
    return parent;
}

uint64_t cpGetInternalComponents(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFAllocator *v27;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), (const void *)*MEMORY[0x24BDBD270]);
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        v27 = v5;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = v27;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

uint64_t AuthCPI2CRead(mach_port_t a1, char a2, unsigned int a3, void *outputStruct)
{
  size_t outputStructCnt;
  uint64_t input;

  LOBYTE(input) = a2;
  outputStructCnt = a3;
  return IOConnectCallMethod(a1, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t AuthCPI2CWrite(mach_port_t a1, char a2, size_t inputStructCnt, void *inputStruct)
{
  uint64_t input;

  LOBYTE(input) = a2;
  return IOConnectCallMethod(a1, 0xFu, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = X509PolicySetFlagsForTestAnchor((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[2];
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2;
  int *result;

  v2 = 0;
  while (1)
  {
    result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(_QWORD *)(a1 + 8));
    if (!(_DWORD)result)
      break;
    v2 += 32;
    if (v2 == 160)
      return 0;
  }
  if (v2 <= ~(unint64_t)digests)
    return &digests[v2 / 4];
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1;

  v1 = 0;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32;
    if (v1 == 160)
      return 0;
  }
  if (v1 <= ~(unint64_t)digests)
    return &digests[v1 / 4];
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v6;

  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    v6 = &CTOidSha1;
    v4 = 5;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha256;
LABEL_18:
    v4 = 9;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_18;
  }
  v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL))
      return 0;
    v6 = &CTOidSha512;
    goto LABEL_18;
  }
  v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t vars0;

  result = 0;
  v27 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v21 = 0xAAAAAAAAAAAAAAAALL;
              v22 = 0xAAAAAAAAAAAAAAAALL;
              v10 = a5[9];
              v9 = a5[10];
              if (__CFADD__(v10, v9))
                goto LABEL_31;
              if (v10 > v10 + v9)
                goto LABEL_32;
              v21 = a5[9];
              v22 = v10 + v9;
              if (!v9 || (result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n();
                    if (!result)
                      return result;
                    v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v12 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v25 = 0xAAAAAAAAAAAAAAAALL;
                    v26 = -21846;
                    v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          v14 = __memcpy_chk();
                          if (v12 > 0x1068)
                            return 0;
                          result = MEMORY[0x24BDAC7A8](v14);
                          v16 = (unint64_t *)((char *)&v20 - v15);
                          v17 = 0;
                          *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v19 = &v16[v17 / 8];
                            *(_OWORD *)v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *v16 = v11;
                            if (ccrsa_import_pub())
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs())
                              return v23 != 0;
                            result = 0;
                            v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                v8 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v9 = 24 * v8;
                  v10 = __CFADD__(v9, 16);
                  v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = MEMORY[0x24BDAC7A8](result);
                    v14 = (uint64_t *)((char *)&v17 - v12);
                    v15 = 0;
                    do
                    {
                      v16 = &v14[v15 / 8];
                      *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size();
                          if (result == 256 && *(_QWORD *)(a5 + 96) == 64)
                          {
                            if (*(_QWORD *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite())
                                return HIBYTE(v17) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify())
LABEL_24:
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  int *v1;
  int *v3;
  int v5;
  int v6;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      JUMPOUT(0x212BF533CLL);
    return 0;
  }
  v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    JUMPOUT(0x212BF5348);
  v5 = *v3;
  v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v7 = v6;
  v8 = *v6;
  if (*v6 >> 61 || !is_mul_ok(8 * v8, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  v9 = 24 * v8;
  v10 = __CFADD__(v9, 16);
  v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0)
LABEL_19:
    __break(0x5500u);
  result = MEMORY[0x24BDAC7A8](v6);
  v15 = (_QWORD *)((char *)v18 - v13);
  v16 = 0;
  do
  {
    v17 = &v15[v16 / 8];
    *v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16;
  }
  while (v13 != v16);
  if (v14 < 0x10)
    goto LABEL_21;
  *v15 = v7;
  if (v13 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  result = ccec_import_pub();
  if (!(_DWORD)result)
  {
    result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4)
        return ccec_compressed_x962_export_pub();
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL))
LABEL_22:
    __break(0x550Cu);
  v8 = 24 * v7;
  v9 = __CFADD__(v8, 16);
  v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  result = MEMORY[0x24BDAC7A8](v6);
  v14 = (_QWORD *)((char *)v18 - v12);
  v15 = 0;
  do
  {
    v16 = &v14[v15 / 8];
    *v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10)
    goto LABEL_24;
  *v14 = result;
  if (v12 >= 1)
  {
    v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4)
            v17 = 0;
          else
            v17 = 393220;
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  int v4;
  int v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  int v12;
  char *v13;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  __int16 v27;
  char *v28;
  char *v29;
  unint64_t v30[3];
  __int16 v31;
  char *v32;
  unint64_t v33;
  size_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_114;
  if (&a1[a2] < a1)
    goto LABEL_112;
  v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  v27 = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010, (_BYTE *)&v27 + 1, &v26);
  result = 65537;
  if (v7)
  {
    v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26))
      goto LABEL_114;
    if (v28 > &v28[v26] || &v28[v26] > v29)
      goto LABEL_112;
    v24 = v28;
    v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24)
        goto LABEL_112;
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26))
        return 65539;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v24 += v26;
      if (!ccder_blob_decode_ber_tl((uint64_t)&v24, 0xA000000000000000, &v27, &v26))
        return 65540;
      v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v22 = v24;
      v23 = &v24[v26];
      v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, (_BYTE *)&v31 + 1, v30) & 1) == 0)
        return 131073;
      if (__CFADD__(v22, v30[0]))
        goto LABEL_114;
      v9 = 131080;
      if (&v22[v30[0]] != v23)
        return 131082;
      v10 = a3 + 11;
      if (!ccder_blob_decode_uint64())
        return 131074;
      result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, 0, 125))
          return 131075;
        v35 = 0;
        v34 = 0;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, &v35, &v34) & 1) == 0)
          return 131076;
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34))
          goto LABEL_114;
        if (v22 > &v22[v34] || &v22[v34] > v23)
          goto LABEL_112;
        v32 = v22;
        v33 = (unint64_t)&v22[v34];
        if (!ccder_blob_decode_tl())
          return 131077;
        if (v33 < (unint64_t)v32 || v34 > v33 - (unint64_t)v32)
          goto LABEL_112;
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34))
          return 131078;
        if (__CFADD__(v32, v34))
          goto LABEL_114;
        v11 = &v32[v34];
        if (v32 > &v32[v34] || (unint64_t)v11 > v33)
          goto LABEL_112;
        v32 += v34;
        v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          v40 = 0;
          v38 = (char *)v33;
          v39 = 0;
          v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39))
                goto LABEL_114;
              if (&v37[v39] != (char *)v33)
                return v9;
            }
            if (v37 > v38)
              goto LABEL_112;
            v32 = v37;
            v33 = (unint64_t)v38;
            v36 = 0;
            v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl((uint64_t)&v32, 0x2000000000000004, &v36, &v39))
              return 131079;
            v41 = 0;
            if (!ccder_blob_decode_tl())
              return 131090;
            v17 = v32;
            v18 = v33;
            if (v33 < (unint64_t)v32)
              goto LABEL_112;
            v19 = v41;
            if (v41 > v33 - (unint64_t)v32)
              goto LABEL_112;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            v20 = &v17[v19];
            if ((unint64_t)v20 > v18 || v17 > v20)
              goto LABEL_112;
            v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0)
              return 131089;
          }
          else
          {
            if (!v12)
              return v9;
            v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0)
            return 131088;
          v11 = v32;
        }
        if (v11 > v23 || v22 > v11)
          goto LABEL_112;
        v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0)
          return 131081;
        v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23)
          goto LABEL_112;
        v37 = v22;
        v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          v13 = v22;
          v15 = v23;
          goto LABEL_86;
        }
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38)
            goto LABEL_112;
          v32 = v37;
          v33 = (unint64_t)&v37[v30[0]];
          if (!CMSParseImplicitCertificateSet((unint64_t *)&v32, a3[1], *a3, a3 + 3, a3 + 2))
            return 131085;
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31))
            return 131086;
          v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32)
              goto LABEL_112;
            v15 = v38;
            if (v32 > v38)
              goto LABEL_112;
            v22 = v32;
            v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38)
                  goto LABEL_112;
                v22 = v37;
                v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, &v30[1], 125))
                return 131083;
              if (v30[2] >= v30[1])
              {
                v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0)
                    return 131084;
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27))
                    return 65541;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29)
                        return 65543;
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8;
  uint64_t result;

  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL)
      return ccder_blob_decode_ber_len(a1, a3, a4);
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (!a2)
    return 1;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return result;
  v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1])
    goto LABEL_12;
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *digest;
  int *v14;
  unsigned int v15;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  unsigned int v34;
  unint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v84 = 0xAAAAAAAAAAAAAAAALL;
  v85 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (__CFADD__(v4, v3))
    goto LABEL_93;
  if (v4 > v4 + v3)
    goto LABEL_92;
  v84 = *(_QWORD *)(a1 + 40);
  v85 = v4 + v3;
  v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    v48 = 0;
    result = 0;
    if (v3)
      return (v48 << 8) | 0x30008;
    return result;
  }
  v6 = 0;
  v60 = 0;
  v7 = 256;
  while (1)
  {
    v71 = 0;
    v82 = 0u;
    v83 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      v49 = 196609;
      return v7 | v49;
    }
    v69 = 0xAAAAAAAAAAAAAAAALL;
    v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72))
      goto LABEL_93;
    if (v84 > v84 + v72 || v84 + v72 > v85)
      goto LABEL_92;
    v69 = v84;
    v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      v49 = 196610;
      return v7 | v49;
    }
    v9 = v69;
    v8 = v70;
    v67 = 0xAAAAAAAAAAAAAAAALL;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v67 = v69;
    v68 = v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl())
      break;
    v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9))
      goto LABEL_94;
    if (v72 + v10 - v9 > v8 - v9)
      goto LABEL_92;
    *((_QWORD *)&v73 + 1) = v9;
    *(_QWORD *)&v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72))
      goto LABEL_93;
    if (v10 > v10 + v72 || v10 + v72 > v70)
      goto LABEL_92;
    v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      v49 = 196612;
      return v7 | v49;
    }
    v63 = 0xAAAAAAAAAAAAAAAALL;
    v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63)
        goto LABEL_92;
      *((_QWORD *)&v75 + 1) = v63;
      *(_QWORD *)&v76 = v72;
      if (__CFADD__(v63, v72))
        goto LABEL_93;
      if (v63 > v63 + v72 || v63 + v72 > v64)
        goto LABEL_92;
      v69 = v63 + v72;
      v70 = v64;
    }
    else
    {
      *((_QWORD *)&v75 + 1) = 0;
      *(_QWORD *)&v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69)
      goto LABEL_92;
    *((_QWORD *)&v78 + 1) = v69;
    *(_QWORD *)&v79 = v72;
    if (__CFADD__(v69, v72))
      goto LABEL_93;
    v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70)
      goto LABEL_92;
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64)
        goto LABEL_92;
      v69 = v63;
      v70 = v64;
    }
    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      v14 = digest;
      v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result)
            return result;
          v17 = *(_QWORD *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              v29 = v60 - 1;
              v30 = *(_QWORD *)(a1 + 56);
              v31 = 176 * v29;
              if (__CFADD__(v30, v31))
                goto LABEL_93;
              v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30)
                goto LABEL_92;
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    v35 = *(_QWORD *)(a1 + 56);
                    if (__CFADD__(v35, v31))
                      goto LABEL_93;
                    v36 = (_OWORD *)(v35 + 176 * v29);
                    v37 = v35 + 176 * *(_QWORD *)(a1 + 64);
                    v38 = v37 >= (unint64_t)v36;
                    v39 = v37 - (_QWORD)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0)
                      goto LABEL_92;
                    v40 = v73;
                    v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *v36 = v40;
                    v42 = v76;
                    v43 = v77;
                    v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    v45 = v80;
                    v46 = v81;
                    v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              v19 = *(_QWORD *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60))
                goto LABEL_93;
              v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0)
                goto LABEL_92;
              v21 = v73;
              v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *v20 = v21;
              v23 = v76;
              v24 = v77;
              v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              v26 = v80;
              v27 = v81;
              v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69)
      goto LABEL_92;
    v84 = v69;
    v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85)
        continue;
    }
    if (v69 == v85)
    {
      if (v60)
        return 0;
      v50 = *(_QWORD *)(a1 + 64);
      if (!v50)
        return 0;
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        v52 = v73;
        v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *v51 = v52;
        v54 = v76;
        v55 = v77;
        v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        v57 = v80;
        v58 = v81;
        v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    v10 = v67;
    v11 = v68;
LABEL_17:
    if (v10 > v11)
      goto LABEL_92;
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    v10 = v65;
    v11 = v66;
    goto LABEL_17;
  }
  v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t CertificateUsingKeyIdentifier;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = *(_QWORD *)(a3 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  if (__CFADD__(v3, v4))
LABEL_49:
    __break(0x5513u);
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_48;
  v20 = *(_QWORD *)(a3 + 8);
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a3 != 3)
  {
    if (*(_QWORD *)a3 != 1)
      return 524289;
    v8 = 524293;
    if (!ccder_blob_decode_tl())
      return 524290;
    if (!ccder_blob_decode_tl())
      return 524291;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      v15 = v20;
      v16 = v19;
      if (__CFADD__(v20, v19))
        goto LABEL_49;
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl())
          return 524292;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          v17 = v20;
          v18 = v19;
          if (__CFADD__(v20, v19))
            goto LABEL_49;
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            v9 = *(_QWORD **)(a2 + 24);
            if (!v9)
              return v8;
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              v9 = (_QWORD *)v9[34];
              if (!v9)
                return v8;
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(_QWORD *)(a2 + 88) == 1)
    return 524298;
  v15 = v3;
  v16 = v5;
  if (ccder_blob_decode_tl())
  {
    v11 = v20;
    v10 = v21;
    goto LABEL_29;
  }
  v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl())
    return v8;
  v11 = v15;
  v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  v20 = v15;
  v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11)
    goto LABEL_48;
  v17 = v11;
  v18 = v19;
  if (__CFADD__(v11, v19))
    goto LABEL_49;
  if (v11 > v11 + v19 || v11 + v19 > v10)
    goto LABEL_48;
  v20 = v11 + v19;
  CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier)
    return 524295;
  v9 = (_QWORD *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21)
    return 524543;
  v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (_QWORD *)(a3 + 152));
  v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681)
    *(_DWORD *)(a3 + 168) = v13;
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  __int128 *v6;
  int *digest;
  unint64_t *v8;
  unint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28[2];
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _OWORD v34[4];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest)
    return 327682;
  v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  v9 = v8;
  memset(v34, 0, sizeof(v34));
  v10 = (_OWORD *)a2[13];
  v11 = a2[14];
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      v10 = v34;
      v13 = ccdigest();
      v11 = *v9;
      if (*v9 >= 0x41)
        goto LABEL_55;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_31;
  }
  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40)
    goto LABEL_55;
  v13 = __memcpy_chk();
LABEL_16:
  *(_QWORD *)(a3 + 128) = v10;
  *(_QWORD *)(a3 + 136) = v11;
  v15 = (_QWORD *)(a3 + 128);
  v16 = *(_QWORD *)(a3 + 48);
  if (!v16)
  {
    result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753)
          goto LABEL_43;
        v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        v21 = *v9;
        if (*v9 > 0x40)
          goto LABEL_55;
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        result = X509CertificateCheckSignatureDigest(29, *(_QWORD *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681)
            *(_DWORD *)(a3 + 168) = result;
          result = 0;
        }
        break;
      case 524297:
        v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result)
          goto LABEL_52;
        goto LABEL_43;
    }
    goto LABEL_52;
  }
  v25 = a1;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v17 = *(_QWORD *)(a3 + 40);
  if (__CFADD__(v17, v16))
LABEL_56:
    __break(0x5513u);
  v18 = v17 + v16;
  if (v17 > v18)
    goto LABEL_55;
  v32 = *(_QWORD *)(a3 + 40);
  v33 = v18;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    result = 262156;
    goto LABEL_52;
  }
  v27 = 0x2000000000000010;
  v24 = 262146;
  v26 = 262147;
  v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    result = 262145;
    goto LABEL_52;
  }
  if (__CFADD__(v32, v31))
    goto LABEL_56;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }
  v29 = v32;
  v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31))
      goto LABEL_56;
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      result = 262150;
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *v15 = 0;
    *(_QWORD *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v7;

  v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168))
        *(_DWORD *)(a3 + 168) = v7;
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v18;
  _OWORD v19[9];
  __int128 v20;
  __int128 v21;
  unint64_t v22[2];
  __int128 v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD v28[3];
  uint64_t v29;
  _QWORD v30[2];
  _BYTE __b[1216];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  v26 = 0;
  v25 = 0;
  v23 = 0u;
  v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v27 = v19;
  *(_QWORD *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0)
    goto LABEL_19;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result)
    return result;
  if (!a4)
    goto LABEL_7;
  result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0)
    return result;
  if (a4 < 0)
LABEL_19:
    __break(0x5519u);
  *((_QWORD *)&v28[0] + 1) = a3;
  *(_QWORD *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7)
        result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            v18 = *(_QWORD *)&v28[1];
            if (*(_QWORD *)&v28[1])
            {
              if (*((_QWORD *)&v28[0] + 1))
              {
                *a8 = *((_QWORD *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = 0;
  v9[0] = 0;
  v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;

  *a2 = 0;
  v3 = *(unsigned __int8 **)result;
  if (!*(_QWORD *)result)
    return 0;
  v4 = *(_QWORD *)(result + 8);
  if ((unint64_t)v3 >= v4)
    return 0;
  if (v3 == (unsigned __int8 *)-1)
    goto LABEL_42;
  v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }
  *(_QWORD *)result = v5;
  v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        v7 = v4 - (_QWORD)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 1)
          return 0;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        v8 = v3 + 2;
        if (v5 > v8 || (unint64_t)v8 > v4)
          goto LABEL_41;
        *(_QWORD *)result = v8;
        v7 = *v5;
        v5 = v8;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 2)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        v9 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = (unint64_t)v3[1] << 8;
        v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 3)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL)
          goto LABEL_42;
        v9 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        v11 = v3[3];
LABEL_40:
        v7 = v10 | v11;
        *(_QWORD *)result = v9;
        v5 = v9;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7)
    return 0;
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t **v19;
  unint64_t **v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v25;
  unint64_t **v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a1;
  v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  v30 = *a1;
  v31 = v6;
  v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    v12 = 0;
LABEL_8:
    if (a5)
      *a5 = v12;
    return 1;
  }
  else
  {
    v12 = 0;
    v13 = 304 * a3;
    v14 = a2 + 304 * a3;
    v25 = ~a2;
    v27 = (unint64_t **)(a4 + 1);
    v23 = (unint64_t *)(a2 + 272);
    v15 = a2;
    while (1)
    {
      v29 = 0;
      if (!ccder_blob_decode_tag())
        return 0;
      if (!v32)
        goto LABEL_8;
      if (!ccder_blob_decode_ber_len((uint64_t)&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010)
        return 0;
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25)
        goto LABEL_44;
      if (v15 > v14)
        goto LABEL_43;
      if (v15 < a2)
        goto LABEL_43;
      v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16)
        goto LABEL_43;
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        *(_QWORD *)(v15 + 272) = 0;
        v17 = *v27;
        *(_QWORD *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *v17 = v15;
        *v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        v18 = *a4;
        *v23 = *a4;
        v19 = (unint64_t **)(v18 + 280);
        v7 = v18 == 0;
        v20 = v27;
        if (!v7)
          v20 = v19;
        *v20 = v23;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *a4 = v15;
        *(_QWORD *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, &v30, 0, 0))
        return 0;
      if (v6 < v5)
        goto LABEL_43;
      v21 = v30;
      v22 = v30 - v5;
      if (v30 - v5 > v6 - v5)
        goto LABEL_43;
      if (v15 + 304 > v14)
        goto LABEL_43;
      *(_QWORD *)v15 = v5;
      *(_QWORD *)(v15 + 8) = v22;
      v6 = v31;
      if (v21 > v31)
        goto LABEL_43;
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304;
        v5 = v21;
        if (v12 < a3)
          continue;
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8 && v14 == a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0)
      return 0;
    if (a3)
    {
      v10 = a1[1];
      if (*a1 > v10)
        goto LABEL_18;
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!(_DWORD)result)
          return result;
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }
      return 0;
    }
    v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(_QWORD *a1)
{
  if (*a1 > a1[1])
    goto LABEL_6;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return 0;
  if (*a1 > a1[1])
LABEL_6:
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  int v8;
  int v9;
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

  result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v11 = *a1;
    v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v11;
      if (v16 < v11)
        goto LABEL_42;
      *a3 = v11;
      a3[1] = 0;
      v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v12 = *a1;
    v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v12;
      if (v17 < v12)
        goto LABEL_42;
      *a3 = v12;
      a3[1] = 0;
      v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v13 = *a1;
    v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v13;
      if (v18 < v13)
        goto LABEL_42;
      *a3 = v13;
      a3[1] = 0;
      v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v14 = *a1;
    v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v14;
      if (v19 < v14)
        goto LABEL_42;
      *a3 = v14;
      a3[1] = 0;
      v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v15 = *a1;
    v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v15;
      if (v20 < v15)
        goto LABEL_42;
      *a3 = v15;
      a3[1] = 0;
      v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10[2];
  _OWORD v11[15];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_11;
  v10[0] = a1;
  v10[1] = a1 + a2;
  result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    result = 720914;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = v13;
      if ((_QWORD)v13)
      {
        result = 0;
        if (a5)
        {
          if (a6)
          {
            result = 0;
            *a5 = *((_QWORD *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  unint64_t v7[2];
  _OWORD v8[19];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_7;
  v7[0] = a1;
  v7[1] = a1 + a2;
  result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result)
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v25;
  int v26;
  unint64_t v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33[4];
  _QWORD __b[154];

  __b[152] = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_34;
  if (a1 + a2 < a1)
    goto LABEL_35;
  v30 = a1;
  v31 = a1 + a2;
  result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if ((_DWORD)result)
    return result;
  result = 327690;
  if (v30 != v31)
    return result;
  if (v32 != 2)
    return 327692;
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *v22 = (uint64_t)&__b[74];
  if ((_QWORD *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL)
LABEL_34:
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(_QWORD *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if ((_DWORD)result)
    return result;
  v23 = **(_QWORD **)(v33[1] + 8);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0)
    goto LABEL_35;
  v28 = a3;
  v29 = a4;
  v24 = (__int128 *)oidForPubKeyLength();
  result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, v24, v23 + 16, (__int128 *)(v23 + 40), (__int128 *)(v23 + 56));
  if ((_DWORD)result)
    return result;
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0)
      goto LABEL_35;
    if (compare_octet_string_raw(v23 + 248, a9, a10))
      return 590085;
  }
  v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  v26 = result;
  if ((_DWORD)result)
    result = result;
  else
    result = 327691;
  if (!v25 || v26)
    return result;
  if (a11)
    *a11 = (*(_QWORD *)(v25 + 240) & a13) != 0;
  if (!a7 || !a8)
    return 0;
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304)
    goto LABEL_35;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result)
    return result;
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, _QWORD *a7, _QWORD *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_2128CFEE2 && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_2128CFEE2 || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[117];

  v41[116] = *MEMORY[0x24BDAC8D0];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyBAASystem);
}

unint64_t CTEvaluateBAASystemWithId(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAASepApp(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASepApp);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

uint64_t CTEvaluateBAA(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, uint64_t a10)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2:
      result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3:
      result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4:
      result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      result = 327712;
      break;
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0, &v12, X509PolicyMFi4Attestation);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }
  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASystemRootSPKI))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BAUserRootSPKI))
    return 2;
  if (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&MFi4RootSpki))
    return 4 * (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASepAppRootSPKI) == 0);
  return 3;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASystemRootSKID))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BAUserRootSKID))
    return 2;
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&MFi4RootSKID))
    return 4 * (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASepAppRootSKID) == 0);
  return 3;
}

uint64_t CTEvaluateDAK(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  _BYTE *v14;
  int v15;
  unint64_t v16[2];
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[19];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1 + a2;
  if (a1 + a2 < a1)
    goto LABEL_31;
  result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    return result;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  if (__CFADD__(a1, a2))
    goto LABEL_32;
  v16[0] = a1;
  v16[1] = v7;
  result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0])
      return 327691;
    v25 = 0;
    v26 = 0;
    result = CTParseExtensionValue(*(_QWORD *)v18[0], *(_QWORD *)(v18[0] + 8), &CTOidAppleFDRIdentity, 9uLL, &v25, &v26);
    if (!(_DWORD)result)
    {
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26)
          goto LABEL_31;
        v23 = v25;
        v24 = v25 + v26;
        v22 = v26;
        result = ccder_blob_decode_tl();
        if (!(_DWORD)result)
          return 720929;
        if (v24 < v23)
          goto LABEL_31;
        v13 = v22;
        if (v22 > v24 - v23)
          goto LABEL_31;
        v25 = v23;
        v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if ((unint64_t)v14 < v23)
                goto LABEL_31;
              if (*v14 == 45)
                goto LABEL_19;
              ++v14;
              --v13;
            }
            while (v13);
            v14 = (_BYTE *)(v23 + v22);
          }
LABEL_19:
          if (v14 != (_BYTE *)-1)
          {
            if ((unint64_t)(v14 + 1) >= v23 + v22)
              return 327711;
            if (v23 <= (unint64_t)(v14 + 1))
            {
              v21[0] = v14 + 1;
              v21[1] = v23 + v22;
              v19 = 0;
              v20 = 0;
              v15 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v20);
              result = 327697;
              if (!v15 && !HIDWORD(v20))
              {
                if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v19))
                {
                  return 327698;
                }
                else
                {
                  result = 0;
                  if (a7)
                  {
                    *(_DWORD *)a7 = v20;
                    *(_QWORD *)(a7 + 8) = v19;
                  }
                }
              }
              return result;
            }
LABEL_31:
            __break(0x5519u);
          }
        }
      }
LABEL_32:
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = result;
  if (!result || (result = *(_QWORD *)(result + 240)) == 0)
  {
    v3 = v1 + 136;
    v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(_QWORD *)(v3 + 8) != 15 || v2 == 0)
      return 0;
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170)
        return 0;
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170)
          return 0;
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170)
                return 0x8000000;
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char **a5, unint64_t *a6, uint64_t *a7)
{
  char *v14;
  uint64_t result;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36[4];
  unint64_t v37;
  unint64_t v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[1216];
  _QWORD v47[2];

  v47[0] = *MEMORY[0x24BDAC8D0];
  bzero(v46, 0x4C0uLL);
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  v14 = &a1[a2];
  v37 = 0;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if ((_DWORD)result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2))
      goto LABEL_65;
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if ((_DWORD)result)
      return result;
    if (v36[0] != v36[1])
      return 327690;
  }
  else
  {
    v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      v20 = 0;
      v17 = 0;
      v16 = v46;
      goto LABEL_19;
    }
    v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    v17 = 0;
    v16 = v46;
    v20 = 1;
    v19 = 1;
    goto LABEL_20;
  }
  v16 = v46;
  if (!v37)
  {
    v20 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  v16 = &v46[v17];
  v18 = v37 - 2;
  if (v37 < 2)
  {
    v20 = 0;
LABEL_19:
    v18 = -1;
    v19 = -1;
    goto LABEL_20;
  }
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    v21 = v20 ^ 1;
    if (v18 < 0)
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v27 = 0;
      v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= v47 || v22 < (unint64_t *)v46)
      goto LABEL_63;
    v23 = 304 * (int)v19;
    if (v23 > 0x4BF)
      goto LABEL_64;
    v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0)
      goto LABEL_64;
    v25 = *v22;
    if (v19 <= v18)
    {
      v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= (_BYTE *)v47 || &v46[v24 - 8] < v46)
          goto LABEL_63;
        if (v24 > 0x4C0)
          goto LABEL_64;
        v29 = *(_QWORD *)&v46[v24];
        v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30)
          break;
        v31 = v19 + 1;
        if (__OFADD__(v19, 1))
          break;
        v24 += 304;
        ++v19;
        if (v31 > v18)
          goto LABEL_41;
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    v26 = 0;
LABEL_41:
    v32 = v25 - (_QWORD)a1;
    v33 = v25 >= (unint64_t)a1;
    v34 = v25 < (unint64_t)a1;
    if (v32 < 0)
      v33 = v34;
    if (v33)
    {
      v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27)
        goto LABEL_63;
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= (_BYTE *)v47 || v16 < v46)
      goto LABEL_63;
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= (_BYTE *)v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        result = 0;
        v35 = *((_QWORD *)v16 + 1);
        *a3 = *(_QWORD *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  char v35;
  char v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42[2];
  unint64_t v43[4];
  unint64_t v44;
  unint64_t v45;
  unint64_t v46[4];
  unint64_t *v47;
  uint64_t *v48;
  _BYTE v49[272];
  uint64_t v50;
  unint64_t v51[34];
  _QWORD v52[4];
  unint64_t v53[11];
  unint64_t v54[19];
  uint64_t v55;
  _QWORD v56[44];

  v56[42] = *MEMORY[0x24BDAC8D0];
  bzero(v51, 0x390uLL);
  v47 = 0;
  v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2))
    goto LABEL_56;
  if (a1 + a2 < a1)
    goto LABEL_57;
  v46[0] = a1;
  v46[1] = a1 + a2;
  result = X509CertificateParse(v51, v46);
  if ((_DWORD)result)
    return result;
  v20 = (uint64_t)v47;
  v21 = &v48;
  if (v47)
    v21 = (uint64_t **)(v47 + 35);
  *v21 = v52;
  v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6))
    goto LABEL_56;
  if (a5 + a6 < a5)
    goto LABEL_57;
  v44 = a5;
  v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL)
    goto LABEL_56;
  result = X509CertificateParse(v53, &v44);
  if ((_DWORD)result)
    return result;
  v56[0] = 0;
  v56[1] = v48;
  *v48 = (uint64_t)v53;
  v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if ((_DWORD)result)
      return result;
    v26 = 0;
    v27 = 0;
    v28 = 28;
    result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          v29 = 0;
          if (a7 != 4)
            return result;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        v26 = 0;
        v29 = 0;
        v28 = 29;
        v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000)
        return result;
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          if (a7 != 0x1000000000)
            return result;
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000)
          return result;
        v27 = 0;
        v29 = 0;
        v26 = 3;
        goto LABEL_44;
      }
      v27 = 1;
    }
    v29 = v27;
    v26 = 2;
    v27 = 0;
LABEL_44:
    if (!v55)
      v55 = a7;
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    v32 = v26;
    v33 = a7;
    v37 = -1431655766;
    v38 = v43;
    v34 = 0;
    v35 = v29;
    v36 = v27;
    v39 = &v43[2];
    v40 = v42;
    v41 = 0;
    result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!(_DWORD)result)
    {
      v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (result = X509CertificateParseKey(v46[2], a8, a9), !(_DWORD)result))
      {
        result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            result = 0;
            v31 = *(_QWORD *)(v30 + 256);
            *a10 = *(_QWORD *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3)
    goto LABEL_57;
  v32 = a3;
  v33 = a3 + a4;
  if (a3 + a4 <= a3)
    goto LABEL_22;
  v22 = 0;
  v23 = &v50;
  while (1)
  {
    result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if ((_DWORD)result)
      return result;
    v24 = v48;
    *v23 = 0;
    v23[1] = (uint64_t)v24;
    *v24 = (uint64_t)(v23 - 34);
    v48 = v23;
    v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25)
      goto LABEL_22;
  }
}

uint64_t CTEvaluatePragueSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_2128CFFA0;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_2128CFFB0;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  result = 327700;
  v4 = a1[31];
  v5 = a1[32];
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 327707;
  v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0)
      return result;
    if (!__CFADD__(v4, v5))
    {
      v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13)
          return 327704;
        v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          v10 = 0;
          v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6)
              return 327705;
            if (v17 == 20)
              break;
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14)
              goto LABEL_39;
            v19 = (v18 - 48);
            v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20))
              goto LABEL_40;
            v21 = v19 * v20;
            v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15)
              goto LABEL_38;
            ++v17;
            if ((unint64_t)--v16 < v4)
              goto LABEL_23;
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5))
    goto LABEL_41;
  v8 = v4 + v5;
  if (v4 + v5 == -1)
    goto LABEL_41;
  v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    v12 = 0;
    v13 = 0;
    v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      v14 = (unint64_t)(*v9 & 0x7F) << v12;
      v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15)
        goto LABEL_38;
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4)
          continue;
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  v10 = 0;
LABEL_23:
  if (v10 == a2)
    return 0;
  else
    return 589829;
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[2];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 327702;
  if (*(_QWORD *)(a1 + 232) && *(_QWORD *)(a1 + 224))
  {
    v7[1] = a3;
    v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(_QWORD, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8)
      v5 = 0;
    else
      v5 = 327706;
    if (v4)
      return v4;
    else
      return v5;
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, _QWORD *a2, unint64_t a3)
{
  char *v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  BOOL v9;
  int v11;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  size_t v22;
  size_t v23;

  if ((_DWORD)result != 2)
    return 1;
  v4 = *(char **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v6 = ~*(_QWORD *)a3;
  if (v5 > v6)
    goto LABEL_50;
  v7 = &v4[v5];
  if (&v4[v5] == (char *)-1)
    goto LABEL_50;
  v8 = v7 - 1;
  if (v7)
    v9 = v8 >= v4;
  else
    v9 = 0;
  if (!v9 || a3 + 24 < a3)
    goto LABEL_49;
  v11 = *v8;
  result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result)
    goto LABEL_48;
  if (v11 != 46)
    goto LABEL_15;
  v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        v13 = a2[1];
        if (v13 < 3)
          return 1;
        v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42)
          return 1;
        if (v14 != (_BYTE *)-1)
        {
          v15 = v14 + 1;
          if (v14[1] == 46)
          {
            v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
              v16 = (uint64_t)v14;
            v17 = -v16;
            v18 = 2;
            result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14)
                goto LABEL_49;
              if (v14[v18] == 46)
              {
                if (v13 == v18)
                  return 1;
                v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4)
                      goto LABEL_49;
                    if (*v20 == 46)
                      break;
                    if (v5 == ++v19)
                    {
                      v19 = v5;
                      break;
                    }
                  }
                }
                v22 = v13 - 1;
                v9 = v5 >= v19;
                v23 = v5 - v19;
                if (!v9)
                  goto LABEL_51;
                if (v22 == v23)
                {
                  if (v19 > v6)
                    goto LABEL_50;
                  result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result)
                    goto LABEL_48;
                }
                if (v11 != 46)
                  return 1;
                if (!v23)
                  goto LABEL_51;
                if (v22 != v23 - 1)
                  return 1;
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22))
                    goto LABEL_48;
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18)
                return result;
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      result = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t result;
  __int128 v13;
  unint64_t v14[2];
  _QWORD v15[3];
  _OWORD v16[19];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  _UNKNOWN **v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAA00AAAA01;
  v21 = &null_octet;
  v19 = xmmword_2128CFFC0;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  v22 = &null_octet;
  v23 = &null_octet;
  v24 = &CTOctetServerAuthEKU;
  v17 = 0;
  v18 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!(_DWORD)result)
      {
        result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result)
          return CTVerifyHostname((uint64_t)v16, a3, a4);
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;

  v5 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  if (__CFADD__(*(_QWORD *)result, v4))
    goto LABEL_31;
  v6 = v5 + v4;
  v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6)
        continue;
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1)
    goto LABEL_31;
  v8 = v7 + 1;
  v3 = 327693;
  result = 327693;
  if ((unint64_t)(v7 + 1) >= v6)
    return result;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (_QWORD)v8))
    goto LABEL_31;
  if (v6 - (_QWORD)v8 != 2 * a3)
    return (v3 + 1);
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  v9 = v7 + 2;
  v10 = a2;
  while (1)
  {
    result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3])
      return result;
    v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8)
      goto LABEL_34;
    v12 = &asciiNibbleToByte[*v11];
    result = (uint64_t)byte_2128CFEE2;
    if (v12 >= byte_2128CFEE2 || v12 < asciiNibbleToByte)
      goto LABEL_34;
    if (v11 < v7)
      goto LABEL_34;
    v14 = &asciiNibbleToByte[*v9];
    result = (uint64_t)byte_2128CFEE2;
    if (v14 >= byte_2128CFEE2 || v14 < asciiNibbleToByte)
      goto LABEL_34;
    v15 = *v12;
    result = 327695;
    if (v15 > 0xF)
      return result;
    v16 = *v14;
    if (v16 > 0xF)
      return result;
    if (v10 < a2)
      goto LABEL_34;
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9)
      goto LABEL_31;
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
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
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return X509ExtensionParseGenericSSLMarker();
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = der_get_BOOLean((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
    goto LABEL_31;
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_30;
  v10 = 655361;
  v14 = *a1;
  v15 = v6;
  if (!ccder_blob_decode_tl())
    return v10;
  if (!ccder_blob_decode_tl())
    return 655363;
  if (v14 >= 0x5555555555555556)
LABEL_31:
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15)
    goto LABEL_30;
  v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl())
    return 655362;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13)
    goto LABEL_30;
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13)
    goto LABEL_30;
  if (!ccder_blob_decode_bitstring())
    return 655364;
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15)
    return 0;
  else
    return 655365;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t matched;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)matched)
    return matched;
  matched = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return matched;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(_QWORD, int *, uint64_t), uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v9[5];
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_11;
  v10 = *(_QWORD *)(a1 + 224);
  v11 = v5;
  while (1)
  {
    if (v10 >= v11)
      return 0;
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0)
      break;
    if ((a2(v9[0], &v9[1], a3) & 1) == 0)
      return 0;
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *a1;
  v3 = a1[1];
  v20 = v3;
  if (__CFADD__(*a1, v3))
    goto LABEL_59;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  v6 = 720901;
  v18 = *a1;
  v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20)
        return 720898;
      v2 = v18;
      if (__CFADD__(v18, v20))
        break;
      v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19)
        goto LABEL_58;
      v16 = v18;
      v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl())
          return 720899;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20 || v16 + v20 > v17)
          goto LABEL_58;
        v15 = v16 + v20;
        if (!ccder_blob_decode_tl())
          return 720900;
        v2 = v16 + v20;
        if (v16 > v15)
          goto LABEL_58;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20)
          goto LABEL_58;
        v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          v12 = v16 + v20;
          v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15)
              goto LABEL_58;
            v12 = v16 + v20;
            v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15)
                goto LABEL_58;
              v12 = v16 + v20;
              v13 = v16 + v20;
              if (!ccder_blob_decode_tl())
                return v6;
            }
          }
          if (__CFADD__(v12, v20))
            goto LABEL_59;
          v2 = v12 + v20;
          if (v15 != v12 + v20)
            return 720902;
          if (v13 < v12 || v20 > v13 - v12)
            goto LABEL_58;
          *a2 = v12;
          a2[1] = v20;
        }
        v7 = v18 + v20;
        if (v2 > v17 || v16 > v2)
          goto LABEL_58;
        v16 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v19;
      if (v2 > v19 || v18 > v2)
        goto LABEL_58;
      v18 = v2;
      if (v2 >= v19)
        goto LABEL_46;
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6[2];

  result = 0;
  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = 720906;
  if (!result)
    return v1;
  v2 = *(_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 80);
  if (!v2 || v3 == 0)
    return v1;
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(_QWORD *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6))
        return 720907;
      if (ccder_blob_decode_Time(v6))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t BAARootUsingKeyIdentifier;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1))
            return 0;
          BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (BAARootUsingKeyIdentifier)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (int *)&BAARoots; i < digests && i >= (int *)&BAARoots; i += 2)
    {
      v5 = *(_QWORD *)i;
      result = compare_octet_string(v2, *(_QWORD *)i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t AppleRootUsingKeyIdentifier;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[5];

  v6 = a2;
  v35[4] = *MEMORY[0x24BDAC8D0];
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), v25 + 16, (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

void _UpdateMFi4FeatureKeyAttributes_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_212836000, a2, OS_LOG_TYPE_DEBUG, "new attribute dictionary %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void MFAACreateCertificateCache_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_212836000, MEMORY[0x24BDACB70], v0, "pCertCacheDomainList:%04X, pCertCacheStruct:%04X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAACreateCertificateCache_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_212836000, MEMORY[0x24BDACB70], a3, "Bad parameter pkStrCacheDomain:%04X, pkCacheNamePrefix:%04X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void MFAACreateCertificateCache_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "malloc pCertCacheStruct:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void SyncCertCacheContentsToPreferencesFile_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFPreferencesSynchronize fail bPrefSyncOkay:false\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAADeallocCertificateCache_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pkCacheObject:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAADeallocCertificateCache_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pCertCacheDomainList:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCertDataFromSerialNumber_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bypass due to pkCacheState:%04X, pkStrSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAAAddCertDataEntryToCacheForSerialNumber_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bypass due to pkCacheState:%04X, pkCertData:%04X, pCFStrSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_11();
}

void IncrementCertEntryUsageCount_cold_1(__int16 a1, uint8_t *buf, uint64_t a3)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 & 0xFFF;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "CFDictionaryGetValue pValueArrayMut:%04X, cfArrayCnt:%02lX\n", buf, 0x12u);
}

void IncrementCertEntryUsageCount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bypass due to pkCacheState:%04X, pCFHashSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAARemoveCertDataEntryFromCache_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "Parameter failed pkCacheState:%04X, pkStrSerNum:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAACreateMatchingHashForCertChainFromHashLSB_cold_1()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  uint8_t v3[14];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v4 = 2112;
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bypass due to pkCacheState:%04X, pkCertHashLSBStr:%04X (%@), bCertNotCached:%d\n", v3, 0x1Eu);
  OUTLINED_FUNCTION_11();
}

void MFAACreateCertChainDataFromHash_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bypass due to pkCacheState:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAAAddCertChainDataEntryToCacheForHash_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bypass due to pkCacheState:%04X, pkCertChain:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_11();
}

void MFAARemoveCertChainDataEntryFromCache_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_212836000, MEMORY[0x24BDACB70], v0, "Parameter failed pkCacheState:%04X, pkCertHashStr:%04X, bCertNotCached:%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAACreateSerialNumberDataFromString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pCFStrSerNum:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateSerialNumberDataFromString_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFStringGetCString failed to convert to c-string\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateSerialNumberDataFromString_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDataCreate returned NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateSerialNumberDataFromString_cold_4(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "pCFStrSerNum strLen = %d is invalid\n", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCapsFromAuthCert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Object allocation failed pAccCaps = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCapsFromAuthCert_cold_2()
{
  _DWORD v0[2];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 67109120;
  v0[1] = 0;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "GetAccessoryCaps failed bStatus:%d\n", (uint8_t *)v0, 8u);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCapsFromAuthCert_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pCFCertData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCapsFromAuthCert_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference pSecCertRef = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCapsFromAuthCert_cold_5(unsigned __int16 a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109376;
  v2[1] = a2;
  v3 = 2048;
  v4 = a1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unrecognized/unsupported authVerMajor:%02X (pSecCertRef:%04lX)\n", (uint8_t *)v2, 0x12u);
}

void MFAACreateCapsFromAuthCert_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "No AuthV3 Caps found in cert !\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAADeallocAuthCertCaps_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pkCertCaps = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void logObjectForModule_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAAVerifyPublicCertificate_cold_1(uint64_t a1, char a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = 136315906;
  v3 = "MFAAVerifyPublicCertificate";
  v4 = 1024;
  v5 = 81;
  v6 = 2112;
  v7 = a1;
  v8 = 1024;
  v9 = a2 & 1;
  _os_log_debug_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData %@, bValidCert %d", (uint8_t *)&v2, 0x22u);
}

void MFAAVerifyPublicCertificate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Invalid parameter pkCertData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyPublicCertificate_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Failed copyEvaluatedCertificateChainInfo! \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyPublicCertificate_cold_4()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_2_1();
  *(_DWORD *)&v1[7] = 52;
  v1[9] = 2112;
  v2 = v0;
  _os_log_debug_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d pkCertData %@", (uint8_t *)v1, 0x1Cu);
}

void MFAAVerifyPublicCertificateChain_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecPolicyCreate pSecPolicyRef = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyPublicCertificateChain_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pArrayAccCert = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyPublicCertificateChain_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyPublicCertificateChain_cold_5(int *a1)
{
  int v1;
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2[0] = 67109632;
  v2[1] = 4;
  v3 = 1024;
  v4 = 1;
  v5 = 1024;
  v6 = v1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n", (uint8_t *)v2, 0x14u);
  OUTLINED_FUNCTION_2();
}

void MFAAVerifyPublicCertificateChain_cold_6(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SecTrustEvaluate failed osStatus:%02X\n", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyCertificateSerialNumber_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "%s:%d pkCertData = NULL!!", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void MFAAVerifyCertificateSerialNumber_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "%s:%d certInfo = NULL!!", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void MFAAVerifyNonceSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pkCertData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyNonceSignature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pkNonceData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyNonceSignature_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pkSignatureData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAVerifyNonceSignature_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Failed to parse certData!\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCertificateSerialNumber_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pkCertData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateCertificateSerialNumber_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "pkSerNumData == NULL!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateRandomNonce_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFDataCreate fail pRandomNonce = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateSecurityCertificateReference_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAACreateSecurityCertificateReference: Could not parse certData!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CFArrayCreateMutable pArrayAnchorCA = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Unsupported authVerMajor:%02X\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kAuth3ECSSubCADev0) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kAuth3ECSSubCASimu) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kiPodAccessoryTestCAProto) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kAuth3ECSSubCAProd) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kAuth3ECSSubCADev) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kiPodAccessoryTestAuth3CA) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kCertDER_Mfi4_Root_Test) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateAnchorCertificateAuthorityArray_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateSecurityCertificateReference(kCertDER_Mfi4_Root) pSecCertRef:NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACertificateAuthV2Class_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "CreateCertificateSerialNumber pkCertSerNum = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACertificateAuthV2Class_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "Cert serial number pkSerNumBytes:%04lX, serNumLen:%02lX\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAAPrintCertSerialNumberBytes_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Certificate serial number: [%s]\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void MFAAPrintCertSerialNumberBytes_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "sprintf fail status:%02X\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAPrintCertSerialNumberBytes_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_1(&dword_212836000, MEMORY[0x24BDACB70], v0, "Bad parameter(s) pkSerNumBytes:%04lX, serNumLen:%02lX\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MFAADeviceIdentityRequestCertificate_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "MFAADeviceIdentityRequestCertificate";
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: !framework", (uint8_t *)&v0, 0xCu);
}

void MFAADeviceIdentityRequestCertificate_cold_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315394;
  v5 = "MFAADeviceIdentityRequestCertificate";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_1(&dword_212836000, MEMORY[0x24BDACB70], a3, "%s: Failed to create access control! error %@", (uint8_t *)&v4);
}

void MFAADeviceIdentityRequestCertificate_cold_3(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t v4;
  uint8_t *v5;

  *a2 = 136315394;
  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, (uint64_t)"MFAADeviceIdentityRequestCertificate");
  OUTLINED_FUNCTION_0_1(&dword_212836000, MEMORY[0x24BDACB70], v4, "%s: Failed to obtain valid certificates from server: %s\n", v5);

}

void MFAADeviceIdentityRequestCertificate_cold_4(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t v4;
  uint8_t *v5;

  *a2 = 136315394;
  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, (uint64_t)"MFAADeviceIdentityRequestCertificate");
  OUTLINED_FUNCTION_0_1(&dword_212836000, MEMORY[0x24BDACB70], v4, "%s: error: %s\n", v5);

}

void MFAADeviceIdentityRequestCertificate_cold_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = 136315650;
  v4 = "MFAADeviceIdentityRequestCertificate";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = v2;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed to set ACL protection to %@! error %@", (uint8_t *)&v3, 0x20u);
}

void MFAAUpdateDataSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pAuthSignCtx = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAAFinalizeDataSignature_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported authDataType:%02X\n", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_2_0();
}

void GetConnectionToAuthDaemon_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Auth daemon connection gAuthdXPCConnection = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateDeviceNonceSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "Parameter pkNonceData = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateDeviceNonceSignature_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "SecKeyCreateWithSecureKeyVaultID(IAPPrivateKey) pSecKeyRef = NULL\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void MFAACreateDeviceNonceSignature_cold_3(int a1, uint64_t a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 2048;
  v4 = a2;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SecKeyRawSign returned error: %d, segSignatureLen: %zu\n", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

void MFAACreateDeviceNonceSignature_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_212836000, MEMORY[0x24BDACB70], a3, "Invalid nonce pkNonceBytes:%04lX, nonceLen:%02lX\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void _storeRefreshStateToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAADeviceIdentity: _storeRefreshStateToDisk: !refreshStateArray\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void _copyCertificateForIndex_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "_copyCertificateForIndex";
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DeviceIdentity: %s: !numberedLabel\n", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_2();
}

void MFAADeviceIdentityCreateSignature_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAADeviceIdentity: missing data argument\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void _storeUseTimeToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAADeviceIdentity: _storeUseTimeToDisk: !identityCertUseTime\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void _storeIsClassDToDisk_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212836000, MEMORY[0x24BDACB70], a3, "MFAADeviceIdentity: _storeIsClassDToDisk: !isClassDArray\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_212836000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  CFTimeInterval result;

  MEMORY[0x24BDBBDA0](theDate, otherDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
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

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x24BDE8790]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x24BDE87C8]();
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x24BDE8810]();
}

uint64_t SecCertificateCopyComponentType()
{
  return MEMORY[0x24BDE8840]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopyIssuerSequence()
{
  return MEMORY[0x24BDE8878]();
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x24BDE8880]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

uint64_t SecCertificateCopyOrganization()
{
  return MEMORY[0x24BDE88A8]();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE88E0](certificate, error);
}

uint64_t SecCertificateCopySubjectString()
{
  return MEMORY[0x24BDE88F0]();
}

uint64_t SecCertificateCopyiAPAuthCapabilities()
{
  return MEMORY[0x24BDE8900]();
}

uint64_t SecCertificateCopyiAPSWAuthCapabilities()
{
  return MEMORY[0x24BDE8908]();
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x24BDE8910]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecCertificateGetiAuthVersion()
{
  return MEMORY[0x24BDE8950]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x24BDE8978]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x24BDE8B90](key, *(_QWORD *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x24BDE8B98](key, *(_QWORD *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleBasicAttestationUser()
{
  return MEMORY[0x24BDE8BF0]();
}

uint64_t SecPolicyCreateAppleComponentCertificate()
{
  return MEMORY[0x24BDE8C00]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x24BDE8C90]();
}

uint64_t SecPolicyCreateiAPSWAuthWithExpiration()
{
  return MEMORY[0x24BDE8C98]();
}

uint64_t SecSHA256DigestCreateFromData()
{
  return MEMORY[0x24BDE8D18]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

uint64_t SecTrustIsExpiredOnly()
{
  return MEMORY[0x24BDE8E18]();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x24BDAD400]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x24BDAD438]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x24BDAD478]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x24BDAD500]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x24BDAD518]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x24BDAD568]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x24BDAD570]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x24BDAD578]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x24BDAD5A0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x24BDAD5D8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x24BDAD5F8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x24BDAD618]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x24BDAD7D0]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x24BDAD7F8]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x24BDAD818]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x24BDB0248](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

