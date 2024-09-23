uint64_t call_zopen64(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(_QWORD *)a1)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))a1)(*(_QWORD *)(a1 + 56), a2, a3);
  else
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 64))(*(_QWORD *)(a1 + 56), a2, a3);
}

uint64_t call_zseek64(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), a2, a3, a4);
  else
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 80))(*(_QWORD *)(a1 + 56), a2, a3, a4);
}

uint64_t call_ztell64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 24))(*(_QWORD *)(a1 + 56), a2);
  v3 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 72))(*(_QWORD *)(a1 + 56), a2);
  if (v3 == -1)
    return -1;
  else
    return v3;
}

_QWORD *fill_zlib_filefunc64_32_def_from_filefunc32(_QWORD *result, _QWORD *a2)
{
  *result = 0;
  result[8] = *a2;
  result[6] = a2[6];
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = 0;
  result[4] = 0;
  result[5] = a2[5];
  result[6] = a2[6];
  result[7] = a2[7];
  result[10] = a2[4];
  result[9] = a2[3];
  return result;
}

FILE *(**fill_fopen_filefunc(FILE *(**result)(uint64_t a1, const char *a2, char a3)))(uint64_t a1, const char *a2, char a3)
{
  *result = fopen_file_func;
  result[1] = (FILE *(*)(uint64_t, const char *, char))fread_file_func;
  result[2] = (FILE *(*)(uint64_t, const char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(uint64_t, const char *, char))ftell_file_func;
  result[4] = (FILE *(*)(uint64_t, const char *, char))fseek_file_func;
  result[5] = (FILE *(*)(uint64_t, const char *, char))fclose_file_func;
  result[6] = (FILE *(*)(uint64_t, const char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

FILE *fopen_file_func(uint64_t a1, const char *a2, char a3)
{
  char *__mode;
  uint64_t v5;

  v5 = 0;
  __mode = 0;
  if ((a3 & 3) == 1)
  {
    __mode = "rb";
  }
  else if ((a3 & 4) != 0)
  {
    __mode = "r+b";
  }
  else if ((a3 & 8) != 0)
  {
    __mode = "wb";
  }
  if (a2 && __mode)
    return fopen(a2, __mode);
  return (FILE *)v5;
}

size_t fread_file_func(uint64_t a1, FILE *a2, void *a3, size_t a4)
{
  return fread(a3, 1uLL, a4, a2);
}

size_t fwrite_file_func(uint64_t a1, FILE *a2, const void *a3, size_t a4)
{
  return fwrite(a3, 1uLL, a4, a2);
}

uint64_t ftell_file_func(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x220786CA4](a2);
}

uint64_t fseek_file_func(uint64_t a1, FILE *a2, uint64_t a3, int a4)
{
  uint64_t v5;
  int v6;

  if (a4)
  {
    if (a4 == 1)
    {
      v6 = 1;
    }
    else
    {
      if (a4 != 2)
        return -1;
      v6 = 2;
    }
  }
  else
  {
    v6 = 0;
  }
  v5 = 0;
  if (fseek(a2, a3, v6))
    return -1;
  return v5;
}

uint64_t fclose_file_func(uint64_t a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(uint64_t a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen64_filefunc(FILE *(**result)(uint64_t a1, const char *a2, char a3)))(uint64_t a1, const char *a2, char a3)
{
  *result = fopen64_file_func;
  result[1] = (FILE *(*)(uint64_t, const char *, char))fread_file_func;
  result[2] = (FILE *(*)(uint64_t, const char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(uint64_t, const char *, char))ftell64_file_func;
  result[4] = (FILE *(*)(uint64_t, const char *, char))fseek64_file_func;
  result[5] = (FILE *(*)(uint64_t, const char *, char))fclose_file_func;
  result[6] = (FILE *(*)(uint64_t, const char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

FILE *fopen64_file_func(uint64_t a1, const char *a2, char a3)
{
  char *__mode;
  uint64_t v5;

  v5 = 0;
  __mode = 0;
  if ((a3 & 3) == 1)
  {
    __mode = "rb";
  }
  else if ((a3 & 4) != 0)
  {
    __mode = "r+b";
  }
  else if ((a3 & 8) != 0)
  {
    __mode = "wb";
  }
  if (a2 && __mode)
    return fopen(a2, __mode);
  return (FILE *)v5;
}

uint64_t ftell64_file_func(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x220786CA4](a2);
}

uint64_t fseek64_file_func(uint64_t a1, FILE *a2, uint64_t a3, int a4)
{
  uint64_t v5;
  int v6;

  if (a4)
  {
    if (a4 == 1)
    {
      v6 = 1;
    }
    else
    {
      if (a4 != 2)
        return -1;
      v6 = 2;
    }
  }
  else
  {
    v6 = 0;
  }
  v5 = 0;
  if (fseek(a2, a3, v6))
    return -1;
  return v5;
}

void sub_21CA72870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location,int a43,int a44,_Unwind_Exception *exc_buf)
{
  exc_buf = a1;
  a44 = a2;
  if (a2 == 1)
  {
    location = objc_begin_catch(exc_buf);
    a11 = (id)objc_msgSend(location, "reason");
    a10 = a11;
    a9 = (uint64_t)a10;
    NSLog(CFSTR("%@"));

    objc_storeStrong(&location, 0);
    objc_end_catch();
    JUMPOUT(0x21CA727F0);
  }
  _Unwind_Resume(exc_buf);
}

uint64_t unzStringFileNameCompare(char *a1, char *a2, int a3)
{
  int v4;

  v4 = a3;
  if (!a3)
    v4 = 2;
  if (v4 == 1)
    return strcmp(a1, a2);
  else
    return strcmpcasenosensitive_internal(a1, a2);
}

uint64_t strcmpcasenosensitive_internal(char *a1, char *a2)
{
  char *v2;
  char *v3;
  char v6;
  char v7;

  while (1)
  {
    v2 = a1++;
    v7 = *v2;
    v3 = a2++;
    v6 = *v3;
    if (v7 >= 97 && v7 <= 122)
      v7 -= 32;
    if (v6 >= 97 && v6 <= 122)
      v6 -= 32;
    if (!v7)
      break;
    if (!v6)
      return 1;
    if (v7 < v6)
      return -1;
    if (v7 > v6)
      return 1;
  }
  if (v6)
    return -1;
  else
    return 0;
}

void *unzOpen2(uint64_t a1, _QWORD *a2)
{
  _QWORD __b[11];
  _QWORD *v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  if (!a2)
    return unzOpenInternal(v5, 0, 0);
  memset(__b, 0, sizeof(__b));
  fill_zlib_filefunc64_32_def_from_filefunc32(__b, v4);
  return unzOpenInternal(v5, __b, 0);
}

void *unzOpenInternal(uint64_t a1, const void *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  FILE *(*v7)(uint64_t, const char *, char);
  uint64_t v8;
  uint64_t v9;
  FILE *(*v10)(uint64_t, const char *, char);
  FILE *(*v11)(uint64_t, const char *, char);
  void *v12;
  FILE *(*__dst[46])(uint64_t, const char *, char);
  int v14;
  const void *v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  bzero(__dst, 0x170uLL);
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v8 = 0;
  v7 = 0;
  v6 = 0;
  __dst[10] = 0;
  __dst[9] = 0;
  if (v15)
    memcpy(__dst, v15, 0x58uLL);
  else
    fill_fopen64_filefunc(__dst);
  LODWORD(__dst[11]) = v14;
  __dst[12] = (FILE *(*)(uint64_t, const char *, char))call_zopen64((uint64_t)__dst, v16, 5u);
  if (!__dst[12])
    return 0;
  v11 = (FILE *(*)(uint64_t, const char *, char))unz64local_SearchCentralDir64((uint64_t)__dst, (uint64_t)__dst[12]);
  if (v11)
  {
    v5 = 0;
    v4 = 0;
    HIDWORD(__dst[41]) = 1;
    if (call_zseek64((uint64_t)__dst, (uint64_t)__dst[12], (uint64_t)v11, 0))
      v6 = -1;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &v4))
      v6 = -1;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v5))
      v6 = -1;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v5))
      v6 = -1;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v9))
      v6 = -1;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v8))
      v6 = -1;
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[13]))
      v6 = -1;
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &v7))
      v6 = -1;
    if (v7 != __dst[13] || v8 || v9)
      v6 = -103;
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[20]))
      v6 = -1;
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[21]))
      v6 = -1;
    __dst[14] = 0;
  }
  else
  {
    v11 = (FILE *(*)(uint64_t, const char *, char))unz64local_SearchCentralDir((uint64_t)__dst, (uint64_t)__dst[12]);
    if (!v11)
      v6 = -1;
    HIDWORD(__dst[41]) = 0;
    if (call_zseek64((uint64_t)__dst, (uint64_t)__dst[12], (uint64_t)v11, 0))
      v6 = -1;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v9))
      v6 = -1;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v8))
      v6 = -1;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    __dst[13] = v10;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    v7 = v10;
    if (v10 != __dst[13] || v8 || v9)
      v6 = -103;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    __dst[20] = v10;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10))
      v6 = -1;
    __dst[21] = v10;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &__dst[14]))
      v6 = -1;
  }
  if ((char *)v11 < (char *)((char *)__dst[21] + (unint64_t)__dst[20]) && !v6)
    v6 = -103;
  if (v6)
  {
    ((void (*)(FILE *(*)(uint64_t, const char *, char), FILE *(*)(uint64_t, const char *, char)))__dst[5])(__dst[7], __dst[12]);
    return 0;
  }
  else
  {
    __dst[15] = (FILE *(*)(uint64_t, const char *, char))((char *)v11
                                                                  - (char *)((char *)__dst[21]
                                                                           + (unint64_t)__dst[20]));
    __dst[19] = v11;
    __dst[40] = 0;
    LODWORD(__dst[41]) = 0;
    v12 = malloc_type_malloc(0x170uLL, 0x10F0040BFDC9523uLL);
    if (v12)
    {
      memcpy(v12, __dst, 0x170uLL);
      unzGoToFirstFile((uint64_t *)v12);
    }
    return v12;
  }
}

void *unzOpen2_64(uint64_t a1, const void *a2)
{
  _QWORD __b[11];
  const void *v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  if (!a2)
    return unzOpenInternal(v5, 0, 1);
  memset(__b, 0, sizeof(__b));
  memcpy(__b, v4, 0x40uLL);
  __b[9] = 0;
  __b[10] = 0;
  return unzOpenInternal(v5, __b, 1);
}

void *unzOpen(uint64_t a1)
{
  return unzOpenInternal(a1, 0, 0);
}

void *unzOpen64(uint64_t a1)
{
  return unzOpenInternal(a1, 0, 1);
}

uint64_t unzClose(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 320))
      unzCloseCurrentFile(a1);
    (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96));
    if (a1)
      free((void *)a1);
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  char *v2;
  unsigned int v3;

  v3 = 0;
  if (a1)
  {
    v2 = *(char **)(a1 + 320);
    if (v2)
    {
      if (!*((_QWORD *)v2 + 24) && !*((_DWORD *)v2 + 78) && *((_QWORD *)v2 + 21) != *((_QWORD *)v2 + 22))
        v3 = -105;
      if (*(_QWORD *)v2)
        free(*(void **)v2);
      *(_QWORD *)v2 = 0;
      if (*((_QWORD *)v2 + 16) == 8)
        inflateEnd((z_streamp)(v2 + 8));
      *((_QWORD *)v2 + 16) = 0;
      free(v2);
      *(_QWORD *)(a1 + 320) = 0;
      return v3;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalInfo64(uint64_t a1, _OWORD *a2)
{
  if (a1)
  {
    *a2 = *(_OWORD *)(a1 + 104);
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalInfo(uint64_t a1, _QWORD *a2)
{
  if (a1)
  {
    *a2 = *(_QWORD *)(a1 + 104);
    a2[1] = *(_QWORD *)(a1 + 112);
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetCurrentFileInfo64(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unz64local_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unz64local_GetCurrentFileInfoInternal(uint64_t *a1, void *a2, uint64_t *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t __b[17];
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  void *v31;
  uint64_t *v32;

  v32 = a1;
  v31 = a2;
  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v23 = 0;
  memset(__b, 0, sizeof(__b));
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  if (v32)
  {
    v23 = v32;
    if (call_zseek64((uint64_t)v32, v32[12], v32[17] + v32[15], 0))
      v20 = -1;
    if (!v20)
    {
      if (unz64local_getLong((uint64_t)v23, v23[12], &v19))
      {
        v20 = -1;
      }
      else if (v19 != 33639248)
      {
        v20 = -103;
      }
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], __b))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[1]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[2]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[3]))
      v20 = -1;
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[4]))
      v20 = -1;
    unz64local_DosDateToTmuDate(__b[4], &__b[14]);
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[5]))
      v20 = -1;
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17))
      v20 = -1;
    __b[6] = v17;
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17))
      v20 = -1;
    __b[7] = v17;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[8]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[9]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[10]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[11]))
      v20 = -1;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[12]))
      v20 = -1;
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[13]))
      v20 = -1;
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17))
      v20 = -1;
    v21 = v17;
    v18 += __b[8];
    if (!v20 && v29)
    {
      v16 = 0;
      if (__b[8] >= v28)
      {
        v16 = v28;
      }
      else
      {
        *(_BYTE *)(v29 + __b[8]) = 0;
        v16 = __b[8];
      }
      if (__b[8]
        && v28
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v29, v16) != v16)
      {
        v20 = -1;
      }
      v18 -= v16;
    }
    if (v20 || !v27)
    {
      v18 += __b[9];
    }
    else
    {
      v15 = 0;
      if (__b[9] >= v26)
        v15 = v26;
      else
        v15 = __b[9];
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u))
          v20 = -1;
        else
          v18 = 0;
      }
      if (__b[9]
        && v26
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v27, v15) != v15)
      {
        v20 = -1;
      }
      v18 += __b[9] - v15;
    }
    if (!v20 && __b[9])
    {
      v14 = 0;
      v18 -= __b[9];
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u))
          v20 = -1;
        else
          v18 = 0;
      }
      while (v14 < __b[9])
      {
        v13 = 0;
        v12 = 0;
        if (unz64local_getShort((uint64_t)v23, v23[12], &v13))
          v20 = -1;
        if (unz64local_getShort((uint64_t)v23, v23[12], &v12))
          v20 = -1;
        if (v13 == 1)
        {
          v11 = 0;
          if (__b[7] == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &__b[7]))
            v20 = -1;
          if (__b[6] == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &__b[6]))
            v20 = -1;
          if (v21 == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &v21))
            v20 = -1;
          if (__b[11] == -1 && unz64local_getLong((uint64_t)v23, v23[12], &v11))
            v20 = -1;
        }
        else if (call_zseek64((uint64_t)v23, v23[12], v12, 1u))
        {
          v20 = -1;
        }
        v14 += v12 + 4;
      }
    }
    if (v20 || !v25)
    {
      v18 += __b[10];
    }
    else
    {
      if (__b[10] >= v24)
      {
        v10 = v24;
      }
      else
      {
        *(_BYTE *)(v25 + __b[10]) = 0;
        v10 = __b[10];
      }
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u))
          v20 = -1;
        else
          v18 = 0;
      }
      if (__b[10]
        && v24
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v25, v10) != v10)
      {
        v20 = -1;
      }
      v18 += __b[10] - v10;
    }
    if (!v20 && v31)
      memcpy(v31, __b, 0x88uLL);
    if (!v20 && v30)
      *v30 = v21;
    return v20;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetCurrentFileInfo(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v8;
  _BYTE __b[136];
  unsigned int CurrentFileInfoInternal;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  v14 = a6;
  v13 = a7;
  v12 = a8;
  CurrentFileInfoInternal = 0;
  memset(__b, 0, sizeof(__b));
  CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(v19, __b, 0, v17, v16, v15, v14, v13, v12);
  if (!CurrentFileInfoInternal)
  {
    *(_QWORD *)v18 = *(_QWORD *)__b;
    *(_QWORD *)(v18 + 8) = *(_QWORD *)&__b[8];
    *(_QWORD *)(v18 + 16) = *(_QWORD *)&__b[16];
    *(_QWORD *)(v18 + 24) = *(_QWORD *)&__b[24];
    *(_QWORD *)(v18 + 32) = *(_QWORD *)&__b[32];
    *(_QWORD *)(v18 + 40) = *(_QWORD *)&__b[40];
    *(_QWORD *)(v18 + 64) = *(_QWORD *)&__b[64];
    *(_QWORD *)(v18 + 72) = *(_QWORD *)&__b[72];
    *(_QWORD *)(v18 + 80) = *(_QWORD *)&__b[80];
    *(_QWORD *)(v18 + 88) = *(_QWORD *)&__b[88];
    *(_QWORD *)(v18 + 96) = *(_QWORD *)&__b[96];
    *(_QWORD *)(v18 + 104) = *(_QWORD *)&__b[104];
    v8 = v18;
    *(_OWORD *)(v18 + 112) = *(_OWORD *)&__b[112];
    *(_QWORD *)(v8 + 128) = *(_QWORD *)&__b[128];
    *(_QWORD *)(v18 + 48) = *(_QWORD *)&__b[48];
    *(_QWORD *)(v18 + 56) = *(_QWORD *)&__b[56];
  }
  return CurrentFileInfoInternal;
}

uint64_t unzGoToFirstFile(uint64_t *a1)
{
  unsigned int CurrentFileInfoInternal;

  if (a1)
  {
    a1[17] = a1[21];
    a1[16] = 0;
    CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGoToNextFile(uint64_t *a1)
{
  unsigned int CurrentFileInfoInternal;

  if (a1)
  {
    if (a1[18])
    {
      if (a1[13] == 0xFFFF || a1[16] + 1 != a1[13])
      {
        a1[17] += a1[30] + 46 + a1[31] + a1[32];
        ++a1[16];
        CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
        a1[18] = CurrentFileInfoInternal == 0;
        return CurrentFileInfoInternal;
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -100;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzLocateFile(uint64_t *a1, char *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE __b[136];
  unsigned int File;
  uint64_t *v9;
  int v10;
  char *__s;
  uint64_t *v12;
  char v14[257];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  __s = a2;
  v10 = a3;
  v9 = 0;
  File = 0;
  memset(__b, 0, sizeof(__b));
  if (v12)
  {
    if (strlen(__s) < 0x100)
    {
      v9 = v12;
      if (v12[18])
      {
        v5 = v9[16];
        v4 = v9[17];
        memcpy(__b, v9 + 22, sizeof(__b));
        v6 = v9[39];
        File = unzGoToFirstFile(v12);
        while (!File)
        {
          File = unzGetCurrentFileInfo64(v12, 0, (uint64_t)v14, 0x100uLL, 0, 0, 0, 0);
          if (!File)
          {
            if (!unzStringFileNameCompare(v14, __s, v10))
              return 0;
            File = unzGoToNextFile(v12);
          }
        }
        v9[16] = v5;
        v9[17] = v4;
        memcpy(v9 + 22, __b, 0x88uLL);
        v9[39] = v6;
        return File;
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetFilePos64(_QWORD *a1, _QWORD *a2)
{
  if (a1 && a2)
  {
    if (a1[18])
    {
      *a2 = a1[17];
      a2[1] = a1[16];
      return 0;
    }
    else
    {
      return -100;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetFilePos(_QWORD *a1, _QWORD *a2)
{
  unsigned int FilePos64;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v7 = a1;
  v6 = a2;
  v4 = 0;
  v5 = 0;
  FilePos64 = unzGetFilePos64(a1, &v4);
  if (!FilePos64)
  {
    *v6 = v4;
    v6[1] = v5;
  }
  return FilePos64;
}

uint64_t unzGoToFilePos64(uint64_t *a1, uint64_t *a2)
{
  unsigned int CurrentFileInfoInternal;

  if (a1 && a2)
  {
    a1[17] = *a2;
    a1[16] = a2[1];
    CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGoToFilePos(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;

  v6 = a1;
  v5 = a2;
  v3 = 0;
  v4 = 0;
  if (a2)
  {
    v3 = *v5;
    v4 = v5[1];
    return unzGoToFilePos64(v6, &v3);
  }
  else
  {
    return -102;
  }
}

uint64_t unzOpenCurrentFile3(_QWORD *a1, _DWORD *a2, _DWORD *a3, int a4, uint64_t a5)
{
  void *v5;
  char v6;
  _BYTE *v7;
  char v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int i;
  int v14;
  uint64_t v15;
  void *v16;
  void *__src;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  _DWORD *v23;
  _QWORD *v24;
  _BYTE v26[12];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  v20 = a5;
  v19 = 0;
  v18 = 0;
  __src = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  if (!a1)
    return -102;
  __src = v24;
  if (!v24[18])
    return -102;
  if (*((_QWORD *)__src + 40))
    unzCloseCurrentFile((uint64_t)v24);
  if (unz64local_CheckCurrentFileCoherencyHeader((uint64_t *)__src, &v18, &v15, &v14))
    return -103;
  v16 = malloc_type_malloc(0x140uLL, 0x10B004067B04D0FuLL);
  if (!v16)
    return -104;
  v5 = malloc_type_malloc(0x4000uLL, 0x3EA1875CuLL);
  *(_QWORD *)v16 = v5;
  *((_QWORD *)v16 + 17) = v15;
  *((_DWORD *)v16 + 36) = v14;
  *((_QWORD *)v16 + 19) = 0;
  *((_DWORD *)v16 + 78) = v21;
  *((_QWORD *)v16 + 38) = 0;
  if (!*(_QWORD *)v16)
  {
    if (v16)
      free(v16);
    return -104;
  }
  *((_QWORD *)v16 + 16) = 0;
  if (v23)
    *v23 = *((_QWORD *)__src + 25);
  if (v22)
  {
    *v22 = 6;
    v12 = *((_QWORD *)__src + 24) & 6;
    switch(v12)
    {
      case 2:
        *v22 = 9;
        break;
      case 4:
        *v22 = 2;
        break;
      case 6:
        *v22 = 1;
        break;
    }
  }
  if (*((_QWORD *)__src + 25) && *((_QWORD *)__src + 25) != 12 && *((_QWORD *)__src + 25) != 8)
    v19 = -103;
  *((_QWORD *)v16 + 22) = *((_QWORD *)__src + 27);
  *((_QWORD *)v16 + 21) = 0;
  *((_QWORD *)v16 + 20) = 0;
  *((_QWORD *)v16 + 37) = *((_QWORD *)__src + 25);
  *((_QWORD *)v16 + 36) = *((_QWORD *)__src + 12);
  memcpy((char *)v16 + 200, __src, 0x58uLL);
  *((_QWORD *)v16 + 38) = *((_QWORD *)__src + 15);
  *((_QWORD *)v16 + 6) = 0;
  if (*((_QWORD *)__src + 25) == 12 && !v21)
  {
    *((_DWORD *)v16 + 78) = 1;
    goto LABEL_38;
  }
  if (*((_QWORD *)__src + 25) != 8 || v21)
  {
LABEL_38:
    *((_QWORD *)v16 + 23) = *((_QWORD *)__src + 28);
    *((_QWORD *)v16 + 24) = *((_QWORD *)__src + 29);
    *((_QWORD *)v16 + 15) = *((_QWORD *)__src + 39) + 30 + v18;
    *((_DWORD *)v16 + 4) = 0;
    *((_QWORD *)__src + 40) = v16;
    *((_DWORD *)__src + 82) = 0;
    if (v20)
    {
      *((_QWORD *)__src + 45) = get_crc_table();
      init_keys(v20, (_QWORD *)__src + 42, *((_QWORD *)__src + 45));
      if (call_zseek64((uint64_t)__src, *((_QWORD *)__src + 12), *(_QWORD *)(*((_QWORD *)__src + 40) + 120) + *(_QWORD *)(*((_QWORD *)__src + 40) + 304), 0))
      {
        return -104;
      }
      if ((unint64_t)(*((uint64_t (**)(_QWORD, _QWORD, _BYTE *, uint64_t))__src + 1))(*((_QWORD *)__src + 7), *((_QWORD *)__src + 12), v26, 12) < 0xC)return -104;
      for (i = 0; i < 12; ++i)
      {
        v11 = (char *)__src + 336;
        v10 = *((_QWORD *)__src + 45);
        v6 = decrypt_byte((uint64_t)__src + 336);
        v7 = &v26[i];
        v8 = *v7 ^ v6;
        *v7 = v8;
        update_keys(v11, v10, v8);
      }
      *(_QWORD *)(*((_QWORD *)__src + 40) + 120) += 12;
      *((_DWORD *)__src + 82) = 1;
    }
    return 0;
  }
  *((_QWORD *)v16 + 9) = 0;
  *((_QWORD *)v16 + 10) = 0;
  *((_QWORD *)v16 + 11) = 0;
  *((_QWORD *)v16 + 1) = 0;
  *((_DWORD *)v16 + 4) = 0;
  v19 = inflateInit2_((z_streamp)((char *)v16 + 8), -15, "1.2.12", 112);
  if (!v19)
  {
    *((_QWORD *)v16 + 16) = 8;
    goto LABEL_38;
  }
  if (v16)
    free(v16);
  return v19;
}

uint64_t unz64local_CheckCurrentFileCoherencyHeader(uint64_t *a1, _DWORD *a2, _QWORD *a3, _DWORD *a4)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _QWORD *v12;
  _DWORD *v13;
  uint64_t *v14;

  v14 = a1;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = 0;
  v9 = 0;
  v8 = 0;
  v7 = 0;
  v6 = 0;
  v5 = 0;
  *a2 = 0;
  *v12 = 0;
  *v11 = 0;
  if (call_zseek64((uint64_t)v14, v14[12], v14[39] + v14[15], 0))
  {
    return -1;
  }
  else
  {
    if (unz64local_getLong((uint64_t)v14, v14[12], &v10))
    {
      v5 = -1;
    }
    else if (v10 != 67324752)
    {
      v5 = -103;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v9))
      v5 = -1;
    if (unz64local_getShort((uint64_t)v14, v14[12], &v8))
      v5 = -1;
    if (unz64local_getShort((uint64_t)v14, v14[12], &v9))
    {
      v5 = -1;
    }
    else if (!v5 && v9 != v14[25])
    {
      v5 = -103;
    }
    if (!v5 && v14[25] && v14[25] != 12 && v14[25] != 8)
      v5 = -103;
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
      v5 = -1;
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      v5 = -1;
    }
    else if (!v5 && v9 != v14[27] && (v8 & 8) == 0)
    {
      v5 = -103;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      v5 = -1;
    }
    else if (v9 != 0xFFFFFFFFLL && !v5 && v9 != v14[28] && (v8 & 8) == 0)
    {
      v5 = -103;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      v5 = -1;
    }
    else if (v9 != 0xFFFFFFFFLL && !v5 && v9 != v14[29] && (v8 & 8) == 0)
    {
      v5 = -103;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v7))
    {
      v5 = -1;
    }
    else if (!v5 && v7 != v14[30])
    {
      v5 = -103;
    }
    *v13 += v7;
    if (unz64local_getShort((uint64_t)v14, v14[12], &v6))
      v5 = -1;
    *v12 = v14[39] + 30 + v7;
    *v11 = v6;
    *v13 += v6;
    return v5;
  }
}

uint64_t init_keys(uint64_t result, _QWORD *a2, uint64_t a3)
{
  _BYTE *v5;

  v5 = (_BYTE *)result;
  *a2 = 305419896;
  a2[1] = 591751049;
  a2[2] = 878082192;
  while (*v5)
    result = update_keys(a2, a3, (char)*v5++);
  return result;
}

uint64_t update_keys(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  *a1 = *(_QWORD *)(a2 + 8 * (*a1 ^ a3)) ^ (*a1 >> 8);
  a1[1] += *(unsigned __int8 *)a1;
  a1[1] = 134775813 * a1[1] + 1;
  a1[2] = *(_QWORD *)(a2 + 8 * (a1[2] ^ BYTE3(a1[1]))) ^ (a1[2] >> 8);
  return a3;
}

uint64_t decrypt_byte(uint64_t a1)
{
  return ((unsigned __int16)((*(_QWORD *)(a1 + 16) | 2) * ((*(_QWORD *)(a1 + 16) | 2) ^ 1)) >> 8);
}

uint64_t unzOpenCurrentFile(_QWORD *a1)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t unzOpenCurrentFilePassword(_QWORD *a1, uint64_t a2)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t unzOpenCurrentFile2(_QWORD *a1, _DWORD *a2, _DWORD *a3, int a4)
{
  return unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t unzGetCurrentFileZStreamPos64(uint64_t a1)
{
  uint64_t v2;

  if (!a1)
    return 0;
  v2 = *(_QWORD *)(a1 + 320);
  if (v2)
    return *(_QWORD *)(v2 + 120) + *(_QWORD *)(v2 + 304);
  else
    return 0;
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v3;
  _BYTE *v4;
  char v5;
  uint64_t v9;
  Bytef *buf;
  uint64_t v11;
  uint64_t v12;
  uInt j;
  uInt v14;
  unsigned int i;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;

  v19 = 0;
  v18 = 0;
  if (a1)
  {
    v17 = *(_QWORD *)(a1 + 320);
    if (v17)
    {
      if (*(_QWORD *)v17)
      {
        if (a3)
        {
          *(_QWORD *)(v17 + 32) = a2;
          *(_DWORD *)(v17 + 40) = a3;
          if (a3 > *(_QWORD *)(v17 + 184) + (unint64_t)*(unsigned int *)(v17 + 16) && *(_DWORD *)(v17 + 312))
            *(_DWORD *)(v17 + 40) = *(_QWORD *)(v17 + 184) + *(_DWORD *)(v17 + 16);
          while (1)
          {
            do
            {
              while (1)
              {
                if (!*(_DWORD *)(v17 + 40))
                {
LABEL_53:
                  if (v19)
                    return v19;
                  else
                    return v18;
                }
                if (!*(_DWORD *)(v17 + 16) && *(_QWORD *)(v17 + 184))
                {
                  v16 = 0x4000;
                  if (*(_QWORD *)(v17 + 184) < 0x4000uLL)
                    v16 = *(_QWORD *)(v17 + 184);
                  if (!v16)
                    return 0;
                  if (call_zseek64(v17 + 200, *(_QWORD *)(v17 + 288), *(_QWORD *)(v17 + 120) + *(_QWORD *)(v17 + 304), 0))
                  {
                    return -1;
                  }
                  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v17 + 208))(*(_QWORD *)(v17 + 256), *(_QWORD *)(v17 + 288), *(_QWORD *)v17, v16) != v16)return -1;
                  if (*(_DWORD *)(a1 + 328))
                  {
                    for (i = 0; i < v16; ++i)
                    {
                      v9 = *(_QWORD *)(a1 + 360);
                      v3 = decrypt_byte(a1 + 336);
                      v4 = (_BYTE *)(*(_QWORD *)v17 + i);
                      v5 = *v4 ^ v3;
                      *v4 = v5;
                      *(_BYTE *)(*(_QWORD *)v17 + i) = update_keys((_QWORD *)(a1 + 336), v9, v5);
                    }
                  }
                  *(_QWORD *)(v17 + 120) += v16;
                  *(_QWORD *)(v17 + 184) -= v16;
                  *(_QWORD *)(v17 + 8) = *(_QWORD *)v17;
                  *(_DWORD *)(v17 + 16) = v16;
                }
                if (*(_QWORD *)(v17 + 296) && !*(_DWORD *)(v17 + 312))
                  break;
                if (!*(_DWORD *)(v17 + 16) && !*(_QWORD *)(v17 + 184))
                {
                  if (v18)
                    return v18;
                  else
                    return 0;
                }
                if (*(_DWORD *)(v17 + 40) >= *(_DWORD *)(v17 + 16))
                  v14 = *(_DWORD *)(v17 + 16);
                else
                  v14 = *(_DWORD *)(v17 + 40);
                for (j = 0; j < v14; ++j)
                  *(_BYTE *)(*(_QWORD *)(v17 + 32) + j) = *(_BYTE *)(*(_QWORD *)(v17 + 8) + j);
                *(_QWORD *)(v17 + 160) += v14;
                *(_QWORD *)(v17 + 168) = crc32(*(_QWORD *)(v17 + 168), *(const Bytef **)(v17 + 32), v14);
                *(_QWORD *)(v17 + 192) -= v14;
                *(_DWORD *)(v17 + 16) -= v14;
                *(_DWORD *)(v17 + 40) -= v14;
                *(_QWORD *)(v17 + 32) += v14;
                *(_QWORD *)(v17 + 8) += v14;
                *(_QWORD *)(v17 + 48) += v14;
                v18 += v14;
              }
            }
            while (*(_QWORD *)(v17 + 296) == 12);
            v12 = *(_QWORD *)(v17 + 48);
            buf = *(Bytef **)(v17 + 32);
            v19 = inflate((z_streamp)(v17 + 8), 2);
            if (v19 >= 0 && *(_QWORD *)(v17 + 56))
              v19 = -3;
            v11 = *(_QWORD *)(v17 + 48);
            *(_QWORD *)(v17 + 160) += v11 - v12;
            *(_QWORD *)(v17 + 168) = crc32(*(_QWORD *)(v17 + 168), buf, (int)v11 - (int)v12);
            *(_QWORD *)(v17 + 192) -= v11 - v12;
            v18 += v11 - v12;
            if (v19 == 1)
              break;
            if (v19)
              goto LABEL_53;
          }
          if (v18)
            return v18;
          else
            return 0;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unztell(uint64_t a1)
{
  uint64_t v2;

  if (!a1)
    return -102;
  v2 = *(_QWORD *)(a1 + 320);
  if (v2)
    return *(_QWORD *)(v2 + 48);
  else
    return -102;
}

uint64_t unztell64(uint64_t a1)
{
  uint64_t v2;

  if (!a1)
    return -1;
  v2 = *(_QWORD *)(a1 + 320);
  if (v2)
    return *(_QWORD *)(v2 + 160);
  else
    return -1;
}

uint64_t unzeof(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 320);
    if (v2)
      return *(_QWORD *)(v2 + 192) == 0;
    else
      return -102;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t v5;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 320);
    if (v5)
    {
      if (a2)
      {
        if (a3 <= (unint64_t)*(unsigned int *)(v5 + 144) - *(_QWORD *)(v5 + 152))
          v4 = a3;
        else
          v4 = *(_DWORD *)(v5 + 144) - *(_DWORD *)(v5 + 152);
        if (v4)
        {
          if (call_zseek64(v5 + 200, *(_QWORD *)(v5 + 288), *(_QWORD *)(v5 + 136) + *(_QWORD *)(v5 + 152), 0))
          {
            return -1;
          }
          else if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v5 + 208))(*(_QWORD *)(v5 + 256), *(_QWORD *)(v5 + 288), a2, v4) == v4)
          {
            return v4;
          }
          else
          {
            return -1;
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return (*(_DWORD *)(v5 + 144) - *(_DWORD *)(v5 + 152));
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalComment(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  unint64_t v4;

  if (a1)
  {
    v4 = a3;
    if (a3 > *(_QWORD *)(a1 + 112))
      v4 = *(_QWORD *)(a1 + 112);
    if (call_zseek64(a1, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 152) + 22, 0))
    {
      return -1;
    }
    else if (!v4
           || (*a2 = 0,
               (*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), a2, v4) == v4))
    {
      if (a2 && a3 > *(_QWORD *)(a1 + 112))
        a2[*(_QWORD *)(a1 + 112)] = 0;
      return v4;
    }
    else
    {
      return -1;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetOffset64(_QWORD *a1)
{
  if (!a1)
    return 0;
  if (!a1[18])
    return 0;
  if (a1[13] && a1[13] != 0xFFFFLL && a1[16] == a1[13])
    return 0;
  return a1[17];
}

uint64_t unzGetOffset(_QWORD *a1)
{
  if (a1)
    return unzGetOffset64(a1);
  else
    return 0;
}

uint64_t unzSetOffset64(uint64_t *a1, uint64_t a2)
{
  unsigned int CurrentFileInfoInternal;

  if (a1)
  {
    a1[17] = a2;
    a1[16] = a1[13];
    CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzSetOffset(uint64_t *a1, uint64_t a2)
{
  return unzSetOffset64(a1, a2);
}

uint64_t unz64local_SearchCentralDir64(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = a2;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0xFFFFLL;
  v9 = 0;
  v8 = 0;
  v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u))
    return 0;
  v12 = call_ztell64(v15, v14);
  if (v10 > v12)
    v10 = v12;
  v13 = malloc_type_malloc(0x404uLL, 0xBA45F597uLL);
  if (!v13)
    return 0;
  v11 = 4;
  do
  {
    if (v11 >= v10)
      break;
    if (v11 + 1024 <= v10)
      v11 += 1024;
    else
      v11 = v10;
    v6 = v12 - v11;
    v4 = v11 <= 0x404 ? v11 : 1028;
    if (call_zseek64(v15, v14, v6, 0)
      || (*(uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))(v15 + 8))(*(_QWORD *)(v15 + 56), v14, v13, v4) != v4)
    {
      break;
    }
    v5 = v4 - 3;
    while (1)
    {
      v2 = v5--;
      if (v2 <= 0)
        break;
      if (v13[v5] == 80 && v13[v5 + 1] == 75 && v13[v5 + 2] == 6 && v13[v5 + 3] == 7)
      {
        v9 = v6 + v5;
        break;
      }
    }
  }
  while (!v9);
  free(v13);
  if (!v9)
    return 0;
  if (call_zseek64(v15, v14, v9, 0))
    return 0;
  if (unz64local_getLong(v15, v14, &v8))
    return 0;
  if (unz64local_getLong(v15, v14, &v8))
    return 0;
  if (v8)
    return 0;
  if (unz64local_getLong64(v15, v14, &v7))
    return 0;
  if (unz64local_getLong(v15, v14, &v8))
    return 0;
  if (v8 != 1)
    return 0;
  if (call_zseek64(v15, v14, v7, 0))
    return 0;
  if (unz64local_getLong(v15, v14, &v8))
    return 0;
  if (v8 == 101075792)
    return v7;
  return 0;
}

uint64_t unz64local_getLong(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = unz64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 8;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 16;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 24;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t unz64local_getLong64(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = unz64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 8;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 16;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 24;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 32;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 40;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 48;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 56;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t unz64local_getShort(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = unz64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = unz64local_getByte(v9, v8, &v5);
  v6 |= (uint64_t)v5 << 8;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t unz64local_SearchCentralDir(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;

  v8 = 0xFFFFLL;
  v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u))
    return 0;
  v10 = call_ztell64(a1, a2);
  if (v10 < 0xFFFF)
    v8 = v10;
  v11 = malloc_type_malloc(0x404uLL, 0x16ECF6D5uLL);
  if (!v11)
    return 0;
  v9 = 4;
  do
  {
    if (v9 >= v8)
      break;
    if (v9 + 1024 <= v8)
      v9 += 1024;
    else
      v9 = v8;
    v6 = v10 - v9;
    v4 = v9 <= 0x404 ? v9 : 1028;
    if (call_zseek64(a1, a2, v6, 0)
      || (*(uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, v11, v4) != v4)
    {
      break;
    }
    v5 = v4 - 3;
    while (1)
    {
      v2 = v5--;
      if (v2 <= 0)
        break;
      if (v11[v5] == 80 && v11[v5 + 1] == 75 && v11[v5 + 2] == 5 && v11[v5 + 3] == 6)
      {
        v7 = v6 + v5;
        break;
      }
    }
  }
  while (!v7);
  free(v11);
  return v7;
}

uint64_t unz64local_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned __int8 v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2;
  v5 = a3;
  v4 = 0;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v4, 1) == 1)
  {
    *v5 = v4;
    return 0;
  }
  else if ((*(unsigned int (**)(_QWORD, uint64_t))(v7 + 48))(*(_QWORD *)(v7 + 56), v6))
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

uint64_t unz64local_DosDateToTmuDate(uint64_t result, _DWORD *a2)
{
  a2[3] = BYTE2(result) & 0x1F;
  a2[4] = (WORD1(result) & 0x1E0u) / 0x20 - 1;
  a2[5] = (WORD1(result) & 0xFE00u) / 0x200 + 1980;
  a2[2] = ((unsigned __int16)result & 0xF800u) / 0x800;
  a2[1] = ((unsigned __int16)result & 0x7E0u) / 0x20;
  *a2 = 2 * (result & 0x1F);
  return result;
}

id WithFinalizer(id val)
{
  void *v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  int v9;
  id v10;
  id location;
  id v12;

  objc_initWeak(&location, val);
  v10 = (id)objc_msgSend(MEMORY[0x24BEBA790], "currentContext");
  if (v10)
  {
    v2 = (void *)MEMORY[0x24BEBA7B0];
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __WithFinalizer_block_invoke;
    v7 = &unk_24E099C50;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v2, "runBlock:onFinalize:", &v3, v10);
    v12 = objc_loadWeakRetained(&location);
    v9 = 1;
    objc_destroyWeak(&v8);
  }
  else
  {
    v12 = objc_loadWeakRetained(&location);
    v9 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&location);
  return v12;
}

void sub_21CA7B91C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 40) = a1;
  *(_DWORD *)(v9 - 44) = a2;
  objc_destroyWeak((id *)(v9 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 40));
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

uint64_t XXH_versionNumber()
{
  return 501;
}

uint64_t XXH32(unsigned int *a1, unint64_t a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v9;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unint64_t v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  unint64_t v48;
  _DWORD *v49;
  _DWORD *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;

  v9 = a2;
  if ((a1 & 3) != 0)
  {
    if (g_one == 1)
    {
      v29 = a1;
      v28 = (unint64_t)a1 + a2;
      if (a2 < 0x10)
      {
        v25 = a3 + 374761393;
      }
      else
      {
        v24 = a3 + 606290984;
        v23 = a3 - 2048144777;
        v22 = a3;
        v21 = a3 + 1640531535;
        do
        {
          v59 = XXH_read32(v29);
          v24 = -1640531535 * (((v24 - 2048144777 * v59) >> 19) | ((v24 - 2048144777 * v59) << 13));
          v30 = v29 + 1;
          v58 = XXH_read32(v30);
          v23 = -1640531535 * (((v23 - 2048144777 * v58) >> 19) | ((v23 - 2048144777 * v58) << 13));
          v57 = XXH_read32(++v30);
          v22 = -1640531535 * (((v22 - 2048144777 * v57) >> 19) | ((v22 - 2048144777 * v57) << 13));
          v56 = XXH_read32(++v30);
          v21 = -1640531535 * (((v21 - 2048144777 * v56) >> 19) | ((v21 - 2048144777 * v56) << 13));
          v29 = v30 + 1;
        }
        while ((unint64_t)v29 <= v28 - 16);
        v25 = ((v24 >> 31) | (2 * v24))
            + ((v23 >> 25) | (v23 << 7))
            + ((v22 >> 20) | (v22 << 12))
            + ((v21 >> 14) | (v21 << 18));
      }
      v26 = v25 + v9;
      while ((unint64_t)(v29 + 1) <= v28)
      {
        v60 = XXH_read32(v29);
        v26 = 668265263 * (((v26 - 1028477379 * v60) >> 15) | ((v26 - 1028477379 * v60) << 17));
        ++v29;
      }
      while ((unint64_t)v29 < v28)
      {
        v26 = -1640531535
            * (((v26 + 374761393 * *(unsigned __int8 *)v29) >> 21) | ((v26 + 374761393 * *(unsigned __int8 *)v29) << 11));
        v29 = (unsigned int *)((char *)v29 + 1);
      }
      v27 = -1028477379 * ((-2048144777 * (v26 ^ (v26 >> 15))) ^ ((-2048144777 * (v26 ^ (v26 >> 15))) >> 13));
      return v27 ^ HIWORD(v27);
    }
    else
    {
      v19 = a1;
      v18 = (unint64_t)a1 + a2;
      if (a2 < 0x10)
      {
        v15 = a3 + 374761393;
      }
      else
      {
        v14 = a3 + 606290984;
        v13 = a3 - 2048144777;
        v12 = a3;
        v11 = a3 + 1640531535;
        do
        {
          v3 = XXH_read32(v19);
          v64 = XXH_swap32(v3);
          v14 = -1640531535 * (((v14 - 2048144777 * v64) >> 19) | ((v14 - 2048144777 * v64) << 13));
          v20 = v19 + 1;
          v4 = XXH_read32(v20);
          v63 = XXH_swap32(v4);
          v13 = -1640531535 * (((v13 - 2048144777 * v63) >> 19) | ((v13 - 2048144777 * v63) << 13));
          v5 = XXH_read32(++v20);
          v62 = XXH_swap32(v5);
          v12 = -1640531535 * (((v12 - 2048144777 * v62) >> 19) | ((v12 - 2048144777 * v62) << 13));
          v6 = XXH_read32(++v20);
          v61 = XXH_swap32(v6);
          v11 = -1640531535 * (((v11 - 2048144777 * v61) >> 19) | ((v11 - 2048144777 * v61) << 13));
          v19 = v20 + 1;
        }
        while ((unint64_t)v19 <= v18 - 16);
        v15 = ((v14 >> 31) | (2 * v14))
            + ((v13 >> 25) | (v13 << 7))
            + ((v12 >> 20) | (v12 << 12))
            + ((v11 >> 14) | (v11 << 18));
      }
      v16 = v15 + v9;
      while ((unint64_t)(v19 + 1) <= v18)
      {
        v7 = XXH_read32(v19);
        v65 = XXH_swap32(v7);
        v16 = 668265263 * (((v16 - 1028477379 * v65) >> 15) | ((v16 - 1028477379 * v65) << 17));
        ++v19;
      }
      while ((unint64_t)v19 < v18)
      {
        v16 = -1640531535
            * (((v16 + 374761393 * *(unsigned __int8 *)v19) >> 21) | ((v16 + 374761393 * *(unsigned __int8 *)v19) << 11));
        v19 = (unsigned int *)((char *)v19 + 1);
      }
      v17 = -1028477379 * ((-2048144777 * (v16 ^ (v16 >> 15))) ^ ((-2048144777 * (v16 ^ (v16 >> 15))) >> 13));
      return v17 ^ HIWORD(v17);
    }
  }
  else if (g_one == 1)
  {
    v49 = a1;
    v48 = (unint64_t)a1 + a2;
    if (a2 < 0x10)
    {
      v45 = a3 + 374761393;
    }
    else
    {
      v44 = a3 + 606290984;
      v43 = a3 - 2048144777;
      v42 = a3;
      v41 = a3 + 1640531535;
      do
      {
        v44 = -1640531535 * (((v44 - 2048144777 * *v49) >> 19) | ((v44 - 2048144777 * *v49) << 13));
        v50 = v49 + 1;
        v43 = -1640531535 * (((v43 - 2048144777 * *v50) >> 19) | ((v43 - 2048144777 * *v50) << 13));
        ++v50;
        v42 = -1640531535 * (((v42 - 2048144777 * *v50) >> 19) | ((v42 - 2048144777 * *v50) << 13));
        ++v50;
        v41 = -1640531535 * (((v41 - 2048144777 * *v50) >> 19) | ((v41 - 2048144777 * *v50) << 13));
        v49 = v50 + 1;
      }
      while ((unint64_t)v49 <= v48 - 16);
      v45 = ((v44 >> 31) | (2 * v44))
          + ((v43 >> 25) | (v43 << 7))
          + ((v42 >> 20) | (v42 << 12))
          + ((v41 >> 14) | (v41 << 18));
    }
    v46 = v45 + a2;
    while ((unint64_t)(v49 + 1) <= v48)
    {
      v46 = 668265263 * (((v46 - 1028477379 * *v49) >> 15) | ((v46 - 1028477379 * *v49) << 17));
      ++v49;
    }
    while ((unint64_t)v49 < v48)
    {
      v46 = -1640531535
          * (((v46 + 374761393 * *(unsigned __int8 *)v49) >> 21) | ((v46 + 374761393 * *(unsigned __int8 *)v49) << 11));
      v49 = (_DWORD *)((char *)v49 + 1);
    }
    v47 = -1028477379 * ((-2048144777 * (v46 ^ (v46 >> 15))) ^ ((-2048144777 * (v46 ^ (v46 >> 15))) >> 13));
    return v47 ^ HIWORD(v47);
  }
  else
  {
    v39 = a1;
    v38 = (unint64_t)a1 + a2;
    if (a2 < 0x10)
    {
      v35 = a3 + 374761393;
    }
    else
    {
      v34 = a3 + 606290984;
      v33 = a3 - 2048144777;
      v32 = a3;
      v31 = a3 + 1640531535;
      do
      {
        v54 = XXH_swap32(*v39);
        v34 = -1640531535 * (((v34 - 2048144777 * v54) >> 19) | ((v34 - 2048144777 * v54) << 13));
        v40 = v39 + 1;
        v53 = XXH_swap32(*v40);
        v33 = -1640531535 * (((v33 - 2048144777 * v53) >> 19) | ((v33 - 2048144777 * v53) << 13));
        v52 = XXH_swap32(*++v40);
        v32 = -1640531535 * (((v32 - 2048144777 * v52) >> 19) | ((v32 - 2048144777 * v52) << 13));
        v51 = XXH_swap32(*++v40);
        v31 = -1640531535 * (((v31 - 2048144777 * v51) >> 19) | ((v31 - 2048144777 * v51) << 13));
        v39 = v40 + 1;
      }
      while ((unint64_t)v39 <= v38 - 16);
      v35 = ((v34 >> 31) | (2 * v34))
          + ((v33 >> 25) | (v33 << 7))
          + ((v32 >> 20) | (v32 << 12))
          + ((v31 >> 14) | (v31 << 18));
    }
    v36 = v35 + v9;
    while ((unint64_t)(v39 + 1) <= v38)
    {
      v55 = XXH_swap32(*v39);
      v36 = 668265263 * (((v36 - 1028477379 * v55) >> 15) | ((v36 - 1028477379 * v55) << 17));
      ++v39;
    }
    while ((unint64_t)v39 < v38)
    {
      v36 = -1640531535
          * (((v36 + 374761393 * *(unsigned __int8 *)v39) >> 21) | ((v36 + 374761393 * *(unsigned __int8 *)v39) << 11));
      v39 = (unsigned int *)((char *)v39 + 1);
    }
    v37 = -1028477379 * ((-2048144777 * (v36 ^ (v36 >> 15))) ^ ((-2048144777 * (v36 ^ (v36 >> 15))) >> 13));
    return v37 ^ HIWORD(v37);
  }
}

unint64_t XXH64(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unsigned int *v37;
  uint64_t v38;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t *v50;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unsigned int *v61;
  uint64_t *v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  if ((a1 & 7) != 0)
  {
    if (g_one == 1)
    {
      v37 = a1;
      v36 = (unint64_t)a1 + a2;
      if (a2 < 0x20)
      {
        v32 = a3 + 0x27D4EB2F165667C5;
      }
      else
      {
        v31 = a3 + 0x60EA27EEADC0B5D6;
        v30 = a3 - 0x3D4D51C2D82B14B1;
        v29 = a3;
        v28 = a3 + 0x61C8864E7A143579;
        do
        {
          v78 = XXH_read64((uint64_t)v37);
          v38 = (uint64_t)(v37 + 2);
          v31 = 0x9E3779B185EBCA87
              * (((v31 - 0x3D4D51C2D82B14B1 * v78) >> 33) | ((v31 - 0x3D4D51C2D82B14B1 * v78) << 31));
          v77 = XXH_read64(v38);
          v38 += 8;
          v30 = 0x9E3779B185EBCA87
              * (((v30 - 0x3D4D51C2D82B14B1 * v77) >> 33) | ((v30 - 0x3D4D51C2D82B14B1 * v77) << 31));
          v76 = XXH_read64(v38);
          v38 += 8;
          v29 = 0x9E3779B185EBCA87
              * (((v29 - 0x3D4D51C2D82B14B1 * v76) >> 33) | ((v29 - 0x3D4D51C2D82B14B1 * v76) << 31));
          v75 = XXH_read64(v38);
          v37 = (unsigned int *)(v38 + 8);
          v28 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v28 - 0x3D4D51C2D82B14B1 * v75, v28 - 0x3D4D51C2D82B14B1 * v75) >> 33);
        }
        while ((unint64_t)v37 <= v36 - 32);
        v32 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((((v31 >> 63) | (2 * v31))
                    + ((v30 >> 57) | (v30 << 7))
                    + ((v29 >> 52) | (v29 << 12))
                    + ((v28 >> 46) | (v28 << 18))) ^ (0x9E3779B185EBCA87
                                                    * (((0xC2B2AE3D27D4EB4FLL * v31) >> 33) | (0x93EA75A780000000 * v31))))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                           * (((0xC2B2AE3D27D4EB4FLL * v30) >> 33) | (0x93EA75A780000000 * v30))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v29) >> 33) | (0x93EA75A780000000 * v29))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v28) >> 33) | (0x93EA75A780000000 * v28))))
            - 0x7A1435883D4D519DLL;
      }
      v33 = v32 + a2;
      while ((unint64_t)(v37 + 2) <= v36)
      {
        v79 = XXH_read64((uint64_t)v37);
        v34 = v33 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v79) >> 33) | (0x93EA75A780000000 * v79)));
        v33 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v34, v34) >> 37) - 0x7A1435883D4D519DLL;
        v37 += 2;
      }
      if ((unint64_t)(v37 + 1) <= v36)
      {
        v64 = XXH_read32(v37);
        v33 = 0xC2B2AE3D27D4EB4FLL
            * ((__int128)__PAIR128__(v33 ^ (0x9E3779B185EBCA87 * v64), v33 ^ (0x9E3779B185EBCA87 * v64)) >> 41)
            + 0x165667B19E3779F9;
        ++v37;
      }
      while ((unint64_t)v37 < v36)
      {
        v33 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v33 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v37), v33 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v37)) >> 53);
        v37 = (unsigned int *)((char *)v37 + 1);
      }
      v35 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v33 ^ (v33 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v33 ^ (v33 >> 33))) >> 29));
      return v35 ^ HIDWORD(v35);
    }
    else
    {
      v26 = a1;
      v25 = (unint64_t)a1 + a2;
      if (a2 < 0x20)
      {
        v23 = a3 + 0x27D4EB2F165667C5;
      }
      else
      {
        v22 = a3 + 0x60EA27EEADC0B5D6;
        v21 = a3 - 0x3D4D51C2D82B14B1;
        v20 = a3;
        v19 = a3 + 0x61C8864E7A143579;
        do
        {
          v3 = XXH_read64((uint64_t)v26);
          v15 = XXH_swap64(v3);
          v27 = (uint64_t)(v26 + 2);
          v22 = 0x9E3779B185EBCA87
              * (((v22 - 0x3D4D51C2D82B14B1 * v15) >> 33) | ((v22 - 0x3D4D51C2D82B14B1 * v15) << 31));
          v4 = XXH_read64(v27);
          v14 = XXH_swap64(v4);
          v27 += 8;
          v21 = 0x9E3779B185EBCA87
              * (((v21 - 0x3D4D51C2D82B14B1 * v14) >> 33) | ((v21 - 0x3D4D51C2D82B14B1 * v14) << 31));
          v5 = XXH_read64(v27);
          v13 = XXH_swap64(v5);
          v27 += 8;
          v20 = 0x9E3779B185EBCA87
              * (((v20 - 0x3D4D51C2D82B14B1 * v13) >> 33) | ((v20 - 0x3D4D51C2D82B14B1 * v13) << 31));
          v6 = XXH_read64(v27);
          v12 = XXH_swap64(v6);
          v26 = (unsigned int *)(v27 + 8);
          v19 = 0x9E3779B185EBCA87
              * (((v19 - 0x3D4D51C2D82B14B1 * v12) >> 33) | ((v19 - 0x3D4D51C2D82B14B1 * v12) << 31));
        }
        while ((unint64_t)v26 <= v25 - 32);
        v23 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((((v22 >> 63) | (2 * v22))
                    + ((v21 >> 57) | (v21 << 7))
                    + ((v20 >> 52) | (v20 << 12))
                    + ((v19 >> 46) | (v19 << 18))) ^ (0x9E3779B185EBCA87
                                                    * (((0xC2B2AE3D27D4EB4FLL * v22) >> 33) | (0x93EA75A780000000 * v22))))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                           * (((0xC2B2AE3D27D4EB4FLL * v21) >> 33) | (0x93EA75A780000000 * v21))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v20) >> 33) | (0x93EA75A780000000 * v20))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v19) >> 33) | (0x93EA75A780000000 * v19))))
            - 0x7A1435883D4D519DLL;
      }
      v24 = v23 + a2;
      while ((unint64_t)(v26 + 2) <= v25)
      {
        v7 = XXH_read64((uint64_t)v26);
        v11 = XXH_swap64(v7);
        v18 = 0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v11) >> 33) | (0x93EA75A780000000 * v11));
        v24 = 0x9E3779B185EBCA87 * (((v24 ^ v18) >> 37) | ((v24 ^ v18) << 27)) - 0x7A1435883D4D519DLL;
        v26 += 2;
      }
      if ((unint64_t)(v26 + 1) <= v25)
      {
        v8 = XXH_read32(v26);
        v65 = XXH_swap32(v8);
        v24 = 0xC2B2AE3D27D4EB4FLL
            * (((v24 ^ (0x9E3779B185EBCA87 * v65)) >> 41) | ((v24 ^ (0x9E3779B185EBCA87 * v65)) << 23))
            + 0x165667B19E3779F9;
        ++v26;
      }
      while ((unint64_t)v26 < v25)
      {
        v24 = 0x9E3779B185EBCA87
            * (((v24 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v26)) >> 53) | ((v24 ^ (0x27D4EB2F165667C5
                                                                                         * *(unsigned __int8 *)v26)) << 11));
        v26 = (unsigned int *)((char *)v26 + 1);
      }
      v9 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v24 ^ (v24 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v24 ^ (v24 >> 33))) >> 29));
      return v9 ^ HIDWORD(v9);
    }
  }
  else if (g_one == 1)
  {
    v61 = a1;
    v60 = (unint64_t)a1 + a2;
    if (a2 < 0x20)
    {
      v56 = a3 + 0x27D4EB2F165667C5;
    }
    else
    {
      v55 = a3 + 0x60EA27EEADC0B5D6;
      v54 = a3 - 0x3D4D51C2D82B14B1;
      v53 = a3;
      v52 = a3 + 0x61C8864E7A143579;
      do
      {
        v69 = *(_QWORD *)v61;
        v62 = (uint64_t *)(v61 + 2);
        v55 = 0x9E3779B185EBCA87
            * (((v55 - 0x3D4D51C2D82B14B1 * v69) >> 33) | ((v55 - 0x3D4D51C2D82B14B1 * v69) << 31));
        v68 = *v62++;
        v54 = 0x9E3779B185EBCA87
            * (((v54 - 0x3D4D51C2D82B14B1 * v68) >> 33) | ((v54 - 0x3D4D51C2D82B14B1 * v68) << 31));
        v67 = *v62++;
        v53 = 0x9E3779B185EBCA87
            * (((v53 - 0x3D4D51C2D82B14B1 * v67) >> 33) | ((v53 - 0x3D4D51C2D82B14B1 * v67) << 31));
        v66 = *v62;
        v61 = (unsigned int *)(v62 + 1);
        v52 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v52 - 0x3D4D51C2D82B14B1 * v66, v52 - 0x3D4D51C2D82B14B1 * v66) >> 33);
      }
      while ((unint64_t)v61 <= v60 - 32);
      v56 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v55 >> 63) | (2 * v55))
                  + ((v54 >> 57) | (v54 << 7))
                  + ((v53 >> 52) | (v53 << 12))
                  + ((v52 >> 46) | (v52 << 18))) ^ (0x9E3779B185EBCA87
                                                  * (((0xC2B2AE3D27D4EB4FLL * v55) >> 33) | (0x93EA75A780000000 * v55))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v54) >> 33) | (0x93EA75A780000000 * v54))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v53) >> 33) | (0x93EA75A780000000 * v53))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v52) >> 33) | (0x93EA75A780000000 * v52))))
          - 0x7A1435883D4D519DLL;
    }
    v57 = v56 + a2;
    while ((unint64_t)(v61 + 2) <= v60)
    {
      v58 = v57 ^ (0x9E3779B185EBCA87
                 * (((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)v61) >> 33) | (0x93EA75A780000000 * *(_QWORD *)v61)));
      v57 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v58, v58) >> 37) - 0x7A1435883D4D519DLL;
      v61 += 2;
    }
    if ((unint64_t)(v61 + 1) <= v60)
    {
      v57 = 0xC2B2AE3D27D4EB4FLL
          * ((__int128)__PAIR128__(v57 ^ (0x9E3779B185EBCA87 * *v61), v57 ^ (0x9E3779B185EBCA87 * *v61)) >> 41)
          + 0x165667B19E3779F9;
      ++v61;
    }
    while ((unint64_t)v61 < v60)
    {
      v57 = 0x9E3779B185EBCA87
          * ((__int128)__PAIR128__(v57 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v61), v57 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v61)) >> 53);
      v61 = (unsigned int *)((char *)v61 + 1);
    }
    v59 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v57 ^ (v57 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v57 ^ (v57 >> 33))) >> 29));
    return v59 ^ HIDWORD(v59);
  }
  else
  {
    v49 = (unint64_t *)a1;
    v48 = (unint64_t)a1 + a2;
    if (a2 < 0x20)
    {
      v44 = a3 + 0x27D4EB2F165667C5;
    }
    else
    {
      v43 = a3 + 0x60EA27EEADC0B5D6;
      v42 = a3 - 0x3D4D51C2D82B14B1;
      v41 = a3;
      v40 = a3 + 0x61C8864E7A143579;
      do
      {
        v73 = XXH_swap64(*v49);
        v50 = v49 + 1;
        v43 = 0x9E3779B185EBCA87
            * (((v43 - 0x3D4D51C2D82B14B1 * v73) >> 33) | ((v43 - 0x3D4D51C2D82B14B1 * v73) << 31));
        v72 = XXH_swap64(*v50++);
        v42 = 0x9E3779B185EBCA87
            * (((v42 - 0x3D4D51C2D82B14B1 * v72) >> 33) | ((v42 - 0x3D4D51C2D82B14B1 * v72) << 31));
        v71 = XXH_swap64(*v50++);
        v41 = 0x9E3779B185EBCA87
            * (((v41 - 0x3D4D51C2D82B14B1 * v71) >> 33) | ((v41 - 0x3D4D51C2D82B14B1 * v71) << 31));
        v70 = XXH_swap64(*v50);
        v49 = v50 + 1;
        v40 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v40 - 0x3D4D51C2D82B14B1 * v70, v40 - 0x3D4D51C2D82B14B1 * v70) >> 33);
      }
      while ((unint64_t)v49 <= v48 - 32);
      v44 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v43 >> 63) | (2 * v43))
                  + ((v42 >> 57) | (v42 << 7))
                  + ((v41 >> 52) | (v41 << 12))
                  + ((v40 >> 46) | (v40 << 18))) ^ (0x9E3779B185EBCA87
                                                  * (((0xC2B2AE3D27D4EB4FLL * v43) >> 33) | (0x93EA75A780000000 * v43))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v42) >> 33) | (0x93EA75A780000000 * v42))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v41) >> 33) | (0x93EA75A780000000 * v41))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v40) >> 33) | (0x93EA75A780000000 * v40))))
          - 0x7A1435883D4D519DLL;
    }
    v45 = v44 + a2;
    while ((unint64_t)(v49 + 1) <= v48)
    {
      v74 = XXH_swap64(*v49);
      v46 = v45 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v74) >> 33) | (0x93EA75A780000000 * v74)));
      v45 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v46, v46) >> 37) - 0x7A1435883D4D519DLL;
      ++v49;
    }
    if ((unint64_t)v49 + 4 <= v48)
    {
      v63 = XXH_swap32(*(_DWORD *)v49);
      v45 = 0xC2B2AE3D27D4EB4FLL
          * ((__int128)__PAIR128__(v45 ^ (0x9E3779B185EBCA87 * v63), v45 ^ (0x9E3779B185EBCA87 * v63)) >> 41)
          + 0x165667B19E3779F9;
      v49 = (unint64_t *)((char *)v49 + 4);
    }
    while ((unint64_t)v49 < v48)
    {
      v45 = 0x9E3779B185EBCA87
          * ((__int128)__PAIR128__(v45 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v49), v45 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v49)) >> 53);
      v49 = (unint64_t *)((char *)v49 + 1);
    }
    v47 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v45 ^ (v45 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v45 ^ (v45 >> 33))) >> 29));
    return v47 ^ HIDWORD(v47);
  }
}

void *XXH32_createState()
{
  return XXH_malloc(0x30uLL);
}

void *XXH_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x6E4DABBAuLL);
}

uint64_t XXH32_freeState(void *a1)
{
  XXH_free(a1);
  return 0;
}

void XXH_free(void *a1)
{
  free(a1);
}

void *XXH64_createState()
{
  return XXH_malloc(0x58uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  XXH_free(a1);
  return 0;
}

uint64_t XXH32_reset(uint64_t a1, int a2)
{
  _DWORD __b[12];
  int v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  memset(__b, 0, sizeof(__b));
  __b[2] = v4;
  __b[3] = v4 + 606290984;
  __b[4] = v4 - 2048144777;
  __b[5] = v4;
  __b[6] = v4 + 1640531535;
  __memcpy_chk();
  return 0;
}

uint64_t XXH64_reset(uint64_t a1, uint64_t a2)
{
  _QWORD __b[11];
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  memset(__b, 0, sizeof(__b));
  __b[1] = v4;
  __b[2] = v4 + 0x60EA27EEADC0B5D6;
  __b[3] = v4 - 0x3D4D51C2D82B14B1;
  __b[4] = v4;
  __b[5] = v4 + 0x61C8864E7A143579;
  __memcpy_chk();
  return 0;
}

uint64_t XXH32_update(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v12;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int *v27;
  unsigned int *v28;
  int v29;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;

  v12 = a3;
  if (g_one == 1)
  {
    v29 = a3;
    v27 = a2;
    v26 = (unint64_t)a2 + a3;
    *(_QWORD *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 44) + a3 >= 0x10)
    {
      if (*(_DWORD *)(a1 + 44))
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 12) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 28));
        *(_DWORD *)(a1 + 12) = (*(_DWORD *)(a1 + 12) >> 19) | (*(_DWORD *)(a1 + 12) << 13);
        *(_DWORD *)(a1 + 12) *= -1640531535;
        *(_DWORD *)(a1 + 16) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 32));
        *(_DWORD *)(a1 + 16) = (*(_DWORD *)(a1 + 16) >> 19) | (*(_DWORD *)(a1 + 16) << 13);
        *(_DWORD *)(a1 + 16) *= -1640531535;
        *(_DWORD *)(a1 + 20) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 36));
        *(_DWORD *)(a1 + 20) = (*(_DWORD *)(a1 + 20) >> 19) | (*(_DWORD *)(a1 + 20) << 13);
        *(_DWORD *)(a1 + 20) *= -1640531535;
        *(_DWORD *)(a1 + 24) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 40));
        *(_DWORD *)(a1 + 24) = (*(_DWORD *)(a1 + 24) >> 19) | (*(_DWORD *)(a1 + 24) << 13);
        *(_DWORD *)(a1 + 24) *= -1640531535;
        v27 = (unsigned int *)((char *)v27 + (16 - *(_DWORD *)(a1 + 44)));
        *(_DWORD *)(a1 + 44) = 0;
      }
      if ((unint64_t)v27 <= v26 - 16)
      {
        v25 = *(_DWORD *)(a1 + 12);
        v24 = *(_DWORD *)(a1 + 16);
        v23 = *(_DWORD *)(a1 + 20);
        v22 = *(_DWORD *)(a1 + 24);
        do
        {
          v34 = XXH_read32(v27);
          v25 = -1640531535 * (((v25 - 2048144777 * v34) >> 19) | ((v25 - 2048144777 * v34) << 13));
          v28 = v27 + 1;
          v33 = XXH_read32(v28);
          v24 = -1640531535 * (((v24 - 2048144777 * v33) >> 19) | ((v24 - 2048144777 * v33) << 13));
          v32 = XXH_read32(++v28);
          v23 = -1640531535 * (((v23 - 2048144777 * v32) >> 19) | ((v23 - 2048144777 * v32) << 13));
          v31 = XXH_read32(++v28);
          v22 = -1640531535 * (((v22 - 2048144777 * v31) >> 19) | ((v22 - 2048144777 * v31) << 13));
          v27 = v28 + 1;
        }
        while ((unint64_t)v27 <= v26 - 16);
        *(_DWORD *)(a1 + 12) = v25;
        *(_DWORD *)(a1 + 16) = v24;
        *(_DWORD *)(a1 + 20) = v23;
        *(_DWORD *)(a1 + 24) = v22;
      }
      if ((unint64_t)v27 < v26)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 44) = v26 - (_DWORD)v27;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 44) += v29;
    }
  }
  else
  {
    v20 = a2;
    v19 = (unint64_t)a2 + a3;
    *(_QWORD *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 44) + a3 >= 0x10)
    {
      if (*(_DWORD *)(a1 + 44))
      {
        XXH_memcpy();
        v3 = XXH_read32((unsigned int *)(a1 + 28));
        *(_DWORD *)(a1 + 12) -= 2048144777 * XXH_swap32(v3);
        *(_DWORD *)(a1 + 12) = (*(_DWORD *)(a1 + 12) >> 19) | (*(_DWORD *)(a1 + 12) << 13);
        *(_DWORD *)(a1 + 12) *= -1640531535;
        v4 = XXH_read32((unsigned int *)(a1 + 32));
        *(_DWORD *)(a1 + 16) -= 2048144777 * XXH_swap32(v4);
        *(_DWORD *)(a1 + 16) = (*(_DWORD *)(a1 + 16) >> 19) | (*(_DWORD *)(a1 + 16) << 13);
        *(_DWORD *)(a1 + 16) *= -1640531535;
        v5 = XXH_read32((unsigned int *)(a1 + 36));
        *(_DWORD *)(a1 + 20) -= 2048144777 * XXH_swap32(v5);
        *(_DWORD *)(a1 + 20) = (*(_DWORD *)(a1 + 20) >> 19) | (*(_DWORD *)(a1 + 20) << 13);
        *(_DWORD *)(a1 + 20) *= -1640531535;
        v6 = XXH_read32((unsigned int *)(a1 + 40));
        *(_DWORD *)(a1 + 24) -= 2048144777 * XXH_swap32(v6);
        *(_DWORD *)(a1 + 24) = (*(_DWORD *)(a1 + 24) >> 19) | (*(_DWORD *)(a1 + 24) << 13);
        *(_DWORD *)(a1 + 24) *= -1640531535;
        v20 = (unsigned int *)((char *)a2 + (16 - *(_DWORD *)(a1 + 44)));
        *(_DWORD *)(a1 + 44) = 0;
      }
      if ((unint64_t)v20 <= v19 - 16)
      {
        v18 = *(_DWORD *)(a1 + 12);
        v17 = *(_DWORD *)(a1 + 16);
        v16 = *(_DWORD *)(a1 + 20);
        v15 = *(_DWORD *)(a1 + 24);
        do
        {
          v7 = XXH_read32(v20);
          v38 = XXH_swap32(v7);
          v18 = -1640531535 * (((v18 - 2048144777 * v38) >> 19) | ((v18 - 2048144777 * v38) << 13));
          v21 = v20 + 1;
          v8 = XXH_read32(v21);
          v37 = XXH_swap32(v8);
          v17 = -1640531535 * (((v17 - 2048144777 * v37) >> 19) | ((v17 - 2048144777 * v37) << 13));
          v9 = XXH_read32(++v21);
          v36 = XXH_swap32(v9);
          v16 = -1640531535 * (((v16 - 2048144777 * v36) >> 19) | ((v16 - 2048144777 * v36) << 13));
          v10 = XXH_read32(++v21);
          v35 = XXH_swap32(v10);
          v15 = -1640531535 * (((v15 - 2048144777 * v35) >> 19) | ((v15 - 2048144777 * v35) << 13));
          v20 = v21 + 1;
        }
        while ((unint64_t)v20 <= v19 - 16);
        *(_DWORD *)(a1 + 12) = v18;
        *(_DWORD *)(a1 + 16) = v17;
        *(_DWORD *)(a1 + 20) = v16;
        *(_DWORD *)(a1 + 24) = v15;
      }
      if ((unint64_t)v20 < v19)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 44) = v19 - (_DWORD)v20;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 44) += v12;
    }
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  unsigned int v1;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int *v13;
  int v14;
  int v15;

  if (g_one == 1)
  {
    v13 = (unsigned int *)(a1 + 28);
    v12 = a1 + 28 + *(unsigned int *)(a1 + 44);
    if (*(_QWORD *)a1 < 0x10uLL)
      v9 = *(_DWORD *)(a1 + 8) + 374761393;
    else
      v9 = ((*(_DWORD *)(a1 + 12) >> 31) | (2 * *(_DWORD *)(a1 + 12)))
         + ((*(_DWORD *)(a1 + 16) >> 25) | (*(_DWORD *)(a1 + 16) << 7))
         + ((*(_DWORD *)(a1 + 20) >> 20) | (*(_DWORD *)(a1 + 20) << 12))
         + ((*(_DWORD *)(a1 + 24) >> 14) | (*(_DWORD *)(a1 + 24) << 18));
    v10 = v9 + *(_QWORD *)a1;
    while ((unint64_t)(v13 + 1) <= v12)
    {
      v14 = XXH_read32(v13);
      v10 = 668265263 * (((v10 - 1028477379 * v14) >> 15) | ((v10 - 1028477379 * v14) << 17));
      ++v13;
    }
    while ((unint64_t)v13 < v12)
    {
      v10 = -1640531535
          * (((v10 + 374761393 * *(unsigned __int8 *)v13) >> 21) | ((v10 + 374761393 * *(unsigned __int8 *)v13) << 11));
      v13 = (unsigned int *)((char *)v13 + 1);
    }
    v11 = -1028477379 * ((-2048144777 * (v10 ^ (v10 >> 15))) ^ ((-2048144777 * (v10 ^ (v10 >> 15))) >> 13));
    return v11 ^ HIWORD(v11);
  }
  else
  {
    v8 = (unsigned int *)(a1 + 28);
    v7 = a1 + 28 + *(unsigned int *)(a1 + 44);
    if (*(_QWORD *)a1 < 0x10uLL)
      v4 = *(_DWORD *)(a1 + 8) + 374761393;
    else
      v4 = ((*(_DWORD *)(a1 + 12) >> 31) | (2 * *(_DWORD *)(a1 + 12)))
         + ((*(_DWORD *)(a1 + 16) >> 25) | (*(_DWORD *)(a1 + 16) << 7))
         + ((*(_DWORD *)(a1 + 20) >> 20) | (*(_DWORD *)(a1 + 20) << 12))
         + ((*(_DWORD *)(a1 + 24) >> 14) | (*(_DWORD *)(a1 + 24) << 18));
    v5 = v4 + *(_QWORD *)a1;
    while ((unint64_t)(v8 + 1) <= v7)
    {
      v1 = XXH_read32(v8);
      v15 = XXH_swap32(v1);
      v5 = 668265263 * (((v5 - 1028477379 * v15) >> 15) | ((v5 - 1028477379 * v15) << 17));
      ++v8;
    }
    while ((unint64_t)v8 < v7)
    {
      v5 = -1640531535
         * (((v5 + 374761393 * *(unsigned __int8 *)v8) >> 21) | ((v5 + 374761393 * *(unsigned __int8 *)v8) << 11));
      v8 = (unsigned int *)((char *)v8 + 1);
    }
    v6 = -1028477379 * ((-2048144777 * (v5 ^ (v5 >> 15))) ^ ((-2048144777 * (v5 ^ (v5 >> 15))) >> 13));
    return v6 ^ HIWORD(v6);
  }
}

uint64_t XXH64_update(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;

  v20 = a3;
  if (g_one == 1)
  {
    v37 = a3;
    v35 = a2;
    v34 = a2 + a3;
    *(_QWORD *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 80) + a3 >= 0x20)
    {
      if (*(_DWORD *)(a1 + 80))
      {
        XXH_memcpy();
        *(_QWORD *)(a1 + 16) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 48);
        *(_QWORD *)(a1 + 16) = (*(_QWORD *)(a1 + 16) >> 33) | (*(_QWORD *)(a1 + 16) << 31);
        *(_QWORD *)(a1 + 16) *= 0x9E3779B185EBCA87;
        *(_QWORD *)(a1 + 24) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 56);
        *(_QWORD *)(a1 + 24) = (*(_QWORD *)(a1 + 24) >> 33) | (*(_QWORD *)(a1 + 24) << 31);
        *(_QWORD *)(a1 + 24) *= 0x9E3779B185EBCA87;
        *(_QWORD *)(a1 + 32) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 64);
        *(_QWORD *)(a1 + 32) = (*(_QWORD *)(a1 + 32) >> 33) | (*(_QWORD *)(a1 + 32) << 31);
        *(_QWORD *)(a1 + 32) *= 0x9E3779B185EBCA87;
        *(_QWORD *)(a1 + 40) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 72);
        *(_QWORD *)(a1 + 40) = (*(_QWORD *)(a1 + 40) >> 33) | (*(_QWORD *)(a1 + 40) << 31);
        *(_QWORD *)(a1 + 40) *= 0x9E3779B185EBCA87;
        v35 += (32 - *(_DWORD *)(a1 + 80));
        *(_DWORD *)(a1 + 80) = 0;
      }
      if (v35 + 32 <= v34)
      {
        v33 = *(_QWORD *)(a1 + 16);
        v32 = *(_QWORD *)(a1 + 24);
        v31 = *(_QWORD *)(a1 + 32);
        v30 = *(_QWORD *)(a1 + 40);
        do
        {
          v19 = XXH_read64(v35);
          v33 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v33 - 0x3D4D51C2D82B14B1 * v19, v33 - 0x3D4D51C2D82B14B1 * v19) >> 33);
          v36 = v35 + 8;
          v18 = XXH_read64(v36);
          v32 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v32 - 0x3D4D51C2D82B14B1 * v18, v32 - 0x3D4D51C2D82B14B1 * v18) >> 33);
          v36 += 8;
          v17 = XXH_read64(v36);
          v31 = 0x9E3779B185EBCA87
              * (((v31 - 0x3D4D51C2D82B14B1 * v17) >> 33) | ((v31 - 0x3D4D51C2D82B14B1 * v17) << 31));
          v36 += 8;
          v16 = XXH_read64(v36);
          v30 = 0x9E3779B185EBCA87
              * (((v30 - 0x3D4D51C2D82B14B1 * v16) >> 33) | ((v30 - 0x3D4D51C2D82B14B1 * v16) << 31));
          v35 = v36 + 8;
        }
        while (v35 <= v34 - 32);
        *(_QWORD *)(a1 + 16) = v33;
        *(_QWORD *)(a1 + 24) = v32;
        *(_QWORD *)(a1 + 32) = v31;
        *(_QWORD *)(a1 + 40) = v30;
      }
      if (v35 < v34)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 80) = v34 - v35;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 80) += v37;
    }
  }
  else
  {
    v28 = a2;
    v27 = a2 + a3;
    *(_QWORD *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 80) + a3 >= 0x20)
    {
      if (*(_DWORD *)(a1 + 80))
      {
        XXH_memcpy();
        v3 = XXH_read64(a1 + 48);
        *(_QWORD *)(a1 + 16) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v3);
        *(_QWORD *)(a1 + 16) = (*(_QWORD *)(a1 + 16) >> 33) | (*(_QWORD *)(a1 + 16) << 31);
        *(_QWORD *)(a1 + 16) *= 0x9E3779B185EBCA87;
        v4 = XXH_read64(a1 + 56);
        *(_QWORD *)(a1 + 24) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v4);
        *(_QWORD *)(a1 + 24) = (*(_QWORD *)(a1 + 24) >> 33) | (*(_QWORD *)(a1 + 24) << 31);
        *(_QWORD *)(a1 + 24) *= 0x9E3779B185EBCA87;
        v5 = XXH_read64(a1 + 64);
        *(_QWORD *)(a1 + 32) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v5);
        *(_QWORD *)(a1 + 32) = (*(_QWORD *)(a1 + 32) >> 33) | (*(_QWORD *)(a1 + 32) << 31);
        *(_QWORD *)(a1 + 32) *= 0x9E3779B185EBCA87;
        v6 = XXH_read64(a1 + 72);
        *(_QWORD *)(a1 + 40) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v6);
        *(_QWORD *)(a1 + 40) = (*(_QWORD *)(a1 + 40) >> 33) | (*(_QWORD *)(a1 + 40) << 31);
        *(_QWORD *)(a1 + 40) *= 0x9E3779B185EBCA87;
        v28 = a2 + (32 - *(_DWORD *)(a1 + 80));
        *(_DWORD *)(a1 + 80) = 0;
      }
      if (v28 + 32 <= v27)
      {
        v26 = *(_QWORD *)(a1 + 16);
        v25 = *(_QWORD *)(a1 + 24);
        v24 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        do
        {
          v7 = XXH_read64(v28);
          v15 = XXH_swap64(v7);
          v26 = 0x9E3779B185EBCA87
              * (((v26 - 0x3D4D51C2D82B14B1 * v15) >> 33) | ((v26 - 0x3D4D51C2D82B14B1 * v15) << 31));
          v29 = v28 + 8;
          v8 = XXH_read64(v29);
          v14 = XXH_swap64(v8);
          v25 = 0x9E3779B185EBCA87
              * (((v25 - 0x3D4D51C2D82B14B1 * v14) >> 33) | ((v25 - 0x3D4D51C2D82B14B1 * v14) << 31));
          v29 += 8;
          v9 = XXH_read64(v29);
          v13 = XXH_swap64(v9);
          v24 = 0x9E3779B185EBCA87
              * (((v24 - 0x3D4D51C2D82B14B1 * v13) >> 33) | ((v24 - 0x3D4D51C2D82B14B1 * v13) << 31));
          v29 += 8;
          v10 = XXH_read64(v29);
          v12 = XXH_swap64(v10);
          v23 = 0x9E3779B185EBCA87
              * (((v23 - 0x3D4D51C2D82B14B1 * v12) >> 33) | ((v23 - 0x3D4D51C2D82B14B1 * v12) << 31));
          v28 = v29 + 8;
        }
        while (v28 <= v27 - 32);
        *(_QWORD *)(a1 + 16) = v26;
        *(_QWORD *)(a1 + 24) = v25;
        *(_QWORD *)(a1 + 32) = v24;
        *(_QWORD *)(a1 + 40) = v23;
      }
      if (v28 < v27)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 80) = v27 - v28;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 80) += v20;
    }
  }
  return 0;
}

unint64_t XXH64_digest(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;

  if (g_one == 1)
  {
    v25 = (unsigned int *)(a1 + 48);
    v24 = a1 + 48 + *(unsigned int *)(a1 + 80);
    if (*(_QWORD *)a1 < 0x20uLL)
    {
      v20 = *(_QWORD *)(a1 + 8) + 0x27D4EB2F165667C5;
    }
    else
    {
      v19 = *(_QWORD *)(a1 + 24);
      v18 = *(_QWORD *)(a1 + 32);
      v1 = *(_QWORD *)(a1 + 40);
      v20 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((*(_QWORD *)(a1 + 16) >> 63) | (2 * *(_QWORD *)(a1 + 16)))
                  + ((v19 >> 57) | (v19 << 7))
                  + ((v18 >> 52) | (v18 << 12))
                  + ((v1 >> 46) | (v1 << 18))) ^ (0x9E3779B185EBCA87
                                                * (((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)(a1 + 16)) >> 33) | (0x93EA75A780000000 * *(_QWORD *)(a1 + 16)))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v19) >> 33) | (0x93EA75A780000000 * v19))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v18) >> 33) | (0x93EA75A780000000 * v18))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v1) >> 33) | (0x93EA75A780000000 * v1))))
          - 0x7A1435883D4D519DLL;
    }
    v21 = v20 + *(_QWORD *)a1;
    while ((unint64_t)(v25 + 2) <= v24)
    {
      v8 = XXH_read64((uint64_t)v25);
      v22 = v21 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v8) >> 33) | (0x93EA75A780000000 * v8)));
      v21 = 0x9E3779B185EBCA87 * ((v22 >> 37) | (v22 << 27)) - 0x7A1435883D4D519DLL;
      v25 += 2;
    }
    if ((unint64_t)(v25 + 1) <= v24)
    {
      v26 = XXH_read32(v25);
      v21 = 0xC2B2AE3D27D4EB4FLL
          * (((v21 ^ (0x9E3779B185EBCA87 * v26)) >> 41) | ((v21 ^ (0x9E3779B185EBCA87 * v26)) << 23))
          + 0x165667B19E3779F9;
      ++v25;
    }
    while ((unint64_t)v25 < v24)
    {
      v21 = 0x9E3779B185EBCA87
          * (((v21 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v25)) >> 53) | ((v21 ^ (0x27D4EB2F165667C5
                                                                                       * *(unsigned __int8 *)v25)) << 11));
      v25 = (unsigned int *)((char *)v25 + 1);
    }
    v23 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v21 ^ (v21 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v21 ^ (v21 >> 33))) >> 29));
    return v23 ^ HIDWORD(v23);
  }
  else
  {
    v17 = (unsigned int *)(a1 + 48);
    v16 = a1 + 48 + *(unsigned int *)(a1 + 80);
    if (*(_QWORD *)a1 < 0x20uLL)
    {
      v14 = *(_QWORD *)(a1 + 8) + 0x27D4EB2F165667C5;
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 16);
      v12 = *(_QWORD *)(a1 + 24);
      v11 = *(_QWORD *)(a1 + 32);
      v2 = *(_QWORD *)(a1 + 40);
      v14 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v13 >> 63) | (2 * v13))
                  + ((v12 >> 57) | (v12 << 7))
                  + ((v11 >> 52) | (v11 << 12))
                  + ((v2 >> 46) | (v2 << 18))) ^ (0x9E3779B185EBCA87
                                                * (((0xC2B2AE3D27D4EB4FLL * v13) >> 33) | (0x93EA75A780000000 * v13))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v12) >> 33) | (0x93EA75A780000000 * v12))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v11) >> 33) | (0x93EA75A780000000 * v11))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v2) >> 33) | (0x93EA75A780000000 * v2))))
          - 0x7A1435883D4D519DLL;
    }
    v15 = v14 + *(_QWORD *)a1;
    while ((unint64_t)(v17 + 2) <= v16)
    {
      v3 = XXH_read64((uint64_t)v17);
      v7 = XXH_swap64(v3);
      v10 = 0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v7) >> 33) | (0x93EA75A780000000 * v7));
      v15 = 0x9E3779B185EBCA87 * (((v15 ^ v10) >> 37) | ((v15 ^ v10) << 27)) - 0x7A1435883D4D519DLL;
      v17 += 2;
    }
    if ((unint64_t)(v17 + 1) <= v16)
    {
      v4 = XXH_read32(v17);
      v27 = XXH_swap32(v4);
      v15 = 0xC2B2AE3D27D4EB4FLL
          * (((v15 ^ (0x9E3779B185EBCA87 * v27)) >> 41) | ((v15 ^ (0x9E3779B185EBCA87 * v27)) << 23))
          + 0x165667B19E3779F9;
      ++v17;
    }
    while ((unint64_t)v17 < v16)
    {
      v15 = 0x9E3779B185EBCA87
          * (((v15 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v17)) >> 53) | ((v15 ^ (0x27D4EB2F165667C5
                                                                                       * *(unsigned __int8 *)v17)) << 11));
      v17 = (unsigned int *)((char *)v17 + 1);
    }
    v5 = 0x165667B19E3779F9
       * ((0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 33))) >> 29));
    return v5 ^ HIDWORD(v5);
  }
}

uint64_t XXH32_canonicalFromHash(uint64_t a1, unsigned int a2)
{
  if (g_one)
    XXH_swap32(a2);
  return __memcpy_chk();
}

uint64_t XXH_swap32(unsigned int a1)
{
  return (a1 << 24) | (a1 << 8) & 0xFF0000 | (a1 >> 8) & 0xFF00 | HIBYTE(a1);
}

uint64_t XXH64_canonicalFromHash(uint64_t a1, unint64_t a2)
{
  if (g_one)
    XXH_swap64(a2);
  return __memcpy_chk();
}

uint64_t XXH_swap64(unint64_t a1)
{
  return (a1 << 56) | (a1 << 40) & 0xFF000000000000 | (a1 << 24) & 0xFF0000000000 | (a1 << 8) & 0xFF00000000 | (a1 >> 8) & 0xFF000000 | (a1 >> 24) & 0xFF0000 | (a1 >> 40) & 0xFF00 | HIBYTE(a1);
}

uint64_t XXH32_hashFromCanonical(unsigned int *a1)
{
  return XXH_readBE32(a1);
}

uint64_t XXH_readBE32(unsigned int *a1)
{
  unsigned int v1;

  if (g_one)
  {
    v1 = XXH_read32(a1);
    return XXH_swap32(v1);
  }
  else
  {
    return XXH_read32(a1);
  }
}

uint64_t XXH64_hashFromCanonical(uint64_t a1)
{
  return XXH_readBE64(a1);
}

uint64_t XXH_readBE64(uint64_t a1)
{
  unint64_t v1;

  if (!g_one)
    return XXH_read64(a1);
  v1 = XXH_read64(a1);
  return XXH_swap64(v1);
}

uint64_t XXH_read32(unsigned int *a1)
{
  return *a1;
}

uint64_t XXH_read64(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t XXH_memcpy()
{
  return __memcpy_chk();
}

void sub_21CA8C910(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_21CA8F588(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_21CA8FBA0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 40) = a1;
  *(_DWORD *)(v9 - 44) = a2;
  objc_destroyWeak((id *)(v9 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 40));
}

void sub_21CA92230(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 64) = a1;
  *(_DWORD *)(v10 - 68) = a2;
  objc_destroyWeak((id *)(v10 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 64));
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void sub_21CA959D0(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_DWORD *)(v2 - 132) = a2;
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 128));
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_21CA96644(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(_DWORD *)(v2 - 108) = a2;
  _Block_object_dispose((const void *)(v2 - 88), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 104));
}

void sub_21CA98564(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 216) = a1;
  *(_DWORD *)(v2 - 220) = a2;
  _Block_object_dispose((const void *)(v2 - 136), 8);
  _Block_object_dispose((const void *)(v2 - 104), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 216));
}

id UIImageWithContentsOfFile(void *a1, char a2)
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v8;
  char v9;
  id location;
  id v11;
  dispatch_once_t *v12;

  location = 0;
  objc_storeStrong(&location, a1);
  v9 = a2 & 1;
  v12 = (dispatch_once_t *)&UIImageWithContentsOfFile_onceToken;
  v11 = 0;
  objc_storeStrong(&v11, &__block_literal_global_28_0);
  if (*v12 != -1)
    dispatch_once(v12, v11);
  objc_storeStrong(&v11, 0);
  v8 = 0;
  objc_msgSend((id)UIImageWithContentsOfFile_lock, "lock");
  if ((v9 & 1) != 0)
  {
    objc_msgSend((id)UIImageWithContentsOfFile_pathToWeakImageMap, "removeObjectForKey:", location);
  }
  else
  {
    v2 = (id)objc_msgSend((id)UIImageWithContentsOfFile_pathToWeakImageMap, "objectForKey:", location);
    v3 = v8;
    v8 = v2;

  }
  objc_msgSend((id)UIImageWithContentsOfFile_lock, "unlock");
  if (!v8)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD640]);
    v8 = (id)objc_msgSend(v4, "initWithContentsOfFile:", location);

    objc_msgSend((id)UIImageWithContentsOfFile_lock, "lock");
    objc_msgSend((id)UIImageWithContentsOfFile_pathToWeakImageMap, "setObject:forKey:", v8, location);
    objc_msgSend((id)UIImageWithContentsOfFile_lock, "unlock");
  }
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_21CA99B48()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t LoadCentralDirectoryRecord(uint64_t a1)
{
  void *v1;
  BOOL v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;

  v22 = a1;
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v8 = 0;
  v17 = zip64local_SearchCentralDir64(a1, *(_QWORD *)(a1 + 88));
  if (v17)
    v8 = 1;
  else
    v17 = zip64local_SearchCentralDir(v22, *(_QWORD *)(v22 + 88));
  if (v8)
  {
    v7 = 0;
    if (call_zseek64(v22, *(_QWORD *)(v22 + 88), v17, 0))
      v21 = -1;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    if (zip64local_getLong64(v22, *(_QWORD *)(v22 + 88), &v7))
      v21 = -1;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v11))
      v21 = -1;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v10))
      v21 = -1;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v15))
      v21 = -1;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v14))
      v21 = -1;
    if (zip64local_getLong64(v22, *(_QWORD *)(v22 + 88), &v13))
      v21 = -1;
    if (zip64local_getLong64(v22, *(_QWORD *)(v22 + 88), &v12))
      v21 = -1;
    if (v12 != v13 || v14 || v15)
      v21 = -103;
    if (zip64local_getLong64(v22, *(_QWORD *)(v22 + 88), &v19))
      v21 = -1;
    if (zip64local_getLong64(v22, *(_QWORD *)(v22 + 88), &v18))
      v21 = -1;
    v9 = 0;
  }
  else
  {
    if (call_zseek64(v22, *(_QWORD *)(v22 + 88), v17, 0))
      v21 = -1;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v15))
      v21 = -1;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v14))
      v21 = -1;
    v13 = 0;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    else
      v13 = v16;
    v12 = 0;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    else
      v12 = v16;
    if (v12 != v13 || v14 || v15)
      v21 = -103;
    v19 = 0;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    else
      v19 = v16;
    v18 = 0;
    if (zip64local_getLong(v22, *(_QWORD *)(v22 + 88), &v16))
      v21 = -1;
    else
      v18 = v16;
    if (zip64local_getShort(v22, *(_QWORD *)(v22 + 88), &v9))
      v21 = -1;
  }
  if (v17 < v18 + v19 && !v21)
    v21 = -103;
  if (v21)
  {
    (*(void (**)(_QWORD, _QWORD))(v22 + 40))(*(_QWORD *)(v22 + 56), *(_QWORD *)(v22 + 88));
    return -1;
  }
  else
  {
    if (v9)
    {
      v1 = malloc_type_malloc(v9 + 1, 0xFAC03D29uLL);
      *(_QWORD *)(v22 + 65944) = v1;
      if (*(_QWORD *)(v22 + 65944))
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v22 + 8))(*(_QWORD *)(v22 + 56), *(_QWORD *)(v22 + 88), *(_QWORD *)(v22 + 65944), v9);
        *(_BYTE *)(*(_QWORD *)(v22 + 65944) + v9) = 0;
      }
    }
    v20 = v17 - (v18 + v19);
    *(_QWORD *)(v22 + 65928) = v20;
    v6 = v19;
    v5 = malloc_type_malloc(0xFF0uLL, 0xFA61B2B4uLL);
    if (call_zseek64(v22, *(_QWORD *)(v22 + 88), v18 + v20, 0))
      v21 = -1;
    while (1)
    {
      v3 = 0;
      if (v6)
        v3 = v21 == 0;
      if (!v3)
        break;
      v4 = 4080;
      if (v6 < 0xFF0)
        v4 = v6;
      if ((*(uint64_t (**)(_QWORD, _QWORD, void *, unint64_t))(v22 + 8))(*(_QWORD *)(v22 + 56), *(_QWORD *)(v22 + 88), v5, v4) != v4)v21 = -1;
      if (!v21)
        v21 = add_data_in_datablock((_QWORD *)(v22 + 96), (uint64_t)v5, v4);
      v6 -= v4;
    }
    if (v5)
      free(v5);
    *(_QWORD *)(v22 + 65920) = v20;
    *(_QWORD *)(v22 + 65936) = v12;
    if (call_zseek64(v22, *(_QWORD *)(v22 + 88), v18 + v20, 0))
      return -1;
    return v21;
  }
}

uint64_t zip64local_SearchCentralDir64(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = a2;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0xFFFFLL;
  v9 = 0;
  v8 = 0;
  v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u))
    return 0;
  v12 = call_ztell64(v15, v14);
  if (v10 > v12)
    v10 = v12;
  v13 = malloc_type_malloc(0x404uLL, 0x92DC3A43uLL);
  if (!v13)
    return 0;
  v11 = 4;
  do
  {
    if (v11 >= v10)
      break;
    if (v11 + 1024 <= v10)
      v11 += 1024;
    else
      v11 = v10;
    v6 = v12 - v11;
    v4 = v11 <= 0x404 ? v11 : 1028;
    if (call_zseek64(v15, v14, v6, 0)
      || (*(uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))(v15 + 8))(*(_QWORD *)(v15 + 56), v14, v13, v4) != v4)
    {
      break;
    }
    v5 = v4 - 3;
    while (1)
    {
      v2 = v5--;
      if (v2 <= 0)
        break;
      if (v13[v5] == 80 && v13[v5 + 1] == 75 && v13[v5 + 2] == 6 && v13[v5 + 3] == 7)
      {
        v9 = v6 + v5;
        break;
      }
    }
  }
  while (!v9);
  free(v13);
  if (!v9)
    return 0;
  if (call_zseek64(v15, v14, v9, 0))
    return 0;
  if (zip64local_getLong(v15, v14, &v8))
    return 0;
  if (zip64local_getLong(v15, v14, &v8))
    return 0;
  if (v8)
    return 0;
  if (zip64local_getLong64(v15, v14, &v7))
    return 0;
  if (zip64local_getLong(v15, v14, &v8))
    return 0;
  if (v8 != 1)
    return 0;
  if (call_zseek64(v15, v14, v7, 0))
    return 0;
  if (zip64local_getLong(v15, v14, &v8))
    return 0;
  if (v8 == 101075792)
    return v7;
  return 0;
}

uint64_t zip64local_SearchCentralDir(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;

  v8 = 0xFFFFLL;
  v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u))
    return 0;
  v10 = call_ztell64(a1, a2);
  if (v10 < 0xFFFF)
    v8 = v10;
  v11 = malloc_type_malloc(0x404uLL, 0x9C088CCEuLL);
  if (!v11)
    return 0;
  v9 = 4;
  do
  {
    if (v9 >= v8)
      break;
    if (v9 + 1024 <= v8)
      v9 += 1024;
    else
      v9 = v8;
    v6 = v10 - v9;
    v4 = v9 <= 0x404 ? v9 : 1028;
    if (call_zseek64(a1, a2, v6, 0)
      || (*(uint64_t (**)(_QWORD, uint64_t, _BYTE *, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, v11, v4) != v4)
    {
      break;
    }
    v5 = v4 - 3;
    while (1)
    {
      v2 = v5--;
      if (v2 <= 0)
        break;
      if (v11[v5] == 80 && v11[v5 + 1] == 75 && v11[v5 + 2] == 5 && v11[v5 + 3] == 6)
      {
        v7 = v6 + v5;
        break;
      }
    }
  }
  while (!v7);
  free(v11);
  return v7;
}

uint64_t zip64local_getLong(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = zip64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 8;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 16;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 24;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t zip64local_getLong64(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = zip64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 8;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 16;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 24;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 32;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 40;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 48;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 56;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t zip64local_getShort(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int Byte;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  Byte = zip64local_getByte(a1, a2, &v5);
  v6 = v5;
  if (!Byte)
    Byte = zip64local_getByte(v9, v8, &v5);
  v6 += (uint64_t)v5 << 8;
  if (Byte)
    *v7 = 0;
  else
    *v7 = v6;
  return Byte;
}

uint64_t add_data_in_datablock(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  _QWORD *new_datablock;
  uint64_t v5;
  unsigned int i;
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;

  if (a1)
  {
    if (a1[1] || (new_datablock = allocate_new_datablock(), a1[1] = new_datablock, (*a1 = new_datablock) != 0))
    {
      v9 = (_QWORD *)a1[1];
      v8 = a2;
      while (a3)
      {
        if (!v9[1])
        {
          *v9 = allocate_new_datablock();
          if (!*v9)
            return -104;
          v9 = (_QWORD *)*v9;
          a1[1] = v9;
        }
        if (v9[1] >= a3)
          v7 = a3;
        else
          v7 = v9[1];
        v5 = (uint64_t)v9 + v9[2] + 32;
        for (i = 0; i < v7; ++i)
          *(_BYTE *)(v5 + i) = *(_BYTE *)(v8 + i);
        v9[2] += v7;
        v9[1] -= v7;
        v8 += v7;
        a3 -= v7;
      }
      return 0;
    }
    else
    {
      return -104;
    }
  }
  else
  {
    return -104;
  }
}

void *zipOpen3()
{
  uint64_t v0;
  int v1;
  FILE *(**v2)(uint64_t, const char *, char);
  void *v3;
  unsigned int v4;
  int CentralDirectoryRecord;
  void *v7;
  void *__src;
  FILE *(**v9)(uint64_t, const char *, char);
  int v10;
  uint64_t v11;
  FILE *(*__dst[8245])(uint64_t, const char *, char);

  v0 = MEMORY[0x24BDAC7A8]();
  __dst[8244] = *(FILE *(**)(uint64_t, const char *, char))MEMORY[0x24BDAC8D0];
  v11 = v0;
  v10 = v1;
  v9 = v2;
  __src = v3;
  bzero(__dst, 0x200uLL);
  CentralDirectoryRecord = 0;
  __dst[10] = 0;
  __dst[9] = 0;
  if (__src)
    memcpy(__dst, __src, 0x58uLL);
  else
    fill_fopen64_filefunc(__dst);
  if (v10)
    v4 = 7;
  else
    v4 = 11;
  __dst[11] = (FILE *(*)(uint64_t, const char *, char))call_zopen64((uint64_t)__dst, v11, v4);
  if (!__dst[11])
    return 0;
  if (v10 == 1)
    call_zseek64((uint64_t)__dst, (uint64_t)__dst[11], 0, 2u);
  __dst[8240] = (FILE *(*)(uint64_t, const char *, char))call_ztell64((uint64_t)__dst, (uint64_t)__dst[11]);
  LODWORD(__dst[14]) = 0;
  LODWORD(__dst[29]) = 0;
  __dst[8242] = 0;
  __dst[8241] = 0;
  init_linkedlist(&__dst[12]);
  v7 = malloc_type_malloc(0x101A0uLL, 0x10F0040857F4A3AuLL);
  if (v7)
  {
    __dst[8243] = 0;
    if (v10 == 2)
      CentralDirectoryRecord = LoadCentralDirectoryRecord((uint64_t)__dst);
    if (v9)
      *v9 = __dst[8243];
    if (CentralDirectoryRecord)
    {
      if (__dst[8243])
        free(__dst[8243]);
      free(v7);
      return 0;
    }
    else
    {
      memcpy(v7, __dst, 0x101A0uLL);
      return v7;
    }
  }
  else
  {
    ((void (*)(FILE *(*)(uint64_t, const char *, char), FILE *(*)(uint64_t, const char *, char)))__dst[5])(__dst[7], __dst[11]);
    return 0;
  }
}

_QWORD *init_linkedlist(_QWORD *result)
{
  result[1] = 0;
  *result = 0;
  return result;
}

void *zipOpen2(uint64_t a1, int a2, uint64_t a3, _QWORD *a4)
{
  _QWORD __b[11];
  _QWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  if (!a4)
    return zipOpen3();
  memset(__b, 0, sizeof(__b));
  fill_zlib_filefunc64_32_def_from_filefunc32(__b, v6);
  return zipOpen3();
}

void *zipOpen2_64(uint64_t a1, int a2, uint64_t a3, const void *a4)
{
  _QWORD __b[11];
  const void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  if (!a4)
    return zipOpen3();
  memset(__b, 0, sizeof(__b));
  memcpy(__b, v6, 0x40uLL);
  __b[9] = 0;
  __b[10] = 0;
  return zipOpen3();
}

void *zipOpen()
{
  return zipOpen3();
}

void *zipOpen64()
{
  return zipOpen3();
}

uint64_t Write_LocalFileHeader(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  v6 = strlen(a2);
  v5 = a3;
  v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0x4034B50uLL, 4);
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852))
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0x2DuLL, 2);
    else
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0x14uLL, 2);
  }
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 280), 2);
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), *(int *)(a1 + 288), 2);
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 65832), 4);
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 4);
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852))
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0xFFFFFFFFuLL, 4);
    else
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 4);
  }
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852))
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0xFFFFFFFFuLL, 4);
    else
      v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 4);
  }
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v6, 2);
  if (*(_DWORD *)(a1 + 65852))
    v5 = a3 + 20;
  if (!v7)
    v7 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v5, 2);
  if (!v7
    && v6
    && (*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), a2, v6) != v6)
  {
    v7 = -1;
  }
  if (!v7
    && a3
    && (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), a4, a3) != a3)
  {
    v7 = -1;
  }
  if (!v7 && *(_DWORD *)(a1 + 65852))
  {
    *(_QWORD *)(a1 + 65856) = call_ztell64(a1, *(_QWORD *)(a1 + 88));
    zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 1uLL, 2);
    zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0x10uLL, 2);
    zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 8);
    return zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 8);
  }
  return v7;
}

uint64_t zip64local_putValue(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  int i;
  int j;
  _BYTE v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  for (i = 0; i < a4; ++i)
  {
    v9[i] = a3;
    a3 >>= 8;
  }
  if (a3)
  {
    for (j = 0; j < a4; ++j)
      v9[j] = -1;
  }
  if ((*(uint64_t (**)(_QWORD, uint64_t, _BYTE *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), a2, v9, a4) == a4)
    return 0;
  else
    return -1;
}

uint64_t zipOpenNewFileInZip4_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, unint64_t a17, uint64_t a18, int a19)
{
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int i;
  unsigned int j;
  unsigned int k;
  unsigned int v26;
  unsigned int v27;
  int windowBits;
  _BYTE v38[12];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  windowBits = a12;
  if (a1)
  {
    if (!a9 || a9 == 8)
    {
      if (*(_DWORD *)(a1 + 112) == 1 && (v21 = zipCloseFileInZip(a1)) != 0)
      {
        return v21;
      }
      else
      {
        if (!a2)
          a2 = "-";
        if (a8)
          v26 = strlen(a8);
        else
          v26 = 0;
        v27 = strlen(a2);
        if (a3)
        {
          if (*(_QWORD *)(a3 + 24))
            *(_QWORD *)(a1 + 65832) = *(_QWORD *)(a3 + 24);
          else
            *(_QWORD *)(a1 + 65832) = zip64local_TmzDateToDosDate((_DWORD *)a3);
        }
        else
        {
          *(_QWORD *)(a1 + 65832) = 0;
        }
        *(_QWORD *)(a1 + 280) = a18;
        if (a10 == 8 || a10 == 9)
          *(_QWORD *)(a1 + 280) |= 2uLL;
        if (a10 == 2)
          *(_QWORD *)(a1 + 280) |= 4uLL;
        if (a10 == 1)
          *(_QWORD *)(a1 + 280) |= 6uLL;
        if (a15)
          *(_QWORD *)(a1 + 280) |= 1uLL;
        *(_QWORD *)(a1 + 65840) = 0;
        *(_DWORD *)(a1 + 288) = a9;
        *(_DWORD *)(a1 + 65848) = 0;
        *(_DWORD *)(a1 + 232) = 0;
        *(_DWORD *)(a1 + 236) = 0;
        *(_DWORD *)(a1 + 292) = a11;
        *(_QWORD *)(a1 + 240) = call_ztell64(a1, *(_QWORD *)(a1 + 88));
        *(_QWORD *)(a1 + 264) = v27 + 46 + a7 + v26;
        *(_QWORD *)(a1 + 272) = 32;
        *(_QWORD *)(a1 + 248) = malloc_type_malloc(*(_QWORD *)(a1 + 272) + *(_QWORD *)(a1 + 264), 0x5C9031E2uLL);
        *(_QWORD *)(a1 + 256) = a7;
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248), 0x2014B50uLL, 4);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 4, a17, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 6, 0x14uLL, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 8, *(_QWORD *)(a1 + 280), 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 10, *(int *)(a1 + 288), 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 12, *(_QWORD *)(a1 + 65832), 4);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 16, 0, 4);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 20, 0, 4);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 24, 0, 4);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 28, v27, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 30, a7, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 32, v26, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 34, 0, 2);
        if (a3)
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 36, *(_QWORD *)(a3 + 32), 2);
        else
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 36, 0, 2);
        if (a3)
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 38, *(_QWORD *)(a3 + 40), 4);
        else
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 38, 0, 4);
        if (*(_QWORD *)(a1 + 240) < 0xFFFFFFFFuLL)
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 42, *(_QWORD *)(a1 + 240) - *(_QWORD *)(a1 + 65928), 4);
        else
          zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 42, 0xFFFFFFFFuLL, 4);
        for (i = 0; i < v27; ++i)
          *(_BYTE *)(*(_QWORD *)(a1 + 248) + 46 + i) = a2[i];
        for (j = 0; j < a7; ++j)
          *(_BYTE *)(*(_QWORD *)(a1 + 248) + 46 + v27 + j) = *(_BYTE *)(a6 + j);
        for (k = 0; k < v26; ++k)
          *(_BYTE *)(*(_QWORD *)(a1 + 248) + 46 + v27 + a7 + k) = a8[k];
        if (*(_QWORD *)(a1 + 248))
        {
          *(_DWORD *)(a1 + 65852) = a19;
          *(_QWORD *)(a1 + 65864) = 0;
          *(_QWORD *)(a1 + 65872) = 0;
          *(_QWORD *)(a1 + 65856) = 0;
          v22 = Write_LocalFileHeader(a1, a2, a5, a4);
          *(_DWORD *)(a1 + 128) = 0;
          *(_DWORD *)(a1 + 152) = 0x10000;
          *(_QWORD *)(a1 + 144) = a1 + 296;
          *(_QWORD *)(a1 + 136) = 0;
          *(_QWORD *)(a1 + 160) = 0;
          *(_DWORD *)(a1 + 208) = 0;
          if (!v22 && *(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292) && *(_DWORD *)(a1 + 288) == 8)
          {
            *(_QWORD *)(a1 + 184) = 0;
            *(_QWORD *)(a1 + 192) = 0;
            *(_QWORD *)(a1 + 200) = 0;
            if (a12 > 0)
              windowBits = -a12;
            v22 = deflateInit2_((z_streamp)(a1 + 120), a10, 8, windowBits, a13, a14, "1.2.12", 112);
            if (!v22)
              *(_DWORD *)(a1 + 232) = 8;
          }
          *(_DWORD *)(a1 + 65912) = 0;
          if (!v22)
          {
            if (a15)
            {
              *(_DWORD *)(a1 + 65848) = 1;
              *(_QWORD *)(a1 + 65904) = get_crc_table();
              v20 = crypthead(a15, (uint64_t)v38, 12, (_QWORD *)(a1 + 65880), *(_QWORD *)(a1 + 65904), a16);
              *(_DWORD *)(a1 + 65912) = v20;
              if ((*(uint64_t (**)(_QWORD, _QWORD, _BYTE *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), v38, v20) != v20)v22 = -1;
            }
          }
          if (!v22)
            *(_DWORD *)(a1 + 112) = 1;
          return v22;
        }
        else
        {
          return -104;
        }
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t zipCloseFileInZip(uint64_t a1)
{
  return zipCloseFileInZipRaw(a1, 0, 0);
}

unint64_t zip64local_TmzDateToDosDate(_DWORD *a1)
{
  unint64_t v2;

  v2 = a1[5];
  if (v2 < 0x7BC)
  {
    if (v2 >= 0x50)
      v2 -= 80;
  }
  else
  {
    v2 -= 1980;
  }
  return (*a1 / 2u + 32 * a1[1] + ((unint64_t)a1[2] << 11)) | (((a1[3]
                                                                                                  + 32 * (a1[4] + 1))
                                                                                   + (v2 << 9)) << 16);
}

uint64_t zip64local_putValue_inmemory(uint64_t result, unint64_t a2, int a3)
{
  int i;
  int j;

  for (i = 0; i < a3; ++i)
  {
    *(_BYTE *)(result + i) = a2;
    a2 >>= 8;
  }
  if (a2)
  {
    for (j = 0; j < a3; ++j)
      *(_BYTE *)(result + j) = -1;
  }
  return result;
}

uint64_t crypthead(uint64_t a1, uint64_t a2, int a3, _QWORD *a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  unsigned int v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int i;
  int j;
  int v16;
  __int16 v17;
  _BYTE v23[10];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = HIWORD(a6);
  if (a3 >= 12)
  {
    if (++crypthead_calls == 1)
    {
      v6 = time(0);
      srand(v6 ^ 0xBB40E64E);
    }
    init_keys_0(a1, a4, a5);
    for (i = 0; i < 10; ++i)
    {
      v9 = (rand() >> 7);
      v10 = decrypt_byte_0((uint64_t)a4);
      update_keys_0(a4, a5, v9);
      v23[i] = v10 ^ v9;
    }
    init_keys_0(a1, a4, a5);
    for (j = 0; j < 10; ++j)
    {
      v11 = decrypt_byte_0((uint64_t)a4);
      update_keys_0(a4, a5, v23[j]);
      *(_BYTE *)(a2 + j) = v11 ^ v23[j];
    }
    v12 = decrypt_byte_0((uint64_t)a4);
    update_keys_0(a4, a5, v17);
    v7 = j;
    v16 = j + 1;
    *(_BYTE *)(a2 + v7) = v12 ^ v17;
    v13 = decrypt_byte_0((uint64_t)a4);
    update_keys_0(a4, a5, HIBYTE(v17));
    *(_BYTE *)(a2 + v16) = v13 ^ HIBYTE(v17);
    return (v16 + 1);
  }
  else
  {
    return 0;
  }
}

uint64_t zipOpenNewFileInZip4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, unint64_t a17, uint64_t a18)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, 0);
}

uint64_t zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip3_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, int a17, int a18)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0, 0, a18);
}

uint64_t zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip2_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0, a12);
}

uint64_t zipOpenNewFileInZip64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0, a11);
}

uint64_t zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0, 0);
}

uint64_t zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  BOOL v4;
  unsigned int i;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v8 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112))
    {
      *(_QWORD *)(a1 + 65840) = crc32(*(_QWORD *)(a1 + 65840), a2, a3);
      *(_QWORD *)(a1 + 120) = a2;
      *(_DWORD *)(a1 + 128) = a3;
      while (1)
      {
        v4 = 0;
        if (!v8)
          v4 = *(_DWORD *)(a1 + 128) != 0;
        if (!v4)
          break;
        if (!*(_DWORD *)(a1 + 152))
        {
          if (zip64FlushWriteBuffer(a1) == -1)
            v8 = -1;
          *(_DWORD *)(a1 + 152) = 0x10000;
          *(_QWORD *)(a1 + 144) = a1 + 296;
        }
        if (v8)
          break;
        if (*(_DWORD *)(a1 + 288) != 8 || *(_DWORD *)(a1 + 292))
        {
          if (*(_DWORD *)(a1 + 128) >= *(_DWORD *)(a1 + 152))
            v6 = *(_DWORD *)(a1 + 152);
          else
            v6 = *(_DWORD *)(a1 + 128);
          for (i = 0; i < v6; ++i)
            *(_BYTE *)(*(_QWORD *)(a1 + 144) + i) = *(_BYTE *)(*(_QWORD *)(a1 + 120) + i);
          *(_DWORD *)(a1 + 128) -= v6;
          *(_DWORD *)(a1 + 152) -= v6;
          *(_QWORD *)(a1 + 120) += v6;
          *(_QWORD *)(a1 + 144) += v6;
          *(_QWORD *)(a1 + 136) += v6;
          *(_QWORD *)(a1 + 160) += v6;
          *(_DWORD *)(a1 + 236) += v6;
        }
        else
        {
          v7 = *(_QWORD *)(a1 + 160);
          v8 = deflate((z_streamp)(a1 + 120), 0);
          *(_DWORD *)(a1 + 236) += *(_QWORD *)(a1 + 160) - v7;
        }
      }
      return v8;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t zip64FlushWriteBuffer(uint64_t a1)
{
  char v2;
  unsigned int i;
  unsigned int v4;

  v4 = 0;
  if (*(_DWORD *)(a1 + 65848))
  {
    for (i = 0; i < *(_DWORD *)(a1 + 236); ++i)
    {
      v2 = decrypt_byte_0(a1 + 65880);
      update_keys_0((_QWORD *)(a1 + 65880), *(_QWORD *)(a1 + 65904), *(unsigned __int8 *)(a1 + 296 + i));
      *(_BYTE *)(a1 + 296 + i) ^= v2;
    }
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), a1 + 296, *(unsigned int *)(a1 + 236)) != *(_DWORD *)(a1 + 236))v4 = -1;
  *(_QWORD *)(a1 + 65864) += *(unsigned int *)(a1 + 236);
  *(_QWORD *)(a1 + 65872) += *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 236) = 0;
  return v4;
}

uint64_t zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return zipCloseFileInZipRaw64(a1, a2, a3);
}

uint64_t zipCloseFileInZipRaw64(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  __int16 v10;
  unint64_t v11;

  v10 = 0;
  v9 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112))
    {
      *(_DWORD *)(a1 + 128) = 0;
      if (*(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292))
      {
        while (!v9)
        {
          if (!*(_DWORD *)(a1 + 152))
          {
            zip64FlushWriteBuffer(a1);
            *(_DWORD *)(a1 + 152) = 0x10000;
            *(_QWORD *)(a1 + 144) = a1 + 296;
          }
          v8 = *(_QWORD *)(a1 + 160);
          v9 = deflate((z_streamp)(a1 + 120), 4);
          *(_DWORD *)(a1 + 236) += *(_QWORD *)(a1 + 160) - v8;
        }
      }
      if (v9 == 1)
        v9 = 0;
      if (*(_DWORD *)(a1 + 236) && !v9 && zip64FlushWriteBuffer(a1) == -1)
        v9 = -1;
      if (*(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292))
      {
        v7 = deflateEnd((z_streamp)(a1 + 120));
        if (!v9)
          v9 = v7;
        *(_DWORD *)(a1 + 232) = 0;
      }
      if (!*(_DWORD *)(a1 + 292))
      {
        a3 = *(_QWORD *)(a1 + 65840);
        a2 = *(_QWORD *)(a1 + 65872);
      }
      v11 = *(_QWORD *)(a1 + 65864) + *(int *)(a1 + 65912);
      if (v11 >= 0xFFFFFFFF || a2 >= 0xFFFFFFFF || *(_QWORD *)(a1 + 240) >= 0xFFFFFFFFuLL)
      {
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 4, 0x2DuLL, 2);
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 6, 0x2DuLL, 2);
      }
      zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 16, a3, 4);
      if (v11 < 0xFFFFFFFF)
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 20, v11, 4);
      else
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 20, 0xFFFFFFFFuLL, 4);
      if (*(_DWORD *)(a1 + 208) == 1)
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 36, 1uLL, 2);
      if (a2 < 0xFFFFFFFF)
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 24, a2, 4);
      else
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 24, 0xFFFFFFFFuLL, 4);
      if (a2 >= 0xFFFFFFFF)
        v10 = 8;
      if (v11 >= 0xFFFFFFFF)
        v10 += 8;
      if (*(_QWORD *)(a1 + 240) >= 0xFFFFFFFFuLL)
        v10 += 8;
      if (v10 > 0)
      {
        if ((unint64_t)(v10 + 4) > *(_QWORD *)(a1 + 272))
          return -103;
        v5 = *(_QWORD *)(a1 + 248) + *(_QWORD *)(a1 + 264);
        zip64local_putValue_inmemory(v5, 1uLL, 2);
        v5 += 2;
        zip64local_putValue_inmemory(v5, v10, 2);
        v6 = v5 + 2;
        if (a2 >= 0xFFFFFFFF)
        {
          zip64local_putValue_inmemory(v6, a2, 8);
          v6 += 8;
        }
        if (v11 >= 0xFFFFFFFF)
        {
          zip64local_putValue_inmemory(v6, v11, 8);
          v6 += 8;
        }
        if (*(_QWORD *)(a1 + 240) >= 0xFFFFFFFFuLL)
          zip64local_putValue_inmemory(v6, *(_QWORD *)(a1 + 240), 8);
        *(_QWORD *)(a1 + 272) -= v10 + 4;
        *(_QWORD *)(a1 + 264) += v10 + 4;
        *(_QWORD *)(a1 + 256) += v10 + 4;
        zip64local_putValue_inmemory(*(_QWORD *)(a1 + 248) + 30, *(_QWORD *)(a1 + 256), 2);
      }
      if (!v9)
        v9 = add_data_in_datablock((_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 264));
      free(*(void **)(a1 + 248));
      if (!v9)
      {
        v4 = call_ztell64(a1, *(_QWORD *)(a1 + 88));
        if (call_zseek64(a1, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 240) + 14, 0))
          v9 = -1;
        if (!v9)
          v9 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), a3, 4);
        if (a2 < 0xFFFFFFFF)
        {
          if (!v9)
            v9 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v11, 4);
          if (!v9)
            v9 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), a2, 4);
        }
        else if (*(_QWORD *)(a1 + 65856))
        {
          if (call_zseek64(a1, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 65856) + 4, 0))
            v9 = -1;
          if (!v9)
            v9 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), a2, 8);
          if (!v9)
            v9 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v11, 8);
        }
        if (call_zseek64(a1, *(_QWORD *)(a1 + 88), v4, 0))
          v9 = -1;
      }
      ++*(_QWORD *)(a1 + 65936);
      *(_DWORD *)(a1 + 112) = 0;
      return v9;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t Write_Zip64EndOfCentralDirectoryLocator(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unsigned int v4;

  v3 = a2 - *(_QWORD *)(a1 + 65928);
  v4 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0x7064B50uLL, 4);
  if (!v4)
    v4 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 0, 4);
  if (!v4)
    v4 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v3, 8);
  if (!v4)
    return zip64local_putValue(a1, *(_QWORD *)(a1 + 88), 1uLL, 4);
  return v4;
}

uint64_t Write_Zip64EndOfCentralDirectoryRecord(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unsigned int v4;

  v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x6064B50uLL, 4);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2CuLL, 8);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2DuLL, 2);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2DuLL, 2);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 4);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 4);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 8);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 8);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], a2, 8);
  if (!v4)
    return zip64local_putValue((uint64_t)a1, a1[11], a3 - a1[8241], 8);
  return v4;
}

uint64_t Write_EndOfCentralDirectoryRecord(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unsigned int v4;

  v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x6054B50uLL, 4);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 2);
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 2);
  if (!v4)
  {
    if (a1[8242] < 0xFFFFuLL)
      v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 2);
    else
      v4 = zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFuLL, 2);
  }
  if (!v4)
  {
    if (a1[8242] < 0xFFFFuLL)
      v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 2);
    else
      v4 = zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFuLL, 2);
  }
  if (!v4)
    v4 = zip64local_putValue((uint64_t)a1, a1[11], a2, 4);
  if (!v4)
  {
    if ((unint64_t)(a3 - a1[8241]) < 0xFFFFFFFF)
      return zip64local_putValue((uint64_t)a1, a1[11], a3 - a1[8241], 4);
    else
      return zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFFFFFuLL, 4);
  }
  return v4;
}

uint64_t Write_GlobalComment(uint64_t a1, const char *a2)
{
  unsigned int v3;
  unsigned int v4;

  v3 = 0;
  if (a2)
    v3 = strlen(a2);
  v4 = zip64local_putValue(a1, *(_QWORD *)(a1 + 88), v3, 2);
  if (!v4
    && v3
    && (*(uint64_t (**)(_QWORD, _QWORD, const char *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), a2, v3) != v3)
  {
    return -1;
  }
  return v4;
}

uint64_t zipClose(uint64_t a1, const char *a2)
{
  uint64_t v3;
  _QWORD *i;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;

  v7 = 0;
  v6 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112) == 1)
      v7 = zipCloseFileInZip(a1);
    if (!a2)
      a2 = *(const char **)(a1 + 65944);
    v5 = call_ztell64(a1, *(_QWORD *)(a1 + 88));
    if (!v7)
    {
      for (i = *(_QWORD **)(a1 + 96); i; i = (_QWORD *)*i)
      {
        if (!v7
          && i[2]
          && (*(uint64_t (**)(_QWORD, _QWORD, _QWORD *, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), i + 4, i[2]) != i[2])
        {
          v7 = -1;
        }
        v6 += i[2];
      }
    }
    free_linkedlist(a1 + 96);
    if ((unint64_t)(v5 - *(_QWORD *)(a1 + 65928)) >= 0xFFFFFFFF)
    {
      v3 = call_ztell64(a1, *(_QWORD *)(a1 + 88));
      Write_Zip64EndOfCentralDirectoryRecord((_QWORD *)a1, v6, v5);
      Write_Zip64EndOfCentralDirectoryLocator(a1, v3);
    }
    if (!v7)
      v7 = Write_EndOfCentralDirectoryRecord((_QWORD *)a1, v6, v5);
    if (!v7)
      v7 = Write_GlobalComment(a1, a2);
    if ((*(unsigned int (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88)) && !v7)
      v7 = -1;
    if (*(_QWORD *)(a1 + 65944))
      free(*(void **)(a1 + 65944));
    if (a1)
      free((void *)a1);
    return v7;
  }
  else
  {
    return -102;
  }
}

void free_linkedlist(uint64_t a1)
{
  free_datablock(*(_QWORD **)a1);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = 0;
}

uint64_t zipRemoveExtraInfoBlock(__int16 *a1, int *a2, __int16 a3)
{
  unsigned int v4;
  __int16 v5;
  void *v6;
  int v7;
  __int16 *v8;

  v8 = a1;
  v7 = 0;
  if (a1 && *a2 >= 4)
  {
    v6 = malloc_type_malloc(*a2, 0x90F11DE4uLL);
    while (v8 < (__int16 *)((char *)a1 + *a2))
    {
      v5 = v8[1];
      if (*v8 == a3)
      {
        v8 = (__int16 *)((char *)v8 + v5 + 4);
      }
      else
      {
        __memcpy_chk();
        v8 = (__int16 *)((char *)v8 + v5 + 4);
        v7 += v5 + 4;
      }
    }
    if (v7 >= *a2)
    {
      v4 = -1;
    }
    else
    {
      __memset_chk();
      if (v7 > 0)
        __memcpy_chk();
      *a2 = v7;
      v4 = 0;
    }
    if (v6)
      free(v6);
    return v4;
  }
  else
  {
    return -102;
  }
}

uint64_t zip64local_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned __int8 v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2;
  v5 = a3;
  v4 = 0;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v4, 1) == 1)
  {
    *v5 = v4;
    return 0;
  }
  else if ((*(unsigned int (**)(_QWORD, uint64_t))(v7 + 48))(*(_QWORD *)(v7 + 56), v6))
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

_QWORD *allocate_new_datablock()
{
  _QWORD *v1;

  v1 = malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
  if (v1)
  {
    *v1 = 0;
    v1[2] = 0;
    v1[1] = 4080;
  }
  return v1;
}

uint64_t init_keys_0(uint64_t result, _QWORD *a2, uint64_t a3)
{
  _BYTE *v5;

  v5 = (_BYTE *)result;
  *a2 = 305419896;
  a2[1] = 591751049;
  a2[2] = 878082192;
  while (*v5)
    result = update_keys_0(a2, a3, (char)*v5++);
  return result;
}

uint64_t decrypt_byte_0(uint64_t a1)
{
  return ((unsigned __int16)((*(_QWORD *)(a1 + 16) | 2) * ((*(_QWORD *)(a1 + 16) | 2) ^ 1)) >> 8);
}

uint64_t update_keys_0(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  *a1 = *(_QWORD *)(a2 + 8 * (*a1 ^ a3)) ^ (*a1 >> 8);
  a1[1] += *(unsigned __int8 *)a1;
  a1[1] = 134775813 * a1[1] + 1;
  a1[2] = *(_QWORD *)(a2 + 8 * (a1[2] ^ BYTE3(a1[1]))) ^ (a1[2] >> 8);
  return a3;
}

void free_datablock(_QWORD *a1)
{
  _QWORD *v1;

  while (a1)
  {
    v1 = (_QWORD *)*a1;
    free(a1);
    a1 = v1;
  }
}

void sub_21CAA2580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  uint64_t v24;

  objc_destroyWeak(&a24);
  objc_destroyWeak((id *)(v24 - 40));
  _Unwind_Resume(a1);
}

void sub_21CAA3580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object)
{
  uint64_t v17;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_21CAA36AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object)
{
  uint64_t v17;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_21CAA38CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  uint64_t v24;

  objc_destroyWeak(&a24);
  objc_destroyWeak((id *)(v24 - 40));
  _Unwind_Resume(a1);
}

void sub_21CAA492C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 32));
  _Unwind_Resume(a1);
}

void sub_21CAA4AD0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  *(_QWORD *)(v12 - 40) = a1;
  *(_DWORD *)(v12 - 44) = a2;
  objc_destroyWeak((id *)(v12 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 40));
}

void sub_21CAA4C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t Data.init(hexString:)(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v13 = 0;
  v14 = 0;
  sub_21CAC5ACC();
  v12 = sub_21CAC5B74();
  while (1)
  {
    MEMORY[0x2207865D8](a1, a2);
    if ((sub_21CAC5BB0() & 1) == 0)
      break;
    MEMORY[0x2207865D8](a1, a2);
    v9 = sub_21CAC5BBC();
    if ((v2 & 1) != 0)
    {
      if ((unint64_t)sub_21CAC5BC8() >> 14 < v12 >> 14)
      {
        sub_21CAC5DA8();
        __break(1u);
      }
      v4 = sub_21CAC5BF8();
      MEMORY[0x2207865E4](v4);
      swift_bridgeObjectRelease();
      sub_21CAC5B80();
      sub_21CAAC7A0();
      sub_21CAAC808();
      sub_21CAAC870();
      sub_21CAC5C04();
      sub_21CAC5C34();
      v12 = sub_21CAC5BC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v9 >> 14 < v12 >> 14)
      {
        sub_21CAC5DA8();
        __break(1u);
      }
      v3 = sub_21CAC5BF8();
      MEMORY[0x2207865E4](v3);
      swift_bridgeObjectRelease();
      sub_21CAC5B80();
      sub_21CAAC7A0();
      sub_21CAAC808();
      sub_21CAAC870();
      sub_21CAC5C04();
      sub_21CAC5C34();
      v12 = v9;
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  v8 = sub_21CAC58BC();
  v7 = v5;
  sub_21CAAC5B8(v8, v5);
  v13 = v8;
  v14 = v7;
  sub_21CAAC640();
  swift_bridgeObjectRelease();
  sub_21CAAC668((uint64_t)&v13);
  return v8;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x220786F74]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

unint64_t sub_21CAAC4D4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CDF70;
  if (!qword_2552CDF70)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552CDF68);
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CDF70);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x220786F80](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_21CAAC5B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_retain();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAC640()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAC668(uint64_t a1)
{
  sub_21CAAC698(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_21CAAC698(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_21CAAC720@<X0>(const char *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result;

  result = strtoul(a1, 0, 16);
  *a2 = result;
  return result;
}

unint64_t sub_21CAAC760@<X0>(const char *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result;

  result = strtoul(a1, 0, 16);
  *a2 = result;
  return result;
}

unint64_t sub_21CAAC7A0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDF78;
  if (!qword_2552CDF78)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(v0, (unint64_t *)&qword_2552CDF78);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAAC808()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDF80;
  if (!qword_2552CDF80)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BEE4288], MEMORY[0x24BEE4260]);
    atomic_store(v0, (unint64_t *)&qword_2552CDF80);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAAC870()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDF88;
  if (!qword_2552CDF88)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BEE1EC0], MEMORY[0x24BEE1E88]);
    atomic_store(v0, (unint64_t *)&qword_2552CDF88);
    return v0;
  }
  return v2;
}

Swift::String_optional __swiftcall Data.toHexString()()
{
  unint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  Swift::String_optional result;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_21CAAD2E8();
  sub_21CAACAFC((void (*)(char *, char *))sub_21CAAC9E0, 0, MEMORY[0x24BDCDDE8], MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v0, MEMORY[0x24BEE40A8], v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF98);
  sub_21CAAD3F0();
  sub_21CAAD350();
  v6 = sub_21CAC5B14();
  v5 = v1;
  swift_bridgeObjectRelease();
  sub_21CAAD460();
  v2 = v5;
  v3 = v6;
  result.value._object = v2;
  result.value._countAndFlagsBits = v3;
  return result;
}

uint64_t sub_21CAAC9E0@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a1;
  sub_21CAC5B98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDFA8);
  sub_21CAC5E14();
  *(_QWORD *)(v2 + 24) = MEMORY[0x24BEE4260];
  *(_QWORD *)(v2 + 32) = MEMORY[0x24BEE42B0];
  *(_BYTE *)v2 = v5;
  sub_21CAACABC();
  v6 = sub_21CAC5B44();
  v7 = v3;
  swift_bridgeObjectRelease();
  result = v6;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAACABC()
{
  sub_21CAC5C40();
  sub_21CAAD4B0();
}

uint64_t sub_21CAACAFC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t result;
  uint64_t v20;
  _QWORD v21[2];
  void (*v22)(char *, _QWORD);
  char *v23;
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
  uint64_t i;
  uint64_t v35;
  void (*v36)(char *, char *);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t AssociatedTypeWitness;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v36 = a1;
  v37 = a2;
  v59 = a3;
  v50 = a4;
  v38 = a5;
  v58 = a6;
  v40 = a8;
  v41 = "Fatal error";
  v42 = "Index out of bounds";
  v43 = "Swift/Collection.swift";
  v44 = "Range requires lowerBound <= upperBound";
  v45 = "Swift/Range.swift";
  v46 = "Index out of range";
  v73 = a3;
  v72 = a4;
  v71 = a5;
  v47 = *(_QWORD *)(a5 - 8);
  v48 = (*(_QWORD *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)v21 - v48;
  v51 = 0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v53 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v54 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x24BDAC7A8](v51, v58, v59, v50);
  v55 = (char *)v21 - v54;
  v56 = (*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8, v10, v11, v9);
  v57 = (char *)v21 - v56;
  v60 = swift_getAssociatedTypeWitness();
  v61 = *(_QWORD *)(v60 - 8);
  v62 = (*(_QWORD *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = MEMORY[0x24BDAC7A8](v59, v58, v12, v13);
  v63 = (char *)v21 - v62;
  v64 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v14, v16, (char *)v21 - v62, v17);
  v65 = (char *)v21 - v64;
  v66 = sub_21CAC5C64();
  if (v66)
  {
    v70 = sub_21CAC5D90();
    v35 = sub_21CAC5D9C();
    sub_21CAC5D78();
    result = sub_21CAC5C58();
    if (v66 >= 0)
    {
      v33 = 0;
      for (i = v39; ; i = v24)
      {
        v31 = i;
        v32 = v33;
        if (v33 == v66)
          goto LABEL_17;
        if (v32 < 0 || v32 >= v66)
          goto LABEL_16;
        v68 = v32;
        if (v66 < 0)
          goto LABEL_15;
        if (v32 >= v66)
          break;
        v30 = v32 + 1;
        if (__OFADD__(v32, 1))
        {
          __break(1u);
          return result;
        }
        v69 = 0;
        v29 = v30;
LABEL_18:
        v28 = v29;
        if ((v69 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v63, v65, v60);
          sub_21CAC5D60();
          (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v60);
          v25 = v70;
          swift_retain();
          swift_release();
          v26 = v25;
          v27 = v31;
          return v26;
        }
        v23 = &v67;
        v22 = (void (*)(char *, _QWORD))sub_21CAC5C88();
        (*(void (**)(char *))(v53 + 16))(v55);
        v22(v23, 0);
        v20 = v31;
        v36(v55, v49);
        v24 = v20;
        if (v20)
        {
          (*(void (**)(char *, uint64_t))(v53 + 8))(v55, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v61 + 8))(v65, v60);
          sub_21CAAD488();
          (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v40, v49, v38);
          return v21[1];
        }
        (*(void (**)(char *, uint64_t))(v53 + 8))(v55, AssociatedTypeWitness);
        sub_21CAC5D84();
        sub_21CAC5C70();
        result = v24;
        v33 = v28;
      }
      sub_21CAC5DA8();
      __break(1u);
LABEL_15:
      sub_21CAC5DA8();
      __break(1u);
LABEL_16:
      sub_21CAC5DB4();
      __break(1u);
LABEL_17:
      v68 = 0;
      v69 = 1;
      v29 = v32;
      goto LABEL_18;
    }
    sub_21CAC5DA8();
    __break(1u);
  }
  v26 = sub_21CAC5C1C();
  v27 = v39;
  return v26;
}

unint64_t sub_21CAAD2E8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDF90;
  if (!qword_2552CDF90)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCDE48], MEMORY[0x24BDCDDE8]);
    atomic_store(v0, (unint64_t *)&qword_2552CDF90);
    return v0;
  }
  return v2;
}

uint64_t sub_21CAAD350()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF98);
  return sub_21CAC5B98();
}

unint64_t sub_21CAAD3F0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CDFA0;
  if (!qword_2552CDFA0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552CDF98);
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE12B0], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CDFA0);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAD460()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAD488()
{
  swift_release();
}

void sub_21CAAD4B0()
{
  _QWORD *v0;

  *v0 = *v0;
}

__SecTrust *static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)()
{
  unint64_t v0;
  SecCertificateRef *v1;
  __SecCertificate *v2;
  __SecTrust *v3;
  __CFError *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFErrorRef v12;
  __SecTrust *v13;
  SecCertificateRef *v14;
  SecPolicyRef BasicX509;
  CFTypeRef certificates;
  unsigned int v17;
  const __CFData *v18;
  SecCertificateRef v19;
  uint64_t v20;
  unint64_t v21;
  CFErrorRef error;
  __SecTrust *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = 0;
  sub_21CAAD9A0();
  v20 = sub_21CAC5844();
  v21 = v0;
  if ((v0 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_21CAAD9A8();
    swift_allocError();
    *(_QWORD *)v10 = 0;
    *(_QWORD *)(v10 + 8) = 0;
    *(_BYTE *)(v10 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    v24 = v20;
    v25 = v0;
    sub_21CAAC5B8(v20, v0);
    v18 = (const __CFData *)sub_21CAC5850();
    v19 = SecCertificateCreateWithData(0, v18);

    sub_21CAAC698(v20, v21);
    if (v19)
    {
      v23 = 0;
      type metadata accessor for SecCertificate();
      sub_21CAC5E14();
      v14 = v1;
      v2 = v19;
      *v14 = v19;
      sub_21CAACABC();
      certificates = (CFTypeRef)sub_21CAC5C10();
      BasicX509 = SecPolicyCreateBasicX509();
      v17 = SecTrustCreateWithCertificates(certificates, BasicX509, &v23);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
        sub_21CAAD9A8();
        swift_allocError();
        *(_QWORD *)v8 = v17;
        *(_QWORD *)(v8 + 8) = 0;
        *(_BYTE *)(v8 + 16) = 0;
        swift_willThrow();
        sub_21CAADAB4((id *)&v23);

        sub_21CAAC698(v20, v21);
      }
      else
      {
        v13 = v23;
        v3 = v23;
        if (v13)
        {
          error = 0;
          if (SecTrustEvaluateWithError(v13, &error))
          {
            sub_21CAADADC((id *)&error);
            sub_21CAADAB4((id *)&v23);

            sub_21CAAC698(v20, v21);
            return v13;
          }
          v12 = error;
          v5 = error;
          sub_21CAAD9A8();
          swift_allocError();
          *(_QWORD *)v6 = v12;
          *(_QWORD *)(v6 + 8) = 0;
          *(_BYTE *)(v6 + 16) = 1;
          swift_willThrow();
          sub_21CAADADC((id *)&error);

          sub_21CAADAB4((id *)&v23);
          sub_21CAAC698(v20, v21);
        }
        else
        {
          sub_21CAAD9A8();
          swift_allocError();
          *(_QWORD *)v7 = 2;
          *(_QWORD *)(v7 + 8) = 0;
          *(_BYTE *)(v7 + 16) = 3;
          swift_willThrow();
          sub_21CAADAB4((id *)&v23);

          sub_21CAAC698(v20, v21);
        }
      }
    }
    else
    {
      sub_21CAAD9A8();
      swift_allocError();
      *(_QWORD *)v9 = 1;
      *(_QWORD *)(v9 + 8) = 0;
      *(_BYTE *)(v9 + 16) = 3;
      swift_willThrow();
      sub_21CAAC698(v20, v21);
    }
  }
  return (__SecTrust *)v11;
}

uint64_t sub_21CAAD9A0()
{
  return 0;
}

unint64_t sub_21CAAD9A8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDFB0;
  if (!qword_2552CDFB0)
  {
    v0 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECCertValidation.ECCertValidationError, &type metadata for MCLECCertValidation.ECCertValidationError);
    atomic_store(v0, (unint64_t *)&qword_2552CDFB0);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for SecCertificate()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_2552CDFD0;
  if (!qword_2552CDFD0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2552CDFD0);
      return v1;
    }
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAADAB4(id *a1)
{

}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAADADC(id *a1)
{

}

uint64_t static MCLECCertValidation.getExternalCertRepresentation(from:)(__SecTrust *a1)
{
  const __CFData *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDataRef v10;
  __SecKey *v11;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v11 = SecTrustCopyKey(a1);
  if (v11)
  {
    error[0] = 0;
    v10 = SecKeyCopyExternalRepresentation(v11, error);
    if (v10)
    {
      v1 = v10;
      v9 = sub_21CAC5868();

      return v9;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDFB8);
    v8 = sub_21CAC5B68();
    v7 = v3;
    sub_21CAAD9A8();
    swift_allocError();
    *(_QWORD *)v4 = v8;
    *(_QWORD *)(v4 + 8) = v7;
    *(_BYTE *)(v4 + 16) = 2;
    swift_willThrow();

  }
  else
  {
    sub_21CAAD9A8();
    swift_allocError();
    *(_QWORD *)v5 = 3;
    *(_QWORD *)(v5 + 8) = 0;
    *(_BYTE *)(v5 + 16) = 3;
    swift_willThrow();
  }
  return v6;
}

uint64_t MCLECCertValidation.ECCertValidationError.errorDescription.getter(void *a1, uint64_t a2, char a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    if (a3 == 1)
    {
      v3 = a1;
      sub_21CAC5E08();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      sub_21CAC5DD8();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      v4 = a1;
      if (a1)
      {
        v5 = a1;
        type metadata accessor for CFError();
        sub_21CAAE604();
        sub_21CAC5E38();
        v10 = v6;

        v11 = v10;
      }
      else
      {
        v11 = 0;
      }
      if (!v11)
      {
        sub_21CAC5B98();
        sub_21CAAE514();
      }
      sub_21CAC5DF0();
      sub_21CAAE53C();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21CAAE4EC();
      v9 = sub_21CAC5B8C();

      return v9;
    }
    else if (a3 == 2)
    {
      swift_bridgeObjectRetain();
      sub_21CAC5E08();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      sub_21CAC5DD8();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if (!a2)
      {
        sub_21CAC5B98();
        sub_21CAAE514();
      }
      sub_21CAC5DF0();
      sub_21CAAE53C();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21CAAE4EC();
      v8 = sub_21CAC5B8C();
      swift_bridgeObjectRelease();
      return v8;
    }
    else
    {
      sub_21CAC5E08();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      sub_21CAC5DD8();
      sub_21CAC5B98();
      sub_21CAC5DFC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21CAAE4EC();
      return sub_21CAC5B8C();
    }
  }
  else
  {
    sub_21CAC5E08();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DD8();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DE4();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21CAAE4EC();
    return sub_21CAC5B8C();
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAE4EC()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAE514()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CAAE53C()
{
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for CFError()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_2552CDFC8;
  if (!qword_2552CDFC8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2552CDFC8);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_21CAAE604()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CDFC0;
  if (!qword_2552CDFC0)
  {
    v0 = type metadata accessor for CFError();
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BDCFD90], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CDFC0);
    return v1;
  }
  return v3;
}

uint64_t sub_21CAAE674()
{
  uint64_t v0;

  return MCLECCertValidation.ECCertValidationError.errorDescription.getter(*(void **)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_21CAAE694()
{
  return sub_21CAC5808();
}

uint64_t sub_21CAAE6A8()
{
  return sub_21CAC5820();
}

uint64_t sub_21CAAE6BC()
{
  return sub_21CAC57FC();
}

uint64_t sub_21CAAE6D0()
{
  return sub_21CAC5E5C();
}

uint64_t sub_21CAAE6E4()
{
  return sub_21CAC5E50();
}

uint64_t sub_21CAAE6F8()
{
  return sub_21CAC5E68();
}

uint64_t sub_21CAAE70C()
{
  return sub_21CAC5E44();
}

unint64_t sub_21CAAE724()
{
  return sub_21CAAD9A8();
}

ValueMetadata *type metadata accessor for MCLECCertValidation()
{
  return &type metadata for MCLECCertValidation;
}

uint64_t initializeBufferWithCopyOfBuffer for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21CAAE7A4(*(id *)a2, v4, v5);
  result = a1;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return result;
}

id sub_21CAAE7A4(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
    return result;
  if (a3 == 2)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void destroy for MCLECCertValidation.ECCertValidationError(uint64_t a1)
{
  sub_21CAAE830(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_21CAAE830(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {

  }
  else if (a3 == 2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21CAAE7A4(*(id *)a2, v4, v5);
  result = a1;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return result;
}

uint64_t assignWithCopy for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v6;
  uint64_t v7;
  char v8;

  v6 = *(id *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_21CAAE7A4(*(id *)a2, v7, v8);
  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_21CAAE830(v2, v3, v4);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  return result;
}

uint64_t assignWithTake for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_21CAAE830(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MCLECCertValidation.ECCertValidationError(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  int v4;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    {
      v4 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v2 = *(unsigned __int8 *)(a1 + 16) ^ 0xFF;
      if (v2 >= 0xFC)
        v2 = -1;
      v4 = v2;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECCertValidation.ECCertValidationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 17);
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_BYTE *)(result + 16) = 0;
    if (a3 >= 0xFD)
      *v3 = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *v3 = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21CAAEC6C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) < 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return *(_QWORD *)a1 + 3;
}

uint64_t sub_21CAAEC94(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(_BYTE *)(result + 16) = a2;
  }
  else
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for MCLECCertValidation.ECCertValidationError()
{
  return &type metadata for MCLECCertValidation.ECCertValidationError;
}

uint64_t variable initialization expression of MCLECv2Encryption.queue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = 0;
  v16 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v0, v1, v2);
  v31 = (uint64_t)&v15 - v16;
  v17 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v3, v4, v5);
  v30 = (char *)&v15 - v17;
  v18 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC591C() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v6, v7, v8);
  v29 = (char *)&v15 - v18;
  v22 = sub_21CAAEEF8();
  v20 = 17;
  v9 = sub_21CAC5E08();
  v24 = &v33;
  v33 = v9;
  v34 = v10;
  v21 = 1;
  sub_21CAC5B98();
  v19 = v11;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLECv2Encryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v23 = v12;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v26 = v33;
  v25 = v34;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v27 = sub_21CAC5B8C();
  v28 = v13;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v31);
  return sub_21CAC5CD0();
}

unint64_t sub_21CAAEEF8()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_2552CDFD8;
  if (!qword_2552CDFD8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2552CDFD8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv2Encryption()
{
  return objc_opt_self();
}

uint64_t sub_21CAAEF80()
{
  sub_21CAC5F28();
  sub_21CAC5BD4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CAAEFB4()
{
  return sub_21CAC5910();
}

uint64_t sub_21CAAEFC8()
{
  sub_21CAB99D0(0);
  sub_21CAC5CA0();
  sub_21CABA0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE160);
  sub_21CABA118();
  return sub_21CAC5D54();
}

uint64_t sub_21CAAF05C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = *MEMORY[0x24BEE5750];
  v1 = sub_21CAC5CAC();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

uint64_t variable initialization expression of MCLECv2Encryption.symmetricKeyLength()
{
  return 32;
}

uint64_t variable initialization expression of MCLECv2Encryption.prependsEphemeralKeyPadding()
{
  return 0;
}

uint64_t sub_21CAAF114()
{
  uint64_t v0;
  char *v2;
  char v3;

  v2 = (char *)(v0 + OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_21CAAF1C8(char a1)
{
  uint64_t v1;
  _BYTE *v4;

  v4 = (_BYTE *)(v1 + OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding);
  swift_beginAccess();
  *v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_21CAAF248())()
{
  swift_beginAccess();
  return sub_21CAAF298;
}

uint64_t sub_21CAAF298()
{
  return swift_endAccess();
}

uint64_t sub_21CAAF2D4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25[10];
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25[2] = 0;
  v26 = 0;
  v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  v28 = 0;
  v21 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v23 = sub_21CAC5AD8();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_21CAC5E14();
  sub_21CAAF6D0();
  sub_21CAC5CF4();
  v25[0] = 0;
  v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  v22 = v25[0];
  v7 = v25[0];
  v8 = v28;
  v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    v15 = sub_21CAC5868();
    v16 = v9;

    v17 = v15;
    v18 = v16;
  }
  else
  {
    v12 = v28;
    v13 = (id)sub_21CAC5838();

    swift_willThrow();
    v17 = 0;
    v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CAAF740();
    v14 = (id)swift_allocError();
    *(_QWORD *)v11 = 2;
    *(_QWORD *)(v11 + 8) = 0;
    *(_BYTE *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    v26 = v17;
    v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x24BEE4EA0]) + 0x98))();
    return sub_21CAAC698(v17, v18);
  }
}

uint64_t type metadata accessor for WritingOptions()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_2552CE108;
  if (!qword_2552CE108)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2552CE108);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_21CAAF6D0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CDFE8;
  if (!qword_2552CDFE8)
  {
    v0 = type metadata accessor for WritingOptions();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8B1C, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CDFE8);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAAF740()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CDFF0;
  if (!qword_2552CDFF0)
  {
    v0 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv2Encryption.ECv2EncryptionError, &type metadata for MCLECv2Encryption.ECv2EncryptionError);
    atomic_store(v0, (unint64_t *)&qword_2552CDFF0);
    return v0;
  }
  return v2;
}

uint64_t sub_21CAAF910(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_21CAAF93C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAAF978(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

void sub_21CAAF980(void *a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = sub_21CAC582C();

    v4 = (void *)v3;
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(a2 + 16))();

}

uint64_t sub_21CAAFA14()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAAFA50(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAAFA58(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25[10];
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25[2] = 0;
  v26 = 0;
  v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  v28 = 0;
  v21 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v23 = sub_21CAC5AD8();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_21CAC5E14();
  sub_21CAAF6D0();
  sub_21CAC5CF4();
  v25[0] = 0;
  v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  v22 = v25[0];
  v7 = v25[0];
  v8 = v28;
  v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    v15 = sub_21CAC5868();
    v16 = v9;

    v17 = v15;
    v18 = v16;
  }
  else
  {
    v12 = v28;
    v13 = (id)sub_21CAC5838();

    swift_willThrow();
    v17 = 0;
    v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CAAF740();
    v14 = (id)swift_allocError();
    *(_QWORD *)v11 = 2;
    *(_QWORD *)(v11 + 8) = 0;
    *(_BYTE *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    v26 = v17;
    v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x24BEE4EA0]) + 0xA0))();
    return sub_21CAAC698(v17, v18);
  }
}

uint64_t sub_21CAAFF18()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAAFF54(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAAFF5C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAAFF98(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAAFFA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void), uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  char v19;
  void (*v20)(void);
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v36 = a1;
  v37 = a2;
  v29 = a3;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v34 = a8;
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v43 = 0;
  v44 = 0;
  v41 = sub_21CAC5B5C();
  v38 = *(_QWORD *)(v41 - 8);
  v35 = (*(_QWORD *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v39 = (char *)&v22 - v35;
  v52 = MEMORY[0x24BDAC7A8](v36, v37, v29, v30);
  v53 = v9;
  v50 = v10;
  v51 = v11;
  v48 = v12;
  v49 = v13;
  v46 = v14;
  v47 = v15;
  v45 = v8;
  sub_21CAC5B50();
  sub_21CAB01F8();
  v40 = sub_21CAC5B38();
  v42 = v16;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v41);
  if ((v42 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CAAF740();
    HIDWORD(v22) = 1;
    v18 = (void *)swift_allocError();
    v19 = BYTE4(v22);
    v20 = v33;
    v23 = v18;
    *(_QWORD *)v21 = 2;
    *(_QWORD *)(v21 + 8) = 0;
    *(_BYTE *)(v21 + 16) = v19 & 1;
    v20();

    return swift_release();
  }
  else
  {
    v26 = v40;
    v27 = v42;
    v25 = v42;
    v24 = v40;
    v43 = v40;
    v44 = v42;
    (*(void (**)(void))((*v28 & *MEMORY[0x24BEE4EA0]) + 0xA8))();
    return sub_21CAAC698(v24, v25);
  }
}

uint64_t sub_21CAB01F8()
{
  return 0;
}

uint64_t sub_21CAB0354()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAB0390(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAB0398()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAB03D4(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientCertBase64Encoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t aBlock;
  int v54;
  int v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  uint64_t (*v58)();
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v43 = a1;
  v42 = a2;
  v39 = a3;
  v40 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v63 = 0;
  v64 = 0;
  v61 = 0;
  v62 = 0;
  v60 = 0;
  v44 = 0;
  v47 = sub_21CAC5904();
  v45 = *(_QWORD *)(v47 - 8);
  v33 = (*(_QWORD *)(v45 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v46 = (char *)&v32 - v33;
  v50 = sub_21CAC591C();
  v48 = *(_QWORD *)(v50 - 8);
  v34 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v43, v42, v39, v40);
  v49 = (char *)&v32 - v34;
  v67 = v12;
  v68 = v13;
  v65 = v14;
  v66 = v15;
  v63 = v16;
  v64 = v17;
  v61 = v18;
  v62 = v19;
  v60 = v8;
  v52 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  v20 = v52;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v21 = v41;
  sub_21CAAC5B8(v43, v42);
  v22 = swift_allocObject();
  v23 = v36;
  v24 = v37;
  v25 = v38;
  v26 = v39;
  v27 = v40;
  v28 = v41;
  v29 = v42;
  v30 = (_QWORD *)v22;
  v31 = v43;
  v30[2] = v35;
  v30[3] = v23;
  v30[4] = v24;
  v30[5] = v25;
  v30[6] = v26;
  v30[7] = v27;
  v30[8] = v28;
  v30[9] = v31;
  v30[10] = v29;
  v58 = sub_21CAB0B8C;
  v59 = v30;
  aBlock = MEMORY[0x24BDAC760];
  v54 = 1107296256;
  v55 = 0;
  v56 = sub_21CAB1194;
  v57 = &block_descriptor;
  v51 = _Block_copy(&aBlock);
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v44, v49, v46, v51);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  _Block_release(v51);
  swift_release();

}

uint64_t sub_21CAB06C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __SecTrust *v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE v21[48];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __SecTrust *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __SecTrust *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  __SecTrust *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;

  v42 = a1;
  v38 = a2;
  v34 = a3;
  v44 = a4;
  v45 = a5;
  v46 = a6;
  v35 = a7;
  v36 = a8;
  v37 = a9;
  v66 = 0;
  v64 = 0;
  v65 = 0;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  v55 = 0;
  v53 = 0;
  v54 = 0;
  v50 = 0;
  v39 = sub_21CAC5A78();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(_QWORD *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v43 = &v21[-v41];
  v66 = &v21[-v41];
  v64 = v42;
  v65 = MEMORY[0x24BDAC7A8](v38, v9, v34, v44);
  v62 = v10;
  v63 = v11;
  v60 = v12;
  v61 = v13;
  v59 = v14;
  v57 = v15;
  v58 = v16;
  swift_retain();
  swift_retain();
  v17 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  v47 = 0;
  v48 = v17;
  v49 = 0;
  v29 = v17;
  v55 = v17;
  v18 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v17);
  v30 = 0;
  v31 = v18;
  v32 = v19;
  v33 = 0;
  v26 = v19;
  v25 = v18;
  v53 = v18;
  v54 = v19;
  sub_21CAAC5B8(v18, v19);
  v51 = v25;
  v52 = v26;
  sub_21CAC5A6C();
  v27 = 0;
  v28 = 0;
  v23 = sub_21CAB30F0(v36, v37, (uint64_t)v43);
  v24 = 0;
  v22 = v23;
  v50 = v23;
  sub_21CAB0BD4(v23, v42, v38);

  (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v43, v39);
  sub_21CAAC698(v25, v26);

  swift_release();
  return swift_release();
}

uint64_t sub_21CAB0B2C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_21CAB0B8C()
{
  uint64_t *v0;

  return sub_21CAB06C0(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

void sub_21CAB0BD4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CABA03C;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_95;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB0DD4(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

uint64_t sub_21CAB0E3C(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_21CAB0E84()
{
  return sub_21CAC5910();
}

uint64_t sub_21CAB0E98()
{
  sub_21CAB9A88(0);
  sub_21CAC5904();
  sub_21CAB9E68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE148);
  sub_21CAB9ED8();
  return sub_21CAC5D54();
}

void sub_21CAB0F2C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAB9F8C;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_89;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB112C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

uint64_t sub_21CAB1194(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21CAB138C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAB13C8(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAB13D0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAB140C(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientKeyHexEncoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t aBlock;
  int v54;
  int v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  uint64_t (*v58)();
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v43 = a1;
  v42 = a2;
  v39 = a3;
  v40 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v63 = 0;
  v64 = 0;
  v61 = 0;
  v62 = 0;
  v60 = 0;
  v44 = 0;
  v47 = sub_21CAC5904();
  v45 = *(_QWORD *)(v47 - 8);
  v33 = (*(_QWORD *)(v45 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v46 = (char *)&v32 - v33;
  v50 = sub_21CAC591C();
  v48 = *(_QWORD *)(v50 - 8);
  v34 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v43, v42, v39, v40);
  v49 = (char *)&v32 - v34;
  v67 = v12;
  v68 = v13;
  v65 = v14;
  v66 = v15;
  v63 = v16;
  v64 = v17;
  v61 = v18;
  v62 = v19;
  v60 = v8;
  v52 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  v20 = v52;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v21 = v41;
  sub_21CAAC5B8(v43, v42);
  v22 = swift_allocObject();
  v23 = v36;
  v24 = v37;
  v25 = v38;
  v26 = v39;
  v27 = v40;
  v28 = v41;
  v29 = v42;
  v30 = (_QWORD *)v22;
  v31 = v43;
  v30[2] = v35;
  v30[3] = v23;
  v30[4] = v24;
  v30[5] = v25;
  v30[6] = v26;
  v30[7] = v27;
  v30[8] = v28;
  v30[9] = v31;
  v30[10] = v29;
  v58 = sub_21CAB1AB4;
  v59 = v30;
  aBlock = MEMORY[0x24BDAC760];
  v54 = 1107296256;
  v55 = 0;
  v56 = sub_21CAB1194;
  v57 = &block_descriptor_36;
  v51 = _Block_copy(&aBlock);
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v44, v49, v46, v51);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  _Block_release(v51);
  swift_release();

}

uint64_t sub_21CAB16F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BYTE v19[40];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;

  v31 = a1;
  v27 = a2;
  v23 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v55 = 0;
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  v50 = 0;
  v48 = 0;
  v46 = 0;
  v47 = 0;
  v44 = 0;
  v45 = 0;
  v42 = 0;
  v41 = 0;
  v28 = sub_21CAC5A78();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = (*(_QWORD *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v37 = &v19[-v30];
  v55 = &v19[-v30];
  v53 = v31;
  v54 = MEMORY[0x24BDAC7A8](v27, v9, v23, v32);
  v51 = v10;
  v52 = v11;
  v49 = v12;
  v50 = v13;
  v48 = v14;
  v46 = v15;
  v47 = v16;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v35 = Data.init(hexString:)(v33, v34);
  v36 = v17;
  v44 = v35;
  v45 = v17;
  sub_21CAAC5B8(v35, v17);
  v38 = v43;
  v43[0] = v35;
  v43[1] = v36;
  sub_21CAB9B40();
  sub_21CAC5A54();
  v39 = 0;
  v40 = 0;
  v21 = sub_21CAB30F0(v25, v26, (uint64_t)v37);
  v22 = 0;
  v20 = v21;
  v41 = v21;
  sub_21CAB1B58(v21, v31, v27);

  (*(void (**)(_BYTE *, uint64_t))(v29 + 8))(v37, v28);
  sub_21CAAC698(v35, v36);
  swift_release();
  return swift_release();
}

uint64_t sub_21CAB1A54()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_21CAB1AB4()
{
  uint64_t *v0;

  return sub_21CAB16F8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

uint64_t block_copy_helper_34(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_35()
{
  return swift_release();
}

void sub_21CAB1B58(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAB9DFC;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_83;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB1D58(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CAB1DC0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAB9D4C;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_77;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB1FC0(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

uint64_t sub_21CAB217C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAB21B8(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAB21C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAB21FC(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientKeyBase64Encoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t aBlock;
  int v54;
  int v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  uint64_t (*v58)();
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v43 = a1;
  v42 = a2;
  v39 = a3;
  v40 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v63 = 0;
  v64 = 0;
  v61 = 0;
  v62 = 0;
  v60 = 0;
  v44 = 0;
  v47 = sub_21CAC5904();
  v45 = *(_QWORD *)(v47 - 8);
  v33 = (*(_QWORD *)(v45 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v46 = (char *)&v32 - v33;
  v50 = sub_21CAC591C();
  v48 = *(_QWORD *)(v50 - 8);
  v34 = (*(_QWORD *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v43, v42, v39, v40);
  v49 = (char *)&v32 - v34;
  v67 = v12;
  v68 = v13;
  v65 = v14;
  v66 = v15;
  v63 = v16;
  v64 = v17;
  v61 = v18;
  v62 = v19;
  v60 = v8;
  v52 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  v20 = v52;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v21 = v41;
  sub_21CAAC5B8(v43, v42);
  v22 = swift_allocObject();
  v23 = v36;
  v24 = v37;
  v25 = v38;
  v26 = v39;
  v27 = v40;
  v28 = v41;
  v29 = v42;
  v30 = (_QWORD *)v22;
  v31 = v43;
  v30[2] = v35;
  v30[3] = v23;
  v30[4] = v24;
  v30[5] = v25;
  v30[6] = v26;
  v30[7] = v27;
  v30[8] = v28;
  v30[9] = v31;
  v30[10] = v29;
  v58 = sub_21CAB29A0;
  v59 = v30;
  aBlock = MEMORY[0x24BDAC760];
  v54 = 1107296256;
  v55 = 0;
  v56 = sub_21CAB1194;
  v57 = &block_descriptor_50;
  v51 = _Block_copy(&aBlock);
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v44, v49, v46, v51);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  _Block_release(v51);
  swift_release();

}

uint64_t sub_21CAB24E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  void *v63;
  _QWORD v64[2];
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;

  v55 = a1;
  v51 = a2;
  v47 = a3;
  v57 = a4;
  v58 = a5;
  v59 = a6;
  v48 = a7;
  v49 = a8;
  v50 = a9;
  v76 = 0;
  v74 = 0;
  v75 = 0;
  v72 = 0;
  v73 = 0;
  v70 = 0;
  v71 = 0;
  v69 = 0;
  v67 = 0;
  v68 = 0;
  v65 = 0;
  v66 = 0;
  v46 = 0;
  v63 = 0;
  v62 = 0;
  v52 = sub_21CAC5A78();
  v53 = *(_QWORD *)(v52 - 8);
  v54 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v56 = (uint64_t)&v29 - v54;
  v76 = (char *)&v29 - v54;
  v74 = v55;
  v75 = MEMORY[0x24BDAC7A8](v51, v9, v47, v57);
  v72 = v10;
  v73 = v11;
  v70 = v12;
  v71 = v13;
  v69 = v14;
  v67 = v15;
  v68 = v16;
  swift_retain();
  swift_retain();
  v60 = sub_21CAC5844();
  v61 = v17;
  if ((v17 & 0xF000000000000000) != 0xF000000000000000)
  {
    v44 = v60;
    v45 = v61;
    v24 = v46;
    v38 = v61;
    v37 = v60;
    v65 = v60;
    v66 = v61;
    sub_21CAAC5B8(v60, v61);
    v39 = v64;
    v64[0] = v37;
    v64[1] = v38;
    sub_21CAB9B40();
    sub_21CAC5A54();
    v40 = v24;
    v41 = v24;
    if (v24)
    {
      v31 = v41;
      sub_21CAAC698(v37, v38);
      v32 = v31;
    }
    else
    {
      v25 = v40;
      v35 = sub_21CAB30F0(v49, v50, v56);
      v36 = v25;
      if (!v25)
      {
        v34 = v35;
        v62 = v35;
        sub_21CAB2A44(v35, v55, v51);

        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v56, v52);
        sub_21CAAC698(v37, v38);
        goto LABEL_7;
      }
      v30 = v36;
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v56, v52);
      sub_21CAAC698(v37, v38);
      v32 = v30;
    }
    v33 = v32;
    v27 = v32;
    v63 = v33;
    v28 = v33;
    sub_21CAB2CAC(v33, v47, v57);

    goto LABEL_7;
  }
  sub_21CAAF740();
  v42 = 1;
  v18 = (void *)swift_allocError();
  v19 = v42;
  v20 = v57;
  v43 = v18;
  v22 = v21;
  v23 = v47;
  *(_QWORD *)v22 = 1;
  *(_QWORD *)(v22 + 8) = 0;
  *(_BYTE *)(v22 + 16) = v19 & 1;
  sub_21CAB2CAC(v18, v23, v20);

LABEL_7:
  swift_release();
  return swift_release();
}

uint64_t sub_21CAB2940()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_21CAB29A0()
{
  uint64_t *v0;

  return sub_21CAB24E8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

uint64_t block_copy_helper_48(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_49()
{
  return swift_release();
}

void sub_21CAB2A44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAB9C9C;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_71;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB2C44(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CAB2CAC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAB9BEC;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_65;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CAB2EAC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

uint64_t sub_21CAB3068()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAB30A4(uint64_t a1)
{
  uint64_t v1;

  return sub_21CAAF910(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAB30AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAB30E8(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

id sub_21CAB30F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char v47;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD v136[4];
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  _QWORD v149[2];
  char v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;

  v123 = a1;
  v122 = a2;
  v132 = a3;
  v163 = 0;
  v162 = 0;
  v161 = 0;
  v160 = 0;
  v159 = 0;
  v158 = 0;
  v156 = 0;
  v157 = 0;
  v155 = 0;
  v154 = 0;
  v152 = 0;
  v153 = 0;
  v145 = 0;
  v146 = 0;
  v137 = 0;
  v138 = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE000);
  v93 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3, v4, v5, v6);
  v94 = (uint64_t)&v54 - v93;
  v117 = 0;
  v95 = sub_21CAC59D0();
  v96 = *(_QWORD *)(v95 - 8);
  v97 = (*(_QWORD *)(v96 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v117, v7, v8, v9);
  v98 = (uint64_t)&v54 - v97;
  v99 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10, (char *)&v54 - v97, v12, v13);
  v100 = (char *)&v54 - v99;
  v163 = (char *)&v54 - v99;
  v101 = sub_21CAC59AC();
  v102 = *(_QWORD *)(v101 - 8);
  v103 = (*(_QWORD *)(v102 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v117, v14, v15, v16);
  v104 = (char *)&v54 - v103;
  v162 = (char *)&v54 - v103;
  v105 = sub_21CAC5988();
  v106 = *(_QWORD *)(v105 - 8);
  v107 = (*(_QWORD *)(v106 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v117, v17, v18, v19);
  v108 = (char *)&v54 - v107;
  v161 = (char *)&v54 - v107;
  v109 = sub_21CAC5940();
  v110 = *(_QWORD *)(v109 - 8);
  v111 = (*(_QWORD *)(v110 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v117, v20, v21, v22);
  v112 = (char *)&v54 - v111;
  v160 = (char *)&v54 - v111;
  v113 = sub_21CAC5A78();
  v114 = *(_QWORD *)(v113 - 8);
  v115 = (*(_QWORD *)(v114 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v117, v23, v24, v25);
  v116 = (uint64_t)&v54 - v115;
  v118 = sub_21CAC5964();
  v119 = *(_QWORD *)(v118 - 8);
  v120 = (*(_QWORD *)(v119 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v117, v26, v27, v28);
  v131 = (char *)&v54 - v120;
  v159 = (char *)&v54 - v120;
  v124 = sub_21CAC5AB4();
  v125 = *(_QWORD *)(v124 - 8);
  v127 = *(_QWORD *)(v125 + 64);
  v126 = (v127 + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = MEMORY[0x24BDAC7A8](v123, v122, v132, v29);
  v128 = (uint64_t)&v54 - v126;
  v129 = (v127 + 15) & 0xFFFFFFFFFFFFFFF0;
  v33 = MEMORY[0x24BDAC7A8](v30, v31, v32, (char *)&v54 - v126);
  v130 = (char *)&v54 - v129;
  v158 = (char *)&v54 - v129;
  v156 = v33;
  v157 = v34;
  v155 = v35;
  v154 = v36;
  sub_21CAC5AA8();
  v37 = v133;
  sub_21CAC5A90();
  v134 = v37;
  v135 = v37;
  if (v37)
  {
    v57 = v135;
    (*(void (**)(char *, uint64_t))(v125 + 8))(v130, v124);
    v62 = v57;
    return (id)v68;
  }
  sub_21CAC594C();
  v92 = 0;
  v79 = 4;
  v77 = MEMORY[0x24BEE4260];
  v38 = sub_21CAC5E14();
  *v39 = 0;
  v39[1] = 0;
  v39[2] = 0;
  v39[3] = 1;
  sub_21CAACABC();
  v80 = v38;
  v78 = v38 + 32;
  swift_bridgeObjectRetain();
  v151 = v78;
  v82 = &v152;
  sub_21CAC5880();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v81 = &v150;
  v150 = 4;
  sub_21CAB3C3C();
  v90 = MEMORY[0x24BDCDDE8];
  sub_21CAC5C94();
  sub_21CAC5A9C();
  v83 = sub_21CAC5A60();
  v84 = v40;
  (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v116, v113);
  sub_21CAC588C();
  sub_21CAAC698(v83, v84);
  sub_21CAC5AC0();
  v85 = v152;
  v86 = v153;
  sub_21CAAC5B8(v152, v153);
  v89 = v149;
  v149[0] = v85;
  v149[1] = v86;
  v87 = sub_21CAB3CA4();
  v88 = sub_21CAB3D14();
  sub_21CAC5928();
  sub_21CAAC668((uint64_t)v89);
  v41 = v92;
  sub_21CAC5934();
  v91 = v41;
  if (v41)
  {
    __break(1u);
    goto LABEL_10;
  }
  v75 = v147;
  v76 = v148;
  v145 = v147;
  v146 = v148;
  if (sub_21CAC5874() != *(_QWORD *)((char *)v121 + OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength))
  {
    v58 = *(_QWORD *)((char *)v121 + OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength);
    v60 = sub_21CAC5874();
    sub_21CAAF740();
    v59 = 0;
    v49 = swift_allocError();
    v50 = v59;
    v51 = v49;
    v52 = v60;
    v61 = v51;
    *(_QWORD *)v53 = v58;
    *(_QWORD *)(v53 + 8) = v52;
    *(_BYTE *)(v53 + 16) = v50 & 1;
    swift_willThrow();
    sub_21CAAC698(v75, v76);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v112, v109);
    sub_21CAAC668((uint64_t)&v152);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v131, v118);
    (*(void (**)(char *, uint64_t))(v125 + 8))(v130, v124);
    v62 = v61;
    return (id)v68;
  }
  sub_21CAAC5B8(v75, v76);
  v141 = v75;
  v142 = v76;
  sub_21CAAD2E8();
  v69 = 16;
  v72 = MEMORY[0x24BDCDDE8];
  sub_21CAC5C7C();
  v139 = v143;
  v140 = v144;
  sub_21CAC597C();
  v70 = MEMORY[0x22078629C](0, v69);
  v71 = v42;
  v137 = v70;
  v138 = v42;
  sub_21CAAC5B8(v70, v42);
  v43 = v91;
  v136[2] = v70;
  v136[3] = v71;
  sub_21CAC59A0();
  v73 = v43;
  v74 = v43;
  if (v43)
  {
LABEL_10:
    v56 = v74;
    sub_21CAAC698(v70, v71);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v108, v105);
    sub_21CAAC698(v75, v76);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v112, v109);
    sub_21CAAC668((uint64_t)&v152);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v131, v118);
    (*(void (**)(char *, uint64_t))(v125 + 8))(v130, v124);
    v62 = v56;
    return (id)v68;
  }
  v65 = v136;
  v136[0] = v123;
  v136[1] = v122;
  (*(void (**)(uint64_t, char *, uint64_t))(v102 + 16))(v94, v104, v101);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v102 + 56))(v94, 0, 1, v101);
  v44 = v73;
  sub_21CAC5994();
  v66 = v44;
  v67 = v44;
  if (!v44)
  {
    v45 = v121;
    sub_21CAB3E18(v94);
    v63 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
    (*(void (**)(uint64_t, char *, uint64_t))(v96 + 16))(v98, v100, v95);
    (*(void (**)(uint64_t, char *, uint64_t))(v125 + 16))(v128, v130, v124);
    v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v114 + 16))(v116, v132, v113);
    v47 = (*(uint64_t (**)(uint64_t))((*v45 & *MEMORY[0x24BEE4EA0]) + 0x68))(v46);
    v64 = sub_21CAB3EAC(v98, v128, v116, v47 & 1);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v100, v95);
    (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v101);
    sub_21CAAC698(v70, v71);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v108, v105);
    sub_21CAAC698(v75, v76);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v112, v109);
    sub_21CAAC668((uint64_t)&v152);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v131, v118);
    (*(void (**)(char *, uint64_t))(v125 + 8))(v130, v124);
    return v64;
  }
  v55 = v67;
  sub_21CAB3E18(v94);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v101);
  sub_21CAAC698(v70, v71);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v108, v105);
  sub_21CAAC698(v75, v76);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v112, v109);
  sub_21CAAC668((uint64_t)&v152);
  (*(void (**)(char *, uint64_t))(v119 + 8))(v131, v118);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v130, v124);
  v62 = v55;
  return (id)v68;
}

uint64_t sub_21CAB3BA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  sub_21CAC5C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  result = sub_21CAC58BC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_21CAB3C3C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE008;
  if (!qword_2552CE008)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCDE50], MEMORY[0x24BDCDDE8]);
    atomic_store(v0, (unint64_t *)&qword_2552CE008);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB3CA4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE010;
  if (!qword_2552CE010)
  {
    v0 = sub_21CAC5AC0();
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BDC6AE8], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE010);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB3D14()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE018;
  if (!qword_2552CE018)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(v0, (unint64_t *)&qword_2552CE018);
    return v0;
  }
  return v2;
}

uint64_t sub_21CAB3D7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  sub_21CAC5C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  result = sub_21CAC58BC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_21CAB3E18(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21CAC59AC();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer()
{
  return objc_opt_self();
}

id sub_21CAB3EAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  objc_class *v4;
  id v5;

  v5 = objc_allocWithZone(v4);
  return sub_21CAB5B58(a1, a2, a3, a4 & 1);
}

uint64_t MCLECv2Encryption.ECv2EncryptionError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    sub_21CAC5E08();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DD8();
  }
  else
  {
    sub_21CAC5E08();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DD8();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DE4();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DE4();
  }
  sub_21CAC5B98();
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  return sub_21CAC5B8C();
}

uint64_t sub_21CAB421C()
{
  uint64_t v0;

  return MCLECv2Encryption.ECv2EncryptionError.errorDescription.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16) & 1);
}

uint64_t sub_21CAB4240()
{
  return sub_21CAC5808();
}

uint64_t sub_21CAB4254()
{
  return sub_21CAC5820();
}

uint64_t sub_21CAB4268()
{
  return sub_21CAC57FC();
}

uint64_t sub_21CAB427C()
{
  return sub_21CAC5E5C();
}

uint64_t sub_21CAB4290()
{
  return sub_21CAC5E50();
}

uint64_t sub_21CAB42A4()
{
  return sub_21CAC5E68();
}

uint64_t sub_21CAB42B8()
{
  return sub_21CAC5E44();
}

uint64_t variable initialization expression of MCLECv2Encryption.ECv2EncryptedDataContainer._encryptionVersion()
{
  return sub_21CAC5B98();
}

uint64_t sub_21CAB4360()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_21CAB43F0()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData);
  v1 = v3;
  return v3;
}

uint64_t sub_21CAB4494()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CAB4544()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CAB45F4()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_21CAB463C(uint64_t a1, uint64_t a2, char a3)
{
  objc_class *v3;
  id v4;

  v4 = objc_allocWithZone(v3);
  return sub_21CAB4688(a1, a2, a3 & 1);
}

id sub_21CAB4688(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  unsigned int v62;
  char v63;
  objc_super v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  id v70;

  v57 = a1;
  v56 = a2;
  v62 = a3;
  v70 = 0;
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v65 = 0;
  v66 = 0;
  v58 = sub_21CAC5A78();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = (*(_QWORD *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v61 = (char *)&v33 - v60;
  v69 = MEMORY[0x24BDAC7A8](v57, v56, v62, v4);
  v68 = v5;
  v67 = v6 & 1;
  v7 = v3;
  v8 = v3;
  v9 = v3;
  v70 = v3;
  if ((v62 & 1) != 0)
  {
    v10 = sub_21CAC5898();
    v52 = &v65;
    v65 = v10;
    v66 = v11;
    v51 = &v63;
    v63 = 4;
    sub_21CAB3C3C();
    sub_21CAC5C94();
    sub_21CAC5A9C();
    v53 = sub_21CAC5A60();
    v54 = v12;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v58);
    sub_21CAC588C();
    sub_21CAAC698(v53, v54);
  }
  else
  {
    sub_21CAC5A9C();
    v49 = sub_21CAC5A60();
    v50 = v13;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v58);
    v65 = v49;
    v66 = v50;
  }
  v45 = &v65;
  v33 = v65;
  v34 = v66;
  sub_21CAAC5B8(v65, v66);
  sub_21CAB4A58();
  v35 = sub_21CAC585C();
  v36 = v14;
  sub_21CAAC698(v33, v34);
  v15 = v36;
  v16 = v55;
  v17 = (uint64_t *)&v55[OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey];
  *v17 = v35;
  v17[1] = v15;

  v37 = sub_21CAC59B8();
  v38 = v18;
  sub_21CAB4A58();
  v39 = sub_21CAC585C();
  v40 = v19;
  sub_21CAAC698(v37, v38);
  v20 = v40;
  v21 = v55;
  v22 = (uint64_t *)&v55[OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData];
  *v22 = v39;
  v22[1] = v20;

  v41 = sub_21CAC59C4();
  v42 = v23;
  sub_21CAB4A58();
  v43 = sub_21CAC585C();
  v44 = v24;
  sub_21CAAC698(v41, v42);
  v25 = v44;
  v26 = v55;
  v27 = (uint64_t *)&v55[OBJC_IVAR___MCLECv2EncryptedData_gcmTag];
  *v27 = v43;
  v27[1] = v25;

  sub_21CAAC668((uint64_t)v45);
  v46 = v70;
  v47 = 0;
  v28 = (objc_class *)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  v64.receiver = v46;
  v64.super_class = v28;
  v48 = objc_msgSendSuper2(&v64, sel_init);
  v29 = v48;
  v70 = v48;
  v30 = sub_21CAC59D0();
  (*(void (**)(uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v56);
  v31 = sub_21CAC5AB4();
  (*(void (**)(uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v57);

  return v48;
}

uint64_t sub_21CAB4A58()
{
  return 0;
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.EncryptedData")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.EncryptedData", 23, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv2Encryption.swift", 33, 2, v1, 0xE1uLL, 0x10uLL);
  __break(1u);
  return result;
}

BOOL sub_21CAB4BB4(char a1, char a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (a1 == 1)
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_21CAB4C88()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CAB4D30()
{
  char v2;
  char v3;
  char v4;
  unsigned __int8 v5;

  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v4 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v3 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v2 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_21CAB4F60()
{
  return 3;
}

uint64_t sub_21CAB4F78()
{
  sub_21CAB7B6C();
  return sub_21CAC5D6C();
}

uint64_t sub_21CAB4FC0()
{
  return 0;
}

uint64_t sub_21CAB4FDC()
{
  return sub_21CAC5B98();
}

BOOL sub_21CAB50AC(char *a1, char *a2)
{
  return sub_21CAB4BB4(*a1, *a2);
}

uint64_t sub_21CAB50CC()
{
  return sub_21CAB4F78();
}

uint64_t sub_21CAB50E4()
{
  return sub_21CAB4C88();
}

uint64_t sub_21CAB50FC()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CAB5110()
{
  return sub_21CAB4FDC();
}

uint64_t sub_21CAB5128@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAB4D30();
  *a1 = result;
  return result;
}

uint64_t sub_21CAB5150()
{
  return sub_21CAB4FC0();
}

uint64_t sub_21CAB516C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAB4F60();
  *a1 = result;
  return result;
}

uint64_t sub_21CAB5194()
{
  sub_21CAB7BD8();
  return sub_21CAC5E8C();
}

uint64_t sub_21CAB51C0()
{
  sub_21CAB7BD8();
  return sub_21CAC5E98();
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];
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
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  _QWORD *v37;

  v20 = a1;
  v37 = 0;
  v36 = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE050);
  v21 = *(_QWORD *)(v30 - 8);
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v25 = (char *)v9 - v22;
  v37 = (_QWORD *)MEMORY[0x24BDAC7A8](v20, v2, v3, v4);
  v36 = v1;
  v23 = v37[3];
  v24 = v37[4];
  __swift_project_boxed_opaque_existential_1(v37, v23);
  sub_21CAB7BD8();
  sub_21CAC5E80();
  v5 = v27;
  v28 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey);
  v29 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey + 8);
  swift_bridgeObjectRetain();
  v35 = 0;
  sub_21CAC5DC0();
  v31 = v5;
  v32 = v5;
  if (v5)
  {
    v10 = v32;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v25, v30);
    v11 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = v31;
    v16 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData);
    v17 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData + 8);
    swift_bridgeObjectRetain();
    v34 = 1;
    sub_21CAC5DC0();
    v18 = v6;
    v19 = v6;
    if (v6)
    {
      v9[1] = v19;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v25, v30);
    }
    else
    {
      swift_bridgeObjectRelease();
      v7 = v18;
      v12 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag);
      v13 = *(_QWORD *)(v26 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag + 8);
      swift_bridgeObjectRetain();
      v33 = 2;
      sub_21CAC5DC0();
      v14 = v7;
      v15 = v7;
      if (v7)
        v9[0] = v15;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v25, v30);
    }
  }
  return result;
}

uint64_t sub_21CAB5554()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x24BEE4EA0]) + 0x70))();
}

uint64_t sub_21CAB55C4()
{
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  sub_21CAB7C98();
  v1 = sub_21CAB5640();
  v2 = sub_21CAB5674(v1);
  swift_release();
  return v2;
}

uint64_t sub_21CAB5640()
{
  sub_21CAC57F0();
  return sub_21CAC57E4();
}

uint64_t sub_21CAB5674(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  id v3;
  void *v4;
  id v6;
  id v7;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20[32];
  id v21;
  _QWORD v22[3];
  uint64_t v23;
  _BYTE v24[32];
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = 0;
  v19 = a1;
  v18 = v1;
  v14 = sub_21CAC57D8();
  v15 = v2;
  if ((v2 & 0xF000000000000000) == 0xF000000000000000)
    goto LABEL_14;
  v25 = v14;
  v26 = v2;
  v21 = 0;
  v10 = (id)objc_opt_self();
  sub_21CAAC5B8(v14, v15);
  v12 = (id)sub_21CAC5850();
  sub_21CAAC698(v14, v15);
  v17 = 0;
  v13 = objc_msgSend(v10, sel_JSONObjectWithData_options_error_, v12, 4, &v17);
  v11 = v17;
  v3 = v17;
  v4 = v21;
  v21 = v11;

  if (v13)
  {
    sub_21CAC5CE8();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = v21;
    v7 = (id)sub_21CAC5838();

    swift_willThrow();
    memset(v22, 0, sizeof(v22));
    v23 = 0;
  }
  if (!v23)
  {
    sub_21CAB7D08((uint64_t)v22);
    sub_21CAAC698(v14, v15);
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE060);
    sub_21CAC5E14();
    return sub_21CAC5AF0();
  }
  sub_21CAB7DB0((uint64_t)v22, (uint64_t)v24);
  sub_21CAB7DCC((uint64_t)v24, (uint64_t)v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE068);
  if ((swift_dynamicCast() & 1) != 0)
    v9 = v16;
  else
    v9 = 0;
  if (!v9)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
    sub_21CAAC698(v14, v15);
    goto LABEL_14;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
  sub_21CAAC698(v14, v15);
  return v9;
}

uint64_t sub_21CAB5B10()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_21CAB5B58(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  char *v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  char *v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  id v31;
  id v32;
  objc_class *v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  objc_super v69;
  uint64_t v70;
  unint64_t v71;
  _QWORD v72[2];
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  char *v78;

  v53 = a1;
  v55 = a2;
  v44 = a3;
  v54 = a4;
  v5 = v4;
  v61 = v5;
  v78 = 0;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v74 = 0;
  v73 = 0;
  v67 = 0;
  v62 = 0;
  v45 = sub_21CAC59D0();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = (*(_QWORD *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v7, v8, v9);
  v48 = (uint64_t)&v37 - v47;
  v49 = sub_21CAC5AB4();
  v50 = *(_QWORD *)(v49 - 8);
  v51 = (*(_QWORD *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v62, v10, v11, v12);
  v52 = (uint64_t)&v37 - v51;
  v56 = sub_21CAC5940();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = (*(_QWORD *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (void *)MEMORY[0x24BDAC7A8](v61, v55, v13, v54);
  v65 = (char *)&v37 - v58;
  v78 = (char *)&v37 - v58;
  v76 = v15;
  v75 = v16;
  v74 = a3;
  v59 = 1;
  v73 = v17 & 1;
  v18 = v14;
  v19 = v61;
  v20 = v61;
  v77 = v61;
  v60 = OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion;
  v21 = sub_21CAC5B98();
  v22 = v61;
  v23 = (uint64_t *)&v61[v60];
  *v23 = v21;
  v23[1] = v24;

  v63 = sub_21CAC5AC0();
  v25 = sub_21CAC5A48();
  v66 = v72;
  v72[0] = v25;
  v72[1] = v26;
  v64 = sub_21CAB3CA4();
  sub_21CAB3D14();
  v68 = MEMORY[0x24BDCDDE8];
  sub_21CAC5928();
  sub_21CAAC668((uint64_t)v66);
  sub_21CAC5934();
  v37 = v70;
  v38 = v71;
  sub_21CAB4A58();
  v39 = sub_21CAC585C();
  v40 = v27;
  sub_21CAAC698(v37, v38);
  v28 = v40;
  v29 = v61;
  v30 = (uint64_t *)&v61[OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash];
  *v30 = v39;
  v30[1] = v28;

  v42 = 0;
  type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v52, v55, v49);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v48, v53, v45);
  v31 = sub_21CAB463C(v52, v48, v54 & 1);
  v32 = v61;
  *(_QWORD *)&v61[OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData] = v31;

  (*(void (**)(char *, uint64_t))(v57 + 8))(v65, v56);
  v41 = v77;
  v33 = (objc_class *)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  v69.receiver = v41;
  v69.super_class = v33;
  v43 = objc_msgSendSuper2(&v69, sel_init);
  v34 = v43;
  v77 = v43;
  v35 = sub_21CAC5A78();
  (*(void (**)(uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v44);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v55, v49);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v53, v45);

  return v43;
}

uint64_t type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData()
{
  return objc_opt_self();
}

uint64_t sub_21CAB6010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  sub_21CAC5C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  result = sub_21CAC58BC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.ECv2EncryptedDataContainer")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.ECv2EncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv2Encryption.swift", 33, 2, v1, 0xDBuLL, 0xFuLL);
  __break(1u);
  return result;
}

BOOL sub_21CAB6200(char a1, char a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (a1 == 1)
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_21CAB62D4()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CAB637C()
{
  char v2;
  char v3;
  char v4;
  unsigned __int8 v5;

  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v4 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v3 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v2 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_21CAB65AC()
{
  return 3;
}

uint64_t sub_21CAB65C4()
{
  sub_21CAB7E10();
  return sub_21CAC5D6C();
}

uint64_t sub_21CAB660C()
{
  return 0;
}

uint64_t sub_21CAB6628()
{
  return sub_21CAC5B98();
}

BOOL sub_21CAB66F8(char *a1, char *a2)
{
  return sub_21CAB6200(*a1, *a2);
}

uint64_t sub_21CAB6718()
{
  return sub_21CAB65C4();
}

uint64_t sub_21CAB6730()
{
  return sub_21CAB62D4();
}

uint64_t sub_21CAB6748()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CAB675C()
{
  return sub_21CAB6628();
}

uint64_t sub_21CAB6774@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAB637C();
  *a1 = result;
  return result;
}

uint64_t sub_21CAB679C()
{
  return sub_21CAB660C();
}

uint64_t sub_21CAB67B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAB65AC();
  *a1 = result;
  return result;
}

uint64_t sub_21CAB67E0()
{
  sub_21CAB7E7C();
  return sub_21CAC5E8C();
}

uint64_t sub_21CAB680C()
{
  sub_21CAB7E7C();
  return sub_21CAC5E98();
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  id v38;
  char v39;
  uint64_t v40;
  _QWORD *v41;

  v23 = a1;
  v41 = 0;
  v40 = 0;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE078);
  v24 = *(_QWORD *)(v33 - 8);
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v28 = (char *)v10 - v25;
  v41 = (_QWORD *)MEMORY[0x24BDAC7A8](v23, v2, v3, v4);
  v40 = v1;
  v26 = v41[3];
  v27 = v41[4];
  __swift_project_boxed_opaque_existential_1(v41, v26);
  sub_21CAB7E7C();
  sub_21CAC5E80();
  v5 = v30;
  v31 = *(_QWORD *)(v29 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion);
  v32 = *(_QWORD *)(v29 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion + 8);
  swift_bridgeObjectRetain();
  v39 = 0;
  sub_21CAC5DC0();
  v34 = v5;
  v35 = v5;
  if (v5)
  {
    v11 = v35;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v28, v33);
    v12 = v11;
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = *(id *)(v29 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData);
    v6 = v17;
    v20 = &v38;
    v38 = v17;
    v18 = &v37;
    v37 = 1;
    v19 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
    sub_21CAB7EE8();
    v7 = v34;
    sub_21CAC5DCC();
    v21 = v7;
    v22 = v7;
    if (v7)
    {
      v10[1] = v22;

      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v28, v33);
    }
    else
    {

      v8 = v21;
      v13 = *(_QWORD *)(v29 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash);
      v14 = *(_QWORD *)(v29 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash + 8);
      swift_bridgeObjectRetain();
      v36 = 2;
      sub_21CAC5DC0();
      v15 = v8;
      v16 = v8;
      if (v8)
        v10[0] = v16;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v28, v33);
    }
  }
  return result;
}

uint64_t sub_21CAB6BD4()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x24BEE4EA0]) + 0x78))();
}

id MCLECv2Encryption.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MCLECv2Encryption.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  objc_class *v44;
  id v45;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  v49 = 0;
  v41 = 0;
  v25 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v1, v2, v3);
  v40 = (uint64_t)&v25 - v25;
  v26 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v41, v4, v5, v6);
  v39 = (char *)&v25 - v26;
  v7 = sub_21CAC591C();
  v27 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v38 = (char *)&v25 - v27;
  v11 = v0;
  v12 = v0;
  v13 = v0;
  v49 = v0;
  v42 = OBJC_IVAR___MCLECv2Encryption_queue;
  v31 = sub_21CAAEEF8();
  v29 = 17;
  v14 = sub_21CAC5E08();
  v33 = &v47;
  v47 = v14;
  v48 = v15;
  v30 = 1;
  sub_21CAC5B98();
  v28 = v16;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v44 = (objc_class *)type metadata accessor for MCLECv2Encryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v32 = v17;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v35 = v47;
  v34 = v48;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v36 = sub_21CAC5B8C();
  v37 = v18;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v40);
  v19 = sub_21CAC5CD0();
  v20 = v43;
  *(_QWORD *)&v43[v42] = v19;

  v21 = v43;
  *(_QWORD *)&v43[OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength] = 32;

  v22 = v43;
  v43[OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding] = 0;

  v46.receiver = v49;
  v46.super_class = v44;
  v45 = objc_msgSendSuper2(&v46, sel_init);
  v23 = v45;
  v49 = v45;

  return v45;
}

id MCLECv2Encryption.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21CAB6FB0()
{
  sub_21CAB8F70();
  sub_21CAB8FE0();
  return sub_21CAC5F1C();
}

uint64_t sub_21CAB6FF0()
{
  sub_21CAB8F70();
  return sub_21CAC5EC8() & 1;
}

uint64_t sub_21CAB7028()
{
  sub_21CAB8F70();
  return sub_21CAC5EEC();
}

uint64_t sub_21CAB7064()
{
  sub_21CAB8F70();
  return sub_21CAC5ED4();
}

uint64_t sub_21CAB70A0()
{
  sub_21CAB8F70();
  return sub_21CAC5EE0();
}

uint64_t sub_21CAB70DC()
{
  sub_21CAB8F70();
  return sub_21CAC5EA4() & 1;
}

uint64_t sub_21CAB711C()
{
  sub_21CAB8F70();
  return sub_21CAC5EB0();
}

uint64_t sub_21CAB7158()
{
  sub_21CAB8F70();
  return sub_21CAC5EBC();
}

uint64_t sub_21CAB7194()
{
  sub_21CAB8F70();
  sub_21CAB8FE0();
  return sub_21CAC5F10();
}

uint64_t sub_21CAB71D4()
{
  sub_21CAB8F70();
  sub_21CAB8FE0();
  return sub_21CAC5EF8();
}

uint64_t sub_21CAB7214()
{
  sub_21CAB8F70();
  sub_21CAB8FE0();
  return sub_21CAC5F04();
}

uint64_t sub_21CAB7254()
{
  return sub_21CAC5D18();
}

uint64_t sub_21CAB7268()
{
  return sub_21CAC5D30() & 1;
}

uint64_t sub_21CAB7280()
{
  return sub_21CAC5D00() & 1;
}

uint64_t sub_21CAB7298()
{
  return sub_21CAC5D0C() & 1;
}

uint64_t sub_21CAB72B0()
{
  return sub_21CAC5D24() & 1;
}

uint64_t sub_21CAB72C8()
{
  return sub_21CAC5D48();
}

uint64_t sub_21CAB7300()
{
  return sub_21CAC5D3C();
}

uint64_t sub_21CAB7314()
{
  sub_21CAB8AE4();
  return sub_21CAC5E20() & 1;
}

uint64_t sub_21CAB735C()
{
  sub_21CAAF6D0();
  return sub_21CAC5CF4();
}

uint64_t sub_21CAB7398@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = nullsub_3(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_21CAB73C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = nullsub_3(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_21CAB7404@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_21CAB7434(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_21CAB7464(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF)
      goto LABEL_12;
    v5 = (a3 + 1);
  }
  else
  {
    v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL)
        v5 = (v6 | (a3 >> 12)) + 8487393;
      else
        v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
    }
  }
  v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0)
    return a1(&v8, v4);
  sub_21CAC5DB4();
  __break(1u);
LABEL_12:
  result = sub_21CAC5DA8();
  __break(1u);
  return result;
}

uint64_t sub_21CAB77A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  unsigned int v11;
  uint64_t result;
  char v13[8];
  uint64_t v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v16;
  uint64_t v17[2];
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a11;
  v30 = "Fatal error";
  v31 = "Unexpectedly found nil while unwrapping an Optional value";
  v32 = "Swift/StaticString.swift";
  v33 = "Not enough bits to represent the passed value";
  v34 = "Swift/Integers.swift";
  v35 = "UnsafeBufferPointer with negative count";
  v36 = "Swift/UnsafeBufferPointer.swift";
  v37 = 0;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a1;
  v43 = a2;
  v44 = a10;
  v45 = a11;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = v17;
        MEMORY[0x24BDAC7A8](v17, a2, v19, a4);
        v15 = sub_21CAB9924;
        v16 = &v38;
        sub_21CAB7464((uint64_t (*)(uint64_t *, uint64_t))sub_21CAB9964, (uint64_t)v13, v11);
        return (uint64_t)v18;
      }
      v13[0] = 2;
      v14 = 148;
      LODWORD(v15) = 0;
      sub_21CAC5DA8();
      __break(1u);
    }
    v13[0] = 2;
    v14 = 3455;
    LODWORD(v15) = 0;
    sub_21CAC5DA8();
    __break(1u);
  }
  if (v23)
    v46 = v23;
  else
    v46 = 0;
  v17[0] = v46;
  if (!v46)
  {
    v13[0] = 2;
    v14 = 136;
    LODWORD(v15) = 0;
    sub_21CAC5DA8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_21CAB9048(v17[0], v24, v25, v26, v27, v21, v22, v28, v20, v29);
  result = sub_21CAC5DB4();
  __break(1u);
  return result;
}

unint64_t sub_21CAB7B6C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE5C0;
  if (!qword_2552CE5C0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8ADC, &unk_24E09AD28);
    atomic_store(v0, (unint64_t *)&qword_2552CE5C0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB7BD8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE5C8;
  if (!qword_2552CE5C8)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8A8C, &unk_24E09AD28);
    atomic_store(v0, (unint64_t *)&qword_2552CE5C8);
    return v0;
  }
  return v2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

unint64_t sub_21CAB7C98()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE058;
  if (!qword_2552CE058)
  {
    v0 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
    v1 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv2Encryption.ECv2EncryptedDataContainer, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE058);
    return v1;
  }
  return v3;
}

uint64_t sub_21CAB7D08(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

__n128 sub_21CAB7DB0(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_21CAB7DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

unint64_t sub_21CAB7E10()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE5D0;
  if (!qword_2552CE5D0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8A4C, &unk_24E09ADB8);
    atomic_store(v0, (unint64_t *)&qword_2552CE5D0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB7E7C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE5D8[0];
  if (!qword_2552CE5D8[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC89FC, &unk_24E09ADB8);
    atomic_store(v0, qword_2552CE5D8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB7EE8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE080;
  if (!qword_2552CE080)
  {
    v0 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
    v1 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE080);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB7F58()
{
  return sub_21CAAF740();
}

uint64_t getEnumTagSinglePayload for MCLECv2Encryption.ECv2EncryptionError(uint64_t a1, int a2)
{
  int v3;

  if (a2)
  {
    if (*(_BYTE *)(a1 + 17))
      v3 = *(_DWORD *)a1;
    else
      v3 = -1;
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECv2Encryption.ECv2EncryptionError(uint64_t result, int a2, int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 17);
  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 16) = 0;
    if (a3)
      *v3 = 1;
  }
  else if (a3)
  {
    *v3 = 0;
  }
  return result;
}

uint64_t sub_21CAB81EC(uint64_t a1)
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE0B0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 48))(a1, 3);
}

uint64_t sub_21CAB8230(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE0B0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, a2, 3);
}

ValueMetadata *type metadata accessor for MCLECv2Encryption.ECv2EncryptionError()
{
  return &type metadata for MCLECv2Encryption.ECv2EncryptionError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_21CAB8298(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFD)
      goto LABEL_15;
    v7 = ((a2 + 2) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 3;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CAB8448(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFD)
  {
    v5 = ((a3 + 2) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFD)
  {
    v4 = ((a2 - 254) >> 8) + 1;
    *result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 2;
  }
  return result;
}

uint64_t sub_21CAB868C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21CAB8698(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.CodingKeys()
{
  return &unk_24E09AD28;
}

uint64_t sub_21CAB86B4(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFD)
      goto LABEL_15;
    v7 = ((a2 + 2) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 3;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CAB8864(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFD)
  {
    v5 = ((a3 + 2) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFD)
  {
    v4 = ((a2 - 254) >> 8) + 1;
    *result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 2;
  }
  return result;
}

uint64_t sub_21CAB8AA8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21CAB8AB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.CodingKeys()
{
  return &unk_24E09ADB8;
}

unint64_t sub_21CAB8AD0()
{
  return sub_21CAB8AE4();
}

unint64_t sub_21CAB8AE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE110;
  if (!qword_2552CE110)
  {
    v0 = type metadata accessor for WritingOptions();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8894, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE110);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB8B54()
{
  return sub_21CAAF6D0();
}

unint64_t sub_21CAB8B68()
{
  return sub_21CAB8B7C();
}

unint64_t sub_21CAB8B7C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CECE0;
  if (!qword_2552CECE0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC890C, &unk_24E09ADB8);
    atomic_store(v0, (unint64_t *)&qword_2552CECE0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8BE8()
{
  return sub_21CAB8BFC();
}

unint64_t sub_21CAB8BFC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CECE8[0];
  if (!qword_2552CECE8[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8934, &unk_24E09ADB8);
    atomic_store(v0, qword_2552CECE8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8C68()
{
  return sub_21CAB8C7C();
}

unint64_t sub_21CAB8C7C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CED70;
  if (!qword_2552CED70)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC895C, &unk_24E09ADB8);
    atomic_store(v0, (unint64_t *)&qword_2552CED70);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8CE8()
{
  return sub_21CAB8CFC();
}

unint64_t sub_21CAB8CFC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CEE00;
  if (!qword_2552CEE00)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8984, &unk_24E09AD28);
    atomic_store(v0, (unint64_t *)&qword_2552CEE00);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8D68()
{
  return sub_21CAB8D7C();
}

unint64_t sub_21CAB8D7C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CEE08[0];
  if (!qword_2552CEE08[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC89AC, &unk_24E09AD28);
    atomic_store(v0, qword_2552CEE08);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8DE8()
{
  return sub_21CAB8DFC();
}

unint64_t sub_21CAB8DFC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CEE90[0];
  if (!qword_2552CEE90[0])
  {
    v0 = MEMORY[0x220786F8C]("}&]1TE", &unk_24E09AD28);
    atomic_store(v0, qword_2552CEE90);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAB8E68()
{
  return sub_21CAB8E7C();
}

unint64_t sub_21CAB8E7C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE118;
  if (!qword_2552CE118)
  {
    v0 = type metadata accessor for WritingOptions();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8868, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE118);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB8EEC()
{
  return sub_21CAB8F00();
}

unint64_t sub_21CAB8F00()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE120;
  if (!qword_2552CE120)
  {
    v0 = type metadata accessor for WritingOptions();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8834, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE120);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB8F70()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE128;
  if (!qword_2552CE128)
  {
    v0 = type metadata accessor for WritingOptions();
    v1 = MEMORY[0x220786F8C](&unk_21CAC88D0, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE128);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB8FE0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE130;
  if (!qword_2552CE130)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(v0, (unint64_t *)&qword_2552CE130);
    return v0;
  }
  return v2;
}

uint64_t sub_21CAB9048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  unsigned int v10;
  uint64_t result;
  char v12[8];
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = "Fatal error";
  v30 = "Unexpectedly found nil while unwrapping an Optional value";
  v31 = "Swift/StaticString.swift";
  v32 = "Not enough bits to represent the passed value";
  v33 = "Swift/Integers.swift";
  v34 = "UnsafeBufferPointer with negative count";
  v35 = "Swift/UnsafeBufferPointer.swift";
  v36 = 0;
  v38 = a6;
  v39 = a7;
  v40 = a1;
  v41 = a2;
  v42 = a8;
  v43 = a10;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = &v16;
        MEMORY[0x24BDAC7A8](&v16, a2, v19, a4);
        v14 = sub_21CAB998C;
        v15 = &v37;
        sub_21CAB7464((uint64_t (*)(uint64_t *, uint64_t))sub_21CAB99A8, (uint64_t)v12, v10);
        return (uint64_t)v18;
      }
      v12[0] = 2;
      v13 = 148;
      LODWORD(v14) = 0;
      sub_21CAC5DA8();
      __break(1u);
    }
    v12[0] = 2;
    v13 = 3455;
    LODWORD(v14) = 0;
    sub_21CAC5DA8();
    __break(1u);
  }
  if (v23)
    v44 = v23;
  else
    v44 = 0;
  v17 = v44;
  if (!v44)
  {
    v12[0] = 2;
    v13 = 136;
    LODWORD(v14) = 0;
    sub_21CAC5DA8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_21CAB93DC(v17, v24, v25, v26, v21, v22, v27, v28);
  result = sub_21CAC5DB4();
  __break(1u);
  return result;
}

uint64_t sub_21CAB93DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t result;

  if (!a3)
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_21CAC5DA8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_21CAC5DA8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF)
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                sub_21CAC5DA8();
                __break(1u);
              }
              sub_21CAC5DA8();
              __break(1u);
            }
            sub_21CAC5DA8();
            __break(1u);
          }
          sub_21CAC5DA8();
          __break(1u);
        }
        sub_21CAC5DA8();
        __break(1u);
      }
      sub_21CAC5DA8();
      __break(1u);
    }
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAC5DA8();
  __break(1u);
  return result;
}

uint64_t sub_21CAB9924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21CAB9048(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_21CAB9964(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CAB998C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB93DC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_21CAB99A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CAB99D0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_21CAC5CA0();
      v1 = sub_21CAC5C28();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
      swift_retain();
      v3 = v2;
    }
    sub_21CAC5CA0();
    return v3;
  }
  return result;
}

uint64_t sub_21CAB9A88(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_21CAC5904();
      v1 = sub_21CAC5C28();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
      swift_retain();
      v3 = v2;
    }
    sub_21CAC5904();
    return v3;
  }
  return result;
}

unint64_t sub_21CAB9B40()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE138;
  if (!qword_2552CE138)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCDE40], MEMORY[0x24BDCDDE8]);
    atomic_store(v0, (unint64_t *)&qword_2552CE138);
    return v0;
  }
  return v2;
}

uint64_t sub_21CAB9BA8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAB9BEC()
{
  uint64_t v0;

  return sub_21CAB2EAC(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_63(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_64()
{
  return swift_release();
}

uint64_t sub_21CAB9C58()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAB9C9C()
{
  uint64_t v0;

  return sub_21CAB2C44(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_69(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_70()
{
  return swift_release();
}

uint64_t sub_21CAB9D08()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAB9D4C()
{
  uint64_t v0;

  return sub_21CAB1FC0(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_75(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_76()
{
  return swift_release();
}

uint64_t sub_21CAB9DB8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAB9DFC()
{
  uint64_t v0;

  return sub_21CAB1D58(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_81(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_82()
{
  return swift_release();
}

unint64_t sub_21CAB9E68()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE140;
  if (!qword_2552CE140)
  {
    v0 = sub_21CAC5904();
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE5468], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE140);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAB9ED8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE150;
  if (!qword_2552CE150)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552CE148);
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE150);
    return v1;
  }
  return v3;
}

uint64_t sub_21CAB9F48()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAB9F8C()
{
  uint64_t v0;

  return sub_21CAB112C(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_87(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_88()
{
  return swift_release();
}

uint64_t sub_21CAB9FF8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CABA03C()
{
  uint64_t v0;

  return sub_21CAB0DD4(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_93(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_94()
{
  return swift_release();
}

unint64_t sub_21CABA0A8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE158;
  if (!qword_2552CE158)
  {
    v0 = sub_21CAC5CA0();
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE5698], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE158);
    return v1;
  }
  return v3;
}

unint64_t sub_21CABA118()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE168;
  if (!qword_2552CE168)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552CE160);
    v1 = MEMORY[0x220786F8C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE168);
    return v1;
  }
  return v3;
}

uint64_t sub_21CABA188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = 0;
  v16 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v0, v1, v2);
  v31 = (uint64_t)&v15 - v16;
  v17 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v3, v4, v5);
  v30 = (char *)&v15 - v17;
  v18 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC591C() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v6, v7, v8);
  v29 = (char *)&v15 - v18;
  v22 = sub_21CAAEEF8();
  v20 = 17;
  v9 = sub_21CAC5E08();
  v24 = &v33;
  v33 = v9;
  v34 = v10;
  v21 = 1;
  sub_21CAC5B98();
  v19 = v11;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLHPKEEncryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v23 = v12;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v26 = v33;
  v25 = v34;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v27 = sub_21CAC5B8C();
  v28 = v13;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v31);
  return sub_21CAC5CD0();
}

uint64_t type metadata accessor for MCLHPKEEncryption()
{
  return objc_opt_self();
}

uint64_t sub_21CABA3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  void (*v19)(void);
  _BYTE *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void);
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v34 = a1;
  v35 = a2;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v31 = (void (*)(void))a7;
  v32 = a8;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v46 = 0;
  v47 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v41 = 0;
  v42 = 0;
  v39 = sub_21CAC5B5C();
  v36 = *(_QWORD *)(v39 - 8);
  v33 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v37 = (char *)&v21 - v33;
  v50 = MEMORY[0x24BDAC7A8](v34, v35, v27, v28);
  v51 = v9;
  v48 = v10;
  v49 = v11;
  v46 = v12;
  v47 = v13;
  v44 = v14;
  v45 = v15;
  v43 = v8;
  sub_21CAC5B50();
  sub_21CAB01F8();
  v38 = sub_21CAC5B38();
  v40 = v16;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v39);
  if ((v40 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CABA5C0();
    v18 = (void *)swift_allocError();
    v19 = v31;
    v22 = v18;
    *v20 = 3;
    v19();

    return swift_release();
  }
  else
  {
    v25 = v38;
    v26 = v40;
    v24 = v40;
    v23 = v38;
    v41 = v38;
    v42 = v40;
    sub_21CABAC34(v38, v40, v27, v28, v29, v30, (uint64_t)v31, v32);
    return sub_21CAAC698(v23, v24);
  }
}

unint64_t sub_21CABA5C0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE170;
  if (!qword_2552CE170)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC8CA0, &unk_24E09B390);
    atomic_store(v0, (unint64_t *)&qword_2552CE170);
    return v0;
  }
  return v2;
}

uint64_t sub_21CABA77C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_21CABA7A8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v7;
  void *v8;
  unint64_t v9;
  _BYTE *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29[10];
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v29[2] = 0;
  v30 = 0;
  v31 = 0;
  v29[9] = a1;
  v29[7] = a2;
  v29[8] = a3;
  v29[5] = a4;
  v29[6] = a5;
  v29[3] = a6;
  v29[4] = a7;
  v32 = 0;
  v25 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v27 = sub_21CAC5AD8();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_21CAC5E14();
  sub_21CAAF6D0();
  sub_21CAC5CF4();
  v29[0] = 0;
  v28 = objc_msgSend(v25, sel_dataWithJSONObject_options_error_, v27, v29[1], v29);
  v26 = v29[0];
  v7 = v29[0];
  v8 = v32;
  v32 = v26;

  swift_unknownObjectRelease();
  if (v28)
  {
    v15 = sub_21CAC5868();
    v16 = v9;

    v17 = v15;
    v18 = v16;
  }
  else
  {
    v12 = v32;
    v13 = (id)sub_21CAC5838();

    swift_willThrow();
    v17 = 0;
    v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CABA5C0();
    v14 = (id)swift_allocError();
    *v11 = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    v30 = v17;
    v31 = v18;
    sub_21CABAC34(v17, v18, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
    return sub_21CAAC698(v17, v18);
  }
}

uint64_t sub_21CABAC34(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(void *);
  void (*v30)(void *);
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(void *);
  void (*v48)(void *);
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t aBlock;
  int v61;
  int v62;
  uint64_t (*v63)(uint64_t);
  void *v64;
  void (*v65)();
  _QWORD *v66;
  void (*v67)(void *);
  uint64_t v68;
  void (*v69)(void *);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v45 = a1;
  v46 = a2;
  v43 = a3;
  v44 = a4;
  v37 = a5;
  v38 = a6;
  v40 = a7;
  v41 = a8;
  v78 = 0;
  v79 = 0;
  v76 = 0;
  v77 = 0;
  v74 = 0;
  v75 = 0;
  v72 = 0;
  v73 = 0;
  v71 = 0;
  v69 = 0;
  v70 = 0;
  v67 = 0;
  v68 = 0;
  v49 = 0;
  v52 = sub_21CAC5904();
  v50 = *(_QWORD *)(v52 - 8);
  v35 = (*(_QWORD *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v51 = (char *)&v35 - v35;
  v55 = sub_21CAC591C();
  v53 = *(_QWORD *)(v55 - 8);
  v36 = (*(_QWORD *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v38, v46, v43, v44);
  v54 = (char *)&v35 - v36;
  v78 = v13;
  v79 = v14;
  v76 = v15;
  v77 = v16;
  v74 = v17;
  v75 = v12;
  v72 = v18;
  v73 = v19;
  v71 = v8;
  swift_retain();
  v39 = 32;
  v42 = 7;
  v20 = swift_allocObject();
  v21 = v38;
  v59 = v20;
  *(_QWORD *)(v20 + 16) = v37;
  *(_QWORD *)(v20 + 24) = v21;
  v47 = sub_21CABB37C;
  v69 = sub_21CABB37C;
  v70 = v20;
  swift_retain();
  v22 = swift_allocObject();
  v23 = v41;
  v58 = v22;
  *(_QWORD *)(v22 + 16) = v40;
  *(_QWORD *)(v22 + 24) = v23;
  v48 = sub_21CABB62C;
  v67 = sub_21CABB62C;
  v68 = v22;
  v57 = *(id *)(v8 + OBJC_IVAR___MCLHPKEEncryption_queue);
  v24 = v57;
  swift_bridgeObjectRetain();
  sub_21CAAC5B8(v45, v46);
  swift_retain();
  swift_retain();
  v25 = swift_allocObject();
  v26 = v44;
  v27 = v45;
  v28 = v46;
  v29 = v47;
  v30 = v48;
  v31 = v59;
  v32 = (_QWORD *)v25;
  v33 = v58;
  v32[2] = v43;
  v32[3] = v26;
  v32[4] = v27;
  v32[5] = v28;
  v32[6] = v29;
  v32[7] = v31;
  v32[8] = v30;
  v32[9] = v33;
  v65 = sub_21CABC18C;
  v66 = v32;
  aBlock = MEMORY[0x24BDAC760];
  v61 = 1107296256;
  v62 = 0;
  v63 = sub_21CAB1194;
  v64 = &block_descriptor_0;
  v56 = _Block_copy(&aBlock);
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v49, v54, v51, v56);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
  _Block_release(v56);
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t sub_21CABB030()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CABB06C(uint64_t a1)
{
  uint64_t v1;

  return sub_21CABA77C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CABB074()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CABB0B0(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CABB0B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CABB0F4(uint64_t a1)
{
  uint64_t v1;

  return sub_21CABA77C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CABB0FC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CABB138(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

void sub_21CABB140(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CABD990;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_33;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CABB340()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CABB37C(void *a1)
{
  uint64_t v1;

  sub_21CABB140(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21CABB388(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CABB3F0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CABD8E0;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_27;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CABB5F0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CABB62C(void *a1)
{
  uint64_t v1;

  sub_21CABB3F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21CABB638(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CABB6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(id), uint64_t a8)
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __SecTrust *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  char *v64;
  unint64_t v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  void (*v101)(char *, uint64_t, uint64_t);
  _QWORD *v102;
  void *v103;
  uint64_t v104;
  __SecTrust *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  unint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(void);
  uint64_t v144;
  void (*v145)(id);
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char *v152;
  unint64_t v153;
  char *v154;
  uint64_t v155;
  __SecTrust *v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  _QWORD v160[2];
  _QWORD v161[2];
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  _QWORD v174[2];
  uint64_t v175;
  unint64_t v176;
  __SecTrust *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  char *v188;
  char *v189;

  v148 = a1;
  v147 = a2;
  v141 = a3;
  v142 = a4;
  v143 = a5;
  v144 = a6;
  v145 = a7;
  v146 = a8;
  v189 = 0;
  v188 = 0;
  v187 = 0;
  v185 = 0;
  v186 = 0;
  v183 = 0;
  v184 = 0;
  v181 = 0;
  v182 = 0;
  v179 = 0;
  v180 = 0;
  v178 = 0;
  v177 = 0;
  v175 = 0;
  v176 = 0;
  v168 = 0;
  v169 = 0;
  v162 = 0;
  v163 = 0;
  v158 = 0;
  v159 = 0;
  v134 = 0;
  v110 = sub_21CAC5A3C();
  v111 = *(_QWORD *)(v110 - 8);
  v112 = (*(_QWORD *)(v111 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x24BDAC7A8](0, v8, v9, v10);
  v113 = (char *)&v68 - v112;
  v114 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11, (char *)&v68 - v112, v13, v14);
  v115 = (char *)&v68 - v114;
  v189 = (char *)&v68 - v114;
  v116 = sub_21CAC5B5C();
  v117 = *(_QWORD *)(v116 - 8);
  v118 = (*(_QWORD *)(v117 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v134, v15, v16, v17);
  v119 = (char *)&v68 - v118;
  v120 = sub_21CAC5A0C();
  v121 = *(_QWORD *)(v120 - 8);
  v122 = (*(_QWORD *)(v121 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v134, v18, v19, v20);
  v123 = (char *)&v68 - v122;
  v124 = sub_21CAC59F4();
  v125 = *(_QWORD *)(v124 - 8);
  v126 = (*(_QWORD *)(v125 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v134, v21, v22, v23);
  v127 = (char *)&v68 - v126;
  v128 = sub_21CAC59E8();
  v129 = *(_QWORD *)(v128 - 8);
  v130 = (*(_QWORD *)(v129 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v27 = MEMORY[0x24BDAC7A8](v134, v24, v25, v26);
  v131 = (char *)&v68 - v130;
  v132 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v27, (char *)&v68 - v130, v29, v30);
  v133 = (char *)&v68 - v132;
  v188 = (char *)&v68 - v132;
  v135 = sub_21CAC5A00();
  v136 = *(_QWORD *)(v135 - 8);
  v137 = (*(_QWORD *)(v136 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v34 = MEMORY[0x24BDAC7A8](v134, v31, v32, v33);
  v138 = (char *)&v68 - v137;
  v139 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v34, (char *)&v68 - v137, v36, v37);
  v140 = (char *)&v68 - v139;
  v149 = sub_21CAC5A78();
  v150 = *(_QWORD *)(v149 - 8);
  v151 = (*(_QWORD *)(v150 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v38 = MEMORY[0x24BDAC7A8](v148, v147, v141, v142);
  v152 = (char *)&v68 - v151;
  v153 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  v43 = MEMORY[0x24BDAC7A8](v38, v40, v41, v42);
  v154 = (char *)&v68 - v153;
  v187 = (char *)&v68 - v153;
  v185 = v43;
  v186 = v44;
  v183 = v45;
  v184 = v46;
  v181 = v47;
  v182 = v48;
  v179 = v49;
  v180 = v50;
  v51 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  v155 = 0;
  v156 = v51;
  v157 = 0;
  v105 = v51;
  v177 = v51;
  v52 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v51);
  v106 = 0;
  v107 = v52;
  v108 = v53;
  v109 = 0;
  v100 = v53;
  v99 = v52;
  v175 = v52;
  v176 = v53;
  sub_21CAAC5B8(v52, v53);
  v102 = v174;
  v174[0] = v99;
  v174[1] = v100;
  v54 = *MEMORY[0x24BDC6768];
  v101 = *(void (**)(char *, uint64_t, uint64_t))(v136 + 104);
  v101(v140, v54, v135);
  sub_21CAC5A84();
  v103 = 0;
  v104 = 0;
  v101(v138, *MEMORY[0x24BDC6768], v135);
  (*(void (**)(char *, _QWORD, uint64_t))(v125 + 104))(v127, *MEMORY[0x24BDC6758], v124);
  (*(void (**)(char *, _QWORD, uint64_t))(v121 + 104))(v123, *MEMORY[0x24BDC6780], v120);
  sub_21CAC59DC();
  v94 = sub_21CAC5B98();
  v96 = v55;
  sub_21CAC5B50();
  sub_21CAB01F8();
  v97 = sub_21CAC5B38();
  v98 = v56;
  v95 = *(void (**)(char *, uint64_t))(v117 + 8);
  v95(v119, v116);
  swift_bridgeObjectRelease();
  v170 = v97;
  v171 = v98;
  if ((v98 & 0xF000000000000000) == 0xF000000000000000)
  {
    v172 = sub_21CAC58B0();
    v173 = v57;
    sub_21CABD84C((uint64_t)&v170);
  }
  else
  {
    v172 = v170;
    v173 = v171;
  }
  v58 = v103;
  v90 = v172;
  v91 = v173;
  v168 = v172;
  v169 = v173;
  (*(void (**)(char *, char *, uint64_t))(v150 + 16))(v152, v154, v149);
  (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v131, v133, v128);
  sub_21CAAC5B8(v90, v91);
  sub_21CAC5A18();
  v92 = v58;
  v93 = v58;
  if (v58)
  {
    v69 = v93;
    sub_21CAAC698(v90, v91);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v133, v128);
    (*(void (**)(char *, uint64_t))(v150 + 8))(v154, v149);
    sub_21CAAC698(v99, v100);

    v70 = v69;
  }
  else
  {
    v86 = sub_21CAC5B98();
    v87 = v59;
    sub_21CAC5B50();
    sub_21CAB01F8();
    v88 = sub_21CAC5B38();
    v89 = v60;
    v95(v119, v116);
    swift_bridgeObjectRelease();
    v164 = v88;
    v165 = v89;
    if ((v89 & 0xF000000000000000) == 0xF000000000000000)
    {
      v166 = sub_21CAC58B0();
      v167 = v61;
      sub_21CABD84C((uint64_t)&v164);
    }
    else
    {
      v166 = v164;
      v167 = v165;
    }
    v62 = v92;
    v79 = v166;
    v80 = v167;
    v162 = v166;
    v163 = v167;
    v82 = v161;
    v161[0] = v141;
    v161[1] = v142;
    v81 = v160;
    v160[0] = v166;
    v160[1] = v167;
    sub_21CAB3D14();
    v83 = sub_21CAC5A30();
    v84 = v63;
    v85 = v62;
    if (!v62)
    {
      v64 = v113;
      v77 = v84;
      v76 = v83;
      v158 = v83;
      v159 = v84;
      swift_retain();
      v72 = type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
      sub_21CAAC5B8(v76, v77);
      (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v64, v115, v110);
      v73 = sub_21CAC5A24();
      v74 = v65;
      v78 = *(void (**)(char *, uint64_t))(v111 + 8);
      v78(v113, v110);
      v75 = sub_21CABC1B0(v76, v77, v73, v74);
      v143();

      swift_release();
      sub_21CAAC698(v76, v77);
      sub_21CAAC698(v79, v80);
      v78(v115, v110);
      sub_21CAAC698(v90, v91);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v133, v128);
      (*(void (**)(char *, uint64_t))(v150 + 8))(v154, v149);
      sub_21CAAC698(v99, v100);

      return;
    }
    v68 = v85;
    sub_21CAAC698(v79, v80);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v115, v110);
    sub_21CAAC698(v90, v91);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v133, v128);
    (*(void (**)(char *, uint64_t))(v150 + 8))(v154, v149);
    sub_21CAAC698(v99, v100);

    v70 = v68;
  }
  v71 = v70;
  v66 = v70;
  v178 = v71;
  swift_retain();
  v67 = v71;
  v145(v71);

  swift_release();
}

uint64_t sub_21CABC134()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21CAAC698(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21CABC18C()
{
  uint64_t v0;

  sub_21CABB6A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void (**)(void))(v0 + 48), *(_QWORD *)(v0 + 56), *(void (**)(id))(v0 + 64), *(_QWORD *)(v0 + 72));
}

id sub_21CABC1B0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  objc_class *v4;
  id v5;

  v5 = objc_allocWithZone(v4);
  return sub_21CABC3BC(a1, a2, a3, a4);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_21CABC2C4()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLHPKEEncryptedDataContainer_encapsulatedKey);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CABC374()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLHPKEEncryptedDataContainer_cipher);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_21CABC3BC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;
  char *v15;
  id v20;
  objc_super v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;

  v24 = a1;
  v25 = a2;
  v22 = a3;
  v23 = a4;
  v5 = v4;
  v6 = v4;
  v26 = v4;
  sub_21CAB4A58();
  v7 = sub_21CAC585C();
  v8 = (uint64_t *)&v15[OBJC_IVAR___MCLHPKEEncryptedDataContainer_cipher];
  *v8 = v7;
  v8[1] = v9;

  sub_21CAB4A58();
  v10 = sub_21CAC585C();
  v11 = (uint64_t *)&v15[OBJC_IVAR___MCLHPKEEncryptedDataContainer_encapsulatedKey];
  *v11 = v10;
  v11[1] = v12;

  v21.receiver = v26;
  v21.super_class = (Class)type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
  v20 = objc_msgSendSuper2(&v21, sel_init);
  v13 = v20;
  v26 = v20;
  sub_21CAAC698(a3, a4);
  sub_21CAAC698(a1, a2);

  return v20;
}

uint64_t type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer()
{
  return objc_opt_self();
}

id sub_21CABC508()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_21CABC52C()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.HPKEEncryptedDataContainer")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.HPKEEncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLHPKEEncryption.swift", 33, 2, v1, 0x4EuLL, 8uLL);
  __break(1u);
  return result;
}

id sub_21CABC65C()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21CABC6EC(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_21CABC730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_21CABC77C
                                                                                       + dword_21CABC7E4[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_21CABC78C()
{
  uint64_t v1;

  return v1 == 0;
}

void sub_21CABC7F4(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_21CABC844()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CABC8B4()
{
  sub_21CABD1A4();
  return sub_21CAC5D6C();
}

uint64_t sub_21CABC8FC(char *a1)
{
  char v1;

  sub_21CABC6EC(*a1);
  return v1 & 1;
}

uint64_t sub_21CABC91C()
{
  return sub_21CABC8B4();
}

void sub_21CABC934(uint64_t a1)
{
  char *v1;

  sub_21CABC7F4(a1, *v1);
}

uint64_t sub_21CABC94C()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CABC960()
{
  return sub_21CAC5814();
}

uint64_t sub_21CABC974()
{
  return sub_21CAC5808();
}

uint64_t sub_21CABC988()
{
  return sub_21CAC5820();
}

uint64_t sub_21CABC99C()
{
  return sub_21CAC57FC();
}

uint64_t sub_21CABC9B0()
{
  return sub_21CAC5E5C();
}

uint64_t sub_21CABC9C4()
{
  return sub_21CAC5E50();
}

uint64_t sub_21CABC9D8()
{
  return sub_21CAC5E68();
}

uint64_t sub_21CABC9EC()
{
  return sub_21CAC5E44();
}

id sub_21CABCA00()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_21CABCA24()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  objc_class *v40;
  id v41;
  objc_super v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v45 = 0;
  v37 = 0;
  v21 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v1, v2, v3);
  v36 = (uint64_t)&v21 - v21;
  v22 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v37, v4, v5, v6);
  v35 = (char *)&v21 - v22;
  v7 = sub_21CAC591C();
  v23 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v34 = (char *)&v21 - v23;
  v11 = v0;
  v45 = v0;
  v38 = OBJC_IVAR___MCLHPKEEncryption_queue;
  v27 = sub_21CAAEEF8();
  v25 = 17;
  v12 = sub_21CAC5E08();
  v29 = &v43;
  v43 = v12;
  v44 = v13;
  v26 = 1;
  sub_21CAC5B98();
  v24 = v14;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v40 = (objc_class *)type metadata accessor for MCLHPKEEncryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v28 = v15;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v31 = v43;
  v30 = v44;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v32 = sub_21CAC5B8C();
  v33 = v16;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v36);
  v17 = sub_21CAC5CD0();
  v18 = v39;
  *(_QWORD *)&v39[v38] = v17;

  v42.receiver = v45;
  v42.super_class = v40;
  v41 = objc_msgSendSuper2(&v42, sel_init);
  v19 = v41;
  v45 = v41;

  return v41;
}

id sub_21CABCCAC()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLHPKEEncryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL static MCLECCertValidation.evaluateOIDsForCert(base64EncodedCert:commonName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  const __CFData *v15;
  __SecCertificate *v16;
  uint64_t v17;
  unint64_t v18;
  char v20;
  uint64_t v21;
  CFStringRef commonName;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = 0;
  v25 = a3;
  v26 = a4;
  swift_bridgeObjectRetain();
  if (!a4)
  {
    v11 = 1;
    return v11 & 1;
  }
  v20 = 0;
  sub_21CAAD9A0();
  v17 = sub_21CAC5844();
  v18 = v4;
  if ((v4 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_21CAAD9A8();
    swift_allocError();
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_BYTE *)(v9 + 16) = 3;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = v17;
    v24 = v4;
    sub_21CAAC5B8(v17, v4);
    v15 = (const __CFData *)sub_21CAC5850();
    v16 = SecCertificateCreateWithData(0, v15);

    sub_21CAAC698(v17, v18);
    if (v16)
    {
      commonName = 0;
      if (!SecCertificateCopyCommonName(v16, &commonName))
      {
        v14 = (__CFString *)commonName;
        v5 = (id)commonName;
        if (v14)
        {
          v6 = v14;
          sub_21CABD238();
          sub_21CAC5E2C();

          if (v21)
            v13 = v21;
          else
            v13 = 0;
          v12 = v13;
        }
        else
        {
          v12 = 0;
        }
        if (v12)
        {
          v7 = sub_21CAC5BA4();
          if ((v7 & 1) != 0)
            v20 = 1;
          swift_bridgeObjectRelease();
        }
      }
      sub_21CABD210((id *)&commonName);

      sub_21CAAC698(v17, v18);
      swift_bridgeObjectRelease();
      v11 = v20;
      return v11 & 1;
    }
    sub_21CAAD9A8();
    swift_allocError();
    *(_QWORD *)v8 = 1;
    *(_QWORD *)(v8 + 8) = 0;
    *(_BYTE *)(v8 + 16) = 3;
    swift_willThrow();
    sub_21CAAC698(v17, v18);
    swift_bridgeObjectRelease();
  }
  return *MEMORY[0x24BDAC8D0] == v27;
}

unint64_t sub_21CABD1A4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE190;
  if (!qword_2552CE190)
  {
    v0 = MEMORY[0x220786F8C]("A(]1\bD", &unk_24E09B390);
    atomic_store(v0, (unint64_t *)&qword_2552CE190);
    return v0;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21CABD210(id *a1)
{

}

unint64_t sub_21CABD238()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE198;
  if (!qword_2552CE198)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCFB40], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&qword_2552CE198);
    return v0;
  }
  return v2;
}

unint64_t sub_21CABD2A0()
{
  return sub_21CABD2B4();
}

unint64_t sub_21CABD2B4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE1A0;
  if (!qword_2552CE1A0)
  {
    v0 = MEMORY[0x220786F8C]("Y(]10D", &unk_24E09B390);
    atomic_store(v0, (unint64_t *)&qword_2552CE1A0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CABD320()
{
  return sub_21CABA5C0();
}

uint64_t sub_21CABD334(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CABD4E4(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

uint64_t sub_21CABD728(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21CABD734(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for MCLHPKEEncryption.MCLHPKEEncryptionError()
{
  return &unk_24E09B390;
}

unint64_t sub_21CABD750()
{
  return sub_21CAB8AE4();
}

unint64_t sub_21CABD764()
{
  return sub_21CAAF6D0();
}

unint64_t sub_21CABD778()
{
  return sub_21CAB8E7C();
}

unint64_t sub_21CABD78C()
{
  return sub_21CAB8F00();
}

uint64_t sub_21CABD7A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21CAB9048(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_21CABD7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CABD808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB93DC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_21CABD824(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CABD84C(uint64_t a1)
{
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000)
    sub_21CAAC698(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_21CABD89C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CABD8E0()
{
  uint64_t v0;

  return sub_21CABB638(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_25(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_26()
{
  return swift_release();
}

uint64_t sub_21CABD94C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CABD990()
{
  uint64_t v0;

  return sub_21CABB388(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_31(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_32()
{
  return swift_release();
}

BOOL sub_21CABD9FC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFData *v10;
  const __CFData *signedData;
  __CFString *algorithm;
  Boolean v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  const __CFDictionary *v20;
  const __CFData *keyData;
  __SecKey *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  CFErrorRef v29;
  CFErrorRef v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = 0;
  v33 = 0;
  v34 = 0;
  v31 = 0;
  v32 = 0;
  sub_21CAAD9A0();
  v27 = sub_21CAC5844();
  v28 = v0;
  if ((v0 & 0xF000000000000000) == 0xF000000000000000)
    return 0;
  v35 = v27;
  v36 = v0;
  sub_21CAAD9A0();
  v25 = sub_21CAC5844();
  v26 = v1;
  if ((v1 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_21CAAC698(v27, v28);
    return 0;
  }
  v33 = v25;
  v34 = v1;
  sub_21CAAD9A0();
  v23 = sub_21CAC5844();
  v24 = v2;
  if ((v2 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_21CAAC698(v25, v26);
    sub_21CAAC698(v27, v28);
    return 0;
  }
  v31 = v23;
  v32 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE1F8);
  sub_21CAC5E14();
  v18 = v3;
  v15 = *MEMORY[0x24BDE9050];
  v4 = (id)*MEMORY[0x24BDE9050];
  *v18 = v15;
  v16 = *MEMORY[0x24BDE9080];
  v5 = (id)*MEMORY[0x24BDE9080];
  v18[1] = v16;
  v17 = *MEMORY[0x24BDE9028];
  v6 = (id)*MEMORY[0x24BDE9028];
  v18[2] = v17;
  v19 = *MEMORY[0x24BDE9038];
  v7 = (id)*MEMORY[0x24BDE9038];
  v18[3] = v19;
  sub_21CAACABC();
  type metadata accessor for CFString();
  sub_21CABDFA0();
  sub_21CAC5AF0();
  v30 = 0;
  sub_21CAAC5B8(v27, v28);
  keyData = (const __CFData *)sub_21CAC5850();
  swift_bridgeObjectRetain();
  v20 = (const __CFDictionary *)sub_21CAC5AD8();
  v22 = SecKeyCreateWithData(keyData, v20, &v30);

  swift_bridgeObjectRelease();
  sub_21CAAC698(v27, v28);
  if (v22)
  {
    v29 = 0;
    algorithm = (__CFString *)*MEMORY[0x24BDE9350];
    v8 = (id)*MEMORY[0x24BDE9350];
    sub_21CAAC5B8(v25, v26);
    signedData = (const __CFData *)sub_21CAC5850();
    sub_21CAAC5B8(v23, v24);
    v10 = (const __CFData *)sub_21CAC5850();
    v13 = SecKeyVerifySignature(v22, algorithm, signedData, v10, &v29);

    sub_21CAAC698(v23, v24);
    sub_21CAAC698(v25, v26);

    swift_bridgeObjectRelease();
    sub_21CAAC698(v23, v24);
    sub_21CAAC698(v25, v26);
    sub_21CAAC698(v27, v28);
    return v13 != 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_21CAAC698(v23, v24);
    sub_21CAAC698(v25, v26);
    sub_21CAAC698(v27, v28);
    return 0;
  }
}

uint64_t type metadata accessor for CFString()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  v4 = qword_2552CE230;
  if (!qword_2552CE230)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    v4 = ForeignTypeMetadata;
    if (!v0)
    {
      v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2552CE230);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_21CABDFA0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE200;
  if (!qword_2552CE200)
  {
    v0 = type metadata accessor for CFString();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8E34, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE200);
    return v1;
  }
  return v3;
}

id sub_21CABE108()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_21CABE12C()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for MCLSignatureVerification();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for MCLSignatureVerification()
{
  return objc_opt_self();
}

id sub_21CABE1DC()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLSignatureVerification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21CABE224()
{
  MEMORY[0x220786F8C](&unk_21CAC8E08);
  return sub_21CAC58F8();
}

uint64_t sub_21CABE268()
{
  MEMORY[0x220786F8C](&unk_21CAC8E08);
  return sub_21CAC58EC();
}

uint64_t sub_21CABE2B0()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CABE2C4()
{
  MEMORY[0x220786F8C](&unk_21CAC8E08);
  return sub_21CAC58E0() & 1;
}

unint64_t sub_21CABE31C()
{
  return sub_21CABDFA0();
}

unint64_t sub_21CABE330()
{
  return sub_21CABE344();
}

unint64_t sub_21CABE344()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE238;
  if (!qword_2552CE238)
  {
    v0 = type metadata accessor for CFString();
    v1 = MEMORY[0x220786F8C](&unk_21CAC8DDC, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE238);
    return v1;
  }
  return v3;
}

uint64_t variable initialization expression of MCLECv3Encryption.queue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = 0;
  v16 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v0, v1, v2);
  v31 = (uint64_t)&v15 - v16;
  v17 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v3, v4, v5);
  v30 = (char *)&v15 - v17;
  v18 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC591C() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32, v6, v7, v8);
  v29 = (char *)&v15 - v18;
  v22 = sub_21CAAEEF8();
  v20 = 17;
  v9 = sub_21CAC5E08();
  v24 = &v33;
  v33 = v9;
  v34 = v10;
  v21 = 1;
  sub_21CAC5B98();
  v19 = v11;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLECv3Encryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v23 = v12;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v26 = v33;
  v25 = v34;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v27 = sub_21CAC5B8C();
  v28 = v13;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v31);
  return sub_21CAC5CD0();
}

uint64_t type metadata accessor for MCLECv3Encryption()
{
  return objc_opt_self();
}

uint64_t variable initialization expression of MCLECv3Encryption.symmetricKeyLength()
{
  return 32;
}

uint64_t sub_21CABE5DC(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25[10];
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25[2] = 0;
  v26 = 0;
  v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  v28 = 0;
  v21 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v23 = sub_21CAC5AD8();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_21CAC5E14();
  sub_21CAAF6D0();
  sub_21CAC5CF4();
  v25[0] = 0;
  v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  v22 = v25[0];
  v7 = v25[0];
  v8 = v28;
  v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    v15 = sub_21CAC5868();
    v16 = v9;

    v17 = v15;
    v18 = v16;
  }
  else
  {
    v12 = v28;
    v13 = (id)sub_21CAC5838();

    swift_willThrow();
    v17 = 0;
    v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_21CABE938();
    v14 = (id)swift_allocError();
    *(_QWORD *)v11 = 1;
    *(_QWORD *)(v11 + 8) = 0;
    *(_BYTE *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    v26 = v17;
    v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x24BEE4EA0]) + 0x68))();
    return sub_21CAAC698(v17, v18);
  }
}

unint64_t sub_21CABE938()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE240;
  if (!qword_2552CE240)
  {
    v0 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv3Encryption.ECv3EncryptionError, &type metadata for MCLECv3Encryption.ECv3EncryptionError);
    atomic_store(v0, (unint64_t *)&qword_2552CE240);
    return v0;
  }
  return v2;
}

uint64_t sub_21CABEB08(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_21CABEB34()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CABEB70(uint64_t a1)
{
  uint64_t v1;

  return sub_21CABEB08(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CABEB78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CABEBB4(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CABEBBC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(void *);
  void (*v32)(void *);
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(void *);
  void (*v52)(void *);
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t aBlock;
  int v65;
  int v66;
  uint64_t (*v67)(uint64_t);
  void *v68;
  void (*v69)();
  _QWORD *v70;
  void (*v71)(void *);
  uint64_t v72;
  void (*v73)(void *);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v49 = a1;
  v50 = a2;
  v46 = a3;
  v47 = a4;
  v40 = a5;
  v41 = a6;
  v43 = a7;
  v44 = a8;
  v82 = 0;
  v83 = 0;
  v80 = 0;
  v81 = 0;
  v78 = 0;
  v79 = 0;
  v76 = 0;
  v77 = 0;
  v75 = 0;
  v73 = 0;
  v74 = 0;
  v71 = 0;
  v72 = 0;
  v53 = 0;
  v56 = sub_21CAC5904();
  v54 = *(_QWORD *)(v56 - 8);
  v38 = (*(_QWORD *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v55 = (char *)&v37 - v38;
  v59 = sub_21CAC591C();
  v57 = *(_QWORD *)(v59 - 8);
  v39 = (*(_QWORD *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v41, v50, v46, v47);
  v58 = (char *)&v37 - v39;
  v82 = v13;
  v83 = v14;
  v80 = v15;
  v81 = v16;
  v78 = v17;
  v79 = v12;
  v76 = v18;
  v77 = v19;
  v75 = v8;
  swift_retain();
  v42 = 32;
  v45 = 7;
  v20 = swift_allocObject();
  v21 = v41;
  v63 = v20;
  *(_QWORD *)(v20 + 16) = v40;
  *(_QWORD *)(v20 + 24) = v21;
  v51 = sub_21CABF214;
  v73 = sub_21CABF214;
  v74 = v20;
  swift_retain();
  v22 = swift_allocObject();
  v23 = v44;
  v62 = v22;
  *(_QWORD *)(v22 + 16) = v43;
  *(_QWORD *)(v22 + 24) = v23;
  v52 = sub_21CABF4C4;
  v71 = sub_21CABF4C4;
  v72 = v22;
  v61 = *(id *)(v8 + OBJC_IVAR___MCLECv3Encryption_queue);
  v24 = v61;
  swift_bridgeObjectRetain();
  v25 = v48;
  sub_21CAAC5B8(v49, v50);
  swift_retain();
  swift_retain();
  v26 = swift_allocObject();
  v27 = v47;
  v28 = v48;
  v29 = v49;
  v30 = v50;
  v31 = v51;
  v32 = v52;
  v33 = v63;
  v34 = (_QWORD *)v26;
  v35 = v62;
  v34[2] = v46;
  v34[3] = v27;
  v34[4] = v28;
  v34[5] = v29;
  v34[6] = v30;
  v34[7] = v31;
  v34[8] = v33;
  v34[9] = v32;
  v34[10] = v35;
  v69 = sub_21CAC00B4;
  v70 = v34;
  aBlock = MEMORY[0x24BDAC760];
  v65 = 1107296256;
  v66 = 0;
  v67 = sub_21CAB1194;
  v68 = &block_descriptor_1;
  v60 = _Block_copy(&aBlock);
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v53, v58, v55, v60);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v59);
  _Block_release(v60);
  swift_release();

  swift_release();
  return swift_release();
}

void sub_21CABEFD8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAC576C;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_33_0;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CABF1D8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CABF214(void *a1)
{
  uint64_t v1;

  sub_21CABEFD8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21CABF220(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CABF288(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t aBlock;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t (*v35)();
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v20 = a1;
  v18 = a2;
  v19 = a3;
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v21 = 0;
  v24 = sub_21CAC5904();
  v22 = *(_QWORD *)(v24 - 8);
  v16 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v3, v4, v5);
  v23 = (char *)&v15 - v16;
  v27 = sub_21CAC591C();
  v25 = *(_QWORD *)(v27 - 8);
  v17 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v21, v18, v19, v6);
  v26 = (char *)&v15 - v17;
  v39 = v7;
  v37 = v8;
  v38 = v9;
  sub_21CAAEEF8();
  v29 = (id)sub_21CAC5CB8();
  swift_retain();
  v10 = v20;
  v11 = swift_allocObject();
  v12 = v19;
  v13 = (_QWORD *)v11;
  v14 = v20;
  v13[2] = v18;
  v13[3] = v12;
  v13[4] = v14;
  v35 = sub_21CAC56BC;
  v36 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = 0;
  v33 = sub_21CAB0E3C;
  v34 = &block_descriptor_27_0;
  v28 = _Block_copy(&aBlock);
  swift_release();
  sub_21CAB0E84();
  sub_21CAB0E98();
  MEMORY[0x2207866BC](v21, v26, v23, v28);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  _Block_release(v28);

}

uint64_t sub_21CABF488()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21CABF4C4(void *a1)
{
  uint64_t v1;

  sub_21CABF288(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21CABF4D0(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  swift_retain();
  a1(a3);
  return swift_release();
}

void sub_21CABF538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(id), uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __SecTrust *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD v48[7];
  id v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __SecTrust *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(id);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  __SecTrust *v110;
  uint64_t v111;
  id v112;
  _QWORD v113[2];
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  __SecTrust *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;

  v99 = a1;
  v98 = a2;
  v91 = a3;
  v92 = a4;
  v93 = a5;
  v94 = a6;
  v95 = a7;
  v96 = a8;
  v97 = a9;
  v135 = 0;
  v134 = 0;
  v133 = 0;
  v132 = 0;
  v131 = 0;
  v129 = 0;
  v130 = 0;
  v128 = 0;
  v126 = 0;
  v127 = 0;
  v124 = 0;
  v125 = 0;
  v122 = 0;
  v123 = 0;
  v121 = 0;
  v120 = 0;
  v118 = 0;
  v119 = 0;
  v114 = 0;
  v115 = 0;
  v112 = 0;
  v86 = 0;
  v72 = sub_21CAC59D0();
  v73 = *(_QWORD *)(v72 - 8);
  v74 = (*(_QWORD *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](0, v9, v10, v11);
  v75 = (uint64_t)v48 - v74;
  v76 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v12, (char *)v48 - v74, v14, v15);
  v77 = (uint64_t)v48 - v76;
  v135 = (char *)v48 - v76;
  v78 = sub_21CAC5988();
  v79 = *(_QWORD *)(v78 - 8);
  v80 = (*(_QWORD *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v86, v16, v17, v18);
  v81 = (uint64_t)v48 - v80;
  v134 = (char *)v48 - v80;
  v82 = sub_21CAC5964();
  v83 = *(_QWORD *)(v82 - 8);
  v84 = (*(_QWORD *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v86, v19, v20, v21);
  v85 = (char *)v48 - v84;
  v133 = (char *)v48 - v84;
  v87 = sub_21CAC5AB4();
  v88 = *(_QWORD *)(v87 - 8);
  v89 = (*(_QWORD *)(v88 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v86, v22, v23, v24);
  v90 = (char *)v48 - v89;
  v132 = (char *)v48 - v89;
  v100 = sub_21CAC5A78();
  v101 = *(_QWORD *)(v100 - 8);
  v105 = *(_QWORD *)(v101 + 64);
  v102 = (v105 + 15) & 0xFFFFFFFFFFFFFFF0;
  v25 = MEMORY[0x24BDAC7A8](v99, v98, v91, v92);
  v103 = (uint64_t)v48 - v102;
  v104 = (v105 + 15) & 0xFFFFFFFFFFFFFFF0;
  v29 = MEMORY[0x24BDAC7A8](v25, v26, v27, v28);
  v106 = (uint64_t)v48 - v104;
  v107 = (v105 + 15) & 0xFFFFFFFFFFFFFFF0;
  v33 = MEMORY[0x24BDAC7A8](v29, v30, v31, v32);
  v108 = (char *)v48 - v107;
  v131 = (char *)v48 - v107;
  v129 = v33;
  v130 = v34;
  v128 = v35;
  v126 = v36;
  v127 = v37;
  v124 = v38;
  v125 = v39;
  v122 = v40;
  v123 = v41;
  v42 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  v109 = 0;
  v110 = v42;
  v111 = 0;
  v67 = v42;
  v120 = v42;
  v43 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v42);
  v68 = 0;
  v69 = v43;
  v70 = v44;
  v71 = 0;
  v64 = v44;
  v63 = v43;
  v118 = v43;
  v119 = v44;
  sub_21CAAC5B8(v43, v44);
  v116 = v63;
  v117 = v64;
  sub_21CAC5A6C();
  v65 = 0;
  v66 = 0;
  sub_21CAC5AA8();
  sub_21CAC5A90();
  v61 = 0;
  v62 = 0;
  sub_21CAC5A9C();
  v45 = sub_21CAC5A60();
  v51 = &v114;
  v114 = v45;
  v115 = v46;
  v50 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
  v50(v106, v100);
  v52 = sub_21CAC5A60();
  v53 = v47;
  sub_21CAC588C();
  sub_21CAAC698(v52, v53);
  v57 = sub_21CAC5AC0();
  v54 = v114;
  v55 = v115;
  sub_21CAAC5B8(v114, v115);
  v59 = v113;
  v113[0] = v54;
  v113[1] = v55;
  v56 = *(_QWORD *)(v91 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  v58 = sub_21CAB3CA4();
  sub_21CAB3D14();
  sub_21CAC5958();
  sub_21CAAC668((uint64_t)v59);
  sub_21CAC02F4(v92, v93, v81, v77);
  v60 = 0;
  v48[6] = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16))(v75, v77, v72);
  sub_21CAC5A9C();
  (*(void (**)(uint64_t, char *, uint64_t))(v101 + 16))(v103, v108, v100);
  v49 = sub_21CAC00FC(v75, v106, v103);
  v112 = v49;
  swift_retain();
  v94(v49);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v77, v72);
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v81, v78);
  sub_21CAAC668((uint64_t)&v114);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v82);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v87);
  v50((uint64_t)v108, v100);
  sub_21CAAC698(v63, v64);

}

uint64_t sub_21CAC0054()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  sub_21CAAC698(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21CAC00B4()
{
  uint64_t v0;

  sub_21CABF538(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void (**)(id))(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
}

id sub_21CAC00FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v4;

  v4 = objc_allocWithZone(v3);
  return sub_21CAC2BF4(a1, a2, a3);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_21CAC02F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[12];
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;

  v55 = a4;
  v71 = a1;
  v70 = a2;
  v56 = a3;
  v5 = v4;
  v68 = v5;
  v89 = 0;
  v88 = 0;
  v87 = 0;
  v85 = 0;
  v86 = 0;
  v84 = 0;
  v83 = 0;
  v79 = 0;
  v80 = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE000);
  v57 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v58 = (uint64_t)&v33 - v57;
  v63 = 0;
  v59 = sub_21CAC59D0();
  v60 = *(_QWORD *)(v59 - 8);
  v61 = (*(_QWORD *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v63, v11, v12, v13);
  v62 = (char *)&v33 - v61;
  v89 = (char *)&v33 - v61;
  v64 = sub_21CAC59AC();
  v65 = *(_QWORD *)(v64 - 8);
  v66 = (*(_QWORD *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v63, v14, v15, v16);
  v67 = (char *)&v33 - v66;
  v88 = (char *)&v33 - v66;
  v17 = sub_21CAC5988();
  v18 = v69;
  v72 = v17;
  v73 = *(_QWORD *)(v17 - 8);
  v74 = (*(_QWORD *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = MEMORY[0x24BDAC7A8](v71, v70, v19, v20);
  v75 = (char *)&v33 - v74;
  v87 = (char *)&v33 - v74;
  v85 = v21;
  v86 = v22;
  v84 = a3;
  v83 = v23;
  sub_21CAC5970();
  v76 = v18;
  if (v18)
  {
    __break(1u);
LABEL_9:
    v34 = v48;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v72);
    result = sub_21CAAC698(v53, v54);
    v39 = v34;
    return result;
  }
  v53 = v81;
  v54 = v82;
  v79 = v81;
  v80 = v82;
  if (sub_21CAC5874() != *(_QWORD *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength))
  {
    v35 = *(_QWORD *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
    v37 = sub_21CAC5874();
    sub_21CABE938();
    v36 = 0;
    v28 = swift_allocError();
    v29 = v36;
    v30 = v28;
    v31 = v37;
    v38 = v30;
    *(_QWORD *)v32 = v35;
    *(_QWORD *)(v32 + 8) = v31;
    *(_BYTE *)(v32 + 16) = v29 & 1;
    swift_willThrow();
    sub_21CAAC698(v53, v54);
    result = v38;
    v39 = v38;
    return result;
  }
  sub_21CAAC5B8(v53, v54);
  v78[8] = v53;
  v78[9] = v54;
  v52 = *(_QWORD *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  v49 = v52 / 2;
  sub_21CAAD2E8();
  v50 = MEMORY[0x24BDCDDE8];
  sub_21CAC5C7C();
  v78[6] = v78[10];
  v78[7] = v78[11];
  sub_21CAC597C();
  sub_21CAAC5B8(v53, v54);
  v78[2] = v53;
  v78[3] = v54;
  v51 = *(_QWORD *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  v43 = v51 / 2;
  sub_21CAC2FB4();
  v44 = MEMORY[0x24BDCDDE8];
  sub_21CAC5B08();
  v45 = v78;
  v78[0] = v78[4];
  v78[1] = v78[5];
  v24 = sub_21CAB3D14();
  v25 = v76;
  v46 = v24;
  sub_21CAC59A0();
  v47 = v25;
  v48 = v25;
  if (v25)
    goto LABEL_9;
  v40 = v77;
  v77[0] = v71;
  v77[1] = v70;
  (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))(v58, v67, v64);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v65 + 56))(v58, 0, 1, v64);
  v26 = v47;
  sub_21CAC5994();
  v41 = v26;
  v42 = v26;
  if (v26)
  {
    v33 = v42;
    sub_21CAB3E18(v58);
  }
  else
  {
    sub_21CAB3E18(v58);
    (*(void (**)(uint64_t, char *, uint64_t))(v60 + 16))(v55, v62, v59);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v59);
  }
  (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v72);
  return sub_21CAAC698(v53, v54);
}

uint64_t sub_21CAC0AB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  sub_21CAC5C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  result = sub_21CAC58BC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t MCLECv3Encryption.ECv3EncryptionError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    sub_21CAC5E08();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DD8();
  }
  else
  {
    sub_21CAC5E08();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DD8();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DE4();
    sub_21CAC5B98();
    sub_21CAC5DFC();
    swift_bridgeObjectRelease();
    sub_21CAC5DE4();
  }
  sub_21CAC5B98();
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  return sub_21CAC5B8C();
}

uint64_t sub_21CAC0E68()
{
  uint64_t v0;

  return MCLECv3Encryption.ECv3EncryptionError.errorDescription.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16) & 1);
}

uint64_t sub_21CAC0E8C()
{
  return sub_21CAC5808();
}

uint64_t sub_21CAC0EA0()
{
  return sub_21CAC5820();
}

uint64_t sub_21CAC0EB4()
{
  return sub_21CAC57FC();
}

uint64_t sub_21CAC0EC8()
{
  return sub_21CAC5E5C();
}

uint64_t sub_21CAC0EDC()
{
  return sub_21CAC5E50();
}

uint64_t sub_21CAC0EF0()
{
  return sub_21CAC5E68();
}

uint64_t sub_21CAC0F04()
{
  return sub_21CAC5E44();
}

uint64_t sub_21CAC0F80()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_21CAC1010()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR___MCLECv3EncryptedDataContainer_params);
  v1 = v3;
  return v3;
}

uint64_t variable initialization expression of MCLECv3Encryption.ECV3EncryptedDataContainer.Params.algorithmIdentifier()
{
  return sub_21CAC5B98();
}

uint64_t sub_21CAC1078()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_21CAC1108()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + OBJC_IVAR___MCLECv3Params_keyAgreement);
  v1 = v3;
  return v3;
}

uint64_t sub_21CAC11AC()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv3KeyAgreement_sender);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21CAC125C()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_21CAC12A4(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return sub_21CAC12E4(a1, a2);
}

id sub_21CAC12E4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  objc_class *v22;
  id v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  id v57;
  char *v58;

  v34 = a1;
  v38 = a2;
  v3 = v2;
  v43 = v3;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v49 = 0;
  v44 = 0;
  v35 = sub_21CAC5940();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = (*(_QWORD *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (void *)MEMORY[0x24BDAC7A8](v43, v38, v5, v6);
  v47 = (char *)&v25 - v37;
  v58 = (char *)&v25 - v37;
  v56 = a1;
  v55 = v8;
  v9 = v7;
  v10 = v43;
  v57 = v43;
  v39 = sub_21CAC5A60();
  v40 = v11;
  sub_21CAB4A58();
  v41 = sub_21CAC585C();
  v42 = v12;
  sub_21CAAC698(v39, v40);
  v13 = v42;
  v14 = v43;
  v15 = (uint64_t *)&v43[OBJC_IVAR___MCLECv3KeyAgreement_sender];
  *v15 = v41;
  v15[1] = v13;

  v45 = sub_21CAC5AC0();
  v16 = sub_21CAC5A60();
  v48 = v54;
  v54[0] = v16;
  v54[1] = v17;
  v46 = sub_21CAB3CA4();
  sub_21CAB3D14();
  v50 = MEMORY[0x24BDCDDE8];
  sub_21CAC5928();
  sub_21CAAC668((uint64_t)v48);
  sub_21CAC5934();
  v25 = v52;
  v26 = v53;
  sub_21CAB4A58();
  v27 = sub_21CAC585C();
  v28 = v18;
  sub_21CAAC698(v25, v26);
  v19 = v28;
  v20 = v43;
  v21 = (uint64_t *)&v43[OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint];
  *v21 = v27;
  v21[1] = v19;

  (*(void (**)(char *, uint64_t))(v36 + 8))(v47, v35);
  v29 = v57;
  v30 = 0;
  v22 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  v51.receiver = v29;
  v51.super_class = v22;
  v33 = objc_msgSendSuper2(&v51, sel_init);
  v23 = v33;
  v57 = v33;
  v31 = sub_21CAC5A78();
  v32 = *(void (**)(uint64_t))(*(_QWORD *)(v31 - 8) + 8);
  v32(v38);
  ((void (*)(uint64_t, uint64_t))v32)(v34, v31);

  return v33;
}

uint64_t sub_21CAC15E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  sub_21CAC5C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552CDF68);
  sub_21CAAC4D4();
  result = sub_21CAC58BC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.KeyAgreement")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.KeyAgreement", 22, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x97uLL, 0x11uLL);
  __break(1u);
  return result;
}

BOOL sub_21CAC17D0(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_21CAC1854()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CAC18D0()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v3 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v2 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_21CAC1A6C()
{
  return 2;
}

uint64_t sub_21CAC1A84()
{
  sub_21CAC3D3C();
  return sub_21CAC5D6C();
}

uint64_t sub_21CAC1ADC()
{
  return 0;
}

uint64_t sub_21CAC1B00()
{
  return sub_21CAC5B98();
}

BOOL sub_21CAC1B88(_BYTE *a1, _BYTE *a2)
{
  return sub_21CAC17D0(*a1 & 1, *a2 & 1);
}

uint64_t sub_21CAC1BB0()
{
  return sub_21CAC1A84();
}

uint64_t sub_21CAC1BCC()
{
  return sub_21CAC1854();
}

uint64_t sub_21CAC1BE8()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CAC1BFC()
{
  return sub_21CAC1B00();
}

uint64_t sub_21CAC1C18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC18D0();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC1C40()
{
  return sub_21CAC1ADC();
}

uint64_t sub_21CAC1C60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC1A6C();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC1C88()
{
  sub_21CAC3DA8();
  return sub_21CAC5E8C();
}

uint64_t sub_21CAC1CB4()
{
  sub_21CAC3DA8();
  return sub_21CAC5E98();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;

  v10 = a1;
  v26 = 0;
  v25 = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE290);
  v11 = *(_QWORD *)(v20 - 8);
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = (char *)v8 - v12;
  v26 = (_QWORD *)MEMORY[0x24BDAC7A8](v10, v2, v3, v4);
  v25 = v1;
  v13 = v26[3];
  v14 = v26[4];
  __swift_project_boxed_opaque_existential_1(v26, v13);
  sub_21CAC3DA8();
  sub_21CAC5E80();
  v5 = v17;
  v18 = *(_QWORD *)(v16 + OBJC_IVAR___MCLECv3KeyAgreement_sender);
  v19 = *(_QWORD *)(v16 + OBJC_IVAR___MCLECv3KeyAgreement_sender + 8);
  swift_bridgeObjectRetain();
  v24 = 0;
  sub_21CAC5DC0();
  v21 = v5;
  v22 = v5;
  if (v5)
  {
    v8[2] = v22;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v20);
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = v21;
    v8[4] = *(_QWORD *)(v16 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint);
    v8[5] = *(_QWORD *)(v16 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint + 8);
    swift_bridgeObjectRetain();
    v23 = 1;
    sub_21CAC5DC0();
    v8[6] = v6;
    v9 = v6;
    if (v6)
      v8[1] = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v20);
  }
}

uint64_t sub_21CAC1F9C()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x24BEE4EA0]) + 0x68))();
}

id sub_21CAC200C(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return sub_21CAC204C(a1, a2);
}

id sub_21CAC204C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_class *v19;
  id v20;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  id v36;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v33 = a1;
  v32 = a2;
  v40 = 0;
  v39 = 0;
  v38 = 0;
  v29 = 0;
  v34 = sub_21CAC5A78();
  v31 = *(_QWORD **)(v34 - 8);
  v22 = (v31[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v33, v32, v3, v4);
  v26 = (uint64_t)&v22 - v22;
  v23 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v5, v7, (char *)&v22 - v22, v8);
  v27 = (uint64_t)&v22 - v23;
  v39 = v9;
  v38 = v10;
  v11 = v2;
  v12 = v2;
  v40 = v2;
  v24 = OBJC_IVAR___MCLECv3Params_algorithmIdentifier;
  v13 = sub_21CAC5B98();
  v14 = v28;
  v15 = (uint64_t *)&v28[v24];
  *v15 = v13;
  v15[1] = v16;

  type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  v25 = (void (*)(uint64_t, uint64_t, uint64_t))v31[2];
  v25(v27, v33, v34);
  v25(v26, v32, v34);
  v17 = sub_21CAC12A4(v27, v26);
  v18 = v28;
  *(_QWORD *)&v28[OBJC_IVAR___MCLECv3Params_keyAgreement] = v17;

  v30 = v40;
  v19 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  v37.receiver = v30;
  v37.super_class = v19;
  v36 = objc_msgSendSuper2(&v37, sel_init);
  v20 = v36;
  v40 = v36;
  v35 = (void (*)(uint64_t, uint64_t))v31[1];
  v35(v32, v34);
  v35(v33, v34);

  return v36;
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.Params")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.Params", 16, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x91uLL, 0x10uLL);
  __break(1u);
  return result;
}

BOOL sub_21CAC2394(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_21CAC2418()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CAC2494()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v3 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v2 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_21CAC2630()
{
  return 2;
}

uint64_t sub_21CAC2648()
{
  sub_21CAC3E38();
  return sub_21CAC5D6C();
}

uint64_t sub_21CAC26A0()
{
  return 0;
}

uint64_t sub_21CAC26C4()
{
  return sub_21CAC5B98();
}

BOOL sub_21CAC274C(_BYTE *a1, _BYTE *a2)
{
  return sub_21CAC2394(*a1 & 1, *a2 & 1);
}

uint64_t sub_21CAC2774()
{
  return sub_21CAC2648();
}

uint64_t sub_21CAC2790()
{
  return sub_21CAC2418();
}

uint64_t sub_21CAC27AC()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CAC27C0()
{
  return sub_21CAC26C4();
}

uint64_t sub_21CAC27DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC2494();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC2804()
{
  return sub_21CAC26A0();
}

uint64_t sub_21CAC2824@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC2630();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC284C()
{
  sub_21CAC3EA4();
  return sub_21CAC5E8C();
}

uint64_t sub_21CAC2878()
{
  sub_21CAC3EA4();
  return sub_21CAC5E98();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v9[3];
  id v10;
  char *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;

  v16 = a1;
  v33 = 0;
  v32 = 0;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE298);
  v17 = *(_QWORD *)(v26 - 8);
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = (char *)v9 - v18;
  v33 = (_QWORD *)MEMORY[0x24BDAC7A8](v16, v2, v3, v4);
  v32 = v1;
  v19 = v33[3];
  v20 = v33[4];
  __swift_project_boxed_opaque_existential_1(v33, v19);
  sub_21CAC3EA4();
  sub_21CAC5E80();
  v5 = v23;
  v24 = *(_QWORD *)(v22 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier);
  v25 = *(_QWORD *)(v22 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier + 8);
  swift_bridgeObjectRetain();
  v31 = 0;
  sub_21CAC5DC0();
  v27 = v5;
  v28 = v5;
  if (v5)
  {
    v9[2] = v28;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v26);
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = *(id *)(v22 + OBJC_IVAR___MCLECv3Params_keyAgreement);
    v6 = v10;
    v13 = &v30;
    v30 = v10;
    v11 = &v29;
    v29 = 1;
    v12 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
    sub_21CAC3F10();
    v7 = v27;
    sub_21CAC5DCC();
    v14 = v7;
    v15 = v7;
    if (v7)
      v9[1] = v15;

    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v26);
  }
}

uint64_t sub_21CAC2B84()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x24BEE4EA0]) + 0x68))();
}

id sub_21CAC2BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t *v23;
  id v24;
  id v25;
  objc_class *v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  id v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  id v57;
  objc_super v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;

  v56 = a1;
  v52 = a2;
  v51 = a3;
  v4 = v3;
  v48 = v4;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v55 = 0;
  v53 = sub_21CAC5A78();
  v50 = *(_QWORD **)(v53 - 8);
  v31 = (v50[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v48, v52, v51, v6);
  v46 = (uint64_t)&v30 - v31;
  v32 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (void *)MEMORY[0x24BDAC7A8](v7, v9, v10, (char *)&v30 - v31);
  v47 = (uint64_t)&v30 - v32;
  v63 = a1;
  v62 = v12;
  v61 = v13;
  v14 = v11;
  v15 = v48;
  v64 = v48;
  v33 = sub_21CAC59B8();
  v34 = v16;
  sub_21CAB4A58();
  v35 = sub_21CAC585C();
  v36 = v17;
  sub_21CAAC698(v33, v34);
  v42 = v60;
  v60[0] = v35;
  v60[1] = v36;
  v37 = sub_21CAC59C4();
  v38 = v18;
  sub_21CAB4A58();
  v39 = sub_21CAC585C();
  v40 = v19;
  sub_21CAAC698(v37, v38);
  v41 = v59;
  v59[0] = v39;
  v59[1] = v40;
  sub_21CAC3F80();
  v43 = sub_21CAC5CDC();
  v44 = v20;
  sub_21CAAE53C();
  sub_21CAAE53C();
  v21 = v44;
  v22 = v48;
  v23 = (uint64_t *)&v48[OBJC_IVAR___MCLECv3EncryptedDataContainer_data];
  *v23 = v43;
  v23[1] = v21;

  type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  v45 = (void (*)(uint64_t, uint64_t, uint64_t))v50[2];
  v45(v47, v52, v53);
  v45(v46, v51, v53);
  v24 = sub_21CAC200C(v47, v46);
  v25 = v48;
  *(_QWORD *)&v48[OBJC_IVAR___MCLECv3EncryptedDataContainer_params] = v24;

  v49 = v64;
  v26 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  v58.receiver = v49;
  v58.super_class = v26;
  v57 = objc_msgSendSuper2(&v58, sel_init);
  v27 = v57;
  v64 = v57;
  v54 = (void (*)(uint64_t, uint64_t))v50[1];
  v54(v51, v53);
  v54(v52, v53);
  v28 = sub_21CAC59D0();
  (*(void (**)(uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v56);

  return v57;
}

uint64_t sub_21CAC2F2C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21CAC2F68(uint64_t a1)
{
  uint64_t v1;

  return sub_21CABEB08(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21CAC2F70()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21CAC2FAC(void *a1)
{
  uint64_t v1;

  sub_21CAAF980(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_21CAC2FB4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE258;
  if (!qword_2552CE258)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BDCDE10], MEMORY[0x24BDCDDE8]);
    atomic_store(v0, (unint64_t *)&qword_2552CE258);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement()
{
  return objc_opt_self();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"JITAppKit.ECV3EncryptedDataContainer")
  {
    sub_21CAC5DA8();
    __break(1u);
  }
  result = sub_21CAB77A8((uint64_t)"JITAppKit.ECV3EncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x86uLL, 0xFuLL);
  __break(1u);
  return result;
}

BOOL sub_21CAC3194(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_21CAC3218()
{
  return sub_21CAC5E74();
}

uint64_t sub_21CAC3294()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v3 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CAC5B98();
  swift_bridgeObjectRetain();
  v2 = sub_21CAC5BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_21CAC3430()
{
  return 2;
}

uint64_t sub_21CAC3448()
{
  sub_21CAC400C();
  return sub_21CAC5D6C();
}

uint64_t sub_21CAC34A0()
{
  return 0;
}

uint64_t sub_21CAC34C4()
{
  return sub_21CAC5B98();
}

BOOL sub_21CAC354C(_BYTE *a1, _BYTE *a2)
{
  return sub_21CAC3194(*a1 & 1, *a2 & 1);
}

uint64_t sub_21CAC3574()
{
  return sub_21CAC3448();
}

uint64_t sub_21CAC3590()
{
  return sub_21CAC3218();
}

uint64_t sub_21CAC35AC()
{
  return sub_21CAC5AFC();
}

uint64_t sub_21CAC35C0()
{
  return sub_21CAC34C4();
}

uint64_t sub_21CAC35DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC3294();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC3604()
{
  return sub_21CAC34A0();
}

uint64_t sub_21CAC3624@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CAC3430();
  *a1 = result;
  return result;
}

uint64_t sub_21CAC364C()
{
  sub_21CAC4078();
  return sub_21CAC5E8C();
}

uint64_t sub_21CAC3678()
{
  sub_21CAC4078();
  return sub_21CAC5E98();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v9[3];
  id v10;
  char *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;

  v16 = a1;
  v33 = 0;
  v32 = 0;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE2B0);
  v17 = *(_QWORD *)(v26 - 8);
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = (char *)v9 - v18;
  v33 = (_QWORD *)MEMORY[0x24BDAC7A8](v16, v2, v3, v4);
  v32 = v1;
  v19 = v33[3];
  v20 = v33[4];
  __swift_project_boxed_opaque_existential_1(v33, v19);
  sub_21CAC4078();
  sub_21CAC5E80();
  v5 = v23;
  v24 = *(_QWORD *)(v22 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data);
  v25 = *(_QWORD *)(v22 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data + 8);
  swift_bridgeObjectRetain();
  v31 = 0;
  sub_21CAC5DC0();
  v27 = v5;
  v28 = v5;
  if (v5)
  {
    v9[2] = v28;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v26);
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = *(id *)(v22 + OBJC_IVAR___MCLECv3EncryptedDataContainer_params);
    v6 = v10;
    v13 = &v30;
    v30 = v10;
    v11 = &v29;
    v29 = 1;
    v12 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
    sub_21CAC40E4();
    v7 = v27;
    sub_21CAC5DCC();
    v14 = v7;
    v15 = v7;
    if (v7)
      v9[1] = v15;

    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v26);
  }
}

uint64_t sub_21CAC3984()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x24BEE4EA0]) + 0x68))();
}

id MCLECv3Encryption.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MCLECv3Encryption.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  objc_class *v42;
  id v43;
  objc_super v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = 0;
  v39 = 0;
  v23 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CAC() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0, v1, v2, v3);
  v38 = (uint64_t)&v23 - v23;
  v24 = (*(_QWORD *)(*(_QWORD *)(sub_21CAC5CA0() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v39, v4, v5, v6);
  v37 = (char *)&v23 - v24;
  v7 = sub_21CAC591C();
  v25 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v36 = (char *)&v23 - v25;
  v11 = v0;
  v12 = v0;
  v47 = v0;
  v40 = OBJC_IVAR___MCLECv3Encryption_queue;
  v29 = sub_21CAAEEF8();
  v27 = 17;
  v13 = sub_21CAC5E08();
  v31 = &v45;
  v45 = v13;
  v46 = v14;
  v28 = 1;
  sub_21CAC5B98();
  v26 = v15;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v42 = (objc_class *)type metadata accessor for MCLECv3Encryption();
  sub_21CAAEF80();
  sub_21CAC5B98();
  v30 = v16;
  sub_21CAC5DFC();
  swift_bridgeObjectRelease();
  v33 = v45;
  v32 = v46;
  swift_bridgeObjectRetain();
  sub_21CAAE4EC();
  v34 = sub_21CAC5B8C();
  v35 = v17;
  sub_21CAAEFB4();
  sub_21CAAEFC8();
  sub_21CAAF05C(v38);
  v18 = sub_21CAC5CD0();
  v19 = v41;
  *(_QWORD *)&v41[v40] = v18;

  v20 = v41;
  *(_QWORD *)&v41[OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength] = 32;

  v44.receiver = v47;
  v44.super_class = v42;
  v43 = objc_msgSendSuper2(&v44, sel_init);
  v21 = v43;
  v47 = v43;

  return v43;
}

id MCLECv3Encryption.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21CAC3D3C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5A0;
  if (!qword_2552CF5A0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC94B4, &unk_24E09B8A0);
    atomic_store(v0, (unint64_t *)&qword_2552CF5A0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC3DA8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5A8;
  if (!qword_2552CF5A8)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC9464, &unk_24E09B8A0);
    atomic_store(v0, (unint64_t *)&qword_2552CF5A8);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params()
{
  return objc_opt_self();
}

unint64_t sub_21CAC3E38()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5B0;
  if (!qword_2552CF5B0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC9424, &unk_24E09B930);
    atomic_store(v0, (unint64_t *)&qword_2552CF5B0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC3EA4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5B8;
  if (!qword_2552CF5B8)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC93D4, &unk_24E09B930);
    atomic_store(v0, (unint64_t *)&qword_2552CF5B8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC3F10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE2A0;
  if (!qword_2552CE2A0)
  {
    v0 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
    v1 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE2A0);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAC3F80()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CE2A8;
  if (!qword_2552CE2A8)
  {
    v0 = MEMORY[0x220786F8C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(v0, (unint64_t *)&qword_2552CE2A8);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer()
{
  return objc_opt_self();
}

unint64_t sub_21CAC400C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5C0;
  if (!qword_2552CF5C0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC9394, &unk_24E09B9C0);
    atomic_store(v0, (unint64_t *)&qword_2552CF5C0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC4078()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CF5C8[0];
  if (!qword_2552CF5C8[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC9344, &unk_24E09B9C0);
    atomic_store(v0, qword_2552CF5C8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC40E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2552CE2B8;
  if (!qword_2552CE2B8)
  {
    v0 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
    v1 = MEMORY[0x220786F8C](&protocol conformance descriptor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params, v0);
    atomic_store(v1, (unint64_t *)&qword_2552CE2B8);
    return v1;
  }
  return v3;
}

unint64_t sub_21CAC4154()
{
  return sub_21CABE938();
}

uint64_t getEnumTagSinglePayload for MCLECv3Encryption.ECv3EncryptionError(uint64_t a1, int a2)
{
  int v3;

  if (a2)
  {
    if (*(_BYTE *)(a1 + 17))
      v3 = *(_DWORD *)a1;
    else
      v3 = -1;
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECv3Encryption.ECv3EncryptionError(uint64_t result, int a2, int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 17);
  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 16) = 0;
    if (a3)
      *v3 = 1;
  }
  else if (a3)
  {
    *v3 = 0;
  }
  return result;
}

uint64_t sub_21CAC43E4(uint64_t a1)
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE0B0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 48))(a1, 2);
}

uint64_t sub_21CAC4428(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552CE0B0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, a2, 2);
}

ValueMetadata *type metadata accessor for MCLECv3Encryption.ECv3EncryptionError()
{
  return &type metadata for MCLECv3Encryption.ECv3EncryptionError;
}

uint64_t sub_21CAC4484(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CAC4634(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t sub_21CAC4878(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *sub_21CAC4888(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.CodingKeys()
{
  return &unk_24E09B8A0;
}

uint64_t sub_21CAC48AC(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CAC4A5C(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t sub_21CAC4CA0(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *sub_21CAC4CB0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.CodingKeys()
{
  return &unk_24E09B930;
}

uint64_t sub_21CAC4CD4(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFE)
      goto LABEL_15;
    v7 = ((a2 + 1) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 2;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_21CAC4E84(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFE)
  {
    v5 = ((a3 + 1) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFE)
  {
    v4 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 1;
  }
  return result;
}

uint64_t sub_21CAC50C8(_BYTE *a1)
{
  return *a1 & 1;
}

_BYTE *sub_21CAC50D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.CodingKeys()
{
  return &unk_24E09B9C0;
}

unint64_t sub_21CAC50FC()
{
  return sub_21CAB8AE4();
}

unint64_t sub_21CAC5110()
{
  return sub_21CAAF6D0();
}

unint64_t sub_21CAC5124()
{
  return sub_21CAC5138();
}

unint64_t sub_21CAC5138()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CFED0;
  if (!qword_2552CFED0)
  {
    v0 = MEMORY[0x220786F8C]("e)]1X@", &unk_24E09B9C0);
    atomic_store(v0, (unint64_t *)&qword_2552CFED0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC51A4()
{
  return sub_21CAC51B8();
}

unint64_t sub_21CAC51B8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CFED8[0];
  if (!qword_2552CFED8[0])
  {
    v0 = MEMORY[0x220786F8C]("M)]10@", &unk_24E09B9C0);
    atomic_store(v0, qword_2552CFED8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC5224()
{
  return sub_21CAC5238();
}

unint64_t sub_21CAC5238()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CFF60[0];
  if (!qword_2552CFF60[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC922C, &unk_24E09B9C0);
    atomic_store(v0, qword_2552CFF60);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC52A4()
{
  return sub_21CAC52B8();
}

unint64_t sub_21CAC52B8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CFFF0;
  if (!qword_2552CFFF0)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC9254, &unk_24E09B930);
    atomic_store(v0, (unint64_t *)&qword_2552CFFF0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC5324()
{
  return sub_21CAC5338();
}

unint64_t sub_21CAC5338()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552CFFF8[0];
  if (!qword_2552CFFF8[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC927C, &unk_24E09B930);
    atomic_store(v0, qword_2552CFFF8);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC53A4()
{
  return sub_21CAC53B8();
}

unint64_t sub_21CAC53B8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552D0080[0];
  if (!qword_2552D0080[0])
  {
    v0 = MEMORY[0x220786F8C]("M(]1h?", &unk_24E09B930);
    atomic_store(v0, qword_2552D0080);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC5424()
{
  return sub_21CAC5438();
}

unint64_t sub_21CAC5438()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552D0110;
  if (!qword_2552D0110)
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC92CC, &unk_24E09B8A0);
    atomic_store(v0, (unint64_t *)&qword_2552D0110);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC54A4()
{
  return sub_21CAC54B8();
}

unint64_t sub_21CAC54B8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552D0118[0];
  if (!qword_2552D0118[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC92F4, &unk_24E09B8A0);
    atomic_store(v0, qword_2552D0118);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC5524()
{
  return sub_21CAC5538();
}

unint64_t sub_21CAC5538()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2552D01A0[0];
  if (!qword_2552D01A0[0])
  {
    v0 = MEMORY[0x220786F8C](&unk_21CAC931C, &unk_24E09B8A0);
    atomic_store(v0, qword_2552D01A0);
    return v0;
  }
  return v2;
}

unint64_t sub_21CAC55A4()
{
  return sub_21CAB8E7C();
}

unint64_t sub_21CAC55B8()
{
  return sub_21CAB8F00();
}

uint64_t sub_21CAC55CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21CAB9048(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_21CAC560C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CAC5634(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB93DC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_21CAC5650(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21CAB7434(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_21CAC5678()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAC56BC()
{
  uint64_t v0;

  return sub_21CABF4D0(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_25_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_26_0()
{
  return swift_release();
}

uint64_t sub_21CAC5728()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21CAC576C()
{
  uint64_t v0;

  return sub_21CABF220(*(void (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_31_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_32_0()
{
  return swift_release();
}

uint64_t sub_21CAC57D8()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21CAC57E4()
{
  return MEMORY[0x24BDCB3E8]();
}

uint64_t sub_21CAC57F0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21CAC57FC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21CAC5808()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21CAC5814()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_21CAC5820()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21CAC582C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21CAC5838()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21CAC5844()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_21CAC5850()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21CAC585C()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_21CAC5868()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21CAC5874()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t sub_21CAC5880()
{
  return MEMORY[0x24BDCDD38]();
}

uint64_t sub_21CAC588C()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_21CAC5898()
{
  return MEMORY[0x24BDCDD98]();
}

uint64_t sub_21CAC58A4()
{
  return MEMORY[0x24BDCDDB8]();
}

uint64_t sub_21CAC58B0()
{
  return MEMORY[0x24BDCDDD0]();
}

uint64_t sub_21CAC58BC()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t sub_21CAC58C8()
{
  return MEMORY[0x24BEE5B78]();
}

uint64_t sub_21CAC58D4()
{
  return MEMORY[0x24BEE5B80]();
}

uint64_t sub_21CAC58E0()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_21CAC58EC()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_21CAC58F8()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_21CAC5904()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21CAC5910()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21CAC591C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21CAC5928()
{
  return MEMORY[0x24BDC62B8]();
}

uint64_t sub_21CAC5934()
{
  return MEMORY[0x24BDC62E0]();
}

uint64_t sub_21CAC5940()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_21CAC594C()
{
  return MEMORY[0x24BDC6368]();
}

uint64_t sub_21CAC5958()
{
  return MEMORY[0x24BDC6378]();
}

uint64_t sub_21CAC5964()
{
  return MEMORY[0x24BDC6380]();
}

uint64_t sub_21CAC5970()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_21CAC597C()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_21CAC5988()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_21CAC5994()
{
  return MEMORY[0x24BDC65A8]();
}

uint64_t sub_21CAC59A0()
{
  return MEMORY[0x24BDC65B8]();
}

uint64_t sub_21CAC59AC()
{
  return MEMORY[0x24BDC65D0]();
}

uint64_t sub_21CAC59B8()
{
  return MEMORY[0x24BDC65F8]();
}

uint64_t sub_21CAC59C4()
{
  return MEMORY[0x24BDC6600]();
}

uint64_t sub_21CAC59D0()
{
  return MEMORY[0x24BDC6638]();
}

uint64_t sub_21CAC59DC()
{
  return MEMORY[0x24BDC6738]();
}

uint64_t sub_21CAC59E8()
{
  return MEMORY[0x24BDC6740]();
}

uint64_t sub_21CAC59F4()
{
  return MEMORY[0x24BDC6760]();
}

uint64_t sub_21CAC5A00()
{
  return MEMORY[0x24BDC6770]();
}

uint64_t sub_21CAC5A0C()
{
  return MEMORY[0x24BDC6788]();
}

uint64_t sub_21CAC5A18()
{
  return MEMORY[0x24BDC67B0]();
}

uint64_t sub_21CAC5A24()
{
  return MEMORY[0x24BDC67B8]();
}

uint64_t sub_21CAC5A30()
{
  return MEMORY[0x24BDC67C8]();
}

uint64_t sub_21CAC5A3C()
{
  return MEMORY[0x24BDC67E0]();
}

uint64_t sub_21CAC5A48()
{
  return MEMORY[0x24BDC6868]();
}

uint64_t sub_21CAC5A54()
{
  return MEMORY[0x24BDC6870]();
}

uint64_t sub_21CAC5A60()
{
  return MEMORY[0x24BDC6878]();
}

uint64_t sub_21CAC5A6C()
{
  return MEMORY[0x24BDC6898]();
}

uint64_t sub_21CAC5A78()
{
  return MEMORY[0x24BDC68D0]();
}

uint64_t sub_21CAC5A84()
{
  return MEMORY[0x24BDC68E8]();
}

uint64_t sub_21CAC5A90()
{
  return MEMORY[0x24BDC68F0]();
}

uint64_t sub_21CAC5A9C()
{
  return MEMORY[0x24BDC68F8]();
}

uint64_t sub_21CAC5AA8()
{
  return MEMORY[0x24BDC6960]();
}

uint64_t sub_21CAC5AB4()
{
  return MEMORY[0x24BDC6968]();
}

uint64_t sub_21CAC5AC0()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_21CAC5ACC()
{
  return MEMORY[0x24BEE5EC8]();
}

uint64_t sub_21CAC5AD8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21CAC5AE4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21CAC5AF0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21CAC5AFC()
{
  return MEMORY[0x24BEE0630]();
}

uint64_t sub_21CAC5B08()
{
  return MEMORY[0x24BEE0798]();
}

uint64_t sub_21CAC5B14()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21CAC5B20()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21CAC5B2C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21CAC5B38()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21CAC5B44()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21CAC5B50()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21CAC5B5C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21CAC5B68()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21CAC5B74()
{
  return MEMORY[0x24BEE0A18]();
}

uint64_t sub_21CAC5B80()
{
  return MEMORY[0x24BEE0A38]();
}

uint64_t sub_21CAC5B8C()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t sub_21CAC5B98()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_21CAC5BA4()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t sub_21CAC5BB0()
{
  return MEMORY[0x24BEE0B48]();
}

uint64_t sub_21CAC5BBC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21CAC5BC8()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21CAC5BD4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21CAC5BE0()
{
  return MEMORY[0x24BEE0C68]();
}

uint64_t sub_21CAC5BEC()
{
  return MEMORY[0x24BEE0DC0]();
}

uint64_t sub_21CAC5BF8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21CAC5C04()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_21CAC5C10()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21CAC5C1C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21CAC5C28()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21CAC5C34()
{
  return MEMORY[0x24BEE5F10]();
}

uint64_t sub_21CAC5C40()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21CAC5C4C()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_21CAC5C58()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21CAC5C64()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21CAC5C70()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21CAC5C7C()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_21CAC5C88()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21CAC5C94()
{
  return MEMORY[0x24BEE1AC8]();
}

uint64_t sub_21CAC5CA0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21CAC5CAC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21CAC5CB8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21CAC5CC4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21CAC5CD0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21CAC5CDC()
{
  return MEMORY[0x24BDD0648]();
}

uint64_t sub_21CAC5CE8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21CAC5CF4()
{
  return MEMORY[0x24BEE2278]();
}

uint64_t sub_21CAC5D00()
{
  return MEMORY[0x24BEE2280]();
}

uint64_t sub_21CAC5D0C()
{
  return MEMORY[0x24BEE2288]();
}

uint64_t sub_21CAC5D18()
{
  return MEMORY[0x24BEE2290]();
}

uint64_t sub_21CAC5D24()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t sub_21CAC5D30()
{
  return MEMORY[0x24BEE22A0]();
}

uint64_t sub_21CAC5D3C()
{
  return MEMORY[0x24BEE22A8]();
}

uint64_t sub_21CAC5D48()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21CAC5D54()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21CAC5D60()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_21CAC5D6C()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t sub_21CAC5D78()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21CAC5D84()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21CAC5D90()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21CAC5D9C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21CAC5DA8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21CAC5DB4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21CAC5DC0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21CAC5DCC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21CAC5DD8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_21CAC5DE4()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_21CAC5DF0()
{
  return MEMORY[0x24BEE3940]();
}

uint64_t sub_21CAC5DFC()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_21CAC5E08()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_21CAC5E14()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t sub_21CAC5E20()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_21CAC5E2C()
{
  return MEMORY[0x24BEE3E40]();
}

uint64_t sub_21CAC5E38()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21CAC5E44()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21CAC5E50()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21CAC5E5C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21CAC5E68()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21CAC5E74()
{
  return MEMORY[0x24BEE42F0]();
}

uint64_t sub_21CAC5E80()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21CAC5E8C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21CAC5E98()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21CAC5EA4()
{
  return MEMORY[0x24BEE4A20]();
}

uint64_t sub_21CAC5EB0()
{
  return MEMORY[0x24BEE4A28]();
}

uint64_t sub_21CAC5EBC()
{
  return MEMORY[0x24BEE4A30]();
}

uint64_t sub_21CAC5EC8()
{
  return MEMORY[0x24BEE4A38]();
}

uint64_t sub_21CAC5ED4()
{
  return MEMORY[0x24BEE4A40]();
}

uint64_t sub_21CAC5EE0()
{
  return MEMORY[0x24BEE4A48]();
}

uint64_t sub_21CAC5EEC()
{
  return MEMORY[0x24BEE4A50]();
}

uint64_t sub_21CAC5EF8()
{
  return MEMORY[0x24BEE4A58]();
}

uint64_t sub_21CAC5F04()
{
  return MEMORY[0x24BEE4A60]();
}

uint64_t sub_21CAC5F10()
{
  return MEMORY[0x24BEE4A68]();
}

uint64_t sub_21CAC5F1C()
{
  return MEMORY[0x24BEE4A70]();
}

uint64_t sub_21CAC5F28()
{
  return MEMORY[0x24BEE4A98]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x24BDE8828](certificate, commonName);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x24BDE8D38](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BEBDE70]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

void UIRectClip(CGRect rect)
{
  MEMORY[0x24BEBE690]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x24BDC15D0](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x24BEDF1F8]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x24BDAFFA0](a1, a2, a3, a4);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

