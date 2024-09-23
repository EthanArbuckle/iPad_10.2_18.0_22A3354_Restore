void os_trace_blob_destroy_slow(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  free(v1);
}

uint64_t os_trace_blob_grow(uint64_t *a1, uint64_t a2)
{
  BOOL v2;
  int v3;
  BOOL v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v10 = *((_DWORD *)a1 + 2) + ((*((_BYTE *)a1 + 22) ^ 1) & 1);
  v2 = __CFADD__(v10, a2);
  v11 = v10 + a2;
  if (v2 || v10 + a2 != v10 + (_DWORD)a2)
  {
    v12 = *((_DWORD *)a1 + 4);
  }
  else
  {
    v3 = *((_DWORD *)a1 + 3);
    v4 = __CFADD__(v3, v3);
    v5 = 2 * v3;
    v6 = v4;
    if ((v6 & 1) != 0)
    {
      v12 = *((_DWORD *)a1 + 4);
    }
    else
    {
      if (v11 <= v5)
        v7 = v5;
      else
        v7 = v10 + a2;
      if (*((_DWORD *)a1 + 4) >= v7)
      {
        if (v11 > v5)
          v5 = v10 + a2;
      }
      else
      {
        v5 = *((_DWORD *)a1 + 4);
      }
      v12 = v5;
    }
  }
  if (v12 > *((_DWORD *)a1 + 3))
  {
    if ((*((_WORD *)a1 + 10) & 1) != 0)
    {
      *a1 = _os_trace_realloc(*a1, v12);
    }
    else
    {
      v9 = *a1;
      *a1 = _os_trace_malloc(v12);
      __memcpy_chk(*a1, v9, v10, -1);
      *((_WORD *)a1 + 10) |= 1u;
    }
    *((_DWORD *)a1 + 3) = v12;
  }
  return v12 - v10;
}

uint64_t os_trace_blob_add_slow(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v4;
  unint64_t v5;

  v5 = a3;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1) - *(_DWORD *)(a1 + 8);
    if (v4 < a3)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
        v4 = os_trace_blob_grow((uint64_t *)a1, a3);
      if (v4 < v5)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        v5 = v4;
      }
    }
    __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), a2, v5, -1);
    *(_DWORD *)(a1 + 8) += v5;
    if ((*(_BYTE *)(a1 + 22) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
    return v5;
  }
}

uint64_t os_trace_blob_addns(uint64_t a1, _BYTE *a2, unint64_t a3, _QWORD *a4)
{
  char v4;
  char v5;
  _BYTE v7[4];
  _BYTE v8[4];
  _BYTE v9[3];
  _BYTE v10[9];
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  int v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  unint64_t i;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    v11 = 0;
    *(_QWORD *)&v10[1] = 0;
    v21 = v15;
    v20 = 0;
    v20 = *(_DWORD *)(v15 + 8) + ((*(_BYTE *)(v15 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v15 + 16))
    {
      v22 = *(_DWORD *)(v21 + 16) - v20;
    }
    else if (*(_DWORD *)(v21 + 12))
    {
      v22 = *(_DWORD *)(v21 + 12) - v20;
    }
    else
    {
      v22 = 0;
    }
    if (v13 > v22)
    {
      v18 = v15;
      v17 = 0;
      v17 = *(_DWORD *)(v15 + 8) + ((*(_BYTE *)(v15 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v15 + 16))
      {
        v19 = *(_DWORD *)(v18 + 16) - v17;
      }
      else if (*(_DWORD *)(v18 + 12))
      {
        v19 = *(_DWORD *)(v18 + 12) - v17;
      }
      else
      {
        v19 = 0;
      }
      v13 = v19;
    }
    while (*v14)
    {
      v26 = v14;
      v25 = v13 - *(_QWORD *)&v10[1];
      for (i = 0; i < v25; ++i)
      {
        v23 = 0;
        v23 = v26[i];
        if (!v23 || !isascii(v23))
        {
          v27 = i;
          goto LABEL_26;
        }
        if (iscntrl_l(v23, _c_locale) && !isspace_l(v23, _c_locale))
        {
          v27 = i;
          goto LABEL_26;
        }
      }
      v27 = v25;
LABEL_26:
      v11 = v27;
      v58 = v15;
      v57 = v14;
      v56 = v27;
      if ((*(_WORD *)(v15 + 20) & 2) != 0)
      {
        v59 = 0;
      }
      else
      {
        v60 = v58;
        if (v56 <= *(_DWORD *)(v60 + 12) - ((*(_BYTE *)(v60 + 22) ^ 1) & 1u) - *(_DWORD *)(v60 + 8))
        {
          __memcpy_chk(*(_QWORD *)v58 + *(unsigned int *)(v58 + 8), v57, v56, -1);
          v62 = v58;
          v61 = v56;
          *(_DWORD *)(v58 + 8) += v56;
          if ((*(_BYTE *)(v62 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v62 + *(unsigned int *)(v62 + 8)) = 0;
          v59 = v61;
        }
        else
        {
          v59 = os_trace_blob_add_slow(v58, (uint64_t)v57, v56);
        }
      }
      v14 += v11;
      *(_QWORD *)&v10[1] += v11;
      if (*(_QWORD *)&v10[1] == v13)
        break;
      v10[0] = 0;
      v10[0] = *v14;
      if (!v10[0])
        break;
      if (isascii(v10[0]))
      {
        if (*(_QWORD *)&v10[1] + 3 > v13)
          break;
        if (v10[0] == 127)
          v4 = 63;
        else
          v4 = v10[0] + 64;
        v10[0] = v4;
        qmemcpy(v9, "\\^", 2);
        v9[2] = v4;
        v51 = v15;
        v50 = v9;
        v49 = 3;
        if ((*(_WORD *)(v15 + 20) & 2) != 0)
        {
          v52 = 0;
        }
        else
        {
          v53 = v51;
          if (v49 <= *(_DWORD *)(v53 + 12) - ((*(_BYTE *)(v53 + 22) ^ 1) & 1u) - *(_DWORD *)(v53 + 8))
          {
            __memcpy_chk(*(_QWORD *)v51 + *(unsigned int *)(v51 + 8), v50, v49, -1);
            v55 = v51;
            v54 = v49;
            *(_DWORD *)(v51 + 8) += v49;
            if ((*(_BYTE *)(v55 + 22) & 1) == 0)
              *(_BYTE *)(*(_QWORD *)v55 + *(unsigned int *)(v55 + 8)) = 0;
            v52 = v54;
          }
          else
          {
            v52 = os_trace_blob_add_slow(v51, (uint64_t)v50, v49);
          }
        }
        *(_QWORD *)&v10[1] += 3;
        ++v14;
      }
      else
      {
        v11 = _os_trace_utf8_len(v14, v13 - *(_QWORD *)&v10[1]);
        if (v11 == -2)
          break;
        if (v11 == -1)
        {
          if (*(_QWORD *)&v10[1] + 4 > v13)
            break;
          v10[0] &= ~0x80u;
          if (iscntrl_l(v10[0], _c_locale))
          {
            if (v10[0] == 127)
              v5 = 63;
            else
              v5 = v10[0] + 64;
            v10[0] = v5;
            qmemcpy(v8, "\\M^", 3);
            v8[3] = v5;
            v44 = v15;
            v43 = v8;
            v42 = 4;
            if ((*(_WORD *)(v15 + 20) & 2) != 0)
            {
              v45 = 0;
            }
            else
            {
              v46 = v44;
              if (v42 <= *(_DWORD *)(v46 + 12) - ((*(_BYTE *)(v46 + 22) ^ 1) & 1u) - *(_DWORD *)(v46 + 8))
              {
                __memcpy_chk(*(_QWORD *)v44 + *(unsigned int *)(v44 + 8), v43, v42, -1);
                v48 = v44;
                v47 = v42;
                *(_DWORD *)(v44 + 8) += v42;
                if ((*(_BYTE *)(v48 + 22) & 1) == 0)
                  *(_BYTE *)(*(_QWORD *)v48 + *(unsigned int *)(v48 + 8)) = 0;
                v45 = v47;
              }
              else
              {
                v45 = os_trace_blob_add_slow(v44, (uint64_t)v43, v42);
              }
            }
          }
          else
          {
            qmemcpy(v7, "\\M-", 3);
            v7[3] = v10[0];
            v37 = v15;
            v36 = v7;
            v35 = 4;
            if ((*(_WORD *)(v15 + 20) & 2) != 0)
            {
              v38 = 0;
            }
            else
            {
              v39 = v37;
              if (v35 <= *(_DWORD *)(v39 + 12) - ((*(_BYTE *)(v39 + 22) ^ 1) & 1u) - *(_DWORD *)(v39 + 8))
              {
                __memcpy_chk(*(_QWORD *)v37 + *(unsigned int *)(v37 + 8), v36, v35, -1);
                v41 = v37;
                v40 = v35;
                *(_DWORD *)(v37 + 8) += v35;
                if ((*(_BYTE *)(v41 + 22) & 1) == 0)
                  *(_BYTE *)(*(_QWORD *)v41 + *(unsigned int *)(v41 + 8)) = 0;
                v38 = v40;
              }
              else
              {
                v38 = os_trace_blob_add_slow(v37, (uint64_t)v36, v35);
              }
            }
          }
          *(_QWORD *)&v10[1] += 4;
          ++v14;
        }
        else
        {
          v30 = v15;
          v29 = v14;
          v28 = v11;
          if ((*(_WORD *)(v15 + 20) & 2) != 0)
          {
            v31 = 0;
          }
          else
          {
            v32 = v30;
            if (v28 <= *(_DWORD *)(v32 + 12) - ((*(_BYTE *)(v32 + 22) ^ 1) & 1u) - *(_DWORD *)(v32 + 8))
            {
              __memcpy_chk(*(_QWORD *)v30 + *(unsigned int *)(v30 + 8), v29, v28, -1);
              v34 = v30;
              v33 = v28;
              *(_DWORD *)(v30 + 8) += v28;
              if ((*(_BYTE *)(v34 + 22) & 1) == 0)
                *(_BYTE *)(*(_QWORD *)v34 + *(unsigned int *)(v34 + 8)) = 0;
              v31 = v33;
            }
            else
            {
              v31 = os_trace_blob_add_slow(v30, (uint64_t)v29, v28);
            }
          }
          v14 += v11;
          *(_QWORD *)&v10[1] += v11;
          if (*(_QWORD *)&v10[1] == v13)
            break;
        }
      }
    }
    if (v12)
      *v12 = v14;
    return *(unsigned int *)&v10[1];
  }
}

uint64_t _os_trace_utf8_len(_BYTE *a1, unint64_t a2)
{
  unint64_t i;
  unint64_t v4;

  if ((*a1 & 0xF8) == 0xF0)
  {
    v4 = 4;
  }
  else if ((*a1 & 0xF0) == 0xE0)
  {
    v4 = 3;
  }
  else
  {
    if ((*a1 & 0xE0) != 0xC0)
      return -1;
    v4 = 2;
  }
  if (a2 < v4)
    return -2;
  for (i = 1; i < v4; ++i)
  {
    if ((a1[i] & 0xC0) != 0x80)
      return -1;
  }
  return v4;
}

uint64_t os_trace_blob_addnws(uint64_t a1, int *a2, unint64_t a3, int **a4)
{
  uint64_t v5;
  _BYTE v6[4];
  uint64_t v7;
  int **v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v11 = a1;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    v7 = 0;
    v17 = v11;
    v16 = 0;
    v16 = *(_DWORD *)(v11 + 8) + ((*(_BYTE *)(v11 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v11 + 16))
    {
      v18 = *(_DWORD *)(v17 + 16) - v16;
    }
    else if (*(_DWORD *)(v17 + 12))
    {
      v18 = *(_DWORD *)(v17 + 12) - v16;
    }
    else
    {
      v18 = 0;
    }
    if (v9 > v18)
    {
      v14 = v11;
      v13 = 0;
      v13 = *(_DWORD *)(v11 + 8) + ((*(_BYTE *)(v11 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v11 + 16))
      {
        v15 = *(_DWORD *)(v14 + 16) - v13;
      }
      else if (*(_DWORD *)(v14 + 12))
      {
        v15 = *(_DWORD *)(v14 + 12) - v13;
      }
      else
      {
        v15 = 0;
      }
      v9 = v15;
    }
    while (*v10)
    {
      v5 = _os_trace_utf8_to_mbs(v6, *v10);
      if (!v5 || v7 + v5 > v9)
        break;
      v21 = v11;
      v20 = v6;
      v19 = v5;
      if ((*(_WORD *)(v11 + 20) & 2) != 0)
      {
        v22 = 0;
      }
      else
      {
        v23 = v21;
        if (v19 <= *(_DWORD *)(v23 + 12) - ((*(_BYTE *)(v23 + 22) ^ 1) & 1u) - *(_DWORD *)(v23 + 8))
        {
          __memcpy_chk(*(_QWORD *)v21 + *(unsigned int *)(v21 + 8), v20, v19, -1);
          v25 = v21;
          v24 = v19;
          *(_DWORD *)(v21 + 8) += v19;
          if ((*(_BYTE *)(v25 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v25 + *(unsigned int *)(v25 + 8)) = 0;
          v22 = v24;
        }
        else
        {
          v22 = os_trace_blob_add_slow(v21, (uint64_t)v20, v19);
        }
      }
      if (!v22)
        break;
      v7 += v22;
      ++v10;
    }
    if (v8)
      *v8 = v10;
    return v7;
  }
}

uint64_t _os_trace_utf8_to_mbs(_BYTE *a1, int a2)
{
  uint64_t v3;
  uint64_t i;
  char v5;
  int v6;

  v6 = a2;
  if ((a2 & 0xFFFFFF80) == 0)
  {
    *a1 = a2;
    return 1;
  }
  if ((a2 & 0xFFFFF800) == 0)
  {
    v5 = -64;
    v3 = 2;
    goto LABEL_13;
  }
  if ((a2 & 0xFFFF0000) == 0)
  {
    if (a2 < 55296 || a2 > 57343)
    {
      v5 = -32;
      v3 = 3;
      goto LABEL_13;
    }
    return 0;
  }
  if ((a2 & 0xFFE00000) != 0 || a2 > 1114111)
    return 0;
  v5 = -16;
  v3 = 4;
LABEL_13:
  for (i = v3 - 1; i; --i)
  {
    a1[i] = v6 & 0x3F | 0x80;
    v6 >>= 6;
  }
  *a1 = v6 | v5;
  return v3;
}

uint64_t os_trace_blob_vaddf(uint64_t a1, const char *a2, va_list a3)
{
  unsigned int v4;
  unsigned int v5;

  if ((*(_BYTE *)(a1 + 22) & 1) != 0)
  {
    _os_crash("Can't use addf() in binary blobs");
    __break(1u);
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1) - *(_DWORD *)(a1 + 8);
    *__error() = 0;
    v4 = __vsnprintf_chk((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), v5 + 1, 0, 0xFFFFFFFFFFFFFFFFLL, a2, a3);
    if ((v4 & 0x80000000) != 0)
    {
      *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      return 0;
    }
    else if (v4 > v5)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        v5 = os_trace_blob_grow((uint64_t *)a1, v4);
        *__error() = 0;
        __vsnprintf_chk((char *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)), v5 + 1, 0, 0xFFFFFFFFFFFFFFFFLL, a2, a3);
      }
      if (v4 > v5)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        v4 = v5;
      }
      *(_DWORD *)(a1 + 8) += v4;
      return v4;
    }
    else
    {
      *(_DWORD *)(a1 + 8) += v4;
      return v4;
    }
  }
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return os_trace_blob_vaddf(a1, a2, &a9);
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  tm __b;
  int v17;
  uint64_t v18;
  time_t v19;
  tm *v20;
  int v21;

  v20 = result;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  if ((result->tm_year & 0x10000) != 0)
  {
    result = (tm *)_os_crash("Can't use addf() in binary blobs");
    __break(1u);
  }
  if ((v20->tm_year & 2) != 0)
  {
    v21 = 0;
  }
  else
  {
    memset(&__b, 0, sizeof(__b));
    result = localtime_r(&v19, &__b);
    if (result)
    {
      os_trace_blob_addf((uint64_t)v20, "%04d-%02d-%02d %02d:%02d:%02d", v4, v5, v6, v7, v8, v9, LOBYTE(__b.tm_year) + 108);
      if (v17)
      {
        if (v17 == 1)
        {
          os_trace_blob_addf((uint64_t)v20, ".%06ld", v10, v11, v12, v13, v14, v15, v18);
        }
        else if (v17 == 2)
        {
          os_trace_blob_addf((uint64_t)v20, ".%03ld", v10, v11, v12, v13, v14, v15, v18);
        }
      }
      else
      {
        os_trace_blob_addf((uint64_t)v20, ".%09ld", v10, v11, v12, v13, v14, v15, v18);
      }
      return (tm *)os_trace_blob_addf((uint64_t)v20, "%+05ld", v10, v11, v12, v13, v14, v15, (__b.tm_gmtoff / 60 % 60) + 100 * (__b.tm_gmtoff / 60 / 60));
    }
    else
    {
      v21 = 0;
    }
  }
  return result;
}

uint64_t os_trace_blob_add_hexdump(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int v4;
  int v5;
  unsigned __int8 v6;
  unint64_t i;
  int v8;
  int v9;
  uint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;

  v13 = result;
  v56 = result;
  v55 = 39;
  v54 = 39;
  v59 = result;
  v58 = &v54;
  v57 = 1;
  if ((*(_WORD *)(result + 20) & 2) != 0)
  {
    v60 = 0;
  }
  else
  {
    v61 = v59;
    if (v57 <= *(_DWORD *)(v61 + 12) - ((*(_BYTE *)(v61 + 22) ^ 1) & 1u) - *(_DWORD *)(v61 + 8))
    {
      result = __memcpy_chk(*(_QWORD *)v59 + *(unsigned int *)(v59 + 8), v58, v57, -1);
      v63 = v59;
      v62 = v57;
      *(_DWORD *)(v59 + 8) += v57;
      if ((*(_BYTE *)(v63 + 22) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)v63 + *(unsigned int *)(v63 + 8)) = 0;
      v60 = v62;
    }
    else
    {
      result = os_trace_blob_add_slow(v59, (uint64_t)v58, v57);
      v60 = result;
    }
  }
  v8 = v60;
  for (i = 0; i < a3; ++i)
  {
    v6 = *(_BYTE *)(a2 + i);
    if (i)
    {
      v46 = v13;
      v45 = 32;
      v44 = 32;
      v49 = v13;
      v48 = &v44;
      v47 = 1;
      if ((*(_WORD *)(v13 + 20) & 2) != 0)
      {
        v50 = 0;
      }
      else
      {
        v51 = v49;
        if (v47 <= *(_DWORD *)(v51 + 12) - ((*(_BYTE *)(v51 + 22) ^ 1) & 1u) - *(_DWORD *)(v51 + 8))
        {
          result = __memcpy_chk(*(_QWORD *)v49 + *(unsigned int *)(v49 + 8), v48, v47, -1);
          v53 = v49;
          v52 = v47;
          *(_DWORD *)(v49 + 8) += v47;
          if ((*(_BYTE *)(v53 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v53 + *(unsigned int *)(v53 + 8)) = 0;
          v50 = v52;
        }
        else
        {
          result = os_trace_blob_add_slow(v49, (uint64_t)v48, v47);
          v50 = result;
        }
      }
      v8 += v50;
    }
    v4 = a0123456789abcd[v6 >> 4];
    v36 = v13;
    v35 = v4;
    v34 = v4;
    v39 = v13;
    v38 = &v34;
    v37 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      v40 = 0;
    }
    else
    {
      v41 = v39;
      if (v37 <= *(_DWORD *)(v41 + 12) - ((*(_BYTE *)(v41 + 22) ^ 1) & 1u) - *(_DWORD *)(v41 + 8))
      {
        result = __memcpy_chk(*(_QWORD *)v39 + *(unsigned int *)(v39 + 8), v38, v37, -1);
        v43 = v39;
        v42 = v37;
        *(_DWORD *)(v39 + 8) += v37;
        if ((*(_BYTE *)(v43 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v43 + *(unsigned int *)(v43 + 8)) = 0;
        v40 = v42;
      }
      else
      {
        result = os_trace_blob_add_slow(v39, (uint64_t)v38, v37);
        v40 = result;
      }
    }
    v9 = v8 + v40;
    v5 = a0123456789abcd[v6 & 0xF];
    v26 = v13;
    v25 = v5;
    v24 = v5;
    v29 = v13;
    v28 = &v24;
    v27 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      v30 = 0;
    }
    else
    {
      v31 = v29;
      if (v27 <= *(_DWORD *)(v31 + 12) - ((*(_BYTE *)(v31 + 22) ^ 1) & 1u) - *(_DWORD *)(v31 + 8))
      {
        result = __memcpy_chk(*(_QWORD *)v29 + *(unsigned int *)(v29 + 8), v28, v27, -1);
        v33 = v29;
        v32 = v27;
        *(_DWORD *)(v29 + 8) += v27;
        if ((*(_BYTE *)(v33 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v33 + *(unsigned int *)(v33 + 8)) = 0;
        v30 = v32;
      }
      else
      {
        result = os_trace_blob_add_slow(v29, (uint64_t)v28, v27);
        v30 = result;
      }
    }
    v8 = v9 + v30;
  }
  if ((a4 & 1) != 0)
  {
    v66 = v13;
    v65 = "…'";
    v64 = 0;
    return os_trace_blob_addns(v13, "…'", 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v16 = v13;
    v15 = 39;
    v14 = 39;
    v19 = v13;
    v18 = &v14;
    v17 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      v20 = 0;
    }
    else
    {
      v21 = v19;
      if (v17 <= *(_DWORD *)(v19 + 12) - ((*(_BYTE *)(v19 + 22) ^ 1) & 1u) - *(_DWORD *)(v19 + 8))
      {
        result = __memcpy_chk(*(_QWORD *)v19 + *(unsigned int *)(v19 + 8), v18, v17, -1);
        v23 = v19;
        v22 = v17;
        *(_DWORD *)(v19 + 8) += v17;
        if ((*(_BYTE *)(v23 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v23 + *(unsigned int *)(v23 + 8)) = 0;
      }
      else
      {
        result = os_trace_blob_add_slow(v19, (uint64_t)v18, v17);
        v20 = result;
      }
    }
  }
  return result;
}

uint64_t os_log_fmt_delimit(_BYTE *a1, uint64_t a2, size_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char v7;
  char v8;
  char v9;
  unsigned __int16 v10;
  unsigned int v12;
  int v13;
  char *__s;
  size_t v15;
  uint64_t v16;
  _BYTE *v17;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  __s = a1 + 1;
  v12 = 0;
  if (*a1 != 37)
  {
    _os_crash("Should start with '%'");
    __break(1u);
  }
  __memset_chk(v15, 0, 64, -1);
  *(_QWORD *)v15 = v17;
  if (*__s != 123)
  {
LABEL_7:
    v3 = __s++;
    v13 = *v3;
    while (1)
    {
      switch(v13)
      {
        case ' ':
        case '#':
        case '\'':
        case '+':
        case '-':
        case '0':
          goto LABEL_7;
        case '*':
          if ((*(_WORD *)(v15 + 8) & 8) != 0)
            *(_WORD *)(v15 + 8) |= 1u;
          addaster(&__s, v15, 2u);
          goto LABEL_7;
        case '.':
          v4 = __s++;
          v13 = *v4;
          if (v13 == 42)
          {
            addaster(&__s, v15, 0xCu);
            goto LABEL_7;
          }
          *(_DWORD *)(v15 + 24) = 0;
          while ((v13 - 48) <= 9)
          {
            *(_DWORD *)(v15 + 24) = v13 - 48 + 10 * *(_DWORD *)(v15 + 24);
            v5 = __s++;
            v13 = *v5;
          }
          if ((*(_WORD *)(v15 + 8) & 8) != 0)
            *(_WORD *)(v15 + 8) |= 1u;
          *(_WORD *)(v15 + 8) |= 8u;
          break;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          do
          {
            v6 = __s++;
            v13 = *v6;
          }
          while ((v13 - 48) <= 9);
          if (v13 != 36)
            continue;
          *(_WORD *)(v15 + 8) |= 1u;
          goto LABEL_7;
        case '@':
          *(_BYTE *)(v15 + 10) = 18;
          goto LABEL_64;
        case 'A':
        case 'E':
        case 'F':
        case 'G':
        case 'a':
        case 'e':
        case 'f':
        case 'g':
          if ((v12 & 8) != 0)
            v8 = 15;
          else
            v8 = 14;
          *(_BYTE *)(v15 + 10) = v8;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'C':
          LOBYTE(v12) = v12 | 0x10;
          goto LABEL_37;
        case 'D':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_42;
        case 'L':
          v12 |= 8u;
          goto LABEL_7;
        case 'O':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_50;
        case 'P':
          if (v16 != 2)
            return 0;
          if ((*(_WORD *)(v15 + 8) & 8) == 0)
            *(_WORD *)(v15 + 8) |= 1u;
          *(_BYTE *)(v15 + 10) = 19;
          goto LABEL_64;
        case 'S':
          LOBYTE(v12) = v12 | 0x10;
          goto LABEL_58;
        case 'U':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_50;
        case 'X':
        case 'o':
        case 'u':
        case 'x':
LABEL_50:
          addsarg(v15, v12);
          *(_WORD *)(v15 + 8) |= 0x20u;
          ++*(_BYTE *)(v15 + 10);
          goto LABEL_64;
        case 'c':
LABEL_37:
          if ((v12 & 0x10) != 0)
            v7 = 7;
          else
            v7 = 5;
          *(_BYTE *)(v15 + 10) = v7;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'd':
        case 'i':
LABEL_42:
          addsarg(v15, v12);
          goto LABEL_64;
        case 'h':
          if ((v12 & 0x40) != 0)
            v12 = v12 & 0xFFFFDFBF | 0x2000;
          else
            v12 |= 0x40u;
          goto LABEL_7;
        case 'j':
          v12 |= 0x1000u;
          goto LABEL_7;
        case 'l':
          if ((v12 & 0x10) != 0)
            v12 = v12 & 0xFFFFFFCF | 0x20;
          else
            v12 |= 0x10u;
          goto LABEL_7;
        case 'm':
          *(_BYTE *)(v15 + 10) = 8;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'n':
          *(_WORD *)(v15 + 8) |= 1u;
          goto LABEL_64;
        case 'p':
          *(_BYTE *)(v15 + 10) = 13;
          *(_WORD *)(v15 + 8) |= 0x30u;
          goto LABEL_64;
        case 'q':
          v12 |= 0x20u;
          goto LABEL_7;
        case 's':
LABEL_58:
          if ((v12 & 0x10) != 0)
            v9 = 17;
          else
            v9 = 16;
          *(_BYTE *)(v15 + 10) = v9;
LABEL_64:
          v10 = (_WORD)__s - (_WORD)v17;
          *(_WORD *)(v15 + 12) = (_WORD)__s - (_WORD)v17;
          return v10;
        case 't':
          v12 |= 0x800u;
          goto LABEL_7;
        case 'z':
          v12 |= 0x400u;
          goto LABEL_7;
        default:
          return 0;
      }
    }
  }
  if (v16 == 2)
  {
    __s = strchr(__s, 125);
    if (__s)
    {
      os_log_fmt_parse_annotation(v15);
      ++__s;
      goto LABEL_7;
    }
  }
  return 0;
}

size_t os_log_fmt_parse_annotation(size_t result)
{
  size_t __n;
  char *__s;
  char *__sa;
  size_t v4;

  v4 = result;
  for (__s = (char *)(*(_QWORD *)result + 2); *__s != 125; __s = &__sa[__n])
  {
    __sa = &__s[strspn(__s, ", ")];
    result = strcspn(__sa, ",}");
    __n = result;
    if (!result)
      return result;
    if (result != 6 || (result = memcmp(__sa, "public", 6uLL), (_DWORD)result))
    {
      if (__n != 7 || (result = memcmp(__sa, "private", 7uLL), (_DWORD)result))
      {
        if (__n != 9 || (result = memcmp(__sa, "sensitive", 9uLL), (_DWORD)result))
        {
          result = (size_t)memchr(__sa, 61, __n);
          if (!result)
          {
            result = strncmp(__sa, "mask.", 5uLL);
            if ((_DWORD)result)
            {
              *(_WORD *)(v4 + 8) |= 0x40u;
              result = strncmp(__sa, "builtin:", 8uLL);
              if ((_DWORD)result)
              {
                result = (size_t)memchr(__sa, 58, __n);
                if (result)
                {
                  if ((*(_WORD *)(v4 + 8) & 0x80) != 0)
                    *(_WORD *)(v4 + 8) ^= 0x80u;
                  *(_QWORD *)(v4 + 32) = __sa;
                  *(_WORD *)(v4 + 14) = result - (_WORD)__sa;
                  *(_QWORD *)(v4 + 40) = result + 1;
                  *(_WORD *)(v4 + 16) = (_WORD)__sa + __n - (result + 1);
                }
                else
                {
                  *(_WORD *)(v4 + 8) |= 0x80u;
                  *(_QWORD *)(v4 + 32) = "builtin";
                  *(_WORD *)(v4 + 14) = 7;
                  *(_QWORD *)(v4 + 40) = __sa;
                  *(_WORD *)(v4 + 16) = __n;
                }
              }
              else
              {
                *(_WORD *)(v4 + 8) |= 0x80u;
                *(_QWORD *)(v4 + 32) = "builtin";
                *(_WORD *)(v4 + 14) = 7;
                *(_QWORD *)(v4 + 40) = __sa + 8;
                *(_WORD *)(v4 + 16) = __n - 8;
              }
            }
            else if (__n > 5 && __n < 0xE)
            {
              *(_WORD *)(v4 + 8) |= 0x800u;
              *(_QWORD *)(v4 + 48) = __sa + 5;
              *(_WORD *)(v4 + 18) = __n - 5;
              result = _os_log_fmt_compute_mask(*(_QWORD *)(v4 + 48), *(unsigned __int16 *)(v4 + 18));
              *(_QWORD *)(v4 + 56) = result;
            }
          }
        }
        else
        {
          *(_WORD *)(v4 + 8) |= 0x400u;
        }
      }
      else
      {
        *(_WORD *)(v4 + 8) |= 0x200u;
      }
    }
    else
    {
      *(_WORD *)(v4 + 8) |= 0x100u;
    }
  }
  if ((*(_WORD *)(v4 + 8) & 0x400) != 0)
  {
    *(_WORD *)(v4 + 8) &= 0xFCFFu;
  }
  else if ((*(_WORD *)(v4 + 8) & 0x200) != 0)
  {
    *(_WORD *)(v4 + 8) &= ~0x100u;
  }
  return result;
}

_BYTE **addaster(_BYTE **result, uint64_t a2, unsigned __int16 a3)
{
  _BYTE *i;

  for (i = *result; ((char)*i - 48) <= 9; ++i)
    ;
  if (*i == 36)
  {
    *result = i + 1;
    *(_WORD *)(a2 + 8) |= 1u;
  }
  else
  {
    if ((*(_WORD *)(a2 + 8) & a3) != 0)
      *(_WORD *)(a2 + 8) |= 1u;
    *(_WORD *)(a2 + 8) |= a3;
  }
  return result;
}

uint64_t addsarg(uint64_t result, __int16 a2)
{
  if ((a2 & 0x1000) != 0)
  {
    *(_BYTE *)(result + 10) = 11;
  }
  else if ((a2 & 0x400) != 0)
  {
    *(_BYTE *)(result + 10) = 9;
  }
  else if ((a2 & 0x800) != 0)
  {
    *(_BYTE *)(result + 10) = 9;
  }
  else if ((a2 & 0x20) != 0)
  {
    *(_BYTE *)(result + 10) = 11;
  }
  else if ((a2 & 0x10) != 0)
  {
    *(_BYTE *)(result + 10) = 9;
  }
  else if ((a2 & 0x40) != 0)
  {
    *(_BYTE *)(result + 10) = 3;
  }
  else if ((a2 & 0x2000) != 0)
  {
    *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    *(_BYTE *)(result + 10) = 5;
  }
  *(_WORD *)(result + 8) |= 0x10u;
  return result;
}

uint64_t _os_log_fmt_compute_mask(uint64_t a1, uint64_t a2)
{
  unint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[12];

  *(_QWORD *)&v7[4] = a2;
  if (!a2)
  {
    *(_QWORD *)v7 = 0;
    v6 = _os_assert_log(0);
    _os_crash(v6);
    __break(1u);
  }
  if (*(_QWORD *)&v7[4] > 8uLL)
  {
    v5 = _os_assert_log(*(_QWORD *)&v7[4] <= 8uLL);
    _os_crash(v5);
    __break(1u);
  }
  v4 = 0;
  for (i = 0; i < *(_QWORD *)&v7[4]; ++i)
    v4 |= (uint64_t)*(char *)(a1 + i) << (8 * i);
  return v4;
}

uint64_t _os_log_fmt_flatten_masked_data(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, _BYTE *a8)
{
  uint64_t v8;
  uint64_t v10;
  unint64_t v14;
  _BYTE v20[16];

  if (!a3)
  {
    v10 = _os_assert_log(0);
    _os_crash(v10);
    __break(1u);
  }
  *a1 &= 0xF8u;
  *a1 |= 2u;
  switch(a3)
  {
    case 0x68736168:
    case 0x68736168766564:
    case 0x786F626C69616DLL:
      goto LABEL_23;
    case 0x35646D6E69616C70:
      if ((*a8 & 1) != 0)
      {
        LOWORD(v14) = 0;
      }
      else
      {
        v8 = ccmd5_di();
        ccdigest(v8, a6, a5, v20);
        v14 = _os_log_fmt_truncate_to_maxsz(0x10uLL, a7, a8);
        if ((*(_WORD *)(a4 + 20) & 2) == 0)
        {
          if (v14 <= *(_DWORD *)(a4 + 12) - ((*(_BYTE *)(a4 + 22) ^ 1) & 1u) - *(_DWORD *)(a4 + 8))
          {
            __memcpy_chk(*(_QWORD *)a4 + *(unsigned int *)(a4 + 8), v20, v14, -1);
            *(_DWORD *)(a4 + 8) += v14;
            if ((*(_BYTE *)(a4 + 22) & 1) == 0)
              *(_BYTE *)(*(_QWORD *)a4 + *(unsigned int *)(a4 + 8)) = 0;
          }
          else
          {
            os_trace_blob_add_slow(a4, (uint64_t)v20, v14);
          }
        }
      }
      goto LABEL_24;
    case 0x617474616C69616DLL:
    case 0x656D616E6C69616DLL:
    case 0x6A6275736C69616DLL:
    case 0x6D6D75736C69616DLL:
    case 0x6F6363616C69616DLL:
    case 0x7075626D6C69616DLL:
    case 0x726464616C69616DLL:
LABEL_23:
      LOWORD(v14) = 0;
      *a8 = 0;
LABEL_24:
      *a1 = *a1 & 0xF | 0xF0;
      return (unsigned __int16)v14;
  }
  *a1 = *a1 & 0xF | 0xE0;
  *a8 = 0;
  return 0;
}

unint64_t _os_log_fmt_truncate_to_maxsz(unint64_t a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4;

  v4 = a1;
  if (a1 > a2)
  {
    *a3 = 1;
    return a2;
  }
  return v4;
}

uint64_t _os_log_fmt_flatten_to_blob(_BYTE *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, _BYTE *a9, int *a10)
{
  _BYTE *v10;
  char v12;
  __int16 v13;
  uint64_t v14;
  uint64_t __b[3];
  unsigned __int8 v16;
  __int16 v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  _BYTE *v26;
  uint64_t *v28;
  char v29;

  v26 = a1;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v20 = a7;
  v19 = a8;
  v18 = 0;
  v17 = 0;
  v16 = 0;
  v16 = *a1 & 7;
  if (a2 >= (int)privacy_flags2opt[v16] || *v26 >> 4 == 8)
  {
    if ((*v26 & 1) != 0)
      v14 = v20;
    else
      v14 = v21;
    v17 = *(_DWORD *)(v14 + 8);
    v22 = _os_log_fmt_flatten_data_into_blob(v14, a9, a10, v23, v22, v19, &v18);
    goto LABEL_12;
  }
  if (v24)
  {
    memset(__b, 0, sizeof(__b));
    __b[0] = (uint64_t)&v29;
    __b[1] = 0x36200000000;
    WORD2(__b[2]) = 0;
    BYTE6(__b[2]) = 1;
    LODWORD(__b[2]) = 0x10000;
    _os_log_fmt_flatten_data_into_blob((uint64_t)__b, a9, a10, v23, v22, 0x10000uLL, &v18);
    v17 = *(_DWORD *)(v21 + 8);
    LOWORD(v22) = _os_log_fmt_flatten_masked_data(v26, v25, v24, v21, __b[0], LODWORD(__b[1]), v19, &v18);
    v22 = (unsigned __int16)v22;
    v28 = __b;
    if ((__b[2] & 0x100000000) != 0)
      os_trace_blob_destroy_slow((uint64_t)v28);
LABEL_12:
    v10 = v26;
    v12 = HIBYTE(v17);
    v13 = v22 & 0x7FFF | (v18 << 15);
    v26[2] = v17;
    v10[3] = v12;
    *((_WORD *)v10 + 2) = v13;
    return (unsigned __int16)v22;
  }
  return 0;
}

unint64_t _os_log_fmt_flatten_data_into_blob(uint64_t a1, _BYTE *a2, int *a3, uint64_t a4, unint64_t a5, unint64_t a6, BOOL *a7)
{
  BOOL v7;
  int *v9;
  int v10;
  _BYTE *v11;
  BOOL *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int *v16;
  _BYTE *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  char v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v13 = a6;
  v12 = a7;
  *a7 = 0;
  if (v17 && v13)
  {
    v11 = 0;
    if (v14 && v14 + 1 < v13)
      v13 = v14 + 1;
    v10 = os_trace_blob_addns(v18, v17, v13 - 1, &v11);
    v32 = v18;
    v31 = 0;
    v30 = 0;
    v35 = v18;
    v34 = &v30;
    v33 = 1;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      v36 = 0;
    }
    else
    {
      v37 = v35;
      if (v33 <= *(_DWORD *)(v37 + 12) - ((*(_BYTE *)(v37 + 22) ^ 1) & 1u) - *(_DWORD *)(v37 + 8))
      {
        __memcpy_chk(*(_QWORD *)v35 + *(unsigned int *)(v35 + 8), v34, v33, -1);
        v41 = v35;
        v40 = v33;
        *(_DWORD *)(v35 + 8) += v33;
        if ((*(_BYTE *)(v41 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v41 + *(unsigned int *)(v41 + 8)) = 0;
        v36 = v40;
      }
      else
      {
        v36 = os_trace_blob_add_slow(v35, (uint64_t)v34, v33);
      }
    }
    if (!v14 || (v7 = 0, v11 < &v17[v14]))
      v7 = *v11 != 0;
    *v12 = v7;
    return (v10 + 1);
  }
  else if (v16 && v13)
  {
    v9 = 0;
    v14 = os_trace_blob_addnws(v18, v16, v13 - 1, &v9) + 1;
    *v12 = *v9 != 0;
    v25 = v18;
    v24 = 0;
    v23 = 0;
    v28 = v18;
    v27 = &v23;
    v26 = 1;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      v29 = 0;
    }
    else
    {
      v38 = v28;
      if (v26 <= *(_DWORD *)(v38 + 12) - ((*(_BYTE *)(v38 + 22) ^ 1) & 1u) - *(_DWORD *)(v38 + 8))
      {
        __memcpy_chk(*(_QWORD *)v28 + *(unsigned int *)(v28 + 8), v27, v26, -1);
        v43 = v28;
        v42 = v26;
        *(_DWORD *)(v28 + 8) += v26;
        if ((*(_BYTE *)(v43 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v43 + *(unsigned int *)(v43 + 8)) = 0;
        v29 = v42;
      }
      else
      {
        v29 = os_trace_blob_add_slow(v28, (uint64_t)v27, v26);
      }
    }
  }
  else if (v17 || v16)
  {
    v14 = 0;
    *v12 = 1;
  }
  else
  {
    v14 = _os_log_fmt_truncate_to_maxsz(v14, v13, v12);
    v21 = v18;
    v20 = v15;
    v19 = v14;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      v22 = 0;
    }
    else
    {
      v39 = v21;
      if (v19 <= *(_DWORD *)(v39 + 12) - ((*(_BYTE *)(v39 + 22) ^ 1) & 1u) - *(_DWORD *)(v39 + 8))
      {
        __memcpy_chk(*(_QWORD *)v21 + *(unsigned int *)(v21 + 8), v20, v19, -1);
        v45 = v21;
        v44 = v19;
        *(_DWORD *)(v21 + 8) += v19;
        if ((*(_BYTE *)(v45 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v45 + *(unsigned int *)(v45 + 8)) = 0;
        v22 = v44;
      }
      else
      {
        v22 = os_trace_blob_add_slow(v21, v20, v19);
      }
    }
  }
  return v14;
}

uint64_t os_log_fmt_flatten(_BYTE *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  BOOL v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  _BYTE *v13;
  unsigned __int8 v14;
  __int16 v15;
  __int16 v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  _BOOL4 v24;
  void *__src;
  _BYTE *v26;
  _BYTE v27[2];
  unsigned __int8 v28;
  _BYTE *v29;
  unint64_t v30;
  _BYTE __b[2];
  uint64_t __dst;
  unsigned int v33;
  unsigned int v34;
  char v35;
  char v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  _BOOL4 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  _BYTE *v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  int v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  unint64_t *v63;
  __int16 *v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  unint64_t v69;
  __int16 *v70;
  uint64_t v71;
  int v72;
  unint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  unint64_t *v78;
  void *v79;
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  unint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char v107;
  BOOL v108;

  v48 = a1;
  v47 = 0;
  v46 = a2;
  v45 = 1024;
  v44 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a2 != 0;
  if (!a2)
  {
    v39 = _os_assert_log(v40);
    _os_crash(v39);
    __break(1u);
  }
  v38 = 0;
  v60 = v44;
  v59 = 0;
  v59 = *(_DWORD *)(v44 + 8) + ((*(_BYTE *)(v44 + 22) ^ 1) & 1);
  if (*(_DWORD *)(v44 + 16))
  {
    v61 = *(_DWORD *)(v60 + 16) - v59;
  }
  else if (*(_DWORD *)(v60 + 12))
  {
    v61 = *(_DWORD *)(v60 + 12) - v59;
  }
  else
  {
    v61 = 0;
  }
  v6 = 0;
  if (v61 >= v45)
  {
    v57 = v43;
    v56 = 0;
    v56 = *(_DWORD *)(v43 + 8) + ((*(_BYTE *)(v43 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v43 + 16))
      v58 = *(_DWORD *)(v57 + 16) - v56;
    else
      v58 = *(_DWORD *)(v57 + 12) ? *(_DWORD *)(v57 + 12) - v56 : 0;
    v6 = 0;
    if (v58 >= v45)
    {
      v54 = v42;
      v53 = 0;
      v53 = *(_DWORD *)(v42 + 8) + ((*(_BYTE *)(v42 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v42 + 16))
      {
        v55 = *(_DWORD *)(v54 + 16) - v53;
      }
      else if (*(_DWORD *)(v54 + 12))
      {
        v55 = *(_DWORD *)(v54 + 12) - v53;
      }
      else
      {
        v55 = 0;
      }
      v6 = v55 >= v45;
    }
  }
  v38 = v6;
  if (!v6)
  {
    v37 = _os_assert_log(0);
    _os_crash(v37);
    __break(1u);
  }
  v36 = 0;
  v36 = privacy_opt2flags[v47];
  v35 = 32 * v46;
  v34 = 0;
  v34 = *(_DWORD *)(v44 + 8);
  v33 = 0;
  __dst = 0;
  result = (uint64_t)memset(__b, 0, sizeof(__b));
  __b[0] = 32 * v46;
  __b[1] = 0;
  if ((*v48 & 0x10) != 0)
    __b[0] |= 0x10u;
  v30 = 0;
  v30 = v45 - *(unsigned int *)(v44 + 8) - 2;
  v51 = v44;
  v50 = __b;
  v49 = 2;
  if ((*(_WORD *)(v44 + 20) & 2) != 0)
  {
    v52 = 0;
  }
  else
  {
    v96 = v51;
    if (v49 <= *(_DWORD *)(v96 + 12) - ((*(_BYTE *)(v96 + 22) ^ 1) & 1u) - *(_DWORD *)(v96 + 8))
    {
      result = __memcpy_chk(*(_QWORD *)v51 + *(unsigned int *)(v51 + 8), v50, v49, -1);
      v106 = v51;
      v105 = v49;
      *(_DWORD *)(v51 + 8) += v49;
      if ((*(_BYTE *)(v106 + 22) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)v106 + *(unsigned int *)(v106 + 8)) = 0;
      v52 = v105;
    }
    else
    {
      result = os_trace_blob_add_slow(v51, (uint64_t)v50, v49);
      v52 = result;
    }
  }
  v29 = v48 + 2;
  v28 = 0;
  while (v28 < (int)v48[1])
  {
    result = (uint64_t)memset(v27, 0, sizeof(v27));
    v26 = 0;
    __src = v29 + 2;
    v27[0] = *v29;
    v27[1] = v29[1];
    if ((v27[0] & 7) == 0)
      v27[0] = v27[0] & 0xF0 | v27[0] & 0xF | v36 & 0xF;
    switch(v27[0] >> 4)
    {
      case 0:
        v33 = v27[1];
        goto LABEL_52;
      case 1:
        v22 = v27[1] == 4;
        if (v27[1] != 4)
        {
          v21 = 0;
          v21 = _os_assert_log(v22);
          result = _os_crash(v21);
          __break(1u);
        }
        v33 = *(_DWORD *)__src;
        if ((v33 & 0x80000000) != 0)
          v33 = 0;
        v27[0] = v27[0] & 0xF0 | 2;
        goto LABEL_52;
      case 6:
        v27[0] &= 0xFu;
        __src = &v41;
        v27[1] = 4;
        v33 = 4;
        goto LABEL_52;
      case 7:
        v24 = v27[1] == 8;
        if (v27[1] != 8)
        {
          v23 = 0;
          v23 = _os_assert_log(v24);
          _os_crash(v23);
          __break(1u);
        }
        result = (uint64_t)memcpy(&__dst, __src, sizeof(__dst));
        goto LABEL_106;
      default:
        v20 = 0;
        v20 = (os_log_fmt_flatten_cmd_type_is_scalar[v27[0] >> 4] ^ 1) & 1;
        if (!v20)
        {
          v19 = 0;
          v19 = _os_assert_log(0);
          _os_crash(v19);
          __break(1u);
        }
        v18 = v27[1] == 8;
        if (v27[1] != 8)
        {
          v17 = 0;
          v17 = _os_assert_log(v18);
          _os_crash(v17);
          __break(1u);
        }
        result = (uint64_t)memcpy(&__src, __src, sizeof(__src));
        __b[0] |= 2u;
LABEL_52:
        if ((os_log_fmt_flatten_cmd_type_is_scalar[v27[0] >> 4] & 1) == 0 || (v27[0] & 1) != 0)
        {
          v27[1] = 4;
          v15 = 0;
          v16 &= 0x8000u;
          v16 &= ~0x8000u;
          v67 = __b;
          v66 = v44;
          v65 = v27;
          v64 = &v15;
          v63 = &v30;
          v62 = 0;
          v62 = *(_DWORD *)(v44 + 8);
          v11 = v30 < 6;
          v30 -= 6;
          v108 = v11;
          if (v11)
          {
            *v67 |= 0x80u;
            v68 = 0;
          }
          else
          {
            ++v67[1];
            v75 = v66;
            v74 = v65;
            v73 = 2;
            if ((*(_WORD *)(v66 + 20) & 2) != 0)
            {
              v76 = 0;
            }
            else
            {
              v95 = v75;
              if (v73 <= *(_DWORD *)(v95 + 12) - ((*(_BYTE *)(v95 + 22) ^ 1) & 1u) - *(_DWORD *)(v95 + 8))
              {
                result = __memcpy_chk(*(_QWORD *)v75 + *(unsigned int *)(v75 + 8), v74, v73, -1);
                v104 = v75;
                v103 = v73;
                *(_DWORD *)(v75 + 8) += v73;
                if ((*(_BYTE *)(v104 + 22) & 1) == 0)
                  *(_BYTE *)(*(_QWORD *)v104 + *(unsigned int *)(v104 + 8)) = 0;
                v76 = v103;
              }
              else
              {
                result = os_trace_blob_add_slow(v75, (uint64_t)v74, v73);
                v76 = result;
              }
            }
            v12 = v65[1];
            v71 = v66;
            v70 = v64;
            v69 = v12;
            if ((*(_WORD *)(v66 + 20) & 2) != 0)
            {
              v72 = 0;
            }
            else
            {
              v94 = v71;
              if (v69 <= *(_DWORD *)(v94 + 12) - ((*(_BYTE *)(v94 + 22) ^ 1) & 1u) - *(_DWORD *)(v94 + 8))
              {
                result = __memcpy_chk(*(_QWORD *)v71 + *(unsigned int *)(v71 + 8), v70, v69, -1);
                v102 = v71;
                v101 = v69;
                *(_DWORD *)(v71 + 8) += v69;
                if ((*(_BYTE *)(v102 + 22) & 1) == 0)
                  *(_BYTE *)(*(_QWORD *)v102 + *(unsigned int *)(v102 + 8)) = 0;
                v72 = v101;
              }
              else
              {
                result = os_trace_blob_add_slow(v71, (uint64_t)v70, v69);
                v72 = result;
              }
            }
            v68 = (_BYTE *)(*(_QWORD *)v66 + v62);
          }
          v26 = v68;
          if (!v68)
            goto LABEL_107;
          v14 = v27[0] & 7;
          if (__src && (v46 >= (int)privacy_flags2opt[v14] || __dst))
          {
            result = _os_log_fmt_flatten_data(v26, v46, __dst, (uint64_t)__src, v33, v43, v42, v30);
            v30 -= (unsigned __int16)result;
          }
          else if (!__src && v46 < (int)privacy_flags2opt[v14] && __dst)
          {
            *v26 = *v26 & 0xF | 0xF0;
            *v26 &= 0xF8u;
            *v26 = *v26 & 0xF0 | *v26 & 0xD | 2;
          }
          if (!(*v26 >> 4) && (*((_WORD *)v26 + 2) & 0x7FFF) == 0)
            *((_WORD *)v26 + 2) = *((_WORD *)v26 + 2) & 0x7FFF | 0x8000;
          if ((*v26 & 1) != 0)
            __b[0] |= 1u;
LABEL_105:
          v33 = 0;
          __dst = 0;
          goto LABEL_106;
        }
        v82 = __b;
        v81 = v44;
        v80 = v27;
        v79 = __src;
        v78 = &v30;
        v77 = 0;
        v77 = *(_DWORD *)(v44 + 8);
        v8 = v27[1] + 2;
        v9 = v30 - v8;
        LOBYTE(v8) = v30 < v8;
        v30 = v9;
        v107 = v8 & 1;
        if ((v8 & 1) != 0)
        {
          *v82 |= 0x80u;
          v83 = 0;
        }
        else
        {
          ++v82[1];
          v90 = v81;
          v89 = v80;
          v88 = 2;
          if ((*(_WORD *)(v81 + 20) & 2) != 0)
          {
            v91 = 0;
          }
          else
          {
            v93 = v90;
            if (v88 <= *(_DWORD *)(v93 + 12) - ((*(_BYTE *)(v93 + 22) ^ 1) & 1u) - *(_DWORD *)(v93 + 8))
            {
              result = __memcpy_chk(*(_QWORD *)v90 + *(unsigned int *)(v90 + 8), v89, v88, -1);
              v100 = v90;
              v99 = v88;
              *(_DWORD *)(v90 + 8) += v88;
              if ((*(_BYTE *)(v100 + 22) & 1) == 0)
                *(_BYTE *)(*(_QWORD *)v100 + *(unsigned int *)(v100 + 8)) = 0;
              v91 = v99;
            }
            else
            {
              result = os_trace_blob_add_slow(v90, (uint64_t)v89, v88);
              v91 = result;
            }
          }
          v10 = v80[1];
          v86 = v81;
          v85 = (uint64_t)v79;
          v84 = v10;
          if ((*(_WORD *)(v81 + 20) & 2) != 0)
          {
            v87 = 0;
          }
          else
          {
            v92 = v86;
            if (v84 <= *(_DWORD *)(v92 + 12) - ((*(_BYTE *)(v92 + 22) ^ 1) & 1u) - *(_DWORD *)(v92 + 8))
            {
              result = __memcpy_chk(*(_QWORD *)v86 + *(unsigned int *)(v86 + 8), v85, v84, -1);
              v98 = v86;
              v97 = v84;
              *(_DWORD *)(v86 + 8) += v84;
              if ((*(_BYTE *)(v98 + 22) & 1) == 0)
                *(_BYTE *)(*(_QWORD *)v98 + *(unsigned int *)(v98 + 8)) = 0;
              v87 = v97;
            }
            else
            {
              result = os_trace_blob_add_slow(v86, v85, v84);
              v87 = result;
            }
          }
          v83 = *(_QWORD *)v81 + v77;
        }
        if (!v83)
          goto LABEL_107;
        if (v27[0] >> 4 != 1)
          goto LABEL_105;
LABEL_106:
        ++v28;
        v29 += v29[1] + 2;
        break;
    }
  }
LABEL_107:
  v13 = (_BYTE *)(*(_QWORD *)v44 + v34);
  *v13 = __b[0];
  v13[1] = __b[1];
  return result;
}

uint64_t _os_log_fmt_flatten_data(_BYTE *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  int v8;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;

  v12 = a8;
  v11 = 0;
  if (a8 > 0x7FFF)
    v12 = 0x7FFFLL;
  v8 = *a1 >> 4;
  if (!v8)
  {
    if (!a5)
    {
      v10 = _os_assert_log(0);
      _os_crash(v10);
      __break(1u);
    }
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v12, v11, 0);
  }
  if (v8 == 2)
  {
    v11 = (_BYTE *)a4;
    if ((*a1 & 7) == 0)
      *a1 = *a1 & 0xF0 | *a1 & 0xE | 1;
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v12, v11, 0);
  }
  if (v8 != 3)
  {
    _os_crash("Invalid cmd type");
    __break(1u);
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v12, v11, 0);
  }
  if (a5)
  {
    if ((*a1 & 7) == 0)
      *a1 = *a1 & 0xF0 | *a1 & 0xE | 1;
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v12, v11, 0);
  }
  return 0;
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  uint64_t __b;

  memset(&__b, 0, sizeof(__b));
  if (*(_BYTE *)(a1 + 10) == 14)
    return *(_QWORD *)a2;
  if (*(_BYTE *)(a1 + 10) == 15)
    return *(_QWORD *)a2;
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        __b = *a2;
        break;
      case 2:
        __b = *(unsigned __int16 *)a2;
        break;
      case 4:
        __b = *(unsigned int *)a2;
        break;
      case 8:
        __b = *(_QWORD *)a2;
        break;
      default:
        goto LABEL_16;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        __b = (char)*a2;
        break;
      case 2:
        __b = *(__int16 *)a2;
        break;
      case 4:
        __b = *(int *)a2;
        break;
      case 8:
        __b = *(_QWORD *)a2;
        break;
      default:
LABEL_16:
        _os_crash("Invalid scalar size");
        __break(1u);
        break;
    }
  }
  return __b;
}

_BYTE *os_log_fmt_convert_trace(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v4;
  unint64_t i;
  _BYTE *v6;
  unint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;

  v10 = a2;
  v9 = *(_BYTE *)(a2 + a3 - 1);
  v8 = a2 + a3 - v9 - 1;
  v6 = a1 + 2;
  *a1 = 0;
  a1[1] = v9;
  for (i = 0; i < v9; ++i)
  {
    v4 = *(_BYTE *)(v8 + i) & 0x3F;
    if (v10 + (unint64_t)v4 > v8)
      return 0;
    *v6 = 0;
    v6[1] = v4;
    __memcpy_chk(v6 + 2, v10, v4, -1);
    v10 += v4;
    v6 += v4 + 2;
  }
  return a1;
}

void *os_log_fmt_extract_pubdata(uint64_t a1, unsigned __int16 a2, _QWORD *a3, unsigned __int16 *a4)
{
  uint64_t v5;
  unsigned __int16 i;
  unsigned __int16 v7;
  uint64_t v8;

  *a3 = 0;
  *a4 = 0;
  if (!a2)
    return &os_log_fmt_extract_pubdata_empty_hdr;
  if (a2 < 2uLL)
    return 0;
  v8 = a1 + 2;
  v7 = a2 - 2;
  for (i = 0; i < (int)*(unsigned __int8 *)(a1 + 1); ++i)
  {
    v5 = v8;
    if (v7 < 2uLL)
      return 0;
    if (v7 < (unint64_t)*(unsigned __int8 *)(v8 + 1) + 2)
      return 0;
    v8 += *(unsigned __int8 *)(v8 + 1) + 2;
    v7 -= *(unsigned __int8 *)(v5 + 1) + 2;
  }
  *a3 = v8;
  *a4 = v7;
  return (void *)a1;
}

uint64_t os_log_fmt_read_aster_if_necessary(uint64_t result, _WORD *a2, _QWORD *a3)
{
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  _DWORD *v11;
  _DWORD *v12;

  v5 = result;
  if ((*(_WORD *)(result + 8) & 2) != 0)
  {
    if (*a2)
    {
      v9 = (_BYTE *)*a3;
      --*a2;
      *a3 = &v9[v9[1] + 2];
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    v12 = (_DWORD *)(result + 20);
    if (v10 && v10[1] == 4 && (*v10 >> 4 == 1 || !(*v10 >> 4)))
      result = __memcpy_chk(v12, v10 + 2, 4, -1);
    else
      *v12 = 0;
  }
  if ((*(_WORD *)(v5 + 8) & 8) != 0)
  {
    if ((*(_WORD *)(v5 + 8) & 4) == 0 && ((*(_WORD *)(v5 + 8) & 0x10) != 0 || *(_BYTE *)(v5 + 10) == 18))
    {
      if (*a2 && *(_BYTE *)*a3 >> 4 == 1)
      {
        if (*a2)
        {
          v8 = (_BYTE *)*a3;
          --*a2;
          *a3 = &v8[v8[1] + 2];
        }
      }
      *(_WORD *)(v5 + 8) &= ~8u;
    }
    else
    {
      if (*a2)
      {
        v6 = (_BYTE *)*a3;
        --*a2;
        *a3 = &v6[v6[1] + 2];
        v7 = v6;
      }
      else
      {
        v7 = 0;
      }
      v11 = (_DWORD *)(v5 + 24);
      if (v7 && v7[1] == 4 && (*v7 >> 4 == 1 || !(*v7 >> 4)))
        return __memcpy_chk(v11, v7 + 2, 4, -1);
      else
        *v11 = -1;
    }
  }
  return result;
}

uint64_t os_log_fmt_get_data(uint64_t a1, unsigned __int8 a2, unsigned __int8 a3, __int16 *a4, __int16 a5, uint64_t a6, __int16 **a7, _WORD *a8, BOOL *a9, __int16 *a10, unsigned __int16 a11, __int16 *a12, unsigned __int16 a13)
{
  uint64_t v13;
  unsigned __int8 *v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int16 v18;
  __int16 *v19;
  _WORD *v20;
  __int16 **v21;
  uint64_t v22;
  __int16 v23;
  __int16 *v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  uint64_t v27;

  v27 = a1;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v20 = a8;
  v19 = a10;
  v18 = a11;
  v17 = 0;
  if (!a4)
  {
    v17 = 2;
LABEL_63:
    *v21 = 0;
    *v20 = 0;
    return v17;
  }
  if (*(_BYTE *)v24 >> 4 == 14)
  {
    if (*(_QWORD *)(v27 + 56))
    {
      if (os_log_fmt_validate_mask(*(_QWORD *)(v27 + 56)))
        v17 = 8;
      else
        v17 = 10;
    }
    else
    {
      v17 = 3;
    }
    goto LABEL_63;
  }
  if ((*(_BYTE *)v24 & 1) != 0)
  {
    v16 = privacy_flags2opt[*(_BYTE *)v24 & 7];
    if (!v16)
    {
      v17 = 3;
      goto LABEL_63;
    }
    if (v16 > (int)v25)
    {
      v17 = 1;
      goto LABEL_63;
    }
    if (v26)
    {
      if (v26 - 1 <= 2 && v16 > (int)v26 && *(_BYTE *)v24 >> 4 != 8)
      {
        v17 = 1;
        goto LABEL_63;
      }
    }
    else if (!a12)
    {
      v17 = 1;
      goto LABEL_63;
    }
    v19 = a12;
    v18 = a13;
  }
  if (!v19 && v18)
  {
    v17 = 4;
    goto LABEL_63;
  }
  *a9 = 0;
  if ((*(_BYTE *)v24 & 1) == 0 && !(*(_BYTE *)v24 >> 4))
  {
    v19 = v24 + 1;
    v18 = *((unsigned __int8 *)v24 + 1);
    *a9 = v18 == 0;
LABEL_57:
    if (*a9 && !(*(_BYTE *)v24 >> 4))
    {
      v17 = 2;
      goto LABEL_63;
    }
    *v21 = v19;
    *v20 = v18;
    if (_os_log_fmt_validate_cmd(v27, v22, v24, v18))
      return 0;
    else
      return 3;
  }
  v15 = _os_log_fmt_compose_read_range(v24, v18, &v17);
  if (!v15)
    goto LABEL_63;
  if (v19)
    v19 = (__int16 *)((char *)v19 + *(unsigned __int16 *)v15);
  *a9 = *((__int16 *)v15 + 1) < 0;
  if (!*a9 || v23 || (*((_WORD *)v15 + 1) & 0x7FFF) != 0 || v18 - *(unsigned __int16 *)v15 < 0x8000)
  {
    v18 = *((_WORD *)v15 + 1) & 0x7FFF;
  }
  else
  {
    v18 = 0x8000;
    *a9 = 0;
  }
  if (*(_BYTE *)v24 >> 4 != 15)
    goto LABEL_57;
  v13 = *(_QWORD *)(v27 + 56);
  switch(v13)
  {
    case 0:
      v17 = 3;
      goto LABEL_63;
    case 0x68736168:
    case 0x68736168766564:
      goto LABEL_52;
    case 0x786F626C69616DLL:
      goto LABEL_54;
    case 0x35646D6E69616C70:
LABEL_52:
      *v21 = v19;
      *v20 = v18;
      return 5;
    case 0x617474616C69616DLL:
    case 0x656D616E6C69616DLL:
    case 0x6A6275736C69616DLL:
    case 0x6D6D75736C69616DLL:
    case 0x6F6363616C69616DLL:
LABEL_54:
      *v21 = v19;
      *v20 = v18;
      return 6;
    case 0x7075626D6C69616DLL:
      goto LABEL_52;
  }
  if (v13 != 0x726464616C69616DLL)
  {
    v17 = 9;
    goto LABEL_63;
  }
  *v21 = v19;
  *v20 = v18;
  return 7;
}

BOOL os_log_fmt_validate_mask(uint64_t a1)
{
  return a1 == 1752392040
      || a1 == 0x68736168766564
      || a1 == 0x786F626C69616DLL
      || a1 == 0x35646D6E69616C70
      || a1 == 0x617474616C69616DLL
      || a1 == 0x656D616E6C69616DLL
      || a1 == 0x6A6275736C69616DLL
      || a1 == 0x6D6D75736C69616DLL
      || a1 == 0x6F6363616C69616DLL
      || a1 == 0x7075626D6C69616DLL
      || a1 == 0x726464616C69616DLL;
}

unsigned __int8 *_os_log_fmt_compose_read_range(__int16 *a1, unsigned __int16 a2, _BYTE *a3)
{
  if (((*(_BYTE *)a1 & 1) != 0 || *(unsigned __int8 *)a1 >> 4 > 1u) && *((_BYTE *)a1 + 1) == 4)
  {
    if (a2 >= (int)(unsigned __int16)a1[1] && a2 - (unsigned __int16)a1[1] >= (a1[2] & 0x7FFF))
    {
      if (a1[2] >= 0 || *(_BYTE *)a1 >> 4)
      {
        return (unsigned __int8 *)(a1 + 1);
      }
      else
      {
        *a3 = 2;
        return 0;
      }
    }
    else
    {
      *a3 = 4;
      return 0;
    }
  }
  else
  {
    *a3 = 3;
    return 0;
  }
}

BOOL _os_log_fmt_validate_cmd(uint64_t a1, unsigned __int16 a2, _BYTE *a3, unsigned __int16 a4)
{
  int v4;
  BOOL v6;

  if (*a3 >> 4 == 1)
  {
    return 0;
  }
  else if (((*(_WORD *)(a1 + 8) & 0x10) != 0) == (*a3 >> 4 == 0))
  {
    if ((*(_WORD *)(a1 + 8) & 0x10) != 0 && (!a4 || ((a4 - 1) & a4) != 0))
    {
      return 0;
    }
    else
    {
      switch(*(_BYTE *)(a1 + 10))
      {
        case 1:
        case 2:
          v6 = a4 <= 4uLL;
          break;
        case 3:
        case 4:
          v6 = a4 <= 4uLL;
          break;
        case 5:
        case 6:
        case 7:
        case 8:
          v6 = a4 <= 4uLL;
          break;
        case 9:
        case 0xA:
          v6 = a4 <= (int)a2;
          break;
        case 0xB:
        case 0xC:
          v6 = a4 <= 8uLL;
          break;
        case 0xD:
          v6 = a4 == a2;
          break;
        case 0xE:
          v6 = a4 == 8;
          break;
        case 0xF:
          v6 = a4 == 8;
          break;
        case 0x10:
          v6 = *a3 >> 4 == 2;
          break;
        case 0x11:
          v6 = *a3 >> 4 == 5;
          break;
        case 0x12:
          v4 = *a3 >> 4;
          v6 = (v4 - 2) < 3 || v4 == 8;
          break;
        case 0x13:
          v6 = *a3 >> 4 == 3;
          break;
        default:
          _os_crash("Unexpected type");
          __break(1u);
          break;
      }
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

void os_log_fmt_compose(uint64_t a1, char *a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, _BYTE *a6, __int16 *a7, unsigned __int16 a8, __int16 *a9, unsigned __int16 a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  unsigned __int8 data;
  BOOL v22;
  unsigned __int16 v23;
  unsigned __int8 *v24;
  unint64_t v25;
  _BYTE *v26;
  _QWORD __b[8];
  unsigned __int8 v28;
  __int16 v29;
  _BYTE *v30;
  unsigned __int16 v31;
  __int16 *v32;
  _BYTE *v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  __int16 *v44;
  uint64_t *v45;
  __int16 *v46;
  char v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  int v53;
  unsigned int i;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;

  v38 = a1;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v30 = a6 + 2;
  v29 = 0;
  v29 = a6[1];
  v28 = 0;
  v28 = (*a6 & 0x60) >> 5;
  memset(__b, 0, sizeof(__b));
  v26 = 0;
  while (1)
  {
    v25 = 0;
    v25 = strcspn(v37, "%");
    v41 = v38;
    v40 = v37;
    v39 = v25;
    if ((*(_WORD *)(v38 + 20) & 2) != 0)
    {
      v42 = 0;
    }
    else
    {
      v57 = v41;
      if (v39 <= *(_DWORD *)(v57 + 12) - ((*(_BYTE *)(v57 + 22) ^ 1) & 1u) - *(_DWORD *)(v57 + 8))
      {
        __memcpy_chk(*(_QWORD *)v41 + *(unsigned int *)(v41 + 8), v40, v39, -1);
        v61 = v41;
        v60 = v39;
        *(_DWORD *)(v41 + 8) += v39;
        if ((*(_BYTE *)(v61 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v61 + *(unsigned int *)(v61 + 8)) = 0;
        v42 = v60;
      }
      else
      {
        v42 = os_trace_blob_add_slow(v41, (uint64_t)v40, v39);
      }
    }
    v37 += v25;
    if (!*v37)
      break;
    v25 = os_log_fmt_delimit(v37, v36, (size_t)__b);
    if (v25)
    {
      v37 += v25;
      if ((__b[1] & 1) != 0)
      {
        _os_log_fmt_decode_give_up(v38, (uint64_t)__b, v10, v11, v12, v13, v14, v15);
        return;
      }
      os_log_fmt_read_aster_if_necessary((uint64_t)__b, &v29, &v30);
      v24 = 0;
      v23 = 0;
      v45 = (uint64_t *)&v30;
      v44 = &v29;
      if (v29)
      {
        v43 = 0;
        v43 = *v45;
        --*v44;
        *v45 = v43 + 2 + *(unsigned __int8 *)(v43 + 1);
        v46 = (__int16 *)v43;
      }
      else
      {
        v46 = 0;
      }
      v26 = v46;
      v22 = 0;
      data = os_log_fmt_get_data((uint64_t)__b, v28, v35, v46, v29, v34, (__int16 **)&v24, &v23, &v22, v32, v31, a9, a10);
      if (data == 5)
      {
        _os_log_fmt_compose_masked_digest(v38, (uint64_t)__b, (uint64_t)v24, v23, v22, v17, v18, v19);
      }
      else if (data == 6 || data == 7)
      {
        _os_log_fmt_compose_masked_partial_redacted(v38, (uint64_t)__b, v24, v23, v22);
      }
      else if (data)
      {
        _os_log_fmt_decode_data_access_failure(v38, (uint64_t)__b, data, v26, v23, v17, v18, v19);
      }
      else if ((__b[1] & 0x40) == 0
             || (_os_log_fmt_compose_annotated(v38, v34, (uint64_t)__b, (uint64_t)v26, (uint64_t)v24, v23, v22) & 1) == 0)
      {
        if ((__b[1] & 0x10) != 0)
          _os_log_fmt_compose_scalar(v38, __b, v34, v24, v23);
        else
          _os_log_fmt_compose_data(v38, (uint64_t)__b, v26, (uint64_t)v24, v23, v22);
      }
    }
    else
    {
      if (!v37[1])
        break;
      v16 = v37[1];
      v49 = v38;
      v48 = v16;
      v47 = v16;
      v52 = v38;
      v51 = &v47;
      v50 = 1;
      if ((*(_WORD *)(v38 + 20) & 2) != 0)
      {
        v53 = 0;
      }
      else
      {
        v56 = v52;
        if (v50 <= *(_DWORD *)(v56 + 12) - ((*(_BYTE *)(v56 + 22) ^ 1) & 1u) - *(_DWORD *)(v56 + 8))
        {
          __memcpy_chk(*(_QWORD *)v52 + *(unsigned int *)(v52 + 8), v51, v50, -1);
          v59 = v52;
          v58 = v50;
          *(_DWORD *)(v52 + 8) += v50;
          if ((*(_BYTE *)(v59 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v59 + *(unsigned int *)(v59 + 8)) = 0;
          v53 = v58;
        }
        else
        {
          v53 = os_trace_blob_add_slow(v52, (uint64_t)v51, v50);
        }
      }
      v37 += 2;
    }
  }
  v55 = v38;
  i = 0;
  for (i = *(_DWORD *)(v38 + 8); ; --i)
  {
    v20 = 0;
    if (i)
      v20 = isspace(*(char *)(*(_QWORD *)v55 + i - 1)) != 0;
    if (!v20)
      break;
  }
  v63 = v55;
  v62 = i;
  *(_DWORD *)(v55 + 8) = i;
  if ((*(_BYTE *)(v63 + 22) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)v63 + v62) = 0;
}

size_t _os_log_fmt_compose_masked_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t result;
  char v9;
  unsigned __int16 v10;
  int v13;
  size_t v14;

  v10 = a4;
  v9 = a5;
  os_trace_blob_addf(a1, "<mask.%.*s: ", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 18));
  if (v10 || (v9 & 1) != 0)
  {
    os_trace_blob_add_hexdump(a1, a3, v10, v9 & 1);
  }
  else
  {
    v14 = strlen("(null)");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v14 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), "(null)", v14, -1);
        *(_DWORD *)(a1 + 8) += v14;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)"(null)", v14);
      }
    }
  }
  result = strlen(">");
  v13 = result;
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    if (result <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
    {
      result = __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), ">", result, -1);
      *(_DWORD *)(a1 + 8) += v13;
      if ((*(_BYTE *)(a1 + 22) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
    }
    else
    {
      return os_trace_blob_add_slow(a1, (uint64_t)">", result);
    }
  }
  return result;
}

uint64_t _os_log_fmt_compose_masked_partial_redacted(uint64_t a1, uint64_t a2, _BYTE *a3, unsigned __int16 a4, char a5)
{
  uint64_t result;
  BOOL v6;
  BOOL v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  uint64_t v21;
  size_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  _BYTE __b[4];
  char v34;
  unsigned __int16 v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  char *__s;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  size_t v50;
  const char *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  size_t v59;
  const char *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  size_t v68;
  const char *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  size_t v77;
  const char *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  size_t v86;
  const char *v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  size_t v95;
  const char *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  size_t v104;
  const char *v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  unint64_t v113;
  const char *v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  unint64_t v122;
  const char *v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;

  v38 = a1;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  if (a4 || (v34 & 1) != 0)
  {
    if (v35 >= 4uLL)
    {
      memset(__b, 0, sizeof(__b));
      __b[0] = *v36;
      __b[1] = v36[1];
      __b[2] = v36[2];
      __b[3] = v36[3];
      v32 = __b[3] == 2;
      v6 = 0;
      if ((v34 & 1) == 0)
      {
        v6 = 0;
        if (!__b[0])
        {
          v6 = 1;
          if (__b[3] == 2)
            v6 = __b[2] == 0;
        }
      }
      if (v6)
      {
        return os_trace_blob_addns(v38, v36 + 4, v35 - 4, 0);
      }
      else
      {
        v7 = 1;
        if (__b[3] != 2)
          v7 = __b[3] == 0;
        v31 = v7;
        v30 = __b[3] == 1;
        v103 = v38;
        v102 = "<";
        v8 = strlen("<");
        v106 = v38;
        v105 = "<";
        v104 = v8;
        if ((*(_WORD *)(v38 + 20) & 2) != 0)
        {
          v107 = 0;
        }
        else
        {
          v108 = v106;
          if (v104 <= *(_DWORD *)(v108 + 12) - ((*(_BYTE *)(v108 + 22) ^ 1) & 1u) - *(_DWORD *)(v108 + 8))
          {
            __memcpy_chk(*(_QWORD *)v106 + *(unsigned int *)(v106 + 8), v105, v104, -1);
            v110 = v106;
            v109 = v104;
            *(_DWORD *)(v106 + 8) += v104;
            if ((*(_BYTE *)(v110 + 22) & 1) == 0)
              *(_BYTE *)(*(_QWORD *)v110 + *(unsigned int *)(v110 + 8)) = 0;
            v107 = v109;
          }
          else
          {
            v107 = os_trace_blob_add_slow(v106, (uint64_t)v105, v104);
          }
        }
        if ((unint64_t)__b[0] + 4 < v35)
        {
          v29 = __b[0] + 4;
          if (v32)
          {
            if (__b[2] >= (unint64_t)v35 - v29)
              v15 = v35 - v29;
            else
              v15 = __b[2];
          }
          else
          {
            v15 = v35 - v29;
          }
          v28 = v15;
          v27 = 0;
          if (v15)
          {
            if (v30)
            {
              v94 = v38;
              v93 = "…";
              v16 = strlen("…");
              v97 = v38;
              v96 = "…";
              v95 = v16;
              if ((*(_WORD *)(v38 + 20) & 2) != 0)
              {
                v98 = 0;
              }
              else
              {
                v99 = v97;
                if (v95 <= *(_DWORD *)(v99 + 12) - ((*(_BYTE *)(v99 + 22) ^ 1) & 1u) - *(_DWORD *)(v99 + 8))
                {
                  __memcpy_chk(*(_QWORD *)v97 + *(unsigned int *)(v97 + 8), v96, v95, -1);
                  v101 = v97;
                  v100 = v95;
                  *(_DWORD *)(v97 + 8) += v95;
                  if ((*(_BYTE *)(v101 + 22) & 1) == 0)
                    *(_BYTE *)(*(_QWORD *)v101 + *(unsigned int *)(v101 + 8)) = 0;
                  v98 = v100;
                }
                else
                {
                  v98 = os_trace_blob_add_slow(v97, (uint64_t)v96, v95);
                }
              }
              v27 = 1;
            }
            if (os_trace_blob_addns(v38, &v36[v29], v28, 0))
            {
              if (v31 || (v34 & 1) != 0)
              {
                v85 = v38;
                v84 = "…";
                v17 = strlen("…");
                v88 = v38;
                v87 = "…";
                v86 = v17;
                if ((*(_WORD *)(v38 + 20) & 2) != 0)
                {
                  v89 = 0;
                }
                else
                {
                  v90 = v88;
                  if (v86 <= *(_DWORD *)(v90 + 12) - ((*(_BYTE *)(v90 + 22) ^ 1) & 1u) - *(_DWORD *)(v90 + 8))
                  {
                    __memcpy_chk(*(_QWORD *)v88 + *(unsigned int *)(v88 + 8), v87, v86, -1);
                    v92 = v88;
                    v91 = v86;
                    *(_DWORD *)(v88 + 8) += v86;
                    if ((*(_BYTE *)(v92 + 22) & 1) == 0)
                      *(_BYTE *)(*(_QWORD *)v92 + *(unsigned int *)(v92 + 8)) = 0;
                    v89 = v91;
                  }
                  else
                  {
                    v89 = os_trace_blob_add_slow(v88, (uint64_t)v87, v86);
                  }
                }
              }
              v27 = 1;
            }
          }
          if (v32)
          {
            v26 = __b[0] + 4 + v28;
            v25 = v35 - v26;
            if (v25)
            {
              if (v30)
              {
                v76 = v38;
                v75 = "…";
                v18 = strlen("…");
                v79 = v38;
                v78 = "…";
                v77 = v18;
                if ((*(_WORD *)(v38 + 20) & 2) != 0)
                {
                  v80 = 0;
                }
                else
                {
                  v81 = v79;
                  if (v77 <= *(_DWORD *)(v81 + 12) - ((*(_BYTE *)(v81 + 22) ^ 1) & 1u) - *(_DWORD *)(v81 + 8))
                  {
                    __memcpy_chk(*(_QWORD *)v79 + *(unsigned int *)(v79 + 8), v78, v77, -1);
                    v83 = v79;
                    v82 = v77;
                    *(_DWORD *)(v79 + 8) += v77;
                    if ((*(_BYTE *)(v83 + 22) & 1) == 0)
                      *(_BYTE *)(*(_QWORD *)v83 + *(unsigned int *)(v83 + 8)) = 0;
                    v80 = v82;
                  }
                  else
                  {
                    v80 = os_trace_blob_add_slow(v79, (uint64_t)v78, v77);
                  }
                }
                v27 = 1;
              }
              if (os_trace_blob_addns(v38, &v36[v26], v25, 0))
              {
                if (v31)
                {
                  v67 = v38;
                  v66 = "…";
                  v19 = strlen("…");
                  v70 = v38;
                  v69 = "…";
                  v68 = v19;
                  if ((*(_WORD *)(v38 + 20) & 2) != 0)
                  {
                    v71 = 0;
                  }
                  else
                  {
                    v72 = v70;
                    if (v68 <= *(_DWORD *)(v72 + 12) - ((*(_BYTE *)(v72 + 22) ^ 1) & 1u) - *(_DWORD *)(v72 + 8))
                    {
                      __memcpy_chk(*(_QWORD *)v70 + *(unsigned int *)(v70 + 8), v69, v68, -1);
                      v74 = v70;
                      v73 = v68;
                      *(_DWORD *)(v70 + 8) += v68;
                      if ((*(_BYTE *)(v74 + 22) & 1) == 0)
                        *(_BYTE *)(*(_QWORD *)v74 + *(unsigned int *)(v74 + 8)) = 0;
                      v71 = v73;
                    }
                    else
                    {
                      v71 = os_trace_blob_add_slow(v70, (uint64_t)v69, v68);
                    }
                  }
                }
                v27 = 1;
              }
            }
          }
          if ((v27 & 1) != 0)
          {
            v58 = v38;
            v57 = ", ";
            v20 = strlen(", ");
            v61 = v38;
            v60 = ", ";
            v59 = v20;
            if ((*(_WORD *)(v38 + 20) & 2) != 0)
            {
              v62 = 0;
            }
            else
            {
              v63 = v61;
              if (v59 <= *(_DWORD *)(v63 + 12) - ((*(_BYTE *)(v63 + 22) ^ 1) & 1u) - *(_DWORD *)(v63 + 8))
              {
                __memcpy_chk(*(_QWORD *)v61 + *(unsigned int *)(v61 + 8), v60, v59, -1);
                v65 = v61;
                v64 = v59;
                *(_DWORD *)(v61 + 8) += v59;
                if ((*(_BYTE *)(v65 + 22) & 1) == 0)
                  *(_BYTE *)(*(_QWORD *)v65 + *(unsigned int *)(v65 + 8)) = 0;
                v62 = v64;
              }
              else
              {
                v62 = os_trace_blob_add_slow(v61, (uint64_t)v60, v59);
              }
            }
          }
        }
        os_trace_blob_addf(v38, "length=%u", v9, v10, v11, v12, v13, v14, __b[1]);
        v24 = (uint64_t)(v36 + 4);
        if (__b[0] >= (unint64_t)v35 - 4)
          v21 = v35 - 4;
        else
          v21 = __b[0];
        v23 = v21;
        if (v21)
        {
          v49 = v38;
          v48 = ", ";
          v22 = strlen(", ");
          v52 = v38;
          v51 = ", ";
          v50 = v22;
          if ((*(_WORD *)(v38 + 20) & 2) != 0)
          {
            v53 = 0;
          }
          else
          {
            v54 = v52;
            if (v50 <= *(_DWORD *)(v54 + 12) - ((*(_BYTE *)(v54 + 22) ^ 1) & 1u) - *(_DWORD *)(v54 + 8))
            {
              __memcpy_chk(*(_QWORD *)v52 + *(unsigned int *)(v52 + 8), v51, v50, -1);
              v56 = v52;
              v55 = v50;
              *(_DWORD *)(v52 + 8) += v50;
              if ((*(_BYTE *)(v56 + 22) & 1) == 0)
                *(_BYTE *)(*(_QWORD *)v56 + *(unsigned int *)(v56 + 8)) = 0;
              v53 = v55;
            }
            else
            {
              v53 = os_trace_blob_add_slow(v52, (uint64_t)v51, v50);
            }
          }
          os_trace_blob_add_hexdump(v38, v24, v23, v23 != __b[0]);
        }
        v40 = v38;
        __s = ">";
        result = strlen(">");
        v43 = v38;
        v42 = ">";
        v41 = result;
        if ((*(_WORD *)(v38 + 20) & 2) != 0)
        {
          v44 = 0;
        }
        else
        {
          v45 = v43;
          if (v41 <= *(_DWORD *)(v45 + 12) - ((*(_BYTE *)(v45 + 22) ^ 1) & 1u) - *(_DWORD *)(v45 + 8))
          {
            result = __memcpy_chk(*(_QWORD *)v43 + *(unsigned int *)(v43 + 8), v42, v41, -1);
            v47 = v43;
            v46 = v41;
            *(_DWORD *)(v43 + 8) += v41;
            if ((*(_BYTE *)(v47 + 22) & 1) == 0)
              *(_BYTE *)(*(_QWORD *)v47 + *(unsigned int *)(v47 + 8)) = 0;
          }
          else
          {
            result = os_trace_blob_add_slow(v43, (uint64_t)v42, v41);
            v44 = result;
          }
        }
      }
    }
    else
    {
      v112 = v38;
      v111 = "<…>";
      result = strlen("<…>");
      v115 = v38;
      v114 = "<…>";
      v113 = result;
      if ((*(_WORD *)(v38 + 20) & 2) != 0)
      {
        v116 = 0;
      }
      else
      {
        v117 = v115;
        if (v113 <= *(_DWORD *)(v117 + 12) - ((*(_BYTE *)(v117 + 22) ^ 1) & 1u) - *(_DWORD *)(v117 + 8))
        {
          result = __memcpy_chk(*(_QWORD *)v115 + *(unsigned int *)(v115 + 8), v114, v113, -1);
          v119 = v115;
          v118 = v113;
          *(_DWORD *)(v115 + 8) += v113;
          if ((*(_BYTE *)(v119 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v119 + *(unsigned int *)(v119 + 8)) = 0;
          v116 = v118;
        }
        else
        {
          result = os_trace_blob_add_slow(v115, (uint64_t)v114, v113);
          v116 = result;
        }
      }
    }
  }
  else
  {
    v121 = v38;
    v120 = "<(null)>";
    result = strlen("<(null)>");
    v124 = v38;
    v123 = "<(null)>";
    v122 = result;
    if ((*(_WORD *)(v38 + 20) & 2) != 0)
    {
      v125 = 0;
    }
    else
    {
      v126 = v124;
      if (v122 <= *(_DWORD *)(v126 + 12) - ((*(_BYTE *)(v126 + 22) ^ 1) & 1u) - *(_DWORD *)(v126 + 8))
      {
        result = __memcpy_chk(*(_QWORD *)v124 + *(unsigned int *)(v124 + 8), v123, v122, -1);
        v128 = v124;
        v127 = v122;
        *(_DWORD *)(v124 + 8) += v122;
        if ((*(_BYTE *)(v128 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)v128 + *(unsigned int *)(v128 + 8)) = 0;
        v125 = v127;
      }
      else
      {
        result = os_trace_blob_add_slow(v124, (uint64_t)v123, v122);
        v125 = result;
      }
    }
  }
  return result;
}

void _os_log_fmt_decode_data_access_failure(uint64_t a1, uint64_t a2, unsigned __int8 a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;

  switch(a3)
  {
    case 1u:
      v9 = strlen("<private>");
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        if (v9 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
        {
          __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), "<private>", v9, -1);
          *(_DWORD *)(a1 + 8) += v9;
          if ((*(_BYTE *)(a1 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
        else
        {
          os_trace_blob_add_slow(a1, (uint64_t)"<private>", v9);
        }
      }
      break;
    case 2u:
      _os_log_fmt_decode_error(a1);
      break;
    case 3u:
      _os_log_fmt_decode_cmd_mismatch(a1, a2, a4, (unsigned __int16)a5, a5, a6, a7, a8);
      break;
    case 4u:
      _os_log_fmt_decode_bad_range(a1, a2, (uint64_t)a4, (unsigned __int16)a5, a5, a6, a7, a8);
      break;
    case 8u:
    case 9u:
    case 0xAu:
      _os_log_fmt_decode_masked_unknown(a1, a2, (uint64_t)a4, a3, a5, a6, a7, a8);
      break;
    default:
      return;
  }
}

uint64_t _os_log_fmt_compose_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 a6, char a7)
{
  char v8;

  if ((*(_WORD *)(a3 + 8) & 0x80) != 0)
    v8 = _os_log_fmt_builtin_annotated(a1, a2, a3, a4, a5, a6, a7 & 1) & 1;
  else
    v8 = 0;
  return v8 & 1;
}

uint64_t _os_log_fmt_compose_scalar(uint64_t a1, _QWORD *a2, uint64_t a3, unsigned __int8 *a4, __int16 a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _BYTE v22[15];
  char v23;
  uint64_t v24;
  int v25;
  unsigned __int16 v26;
  uint64_t v27;
  _BYTE *v28;
  int v29;
  uint64_t __b;
  __int16 v31;
  unsigned __int8 *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _DWORD v45[2];

  v35 = a1;
  v34 = a2;
  v33 = a3;
  v32 = a4;
  v31 = a5;
  memset(&__b, 0, sizeof(__b));
  __b = os_log_fmt_read_scalar((uint64_t)v34, v32, v31);
  v29 = 0;
  if ((v34[1] & 2) != 0)
  {
    v5 = *((_DWORD *)v34 + 5);
    v6 = v29++;
    v45[v6] = v5;
  }
  if ((v34[1] & 4) != 0)
  {
    v7 = *((_DWORD *)v34 + 6);
    v8 = v29++;
    v45[v8] = v7;
  }
  if (*((unsigned __int16 *)v34 + 6) + 2 <= 6)
    v9 = 6;
  else
    v9 = *((unsigned __int16 *)v34 + 6) + 2;
  v10 = (v9 + 1);
  v28 = v22;
  v11 = &v22[-((v10 + 15) & 0x1FFFFFFF0)];
  v27 = v10;
  v26 = 0;
  result = _os_log_fmt_compose_format_copy(v11, v34);
  v26 = result;
  switch(*((_BYTE *)v34 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      result = _os_crash("Unexpected type");
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 8:
      v19 = v35;
      v20 = strerror(__b);
      v37 = v19;
      v36 = v20;
      v21 = (uint64_t)v20;
      result = strlen(v20);
      v40 = v19;
      v39 = v21;
      v38 = result;
      if ((*(_WORD *)(v19 + 20) & 2) != 0)
      {
        v41 = 0;
      }
      else
      {
        v42 = v40;
        if (v38 <= *(_DWORD *)(v42 + 12) - ((*(_BYTE *)(v42 + 22) ^ 1) & 1u) - *(_DWORD *)(v42 + 8))
        {
          result = __memcpy_chk(*(_QWORD *)v40 + *(unsigned int *)(v40 + 8), v39, v38, -1);
          v44 = v40;
          v43 = v38;
          *(_DWORD *)(v40 + 8) += v38;
          if ((*(_BYTE *)(v44 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v44 + *(unsigned int *)(v44 + 8)) = 0;
          v41 = v43;
        }
        else
        {
          result = os_trace_blob_add_slow(v40, v39, v38);
          v41 = result;
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (v33 == 8)
      {
        v24 = __b;
        if (!v29)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v24);
        if (v29 == 1)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        if (v29 == 2)
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        return result;
      }
      v23 = 0;
      v23 = v11[v26 - 1];
      if (*((_BYTE *)v34 + 10) == 13)
        goto LABEL_32;
      if (v33 == 4)
      {
        result = isupper(v23);
        if ((_DWORD)result)
        {
          result = tolower(v23);
          v11[v26 - 1] = result;
        }
        else
        {
          v11[v26 - 2] = v23;
          v11[v26 - 1] = 0;
        }
LABEL_9:
        v25 = __b;
        if (!v29)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v25);
        if (v29 == 1)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        if (v29 == 2)
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      else
      {
        result = isupper(v23);
        if ((_DWORD)result)
        {
          v11[v26 - 1] = 108;
          v11[v26] = 108;
          result = tolower(v23);
          v11[v26 + 1] = result;
          v11[v26 + 2] = 0;
        }
        else
        {
          v11[v26 - 2] = 108;
          v11[v26 - 1] = 108;
          v11[v26] = v23;
          v11[v26 + 1] = 0;
        }
LABEL_32:
        if (!v29)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
        if (v29 == 1)
          result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        if (v29 == 2)
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      return result;
    case 0xB:
    case 0xC:
      goto LABEL_32;
    case 0xE:
      if (!v29)
        result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
      if (v29 == 1)
        result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      if (v29 == 2)
        return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      return result;
    case 0xF:
      if (!v29)
        result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
      if (v29 == 1)
        result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      if (v29 == 2)
        return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      return result;
    default:
      return result;
  }
}

uint64_t _os_log_fmt_compose_data(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, unsigned __int16 a5, char a6)
{
  int v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  int v26;
  unsigned __int16 v27;
  uint64_t v28;
  char **v29;
  int v30;
  char v31;
  unsigned __int16 v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  int v40;

  v36 = a1;
  v35 = a2;
  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6 & 1;
  v30 = 0;
  v6 = *(unsigned __int16 *)(a2 + 12);
  v29 = &v25;
  v7 = (char *)&v25 - ((v6 + 18) & 0x1FFF0);
  v28 = (v6 + 3);
  v27 = 0;
  result = _os_log_fmt_compose_format_copy(v7, (_QWORD *)a2);
  v27 = result;
  if (*v34 >> 4 == 3)
  {
    result = os_trace_blob_add_hexdump(v36, v33, v32, v31 & 1);
    v26 = 1;
  }
  else
  {
    if (*(_BYTE *)(v35 + 10) == 18)
      v7[v27 - 1] = 115;
    if ((*(_WORD *)(v35 + 8) & 2) != 0)
    {
      v15 = *(_DWORD *)(v35 + 20);
      v16 = v30++;
      *(&v40 + v16) = v15;
    }
    if (v32)
    {
      if ((*(_WORD *)(v35 + 8) & 8) != 0)
      {
        if ((*(_WORD *)(v35 + 8) & 4) != 0)
        {
          if ((*(_DWORD *)(v35 + 24) & 0x80000000) != 0 || *(_DWORD *)(v35 + 24) > (int)v32)
          {
            v21 = v30++;
            *(&v40 + v21) = v32;
          }
          else
          {
            v22 = *(_DWORD *)(v35 + 24);
            v23 = v30++;
            *(&v40 + v23) = v22;
          }
        }
        else
        {
          v25 = 0;
          v25 = strrchr(v7, 46);
          result = __memcpy_chk(v25, ".*s", 4, -1);
          v20 = v30++;
          *(&v40 + v20) = v32;
        }
      }
      else
      {
        result = __memcpy_chk(&v7[v27 - 1], ".*s", 4, -1);
        v19 = v30++;
        *(&v40 + v19) = v32;
      }
    }
    else
    {
      if ((v31 & 1) != 0)
        v17 = (const char *)&unk_BE91;
      else
        v17 = "(null)";
      v33 = (uint64_t)v17;
      if ((*(_WORD *)(v35 + 8) & 4) != 0)
      {
        v18 = v30++;
        *(&v40 + v18) = 0x7FFFFFFF;
      }
    }
    if (!v30)
      result = os_trace_blob_addf(v36, v7, v9, v10, v11, v12, v13, v14, v33);
    if (v30 == 1)
    {
      HIBYTE(v24) = HIBYTE(v33);
      result = os_trace_blob_addf(v36, v7, v9, v10, v11, v12, v13, v14, v40);
    }
    if (v30 == 2)
      result = os_trace_blob_addf(v36, v7, v9, v10, v11, v12, v13, v14, v40);
    if ((v31 & 1) != 0)
    {
      v39 = v36;
      v38 = "<…>";
      v37 = 0;
      return os_trace_blob_addns(v36, "<…>", 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  return result;
}

uint64_t _os_log_fmt_compose_format_copy(_BYTE *a1, _QWORD *a2)
{
  void *v3;
  unsigned __int16 __n;

  __n = *((_WORD *)a2 + 6);
  v3 = memchr((const void *)*a2, 125, __n);
  if (v3)
  {
    __n -= (_WORD)v3 - *a2;
    __memcpy_chk(a1, v3, __n, -1);
    *a1 = 37;
  }
  else
  {
    __memcpy_chk(a1, *a2, __n, -1);
  }
  a1[__n] = 0;
  return __n;
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 a6, char a7)
{
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t __n;
  char *__s1;
  char v21;

  __s1 = *(char **)(a3 + 40);
  __n = *(unsigned __int16 *)(a3 + 16);
  v11 = 0;
  v10 = 16;
  while (v11 < v10)
  {
    v9 = (v11 + v10) >> 1;
    v8 = strncmp(__s1, (&_os_log_fmt_builtin_annotated_functions)[2 * v9], __n);
    if (!v8)
      v8 = -(&_os_log_fmt_builtin_annotated_functions)[2 * v9][__n];
    if (!v8)
    {
      v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(&_os_log_fmt_builtin_annotated_functions)[2 * v9 + 1])(a1, a2, a3, a4, a5, a6, a7 & 1) & 1;
      return v21 & 1;
    }
    if (v8 < 0)
      v10 = (v11 + v10) >> 1;
    else
      v11 = v9 + 1;
  }
  v21 = 0;
  return v21 & 1;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  uint64_t v15;
  size_t v16;
  uint64_t scalar;
  char v19;
  unsigned __int16 v20;
  unsigned __int8 *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char *__s;
  uint64_t v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v25 = a1;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v19 = a7;
  if ((_os_log_fmt_spec_is_integer(a3, 1) & 1) != 0)
  {
    memset(&scalar, 0, sizeof(scalar));
    scalar = os_log_fmt_read_scalar(v23, v21, v20);
    if (**(_BYTE **)(v23 + 40) == 66)
    {
      if (scalar)
        v11 = "YES";
      else
        v11 = "NO";
      v37 = v25;
      v36 = v11;
      v12 = (uint64_t)v11;
      v13 = strlen(v11);
      v40 = v25;
      v39 = v12;
      v38 = v13;
      if ((*(_WORD *)(v25 + 20) & 2) != 0)
      {
        v41 = 0;
      }
      else
      {
        v42 = v40;
        if (v38 <= *(_DWORD *)(v42 + 12) - ((*(_BYTE *)(v42 + 22) ^ 1) & 1u) - *(_DWORD *)(v42 + 8))
        {
          __memcpy_chk(*(_QWORD *)v40 + *(unsigned int *)(v40 + 8), v39, v38, -1);
          v44 = v40;
          v43 = v38;
          *(_DWORD *)(v40 + 8) += v38;
          if ((*(_BYTE *)(v44 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v44 + *(unsigned int *)(v44 + 8)) = 0;
          v41 = v43;
        }
        else
        {
          v41 = os_trace_blob_add_slow(v40, v39, v38);
        }
      }
    }
    else
    {
      if (scalar)
        v14 = "true";
      else
        v14 = "false";
      v28 = v25;
      __s = v14;
      v15 = (uint64_t)v14;
      v16 = strlen(v14);
      v31 = v25;
      v30 = v15;
      v29 = v16;
      if ((*(_WORD *)(v25 + 20) & 2) != 0)
      {
        v32 = 0;
      }
      else
      {
        v33 = v31;
        if (v29 <= *(_DWORD *)(v31 + 12) - ((*(_BYTE *)(v31 + 22) ^ 1) & 1u) - *(_DWORD *)(v31 + 8))
        {
          __memcpy_chk(*(_QWORD *)v31 + *(unsigned int *)(v31 + 8), v30, v29, -1);
          v35 = v31;
          v34 = v29;
          *(_DWORD *)(v31 + 8) += v29;
          if ((*(_BYTE *)(v35 + 22) & 1) == 0)
            *(_BYTE *)(*(_QWORD *)v35 + *(unsigned int *)(v35 + 8)) = 0;
          v32 = v34;
        }
        else
        {
          v32 = os_trace_blob_add_slow(v31, v30, v29);
        }
      }
    }
    v26 = 1;
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(v25, v23, v22, v20, v7, v8, v9, v10);
    v26 = 1;
  }
  return v26 & 1;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_bitrate_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_bytes_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, unsigned __int16 a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int __errnum;

  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    __errnum = *a5;
    if (*a5)
      strerror(__errnum);
    os_trace_blob_addf(a1, "[%d: %s]", v6, v7, v8, v9, v10, v11, __errnum);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v8, v9, v10, v11);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, unsigned __int16 a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  int v23;
  _BYTE v29[3];
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;

  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    v23 = *a5;
    v29[0] = aPcDBLSW[(*a5 & 0xF000u) >> 12];
    if ((v23 & 0x100) != 0)
      v10 = 114;
    else
      v10 = 45;
    v29[1] = v10;
    if ((v23 & 0x80u) == 0)
      v11 = 45;
    else
      v11 = 119;
    v29[2] = v11;
    if ((v23 & 0x40) != 0)
      v12 = 120;
    else
      v12 = 45;
    v30 = v12;
    if ((v23 & 0x800) != 0)
    {
      if ((v23 & 0x40) != 0)
        v13 = 115;
      else
        v13 = 83;
      v30 = v13;
    }
    if ((v23 & 0x20) != 0)
      v14 = 114;
    else
      v14 = 45;
    v31 = v14;
    if ((v23 & 0x10) != 0)
      v15 = 119;
    else
      v15 = 45;
    v32 = v15;
    if ((v23 & 8) != 0)
      v16 = 120;
    else
      v16 = 45;
    v33 = v16;
    if ((v23 & 0x400) != 0)
    {
      if ((v23 & 8) != 0)
        v17 = 115;
      else
        v17 = 83;
      v33 = v17;
    }
    if ((v23 & 4) != 0)
      v18 = 114;
    else
      v18 = 45;
    v34 = v18;
    if ((v23 & 2) != 0)
      v19 = 119;
    else
      v19 = 45;
    v35 = v19;
    if ((v23 & 1) != 0)
      v20 = 120;
    else
      v20 = 45;
    v36 = v20;
    if ((v23 & 0x200) != 0)
    {
      if ((v23 & 1) != 0)
        v21 = 116;
      else
        v21 = 84;
      v36 = v21;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (*(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8) >= 0xAuLL)
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), v29, 10, -1);
        *(_DWORD *)(a1 + 8) += 10;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)v29, 0xAuLL);
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v6, v7, v8, v9);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, unsigned __int16 a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;

  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    v13 = *a5;
    if (*a5 < 0 || v13 >= 32)
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v6, v7, v8, v9, v10, v11, v13);
    else
      os_trace_blob_addf(a1, "[sig%s: %s]", v6, v7, v8, v9, v10, v11, (char)sys_signame[v13]);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v8, v9, v10, v11);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_iec_bitrate_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_iec_bytes_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, unsigned __int16 a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;

  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    v17 = *a5;
    mach_error_string(*a5 & 0xFFFFC1FF);
    os_trace_blob_addf(a1, "[%#x: %s]", v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v6, v7, v8, v9);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, unsigned __int16 a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  time_t v12;
  int v13;
  time_t v14;
  char v15;
  unsigned __int16 v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  tm *v21;
  char v22;

  v21 = a1;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  v16 = a6;
  v15 = a7;
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && (v16 == 4 || v16 == 8))
  {
    v14 = 0;
    if (v16 == 4)
    {
      v13 = 0;
      __memcpy_chk(&v13, v17, v16, 4);
      v14 = v13;
    }
    else
    {
      v12 = 0;
      __memcpy_chk(&v12, v17, v16, 8);
      v14 = v12;
    }
    os_trace_blob_add_localtime(v21, v14, 0, 3);
    v22 = 1;
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)v21, v19, v18, v16, v7, v8, v9, v10);
    v22 = 1;
  }
  return v22 & 1;
}

uint64_t _os_log_fmt_builtin_timespec(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, void *a5, unsigned __int16 a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  time_t __b[2];
  char v13;
  unsigned __int16 v14;
  void *__src;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  tm *v19;
  char v20;
  char v21;
  unint64_t v22;
  unsigned __int16 v23;
  _BYTE *v24;
  uint64_t v25;
  tm *v26;
  char v27;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  __src = a5;
  v14 = a6;
  v13 = a7;
  memset(__b, 0, sizeof(__b));
  if (*(_BYTE *)(v17 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)v19, v17, v16, v14, v7, v8, v9, v10);
    v20 = 1;
    return v20 & 1;
  }
  v26 = v19;
  v25 = v17;
  v24 = v16;
  v23 = v14;
  v22 = 16;
  v21 = v13 & 1;
  if (v14 > 0x10uLL || v23 < v22 && (v21 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)v26, v25, v24, v23, v7, v8, v9, v10);
LABEL_11:
    v27 = 0;
    goto LABEL_12;
  }
  if (v23 < v22 && (v21 & 1) != 0)
  {
    _os_log_fmt_decode_error((uint64_t)v26);
    goto LABEL_11;
  }
  v27 = 1;
LABEL_12:
  if ((v27 & 1) != 0)
  {
    memcpy(__b, __src, sizeof(__b));
    os_trace_blob_add_localtime(v19, __b[0], __b[1], 0);
  }
  v20 = 1;
  return v20 & 1;
}

uint64_t _os_log_fmt_builtin_timeval(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, void *a5, unsigned __int16 a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  time_t __b[2];
  char v13;
  unsigned __int16 v14;
  void *__src;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  tm *v19;
  char v20;
  char v21;
  unint64_t v22;
  unsigned __int16 v23;
  _BYTE *v24;
  uint64_t v25;
  tm *v26;
  char v27;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  __src = a5;
  v14 = a6;
  v13 = a7;
  memset(__b, 0, sizeof(__b));
  if (*(_BYTE *)(v17 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)v19, v17, v16, v14, v7, v8, v9, v10);
    v20 = 1;
    return v20 & 1;
  }
  v26 = v19;
  v25 = v17;
  v24 = v16;
  v23 = v14;
  v22 = 16;
  v21 = v13 & 1;
  if (v14 > 0x10uLL || v23 < v22 && (v21 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)v26, v25, v24, v23, v7, v8, v9, v10);
LABEL_11:
    v27 = 0;
    goto LABEL_12;
  }
  if (v23 < v22 && (v21 & 1) != 0)
  {
    _os_log_fmt_decode_error((uint64_t)v26);
    goto LABEL_11;
  }
  v27 = 1;
LABEL_12:
  if ((v27 & 1) != 0)
  {
    memcpy(__b, __src, sizeof(__b));
    os_trace_blob_add_localtime(v19, __b[0], SLODWORD(__b[1]), 1);
  }
  v20 = 1;
  return v20 & 1;
}

uint64_t _os_log_fmt_builtin_uuid_t(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, const unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v11;
  char v12;
  char __b[37];

  if (*(_BYTE *)(a3 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, (unsigned __int16)a6, (uint64_t)a5, a6, a7, a8);
    return 1;
  }
  if ((unsigned __int16)a6 > 0x10uLL || (unsigned __int16)a6 < 0x10uLL && (a7 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, (unsigned __int16)a6, (uint64_t)a5, a6, a7, a8);
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if ((unsigned __int16)a6 < 0x10uLL && (a7 & 1) != 0)
  {
    _os_log_fmt_decode_error(a1);
    goto LABEL_11;
  }
  v12 = 1;
LABEL_12:
  if ((v12 & 1) != 0)
  {
    memset(__b, 0, sizeof(__b));
    uuid_unparse_upper(a5, __b);
    v11 = strlen(__b);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v11 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), __b, v11, -1);
        *(_DWORD *)(a1 + 8) += v11;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)__b, v11);
      }
    }
  }
  return 1;
}

uint64_t _os_log_fmt_spec_is_integer(uint64_t a1, char a2)
{
  BOOL v2;
  char v4;

  if (*(_BYTE *)(a1 + 10) && *(unsigned __int8 *)(a1 + 10) <= 0xCu)
  {
    v4 = 1;
  }
  else
  {
    v2 = 0;
    if ((a2 & 1) != 0)
      v2 = *(_BYTE *)(a1 + 10) == 13;
    v4 = v2;
  }
  return v4 & 1;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *a5, unsigned __int16 a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unsigned int i;
  unsigned int v20;
  unsigned int v21;
  unint64_t scalar;

  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0)
  {
    scalar = os_log_fmt_read_scalar(a3, a5, a6);
    v20 = 0;
    for (i = 0; ; ++i)
    {
      v17 = 0;
      if (*(_QWORD *)(a7 + 8 * i))
      {
        v17 = 0;
        if (*(_QWORD *)(a7 + 8 * (i + 1)))
          v17 = scalar >= 0x3E8;
      }
      if (!v17)
        break;
      v20 = scalar % a2;
      scalar /= a2;
    }
    v21 = round((double)v20 * 100.0 / (double)a2);
    if (v21 == 100)
    {
      ++scalar;
      v21 = 0;
    }
    if (i)
    {
      if (scalar < 0xA && v21 % 0xA)
      {
        os_trace_blob_addf(a1, "%llu.%02u %s", v11, v12, v13, v14, v15, v16, scalar);
        return 1;
      }
      if (scalar < 0x64 && v21)
      {
        os_trace_blob_addf(a1, "%llu.%01u %s", v11, v12, v13, v14, v15, v16, scalar);
        return 1;
      }
    }
    os_trace_blob_addf(a1, "%llu %s", v11, v12, v13, v14, v15, v16, scalar);
    return 1;
  }
  _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v7, v8, v9, v10);
  return 1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return (MEMORY[0xFFFFFC104] & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x400) == 0;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  _os_log_to_kernel((char *)format, buf);
}

uint64_t _os_log_to_kernel(char *a1, _BYTE *a2)
{
  _QWORD v3[4];
  int v4;
  __int16 *v5[4];
  int v6;
  __int16 *v7[4];
  int v8;
  _BYTE *__b[3];
  unsigned __int8 v10;
  int v11;
  _BYTE *v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v13 = a1;
  v12 = a2;
  v11 = 0;
  v11 = *__error();
  v10 = 0;
  if ((MEMORY[0xFFFFFC104] & 0x2000000) != 0)
  {
    v10 = 3;
  }
  else if ((MEMORY[0xFFFFFC104] & 0x1000000) != 0)
  {
    v10 = 2;
  }
  else
  {
    v10 = 1;
  }
  memset(__b, 0, sizeof(__b));
  __b[0] = &v17;
  __b[1] = (_BYTE *)0x40000000000;
  v7[3] = (_WORD *)("/System/DriverKit/usr/lib/system/libsystem_trace_debug.dylib" + 40);
  v8 = 1024;
  LODWORD(__b[2]) = 0;
  WORD2(__b[2]) = 0;
  BYTE6(__b[2]) = 1;
  memset(v7, 0, 0x18uLL);
  v7[0] = (__int16 *)&v16;
  v7[1] = (__int16 *)0x40000000000;
  v5[3] = (_WORD *)("/System/DriverKit/usr/lib/system/libsystem_trace_debug.dylib" + 40);
  v6 = 1024;
  LODWORD(v7[2]) = 0;
  WORD2(v7[2]) = 0;
  BYTE6(v7[2]) = 1;
  memset(v5, 0, 0x18uLL);
  v5[0] = (__int16 *)&v15;
  v5[1] = (__int16 *)0x40000000000;
  v3[3] = 1024;
  v4 = 1024;
  LODWORD(v5[2]) = 0;
  WORD2(v5[2]) = 0;
  BYTE6(v5[2]) = 1;
  os_log_fmt_flatten(v12, v10, (uint64_t)__b, (uint64_t)v7, (uint64_t)v5, v11);
  memset(v3, 0, 0x18uLL);
  v3[0] = &v14;
  v3[1] = 0x40000000000;
  LODWORD(v3[2]) = 0;
  WORD2(v3[2]) = 0;
  BYTE6(v3[2]) = 0;
  os_log_fmt_compose((uint64_t)v3, v13, 2, v10, 8, __b[0], v7[0], (unsigned __int16)v7[1], v5[0], (unsigned __int16)v5[1]);
  return log_data_as_kernel(0, 0, v3[0], (LODWORD(v3[1]) + 1));
}

uint64_t _os_trace_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v4 = malloc_type_realloc(a1, a2, 995718784);
  if (!v4)
  {
    v3 = _os_assert_log(0);
    _os_crash(v3);
    __break(1u);
  }
  return v4;
}

uint64_t _os_trace_malloc(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = malloc_type_malloc(a1, 19701672);
  if (!v3)
  {
    v2 = _os_assert_log(0);
    _os_crash(v2);
    __break(1u);
  }
  return v3;
}

uint64_t _os_trace_memdup(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = _os_trace_malloc(a2);
  return __memcpy_chk(v2, a1, a2, -1);
}

void _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 12));
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  size_t v23;
  size_t v24;
  size_t v25;
  const char *v26;

  v20 = a4;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", (uint64_t)a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 12));
  if ((*a3 >> 4) >= 5uLL)
  {
    os_trace_blob_addf(a1, "%d", v8, v9, v10, v11, v12, v13, *a3 >> 4);
  }
  else
  {
    v26 = _cmd_type2str[*a3 >> 4];
    v25 = strlen(v26);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v25 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), v26, v25, -1);
        *(_DWORD *)(a1 + 8) += v25;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)v26, v25);
      }
    }
  }
  if ((*a3 & 2) != 0)
  {
    v24 = strlen(" public");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v24 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), " public", v24, -1);
        *(_DWORD *)(a1 + 8) += v24;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)" public", v24);
      }
    }
  }
  if ((*a3 & 1) != 0)
  {
    v23 = strlen(" private");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v23 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), " private", v23, -1);
        *(_DWORD *)(a1 + 8) += v23;
        if ((*(_BYTE *)(a1 + 22) & 1) == 0)
          *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)" private", v23);
      }
    }
  }
  os_trace_blob_addf(a1, " sz:%d]>", v14, v15, v16, v17, v18, v19, v20);
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_error(uint64_t a1)
{
  size_t v1;

  v1 = strlen("<decode: missing data>");
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    if (v1 <= *(_DWORD *)(a1 + 12) - ((*(_BYTE *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
    {
      __memcpy_chk(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8), "<decode: missing data>", v1, -1);
      *(_DWORD *)(a1 + 8) += v1;
      if ((*(_BYTE *)(a1 + 22) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)a1 + *(unsigned int *)(a1 + 8)) = 0;
    }
    else
    {
      os_trace_blob_add_slow(a1, (uint64_t)"<decode: missing data>", v1);
    }
  }
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_trace_blob_addf(a1, "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 12));
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_masked_unknown(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4 != 8 && a4 != 9 && a4 != 10)
  {
    _os_crash("Invalid access result");
    __break(1u);
  }
  os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 18));
  _os_log_fmt_decode_failure();
}
