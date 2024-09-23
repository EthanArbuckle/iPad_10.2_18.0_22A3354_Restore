void sub_216F23398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F2386C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 40) = a1;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id wc_log()
{
  if (wc_log_onceToken != -1)
    dispatch_once(&wc_log_onceToken, &__block_literal_global_2);
  return (id)wc_log___logger;
}

void sub_216F247F8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_216F24C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(v23);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_216F25058(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_216F251A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x20u);
}

id WCCompactStringFromCollection(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "conformsToProtocol:", &unk_254E5D3E0);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("((){4})|\\\\+n|\n"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_24D662AF0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\\""), CFSTR("\""));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __wc_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.wcd", "WC");
  v1 = (void *)wc_log___logger;
  wc_log___logger = (uint64_t)v0;

}

uint64_t WCDProtoUserInfoTransferReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t LZ4_versionNumber()
{
  return 10700;
}

uint64_t LZ4_compressBound(unsigned int a1)
{
  if (a1 <= 0x7E000000)
    return a1 + a1 / 0xFF + 16;
  else
    return 0;
}

uint64_t LZ4_sizeofState()
{
  return 16416;
}

uint64_t LZ4_compress_fast_extState(void *a1, char *a2, _BYTE *a3, int a4, signed int a5, int a6)
{
  int v12;
  signed int v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v22;

  bzero(a1, 0x4020uLL);
  if (a6 <= 1)
    v12 = 1;
  else
    v12 = a6;
  v13 = a4 + a4 / 0xFFu + 16;
  if (a4 > 0x7E000000)
    v13 = 0;
  if (v13 <= a5)
  {
    if (a4 <= 65546)
    {
      LODWORD(v22) = 0;
      HIDWORD(v22) = v12;
      v14 = (uint64_t)a1;
      v15 = a2;
      v16 = a3;
      v17 = a4;
      v18 = 0;
      v19 = 0;
      goto LABEL_11;
    }
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    v14 = (uint64_t)a1;
    v15 = a2;
    v16 = a3;
    v17 = a4;
    v18 = 0;
    v19 = 0;
LABEL_14:
    v20 = 1;
    return LZ4_compress_generic(v14, v15, v16, v17, v18, v19, v20, 0, v22, SHIDWORD(v22));
  }
  if (a4 > 65546)
  {
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    v14 = (uint64_t)a1;
    v15 = a2;
    v16 = a3;
    v17 = a4;
    v18 = a5;
    v19 = 1;
    goto LABEL_14;
  }
  LODWORD(v22) = 0;
  HIDWORD(v22) = v12;
  v14 = (uint64_t)a1;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = 1;
LABEL_11:
  v20 = 2;
  return LZ4_compress_generic(v14, v15, v16, v17, v18, v19, v20, 0, v22, SHIDWORD(v22));
}

void LZ4_resetStream(void *a1)
{
  bzero(a1, 0x4020uLL);
}

uint64_t LZ4_compress_generic(uint64_t a1, char *__src, _BYTE *a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8, int a9, int a10)
{
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  size_t v19;
  unint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  _BYTE *v24;
  char v25;
  char v26;
  int v27;
  unsigned int v28;
  _BYTE *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  _QWORD *v38;
  _DWORD *v39;
  uint64_t v40;
  unsigned int v41;
  _DWORD *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 *v50;
  unint64_t v51;
  unsigned __int8 *v52;
  unint64_t v53;
  unsigned int v54;
  _QWORD *v55;
  int v56;
  unsigned int v57;
  _WORD *v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v61;
  unsigned int v62;
  char v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  _BYTE *v67;
  int v68;
  unsigned int v69;
  unsigned int v70;
  char *v71;
  uint64_t v72;
  unsigned int v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  BOOL v79;
  char *v82;
  _BYTE *v83;
  char *v84;
  unint64_t v85;
  int v86;
  uint64_t v87;
  char v88;
  char *v89;
  char *v90;
  int v91;
  char *v93;
  unsigned int v94;
  _BYTE *v95;

  if (a4 > 0x7E000000)
    return 0;
  v13 = *(unsigned int *)(a1 + 16408);
  v14 = &__src[-v13];
  if (a8 == 1)
  {
    v16 = &__src[-v13];
  }
  else
  {
    v15 = __src;
    v16 = __src;
    if (a8 != 2)
      goto LABEL_7;
    v16 = __src;
  }
  v15 = &__src[-*(unsigned int *)(a1 + 0x4000)];
LABEL_7:
  v17 = *(char **)(a1 + 16392);
  if (a4 >= 0x1000B && a7 == 2)
    return 0;
  v82 = &__src[a4];
  v83 = a3;
  v18 = (unint64_t)__src;
  if (a4 >= 0xD)
  {
    v25 = a7 == 2 ? 13 : 12;
    v26 = 40 - v25;
    v27 = -1 << v25;
    v28 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)__src) >> v26) & ~v27;
    if (a7 == 2)
    {
      *(_WORD *)(a1 + 2 * v28) = (_WORD)__src - (_WORD)v15;
      v29 = a3;
    }
    else
    {
      v29 = a3;
      if (a7 == 1)
        *(_DWORD *)(a1 + 4 * v28) = (_DWORD)__src - (_DWORD)v15;
    }
    v18 = (unint64_t)__src;
    a3 = v29;
    if (a4 >= 0xE)
    {
      v31 = 0;
      v84 = &v17[v13];
      v32 = &v17[v13] - __src;
      v33 = a9;
      v34 = (unint64_t)(v82 - 12);
      v35 = ~v27;
      v36 = (a10 << 6) | 1;
      v37 = a10 & 0x3FFFFFF;
      v38 = __src + 2;
      a3 = v83;
      v18 = (unint64_t)__src;
      v85 = (unint64_t)&v83[a5];
      v89 = &__src[-v13];
      v90 = v17;
      v87 = v32;
      v88 = v26;
      v86 = ~v27;
      v91 = a8;
LABEL_28:
      v39 = (_DWORD *)(v18 + 1);
      v40 = *(_QWORD *)(v18 + 1);
      v41 = v36;
      while (1)
      {
        v42 = v39;
        v39 = v38;
        v43 = ((unint64_t)(0xCF1BBCDCBBLL * v40) >> v26) & v35;
        v40 = *v38;
        if (a7 == 1)
        {
          v44 = (unint64_t)&v15[*(unsigned int *)(a1 + 4 * v43)];
          if (v44 >= (unint64_t)__src)
            v45 = __src;
          else
            v45 = v17;
          if (v44 >= (unint64_t)__src)
            v46 = 0;
          else
            v46 = v32;
          if (a8 == 2)
          {
            v16 = v45;
            v31 = v46;
          }
          *(_DWORD *)(a1 + 4 * v43) = (_DWORD)v42 - (_DWORD)v15;
        }
        else
        {
          v44 = (unint64_t)&v15[*(unsigned __int16 *)(a1 + 2 * v43)];
          if (v44 >= (unint64_t)__src)
            v47 = __src;
          else
            v47 = v17;
          if (v44 >= (unint64_t)__src)
            v48 = 0;
          else
            v48 = v32;
          if (a8 == 2)
          {
            v16 = v47;
            v31 = v48;
          }
          if (a7 == 2)
            *(_WORD *)(a1 + 2 * v43) = (_WORD)v42 - (_WORD)v15;
        }
        if ((v33 != 1 || v44 >= (unint64_t)v14)
          && (a7 == 2 || v44 + 0xFFFF >= (unint64_t)v42)
          && *(_DWORD *)(v44 + v31) == *v42)
        {
          break;
        }
        v38 = (_QWORD *)((char *)v39 + v37);
        v37 = v41++ >> 6;
        if ((unint64_t)v38 > v34)
          goto LABEL_10;
      }
      if ((unint64_t)v42 > v18 && v44 + v31 > (unint64_t)v16)
      {
        v49 = v31 - 1;
        v50 = (unsigned __int8 *)v42 - 1;
        while (*v50 == *(unsigned __int8 *)(v44 + v49))
        {
          v51 = v44 - 1;
          v52 = v50 - 1;
          if ((unint64_t)v50 > v18)
          {
            v53 = v44 + v49;
            --v50;
            --v44;
            if (v53 > (unint64_t)v16)
              continue;
          }
          v42 = v52 + 1;
          goto LABEL_65;
        }
        v42 = v50 + 1;
      }
      v51 = v44;
LABEL_65:
      v54 = (_DWORD)v42 - v18;
      v55 = a3 + 1;
      if (!a6 || (unint64_t)v55 + v54 + v54 / 0xFFuLL + 8 <= v85)
      {
        v56 = v54 - 15;
        if (v54 < 0xF)
        {
          *a3 = 16 * v54;
        }
        else
        {
          *a3 = -16;
          if (v56 >= 255)
          {
            if (v56 >= 509)
              v56 = 509;
            v57 = (_DWORD)v42 - v18 - v56 + 239;
            v95 = a3;
            memset(v55, 255, v57 / 0xFFuLL + 1);
            a3 = v95;
            v17 = v90;
            a8 = v91;
            v55 = &v95[v57 / 0xFFuLL + 2];
            LOBYTE(v56) = (_BYTE)v42 - v18 + v57 / 0xFF - 14;
          }
          *(_BYTE *)v55 = v56;
          v55 = (_QWORD *)((char *)v55 + 1);
        }
        v58 = (_WORD *)((char *)v55 + v54);
        do
        {
          v59 = *(_QWORD *)v18;
          v18 += 8;
          *v55++ = v59;
        }
        while (v55 < (_QWORD *)v58);
        v18 = (unint64_t)v42;
        v60 = (unint64_t)(v82 - 5);
        while (1)
        {
          *v58 = v18 - v51;
          v93 = a3;
          if (a8 == 2 && v16 == v17)
          {
            if ((unint64_t)&v84[-v51 - v31 + v18] <= v60)
              v60 = (unint64_t)&v84[-v51 - v31 + v18];
            v61 = LZ4_count(v18 + 4, (_DWORD *)(v51 + v31 + 4), v60);
            v18 += v61 + 4;
            if (v18 == v60)
            {
              v62 = LZ4_count(v60, __src, (unint64_t)(v82 - 5));
              v61 += v62;
              v18 = v60 + v62;
            }
            v60 = (unint64_t)(v82 - 5);
          }
          else
          {
            v61 = LZ4_count(v18 + 4, (_DWORD *)(v51 + 4), v60);
            v18 += v61 + 4;
          }
          if (a6 && (unint64_t)v58 + (v61 >> 8) + 8 > v85)
            break;
          v63 = *v93;
          v64 = v61 - 15;
          if (v61 < 0xF)
          {
            *v93 = v63 + v61;
            a8 = v91;
            v14 = v89;
            v17 = v90;
            v32 = v87;
            v26 = v88;
            a3 = v58 + 1;
            v33 = a9;
            v34 = (unint64_t)(v82 - 12);
            v35 = v86;
          }
          else
          {
            *v93 = v63 + 15;
            if (v64 < 0x1FE)
            {
              v67 = v58 + 1;
            }
            else
            {
              v94 = v61 - 525;
              v65 = (v61 - 525) / 0x1FE;
              v66 = v65;
              memset(v58 + 1, 255, v66 * 2 + 2);
              v64 = v94 - 510 * v65;
              v60 = (unint64_t)(v82 - 5);
              v67 = &v58[v66 + 2];
            }
            a8 = v91;
            v14 = v89;
            v17 = v90;
            v32 = v87;
            v26 = v88;
            v33 = a9;
            v34 = (unint64_t)(v82 - 12);
            v35 = v86;
            if (v64 >= 0xFF)
            {
              *v67++ = -1;
              LOBYTE(v64) = v64 + 1;
            }
            *v67 = v64;
            a3 = v67 + 1;
          }
          if (v18 > v34)
            goto LABEL_10;
          v68 = v18 - 2;
          v69 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)(v18 - 2)) >> v26) & v35;
          if (a7 == 1)
          {
            *(_DWORD *)(a1 + 4 * v69) = v68 - (_DWORD)v15;
            v73 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)v18) >> v26) & v35;
            v51 = (unint64_t)&v15[*(unsigned int *)(a1 + 4 * v73)];
            if (v51 >= (unint64_t)__src)
              v74 = __src;
            else
              v74 = v17;
            if (v51 >= (unint64_t)__src)
              v75 = 0;
            else
              v75 = v32;
            if (a8 == 2)
            {
              v16 = v74;
              v31 = v75;
            }
            *(_DWORD *)(a1 + 4 * v73) = v18 - (_DWORD)v15;
          }
          else if (a7 == 2)
          {
            *(_WORD *)(a1 + 2 * v69) = v68 - (_WORD)v15;
            v70 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)v18) >> v26) & v35;
            v51 = (unint64_t)&v15[*(unsigned __int16 *)(a1 + 2 * v70)];
            if (v51 >= (unint64_t)__src)
              v71 = __src;
            else
              v71 = v17;
            if (v51 >= (unint64_t)__src)
              v72 = 0;
            else
              v72 = v32;
            if (a8 == 2)
            {
              v16 = v71;
              v31 = v72;
            }
            *(_WORD *)(a1 + 2 * v70) = v18 - (_WORD)v15;
          }
          else
          {
            v51 = (unint64_t)&v15[*(unsigned __int16 *)(a1
                                                             + 2
                                                             * (((unint64_t)(0xCF1BBCDCBBLL
                                                                                                * *(_QWORD *)v18) >> v26) & v35))];
            if (v51 >= (unint64_t)__src)
              v76 = __src;
            else
              v76 = v17;
            if (v51 >= (unint64_t)__src)
              v77 = 0;
            else
              v77 = v32;
            if (a8 == 2)
            {
              v16 = v76;
              v31 = v77;
            }
          }
          v79 = (v51 >= (unint64_t)v14 || v33 != 1) && v51 + 0xFFFF >= v18;
          if (!v79 || *(_DWORD *)(v51 + v31) != *(_DWORD *)v18)
          {
            v38 = (_QWORD *)(v18 + 2);
            v37 = a10 & 0x3FFFFFF;
            v36 = (a10 << 6) | 1;
            if (v18 + 2 <= v34)
              goto LABEL_28;
            goto LABEL_10;
          }
          *a3 = 0;
          v58 = a3 + 1;
        }
      }
      return 0;
    }
  }
LABEL_10:
  v19 = (size_t)&v82[-v18];
  if (a6)
  {
    if (a3 - v83 + v19 + (v19 + 240) / 0xFF + 1 > a5)
      return 0;
  }
  v21 = v19 - 15;
  if (v19 < 0xF)
  {
    *a3 = 16 * v19;
  }
  else
  {
    *a3 = -16;
    v22 = a3 + 1;
    if (v21 >= 0xFF)
    {
      v23 = (unint64_t)&__src[(int)a4 - v18 - 270];
      v24 = a3;
      memset(v22, 255, v23 / 0xFF + 1);
      v21 = v23 % 0xFF;
      v22 = &v24[v23 / 0xFF + 2];
    }
    *v22 = v21;
    a3 = v22;
  }
  v30 = (_DWORD)a3 + 1;
  memcpy(a3 + 1, (const void *)v18, v19);
  return (v30 + v19 - (_DWORD)v83);
}

uint64_t LZ4_compress_fast()
{
  char *v0;
  _BYTE *v1;
  int v2;
  signed int v3;
  int v4;
  _OWORD v6[1026];

  v0 = (char *)MEMORY[0x24BDAC7A8]();
  memset(v6, 0, 512);
  return LZ4_compress_fast_extState(v6, v0, v1, v2, v3, v4);
}

uint64_t LZ4_compress_default(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  _BYTE *v4;
  int v5;
  signed int v6;
  _OWORD v8[1026];

  v3 = (char *)MEMORY[0x24BDAC7A8](a1, a2, a3);
  memset(v8, 0, 512);
  return LZ4_compress_fast_extState(v8, v3, v4, v5, v6, 1);
}

uint64_t LZ4_compress_destSize()
{
  uint64_t v0;
  signed int v1;
  signed int v2;
  int *v3;
  int *v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  int v8;
  signed int v9;
  int *v10;
  int v11;
  int v12;
  _BYTE v14[16416];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (char *)v0;
  bzero(v14, 0x4020uLL);
  v8 = *v4;
  v9 = v8 + v8 / 0xFFu + 16;
  if (*v4 > 0x7E000000)
    v9 = 0;
  if (v9 <= v2)
    return LZ4_compress_fast_extState(v14, v7, v6, v8, v2, 1);
  if (v8 > 65546)
  {
    v10 = v4;
    v11 = v2;
    v12 = 1;
  }
  else
  {
    v10 = v4;
    v11 = v2;
    v12 = 2;
  }
  return LZ4_compress_destSize_generic((uint64_t)v14, v7, (unint64_t)v6, v10, v11, v12);
}

void LZ4_createStream()
{
  void *v0;

  v0 = malloc_type_calloc(8uLL, 0x804uLL, 0x237C54B7uLL);
  bzero(v0, 0x4020uLL);
}

uint64_t LZ4_freeStream(void *a1)
{
  free(a1);
  return 0;
}

uint64_t LZ4_loadDict(char *a1, char *a2, int a3)
{
  _DWORD *v6;
  uint64_t result;
  char *v8;
  char *v9;
  int v10;
  unint64_t i;
  uint64_t v12;

  v6 = a1 + 0x4000;
  if (*((_QWORD *)a1 + 2048) >= 0x40000001uLL)
    bzero(a1, 0x4020uLL);
  if (a3 > 7)
  {
    v8 = &a2[a3];
    v9 = v8 - 0x10000;
    if (a3 <= 0x10000)
      v9 = a2;
    v10 = *v6 + 0x10000;
    *((_QWORD *)a1 + 2049) = v9;
    result = ((_DWORD)v8 - (_DWORD)v9);
    v6[6] = result;
    *v6 = v10 + result;
    for (i = (unint64_t)(v8 - 8); (unint64_t)v9 <= i; v10 += 3)
    {
      v12 = *(_QWORD *)v9;
      v9 += 3;
      *(_DWORD *)&a1[4 * (((unint64_t)(0xCF1BBCDCBBLL * v12) >> 28) & 0xFFF)] = v10;
    }
  }
  else
  {
    result = 0;
    *((_QWORD *)a1 + 2049) = 0;
    v6[6] = 0;
  }
  return result;
}

uint64_t LZ4_compress_fast_continue(uint64_t a1, char *__src, _BYTE *a3, signed int a4, unsigned int a5, int a6)
{
  unsigned int *v6;
  uint64_t result;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v15;
  unint64_t v16;
  uint64_t v18;
  uint32x4_t v19;
  int v20;
  char *v21;
  _BOOL4 v23;
  signed int v24;

  v6 = (unsigned int *)(a1 + 0x4000);
  if (*(_DWORD *)(a1 + 16388))
    return 0;
  v11 = *(char **)(a1 + 16392);
  v12 = *(unsigned int *)(a1 + 16408);
  v13 = &v11[v12];
  if (&v11[v12] >= __src || (_DWORD)v12 == 0)
    v15 = __src;
  else
    v15 = &v11[v12];
  v16 = *v6;
  if (v16 > 0x80000000 || v16 > (unint64_t)v15)
  {
    v18 = 0;
    v19 = (uint32x4_t)vdupq_n_s32((int)v16 - 0x10000);
    do
    {
      *(uint32x4_t *)(a1 + v18) = vqsubq_u32(*(uint32x4_t *)(a1 + v18), v19);
      v18 += 16;
    }
    while (v18 != 0x4000);
    *v6 = 0x10000;
    LODWORD(v12) = *(_DWORD *)(a1 + 16408);
    if (v12 > 0x10000)
    {
      *(_DWORD *)(a1 + 16408) = 0x10000;
      LODWORD(v12) = 0x10000;
    }
    v11 = &v13[-v12];
    *(_QWORD *)(a1 + 16392) = v11;
    LODWORD(v16) = 0x10000;
  }
  if (a6 <= 1)
    v20 = 1;
  else
    v20 = a6;
  v21 = &__src[a4];
  if (v21 > v11 && v21 < v13)
  {
    LODWORD(v12) = (_DWORD)v13 - (_DWORD)v21;
    if (((_DWORD)v13 - (_DWORD)v21) >= 0x10000)
      LODWORD(v12) = 0x10000;
    if (v12 >= 4)
      v12 = v12;
    else
      v12 = 0;
    *(_DWORD *)(a1 + 16408) = v12;
    *(_QWORD *)(a1 + 16392) = &v13[-v12];
  }
  v23 = v12 < 0x10000 && v12 < v16;
  if (v13 == __src)
  {
    result = LZ4_compress_generic(a1, __src, a3, a4, a5, 1, 1, 1, v23, v20);
    v24 = v6[6] + a4;
  }
  else
  {
    result = LZ4_compress_generic(a1, __src, a3, a4, a5, 1, 1, 2, v23, v20);
    *(_QWORD *)(a1 + 16392) = __src;
    v24 = a4;
  }
  v6[6] = v24;
  *v6 += a4;
  return result;
}

size_t LZ4_saveDict(uint64_t a1, void *__dst, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;

  v5 = *(unsigned int *)(a1 + 16408);
  if (a3 >= v5)
    v6 = *(_DWORD *)(a1 + 16408);
  else
    v6 = a3;
  if (v6 >= 0x10000)
    v7 = 0x10000;
  else
    v7 = v6;
  memmove(__dst, (const void *)(*(_QWORD *)(a1 + 16392) + v5 - v7), v7);
  *(_QWORD *)(a1 + 16392) = __dst;
  *(_DWORD *)(a1 + 16408) = v7;
  return v7;
}

uint64_t LZ4_decompress_safe(unsigned __int8 *a1, char *__dst, int a3, int a4)
{
  unsigned __int16 *v5;
  char *v6;
  char *v7;
  char *v8;
  unsigned __int8 *v9;
  char *v10;
  char v11;
  unsigned int v12;
  size_t v13;
  unsigned int v14;
  unsigned int v15;
  char *v16;
  unsigned __int16 *v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0;
  v38 = -1;
  v39 = 0;
  v40 = xmmword_216F4B480;
  v41 = 3;
  if (a4)
  {
    v5 = (unsigned __int16 *)&a1[a3];
    v6 = &__dst[a4];
    v7 = v6 - 12;
    v8 = v6 - 8;
    v9 = a1;
    v10 = __dst;
    while (1)
    {
      v12 = *v9++;
      v11 = v12;
      v13 = (unint64_t)v12 >> 4;
      if ((_DWORD)v13 == 15)
      {
        v13 = 15;
        do
        {
          v15 = *v9++;
          v14 = v15;
          v13 += v15;
        }
        while (v9 < (unsigned __int8 *)v5 - 15 && v14 == 255);
        if ((v13 & 0x8000000000000000) != 0)
          return (~(_DWORD)v9 + (_DWORD)a1);
      }
      v16 = &v10[v13];
      v17 = (unsigned __int16 *)&v9[v13];
      if (&v10[v13] > v7 || v17 > v5 - 4)
      {
        if (v17 == v5 && v16 <= v6)
        {
          memcpy(v10, v9, v13);
          return ((_DWORD)v16 - (_DWORD)__dst);
        }
        return (~(_DWORD)v9 + (_DWORD)a1);
      }
      do
      {
        v19 = *(_QWORD *)v9;
        v9 += 8;
        *(_QWORD *)v10 = v19;
        v10 += 8;
      }
      while (v10 < v16);
      v20 = &v16[-*v17];
      v9 = (unsigned __int8 *)(v17 + 1);
      if (v20 < __dst)
        return (~(_DWORD)v9 + (_DWORD)a1);
      v21 = v11 & 0xF;
      if ((v11 & 0xF) == 0xF)
      {
        v21 = 15;
        while (v9 <= (unsigned __int8 *)v5 - 5)
        {
          v22 = *v9++;
          v21 += v22;
          if (v22 != 255)
          {
            if (v21 < 0)
              return (~(_DWORD)v9 + (_DWORD)a1);
            goto LABEL_19;
          }
        }
        return (~(_DWORD)v9 + (_DWORD)a1);
      }
LABEL_19:
      v23 = *v17;
      if (v23 <= 7)
      {
        v28 = *((_QWORD *)&v36 + v23);
        *v16 = *v20;
        v16[1] = v20[1];
        v16[2] = v20[2];
        v16[3] = v20[3];
        v29 = &v20[qword_216F4B490[v23]];
        *((_DWORD *)v16 + 1) = *(_DWORD *)v29;
        v24 = &v29[-v28];
      }
      else
      {
        v25 = *(_QWORD *)v20;
        v24 = v20 + 8;
        *(_QWORD *)v16 = v25;
      }
      v10 = &v16[v21 + 4];
      v26 = v16 + 8;
      if (v10 > v7)
      {
        if (v10 > v6 - 5)
          return (~(_DWORD)v9 + (_DWORD)a1);
        if (v26 < v8)
        {
          v30 = v16 + 8;
          v31 = (uint64_t *)v24;
          do
          {
            v32 = *v31++;
            *(_QWORD *)v30 = v32;
            v30 += 8;
          }
          while (v30 < v8);
          v24 += v8 - v26;
          v26 = v6 - 8;
        }
        while (v26 < v10)
        {
          v33 = *v24++;
          *v26++ = v33;
        }
      }
      else
      {
        do
        {
          v27 = *(_QWORD *)v24;
          v24 += 8;
          *(_QWORD *)v26 = v27;
          v26 += 8;
        }
        while (v26 < v10);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_decompress_safe_partial(unsigned __int8 *a1, char *__dst, int a3, int a4, int a5)
{
  char *v5;
  char *v6;
  unsigned __int8 *v8;
  char *v9;
  unsigned __int8 *v10;
  char *v11;
  char v12;
  unsigned int v13;
  size_t v14;
  unsigned int v15;
  unsigned int v16;
  char *v17;
  unsigned __int8 *v18;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = &__dst[a5];
  v37 = 0u;
  v38 = 0;
  v39 = -1;
  v40 = 0;
  v41 = xmmword_216F4B480;
  v42 = 3;
  if (&__dst[a4] <= v5 - 12)
    v6 = &__dst[a4];
  else
    v6 = v5 - 12;
  if (a5)
  {
    v8 = &a1[a3];
    v9 = v5 - 8;
    v10 = a1;
    v11 = __dst;
    while (1)
    {
      v13 = *v10++;
      v12 = v13;
      v14 = (unint64_t)v13 >> 4;
      if ((_DWORD)v14 == 15)
      {
        v14 = 15;
        do
        {
          v16 = *v10++;
          v15 = v16;
          v14 += v16;
        }
        while (v10 < v8 - 15 && v15 == 255);
        if ((v14 & 0x8000000000000000) != 0)
          return (~(_DWORD)v10 + (_DWORD)a1);
      }
      v17 = &v11[v14];
      v18 = &v10[v14];
      if (&v11[v14] > v6 || v18 > v8 - 8)
      {
        if (v17 <= v5 && v18 <= v8)
        {
          memcpy(v11, v10, v14);
          return ((_DWORD)v17 - (_DWORD)__dst);
        }
        return (~(_DWORD)v10 + (_DWORD)a1);
      }
      do
      {
        v20 = *(_QWORD *)v10;
        v10 += 8;
        *(_QWORD *)v11 = v20;
        v11 += 8;
      }
      while (v11 < v17);
      v21 = &v17[-*(unsigned __int16 *)v18];
      v10 = v18 + 2;
      if (v21 < __dst)
        return (~(_DWORD)v10 + (_DWORD)a1);
      v22 = v12 & 0xF;
      if ((v12 & 0xF) == 0xF)
      {
        v22 = 15;
        while (v10 <= v8 - 5)
        {
          v23 = *v10++;
          v22 += v23;
          if (v23 != 255)
          {
            if (v22 < 0)
              return (~(_DWORD)v10 + (_DWORD)a1);
            goto LABEL_22;
          }
        }
        return (~(_DWORD)v10 + (_DWORD)a1);
      }
LABEL_22:
      v24 = *(unsigned __int16 *)v18;
      if (v24 <= 7)
      {
        v29 = *((_QWORD *)&v37 + v24);
        *v17 = *v21;
        v17[1] = v21[1];
        v17[2] = v21[2];
        v17[3] = v21[3];
        v30 = &v21[qword_216F4B490[v24]];
        *((_DWORD *)v17 + 1) = *(_DWORD *)v30;
        v25 = &v30[-v29];
      }
      else
      {
        v26 = *(_QWORD *)v21;
        v25 = v21 + 8;
        *(_QWORD *)v17 = v26;
      }
      v11 = &v17[v22 + 4];
      v27 = v17 + 8;
      if (v11 > v5 - 12)
      {
        if (v11 > v5 - 5)
          return (~(_DWORD)v10 + (_DWORD)a1);
        if (v27 < v9)
        {
          v31 = v17 + 8;
          v32 = (uint64_t *)v25;
          do
          {
            v33 = *v32++;
            *(_QWORD *)v31 = v33;
            v31 += 8;
          }
          while (v31 < v9);
          v25 += v9 - v27;
          v27 = v5 - 8;
        }
        while (v27 < v11)
        {
          v34 = *v25++;
          *v27++ = v34;
        }
      }
      else
      {
        do
        {
          v28 = *(_QWORD *)v25;
          v25 += 8;
          *(_QWORD *)v27 = v28;
          v27 += 8;
        }
        while (v27 < v11);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_decompress_fast(unsigned __int8 *__src, char *__dst, int a3)
{
  int v3;
  char *v4;
  char *v5;
  unsigned __int8 *v6;
  char v7;
  unsigned int v8;
  size_t v9;
  unsigned int v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v3 = (int)__src;
  v37 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0;
  v33 = -1;
  v34 = 0;
  v35 = xmmword_216F4B480;
  v36 = 3;
  if (a3)
  {
    v4 = &__dst[a3];
    v5 = v4 - 8;
    v6 = __src;
    while (1)
    {
      v8 = *v6++;
      v7 = v8;
      v9 = (unint64_t)v8 >> 4;
      if ((_DWORD)v9 == 15)
      {
        v9 = 15;
        do
        {
          v10 = *v6++;
          v9 += v10;
        }
        while (v10 == 255);
      }
      v11 = &__dst[v9];
      if (&__dst[v9] > v5)
        break;
      v12 = (uint64_t *)v6;
      do
      {
        v13 = *v12++;
        *(_QWORD *)__dst = v13;
        __dst += 8;
      }
      while (__dst < v11);
      v14 = &v6[v9];
      v16 = *(unsigned __int16 *)v14;
      v6 = v14 + 2;
      v15 = v16;
      v17 = v7 & 0xF;
      if ((v7 & 0xF) == 0xF)
      {
        v17 = 15;
        do
        {
          v18 = *v6++;
          v17 += v18;
        }
        while (v18 == 255);
      }
      v19 = &v11[-v15];
      if (v15 <= 7)
      {
        v24 = *((_QWORD *)&v31 + v15);
        *v11 = *v19;
        v11[1] = v19[1];
        v11[2] = v19[2];
        v11[3] = v19[3];
        v25 = &v19[qword_216F4B490[v15]];
        *((_DWORD *)v11 + 1) = *(_DWORD *)v25;
        v20 = &v25[-v24];
      }
      else
      {
        v21 = *(_QWORD *)v19;
        v20 = v19 + 8;
        *(_QWORD *)v11 = v21;
      }
      __dst = &v11[v17 + 4];
      v22 = v11 + 8;
      if (__dst > v4 - 12)
      {
        if (__dst > v4 - 5)
          return (~(_DWORD)v6 + v3);
        if (v22 < v5)
        {
          v26 = v22;
          v27 = (uint64_t *)v20;
          do
          {
            v28 = *v27++;
            *(_QWORD *)v26 = v28;
            v26 += 8;
          }
          while (v26 < v5);
          v20 += v5 - v22;
          v22 = v4 - 8;
        }
        while (v22 < __dst)
        {
          v29 = *v20++;
          *v22++ = v29;
        }
      }
      else
      {
        do
        {
          v23 = *(_QWORD *)v20;
          v20 += 8;
          *(_QWORD *)v22 = v23;
          v22 += 8;
        }
        while (v22 < __dst);
      }
    }
    if (v11 != v4)
      return (~(_DWORD)v6 + v3);
    memcpy(__dst, v6, v9);
    return ((_DWORD)v6 + v9 - v3);
  }
  else if (*__src)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 1;
  }
}

void *LZ4_createStreamDecode()
{
  return malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
}

uint64_t LZ4_setStreamDecode(_QWORD *a1, uint64_t a2, int a3)
{
  a1[2] = a2 + a3;
  a1[3] = a3;
  *a1 = 0;
  a1[1] = 0;
  return 1;
}

uint64_t LZ4_decompress_safe_continue(_QWORD *a1, char *__src, char *__dst, int a4, int a5)
{
  char *v5;
  char *v6;
  unint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  unsigned __int8 *v16;
  char *v17;
  char v18;
  unsigned int v19;
  size_t v20;
  unsigned int v21;
  unsigned int v22;
  char *v23;
  unsigned __int16 *v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  size_t v30;
  char *v31;
  int64_t v32;
  char *v33;
  char *v34;
  size_t v35;
  char *v36;
  char v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  unint64_t v58;
  unsigned __int8 *v59;
  char *v60;
  char v61;
  unsigned int v62;
  size_t v63;
  unsigned int v64;
  unsigned int v65;
  char *v66;
  unsigned __int16 *v67;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unsigned int v72;
  size_t v73;
  char *v74;
  int64_t v75;
  const void *v76;
  char *v77;
  char *v78;
  char v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  _QWORD *v92;
  char *v93;
  uint64_t v95;
  uint64_t result;
  int v97;
  unsigned __int16 *v98;
  char *v99;
  char *v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  char *v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  int v112;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;

  v5 = __dst;
  v120 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a1[2];
  v7 = a1[3];
  v8 = &__src[a4];
  v9 = &__dst[a5];
  v112 = (int)__src;
  v98 = (unsigned __int16 *)v8;
  v99 = v9;
  if (v6 != __dst)
  {
    *a1 = &v6[-v7];
    a1[1] = v7;
    v114 = 0u;
    v115 = 0;
    v116 = -1;
    v117 = 0;
    v118 = xmmword_216F4B480;
    v119 = 3;
    if (a5)
    {
      v10 = &__dst[-v7];
      v11 = v9 - 12;
      v12 = v8 - 15;
      v13 = v8 - 8;
      v14 = v9 - 8;
      v15 = v8 - 5;
      v108 = v7;
      v110 = v9 - 5;
      v16 = (unsigned __int8 *)__src;
      v17 = __dst;
      v104 = v9 - 12;
      v106 = &__dst[-v7];
      v100 = v9 - 8;
      v102 = v8 - 8;
      while (1)
      {
        while (1)
        {
          v19 = *v16++;
          v18 = v19;
          v20 = (unint64_t)v19 >> 4;
          if ((_DWORD)v20 == 15)
          {
            v20 = 15;
            do
            {
              v22 = *v16++;
              v21 = v22;
              v20 += v22;
            }
            while (v16 < (unsigned __int8 *)v12 && v21 == 255);
            if ((v20 & 0x8000000000000000) != 0)
            {
LABEL_95:
              result = (~(_DWORD)v16 + v112);
LABEL_96:
              v92 = a1;
              if ((int)result >= 1)
              {
                a1[3] = result;
                v93 = &v5[result];
                goto LABEL_106;
              }
              return result;
            }
          }
          v23 = &v17[v20];
          v24 = (unsigned __int16 *)&v16[v20];
          if (&v17[v20] > v11 || v24 > (unsigned __int16 *)v13)
          {
            if (v24 == v98 && v23 <= v99)
            {
              memcpy(v17, v16, v20);
              result = ((_DWORD)v23 - (_DWORD)v5);
              goto LABEL_96;
            }
            goto LABEL_95;
          }
          do
          {
            v26 = *(_QWORD *)v16;
            v16 += 8;
            *(_QWORD *)v17 = v26;
            v17 += 8;
          }
          while (v17 < v23);
          v27 = &v23[-*v24];
          v16 = (unsigned __int8 *)(v24 + 1);
          if (!(v7 >> 16) && v27 < v10)
            goto LABEL_95;
          v28 = v18 & 0xF;
          if ((_DWORD)v28 == 15)
          {
            v28 = 15;
            while (v16 <= (unsigned __int8 *)v15)
            {
              v29 = *v16++;
              v28 += v29;
              if (v29 != 255)
              {
                if (v28 < 0)
                  goto LABEL_95;
                goto LABEL_21;
              }
            }
            goto LABEL_95;
          }
LABEL_21:
          v30 = v28 + 4;
          v31 = &v23[v28 + 4];
          if (v27 >= v5)
            break;
          if (v31 > v110)
            goto LABEL_95;
          v32 = v5 - v27;
          v33 = v6;
          v34 = &v6[-(v5 - v27)];
          v35 = v30 - (v5 - v27);
          if (v30 <= v5 - v27)
          {
            memmove(v23, v34, v30);
            goto LABEL_36;
          }
          memcpy(v23, v34, v5 - v27);
          v17 = &v23[v32];
          if (v35 <= &v23[v32] - v5)
          {
            memcpy(v17, v5, v35);
LABEL_36:
            v17 = v31;
            v6 = v33;
            v10 = v106;
            v7 = v108;
            v13 = v102;
            v11 = v104;
            v14 = v100;
          }
          else
          {
            v6 = v33;
            v10 = v106;
            v7 = v108;
            v13 = v102;
            v11 = v104;
            v14 = v100;
            if ((uint64_t)v30 > v32)
            {
              v36 = v5;
              do
              {
                v37 = *v36++;
                *v17++ = v37;
              }
              while (v17 < v31);
            }
          }
        }
        v38 = *v24;
        if (v38 <= 7)
        {
          v43 = *((_QWORD *)&v114 + v38);
          *v23 = *v27;
          v23[1] = v27[1];
          v23[2] = v27[2];
          v23[3] = v27[3];
          v44 = &v27[qword_216F4B490[v38]];
          *((_DWORD *)v23 + 1) = *(_DWORD *)v44;
          v39 = &v44[-v43];
        }
        else
        {
          v40 = *(_QWORD *)v27;
          v39 = v27 + 8;
          *(_QWORD *)v23 = v40;
        }
        v41 = v23 + 8;
        if (v31 <= v11)
          break;
        if (v31 > v110)
          goto LABEL_95;
        if (v41 < (_QWORD *)v14)
        {
          v45 = v23 + 8;
          v46 = (uint64_t *)v39;
          do
          {
            v47 = *v46++;
            *(_QWORD *)v45 = v47;
            v45 += 8;
          }
          while (v45 < v14);
          v39 += v14 - (char *)v41;
          v41 = v14;
        }
        v17 = v31;
        if (v41 < (_QWORD *)v31)
        {
          do
          {
            v48 = *v39++;
            *(_BYTE *)v41 = v48;
            v41 = (_QWORD *)((char *)v41 + 1);
          }
          while (v41 < (_QWORD *)v31);
LABEL_33:
          v17 = v31;
        }
      }
      do
      {
        v42 = *(_QWORD *)v39;
        v39 += 8;
        *v41++ = v42;
      }
      while (v41 < (_QWORD *)v31);
      goto LABEL_33;
    }
LABEL_108:
    if (a4 != 1)
      return 0xFFFFFFFFLL;
    if (*__src)
      return 0xFFFFFFFFLL;
    return 0;
  }
  v50 = *a1;
  v49 = a1[1];
  v114 = 0u;
  v115 = 0;
  v116 = -1;
  v117 = 0;
  v118 = xmmword_216F4B480;
  v119 = 3;
  if (!a5)
    goto LABEL_108;
  v51 = &__dst[-v7];
  v52 = &v51[-v49];
  v109 = v50 + v49;
  v53 = v9 - 12;
  v54 = v8 - 15;
  v55 = v8 - 8;
  v56 = v9 - 8;
  v57 = v8 - 5;
  v111 = v9 - 5;
  v58 = v49 >> 16;
  v59 = (unsigned __int8 *)__src;
  v60 = __dst;
  v97 = (int)__dst;
  v105 = v55;
  v107 = v9 - 12;
  v101 = v49 >> 16;
  v103 = v9 - 8;
  while (1)
  {
    v62 = *v59++;
    v61 = v62;
    v63 = (unint64_t)v62 >> 4;
    if ((_DWORD)v63 == 15)
    {
      v63 = 15;
      do
      {
        v65 = *v59++;
        v64 = v65;
        v63 += v65;
      }
      while (v59 < (unsigned __int8 *)v54 && v64 == 255);
      if ((v63 & 0x8000000000000000) != 0)
        break;
    }
    v66 = &v60[v63];
    v67 = (unsigned __int16 *)&v59[v63];
    if (&v60[v63] > v53 || v67 > (unsigned __int16 *)v55)
    {
      if (v67 == v98 && v66 <= v99)
      {
        memcpy(v60, v59, v63);
        result = ((_DWORD)v66 - (_DWORD)v5);
        goto LABEL_104;
      }
      break;
    }
    do
    {
      v69 = *(_QWORD *)v59;
      v59 += 8;
      *(_QWORD *)v60 = v69;
      v60 += 8;
    }
    while (v60 < v66);
    v70 = &v66[-*v67];
    v59 = (unsigned __int8 *)(v67 + 1);
    if (!v58 && v70 < v52)
      break;
    v71 = v61 & 0xF;
    if ((_DWORD)v71 == 15)
    {
      v71 = 15;
      while (v59 <= (unsigned __int8 *)v57)
      {
        v72 = *v59++;
        v71 += v72;
        if (v72 != 255)
        {
          if (v71 < 0)
            goto LABEL_103;
          goto LABEL_65;
        }
      }
      break;
    }
LABEL_65:
    v73 = v71 + 4;
    v74 = &v66[v71 + 4];
    if (v70 >= v51)
    {
      v80 = *v67;
      if (v80 <= 7)
      {
        v85 = *((_QWORD *)&v114 + v80);
        *v66 = *v70;
        v66[1] = v70[1];
        v66[2] = v70[2];
        v66[3] = v70[3];
        v86 = &v70[qword_216F4B490[v80]];
        *((_DWORD *)v66 + 1) = *(_DWORD *)v86;
        v81 = &v86[-v85];
      }
      else
      {
        v82 = *(_QWORD *)v70;
        v81 = v70 + 8;
        *(_QWORD *)v66 = v82;
      }
      v83 = v66 + 8;
      if (v74 <= v53)
      {
        do
        {
          v84 = *(_QWORD *)v81;
          v81 += 8;
          *v83++ = v84;
        }
        while (v83 < (_QWORD *)v74);
        goto LABEL_77;
      }
      if (v74 > v111)
        break;
      if (v83 < (_QWORD *)v56)
      {
        v87 = v66 + 8;
        v88 = (uint64_t *)v81;
        do
        {
          v89 = *v88++;
          *(_QWORD *)v87 = v89;
          v87 += 8;
        }
        while (v87 < v56);
        v81 += v56 - (char *)v83;
        v83 = v56;
      }
      v60 = v74;
      if (v83 < (_QWORD *)v74)
      {
        do
        {
          v90 = *v81++;
          *(_BYTE *)v83 = v90;
          v83 = (_QWORD *)((char *)v83 + 1);
        }
        while (v83 < (_QWORD *)v74);
LABEL_77:
        v60 = v74;
      }
    }
    else
    {
      if (v74 > v111)
        break;
      v75 = v51 - v70;
      v76 = (const void *)(v109 - (v51 - v70));
      v77 = v51;
      if (v73 <= v51 - v70)
      {
        memmove(v66, v76, v73);
        v60 = v74;
        v51 = v77;
        goto LABEL_80;
      }
      memcpy(v66, v76, v75);
      v60 = &v66[v75];
      v51 = v77;
      if (v73 - v75 <= &v66[v75] - v77)
      {
        memcpy(v60, v77, v73 - v75);
        v51 = v77;
        v60 = v74;
LABEL_80:
        LODWORD(v5) = v97;
        v55 = v105;
        v53 = v107;
        v58 = v101;
        v56 = v103;
      }
      else
      {
        LODWORD(v5) = v97;
        v55 = v105;
        v53 = v107;
        v58 = v101;
        v56 = v103;
        if ((uint64_t)v73 > v75)
        {
          v78 = v51;
          do
          {
            v79 = *v78++;
            *v60++ = v79;
          }
          while (v60 < v74);
        }
      }
    }
  }
LABEL_103:
  result = (~(_DWORD)v59 + v112);
LABEL_104:
  v92 = a1;
  if ((int)result >= 1)
  {
    v95 = a1[2];
    a1[3] += result;
    v93 = (char *)(v95 + result);
LABEL_106:
    v92[2] = v93;
  }
  return result;
}

uint64_t LZ4_decompress_fast_continue(uint64_t *a1, unsigned __int8 *__src, char *__dst, int a4)
{
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  unsigned __int8 *v11;
  char *v12;
  char v13;
  unsigned int v14;
  size_t v15;
  unsigned int v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  size_t v29;
  char *v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  unsigned __int8 *v49;
  char v50;
  unsigned int v51;
  size_t v52;
  unsigned int v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  unsigned __int8 *v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  unsigned int v61;
  char *v62;
  uint64_t v63;
  char *v64;
  int64_t v65;
  const void *v66;
  unint64_t v67;
  char *v68;
  char v69;
  char *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char *v81;
  int v83;
  uint64_t v84;
  char *v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;

  v4 = __dst;
  v5 = a1;
  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a1[3];
  v7 = &__dst[a4];
  v83 = (int)__src;
  v80 = a4;
  v81 = v7;
  if ((char *)a1[2] != __dst)
  {
    *a1 = (uint64_t)&__dst[-v6];
    a1[1] = v6;
    v86 = 0u;
    v87 = 0;
    v88 = -1;
    v89 = 0;
    v90 = xmmword_216F4B480;
    v91 = 3;
    if (a4)
    {
      v8 = v7 - 12;
      v9 = v7 - 8;
      v10 = &__dst[a4 - 5];
      v11 = __src;
      v12 = __dst;
      while (1)
      {
        while (1)
        {
          v14 = *v11++;
          v13 = v14;
          v15 = (unint64_t)v14 >> 4;
          if ((_DWORD)v15 == 15)
          {
            v15 = 15;
            do
            {
              v16 = *v11++;
              v15 += v16;
            }
            while (v16 == 255);
          }
          v17 = &v12[v15];
          if (&v12[v15] > v9)
          {
            v7 = v81;
            if (v17 != v81)
            {
              v5 = a1;
LABEL_40:
              result = (~(_DWORD)v11 + v83);
              goto LABEL_80;
            }
            memcpy(v12, v11, v15);
            v5 = a1;
            result = ((_DWORD)v11 + v15 - v83);
LABEL_80:
            if ((int)result >= 1)
            {
LABEL_81:
              v5[3] = v80;
              goto LABEL_86;
            }
            return result;
          }
          v18 = (uint64_t *)v11;
          do
          {
            v19 = *v18++;
            *(_QWORD *)v12 = v19;
            v12 += 8;
          }
          while (v12 < v17);
          v20 = &v11[v15];
          v22 = *(unsigned __int16 *)v20;
          v11 = v20 + 2;
          v21 = v22;
          v23 = v13 & 0xF;
          if ((_DWORD)v23 == 15)
          {
            v23 = 15;
            do
            {
              v24 = *v11++;
              v23 += v24;
            }
            while (v24 == 255);
          }
          v25 = &v17[-v21];
          v26 = v23 + 4;
          v27 = &v17[v23 + 4];
          if (&v17[-v21] >= v4)
            break;
          if (v27 > v10)
            goto LABEL_88;
          v28 = v4 - v25;
          v29 = v26 - (v4 - v25);
          if (v26 <= (unint64_t)(v4 - v25))
          {
            memmove(v17, v25, v23 + 4);
            goto LABEL_28;
          }
          memcpy(v17, v25, v4 - v25);
          v12 = &v17[v28];
          if (v29 <= &v17[v28] - v4)
          {
            memcpy(v12, v4, v29);
            goto LABEL_28;
          }
          if (v26 > v28)
          {
            v30 = v4;
            do
            {
              v31 = *v30++;
              *v12++ = v31;
            }
            while (v12 < v27);
          }
        }
        v32 = v21;
        if (v21 <= 7)
        {
          v37 = *((_QWORD *)&v86 + v21);
          *v17 = *v25;
          v17[1] = v25[1];
          v17[2] = v25[2];
          v17[3] = v25[3];
          v38 = &v25[qword_216F4B490[v32]];
          *((_DWORD *)v17 + 1) = *(_DWORD *)v38;
          v33 = &v38[-v37];
        }
        else
        {
          v34 = *(_QWORD *)v25;
          v33 = v25 + 8;
          *(_QWORD *)v17 = v34;
        }
        v35 = v17 + 8;
        if (v27 <= v8)
          break;
        if (v27 > v10)
        {
LABEL_88:
          v7 = v81;
          v5 = a1;
          goto LABEL_40;
        }
        if (v35 < (_QWORD *)v9)
        {
          v39 = v17 + 8;
          v40 = (uint64_t *)v33;
          do
          {
            v41 = *v40++;
            *(_QWORD *)v39 = v41;
            v39 += 8;
          }
          while (v39 < v9);
          v33 += v9 - (char *)v35;
          v35 = v9;
        }
        v12 = v27;
        if (v35 < (_QWORD *)v27)
        {
          do
          {
            v42 = *v33++;
            *(_BYTE *)v35 = v42;
            v35 = (_QWORD *)((char *)v35 + 1);
          }
          while (v35 < (_QWORD *)v27);
LABEL_28:
          v12 = v27;
        }
      }
      do
      {
        v36 = *(_QWORD *)v33;
        v33 += 8;
        *v35++ = v36;
      }
      while (v35 < (_QWORD *)v27);
      goto LABEL_28;
    }
    if (!*__src)
    {
      result = 1;
      goto LABEL_81;
    }
    return 0xFFFFFFFFLL;
  }
  v44 = *a1;
  v45 = a1[1];
  v86 = 0u;
  v87 = 0;
  v88 = -1;
  v89 = 0;
  v90 = xmmword_216F4B480;
  v91 = 3;
  if (!a4)
  {
    if (!*__src)
    {
      result = 1;
      goto LABEL_85;
    }
    return 0xFFFFFFFFLL;
  }
  v46 = &__dst[-v6];
  v84 = v44 + v45;
  v85 = v7 - 12;
  v47 = v7 - 8;
  v48 = v7 - 5;
  v49 = __src;
  while (1)
  {
    v51 = *v49++;
    v50 = v51;
    v52 = (unint64_t)v51 >> 4;
    if ((_DWORD)v52 == 15)
    {
      v52 = 15;
      do
      {
        v53 = *v49++;
        v52 += v53;
      }
      while (v53 == 255);
    }
    v54 = &v4[v52];
    if (&v4[v52] > v47)
      break;
    v55 = (uint64_t *)v49;
    do
    {
      v56 = *v55++;
      *(_QWORD *)v4 = v56;
      v4 += 8;
    }
    while (v4 < v54);
    v57 = &v49[v52];
    v59 = *(unsigned __int16 *)v57;
    v49 = v57 + 2;
    v58 = v59;
    v60 = v50 & 0xF;
    if ((v50 & 0xF) == 0xF)
    {
      v60 = 15;
      do
      {
        v61 = *v49++;
        v60 += v61;
      }
      while (v61 == 255);
    }
    v62 = &v54[-v58];
    v63 = v60 + 4;
    v64 = &v54[v60 + 4];
    if (&v54[-v58] >= v46)
    {
      if (v58 <= 7)
      {
        v74 = *((_QWORD *)&v86 + v58);
        *v54 = *v62;
        v54[1] = v62[1];
        v54[2] = v62[2];
        v54[3] = v62[3];
        v75 = &v62[qword_216F4B490[v58]];
        *((_DWORD *)v54 + 1) = *(_DWORD *)v75;
        v70 = &v75[-v74];
      }
      else
      {
        v71 = *(_QWORD *)v62;
        v70 = v62 + 8;
        *(_QWORD *)v54 = v71;
      }
      v72 = v54 + 8;
      if (v64 <= v85)
      {
        do
        {
          v73 = *(_QWORD *)v70;
          v70 += 8;
          *v72++ = v73;
        }
        while (v72 < (_QWORD *)v64);
        goto LABEL_67;
      }
      if (v64 > v48)
        goto LABEL_78;
      if (v72 < (_QWORD *)v47)
      {
        v76 = v54 + 8;
        v77 = (uint64_t *)v70;
        do
        {
          v78 = *v77++;
          *(_QWORD *)v76 = v78;
          v76 += 8;
        }
        while (v76 < v47);
        v70 += v47 - (char *)v72;
        v72 = v47;
      }
      v4 = v64;
      if (v72 < (_QWORD *)v64)
      {
        do
        {
          v79 = *v70++;
          *(_BYTE *)v72 = v79;
          v72 = (_QWORD *)((char *)v72 + 1);
        }
        while (v72 < (_QWORD *)v64);
LABEL_67:
        v4 = v64;
      }
    }
    else
    {
      if (v64 > v48)
        goto LABEL_78;
      v65 = v46 - v62;
      v66 = (const void *)(v84 - (v46 - v62));
      v67 = v63 - (v46 - v62);
      if (v63 <= (unint64_t)(v46 - v62))
      {
        memmove(v54, v66, v60 + 4);
        goto LABEL_67;
      }
      memcpy(v54, v66, v65);
      v4 = &v54[v65];
      if (v67 <= &v54[v65] - v46)
      {
        memcpy(&v54[v65], v46, v63 - v65);
        goto LABEL_67;
      }
      if (v63 > v65)
      {
        v68 = v46;
        do
        {
          v69 = *v68++;
          *v4++ = v69;
        }
        while (v4 < v64);
      }
    }
  }
  if (v54 != v81)
  {
LABEL_78:
    v5 = a1;
    result = (~(_DWORD)v49 + v83);
    goto LABEL_83;
  }
  memcpy(v4, v49, v52);
  v5 = a1;
  result = ((_DWORD)v49 + v52 - v83);
LABEL_83:
  if ((int)result < 1)
    return result;
  v4 = (char *)v5[2];
  v6 = v5[3];
LABEL_85:
  v5[3] = v6 + v80;
  v7 = &v4[v80];
LABEL_86:
  v5[2] = (uint64_t)v7;
  return result;
}

uint64_t LZ4_decompress_safe_usingDict(unsigned __int8 *__src, char *__dst, int a3, int a4, uint64_t a5, int a6)
{
  unsigned __int8 *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char v18;
  unsigned int v19;
  size_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned __int16 *v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  size_t v35;
  char *v36;
  char v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  unsigned __int8 *v49;
  char *v50;
  char *v51;
  char *v52;
  unsigned __int8 *v53;
  char *v54;
  char v55;
  unsigned int v56;
  size_t v57;
  unsigned int v58;
  unsigned int v59;
  char *v60;
  unsigned __int16 *v61;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unsigned int v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  unsigned __int8 *v79;
  char *v80;
  int64_t v81;
  char *v82;
  char *v83;
  char *v84;
  char v85;
  unsigned int v86;
  size_t v87;
  unsigned int v88;
  unsigned int v89;
  char *v90;
  int64_t v91;
  char *v92;
  unsigned __int16 *v93;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  char *v99;
  int64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  char v111;
  unsigned __int8 *v112;
  char *v113;
  char *v114;
  char *v115;
  char v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned __int16 *v120;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  unsigned int v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t *v134;
  uint64_t v135;
  char v136;
  BOOL v138;
  char *v142;
  unsigned __int16 *v143;
  int v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  int v149;
  char *v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;

  v7 = __src;
  v157 = *MEMORY[0x24BDAC8D0];
  if (!a6)
  {
    v151 = 0u;
    v152 = 0;
    v153 = -1;
    v154 = 0;
    v155 = xmmword_216F4B480;
    v156 = 3;
    if (!a4)
      goto LABEL_165;
    v49 = &__src[a3];
    v50 = &__dst[a4];
    v51 = v50 - 12;
    v52 = v50 - 8;
    v53 = __src;
    v54 = __dst;
    while (1)
    {
      v56 = *v53++;
      v55 = v56;
      v57 = (unint64_t)v56 >> 4;
      if ((_DWORD)v57 == 15)
      {
        v57 = 15;
        do
        {
          v59 = *v53++;
          v58 = v59;
          v57 += v59;
        }
        while (v53 < v49 - 15 && v58 == 255);
        if ((v57 & 0x8000000000000000) != 0)
          return (~(_DWORD)v53 + (_DWORD)v7);
      }
      v60 = &v54[v57];
      v61 = (unsigned __int16 *)&v53[v57];
      if (&v54[v57] > v51 || v61 > (unsigned __int16 *)v49 - 4)
        break;
      do
      {
        v63 = *(_QWORD *)v53;
        v53 += 8;
        *(_QWORD *)v54 = v63;
        v54 += 8;
      }
      while (v54 < v60);
      v64 = &v60[-*v61];
      v53 = (unsigned __int8 *)(v61 + 1);
      if (v64 < __dst)
        return (~(_DWORD)v53 + (_DWORD)v7);
      v65 = v55 & 0xF;
      if ((v55 & 0xF) == 0xF)
      {
        v65 = 15;
        do
        {
          if (v53 > v49 - 5)
            return (~(_DWORD)v53 + (_DWORD)v7);
          v66 = *v53++;
          v65 += v66;
        }
        while (v66 == 255);
        if (v65 < 0)
          return (~(_DWORD)v53 + (_DWORD)v7);
      }
      v67 = *v61;
      if (v67 <= 7)
      {
        v72 = *((_QWORD *)&v151 + v67);
        *v60 = *v64;
        v60[1] = v64[1];
        v60[2] = v64[2];
        v60[3] = v64[3];
        v73 = &v64[qword_216F4B490[v67]];
        *((_DWORD *)v60 + 1) = *(_DWORD *)v73;
        v68 = &v73[-v72];
      }
      else
      {
        v69 = *(_QWORD *)v64;
        v68 = v64 + 8;
        *(_QWORD *)v60 = v69;
      }
      v54 = &v60[v65 + 4];
      v70 = v60 + 8;
      if (v54 > v51)
      {
        if (v54 > v50 - 5)
          return (~(_DWORD)v53 + (_DWORD)v7);
        if (v70 < v52)
        {
          v74 = v60 + 8;
          v75 = (uint64_t *)v68;
          do
          {
            v76 = *v75++;
            *(_QWORD *)v74 = v76;
            v74 += 8;
          }
          while (v74 < v52);
          v68 += v52 - v70;
          v70 = v50 - 8;
        }
        while (v70 < v54)
        {
          v77 = *v68++;
          *v70++ = v77;
        }
      }
      else
      {
        do
        {
          v71 = *(_QWORD *)v68;
          v68 += 8;
          *(_QWORD *)v70 = v71;
          v70 += 8;
        }
        while (v70 < v54);
      }
    }
    v138 = v61 == (unsigned __int16 *)v49;
    goto LABEL_158;
  }
  v8 = (char *)(a5 + a6);
  if (v8 == __dst)
  {
    if (a6 >= 0xFFFF)
    {
      v151 = 0uLL;
      v152 = 0;
      v153 = -1;
      v154 = 0;
      v155 = xmmword_216F4B480;
      v156 = 3;
      if (!a4)
        goto LABEL_165;
      v78 = 0;
      v79 = &__src[a3];
      v80 = &__dst[a4];
      v81 = a4;
      v82 = v80 - 12;
      v83 = v80 - 8;
      v84 = v80 - 5;
      v53 = __src;
      while (1)
      {
        v86 = *v53++;
        v85 = v86;
        v87 = (unint64_t)v86 >> 4;
        if ((_DWORD)v87 == 15)
        {
          v87 = 15;
          do
          {
            v89 = *v53++;
            v88 = v89;
            v87 += v89;
          }
          while (v53 < v79 - 15 && v88 == 255);
          if ((v87 & 0x8000000000000000) != 0)
            return (~(_DWORD)v53 + (_DWORD)v7);
        }
        v90 = &__dst[v78];
        v91 = v87 + v78;
        v92 = &__dst[v87 + v78];
        v93 = (unsigned __int16 *)&v53[v87];
        if (v92 > v82 || v93 > (unsigned __int16 *)v79 - 4)
          break;
        do
        {
          v95 = *(_QWORD *)v53;
          v53 += 8;
          *(_QWORD *)v90 = v95;
          v90 += 8;
        }
        while (v90 < v92);
        v96 = v91 - *v93;
        v53 = (unsigned __int8 *)(v93 + 1);
        if (v96 < -65536)
          return (~(_DWORD)v53 + (_DWORD)v7);
        v97 = v85 & 0xF;
        if ((v85 & 0xF) == 0xF)
        {
          v97 = 15;
          do
          {
            if (v53 > v79 - 5)
              return (~(_DWORD)v53 + (_DWORD)v7);
            v98 = *v53++;
            v97 += v98;
          }
          while (v98 == 255);
          if (v97 < 0)
            return (~(_DWORD)v53 + (_DWORD)v7);
        }
        v99 = &__dst[v96];
        v100 = v92 - v99;
        if (v92 - v99 <= 7)
        {
          v106 = *((_QWORD *)&v151 + v100);
          *v92 = *v99;
          v92[1] = v99[1];
          v92[2] = v99[2];
          v92[3] = v99[3];
          v107 = &v99[qword_216F4B490[v100]];
          *((_DWORD *)v92 + 1) = *(_DWORD *)v107;
          v101 = &v107[-v106];
        }
        else
        {
          v102 = *(_QWORD *)v99;
          v101 = v99 + 8;
          *(_QWORD *)v92 = v102;
        }
        v78 = v91 + v97 + 4;
        v103 = &__dst[v78];
        v104 = v92 + 8;
        if (&__dst[v78] > v82)
        {
          if (v103 > v84)
            return (~(_DWORD)v53 + (_DWORD)v7);
          if (v104 < (_QWORD *)v83)
          {
            v108 = (char *)v104;
            v109 = v101;
            do
            {
              v110 = *(_QWORD *)v109;
              v109 += 8;
              *(_QWORD *)v108 = v110;
              v108 += 8;
            }
            while (v108 < v83);
            v101 += v83 - (char *)v104;
            v104 = v83;
          }
          while (v104 < (_QWORD *)v103)
          {
            v111 = *v101++;
            *(_BYTE *)v104 = v111;
            v104 = (_QWORD *)((char *)v104 + 1);
          }
        }
        else
        {
          do
          {
            v105 = *(_QWORD *)v101;
            v101 += 8;
            *v104++ = v105;
          }
          while (v104 < (_QWORD *)v103);
        }
      }
      if (v93 == (unsigned __int16 *)v79 && v91 <= v81)
      {
        memcpy(v90, v53, v87);
        return v91;
      }
      return (~(_DWORD)v53 + (_DWORD)v7);
    }
    v151 = 0uLL;
    v152 = 0;
    v153 = -1;
    v154 = 0;
    v155 = xmmword_216F4B480;
    v156 = 3;
    if (!a4)
      goto LABEL_165;
    v112 = &__src[a3];
    v50 = &__dst[a4];
    v113 = &__dst[-a6];
    v114 = v50 - 12;
    v115 = v50 - 8;
    v53 = __src;
    v54 = __dst;
    while (1)
    {
      v117 = *v53++;
      v116 = v117;
      v57 = (unint64_t)v117 >> 4;
      if ((_DWORD)v57 == 15)
      {
        v57 = 15;
        do
        {
          v119 = *v53++;
          v118 = v119;
          v57 += v119;
        }
        while (v53 < v112 - 15 && v118 == 255);
        if ((v57 & 0x8000000000000000) != 0)
          return (~(_DWORD)v53 + (_DWORD)v7);
      }
      v60 = &v54[v57];
      v120 = (unsigned __int16 *)&v53[v57];
      if (&v54[v57] > v114 || v120 > (unsigned __int16 *)v112 - 4)
        break;
      do
      {
        v122 = *(_QWORD *)v53;
        v53 += 8;
        *(_QWORD *)v54 = v122;
        v54 += 8;
      }
      while (v54 < v60);
      v123 = &v60[-*v120];
      v53 = (unsigned __int8 *)(v120 + 1);
      if (v123 < v113)
        return (~(_DWORD)v53 + (_DWORD)v7);
      v124 = v116 & 0xF;
      if ((v116 & 0xF) == 0xF)
      {
        v124 = 15;
        do
        {
          if (v53 > v112 - 5)
            return (~(_DWORD)v53 + (_DWORD)v7);
          v125 = *v53++;
          v124 += v125;
        }
        while (v125 == 255);
        if (v124 < 0)
          return (~(_DWORD)v53 + (_DWORD)v7);
      }
      v126 = *v120;
      if (v126 <= 7)
      {
        v131 = *((_QWORD *)&v151 + v126);
        *v60 = *v123;
        v60[1] = v123[1];
        v60[2] = v123[2];
        v60[3] = v123[3];
        v132 = &v123[qword_216F4B490[v126]];
        *((_DWORD *)v60 + 1) = *(_DWORD *)v132;
        v127 = &v132[-v131];
      }
      else
      {
        v128 = *(_QWORD *)v123;
        v127 = v123 + 8;
        *(_QWORD *)v60 = v128;
      }
      v54 = &v60[v124 + 4];
      v129 = v60 + 8;
      if (v54 > v114)
      {
        if (v54 > v50 - 5)
          return (~(_DWORD)v53 + (_DWORD)v7);
        if (v129 < v115)
        {
          v133 = v60 + 8;
          v134 = (uint64_t *)v127;
          do
          {
            v135 = *v134++;
            *(_QWORD *)v133 = v135;
            v133 += 8;
          }
          while (v133 < v115);
          v127 += v115 - v129;
          v129 = v50 - 8;
        }
        while (v129 < v54)
        {
          v136 = *v127++;
          *v129++ = v136;
        }
      }
      else
      {
        do
        {
          v130 = *(_QWORD *)v127;
          v127 += 8;
          *(_QWORD *)v129 = v130;
          v129 += 8;
        }
        while (v129 < v54);
      }
    }
    v138 = v120 == (unsigned __int16 *)v112;
LABEL_158:
    if (v138 && v60 <= v50)
    {
      memcpy(v54, v53, v57);
      return ((_DWORD)v60 - (_DWORD)__dst);
    }
    return (~(_DWORD)v53 + (_DWORD)v7);
  }
  v151 = 0u;
  v152 = 0;
  v153 = -1;
  v154 = 0;
  v155 = xmmword_216F4B480;
  v156 = 3;
  if (a4)
  {
    v9 = (char *)&__src[a3];
    v10 = &__dst[a4];
    v11 = &__dst[-a6];
    v12 = v10 - 12;
    v13 = v9 - 15;
    v14 = v9 - 8;
    v15 = v10 - 8;
    v142 = v10;
    v143 = (unsigned __int16 *)v9;
    v16 = v9 - 5;
    v149 = a6;
    v150 = v10 - 5;
    v144 = (int)__src;
    v145 = v10 - 8;
    v17 = __dst;
    v147 = v10 - 12;
    v148 = v11;
    v146 = v9 - 8;
    while (1)
    {
      while (1)
      {
        v19 = *v7++;
        v18 = v19;
        v20 = (unint64_t)v19 >> 4;
        if ((_DWORD)v20 == 15)
        {
          v20 = 15;
          do
          {
            v22 = *v7++;
            v21 = v22;
            v20 += v22;
          }
          while (v7 < (unsigned __int8 *)v13 && v21 == 255);
          if ((v20 & 0x8000000000000000) != 0)
            return (~(_DWORD)v7 + v144);
        }
        v23 = (unint64_t)&v17[v20];
        v24 = (unsigned __int16 *)&v7[v20];
        if (&v17[v20] > v12 || v24 > (unsigned __int16 *)v14)
        {
          if (v24 == v143 && v23 <= (unint64_t)v142)
          {
            memcpy(v17, v7, v20);
            return (v23 - (_DWORD)__dst);
          }
          return (~(_DWORD)v7 + v144);
        }
        do
        {
          v26 = *(_QWORD *)v7;
          v7 += 8;
          *(_QWORD *)v17 = v26;
          v17 += 8;
        }
        while ((unint64_t)v17 < v23);
        v27 = (char *)(v23 - *v24);
        v7 = (unsigned __int8 *)(v24 + 1);
        if (!HIWORD(a6) && v27 < v11)
          return (~(_DWORD)v7 + v144);
        v28 = v18 & 0xF;
        if ((_DWORD)v28 == 15)
        {
          v28 = 15;
          while (v7 <= (unsigned __int8 *)v16)
          {
            v29 = *v7++;
            v28 += v29;
            if (v29 != 255)
            {
              if (v28 < 0)
                return (~(_DWORD)v7 + v144);
              goto LABEL_22;
            }
          }
          return (~(_DWORD)v7 + v144);
        }
LABEL_22:
        v30 = (char *)(v28 + 4);
        v31 = (char *)(v23 + v28 + 4);
        if (v27 >= __dst)
          break;
        if (v31 > v150)
          return (~(_DWORD)v7 + v144);
        v32 = (char *)(__dst - v27);
        v33 = v8;
        v34 = &v8[-(__dst - v27)];
        v35 = (size_t)&v30[-(__dst - v27)];
        if ((unint64_t)v30 <= __dst - v27)
        {
          memmove((void *)v23, v34, (size_t)v30);
          v17 = v31;
          v8 = v33;
          goto LABEL_37;
        }
        memcpy((void *)v23, v34, __dst - v27);
        v17 = &v32[v23];
        if (v35 <= &v32[v23] - __dst)
        {
          memcpy(v17, __dst, v35);
          v17 = v31;
          v8 = v33;
LABEL_37:
          v11 = v148;
          a6 = v149;
          v14 = v146;
          v12 = v147;
          v15 = v145;
        }
        else
        {
          v8 = v33;
          v11 = v148;
          a6 = v149;
          v14 = v146;
          v12 = v147;
          v15 = v145;
          if ((uint64_t)v30 > (uint64_t)v32)
          {
            v36 = __dst;
            do
            {
              v37 = *v36++;
              *v17++ = v37;
            }
            while (v17 < v31);
          }
        }
      }
      v38 = *v24;
      if (v38 <= 7)
      {
        v43 = *((_QWORD *)&v151 + v38);
        *(_BYTE *)v23 = *v27;
        *(_BYTE *)(v23 + 1) = v27[1];
        *(_BYTE *)(v23 + 2) = v27[2];
        *(_BYTE *)(v23 + 3) = v27[3];
        v44 = &v27[qword_216F4B490[v38]];
        *(_DWORD *)(v23 + 4) = *(_DWORD *)v44;
        v39 = &v44[-v43];
      }
      else
      {
        v40 = *(_QWORD *)v27;
        v39 = v27 + 8;
        *(_QWORD *)v23 = v40;
      }
      v41 = (_QWORD *)(v23 + 8);
      if (v31 <= v12)
        break;
      if (v31 > v150)
        return (~(_DWORD)v7 + v144);
      if (v41 < (_QWORD *)v15)
      {
        v45 = (char *)(v23 + 8);
        v46 = (uint64_t *)v39;
        do
        {
          v47 = *v46++;
          *(_QWORD *)v45 = v47;
          v45 += 8;
        }
        while (v45 < v15);
        v39 += v15 - (char *)v41;
        v41 = v15;
      }
      v17 = v31;
      if (v41 < (_QWORD *)v31)
      {
        do
        {
          v48 = *v39++;
          *(_BYTE *)v41 = v48;
          v41 = (_QWORD *)((char *)v41 + 1);
        }
        while (v41 < (_QWORD *)v31);
LABEL_34:
        v17 = v31;
      }
    }
    do
    {
      v42 = *(_QWORD *)v39;
      v39 += 8;
      *v41++ = v42;
    }
    while (v41 < (_QWORD *)v31);
    goto LABEL_34;
  }
LABEL_165:
  if (a3 != 1)
    return 0xFFFFFFFFLL;
  if (*__src)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t LZ4_decompress_fast_usingDict(unsigned __int8 *__src, char *__dst, int a3, uint64_t a4, int a5)
{
  char *v5;
  int v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  unsigned __int8 *v11;
  char *v12;
  char v13;
  unsigned int v14;
  size_t v15;
  unsigned int v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  size_t v30;
  char *v31;
  char v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  char *v44;
  unsigned __int8 *v45;
  char v46;
  unsigned int v47;
  size_t v48;
  unsigned int v49;
  char *v50;
  uint64_t *v51;
  uint64_t v52;
  unsigned __int8 *v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  char *v69;
  char *v70;
  char v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t *v74;
  uint64_t v75;
  unsigned __int8 *v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  char *v92;
  char v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t *v96;
  uint64_t v97;
  unsigned __int8 *v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  unsigned int v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t *v111;
  uint64_t v112;
  char v113;
  char *v114;
  int v115;
  char *v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;

  v5 = __dst;
  v6 = (int)__src;
  v123 = *MEMORY[0x24BDAC8D0];
  v7 = &__dst[a3];
  if (!a5)
  {
    v117 = 0u;
    v118 = 0;
    v119 = -1;
    v120 = 0;
    v121 = xmmword_216F4B480;
    v122 = 3;
    if (a3)
    {
      v44 = v7 - 8;
      v45 = __src;
      while (1)
      {
        v47 = *v45++;
        v46 = v47;
        v48 = (unint64_t)v47 >> 4;
        if ((_DWORD)v48 == 15)
        {
          v48 = 15;
          do
          {
            v49 = *v45++;
            v48 += v49;
          }
          while (v49 == 255);
        }
        v50 = &v5[v48];
        if (&v5[v48] > v44)
          break;
        v51 = (uint64_t *)v45;
        do
        {
          v52 = *v51++;
          *(_QWORD *)v5 = v52;
          v5 += 8;
        }
        while (v5 < v50);
        v53 = &v45[v48];
        v55 = *(unsigned __int16 *)v53;
        v45 = v53 + 2;
        v54 = v55;
        v56 = v46 & 0xF;
        if ((v46 & 0xF) == 0xF)
        {
          v56 = 15;
          do
          {
            v57 = *v45++;
            v56 += v57;
          }
          while (v57 == 255);
        }
        v58 = &v50[-v54];
        if (v54 <= 7)
        {
          v63 = *((_QWORD *)&v117 + v54);
          *v50 = *v58;
          v50[1] = v58[1];
          v50[2] = v58[2];
          v50[3] = v58[3];
          v64 = &v58[qword_216F4B490[v54]];
          *((_DWORD *)v50 + 1) = *(_DWORD *)v64;
          v59 = &v64[-v63];
        }
        else
        {
          v60 = *(_QWORD *)v58;
          v59 = v58 + 8;
          *(_QWORD *)v50 = v60;
        }
        v5 = &v50[v56 + 4];
        v61 = v50 + 8;
        if (v5 > v7 - 12)
        {
          if (v5 > v7 - 5)
            return (~(_DWORD)v45 + (_DWORD)__src);
          if (v61 < v44)
          {
            v65 = v61;
            v66 = (uint64_t *)v59;
            do
            {
              v67 = *v66++;
              *(_QWORD *)v65 = v67;
              v65 += 8;
            }
            while (v65 < v44);
            v59 += v44 - v61;
            v61 = v7 - 8;
          }
          while (v61 < v5)
          {
            v68 = *v59++;
            *v61++ = v68;
          }
        }
        else
        {
          do
          {
            v62 = *(_QWORD *)v59;
            v59 += 8;
            *(_QWORD *)v61 = v62;
            v61 += 8;
          }
          while (v61 < v5);
        }
      }
LABEL_118:
      if (v50 == v7)
      {
        memcpy(v5, v45, v48);
        return ((_DWORD)v45 + v48 - v6);
      }
      return (~(_DWORD)v45 + (_DWORD)__src);
    }
LABEL_122:
    if (*__src)
      return 0xFFFFFFFFLL;
    else
      return 1;
  }
  v8 = (_QWORD *)(a4 + a5);
  if (v8 == (_QWORD *)v5)
  {
    v69 = v7 - 12;
    if (a5 < 0xFFFF)
    {
      v117 = 0uLL;
      v118 = 0;
      v119 = -1;
      v120 = 0;
      v121 = xmmword_216F4B480;
      v122 = 3;
      if (a3)
      {
        v92 = v7 - 8;
        v45 = __src;
        while (1)
        {
          v94 = *v45++;
          v93 = v94;
          v48 = (unint64_t)v94 >> 4;
          if ((_DWORD)v48 == 15)
          {
            v48 = 15;
            do
            {
              v95 = *v45++;
              v48 += v95;
            }
            while (v95 == 255);
          }
          v50 = &v5[v48];
          if (&v5[v48] > v92)
            break;
          v96 = (uint64_t *)v45;
          do
          {
            v97 = *v96++;
            *(_QWORD *)v5 = v97;
            v5 += 8;
          }
          while (v5 < v50);
          v98 = &v45[v48];
          v100 = *(unsigned __int16 *)v98;
          v45 = v98 + 2;
          v99 = v100;
          v101 = v93 & 0xF;
          if ((v93 & 0xF) == 0xF)
          {
            v101 = 15;
            do
            {
              v102 = *v45++;
              v101 += v102;
            }
            while (v102 == 255);
          }
          v103 = &v50[-v99];
          if (v99 <= 7)
          {
            v108 = *((_QWORD *)&v117 + v99);
            *v50 = *v103;
            v50[1] = v103[1];
            v50[2] = v103[2];
            v50[3] = v103[3];
            v109 = &v103[qword_216F4B490[v99]];
            *((_DWORD *)v50 + 1) = *(_DWORD *)v109;
            v104 = &v109[-v108];
          }
          else
          {
            v105 = *(_QWORD *)v103;
            v104 = v103 + 8;
            *(_QWORD *)v50 = v105;
          }
          v5 = &v50[v101 + 4];
          v106 = v50 + 8;
          if (v5 > v69)
          {
            if (v5 > v7 - 5)
              return (~(_DWORD)v45 + (_DWORD)__src);
            if (v106 < v92)
            {
              v110 = v106;
              v111 = (uint64_t *)v104;
              do
              {
                v112 = *v111++;
                *(_QWORD *)v110 = v112;
                v110 += 8;
              }
              while (v110 < v92);
              v104 += v92 - v106;
              v106 = v7 - 8;
            }
            while (v106 < v5)
            {
              v113 = *v104++;
              *v106++ = v113;
            }
          }
          else
          {
            do
            {
              v107 = *(_QWORD *)v104;
              v104 += 8;
              *(_QWORD *)v106 = v107;
              v106 += 8;
            }
            while (v106 < v5);
          }
        }
        goto LABEL_118;
      }
    }
    else
    {
      v117 = 0uLL;
      v118 = 0;
      v119 = -1;
      v120 = 0;
      v121 = xmmword_216F4B480;
      v122 = 3;
      if (a3)
      {
        v70 = v7 - 8;
        v45 = __src;
        while (1)
        {
          v72 = *v45++;
          v71 = v72;
          v48 = (unint64_t)v72 >> 4;
          if ((_DWORD)v48 == 15)
          {
            v48 = 15;
            do
            {
              v73 = *v45++;
              v48 += v73;
            }
            while (v73 == 255);
          }
          v50 = &v5[v48];
          if (&v5[v48] > v70)
            break;
          v74 = (uint64_t *)v45;
          do
          {
            v75 = *v74++;
            *(_QWORD *)v5 = v75;
            v5 += 8;
          }
          while (v5 < v50);
          v76 = &v45[v48];
          v78 = *(unsigned __int16 *)v76;
          v45 = v76 + 2;
          v77 = v78;
          v79 = v71 & 0xF;
          if ((v71 & 0xF) == 0xF)
          {
            v79 = 15;
            do
            {
              v80 = *v45++;
              v79 += v80;
            }
            while (v80 == 255);
          }
          v81 = &v50[-v77];
          if (v77 <= 7)
          {
            v86 = *((_QWORD *)&v117 + v77);
            *v50 = *v81;
            v50[1] = v81[1];
            v50[2] = v81[2];
            v50[3] = v81[3];
            v87 = &v81[qword_216F4B490[v77]];
            *((_DWORD *)v50 + 1) = *(_DWORD *)v87;
            v82 = &v87[-v86];
          }
          else
          {
            v83 = *(_QWORD *)v81;
            v82 = v81 + 8;
            *(_QWORD *)v50 = v83;
          }
          v5 = &v50[v79 + 4];
          v84 = v50 + 8;
          if (v5 > v69)
          {
            if (v5 > v7 - 5)
              return (~(_DWORD)v45 + (_DWORD)__src);
            if (v84 < v70)
            {
              v88 = v84;
              v89 = (uint64_t *)v82;
              do
              {
                v90 = *v89++;
                *(_QWORD *)v88 = v90;
                v88 += 8;
              }
              while (v88 < v70);
              v82 += v70 - v84;
              v84 = v7 - 8;
            }
            while (v84 < v5)
            {
              v91 = *v82++;
              *v84++ = v91;
            }
          }
          else
          {
            do
            {
              v85 = *(_QWORD *)v82;
              v82 += 8;
              *(_QWORD *)v84 = v85;
              v84 += 8;
            }
            while (v84 < v5);
          }
        }
        goto LABEL_118;
      }
    }
    goto LABEL_122;
  }
  v117 = 0u;
  v118 = 0;
  v119 = -1;
  v120 = 0;
  v121 = xmmword_216F4B480;
  v122 = 3;
  if (!a3)
    goto LABEL_122;
  v115 = (int)__src;
  v116 = v7 - 12;
  v9 = v7 - 8;
  v114 = v7;
  v10 = v7 - 5;
  v11 = __src;
  v12 = v5;
  while (1)
  {
    v14 = *v11++;
    v13 = v14;
    v15 = (unint64_t)v14 >> 4;
    if ((_DWORD)v15 == 15)
    {
      v15 = 15;
      do
      {
        v16 = *v11++;
        v15 += v16;
      }
      while (v16 == 255);
    }
    v17 = &v12[v15];
    if (&v12[v15] > v9)
      break;
    v18 = (uint64_t *)v11;
    do
    {
      v19 = *v18++;
      *(_QWORD *)v12 = v19;
      v12 += 8;
    }
    while (v12 < v17);
    v20 = &v11[v15];
    v22 = *(unsigned __int16 *)v20;
    v11 = v20 + 2;
    v21 = v22;
    v23 = v13 & 0xF;
    if ((v13 & 0xF) == 0xF)
    {
      v23 = 15;
      do
      {
        v24 = *v11++;
        v23 += v24;
      }
      while (v24 == 255);
    }
    v25 = &v17[-v21];
    v26 = v23 + 4;
    v27 = &v17[v23 + 4];
    if (&v17[-v21] >= v5)
    {
      if (v21 <= 7)
      {
        v37 = *((_QWORD *)&v117 + v21);
        *v17 = *v25;
        v17[1] = v25[1];
        v17[2] = v25[2];
        v17[3] = v25[3];
        v38 = &v25[qword_216F4B490[v21]];
        *((_DWORD *)v17 + 1) = *(_DWORD *)v38;
        v33 = &v38[-v37];
      }
      else
      {
        v34 = *(_QWORD *)v25;
        v33 = v25 + 8;
        *(_QWORD *)v17 = v34;
      }
      v35 = v17 + 8;
      if (v27 <= v116)
      {
        do
        {
          v36 = *(_QWORD *)v33;
          v33 += 8;
          *v35++ = v36;
        }
        while (v35 < (_QWORD *)v27);
        goto LABEL_29;
      }
      if (v27 > v10)
        return (~(_DWORD)v11 + v115);
      if (v35 < (_QWORD *)v9)
      {
        v39 = v17 + 8;
        v40 = (uint64_t *)v33;
        do
        {
          v41 = *v40++;
          *(_QWORD *)v39 = v41;
          v39 += 8;
        }
        while (v39 < v9);
        v33 += v9 - (char *)v35;
        v35 = v9;
      }
      v12 = v27;
      if (v35 < (_QWORD *)v27)
      {
        do
        {
          v42 = *v33++;
          *(_BYTE *)v35 = v42;
          v35 = (_QWORD *)((char *)v35 + 1);
        }
        while (v35 < (_QWORD *)v27);
LABEL_29:
        v12 = v27;
      }
    }
    else
    {
      if (v27 > v10)
        return (~(_DWORD)v11 + v115);
      v28 = v5 - v25;
      v29 = (char *)v8 - (v5 - v25);
      v30 = v26 - (v5 - v25);
      if (v26 <= (unint64_t)(v5 - v25))
      {
        memmove(v17, v29, v23 + 4);
        goto LABEL_29;
      }
      memcpy(v17, v29, v5 - v25);
      v12 = &v17[v28];
      if (v30 <= &v17[v28] - v5)
      {
        memcpy(v12, v5, v30);
        goto LABEL_29;
      }
      if (v26 > v28)
      {
        v31 = v5;
        do
        {
          v32 = *v31++;
          *v12++ = v32;
        }
        while (v12 < v27);
      }
    }
  }
  if (v17 != v114)
    return (~(_DWORD)v11 + v115);
  memcpy(v12, v11, v15);
  return ((_DWORD)v11 + v15 - v115);
}

uint64_t LZ4_compress(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _BYTE *v9;
  int v10;
  signed int v11;
  _OWORD v13[1024];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = v6;
  v19 = v7;
  v16 = v2;
  v17 = v3;
  v14 = v4;
  v15 = v5;
  MEMORY[0x24BDAC7A8](a1, a1, a2);
  memset(v13, 0, 512);
  return LZ4_compress_fast_extState(v13, v8, v9, v10, v11, 1);
}

uint64_t LZ4_compress_limitedOutput_withState(void *a1, char *a2, _BYTE *a3, int a4, signed int a5)
{
  return LZ4_compress_fast_extState(a1, a2, a3, a4, a5, 1);
}

uint64_t LZ4_compress_withState(void *a1, char *a2, _BYTE *a3, unsigned int a4)
{
  signed int v4;

  if (a4 <= 0x7E000000)
    v4 = a4 + a4 / 0xFF + 16;
  else
    v4 = 0;
  return LZ4_compress_fast_extState(a1, a2, a3, a4, v4, 1);
}

uint64_t LZ4_compress_limitedOutput_continue(uint64_t a1, char *a2, _BYTE *a3, signed int a4, unsigned int a5)
{
  return LZ4_compress_fast_continue(a1, a2, a3, a4, a5, 1);
}

uint64_t LZ4_compress_continue(uint64_t a1, char *a2, _BYTE *a3, unsigned int a4)
{
  unsigned int v4;

  if (a4 <= 0x7E000000)
    v4 = a4 + a4 / 0xFF + 16;
  else
    v4 = 0;
  return LZ4_compress_fast_continue(a1, a2, a3, a4, v4, 1);
}

uint64_t LZ4_resetStreamState(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  if ((a1 & 3) != 0)
    return 1;
  bzero(a1, 0x4020uLL);
  result = 0;
  a1[2050] = a2;
  return result;
}

_QWORD *LZ4_create(uint64_t a1)
{
  _QWORD *v2;

  v2 = malloc_type_calloc(8uLL, 0x804uLL, 0x798FCC56uLL);
  bzero(v2, 0x4020uLL);
  v2[2050] = a1;
  return v2;
}

size_t LZ4_slideInputBuffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;

  v2 = *(_QWORD *)(a1 + 16400);
  v3 = *(unsigned int *)(a1 + 16408);
  if (v3 >= 0x10000)
    v4 = 0x10000;
  else
    v4 = v3;
  memmove(*(void **)(a1 + 16400), (const void *)(*(_QWORD *)(a1 + 16392) + v3 - v4), v4);
  *(_QWORD *)(a1 + 16392) = v2;
  *(_DWORD *)(a1 + 16408) = v4;
  return *(_QWORD *)(a1 + 16400) + v4;
}

uint64_t LZ4_decompress_safe_withPrefix64k(unsigned __int8 *a1, char *__dst, int a3, int a4)
{
  unsigned __int16 *v5;
  char *v6;
  char *v7;
  char *v8;
  unsigned __int8 *v9;
  char *v10;
  char v11;
  unsigned int v12;
  size_t v13;
  unsigned int v14;
  unsigned int v15;
  char *v16;
  unsigned __int16 *v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0;
  v38 = -1;
  v39 = 0;
  v40 = xmmword_216F4B480;
  v41 = 3;
  if (a4)
  {
    v5 = (unsigned __int16 *)&a1[a3];
    v6 = &__dst[a4];
    v7 = v6 - 12;
    v8 = v6 - 8;
    v9 = a1;
    v10 = __dst;
    while (1)
    {
      v12 = *v9++;
      v11 = v12;
      v13 = (unint64_t)v12 >> 4;
      if ((_DWORD)v13 == 15)
      {
        v13 = 15;
        do
        {
          v15 = *v9++;
          v14 = v15;
          v13 += v15;
        }
        while (v9 < (unsigned __int8 *)v5 - 15 && v14 == 255);
        if ((v13 & 0x8000000000000000) != 0)
          return (~(_DWORD)v9 + (_DWORD)a1);
      }
      v16 = &v10[v13];
      v17 = (unsigned __int16 *)&v9[v13];
      if (&v10[v13] > v7 || v17 > v5 - 4)
      {
        if (v17 == v5 && v16 <= v6)
        {
          memcpy(v10, v9, v13);
          return ((_DWORD)v16 - (_DWORD)__dst);
        }
        return (~(_DWORD)v9 + (_DWORD)a1);
      }
      do
      {
        v19 = *(_QWORD *)v9;
        v9 += 8;
        *(_QWORD *)v10 = v19;
        v10 += 8;
      }
      while (v10 < v16);
      v9 = (unsigned __int8 *)(v17 + 1);
      v20 = v11 & 0xF;
      if ((v11 & 0xF) == 0xF)
      {
        v20 = 15;
        while (v9 <= (unsigned __int8 *)v5 - 5)
        {
          v21 = *v9++;
          v20 += v21;
          if (v21 != 255)
          {
            if (v20 < 0)
              return (~(_DWORD)v9 + (_DWORD)a1);
            goto LABEL_18;
          }
        }
        return (~(_DWORD)v9 + (_DWORD)a1);
      }
LABEL_18:
      v22 = &v16[-*v17];
      v23 = *v17;
      if (v23 <= 7)
      {
        v28 = *((_QWORD *)&v36 + v23);
        *v16 = *v22;
        v16[1] = v22[1];
        v16[2] = v22[2];
        v16[3] = v22[3];
        v29 = &v22[qword_216F4B490[v23]];
        *((_DWORD *)v16 + 1) = *(_DWORD *)v29;
        v24 = &v29[-v28];
      }
      else
      {
        v25 = *(_QWORD *)v22;
        v24 = v22 + 8;
        *(_QWORD *)v16 = v25;
      }
      v10 = &v16[v20 + 4];
      v26 = v16 + 8;
      if (v10 > v7)
      {
        if (v10 > v6 - 5)
          return (~(_DWORD)v9 + (_DWORD)a1);
        if (v26 < v8)
        {
          v30 = v16 + 8;
          v31 = (uint64_t *)v24;
          do
          {
            v32 = *v31++;
            *(_QWORD *)v30 = v32;
            v30 += 8;
          }
          while (v30 < v8);
          v24 += v8 - v26;
          v26 = v6 - 8;
        }
        while (v26 < v10)
        {
          v33 = *v24++;
          *v26++ = v33;
        }
      }
      else
      {
        do
        {
          v27 = *(_QWORD *)v24;
          v24 += 8;
          *(_QWORD *)v26 = v27;
          v26 += 8;
        }
        while (v26 < v10);
      }
    }
  }
  else if (a3 == 1)
  {
    if (*a1)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t LZ4_count(unint64_t a1, _DWORD *a2, unint64_t a3)
{
  _DWORD *v3;
  unint64_t v4;

  v3 = (_DWORD *)a1;
  if (a3 - 7 <= a1)
  {
LABEL_4:
    if ((unint64_t)v3 < a3 - 3 && *a2 == *v3)
    {
      ++v3;
      ++a2;
    }
    if ((unint64_t)v3 < a3 - 1 && *(unsigned __int16 *)a2 == *(unsigned __int16 *)v3)
    {
      v3 = (_DWORD *)((char *)v3 + 2);
      a2 = (_DWORD *)((char *)a2 + 2);
    }
    if ((unint64_t)v3 < a3 && *(unsigned __int8 *)a2 == *(unsigned __int8 *)v3)
      LODWORD(v3) = (_DWORD)v3 + 1;
  }
  else
  {
    while (1)
    {
      v4 = *(_QWORD *)v3 ^ *(_QWORD *)a2;
      if (v4)
        break;
      v3 += 2;
      a2 += 2;
      if ((unint64_t)v3 >= a3 - 7)
        goto LABEL_4;
    }
    v3 = (_DWORD *)((char *)v3 + (__clz(__rbit64(v4)) >> 3));
  }
  return ((_DWORD)v3 - a1);
}

uint64_t LZ4_compress_destSize_generic(uint64_t a1, char *__src, unint64_t a3, int *a4, int a5, int a6)
{
  uint64_t result;
  uint64_t v8;
  int v10;
  char *v12;
  unint64_t v13;
  char v14;
  char v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  char *v34;
  char *v35;
  unsigned int v36;
  _QWORD *v38;
  unsigned int v39;
  _WORD *v40;
  uint64_t v41;
  _BYTE *v42;
  unint64_t v43;
  unsigned int v44;
  unint64_t v45;
  unint64_t v46;
  int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  size_t v52;
  _BYTE *v53;
  unint64_t v54;
  unsigned int v55;
  int v56;
  char *v57;
  unint64_t v58;
  int v60;
  char v61;
  int v62;
  unint64_t v63;

  result = 0;
  if (a5 < 1)
    return result;
  v8 = *a4;
  if (v8 > 0x7E000000)
    return result;
  v10 = a3;
  if (a6 == 2 && v8 > 0x1000A)
    return 0;
  v57 = &__src[v8];
  v58 = a3 + a5;
  v12 = __src;
  v13 = a3;
  v60 = a3;
  if (v8 < 0xD)
    goto LABEL_64;
  v14 = a6 == 2 ? 13 : 12;
  v15 = 40 - v14;
  *a4 = 0;
  v16 = -1 << v14;
  v17 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)__src) >> v15) & ~v16;
  if (a6 == 2)
  {
    *(_WORD *)(a1 + 2 * v17) = 0;
  }
  else if (a6 == 1)
  {
    *(_DWORD *)(a1 + 4 * v17) = 0;
  }
  v12 = __src;
  v13 = a3;
  if (v8 < 0xE)
    goto LABEL_64;
  v18 = (unint64_t)(v57 - 12);
  v63 = v58 - 6;
  v19 = ~v16;
  v20 = __src + 2;
  v13 = a3;
  v12 = __src;
  v62 = ~v16;
  v61 = v15;
LABEL_16:
  v21 = v12 + 1;
  v22 = *(_QWORD *)(v12 + 1);
  v23 = 65;
  v24 = 1;
  while (1)
  {
    v25 = v20;
    v26 = ((unint64_t)(0xCF1BBCDCBBLL * v22) >> v15) & v19;
    v22 = *(_QWORD *)v20;
    if (a6 == 1)
    {
      v27 = &__src[*(unsigned int *)(a1 + 4 * v26)];
      *(_DWORD *)(a1 + 4 * v26) = (_DWORD)v21 - (_DWORD)__src;
      goto LABEL_21;
    }
    v27 = &__src[*(unsigned __int16 *)(a1 + 2 * v26)];
    if (a6 == 2)
      break;
LABEL_21:
    if (v27 + 0xFFFF >= v21)
      goto LABEL_22;
LABEL_23:
    v20 = &v25[v24];
    v24 = v23++ >> 6;
    v21 = v25;
    if ((unint64_t)v20 > v18)
      goto LABEL_64;
  }
  *(_WORD *)(a1 + 2 * v26) = (_WORD)v21 - (_WORD)__src;
LABEL_22:
  if (*(_DWORD *)v27 != *(_DWORD *)v21)
    goto LABEL_23;
  v28 = 0;
  v29 = (_DWORD)v21 - (_DWORD)v12;
  v30 = (_DWORD)v21 - (_DWORD)v12 - 270;
  v31 = v30;
  do
  {
    v32 = v31;
    v33 = v28;
    v34 = &v21[v28];
    v35 = &v27[v28];
    v36 = (_DWORD)v21 + v28 - (_DWORD)v12;
    if (&v21[v28] <= v12 || v35 <= __src)
      break;
    --v31;
    --v28;
  }
  while (*(v34 - 1) == *(v35 - 1));
  v38 = (_QWORD *)(v13 + 1);
  if (v13 + 1 + (v29 + v33 + 240) / 0xFFuLL + v36 <= v58 - 11)
  {
    if ((v29 + v33) < 0xF)
    {
      *(_BYTE *)v13 = 16 * v36;
    }
    else
    {
      v39 = v29 - 15 + v33;
      *(_BYTE *)v13 = -16;
      if (v39 > 0xFE)
      {
        v55 = v33 + v30;
        v56 = v30 + v33;
        memset(v38, 255, (v30 + v33) / 0xFFu + 1);
        v39 = v56 - 255 * (v32 / 0xFF);
        v38 = (_QWORD *)(v13 + v55 / 0xFFuLL + 2);
      }
      *(_BYTE *)v38 = v39;
      v38 = (_QWORD *)((char *)v38 + 1);
    }
    v40 = (_WORD *)((char *)v38 + v36);
    do
    {
      v41 = *(_QWORD *)v12;
      v12 += 8;
      *v38++ = v41;
    }
    while (v38 < (_QWORD *)v40);
    v12 = v34;
    while (1)
    {
      v42 = (_BYTE *)v13;
      *v40 = (_WORD)v12 - (_WORD)v35;
      v13 = (unint64_t)(v40 + 1);
      v43 = (unint64_t)(v12 + 4);
      v44 = LZ4_count(v43, (_DWORD *)v35 + 1, (unint64_t)(v57 - 5));
      v45 = (unint64_t)((unint64_t)v40
                             + ((((unint64_t)v44 + 240) * (unsigned __int128)0x101010101010102uLL) >> 64)
                             + 2) <= v63
          ? v44
          : 255 * (v63 - v13) + 14;
      v46 = v45 - 15;
      if (v45 < 0xF)
      {
        *v42 += v45;
        v18 = (unint64_t)(v57 - 12);
        v19 = v62;
      }
      else
      {
        *v42 += 15;
        if (v46 >= 0xFF)
        {
          memset(v40 + 1, 255, (v45 - 270) / 0xFF + 1);
          v15 = v61;
          LOBYTE(v46) = (v45 - 270) / 0xFF + v45 - 14;
          v13 = (unint64_t)v40 + (v45 - 270) / 0xFF + 3;
        }
        v18 = (unint64_t)(v57 - 12);
        v19 = v62;
        *(_BYTE *)v13++ = v46;
      }
      v12 = (char *)(v43 + v45);
      if ((unint64_t)v12 > v18 || v13 > v58 - 12)
        break;
      v48 = (_DWORD)v12 - 2;
      v49 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)(v12 - 2)) >> v15) & v19;
      if (a6 == 1)
      {
        *(_DWORD *)(a1 + 4 * v49) = v48 - (_DWORD)__src;
        v51 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)v12) >> v15) & v19;
        v35 = &__src[*(unsigned int *)(a1 + 4 * v51)];
        *(_DWORD *)(a1 + 4 * v51) = (_DWORD)v12 - (_DWORD)__src;
      }
      else if (a6 == 2)
      {
        *(_WORD *)(a1 + 2 * v49) = v48 - (_WORD)__src;
        v50 = ((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)v12) >> v15) & v19;
        v35 = &__src[*(unsigned __int16 *)(a1 + 2 * v50)];
        *(_WORD *)(a1 + 2 * v50) = (_WORD)v12 - (_WORD)__src;
      }
      else
      {
        v35 = &__src[*(unsigned __int16 *)(a1
                                         + 2
                                         * (((unint64_t)(0xCF1BBCDCBBLL * *(_QWORD *)v12) >> v15) & v19))];
      }
      if (v35 + 0xFFFF < v12 || *(_DWORD *)v35 != *(_DWORD *)v12)
      {
        v20 = v12 + 2;
        v10 = v60;
        if ((unint64_t)(v12 + 2) <= v18)
          goto LABEL_16;
        goto LABEL_64;
      }
      *(_BYTE *)v13 = 0;
      v40 = (_WORD *)(v13 + 1);
    }
  }
  v10 = v60;
LABEL_64:
  v52 = v57 - v12;
  v53 = (_BYTE *)(v13 + 1);
  if (v13 + 1 + (v57 - v12 + 240) / 0xFFuLL + v57 - v12 > v58)
    v52 = ~v13 + v58 - (~v13 + v58 + 240) / 0xFF;
  v54 = v52 - 15;
  if (v52 < 0xF)
  {
    *(_BYTE *)v13 = 16 * v52;
  }
  else
  {
    *(_BYTE *)v13 = -16;
    if (v54 >= 0xFF)
    {
      memset(v53, 255, (v52 - 270) / 0xFF + 1);
      v54 = (v52 - 270) % 0xFF;
      v10 = v60;
      v53 = (_BYTE *)(v13 + (v52 - 270) / 0xFF + 2);
    }
    *v53 = v54;
    v13 = (unint64_t)v53;
  }
  memcpy((void *)(v13 + 1), v12, v52);
  *a4 = (_DWORD)v12 + v52 - (_DWORD)__src;
  return (v13 + 1 + v52 - v10);
}

void sub_216F2CA60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
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

void sub_216F2CEC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_216F2D490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F2D668(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F2D7F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F2EE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F2F024(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F2FC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F2FCD8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F31864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_216F319C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_216F31E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F32520(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_216F327C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F32958(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F32D60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_216F3303C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F331E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F338D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F33B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F340D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_216F34550(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_216F346A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F34C80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_216F34DD8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F35524(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_216F35910(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_216F35A68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F36034(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_216F3618C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_216F36770(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_216F37738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F37A3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_216F37EB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_16(id a1)
{
  return objc_retainAutorelease(a1);
}

void OUTLINED_FUNCTION_24(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
}

uint64_t OUTLINED_FUNCTION_25(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2114;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void OUTLINED_FUNCTION_27(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_30(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return objc_opt_class();
}

void sub_216F39C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
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

void sub_216F3A260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PizBufGenerateRaw(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  initialize();
  v4 = generate((uint64_t)v3, a2, 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void initialize()
{
  CFNumberRef v0;
  int v1;
  int v2;
  int valuePtr;

  if (initialized == 1)
  {
    __dmb(0xFu);
  }
  else
  {
    stringType = CFStringGetTypeID();
    dataType = CFDataGetTypeID();
    numberType = CFNumberGetTypeID();
    BOOLType = CFBooleanGetTypeID();
    dateType = CFDateGetTypeID();
    dictType = CFDictionaryGetTypeID();
    arrayType = CFArrayGetTypeID();
    CFSetGetTypeID();
    CFNullGetTypeID();
    CFUUIDGetTypeID();
    CFURLGetTypeID();
    valuePtr = -1;
    do
    {
      v0 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      v1 = valuePtr;
      v2 = valuePtr + 1;
      numbers[v2] = v0;
      valuePtr = v2;
    }
    while (v1 < 8);
    __dmb(0xFu);
    initialized = 1;
  }
}

uint64_t generate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD *v6;
  _QWORD *v7;
  __CFString *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  unint64_t i;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  size_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  float v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  const UInt8 *BytePtr;
  size_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD v48[512];
  _BYTE v49[520];

  v3 = (void *)MEMORY[0x24BDAC7A8](a1, a2, a3);
  v5 = v4;
  v7 = v6;
  v8 = v3;
  memset(v48, 0, 432);
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 256;
  v43 = v48;
  v44 = xmmword_216F4B530;
  memset(v49, 0, 512);
  v46 = 0;
  v47 = 0;
  v45 = v49;
  collectValuesRecursively(&v39, v8);
  if (v39)
  {
    v9 = v41;
    if (v41)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        if ((*(_DWORD *)((char *)v43 + v10) - 38) <= 0x11)
        {
          free(*(void **)((char *)v43 + v10 + 24));
          v9 = v41;
        }
        ++v11;
        v10 += 32;
      }
      while (v11 < v9);
    }
    if (v43 != v48)
      free(v43);
    if (v45 != v49)
      free(v45);
    if (v7)
      *v7 = objc_retainAutorelease(v39);
    else
      CFLog();
    CFRelease(v39);
    v35 = 0;
  }
  else
  {
    v12 = v40 + v5;
    v13 = (char *)malloc_type_malloc(v12, 0x9A5A75E3uLL);
    if (v12 && !v13)
      generate_cold_1();
    v37 = v5;
    v38 = &v13[v5];
    if (v41)
    {
      v14 = 0;
      for (i = 0; i < v41; ++i)
      {
        v16 = (char *)v43;
        v17 = v38;
        v18 = v38;
        *v38 = *(_DWORD *)((char *)v43 + v14);
        v19 = v18 + 1;
        v38 = v19;
        switch(*(_DWORD *)&v16[v14])
        {
          case 0xC:
          case 0x23:
          case 0x4C:
          case 0x5E:
            v17[1] = *(_QWORD *)&v16[v14 + 16];
            v22 = v17 + 2;
            goto LABEL_38;
          case 0xD:
          case 0x24:
            *(_WORD *)(v17 + 1) = *(_QWORD *)&v16[v14 + 16];
            v22 = v17 + 3;
            goto LABEL_38;
          case 0xE:
            *(_DWORD *)(v17 + 1) = *(_QWORD *)&v16[v14 + 16];
            goto LABEL_27;
          case 0xF:
          case 0x12:
            *(_QWORD *)(v17 + 1) = *(_QWORD *)&v16[v14 + 16];
            goto LABEL_37;
          case 0x10:
            v24 = &v16[v14];
            *(_QWORD *)(v17 + 1) = *((_QWORD *)v24 + 2);
            *(_QWORD *)(v17 + 9) = *((_QWORD *)v24 + 3);
            v22 = v17 + 17;
            goto LABEL_38;
          case 0x11:
            v25 = *(double *)&v16[v14 + 16];
            *(float *)(v17 + 1) = v25;
LABEL_27:
            v22 = v17 + 5;
            goto LABEL_38;
          case 0x25:
          case 0x4D:
          case 0x5F:
            v23 = *(_QWORD *)&v16[v14 + 16];
            *(_WORD *)(v17 + 1) = v23;
            v17[3] = BYTE2(v23);
            v17[4] = BYTE3(v23);
            v17[5] = BYTE4(v23);
            v17[6] = BYTE5(v23);
            v22 = v17 + 7;
            goto LABEL_38;
          case 0x26:
          case 0x27:
          case 0x28:
          case 0x29:
          case 0x2A:
          case 0x2B:
          case 0x2C:
          case 0x2D:
          case 0x2E:
          case 0x2F:
          case 0x30:
          case 0x31:
          case 0x32:
          case 0x33:
          case 0x34:
          case 0x35:
            v20 = &v16[v14];
            goto LABEL_19;
          case 0x36:
            v20 = &v16[v14];
            v17[1] = *(_QWORD *)&v16[v14 + 16];
            v19 = v17 + 2;
            goto LABEL_19;
          case 0x37:
            v20 = &v16[v14];
            v26 = *(_QWORD *)&v16[v14 + 16];
            *(_WORD *)(v17 + 1) = v26;
            v17[3] = BYTE2(v26);
            v17[4] = BYTE3(v26);
            v17[5] = BYTE4(v26);
            v17[6] = BYTE5(v26);
            v19 = v17 + 7;
LABEL_19:
            v21 = *((_QWORD *)v20 + 2);
            memcpy(v19, *((const void **)v20 + 3), v21);
            v38 = &v19[v21];
            free(*((void **)v20 + 3));
            break;
          case 0x38:
            v27 = &v16[v14];
            v17[1] = *((_QWORD *)v27 + 2);
            v28 = v17 + 2;
            goto LABEL_32;
          case 0x39:
            v27 = &v16[v14];
            v29 = *((_QWORD *)v27 + 2);
            *(_WORD *)(v17 + 1) = v29;
            v17[3] = BYTE2(v29);
            v17[4] = BYTE3(v29);
            v17[5] = BYTE4(v29);
            v17[6] = BYTE5(v29);
            v28 = v17 + 7;
LABEL_32:
            v38 = v28;
            writeUnicode16StringContents((void **)&v38, *((const __CFString **)v27 + 1), *((_QWORD *)v27 + 2));
            break;
          case 0x3A:
            v30 = &v16[v14];
            v17[1] = *(_QWORD *)&v16[v14 + 16];
            v31 = v17 + 2;
            goto LABEL_35;
          case 0x3B:
            v30 = &v16[v14];
            v32 = *(_QWORD *)&v16[v14 + 16];
            *(_WORD *)(v17 + 1) = v32;
            v17[3] = BYTE2(v32);
            v17[4] = BYTE3(v32);
            v17[5] = BYTE4(v32);
            v17[6] = BYTE5(v32);
            v31 = v17 + 7;
LABEL_35:
            BytePtr = CFDataGetBytePtr(*((CFDataRef *)v30 + 1));
            v34 = *((_QWORD *)v30 + 2);
            memcpy(v31, BytePtr, v34);
            v22 = &v31[v34];
            goto LABEL_38;
          case 0x60:
            *(double *)(v17 + 1) = MEMORY[0x219A05340](*(_QWORD *)&v16[v14 + 8]);
LABEL_37:
            v22 = v17 + 9;
LABEL_38:
            v38 = v22;
            break;
          default:
            break;
        }
        v14 += 32;
      }
    }
    if (v43 != v48)
      free(v43);
    if (v45 != v49)
      free(v45);
    v35 = v40 + v37;
  }

  return v35;
}

id PizBufGenerate(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;

  v3 = a1;
  initialize();
  v4 = generate((uint64_t)v3, a2, 1);
  if (v5)
  {
    *v5 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id PizBufGenerateCompressed(void *a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;

  v3 = a1;
  initialize();
  v4 = generate((uint64_t)v3, a2, 0);
  v6 = v5;
  if (v5)
  {
    v7 = v4;
    if (v4 >= 0x7E000001)
      PizBufGenerateCompressed_cold_5();
    v8 = LZ4_compressBound(v4);
    v9 = v8 == -1;
    v10 = v8 + 1;
    v11 = malloc_type_malloc(v10, 0x9A5A75E3uLL);
    v12 = v11;
    if (!v9 && !v11)
      generate_cold_1();
    v13 = LZ4_compress_default((uint64_t)v6, (uint64_t)(v11 + 1), v7);
    if ((int)v13 <= 0)
      PizBufGenerateCompressed_cold_3();
    v14 = v13;
    if (v7 <= v13)
    {
      *v12 = 0;
      memcpy(v12 + 1, v6, v7);
      v16 = v7 + 1;
    }
    else
    {
      v15 = v7 / v13;
      if (v15 >= 0x100)
        PizBufGenerateCompressed_cold_2();
      if (v15 < 0xF)
      {
        *v12 = v15;
        v16 = v13 + 1;
      }
      else
      {
        if ((unint64_t)v13 + 2 >= v10)
          PizBufGenerateCompressed_cold_1();
        memmove(v12 + 2, v12 + 1, v13);
        *v12 = 15;
        v12[1] = v15;
        v16 = v14 + 2;
      }
    }
    free(v6);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

CFDateRef PizBufParseRaw(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v3 = a1;
  initialize();
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");

  return parse(v4, v6, a2);
}

CFDateRef parse(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  CFDateRef Recursively;
  uint64_t v5;
  const __CFDate *v6;
  _QWORD v8[3];
  void *v9;
  __int128 v10;
  _BYTE v11[2048];
  id v12;

  v8[0] = a2;
  v8[1] = a2;
  v8[2] = a2 + a1;
  v9 = v11;
  memset(v11, 0, 464);
  v10 = xmmword_216F4B540;
  v12 = 0;
  Recursively = parseAndCreateRecursively(v8);
  if ((_QWORD)v10)
  {
    v5 = v10 - 1;
    do
      CFRelease(*((CFTypeRef *)v9 + v5--));
    while (v5 != -1);
  }
  if (v9 != v11)
    free(v9);
  if (Recursively)
  {
    if (v12)
      parse_cold_2();
    v6 = Recursively;
  }
  else
  {
    if (!v12)
      parse_cold_1();
    setError(a3, v12);
  }

  return Recursively;
}

id PizBufParse(void *a1, _QWORD *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  size_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  CFStringRef v20;
  unint64_t v21;
  char *v22;
  unsigned __int8 *v23;
  uint64_t v24;

  v3 = a1;
  initialize();
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  if (v4)
  {
    v7 = v6;
    if (frameHeader(v4, v6) < 0x10)
    {
      if ((frameHeader(v4, v7) & 0xF) == 0)
      {
        parse(v4 - 1, (uint64_t)(v7 + 1), a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if ((frameHeader(v4, v7) & 0xF) != 0)
      {
        v8 = frameHeader(v4, v7) & 0xF;
        if (v8 == 15)
        {
          if (v4 <= 1)
          {
            v9 = (const __CFString *)CFRetain(CFSTR("Frame header implies second compression ratio byte but the frame size is smaller than 2"));
LABEL_26:
            v20 = v9;
LABEL_27:
            v12 = a2;
            v11 = (void *)v20;
            goto LABEL_11;
          }
          v8 = v7[1];
          v18 = -2;
          v19 = 2;
        }
        else
        {
          v18 = -1;
          v19 = 1;
        }
        v21 = v18 + v4;
        if (v18 + v4 >= 0x7E000001)
        {
          v9 = CFStringCreateWithFormat(0, 0, CFSTR("Decompression failed because input is too big (max size is %lu, input size is %lu)"), 2113929216, v21);
          goto LABEL_26;
        }
        v15 = v21 + v21 * v8;
        if (v15 >= 0x7E000001)
        {
          v9 = CFStringCreateWithFormat(0, 0, CFSTR("Decompression failed because projected decompressed frame size is too big (max size is %lu, projected size is %lu)"), 2113929216, v15);
          goto LABEL_26;
        }
        v22 = (char *)malloc_type_malloc(v15, 0x9A5A75E3uLL);
        v17 = v22;
        if (v21 && !v22)
          generate_cold_1();
        v23 = &v7[v19];
        if (v22)
          bzero(v22, v15);
        v24 = LZ4_decompress_safe(v23, v17, v21, v15);
        if ((v24 & 0x80000000) != 0)
        {
          v20 = CFStringCreateWithFormat(0, 0, CFSTR("LZ4 decompression failed with result: %d"), v24);
          if (v17)
            free(v17);
          goto LABEL_27;
        }
      }
      else
      {
        v15 = v4 - 1;
        v16 = (char *)malloc_type_malloc(v15, 0x9A5A75E3uLL);
        v17 = v16;
        if (v15 && !v16)
          generate_cold_1();
        memcpy(v16, v7 + 1, v15);
      }
      if (v17)
      {
        parse(v15, (uint64_t)v17, a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        free(v17);
        goto LABEL_12;
      }
      v20 = 0;
      goto LABEL_27;
    }
    v10 = CFSTR("Unrecognized format version");
  }
  else
  {
    v10 = CFSTR("Empty input frame");
  }
  v11 = (void *)CFRetain(v10);
  v12 = a2;
LABEL_11:
  setError(v12, v11);
  v13 = 0;
LABEL_12:

  return v13;
}

void setError(_QWORD *a1, id a2)
{
  if (a1)
    *a1 = objc_retainAutorelease(a2);
  else
    CFLog();
  CFRelease(a2);
}

void collectValuesRecursively(_QWORD *a1, const __CFString *a2)
{
  CFTypeID v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  BOOL v19;
  unint64_t v20;
  int Value;
  UInt8 *v22;
  unsigned int v23;
  BOOL v24;
  float v25;
  double v26;
  const __CFString **v27;
  const __CFString *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  unint64_t Length;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  const __CFString **v39;
  unint64_t Count;
  unint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  const void **v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t *v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  const __CFString **v64;
  uint64_t v65;
  const __CFString *v66;
  const __CFString *v67;
  BOOL v68;
  uint64_t v69;
  const __CFString **v70;
  unint64_t v71;
  unint64_t v72;
  unsigned int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  const void **v77;
  const __CFString **v78;
  const __CFString *v79;
  BOOL v80;
  UInt8 *v81;
  char *v82;
  int v83;
  uint64_t v84;
  const __CFString *v85;
  CFStringRef v86;
  uint64_t i;
  double valuePtr;
  const __CFString *v89;
  unint64_t v90;
  uint64_t v91;
  const __CFString *v92;
  uint64_t v93;
  void *keys[2];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  CFRange v111;
  CFRange v112;
  CFRange v113;

  v110 = *MEMORY[0x24BDAC8D0];
  v4 = CFGetTypeID(a2);
  if (v4 == numberType)
  {
    keys[0] = 0;
    keys[1] = 0;
    if (CFNumberIsFloatType((CFNumberRef)a2))
    {
      valuePtr = 0.0;
      CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr);
      *(double *)&v5 = valuePtr;
      v6 = (int)valuePtr;
      if (*(_QWORD *)&valuePtr == COERCE__INT64((double)(int)valuePtr))
      {
        v5 = v6;
        v7 = 4;
        if ((__int16)v6 == v6)
        {
          v7 = 2;
          v8 = 13;
        }
        else
        {
          v8 = 14;
        }
        v9 = v6 + 3;
        if ((v6 - 9) < 0xFFFFFFF6)
          v9 = 12;
        if (v6 == (char)v6)
          v10 = (v6 - 9) < 0xFFFFFFF6;
        else
          v10 = v7;
        if (v6 == (char)v6)
          v11 = v9;
        else
          v11 = v8;
      }
      else
      {
        v25 = valuePtr;
        v26 = v25;
        if (*(_QWORD *)&valuePtr == *(_QWORD *)&v26)
          v10 = 4;
        else
          v10 = 8;
        if (*(_QWORD *)&valuePtr == *(_QWORD *)&v26)
          v11 = 17;
        else
          v11 = 18;
      }
      v22 = 0;
      goto LABEL_163;
    }
    CFNumberGetValue((CFNumberRef)a2, kCFNumberMaxType|kCFNumberSInt8Type, keys);
    v22 = (UInt8 *)keys[0];
    v5 = (uint64_t)keys[1];
    if (keys[0] == (void *)((uint64_t)keys[1] >> 63))
    {
      if (keys[1] == (void *)SLOBYTE(keys[1]))
      {
        v22 = 0;
        v23 = (LODWORD(keys[1]) << 24) - 150994944;
        v24 = v23 >= 0xF5000001;
        v10 = v23 < 0xF5000001;
        v11 = LODWORD(keys[1]) + 3;
        if (!v24)
          v11 = 12;
        goto LABEL_163;
      }
      if (keys[1] == (void *)SLODWORD(keys[1]))
      {
        v22 = 0;
        v11 = 14;
LABEL_171:
        v10 = 4;
        goto LABEL_163;
      }
      if (keys[1] == (void *)(uint64_t)(float)(uint64_t)keys[1])
      {
        v22 = 0;
        *(double *)&v5 = (float)(uint64_t)keys[1];
        v11 = 17;
        goto LABEL_171;
      }
      v22 = 0;
      v11 = 15;
LABEL_183:
      v10 = 8;
      goto LABEL_163;
    }
    v10 = 16;
    v11 = 16;
LABEL_163:
    keys[0] = (void *)v11;
    keys[1] = (void *)a2;
    *(_QWORD *)&v95 = v5;
    *((_QWORD *)&v95 + 1) = v22;
    appendValueGenerationData((uint64_t)a1, (uint64_t)keys, v10);
    return;
  }
  if (v4 == stringType)
  {
    keys[0] = 0;
    v12 = ((unint64_t)a2 >> 8)
        + ((unint64_t)a2 >> 21)
        - ((((unint64_t)a2 >> 8) + ((unint64_t)a2 >> 21)) >> 32)
        + 8 * ((((unint64_t)a2 >> 8) + ((unint64_t)a2 >> 21)) >> 32);
    v14 = a1[6];
    v13 = (_QWORD *)a1[7];
    v15 = (v14 - 1) & v12;
    v16 = 2 * v15;
    v17 = -1;
    while (v15 != v17)
    {
      v18 = (const __CFString *)v13[v16];
      ++v17;
      v16 -= 2;
      if (v18)
        v19 = v18 == a2;
      else
        v19 = 1;
      if (v19)
      {
        v20 = v15 - v17;
        goto LABEL_45;
      }
    }
    v27 = (const __CFString **)&v13[2 * v14 - 2];
    v20 = a1[6];
    do
    {
      if (v20 <= v15)
        collectValuesRecursively_cold_3();
      --v20;
      v28 = *v27;
      v27 -= 2;
      v18 = v28;
      if (v28)
        v29 = v18 == a2;
      else
        v29 = 1;
    }
    while (!v29);
LABEL_45:
    if (v18)
    {
      v30 = v13[2 * v20 + 1];
      if (v30 != -1)
      {
        v31 = 1;
        v32 = 6;
        if (v30 >= 0xFFFF)
        {
          v33 = 37;
        }
        else
        {
          v32 = 2;
          v33 = 36;
        }
        if (v30 < 0xFF)
        {
          v34 = 35;
        }
        else
        {
          v31 = v32;
          v34 = v33;
        }
        if (v30 <= 0xE)
          v10 = 0;
        else
          v10 = v31;
        v22 = 0;
        if (v30 <= 0xE)
          *(double *)&v5 = 0.0;
        else
          v5 = v30;
        if (v30 <= 0xE)
          v11 = v30 + 19;
        else
          v11 = v34;
        goto LABEL_163;
      }
    }
    else
    {
      v36 = a1[5];
      if (v36 >= v14 >> 1)
      {
        a1[6] = 2 * v14;
        a1[7] = malloc_type_calloc(0x10uLL, 2 * v14, 0xFF895670uLL);
        while (v14)
        {
          --v14;
          v48 = &v13[2 * v14];
          v49 = *v48;
          if (*v48)
          {
            v50 = a1[6];
            v51 = a1[7];
            v52 = (v50 - 1) & ((v49 >> 8)
                             + (v49 >> 21)
                             - (((v49 >> 8) + (v49 >> 21)) >> 32)
                             + 8 * (((v49 >> 8) + (v49 >> 21)) >> 32));
            v53 = (uint64_t *)(v51 + 16 * v52);
            v54 = -1;
            while (v52 != v54)
            {
              v56 = *v53;
              v53 -= 2;
              v55 = v56;
              ++v54;
              if (v56)
                v57 = v55 == v49;
              else
                v57 = 1;
              if (v57)
              {
                v50 = v52 - v54;
                goto LABEL_106;
              }
            }
            v58 = (uint64_t *)(v51 + 16 * v50 - 16);
            do
            {
              if (v50 <= v52)
                collectValuesRecursively_cold_3();
              --v50;
              v59 = *v58;
              v58 -= 2;
              v55 = v59;
              if (v59)
                v60 = v55 == v49;
              else
                v60 = 1;
            }
            while (!v60);
LABEL_106:
            if (v55)
              collectValuesRecursively_cold_4();
            *(_OWORD *)(v51 + 16 * v50) = *(_OWORD *)v48;
          }
        }
        if (v13 != a1 + 1034)
          free(v13);
        v61 = a1[6];
        v62 = a1[7];
        v63 = (v61 + 0x3FFFFFFFFFFFFFFLL) & v12;
        v64 = (const __CFString **)(v62 + 16 * v63);
        v65 = -1;
        while (v63 != v65)
        {
          v67 = *v64;
          v64 -= 2;
          v66 = v67;
          ++v65;
          if (v67)
            v68 = v66 == a2;
          else
            v68 = 1;
          if (v68)
          {
            v61 = v63 - v65;
            goto LABEL_142;
          }
        }
        v78 = (const __CFString **)(v62 + 16 * v61 - 16);
        do
        {
          if (v61 <= v63)
            collectValuesRecursively_cold_3();
          --v61;
          v79 = *v78;
          v78 -= 2;
          v66 = v79;
          if (v79)
            v80 = v66 == a2;
          else
            v80 = 1;
        }
        while (!v80);
LABEL_142:
        if (v66)
          collectValuesRecursively_cold_2();
        v37 = (_QWORD *)(v62 + 16 * v61);
        v36 = a1[5];
      }
      else
      {
        v37 = &v13[2 * v20];
      }
      *v37 = a2;
      a1[5] = v36 + 1;
      v37[1] = v36;
    }
    *(double *)&v5 = COERCE_DOUBLE(CFStringGetLength(a2));
    v81 = (UInt8 *)malloc_type_malloc(v5, 0x9A5A75E3uLL);
    v22 = v81;
    if (*(double *)&v5 != 0.0 && !v81)
      generate_cold_1();
    v112.location = 0;
    v112.length = v5;
    if (CFStringGetBytes(a2, v112, 0x600u, 0, 0, v81, v5, (CFIndex *)keys) == v5)
    {
      v5 = (uint64_t)keys[0];
      v82 = (char *)keys[0] + 6;
      if (keys[0] > (void *)0xFF)
      {
        v83 = 55;
      }
      else
      {
        v82 = (char *)keys[0] + 1;
        v83 = 54;
      }
      if ((uint64_t)keys[0] <= 15)
        v10 = (uint64_t)keys[0];
      else
        v10 = (uint64_t)v82;
      if ((uint64_t)keys[0] <= 15)
        v11 = LODWORD(keys[0]) + 38;
      else
        v11 = v83;
    }
    else
    {
      free(v22);
      if (v5 <= 255)
        v10 = (2 * v5) | 1;
      else
        v10 = 2 * v5 + 6;
      v22 = 0;
      if (v5 <= 255)
        v11 = 56;
      else
        v11 = 57;
    }
    goto LABEL_163;
  }
  if (v4 == BOOLType)
  {
    Value = CFBooleanGetValue((CFBooleanRef)a2);
    v10 = 0;
    v22 = 0;
    *(double *)&v5 = 0.0;
    v11 = Value != 0;
    goto LABEL_163;
  }
  if (v4 == dataType)
  {
    Length = CFDataGetLength((CFDataRef)a2);
    v5 = Length;
    v22 = 0;
    if (Length < 0x100)
      v10 = Length + 1;
    else
      v10 = Length + 6;
    if (Length < 0x100)
      v11 = 58;
    else
      v11 = 59;
    goto LABEL_163;
  }
  if (v4 == dictType)
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    *(_OWORD *)keys = 0u;
    v95 = 0u;
    v38 = a1[8];
    if (v38)
    {
      v39 = (const __CFString **)a1[8];
      while (*v39 != a2)
      {
        v39 = (const __CFString **)v39[1];
        if (!v39)
          goto LABEL_77;
      }
      if (!*a1)
      {
        v85 = CFSTR("Payloads cannot contain recursive dictionaries");
LABEL_192:
        *a1 = CFRetain(v85);
        return;
      }
      return;
    }
LABEL_77:
    v92 = a2;
    v93 = v38;
    a1[8] = &v92;
    Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    v41 = Count;
    v42 = Count + 78;
    v43 = 6;
    if (Count >= 0x100)
    {
      v44 = 95;
    }
    else
    {
      v43 = 1;
      v44 = 94;
    }
    if (Count >= 0x10)
      v42 = v44;
    *(_QWORD *)&valuePtr = v42;
    if (Count >= 0x10)
      v45 = v43;
    else
      v45 = 0;
    v89 = a2;
    v90 = Count;
    v91 = 0;
    appendValueGenerationData((uint64_t)a1, (uint64_t)&valuePtr, v45);
    v46 = 2 * v41;
    if (2 * v41 >= 0x21)
    {
      v47 = (const void **)mallocOrAbort(16 * v41);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v47, &v47[v41]);
    }
    else
    {
      v47 = (const void **)keys;
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, (const void **)keys, (const void **)&keys[v41]);
      if (!v46)
      {
LABEL_177:
        a1[8] = v93;
        return;
      }
    }
    v84 = 0;
    do
      collectValuesRecursively(a1, v47[v84++]);
    while (v46 != v84);
    if (v47 != (const void **)keys)
      free(v47);
    goto LABEL_177;
  }
  if (v4 != arrayType)
  {
    if (v4 == dateType)
    {
      v22 = 0;
      *(double *)&v5 = 0.0;
      v11 = 96;
      goto LABEL_183;
    }
    if (!*a1)
    {
      v86 = CFCopyTypeIDDescription(v4);
      *a1 = CFStringCreateWithFormat(0, 0, CFSTR("Payloads cannot contain objects of type '%@'"), v86);
      CFRelease(v86);
    }
    return;
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  *(_OWORD *)keys = 0u;
  v95 = 0u;
  v69 = a1[9];
  if (!v69)
  {
LABEL_124:
    v92 = a2;
    v93 = v69;
    a1[9] = &v92;
    v71 = CFArrayGetCount((CFArrayRef)a2);
    v72 = v71;
    v73 = v71 + 60;
    v74 = 6;
    if (v71 >= 0x100)
    {
      v75 = 77;
    }
    else
    {
      v74 = 1;
      v75 = 76;
    }
    if (v71 >= 0x10)
      v73 = v75;
    *(_QWORD *)&valuePtr = v73;
    if (v71 >= 0x10)
      v76 = v74;
    else
      v76 = 0;
    v89 = a2;
    v90 = v71;
    v91 = 0;
    appendValueGenerationData((uint64_t)a1, (uint64_t)&valuePtr, v76);
    if (v72 >= 0x21)
    {
      v77 = (const void **)mallocOrAbort(8 * v72);
      v113.location = 0;
      v113.length = v72;
      CFArrayGetValues((CFArrayRef)a2, v113, v77);
    }
    else
    {
      v77 = (const void **)keys;
      v111.location = 0;
      v111.length = v72;
      CFArrayGetValues((CFArrayRef)a2, v111, (const void **)keys);
      if (!v72)
      {
LABEL_189:
        a1[9] = v93;
        return;
      }
    }
    for (i = 0; i != v72; ++i)
      collectValuesRecursively(a1, v77[i]);
    if (v77 != (const void **)keys)
      free(v77);
    goto LABEL_189;
  }
  v70 = (const __CFString **)a1[9];
  while (*v70 != a2)
  {
    v70 = (const __CFString **)v70[1];
    if (!v70)
      goto LABEL_124;
  }
  if (!*a1)
  {
    v85 = CFSTR("Payloads cannot contain recursive arrays");
    goto LABEL_192;
  }
}

void *mallocOrAbort(size_t a1)
{
  void *result;

  result = malloc_type_malloc(a1, 0x9A5A75E3uLL);
  if (a1)
  {
    if (!result)
      generate_cold_1();
  }
  return result;
}

void writeUnicode16StringContents(void **a1, const __CFString *a2, CFIndex a3)
{
  size_t v6;
  UniChar *v7;
  UniChar *v8;
  CFRange v9;

  v6 = 2 * a3;
  v7 = (UniChar *)malloc_type_malloc(2 * a3, 0x9A5A75E3uLL);
  v8 = v7;
  if (v6 && !v7)
    generate_cold_1();
  v9.location = 0;
  v9.length = a3;
  CFStringGetCharacters(a2, v9, v7);
  memcpy(*a1, v8, v6);
  *a1 = (char *)*a1 + v6;
  free(v8);
}

__n128 appendValueGenerationData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  _OWORD *v13;
  __n128 result;
  __int128 v15;

  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) += a3 + 1;
  if (v5 == *(_QWORD *)(a1 + 24))
  {
    v6 = *(const void **)(a1 + 32);
    v7 = v5 << 6;
    if (v6 == (const void *)(a1 + 80))
    {
      v10 = malloc_type_malloc(v5 << 6, 0x9A5A75E3uLL);
      if (v7)
        v11 = v10 == 0;
      else
        v11 = 0;
      if (v11)
        generate_cold_1();
      *(_QWORD *)(a1 + 32) = v10;
      memcpy(v10, v6, 32 * *(_QWORD *)(a1 + 16));
    }
    else
    {
      v8 = malloc_type_realloc(*(void **)(a1 + 32), v5 << 6, 0x6089071BuLL);
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 0;
      if (v9)
        appendValueGenerationData_cold_2();
      *(_QWORD *)(a1 + 32) = v8;
    }
    *(_QWORD *)(a1 + 24) = 2 * v5;
    v5 = *(_QWORD *)(a1 + 16);
  }
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v5 + 1;
  v13 = (_OWORD *)(v12 + 32 * v5);
  result = *(__n128 *)a2;
  v15 = *(_OWORD *)(a2 + 16);
  *v13 = *(_OWORD *)a2;
  v13[1] = v15;
  return result;
}

CFDateRef parseAndCreateRecursively(_QWORD *a1)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  unint64_t v6;
  const void *v7;
  unint64_t v8;
  CFStringRef v11;
  CFTypeRef *v12;
  CFNumberType v13;
  unsigned __int8 *v14;
  __int16 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFIndex v41;
  unsigned __int8 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFAbsoluteTime v47;
  __int128 valuePtr;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int8 *)a1[1];
  v3 = (unsigned __int8 *)a1[2];
  if (v3 == v2)
  {
LABEL_61:
    v42 = &v3[-*a1];
    v43 = 1;
  }
  else
  {
    v4 = v2 + 1;
    a1[1] = v2 + 1;
    v5 = *v2;
    switch(*v2)
    {
      case 0u:
        v12 = (CFTypeRef *)MEMORY[0x24BDBD268];
        return (CFDateRef)CFRetain(*v12);
      case 1u:
        v12 = (CFTypeRef *)MEMORY[0x24BDBD270];
        return (CFDateRef)CFRetain(*v12);
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
        return (CFDateRef)CFRetain((CFTypeRef)numbers[v5 - 2]);
      case 0xCu:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        LOBYTE(valuePtr) = v2[1];
        v13 = kCFNumberSInt8Type;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0xDu:
        if ((unint64_t)(v3 - v4) <= 1)
          goto LABEL_73;
        v14 = v2 + 3;
        v15 = *(_WORD *)(v2 + 1);
        a1[1] = v14;
        LOWORD(valuePtr) = v15;
        v13 = kCFNumberSInt16Type;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0xEu:
        if ((unint64_t)(v3 - v4) <= 3)
          goto LABEL_72;
        v16 = *(_DWORD *)(v2 + 1);
        a1[1] = v2 + 5;
        LODWORD(valuePtr) = v16;
        v13 = kCFNumberSInt32Type;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0xFu:
        if ((unint64_t)(v3 - v4) <= 7)
          goto LABEL_71;
        v17 = *(_QWORD *)(v2 + 1);
        a1[1] = v2 + 9;
        *(_QWORD *)&valuePtr = v17;
        v13 = kCFNumberSInt64Type;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0x10u:
        if ((unint64_t)(v3 - v4) > 0xF)
        {
          v18 = *(_QWORD *)(v2 + 1);
          a1[1] = v2 + 9;
          *((_QWORD *)&valuePtr + 1) = v18;
          v19 = *(_QWORD *)(v2 + 9);
          a1[1] = v2 + 17;
          *(_QWORD *)&valuePtr = v19;
          v13 = kCFNumberMaxType|kCFNumberSInt8Type;
          return CFNumberCreate(0, v13, &valuePtr);
        }
        v42 = &v4[-*a1];
        v43 = 16;
        break;
      case 0x11u:
        if ((unint64_t)(v3 - v4) <= 3)
        {
LABEL_72:
          v42 = &v4[-*a1];
          v43 = 4;
          break;
        }
        v20 = *(_DWORD *)(v2 + 1);
        a1[1] = v2 + 5;
        LODWORD(valuePtr) = v20;
        v13 = kCFNumberFloat32Type;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0x12u:
        if ((unint64_t)(v3 - v4) <= 7)
          goto LABEL_71;
        v21 = *(_QWORD *)(v2 + 1);
        a1[1] = v2 + 9;
        *(_QWORD *)&valuePtr = v21;
        v13 = kCFNumberDoubleType;
        return CFNumberCreate(0, v13, &valuePtr);
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
        v6 = (v5 - 19);
        if (a1[4] > v6)
        {
          v7 = *(const void **)(a1[3] + 8 * v6);
          CFRetain(v7);
          return (CFDateRef)v7;
        }
        v11 = CFStringCreateWithFormat(0, 0, CFSTR("Invalid string index: %lu"), (v5 - 19));
        goto LABEL_63;
      case 0x23u:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v22 = v2[1];
        return (CFDateRef)getParsedString(a1, v22);
      case 0x24u:
        if ((unint64_t)(v3 - v4) <= 1)
        {
LABEL_73:
          v42 = &v4[-*a1];
          v43 = 2;
          break;
        }
        v22 = *(unsigned __int16 *)(v2 + 1);
        a1[1] = v2 + 3;
        return (CFDateRef)getParsedString(a1, v22);
      case 0x25u:
        if ((unint64_t)(v3 - v4) <= 5)
          goto LABEL_68;
        v23 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v24 = v2[5];
        v25 = v2[6];
        a1[1] = v2 + 7;
        v22 = v23 | (v24 << 32) | (v25 << 40);
        return (CFDateRef)getParsedString(a1, v22);
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
      case 0x33u:
      case 0x34u:
      case 0x35u:
        v8 = (v5 - 38);
        return (CFDateRef)readASCIIString(a1, v8);
      case 0x36u:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v8 = v2[1];
        return (CFDateRef)readASCIIString(a1, v8);
      case 0x37u:
        if ((unint64_t)(v3 - v4) <= 5)
          goto LABEL_68;
        v26 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v27 = v2[5];
        v28 = v2[6];
        a1[1] = v2 + 7;
        v8 = v26 | (v27 << 32) | (v28 << 40);
        return (CFDateRef)readASCIIString(a1, v8);
      case 0x38u:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v29 = v2[1];
        return (CFDateRef)readUnicode16String(a1, v29);
      case 0x39u:
        if ((unint64_t)(v3 - v4) <= 5)
          goto LABEL_68;
        v30 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v31 = v2[5];
        v32 = v2[6];
        a1[1] = v2 + 7;
        v29 = v30 | (v31 << 32) | (v32 << 40);
        return (CFDateRef)readUnicode16String(a1, v29);
      case 0x3Au:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v33 = v2[1];
        return readData(a1, v33);
      case 0x3Bu:
        if ((unint64_t)(v3 - v4) <= 5)
          goto LABEL_68;
        v34 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v35 = v2[5];
        v36 = v2[6];
        a1[1] = v2 + 7;
        v33 = v34 | (v35 << 32) | (v36 << 40);
        return readData(a1, v33);
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
        *(_QWORD *)&v55 = 0;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        valuePtr = 0u;
        return parseAndCreateArrayWithBuffer((int)a1, (const void **)&valuePtr, (v5 - 60));
      case 0x4Cu:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v37 = v2[1];
        return parseAndCreateArray(a1, v37);
      case 0x4Du:
        if ((unint64_t)(v3 - v4) <= 5)
          goto LABEL_68;
        v38 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v39 = v2[5];
        v40 = v2[6];
        a1[1] = v2 + 7;
        v37 = v38 | (v39 << 32) | (v40 << 40);
        return parseAndCreateArray(a1, v37);
      case 0x4Eu:
      case 0x4Fu:
      case 0x50u:
      case 0x51u:
      case 0x52u:
      case 0x53u:
      case 0x54u:
      case 0x55u:
      case 0x56u:
      case 0x57u:
      case 0x58u:
      case 0x59u:
      case 0x5Au:
      case 0x5Bu:
      case 0x5Cu:
      case 0x5Du:
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        valuePtr = 0u;
        return parseAndCreateDictionaryWithBuffer((int)a1, (const void **)&valuePtr, (v5 - 78));
      case 0x5Eu:
        if (v3 == v4)
          goto LABEL_61;
        a1[1] = v2 + 2;
        v41 = v2[1];
        return parseDictionary(a1, v41);
      case 0x5Fu:
        if ((unint64_t)(v3 - v4) <= 5)
        {
LABEL_68:
          v42 = &v4[-*a1];
          v43 = 6;
          break;
        }
        v44 = *(unsigned int *)(v2 + 1);
        a1[1] = v2 + 5;
        v45 = v2[5];
        v46 = v2[6];
        a1[1] = v2 + 7;
        v41 = v44 | (v45 << 32) | (v46 << 40);
        return parseDictionary(a1, v41);
      case 0x60u:
        if ((unint64_t)(v3 - v4) > 7)
        {
          v47 = *(double *)(v2 + 1);
          a1[1] = v2 + 9;
          return CFDateCreate(0, v47);
        }
LABEL_71:
        v42 = &v4[-*a1];
        v43 = 8;
        break;
      default:
        v11 = CFStringCreateWithFormat(0, 0, CFSTR("Wrong value kind: %u"), *v2);
        goto LABEL_63;
    }
  }
  v11 = CFStringCreateWithFormat(0, 0, CFSTR("Out of bounds: at offset %lu, trying to read %lu bytes"), v42, v43);
LABEL_63:
  v7 = 0;
  a1[262] = v11;
  return (CFDateRef)v7;
}

const void *getParsedString(_QWORD *a1, unint64_t a2)
{
  const void *v2;

  if (a1[4] <= a2)
  {
    v2 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Invalid string index: %lu"), a2);
  }
  else
  {
    v2 = *(const void **)(a1[3] + 8 * a2);
    CFRetain(v2);
  }
  return v2;
}

CFStringRef readASCIIString(_QWORD *a1, unint64_t numBytes)
{
  const UInt8 *v4;
  CFStringRef v5;

  v4 = (const UInt8 *)a1[1];
  if (a1[2] - (_QWORD)v4 >= numBytes)
  {
    v5 = CFStringCreateWithBytes(0, v4, numBytes, 0x600u, 0);
    a1[1] += numBytes;
    addParsedString((uint64_t)a1, v5);
  }
  else
  {
    v5 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Out of bounds: at offset %lu, trying to read %lu bytes"), &v4[-*a1], numBytes);
  }
  return v5;
}

CFStringRef readUnicode16String(_QWORD *a1, CFIndex numChars)
{
  CFIndex v4;
  const UniChar *v5;
  CFStringRef v6;

  v4 = 2 * numChars;
  v5 = (const UniChar *)a1[1];
  if (a1[2] - (_QWORD)v5 >= (unint64_t)(2 * numChars))
  {
    v6 = CFStringCreateWithCharacters(0, v5, numChars);
    a1[1] += v4;
    addParsedString((uint64_t)a1, v6);
  }
  else
  {
    v6 = 0;
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Out of bounds: at offset %lu, trying to read %lu bytes"), (char *)v5 - *a1, v4);
  }
  return v6;
}

CFDataRef readData(_QWORD *a1, unint64_t length)
{
  const UInt8 *v4;
  CFDataRef result;

  v4 = (const UInt8 *)a1[1];
  if (a1[2] - (_QWORD)v4 >= length)
  {
    result = CFDataCreate(0, v4, length);
    a1[1] += length;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Out of bounds: at offset %lu, trying to read %lu bytes"), &v4[-*a1], length);
    return 0;
  }
  return result;
}

CFArrayRef parseAndCreateArrayWithBuffer(int a1, const void **values, CFIndex numValues)
{
  CFIndex v3;
  const void **v4;
  uint64_t v6;
  uint64_t Recursively;
  CFArrayRef i;
  const void *v9;
  uint64_t j;

  v3 = numValues;
  v4 = values;
  if (!numValues)
    return CFArrayCreate(0, values, 0, MEMORY[0x24BDBD690]);
  v6 = 0;
  while (1)
  {
    Recursively = parseAndCreateRecursively(a1);
    if (!Recursively)
      break;
    v4[v6++] = (const void *)Recursively;
    if (v3 == v6)
    {
      for (i = CFArrayCreate(0, v4, v3, MEMORY[0x24BDBD690]); v3; --v3)
      {
        v9 = *v4++;
        CFRelease(v9);
      }
      return i;
    }
  }
  if (v6)
  {
    for (j = 0; j != v6; ++j)
      CFRelease(v4[j]);
  }
  return 0;
}

CFArrayRef parseAndCreateArray(_QWORD *a1, CFIndex a2)
{
  uint64_t v4;
  const void **v5;
  const void **v6;
  CFArrayRef ArrayWithBuffer;

  v4 = 8 * a2;
  v5 = (const void **)malloc_type_malloc(8 * a2, 0xAFE05621uLL);
  if (v5)
  {
    v6 = v5;
    ArrayWithBuffer = parseAndCreateArrayWithBuffer((int)a1, v5, a2);
    free(v6);
    return ArrayWithBuffer;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Out of memory: at offset %lu, failed to allocate %llu bytes"), a1[1] - *a1, v4);
    return 0;
  }
}

CFDictionaryRef parseAndCreateDictionaryWithBuffer(int a1, const void **keys, CFIndex numValues)
{
  const void **v4;
  CFIndex v5;
  uint64_t v7;
  uint64_t Recursively;
  CFDictionaryRef i;
  const void *v10;
  uint64_t j;

  v4 = keys;
  v5 = 2 * numValues;
  if (!(2 * numValues))
    return CFDictionaryCreate(0, keys, &keys[numValues], numValues, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = 0;
  while (1)
  {
    Recursively = parseAndCreateRecursively(a1);
    if (!Recursively)
      break;
    v4[v7++] = (const void *)Recursively;
    if (v5 == v7)
    {
      for (i = CFDictionaryCreate(0, v4, &v4[numValues], numValues, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]); v5; --v5)
      {
        v10 = *v4++;
        CFRelease(v10);
      }
      return i;
    }
  }
  if (v7)
  {
    for (j = 0; j != v7; ++j)
      CFRelease(v4[j]);
  }
  return 0;
}

CFDictionaryRef parseDictionary(_QWORD *a1, CFIndex a2)
{
  uint64_t v4;
  const void **v5;
  const void **v6;
  CFDictionaryRef DictionaryWithBuffer;

  v4 = 16 * a2;
  v5 = (const void **)malloc_type_malloc(16 * a2, 0xAFE05621uLL);
  if (v5)
  {
    v6 = v5;
    DictionaryWithBuffer = parseAndCreateDictionaryWithBuffer((int)a1, v5, a2);
    free(v6);
    return DictionaryWithBuffer;
  }
  else
  {
    a1[262] = CFStringCreateWithFormat(0, 0, CFSTR("Out of memory: at offset %lu, failed to allocate %llu bytes"), a1[1] - *a1, v4);
    return 0;
  }
}

CFTypeRef addParsedString(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  CFTypeRef result;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == *(_QWORD *)(a1 + 40))
  {
    v5 = *(const void **)(a1 + 24);
    v6 = 16 * v4;
    if (v5 == (const void *)(a1 + 48))
    {
      v9 = malloc_type_malloc(16 * v4, 0x9A5A75E3uLL);
      if (v6)
        v10 = v9 == 0;
      else
        v10 = 0;
      if (v10)
        generate_cold_1();
      *(_QWORD *)(a1 + 24) = v9;
      memcpy(v9, v5, 8 * *(_QWORD *)(a1 + 32));
    }
    else
    {
      v7 = malloc_type_realloc(*(void **)(a1 + 24), 16 * v4, 0x6089071BuLL);
      if (v6)
        v8 = v7 == 0;
      else
        v8 = 0;
      if (v8)
        appendValueGenerationData_cold_2();
      *(_QWORD *)(a1 + 24) = v7;
    }
    *(_QWORD *)(a1 + 40) = 2 * v4;
  }
  result = CFRetain(cf);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v13 + 1;
  *(_QWORD *)(v12 + 8 * v13) = result;
  return result;
}

uint64_t frameHeader(uint64_t a1, unsigned __int8 *a2)
{
  if (!a1)
    frameHeader_cold_1();
  return *a2;
}

void sub_216F3D0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F3D460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216F3E530(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id wc_pushkit_log()
{
  if (wc_pushkit_log_onceToken != -1)
    dispatch_once(&wc_pushkit_log_onceToken, &__block_literal_global_3);
  return (id)wc_pushkit_log___logger;
}

void __wc_pushkit_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.wcd", "PushKit");
  v1 = (void *)wc_pushkit_log___logger;
  wc_pushkit_log___logger = (uint64_t)v0;

}

void WCDashboardLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;

  WCDashboardClient();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logv:args:", a1, &a9);

}

id WCDashboardClient()
{
  if (WCDashboardClient_onceToken != -1)
    dispatch_once(&WCDashboardClient_onceToken, &__block_literal_global_5);
  return (id)WCDashboardClient_client;
}

void WCDashboardLogJSON(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  WCDashboardClient();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logJSON:", v1);

}

id WCTransferIdentifierFromComplicationIdentifier(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByAppendingString:", CFSTR("current-complication"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (void *)objc_msgSend(v2, "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id WCSerializePayloadDictionary(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  PizBufGenerateCompressed(a1, (uint64_t)&v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v17 = CFSTR("NSDebugDescription");
    v18[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wcErrorWithCode:userInfo:", 7010, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v8);

      v3 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  wc_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "YES";
    if (!v3)
      v10 = "NO";
    *(_DWORD *)buf = 136446466;
    v14 = "NSData *WCSerializePayloadDictionary(NSDictionary<NSString *,id> *__strong, NSError *__autoreleasing *)";
    v15 = 2082;
    v16 = v10;
    _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s success: %{public}s", buf, 0x16u);
  }

  return v3;
}

id WCDeserializePayloadData(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  PizBufParse(a1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v6 = (void *)MEMORY[0x24BDD1540];
  v18 = CFSTR("NSDebugDescription");
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wcErrorWithCode:userInfo:", 7010, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a2)
    {
      v8 = objc_retainAutorelease(v8);
      v9 = 0;
      *a2 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
LABEL_5:
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "YES";
      if (!v3)
        v11 = "NO";
      *(_DWORD *)buf = 136446466;
      v15 = "NSDictionary<NSString *,id> *WCDeserializePayloadData(NSData *__strong, NSError *__autoreleasing *)";
      v16 = 2082;
      v17 = v11;
      _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s success: %{public}s", buf, 0x16u);
    }

    v9 = v3;
    v8 = 0;
  }

  return v9;
}

uint64_t WCIsDataAcceptableSizeForType(uint64_t a1, void *a2)
{
  return WCIsSizeAcceptableForType(a1, objc_msgSend(a2, "length"));
}

uint64_t WCIsSizeAcceptableForType(uint64_t a1, uint64_t a2)
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2 < 262145;
  v5 = a2 <= 0x10000;
  if (a1)
    v5 = 0;
  if (a1 != 1)
    v4 = v5;
  if (a1 == 2)
    v6 = a2 <= 0x10000;
  else
    v6 = v4;
  wc_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    v11 = "BOOL WCIsSizeAcceptableForType(WCPayloadType, NSInteger)";
    v12 = 2082;
    v10 = 136446978;
    if ((_DWORD)v6)
      v8 = "YES";
    v13 = v8;
    v14 = 2048;
    v15 = a1;
    v16 = 2048;
    v17 = a2;
    _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s acceptable: %{public}s, type: %lu, size: %lu", (uint8_t *)&v10, 0x2Au);
  }

  return v6;
}

uint64_t WCIsFileDirectory(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v1 = *MEMORY[0x24BDBCC60];
  v11 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v12, v1, &v11);
  v3 = v12;
  v4 = v11;
  if ((_DWORD)v2)
  {
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v3, "BOOLValue");
      v7 = "NO";
      if (v6)
        v7 = "YES";
      *(_DWORD *)buf = 136446466;
      v14 = "BOOL WCIsFileDirectory(NSURL *__strong)";
      v15 = 2082;
      v16 = v7;
      _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s setting isDir %{public}s", buf, 0x16u);
    }

    v2 = objc_msgSend(v3, "BOOLValue");
  }
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "NO";
    if ((_DWORD)v2)
      v9 = "YES";
    *(_DWORD *)buf = 136446466;
    v14 = "BOOL WCIsFileDirectory(NSURL *__strong)";
    v15 = 2082;
    v16 = v9;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s returning isDir %{public}s", buf, 0x16u);
  }

  return v2;
}

id WCCheckFileAndCreateExtensionForProcess(void *a1, int a2)
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (!isAllowedFileForProcess(v3, a2))
  {
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "NSData *WCCheckFileAndCreateExtensionForProcess(NSURL *__strong, pid_t)";
      _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s File is not allowed", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "fileSystemRepresentation");
  v5 = (const char *)sandbox_extension_issue_file();
  if (!v5)
  {
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __error();
      NSPrintF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v12 = "NSData *WCCheckFileAndCreateExtensionForProcess(NSURL *__strong, pid_t)";
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Failed to issue sandbox extension for file %{public}@ due to %{public}@", buf, 0x20u);

    }
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v5, strlen(v5) + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v6;
}

BOOL isAllowedFileForProcess(void *a1, int a2)
{
  id v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  id v7;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isFileURL");
    v6 = 0;
    if ((a2 & 0x80000000) == 0 && v5)
    {
      objc_msgSend(v4, "path");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "fileSystemRepresentation");

      v6 = sandbox_check() == 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t WCConsumeSandboxToken(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4 && (v6 = malloc_type_malloc(objc_msgSend(v4, "length"), 0xCF6B25AuLL)) != 0)
  {
    v7 = v6;
    objc_msgSend(v5, "getBytes:length:", v6, objc_msgSend(v5, "length"));
    v8 = sandbox_extension_consume();
    if (v8 <= 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136446466;
        v13 = v7;
        v14 = 2114;
        v15 = v10;
        _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "Failed to consume sandbox extension %{public}s for fileURL %{public}@", (uint8_t *)&v12, 0x16u);

      }
    }
    free(v7);
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

uint64_t WCCheckFileAndConsumeSandboxTokenForAuditToken(void *a1, void *a2, _OWORD *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[16];
  __int128 v13;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");

  v8 = a3[1];
  *(_OWORD *)buf = *a3;
  v13 = v8;
  if (sandbox_check_by_audit_token())
  {
    wc_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "Failed audit token check", buf, 2u);
    }

    v10 = -1;
  }
  else
  {
    v10 = WCConsumeSandboxToken(v5, v6);
  }

  return v10;
}

uint64_t WCCheckFileAndConsumeSandboxTokenForProcessID(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a1;
  v6 = a2;
  if (isAllowedFileForProcess(v5, a3))
    v7 = WCConsumeSandboxToken(v5, v6);
  else
    v7 = -1;

  return v7;
}

id WCInboxURLInContainer(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = a2;
  objc_msgSend(v3, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Documents"), 1, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Inbox"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.watchconnectivity"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id WCApplicationSupportURLInContainer(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = a2;
  objc_msgSend(v3, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Library"), 1, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Application Support"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.watchconnectivity"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id WCSessionFilesURLInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCInboxURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("FileMetadata"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCTransferredFilesURLInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCInboxURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Files"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCTransferredUserInfoInboxURLInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCInboxURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("UserInfo"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCWatchDirectoryLocationInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCApplicationSupportURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("WatchContent"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCInboxAppContextFolderURLInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCInboxURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ApplicationContext"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCFileTransfersURLInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCApplicationSupportURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("FileTransfers"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WCUserInfoTransfersInContainer(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  WCApplicationSupportURLInContainer(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("UserInfoTransfers"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void WCDeleteItemAtURL(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v10 = "void WCDeleteItemAtURL(NSURL *__strong)";
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v1, &v8);
  v6 = v8;

  if ((v5 & 1) == 0 && v6 && objc_msgSend(v6, "code") != -1100)
  {
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      WCDeleteItemAtURL_cold_1(v1, (uint64_t)v6, v7);

  }
}

void OUTLINED_FUNCTION_13_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_216F44DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void generate_cold_1()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 291, "!size || result");
  abort();
}

void PizBufGenerateCompressed_cold_1()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 456, "(size_t)result + 2 < output.size");
  abort();
}

void PizBufGenerateCompressed_cold_2()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 445, "compressionRatioBound <= 255");
  abort();
}

void PizBufGenerateCompressed_cold_3()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 424, "result > 0");
  abort();
}

void PizBufGenerateCompressed_cold_5()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 407, "input.size <= LZ4_MAX_INPUT_SIZE");
  abort();
}

void parse_cold_1()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 2053, "parsingData.error");
  abort();
}

void parse_cold_2()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 2057, "!parsingData.error");
  abort();
}

void collectValuesRecursively_cold_2()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 690, "!entry->string");
  abort();
}

void collectValuesRecursively_cold_3()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 644, "!\"Hashtable size overflow\"");
  abort();
}

void collectValuesRecursively_cold_4()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 670, "!newEntry->string");
  abort();
}

void appendValueGenerationData_cold_2()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 299, "!newSize || result");
  abort();
}

void frameHeader_cold_1()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FATAL: %s:%d: assertion \"%s\" failed!\n", "/Library/Caches/com.apple.xbs/Sources/WatchConnectivity/Framework/pizbuf.m", 380, "frame.size");
  abort();
}

void WCDeleteItemAtURL_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_fault_impl(&dword_216F21000, a3, OS_LOG_TYPE_FAULT, "error removing item %{public}@ due to %{public}@", buf, 0x16u);

}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
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

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x24BDBBFA0]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x24BDBC090]();
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x24BDBC400]();
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x24BDBC900]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x24BE29168]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x24BDAFBE0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

