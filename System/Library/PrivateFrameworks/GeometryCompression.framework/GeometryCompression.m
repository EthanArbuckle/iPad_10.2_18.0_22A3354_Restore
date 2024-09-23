double GCLSourceFromData(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _OWORD *v6;
  double result;

  if (a1)
  {
    if (a3)
    {
      *a3 = 0;
      v6 = operator new(0x40uLL);
      result = 0.0;
      v6[1] = 0u;
      v6[2] = 0u;
      *((_QWORD *)v6 + 1) = a2;
      *((_QWORD *)v6 + 2) = (char *)v6 + 24;
      *((_QWORD *)v6 + 5) = (char *)v6 + 40;
      *((_QWORD *)v6 + 6) = (char *)v6 + 40;
      *((_QWORD *)v6 + 7) = 0;
      *(_QWORD *)v6 = a1;
      *a3 = v6;
    }
  }
  return result;
}

void sub_23CCACE60(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCACE50);
}

void GCLSourceRelease(uint64_t a1)
{
  if (a1)
  {
    sub_23CCACFEC((uint64_t *)(a1 + 40));
    sub_23CCAD084(a1 + 16, *(char **)(a1 + 24));
    operator delete((void *)a1);
  }
}

unint64_t GCLSourceOptionSet(uint64_t a1, char *a2, int a3)
{
  unint64_t result;
  void *__p[2];
  char v7;
  void **v8;

  result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_23CCAD0D4(__p, a2);
    v8 = __p;
    *((_DWORD *)sub_23CCAD20C((uint64_t **)(a1 + 16), (const void **)__p, (uint64_t)&unk_23CCD3F98, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0)
      operator delete(__p[0]);
    return 0;
  }
  return result;
}

void sub_23CCACF2C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCACF18);
}

unint64_t GCLDecodeMeshFromSource(uint64_t a1, uint64_t *a2)
{
  unint64_t result;

  result = 0x8000000000000000;
  if (a1)
  {
    if (a2)
    {
      if (a2[2])
        return sub_23CCB4528(a1);
      sub_23CCACFEC((uint64_t *)(a1 + 40));
      result = sub_23CCB3A10(a1, a2);
      if (!result)
        return sub_23CCB4528(a1);
    }
  }
  return result;
}

void sub_23CCACFB4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCACFA8);
}

unint64_t GCLDecodeMeshFromSourceWithOptions(uint64_t a1, uint64_t *a2)
{
  return GCLDecodeMeshFromSource(a1, a2);
}

void sub_23CCACFDC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCACFD4);
}

void sub_23CCACFEC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      while (1)
      {
        v5 = (uint64_t *)v3[1];
        v6 = (uint64_t *)v3[5];
        if (v6 == v3 + 2)
          break;
        if (v6)
        {
          v7 = 5;
LABEL_7:
          (*(void (**)(void))(*v6 + 8 * v7))();
        }
        operator delete(v3);
        v3 = v5;
        if (v5 == a1)
          return;
      }
      v6 = v3 + 2;
      v7 = 4;
      goto LABEL_7;
    }
  }
}

void sub_23CCAD084(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_23CCAD084(a1, *(_QWORD *)a2);
    sub_23CCAD084(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

_QWORD *sub_23CCAD0D4(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_23CCAD184();
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

void sub_23CCAD184()
{
  sub_23CCAD198("basic_string");
}

void sub_23CCAD198(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23CCAD1E8(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_250DE3F50, MEMORY[0x24BEDAAF0]);
}

void sub_23CCAD1D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_23CCAD1E8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_OWORD *sub_23CCAD20C(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = (void **)sub_23CCAD2A4((uint64_t)a1, &v12, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x40uLL);
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    sub_23CCAD340(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

_QWORD *sub_23CCAD2A4(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!sub_23CCAD394(v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!sub_23CCAD394(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_23CCAD340(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_23CCAD3FC(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_23CCAD394(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t *sub_23CCAD3FC(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t GCLBufferSemanticName(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result += 56;
    if (*(char *)(v1 + 79) < 0)
      return *(_QWORD *)result;
  }
  return result;
}

uint64_t GCLBufferProperty(uint64_t a1, char *__s, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = 0x8000000000000000;
  if (a1 && __s && a3)
  {
    v7[0] = __s;
    v7[1] = strlen(__s);
    v6 = sub_23CCAD6FC(a1 + 80, (uint64_t)v7);
    if (a1 + 88 == v6)
    {
      return 0x8000000000000000;
    }
    else
    {
      result = 0;
      *a3 = *(_DWORD *)(v6 + 56);
    }
  }
  return result;
}

unint64_t GCLBufferSetProperty(uint64_t a1, char *a2, int a3)
{
  unint64_t result;
  void *__p[2];
  char v7;
  void **v8;

  result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_23CCAD0D4(__p, a2);
    v8 = __p;
    *((_DWORD *)sub_23CCAD20C((uint64_t **)(a1 + 80), (const void **)__p, (uint64_t)&unk_23CCD3F98, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0)
      operator delete(__p[0]);
    return 0;
  }
  return result;
}

void sub_23CCAD6C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCAD6ACLL);
}

uint64_t GCLBufferId(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 104);
  return result;
}

uint64_t sub_23CCAD6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = sub_23CCAD788(v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || sub_23CCAD7E4(v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

uint64_t sub_23CCAD788(uint64_t a1, const void **a2, uint64_t a3)
{
  int v3;
  const void *v4;
  size_t v5;
  const void *v6;
  size_t v7;
  size_t v8;
  int v9;
  unsigned int v10;

  v3 = *((char *)a2 + 23);
  if (v3 >= 0)
    v4 = a2;
  else
    v4 = *a2;
  if (v3 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  v6 = *(const void **)a3;
  v7 = *(_QWORD *)(a3 + 8);
  if (v7 >= v5)
    v8 = v5;
  else
    v8 = *(_QWORD *)(a3 + 8);
  v9 = memcmp(v4, v6, v8);
  if (v5 < v7)
    v10 = -1;
  else
    v10 = 1;
  if (v5 == v7)
    v10 = 0;
  if (v9)
    v10 = v9;
  return v10 >> 31;
}

uint64_t sub_23CCAD7E4(uint64_t a1, uint64_t a2, const void **a3)
{
  const void *v3;
  size_t v4;
  int v5;
  const void *v6;
  size_t v7;
  size_t v8;
  int v9;
  unsigned int v10;

  v3 = *(const void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *((char *)a3 + 23);
  if (v5 >= 0)
    v6 = a3;
  else
    v6 = *a3;
  if (v5 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v7 >= v4)
    v8 = v4;
  else
    v8 = v7;
  v9 = memcmp(v3, v6, v8);
  if (v4 < v7)
    v10 = -1;
  else
    v10 = 1;
  if (v4 == v7)
    v10 = 0;
  if (v9)
    v10 = v9;
  return v10 >> 31;
}

uint64_t sub_23CCAD840(_DWORD *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  unint64_t i;
  int v13;

  v4 = 3;
  if (a1 && (a2 & 0x8000000000000000) == 0 && (unint64_t)a2 >= 4)
  {
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4 || (unint64_t)a2 < 0x10 || a1 == (_DWORD *)-16 || !a4)
    {
      return 3;
    }
    else
    {
      v5 = (unsigned __int8 *)(a1 + 2);
      v6 = 4 * a4;
      v7 = a1[3];
      while (*a3 != *a1)
      {
        ++a3;
        v4 = 3;
        v6 -= 4;
        if (!v6)
          return v4;
      }
      v9 = 16;
      if (a2 > 16)
        v9 = a2;
      v4 = 3;
      v10 = (a2 & (unint64_t)~(a2 >> 63)) - v9 + 16 > v7 || a2 < (uint64_t)v7;
      if (!v10 && a1 != (_DWORD *)-8 && (unsigned __int8 *)((char *)a1 + v7) >= v5)
      {
        v11 = -1;
        for (i = v7 - 8; i; --i)
        {
          v13 = *v5++;
          v11 = dword_23CCD3FC8[v13 ^ HIBYTE(v11)] ^ (v11 << 8);
        }
        if (a1[1] == v11)
          return 0;
        else
          return 3;
      }
    }
  }
  return v4;
}

uint64_t GCLBufferListBegin(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

uint64_t GCLBufferListIterNext(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

uint64_t GCLBufferForBufferListIter(uint64_t a1)
{
  if (a1)
    return a1 + 16;
  else
    return 0;
}

uint64_t sub_23CCAD950(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_23CCADA54(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x242630A2C](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCADA7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x242630A2C](a1 + 128);
  return a1;
}

void sub_23CCADB04(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_23CCADB14(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x242630990](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_23CCADC78(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x24263099C](v13);
  return a1;
}

void sub_23CCADC1C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24263099C](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23CCADBFCLL);
}

void sub_23CCADC64(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_23CCADC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_23CCADDB4(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_23CCADD98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_23CCADDB4(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_23CCAD184();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

unint64_t GCLOptionsNew(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t result;

  if (!a1)
    return 0x8000000000000000;
  v2 = operator new(0x18uLL);
  result = 0;
  v2[2] = 0;
  v2[1] = 0;
  *v2 = v2 + 1;
  *a1 = v2;
  return result;
}

void sub_23CCADEA8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCADE94);
}

void GCLOptionsRelease(char **a1)
{
  if (a1)
  {
    sub_23CCAD084((uint64_t)a1, a1[1]);
    operator delete(a1);
  }
}

uint64_t GCLOptionsGet(uint64_t a1, char *__s, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = 0x8000000000000000;
  if (a1 && __s && a3)
  {
    v7[0] = __s;
    v7[1] = strlen(__s);
    v6 = sub_23CCAD6FC(a1, (uint64_t)v7);
    if (a1 + 8 == v6)
    {
      return 0x8000000000000000;
    }
    else
    {
      result = 0;
      *a3 = *(_DWORD *)(v6 + 56);
    }
  }
  return result;
}

unint64_t GCLOptionsSet(uint64_t **a1, char *a2, int a3)
{
  unint64_t result;
  void *__p[2];
  char v7;
  void **v8;

  result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_23CCAD0D4(__p, a2);
    v8 = __p;
    *((_DWORD *)sub_23CCAD20C(a1, (const void **)__p, (uint64_t)&unk_23CCD3F98, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0)
      operator delete(__p[0]);
    return 0;
  }
  return result;
}

void sub_23CCADFF0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCADFDCLL);
}

unint64_t GCLBufferListFromSource(uint64_t a1, uint64_t **a2)
{
  uint64_t *v4;
  unint64_t v5;

  if (!a2)
    return 0x8000000000000000;
  *a2 = 0;
  if (!a1)
    return 0x8000000000000000;
  v4 = (uint64_t *)operator new(0x18uLL);
  *v4 = (uint64_t)v4;
  v4[1] = (uint64_t)v4;
  v4[2] = 0;
  v5 = sub_23CCB3A10(a1, v4);
  if (v5)
  {
    sub_23CCAE2E8((char *)v4);
    operator delete(v4);
  }
  else
  {
    *a2 = v4;
  }
  return v5;
}

unint64_t GCLBufferListNew(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t result;

  if (!a1)
    return 0x8000000000000000;
  v2 = operator new(0x18uLL);
  result = 0;
  *v2 = v2;
  v2[1] = v2;
  v2[2] = 0;
  *a1 = v2;
  return result;
}

void sub_23CCAE10C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCAE0F8);
}

void GCLBufferListRelease(char *a1)
{
  if (a1)
  {
    sub_23CCAE2E8(a1);
    operator delete(a1);
  }
}

uint64_t GCLBufferListGetBuffer(uint64_t a1, char *__s)
{
  uint64_t result;
  uint64_t v5;
  size_t v6;
  _QWORD *v7;

  result = 0;
  if (a1 && __s)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 == a1)
      return 0;
    v6 = strlen(__s);
    while (1)
    {
      v7 = (_QWORD *)(v5 + 72);
      if (*(char *)(v5 + 95) < 0)
      {
        if (v6 != *(_QWORD *)(v5 + 80))
          goto LABEL_13;
        if (v6 == -1)
LABEL_17:
          sub_23CCAE380();
        v7 = (_QWORD *)*v7;
      }
      else
      {
        if (v6 != *(unsigned __int8 *)(v5 + 95))
          goto LABEL_13;
        if (v6 == -1)
          goto LABEL_17;
      }
      if (!memcmp(v7, __s, v6))
        return v5 + 16;
LABEL_13:
      v5 = *(_QWORD *)(v5 + 8);
      if (v5 == a1)
        return 0;
    }
  }
  return result;
}

uint64_t GCLBufferListGetBufferById(uint64_t result, int a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    while (1)
    {
      v2 = *(_QWORD *)(v2 + 8);
      if (v2 == result)
        break;
      if (*(_QWORD *)(v2 + 120) == a2)
        return v2 + 16;
    }
    return 0;
  }
  return result;
}

unint64_t GCLBufferListAppendNew(uint64_t *a1, char *a2, int a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  unint64_t result;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;

  result = 0x8000000000000000;
  if (a1 && a2)
  {
    v15 = a2;
    v14 = a3;
    v12 = a5;
    v13 = a4;
    v11 = a1[2];
    v9 = sub_23CCAE408((uint64_t)a1, 0, 0, &v11, &v15, &v14, &v13, &v12);
    v9[1] = a1;
    v10 = *a1;
    *v9 = *a1;
    *(_QWORD *)(v10 + 8) = v9;
    *a1 = (uint64_t)v9;
    ++a1[2];
    result = 0;
    if (a6)
      *a6 = v9 + 2;
  }
  return result;
}

void sub_23CCAE2D8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x23CCAE2C8);
}

void sub_23CCAE2E8(char *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;

  if (*((_QWORD *)a1 + 2))
  {
    v2 = *(_QWORD *)a1;
    v3 = (char *)*((_QWORD *)a1 + 1);
    v4 = *(_QWORD *)v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*(_QWORD *)a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    *((_QWORD *)a1 + 2) = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (char *)*((_QWORD *)v3 + 1);
        sub_23CCAD084((uint64_t)(v3 + 96), *((char **)v3 + 13));
        if (v3[95] < 0)
          operator delete(*((void **)v3 + 9));
        if (v3[64])
        {
          v6 = (void *)*((_QWORD *)v3 + 2);
          if (v6)
            operator delete[](v6);
        }
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_23CCAE380()
{
  sub_23CCAE394("basic_string");
}

void sub_23CCAE394(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23CCAE3E4(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_250DE3F68, MEMORY[0x24BEDAB00]);
}

void sub_23CCAE3D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_23CCAE3E4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

_QWORD *sub_23CCAE408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char **a5, int *a6, uint64_t *a7, uint64_t *a8)
{
  uint64_t v15;
  _QWORD *v16;

  v15 = a1 + 16;
  v16 = operator new(0x80uLL);
  *v16 = a2;
  v16[1] = a3;
  sub_23CCAE4A8(v15, (uint64_t)(v16 + 2), a4, a5, a6, a7, a8);
  return v16;
}

void sub_23CCAE494(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23CCAE4A8(uint64_t a1, uint64_t a2, uint64_t *a3, char **a4, int *a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;

  v8 = *a3;
  v9 = *a4;
  v10 = *a5;
  v11 = *a6;
  v12 = *a7;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v12;
  *(_BYTE *)(a2 + 48) = 0;
  result = sub_23CCAD0D4((_QWORD *)(a2 + 56), v9);
  *(_QWORD *)(a2 + 88) = 0;
  a2 += 88;
  *(_QWORD *)(a2 - 8) = a2;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v8;
  return result;
}

void sub_23CCAE500(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 48))
  {
    if (*(_QWORD *)v1)
      operator delete[](*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GCLBufferElementType(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t GCLBufferSetElementType(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t GCLBufferNumRows(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t GCLBufferTupleWidth(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

_QWORD *GCLBufferData(_QWORD *result)
{
  if (result)
    return (_QWORD *)(*result + result[1]);
  return result;
}

uint64_t GCLBufferBase(uint64_t result)
{
  if (result)
    return *(_QWORD *)result;
  return result;
}

_QWORD *GCLBufferSetBase(_QWORD *result, uint64_t a2)
{
  if (result)
    *result = a2;
  return result;
}

uint64_t GCLBufferOffset(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

uint64_t GCLBufferSetOffset(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t GCLBufferStrideBytes(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 40) * *(unsigned __int8 *)(result + 16);
  return result;
}

int *sub_23CCAE5A4(int *result, int *a2, int *a3, int a4, int *a5, int *a6, int *a7, int *a8, _DWORD *a9)
{
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
  unint64_t v23;
  BOOL v24;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;

  v10 = *a7;
  v11 = a7[1];
  v12 = *a5 - v10;
  v13 = a5[1] - v11;
  v14 = a7[2];
  v15 = a5[2] - v14;
  v16 = *a6 - v10;
  v17 = a6[1] - v11;
  v18 = a6[2] - v14;
  v19 = *a8 - v10;
  v20 = a8[1] - v11;
  v21 = a8[2] - v14;
  v22 = v12 * v12 + v13 * v13 + v15 * v15;
  v23 = v16 * v16 + v17 * v17 + v18 * v18;
  if (v22 >> 30)
    v24 = 0;
  else
    v24 = v23 >> 30 == 0;
  if (v24 && (unint64_t)(v19 * v19 + v20 * v20 + v21 * v21) >> 30 == 0)
  {
    v32 = v16 * v12 + v17 * v13 + v18 * v15;
    v33 = v23 * v22 - v32 * v32;
    if (v33)
    {
      v34 = v19 * v12 + v20 * v13 + v21 * v15;
      v35 = v19 * v16 + v20 * v17 + v21 * v18;
      if (v33 >= 0x80)
      {
        v44 = __clz(v33);
        v45 = 57 - v44;
        v46 = 1 << (56 - v44);
        v33 = (uint64_t)(v46 + v33) >> v45;
        v47 = v34 * v23 - v35 * v32;
        if (v47 < 0)
          v36 = -(uint64_t)((unint64_t)(v46 - v47) >> v45);
        else
          v36 = (unint64_t)(v46 + v47) >> v45;
        if (v36 >= 0x3FFFFFFFFFFFLL)
          v36 = 0x3FFFFFFFFFFFLL;
        if (v36 <= (uint64_t)0xFFFFC00000000001)
          v36 = 0xFFFFC00000000001;
        v48 = v35 * v22 - v34 * v32;
        if (v48 < 0)
          v37 = -(uint64_t)((unint64_t)(v46 - v48) >> v45);
        else
          v37 = (unint64_t)(v46 + v48) >> v45;
      }
      else
      {
        v36 = v34 * v23 - v35 * v32;
        if (v36 >= 0x3FFFFFFFFFFFLL)
          v36 = 0x3FFFFFFFFFFFLL;
        if (v36 <= (uint64_t)0xFFFFC00000000001)
          v36 = 0xFFFFC00000000001;
        v37 = v35 * v22 - v34 * v32;
      }
      if (v37 >= 0x3FFFFFFFFFFFLL)
        v37 = 0x3FFFFFFFFFFFLL;
      v49 = 0xFFFFC00000000001;
      if (v37 > (uint64_t)0xFFFFC00000000001)
        v49 = v37;
      v50 = word_23CCD4452[v33 - 1];
      if (v36 * v50 >= 0x3FFFFFFF)
        v51 = 0x3FFFFFFFLL;
      else
        v51 = v36 * v50;
      if (v51 <= -1073741823)
        v51 = -1073741823;
      v52 = v49 * v50;
      if (v52 >= 0x3FFFFFFF)
        v52 = 0x3FFFFFFFLL;
      if (v52 <= -1073741823)
        v52 = -1073741823;
      if (a4 >= 1)
      {
        v53 = a4;
        do
        {
          v55 = *result++;
          v54 = v55;
          v56 = *a2++;
          v57 = v51 * v54 + v52 * v56;
          v58 = *a3++;
          v59 = v57 + (0x10000 - (v51 + v52)) * v58;
          if (v59 >= 0)
            v60 = (unint64_t)(v59 + 0x8000) >> 16;
          else
            v60 = -(uint64_t)((unint64_t)(0x8000 - v59) >> 16);
          if (v60 >= 0x3FFFFFFF)
            v60 = 0x3FFFFFFFLL;
          if (v60 <= -1073741823)
            LODWORD(v60) = -1073741823;
          *a9++ = v60;
          --v53;
        }
        while (v53);
      }
    }
    else if (a4 >= 1)
    {
      v38 = a4;
      do
      {
        v40 = *result++;
        v39 = v40;
        v42 = *a2++;
        v41 = v42;
        v43 = *a3++;
        *a9++ = v41 + v39 - v43;
        --v38;
      }
      while (v38);
    }
  }
  else if (a4 >= 1)
  {
    v26 = a4;
    do
    {
      v28 = *result++;
      v27 = v28;
      v30 = *a2++;
      v29 = v30;
      v31 = *a3++;
      *a9++ = v29 + v27 - v31;
      --v26;
    }
    while (v26);
  }
  return result;
}

int *sub_23CCAE844(int *result, int *a2, int *a3, _DWORD *a4, _DWORD *a5, int *a6, int *a7, _DWORD *a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;

  *a8 = 0;
  v8 = a5[1];
  v9 = a4[1];
  v10 = a5[2];
  v11 = a4[2];
  v12 = (v8 - v9) * (uint64_t)(v8 - v9) + (*a5 - *a4) * (uint64_t)(*a5 - *a4) + (v10 - v11) * (uint64_t)(v10 - v11);
  v13 = *a6;
  v14 = a6[1];
  v15 = a6[2];
  v16 = (v14 - v9) * (uint64_t)(v14 - v9) + (v13 - *a4) * (uint64_t)(v13 - *a4) + (v15 - v11) * (uint64_t)(v15 - v11);
  v17 = (v14 - v8) * (uint64_t)(v14 - v8) + (v13 - *a5) * (uint64_t)(v13 - *a5) + (v15 - v10) * (uint64_t)(v15 - v10);
  if (v12 >> 28)
    v18 = 0;
  else
    v18 = v16 >> 28 == 0;
  if (!v18 || v17 >> 28 != 0 || v12 == 0)
  {
    v21 = *a2 + *result;
    if (v21 < 0 != __OFADD__(*a2, *result))
      ++v21;
    *a7 = v21 >> 1;
    v22 = result[1];
    v23 = a2[1];
    v24 = __OFADD__(v23, v22);
    v25 = v23 + v22;
    if (v25 < 0 != v24)
      ++v25;
    LODWORD(v26) = v25 >> 1;
  }
  else
  {
    v27 = __clz(v12);
    v28 = 1 << (56 - v27);
    if (v12 >= 0x80)
    {
      v17 = (v28 + v17) >> (57 - v27);
      v16 = (v28 + v16) >> (57 - v27);
      v12 = (v28 + v12) >> (57 - v27);
    }
    v29 = word_23CCD4452[v12 - 1];
    v30 = (v16 - v17) * v29;
    v31 = 1073676288;
    if (v30 < 1073676288)
      v31 = v30;
    v32 = v31 + 0x10000;
    v33 = v30 < -1073807360;
    v34 = -1073741824;
    if (!v33)
      v34 = v32;
    v35 = ((v16 * v29) << 18) - v34 * v34;
    if (v35 >= 0xFFFFFFFFLL)
      v35 = 0xFFFFFFFFLL;
    LODWORD(v36) = v35 & ~(v35 >> 63);
    v37 = *result;
    v38 = result[1];
    v39 = *a2 - v37;
    v40 = a2[1] - v38;
    v41 = a3[1] - v38;
    v42 = __clz(v36);
    v43 = ((v36 >> ((32 - v42) >> 1)) + (1 << ((32 - v42) >> 1))) >> 1;
    if (v36 >= 2)
      v36 = v43;
    else
      v36 = v36;
    if ((*a3 - v37) * v40 < v41 * v39)
    {
      v36 = -v36;
      *a8 = 1;
      LODWORD(v37) = *result;
    }
    v44 = (int)v37;
    v45 = v34 * v39 + v36 * v40;
    if (v45 >= 0)
      v46 = (unint64_t)(v45 + 0x10000) >> 17;
    else
      v46 = -(uint64_t)((unint64_t)(0x10000 - v45) >> 17);
    v47 = v46 + v44;
    v48 = v34 * v40 - v36 * v39;
    if (v48 >= 0)
      v49 = (unint64_t)(v48 + 0x10000) >> 17;
    else
      v49 = -(uint64_t)((unint64_t)(0x10000 - v48) >> 17);
    v50 = v49 + result[1];
    if (v47 >= 0x3FFFFFFF)
      v47 = 0x3FFFFFFFLL;
    if (v47 <= -1073741823)
      LODWORD(v47) = -1073741823;
    *a7 = v47;
    if (v50 >= 0x3FFFFFFF)
      v26 = 0x3FFFFFFFLL;
    else
      v26 = v50;
    if (v26 <= -1073741823)
      LODWORD(v26) = -1073741823;
  }
  a7[1] = v26;
  return result;
}

int *sub_23CCAEA84(int *result, int *a2, _DWORD *a3, _DWORD *a4, int *a5, int a6, int *a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;

  v7 = a4[1];
  v8 = a3[1];
  v9 = a4[2];
  v10 = a3[2];
  v11 = (v7 - v8) * (uint64_t)(v7 - v8) + (*a4 - *a3) * (uint64_t)(*a4 - *a3) + (v9 - v10) * (uint64_t)(v9 - v10);
  v12 = *a5;
  v13 = a5[1];
  v14 = a5[2];
  v15 = (v13 - v8) * (uint64_t)(v13 - v8) + (v12 - *a3) * (uint64_t)(v12 - *a3) + (v14 - v10) * (uint64_t)(v14 - v10);
  v16 = (v13 - v7) * (uint64_t)(v13 - v7) + (v12 - *a4) * (uint64_t)(v12 - *a4) + (v14 - v9) * (uint64_t)(v14 - v9);
  if (v11 >> 28)
    v17 = 0;
  else
    v17 = v15 >> 28 == 0;
  if (!v17 || v16 >> 28 != 0 || v11 == 0)
  {
    v20 = *a2 + *result;
    if (v20 < 0 != __OFADD__(*a2, *result))
      ++v20;
    *a7 = v20 >> 1;
    v21 = result[1];
    v22 = a2[1];
    v23 = __OFADD__(v22, v21);
    v24 = v22 + v21;
    if (v24 < 0 != v23)
      ++v24;
    LODWORD(v25) = v24 >> 1;
  }
  else
  {
    v26 = __clz(v11);
    v27 = 57 - v26;
    v28 = 1 << (56 - v26);
    v29 = (v28 + v11) >> v27;
    v30 = (v28 + v15) >> v27;
    v31 = (v28 + v16) >> v27;
    if (v11 >= 0x80)
    {
      v16 = v31;
      v15 = v30;
      v11 = v29;
    }
    v32 = word_23CCD4452[v11 - 1];
    v33 = (v15 - v16) * v32;
    v34 = 1073676288;
    if (v33 < 1073676288)
      v34 = v33;
    v35 = v34 + 0x10000;
    v36 = v33 < -1073807360;
    v37 = -1073741824;
    if (!v36)
      v37 = v35;
    v38 = ((v15 * v32) << 18) - v37 * v37;
    if (v38 >= 0xFFFFFFFFLL)
      v38 = 0xFFFFFFFFLL;
    LODWORD(v38) = v38 & ~(v38 >> 63);
    v39 = *result;
    v40 = result[1];
    v41 = *a2 - v39;
    v42 = a2[1] - v40;
    v43 = __clz(v38);
    if (v38 >= 2)
      v38 = ((v38 >> ((32 - v43) >> 1)) + (1 << ((32 - v43) >> 1))) >> 1;
    else
      v38 = v38;
    v44 = v38 * *((int *)&unk_23CCD4558 + a6);
    v45 = v37 * v41 + v44 * v42;
    if (v45 >= 0)
      v46 = (unint64_t)(v45 + 0x10000) >> 17;
    else
      v46 = -(uint64_t)((unint64_t)(0x10000 - v45) >> 17);
    v47 = v46 + v39;
    v48 = v37 * v42 - v44 * v41;
    if (v48 >= 0)
      v49 = (unint64_t)(v48 + 0x10000) >> 17;
    else
      v49 = -(uint64_t)((unint64_t)(0x10000 - v48) >> 17);
    v25 = v49 + v40;
    if (v47 >= 0x3FFFFFFF)
      v50 = 0x3FFFFFFFLL;
    else
      v50 = v47;
    if (v50 <= -1073741823)
      LODWORD(v50) = -1073741823;
    *a7 = v50;
    if (v25 >= 0x3FFFFFFF)
      v25 = 0x3FFFFFFFLL;
    if (v25 <= -1073741823)
      LODWORD(v25) = -1073741823;
  }
  a7[1] = v25;
  return result;
}

unint64_t sub_23CCAECA0(unint64_t result, int *a2, int *a3, _DWORD *a4, _DWORD *a5, int *a6, int *a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v7 = a5[1];
  v8 = a4[1];
  v9 = a5[2];
  v10 = a4[2];
  v11 = (v7 - v8) * (uint64_t)(v7 - v8) + (*a5 - *a4) * (uint64_t)(*a5 - *a4) + (v9 - v10) * (uint64_t)(v9 - v10);
  v12 = *a6;
  v13 = a6[1];
  v14 = a6[2];
  v15 = (v13 - v8) * (uint64_t)(v13 - v8) + (v12 - *a4) * (uint64_t)(v12 - *a4) + (v14 - v10) * (uint64_t)(v14 - v10);
  v16 = (v13 - v7) * (uint64_t)(v13 - v7) + (v12 - *a5) * (uint64_t)(v12 - *a5) + (v14 - v9) * (uint64_t)(v14 - v9);
  if (v11 >> 28)
    v17 = 0;
  else
    v17 = v15 >> 28 == 0;
  if (!v17 || v16 >> 28 != 0 || v11 == 0)
  {
    v20 = *a2 + *(_DWORD *)result;
    if (v20 < 0 != __OFADD__(*a2, *(_DWORD *)result))
      ++v20;
    *a7 = v20 >> 1;
    v21 = *(_DWORD *)(result + 4);
    v22 = a2[1];
    v23 = __OFADD__(v22, v21);
    v24 = v22 + v21;
    if (v24 < 0 != v23)
      ++v24;
    LODWORD(v25) = v24 >> 1;
  }
  else
  {
    v26 = __clz(v11);
    v27 = 57 - v26;
    v28 = 1 << (56 - v26);
    v29 = (v28 + v11) >> v27;
    v30 = (v28 + v15) >> v27;
    v31 = (v28 + v16) >> v27;
    if (v11 >= 0x80)
    {
      v16 = v31;
      v15 = v30;
      v11 = v29;
    }
    v32 = word_23CCD4452[v11 - 1];
    v33 = (v15 - v16) * v32;
    v34 = 1073676288;
    if (v33 < 1073676288)
      v34 = v33;
    v35 = v34 + 0x10000;
    v36 = v33 < -1073807360;
    v37 = -1073741824;
    if (!v36)
      v37 = v35;
    v38 = ((v15 * v32) << 18) - v37 * v37;
    if (v38 >= 0xFFFFFFFFLL)
      v38 = 0xFFFFFFFFLL;
    LODWORD(v38) = v38 & ~(v38 >> 63);
    v39 = *(int *)result;
    v40 = *(int *)(result + 4);
    v41 = *a2 - v39;
    v42 = a2[1] - v40;
    v43 = (32 - __clz(v38)) >> 1;
    result = v38 >> v43;
    if (v38 >= 2)
      v38 = (result + (1 << v43)) >> 1;
    else
      v38 = v38;
    if ((v40 - a3[1]) * v41 < (v39 - *a3) * v42)
      v38 = -v38;
    v44 = v37 * v41 - v38 * v42;
    if (v44 >= 0)
      v45 = (unint64_t)(v44 + 0x10000) >> 17;
    else
      v45 = -(uint64_t)((unint64_t)(0x10000 - v44) >> 17);
    v46 = v45 + v39;
    v47 = v37 * v42 + v38 * v41;
    if (v47 >= 0)
      v48 = (unint64_t)(v47 + 0x10000) >> 17;
    else
      v48 = -(uint64_t)((unint64_t)(0x10000 - v47) >> 17);
    v25 = v48 + v40;
    if (v46 >= 0x3FFFFFFF)
      v49 = 0x3FFFFFFFLL;
    else
      v49 = v46;
    if (v49 <= -1073741823)
      LODWORD(v49) = -1073741823;
    *a7 = v49;
    if (v25 >= 0x3FFFFFFF)
      v25 = 0x3FFFFFFFLL;
    if (v25 <= -1073741823)
      LODWORD(v25) = -1073741823;
  }
  a7[1] = v25;
  return result;
}

void sub_23CCAEEC8(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_23CCB1C80();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)sub_23CCB1C94(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    v7 = &v4[8 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void sub_23CCAEF5C(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  _QWORD *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  _QWORD *v36;
  size_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  const char *v50;
  size_t v51;

  v8 = a3 + 80;
  v9 = a4[1];
  v50 = v9;
  v51 = strlen(v9);
  v10 = sub_23CCAD6FC(v8, (uint64_t)&v50);
  v11 = v10;
  if (a3 + 88 == v10)
  {
    v14 = strlen(a4[2]);
    v50 = a4[2];
    v51 = v14;
    v15 = sub_23CCAD6FC(v8, (uint64_t)&v50);
    if (v11 != v15)
    {
      v16 = *(_DWORD *)(v15 + 56);
      v17 = *a4;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
      *(_QWORD *)a1 = 0;
      sub_23CCAEEC8((void **)a1, *(_QWORD *)(a2 + 16));
      v18 = *(_QWORD *)(a2 + 8);
      if (v18 == a2)
        return;
      while (1)
      {
        if (!v17)
        {
LABEL_16:
          v50 = "tag";
          v51 = 3;
          v21 = sub_23CCAD6FC(v18 + 96, (uint64_t)&v50);
          if (v18 + 104 != v21 && *(_DWORD *)(v21 + 56) == v16)
          {
            v22 = v18 + 16;
            v24 = *(_QWORD **)(a1 + 8);
            v23 = *(_QWORD *)(a1 + 16);
            if ((unint64_t)v24 >= v23)
            {
              v26 = *(_QWORD **)a1;
              v27 = ((uint64_t)v24 - *(_QWORD *)a1) >> 3;
              v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 61)
                sub_23CCB1C80();
              v29 = v23 - (_QWORD)v26;
              if (v29 >> 2 > v28)
                v28 = v29 >> 2;
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
                v30 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v30 = v28;
              if (v30)
                v30 = (unint64_t)sub_23CCB1C94(v30);
              else
                v31 = 0;
              v32 = (_QWORD *)(v30 + 8 * v27);
              *v32 = v22;
              v25 = v32 + 1;
              if (v24 != v26)
              {
                do
                {
                  v33 = *--v24;
                  *--v32 = v33;
                }
                while (v24 != v26);
                v24 = v26;
              }
              *(_QWORD *)a1 = v32;
              *(_QWORD *)(a1 + 8) = v25;
              *(_QWORD *)(a1 + 16) = v30 + 8 * v31;
              if (v24)
                operator delete(v24);
            }
            else
            {
              *v24 = v22;
              v25 = v24 + 1;
            }
            *(_QWORD *)(a1 + 8) = v25;
          }
          goto LABEL_35;
        }
        v19 = (_QWORD *)(v18 + 72);
        v20 = strlen(v17);
        if (*(char *)(v18 + 95) < 0)
        {
          if (v20 != *(_QWORD *)(v18 + 80))
            goto LABEL_35;
          if (v20 == -1)
            sub_23CCAE380();
          v19 = (_QWORD *)*v19;
        }
        else if (v20 != *(unsigned __int8 *)(v18 + 95))
        {
          goto LABEL_35;
        }
        if (!memcmp(v19, v17, v20))
          goto LABEL_16;
LABEL_35:
        v18 = *(_QWORD *)(v18 + 8);
        if (v18 == a2)
          return;
      }
    }
    v34 = *a4;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    sub_23CCAEEC8((void **)a1, *(_QWORD *)(a2 + 16));
    v35 = *(_QWORD *)(a2 + 8);
    if (v35 == a2)
      return;
    while (1)
    {
      if (!v34)
      {
LABEL_47:
        v50 = "tag";
        v51 = 3;
        if (v35 + 104 == sub_23CCAD6FC(v35 + 96, (uint64_t)&v50))
        {
          v38 = v35 + 16;
          v40 = *(_QWORD **)(a1 + 8);
          v39 = *(_QWORD *)(a1 + 16);
          if ((unint64_t)v40 >= v39)
          {
            v42 = *(_QWORD **)a1;
            v43 = ((uint64_t)v40 - *(_QWORD *)a1) >> 3;
            v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61)
              sub_23CCB1C80();
            v45 = v39 - (_QWORD)v42;
            if (v45 >> 2 > v44)
              v44 = v45 >> 2;
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
              v46 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v46 = v44;
            if (v46)
              v46 = (unint64_t)sub_23CCB1C94(v46);
            else
              v47 = 0;
            v48 = (_QWORD *)(v46 + 8 * v43);
            *v48 = v38;
            v41 = v48 + 1;
            if (v40 != v42)
            {
              do
              {
                v49 = *--v40;
                *--v48 = v49;
              }
              while (v40 != v42);
              v40 = v42;
            }
            *(_QWORD *)a1 = v48;
            *(_QWORD *)(a1 + 8) = v41;
            *(_QWORD *)(a1 + 16) = v46 + 8 * v47;
            if (v40)
              operator delete(v40);
          }
          else
          {
            *v40 = v38;
            v41 = v40 + 1;
          }
          *(_QWORD *)(a1 + 8) = v41;
        }
        goto LABEL_65;
      }
      v36 = (_QWORD *)(v35 + 72);
      v37 = strlen(v34);
      if (*(char *)(v35 + 95) < 0)
      {
        if (v37 != *(_QWORD *)(v35 + 80))
          goto LABEL_65;
        if (v37 == -1)
          sub_23CCAE380();
        v36 = (_QWORD *)*v36;
      }
      else if (v37 != *(unsigned __int8 *)(v35 + 95))
      {
        goto LABEL_65;
      }
      if (!memcmp(v36, v34, v37))
        goto LABEL_47;
LABEL_65:
      v35 = *(_QWORD *)(v35 + 8);
      if (v35 == a2)
        return;
    }
  }
  v12 = a2;
  while (1)
  {
    v12 = *(_QWORD *)(v12 + 8);
    if (v12 == a2)
      break;
    if (*(_QWORD *)(v12 + 120) == *(_DWORD *)(v10 + 56))
    {
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
      v13 = operator new(8uLL);
      *(_QWORD *)a1 = v13;
      *v13++ = v12 + 16;
      *(_QWORD *)(a1 + 8) = v13;
      *(_QWORD *)(a1 + 16) = v13;
      return;
    }
  }
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

void sub_23CCAF338(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_23CCAF378(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  char *v7;
  uint64_t *v8;
  unint64_t result;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v4 = *a2;
  v3 = a2[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v5 = v3 - v4;
  if (v3 == v4)
  {
    result = 0;
    v8 = 0;
    goto LABEL_7;
  }
  sub_23CCB1D6C(a1, v5 >> 3);
  v7 = (char *)a1[1];
  bzero(v7, v5);
  v8 = (uint64_t *)&v7[v5];
  a1[1] = (unint64_t)&v7[v5];
  result = *a1;
  v10 = *a1 == (_QWORD)&v7[v5];
  if ((char *)*a1 == &v7[v5])
  {
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  v11 = 0;
  v12 = (uint64_t *)*a1;
  do
    *v12++ = v11++;
  while (v12 != v8);
LABEL_8:
  if (a2[1] != *a2 && *(_BYTE *)(*a2 + 4))
  {
    v15 = a2;
    v13 = 126 - 2 * __clz((uint64_t)((uint64_t)v8 - result) >> 3);
    if (v10)
      v14 = 0;
    else
      v14 = v13;
    return sub_23CCB1DA8(result, v8, &v15, v14, 1);
  }
  return result;
}

void sub_23CCAF454(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_23CCAF470(unint64_t *a1, uint64_t **a2)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  char v23;
  _QWORD v24[2];

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v3 = *a2;
  v4 = a2[1];
  v5 = (char *)v4 - (char *)*a2;
  if (v4 == *a2)
  {
    v7 = 0;
  }
  else
  {
    if (v5 < 0)
      sub_23CCB1C80();
    v7 = sub_23CCB1C94(v5 >> 3);
    *a1 = (unint64_t)v7;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v7[8 * v8];
    v3 = *a2;
    v4 = a2[1];
  }
  for (; v3 != v4; v7 = v14)
  {
    v9 = *v3;
    v10 = *v3 + 80;
    v24[0] = "meshid";
    v24[1] = 6;
    v11 = sub_23CCAD6FC(v10, (uint64_t)v24);
    if (v9 + 88 == v11)
      v12 = 0;
    else
      v12 = *(unsigned int *)(v11 + 56) | 0x100000000;
    v13 = a1[2];
    if ((unint64_t)v7 >= v13)
    {
      v15 = (_BYTE *)*a1;
      v16 = (uint64_t)&v7[-*a1] >> 3;
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61)
        sub_23CCB1C80();
      v18 = v13 - (_QWORD)v15;
      if (v18 >> 2 > v17)
        v17 = v18 >> 2;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v17;
      if (v19)
        v19 = (unint64_t)sub_23CCB1C94(v19);
      else
        v20 = 0;
      v21 = v19 + 8 * v16;
      *(_QWORD *)v21 = v12;
      v14 = (_BYTE *)(v21 + 8);
      if (v7 != v15)
      {
        do
        {
          v22 = *((_DWORD *)v7 - 2);
          v7 -= 8;
          v23 = v7[4];
          *(_DWORD *)(v21 - 8) = v22;
          v21 -= 8;
          *(_BYTE *)(v21 + 4) = v23;
        }
        while (v7 != v15);
        v7 = (_BYTE *)*a1;
      }
      *a1 = v21;
      a1[1] = (unint64_t)v14;
      a1[2] = v19 + 8 * v20;
      if (v7)
        operator delete(v7);
    }
    else
    {
      *(_QWORD *)v7 = v12;
      v14 = v7 + 8;
    }
    a1[1] = (unint64_t)v14;
    ++v3;
  }
}

void sub_23CCAF600(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (v2)
  {
    *(_QWORD *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_23CCAF628(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_23CCAF668(uint64_t *a1, uint64_t **a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  void *exception;
  _QWORD *v28;
  _QWORD *v29;
  void *__p;
  unsigned __int8 *v31;

  sub_23CCAF470((unint64_t *)&__p, a2);
  v7 = (char *)__p;
  v6 = (char *)v31;
  if (__p != v31)
  {
    v8 = 0;
    v9 = (unsigned __int8 *)__p;
    do
    {
      v8 += v9[4];
      v9 += 8;
    }
    while (v9 != v31);
    if (!v8)
    {
      do
      {
        if (!v7[4])
          v7[4] = 1;
        *(_DWORD *)v7 = v8;
        v7 += 8;
        LODWORD(v8) = v8 + 1;
      }
      while (v7 != v6);
    }
  }
  sub_23CCAF378((unint64_t *)&v28, (uint64_t *)&__p);
  v11 = *a3;
  v10 = a3[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v12 = v10 - v11;
  if (v10 == v11)
  {
    v14 = 0;
  }
  else
  {
    sub_23CCB1D6C(a1, v12 >> 2);
    v13 = (char *)a1[1];
    bzero(v13, 2 * v12);
    v14 = &v13[2 * v12];
    a1[1] = (uint64_t)v14;
  }
  v15 = v28;
  if (v29 == v28)
  {
    v15 = v29;
    if (!v29)
      goto LABEL_24;
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = *a1;
    v19 = (uint64_t)&v14[-*a1] >> 3;
    v20 = v29 - v28;
    do
    {
      if (v19 == v16)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x242630960](exception, "unexpected submeshed topology buffer id");
        __cxa_throw(exception, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
      }
      v21 = v15[v17];
      v22 = (char *)__p + 8 * v21;
      v23 = v22[4];
      v24 = *(_DWORD *)v22;
      if (v23)
        v25 = *(_DWORD *)(*a3 + 4 * v17) == v24;
      else
        v25 = 0;
      if (v25)
      {
        v26 = (*a2)[v21];
        ++v17;
      }
      else
      {
        v26 = 0;
      }
      *(_QWORD *)(v18 + 8 * v16++) = v26;
    }
    while (v17 < v20);
  }
  operator delete(v15);
LABEL_24:
  if (__p)
  {
    v31 = (unsigned __int8 *)__p;
    operator delete(__p);
  }
}

void sub_23CCAF810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  uint64_t v13;
  void *v15;

  if (*(_QWORD *)v13)
  {
    v15 = *(void **)v13;
    *(_QWORD *)(v13 + 8) = *(_QWORD *)v13;
    operator delete(v15);
  }
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void sub_23CCAF874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t *v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int *v52;
  int v53;
  int *v54;
  uint64_t v55;
  int *v56;
  int v57;
  int v58;
  BOOL v59;
  int v60;
  uint64_t v61;
  char v62;
  __int128 *v63;
  uint64_t v64;
  __int128 *v65;
  char v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  int v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t *v84;
  unint64_t *v85;
  unint64_t v86;
  unint64_t *v87;
  unint64_t v88;
  const void *v89;
  void *v90;
  int64_t v91;
  unint64_t v92;
  void *v93;
  unint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  __int128 v97;
  void *v98;
  void *exception;
  void *v100;
  int64x2_t v102;
  uint64_t v103;
  unint64_t v104;
  __int128 v105;
  _BYTE v106[32];
  __int128 v107;
  uint64_t v108;
  unint64_t *v109;
  unint64_t *v110;
  unint64_t v111;
  char *v112;
  char *v113;
  unint64_t v114;
  void *v115[2];
  void *__p[4];
  __int128 v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a3 + 8);
  if (*(_QWORD *)a3 == v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x242630960](exception, "idx buffer missing");
    goto LABEL_136;
  }
  v7 = *(_QWORD *)(a4 + 8);
  v8 = v5 - *(_QWORD *)a3;
  if (v7 != *(_QWORD *)a4 && v8 < v7 - *(_QWORD *)a4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x242630960](exception, "topology and submeshed index buffer mismatch");
    goto LABEL_136;
  }
  if (a5 && v8 >= 9)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x242630960](exception, "facegroup and submeshed buffers conflict");
LABEL_136:
    __cxa_throw(exception, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
  }
  sub_23CCAF470((unint64_t *)&v119, (uint64_t **)a3);
  v12 = *((_QWORD *)&v119 + 1);
  v13 = v119;
  if (*((_QWORD *)&v119 + 1) != (_QWORD)v119)
  {
    v14 = 0;
    v15 = v119;
    do
    {
      v14 += *(unsigned __int8 *)(v15 + 4);
      v15 += 8;
    }
    while (v15 != *((_QWORD *)&v119 + 1));
    if (v14)
    {
      if (v14 != (uint64_t)(*((_QWORD *)&v119 + 1) - v119) >> 3)
      {
        v16 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x242630960](v16, "submeshed index buffer ids incomplete");
        __cxa_throw(v16, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
      }
    }
    else
    {
      do
      {
        if (!*(_BYTE *)(v13 + 4))
          *(_BYTE *)(v13 + 4) = 1;
        *(_DWORD *)v13 = v14;
        v13 += 8;
        LODWORD(v14) = v14 + 1;
      }
      while (v13 != v12);
    }
  }
  sub_23CCAF378((unint64_t *)&v117, (uint64_t *)&v119);
  memset(__p, 0, sizeof(__p));
  *(_OWORD *)v115 = 0u;
  v17 = *(_QWORD *)(a3 + 8);
  v18 = v17 - *(_QWORD *)a3;
  if (v17 == *(_QWORD *)a3)
  {
    v19 = 0;
  }
  else
  {
    if (v18 < 0)
      sub_23CCB1C80();
    v19 = sub_23CCB2D48(v18 >> 3);
    v21 = v20;
    bzero(v19, (unint64_t)v18 >> 1);
    v115[0] = v19;
    v115[1] = (char *)v19 + ((unint64_t)v18 >> 1);
    __p[0] = &v19[v21];
    v22 = *(_QWORD *)(a3 + 8);
    v23 = v22 - *(_QWORD *)a3;
    if (v22 != *(_QWORD *)a3)
    {
      if (v23 < 0)
        sub_23CCB1C80();
      v24 = sub_23CCB1C94(v23 >> 3);
      v26 = v25;
      bzero(v24, v23);
      __p[1] = v24;
      __p[2] = (char *)v24 + v23;
      __p[3] = &v24[v26];
      goto LABEL_25;
    }
  }
  v24 = 0;
LABEL_25:
  v27 = v117;
  if ((_QWORD)v117 != *((_QWORD *)&v117 + 1))
  {
    v28 = v119;
    v29 = (_QWORD *)v117;
    do
    {
      v30 = v28 + 8 * *v29;
      if (!*(_BYTE *)(v30 + 4))
        sub_23CCB1C4C();
      *v19++ = *(_DWORD *)v30;
      ++v29;
    }
    while (v29 != *((_QWORD **)&v27 + 1));
    v31 = (uint64_t *)v27;
    do
    {
      v32 = *v31++;
      *v24++ = *(_QWORD *)(*(_QWORD *)a3 + 8 * v32);
    }
    while (v31 != *((uint64_t **)&v27 + 1));
  }
  if ((_QWORD)v27)
    operator delete((void *)v27);
  if ((_QWORD)v119)
  {
    *((_QWORD *)&v119 + 1) = v119;
    operator delete((void *)v119);
  }
  sub_23CCAF668((uint64_t *)&v117, (uint64_t **)a4, (uint64_t *)v115);
  if (v115[1] == v115[0])
  {
LABEL_137:
    v100 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x242630960](v100, "no faces?");
    __cxa_throw(v100, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
  }
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v102 = vdupq_n_s64(1uLL);
  do
  {
    v103 = v39;
    v104 = v35;
    v41 = *(uint64_t **)(v117 + 8 * v40);
    if (!v41 || !*v41)
      v41 = &qword_23CCD43D0;
    v42 = *((_QWORD *)__p[1] + v40);
    *(_QWORD *)&v119 = "faceType";
    *((_QWORD *)&v119 + 1) = 8;
    v43 = sub_23CCAD6FC(v42 + 80, (uint64_t)&v119);
    if (v42 + 88 == v43)
      v44 = 0;
    else
      v44 = *(unsigned int *)(v43 + 56) | 0x100000000;
    v45 = *(_QWORD *)(v42 + 32);
    if (v45 == 4)
    {
      *((_QWORD *)&v46 + 1) = v102.i64[1];
      *(_QWORD *)&v46 = 4;
    }
    else if (v45 == 3)
    {
      v46 = xmmword_23CCD4560;
    }
    else
    {
      v46 = 0uLL;
    }
    v47 = 0;
    v119 = v46;
    v48 = 0;
    if ((v44 & 0x100000000) != 0 && (v44 & 0xFFFFFFFC) == 0)
    {
      v49 = 8 * (int)v44;
      v47 = *(_QWORD *)((char *)&unk_23CCD45F0 + v49);
      v48 = *(_QWORD *)((char *)&unk_23CCD4610 + v49);
    }
    v120 = v47;
    v121 = v48;
    v50 = *v41;
    if (!*v41)
    {
      v51 = 0;
LABEL_63:
      v61 = 0;
      goto LABEL_64;
    }
    v51 = v41[3];
    if (!v51)
    {
      v50 = 0;
      goto LABEL_63;
    }
    v52 = (int *)(v50 + 4 * v41[1]);
    if (v51 != 1)
    {
      v54 = v52 + 1;
      v53 = *v52;
      v55 = 4 * v51 - 4;
      v56 = v52 + 1;
      do
      {
        v58 = *v56++;
        v57 = v58;
        v59 = v53 < v58;
        if (v53 <= v58)
          v53 = v57;
        if (v59)
          v52 = v54;
        v54 = v56;
        v55 -= 4;
      }
      while (v55);
    }
    v60 = *v52;
    v50 = *v52 & 0xFFFFFFFFFFFFFF00;
    v61 = v60;
    v51 = 1;
LABEL_64:
    v62 = 0;
    v122 = v61 | v50;
    v123 = v51;
    v63 = &v119;
    v64 = 1;
    v65 = &v119;
    do
    {
      v66 = v62;
      v67 = *((unsigned __int8 *)v63 + 24);
      v63 = &v119 + v64;
      if (v67 && (!*((_BYTE *)v65 + 8) || *(_QWORD *)v65 < *(_QWORD *)v63))
        v65 = &v119 + v64;
      v62 = 1;
      v64 = 2;
    }
    while ((v66 & 1) == 0);
    v68 = *(_QWORD *)v65;
    if (v45 > 1)
    {
      if (!v41[3])
      {
        v69 = *(_QWORD *)(v42 + 24);
        goto LABEL_84;
      }
      v98 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x242630960](v98, "index buffer width > 1 when topology buffer present");
LABEL_133:
      __cxa_throw(v98, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
    }
    if ((v44 & 0x100000000) == 0)
      goto LABEL_77;
    if ((_DWORD)v44 != 1)
    {
      if (!(_DWORD)v44)
      {
        v70 = *(_QWORD *)(v42 + 24) / 3uLL;
        goto LABEL_79;
      }
LABEL_77:
      v70 = 0;
      goto LABEL_79;
    }
    v70 = *(_QWORD *)(v42 + 24) >> 2;
LABEL_79:
    v69 = v41[3];
    if (v69)
    {
      if (v70 && v70 != v69)
      {
        v98 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x242630960](v98, "index and topology buffers conflict");
        goto LABEL_133;
      }
    }
    else
    {
      v69 = v70;
    }
LABEL_84:
    if (!*((_BYTE *)v65 + 8))
      sub_23CCB1C4C();
    if ((unint64_t)v37 >= v38)
    {
      v71 = (v37 - v36) >> 2;
      v72 = v71 + 1;
      if ((unint64_t)(v71 + 1) >> 62)
        sub_23CCB1C80();
      if ((uint64_t)(v38 - (_QWORD)v36) >> 1 > v72)
        v72 = (uint64_t)(v38 - (_QWORD)v36) >> 1;
      if (v38 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
        v73 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v73 = v72;
      if (v73)
        v73 = (unint64_t)sub_23CCB2D48(v73);
      else
        v74 = 0;
      v75 = (char *)(v73 + 4 * v71);
      *(_DWORD *)v75 = v68;
      v76 = v75 + 4;
      while (v37 != v36)
      {
        v77 = *((_DWORD *)v37 - 1);
        v37 -= 4;
        *((_DWORD *)v75 - 1) = v77;
        v75 -= 4;
      }
      v78 = v73 + 4 * v74;
      if (v36)
        operator delete(v36);
      v36 = v75;
      v37 = v76;
      v38 = v78;
    }
    else
    {
      *(_DWORD *)v37 = v68;
      v37 += 4;
    }
    v35 = v104;
    if ((unint64_t)v34 >= v104)
    {
      v79 = v34 - v33;
      v80 = v79 + 1;
      if ((unint64_t)(v79 + 1) >> 61)
        sub_23CCB1C80();
      if ((uint64_t)(v104 - (_QWORD)v33) >> 2 > v80)
        v80 = (uint64_t)(v104 - (_QWORD)v33) >> 2;
      if (v104 - (unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
        v81 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v81 = v80;
      if (v81)
      {
        v81 = (unint64_t)sub_23CCB1C94(v81);
        v83 = v38;
      }
      else
      {
        v83 = v38;
        v82 = 0;
      }
      v84 = (unint64_t *)(v81 + 8 * v79);
      *v84 = v69;
      v85 = v84 + 1;
      while (v34 != v33)
      {
        v86 = *--v34;
        *--v84 = v86;
      }
      v35 = v81 + 8 * v82;
      if (v33)
      {
        v87 = v33;
        v88 = v35;
        operator delete(v87);
        v35 = v88;
      }
      v33 = v84;
      v34 = v85;
      v38 = v83;
    }
    else
    {
      *v34++ = v69;
    }
    v39 = v69 + v103;
    ++v40;
    v89 = v115[0];
    v90 = v115[1];
    v91 = (char *)v115[1] - (char *)v115[0];
  }
  while (v40 < ((char *)v115[1] - (char *)v115[0]) >> 2);
  if (!v39)
    goto LABEL_137;
  v92 = v35;
  v93 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v93;
    operator delete(v93);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v89 = v115[0];
    v90 = v115[1];
    v91 = (char *)v115[1] - (char *)v115[0];
  }
  v94 = v91 >> 2;
  *(_QWORD *)a2 = v89;
  *(_QWORD *)(a2 + 8) = v90;
  *(void **)(a2 + 16) = __p[0];
  v115[1] = 0;
  memset(__p, 0, sizeof(__p));
  v115[0] = 0;
  v105 = *(_OWORD *)&__p[1];
  *(void **)v106 = __p[3];
  *(_OWORD *)&v106[8] = v117;
  v95 = v118;
  v117 = 0uLL;
  v118 = 0;
  *(_QWORD *)&v106[24] = v95;
  v107 = 0uLL;
  v108 = 0;
  sub_23CCB2D7C(&v107, v89, (uint64_t)v90, v94);
  v109 = v33;
  v110 = v34;
  v111 = v92;
  v112 = v36;
  v113 = v37;
  v114 = v38;
  *(_QWORD *)(a1 + 24) = 0;
  v96 = operator new(0x88uLL);
  *v96 = &off_250DE4030;
  v96[1] = v39;
  *((_OWORD *)v96 + 1) = v105;
  *((_OWORD *)v96 + 2) = *(_OWORD *)v106;
  v97 = v107;
  *((_OWORD *)v96 + 3) = *(_OWORD *)&v106[16];
  *((_OWORD *)v96 + 4) = v97;
  v96[10] = v108;
  v96[11] = v33;
  v96[12] = v34;
  v96[13] = v92;
  v96[14] = v36;
  v96[15] = v37;
  v96[16] = v38;
  *(_QWORD *)(a1 + 24) = v96;
  if (__p[1])
  {
    __p[2] = __p[1];
    operator delete(__p[1]);
  }
  if (v115[0])
  {
    v115[1] = v115[0];
    operator delete(v115[0]);
  }
}

void sub_23CCB00A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;
  void *v37;

  v37 = *(void **)(v35 - 144);
  if (v37)
  {
    *(_QWORD *)(v35 - 136) = v37;
    operator delete(v37);
  }
  _Unwind_Resume(exception_object);
}

void sub_23CCB01A8()
{
  uint64_t v0;
  void *v1;

  if (v1)
  {
    operator delete(v1);
    if (!v0)
      JUMPOUT(0x23CCB0108);
    JUMPOUT(0x23CCB0100);
  }
  JUMPOUT(0x23CCB00FCLL);
}

_QWORD *sub_23CCB01C4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)a1[13];
  if (v2)
  {
    a1[14] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[10];
  if (v3)
  {
    a1[11] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[7];
  if (v4)
  {
    a1[8] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[4];
  if (v5)
  {
    a1[5] = v5;
    operator delete(v5);
  }
  v6 = (void *)a1[1];
  if (v6)
  {
    a1[2] = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_23CCB0234(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13[2];
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *__p;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v2 = *(_QWORD *)(a1 + 288);
  if (!v2)
    sub_23CCB382C();
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v2 + 48))(v13);
  if (*(_BYTE *)(a1 + 144))
  {
    v3 = *(void **)(a1 + 96);
    if (v3)
      operator delete[](v3);
  }
  v4 = v13[1];
  *(void **)(a1 + 96) = v13[0];
  *(_QWORD *)(a1 + 104) = v4;
  *(_DWORD *)(a1 + 112) = v14;
  v5 = v16;
  *(_QWORD *)(a1 + 120) = v15;
  *(_QWORD *)(a1 + 128) = v5;
  *(_QWORD *)(a1 + 136) = v5;
  *(_BYTE *)(a1 + 144) = v17;
  v17 = 0;
  if (*(_BYTE *)(a1 + 256))
  {
    v6 = *(void **)(a1 + 208);
    if (v6)
      operator delete[](v6);
  }
  v7 = v19;
  *(_QWORD *)(a1 + 208) = __p;
  *(_QWORD *)(a1 + 216) = v7;
  *(_DWORD *)(a1 + 224) = v20;
  v8 = v22;
  *(_QWORD *)(a1 + 232) = v21;
  *(_QWORD *)(a1 + 240) = v8;
  *(_QWORD *)(a1 + 248) = v8;
  *(_BYTE *)(a1 + 256) = v23;
  v23 = 0;
  if (*(_BYTE *)(a1 + 200) && (v9 = *(void **)(a1 + 152)) != 0)
  {
    operator delete[](v9);
    v10 = v23 == 0;
  }
  else
  {
    v10 = 1;
  }
  v11 = v25;
  *(_QWORD *)(a1 + 152) = v24;
  *(_QWORD *)(a1 + 160) = v11;
  *(_DWORD *)(a1 + 168) = v26;
  v12 = v28;
  *(_QWORD *)(a1 + 176) = v27;
  *(_QWORD *)(a1 + 184) = v12;
  *(_QWORD *)(a1 + 192) = v12;
  *(_BYTE *)(a1 + 200) = v29;
  v29 = 0;
  if (!v10 && __p)
    operator delete[](__p);
  if (v17)
  {
    if (v13[0])
      operator delete[](v13[0]);
  }
}

uint64_t sub_23CCB0360(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 232);
  v2 = 12 * *(_QWORD *)(a1 + 64) + 4 * v1;
  v3 = 4 * v1;
  v4 = v2 + 4 * *(_QWORD *)(a1 + 128) * *(_QWORD *)(a1 + 120);
  if (!*(_BYTE *)(a1 + 24))
    v3 = 0;
  return v4 + v3 + 1024;
}

unint64_t sub_23CCB039C(uint64_t a1, int **a2, uint64_t *a3)
{
  int v6;
  unint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_DWORD *)(a1 + 32) & 0x80000000) == 0)
  {
    sub_23CCC4904(a1, *(_QWORD *)(a1 + 40) + 4 * *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 208) + 4 * *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 232), *(_QWORD *)(a1 + 96) + 4 * *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 120) * *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 152) + 4 * *(_QWORD *)(a1 + 160), (unsigned int *)(a1 + 32), a1 + 8);
    if (v6)
      return 0x8000000000000000;
  }
  v10 = 0;
  if (sub_23CCC1B84(*a2, (int32x2_t *)(*(_QWORD *)(a1 + 40) + 4 * *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 64), (int *)(*(_QWORD *)(a1 + 208) + 4 * *(_QWORD *)(a1 + 216)), *(_QWORD *)(a1 + 232), (_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * *(_QWORD *)(a1 + 104)), *(_QWORD *)(a1 + 120) * *(_QWORD *)(a1 + 128), (_DWORD *)(*(_QWORD *)(a1 + 152) + 4 * *(_QWORD *)(a1 + 160)), *a3, a3[1] & ~(a3[1] >> 63), &v10, 0, 0, 0, a1 + 8))return 0x8000000000000000;
  result = 0;
  if (*a3)
    v8 = *a3 + v10;
  else
    v8 = v10;
  v9 = a3[1] - v10;
  *a3 = v8;
  a3[1] = v9;
  return result;
}

void sub_23CCB04A4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = *(_QWORD *)(a1 + 240);
  if (!v2)
    sub_23CCB382C();
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v2 + 48))(v6);
  if (*(_BYTE *)(a1 + 152))
  {
    v3 = *(void **)(a1 + 104);
    if (v3)
      operator delete[](v3);
  }
  v4 = v6[1];
  *(_QWORD *)(a1 + 104) = v6[0];
  *(_QWORD *)(a1 + 112) = v4;
  *(_DWORD *)(a1 + 120) = v7;
  v5 = v9;
  *(_QWORD *)(a1 + 128) = v8;
  *(_QWORD *)(a1 + 136) = v5;
  *(_QWORD *)(a1 + 144) = v5;
  *(_BYTE *)(a1 + 152) = v10;
}

uint64_t sub_23CCB051C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(_QWORD *)(a1 + 80);
  if (*(_DWORD *)(a1 + 44))
  {
    v3 = v1 * v2;
    if (!*(_DWORD *)(a1 + 24))
      v1 = 0;
    v4 = 4 * *(_QWORD *)(a1 + 136) * *(_QWORD *)(a1 + 128);
    if (!*(_DWORD *)(a1 + 28))
      v4 = 0;
    v5 = v1 + 4 * v3 + v4;
  }
  else
  {
    v6 = v1 * v2;
    if (!*(_DWORD *)(a1 + 24))
      v1 = 0;
    v5 = v1 + 4 * v6;
  }
  return v5 + 1024;
}

unint64_t sub_23CCB0574(uint64_t a1, int **a2, uint64_t *a3)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int *v10;
  char v11;
  unint64_t result;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;

  v6 = *(_DWORD *)(a1 + 36);
  if (!*(_DWORD *)(a1 + 44))
  {
    if ((v6 & 0x80000000) == 0
      && sub_23CCC49E0(*a2, *(_QWORD *)(a1 + 48) + 4 * *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 160) + *(_QWORD *)(a1 + 168), *(_DWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), (unsigned int *)(a1 + 36), a1 + 8))
    {
      return 0x8000000000000000;
    }
    v17 = 0;
    if (sub_23CCC4128((unsigned int *)*a2, *(_QWORD *)(a1 + 48) + 4 * *(_QWORD *)(a1 + 56), (_BYTE *)(*(_QWORD *)(a1 + 160) + *(_QWORD *)(a1 + 168)), *(_DWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 80), *a3, a3[1] & ~(a3[1] >> 63), &v17, a1 + 8))return 0x8000000000000000;
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(a1 + 160);
  v8 = *(_DWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 104);
  v10 = *a2;
  if ((v6 & 0x80000000) == 0)
  {
    *(_DWORD *)(a1 + 24) = v7 != 0;
    *(_DWORD *)(a1 + 28) = v9 != 0;
    if (v8 == 1 && *v10 <= 79)
      v11 = 2;
    else
      v11 = 4;
    *(_BYTE *)(a1 + 16) = v11;
    if (v6 - 3 < 4)
    {
      v15 = 0;
      if (v8 == 1)
        v16 = 3;
      else
        v16 = 1;
      goto LABEL_20;
    }
    if (v6 < 3)
    {
      v15 = 0;
      v16 = 1;
LABEL_20:
      *(_DWORD *)(a1 + 20) = v16;
      *(_BYTE *)(a1 + 32) = v15;
      v10 = *a2;
      goto LABEL_21;
    }
    if (v6 != 11)
    {
      if (v8 == 1)
        v16 = 4;
      else
        v16 = 2;
      v15 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
  v17 = 0;
  if (sub_23CCCBCE8((uint64_t)v10, (int *)(*(_QWORD *)(a1 + 48) + 4 * *(_QWORD *)(a1 + 56)), (_BYTE *)(v7 + *(_QWORD *)(a1 + 168)), v8, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), (int *)(v9 + 4 * *(_QWORD *)(a1 + 112)), *a3, a3[1] & ~(a3[1] >> 63), &v17, a1 + 8))return 0x8000000000000000;
LABEL_9:
  result = 0;
  if (*a3)
    v13 = *a3 + v17;
  else
    v13 = v17;
  v14 = a3[1] - v17;
  *a3 = v13;
  a3[1] = v14;
  return result;
}

uint64_t GCLEncodeMeshFromBufferList(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned __int8 v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;
  _QWORD *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  int v37;
  uint64_t *v38;
  uint64_t v39;
  __int128 *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t *v58;
  uint64_t *v59;
  char v60;
  void *v61;
  uint64_t *v62;
  uint64_t v63;
  BOOL v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  int v81;
  const void *v82;
  unint64_t v83;
  size_t v84;
  int v85;
  int v86;
  char v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  char v127;
  uint64_t v128;
  BOOL v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  char v153;
  uint64_t v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  char v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  uint64_t v169;
  void *exception;
  uint64_t v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  _BYTE *v176;
  uint64_t v177;
  char *v178;
  uint64_t *v179;
  uint64_t *__p;
  void *__pa[2];
  uint64_t *__pb;
  _QWORD *v183;
  size_t __sz;
  _QWORD *v185;
  uint64_t *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  char *v192;
  __int128 v193;
  char *v194;
  __int128 *v195;
  uint64_t *v196;
  uint64_t *v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;

  v201 = *MEMORY[0x24BDAC8D0];
  v3 = 0x8000000000000000;
  if (!a1 || !a2 || !*a2)
    return v3;
  v7 = atomic_load((unsigned __int8 *)&qword_256C23050);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_256C23050))
  {
    qword_256C23068 = 0;
    qword_256C23060 = 0;
    qword_256C23058 = (uint64_t)&qword_256C23060;
    __cxa_atexit((void (*)(void *))sub_23CCB19CC, &qword_256C23058, &dword_23CCAC000);
    __cxa_guard_release(&qword_256C23050);
  }
  __sz = 0;
  v185 = &v185;
  v186 = (uint64_t *)&v185;
  if (a3)
    v8 = a3;
  else
    v8 = &qword_256C23058;
  v187 = 0;
  v188 = 0;
  v189 = 0;
  v190 = 0;
  v9 = (char *)operator new(0x128uLL);
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 16) = 0u;
  *((_OWORD *)v9 + 17) = 0u;
  *((_OWORD *)v9 + 14) = 0u;
  *((_OWORD *)v9 + 15) = 0u;
  *((_OWORD *)v9 + 12) = 0u;
  *((_OWORD *)v9 + 13) = 0u;
  *((_OWORD *)v9 + 10) = 0u;
  *((_OWORD *)v9 + 11) = 0u;
  *((_OWORD *)v9 + 8) = 0u;
  *((_OWORD *)v9 + 9) = 0u;
  *((_OWORD *)v9 + 6) = 0u;
  *((_OWORD *)v9 + 7) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((_OWORD *)v9 + 5) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *(_QWORD *)v9 = off_250DE3FA8;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 4;
  *((_DWORD *)v9 + 5) = 2;
  *(_DWORD *)(v9 + 25) = 16843009;
  v9[29] = 1;
  *((_DWORD *)v9 + 8) = 9;
  *((_QWORD *)v9 + 36) = 0;
  v10 = *(_QWORD *)(a1 + 8);
  v183 = a2;
  if (v10 == a1)
    goto LABEL_78;
  v11 = *(_QWORD *)(a1 + 8);
  while (1)
  {
    v12 = (_QWORD *)(v11 + 72);
    v13 = *(char *)(v11 + 95);
    if ((v13 & 0x80000000) == 0)
      break;
    if (*(_QWORD *)(v11 + 80) == 4)
    {
      v12 = (_QWORD *)*v12;
      goto LABEL_15;
    }
LABEL_16:
    v11 = *(_QWORD *)(v11 + 8);
    if (v11 == a1)
    {
      v14 = 0;
      goto LABEL_19;
    }
  }
  if (v13 != 4)
    goto LABEL_16;
LABEL_15:
  if (*(_DWORD *)v12 != *(_DWORD *)"vtxs")
    goto LABEL_16;
  v14 = v11 + 16;
  do
  {
LABEL_19:
    v15 = (_QWORD *)(v10 + 72);
    v16 = *(char *)(v10 + 95);
    if (v16 < 0)
    {
      if (*(_QWORD *)(v10 + 80) != 4)
        goto LABEL_25;
      v15 = (_QWORD *)*v15;
    }
    else if (v16 != 4)
    {
      goto LABEL_25;
    }
    if (*(_DWORD *)v15 == *(_DWORD *)"fgrp")
    {
      v17 = v10 + 16;
      if (v14)
        goto LABEL_27;
      goto LABEL_78;
    }
LABEL_25:
    v10 = *(_QWORD *)(v10 + 8);
  }
  while (v10 != a1);
  v17 = 0;
  if (!v14)
  {
LABEL_78:
    v18 = 0x8000000000000000;
    goto LABEL_79;
  }
LABEL_27:
  v18 = 0x8000000000000000;
  if (!*(_QWORD *)v14)
    goto LABEL_79;
  v179 = v8;
  if (*(_DWORD *)(v14 + 16) != 260
    || *(_QWORD *)(v14 + 32) != 3
    || v17 && (!*(_QWORD *)v17 || *(_DWORD *)(v17 + 16) != 260 || *(_QWORD *)(v17 + 32) != 1))
  {
    goto LABEL_79;
  }
  sub_23CCAEF5C((uint64_t)&v191, a1, v14, (const char **)off_250DE42C8);
  v177 = v17;
  v196 = 0;
  v197 = 0;
  v198 = 0;
  sub_23CCAEEC8((void **)&v196, *(_QWORD *)(a1 + 16));
  v19 = *(_QWORD *)(a1 + 8);
  if (v19 == a1)
    goto LABEL_61;
  v21 = v197;
  v20 = v198;
  v22 = v196;
  while (2)
  {
    v23 = (_QWORD *)(v19 + 72);
    v24 = *(char *)(v19 + 95);
    if (v24 < 0)
    {
      if (*(_QWORD *)(v19 + 80) != 4)
        goto LABEL_59;
      v23 = (_QWORD *)*v23;
    }
    else if (v24 != 4)
    {
      goto LABEL_59;
    }
    if (*(_DWORD *)v23 == *(_DWORD *)"topo")
    {
      __p = v22;
      v25 = v19 + 16;
      if ((unint64_t)v21 >= v20)
      {
        v26 = v21 - v22;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61)
          sub_23CCB1C80();
        if ((uint64_t)(v20 - (_QWORD)__p) >> 2 > v27)
          v27 = (uint64_t)(v20 - (_QWORD)__p) >> 2;
        if (v20 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8)
          v28 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v28 = v27;
        if (v28)
          v28 = (unint64_t)sub_23CCB1C94(v28);
        else
          v29 = 0;
        v22 = (uint64_t *)(v28 + 8 * v26);
        *v22 = v25;
        v30 = v22 + 1;
        while (v21 != __p)
        {
          v31 = *--v21;
          *--v22 = v31;
        }
        v20 = v28 + 8 * v29;
        if (__p)
        {
          v32 = v28 + 8 * v29;
          operator delete(__p);
          v20 = v32;
        }
        v21 = v30;
      }
      else
      {
        *v21++ = v25;
      }
    }
LABEL_59:
    v19 = *(_QWORD *)(v19 + 8);
    if (v19 != a1)
      continue;
    break;
  }
  v197 = v21;
  v198 = v20;
  v196 = v22;
LABEL_61:
  v33 = v191;
  v34 = v192;
  if (v191 != v192)
  {
    v35 = (char *)v191;
    v18 = 0x8000000000000000;
    do
    {
      v36 = *(_QWORD *)v35;
      if (!*(_QWORD *)v35)
        goto LABEL_99;
      v37 = 0;
      if (!*(_QWORD *)v36 || *(_DWORD *)(v36 + 16) != 260)
        goto LABEL_100;
      v35 += 8;
    }
    while (v35 != v192);
    if (v196 != v197)
    {
      v38 = v196;
      v18 = 0x8000000000000000;
      do
      {
        v39 = *v38;
        if (!*v38)
          goto LABEL_99;
        v37 = 0;
        if (!*(_QWORD *)v39 || *(_DWORD *)(v39 + 16) != 260)
          goto LABEL_100;
        if (*(_QWORD *)(v39 + 32) != 1)
          goto LABEL_99;
        ++v38;
      }
      while (v38 != v197);
    }
    sub_23CCAF874((uint64_t)&v193, (uint64_t)&v188, (uint64_t)&v191, (uint64_t)&v196, v177);
    sub_23CCB379C((_QWORD *)v9 + 33, (uint64_t)&v193);
    v40 = v195;
    if (v195 == &v193)
    {
      v41 = 4;
      v40 = &v193;
LABEL_224:
      (*(void (**)(void))(*(_QWORD *)v40 + 8 * v41))();
    }
    else if (v195)
    {
      v41 = 5;
      goto LABEL_224;
    }
    v176 = v33;
    v121 = *(_QWORD *)v14;
    v122 = *(_QWORD *)(v14 + 8);
    v123 = *(_DWORD *)(v14 + 16);
    v124 = *(_QWORD *)(v14 + 24);
    v125 = *(_QWORD *)(v14 + 32);
    if (v9[88])
    {
      v126 = (void *)*((_QWORD *)v9 + 5);
      if (v126)
      {
        v174 = *(_QWORD *)(v14 + 24);
        operator delete[](v126);
        v124 = v174;
      }
    }
    v127 = 0;
    v128 = 0;
    *((_QWORD *)v9 + 5) = v121;
    *((_QWORD *)v9 + 6) = v122;
    *((_DWORD *)v9 + 14) = v123;
    *((_QWORD *)v9 + 8) = v124;
    *((_QWORD *)v9 + 9) = v125;
    *((_QWORD *)v9 + 10) = v125;
    v9[88] = 0;
    *((_DWORD *)v9 + 8) = -1;
    if (v177)
      v129 = 1;
    else
      v129 = (unint64_t)(v34 - v176) > 8;
    v130 = v129;
    v9[24] = v130;
    v131 = v14 + 80;
    v199 = v14 + 80;
    v200 = v179;
    while (1)
    {
      v132 = *(&v199 + v128);
      v133 = v127;
      *(_QWORD *)&v193 = "compression-level";
      *((_QWORD *)&v193 + 1) = 17;
      v134 = sub_23CCAD6FC(v132, (uint64_t)&v193);
      if (v132 + 8 != v134)
        break;
      v127 = 1;
      v128 = 1;
      if ((v133 & 1) != 0)
        goto LABEL_239;
    }
    *((_DWORD *)v9 + 8) = *(_DWORD *)(v134 + 56);
LABEL_239:
    v135 = 0;
    v136 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v137 = *(&v199 + v136);
      v138 = v135;
      *(_QWORD *)&v193 = "mode-bin";
      *((_QWORD *)&v193 + 1) = 8;
      v139 = sub_23CCAD6FC(v137, (uint64_t)&v193);
      if (v137 + 8 != v139)
        break;
      v135 = 1;
      v136 = 1;
      if ((v138 & 1) != 0)
        goto LABEL_244;
    }
    v9[16] = *(_DWORD *)(v139 + 56);
LABEL_244:
    v140 = 0;
    v141 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v142 = *(&v199 + v141);
      v143 = v140;
      *(_QWORD *)&v193 = "mode-pred";
      *((_QWORD *)&v193 + 1) = 9;
      v144 = sub_23CCAD6FC(v142, (uint64_t)&v193);
      if (v142 + 8 != v144)
        break;
      v140 = 1;
      v141 = 1;
      if ((v143 & 1) != 0)
        goto LABEL_249;
    }
    *((_DWORD *)v9 + 5) = *(_DWORD *)(v144 + 56);
LABEL_249:
    v145 = 0;
    v146 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v147 = *(&v199 + v146);
      v148 = v145;
      *(_QWORD *)&v193 = "pmesh-act";
      *((_QWORD *)&v193 + 1) = 9;
      v149 = sub_23CCAD6FC(v147, (uint64_t)&v193);
      if (v147 + 8 != v149)
        break;
      v145 = 1;
      v146 = 1;
      if ((v148 & 1) != 0)
        goto LABEL_254;
    }
    v9[25] = *(_DWORD *)(v149 + 56);
LABEL_254:
    v150 = 0;
    v151 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v152 = *(&v199 + v151);
      v153 = v150;
      *(_QWORD *)&v193 = "pmesh-tfsc";
      *((_QWORD *)&v193 + 1) = 10;
      v154 = sub_23CCAD6FC(v152, (uint64_t)&v193);
      if (v152 + 8 != v154)
        break;
      v150 = 1;
      v151 = 1;
      if ((v153 & 1) != 0)
        goto LABEL_259;
    }
    v9[26] = *(_DWORD *)(v154 + 56);
LABEL_259:
    v155 = 0;
    v156 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v157 = *(&v199 + v156);
      v158 = v155;
      *(_QWORD *)&v193 = "pmesh-gbt";
      *((_QWORD *)&v193 + 1) = 9;
      v159 = sub_23CCAD6FC(v157, (uint64_t)&v193);
      if (v157 + 8 != v159)
        break;
      v155 = 1;
      v156 = 1;
      if ((v158 & 1) != 0)
        goto LABEL_264;
    }
    v9[27] = *(_DWORD *)(v159 + 56);
LABEL_264:
    v160 = 0;
    v161 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v162 = *(&v199 + v161);
      v163 = v160;
      *(_QWORD *)&v193 = "mode-abe";
      *((_QWORD *)&v193 + 1) = 8;
      v164 = sub_23CCAD6FC(v162, (uint64_t)&v193);
      if (v162 + 8 != v164)
        break;
      v160 = 1;
      v161 = 1;
      if ((v163 & 1) != 0)
        goto LABEL_269;
    }
    v9[28] = *(_DWORD *)(v164 + 56);
LABEL_269:
    v165 = 0;
    v166 = 0;
    v199 = v131;
    v200 = v179;
    while (1)
    {
      v167 = *(&v199 + v166);
      v168 = v165;
      *(_QWORD *)&v193 = "pmesh-dlpp";
      *((_QWORD *)&v193 + 1) = 10;
      v169 = sub_23CCAD6FC(v167, (uint64_t)&v193);
      if (v167 + 8 != v169)
        break;
      v165 = 1;
      v166 = 1;
      if ((v168 & 1) != 0)
        goto LABEL_274;
    }
    v9[29] = *(_DWORD *)(v169 + 56);
LABEL_274:
    v18 = 0;
    v37 = 1;
    v33 = v176;
    goto LABEL_100;
  }
LABEL_99:
  v37 = 0;
  v18 = 0x8000000000000000;
LABEL_100:
  if (v196)
    operator delete(v196);
  if (v33)
    operator delete(v33);
  if (!v37)
  {
LABEL_79:
    sub_23CCB3878(v9);
    goto LABEL_80;
  }
  v49 = operator new(0x18uLL);
  v50 = (uint64_t)v185;
  v49[1] = &v185;
  v49[2] = v9;
  *v49 = v50;
  *(_QWORD *)(v50 + 8) = v49;
  v185 = v49;
  ++v187;
  v51 = *(_QWORD *)(a1 + 8);
  if (v51 != a1)
  {
    while (1)
    {
      if (*(char *)(v51 + 95) < 0)
      {
        v53 = *(char **)(v51 + 72);
        v52 = *(_QWORD *)(v51 + 80);
      }
      else
      {
        v52 = *(unsigned __int8 *)(v51 + 95);
        v53 = (char *)(v51 + 72);
      }
      if (v52 >= 4)
        break;
LABEL_218:
      v51 = *(_QWORD *)(v51 + 8);
      if (v51 == a1)
        goto LABEL_219;
    }
    v54 = &v53[v52];
    v55 = v53;
    while (1)
    {
      v56 = (char *)memchr(v55, 97, v52 - 3);
      if (!v56)
        goto LABEL_218;
      if (*(_DWORD *)v56 == 1920234593)
        break;
      v55 = v56 + 1;
      v52 = v54 - v55;
      if (v54 - v55 < 4)
        goto LABEL_218;
    }
    if (v56 == v54 || v56 != v53)
      goto LABEL_218;
    v57 = (char *)operator new(0xF8uLL);
    *((_OWORD *)v57 + 1) = 0u;
    *((_OWORD *)v57 + 13) = 0u;
    *((_OWORD *)v57 + 14) = 0u;
    *((_OWORD *)v57 + 11) = 0u;
    *((_OWORD *)v57 + 12) = 0u;
    *((_OWORD *)v57 + 9) = 0u;
    *((_OWORD *)v57 + 10) = 0u;
    *((_OWORD *)v57 + 7) = 0u;
    *((_OWORD *)v57 + 8) = 0u;
    *((_OWORD *)v57 + 5) = 0u;
    *((_OWORD *)v57 + 6) = 0u;
    *((_OWORD *)v57 + 3) = 0u;
    *((_OWORD *)v57 + 4) = 0u;
    *((_OWORD *)v57 + 2) = 0u;
    *(_QWORD *)v57 = off_250DE3FE0;
    *((_QWORD *)v57 + 1) = 0;
    v57[16] = 4;
    *((_DWORD *)v57 + 5) = 2;
    v57[32] = 1;
    *((_DWORD *)v57 + 9) = 9;
    *((_QWORD *)v57 + 30) = 0;
    sub_23CCAEF5C((uint64_t)&v191, a1, v51 + 16, (const char **)off_250DE42C8);
    sub_23CCAEF5C((uint64_t)&v193, a1, v51 + 16, (const char **)off_250DE42E0);
    if ((_QWORD)v193 != *((_QWORD *)&v193 + 1))
    {
      v58 = *(uint64_t **)v193;
      goto LABEL_120;
    }
    v58 = 0;
    v59 = 0;
    if ((_QWORD)v193)
    {
LABEL_120:
      operator delete((void *)v193);
      v59 = v58;
    }
    v60 = 0;
    v18 = 0x8000000000000000;
    v61 = v191;
    if (!*(_QWORD *)(v51 + 16) || *(_DWORD *)(v51 + 32) != 260)
      goto LABEL_214;
    v62 = (uint64_t *)v191;
    if (v191 != v192)
    {
      while (1)
      {
        v63 = *v62;
        if (!*v62)
          break;
        v64 = *(_QWORD *)v63 && *(_DWORD *)(v63 + 16) == 4;
        if (!v64 || *(_QWORD *)(v63 + 32) != 1)
          break;
        if (++v62 == (uint64_t *)v192)
          goto LABEL_132;
      }
      v60 = 0;
      v18 = 0x8000000000000000;
      goto LABEL_214;
    }
LABEL_132:
    if (v59)
    {
      v60 = 0;
      v18 = 0x8000000000000000;
      if (*v59 && *((_DWORD *)v59 + 4) == 1)
      {
        if (v59[4] == 1)
          goto LABEL_136;
        v60 = 0;
      }
LABEL_214:
      if (v61)
        operator delete(v61);
      if ((v60 & 1) != 0)
      {
        v118 = operator new(0x18uLL);
        v118[1] = &v185;
        v118[2] = v57;
        v119 = (uint64_t)v185;
        *v118 = v185;
        *(_QWORD *)(v119 + 8) = v118;
        v185 = v118;
        ++v187;
        goto LABEL_218;
      }
      sub_23CCB3918(v57);
      goto LABEL_80;
    }
LABEL_136:
    v175 = v192;
    v178 = (char *)v191;
    if (v191 == v192)
    {
      v65 = 0;
      *(_OWORD *)__pa = 0u;
    }
    else
    {
      if ((v192 - (_BYTE *)v191) >> 3 != (v189 - (uint64_t)v188) >> 2)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x242630960](exception, "mismatched submeshed attribute index buffers");
        __cxa_throw(exception, (struct type_info *)&unk_250DE3F80, MEMORY[0x24BEDAB60]);
      }
      sub_23CCAF668((uint64_t *)&v193, (uint64_t **)&v191, (uint64_t *)&v188);
      *(_OWORD *)__pa = v193;
      v65 = v194;
    }
    v66 = (char *)operator new(0x20uLL);
    *(_QWORD *)v66 = &off_250DE4078;
    *(_OWORD *)(v66 + 8) = *(_OWORD *)__pa;
    *((_QWORD *)v66 + 3) = v65;
    v67 = (char *)*((_QWORD *)v57 + 30);
    *((_QWORD *)v57 + 30) = 0;
    if (v67 == v57 + 216)
    {
      v67 = v57 + 216;
      v68 = 4;
LABEL_145:
      (*(void (**)(void))(*(_QWORD *)v67 + 8 * v68))();
    }
    else if (v67)
    {
      v68 = 5;
      goto LABEL_145;
    }
    __pb = v59;
    *((_QWORD *)v57 + 30) = v66;
    v69 = *(_DWORD *)(v51 + 32);
    v71 = *(_QWORD *)(v51 + 16);
    v70 = *(_QWORD *)(v51 + 24);
    v73 = *(_QWORD *)(v51 + 40);
    v72 = *(_QWORD *)(v51 + 48);
    if (v57[96])
    {
      v74 = (void *)*((_QWORD *)v57 + 6);
      if (v74)
      {
        v172 = *(_DWORD *)(v51 + 32);
        operator delete[](v74);
        v69 = v172;
      }
    }
    *((_QWORD *)v57 + 6) = v71;
    *((_QWORD *)v57 + 7) = v70;
    *((_DWORD *)v57 + 16) = v69;
    *((_QWORD *)v57 + 9) = v73;
    *((_QWORD *)v57 + 10) = v72;
    *((_QWORD *)v57 + 11) = v72;
    v57[96] = 0;
    if (__pb)
    {
      v75 = *__pb;
      v76 = __pb[1];
      v77 = *((_DWORD *)__pb + 4);
      v78 = __pb[3];
      v79 = __pb[4];
    }
    else
    {
      v75 = 0;
      v76 = 0;
      v77 = 0;
      v78 = 0;
      v79 = 0;
    }
    v61 = v178;
    if (v57[208])
    {
      v80 = (void *)*((_QWORD *)v57 + 20);
      if (v80)
      {
        v171 = v76;
        v173 = v75;
        operator delete[](v80);
        v76 = v171;
        v75 = v173;
      }
    }
    *((_QWORD *)v57 + 20) = v75;
    *((_QWORD *)v57 + 21) = v76;
    *((_DWORD *)v57 + 44) = v77;
    *((_QWORD *)v57 + 23) = v78;
    *((_QWORD *)v57 + 24) = v79;
    *((_QWORD *)v57 + 25) = v79;
    v57[208] = 0;
    v81 = *(char *)(v51 + 95);
    if (v81 >= 0)
      v82 = (const void *)(v51 + 72);
    else
      v82 = *(const void **)(v51 + 72);
    if (v81 >= 0)
      v83 = *(unsigned __int8 *)(v51 + 95);
    else
      v83 = *(_QWORD *)(v51 + 80);
    if (v83 >= 8)
      v84 = 8;
    else
      v84 = v83;
    if (!memcmp(v82, "attrTCrd", v84) && v83 == 8)
    {
      v85 = 1;
    }
    else if (!memcmp(v82, "attrNorm", v84) && v83 == 8)
    {
      v85 = 2;
    }
    else if (!memcmp(v82, "attrTgnt", v84) && v83 == 8)
    {
      v85 = 3;
    }
    else if (!memcmp(v82, "attrBgnt", v84) && v83 == 8)
    {
      v85 = 4;
    }
    else
    {
      v86 = memcmp(v82, "attrColr", v84);
      if (v83 == 8 && v86 == 0)
        v85 = 5;
      else
        v85 = 0;
    }
    v88 = 0;
    v89 = 0;
    *((_DWORD *)v57 + 10) = v85;
    *((_DWORD *)v57 + 11) = 0;
    *((_DWORD *)v57 + 9) = -1;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v90 = (uint64_t)(&v196)[v89];
      v91 = v88;
      *(_QWORD *)&v193 = "compression-level";
      *((_QWORD *)&v193 + 1) = 17;
      v92 = sub_23CCAD6FC(v90, (uint64_t)&v193);
      if (v90 + 8 != v92)
        break;
      v88 = 1;
      v89 = 1;
      if ((v91 & 1) != 0)
        goto LABEL_188;
    }
    *((_DWORD *)v57 + 9) = *(_DWORD *)(v92 + 56);
LABEL_188:
    v93 = 0;
    v94 = 0;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v95 = (uint64_t)(&v196)[v94];
      v96 = v93;
      *(_QWORD *)&v193 = "mode-bin";
      *((_QWORD *)&v193 + 1) = 8;
      v97 = sub_23CCAD6FC(v95, (uint64_t)&v193);
      if (v95 + 8 != v97)
        break;
      v93 = 1;
      v94 = 1;
      if ((v96 & 1) != 0)
        goto LABEL_193;
    }
    v57[16] = *(_DWORD *)(v97 + 56);
LABEL_193:
    v98 = 0;
    v99 = 0;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v100 = (uint64_t)(&v196)[v99];
      v101 = v98;
      *(_QWORD *)&v193 = "mode-pred";
      *((_QWORD *)&v193 + 1) = 9;
      v102 = sub_23CCAD6FC(v100, (uint64_t)&v193);
      if (v100 + 8 != v102)
        break;
      v98 = 1;
      v99 = 1;
      if ((v101 & 1) != 0)
        goto LABEL_198;
    }
    *((_DWORD *)v57 + 5) = *(_DWORD *)(v102 + 56);
LABEL_198:
    v103 = 0;
    v104 = 0;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v105 = (uint64_t)(&v196)[v104];
      v106 = v103;
      *(_QWORD *)&v193 = "mode-abe";
      *((_QWORD *)&v193 + 1) = 8;
      v107 = sub_23CCAD6FC(v105, (uint64_t)&v193);
      if (v105 + 8 != v107)
        break;
      v103 = 1;
      v104 = 1;
      if ((v106 & 1) != 0)
        goto LABEL_203;
    }
    v57[32] = *(_DWORD *)(v107 + 56);
LABEL_203:
    v108 = 0;
    v109 = 0;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v110 = (uint64_t)(&v196)[v109];
      v111 = v108;
      *(_QWORD *)&v193 = "bitdepth";
      *((_QWORD *)&v193 + 1) = 8;
      v112 = sub_23CCAD6FC(v110, (uint64_t)&v193);
      if (v110 + 8 != v112)
        break;
      v108 = 1;
      v109 = 1;
      if ((v111 & 1) != 0)
        goto LABEL_208;
    }
    *((_DWORD *)v57 + 3) = *(_DWORD *)(v112 + 56);
LABEL_208:
    v113 = 0;
    v114 = 0;
    v196 = (uint64_t *)(v51 + 96);
    v197 = v179;
    while (1)
    {
      v115 = (uint64_t)(&v196)[v114];
      v116 = v113;
      *(_QWORD *)&v193 = "attrScope";
      *((_QWORD *)&v193 + 1) = 9;
      v117 = sub_23CCAD6FC(v115, (uint64_t)&v193);
      if (v115 + 8 != v117)
        break;
      v113 = 1;
      v114 = 1;
      if ((v116 & 1) != 0)
        goto LABEL_213;
    }
    *((_DWORD *)v57 + 11) = *(_DWORD *)(v117 + 56);
LABEL_213:
    v18 = 0;
    *((_DWORD *)v57 + 6) = __pb != 0;
    *((_DWORD *)v57 + 7) = v178 != v175;
    v60 = 1;
    goto LABEL_214;
  }
LABEL_219:
  v120 = v186;
  if (v186 == (uint64_t *)&v185)
  {
    v18 = 0;
  }
  else
  {
    do
    {
      (**(void (***)(uint64_t))v120[2])(v120[2]);
      v18 = 0;
      __sz += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v120[2] + 8))(v120[2]);
      v120 = (uint64_t *)v120[1];
    }
    while (v120 != (uint64_t *)&v185);
  }
LABEL_80:
  if (v188)
    operator delete(v188);
  if (v18)
  {
    v3 = 0x8000000000000000;
  }
  else
  {
    v194 = 0;
    v193 = 0uLL;
    if (__sz)
    {
      if ((__sz & 0x8000000000000000) != 0)
        sub_23CCB1C80();
      v42 = (char *)operator new(__sz);
      v43 = &v42[__sz];
      *(_QWORD *)&v193 = v42;
      v194 = &v42[__sz];
      bzero(v42, __sz);
      *((_QWORD *)&v193 + 1) = &v42[__sz];
    }
    else
    {
      v43 = 0;
      v42 = 0;
    }
    v44 = v43 - v42;
    v191 = v42;
    v192 = (char *)(v43 - v42);
    sub_23CCD2D64(&v196);
    v45 = v186;
    if (v186 == (uint64_t *)&v185)
    {
LABEL_92:
      ((void (*)(_QWORD, char *, int64_t))*v183)(v183[1], v42, v43 - v42 - (v44 & ~(v44 >> 63)));
      v3 = 0;
    }
    else
    {
      while (1)
      {
        v3 = (*(uint64_t (**)(uint64_t, uint64_t **, void **))(*(_QWORD *)v45[2] + 16))(v45[2], &v196, &v191);
        if (v3)
          break;
        v45 = (uint64_t *)v45[1];
        if (v45 == (uint64_t *)&v185)
        {
          v44 = (uint64_t)v192;
          goto LABEL_92;
        }
      }
    }
    v46 = (uint64_t)v196;
    v196 = 0;
    if (v46)
    {
      v47 = sub_23CCD32C4(v46);
      operator delete(v47);
    }
    if (v42)
      operator delete(v42);
  }
  sub_23CCB1CF0((uint64_t *)&v185);
  return v3;
}

void sub_23CCB17F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, __int128 a15, uint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  _QWORD *v29;

  if (a2)
  {
    if (__p)
      operator delete(__p);
    sub_23CCB3918(v29);
    if (a22)
      operator delete(a22);
    sub_23CCB1CF0(a17);
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x23CCB0C58);
  }
  _Unwind_Resume(exception_object);
}

void sub_23CCB19C4()
{
  JUMPOUT(0x23CCB1818);
}

uint64_t sub_23CCB19CC(uint64_t a1)
{
  sub_23CCAD084(a1, *(char **)(a1 + 8));
  return a1;
}

uint64_t sub_23CCB19F4(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (_QWORD *)(a1 + 264);
  v3 = *(_QWORD **)(a1 + 288);
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
  if (*(_BYTE *)(a1 + 256))
  {
    v5 = *(void **)(a1 + 208);
    if (v5)
      operator delete[](v5);
  }
  if (*(_BYTE *)(a1 + 200))
  {
    v6 = *(void **)(a1 + 152);
    if (v6)
      operator delete[](v6);
  }
  if (*(_BYTE *)(a1 + 144))
  {
    v7 = *(void **)(a1 + 96);
    if (v7)
      operator delete[](v7);
  }
  if (*(_BYTE *)(a1 + 88))
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
      operator delete[](v8);
  }
  return a1;
}

void sub_23CCB1A94(_QWORD *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (char *)(__p + 33);
  v3 = (char *)__p[36];
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
  if (*((_BYTE *)__p + 256))
  {
    v5 = (void *)__p[26];
    if (v5)
      operator delete[](v5);
  }
  if (*((_BYTE *)__p + 200))
  {
    v6 = (void *)__p[19];
    if (v6)
      operator delete[](v6);
  }
  if (*((_BYTE *)__p + 144))
  {
    v7 = (void *)__p[12];
    if (v7)
      operator delete[](v7);
  }
  if (*((_BYTE *)__p + 88))
  {
    v8 = (void *)__p[5];
    if (v8)
      operator delete[](v8);
  }
  operator delete(__p);
}

uint64_t sub_23CCB1B34(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (_QWORD *)(a1 + 216);
  v3 = *(_QWORD **)(a1 + 240);
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
  if (*(_BYTE *)(a1 + 208))
  {
    v5 = *(void **)(a1 + 160);
    if (v5)
      operator delete[](v5);
  }
  if (*(_BYTE *)(a1 + 152))
  {
    v6 = *(void **)(a1 + 104);
    if (v6)
      operator delete[](v6);
  }
  if (*(_BYTE *)(a1 + 96))
  {
    v7 = *(void **)(a1 + 48);
    if (v7)
      operator delete[](v7);
  }
  return a1;
}

void sub_23CCB1BC0(_QWORD *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (char *)(__p + 27);
  v3 = (char *)__p[30];
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
  if (*((_BYTE *)__p + 208))
  {
    v5 = (void *)__p[20];
    if (v5)
      operator delete[](v5);
  }
  if (*((_BYTE *)__p + 152))
  {
    v6 = (void *)__p[13];
    if (v6)
      operator delete[](v6);
  }
  if (*((_BYTE *)__p + 96))
  {
    v7 = (void *)__p[6];
    if (v7)
      operator delete[](v7);
  }
  operator delete(__p);
}

void sub_23CCB1C4C()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, (struct type_info *)&unk_250DE4008, MEMORY[0x24BEDABA8]);
}

void sub_23CCB1C80()
{
  sub_23CCAD198("vector");
}

void *sub_23CCB1C94(unint64_t a1)
{
  if (a1 >> 61)
    sub_23CCB1CC8();
  return operator new(8 * a1);
}

void sub_23CCB1CC8()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, (struct type_info *)&unk_250DE4108, MEMORY[0x24BEDABB8]);
}

void sub_23CCB1CF0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v5 = v3[2];
        v3[2] = 0;
        if (v5)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 32))(v5);
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
}

char *sub_23CCB1D6C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_23CCB1C80();
  result = (char *)sub_23CCB1C94(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

unint64_t sub_23CCB1DA8(unint64_t result, uint64_t *a2, uint64_t **a3, uint64_t a4, char a5)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *i;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t *j;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  uint64_t *v86;
  int64_t v87;
  int64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int *v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;

  v9 = (uint64_t *)result;
LABEL_2:
  v10 = a2 - 1;
  i = v9;
  while (2)
  {
    v9 = i;
    v12 = (char *)a2 - (char *)i;
    v13 = a2 - i;
    switch(v13)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v51 = *i;
        v52 = **a3;
        v53 = v52 + 8 * *i;
        if (*(_BYTE *)(v53 + 4))
        {
          v54 = *(a2 - 1);
          v55 = v52 + 8 * v54;
          if (!*(_BYTE *)(v55 + 4) || *(_DWORD *)v55 < *(_DWORD *)v53)
          {
            *i = v54;
            *(a2 - 1) = v51;
          }
        }
        return result;
      case 3:
        return (unint64_t)sub_23CCB286C(i, i + 1, a2 - 1, **a3);
      case 4:
        return (unint64_t)sub_23CCB2C50(i, i + 1, i + 2, a2 - 1, a3);
      case 5:
        v56 = i + 1;
        v57 = i + 2;
        v58 = i + 3;
        result = (unint64_t)sub_23CCB2C50(i, i + 1, i + 2, i + 3, a3);
        v59 = i[3];
        v60 = **a3;
        v61 = v60 + 8 * v59;
        if (!*(_BYTE *)(v61 + 4))
          return result;
        v62 = *(a2 - 1);
        v63 = v60 + 8 * v62;
        if (*(_BYTE *)(v63 + 4))
        {
          if (*(_DWORD *)v63 >= *(_DWORD *)v61)
            return result;
        }
        *v58 = v62;
        *(a2 - 1) = v59;
        v64 = *v57;
        v65 = v60 + 8 * *v57;
        if (!*(_BYTE *)(v65 + 4))
          return result;
        v66 = *v58;
        v67 = v60 + 8 * *v58;
        if (*(_BYTE *)(v67 + 4))
        {
          v68 = *(_DWORD *)v67;
          if (v68 >= *(_DWORD *)v65)
            return result;
          *v57 = v66;
          *v58 = v64;
          v69 = *v56;
          v70 = v60 + 8 * *v56;
          if (!*(_BYTE *)(v70 + 4))
            return result;
          if (v68 >= *(_DWORD *)v70)
            return result;
          i[1] = v66;
          i[2] = v69;
          v71 = *i;
          v72 = v60 + 8 * *i;
          if (!*(_BYTE *)(v72 + 4) || v68 >= *(_DWORD *)v72)
            return result;
LABEL_194:
          *i = v66;
          i[1] = v71;
          return result;
        }
        *v57 = v66;
        *v58 = v64;
        v133 = *v56;
        if (*(_BYTE *)(v60 + 8 * *v56 + 4))
        {
          i[1] = v66;
          i[2] = v133;
          v71 = *i;
          if (*(_BYTE *)(v60 + 8 * *i + 4))
            goto LABEL_194;
        }
        return result;
      default:
        if (v12 > 191)
        {
          if (!a4)
          {
            if (i == a2)
              return result;
            v85 = (unint64_t)(v13 - 2) >> 1;
            v86 = *a3;
            v87 = v85;
            do
            {
              v88 = v87;
              if (v85 >= v87)
              {
                v89 = (2 * v87) | 1;
                v90 = &i[v89];
                v91 = *v86;
                if (2 * v88 + 2 < v13)
                {
                  v92 = v91 + 8 * v90[1];
                  if (*(_BYTE *)(v92 + 4))
                  {
                    v93 = v91 + 8 * *v90;
                    if (!*(_BYTE *)(v93 + 4) || *(_DWORD *)v93 < *(_DWORD *)v92)
                    {
                      ++v90;
                      v89 = 2 * v88 + 2;
                    }
                  }
                }
                v94 = *v90;
                v95 = i[v88];
                v96 = v91 + 8 * v95;
                result = *(unsigned __int8 *)(v96 + 4);
                if (!*(_BYTE *)(v96 + 4)
                  || (v97 = v91 + 8 * v94, *(_BYTE *)(v97 + 4)) && *(_DWORD *)v97 >= *(_DWORD *)v96)
                {
                  i[v88] = v94;
                  if (v85 >= v89)
                  {
                    while (1)
                    {
                      v99 = 2 * v89;
                      v89 = (2 * v89) | 1;
                      v98 = &i[v89];
                      v100 = v99 + 2;
                      if (v100 < v13)
                      {
                        v101 = v91 + 8 * v98[1];
                        if (*(_BYTE *)(v101 + 4))
                        {
                          v102 = v91 + 8 * *v98;
                          if (!*(_BYTE *)(v102 + 4) || *(_DWORD *)v102 < *(_DWORD *)v101)
                          {
                            ++v98;
                            v89 = v100;
                          }
                        }
                      }
                      v103 = *v98;
                      if ((_DWORD)result)
                      {
                        v104 = v91 + 8 * v103;
                        if (!*(_BYTE *)(v104 + 4) || *(_DWORD *)v104 < *(_DWORD *)v96)
                          break;
                      }
                      *v90 = v103;
                      v90 = v98;
                      if (v85 < v89)
                        goto LABEL_154;
                    }
                  }
                  v98 = v90;
LABEL_154:
                  *v98 = v95;
                }
              }
              v87 = v88 - 1;
            }
            while (v88);
            v105 = (unint64_t)v12 >> 3;
            while (1)
            {
              v106 = 0;
              v107 = *i;
              v108 = *a3;
              v109 = i;
              do
              {
                v110 = v109;
                v109 += v106 + 1;
                v111 = 2 * v106;
                v106 = (2 * v106) | 1;
                v112 = v111 + 2;
                if (v112 < v105)
                {
                  result = *v108;
                  v113 = *v108 + 8 * v109[1];
                  if (*(_BYTE *)(v113 + 4))
                  {
                    result += 8 * *v109;
                    if (!*(_BYTE *)(result + 4)
                      || (result = *(unsigned int *)result, result < *(_DWORD *)v113))
                    {
                      ++v109;
                      v106 = v112;
                    }
                  }
                }
                *v110 = *v109;
              }
              while (v106 <= (uint64_t)((unint64_t)(v105 - 2) >> 1));
              if (v109 != --a2)
              {
                *v109 = *a2;
                *a2 = v107;
                v114 = (char *)v109 - (char *)i + 8;
                if (v114 < 9)
                  goto LABEL_175;
                v107 = *v109;
                v115 = *v108;
                v116 = (unsigned int *)(v115 + 8 * *v109);
                if (!*((_BYTE *)v116 + 4))
                  goto LABEL_175;
                v117 = ((unint64_t)v114 >> 3) - 2;
                v118 = v117 >> 1;
                v119 = &i[v117 >> 1];
                v120 = v115 + 8 * *v119;
                result = *(unsigned __int8 *)(v120 + 4);
                if (*(_BYTE *)(v120 + 4))
                {
                  result = *v116;
                  if (*(_DWORD *)v120 >= result)
                    goto LABEL_175;
                }
                *v109 = *v119;
                if (v117 >= 2)
                {
                  while (1)
                  {
                    v121 = v118 - 1;
                    v118 = (v118 - 1) >> 1;
                    v109 = &i[v118];
                    v122 = v115 + 8 * *v109;
                    result = *(unsigned __int8 *)(v122 + 4);
                    if (*(_BYTE *)(v122 + 4))
                    {
                      result = *v116;
                      if (*(_DWORD *)v122 >= result)
                        break;
                    }
                    *v119 = *v109;
                    v119 = &i[v118];
                    if (v121 <= 1)
                      goto LABEL_174;
                  }
                }
                v109 = v119;
              }
LABEL_174:
              *v109 = v107;
LABEL_175:
              if (v105-- <= 2)
                return result;
            }
          }
          v14 = (unint64_t)v13 >> 1;
          v15 = &i[(unint64_t)v13 >> 1];
          v16 = **a3;
          if ((unint64_t)v12 < 0x401)
          {
            result = (unint64_t)sub_23CCB286C(v15, v9, a2 - 1, v16);
          }
          else
          {
            sub_23CCB286C(v9, v15, a2 - 1, v16);
            sub_23CCB286C(v9 + 1, v15 - 1, a2 - 2, **a3);
            sub_23CCB286C(v9 + 2, &v9[v14 + 1], a2 - 3, **a3);
            result = (unint64_t)sub_23CCB286C(v15 - 1, v15, &v9[v14 + 1], **a3);
            v17 = *v9;
            *v9 = *v15;
            *v15 = v17;
          }
          --a4;
          v18 = *v9;
          v19 = **a3;
          v20 = v19 + 8 * *v9;
          if ((a5 & 1) == 0)
          {
            v23 = *(unsigned __int8 *)(v20 + 4);
            if (!*(_BYTE *)(v20 + 4))
            {
              v39 = v19 + 8 * *v10;
              if (*(_BYTE *)(v39 + 4))
                goto LABEL_56;
LABEL_85:
              v41 = 1;
              goto LABEL_87;
            }
            v24 = v19 + 8 * *(v9 - 1);
            if (!*(_BYTE *)(v24 + 4) || *(_DWORD *)v24 < *(_DWORD *)v20)
            {
              v21 = v9 + 1;
              goto LABEL_16;
            }
            v39 = v19 + 8 * *v10;
            if (!*(_BYTE *)(v39 + 4))
              goto LABEL_85;
            if (*(_DWORD *)v20 < *(_DWORD *)v39)
            {
LABEL_56:
              for (i = v9 + 1; ; ++i)
              {
                v40 = v19 + 8 * *i;
                if (*(_BYTE *)(v40 + 4))
                {
                  if (!*(_BYTE *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v40)
                    break;
                }
              }
              v41 = 0;
              goto LABEL_62;
            }
            v41 = 0;
LABEL_87:
            for (i = v9 + 1; i < a2; ++i)
            {
              v50 = v19 + 8 * *i;
              if (*(_BYTE *)(v50 + 4))
              {
                if (!*(_BYTE *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v50)
                  break;
              }
            }
LABEL_62:
            if (i < a2)
              v42 = a2 - 1;
            else
              v42 = a2;
            if ((v41 & 1) == 0 && i < a2)
            {
              v42 = a2 - 1;
              do
              {
                if (*(_BYTE *)(v20 + 4) && *(_DWORD *)v20 >= *(_DWORD *)v39)
                  break;
                v43 = *--v42;
                v39 = v19 + 8 * v43;
              }
              while (*(_BYTE *)(v39 + 4));
            }
            if (i < v42)
            {
              v44 = *i;
              v45 = *v42;
              do
              {
                *i++ = v45;
                *v42 = v44;
                while (1)
                {
                  v44 = *i;
                  v46 = v19 + 8 * *i;
                  if (*(_BYTE *)(v46 + 4))
                  {
                    if (!v23 || *(_DWORD *)v20 < *(_DWORD *)v46)
                      break;
                  }
                  ++i;
                }
                do
                {
                  v47 = *--v42;
                  v45 = v47;
                  v48 = v19 + 8 * v47;
                }
                while (*(_BYTE *)(v48 + 4) && (!v23 || *(_DWORD *)v20 < *(_DWORD *)v48));
              }
              while (i < v42);
            }
            v49 = i - 1;
            if (i - 1 != v9)
              *v9 = *v49;
            a5 = 0;
            *v49 = v18;
            continue;
          }
          v21 = v9 + 1;
          if (!*(_BYTE *)(v20 + 4))
          {
            v22 = 1;
            goto LABEL_25;
          }
LABEL_16:
          for (j = v9; ; j = v21++)
          {
            v26 = v19 + 8 * j[1];
            if (*(_BYTE *)(v26 + 4))
            {
              if (*(_DWORD *)v26 >= *(_DWORD *)v20)
                break;
            }
          }
          v27 = a2 - 1;
          if (j == v9)
          {
            v22 = 0;
LABEL_25:
            if (v21 >= a2)
            {
              v28 = a2;
              goto LABEL_35;
            }
            v28 = a2 - 1;
            if ((v22 & 1) != 0)
            {
LABEL_27:
              if (v21 >= v28)
                goto LABEL_35;
              goto LABEL_32;
            }
            while (1)
            {
              v31 = v19 + 8 * *v28;
              if (!*(_BYTE *)(v31 + 4) || v21 >= v28 || *(_DWORD *)v31 < *(_DWORD *)v20)
                break;
LABEL_32:
              --v28;
              if ((v22 & 1) != 0)
                goto LABEL_27;
            }
          }
          else
          {
            do
            {
              v28 = v27;
              v29 = v19 + 8 * *v27;
              if (!*(_BYTE *)(v29 + 4))
                break;
              v30 = *(_DWORD *)v29;
              v27 = v28 - 1;
            }
            while (v30 >= *(_DWORD *)v20);
            v22 = 0;
          }
LABEL_35:
          i = v21;
          if (v21 < v28)
          {
            v32 = *v28;
            i = v21;
            v33 = v28;
            do
            {
              v34 = *i;
              *i++ = v32;
              *v33 = v34;
              if ((v22 & 1) == 0)
              {
                while (1)
                {
                  v36 = v19 + 8 * *i;
                  if (*(_BYTE *)(v36 + 4))
                  {
                    if (*(_DWORD *)v36 >= *(_DWORD *)v20)
                      break;
                  }
                  ++i;
                }
              }
              do
              {
                do
                  --v33;
                while ((v22 & 1) != 0);
                v32 = *v33;
                v35 = v19 + 8 * *v33;
              }
              while (*(_BYTE *)(v35 + 4) && *(_DWORD *)v35 >= *(_DWORD *)v20);
            }
            while (i < v33);
          }
          v37 = i - 1;
          if (i - 1 != v9)
            *v9 = *v37;
          *v37 = v18;
          if (v21 < v28)
            goto LABEL_51;
          v38 = sub_23CCB295C(v9, i - 1, a3);
          result = sub_23CCB295C(i, a2, a3);
          if (!(_DWORD)result)
          {
            if (v38)
              continue;
LABEL_51:
            result = sub_23CCB1DA8(v9, i - 1, a3, a4, a5 & 1);
            a5 = 0;
            continue;
          }
          a2 = i - 1;
          if (v38)
            return result;
          goto LABEL_2;
        }
        if ((a5 & 1) != 0)
        {
          if (i != a2)
          {
            v73 = i + 1;
            if (i + 1 != a2)
            {
              v74 = 0;
              v75 = **a3;
              v76 = i;
              do
              {
                v77 = v76;
                v76 = v73;
                v78 = v75 + 8 * *v77;
                if (*(_BYTE *)(v78 + 4))
                {
                  v79 = v77[1];
                  v80 = v75 + 8 * v79;
                  v81 = *(unsigned __int8 *)(v80 + 4);
                  if (!*(_BYTE *)(v80 + 4) || *(_DWORD *)v80 < *(_DWORD *)v78)
                  {
                    v77[1] = *v77;
                    v82 = i;
                    if (v77 != i)
                    {
                      v83 = v74;
                      while (1)
                      {
                        v84 = *(uint64_t *)((char *)i + v83 - 8);
                        result = v75 + 8 * v84;
                        if (!*(_BYTE *)(result + 4))
                        {
                          v82 = v77;
                          goto LABEL_129;
                        }
                        if (v81)
                        {
                          result = *(unsigned int *)result;
                          if (*(_DWORD *)v80 >= result)
                            break;
                        }
                        --v77;
                        *(uint64_t *)((char *)i + v83) = v84;
                        v83 -= 8;
                        if (!v83)
                        {
                          v82 = i;
                          goto LABEL_129;
                        }
                      }
                      v82 = (uint64_t *)((char *)i + v83);
                    }
LABEL_129:
                    *v82 = v79;
                  }
                }
                v73 = v76 + 1;
                v74 += 8;
              }
              while (v76 + 1 != a2);
            }
          }
        }
        else if (i != a2)
        {
          v124 = i + 1;
          if (i + 1 != a2)
          {
            v125 = **a3;
            do
            {
              v126 = v125 + 8 * *v9;
              if (*(_BYTE *)(v126 + 4))
              {
                v127 = *v124;
                v128 = v125 + 8 * *v124;
                v129 = *(unsigned __int8 *)(v128 + 4);
                if (!*(_BYTE *)(v128 + 4) || *(_DWORD *)v128 < *(_DWORD *)v126)
                {
                  *v124 = *v9;
                  v130 = *(v9 - 1);
                  v131 = v125 + 8 * v130;
                  v132 = v9;
                  if (*(_BYTE *)(v131 + 4))
                  {
                    v132 = v9;
                    do
                    {
                      if (v129 && *(_DWORD *)v128 >= *(_DWORD *)v131)
                        break;
                      *v132 = v130;
                      v130 = *(v132 - 2);
                      v131 = v125 + 8 * v130;
                      --v132;
                    }
                    while (*(_BYTE *)(v131 + 4));
                  }
                  *v132 = v127;
                }
              }
              ++v124;
              ++v9;
            }
            while (v124 != a2);
          }
        }
        return result;
    }
  }
}

uint64_t *sub_23CCB286C(uint64_t *result, uint64_t *a2, uint64_t *a3, uint64_t a4)
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

  v4 = *a2;
  v5 = *result;
  v6 = a4 + 8 * *a2;
  v7 = a4 + 8 * *result;
  if (!*(_BYTE *)(v7 + 4))
  {
    if (!*(_BYTE *)(v6 + 4))
      return result;
    v8 = *a3;
    v9 = a4 + 8 * *a3;
    goto LABEL_9;
  }
  if (*(_BYTE *)(v6 + 4))
  {
    v8 = *a3;
    v9 = a4 + 8 * *a3;
    if (*(_DWORD *)v6 < *(_DWORD *)v7)
    {
      if (!*(_BYTE *)(v9 + 4) || *(_DWORD *)v9 < *(_DWORD *)v6)
      {
        *result = v8;
LABEL_18:
        *a3 = v5;
        return result;
      }
      goto LABEL_15;
    }
LABEL_9:
    if (!*(_BYTE *)(v9 + 4) || *(_DWORD *)v9 < *(_DWORD *)v6)
    {
      *a2 = v8;
      *a3 = v4;
      v10 = *result;
      v11 = a4 + 8 * *result;
      if (*(_BYTE *)(v11 + 4))
      {
        v12 = a4 + 8 * *a2;
        if (!*(_BYTE *)(v12 + 4) || *(_DWORD *)v12 < *(_DWORD *)v11)
        {
          *result = *a2;
          *a2 = v10;
        }
      }
    }
    return result;
  }
LABEL_15:
  *result = v4;
  *a2 = v5;
  v13 = a4 + 8 * *a3;
  if (!*(_BYTE *)(v13 + 4) || *(_DWORD *)v13 < *(_DWORD *)v7)
  {
    *a2 = *a3;
    goto LABEL_18;
  }
  return result;
}

BOOL sub_23CCB295C(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a1;
      v9 = **a3;
      v10 = v9 + 8 * *a1;
      if (*(_BYTE *)(v10 + 4))
      {
        v11 = *(a2 - 1);
        v12 = v9 + 8 * v11;
        if (!*(_BYTE *)(v12 + 4) || *(_DWORD *)v12 < *(_DWORD *)v10)
        {
          *a1 = v11;
          *(a2 - 1) = v8;
        }
      }
      return result;
    case 3:
      sub_23CCB286C(a1, a1 + 1, a2 - 1, **a3);
      return 1;
    case 4:
      sub_23CCB2C50(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      v27 = a1 + 1;
      v28 = a1 + 2;
      v29 = a1 + 3;
      sub_23CCB2C50(a1, a1 + 1, a1 + 2, a1 + 3, a3);
      v30 = a1[3];
      v31 = **a3;
      v32 = v31 + 8 * v30;
      if (!*(_BYTE *)(v32 + 4))
        return 1;
      v33 = *(a2 - 1);
      v34 = v31 + 8 * v33;
      if (*(_BYTE *)(v34 + 4))
      {
        if (*(_DWORD *)v34 >= *(_DWORD *)v32)
          return 1;
      }
      *v29 = v33;
      *(a2 - 1) = v30;
      v35 = *v28;
      v36 = v31 + 8 * *v28;
      if (!*(_BYTE *)(v36 + 4))
        return 1;
      v37 = *v29;
      v38 = v31 + 8 * *v29;
      if (!*(_BYTE *)(v38 + 4))
      {
        *v28 = v37;
        *v29 = v35;
        v44 = *v27;
        if (!*(_BYTE *)(v31 + 8 * *v27 + 4))
          return 1;
        a1[1] = v37;
        a1[2] = v44;
        v42 = *a1;
        if (!*(_BYTE *)(v31 + 8 * *a1 + 4))
          return 1;
LABEL_39:
        *a1 = v37;
        a1[1] = v42;
        return 1;
      }
      v39 = *(_DWORD *)v38;
      if (v39 < *(_DWORD *)v36)
      {
        *v28 = v37;
        *v29 = v35;
        v40 = *v27;
        v41 = v31 + 8 * *v27;
        if (*(_BYTE *)(v41 + 4))
        {
          if (v39 < *(_DWORD *)v41)
          {
            a1[1] = v37;
            a1[2] = v40;
            v42 = *a1;
            v43 = v31 + 8 * *a1;
            if (*(_BYTE *)(v43 + 4))
            {
              if (v39 < *(_DWORD *)v43)
                goto LABEL_39;
            }
          }
        }
      }
      return 1;
    default:
      v13 = a1 + 2;
      sub_23CCB286C(a1, a1 + 1, a1 + 2, **a3);
      v14 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v15 = 0;
      v16 = 0;
      v17 = **a3;
      while (1)
      {
        v18 = v17 + 8 * *v13;
        if (*(_BYTE *)(v18 + 4))
        {
          v19 = *v14;
          v20 = v17 + 8 * *v14;
          v21 = *(unsigned __int8 *)(v20 + 4);
          if (!*(_BYTE *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v18)
          {
            *v14 = *v13;
            v22 = a1;
            if (v13 != a1)
            {
              v23 = v15;
              while (1)
              {
                v24 = (char *)a1 + v23;
                v25 = *(uint64_t *)((char *)a1 + v23 + 8);
                v26 = v17 + 8 * v25;
                if (!*(_BYTE *)(v26 + 4))
                {
                  v22 = (uint64_t *)(v24 + 16);
                  goto LABEL_20;
                }
                if (v21 && *(_DWORD *)v20 >= *(_DWORD *)v26)
                  break;
                --v13;
                *((_QWORD *)v24 + 2) = v25;
                v23 -= 8;
                if (v23 == -16)
                {
                  v22 = a1;
                  goto LABEL_20;
                }
              }
              v22 = v13;
            }
LABEL_20:
            *v22 = v19;
            if (++v16 == 8)
              return v14 + 1 == a2;
          }
        }
        v13 = v14;
        v15 += 8;
        if (++v14 == a2)
          return 1;
      }
  }
}

uint64_t *sub_23CCB2C50(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  uint64_t *result;
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

  result = sub_23CCB286C(a1, a2, a3, **a5);
  v11 = *a3;
  v12 = **a5;
  v13 = v12 + 8 * *a3;
  if (*(_BYTE *)(v13 + 4))
  {
    v14 = v12 + 8 * *a4;
    if (!*(_BYTE *)(v14 + 4) || *(_DWORD *)v14 < *(_DWORD *)v13)
    {
      *a3 = *a4;
      *a4 = v11;
      v15 = *a2;
      v16 = v12 + 8 * *a2;
      if (*(_BYTE *)(v16 + 4))
      {
        v17 = v12 + 8 * *a3;
        if (!*(_BYTE *)(v17 + 4) || *(_DWORD *)v17 < *(_DWORD *)v16)
        {
          *a2 = *a3;
          *a3 = v15;
          v18 = *a1;
          v19 = v12 + 8 * *a1;
          if (*(_BYTE *)(v19 + 4))
          {
            v20 = v12 + 8 * *a2;
            if (!*(_BYTE *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v19)
            {
              *a1 = *a2;
              *a2 = v18;
            }
          }
        }
      }
    }
  }
  return result;
}

void *sub_23CCB2D48(unint64_t a1)
{
  if (a1 >> 62)
    sub_23CCB1CC8();
  return operator new(4 * a1);
}

_QWORD *sub_23CCB2D7C(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  _QWORD *v7;
  uint64_t v8;
  size_t v9;

  if (a4)
  {
    v4 = result;
    if (a4 >> 62)
      sub_23CCB1C80();
    result = sub_23CCB2D48(a4);
    v7 = result;
    *v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    v9 = a3 - (_QWORD)a2;
    if (v9)
      result = memmove(result, a2, v9);
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_23CCB2DF4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_23CCB2E10(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *a1 = &off_250DE4030;
  v2 = (void *)a1[14];
  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[11];
  if (v3)
  {
    a1[12] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[8];
  if (v4)
  {
    a1[9] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[5];
  if (v5)
  {
    a1[6] = v5;
    operator delete(v5);
  }
  v6 = (void *)a1[2];
  if (v6)
  {
    a1[3] = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_23CCB2E8C(_QWORD *__p)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *__p = &off_250DE4030;
  v2 = (void *)__p[14];
  if (v2)
  {
    __p[15] = v2;
    operator delete(v2);
  }
  v3 = (void *)__p[11];
  if (v3)
  {
    __p[12] = v3;
    operator delete(v3);
  }
  v4 = (void *)__p[8];
  if (v4)
  {
    __p[9] = v4;
    operator delete(v4);
  }
  v5 = (void *)__p[5];
  if (v5)
  {
    __p[6] = v5;
    operator delete(v5);
  }
  v6 = (void *)__p[2];
  if (v6)
  {
    __p[3] = v6;
    operator delete(v6);
  }
  operator delete(__p);
}

_QWORD *sub_23CCB2F08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x88uLL);
  *v2 = &off_250DE4030;
  sub_23CCB3318(v2 + 1, v1);
  return v2;
}

void sub_23CCB2F48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23CCB2F5C(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250DE4030;
  return sub_23CCB3318(a2 + 1, a1 + 8);
}

void sub_23CCB2F78(uint64_t a1)
{
  sub_23CCB3500((_QWORD *)(a1 + 8));
}

void sub_23CCB2F80(_QWORD *a1)
{
  sub_23CCB3500(a1 + 1);
  operator delete(a1);
}

char *sub_23CCB2FA8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *result;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  BOOL v24;
  unsigned int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t i;

  *(_QWORD *)(a2 + 160) = 0;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v4 = (uint64_t *)a1[2];
  v5 = (uint64_t *)a1[3];
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = (uint64_t *)a1[2];
    do
    {
      v8 = *v7++;
      v6 += *(_QWORD *)(v8 + 24) * *(_QWORD *)(v8 + 32);
    }
    while (v7 != v5);
  }
  *(_DWORD *)(a2 + 16) = 4;
  *(_QWORD *)(a2 + 24) = v6;
  *(int64x2_t *)(a2 + 32) = vdupq_n_s64(1uLL);
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = (char *)operator new[](4 * v6);
  v10 = result;
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 48) = 1;
  if (v4 != v5)
  {
    if ((unint64_t)(v5 - v4) <= 1)
      v11 = 1;
    else
      v11 = v5 - v4;
    do
    {
      v12 = *(_QWORD *)(*v4 + 24) * *(_QWORD *)(*v4 + 32);
      if (v12)
        result = (char *)memmove(v10, (const void *)(*(_QWORD *)*v4 + 4 * *(_QWORD *)(*v4 + 8)), 4 * v12);
      v10 += 4 * v12;
      ++v4;
      --v11;
    }
    while (v11);
  }
  v13 = a1[1];
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_DWORD *)(a2 + 72) = 4;
  *(_QWORD *)(a2 + 80) = v13;
  *(int64x2_t *)(a2 + 88) = vdupq_n_s64(1uLL);
  *(_BYTE *)(a2 + 104) = 0;
  v15 = (unsigned int *)a1[14];
  v14 = (unsigned int *)a1[15];
  if (v15 == v14 || (v16 = v15 + 1, v15 + 1 == v14))
  {
    v19 = (unsigned int *)a1[14];
    v16 = v19;
LABEL_44:
    v25 = *v19;
    goto LABEL_45;
  }
  v18 = *v15;
  v17 = v15[1];
  if (v17 >= *v15)
    v19 = (unsigned int *)a1[14];
  else
    v19 = v15 + 1;
  if (v17 < v18)
    v16 = (unsigned int *)a1[14];
  v20 = v15 + 2;
  if (v20 == v14)
    goto LABEL_44;
  if (v17 <= v18)
    v21 = v18;
  else
    v21 = v17;
  if (v17 >= v18)
    v17 = v18;
  while (v20 + 1 != v14)
  {
    v23 = *v20;
    v22 = v20[1];
    if (v22 >= *v20)
    {
      if (v23 < v17)
      {
        v17 = *v20;
        v19 = v20;
      }
      v24 = v22 >= v21;
      if (v22 > v21)
        v21 = v20[1];
      if (v24)
        v16 = v20 + 1;
    }
    else
    {
      v17 = *v19;
      if (v22 < *v19)
      {
        v17 = v20[1];
        v19 = v20 + 1;
      }
      v21 = *v16;
      if (v23 > *v16)
        v21 = *v20;
      if (v23 >= *v16)
        v16 = v20;
    }
    v20 += 2;
    if (v20 == v14)
      goto LABEL_44;
  }
  v25 = *v20;
  if (*v20 >= *v19)
  {
    if (v25 >= *v16)
      v16 = v20;
    goto LABEL_44;
  }
LABEL_45:
  if (v25 > 3 || *v16 >= 4)
  {
    *(_QWORD *)(a2 + 64) = 0;
    result = (char *)operator new[](4 * v13);
    v26 = result;
    *(_QWORD *)(a2 + 56) = result;
    *(_BYTE *)(a2 + 104) = 1;
    v28 = a1[5];
    v27 = a1[6];
    if (v27 != v28)
    {
      v29 = 0;
      do
      {
        v30 = *(_QWORD **)(v28 + 8 * v29);
        if (v30)
        {
          v31 = v30[3];
          if (v31)
          {
            result = (char *)memmove(v26, (const void *)(*v30 + 4 * v30[1]), 4 * v31);
            v28 = a1[5];
            v27 = a1[6];
          }
          v26 += 4 * v31;
        }
        else
        {
          v32 = *(_QWORD *)(a1[11] + 8 * v29);
          if (v32)
          {
            v33 = a1[14];
            do
            {
              *(_DWORD *)v26 = *(_DWORD *)(v33 + 4 * v29);
              v26 += 4;
              --v32;
            }
            while (v32);
          }
        }
        ++v29;
      }
      while (v29 < (v27 - v28) >> 3);
    }
  }
  if (a1[9] - a1[8] >= 5uLL)
  {
    v34 = a1[1];
    if (*(_BYTE *)(a2 + 160))
    {
      v35 = *(void **)(a2 + 112);
      if (v35)
        operator delete[](v35);
    }
    *(_DWORD *)(a2 + 128) = 260;
    *(_QWORD *)(a2 + 136) = v34;
    *(int64x2_t *)(a2 + 144) = vdupq_n_s64(1uLL);
    *(_BYTE *)(a2 + 160) = 0;
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 120) = 0;
    result = (char *)operator new[](4 * v34);
    *(_QWORD *)(a2 + 112) = result;
    *(_BYTE *)(a2 + 160) = 1;
    v36 = a1[8];
    v37 = a1[9];
    v38 = v37 - v36;
    if (v37 != v36)
    {
      v39 = 0;
      v40 = v38 >> 2;
      v41 = a1[11];
      if (v40 <= 1)
        v40 = 1;
      do
      {
        for (i = *(_QWORD *)(v41 + 8 * v39); i; --i)
        {
          *(_DWORD *)result = *(_DWORD *)(v36 + 4 * v39);
          result += 4;
        }
        ++v39;
      }
      while (v39 != v40);
    }
  }
  return result;
}

void sub_23CCB32E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(_BYTE *)(v1 + 104) && *v2)
    operator delete[](*v2);
  if (*(_BYTE *)(v1 + 48))
  {
    if (*(_QWORD *)v1)
      operator delete[](*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_23CCB3318(_QWORD *a1, uint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  int64_t v6;
  char *v7;

  *a1 = *(_QWORD *)a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  sub_23CCB3488(a1 + 1, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
  a1[4] = 0;
  a1[5] = 0;
  a1[6] = 0;
  sub_23CCB3488(a1 + 4, *(const void **)(a2 + 32), *(_QWORD *)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 3);
  a1[7] = 0;
  a1[8] = 0;
  a1[9] = 0;
  sub_23CCB2D7C(a1 + 7, *(const void **)(a2 + 56), *(_QWORD *)(a2 + 64), (uint64_t)(*(_QWORD *)(a2 + 64) - *(_QWORD *)(a2 + 56)) >> 2);
  a1[10] = 0;
  a1[11] = 0;
  a1[12] = 0;
  v5 = *(_BYTE **)(a2 + 80);
  v4 = *(_BYTE **)(a2 + 88);
  v6 = v4 - v5;
  if (v4 != v5)
  {
    sub_23CCB1D6C(a1 + 10, v6 >> 3);
    v7 = (char *)a1[11];
    memmove(v7, v5, v6);
    a1[11] = &v7[8 * (v6 >> 3)];
  }
  a1[13] = 0;
  a1[14] = 0;
  a1[15] = 0;
  sub_23CCB2D7C(a1 + 13, *(const void **)(a2 + 104), *(_QWORD *)(a2 + 112), (uint64_t)(*(_QWORD *)(a2 + 112) - *(_QWORD *)(a2 + 104)) >> 2);
  return a1;
}

void sub_23CCB3428(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = *v5;
  if (*v5)
  {
    v1[11] = v7;
    operator delete(v7);
  }
  v8 = *v4;
  if (*v4)
  {
    v1[8] = v8;
    operator delete(v8);
  }
  v9 = *v3;
  if (*v3)
  {
    v1[5] = v9;
    operator delete(v9);
  }
  v10 = *v2;
  if (*v2)
  {
    v1[2] = v10;
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_23CCB3488(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_23CCB1D6C(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23CCB34E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_23CCB3500(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)a1[13];
  if (v2)
  {
    a1[14] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[10];
  if (v3)
  {
    a1[11] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[7];
  if (v4)
  {
    a1[8] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[4];
  if (v5)
  {
    a1[5] = v5;
    operator delete(v5);
  }
  v6 = (void *)a1[1];
  if (v6)
  {
    a1[2] = v6;
    operator delete(v6);
  }
}

_QWORD *sub_23CCB3574(_QWORD *a1)
{
  void *v2;

  *a1 = &off_250DE4078;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_23CCB35B0(_QWORD *__p)
{
  void *v2;

  *__p = &off_250DE4078;
  v2 = (void *)__p[1];
  if (v2)
  {
    __p[2] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

_QWORD *sub_23CCB35EC(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x20uLL);
  *v2 = &off_250DE4078;
  v2[2] = 0;
  v2[3] = 0;
  v2[1] = 0;
  sub_23CCB3488(v2 + 1, *(const void **)(a1 + 8), *(_QWORD *)(a1 + 16), (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3);
  return v2;
}

void sub_23CCB363C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23CCB3650(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250DE4078;
  a2[2] = 0;
  a2[3] = 0;
  a2[1] = 0;
  return sub_23CCB3488(a2 + 1, *(const void **)(a1 + 8), *(_QWORD *)(a1 + 16), (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3);
}

void sub_23CCB367C(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_23CCB3694(_QWORD *__p)
{
  void *v2;

  v2 = (void *)__p[1];
  if (v2)
  {
    __p[2] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

char *sub_23CCB36C4@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v2 = (uint64_t *)*((_QWORD *)result + 1);
  v3 = (uint64_t *)*((_QWORD *)result + 2);
  if (v2 != v3)
  {
    v5 = 0;
    v6 = (uint64_t *)*((_QWORD *)result + 1);
    do
    {
      v7 = *v6++;
      v5 += *(_QWORD *)(v7 + 24) * *(_QWORD *)(v7 + 32);
    }
    while (v6 != v3);
    *(_DWORD *)(a2 + 16) = 4;
    *(_QWORD *)(a2 + 24) = v5;
    *(int64x2_t *)(a2 + 32) = vdupq_n_s64(1uLL);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    result = (char *)operator new[](4 * v5);
    v8 = result;
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 48) = 1;
    if ((unint64_t)(v3 - v2) <= 1)
      v9 = 1;
    else
      v9 = v3 - v2;
    do
    {
      v10 = *(_QWORD *)(*v2 + 24) * *(_QWORD *)(*v2 + 32);
      if (v10)
        result = (char *)memmove(v8, (const void *)(*(_QWORD *)*v2 + 4 * *(_QWORD *)(*v2 + 8)), 4 * v10);
      v8 += 4 * v10;
      ++v2;
      --v9;
    }
    while (v9);
  }
  return result;
}

_QWORD *sub_23CCB379C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (_QWORD *)a1[3];
  a1[3] = 0;
  if (v4 == a1)
  {
    v5 = 4;
    v4 = a1;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v6 = *(_QWORD *)(a2 + 24);
  if (v6)
  {
    if (v6 == a2)
    {
      a1[3] = a1;
      (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      a1[3] = v6;
      *(_QWORD *)(a2 + 24) = 0;
    }
  }
  else
  {
    a1[3] = 0;
  }
  return a1;
}

void sub_23CCB382C()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = &unk_250DE40D8;
  __cxa_throw(exception, (struct type_info *)&unk_250DE40B0, (void (*)(void *))std::exception::~exception);
}

void sub_23CCB3864(std::exception *a1)
{
  void *v1;

  std::exception::~exception(a1);
  operator delete(v1);
}

void sub_23CCB3878(_QWORD *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (char *)(__p + 33);
  v3 = (char *)__p[36];
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
  if (*((_BYTE *)__p + 256))
  {
    v5 = (void *)__p[26];
    if (v5)
      operator delete[](v5);
  }
  if (*((_BYTE *)__p + 200))
  {
    v6 = (void *)__p[19];
    if (v6)
      operator delete[](v6);
  }
  if (*((_BYTE *)__p + 144))
  {
    v7 = (void *)__p[12];
    if (v7)
      operator delete[](v7);
  }
  if (*((_BYTE *)__p + 88))
  {
    v8 = (void *)__p[5];
    if (v8)
      operator delete[](v8);
  }
  operator delete(__p);
}

void sub_23CCB3918(_QWORD *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (char *)(__p + 27);
  v3 = (char *)__p[30];
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
  if (*((_BYTE *)__p + 208))
  {
    v5 = (void *)__p[20];
    if (v5)
      operator delete[](v5);
  }
  if (*((_BYTE *)__p + 152))
  {
    v6 = (void *)__p[13];
    if (v6)
      operator delete[](v6);
  }
  if (*((_BYTE *)__p + 96))
  {
    v7 = (void *)__p[6];
    if (v7)
      operator delete[](v7);
  }
  operator delete(__p);
}

uint64_t *sub_23CCB39A4(uint64_t *result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;

  if (a2)
  {
    v2 = result;
    v3 = 8 * a2;
    do
    {
      v4 = *v2;
      if (*v2)
      {
        if (!*(_QWORD *)v4)
        {
          v5 = *(_QWORD *)(v4 + 24) * *(unsigned __int8 *)(v4 + 16) * *(_QWORD *)(v4 + 32);
          *(_QWORD *)(v4 + 8) = 0;
          result = (uint64_t *)operator new[](v5);
          *(_QWORD *)v4 = result;
          *(_BYTE *)(v4 + 48) = 1;
        }
      }
      ++v2;
      v3 -= 8;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_23CCB3A10(uint64_t a1, uint64_t *a2)
{
  _DWORD *v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t **v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  __int128 *v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char **v35;
  _DWORD *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  char *v46;
  uint64_t **v47;
  char **v48;
  char *v49;
  char **v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  int v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  __int128 *v65;
  uint64_t v66;
  uint64_t *v67;
  void *v68;
  char *v69;
  uint64_t v70;
  _DWORD *v71;
  _DWORD *v72;
  int v73;
  _DWORD *v74;
  void *v75;
  uint64_t v77;
  char *v78;
  char *v79;
  void *__p[2];
  uint64_t v81;
  char **v82;
  char *v83[2];
  uint64_t v84;
  int v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  int v89;
  _BYTE v90[9];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)&v86 = 0xEEB6CC7FFAA28E71;
  if (sub_23CCAD840(v3, v4 & ~(v4 >> 63), &v86, 2))
    return 0x8000000000000000;
  LOBYTE(v88) = 0;
  v86 = 0u;
  v87 = 0u;
  if (!sub_23CCB5174((uint64_t)v3, v4 & ~(v4 >> 63), (uint64_t)&v86, (int16x8_t)0) || v6 < 0)
    return 0x8000000000000000;
  v74 = (_DWORD *)DWORD2(v86);
  v7 = v87;
  v8 = DWORD1(v87);
  v9 = HIDWORD(v87);
  v10 = v88;
  *(_QWORD *)&v86 = "vtxs";
  v85 = 260;
  __p[0] = (void *)SHIDWORD(v86);
  v77 = 3;
  v84 = a2[2];
  v11 = (uint64_t **)sub_23CCAE408((uint64_t)a2, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
  v11[1] = a2;
  v12 = *a2;
  *v11 = (uint64_t *)*a2;
  *(_QWORD *)(v12 + 8) = v11;
  *a2 = (uint64_t)v11;
  v13 = a2[2] + 1;
  a2[2] = v13;
  *(_QWORD *)&v86 = "idxs";
  v85 = 260;
  __p[0] = (void *)v8;
  v77 = 1;
  v84 = v13;
  v14 = (uint64_t **)sub_23CCAE408((uint64_t)a2, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
  v14[1] = a2;
  v15 = *a2;
  *v14 = (uint64_t *)*a2;
  *(_QWORD *)(v15 + 8) = v14;
  *a2 = (uint64_t)v14;
  v16 = a2[2] + 1;
  a2[2] = v16;
  v17 = (void *)v7;
  *(_QWORD *)&v86 = "topo";
  v85 = 260;
  __p[0] = (void *)v7;
  v77 = 1;
  v84 = v16;
  v18 = sub_23CCAE408((uint64_t)a2, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
  v18[1] = a2;
  v19 = *a2;
  *v18 = *a2;
  *(_QWORD *)(v19 + 8) = v18;
  *a2 = (uint64_t)v18;
  v20 = a2[2] + 1;
  a2[2] = v20;
  if (v10)
  {
    *(_QWORD *)&v86 = "fgrp";
    v85 = 260;
    __p[0] = v17;
    v77 = 1;
    v84 = v20;
    v21 = sub_23CCAE408((uint64_t)a2, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
    v21[1] = a2;
    v22 = *a2;
    *v21 = *a2;
    *(_QWORD *)(v22 + 8) = v21;
    *a2 = (uint64_t)v21;
    ++a2[2];
    v23 = v21 + 2;
  }
  else
  {
    v23 = 0;
  }
  if (v9 == 1)
  {
    v24 = 4 * (_QWORD)v17;
  }
  else if (v9)
  {
    v24 = 0;
  }
  else
  {
    v24 = 3 * (_QWORD)v17;
  }
  if (v14[5] == (uint64_t *)v24)
  {
    v14[5] = (uint64_t *)v17;
    if (v9 > 3)
      v25 = 0;
    else
      v25 = (uint64_t *)qword_23CCD4638[v9];
    v14[6] = v25;
    v14[7] = v25;
  }
  sub_23CCAD0D4(&v86, "faceType");
  __p[0] = &v86;
  *((_DWORD *)sub_23CCAD20C(v14 + 12, (const void **)&v86, (uint64_t)&unk_23CCD3F98, (_OWORD **)__p) + 14) = v9;
  if (SBYTE7(v87) < 0)
    operator delete((void *)v86);
  v26 = v14[15];
  sub_23CCAD0D4(&v86, "idxdby");
  __p[0] = &v86;
  *((_DWORD *)sub_23CCAD20C(v11 + 12, (const void **)&v86, (uint64_t)&unk_23CCD3F98, (_OWORD **)__p) + 14) = (_DWORD)v26;
  if (SBYTE7(v87) < 0)
    operator delete((void *)v86);
  v27 = operator new(0x38uLL);
  *v27 = &off_250DE4130;
  v27[1] = v11 + 2;
  v27[2] = v14 + 2;
  v27[3] = v18 + 2;
  v27[4] = v23;
  v27[5] = v3;
  v27[6] = v4;
  *((_QWORD *)&v87 + 1) = v27;
  v67 = (uint64_t *)(a1 + 40);
  sub_23CCB4454((uint64_t *)(a1 + 40), &v86);
  v28 = (__int128 *)*((_QWORD *)&v87 + 1);
  if (*((__int128 **)&v87 + 1) == &v86)
  {
    v30 = 4;
    v28 = &v86;
    v29 = v74;
    goto LABEL_27;
  }
  v29 = v74;
  if (*((_QWORD *)&v87 + 1))
  {
    v30 = 5;
LABEL_27:
    (*(void (**)(void))(*(_QWORD *)v28 + 8 * v30))();
  }
  result = 0;
  if ((_DWORD)v29)
  {
    v31 = v4 - (_QWORD)v29;
    if (v31 >= 1)
    {
      if (v3)
        v32 = (_DWORD *)((char *)v29 + (_QWORD)v3);
      else
        v32 = v29;
      v33 = v31;
      while (1)
      {
        *(_QWORD *)&v86 = 0xEEB6CC7FFAA28E71;
        if (sub_23CCAD840(v32, v31, &v86, 2))
          return 0x8000000000000000;
        v89 = 0;
        v87 = 0u;
        v88 = 0u;
        v86 = 0u;
        if (!sub_23CCB68BC((uint64_t)v32, v31, (uint64_t)&v86) || v34 < 0)
          return 0x8000000000000000;
        v35 = kGCLAttributeBuffer;
        if ((v88 - 1) <= 4)
          v35 = (char **)off_250DE41B0[(int)v88 - 1];
        v36 = (_DWORD *)DWORD2(v86);
        v75 = (void *)SHIDWORD(v86);
        v37 = (int)v87;
        v68 = (void *)SDWORD1(v87);
        v38 = HIDWORD(v87);
        v39 = DWORD1(v88);
        v40 = *((_QWORD *)&v88 + 1);
        v41 = *v35;
        sub_23CCAD0D4(&v86, "attrScope");
        v72 = v36;
        v73 = v39;
        DWORD2(v87) = v39;
        sub_23CCAD0D4(&v88, "bitdepth");
        v42 = 0;
        *(_DWORD *)&v90[1] = v38;
        v78 = 0;
        v79 = 0;
        v77 = (uint64_t)&v78;
        do
        {
          sub_23CCB4668(&v77, (uint64_t)&v78, (const void **)((char *)&v86 + v42), (uint64_t)&v86 + v42);
          v42 += 32;
        }
        while (v42 != 64);
        sub_23CCAD0D4(__p, v41);
        v82 = (char **)v77;
        v83[0] = v78;
        v83[1] = v79;
        v70 = v33;
        v71 = v32;
        if (v79)
        {
          *((_QWORD *)v78 + 2) = v83;
          v77 = (uint64_t)&v78;
          v78 = 0;
          v79 = 0;
        }
        else
        {
          v82 = v83;
        }
        v43 = a2[2];
        v44 = (char *)operator new(0x80uLL);
        v45 = (uint64_t *)v44;
        *((_OWORD *)v44 + 1) = 0u;
        v46 = v44 + 16;
        *(_OWORD *)v44 = 0u;
        *((_DWORD *)v44 + 8) = 260;
        *((_QWORD *)v44 + 5) = v75;
        *((_QWORD *)v44 + 6) = v37;
        *((_QWORD *)v44 + 7) = v37;
        v44[64] = 0;
        if (SHIBYTE(v81) < 0)
        {
          sub_23CCB45DC(v44 + 72, __p[0], (unint64_t)__p[1]);
        }
        else
        {
          *(_OWORD *)(v44 + 72) = *(_OWORD *)__p;
          *((_QWORD *)v44 + 11) = v81;
        }
        v45[13] = 0;
        v47 = (uint64_t **)(v45 + 12);
        v45[14] = 0;
        v45[12] = (uint64_t)(v45 + 13);
        v48 = v82;
        if (v82 != v83)
        {
          do
          {
            sub_23CCB4668(v45 + 12, (uint64_t)(v45 + 13), (const void **)v48 + 4, (uint64_t)(v48 + 4));
            v49 = v48[1];
            if (v49)
            {
              do
              {
                v50 = (char **)v49;
                v49 = *(char **)v49;
              }
              while (v49);
            }
            else
            {
              do
              {
                v50 = (char **)v48[2];
                v51 = *v50 == (char *)v48;
                v48 = v50;
              }
              while (!v51);
            }
            v48 = v50;
          }
          while (v50 != v83);
        }
        v45[15] = v43;
        v52 = (uint64_t)a2;
        v53 = *a2;
        *v45 = *a2;
        v45[1] = (uint64_t)a2;
        *(_QWORD *)(v53 + 8) = v45;
        *a2 = (uint64_t)v45;
        ++a2[2];
        sub_23CCAD084((uint64_t)&v82, v83[0]);
        if (SHIBYTE(v81) < 0)
          operator delete(__p[0]);
        sub_23CCAD084((uint64_t)&v77, v78);
        for (i = 0; i != -64; i -= 32)
        {
          if ((char)v90[i] < 0)
            operator delete(*(void **)((char *)&v88 + i));
        }
        v69 = v46;
        if ((_DWORD)v40 == 1)
        {
          *(_QWORD *)&v86 = "cond";
          v85 = 1;
          __p[0] = v75;
          v77 = 1;
          v84 = a2[2];
          v55 = v73;
          v56 = sub_23CCAE408((uint64_t)a2, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
          v56[1] = a2;
          v57 = *a2;
          *v56 = *a2;
          *(_QWORD *)(v57 + 8) = v56;
          *a2 = (uint64_t)v56;
          ++a2[2];
          v58 = v56[15];
          sub_23CCAD0D4(&v86, "condby");
          __p[0] = &v86;
          *((_DWORD *)sub_23CCAD20C(v47, (const void **)&v86, (uint64_t)&unk_23CCD3F98, (_OWORD **)__p) + 14) = v58;
          v52 = (uint64_t)a2;
          if (SBYTE7(v87) < 0)
            operator delete((void *)v86);
          v59 = v56 + 2;
        }
        else
        {
          v59 = 0;
          v55 = v73;
        }
        if (HIDWORD(v40))
        {
          *(_QWORD *)&v86 = "idxs";
          v85 = 4;
          __p[0] = v68;
          v77 = 1;
          v84 = *(_QWORD *)(v52 + 16);
          v60 = sub_23CCAE408(v52, 0, 0, &v84, (char **)&v86, &v85, (uint64_t *)__p, &v77);
          v60[1] = a2;
          v61 = *a2;
          *v60 = *a2;
          *(_QWORD *)(v61 + 8) = v60;
          *a2 = (uint64_t)v60;
          ++*(_QWORD *)(v52 + 16);
          v62 = v60[15];
          sub_23CCAD0D4(&v86, "idxdby");
          __p[0] = &v86;
          *((_DWORD *)sub_23CCAD20C(v47, (const void **)&v86, (uint64_t)&unk_23CCD3F98, (_OWORD **)__p) + 14) = v62;
          if (SBYTE7(v87) < 0)
            operator delete((void *)v86);
          v63 = v60 + 2;
        }
        else
        {
          v63 = 0;
        }
        v64 = operator new(0x38uLL);
        *v64 = &off_250DE4178;
        v64[1] = v69;
        v64[2] = v59;
        v64[3] = v63;
        *((_DWORD *)v64 + 8) = v55;
        v64[5] = v71;
        v64[6] = v70;
        *((_QWORD *)&v87 + 1) = v64;
        sub_23CCB4454(v67, &v86);
        v65 = (__int128 *)*((_QWORD *)&v87 + 1);
        if (*((__int128 **)&v87 + 1) == &v86)
          break;
        if (*((_QWORD *)&v87 + 1))
        {
          v66 = 5;
LABEL_74:
          (*(void (**)(void))(*(_QWORD *)v65 + 8 * v66))();
        }
        result = 0;
        if (v71)
          v32 = (_DWORD *)((char *)v72 + (_QWORD)v71);
        else
          v32 = v72;
        v33 = v70 - (_QWORD)v72;
        if (v70 - (uint64_t)v72 >= 1)
        {
          v31 = v33 & ~(v33 >> 63);
          if ((_DWORD)v72)
            continue;
        }
        return result;
      }
      v65 = &v86;
      v66 = 4;
      goto LABEL_74;
    }
  }
  return result;
}

void sub_23CCB4334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25)
{
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v28;
  uint64_t v29;

  v28 = *(_QWORD **)(v26 - 152);
  if (v28 == v25)
  {
    v29 = 4;
    v28 = (_QWORD *)(v26 - 176);
  }
  else
  {
    if (!v28)
      goto LABEL_6;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t *sub_23CCB4454(uint64_t *a1, _QWORD *a2)
{
  uint64_t *result;
  uint64_t *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  result = (uint64_t *)operator new(0x30uLL);
  v5 = result;
  *result = 0;
  result[1] = 0;
  v6 = a2 + 3;
  v7 = (_QWORD *)a2[3];
  if (v7)
  {
    if (v7 == a2)
    {
      result[5] = (uint64_t)(result + 2);
      result = (uint64_t *)(*(uint64_t (**)(_QWORD *))(*a2 + 24))(a2);
      goto LABEL_7;
    }
    result[5] = (uint64_t)v7;
  }
  else
  {
    v6 = result + 5;
  }
  *v6 = 0;
LABEL_7:
  v8 = *a1;
  *v5 = *a1;
  v5[1] = (uint64_t)a1;
  *(_QWORD *)(v8 + 8) = v5;
  *a1 = (uint64_t)v5;
  ++a1[2];
  return result;
}

uint64_t sub_23CCB44EC(uint64_t a1)
{
  sub_23CCAD084(a1 + 24, *(char **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_23CCB4528(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;

  sub_23CCBFE68(&v9);
  v2 = a1 + 40;
  for (i = *(_QWORD *)(a1 + 48); i != v2; i = *(_QWORD *)(i + 8))
  {
    v4 = *(_QWORD *)(i + 40);
    if (!v4)
      sub_23CCB382C();
    v5 = (*(uint64_t (**)(uint64_t, _QWORD **))(*(_QWORD *)v4 + 48))(v4, &v9);
    if (v5)
      goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    v7 = sub_23CCC17E4(v6);
    operator delete(v7);
  }
  return v5;
}

void sub_23CCB45B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v11;

  if (a10)
  {
    v11 = sub_23CCC17E4(a10);
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

void *sub_23CCB45DC(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_23CCAD184();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_23CCB4668(uint64_t *result, uint64_t a2, const void **a3, uint64_t a4)
{
  uint64_t **v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t **v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;

  v7 = (uint64_t **)result;
  v8 = result + 1;
  if (result + 1 == (uint64_t *)a2
    || (result = (uint64_t *)sub_23CCAD394((uint64_t)(result + 2), a3, (const void **)(a2 + 32)), (_DWORD)result))
  {
    if (*v7 == (uint64_t *)a2)
    {
      v10 = a2;
LABEL_16:
      if (*(_QWORD *)a2)
      {
        v21 = v10;
        v12 = (uint64_t **)(v10 + 8);
      }
      else
      {
        v21 = a2;
        v12 = (uint64_t **)a2;
      }
      goto LABEL_30;
    }
    v9 = *(_QWORD *)a2;
    if (*(_QWORD *)a2)
    {
      do
      {
        v10 = v9;
        v9 = *(_QWORD *)(v9 + 8);
      }
      while (v9);
    }
    else
    {
      v15 = a2;
      do
      {
        v10 = *(_QWORD *)(v15 + 16);
        v16 = *(_QWORD *)v10 == v15;
        v15 = v10;
      }
      while (v16);
    }
    result = (uint64_t *)sub_23CCAD394((uint64_t)(v7 + 2), (const void **)(v10 + 32), a3);
    if ((_DWORD)result)
      goto LABEL_16;
LABEL_29:
    result = sub_23CCAD2A4((uint64_t)v7, &v21, a3);
    v12 = (uint64_t **)result;
    goto LABEL_30;
  }
  result = (uint64_t *)sub_23CCAD394((uint64_t)(v7 + 2), (const void **)(a2 + 32), a3);
  if ((_DWORD)result)
  {
    v12 = (uint64_t **)(a2 + 8);
    v11 = *(uint64_t **)(a2 + 8);
    if (v11)
    {
      v13 = *(_QWORD **)(a2 + 8);
      do
      {
        v14 = (uint64_t)v13;
        v13 = (_QWORD *)*v13;
      }
      while (v13);
    }
    else
    {
      v17 = a2;
      do
      {
        v14 = *(_QWORD *)(v17 + 16);
        v16 = *(_QWORD *)v14 == v17;
        v17 = v14;
      }
      while (!v16);
    }
    if ((uint64_t *)v14 != v8)
    {
      result = (uint64_t *)sub_23CCAD394((uint64_t)(v7 + 2), a3, (const void **)(v14 + 32));
      if (!(_DWORD)result)
        goto LABEL_29;
      v11 = *v12;
    }
    if (v11)
    {
      v21 = v14;
      v12 = (uint64_t **)v14;
    }
    else
    {
      v21 = a2;
    }
LABEL_30:
    if (*v12)
      return result;
    goto LABEL_31;
  }
  v20 = a2;
  v21 = a2;
  v12 = (uint64_t **)&v20;
  if (a2)
    return result;
LABEL_31:
  v18 = (char *)operator new(0x40uLL);
  v19 = v18 + 32;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_23CCB45DC(v19, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)v19 = *(_OWORD *)a4;
    *((_QWORD *)v18 + 6) = *(_QWORD *)(a4 + 16);
  }
  *((_DWORD *)v18 + 14) = *(_DWORD *)(a4 + 24);
  return sub_23CCAD340(v7, v21, v12, (uint64_t *)v18);
}

void sub_23CCB4850(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 sub_23CCB486C(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x38uLL);
  *(_QWORD *)v2 = &off_250DE4130;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

__n128 sub_23CCB48B4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_250DE4130;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

unint64_t sub_23CCB48E4(uint64_t a1, uint64_t *a2)
{
  __int128 v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)(a1 + 24);
  v17[0] = *(_OWORD *)(a1 + 8);
  v17[1] = v4;
  sub_23CCB39A4((uint64_t *)v17, 4);
  *(_QWORD *)&v17[0] = 0;
  v5 = *(uint64_t **)(a1 + 8);
  if (!v5 || (v6 = *v5) == 0)
  {
    v6 = 0;
    v5 = &qword_23CCD43D0;
  }
  v7 = *(uint64_t **)(a1 + 24);
  if (!v7 || (v8 = *v7) == 0)
  {
    v8 = 0;
    v7 = &qword_23CCD43D0;
  }
  v9 = *(uint64_t **)(a1 + 16);
  if (!v9 || (v10 = *v9) == 0)
  {
    v10 = 0;
    v9 = &qword_23CCD43D0;
  }
  v11 = v5[1];
  v12 = v7[1];
  v13 = v9[1];
  v14 = *(uint64_t **)(a1 + 32);
  if (!v14 || (v15 = *v14) == 0)
  {
    v15 = 0;
    v14 = &qword_23CCD43D0;
  }
  return (unint64_t)(sub_23CCB4D60(*a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) & ~(*(uint64_t *)(a1 + 48) >> 63), v17, (int32x2_t *)(v6 + 4 * v11), (_DWORD *)(v8 + 4 * v12), (void *)(v10 + 4 * v13), (int *)(v15 + 4 * v14[1])) != 0) << 63;
}

__n128 sub_23CCB4A10(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x38uLL);
  *(_QWORD *)v2 = &off_250DE4178;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

__n128 sub_23CCB4A58(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_250DE4178;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

unint64_t sub_23CCB4A88(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24))
    return 0;
  v20 = *(_QWORD *)(a1 + 8);
  v21 = *(_OWORD *)(a1 + 16);
  sub_23CCB39A4(&v20, 3);
  v20 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48) & ~(*(uint64_t *)(a1 + 48) >> 63);
  v6 = *(uint64_t **)(a1 + 8);
  if (*(_DWORD *)(a1 + 32))
  {
    if (!v6 || (v7 = *v6) == 0)
    {
      v7 = 0;
      v6 = &qword_23CCD43D0;
    }
    v8 = v7 + 4 * v6[1];
    v9 = *(uint64_t **)(a1 + 24);
    if (!v9 || (v10 = *v9) == 0)
    {
      v10 = 0;
      v9 = &qword_23CCD43D0;
    }
    v11 = (void *)(v10 + 4 * v9[1]);
    v12 = *(uint64_t **)(a1 + 16);
    if (!v12 || (v13 = *v12) == 0)
    {
      v13 = 0;
      v12 = &qword_23CCD43D0;
    }
    v14 = sub_23CCBB478(*a2, v4, v5, &v20, v8, v13 + v12[1], v11);
  }
  else
  {
    if (!v6 || (v16 = *v6) == 0)
    {
      v16 = 0;
      v6 = &qword_23CCD43D0;
    }
    v17 = v16 + 4 * v6[1];
    v18 = *(uint64_t **)(a1 + 16);
    if (!v18 || (v19 = *v18) == 0)
    {
      v19 = 0;
      v18 = &qword_23CCD43D0;
    }
    v14 = sub_23CCB65CC(*a2, v4, v5, &v20, v17, v19 + v18[1]);
  }
  return (unint64_t)(v14 != 0) << 63;
}

uint64_t sub_23CCB4BF4(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  *(_DWORD *)result = 0;
  *(_QWORD *)&v2 = 0xFFFF00000000;
  *((_QWORD *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(result + 24) = v2;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 40) = 0;
  v3 = 0x217u;
  do
  {
    *(_WORD *)(result + v1 * 2 + 48) = word_256C22A50[v1];
    *(_WORD *)(result + v3 * 2) = word_256C22A50[v3 - 280];
    ++v1;
    --v3;
  }
  while (v1 != 256);
  return result;
}

void *sub_23CCB4C48(uint64_t a1)
{
  __int128 v1;
  unsigned int v2;
  unsigned __int8 *v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_QWORD *)&v1 = 0xFFFF000000000000;
  *((_QWORD *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)(a1 + 24) = v1;
  *(_QWORD *)(a1 + 40) = 16;
  v2 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v4 = -16777216;
    goto LABEL_7;
  }
  v3 = *(unsigned __int8 **)(a1 + 8);
  v4 = *v3 << 24;
  *(_DWORD *)(a1 + 32) = v4;
  if (v2 == 1)
  {
LABEL_7:
    v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  v5 = v4 | (v3[1] << 16);
  *(_DWORD *)(a1 + 32) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  v6 = v5 | (v3[2] << 8);
  *(_DWORD *)(a1 + 32) = v6;
  if (v2 == 3)
  {
LABEL_9:
    v7 = 255;
    goto LABEL_10;
  }
  v7 = v3[3];
LABEL_10:
  *(_DWORD *)(a1 + 32) = v7 | v6;
  *(_QWORD *)(a1 + 16) = 3;
  return memcpy((void *)(a1 + 48), &unk_256C22C50, 0x400uLL);
}

char *sub_23CCB4CE0(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  _DWORD *v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a3 - 4;
  if (a3 >= 4)
  {
    v7 = *a2;
    v6 = a2 + 1;
    v5 = (char *)v7;
    if (v6)
    {
      v4 = &v5[(_QWORD)v6];
      goto LABEL_7;
    }
    v4 = v5;
  }
  else
  {
    v4 = 0;
    v3 = 0;
    v5 = 0;
  }
  v6 = 0;
LABEL_7:
  if (!v4)
    return 0;
  v8 = 0;
  if (((v3 - (_QWORD)v5) & 0x8000000000000000) == 0)
  {
    *(_DWORD *)a1 = (_DWORD)v5;
    *(_QWORD *)(a1 + 8) = v6;
    sub_23CCB4C48(a1);
    return v4;
  }
  return (char *)v8;
}

uint64_t sub_23CCB4D60(uint64_t a1, unint64_t a2, unint64_t a3, _QWORD *a4, int32x2_t *a5, _DWORD *a6, void *a7, int *a8)
{
  _DWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int16x4_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  char *v28;
  uint64_t v29;
  int32x2_t v30;
  uint64_t v31;
  unsigned int *v32;
  uint64_t v33;
  _DWORD *v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  int32x2_t v39;
  int v40;
  _DWORD *v41;
  int32x2_t *v42;
  __int32 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _DWORD *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  __int128 v57;
  __int128 v58;
  unsigned __int8 v59;
  int v60;
  char v61;
  uint64_t v62;
  unsigned __int8 v63;

  *(_DWORD *)(a1 + 4384) = 0;
  v59 = 0;
  v57 = 0u;
  v58 = 0u;
  v60 = 0;
  v61 = 4;
  v62 = 0x101010100000002;
  v63 = 1;
  v16 = (_DWORD *)sub_23CCB5174(a2, a3, (uint64_t)&v57, (int16x8_t)0);
  if (!v16)
    goto LABEL_59;
  if (v17 < 0)
    goto LABEL_59;
  if (!a2)
    goto LABEL_59;
  if (((a3 - DWORD2(v57)) & 0x8000000000000000) != 0)
    goto LABEL_59;
  if ((unint64_t)v16 + v17 < a2)
    goto LABEL_59;
  v18 = a2 + DWORD2(v57);
  if (v18 < (unint64_t)v16)
    goto LABEL_59;
  v19 = v18 - (_QWORD)v16;
  if ((uint64_t)(v18 - (_QWORD)v16) < 0)
    goto LABEL_59;
  if (!a5 || !a7 || !a6 && (HIDWORD(v58) & 0xFFFFFFFE) == 2 || !a8 && v59)
    goto LABEL_14;
  v21 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(BYTE4(v57) == 0), (int8x8_t)vceq_s16((int16x4_t)(*(_QWORD *)&vdup_n_s16(BYTE5(v57)) & 0xFF00FF00FF00FFLL), (int16x4_t)0x8000600040005));
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v21, 0xFuLL))) & 1) == 0
    || v59 && (vorr_s8((int8x8_t)v21, (int8x8_t)vdup_lane_s16(v21, 1)).u8[0] & 1) != 0 && (v61 & 0xFB) != 0)
  {
    v20 = 4;
    goto LABEL_60;
  }
  if (a3 < DWORD2(v57) || (_DWORD)v62 == 3 || (_DWORD)v62 == 4 || v61 == 3 || v61 == 1)
    goto LABEL_59;
  v20 = 0;
  if (!(_DWORD)v58 || !HIDWORD(v57))
    return v20;
  v54 = 0;
  v53 = 0;
  if (v19 < 4
    || (LODWORD(v55) = *v16, (v19 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    || (HIDWORD(v55) = v16[1], (v19 & 0xFFFFFFFFFFFFFFFCLL) == 8))
  {
    v22 = 0;
    v23 = 0;
  }
  else
  {
    v22 = v19 - 12;
    v23 = v16 + 3;
    v56 = v16[2];
  }
  v24 = v63;
  if (v63)
  {
    if (!v22)
      goto LABEL_59;
    v24 = *(unsigned __int8 *)v23;
    LODWORD(v53) = v24;
    if (v22 == 1)
      goto LABEL_59;
    v25 = *((unsigned __int8 *)v23 + 1);
    HIDWORD(v53) = v25;
    if (v22 == 2)
      goto LABEL_59;
    v22 -= 3;
    v26 = *((unsigned __int8 *)v23 + 2);
    v23 = (unsigned int *)((char *)v23 + 3);
    v54 = v26;
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  if (!v23)
    goto LABEL_59;
  if ((int)v24 <= (int)v25)
    v27 = v25;
  else
    v27 = v24;
  if (v24 <= v25)
    v24 = v25;
  if (v27 < v26)
    v24 = v26;
  if (v24 >= 0x1D)
    goto LABEL_59;
  v51 = v58;
  v52 = v59;
  v49 = HIDWORD(v57);
  v50 = DWORD2(v57);
  sub_23CCB52E0(a1 + 1072, &v57, &v55, &v53);
  sub_23CCB53F8(a1 + 1304, a1 + 1072);
  v28 = sub_23CCB4CE0(a1, v23, v22);
  if (!v28)
    goto LABEL_59;
  v31 = v29;
  if (v29 < 0)
    goto LABEL_59;
  v32 = (unsigned int *)v28;
  if (*(_BYTE *)(a1 + 1152))
    sub_23CCB55E8(a1, v30);
  else
    sub_23CCB5C70(a1, v30);
  v20 = *(unsigned int *)(a1 + 4384);
  if ((_DWORD)v20)
    return v20;
  if (v52)
  {
    if (!a8)
    {
LABEL_14:
      v20 = 5;
LABEL_60:
      *(_DWORD *)(a1 + 4384) = v20;
      return v20;
    }
    if (sub_23CCB4CE0(a1, v32, v31) && (v33 & 0x8000000000000000) == 0)
    {
      sub_23CCB5E4C(a1, a8);
      v20 = *(unsigned int *)(a1 + 4384);
      if ((_DWORD)v20)
        return v20;
      v20 = sub_23CCB61A0(a1, a8);
      *(_DWORD *)(a1 + 4384) = v20;
      goto LABEL_63;
    }
LABEL_59:
    v20 = 3;
    goto LABEL_60;
  }
  sub_23CCB659C(a1 + 1232, 2uLL);
  v35 = *(_DWORD **)(a1 + 1232);
  *v35 = 0;
  v35[1] = v51;
  v20 = *(unsigned int *)(a1 + 4384);
LABEL_63:
  if (!(_DWORD)v20)
  {
    v36 = *(_BYTE **)(a1 + 1184);
    v37 = *(_BYTE **)(a1 + 1192);
    if (v37 != v36)
      memmove(a7, v36, v37 - v36);
    v38 = v49;
    if ((int)v49 >= 1)
    {
      v39 = *(int32x2_t *)(a1 + 1092);
      v40 = *(_DWORD *)(a1 + 1100);
      v41 = (_DWORD *)(*(_QWORD *)(a1 + 1160) + 8);
      v42 = a5 + 1;
      do
      {
        v43 = *v41 + v40;
        v42[-1] = vadd_s32(*(int32x2_t *)(v41 - 2), v39);
        v42->i32[0] = v43;
        v42 = (int32x2_t *)((char *)v42 + 12);
        v41 += 3;
        --v38;
      }
      while (v38);
    }
    if (a6)
    {
      v44 = *(_QWORD *)(a1 + 1208);
      v45 = *(_QWORD *)(a1 + 1216) - v44;
      if ((unint64_t)v45 >= 5)
      {
        v46 = v45 >> 2;
        if (v46 <= 2)
          v46 = 2;
        v47 = v46 - 1;
        v48 = (_DWORD *)(v44 + 4);
        do
        {
          *a6++ = *v48 - *(v48 - 1);
          ++v48;
          --v47;
        }
        while (v47);
      }
    }
    v20 = 0;
    *a4 = v50;
  }
  return v20;
}

uint64_t sub_23CCB5174(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  char v9;
  char v10;
  __int16 v11;
  int v12;
  int v13;
  int v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  if (a2 < 4)
    return 0;
  v4 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || a2 == 8
    || a2 == 9
    || (a2 & 0xFFFFFFFFFFFFFFFELL) == 0xA
    || v4 == 12
    || v4 == 16
    || v4 == 20
    || a2 == 24
    || a2 == 25
    || a2 == 26
    || a2 == 27
    || v4 == 28)
  {
    return 0;
  }
  v7 = a1 + 32;
  if (a1 == -32)
    return 0;
  v5 = 0;
  if (*(_DWORD *)a1 == -90009999)
  {
    v8 = *(_DWORD *)(a1 + 4);
    v9 = *(_BYTE *)(a1 + 8);
    v10 = *(_BYTE *)(a1 + 9);
    v11 = *(_WORD *)(a1 + 10);
    v12 = *(_DWORD *)(a1 + 12);
    v13 = *(_DWORD *)(a1 + 16) & 0x7FFFFFFF;
    v14 = *(_DWORD *)(a1 + 20) & 0x7FFFFFFF;
    v15 = *(_BYTE *)(a1 + 24);
    v16 = *(unsigned __int8 *)(a1 + 25);
    v17 = *(unsigned __int8 *)(a1 + 26);
    v18 = *(unsigned __int8 *)(a1 + 27);
    v19 = *(_DWORD *)(a1 + 28) & 0x7FFFFFFF;
    *(uint16x4_t *)a4.i8 = vshl_u16((uint16x4_t)vdup_n_s16(v17), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL);
    if (v17 >> 6 == 1)
      v19 = 4 * v14;
    if (v17 < 0x40)
      v19 = 3 * v14;
    *(_DWORD *)a3 = 0;
    *(_BYTE *)(a3 + 4) = v9;
    *(_BYTE *)(a3 + 5) = v10;
    *(_WORD *)(a3 + 6) = v11;
    *(_DWORD *)(a3 + 8) = v12;
    *(_DWORD *)(a3 + 12) = v13;
    *(_DWORD *)(a3 + 16) = v14;
    *(_DWORD *)(a3 + 20) = v19;
    *(_DWORD *)(a3 + 24) = v18;
    *(_DWORD *)(a3 + 28) = v17 >> 6;
    *(_BYTE *)(a3 + 32) = v17 & 1;
    *(_DWORD *)(a3 + 36) = v8;
    *(_BYTE *)(a3 + 40) = v15;
    *(_DWORD *)(a3 + 44) = v16;
    a4.i32[0] &= 0xFF01FF01;
    a4.i16[2] &= 0xFF01u;
    a4.i16[3] &= 0xFF01u;
    *(_DWORD *)(a3 + 48) = vmovn_s16(a4).u32[0];
    *(_BYTE *)(a3 + 52) = (v17 & 0x20) != 0;
    return v7;
  }
  return v5;
}

void sub_23CCB52E0(uint64_t a1, __int128 *a2, uint64_t *a3, uint64_t *a4)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;

  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  *(_QWORD *)(a1 + 77) = *(_QWORD *)((char *)a2 + 45);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)a1 = 0;
  v9 = *a4;
  *(_DWORD *)(a1 + 16) = *((_DWORD *)a4 + 2);
  *(_QWORD *)(a1 + 8) = v9;
  v10 = *a3;
  *(_DWORD *)(a1 + 28) = *((_DWORD *)a3 + 2);
  *(_QWORD *)(a1 + 20) = v10;
  v11 = *((int *)a2 + 3);
  sub_23CCBFEB0((uint64_t *)(a1 + 88), v11);
  sub_23CCB659C(a1 + 136, 0);
  v12 = *((int *)a2 + 4) + 1;
  LODWORD(v13) = 0;
  sub_23CCBA1AC(a1 + 136, v12, &v13);
  sub_23CCB659C(a1 + 112, *((int *)a2 + 5));
  sub_23CCBFEB0((uint64_t *)(a1 + 184), 0);
  v14 = -1;
  v13 = -1;
  sub_23CCBFEEC((uint64_t *)(a1 + 184), v11, &v13);
  sub_23CCBFEB0((uint64_t *)(a1 + 208), 0);
  v14 = -1;
  v13 = -1;
  sub_23CCBFEEC((uint64_t *)(a1 + 208), v11, &v13);
  sub_23CCB659C(a1 + 160, 0);
}

void sub_23CCB53F8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  BOOL v4;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = *(int *)(a2 + 44);
  if (*(_BYTE *)(a2 + 81))
    v4 = *(_BYTE *)(a2 + 80) == 0;
  else
    v4 = 1;
  if (!v4 || (sub_23CCB659C(a1 + 120, 0), v12 = 0, sub_23CCBA1AC(a1 + 120, v3, &v12), *(_BYTE *)(a2 + 80)))
  {
    sub_23CCC037C(a1 + 168, v3);
    sub_23CCC03B8(a1 + 192, 64);
  }
  sub_23CCC044C(a1 + 144, v3);
  v6 = *(_BYTE **)(a1 + 144);
  v7 = *(_BYTE **)(a1 + 152);
  if (v6 != v7)
    memset(v6, 255, (v7 - v6) & 0xFFFFFFFFFFFFFFF0);
  sub_23CCC047C((void **)a1, 0x100uLL);
  sub_23CCC047C((void **)(a1 + 96), 0x40uLL);
  sub_23CCC047C((void **)(a1 + 72), 0x40uLL);
  sub_23CCC047C((void **)(a1 + 24), 0x20uLL);
  sub_23CCC0510((unint64_t *)(a1 + 48), 0x20uLL);
  memset_pattern16((void *)(a1 + 1992), &unk_23CCD46A0, 0xAuLL);
  v8 = 0;
  *(_WORD *)(a1 + 2002) = 0x8000;
  do
  {
    memset_pattern16((void *)(a1 + 2004 + v8), &unk_23CCD46A0, 6uLL);
    v8 += 6;
  }
  while (v8 != 96);
  *(_WORD *)(a1 + 2100) = 0x8000;
  memset_pattern16((void *)(a1 + 2102), &unk_23CCD46A0, 6uLL);
  v9 = 0;
  *(_WORD *)(a1 + 2108) = 0x8000;
  do
  {
    memset_pattern16((void *)(a1 + 2110 + v9), &unk_23CCD46A0, 0x10uLL);
    v9 += 16;
  }
  while (v9 != 80);
  memset_pattern16((void *)(a1 + 2194), &unk_23CCD46A0, 0x20uLL);
  memset_pattern16((void *)(a1 + 2232), &unk_23CCD46A0, 0x80uLL);
  *(_WORD *)(a1 + 2230) = 0x8000;
  *(_DWORD *)(a1 + 2190) = -2147450880;
  *(_DWORD *)(a1 + 2226) = -2147450880;
  memset_pattern16((void *)(a1 + 2368), &unk_23CCD46A0, 6uLL);
  v10 = 0;
  v11 = a1 + 2376;
  do
  {
    sub_23CCB7FFC(v11 + v10, 3);
    v10 += 120;
  }
  while (v10 != 240);
}

void sub_23CCB55E8(uint64_t a1, int32x2_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  int32x2_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int *v22;
  int v23;
  int v24;
  uint64_t v25;
  int *v26;
  int *v27;
  int *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  _BOOL4 v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  BOOL v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  unint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  _BOOL4 v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  unsigned int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  int v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int *v107;
  _DWORD *v108;
  int v109;
  int v110;
  _BOOL4 v111;
  _BOOL4 v112;
  int v113;
  int v114;
  BOOL v115;
  uint64_t v116;
  uint64_t v117;
  _WORD *v118;
  int v119;
  int v120;
  int v121;
  uint64_t v122;

  v3 = *(unsigned int *)(a1 + 1116);
  v122 = 0;
  v121 = 0;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v5 = (_DWORD *)(a1 + 1496);
    v118 = (_WORD *)(a1 + 3306);
    LODWORD(v6) = -1;
    v116 = v3;
    while (1)
    {
      if (v4 == HIDWORD(v122))
      {
        ++HIDWORD(v122);
        v7 = *(_BYTE *)(a1 + 1156) ? -1 : v6;
        *(_DWORD *)(*(_QWORD *)(a1 + 1256) + 12 * v4) = v7;
        sub_23CCBA1DC(a1, v4, a2);
        sub_23CCBAA6C((_DWORD *)(a1 + 1496), (int *)(*(_QWORD *)(a1 + 1472) + 12 * v4));
        v117 = v4;
        if (*(_DWORD *)(a1 + 1496))
          break;
      }
LABEL_168:
      if (++v4 == v3)
      {
        v114 = v122;
        v113 = HIDWORD(v122);
        LODWORD(v3) = *(_DWORD *)(a1 + 1116);
        goto LABEL_171;
      }
    }
    while (1)
    {
      v8 = *(_DWORD *)(a1 + 1500);
      v9 = v8 < 0 ? 0 : sub_23CCC1660((_DWORD *)(a1 + 1496), v8);
      v6 = 0xAAAAAAAAAAAAAAABLL * ((v9 - *(_QWORD *)(a1 + 1472)) >> 2);
      v10 = *(_DWORD *)(*(_QWORD *)(a1 + 1448)
                      + ((uint64_t)(0xAAAAAAAB00000000 * ((v9 - *(_QWORD *)(a1 + 1472)) >> 2)) >> 28));
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 1448)
                      + ((uint64_t)(0xAAAAAAAB00000000 * ((v9 - *(_QWORD *)(a1 + 1472)) >> 2)) >> 28)
                      + 4);
      v12 = v10 != -1;
      v13 = v11 == v10 && v10 != -1;
      v14 = (v12 | (2 * (v11 != -1))) + v13;
      if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 2 * v14 + 3296)))
        break;
LABEL_167:
      v3 = v116;
      v4 = v117;
      if (!*v5)
        goto LABEL_168;
    }
    v15 = (int)v6;
    v119 = v6;
    while (1)
    {
      v120 = 0;
      v16 = sub_23CCBABFC(a1, v6, v14, &v120, (_DWORD *)&v122 + 1, (int *)&v122, &v121);
      if (v16 < 0)
        return;
      if (*(_DWORD *)(a1 + 4384))
        return;
      v18 = v16;
      sub_23CCBA9AC(a1, v120, v16, v17);
      if (*(_DWORD *)(a1 + 4384))
        return;
      v19 = v18;
      if (v18 >= 2)
        break;
LABEL_156:
      if ((int)v18 >= 1)
      {
        v106 = 0;
        do
        {
          v107 = (int *)(*(_QWORD *)(a1 + 1472) + 12 * *(int *)(*(_QWORD *)(a1 + 1328) + 4 * v106));
          v108 = (_DWORD *)(a1 + 1496);
          if (*(_BYTE *)(*(_QWORD *)(a1 + 1352) + v106))
            sub_23CCBAA6C(v108, v107);
          else
            sub_23CCBABC0(v108, v107);
          ++v106;
        }
        while (v19 != v106);
        if (*(_DWORD *)(a1 + 4384))
          return;
      }
      v109 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v15);
      v110 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v15 + 4);
      v111 = v109 != -1;
      v112 = v110 == v109 && v109 != -1;
      v14 = (v111 | (2 * (v110 != -1))) + v112;
      LODWORD(v6) = v119;
      if (!sub_23CCB7064((unsigned int *)a1, v118))
        goto LABEL_167;
    }
    v20 = *(unsigned __int8 *)(a1 + 1154);
    v21 = v18 - 1;
    v22 = (int *)(*(_QWORD *)(a1 + 1328) + 4);
    while (1)
    {
      v24 = *(v22 - 1);
      v23 = *v22;
      if (!v20)
      {
        v64 = *(_QWORD *)(a1 + 1472);
        *(_DWORD *)(v64 + 12 * v24) += 8;
        *(_DWORD *)(v64 + 12 * v23) += 8;
        goto LABEL_155;
      }
      v25 = *(_QWORD *)(a1 + 1160);
      v26 = (int *)(v25 + 12 * (int)v15);
      v27 = (int *)(v25 + 12 * v24);
      v28 = (int *)(v25 + 12 * v23);
      v30 = *v28;
      v29 = v28[1];
      v31 = *v27;
      v32 = v27[1];
      v33 = *v28 - *v27;
      v34 = v29 - v32;
      v35 = v28[2];
      v36 = v27[2];
      v37 = v35 - v36;
      v38 = *v26;
      v39 = v26[1];
      v40 = *v26 - *v27;
      v41 = v39 - v32;
      v42 = v26[2];
      v43 = v42 - v36;
      if (v30 - v31 >= 0)
        v44 = v33;
      else
        v44 = -v33;
      if (v34 >= 0)
        v45 = v34;
      else
        v45 = -v34;
      if (v37 >= 0)
        v46 = v37;
      else
        v46 = -v37;
      v49 = v44 < 0x1000 && v45 < 0x1000 && v46 < 0x1000;
      if (v40 >= 0)
        v50 = v40;
      else
        v50 = -v40;
      if (v41 >= 0)
        v51 = v41;
      else
        v51 = -v41;
      if (v43 >= 0)
        v52 = v43;
      else
        v52 = -v43;
      if (v49 && v50 <= 0xFFF && v51 <= 0xFFF && v52 <= 0xFFF)
      {
        v53 = v40 * v33 + v41 * v34 + v43 * v37;
        if (!v53)
          goto LABEL_96;
        v54 = v43 * v34 - v41 * v37;
        if (v54 < 0)
          v54 = v41 * v37 - v43 * v34;
        v55 = v40 * v37 - v43 * v33;
        if (v55 < 0)
          v55 = -v55;
        v56 = v41 * v33 - v40 * v34;
        if (v56 < 0)
          v56 = -v56;
        v57 = v54 + v55;
        if (v55 < v56)
        {
          v58 = v56;
        }
        else
        {
          v57 = v54 + v56;
          v58 = v55;
        }
        v59 = v54 >= v55 && v54 >= v56;
        if (v59)
          v60 = v55 + v56;
        else
          v60 = v57;
        if (v59)
          v61 = v54;
        else
          v61 = v58;
        v62 = v61 + (v60 >> 2);
        if (v53 < 0)
          LODWORD(v63) = -16 * v53 / (int)(v62 - v53) + 16;
        else
          LODWORD(v63) = (int)(16 * v62) / (int)(v62 + v53);
      }
      else
      {
        v65 = v41 * (uint64_t)v34 + v40 * (uint64_t)v33 + v43 * (uint64_t)v37;
        if (!v65)
        {
LABEL_96:
          LODWORD(v63) = 16;
          goto LABEL_99;
        }
        v66 = v43 * (uint64_t)v34 - v41 * (uint64_t)v37;
        if (v66 < 0)
          v66 = v41 * (uint64_t)v37 - v43 * (uint64_t)v34;
        v67 = v40 * (uint64_t)v37 - v43 * (uint64_t)v33;
        if (v67 < 0)
          v67 = -v67;
        v68 = v41 * (uint64_t)v33 - v40 * (uint64_t)v34;
        if (v68 < 0)
          v68 = -v68;
        v69 = v66 + v67;
        if (v67 < (unint64_t)v68)
        {
          v70 = v68;
        }
        else
        {
          v69 = v66 + v68;
          v70 = v67;
        }
        v71 = v66 >= (unint64_t)v67 && v66 >= (unint64_t)v68;
        if (v71)
          v72 = v67 + v68;
        else
          v72 = v69;
        if (v71)
          v73 = v66;
        else
          v73 = v70;
        v63 = v73 + (v72 >> 2);
        if (v65 < 0)
          LODWORD(v63) = -16 * v65 / (v63 - v65) + 16;
        else
          v63 = 16 * v63 / (v63 + v65);
      }
LABEL_99:
      v74 = v38 - v30;
      v75 = v39 - v29;
      v76 = v42 - v35;
      v77 = -v33;
      v78 = -v34;
      v79 = -v37;
      if (v74 >= 0)
        v80 = v74;
      else
        v80 = -v74;
      v81 = v80 < 0x1000 && v49;
      if (v75 >= 0)
        v82 = v75;
      else
        v82 = -v75;
      if (v76 >= 0)
        v83 = v76;
      else
        v83 = -v76;
      if (v81 && v82 <= 0xFFF && v83 <= 0xFFF)
      {
        v84 = v74 * v77 + v75 * v78 + v76 * v79;
        if (!v84)
          goto LABEL_145;
        v85 = v75 * v37 + v76 * v78;
        if (v85 < 0)
          v85 = -v85;
        v86 = v74 * v79 + v76 * v33;
        if (v86 < 0)
          v86 = -v86;
        v87 = v74 * v34 + v75 * v77;
        if (v87 < 0)
          v87 = -v87;
        if (v85 < v86 || v85 < v87)
        {
          v88 = v85 + v86;
          v100 = v85 + v87;
          if (v86 < v87)
          {
            v85 = v87;
          }
          else
          {
            v88 = v100;
            v85 = v86;
          }
        }
        else
        {
          v88 = v86 + v87;
        }
        v101 = v85 + (v88 >> 2);
        if (v84 < 0)
          LODWORD(v89) = -16 * v84 / (v101 - v84) + 16;
        else
          LODWORD(v89) = 16 * v101 / (v101 + v84);
      }
      else
      {
        v89 = v75 * (uint64_t)v78 + v74 * (uint64_t)v77 + v76 * (uint64_t)v79;
        if (!v89)
        {
LABEL_145:
          LODWORD(v89) = 16;
          goto LABEL_153;
        }
        v90 = -v33;
        v91 = v76 * (uint64_t)v78 - v75 * (uint64_t)v79;
        if (v91 < 0)
          v91 = v75 * (uint64_t)v79 - v76 * (uint64_t)v78;
        v92 = v74 * (uint64_t)v79 - v76 * (uint64_t)v90;
        if (v92 < 0)
          v92 = -v92;
        v93 = v75 * (uint64_t)v90 - v74 * (uint64_t)v78;
        if (v93 < 0)
          v93 = -v93;
        v94 = v91 + v92;
        if (v92 < (unint64_t)v93)
        {
          v95 = v93;
        }
        else
        {
          v94 = v91 + v93;
          v95 = v92;
        }
        v96 = v91 >= (unint64_t)v92 && v91 >= (unint64_t)v93;
        if (v96)
          v97 = v92 + v93;
        else
          v97 = v94;
        if (v96)
          v98 = v91;
        else
          v98 = v95;
        v99 = v98 + (v97 >> 2);
        if (v89 < 0)
          LODWORD(v89) = -16 * v89 / (uint64_t)(v99 - v89) + 16;
        else
          v89 = (uint64_t)(16 * v99) / (uint64_t)(v99 + v89);
      }
LABEL_153:
      v102 = *(_QWORD *)(a1 + 1472);
      v103 = 12 * v24;
      *(_DWORD *)(v102 + v103) += v63;
      v104 = 12 * v23;
      v105 = *(_DWORD *)(v102 + v104) + v89;
      *(_DWORD *)(v102 + v104) = v105;
      if ((*(_DWORD *)(v102 + v103) & 0x80000000) != 0 || v105 < 0)
        goto LABEL_177;
LABEL_155:
      ++v22;
      if (!--v21)
        goto LABEL_156;
    }
  }
  v113 = 0;
  v114 = 0;
LABEL_171:
  v115 = *(_DWORD *)(a1 + 1120) == v114 && (_DWORD)v3 == v113;
  if (!v115 || *(_DWORD *)(a1 + 1124) != v121)
LABEL_177:
    *(_DWORD *)(a1 + 4384) = 3;
}

void sub_23CCB5C70(uint64_t a1, int32x2_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  unsigned int v14;
  int v15;
  int32x2_t v16;
  int v17;
  int v18;
  _BOOL4 v19;
  _BOOL4 v20;
  BOOL v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;

  v3 = *(unsigned int *)(a1 + 1116);
  v24 = 0;
  v25 = 0;
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = 0;
    LODWORD(v7) = -1;
    while (1)
    {
      if (v5 == v4)
      {
        v8 = v4 + 1;
        v26 = v4 + 1;
        if (*(_BYTE *)(a1 + 1156))
          v9 = -1;
        else
          v9 = v7;
        *(_DWORD *)(*(_QWORD *)(a1 + 1256) + 12 * v5) = v9;
        a2 = sub_23CCBA1DC(a1, v5, a2);
        if ((int)v6 <= v4)
        {
          v6 = (int)v6;
          while (1)
          {
            v7 = v6;
            v10 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v6);
            v11 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v6 + 4);
            v12 = v10 != -1;
            v13 = v11 == v10 && v10 != -1;
            v14 = (v12 | (2 * (v11 != -1))) + v13;
            if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 2 * v14 + 3296)))
              break;
LABEL_24:
            ++v6;
            if (v7 + 1 >= v8)
            {
              v4 = v8;
              goto LABEL_9;
            }
          }
          while (1)
          {
            v23 = 0;
            v15 = sub_23CCBABFC(a1, v6, v14, &v23, &v26, &v25, &v24);
            if (v15 < 0)
              break;
            if (*(_DWORD *)(a1 + 4384))
              break;
            sub_23CCBA9AC(a1, v23, v15, v16);
            if (*(_DWORD *)(a1 + 4384))
              break;
            v17 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v6);
            v18 = *(_DWORD *)(*(_QWORD *)(a1 + 1448) + 16 * v6 + 4);
            v19 = v17 != -1;
            v20 = v18 == v17 && v17 != -1;
            v14 = (v19 | (2 * (v18 != -1))) + v20;
            if (!sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3306)))
            {
              v8 = v26;
              goto LABEL_24;
            }
          }
          return;
        }
        ++v4;
      }
LABEL_9:
      if (++v5 == v3)
      {
        v22 = v25;
        LODWORD(v3) = *(_DWORD *)(a1 + 1116);
        goto LABEL_27;
      }
    }
  }
  v4 = 0;
  v22 = 0;
LABEL_27:
  v21 = *(_DWORD *)(a1 + 1120) == v22 && (_DWORD)v3 == v4;
  if (!v21 || *(_DWORD *)(a1 + 1124) != v24)
    *(_DWORD *)(a1 + 4384) = 3;
}

uint64_t sub_23CCB5E4C(uint64_t result, _DWORD *a2)
{
  unsigned int *v2;
  uint64_t v3;
  int v5;
  int v6;
  _BOOL4 v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  _WORD __b[64];
  uint64_t v40;

  v2 = (unsigned int *)result;
  v40 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned int *)(result + 1120);
  if ((int)v3 <= 0)
  {
    *(_DWORD *)(result + 4384) = 3;
  }
  else if (*(_BYTE *)(result + 1144))
  {
    v38 = 0x8000;
    v37 = 0x8000;
    memset_pattern16(__b, &unk_23CCD46A0, 0x80uLL);
    v5 = 0;
    v36 = 0x8000;
    v6 = 6;
    do
    {
      result = sub_23CCB7064(v2, &v38);
      if ((_DWORD)result)
      {
        v7 = sub_23CCB7064(v2, &v37);
        if (sub_23CCB7064(v2, __b))
          v8 = 32;
        else
          v8 = 0;
        if (sub_23CCB7064(v2, &__b[(v8 >> 5) + 1]))
          v9 = 16;
        else
          v9 = 0;
        v10 = v9 | v8;
        if (sub_23CCB7064(v2, &__b[(v10 >> 4) + 3]))
          v11 = 8;
        else
          v11 = 0;
        v12 = v10 | v11;
        if (sub_23CCB7064(v2, &__b[(v12 >> 3) + 7]))
          v13 = 4;
        else
          v13 = 0;
        v14 = v12 | v13;
        if (sub_23CCB7064(v2, &__b[(v14 >> 2) + 15]))
          v15 = 2;
        else
          v15 = 0;
        v16 = v14 | v15;
        result = sub_23CCB7064(v2, &__b[(v16 >> 1) + 31]);
        v17 = v16 | result;
        if ((v16 | result) == 0x3F)
        {
          result = sub_23CCB7154(v2, v6, &v36);
          v17 = result + 63;
          v18 = -63 - result;
          if ((int)result >= -63)
            v18 = result + 63;
          v19 = v18 >> v6;
          if (!v6 || v19)
          {
            if (v19 > 1)
              ++v6;
          }
          else
          {
            --v6;
          }
        }
        if (v7)
          v20 = v17 + 1;
        else
          v20 = ~v17;
      }
      else
      {
        v20 = 0;
      }
      v5 += v20;
      *a2++ = v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    v38 = 0x8000;
    v37 = 0x8000;
    memset_pattern16(__b, &unk_23CCD46A0, 0x80uLL);
    v21 = 0;
    v36 = 0x8000;
    do
    {
      result = sub_23CCB7064(v2, &v38);
      if ((_DWORD)result)
      {
        v22 = sub_23CCB7064(v2, &v37);
        v23 = sub_23CCB7064(v2, __b);
        if (v23)
          v24 = 2;
        else
          v24 = 1;
        if (sub_23CCB7064(v2, &__b[v24]))
          v25 = 2;
        else
          v25 = 0;
        v26 = v25 | v23;
        if (sub_23CCB7064(v2, &__b[v26 + 3]))
          v27 = 4;
        else
          v27 = 0;
        v28 = v26 | v27;
        if (sub_23CCB7064(v2, &__b[v28 + 7]))
          v29 = 8;
        else
          v29 = 0;
        v30 = v28 | v29;
        if (sub_23CCB7064(v2, &__b[v30 + 15]))
          v31 = 16;
        else
          v31 = 0;
        v32 = v30 | v31;
        result = sub_23CCB7064(v2, &__b[v32 + 31]);
        if ((_DWORD)result)
          v33 = 32;
        else
          v33 = 0;
        v34 = v32 | v33;
        if (v34 == 63)
        {
          result = sub_23CCB7154(v2, 6, &v36);
          v34 = result + 63;
        }
        if (v22)
          v35 = v34 + 1;
        else
          v35 = ~v34;
      }
      else
      {
        v35 = 0;
      }
      v21 += v35;
      *a2++ = v21;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_23CCB61A0(uint64_t a1, int *a2)
{
  unint64_t v3;
  unint64_t v4;
  int *v7;
  int *v8;
  int v9;
  int v10;
  int *v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;
  uint64_t result;
  int v21;
  uint64_t *v22;
  int *v23;
  int *v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  _DWORD *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  _DWORD *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  int *v49;
  _DWORD *v50;
  _DWORD *v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int *v59;
  void *__p[3];
  void *v61[2];
  uint64_t v62;
  void *v63[3];
  void *v64[3];

  v3 = *(unsigned int *)(a1 + 1120);
  v4 = *(unsigned int *)(a1 + 1124);
  if ((int)v4 < 3 || (int)v3 <= 0)
    goto LABEL_41;
  v7 = a2;
  v8 = a2;
  if ((_DWORD)v3 == 1)
    goto LABEL_38;
  v8 = a2 + 1;
  v9 = a2[1];
  v10 = *a2;
  if (v9 >= *a2)
    v7 = a2;
  else
    v7 = a2 + 1;
  if (v9 < v10)
    v8 = a2;
  if ((_DWORD)v3 == 2)
    goto LABEL_38;
  v11 = a2 + 2;
  if (v9 <= v10)
    v12 = *a2;
  else
    v12 = a2[1];
  if (v9 < v10)
    v10 = a2[1];
  v13 = 4 * v3 - 12;
  while (v13)
  {
    v15 = *v11;
    v14 = v11[1];
    if (v14 >= *v11)
    {
      if (v15 < v10)
      {
        v10 = *v11;
        v7 = v11;
      }
      v16 = v14 < v12;
      if (v14 > v12)
        v12 = v11[1];
      if (!v16)
        v8 = v11 + 1;
    }
    else
    {
      v10 = *v7;
      if (v14 < *v7)
      {
        v10 = v11[1];
        v7 = v11 + 1;
      }
      v12 = *v8;
      if (v15 > *v8)
        v12 = *v11;
      if (v15 >= *v8)
        v8 = v11;
    }
    v11 += 2;
    v13 -= 8;
    if (v13 == -4)
      goto LABEL_38;
  }
  v17 = *v11;
  if (*v11 >= *v7)
  {
    if (v17 >= *v8)
      v8 = v11;
LABEL_38:
    v17 = *v7;
  }
  if (v17 < 0 || (v18 = *v8, v19 = v18 - v17, v18 - v17 > (int)v3))
  {
LABEL_41:
    result = 3;
    *(_DWORD *)(a1 + 4384) = 3;
    return result;
  }
  v21 = v19 + 2;
  *(_DWORD *)(a1 + 1076) = v17;
  *(_DWORD *)(a1 + 1072) = v18;
  v22 = (uint64_t *)(a1 + 1232);
  sub_23CCB659C(a1 + 1232, 0);
  LODWORD(v64[0]) = 0;
  sub_23CCBA1AC(a1 + 1232, v19 + 2, v64);
  v23 = *(int **)(a1 + 1232);
  v24 = a2;
  v25 = v3;
  do
  {
    v26 = *v24++;
    ++v23[v26 - v17 + 1];
    --v25;
  }
  while (v25);
  if ((v19 & 0x80000000) == 0)
  {
    if (v21 <= 2)
      v27 = 2;
    else
      v27 = v21;
    v30 = *v23;
    v28 = v23 + 1;
    v29 = v30;
    v31 = v27 - 1;
    do
    {
      v29 += *v28;
      *v28++ = v29;
      --v31;
    }
    while (v31);
  }
  sub_23CCC15A0(v64, v3);
  LODWORD(v61[0]) = 0;
  sub_23CCC14E0(v63, (int)v3 + 1, v61);
  v32 = 0;
  v33 = *(_QWORD *)(a1 + 1232);
  v34 = v64[0];
  v35 = *(_QWORD *)(a1 + 1208);
  v36 = v63[0];
  do
  {
    v37 = a2[v32] - v17;
    v38 = *(int *)(v33 + 4 * v37);
    *(_DWORD *)(v33 + 4 * v37) = v38 + 1;
    v34[v38] = v32;
    v36[v32 + 1] = *(_DWORD *)(v35 + 4 * v32 + 4) - *(_DWORD *)(v35 + 4 * v32) + v36[v32];
    ++v32;
  }
  while (v3 != v32);
  sub_23CCC15A0(v61, v4);
  sub_23CCC15A0(__p, v3);
  v39 = 0;
  v40 = 0;
  do
  {
    v41 = *((int *)v64[0] + v39);
    v42 = 4 * v41 + 4;
    v43 = *(_DWORD *)(*(_QWORD *)(a1 + 1208) + v42) - *(_DWORD *)(*(_QWORD *)(a1 + 1208) + 4 * v41);
    v44 = *((int *)v63[0] + v41);
    v45 = *(int *)((char *)v63[0] + v42);
    *((_DWORD *)__p[0] + v39) = v43;
    if ((_DWORD)v45 != (_DWORD)v44)
      memmove((char *)v61[0] + 4 * v40, (const void *)(*(_QWORD *)(a1 + 1184) + 4 * v44), 4 * v45 - 4 * v44);
    v40 += v43;
    ++v39;
  }
  while (v3 != v39);
  v46 = 0;
  v47 = *(_OWORD *)(a1 + 1184);
  *(_OWORD *)(a1 + 1184) = *(_OWORD *)v61;
  *(_OWORD *)v61 = v47;
  v48 = *(_QWORD *)(a1 + 1200);
  *(_QWORD *)(a1 + 1200) = v62;
  v62 = v48;
  v49 = *(int **)(a1 + 1208);
  v50 = __p[0];
  v53 = *v49;
  v51 = v49 + 1;
  v52 = v53;
  do
  {
    v52 += v50[v46];
    v51[v46++] = v52;
  }
  while (v3 != v46);
  if (v19 < 0)
    goto LABEL_65;
  v54 = 0;
  v55 = 0;
  v56 = *v22;
  do
  {
    v57 = *(_DWORD *)(v56 + 4 * v54);
    if (v55 < v57)
    {
      v58 = v57 - (uint64_t)v55;
      v59 = &a2[v55];
      do
      {
        *v59++ = v17 + v54;
        --v58;
      }
      while (v58);
    }
    *(_DWORD *)(v56 + 4 * v54++) = v55;
    v55 = v57;
  }
  while (v54 != v19 + 1);
  if (v50)
  {
LABEL_65:
    __p[1] = v50;
    operator delete(v50);
  }
  if (v61[0])
  {
    v61[1] = v61[0];
    operator delete(v61[0]);
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v64[0])
  {
    v64[1] = v64[0];
    operator delete(v64[0]);
  }
  return 0;
}

void sub_23CCB6550(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  if (a20)
    operator delete(a20);
  _Unwind_Resume(exception_object);
}

void sub_23CCB659C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_23CCC12C8((char **)a1, a2 - v2);
  }
}

uint64_t sub_23CCB65CC(uint64_t a1, unint64_t a2, unint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v13;
  unsigned int *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  int **v22;
  uint64_t i;
  BOOL v24;
  unsigned int v25;
  uint64_t v26;
  int *v27;
  int v28;
  unsigned __int8 v29;
  int *v30;
  char v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  char *v36;
  int v37;
  int v38;
  int *v39;
  _DWORD *v40;
  uint64_t v41;
  int v42;
  int **v43;
  unint64_t v44;

  result = 5;
  if (a2 && a5)
  {
    if (*(_DWORD *)(a1 + 4384))
      return 6;
    v14 = (unsigned int *)sub_23CCB68BC(a2, a3, a1 + 3992);
    result = 3;
    if (v14)
    {
      if ((v13 & 0x8000000000000000) == 0)
      {
        v15 = *(unsigned int *)(a1 + 4000);
        if ((uint64_t)(a3 - v15) >= 0 && (unint64_t)v14 + v13 >= a2)
        {
          v16 = a2 + v15;
          if (a2 + v15 >= (unint64_t)v14)
          {
            v17 = v16 - (_QWORD)v14;
            if (v16 - (uint64_t)v14 >= 0 && !*(_DWORD *)(a1 + 4028))
            {
              if (*(_BYTE *)(a1 + 3996))
                return 4;
              v18 = *(unsigned __int8 *)(a1 + 3997);
              result = 4;
              if (v18 <= 8 && ((1 << v18) & 0x160) != 0)
              {
                if (a3 < v15)
                  return 3;
                v19 = *(_DWORD *)(a1 + 1116);
                if (*(_DWORD *)(a1 + 4004) != v19 || !a6 && *(_DWORD *)(a1 + 4032))
                  return 3;
                v20 = *(unsigned int *)(a1 + 4008);
                v44 = *(int *)(a1 + 4008);
                if ((*(_DWORD *)(a1 + 4048) - 5) >= 2)
                {
                  v21 = *(_DWORD *)(a1 + 4020);
                }
                else
                {
                  if ((_DWORD)v20 != 2)
                    return 3;
                  v21 = *(_DWORD *)(a1 + 4020);
                  if (!v21)
                    return 3;
                }
                if (v21 > 0x1B)
                  return 3;
                v43 = (int **)(a1 + 3920);
                v22 = (int **)(a1 + 3944);
                sub_23CCB659C(a1 + 3944, v44);
                if ((int)v20 < 1)
                {
                  sub_23CCB659C((uint64_t)v43, v44);
                  v29 = 0;
                }
                else
                {
                  for (i = 0; i != v20; ++i)
                  {
                    v24 = v17 < 4;
                    v17 -= 4;
                    if (v24)
                    {
                      v17 = 0;
                      v14 = 0;
                    }
                    else
                    {
                      v25 = *v14++;
                      (*v22)[i] = v25;
                    }
                  }
                  sub_23CCB659C((uint64_t)v43, v44);
                  v26 = 0;
                  result = 3;
                  do
                  {
                    while (!v17)
                    {
                      v14 = 0;
                      if (++v26 == v20)
                        return result;
                    }
                    v27 = *v43;
                    --v17;
                    v28 = *(unsigned __int8 *)v14;
                    v14 = (unsigned int *)((char *)v14 + 1);
                    (*v43)[v26++] = v28;
                  }
                  while (v26 != v20);
                  if (!v14)
                    return 3;
                  v29 = 0;
                  v30 = *v22;
                  v31 = 1;
                  v32 = v20;
                  do
                  {
                    v33 = *v30++;
                    v29 |= v33 != 0;
                    v34 = *v27++;
                    v31 &= v34 < 29;
                    --v32;
                  }
                  while (v32);
                  if ((v31 & 1) == 0)
                    return 3;
                }
                v36 = sub_23CCB4CE0(a1, v14, v17);
                result = 3;
                if (v36)
                {
                  if ((v35 & 0x8000000000000000) == 0)
                  {
                    result = sub_23CCB6A10(a1, a5, a6);
                    if (!(_DWORD)result)
                    {
                      if ((v29 & (v19 > 0)) == 1)
                      {
                        v37 = 0;
                        v38 = 0;
                        do
                        {
                          if ((int)v20 >= 1)
                          {
                            v39 = *v22;
                            v40 = (_DWORD *)(a5 + 4 * v37);
                            v37 += v44;
                            v41 = v20;
                            do
                            {
                              v42 = *v39++;
                              *v40++ += v42;
                              --v41;
                            }
                            while (v41);
                          }
                          ++v38;
                        }
                        while (v38 != v19);
                      }
                      result = 0;
                      *a4 = *(unsigned int *)(a1 + 4000);
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
  return result;
}

uint64_t sub_23CCB68BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  char v8;
  char v9;
  __int16 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;

  if (a2 < 4)
    return 0;
  v3 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || a2 == 8
    || a2 == 9
    || (a2 & 0xFFFFFFFFFFFFFFFELL) == 0xA
    || v3 == 12
    || v3 == 16
    || a2 == 20
    || a2 == 21
    || a2 == 22
    || a2 == 23
    || a2 == 24
    || a2 == 25
    || a2 == 26
    || a2 == 27
    || v3 == 28)
  {
    return 0;
  }
  v6 = a1 + 32;
  if (a1 == -32)
    return 0;
  v4 = 0;
  if (*(_DWORD *)a1 == -290009985)
  {
    v7 = *(_DWORD *)(a1 + 4);
    v8 = *(_BYTE *)(a1 + 8);
    v9 = *(_BYTE *)(a1 + 9);
    v10 = *(_WORD *)(a1 + 10);
    v11 = *(_DWORD *)(a1 + 12);
    v12 = *(_DWORD *)(a1 + 16) & 0x7FFFFFFF;
    v13 = *(unsigned __int8 *)(a1 + 20);
    v14 = *(unsigned __int8 *)(a1 + 21);
    v15 = *(unsigned __int8 *)(a1 + 22);
    v16 = *(_BYTE *)(a1 + 23);
    v17 = *(unsigned __int8 *)(a1 + 24);
    v18 = *(unsigned __int8 *)(a1 + 25);
    v19 = *(unsigned __int8 *)(a1 + 26);
    v20 = *(unsigned __int8 *)(a1 + 27);
    v21 = *(_DWORD *)(a1 + 28) & 0x7FFFFFFF;
    *(_DWORD *)a3 = 0;
    *(_BYTE *)(a3 + 4) = v8;
    *(_BYTE *)(a3 + 5) = v9;
    *(_WORD *)(a3 + 6) = v10;
    *(_DWORD *)(a3 + 8) = v11;
    *(_DWORD *)(a3 + 12) = v12;
    *(_DWORD *)(a3 + 16) = v15;
    *(_DWORD *)(a3 + 20) = v21;
    *(_DWORD *)(a3 + 24) = v14;
    *(_DWORD *)(a3 + 28) = v20;
    *(_DWORD *)(a3 + 32) = v13;
    *(_DWORD *)(a3 + 36) = v18 & 0xF;
    *(_DWORD *)(a3 + 40) = v19;
    *(_DWORD *)(a3 + 44) = v18 >> 4;
    *(_DWORD *)(a3 + 48) = v7;
    *(_BYTE *)(a3 + 52) = v16;
    v4 = v6;
    *(_DWORD *)(a3 + 56) = v17;
  }
  return v4;
}

uint64_t sub_23CCB6A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  _WORD __b[2];

  if (*(_DWORD *)(a1 + 4032) == 1)
  {
    memset_pattern16(__b, &unk_23CCD46A0, 4uLL);
    if (*(int *)(a1 + 4004) >= 1)
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v8 = (int *)(*(_QWORD *)(a1 + 1256) + v6);
        v9 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v12 = (int *)(*(_QWORD *)(a1 + 1280) + v6);
        v13 = v12[2];
        if ((_DWORD)v13 != -1)
        {
          v14 = *(unsigned __int8 *)(a3 + v10)
              + *(unsigned __int8 *)(a3 + v9)
              + *(unsigned __int8 *)(a3 + v11)
              + *(unsigned __int8 *)(a3 + *v12)
              + *(unsigned __int8 *)(a3 + v12[1])
              + *(unsigned __int8 *)(a3 + v13) > 2;
          goto LABEL_8;
        }
        if ((_DWORD)v11 != -1)
        {
          v14 = *(unsigned __int8 *)(a3 + v10)
              + *(unsigned __int8 *)(a3 + v9)
              + *(unsigned __int8 *)(a3 + v11) > 1;
LABEL_8:
          v15 = v14;
          goto LABEL_11;
        }
        if ((_DWORD)v10 == -1)
          break;
        v15 = *(unsigned __int8 *)(a3 + v9);
        if (v15)
        {
          v16 = *(unsigned __int8 *)(a3 + v10);
LABEL_18:
          v15 = v16 != 0;
        }
LABEL_11:
        *(_BYTE *)(a3 + v7++) = sub_23CCB7064((unsigned int *)a1, &__b[v15]);
        v6 += 12;
        if (v7 >= *(int *)(a1 + 4004))
          goto LABEL_20;
      }
      if ((_DWORD)v9 == -1)
      {
        v15 = 0;
        goto LABEL_11;
      }
      v16 = *(unsigned __int8 *)(a3 + v9);
      goto LABEL_18;
    }
  }
LABEL_20:
  v17 = *(unsigned int *)(a1 + 4048);
  if (v17 > 6)
    return 3;
  ((void (*)(uint64_t, uint64_t, uint64_t))off_250DE42F8[2 * v17])(a1, a2, a3);
  return 0;
}

void sub_23CCB6B9C(unsigned int *a1, uint64_t a2, int a3, _QWORD *a4, _BYTE *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  _WORD *v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  _DWORD *v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  _WORD *v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  char *v63;
  uint64_t v64;
  int v68;
  void *__p[3];

  v68 = 0;
  sub_23CCC14E0(__p, a3, &v68);
  switch(*a5)
  {
    case 0:
      if (a3 < 1)
        goto LABEL_90;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = (unint64_t)a3 << 6;
      do
      {
        if (sub_23CCB7064(a1, (_WORD *)(*a6 + v11)))
        {
          v15 = sub_23CCB7064(a1, (_WORD *)(a6[3] + v11));
          v16 = (_WORD *)(a6[6] + 2 * (int)v13);
          v17 = sub_23CCB7064(a1, v16);
          if (v17)
            v18 = 2;
          else
            v18 = 1;
          if (sub_23CCB7064(a1, &v16[v18]))
            v19 = 2;
          else
            v19 = 0;
          v20 = v19 | v17;
          if (sub_23CCB7064(a1, &v16[(v19 | v17) + 3]))
            v21 = 4;
          else
            v21 = 0;
          v22 = v20 | v21;
          if (sub_23CCB7064(a1, &v16[v22 + 7]))
            v23 = 8;
          else
            v23 = 0;
          v24 = v22 | v23;
          if (sub_23CCB7064(a1, &v16[v24 + 15]))
            v25 = 16;
          else
            v25 = 0;
          v26 = v24 | v25;
          if (sub_23CCB7064(a1, &v16[v26 + 31]))
            v27 = 32;
          else
            v27 = 0;
          v28 = v26 | v27;
          if (v28 == 63)
            v28 = sub_23CCB7154(a1, *(_DWORD *)(a6[12] + v12), (_WORD *)(a6[9] + v11)) + 63;
          if (v15)
            v29 = v28 + 1;
          else
            v29 = ~v28;
          v14 = (unint64_t)a3 << 6;
        }
        else
        {
          v29 = 0;
        }
        *(_DWORD *)((char *)__p[0] + v12) = v29;
        v13 += 64;
        v12 += 4;
        v11 += 2;
      }
      while (v14 != v13);
      goto LABEL_86;
    case 2:
      if (a3 < 1)
        goto LABEL_90;
      v30 = 0;
      v31 = 0;
      do
      {
        v32 = a6[12];
        v33 = sub_23CCB7218(a1, *(_DWORD *)(v32 + v30), (_WORD *)(a6[3] + v31), (_WORD *)(a6[9] + v31));
        if (v33 >= 0)
          v34 = v33;
        else
          v34 = -v33;
        v35 = *(_DWORD *)(v32 + v30);
        v36 = v34 >> v35;
        if (v35)
          v37 = v36 == 0;
        else
          v37 = 0;
        if (v37)
        {
          v38 = -1;
        }
        else
        {
          if (v36 < 2)
            goto LABEL_45;
          v38 = 1;
        }
        *(_DWORD *)(v32 + v30) = v38 + v35;
LABEL_45:
        *(_DWORD *)((char *)__p[0] + v30) = v33;
        v31 += 2;
        v30 += 4;
      }
      while (2 * a3 != v31);
LABEL_86:
      v63 = (char *)__p[0];
      if (a3 < 1)
        goto LABEL_91;
      v64 = 0;
      do
      {
        *(_DWORD *)(a7 + v64) = *(_DWORD *)&v63[v64] + *(_DWORD *)(a2 + v64);
        v64 += 4;
      }
      while (4 * a3 != v64);
LABEL_92:
      __p[1] = v63;
      operator delete(v63);
      return;
    case 3:
      if (a3 < 1)
        goto LABEL_90;
      v39 = 0;
      v40 = __p[0];
      do
      {
        v41 = *(_DWORD *)(*a4 + 4 * v39);
        if (v41 < 1)
        {
          v43 = 0;
        }
        else
        {
          v42 = 0;
          v43 = 0;
          do
          {
            LOWORD(v68) = 0x8000;
            v43 += sub_23CCB7064(a1, &v68) << v42++;
          }
          while (v41 != v42);
        }
        v40[v39++] = v43;
      }
      while (v39 != a3);
      goto LABEL_86;
    case 4:
      if (a3 < 1)
      {
LABEL_90:
        v63 = (char *)__p[0];
LABEL_91:
        if (v63)
          goto LABEL_92;
        return;
      }
      v44 = 0;
      v45 = 0;
      v46 = 0;
      break;
    default:
      goto LABEL_86;
  }
  while (!sub_23CCB7064(a1, (_WORD *)(*a6 + v44)))
  {
    v62 = 0;
LABEL_85:
    *(_DWORD *)((char *)__p[0] + v45) = v62;
    v46 += 64;
    v45 += 4;
    v44 += 2;
    if ((unint64_t)a3 << 6 == v46)
      goto LABEL_86;
  }
  v47 = sub_23CCB7064(a1, (_WORD *)(a6[3] + v44));
  v48 = (_WORD *)(a6[6] + 2 * (int)v46);
  if (sub_23CCB7064(a1, v48))
    v49 = 32;
  else
    v49 = 0;
  if (sub_23CCB7064(a1, &v48[(v49 >> 5) + 1]))
    v50 = 16;
  else
    v50 = 0;
  v51 = v50 | v49;
  if (sub_23CCB7064(a1, &v48[(v51 >> 4) + 3]))
    v52 = 8;
  else
    v52 = 0;
  v53 = v51 | v52;
  if (sub_23CCB7064(a1, &v48[(v53 >> 3) + 7]))
    v54 = 4;
  else
    v54 = 0;
  v55 = v53 | v54;
  if (sub_23CCB7064(a1, &v48[(v55 >> 2) + 15]))
    v56 = 2;
  else
    v56 = 0;
  v57 = v55 | v56 | sub_23CCB7064(a1, &v48[((v55 | v56) >> 1) + 31]);
  if (v57 == 63)
  {
    v58 = a6[12];
    v57 = sub_23CCB7154(a1, *(_DWORD *)(v58 + v45), (_WORD *)(a6[9] + v44)) + 63;
    v59 = *(_DWORD *)(v58 + v45);
    v60 = v57 >> v59;
    if (!v59 || v60)
    {
      if (v60 < 2)
        goto LABEL_82;
      v61 = 1;
    }
    else
    {
      v61 = -1;
    }
    *(_DWORD *)(v58 + v45) = v61 + v59;
  }
LABEL_82:
  if (v47)
    v62 = v57 + 1;
  else
    v62 = ~v57;
  goto LABEL_85;
}

BOOL sub_23CCB7064(unsigned int *a1, _WORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL8 v15;
  unsigned int v16;

  v2 = (unsigned __int16)*a2;
  v3 = a1[7];
  v4 = a1[8];
  if (v3 > 0x40000000)
  {
    v11 = a1[7];
  }
  else
  {
    v5 = a1[10];
    do
    {
      v4 *= 2;
      a1[10] = --v5;
      if (!v5)
      {
        v6 = *((_QWORD *)a1 + 2);
        *((_QWORD *)a1 + 2) = v6 + 1;
        v7 = *a1;
        if (v6 + 1 >= v7)
          v8 = 65280;
        else
          v8 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v6 + 1) << 8;
        v9 = v6 + 2;
        *((_QWORD *)a1 + 2) = v9;
        if (v9 >= v7)
          v10 = 255;
        else
          v10 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v9);
        v4 |= v8 | v10;
        v5 = 16;
        a1[10] = 16;
      }
      v11 = 2 * v3;
      v12 = v3 >= 0x20000001;
      v3 *= 2;
    }
    while (!v12);
  }
  v13 = (HIWORD(v11) * v2) & 0xFFFF0000;
  v14 = v11 - v13;
  v15 = v4 >= v13;
  *a2 = *((_WORD *)a1 + ((v2 >> 7) & 0x1FE | v15) + 24) + v2;
  if (v4 < v13)
    v16 = v13;
  else
    v16 = v14;
  if (v4 < v13)
    v13 = 0;
  a1[7] = v16;
  a1[8] = v4 - v13;
  return v15;
}

uint64_t sub_23CCB7154(unsigned int *a1, int a2, _WORD *a3)
{
  int v6;
  int v7;
  int v9;
  int v10;
  __int16 v12;

  v6 = 0;
  if (sub_23CCB7064(a1, a3) && a2 <= 30)
  {
    v6 = 0;
    do
    {
      v7 = a2 + 1;
      v6 |= 1 << a2;
      if (!sub_23CCB7064(a1, a3))
        break;
    }
    while (a2++ < 30);
  }
  else
  {
    v7 = a2;
  }
  v9 = 0;
  if (v7)
  {
    v10 = v7 - 1;
    do
    {
      v12 = 0x8000;
      v9 |= sub_23CCB7064(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t sub_23CCB7218(unsigned int *a1, int a2, _WORD *a3, _WORD *a4)
{
  uint64_t result;
  unsigned int v7;

  result = sub_23CCB7154(a1, a2, a4);
  if ((_DWORD)result)
  {
    v7 = result;
    if (sub_23CCB7064(a1, a3))
      return v7;
    else
      return -v7;
  }
  return result;
}

void sub_23CCB7264(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int *v10;
  int32x2_t v11;
  _BYTE *v12;
  int32x2_t *v13;
  int32x2_t v14;
  int v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int32x2_t v22;
  int32x2_t v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  int v27;
  double v28;
  int32x2_t v29;
  int32x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  int v35;
  int32x2_t v36;
  int32x2_t v37;
  int v38;
  _BOOL4 v39;
  uint64_t v40;
  int v41;
  int v42;
  int32x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  int32x2_t v46;
  int v47;
  int32x2_t v48;
  int32x2_t v49;
  int v50;
  unsigned int v51;
  uint32x2_t v52;
  int v53;
  int32x2_t v54;
  _BOOL4 v55;
  double v56;
  int32x2_t v57;
  int32x2_t v58;
  int32x2_t v59;
  int32x2_t v60;
  int v61;
  int32x2_t v62;
  int32x2_t v63;
  int v64;
  int32x2_t v65;
  int32x2_t v66;
  int32x2_t v67;
  int32x2_t v68;
  int v69;
  int32x2_t v70;
  int32x2_t v71;
  int v72;
  double v73;
  int32x2_t v74;
  __int32 v75;
  int8x8_t v76;
  __int32 v77;
  double v78;
  int v79;
  double v80;
  int32x2_t v81;
  __int32 v82;
  __int32 v83;
  double v84;
  int v85;
  int32x2_t v86;
  int32x2_t v87;
  int v88;
  int32x2_t v89;
  int32x2_t v90;
  int v91;
  int32x2_t v92;
  int32x2_t v93;
  uint32x2_t v94;
  BOOL v95;
  int v96;
  int32x2_t v97;
  int64x2_t v98;
  unint64_t v99;
  uint32x2_t v100;
  int v101;
  int64x2_t v102;
  int v103;
  int v104;
  int32x2_t v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  _BOOL4 v110;
  int v111;
  int v112;
  int *v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  unint64_t v129;
  char *v130;
  void *v131;
  void *v132;
  char *v133;
  void *v134;
  void *v135;
  void *v136;
  _QWORD *v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  _BYTE *v144;
  uint64_t v145;
  int32x2_t v146;
  int v148;
  uint64_t v150;
  int v151;
  int v152;
  _BYTE v153[4];
  int v154;
  int v155;
  int v156;
  _DWORD v157[2];
  __int16 v158;
  __int16 v159;
  _WORD v160[3];
  _WORD __b[3];
  _OWORD v162[22];
  uint64_t v163;
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)(a1 + 3920);
  v5 = *(unsigned int *)(a1 + 4004);
  v150 = *(int *)(a1 + 4008);
  v148 = ~(-1 << (*(_DWORD *)(a1 + 4020) - 1));
  sub_23CCBD068((_QWORD *)(a1 + 1160), (_QWORD *)(a1 + 1208), (_QWORD *)(a1 + 1184), (uint64_t *)(a1 + 1184), -1431655765 * ((*(_QWORD *)(a1 + 1168) - *(_QWORD *)(a1 + 1160)) >> 2), (uint64_t *)(a1 + 3968), v148);
  v6 = 0;
  v163 = 0;
  memset(v162, 0, sizeof(v162));
  do
  {
    sub_23CCB7FFC((uint64_t)v162 + v6, v150);
    v6 += 120;
  }
  while (v6 != 360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v160, &unk_23CCD46A0, 6uLL);
  v159 = 0x8000;
  v158 = 0x8000;
  v7 = v148;
  if ((int)v5 > 0)
  {
    v8 = 0;
    v9 = *(_DWORD *)(a1 + 4032);
    v142 = 2 * v148;
    v143 = v9;
    v145 = 12 * v5;
    v10 = (int *)(a2 + 4);
    v11 = vdup_n_s32(v148);
    v12 = a3;
    v144 = a3;
    v137 = v4;
    while (v9 && !*v12)
    {
LABEL_162:
      v8 += 12;
      v10 += v150;
      ++v12;
      if (v145 == v8)
        goto LABEL_163;
    }
    v13 = (int32x2_t *)(*(_QWORD *)(a1 + 3968) + v8);
    v14 = *v13;
    v15 = v13[1].i32[0];
    v16 = (int *)(*(_QWORD *)(a1 + 1256) + v8);
    v17 = *v16;
    v18 = v16[1];
    v19 = v16[2];
    v20 = (int *)(*(_QWORD *)(a1 + 1280) + v8);
    v21 = v20[2];
    v146 = v14;
    if ((_DWORD)v21 != -1 && (!v9 || a3[v17] && a3[v18] && a3[v19] && a3[*v20] && a3[v20[1]] && a3[v21]))
    {
      v138 = *v20;
      v139 = v20[1];
      v22 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      v23 = vabs_s32(vrev64_s32(v22));
      v140 = v7 - v23.i32[1] - v23.i32[0];
      if (v140 < 0)
        v22 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v22), (int8x8_t)vsub_s32(v23, v11), (int8x8_t)__PAIR64__(v7 - v23.i32[1], v7 - v23.i32[0]));
      v24 = sub_23CCB7064((unsigned int *)a1, v160);
      v25 = 2;
      if (!v24)
        v25 = 1;
      if (sub_23CCB7064((unsigned int *)a1, &v160[v25]))
        v26 = 2;
      else
        v26 = 0;
      v27 = v26 | v24;
      if (v27 == 2)
      {
        v59 = vsub_s32(*(int32x2_t *)(a2 + 4 * v138 * (int)v150), v11);
        v60 = vabs_s32(vrev64_s32(v59));
        v61 = v148 - v60.i32[1] - v60.i32[0];
        if (v61 < 0)
          v59 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v59), (int8x8_t)vsub_s32(v60, v11), (int8x8_t)__PAIR64__(v148 - v60.i32[1], v148 - v60.i32[0]));
        v4 = v137;
        v62 = vsub_s32(*(int32x2_t *)(a2 + 4 * v139 * (int)v150), v11);
        v63 = vabs_s32(vrev64_s32(v62));
        v64 = v148 - v63.i32[1] - v63.i32[0];
        if (v64 < 0)
          v62 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v62), (int8x8_t)vsub_s32(v63, v11), (int8x8_t)__PAIR64__(v148 - v63.i32[1], v148 - v63.i32[0]));
        v65 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v21 * (int)v150), v11);
        v66 = vabs_s32(vrev64_s32(v65));
        if (v148 - v66.i32[1] - v66.i32[0] < 0)
          v65 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v65), (int8x8_t)vsub_s32(v66, v11), (int8x8_t)__PAIR64__(v148 - v66.i32[1], v148 - v66.i32[0]));
        v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v62, v59), v65));
        v15 = v64 + v61 - (v148 - v66.i32[1] - v66.i32[0]);
      }
      else
      {
        v4 = v137;
        if (v27 == 1)
        {
          v67 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
          v68 = vabs_s32(vrev64_s32(v67));
          v69 = v148 - v68.i32[1] - v68.i32[0];
          if (v69 < 0)
            v67 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v67), (int8x8_t)vsub_s32(v68, v11), (int8x8_t)__PAIR64__(v148 - v68.i32[1], v148 - v68.i32[0]));
          v70 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11);
          v71 = vabs_s32(vrev64_s32(v70));
          v72 = v148 - v71.i32[1] - v71.i32[0];
          if (v72 < 0)
            v70 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v70), (int8x8_t)vsub_s32(v71, v11), (int8x8_t)__PAIR64__(v148 - v71.i32[1], v148 - v71.i32[0]));
          v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v67, v22), v70));
          v15 = v69 + v140 - v72;
        }
        else if (v27)
        {
          v73 = COERCE_DOUBLE(vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11));
          v74 = vabs_s32(vrev64_s32(*(int32x2_t *)&v73));
          v76 = (int8x8_t)vsub_s32(v74, v11);
          v77 = v74.i32[0];
          v74.i32[0] = v148 - v74.i32[0];
          v74.i32[1] = v148 - v74.i32[1];
          v75 = v74.i32[1];
          v78 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&v73), v76, (int8x8_t)v74));
          v79 = v75 - v77;
          if (v79 < 0)
            v73 = v78;
          v80 = COERCE_DOUBLE(vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11));
          v81 = vabs_s32(vrev64_s32(*(int32x2_t *)&v80));
          v82 = v148 - v81.i32[1];
          v83 = v81.i32[0];
          v84 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&v80), (int8x8_t)vsub_s32(v81, v11), (int8x8_t)__PAIR64__(v148 - v81.i32[1], v148 - v81.i32[0])));
          v85 = v82 - v83;
          if (v85 < 0)
            v80 = v84;
          v86 = vsub_s32(*(int32x2_t *)(a2 + 4 * v138 * (int)v150), v11);
          v87 = vabs_s32(vrev64_s32(v86));
          v88 = v148 - v87.i32[1] - v87.i32[0];
          if (v88 < 0)
            v86 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v86), (int8x8_t)vsub_s32(v87, v11), (int8x8_t)__PAIR64__(v148 - v87.i32[1], v148 - v87.i32[0]));
          v89 = vsub_s32(*(int32x2_t *)(a2 + 4 * v139 * (int)v150), v11);
          v90 = vabs_s32(vrev64_s32(v89));
          v91 = v148 - v90.i32[1] - v90.i32[0];
          if (v91 < 0)
            v89 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v89), (int8x8_t)vsub_s32(v90, v11), (int8x8_t)__PAIR64__(v148 - v90.i32[1], v148 - v90.i32[0]));
          v92 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v21 * (int)v150), v11);
          v93 = vabs_s32(vrev64_s32(v92));
          if (v148 - v93.i32[1] - v93.i32[0] < 0)
            v92 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v92), (int8x8_t)vsub_s32(v93, v11), (int8x8_t)__PAIR64__(v148 - v93.i32[1], v148 - v93.i32[0]));
          v94 = (uint32x2_t)vadd_s32(v86, v22);
          v95 = __OFADD__(v88, v140);
          v96 = v88 + v140;
          if (v96 < 0 != v95)
            ++v96;
          v97 = vadd_s32(v89, *(int32x2_t *)&v73);
          v98 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v97, v97), (int32x2_t)vsra_n_u32(v94, v94, 0x1FuLL), 1uLL), vadd_s32(*(int32x2_t *)&v80, v92)), vdup_n_s32(0x55555556u));
          v28 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v98, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v98, 0x3FuLL))));
          v99 = 1431655766 * ((v96 >> 1) + 2 * (v91 + v79) - (v85 + v148 - v93.i32[1] - v93.i32[0]));
          v15 = HIDWORD(v99) + (v99 >> 63);
        }
        else
        {
          v28 = *(double *)&v146;
          v29 = vzip1_s32(v22, v146);
          v30 = vzip2_s32(v22, v146);
          if (v29.i32[0] * (uint64_t)v29.i32[1] + v15 * (uint64_t)v140 + v30.i32[0] * (uint64_t)v30.i32[1] < 0)
          {
            v28 = COERCE_DOUBLE(vneg_s32(v146));
            v15 = -v15;
          }
        }
      }
      v51 = 2;
      goto LABEL_109;
    }
    if ((_DWORD)v19 != -1 && (!v9 || a3[v17] && a3[v18] && a3[v19]))
    {
      v31 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      v32 = vabs_s32(vrev64_s32(v31));
      v141 = v7 - v32.i32[1] - v32.i32[0];
      if (v141 < 0)
        v31 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v31), (int8x8_t)vsub_s32(v32, v11), (int8x8_t)__PAIR64__(v7 - v32.i32[1], v7 - v32.i32[0]));
      v33 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
      v34 = vabs_s32(vrev64_s32(v33));
      v35 = v7 - v34.i32[1] - v34.i32[0];
      if (v35 < 0)
        v33 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v33), (int8x8_t)vsub_s32(v34, v11), (int8x8_t)__PAIR64__(v7 - v34.i32[1], v7 - v34.i32[0]));
      v36 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11);
      v37 = vabs_s32(vrev64_s32(v36));
      v38 = v7 - v37.i32[1] - v37.i32[0];
      if (v38 < 0)
        v36 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v36), (int8x8_t)vsub_s32(v37, v11), (int8x8_t)__PAIR64__(v7 - v37.i32[1], v7 - v37.i32[0]));
      v39 = sub_23CCB7064((unsigned int *)a1, __b);
      v40 = 2;
      if (!v39)
        v40 = 1;
      if (sub_23CCB7064((unsigned int *)a1, &__b[v40]))
        v41 = 2;
      else
        v41 = 0;
      v42 = v41 | v39;
      if (v42 == 2)
      {
        v100 = (uint32x2_t)vsub_s32(v33, (int32x2_t)vmvn_s8((int8x8_t)v31));
        v28 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v100, v100, 0x1FuLL), 1uLL));
        if (v141 + v35 + 1 >= 0)
          v101 = v141 + v35 + 1;
        else
          v101 = v141 + v35 + 2;
        v15 = v101 >> 1;
        v51 = 1;
      }
      else
      {
        if (v42 == 1)
        {
          v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v33, v31), v36));
          v15 = v35 + v141 - v38;
        }
        else if (v42)
        {
          v102 = vmull_s32(vadd_s32(vsub_s32(v33, (int32x2_t)vmvn_s8((int8x8_t)v31)), v36), vdup_n_s32(0x55555556u));
          v28 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v102, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v102, 0x3FuLL))));
          v15 = (v141 + v35 + v38 + 1) / 3;
        }
        else
        {
          v28 = *(double *)&v146;
          v43 = vzip1_s32(v31, v146);
          v44 = vzip2_s32(v31, v146);
          if (v43.i32[0] * (uint64_t)v43.i32[1] + v15 * (uint64_t)v141 + v44.i32[0] * (uint64_t)v44.i32[1] < 0)
          {
            v28 = COERCE_DOUBLE(vneg_s32(v146));
            v15 = -v15;
          }
        }
        v51 = 1;
      }
      goto LABEL_109;
    }
    if ((_DWORD)v18 == -1 || v9 && (!a3[v17] || !a3[v18]))
    {
      if ((_DWORD)v17 == -1 || v9 && !a3[v17])
      {
        v55 = sub_23CCB7064((unsigned int *)a1, &v158);
        v28 = *(double *)&v146;
        v56 = COERCE_DOUBLE(vneg_s32(v146));
        if (v55)
          v15 = -v15;
        v51 = 0;
        if (v55)
          v28 = v56;
LABEL_109:
        v103 = LODWORD(v28);
        v155 = LODWORD(v28);
        v104 = HIDWORD(v28);
        v154 = HIDWORD(v28);
        v105 = vabs_s32(*(int32x2_t *)&v28);
        v106 = v105.u32[1];
        if (v15 >= 0)
          v107 = v15;
        else
          v107 = -v15;
        v108 = v105.i32[0];
        v110 = v105.i32[0] < (unsigned __int32)v105.i32[1] || v105.i32[0] < v107;
        if (v110)
        {
          v108 = v107;
          v111 = HIDWORD(v28);
          v112 = LODWORD(v28);
          if (v105.i32[1] < v107)
            goto LABEL_123;
          v113 = &v154;
          v108 = v105.u32[1];
          v111 = v15;
          v112 = LODWORD(v28);
        }
        else
        {
          v113 = &v155;
          v111 = HIDWORD(v28);
          v112 = v15;
        }
        *v113 = v15;
LABEL_123:
        v156 = v112;
        v157[0] = v111;
        v157[1] = v108;
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)&v156, v150, v4, (_BYTE *)(a1 + 4044), (_QWORD *)v162 + 15 * v51, (uint64_t)&v151);
        v115 = v151;
        v114 = v152;
        if (v151 >= 0)
          v116 = v151;
        else
          v116 = -v151;
        if (v152 >= 0)
          v117 = v152;
        else
          v117 = -v152;
        v7 = v148;
        v118 = v148 - v116;
        v119 = v148 - v116 - v117;
        if (v119 < 0)
        {
          v122 = v148 - v117;
          v123 = v117 - v148;
          if (v151 >= 0)
            v115 = v122;
          else
            v115 = v123;
          v7 = v148;
          v124 = v116 - v148;
          if (v152 >= 0)
            v114 = v118;
          else
            v114 = v124;
          if (v110)
            goto LABEL_131;
        }
        else if (v110)
        {
LABEL_131:
          if (v15 >= 0)
            v120 = v119;
          else
            v120 = -v119;
          if (v104 < 0)
            v119 = -v119;
          if (v106 >= v107)
            v121 = v114;
          else
            v121 = v120;
          if (v106 >= v107)
            v114 = v119;
          goto LABEL_151;
        }
        v121 = v115;
        if (v103 >= 0)
          v115 = v119;
        else
          v115 = -v119;
LABEL_151:
        a3 = v144;
        if (v114 >= 0)
          v125 = v114;
        else
          v125 = -v114;
        if (v115 < 0)
        {
          v126 = -v115;
        }
        else
        {
          v125 = v142 - v125;
          v126 = v115;
        }
        if (v114 >= 0)
          v126 = v142 - v126;
        v127 = v115 + v7;
        v128 = v114 + v7;
        if (v121 < 0)
        {
          v127 = v125;
          v128 = v126;
        }
        *(v10 - 1) = v127;
        *v10 = v128;
        v9 = v143;
        goto LABEL_162;
      }
      v45 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      v54 = vabs_s32(vrev64_s32(v45));
      v47 = v7 - v54.i32[1] - v54.i32[0];
      if (v47 < 0)
        v45 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v45), (int8x8_t)vsub_s32(v54, v11), (int8x8_t)__PAIR64__(v7 - v54.i32[1], v7 - v54.i32[0]));
      if (sub_23CCB7064((unsigned int *)a1, &v159))
      {
        v51 = 0;
        v15 = v47;
        v28 = *(double *)&v45;
        goto LABEL_109;
      }
    }
    else
    {
      v45 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      v46 = vabs_s32(vrev64_s32(v45));
      v47 = v7 - v46.i32[1] - v46.i32[0];
      if (v47 < 0)
        v45 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v45), (int8x8_t)vsub_s32(v46, v11), (int8x8_t)__PAIR64__(v7 - v46.i32[1], v7 - v46.i32[0]));
      v48 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
      v49 = vabs_s32(vrev64_s32(v48));
      v50 = v7 - v49.i32[1] - v49.i32[0];
      if (v50 < 0)
        v48 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v48), (int8x8_t)vsub_s32(v49, v11), (int8x8_t)__PAIR64__(v7 - v49.i32[1], v7 - v49.i32[0]));
      if (sub_23CCB7064((unsigned int *)a1, &v159))
      {
        v51 = 0;
        v52 = (uint32x2_t)vsub_s32(v48, (int32x2_t)vmvn_s8((int8x8_t)v45));
        v28 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v52, v52, 0x1FuLL), 1uLL));
        if (v47 + v50 + 1 >= 0)
          v53 = v47 + v50 + 1;
        else
          v53 = v47 + v50 + 2;
        v15 = v53 >> 1;
        goto LABEL_109;
      }
    }
    v28 = *(double *)&v146;
    v57 = vzip1_s32(v45, v146);
    v51 = 0;
    v58 = vzip2_s32(v45, v146);
    if (v57.i32[0] * (uint64_t)v57.i32[1] + v15 * (uint64_t)v47 + v58.i32[0] * (uint64_t)v58.i32[1] < 0)
    {
      v28 = COERCE_DOUBLE(vneg_s32(v146));
      v15 = -v15;
    }
    goto LABEL_109;
  }
LABEL_163:
  v129 = 360;
  do
  {
    v130 = (char *)v162 + v129;
    v131 = *(void **)&v157[v129 / 4];
    if (v131)
    {
      *((_QWORD *)v130 - 2) = v131;
      operator delete(v131);
    }
    v132 = (void *)*((_QWORD *)v130 - 6);
    if (v132)
    {
      *(_QWORD *)&v153[v129] = v132;
      operator delete(v132);
    }
    v133 = (char *)v162 + v129;
    v134 = *(void **)((char *)&v162[-4] + v129 - 8);
    if (v134)
    {
      *((_QWORD *)v133 - 8) = v134;
      operator delete(v134);
    }
    v135 = (void *)*((_QWORD *)v133 - 12);
    if (v135)
    {
      *(_QWORD *)((char *)&v162[-5] + v129 - 8) = v135;
      operator delete(v135);
    }
    v136 = (void *)*((_QWORD *)v130 - 15);
    if (v136)
    {
      *(_QWORD *)((char *)&v162[-7] + v129) = v136;
      operator delete(v136);
    }
    v129 -= 120;
  }
  while (v129);
}

void sub_23CCB7FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t i;

  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a31 + i));
  _Unwind_Resume(a1);
}

void sub_23CCB7FFC(uint64_t a1, int a2)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;

  v4 = a2;
  sub_23CCC0A08(a1, a2);
  sub_23CCC0A08(a1 + 24, v4);
  sub_23CCC0A08(a1 + 48, a2 << 6);
  sub_23CCC0A08(a1 + 72, v4);
  sub_23CCB659C(a1 + 96, v4);
  v5 = *(void **)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 104) - (_QWORD)v5;
  if (v6 >= 1)
    memset_pattern16(v5, &unk_23CCD4690, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  v7 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)a1 != v7)
    memset_pattern16(*(void **)a1, &unk_23CCD46A0, (v7 - *(_QWORD *)a1) & 0xFFFFFFFFFFFFFFFELL);
  v8 = *(_BYTE **)(a1 + 24);
  v9 = *(_BYTE **)(a1 + 32);
  if (v8 != v9)
    memset_pattern16(v8, &unk_23CCD46A0, (v9 - v8) & 0xFFFFFFFFFFFFFFFELL);
  v10 = *(_BYTE **)(a1 + 48);
  v11 = *(_BYTE **)(a1 + 56);
  if (v10 != v11)
    memset_pattern16(v10, &unk_23CCD46A0, (v11 - v10) & 0xFFFFFFFFFFFFFFFELL);
  v12 = *(_BYTE **)(a1 + 72);
  v13 = *(_BYTE **)(a1 + 80);
  if (v12 != v13)
    memset_pattern16(v12, &unk_23CCD46A0, (v13 - v12) & 0xFFFFFFFFFFFFFFFELL);
}

uint64_t sub_23CCB8124(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(_QWORD *)(a1 + 104) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 72);
  if (v3)
  {
    *(_QWORD *)(a1 + 80) = v3;
    operator delete(v3);
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    *(_QWORD *)(a1 + 56) = v4;
    operator delete(v4);
  }
  v5 = *(void **)(a1 + 24);
  if (v5)
  {
    *(_QWORD *)(a1 + 32) = v5;
    operator delete(v5);
  }
  v6 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_23CCB8194(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  int *v8;
  int *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  _BOOL4 v27;
  int v28;
  int v29;
  char *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v54;
  int v55;
  char v56;
  char v57;
  _DWORD v58[3];
  __int16 v59;
  void *v60[2];
  void *v61[2];
  __int128 v62;
  void *v63[2];
  void *__p[2];
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v3 = *(unsigned int *)(a1 + 4004);
  v4 = *(_DWORD *)(a1 + 4008);
  v5 = ~(-1 << (*(_DWORD *)(a1 + 4020) - 1));
  v52 = *(_DWORD *)(a1 + 4032);
  sub_23CCBD068((_QWORD *)(a1 + 1160), (_QWORD *)(a1 + 1208), (_QWORD *)(a1 + 1184), (uint64_t *)(a1 + 1184), -1431655765 * ((*(_QWORD *)(a1 + 1168) - *(_QWORD *)(a1 + 1160)) >> 2), (uint64_t *)(a1 + 3968), v5);
  v67 = 0;
  v66 = 0u;
  *(_OWORD *)__p = 0u;
  v65 = 0u;
  v62 = 0u;
  *(_OWORD *)v63 = 0u;
  *(_OWORD *)v60 = 0u;
  *(_OWORD *)v61 = 0u;
  sub_23CCB7FFC((uint64_t)v60, v4);
  v59 = 0x8000;
  if ((int)v3 >= 1)
  {
    v6 = 0;
    v48 = 2 * v5;
    v50 = 12 * v3;
    v51 = v4;
    v7 = a3;
    v8 = (int *)(a2 + 4);
    v49 = 4 * v4;
    while (v52 && !*v7)
    {
LABEL_83:
      v6 += 12;
      v8 = (int *)((char *)v8 + v49);
      ++v7;
      if (v50 == v6)
        goto LABEL_84;
    }
    v9 = (int *)(*(_QWORD *)(a1 + 3968) + v6);
    v10 = *v9;
    v11 = v9[1];
    v12 = v9[2];
    v13 = *(int *)(*(_QWORD *)(a1 + 1256) + v6);
    if ((_DWORD)v13 == -1 || v52 && !a3[v13])
    {
      if (sub_23CCB7064((unsigned int *)a1, &v59))
      {
        v10 = -v10;
        v11 = -v11;
        v12 = -v12;
      }
    }
    else
    {
      v14 = (_DWORD *)(a2 + 4 * (int)v13 * v51);
      v15 = *v14 - v5;
      v16 = v14[1] - v5;
      if (v15 >= 0)
        v17 = v15;
      else
        v17 = -v15;
      if (v16 >= 0)
        v18 = v16;
      else
        v18 = -v16;
      v19 = v5 - v17;
      v20 = v18 - v5;
      if (v15 >= 0)
        v20 = v5 - v18;
      v21 = v17 - v5;
      if (v16 >= 0)
        v21 = v19;
      v22 = v19 - v18;
      if (v22 < 0)
      {
        v15 = v20;
        v16 = v21;
      }
      if (v12 * (uint64_t)v22 + v10 * (uint64_t)v15 + v11 * (uint64_t)v16 < 0)
      {
        v10 = -v10;
        v11 = -v11;
        v12 = -v12;
      }
    }
    if (v10 >= 0)
      v23 = v10;
    else
      v23 = -v10;
    if (v11 >= 0)
      v24 = v11;
    else
      v24 = -v11;
    if (v12 >= 0)
      v25 = v12;
    else
      v25 = -v12;
    v27 = v23 < v24 || v23 < v25;
    if (v27)
    {
      v23 = v25;
      v28 = v11;
      v29 = v10;
      if (v24 < v25)
      {
LABEL_44:
        v58[0] = v29;
        v58[1] = v28;
        v58[2] = v23;
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v58, v51, (_QWORD *)(a1 + 3920), (_BYTE *)(a1 + 4044), v60, (uint64_t)&v54);
        v31 = v54;
        v32 = v55;
        if (v54 >= 0)
          v33 = v54;
        else
          v33 = -v54;
        if (v55 >= 0)
          v34 = v55;
        else
          v34 = -v55;
        v35 = v5 - v33;
        v36 = v5 - v33 - v34;
        if (v36 < 0)
        {
          v37 = v5 - v34;
          v38 = v34 - v5;
          if (v54 >= 0)
            v31 = v37;
          else
            v31 = v38;
          v39 = v33 - v5;
          if (v55 >= 0)
            v32 = v35;
          else
            v32 = v39;
        }
        v40 = -v36;
        if (v12 >= 0)
          v41 = v36;
        else
          v41 = -v36;
        if (v11 >= 0)
          v40 = v36;
        if (v24 < v25)
          v40 = v32;
        else
          v41 = v32;
        if (v10 < 0)
          v36 = -v36;
        if (v27)
          v32 = v40;
        else
          v41 = v31;
        if (!v27)
          v31 = v36;
        if (v32 >= 0)
          v42 = v32;
        else
          v42 = -v32;
        if (v31 < 0)
        {
          v43 = -v31;
        }
        else
        {
          v42 = v48 - v42;
          v43 = v31;
        }
        if (v32 >= 0)
          v43 = v48 - v43;
        v44 = v31 + v5;
        v45 = v32 + v5;
        if (v41 < 0)
        {
          v44 = v42;
          v45 = v43;
        }
        *(v8 - 1) = v44;
        *v8 = v45;
        goto LABEL_83;
      }
      v30 = &v56;
      v23 = v24;
      v28 = v12;
      v29 = v10;
    }
    else
    {
      v30 = &v57;
      v28 = v11;
      v29 = v12;
    }
    *(_DWORD *)v30 = v12;
    goto LABEL_44;
  }
LABEL_84:
  if ((_QWORD)v66)
  {
    *((_QWORD *)&v66 + 1) = v66;
    operator delete((void *)v66);
  }
  if (__p[1])
  {
    *(void **)&v65 = __p[1];
    operator delete(__p[1]);
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v61[1])
  {
    *(void **)&v62 = v61[1];
    operator delete(v61[1]);
  }
  if (v60[0])
  {
    v60[1] = v60[0];
    operator delete(v60[0]);
  }
}

void sub_23CCB8540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  sub_23CCB8124((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23CCB8558(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  unsigned int *v18;
  int *v19;
  int *v20;
  int *v21;
  _BOOL4 v22;
  uint64_t v23;
  int v24;
  int v25;
  int *v26;
  int *v27;
  int *v28;
  int v29;
  _DWORD *v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  int *v40;
  int *v41;
  _BOOL4 v42;
  uint64_t v43;
  int v44;
  int v45;
  _DWORD *v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  _BOOL4 v54;
  int *v55;
  _DWORD *v56;
  uint64_t v57;
  int v58;
  unsigned int v59;
  void *v60;
  int *v61;
  int *v62;
  int *v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  BOOL v68;
  int v69;
  _DWORD *v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int *v77;
  int *v78;
  uint64_t v79;
  int v80;
  int v81;
  _DWORD *v82;
  _DWORD *v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int *v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  unint64_t v97;
  char *v98;
  int v99;
  int v100;
  int v101;
  unint64_t v102;
  _DWORD *v103;
  uint64_t v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  unint64_t v110;
  char *v111;
  void *v112;
  void *v113;
  char *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  _BYTE *v119;
  int v120;
  int v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  _DWORD *v128;
  _QWORD *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  void *__p[3];
  void *v135[3];
  _WORD v136[3];
  _WORD __b[3];
  __int16 v138;
  _OWORD v139[22];
  uint64_t v140;
  uint64_t v141;

  v5 = a1;
  v6 = 0;
  v141 = *MEMORY[0x24BDAC8D0];
  v132 = a1[1001];
  v7 = (int)a1[1002];
  v129 = a1 + 980;
  v8 = a1[1008];
  v9 = a1[1002];
  v140 = 0;
  memset(v139, 0, sizeof(v139));
  do
  {
    sub_23CCB7FFC((uint64_t)v139 + v6, v7);
    v6 += 120;
  }
  while (v6 != 360);
  v138 = 0x8000;
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v136, &unk_23CCD46A0, 6uLL);
  LODWORD(__p[0]) = 0;
  sub_23CCC14E0(v135, v7, __p);
  v133 = 0;
  sub_23CCC14E0(__p, v7, &v133);
  if ((int)v132 >= 1)
  {
    v10 = 0;
    v11 = v5 + 1011;
    v124 = 4 * v9;
    v126 = a3;
    v127 = a2;
    v128 = v5;
    v130 = v7;
    v131 = v7;
    v125 = v8;
    v119 = v5 + 1011;
    while (1)
    {
      if (v8 && !*(_BYTE *)(a3 + v10))
        goto LABEL_106;
      v12 = (int *)(*((_QWORD *)v5 + 157) + 12 * v10);
      v14 = *v12;
      v13 = v12[1];
      v15 = v12[2];
      v16 = (int *)(*((_QWORD *)v5 + 160) + 12 * v10);
      v17 = v16[2];
      if ((_DWORD)v17 == -1
        || v8
        && (!*(_BYTE *)(a3 + v14)
         || !*(_BYTE *)(a3 + v13)
         || !*(_BYTE *)(a3 + v15)
         || !*(_BYTE *)(a3 + *v16)
         || !*(_BYTE *)(a3 + v16[1])
         || !*(_BYTE *)(a3 + v17)))
      {
        break;
      }
      v120 = *v16;
      v121 = v16[1];
      v118 = v14;
      v18 = v5;
      v19 = (int *)(a2 + 4 * (int)v14 * (int)v7);
      v122 = v13;
      v20 = (int *)(a2 + 4 * (int)v13 * (int)v131);
      v21 = (int *)(a2 + 4 * (int)v15 * (int)v7);
      v22 = sub_23CCB7064(v18, v136);
      v23 = 2;
      if (!v22)
        v23 = 1;
      if (sub_23CCB7064(v18, &v136[v23]))
        v24 = 2;
      else
        v24 = 0;
      v25 = v24 | v22;
      if (v25)
      {
        v26 = (int *)(a2 + 4 * v120 * (int)v131);
        v27 = (int *)(a2 + 4 * v121 * (int)v130);
        v28 = (int *)(a2 + 4 * (int)v17 * (int)v131);
        if (v25 == 2)
        {
          sub_23CCAE5A4(v19, v20, v21, v131, (int *)(*((_QWORD *)v128 + 145) + 12 * v118), (int *)(*((_QWORD *)v128 + 145) + 12 * v122), (int *)(*((_QWORD *)v128 + 145) + 12 * (int)v15), (int *)(*((_QWORD *)v128 + 145) + 12 * v10), (_DWORD *)v135[0]);
          sub_23CCAE5A4(v26, v27, v28, v130, (int *)(*((_QWORD *)v128 + 145) + 12 * v120), (int *)(*((_QWORD *)v128 + 145) + 12 * v121), (int *)(*((_QWORD *)v128 + 145) + 12 * (int)v17), (int *)(*((_QWORD *)v128 + 145) + 12 * v10), (_DWORD *)__p[0]);
          v29 = v131;
          if ((int)v131 >= 1)
          {
            v77 = (int *)v135[0];
            v78 = (int *)__p[0];
            v79 = v131;
            v11 = v119;
            do
            {
              v80 = *v78++;
              v81 = v80 + *v77;
              if (v81 < 0 != __OFADD__(v80, *v77))
                ++v81;
              *v77++ = v81 >> 1;
              --v79;
            }
            while (v79);
            goto LABEL_104;
          }
LABEL_92:
          v59 = 2;
          goto LABEL_93;
        }
        if (v25 == 1)
        {
          v29 = v131;
          v11 = v119;
          if ((int)v131 >= 1)
          {
            v30 = v135[0];
            v31 = v131;
            do
            {
              v33 = *v26++;
              v32 = v33;
              v34 = *v27++;
              v35 = v34 + v32;
              v36 = *v28++;
              *v30++ = v35 - v36;
              --v31;
            }
            while (v31);
          }
          goto LABEL_104;
        }
        v29 = v131;
        if ((_DWORD)v131 != 2)
        {
          v11 = v119;
          if ((int)v130 >= 1)
          {
            v97 = 0;
            v98 = (char *)v135[0];
            do
            {
              v99 = v19[v97 / 4];
              v100 = v26[v97 / 4];
              v68 = __OFADD__(v100, v99);
              v101 = v100 + v99;
              if (v101 < 0 != v68)
                ++v101;
              v102 = 1431655766 * ((v101 >> 1) - (v21[v97 / 4] + v28[v97 / 4]) + 2 * (v27[v97 / 4] + v20[v97 / 4]));
              *(_DWORD *)&v98[v97] = HIDWORD(v102) + (v102 >> 63);
              v97 += 4;
              v59 = 2;
            }
            while (v124 != v97);
            goto LABEL_105;
          }
          goto LABEL_104;
        }
        sub_23CCAECA0((unint64_t)v19, v20, v21, (_DWORD *)(*((_QWORD *)v128 + 145) + 12 * v118), (_DWORD *)(*((_QWORD *)v128 + 145) + 12 * v122), (int *)(*((_QWORD *)v128 + 145) + 12 * v10), (int *)v135[0]);
        sub_23CCAECA0((unint64_t)v26, v27, v28, (_DWORD *)(*((_QWORD *)v128 + 145) + 12 * v120), (_DWORD *)(*((_QWORD *)v128 + 145) + 12 * v121), (int *)(*((_QWORD *)v128 + 145) + 12 * v10), (int *)__p[0]);
        v82 = v135[0];
        v83 = __p[0];
        v84 = *((_DWORD *)v135[0] + 1);
        v85 = *(_DWORD *)__p[0] + *(_DWORD *)v135[0];
        if (v85 < 0 != __OFADD__(*(_DWORD *)__p[0], *(_DWORD *)v135[0]))
          ++v85;
        *(_DWORD *)v135[0] = v85 >> 1;
        v86 = v83[1];
        v68 = __OFADD__(v86, v84);
        v87 = v86 + v84;
        if (v87 < 0 != v68)
          ++v87;
        v82[1] = v87 >> 1;
      }
      else if ((int)v130 >= 1)
      {
        v70 = v135[0];
        v29 = v131;
        v71 = v131;
        v11 = v119;
        do
        {
          v73 = *v19++;
          v72 = v73;
          v74 = *v20++;
          v75 = v74 + v72;
          v76 = *v21++;
          *v70++ = v75 - v76;
          --v71;
        }
        while (v71);
LABEL_104:
        v59 = 2;
        goto LABEL_105;
      }
      v59 = 2;
      v29 = v131;
LABEL_93:
      v11 = v119;
LABEL_105:
      v7 = v130;
      a2 = v127;
      v5 = v128;
      sub_23CCB6B9C(v128, (uint64_t)v135[0], v29, v129, v11, (_QWORD *)v139 + 15 * v59, v127 + 4 * v10 * v130);
      a3 = v126;
      v8 = v125;
LABEL_106:
      if (++v10 == v132)
        goto LABEL_107;
    }
    if ((_DWORD)v15 == -1 || v8 && (!*(_BYTE *)(a3 + v14) || !*(_BYTE *)(a3 + v13) || !*(_BYTE *)(a3 + v15)))
    {
      v29 = v131;
      if ((_DWORD)v13 == -1 || v8 && (!*(_BYTE *)(a3 + v14) || !*(_BYTE *)(a3 + v13)))
      {
        if ((_DWORD)v14 == -1 || v8 && !*(_BYTE *)(a3 + v14))
        {
          v60 = v135[0];
          if ((int)v7 >= 1)
            bzero(v135[0], v124);
          LOBYTE(v133) = 3;
          sub_23CCB6B9C(v5, (uint64_t)v60, v7, v129, &v133, 0, a2 + 4 * v10 * v7);
          goto LABEL_106;
        }
        if ((int)v131 >= 1)
        {
          v55 = (int *)(a2 + 4 * (int)v14 * (int)v131);
          v56 = v135[0];
          v57 = v131;
          do
          {
            v58 = *v55++;
            *v56++ = v58;
            --v57;
          }
          while (v57);
        }
        v59 = 0;
      }
      else
      {
        v53 = v13;
        if ((_DWORD)v7 == 2)
        {
          v54 = sub_23CCB7064(v5, &v138);
          sub_23CCAEA84((int *)(a2 + 8 * (_DWORD)v14), (int *)(a2 + 8 * v53), (_DWORD *)(*((_QWORD *)v5 + 145) + 12 * (int)v14), (_DWORD *)(*((_QWORD *)v5 + 145) + 12 * v53), (int *)(*((_QWORD *)v5 + 145) + 12 * v10), v54, (int *)v135[0]);
        }
        else if ((int)v7 >= 1)
        {
          v61 = (int *)(a2 + 4 * (int)v14 * (int)v131);
          v62 = (int *)(a2 + 4 * (int)v13 * (int)v7);
          v63 = (int *)v135[0];
          v64 = v131;
          do
          {
            v66 = *v61++;
            v65 = v66;
            v67 = *v62++;
            v68 = __OFADD__(v67, v65);
            v69 = v67 + v65;
            if (v69 < 0 != v68)
              ++v69;
            *v63++ = v69 >> 1;
            --v64;
          }
          while (v64);
        }
        v59 = 1;
      }
      goto LABEL_105;
    }
    v37 = v14;
    v38 = (int *)(a2 + 4 * (int)v14 * (int)v7);
    v29 = v131;
    v123 = v13;
    v39 = a2;
    v40 = (int *)(a2 + 4 * (int)v13 * (int)v131);
    v41 = (int *)(v39 + 4 * (int)v15 * (int)v7);
    v42 = sub_23CCB7064(v5, __b);
    v43 = 2;
    if (!v42)
      v43 = 1;
    if (sub_23CCB7064(v5, &__b[v43]))
      v44 = 2;
    else
      v44 = 0;
    v45 = v44 | v42;
    if (v45 == 2)
    {
      sub_23CCAE5A4(v38, v40, v41, v130, (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v37), (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v123), (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v15), (int *)(*((_QWORD *)v5 + 145) + 12 * v10), (_DWORD *)v135[0]);
      v11 = v119;
      if ((int)v130 >= 1)
      {
        v88 = (int *)v135[0];
        v89 = v131;
        do
        {
          v91 = *v38++;
          v90 = v91;
          v92 = *v40++;
          v93 = v92 + v90;
          v94 = *v41++;
          v95 = v93 - v94;
          v68 = __OFADD__(v95, *v88);
          v96 = v95 + *v88;
          if (v96 < 0 != v68)
            ++v96;
          *v88++ = v96 >> 1;
          --v89;
        }
        while (v89);
      }
      goto LABEL_104;
    }
    if (v45 == 1)
    {
      sub_23CCAE5A4(v38, v40, v41, v131, (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v37), (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v123), (int *)(*((_QWORD *)v5 + 145) + 12 * (int)v15), (int *)(*((_QWORD *)v5 + 145) + 12 * v10), (_DWORD *)v135[0]);
    }
    else if (v45)
    {
      if ((_DWORD)v131 != 2)
      {
        v11 = v119;
        if ((int)v131 >= 1)
        {
          v103 = v135[0];
          v104 = v131;
          do
          {
            v106 = *v38++;
            v105 = v106;
            v108 = *v40++;
            v107 = v108;
            v109 = *v41++;
            *v103++ = v107 + v105 - v109;
            v59 = 2;
            --v104;
          }
          while (v104);
          goto LABEL_105;
        }
        goto LABEL_104;
      }
      sub_23CCAECA0(v127 + 8 * v37, (int *)(v127 + 8 * v123), (int *)(v127 + 8 * (_DWORD)v15), (_DWORD *)(*((_QWORD *)v5 + 145) + 12 * (int)v37), (_DWORD *)(*((_QWORD *)v5 + 145) + 12 * (int)v123), (int *)(*((_QWORD *)v5 + 145) + 12 * v10), (int *)v135[0]);
    }
    else if ((int)v131 >= 1)
    {
      v46 = v135[0];
      v47 = v131;
      v11 = v119;
      do
      {
        v49 = *v38++;
        v48 = v49;
        v50 = *v40++;
        v51 = v50 + v48;
        v52 = *v41++;
        *v46++ = v51 - v52;
        --v47;
      }
      while (v47);
      goto LABEL_104;
    }
    goto LABEL_92;
  }
LABEL_107:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v135[0])
  {
    v135[1] = v135[0];
    operator delete(v135[0]);
  }
  v110 = 360;
  do
  {
    v111 = (char *)v139 + v110;
    v112 = v135[v110 / 8 + 2];
    if (v112)
    {
      *((_QWORD *)v111 - 2) = v112;
      operator delete(v112);
    }
    v113 = (void *)*((_QWORD *)v111 - 6);
    if (v113)
    {
      v135[v110 / 8] = v113;
      operator delete(v113);
    }
    v114 = (char *)v139 + v110;
    v115 = *(void **)((char *)&v139[-4] + v110 - 8);
    if (v115)
    {
      *((_QWORD *)v114 - 8) = v115;
      operator delete(v115);
    }
    v116 = (void *)*((_QWORD *)v114 - 12);
    if (v116)
    {
      *(_QWORD *)((char *)&v139[-5] + v110 - 8) = v116;
      operator delete(v116);
    }
    v117 = (void *)*((_QWORD *)v111 - 15);
    if (v117)
    {
      *(_QWORD *)((char *)&v139[-7] + v110) = v117;
      operator delete(v117);
    }
    v110 -= 120;
  }
  while (v110);
}

void sub_23CCB8E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a33 + i));
  _Unwind_Resume(a1);
}

void sub_23CCB8EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int *v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  _BOOL4 v25;
  int *v26;
  _DWORD *v27;
  uint64_t v28;
  int v29;
  void *v30;
  int *v31;
  int *v32;
  int *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  BOOL v38;
  int v39;
  unint64_t v40;
  char *v41;
  void *v42;
  void *v43;
  char *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  int v49;
  uint64_t v51;
  int v52;
  void *__p[3];
  void *v54;
  _QWORD v55[2];
  __int16 v56;
  _OWORD v57[22];
  uint64_t v58;
  uint64_t v59;

  v5 = 0;
  v59 = *MEMORY[0x24BDAC8D0];
  v51 = *(unsigned int *)(a1 + 4004);
  v6 = *(int *)(a1 + 4008);
  v48 = (_QWORD *)(a1 + 3920);
  v49 = *(_DWORD *)(a1 + 4032);
  v7 = *(unsigned int *)(a1 + 4008);
  v58 = 0;
  memset(v57, 0, sizeof(v57));
  do
  {
    sub_23CCB7FFC((uint64_t)v57 + v5, v6);
    v5 += 120;
  }
  while (v5 != 360);
  v56 = 0x8000;
  LODWORD(__p[0]) = 0;
  sub_23CCC14E0(&v54, v6, __p);
  v52 = 0;
  sub_23CCC14E0(__p, v6, &v52);
  v8 = a3;
  v9 = v49;
  if ((int)v51 >= 1)
  {
    for (i = 0; i != v51; ++i)
    {
      if (v9 && !*(_BYTE *)(v8 + i))
        continue;
      v11 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * i);
      v12 = *v11;
      v13 = v11[1];
      v14 = v11[2];
      v15 = (int *)(*(_QWORD *)(a1 + 1280) + 12 * i);
      v16 = v15[2];
      if ((_DWORD)v16 != -1
        && ((v17 = *v15, v18 = v15[1], !v9)
         || *(_BYTE *)(v8 + v12)
         && *(_BYTE *)(v8 + v13)
         && *(_BYTE *)(v8 + v14)
         && *(_BYTE *)(v8 + v17)
         && *(_BYTE *)(v8 + v18)
         && *(_BYTE *)(v8 + v16)))
      {
        sub_23CCAE5A4((int *)(a2 + 4 * (int)v12 * (int)v6), (int *)(a2 + 4 * (int)v13 * (int)v7), (int *)(a2 + 4 * (int)v14 * (int)v6), v6, (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v12), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v13), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v14), (int *)(*(_QWORD *)(a1 + 1160) + 12 * i), v54);
        sub_23CCAE5A4((int *)(a2 + 4 * (int)v17 * (int)v6), (int *)(a2 + 4 * (int)v18 * (int)v6), (int *)(a2 + 4 * (int)v16 * (int)v6), v6, (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v17), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v18), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v16), (int *)(*(_QWORD *)(a1 + 1160) + 12 * i), (_DWORD *)__p[0]);
        if ((int)v7 >= 1)
        {
          v19 = (int *)v54;
          v20 = (int *)__p[0];
          v21 = v6;
          do
          {
            v22 = *v20++;
            v23 = v22 + *v19;
            if (v23 < 0 != __OFADD__(v22, *v19))
              ++v23;
            *v19++ = v23 >> 1;
            --v21;
          }
          while (v21);
        }
      }
      else
      {
        if ((_DWORD)v14 == -1 || v9 && (!*(_BYTE *)(v8 + v12) || !*(_BYTE *)(v8 + v13) || !*(_BYTE *)(v8 + v14)))
        {
          if ((_DWORD)v13 == -1 || v9 && (!*(_BYTE *)(v8 + v12) || !*(_BYTE *)(v8 + v13)))
          {
            if ((_DWORD)v12 == -1 || v9 && !*(_BYTE *)(v8 + v12))
            {
              v30 = v54;
              if ((int)v6 >= 1)
                bzero(v54, 4 * v7);
              LOBYTE(v52) = 3;
              sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v30, v6, v48, &v52, 0, a2 + 4 * i * v6);
              v8 = a3;
              v9 = v49;
              continue;
            }
            if ((int)v7 >= 1)
            {
              v26 = (int *)(a2 + 4 * (int)v12 * (int)v6);
              v27 = v54;
              v28 = v6;
              do
              {
                v29 = *v26++;
                *v27++ = v29;
                --v28;
              }
              while (v28);
            }
            v24 = 0;
          }
          else
          {
            if ((_DWORD)v7 == 2)
            {
              v25 = sub_23CCB7064((unsigned int *)a1, &v56);
              sub_23CCAEA84((int *)(a2 + 8 * v12), (int *)(a2 + 8 * (_DWORD)v13), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v12), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v13), (int *)(*(_QWORD *)(a1 + 1160) + 12 * i), v25, (int *)v54);
            }
            else if ((int)v6 >= 1)
            {
              v31 = (int *)(a2 + 4 * (int)v12 * (int)v6);
              v32 = (int *)(a2 + 4 * (int)v13 * (int)v6);
              v33 = (int *)v54;
              v34 = v6;
              do
              {
                v36 = *v31++;
                v35 = v36;
                v37 = *v32++;
                v38 = __OFADD__(v37, v35);
                v39 = v37 + v35;
                if (v39 < 0 != v38)
                  ++v39;
                *v33++ = v39 >> 1;
                --v34;
              }
              while (v34);
            }
            v24 = 1;
          }
          goto LABEL_50;
        }
        sub_23CCAE5A4((int *)(a2 + 4 * (int)v12 * (int)v6), (int *)(a2 + 4 * (int)v13 * (int)v7), (int *)(a2 + 4 * (int)v14 * (int)v6), v6, (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v12), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v13), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v14), (int *)(*(_QWORD *)(a1 + 1160) + 12 * i), v54);
      }
      v24 = 2;
LABEL_50:
      sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v54, v6, v48, (_BYTE *)(a1 + 4044), (_QWORD *)v57 + 15 * v24, a2 + 4 * i * v6);
      v8 = a3;
      v9 = v49;
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v54)
  {
    v55[0] = v54;
    operator delete(v54);
  }
  v40 = 360;
  do
  {
    v41 = (char *)v57 + v40;
    v42 = (void *)v55[v40 / 8];
    if (v42)
    {
      *((_QWORD *)v41 - 2) = v42;
      operator delete(v42);
    }
    v43 = (void *)*((_QWORD *)v41 - 6);
    if (v43)
    {
      __p[v40 / 8 + 2] = v43;
      operator delete(v43);
    }
    v44 = (char *)v57 + v40;
    v45 = *(void **)((char *)&v57[-4] + v40 - 8);
    if (v45)
    {
      *((_QWORD *)v44 - 8) = v45;
      operator delete(v45);
    }
    v46 = (void *)*((_QWORD *)v44 - 12);
    if (v46)
    {
      *(_QWORD *)((char *)&v57[-5] + v40 - 8) = v46;
      operator delete(v46);
    }
    v47 = (void *)*((_QWORD *)v41 - 15);
    if (v47)
    {
      *(_QWORD *)((char *)&v57[-7] + v40) = v47;
      operator delete(v47);
    }
    v40 -= 120;
  }
  while (v40);
}

void sub_23CCB93D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a25 + i));
  _Unwind_Resume(a1);
}

void sub_23CCB9438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  int v32;
  int v33;
  BOOL v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  void *v59;
  void *v60;
  char *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  int v71;
  unint64_t v72;
  int v74;
  void *__p;
  _QWORD v76[2];
  _WORD __b[3];
  _OWORD v78[22];
  uint64_t v79;
  uint64_t v80;

  v5 = 0;
  v80 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned int *)(a1 + 4004);
  v70 = (_QWORD *)(a1 + 3920);
  v72 = *(int *)(a1 + 4008);
  v71 = *(_DWORD *)(a1 + 4032);
  v7 = *(unsigned int *)(a1 + 4008);
  v79 = 0;
  memset(v78, 0, sizeof(v78));
  do
  {
    sub_23CCB7FFC((uint64_t)v78 + v5, v7);
    v5 += 120;
  }
  while (v5 != 360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  v74 = 0;
  sub_23CCC14E0(&__p, v72, &v74);
  v8 = v71;
  if ((int)v6 >= 1)
  {
    v9 = 0;
    v68 = a3;
    v10 = 4 * v7;
    v65 = v6;
    v69 = a2;
    do
    {
      if (v8 && !*(_BYTE *)(a3 + v9))
        goto LABEL_77;
      v11 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v9);
      v13 = *v11;
      v12 = v11[1];
      v14 = v11[2];
      v15 = (int *)(*(_QWORD *)(a1 + 1280) + 12 * v9);
      v16 = v15[2];
      if ((_DWORD)v16 != -1
        && (!v8
         || *(_BYTE *)(a3 + v13)
         && *(_BYTE *)(a3 + v12)
         && *(_BYTE *)(a3 + v14)
         && *(_BYTE *)(a3 + *v15)
         && *(_BYTE *)(a3 + v15[1])
         && *(_BYTE *)(a3 + v16)))
      {
        v66 = *v15;
        v67 = v15[1];
        v17 = sub_23CCB7064((unsigned int *)a1, __b);
        v18 = 2;
        if (!v17)
          v18 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v18]))
          v19 = 2;
        else
          v19 = 0;
        v20 = v72;
        v21 = v13 * v72;
        v22 = v69;
        v23 = v69 + 4 * v21;
        v24 = v69 + 4 * (int)v12 * (int)v7;
        v25 = v69 + 4 * (int)v14 * (int)v72;
        v26 = v19 | v17;
        if (v19 | v17)
        {
          v27 = v69 + 4 * v66 * (int)v7;
          v28 = v69 + 4 * v67 * (int)v72;
          v29 = v69 + 4 * (int)v16 * (int)v7;
          if (v26 == 1)
          {
            v30 = (char *)__p;
            a3 = v68;
            v6 = v65;
            if ((int)v7 >= 1)
            {
              v51 = 0;
              do
              {
                *(_DWORD *)&v30[v51] = *(_DWORD *)(v28 + v51) + *(_DWORD *)(v27 + v51) - *(_DWORD *)(v29 + v51);
                v51 += 4;
              }
              while (v10 != v51);
            }
          }
          else
          {
            a3 = v68;
            v6 = v65;
            if (v26 == 2)
            {
              v30 = (char *)__p;
              if ((int)v7 >= 1)
              {
                v31 = 0;
                do
                {
                  v32 = *(_DWORD *)(v23 + v31);
                  v33 = *(_DWORD *)(v27 + v31);
                  v34 = __OFADD__(v33, v32);
                  v35 = v33 + v32;
                  if (v35 < 0 != v34)
                    ++v35;
                  *(_DWORD *)&v30[v31] = *(_DWORD *)(v28 + v31) + *(_DWORD *)(v24 + v31) - (v35 >> 1);
                  v31 += 4;
                }
                while (v10 != v31);
              }
            }
            else
            {
              v30 = (char *)__p;
              if ((int)v7 >= 1)
              {
                v52 = 0;
                do
                {
                  v53 = *(_DWORD *)(v23 + v52);
                  v54 = *(_DWORD *)(v27 + v52);
                  v34 = __OFADD__(v54, v53);
                  v55 = v54 + v53;
                  if (v55 < 0 != v34)
                    ++v55;
                  v56 = 1431655766
                      * ((v55 >> 1)
                       - (*(_DWORD *)(v25 + v52)
                        + *(_DWORD *)(v29 + v52))
                       + 2 * (*(_DWORD *)(v28 + v52) + *(_DWORD *)(v24 + v52)));
                  *(_DWORD *)&v30[v52] = HIDWORD(v56) + (v56 >> 63);
                  v52 += 4;
                }
                while (v10 != v52);
              }
            }
          }
        }
        else
        {
          v30 = (char *)__p;
          if ((int)v72 < 1)
          {
            v45 = 2;
            a3 = v68;
            v6 = v65;
            goto LABEL_76;
          }
          v50 = 0;
          a3 = v68;
          v6 = v65;
          do
          {
            *(_DWORD *)&v30[v50] = *(_DWORD *)(v24 + v50) + *(_DWORD *)(v23 + v50) - *(_DWORD *)(v25 + v50);
            v50 += 4;
          }
          while (v10 != v50);
        }
      }
      else
      {
        if ((_DWORD)v14 == -1 || v8 && (!*(_BYTE *)(a3 + v13) || !*(_BYTE *)(a3 + v12) || !*(_BYTE *)(a3 + v14)))
        {
          v20 = v72;
          if ((_DWORD)v12 == -1 || v8 && (!*(_BYTE *)(a3 + v13) || !*(_BYTE *)(a3 + v12)))
          {
            if ((_DWORD)v13 == -1 || v8 && !*(_BYTE *)(a3 + v13))
            {
              v49 = __p;
              if ((int)v7 >= 1)
              {
                bzero(__p, 4 * v7);
                v20 = v72;
              }
              LOBYTE(v74) = 3;
              sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v49, v20, v70, &v74, 0, v69 + 4 * v9 * v20);
              a3 = v68;
              v8 = v71;
              goto LABEL_77;
            }
            v30 = (char *)__p;
            if ((int)v72 >= 1)
            {
              v46 = 0;
              v47 = v13 * v7;
              v22 = v69;
              v48 = v69 + 4 * v47;
              do
              {
                *(_DWORD *)&v30[v46] = *(_DWORD *)(v48 + v46);
                v46 += 4;
              }
              while (v10 != v46);
              v45 = 0;
              goto LABEL_76;
            }
            v45 = 0;
          }
          else
          {
            v30 = (char *)__p;
            if ((int)v7 >= 1)
            {
              v39 = 0;
              v40 = v13 * v7;
              v22 = v69;
              v41 = v69 + 4 * v40;
              do
              {
                v42 = *(_DWORD *)(v41 + v39);
                v43 = *(_DWORD *)(v69 + 4 * (int)v12 * (int)v72 + v39);
                v34 = __OFADD__(v43, v42);
                v44 = v43 + v42;
                if (v44 < 0 != v34)
                  ++v44;
                *(_DWORD *)&v30[v39] = v44 >> 1;
                v39 += 4;
              }
              while (v10 != v39);
              v45 = 1;
              goto LABEL_76;
            }
            v45 = 1;
          }
          goto LABEL_75;
        }
        v30 = (char *)__p;
        v20 = v72;
        if ((int)v72 < 1)
        {
          v45 = 2;
LABEL_75:
          v22 = v69;
          goto LABEL_76;
        }
        v36 = 0;
        v37 = v13 * v72;
        v22 = v69;
        v38 = v69 + 4 * v37;
        do
        {
          *(_DWORD *)&v30[v36] = *(_DWORD *)(v69 + 4 * (int)v12 * (int)v7 + v36)
                               + *(_DWORD *)(v38 + v36)
                               - *(_DWORD *)(v69 + 4 * (int)v14 * (int)v72 + v36);
          v36 += 4;
        }
        while (v10 != v36);
      }
      v45 = 2;
LABEL_76:
      sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v30, v20, v70, (_BYTE *)(a1 + 4044), (_QWORD *)v78 + 15 * v45, v22 + 4 * v9 * v20);
      v8 = v71;
LABEL_77:
      ++v9;
    }
    while (v9 != v6);
  }
  if (__p)
  {
    v76[0] = __p;
    operator delete(__p);
  }
  v57 = 360;
  do
  {
    v58 = (char *)v78 + v57;
    v59 = (void *)v76[v57 / 8];
    if (v59)
    {
      *((_QWORD *)v58 - 2) = v59;
      operator delete(v59);
    }
    v60 = (void *)*((_QWORD *)v58 - 6);
    if (v60)
    {
      *(_QWORD *)((char *)&v78[-2] + v57 - 8) = v60;
      operator delete(v60);
    }
    v61 = (char *)v78 + v57;
    v62 = *(void **)((char *)&v78[-4] + v57 - 8);
    if (v62)
    {
      *((_QWORD *)v61 - 8) = v62;
      operator delete(v62);
    }
    v63 = (void *)*((_QWORD *)v61 - 12);
    if (v63)
    {
      *(_QWORD *)((char *)&v78[-5] + v57 - 8) = v63;
      operator delete(v63);
    }
    v64 = (void *)*((_QWORD *)v58 - 15);
    if (v64)
    {
      *(_QWORD *)((char *)&v78[-7] + v57) = v64;
      operator delete(v64);
    }
    v57 -= 120;
  }
  while (v57);
}

void sub_23CCB9A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  uint64_t i;

  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a25 + i));
  _Unwind_Resume(a1);
}

void sub_23CCB9A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  void *v41;
  void *v42;
  char *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *__p[3];
  _OWORD v50[22];
  uint64_t v51;
  uint64_t v52;

  v6 = 0;
  v52 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned int *)(a1 + 4004);
  v8 = *(int *)(a1 + 4008);
  v9 = (_QWORD *)(a1 + 3920);
  v10 = *(unsigned int *)(a1 + 4032);
  v11 = *(unsigned int *)(a1 + 4008);
  v51 = 0;
  memset(v50, 0, sizeof(v50));
  do
  {
    sub_23CCB7FFC((uint64_t)v50 + v6, v11);
    v6 += 120;
  }
  while (v6 != 360);
  v48 = 0;
  sub_23CCC14E0(__p, v8, &v48);
  if ((int)v7 >= 1)
  {
    v12 = 0;
    v47 = a3;
    v13 = 4 * v11;
    while ((_DWORD)v10)
    {
      if (*(_BYTE *)(a3 + v12))
      {
        v14 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v12);
        v15 = *v14;
        v16 = v14[1];
        v17 = v14[2];
        if (v17 == -1 || !*(_BYTE *)(a3 + v15) || !*(_BYTE *)(a3 + v16) || !*(_BYTE *)(a3 + v17))
        {
          if (v16 == -1 || !*(_BYTE *)(a3 + v15) || !*(_BYTE *)(a3 + v16))
          {
            if (v15 == -1 || !*(_BYTE *)(a3 + v15))
            {
LABEL_34:
              v34 = v7;
              v35 = v10;
              v36 = v9;
              v37 = __p[0];
              if ((int)v11 >= 1)
                bzero(__p[0], 4 * v11);
              LOBYTE(v48) = 3;
              v38 = (uint64_t)v37;
              v9 = v36;
              sub_23CCB6B9C((unsigned int *)a1, v38, v8, v36, &v48, 0, a2 + 4 * v12 * v8);
              v10 = v35;
              v7 = v34;
              a3 = v47;
              goto LABEL_37;
            }
LABEL_16:
            v18 = (char *)__p[0];
            if ((int)v8 >= 1)
            {
              v19 = 0;
              v20 = a2 + 4 * v15 * (int)v11;
              do
              {
                *(_DWORD *)&v18[v19] = *(_DWORD *)(v20 + v19);
                v19 += 4;
              }
              while (v13 != v19);
            }
            v21 = 0;
LABEL_32:
            sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v18, v8, v9, (_BYTE *)(a1 + 4044), (_QWORD *)v50 + 15 * v21, a2 + 4 * v12 * v8);
            goto LABEL_37;
          }
LABEL_26:
          v18 = (char *)__p[0];
          if ((int)v11 >= 1)
          {
            v27 = 0;
            v28 = a2 + 4 * v15 * (int)v11;
            v29 = a2 + 4 * v16 * (int)v8;
            do
            {
              v30 = *(_DWORD *)(v28 + v27);
              v31 = *(_DWORD *)(v29 + v27);
              v32 = __OFADD__(v31, v30);
              v33 = v31 + v30;
              if (v33 < 0 != v32)
                ++v33;
              *(_DWORD *)&v18[v27] = v33 >> 1;
              v27 += 4;
            }
            while (v13 != v27);
          }
          v21 = 1;
          goto LABEL_32;
        }
        goto LABEL_21;
      }
LABEL_37:
      if (++v12 == v7)
        goto LABEL_38;
    }
    v22 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v12);
    v15 = *v22;
    v16 = v22[1];
    v17 = v22[2];
    if (v17 == -1)
    {
      if (v16 == -1)
      {
        if (v15 == -1)
          goto LABEL_34;
        goto LABEL_16;
      }
      goto LABEL_26;
    }
LABEL_21:
    v18 = (char *)__p[0];
    if ((int)v11 >= 1)
    {
      v23 = 0;
      v24 = a2 + 4 * v15 * (int)v8;
      v25 = a2 + 4 * v16 * (int)v11;
      v26 = a2 + 4 * v17 * (int)v8;
      do
      {
        *(_DWORD *)&v18[v23] = *(_DWORD *)(v25 + v23) + *(_DWORD *)(v24 + v23) - *(_DWORD *)(v26 + v23);
        v23 += 4;
      }
      while (v13 != v23);
    }
    v21 = 2;
    goto LABEL_32;
  }
LABEL_38:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v39 = 360;
  do
  {
    v40 = (char *)v50 + v39;
    v41 = __p[v39 / 8];
    if (v41)
    {
      *((_QWORD *)v40 - 2) = v41;
      operator delete(v41);
    }
    v42 = (void *)*((_QWORD *)v40 - 6);
    if (v42)
    {
      *(_QWORD *)((char *)&v50[-2] + v39 - 8) = v42;
      operator delete(v42);
    }
    v43 = (char *)v50 + v39;
    v44 = *(void **)((char *)&v50[-4] + v39 - 8);
    if (v44)
    {
      *((_QWORD *)v43 - 8) = v44;
      operator delete(v44);
    }
    v45 = (void *)*((_QWORD *)v43 - 12);
    if (v45)
    {
      *(_QWORD *)((char *)&v50[-5] + v39 - 8) = v45;
      operator delete(v45);
    }
    v46 = (void *)*((_QWORD *)v40 - 15);
    if (v46)
    {
      *(_QWORD *)((char *)&v50[-7] + v39) = v46;
      operator delete(v46);
    }
    v39 -= 120;
  }
  while (v39);
}

void sub_23CCB9E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t i;

  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a15 + i));
  _Unwind_Resume(a1);
}

void sub_23CCB9E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  int v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  _QWORD *v34;
  void *v35;
  void *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  int v42;
  void *__p[3];
  _OWORD v44[15];
  uint64_t v45;

  v6 = 0;
  v7 = 0;
  v45 = *MEMORY[0x24BDAC8D0];
  v8 = *(unsigned int *)(a1 + 4004);
  v9 = *(int *)(a1 + 4008);
  v10 = *(_DWORD *)(a1 + 4032);
  v41 = (_QWORD *)(a1 + 3920);
  v11 = *(unsigned int *)(a1 + 4008);
  memset(v44, 0, sizeof(v44));
  do
  {
    v12 = v6;
    sub_23CCB7FFC((uint64_t)v44 + 120 * v7, v9);
    v6 = 1;
    v7 = 1;
  }
  while ((v12 & 1) == 0);
  v42 = 0;
  sub_23CCC14E0(__p, v9, &v42);
  v13 = v41;
  if ((int)v8 >= 1)
  {
    v14 = 0;
    v15 = 4 * v11;
    while (v10)
    {
      if (*(_BYTE *)(a3 + v14))
      {
        v16 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v14);
        v17 = *v16;
        v18 = v16[1];
        if (v18 == -1 || !*(_BYTE *)(a3 + v17) || !*(_BYTE *)(a3 + v18))
        {
          if (v17 == -1 || !*(_BYTE *)(a3 + v17))
          {
LABEL_25:
            v31 = __p[0];
            if ((int)v11 >= 1)
              bzero(__p[0], 4 * v11);
            LOBYTE(v42) = 3;
            v32 = (uint64_t)v31;
            v13 = v41;
            sub_23CCB6B9C((unsigned int *)a1, v32, v9, v41, &v42, 0, a2 + 4 * v14 * v9);
            goto LABEL_28;
          }
LABEL_12:
          v19 = (char *)__p[0];
          if ((int)v9 >= 1)
          {
            v20 = 0;
            v21 = a2 + 4 * v17 * (int)v11;
            do
            {
              *(_DWORD *)&v19[v20] = *(_DWORD *)(v21 + v20);
              v20 += 4;
            }
            while (v15 != v20);
          }
          v22 = 0;
LABEL_23:
          sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v19, v9, v13, (_BYTE *)(a1 + 4044), (_QWORD *)v44 + 15 * v22, a2 + 4 * v14 * v9);
          goto LABEL_28;
        }
LABEL_17:
        v19 = (char *)__p[0];
        if ((int)v11 >= 1)
        {
          v24 = 0;
          v25 = a2 + 4 * v17 * (int)v11;
          v26 = a2 + 4 * v18 * (int)v9;
          do
          {
            v27 = *(_DWORD *)(v25 + v24);
            v28 = *(_DWORD *)(v26 + v24);
            v29 = __OFADD__(v28, v27);
            v30 = v28 + v27;
            if (v30 < 0 != v29)
              ++v30;
            *(_DWORD *)&v19[v24] = v30 >> 1;
            v24 += 4;
          }
          while (v15 != v24);
        }
        v22 = 1;
        goto LABEL_23;
      }
LABEL_28:
      if (++v14 == v8)
        goto LABEL_29;
    }
    v23 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v14);
    v17 = *v23;
    v18 = v23[1];
    if (v18 == -1)
    {
      if (v17 == -1)
        goto LABEL_25;
      goto LABEL_12;
    }
    goto LABEL_17;
  }
LABEL_29:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  for (i = 0; i != -240; i -= 120)
  {
    v34 = (_QWORD *)((char *)v44 + i);
    v35 = *(void **)((char *)&v44[13] + i + 8);
    if (v35)
    {
      v34[28] = v35;
      operator delete(v35);
    }
    v36 = (void *)v34[24];
    if (v36)
    {
      *(_QWORD *)((char *)&v44[12] + i + 8) = v36;
      operator delete(v36);
    }
    v37 = (char *)v44 + i;
    v38 = *(void **)((char *)&v44[10] + i + 8);
    if (v38)
    {
      *((_QWORD *)v37 + 22) = v38;
      operator delete(v38);
    }
    v39 = (void *)*((_QWORD *)v37 + 18);
    if (v39)
    {
      *(_QWORD *)((char *)&v44[9] + i + 8) = v39;
      operator delete(v39);
    }
    v40 = (void *)v34[15];
    if (v40)
    {
      *(_QWORD *)((char *)&v44[8] + i) = v40;
      operator delete(v40);
    }
  }
}

void sub_23CCBA164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t i;

  for (i = 120; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a15 + i));
  _Unwind_Resume(a1);
}

void sub_23CCBA1AC(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_23CCC13D0((void **)a1, a2 - v3, a3);
  }
}

int32x2_t sub_23CCBA1DC(uint64_t a1, int a2, int32x2_t result)
{
  int *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int32x2_t *v18;
  int32x2_t *v19;
  int v20;
  int32x2_t *v21;
  unsigned int v22;
  uint64_t v23;
  int32x2_t *v24;
  int32x2_t *v25;
  int32x2_t *v26;
  int v27;
  uint64_t v28;
  int32x2_t *v29;
  int32x2_t *v30;
  uint32x2_t v31;
  __int32 v32;
  BOOL v33;
  int v34;
  uint64_t v35;
  int32x2_t v36;
  int v37;
  int32x2_t v38;
  uint64_t v39;
  int32x2_t *v40;
  int32x2_t *v41;
  int32x2_t *v42;
  int32x2_t *v43;
  __int32 v44;
  __int32 v45;
  int v46;
  int32x2_t v47;
  uint32x2_t v48;
  int32x2_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int32x2_t *v53;
  int32x2_t *v54;
  __int32 v55;
  __int32 v56;
  int v57;
  int32x2_t *v58;
  int32x2_t *v59;
  int32x2_t *v60;
  int32x2_t *v61;
  uint32x2_t v62;
  int32x2_t v63;
  int64x2_t v64;
  int32x2_t *v65;
  int v66;
  int32x2_t v67;
  int32x2_t v68;
  int v69;

  if (*(_DWORD *)(a1 + 1116) <= a2)
  {
    *(_DWORD *)(a1 + 4384) = 3;
    return result;
  }
  v5 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * a2);
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = *(_DWORD *)(a1 + 1148);
  if (v9 != 1)
  {
    if (v9 != 2)
      goto LABEL_17;
    v10 = (int *)(*(_QWORD *)(a1 + 1280) + 12 * a2);
    v11 = v10[2];
    if (v11 != -1)
    {
      v12 = *v10;
      v66 = v10[1];
      v13 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3672));
      v14 = 4;
      if (!v13)
        v14 = 2;
      if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3672 + v14)))
        v15 = 2;
      else
        v15 = 0;
      v16 = v15 | v13;
      if (v16 == 2)
      {
        v39 = *(_QWORD *)(a1 + 1160);
        v40 = (int32x2_t *)(v39 + 12 * v7);
        v41 = (int32x2_t *)(v39 + 12 * v66);
        v42 = (int32x2_t *)(v39 + 12 * v6);
        v43 = (int32x2_t *)(v39 + 12 * v12);
        v44 = v42[1].i32[0];
        v45 = v43[1].i32[0];
        v33 = __OFADD__(v45, v44);
        v46 = v45 + v44;
        v47 = vadd_s32(*v41, *v40);
        v48 = (uint32x2_t)vadd_s32(*v43, *v42);
        v49 = vshr_n_s32((int32x2_t)vsra_n_u32(v48, v48, 0x1FuLL), 1uLL);
        if (v46 < 0 != v33)
          v50 = v46 + 1;
        else
          v50 = v46;
        v67 = vsub_s32(v47, v49);
        v27 = v41[1].i32[0] + v40[1].i32[0] - (v50 >> 1);
        goto LABEL_34;
      }
      if (v16 == 1)
      {
        v51 = *(_QWORD *)(a1 + 1160);
        v18 = (int32x2_t *)(v51 + 12 * v12);
        v19 = (int32x2_t *)(v51 + 12 * v66);
        v20 = v19[1].i32[0] + v18[1].i32[0];
        v21 = (int32x2_t *)(v51 + 12 * v11);
      }
      else
      {
        if (v16)
        {
          v52 = *(_QWORD *)(a1 + 1160);
          v53 = (int32x2_t *)(v52 + 12 * v6);
          v54 = (int32x2_t *)(v52 + 12 * v12);
          v55 = v53[1].i32[0];
          v56 = v54[1].i32[0];
          v33 = __OFADD__(v56, v55);
          v57 = v56 + v55;
          if (v57 < 0 != v33)
            ++v57;
          v58 = (int32x2_t *)(v52 + 12 * v7);
          v59 = (int32x2_t *)(v52 + 12 * v66);
          v60 = (int32x2_t *)(v52 + 12 * v8);
          v61 = (int32x2_t *)(v52 + 12 * v11);
          v62 = (uint32x2_t)vadd_s32(*v54, *v53);
          v63 = vadd_s32(*v59, *v58);
          v64 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v63, v63), (int32x2_t)vsra_n_u32(v62, v62, 0x1FuLL), 1uLL), vadd_s32(*v60, *v61)), vdup_n_s32(0x55555556u));
          v67 = vadd_s32(vshrn_n_s64(v64, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v64, 0x3FuLL)));
          v27 = (2 * (v59[1].i32[0] + v58[1].i32[0]) + (v57 >> 1) - (v60[1].i32[0] + v61[1].i32[0])) / 3;
          goto LABEL_34;
        }
        v17 = *(_QWORD *)(a1 + 1160);
        v18 = (int32x2_t *)(v17 + 12 * v6);
        v19 = (int32x2_t *)(v17 + 12 * v7);
        v20 = v19[1].i32[0] + v18[1].i32[0];
        v21 = (int32x2_t *)(v17 + 12 * v8);
      }
      v67 = vsub_s32(vadd_s32(*v19, *v18), *v21);
      v27 = v20 - v21[1].i32[0];
LABEL_34:
      v22 = 1;
      goto LABEL_35;
    }
  }
  if (v8 != -1)
  {
    v22 = 0;
    v23 = *(_QWORD *)(a1 + 1160);
    v24 = (int32x2_t *)(v23 + 12 * v6);
    v25 = (int32x2_t *)(v23 + 12 * v7);
    v26 = (int32x2_t *)(v23 + 12 * v8);
    v67 = vsub_s32(vadd_s32(*v25, *v24), *v26);
    v27 = v25[1].i32[0] + v24[1].i32[0] - v26[1].i32[0];
LABEL_35:
    sub_23CCBA5B8((uint64_t)&v68, (unsigned int *)a1, *(_BYTE *)(a1 + 1144), (_QWORD *)(a1 + 120 * v22 + 3680));
    v36 = v68;
    v37 = v69;
    v38 = v67;
    goto LABEL_36;
  }
LABEL_17:
  if (v7 != -1)
  {
    v22 = 0;
    v28 = *(_QWORD *)(a1 + 1160);
    v29 = (int32x2_t *)(v28 + 12 * v6);
    v30 = (int32x2_t *)(v28 + 12 * v7);
    v31 = (uint32x2_t)vadd_s32(*v30, *v29);
    v32 = v29[1].i32[0];
    LODWORD(v30) = v30[1].i32[0];
    v33 = __OFADD__((_DWORD)v30, v32);
    v34 = (_DWORD)v30 + v32;
    v67 = vshr_n_s32((int32x2_t)vsra_n_u32(v31, v31, 0x1FuLL), 1uLL);
    if (v34 < 0 != v33)
      ++v34;
    v27 = v34 >> 1;
    goto LABEL_35;
  }
  if (v6 != -1)
  {
    v22 = 0;
    v35 = *(_QWORD *)(a1 + 1160) + 12 * v6;
    v67 = *(int32x2_t *)v35;
    v27 = *(_DWORD *)(v35 + 8);
    goto LABEL_35;
  }
  if (!*(_BYTE *)(a1 + 1156))
  {
    v22 = 0;
    v27 = 0;
    v67 = 0;
    goto LABEL_35;
  }
  sub_23CCBA5B8((uint64_t)&v68, (unsigned int *)a1, 3, 0);
  v27 = 0;
  v36 = v68;
  v37 = v69;
  v38 = 0;
LABEL_36:
  v65 = (int32x2_t *)(*(_QWORD *)(a1 + 1160) + 12 * a2);
  result = vadd_s32(v36, v38);
  *v65 = result;
  v65[1].i32[0] = v37 + v27;
  return result;
}

uint64_t sub_23CCBA5B8(uint64_t result, unsigned int *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _WORD *v10;
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v31;
  uint64_t j;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  int v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  _BOOL4 v56;
  __int16 v57;

  v6 = result;
  switch(a3)
  {
    case 0:
      v7 = 0;
      v8 = 0;
      for (i = 0; i != 384; i += 128)
      {
        result = sub_23CCB7064(a2, (_WORD *)(*a4 + v7));
        if ((_DWORD)result)
        {
          v56 = sub_23CCB7064(a2, (_WORD *)(a4[3] + v7));
          v10 = (_WORD *)(a4[6] + i);
          v11 = sub_23CCB7064(a2, v10);
          if (v11)
            v12 = 2;
          else
            v12 = 1;
          if (sub_23CCB7064(a2, &v10[v12]))
            v13 = 2;
          else
            v13 = 0;
          v14 = v13 | v11;
          if (sub_23CCB7064(a2, &v10[v14 + 3]))
            v15 = 4;
          else
            v15 = 0;
          v16 = v14 | v15;
          if (sub_23CCB7064(a2, &v10[v16 + 7]))
            v17 = 8;
          else
            v17 = 0;
          v18 = v16 | v17;
          if (sub_23CCB7064(a2, &v10[v18 + 15]))
            v19 = 16;
          else
            v19 = 0;
          v20 = v18 | v19;
          result = sub_23CCB7064(a2, &v10[v20 + 31]);
          if ((_DWORD)result)
            v21 = 32;
          else
            v21 = 0;
          v22 = v20 | v21;
          if (v22 == 63)
          {
            result = sub_23CCB7154(a2, *(_DWORD *)(a4[12] + v8), (_WORD *)(a4[9] + v7));
            v22 = result + 63;
          }
          if (v56)
            v23 = v22 + 1;
          else
            v23 = ~v22;
        }
        else
        {
          v23 = 0;
        }
        *(_DWORD *)(v6 + v8) = v23;
        v8 += 4;
        v7 += 2;
      }
      return result;
    case 2:
      v24 = 0;
      v25 = 0;
      while (1)
      {
        v26 = a4[12];
        result = sub_23CCB7218(a2, *(_DWORD *)(v26 + v24), (_WORD *)(a4[3] + v25), (_WORD *)(a4[9] + v25));
        v27 = (int)result >= 0 ? result : -(int)result;
        v28 = *(_DWORD *)(v26 + v24);
        v29 = v27 >> v28;
        if (v28 && v29 == 0)
          break;
        if (v29 >= 2)
        {
          v31 = 1;
LABEL_41:
          *(_DWORD *)(v26 + v24) = v31 + v28;
        }
        *(_DWORD *)(v6 + v24) = result;
        v25 += 2;
        v24 += 4;
        if (v25 == 6)
          return result;
      }
      v31 = -1;
      goto LABEL_41;
    case 3:
      for (j = 0; j != 3; ++j)
      {
        v33 = a2[j + 270];
        if (v33 < 1)
        {
          v35 = 0;
        }
        else
        {
          v34 = 0;
          v35 = 0;
          do
          {
            v57 = 0x8000;
            result = sub_23CCB7064(a2, &v57);
            v35 += (_DWORD)result << v34++;
          }
          while (v33 != v34);
        }
        *(_DWORD *)(v6 + 4 * j) = v35;
      }
      return result;
    case 4:
      v36 = 0;
      v37 = 0;
      v38 = 62;
      break;
    default:
      return result;
  }
  do
  {
    result = sub_23CCB7064(a2, (_WORD *)(*a4 + v36));
    if (!(_DWORD)result)
    {
      v55 = 0;
      goto LABEL_80;
    }
    v39 = sub_23CCB7064(a2, (_WORD *)(a4[3] + v36));
    v40 = a4[6] + v38;
    if (sub_23CCB7064(a2, (_WORD *)(v40 - 62)))
      v41 = 32;
    else
      v41 = 0;
    if (sub_23CCB7064(a2, (_WORD *)(v40 + (v41 >> 4) - 60)))
      v42 = 16;
    else
      v42 = 0;
    v43 = v42 | v41;
    if (sub_23CCB7064(a2, (_WORD *)(v40 + (v43 >> 3) - 56)))
      v44 = 8;
    else
      v44 = 0;
    v45 = v43 | v44;
    if (sub_23CCB7064(a2, (_WORD *)(v40 + (v45 >> 2) - 48)))
      v46 = 4;
    else
      v46 = 0;
    v47 = v45 | v46;
    if (sub_23CCB7064(a2, (_WORD *)(v40 + (v47 >> 1) - 32)))
      v48 = 2;
    else
      v48 = 0;
    v49 = v47 | v48;
    result = sub_23CCB7064(a2, (_WORD *)(v40 + v49));
    v50 = v49 | result;
    if ((v49 | result) == 0x3F)
    {
      v51 = a4[12];
      result = sub_23CCB7154(a2, *(_DWORD *)(v51 + v37), (_WORD *)(a4[9] + v36));
      v50 = result + 63;
      v52 = *(_DWORD *)(v51 + v37);
      v53 = ((int)result + 63) >> v52;
      if (!v52 || v53)
      {
        if (v53 < 2)
          goto LABEL_77;
        v54 = 1;
      }
      else
      {
        v54 = -1;
      }
      *(_DWORD *)(v51 + v37) = v54 + v52;
    }
LABEL_77:
    if (v39)
      v55 = v50 + 1;
    else
      v55 = ~v50;
LABEL_80:
    *(_DWORD *)(v6 + v37) = v55;
    v38 += 128;
    v37 += 4;
    v36 += 2;
  }
  while (v38 != 446);
  return result;
}

void sub_23CCBA9AC(uint64_t a1, int a2, int a3, int32x2_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 == 3 || a2 == 5)
  {
    if (a3 >= 1)
    {
      v5 = a3 + 1;
      do
      {
        if (*(_DWORD *)(a1 + 4384))
          break;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 1352) + (v5 - 2)))
          a4 = sub_23CCBA1DC(a1, *(_DWORD *)(*(_QWORD *)(a1 + 1328) + 4 * (v5 - 2)), a4);
        --v5;
      }
      while (v5 > 1);
    }
  }
  else if (a3 >= 1)
  {
    v6 = 0;
    v7 = a3;
    do
    {
      if (*(_DWORD *)(a1 + 4384))
        break;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 1352) + v6))
        a4 = sub_23CCBA1DC(a1, *(_DWORD *)(*(_QWORD *)(a1 + 1328) + 4 * v6), a4);
      ++v6;
    }
    while (v7 != v6);
  }
}

void sub_23CCBAA6C(_DWORD *a1, int *a2)
{
  int v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  void **v10;
  int **v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  int **v19;
  char *v20;
  char *v21;
  char *v22;
  int *v23;
  _DWORD *v24;
  unint64_t v25;

  if (*a2 >= 63)
    v4 = 63;
  else
    v4 = *a2;
  if (v4 <= a1[1])
    v5 = a1[1];
  else
    v5 = v4;
  v6 = &a1[6 * v4];
  v9 = *((_QWORD *)v6 + 1);
  v8 = (void **)(v6 + 2);
  v7 = v9;
  a1[1] = v5;
  v10 = v8 + 1;
  v11 = (int **)v8[1];
  v12 = ((uint64_t)v11 - v9) >> 3;
  a2[1] = v4;
  a2[2] = v12;
  v13 = (unint64_t)v8[2];
  if ((unint64_t)v11 >= v13)
  {
    if ((unint64_t)(v12 + 1) >> 61)
      sub_23CCB1C80();
    v15 = v13 - v7;
    v16 = v15 >> 2;
    if (v15 >> 2 <= (unint64_t)(v12 + 1))
      v16 = v12 + 1;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v16;
    if (v17)
      v18 = (char *)sub_23CCC0860((uint64_t)(v8 + 2), v17);
    else
      v18 = 0;
    v19 = (int **)&v18[8 * v12];
    v20 = &v18[8 * v17];
    *v19 = a2;
    v14 = v19 + 1;
    v21 = (char *)*v10;
    v22 = (char *)*v8;
    if (*v10 != *v8)
    {
      do
      {
        v23 = (int *)*((_QWORD *)v21 - 1);
        v21 -= 8;
        *--v19 = v23;
      }
      while (v21 != v22);
      v21 = (char *)*v8;
    }
    *v8 = v19;
    *v10 = v14;
    v8[2] = v20;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *v11 = a2;
    v14 = v11 + 1;
  }
  *v10 = v14;
  ++*a1;
  v24 = &a1[v4];
  v25 = (unint64_t)((char *)v14 - (_BYTE *)*v8) >> 3;
  if (v24[386] > (int)v25)
    LODWORD(v25) = v24[386];
  v24[386] = v25;
}

void sub_23CCBABC0(_DWORD *a1, int *a2)
{
  if (sub_23CCC160C(a1, (uint64_t)a2))
    sub_23CCBAA6C(a1, a2);
}

uint64_t sub_23CCBABFC(uint64_t a1, int a2, unsigned int a3, int *a4, _DWORD *a5, int *a6, int *a7)
{
  int v14;
  char v15;
  char v16;
  char v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  int v27;
  _BOOL4 v28;
  int v29;
  unsigned int v30;
  BOOL v31;
  int *v32;
  _WORD *v33;
  _BOOL4 v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  _DWORD *v47;
  _BOOL4 v48;
  uint64_t v49;
  int v50;
  int v51;
  _DWORD *v52;
  _DWORD *v53;
  unint64_t v54;
  uint64_t v56;
  char **v57;
  char *v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  _DWORD *v62;
  uint64_t v63;
  int v64;
  unsigned int *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  char *v71;
  uint64_t v72;
  int *v73;
  int v74;
  uint64_t v76;
  char *v77;
  int v78;
  int *v79;
  unint64_t v80;
  int v81;
  int v82;
  _BOOL4 v83;
  int v84;
  int *i;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _DWORD *v95;
  uint64_t v96;
  int v97;
  int v98;
  int *v99;
  int v100;
  unsigned int *v101;
  int v102;
  int v103;
  _DWORD *v104;
  int v105;
  char v106;
  char v107;
  int v108;
  unsigned int v109;
  int v110;
  int v111;

  v14 = *a6;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 16 * a3 + 3414)))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 1;
LABEL_3:
    v21 = 1;
  }
  else
  {
    v22 = a1 + 16 * a3;
    v23 = v22 + 3414;
    v24 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(v22 + 3416));
    v25 = 4;
    if (v24)
      v25 = 6;
    if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v23 + v25)))
      v26 = 2;
    else
      v26 = 0;
    v27 = v26 | v24;
    v28 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(v23 + 2 * (v26 | v24 | 4u)));
    v19 = v27 + 5;
    if (!v28)
      v19 = v27 + 1;
    v15 = 0;
    v21 = 0;
    v17 = 0;
    v20 = 1;
    v16 = 1;
    v18 = 1;
    switch(v19)
    {
      case 1:
        break;
      case 2:
        v15 = 0;
        v16 = 0;
        v17 = 0;
        goto LABEL_3;
      case 3:
        v20 = 0;
        v16 = 0;
        v18 = 0;
        goto LABEL_16;
      case 4:
        v20 = 0;
        v16 = 0;
LABEL_16:
        v15 = 1;
        goto LABEL_18;
      case 5:
        v15 = 0;
        v16 = 0;
        v18 = 0;
LABEL_18:
        v21 = 1;
        goto LABEL_21;
      case 6:
        v15 = 0;
        v21 = 0;
        goto LABEL_21;
      case 7:
        v20 = 0;
        v21 = 0;
        v15 = 1;
LABEL_21:
        v17 = 1;
        break;
      default:
        v15 = 0;
        v16 = 0;
        v19 = 8;
        v20 = 1;
        v21 = 1;
        v17 = 1;
        v18 = 1;
        break;
    }
  }
  *a4 = v19;
  v104 = a5;
  v102 = v21;
  v103 = v18;
  v105 = v20;
  v106 = v16;
  v107 = v15;
  if (*(_BYTE *)(a1 + 1153) && *(_BYTE *)(a1 + 1152))
  {
    v29 = *(_DWORD *)(*(_QWORD *)(a1 + 1472) + 12 * a2);
    if (v29 <= 19)
      v29 = 19;
    v30 = v29 - 19;
    v109 = v30 >> 1;
    v110 = 15;
    v31 = v30 >= 0x1E;
    v32 = &v110;
    if (!v31)
      v32 = (int *)&v109;
  }
  else
  {
    v111 = 7;
    v32 = (int *)(*(_QWORD *)(a1 + 1424) + 4 * a2);
    if (*v32 >= 7)
      v32 = &v111;
  }
  v33 = (_WORD *)(a1 + 6 * *v32 + 3308);
  v34 = sub_23CCB7064((unsigned int *)a1, v33);
  v35 = 2;
  if (!v34)
    v35 = 1;
  if (sub_23CCB7064((unsigned int *)a1, &v33[v35]))
    v36 = 2;
  else
    v36 = 0;
  v37 = v36 | v34;
  if ((v36 | v34) != 3)
  {
LABEL_39:
    v39 = *a6;
    if (v37 >= *(_DWORD *)(a1 + 1120) - *a6)
      goto LABEL_65;
    v99 = a7;
    v100 = a2;
    v40 = v37 + 1;
    v98 = v14;
    v101 = (unsigned int *)a4;
    switch(*(_DWORD *)(a1 + 1132))
    {
      case 0:
        v41 = *(_QWORD *)(a1 + 1208);
        v42 = v40;
        do
        {
          *(_DWORD *)(v41 + 4 * v39 + 4) = *(_DWORD *)(v41 + 4 * v39) + 3;
          v39 = *a6 + 1;
          *a6 = v39;
          --v42;
        }
        while (v42);
        v43 = v40;
        break;
      case 1:
        v44 = *(_QWORD *)(a1 + 1208);
        v45 = v40;
        do
        {
          *(_DWORD *)(v44 + 4 * v39 + 4) = *(_DWORD *)(v44 + 4 * v39) + 4;
          v39 = *a6 + 1;
          *a6 = v39;
          --v45;
        }
        while (v45);
        v43 = 2 * v40;
        break;
      case 2:
        v43 = 0;
        do
        {
          if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3406)))
            v46 = 4;
          else
            v46 = 3;
          v47 = (_DWORD *)(*(_QWORD *)(a1 + 1208) + 4 * *a6);
          v47[1] = *v47 + v46;
          ++*a6;
          v43 = v43 + v46 - 2;
          --v40;
        }
        while (v40);
        break;
      case 3:
        v43 = 0;
        do
        {
          v48 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3406));
          if (v48)
            v49 = 4;
          else
            v49 = 2;
          if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + v49 + 3406)))
            v50 = 2;
          else
            v50 = 0;
          v51 = v50 | v48;
          if (v51 == 3)
            v51 = sub_23CCB7154((unsigned int *)a1, 0, (_WORD *)(a1 + 3412)) + 3;
          v52 = (_DWORD *)(*(_QWORD *)(a1 + 1208) + 4 * *a6);
          v52[1] = v51 + *v52 + 3;
          ++*a6;
          v43 += v51 + 1;
          --v40;
        }
        while (v40);
        break;
      default:
        goto LABEL_65;
    }
    if (v43 <= 0 || v43 > *(_DWORD *)(a1 + 1124))
      goto LABEL_65;
    v54 = (v43 + 1);
    v97 = *(_DWORD *)(a1 + 1116);
    v56 = a1 + 1328;
    v57 = (char **)(a1 + 1352);
    sub_23CCB659C(a1 + 1328, v54);
    v58 = *(char **)(a1 + 1352);
    v59 = *(_QWORD *)(a1 + 1360) - (_QWORD)v58;
    if (v54 <= v59)
    {
      v60 = v100;
      if (v54 < v59)
        *(_QWORD *)(a1 + 1360) = &v58[v54];
    }
    else
    {
      sub_23CCC0EB0((unint64_t *)(a1 + 1352), v54 - v59);
      v58 = *v57;
      v60 = v100;
    }
    *v58 = v107;
    *(_BYTE *)(*(_QWORD *)(a1 + 1352) + v43) = v106;
    v61 = v43;
    v62 = *(_DWORD **)(a1 + 1328);
    v63 = *(_QWORD *)(a1 + 1448);
    v108 = *(_DWORD *)(v63 + 16 * v60);
    if ((v17 & 1) != 0)
    {
      if (!v105)
        goto LABEL_79;
      if (*(_BYTE *)(a1 + 1152))
        v64 = sub_23CCC0B74(a1, v60 - 1);
      else
        v64 = sub_23CCB7218((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + v60 - 1;
    }
    else
    {
      v64 = *(_DWORD *)(v63 + 16 * v60 + 4);
    }
    *v62 = v64;
LABEL_79:
    v31 = v43 >= 2;
    v65 = v101;
    if (v31)
    {
      if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3534)))
      {
        v66 = 1;
        do
          (*v57)[v66++] = 1;
        while (v61 != v66);
      }
      else if ((_DWORD)v54 == 3)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 1352) + 1) = 0;
        if (*(_BYTE *)(a1 + 1152))
          v67 = sub_23CCC0B74(a1, v97);
        else
          v67 = v97 - sub_23CCB7154((unsigned int *)a1, 0, (_WORD *)(a1 + 3532));
        *(_DWORD *)(*(_QWORD *)v56 + 4) = v67;
      }
      else
      {
        v68 = 1;
        do
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 1352) + v68) = sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3494));
          if (!*(_BYTE *)(*(_QWORD *)(a1 + 1352) + v68))
          {
            if (*(_BYTE *)(a1 + 1152))
              v69 = sub_23CCC0B74(a1, v97);
            else
              v69 = v97 - sub_23CCB7154((unsigned int *)a1, 0, (_WORD *)(a1 + 3532));
            *(_DWORD *)(*(_QWORD *)v56 + 4 * v68) = v69;
          }
          ++v68;
        }
        while (v61 != v68);
      }
    }
    if (*(_DWORD *)(a1 + 4384))
      return 0xFFFFFFFFLL;
    v70 = v98;
    if (v103)
    {
      if (!v102)
      {
LABEL_107:
        v53 = (_DWORD *)(a1 + 4384);
        if (*v65 == 3 || *v65 == 5)
        {
          v71 = *v57;
          v72 = v61;
          v73 = v99;
          do
          {
            if (v71[v72])
            {
              v74 = (*v104)++;
              *(_DWORD *)(*(_QWORD *)v56 + 4 * v72) = v74;
            }
          }
          while (v72-- > 0);
        }
        else
        {
          v76 = 0;
          v77 = *v57;
          v73 = v99;
          do
          {
            if (v77[v76])
            {
              v78 = (*v104)++;
              *(_DWORD *)(*(_QWORD *)v56 + 4 * v76) = v78;
            }
            ++v76;
          }
          while (v54 != v76);
        }
        v79 = *(int **)(a1 + 1328);
        v80 = v54;
        while (1)
        {
          v82 = *v79++;
          v81 = v82;
          if (v82 < 0 || v81 >= (int)((*(_QWORD *)(a1 + 1456) - *(_QWORD *)(a1 + 1448)) >> 4))
            goto LABEL_66;
          if (!--v80)
          {
            sub_23CCC0D34((_QWORD *)a1, v60, *v65, v54);
            if (*(_BYTE *)(a1 + 1152))
              v83 = *(_BYTE *)(a1 + 1153) == 0;
            else
              v83 = 1;
            v84 = 0;
            for (i = (int *)(*(_QWORD *)(a1 + 1328) + 4); ; ++i)
            {
              v86 = *(i - 1);
              v87 = *i;
              if (!v84)
              {
                v88 = *v73;
                if ((int)v88 + 2 > *(_DWORD *)(a1 + 1124))
                  goto LABEL_66;
                v84 = *(_DWORD *)(*(_QWORD *)(a1 + 1208) + 4 * (v70 + 1))
                    - *(_DWORD *)(*(_QWORD *)(a1 + 1208) + 4 * v70)
                    - 2;
                *v73 = v88 + 1;
                v89 = *(_QWORD *)(a1 + 1184);
                *(_DWORD *)(v89 + 4 * v88) = v60;
                v90 = *v73;
                *v73 = v90 + 1;
                *(_DWORD *)(v89 + 4 * v90) = v86;
                ++v70;
              }
              v91 = *v73;
              if ((int)v91 >= *(_DWORD *)(a1 + 1124))
                break;
              v92 = v86;
              *v73 = v91 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 1184) + 4 * v91) = v87;
              v93 = *(_QWORD *)(a1 + 1448);
              v94 = v93 + 16 * v87;
              *(_DWORD *)(v94 + 4) = v86;
              *(_DWORD *)(v94 + 8) = v60;
              v95 = (_DWORD *)(v93 + 16 * v86);
              *v95 = v87;
              v95[3] = v60;
              if (v83)
              {
                v96 = *(_QWORD *)(a1 + 1424);
                ++*(_DWORD *)(v96 + 4 * v92);
                ++*(_DWORD *)(v96 + 4 * v87);
              }
              --v84;
              if (!--v61)
                return v54;
            }
            goto LABEL_66;
          }
        }
      }
      if (*(_BYTE *)(a1 + 1152))
        v108 = sub_23CCC0B74(a1, v60 + 1);
      else
        v108 = sub_23CCB7218((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + v60 + 1;
      v70 = v98;
      v65 = v101;
    }
    v62[v61] = v108;
    goto LABEL_107;
  }
  v38 = sub_23CCB7154((unsigned int *)a1, 0, (_WORD *)(a1 + 3404));
  if (v38 >= -3)
  {
    v37 = v38 + 3;
    goto LABEL_39;
  }
LABEL_65:
  v53 = (_DWORD *)(a1 + 4384);
LABEL_66:
  *v53 = 3;
  return 0xFFFFFFFFLL;
}

uint64_t sub_23CCBB478(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t result;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  unint64_t v22;
  unsigned int v23;
  int **v24;
  uint64_t i;
  BOOL v26;
  unsigned int v27;
  uint64_t v28;
  int *v29;
  int v30;
  char v31;
  int *v32;
  char v33;
  unint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  char *v38;
  _BYTE *v39;
  _BYTE *v40;
  uint64_t v41;
  int v42;
  int *v43;
  int *v44;
  unint64_t v45;
  int v46;
  int **v47;

  result = 5;
  if (a2 && a5)
  {
    if (*(_DWORD *)(a1 + 4384))
      return 6;
    v16 = (unsigned int *)sub_23CCB68BC(a2, a3, a1 + 4320);
    result = 3;
    if (v16)
    {
      if ((v15 & 0x8000000000000000) == 0)
      {
        v17 = *(unsigned int *)(a1 + 4328);
        if (a3 - v17 >= 0 && (unint64_t)v16 + v15 >= a2)
        {
          v18 = a2 + v17;
          if (v18 >= (unint64_t)v16)
          {
            v19 = v18 - (_QWORD)v16;
            if ((uint64_t)(v18 - (_QWORD)v16) >= 0)
            {
              v20 = *(_DWORD *)(a1 + 1124);
              if (v20 >= 1)
              {
                v21 = *(_DWORD *)(a1 + 4332);
                if (v21 >= 1)
                {
                  v22 = *(unsigned int *)(a1 + 4336);
                  if ((int)v22 >= 1
                    && *(_DWORD *)(a1 + 4356) == 3
                    && *(_DWORD *)(a1 + 4340) == v20
                    && (a7 || !*(_DWORD *)(a1 + 4364))
                    && (a6 || !*(_DWORD *)(a1 + 4360)))
                  {
                    if ((*(_DWORD *)(a1 + 4376) - 5) >= 2)
                    {
                      v23 = *(_DWORD *)(a1 + 4348);
                    }
                    else
                    {
                      if ((_DWORD)v22 != 2)
                        return result;
                      v23 = *(_DWORD *)(a1 + 4348);
                      if (!v23)
                        return result;
                    }
                    if (v23 > 0x1B)
                      return result;
                    v24 = (int **)(a1 + 4056);
                    v47 = (int **)(a1 + 4080);
                    sub_23CCB659C(a1 + 4080, v22);
                    for (i = 0; i != v22; ++i)
                    {
                      v26 = v19 < 4;
                      v19 -= 4;
                      if (v26)
                      {
                        v19 = 0;
                        v16 = 0;
                      }
                      else
                      {
                        v27 = *v16++;
                        (*v47)[i] = v27;
                      }
                    }
                    sub_23CCB659C(a1 + 4056, v22);
                    v28 = 0;
                    result = 3;
                    do
                    {
                      while (!v19)
                      {
                        v16 = 0;
                        if (++v28 == v22)
                          return result;
                      }
                      v29 = *v24;
                      --v19;
                      v30 = *(unsigned __int8 *)v16;
                      v16 = (unsigned int *)((char *)v16 + 1);
                      (*v24)[v28++] = v30;
                    }
                    while (v28 != v22);
                    if (!v16)
                      return 3;
                    v31 = 0;
                    v32 = *v47;
                    v33 = 1;
                    v34 = v22;
                    do
                    {
                      v35 = *v32++;
                      v31 |= v35 != 0;
                      v36 = *v29++;
                      v33 &= v36 < 29;
                      --v34;
                    }
                    while (v34);
                    if ((v33 & 1) == 0)
                      return 3;
                    v38 = sub_23CCB4CE0(a1, v16, v19);
                    result = 3;
                    if (!v38 || v37 < 0)
                      return result;
                    if (*(_DWORD *)(a1 + 4364))
                      sub_23CCBB778(a1);
                    if (*(_QWORD *)(a1 + 4112) - *(_QWORD *)(a1 + 4104) != *(_QWORD *)(a1 + 1192)
                                                                          - *(_QWORD *)(a1 + 1184))
                      return 3;
                    result = sub_23CCBBC88(a1, a5, a6);
                    if (!(_DWORD)result)
                    {
                      if (a7)
                      {
                        v39 = *(_BYTE **)(a1 + 4104);
                        v40 = *(_BYTE **)(a1 + 4112);
                        if (v40 != v39)
                          memmove(a7, v39, v40 - v39);
                      }
                      if ((v31 & 1) != 0)
                      {
                        LODWORD(v41) = 0;
                        v42 = 0;
                        v43 = *v47;
                        do
                        {
                          v41 = (int)v41;
                          v44 = v43;
                          v45 = v22;
                          do
                          {
                            v46 = *v44++;
                            *(_DWORD *)(a5 + 4 * v41++) += v46;
                            --v45;
                          }
                          while (v45);
                          ++v42;
                        }
                        while (v42 != v21);
                      }
                      result = 0;
                      *a4 = *(unsigned int *)(a1 + 4328);
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
  return result;
}

void sub_23CCBB778(uint64_t a1)
{
  uint64_t v2;
  int **v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  unsigned int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  _BOOL8 v16;
  _BOOL8 v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  _QWORD *v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int **v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  int **v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  _WORD *v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _DWORD *v71;
  void *__p[3];
  __int16 v73;
  __int16 v74;
  __int16 v75;
  __int16 v76;
  _WORD __b[3];
  _DWORD v78[10];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned int *)(a1 + 1116);
  v3 = (int **)(a1 + 4248);
  sub_23CCBC22C(a1 + 4248, v2);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  v76 = 0x8000;
  v75 = 0x8000;
  if ((int)v2 >= 1)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = (unsigned int *)(*(_QWORD *)(a1 + 1256) + v4);
      v7 = *v6;
      if ((v7 & 0x80000000) != 0)
        v8 = 0;
      else
        v8 = (*v3)[v7 + 1];
      v9 = v6[1];
      if ((v9 & 0x80000000) != 0)
        v10 = 0;
      else
        v10 = (*v3)[v9 + 1];
      v11 = (unsigned int *)(*(_QWORD *)(a1 + 1280) + v4);
      v12 = *v11;
      if ((v12 & 0x80000000) != 0)
        v13 = 0;
      else
        v13 = (*v3)[v12 + 1];
      v14 = v11[1];
      if ((v14 & 0x80000000) != 0)
        v15 = 0;
      else
        v15 = (*v3)[v14 + 1];
      v16 = v13 == v15;
      if (v8 == v10)
        v17 = v16 + 1;
      else
        v17 = v16;
      if (sub_23CCB7064((unsigned int *)a1, &__b[v17]))
      {
        v18 = 1;
      }
      else if (sub_23CCB7064((unsigned int *)a1, &v76))
      {
        v18 = 0;
      }
      else
      {
        v18 = sub_23CCB7154((unsigned int *)a1, 0, &v75) + 2;
      }
      (*v3)[v5] += v18;
      v4 += 12;
      ++v5;
    }
    while (12 * v2 != v4);
  }
  sub_23CCBC298(v3);
  v19 = *(_DWORD *)(a1 + 4332);
  sub_23CCB659C(a1 + 4128, 0);
  v78[0] = -1;
  sub_23CCBA1AC(a1 + 4128, v19, v78);
  v74 = 0x8000;
  v73 = 0x8000;
  if ((int)v2 > 0)
  {
    v20 = 0;
    v21 = 0;
    v22 = *(_QWORD *)(a1 + 4248);
    do
    {
      v23 = v20 + 1;
      v24 = *(_DWORD *)(v22 + 4 * (v20 + 1)) - *(_DWORD *)(v22 + 4 * v20);
      if (v24 >= 1)
      {
        do
        {
          if (sub_23CCB7064((unsigned int *)a1, &v74))
          {
            v22 = *(_QWORD *)(a1 + 4248);
            v25 = *(_DWORD *)(v22 + 4 * v20);
            v26 = *(_QWORD *)(a1 + 4272);
            v27 = *(_DWORD *)(v26 + 4 * v20);
            *(_DWORD *)(v26 + 4 * v20) = v27 + 1;
            *(_DWORD *)(*(_QWORD *)(a1 + 4296) + 4 * (v27 + v25)) = v21;
            v28 = v21++;
            v29 = (_QWORD *)(a1 + 4128);
            v30 = v20;
          }
          else
          {
            v31 = sub_23CCB7154((unsigned int *)a1, 0, &v73);
            v22 = *(_QWORD *)(a1 + 4248);
            v32 = *(_DWORD *)(v22 + 4 * v20);
            v33 = *(_QWORD *)(a1 + 4272);
            v34 = *(_DWORD *)(v33 + 4 * v20);
            v30 = v21 + ~v31;
            *(_DWORD *)(v33 + 4 * v20) = v34 + 1;
            v28 = v34 + v32;
            v29 = (_QWORD *)(a1 + 4296);
          }
          *(_DWORD *)(*v29 + 4 * v28) = v30;
          --v24;
        }
        while (v24);
      }
      ++v20;
    }
    while (v23 != v2);
  }
  v35 = *(_QWORD *)(a1 + 4296);
  v36 = (int **)(a1 + 4176);
  sub_23CCBC22C(a1 + 4176, v19);
  v37 = *(unsigned int *)(a1 + 1120);
  v78[0] = 0;
  sub_23CCC14E0(__p, (int)v2, v78);
  memset_pattern16(v78, &unk_23CCD46A0, 0x28uLL);
  sub_23CCB659C(a1 + 4104, (uint64_t)(*(_QWORD *)(a1 + 1192) - *(_QWORD *)(a1 + 1184)) >> 2);
  if ((int)v37 >= 1)
  {
    v38 = 0;
    v39 = 0;
    v69 = v37;
    do
    {
      v40 = *(_QWORD *)(a1 + 1208);
      v41 = *(int *)(v40 + 4 * v38);
      v70 = v38 + 1;
      v42 = *(_DWORD *)(v40 + 4 * (v38 + 1));
      if ((int)v41 < v42)
      {
        v71 = __p[0];
        do
        {
          v43 = *(int *)(*(_QWORD *)(a1 + 1184) + 4 * v41);
          v44 = *(_DWORD *)(*(_QWORD *)(a1 + 4248) + 4 * v43);
          v45 = *(_DWORD *)(*(_QWORD *)(a1 + 4272) + 4 * v43);
          if (v45 >= 2)
          {
            v46 = v36;
            v47 = v35;
            if (v39 >= 1)
              v48 = 1;
            else
              v48 = v39;
            v49 = v71[v43];
            v71[v43] = v49 + 1;
            if (v49 >= 4)
              v50 = 4;
            else
              v50 = v49;
            v51 = v48 + 2 * v50;
            if (sub_23CCB7064((unsigned int *)a1, &v78[v51]))
            {
              v52 = v45 - 1;
              if ((v45 - 1) < 2)
              {
                v39 = 1;
              }
              else
              {
                v53 = (_WORD *)&v78[v51] + 1;
                v39 = 1;
                do
                {
                  v54 = sub_23CCB7064((unsigned int *)a1, v53);
                  v39 += v54;
                  if (v52 < 3)
                    break;
                  --v52;
                }
                while ((v54 & 1) != 0);
              }
            }
            else
            {
              v39 = 0;
            }
            v44 += v39;
            v35 = v47;
            v36 = v46;
          }
          v55 = *(_DWORD *)(v35 + 4 * v44);
          *(_DWORD *)(*(_QWORD *)(a1 + 4104) + 4 * v41) = v55;
          ++(*v36)[v55 + 1];
          ++v41;
        }
        while (v42 != (_DWORD)v41);
      }
      v37 = v69;
      v38 = v70;
    }
    while (v70 != v69);
  }
  sub_23CCBC298(v36);
  if ((int)v37 >= 1)
  {
    v56 = 0;
    v57 = *(_QWORD *)(a1 + 1208);
    do
    {
      v58 = *(int *)(v57 + 4 * v56);
      v59 = v56 + 1;
      v60 = *(int *)(v57 + 4 * (v56 + 1));
      if ((int)v58 < (int)v60)
      {
        v61 = *(_QWORD *)(a1 + 4176);
        v62 = *(_QWORD *)(a1 + 4200);
        v63 = *(_QWORD *)(a1 + 4224);
        v64 = v60 - v58;
        v65 = (int *)(*(_QWORD *)(a1 + 4104) + 4 * v58);
        do
        {
          v66 = *v65++;
          v67 = *(_DWORD *)(v61 + 4 * v66);
          v68 = *(_DWORD *)(v62 + 4 * v66);
          *(_DWORD *)(v62 + 4 * v66) = v68 + 1;
          *(_DWORD *)(v63 + 4 * (v68 + v67)) = v56;
          --v64;
        }
        while (v64);
      }
      ++v56;
    }
    while (v59 != v37);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_23CCBBC64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_23CCBBC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  _WORD __b[2];

  if (*(_DWORD *)(a1 + 4360) == 1)
  {
    memset_pattern16(__b, &unk_23CCD46A0, 4uLL);
    v6 = *(unsigned int *)(a1 + 4332);
    if ((int)v6 >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = *(unsigned int *)(*(_QWORD *)(a1 + 4128) + 4 * v7);
        v21 = -1;
        v20 = -1;
        v19 = -1;
        v18 = -1;
        if ((v8 & 0x80000000) != 0)
        {
LABEL_22:
          v14 = 0;
          goto LABEL_23;
        }
        v9 = (unsigned int *)(*(_QWORD *)(a1 + 1280) + 12 * v8);
        sub_23CCBBE94((_QWORD *)a1, v8, v7, (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v8), &v20);
        sub_23CCBBE94((_QWORD *)a1, v8, v7, v9, &v18);
        v10 = v21;
        if ((v21 & 0x80000000) == 0 || v19 < 0)
        {
          v12 = v21;
          v10 = v19;
        }
        else
        {
          v11 = v20;
          v20 = v18;
          v12 = v19;
          v21 = v19;
          v18 = v11;
        }
        if (v10 != -1)
        {
          v13 = *(unsigned __int8 *)(a3 + SHIDWORD(v20))
              + *(unsigned __int8 *)(a3 + (int)v20)
              + *(unsigned __int8 *)(a3 + v12)
              + *(unsigned __int8 *)(a3 + (int)v18)
              + *(unsigned __int8 *)(a3 + SHIDWORD(v18))
              + *(unsigned __int8 *)(a3 + v10) > 2;
          goto LABEL_13;
        }
        if (v12 != -1)
        {
          v13 = *(unsigned __int8 *)(a3 + SHIDWORD(v20))
              + *(unsigned __int8 *)(a3 + (int)v20)
              + *(unsigned __int8 *)(a3 + v12) > 1;
LABEL_13:
          v14 = v13;
          goto LABEL_23;
        }
        if (HIDWORD(v20) == -1)
          break;
        v14 = *(unsigned __int8 *)(a3 + (int)v20);
        if (*(_BYTE *)(a3 + (int)v20))
        {
          v15 = *(unsigned __int8 *)(a3 + SHIDWORD(v20));
LABEL_21:
          v14 = v15 != 0;
        }
LABEL_23:
        *(_BYTE *)(a3 + v7++) = sub_23CCB7064((unsigned int *)a1, &__b[v14]);
        if (v6 == v7)
          goto LABEL_24;
      }
      if ((_DWORD)v20 == -1)
        goto LABEL_22;
      v15 = *(unsigned __int8 *)(a3 + (int)v20);
      goto LABEL_21;
    }
  }
LABEL_24:
  v16 = *(unsigned int *)(a1 + 4376);
  if (v16 > 6)
    return 3;
  ((void (*)(uint64_t, uint64_t, uint64_t))off_250DE4368[2 * v16])(a1, a2, a3);
  return 0;
}

_QWORD *sub_23CCBBE94(_QWORD *result, unsigned int a2, int a3, unsigned int *a4, _DWORD *a5)
{
  uint64_t v5;
  _QWORD *v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = *a4;
  *(_QWORD *)a5 = -1;
  a5[2] = -1;
  if ((v5 & 0x80000000) == 0)
  {
    v7 = result;
    v8 = a5 + 1;
    v35 = result[537];
    v9 = result[534];
    v10 = *(_DWORD *)(v9 + 4 * a2);
    v11 = a4[2];
    v12 = (int)a4[1];
    v13 = a4[1];
    if ((v11 & 0x80000000) != 0)
    {
      if ((v12 & 0x80000000) == 0)
      {
        v20 = *(_DWORD *)(v9 + 4 * v5);
        v21 = *(_DWORD *)(v9 + 4 * v13);
        if (v10 == 1 && v20 == 1 && v21 == 1)
        {
          v34 = result[531];
          *a5 = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v5));
          a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v13));
        }
        else
        {
          return sub_23CCBC0A4(result, a3, a2, v5, v13, a5, v8);
        }
      }
    }
    else
    {
      v14 = *(_DWORD *)(v9 + 4 * v5);
      v15 = *(_DWORD *)(v9 + 4 * v12);
      if (v10 == 1 && v14 == 1 && v15 == 1)
      {
        v24 = result[531];
        v19 = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v5));
        *a5 = v19;
        a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v12));
        if (v19 < 0)
          return result;
      }
      else
      {
        v18 = a4[1];
        result = sub_23CCBC0A4(result, a3, a2, v5, v12, a5, v8);
        v13 = v18;
        v19 = *a5;
        if ((*a5 & 0x80000000) != 0)
          return result;
      }
      v25 = *v8;
      if ((v25 & 0x80000000) == 0)
      {
        v26 = *(int *)(v7[534] + 4 * v11);
        if ((_DWORD)v26 == 1 && v14 == 1 && v15 == 1)
        {
          a5[2] = *(_DWORD *)(v35 + 4 * *(int *)(v7[531] + 4 * v11));
        }
        else if ((int)v26 >= 1)
        {
          v29 = *(int *)(v7[531] + 4 * v11);
          v30 = v29 + v26;
          do
          {
            v31 = *(_DWORD *)(v35 + 4 * v29);
            v36 = 0;
            v32 = v13;
            result = sub_23CCBC0A4(v7, v31, v11, v5, v13, (_DWORD *)&v36 + 1, (int *)&v36);
            if (HIDWORD(v36) == v19 && (_DWORD)v36 == v25)
              a5[2] = v31;
            ++v29;
            v13 = v32;
          }
          while (v29 < v30);
        }
      }
    }
  }
  return result;
}

_QWORD *sub_23CCBC0A4(_QWORD *result, int a2, int a3, int a4, int a5, _DWORD *a6, int *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;

  v7 = *(int *)(result[525] + 4 * a2);
  if ((int)v7 >= 1)
  {
    v8 = *(int *)(result[522] + 4 * a2);
    v9 = v8 + v7;
    v10 = result[148];
    while (2)
    {
      v11 = (int *)(result[151] + 4 * *(int *)(result[528] + 4 * v8));
      v12 = *v11;
      v13 = v11[1];
      v14 = *(_DWORD *)(v10 + 4 * v12);
      v15 = (int)v12 + 1;
      v16 = 4 * v15 - 4;
      v17 = v15 + 1;
      while (v17 < v13)
      {
        v18 = *(_DWORD *)(v10 + v16 + 4);
        v19 = *(_DWORD *)(v10 + v16 + 8);
        if (v14 == a3 && v18 == a4 && v19 == a5)
        {
          v27 = result[513] + v16;
          *a6 = *(_DWORD *)(v27 + 4);
LABEL_41:
          v26 = *(_DWORD *)(v27 + 8);
          goto LABEL_45;
        }
        if (v14 == a3 && v19 == a4 && v18 == a5)
        {
          v28 = result[513] + v16;
          *a7 = *(_DWORD *)(v28 + 4);
LABEL_43:
          v33 = *(_DWORD *)(v28 + 8);
          goto LABEL_46;
        }
        if (v18 == a3 && v14 == a4 && v19 == a5)
        {
          v29 = result[513];
          *a6 = *(_DWORD *)(v29 + 4 * v12);
          v27 = v29 + v16;
          goto LABEL_41;
        }
        if (v18 == a3 && v19 == a4 && v14 == a5)
        {
          v30 = result[513];
          *a7 = *(_DWORD *)(v30 + 4 * v12);
          v28 = v30 + v16;
          goto LABEL_43;
        }
        if (v19 == a3 && v14 == a4 && v18 == a5)
        {
          v31 = result[513];
          *a6 = *(_DWORD *)(v31 + 4 * v12);
          v26 = *(_DWORD *)(v31 + v16 + 4);
          goto LABEL_45;
        }
        v16 += 4;
        ++v17;
        if (v19 == a3 && v18 == a4 && v14 == a5)
        {
          v32 = result[513];
          *a7 = *(_DWORD *)(v32 + 4 * v12);
          v33 = *(_DWORD *)(v32 + v16);
LABEL_46:
          *a6 = v33;
          return result;
        }
      }
      if (++v8 < v9)
        continue;
      break;
    }
  }
  v26 = -1;
  *a6 = -1;
LABEL_45:
  *a7 = v26;
  return result;
}

void sub_23CCBC22C(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  int v5;

  v3 = a1;
  sub_23CCB659C(a1, 0);
  v5 = 0;
  sub_23CCBA1AC(v3, a2 + 1, &v5);
  v3 += 24;
  sub_23CCB659C(v3, 0);
  v4 = 0;
  sub_23CCBA1AC(v3, a2, &v4);
}

void sub_23CCBC298(int **a1)
{
  int *v1;
  int *v2;
  unint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  int v6;
  int v7;
  uint64_t v8;

  v2 = *a1;
  v1 = a1[1];
  v3 = (char *)v1 - (char *)*a1;
  if ((int)(v3 >> 2) >= 2)
  {
    v4 = (v3 >> 2);
    v7 = *v2;
    v5 = v2 + 1;
    v6 = v7;
    v8 = v4 - 1;
    do
    {
      v6 += *v5;
      *v5++ = v6;
      --v8;
    }
    while (v8);
  }
  sub_23CCB659C((uint64_t)(a1 + 6), *(v1 - 1));
}

void sub_23CCBC2D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int32x2_t v8;
  int *v9;
  uint64_t v10;
  int32x2_t *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int32x2_t v20;
  int32x2_t v21;
  _BOOL4 v22;
  uint64_t v23;
  int v24;
  int v25;
  double v26;
  int32x2_t v27;
  int32x2_t v28;
  int32x2_t v29;
  int32x2_t v30;
  int v31;
  int32x2_t v32;
  int32x2_t v33;
  int v34;
  int32x2_t v35;
  int32x2_t v36;
  int v37;
  _BOOL4 v38;
  uint64_t v39;
  int v40;
  int v41;
  int32x2_t v42;
  int32x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  int v46;
  int32x2_t v47;
  int32x2_t v48;
  unsigned int v49;
  uint32x2_t v50;
  __int32 v51;
  int v52;
  _BOOL4 v53;
  double v54;
  int32x2_t v55;
  int32x2_t v56;
  int32x2_t v57;
  int32x2_t v58;
  int v59;
  int32x2_t v60;
  int32x2_t v61;
  int v62;
  int32x2_t v63;
  int32x2_t v64;
  int32x2_t v65;
  int32x2_t v66;
  int v67;
  int32x2_t v68;
  int32x2_t v69;
  int v70;
  int32x2_t v71;
  int32x2_t v72;
  int v73;
  int32x2_t v74;
  int32x2_t v75;
  int v76;
  int32x2_t v77;
  int32x2_t v78;
  int v79;
  int32x2_t v80;
  int32x2_t v81;
  int v82;
  int32x2_t v83;
  int32x2_t v84;
  uint32x2_t v85;
  BOOL v86;
  int v87;
  int32x2_t v88;
  int64x2_t v89;
  unint64_t v90;
  uint32x2_t v91;
  int v92;
  int64x2_t v93;
  int v94;
  int v95;
  int32x2_t v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  _BOOL4 v101;
  int v102;
  int v103;
  int *v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  unint64_t v120;
  char *v121;
  void *v122;
  void *v123;
  char *v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  int v129;
  int v130;
  int v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  int32x2_t v135;
  int v137;
  int v138;
  uint64_t v139;
  int v140;
  int v141;
  uint64_t v142;
  _DWORD v143[2];
  unint64_t v144;
  _DWORD v145[2];
  __int16 v146;
  __int16 v147;
  _WORD v148[3];
  _WORD __b[3];
  _OWORD v150[22];
  uint64_t v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v133 = (_QWORD *)(a1 + 4056);
  v139 = *(int *)(a1 + 4336);
  v137 = ~(-1 << (*(_DWORD *)(a1 + 4348) - 1));
  v138 = *(_DWORD *)(a1 + 4360);
  v134 = *(unsigned int *)(a1 + 4332);
  sub_23CCBD068((_QWORD *)(a1 + 1160), (_QWORD *)(a1 + 1208), (_QWORD *)(a1 + 1184), (uint64_t *)(a1 + 4104), v134, (uint64_t *)(a1 + 4152), v137);
  v5 = 0;
  v151 = 0;
  memset(v150, 0, sizeof(v150));
  do
  {
    sub_23CCB7FFC((uint64_t)v150 + v5, v139);
    v5 += 120;
  }
  while (v5 != 360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v148, &unk_23CCD46A0, 6uLL);
  v147 = 0x8000;
  v146 = 0x8000;
  if ((int)v134 > 0)
  {
    v6 = 0;
    v7 = 0;
    v132 = a3;
    v8 = vdup_n_s32(v137);
    v131 = 2 * v137;
    v9 = (int *)(a2 + 4);
    while (v138 && !*(_BYTE *)(a3 + v7))
    {
LABEL_163:
      ++v7;
      v9 += v139;
      v6 += 12;
      if (v134 == v7)
        goto LABEL_166;
    }
    v10 = *(unsigned int *)(*(_QWORD *)(a1 + 4128) + 4 * v7);
    v11 = (int32x2_t *)(*(_QWORD *)(a1 + 4152) + v6);
    v12 = v11[1].i32[0];
    v13 = v12;
    v135 = *v11;
    if ((v10 & 0x80000000) == 0)
    {
      v145[0] = -1;
      v144 = -1;
      v143[0] = -1;
      v142 = -1;
      sub_23CCBBE94((_QWORD *)a1, v10, v7, (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v10), &v144);
      sub_23CCBBE94((_QWORD *)a1, v10, v7, (unsigned int *)(*(_QWORD *)(a1 + 1280) + 12 * v10), &v142);
      v14 = v145[0];
      v15 = v143[0];
      if ((v145[0] & 0x80000000) == 0 || (v143[0] & 0x80000000) != 0)
      {
        v17 = v142;
        v16 = HIDWORD(v142);
        v18 = v145[0];
      }
      else
      {
        v17 = v144;
        v16 = HIDWORD(v144);
        v144 = v142;
        v18 = v143[0];
        v145[0] = v143[0];
        v15 = v14;
      }
      v19 = HIDWORD(v144);
      if (v15 != -1
        && (!v138
         || *(_BYTE *)(a3 + (int)v144)
         && *(_BYTE *)(a3 + SHIDWORD(v144))
         && *(_BYTE *)(a3 + v18)
         && *(_BYTE *)(a3 + v17)
         && *(_BYTE *)(a3 + v16)
         && *(_BYTE *)(a3 + v15)))
      {
        v128 = v17;
        v129 = v16;
        v20 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        v21 = vabs_s32(vrev64_s32(v20));
        v130 = v137 - v21.i32[1] - v21.i32[0];
        if (v130 < 0)
          v20 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v20), (int8x8_t)vsub_s32(v21, v8), (int8x8_t)__PAIR64__(v137 - v21.i32[1], v137 - v21.i32[0]));
        v22 = sub_23CCB7064((unsigned int *)a1, v148);
        v23 = 2;
        if (!v22)
          v23 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &v148[v23]))
          v24 = 2;
        else
          v24 = 0;
        v25 = v24 | v22;
        if (v25 == 2)
        {
          v57 = vsub_s32(*(int32x2_t *)(a2 + 4 * v128 * (int)v139), v8);
          v58 = vabs_s32(vrev64_s32(v57));
          v59 = v137 - v58.i32[1] - v58.i32[0];
          if (v59 < 0)
            v57 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v57), (int8x8_t)vsub_s32(v58, v8), (int8x8_t)__PAIR64__(v137 - v58.i32[1], v137 - v58.i32[0]));
          v60 = vsub_s32(*(int32x2_t *)(a2 + 4 * v129 * (int)v139), v8);
          v61 = vabs_s32(vrev64_s32(v60));
          v62 = v137 - v61.i32[1] - v61.i32[0];
          if (v62 < 0)
            v60 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v60), (int8x8_t)vsub_s32(v61, v8), (int8x8_t)__PAIR64__(v137 - v61.i32[1], v137 - v61.i32[0]));
          v63 = vsub_s32(*(int32x2_t *)(a2 + 4 * v15 * (int)v139), v8);
          v64 = vabs_s32(vrev64_s32(v63));
          if (v137 - v64.i32[1] - v64.i32[0] < 0)
            v63 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v63), (int8x8_t)vsub_s32(v64, v8), (int8x8_t)__PAIR64__(v137 - v64.i32[1], v137 - v64.i32[0]));
          v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v60, v57), v63));
          v12 = v62 + v59 - (v137 - v64.i32[1] - v64.i32[0]);
        }
        else if (v25 == 1)
        {
          v65 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          v66 = vabs_s32(vrev64_s32(v65));
          v67 = v137 - v66.i32[1] - v66.i32[0];
          if (v67 < 0)
            v65 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v65), (int8x8_t)vsub_s32(v66, v8), (int8x8_t)__PAIR64__(v137 - v66.i32[1], v137 - v66.i32[0]));
          v68 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
          v69 = vabs_s32(vrev64_s32(v68));
          v70 = v137 - v69.i32[1] - v69.i32[0];
          if (v70 < 0)
            v68 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v68), (int8x8_t)vsub_s32(v69, v8), (int8x8_t)__PAIR64__(v137 - v69.i32[1], v137 - v69.i32[0]));
          v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v65, v20), v68));
          v12 = v67 + v130 - v70;
        }
        else if (v25)
        {
          v71 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          v72 = vabs_s32(vrev64_s32(v71));
          v73 = v137 - v72.i32[1] - v72.i32[0];
          if (v73 < 0)
            v71 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v71), (int8x8_t)vsub_s32(v72, v8), (int8x8_t)__PAIR64__(v137 - v72.i32[1], v137 - v72.i32[0]));
          v74 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
          v75 = vabs_s32(vrev64_s32(v74));
          v76 = v137 - v75.i32[1] - v75.i32[0];
          if (v76 < 0)
            v74 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v74), (int8x8_t)vsub_s32(v75, v8), (int8x8_t)__PAIR64__(v137 - v75.i32[1], v137 - v75.i32[0]));
          v77 = vsub_s32(*(int32x2_t *)(a2 + 4 * v128 * (int)v139), v8);
          v78 = vabs_s32(vrev64_s32(v77));
          v79 = v137 - v78.i32[1] - v78.i32[0];
          if (v79 < 0)
            v77 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v77), (int8x8_t)vsub_s32(v78, v8), (int8x8_t)__PAIR64__(v137 - v78.i32[1], v137 - v78.i32[0]));
          v80 = vsub_s32(*(int32x2_t *)(a2 + 4 * v129 * (int)v139), v8);
          v81 = vabs_s32(vrev64_s32(v80));
          v82 = v137 - v81.i32[1] - v81.i32[0];
          if (v82 < 0)
            v80 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v80), (int8x8_t)vsub_s32(v81, v8), (int8x8_t)__PAIR64__(v137 - v81.i32[1], v137 - v81.i32[0]));
          v83 = vsub_s32(*(int32x2_t *)(a2 + 4 * v15 * (int)v139), v8);
          v84 = vabs_s32(vrev64_s32(v83));
          if (v137 - v84.i32[1] - v84.i32[0] < 0)
            v83 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v83), (int8x8_t)vsub_s32(v84, v8), (int8x8_t)__PAIR64__(v137 - v84.i32[1], v137 - v84.i32[0]));
          v85 = (uint32x2_t)vadd_s32(v77, v20);
          v86 = __OFADD__(v79, v130);
          v87 = v79 + v130;
          if (v87 < 0 != v86)
            ++v87;
          v88 = vadd_s32(v80, v71);
          v89 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v88, v88), (int32x2_t)vsra_n_u32(v85, v85, 0x1FuLL), 1uLL), vadd_s32(v74, v83)), vdup_n_s32(0x55555556u));
          v26 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v89, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v89, 0x3FuLL))));
          v90 = 1431655766 * ((v87 >> 1) + 2 * (v82 + v73) - (v76 + v137 - v84.i32[1] - v84.i32[0]));
          v12 = HIDWORD(v90) + (v90 >> 63);
        }
        else
        {
          v26 = *(double *)&v135;
          v27 = vzip1_s32(v20, v135);
          v28 = vzip2_s32(v20, v135);
          if (v27.i32[0] * (uint64_t)v27.i32[1] + v12 * (uint64_t)v130 + v28.i32[0] * (uint64_t)v28.i32[1] < 0)
          {
            v26 = COERCE_DOUBLE(vneg_s32(v135));
            v12 = -v12;
          }
        }
        v49 = 2;
        goto LABEL_110;
      }
      if (v18 != -1 && (!v138 || *(_BYTE *)(a3 + (int)v144) && *(_BYTE *)(a3 + SHIDWORD(v144)) && *(_BYTE *)(a3 + v18)))
      {
        v29 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        v30 = vabs_s32(vrev64_s32(v29));
        v31 = v137 - v30.i32[1] - v30.i32[0];
        if (v31 < 0)
          v29 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v29), (int8x8_t)vsub_s32(v30, v8), (int8x8_t)__PAIR64__(v137 - v30.i32[1], v137 - v30.i32[0]));
        v32 = vsub_s32(*(int32x2_t *)(a2 + 4 * HIDWORD(v144) * (int)v139), v8);
        v33 = vabs_s32(vrev64_s32(v32));
        v34 = v137 - v33.i32[1] - v33.i32[0];
        if (v34 < 0)
          v32 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v32), (int8x8_t)vsub_s32(v33, v8), (int8x8_t)__PAIR64__(v137 - v33.i32[1], v137 - v33.i32[0]));
        v35 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
        v36 = vabs_s32(vrev64_s32(v35));
        v37 = v137 - v36.i32[1] - v36.i32[0];
        if (v37 < 0)
          v35 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v35), (int8x8_t)vsub_s32(v36, v8), (int8x8_t)__PAIR64__(v137 - v36.i32[1], v137 - v36.i32[0]));
        v38 = sub_23CCB7064((unsigned int *)a1, __b);
        v39 = 2;
        if (!v38)
          v39 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v39]))
          v40 = 2;
        else
          v40 = 0;
        v41 = v40 | v38;
        if (v41 == 2)
        {
          v91 = (uint32x2_t)vsub_s32(v32, (int32x2_t)vmvn_s8((int8x8_t)v29));
          v26 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v91, v91, 0x1FuLL), 1uLL));
          if (v31 + v34 + 1 >= 0)
            v92 = v31 + v34 + 1;
          else
            v92 = v31 + v34 + 2;
          v12 = v92 >> 1;
        }
        else if (v41 == 1)
        {
          v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v32, v29), v35));
          v12 = v34 + v31 - v37;
        }
        else if (v41)
        {
          v93 = vmull_s32(vadd_s32(vsub_s32(v32, (int32x2_t)vmvn_s8((int8x8_t)v29)), v35), vdup_n_s32(0x55555556u));
          v26 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v93, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v93, 0x3FuLL))));
          v12 = (v31 + v34 + v37 + 1) / 3;
        }
        else
        {
          v26 = *(double *)&v135;
          v42 = vzip1_s32(v29, v135);
          v43 = vzip2_s32(v29, v135);
          if (v42.i32[0] * (uint64_t)v42.i32[1] + v12 * (uint64_t)v31 + v43.i32[0] * (uint64_t)v43.i32[1] < 0)
          {
            v26 = COERCE_DOUBLE(vneg_s32(v135));
            v12 = -v12;
          }
        }
        v49 = 1;
        goto LABEL_110;
      }
      if (HIDWORD(v144) != -1 && (!v138 || *(_BYTE *)(a3 + (int)v144) && *(_BYTE *)(a3 + SHIDWORD(v144))))
      {
        v44 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        v45 = vabs_s32(vrev64_s32(v44));
        v46 = v137 - v45.i32[1] - v45.i32[0];
        if (v46 < 0)
          v44 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v44), (int8x8_t)vsub_s32(v45, v8), (int8x8_t)__PAIR64__(v137 - v45.i32[1], v137 - v45.i32[0]));
        if (sub_23CCB7064((unsigned int *)a1, &v147))
        {
          v47 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          v48 = vabs_s32(vrev64_s32(v47));
          if (v137 - v48.i32[1] - v48.i32[0] < 0)
            v47 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v47), (int8x8_t)vsub_s32(v48, v8), (int8x8_t)__PAIR64__(v137 - v48.i32[1], v137 - v48.i32[0]));
          v49 = 0;
          v50 = (uint32x2_t)vsub_s32(v47, (int32x2_t)vmvn_s8((int8x8_t)v44));
          v51 = v46 + v137 - v48.i32[1] - v48.i32[0];
          v26 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v50, v50, 0x1FuLL), 1uLL));
          if (v51 + 1 >= 0)
            v52 = v51 + 1;
          else
            v52 = v51 + 2;
          v12 = v52 >> 1;
LABEL_110:
          v94 = LODWORD(v26);
          v141 = LODWORD(v26);
          v95 = HIDWORD(v26);
          v140 = HIDWORD(v26);
          v96 = vabs_s32(*(int32x2_t *)&v26);
          v97 = v96.u32[1];
          if (v12 >= 0)
            v98 = v12;
          else
            v98 = -v12;
          v99 = v96.i32[0];
          v101 = v96.i32[0] < (unsigned __int32)v96.i32[1] || v96.i32[0] < v98;
          if (v101)
          {
            v99 = v98;
            v102 = HIDWORD(v26);
            v103 = LODWORD(v26);
            if (v96.i32[1] < v98)
              goto LABEL_124;
            v104 = &v140;
            v99 = v96.u32[1];
            v102 = v12;
            v103 = LODWORD(v26);
          }
          else
          {
            v104 = &v141;
            v102 = HIDWORD(v26);
            v103 = v12;
          }
          *v104 = v12;
LABEL_124:
          v144 = __PAIR64__(v102, v103);
          v145[0] = v99;
          sub_23CCB6B9C((unsigned int *)a1, (uint64_t)&v144, v139, v133, (_BYTE *)(a1 + 4372), (_QWORD *)v150 + 15 * v49, (uint64_t)&v142);
          v106 = v142;
          v105 = HIDWORD(v142);
          if ((int)v142 >= 0)
            v107 = v142;
          else
            v107 = -(int)v142;
          if (v142 >= 0)
            v108 = HIDWORD(v142);
          else
            v108 = -HIDWORD(v142);
          v109 = v137 - v107;
          v110 = v137 - v107 - v108;
          if (v110 < 0)
          {
            v113 = v137 - v108;
            v114 = v108 - v137;
            if ((int)v142 >= 0)
              v106 = v113;
            else
              v106 = v114;
            v115 = v107 - v137;
            if (v142 >= 0)
              v105 = v109;
            else
              v105 = v115;
            if (v101)
              goto LABEL_132;
          }
          else if (v101)
          {
LABEL_132:
            if (v12 >= 0)
              v111 = v110;
            else
              v111 = -v110;
            if (v95 < 0)
              v110 = -v110;
            if (v97 >= v98)
              v112 = v105;
            else
              v112 = v111;
            if (v97 >= v98)
              v105 = v110;
            goto LABEL_152;
          }
          v112 = v106;
          if (v94 >= 0)
            v106 = v110;
          else
            v106 = -v110;
LABEL_152:
          if (v105 >= 0)
            v116 = v105;
          else
            v116 = -v105;
          if (v106 < 0)
          {
            v117 = -v106;
          }
          else
          {
            v116 = v131 - v116;
            v117 = v106;
          }
          if (v105 >= 0)
            v117 = v131 - v117;
          v118 = v106 + v137;
          v119 = v105 + v137;
          if (v112 < 0)
          {
            v118 = v116;
            v119 = v117;
          }
          *(v9 - 1) = v118;
          *v9 = v119;
          a3 = v132;
          goto LABEL_163;
        }
        v26 = *(double *)&v135;
        v55 = vzip1_s32(v44, v135);
        v56 = vzip2_s32(v44, v135);
        if (v55.i32[0] * (uint64_t)v55.i32[1] + v12 * (uint64_t)v46 + v56.i32[0] * (uint64_t)v56.i32[1] < 0)
        {
          v49 = 0;
          v26 = COERCE_DOUBLE(vneg_s32(v135));
          v12 = -v12;
          goto LABEL_110;
        }
LABEL_76:
        v49 = 0;
        goto LABEL_110;
      }
      v13 = v12;
    }
    if (sub_23CCBD3F4(a1, v7, a2, a3, (uint64_t)&v144))
    {
      if (sub_23CCB7064((unsigned int *)a1, &v147))
      {
        v12 = v145[0];
        v26 = *(double *)&v144;
      }
      else
      {
        v26 = *(double *)&v135;
        if ((int)v144 * (uint64_t)v135.i32[0] + SHIDWORD(v144) * (uint64_t)v135.i32[1] + v145[0] * (uint64_t)v13 < 0)
        {
          v26 = COERCE_DOUBLE(vneg_s32(v135));
          v12 = -v12;
        }
      }
    }
    else
    {
      v53 = sub_23CCB7064((unsigned int *)a1, &v146);
      v26 = *(double *)&v135;
      v54 = COERCE_DOUBLE(vneg_s32(v135));
      if (v53)
      {
        v12 = -v12;
        v26 = v54;
      }
    }
    goto LABEL_76;
  }
LABEL_166:
  v120 = 360;
  do
  {
    v121 = (char *)v150 + v120;
    v122 = *(void **)&v145[v120 / 4];
    if (v122)
    {
      *((_QWORD *)v121 - 2) = v122;
      operator delete(v122);
    }
    v123 = (void *)*((_QWORD *)v121 - 6);
    if (v123)
    {
      *(_QWORD *)&v143[v120 / 4] = v123;
      operator delete(v123);
    }
    v124 = (char *)v150 + v120;
    v125 = *(void **)((char *)&v150[-4] + v120 - 8);
    if (v125)
    {
      *((_QWORD *)v124 - 8) = v125;
      operator delete(v125);
    }
    v126 = (void *)*((_QWORD *)v124 - 12);
    if (v126)
    {
      *(_QWORD *)((char *)&v150[-5] + v120 - 8) = v126;
      operator delete(v126);
    }
    v127 = (void *)*((_QWORD *)v121 - 15);
    if (v127)
    {
      *(_QWORD *)((char *)&v150[-7] + v120) = v127;
      operator delete(v127);
    }
    v120 -= 120;
  }
  while (v120);
}

void sub_23CCBD03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t i;

  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a31 + i));
  _Unwind_Resume(a1);
}

void sub_23CCBD068(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t *a4, int a5, uint64_t *a6, int a7)
{
  unint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int *v26;
  int *v27;
  int *v28;
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
  int *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  int *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v71;
  uint64_t v72;
  void *__p[3];

  v12 = a2[1] - *a2;
  v13 = a5;
  sub_23CCBFEB0(a6, a5);
  v14 = a6[1] - *a6;
  if (v14 >= 1)
    bzero((void *)*a6, 12 * (v14 / 0xCuLL - ((unint64_t)v14 > 0xB)) + 12);
  LOBYTE(v71) = 0;
  sub_23CCC0FD8(__p, v13, &v71);
  if ((int)(v12 >> 2) >= 2)
  {
    v15 = 0;
    v16 = (v12 >> 2) - 1;
    do
    {
      v17 = *(int *)(*a2 + 4 * v15++);
      v18 = *(_DWORD *)(*a2 + 4 * v15) - 1;
      if ((int)v17 + 1 >= v18)
        continue;
      v19 = v17 + 1;
      do
      {
        v20 = 0;
        v21 = *(_DWORD *)(*a3 + 4 * v17);
        v22 = 4 * v19;
        v23 = *(_DWORD *)(*a3 + 4 * v19++);
        v24 = *(_DWORD *)(*a3 + 4 * v19);
        v25 = *a4;
        v71 = *(_DWORD *)(*a4 + 4 * v17);
        v72 = *(_QWORD *)(v25 + v22);
        v26 = (int *)(*a1 + 12 * v21);
        v27 = (int *)(*a1 + 12 * v23);
        v28 = (int *)(*a1 + 12 * v24);
        v29 = *v26;
        v30 = v26[1];
        v31 = *v27 - v29;
        v32 = *v28 - v29;
        v33 = v27[1] - v30;
        v34 = v28[1] - v30;
        v35 = v26[2];
        v36 = v27[2] - v35;
        v37 = v28[2] - v35;
        v38 = v37 * v33 - v34 * v36;
        v39 = v32 * v36 - v37 * v31;
        v40 = v34 * v31 - v32 * v33;
        do
        {
          v41 = *(int *)((char *)&v71 + v20);
          v42 = (int *)(*a6 + 12 * (int)v41);
          v43 = *((_BYTE *)__p[0] + v41);
          if (!v43)
          {
            v48 = v39 + v42[1];
            v49 = v40 + v42[2];
            v45 = v38;
            goto LABEL_18;
          }
          v44 = 1 << (v43 - 1);
          if (v38 < 0)
          {
            v45 = -((v44 - v38) >> v43);
            if ((v39 & 0x8000000000000000) == 0)
            {
LABEL_11:
              v46 = (v44 + v39) >> v43;
              if (v40 < 0)
                goto LABEL_16;
              goto LABEL_12;
            }
          }
          else
          {
            v45 = (v44 + v38) >> v43;
            if ((v39 & 0x8000000000000000) == 0)
              goto LABEL_11;
          }
          v46 = -((v44 - v39) >> v43);
          if (v40 < 0)
          {
LABEL_16:
            v47 = -((v44 - v40) >> v43);
            goto LABEL_17;
          }
LABEL_12:
          v47 = (v44 + v40) >> v43;
LABEL_17:
          v48 = v46 + v42[1];
          v49 = v47 + v42[2];
LABEL_18:
          v50 = v45 + *v42;
          v51 = fabs((double)v50);
          v52 = fabs((double)v48);
          v53 = fabs((double)v49);
          if (v51 < v52)
            v51 = v52;
          if (v51 < v53)
            v51 = v53;
          v54 = (uint64_t)v51 + 1;
          if (v54 >> 30)
          {
            v55 = __clz(v54);
            v56 = 34 - v55;
            *((_BYTE *)__p[0] + v41) = v43 + 34 - v55;
            v57 = 1 << (33 - v55);
            if (v50 < 0)
              v50 = -(uint64_t)((unint64_t)(v57 - v50) >> (34 - v55));
            else
              v50 = (unint64_t)(v57 + v50) >> (34 - v55);
            if (v48 < 0)
              v48 = -(uint64_t)((unint64_t)(v57 - v48) >> v56);
            else
              v48 = (unint64_t)(v57 + v48) >> v56;
            if (v49 < 0)
              v49 = -(uint64_t)((unint64_t)(v57 - v49) >> v56);
            else
              v49 = (unint64_t)(v57 + v49) >> v56;
          }
          *v42 = v50;
          v42[1] = v48;
          v42[2] = v49;
          v20 += 4;
        }
        while (v20 != 12);
      }
      while (v18 != (_DWORD)v19);
    }
    while (v15 != v16);
  }
  v58 = (int *)*a6;
  v59 = (int *)a6[1];
  if ((int *)*a6 != v59)
  {
    do
    {
      v60 = *v58;
      v61 = v58[1];
      v62 = v58[2];
      if (v60 >= 0)
        v63 = *v58;
      else
        v63 = -v60;
      if (v61 >= 0)
        v64 = v58[1];
      else
        v64 = -v61;
      if (v62 >= 0)
        v65 = v58[2];
      else
        v65 = -v62;
      v66 = v64 + v63 + v65;
      if (v66)
      {
        v67 = (int)v60 * (uint64_t)a7 / v66;
        v68 = (int)v61 * (uint64_t)a7 / v66;
        v69 = (int)v62 * (uint64_t)a7 / v66;
      }
      else
      {
        LODWORD(v67) = 0;
        LODWORD(v68) = 0;
        LODWORD(v69) = a7;
      }
      *v58 = v67;
      v58[1] = v68;
      v58[2] = v69;
      v58 += 3;
    }
    while (v58 != v59);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

uint64_t sub_23CCBD3F4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int32x2_t v24;
  int32x2_t v25;

  v5 = *(_DWORD *)(a1 + 4360);
  v6 = *(unsigned int *)(a1 + 4336);
  v7 = *(int *)(*(_QWORD *)(a1 + 4176) + 4 * a2);
  v8 = *(_DWORD *)(*(_QWORD *)(a1 + 4200) + 4 * a2);
  v9 = *(_QWORD *)(a1 + 4224);
  v10 = *(_DWORD *)(a1 + 4348);
  *(_QWORD *)a5 = 0;
  *(_DWORD *)(a5 + 8) = 0;
  if (v8 < 1)
    return 0;
  result = 0;
  v13 = 0;
  v14 = ~(-1 << (v10 - 1));
  v15 = v8 + v7;
  v16 = *(_QWORD *)(a1 + 1208);
  v17 = 0;
  v18 = vdup_n_s32(v14);
  do
  {
    v19 = (int *)(v16 + 4 * *(int *)(v9 + 4 * v7));
    v21 = *v19;
    v20 = v19[1];
    if ((int)v21 < (int)v20)
    {
      v22 = *(_QWORD *)(a1 + 4104);
      do
      {
        v23 = *(int *)(v22 + 4 * v21);
        if ((int)v23 < a2 && (!v5 || *(_BYTE *)(a4 + v23)))
        {
          v24 = vsub_s32(*(int32x2_t *)(a3 + 4 * (int)v23 * (int)v6), v18);
          v25 = vabs_s32(vrev64_s32(v24));
          if ((int)(v14 - v25.i32[1] - v25.i32[0]) < 0)
            v24 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v24), (int8x8_t)vsub_s32(v25, v18), (int8x8_t)__PAIR64__(v14 - v25.i32[1], v14 - v25.i32[0]));
          v17 = vadd_s32(v24, v17);
          *(int32x2_t *)a5 = v17;
          v13 += v14 - v25.i32[1] - v25.i32[0];
          *(_DWORD *)(a5 + 8) = v13;
          result = (result + 1);
        }
        ++v21;
      }
      while (v21 < v20 && (int)result < 4);
    }
    ++v7;
  }
  while (v7 < v15 && (int)result < 4);
  if ((int)v6 >= 1 && (int)result >= 2)
  {
    do
    {
      *(int *)a5 /= (int)result;
      a5 += 4;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_23CCBD53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  _BOOL4 v17;
  int v18;
  int v19;
  char *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  int v40;
  uint64_t v41;
  int v42;
  int v44;
  int v45;
  char v46;
  char v47;
  _DWORD v48[3];
  int v49;
  int v50;
  int v51;
  __int16 v52;
  __int16 v53;
  void *v54[2];
  void *v55[2];
  __int128 v56;
  void *v57[2];
  void *v58[2];
  __int128 v59;
  void *__p[2];
  uint64_t v61;

  v4 = *(unsigned int *)(a1 + 4332);
  v5 = *(_DWORD *)(a1 + 4336);
  v42 = *(_DWORD *)(a1 + 4360);
  v40 = ~(-1 << (*(_DWORD *)(a1 + 4348) - 1));
  sub_23CCBD068((_QWORD *)(a1 + 1160), (_QWORD *)(a1 + 1208), (_QWORD *)(a1 + 1184), (uint64_t *)(a1 + 4104), v4, (uint64_t *)(a1 + 4152), v40);
  v61 = 0;
  v59 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v57 = 0u;
  *(_OWORD *)v58 = 0u;
  *(_OWORD *)v55 = 0u;
  v56 = 0u;
  *(_OWORD *)v54 = 0u;
  sub_23CCB7FFC((uint64_t)v54, v5);
  v53 = 0x8000;
  v52 = 0x8000;
  if ((int)v4 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v37 = v4;
    v36 = 2 * v40;
    v8 = (int *)(a2 + 4);
    v38 = v5;
    v41 = 4 * v5;
    while (v42 && !*(_BYTE *)(a3 + v7))
    {
LABEL_72:
      ++v7;
      v8 = (int *)((char *)v8 + v41);
      v6 += 12;
      if (v4 == v7)
        goto LABEL_73;
    }
    v9 = (int *)(*(_QWORD *)(a1 + 4152) + v6);
    v11 = *v9;
    v10 = v9[1];
    v12 = v9[2];
    if (sub_23CCBD3F4(a1, v7, a2, a3, (uint64_t)&v49))
    {
      if (sub_23CCB7064((unsigned int *)a1, &v53))
      {
        v10 = v50;
        v12 = v51;
        v11 = v49;
      }
      else if (v49 * (uint64_t)v11 + v50 * (uint64_t)v10 + v51 * (uint64_t)v12 < 0)
      {
        v11 = -v11;
        v10 = -v10;
        v12 = -v12;
      }
    }
    else if (sub_23CCB7064((unsigned int *)a1, &v52))
    {
      v11 = -v11;
      v10 = -v10;
      v12 = -v12;
    }
    if (v11 >= 0)
      v13 = v11;
    else
      v13 = -v11;
    if (v10 >= 0)
      v14 = v10;
    else
      v14 = -v10;
    if (v12 >= 0)
      v15 = v12;
    else
      v15 = -v12;
    v17 = v13 < v14 || v13 < v15;
    if (v17)
    {
      v13 = v15;
      v18 = v10;
      v19 = v11;
      if (v14 < v15)
      {
LABEL_33:
        v48[0] = v19;
        v48[1] = v18;
        v48[2] = v13;
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v48, v38, (_QWORD *)(a1 + 4056), (_BYTE *)(a1 + 4372), v54, (uint64_t)&v44);
        v21 = v44;
        v22 = v45;
        if (v44 >= 0)
          v23 = v44;
        else
          v23 = -v44;
        if (v45 >= 0)
          v24 = v45;
        else
          v24 = -v45;
        v25 = v40 - v23;
        v26 = v40 - v23 - v24;
        if (v26 < 0)
        {
          v27 = v40 - v24;
          v28 = v24 - v40;
          if (v44 >= 0)
            v21 = v27;
          else
            v21 = v28;
          v29 = v23 - v40;
          if (v45 >= 0)
            v22 = v25;
          else
            v22 = v29;
        }
        v30 = -v26;
        if (v12 >= 0)
          v31 = v26;
        else
          v31 = -v26;
        if (v10 >= 0)
          v30 = v26;
        if (v14 < v15)
          v30 = v22;
        else
          v31 = v22;
        if (v11 < 0)
          v26 = -v26;
        if (v17)
          v22 = v30;
        else
          v31 = v21;
        if (!v17)
          v21 = v26;
        if (v22 >= 0)
          v32 = v22;
        else
          v32 = -v22;
        if (v21 < 0)
        {
          v33 = -v21;
        }
        else
        {
          v32 = v36 - v32;
          v33 = v21;
        }
        if (v22 >= 0)
          v33 = v36 - v33;
        v34 = v21 + v40;
        v35 = v22 + v40;
        if (v31 < 0)
        {
          v34 = v32;
          v35 = v33;
        }
        *(v8 - 1) = v34;
        *v8 = v35;
        v4 = v37;
        goto LABEL_72;
      }
      v20 = &v46;
      v13 = v14;
      v18 = v12;
      v19 = v11;
    }
    else
    {
      v20 = &v47;
      v18 = v10;
      v19 = v12;
    }
    *(_DWORD *)v20 = v12;
    goto LABEL_33;
  }
LABEL_73:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v58[1])
  {
    *(void **)&v59 = v58[1];
    operator delete(v58[1]);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
  if (v55[1])
  {
    *(void **)&v56 = v55[1];
    operator delete(v55[1]);
  }
  if (v54[0])
  {
    v54[1] = v54[0];
    operator delete(v54[0]);
  }
}

void sub_23CCBD8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  sub_23CCB8124((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23CCBD8BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int *v15;
  int v16;
  unint64_t v17;
  int *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int *v26;
  int *v27;
  _BOOL4 v28;
  uint64_t v29;
  int v30;
  int v31;
  int *v32;
  int *v33;
  int *v34;
  uint64_t v35;
  _DWORD *v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int *v43;
  int *v44;
  int *v45;
  _BOOL4 v46;
  uint64_t v47;
  int v48;
  int v49;
  _DWORD *v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  _BOOL4 v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  _DWORD *v62;
  char *v63;
  _BOOL4 v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  int *v68;
  int *v69;
  int *v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  BOOL v75;
  int v76;
  _DWORD *v77;
  uint64_t v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int *v84;
  int *v85;
  uint64_t v86;
  int v87;
  int v88;
  _DWORD *v89;
  _DWORD *v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int *v95;
  uint64_t v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  uint64_t v104;
  int *v105;
  unint64_t v106;
  unint64_t v107;
  char *v108;
  int v109;
  int v110;
  int v111;
  unint64_t v112;
  char *v113;
  int *v114;
  uint64_t v115;
  int v116;
  int v117;
  int v118;
  _DWORD *v119;
  uint64_t v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  unint64_t v126;
  _BYTE *v127;
  void *v128;
  void *v129;
  _BYTE *v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  int v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  int v144;
  int v145;
  _QWORD *v146;
  uint64_t v147;
  unint64_t v148;
  int v149;
  uint64_t v150;
  _DWORD *v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  int v155;
  unint64_t v156;
  int v157;
  unint64_t v158;
  int v159;
  void *__p;
  _QWORD v161[2];
  void *v162;
  void *v163;
  void *v164;
  _DWORD v165[5];
  _WORD v166[3];
  _WORD v167[3];
  _WORD __b[3];
  __int16 v169;
  _QWORD v170[44];
  uint64_t v171;
  uint64_t v172;

  v6 = 0;
  v172 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned int *)(a1 + 4332);
  v8 = *(int *)(a1 + 4336);
  v146 = (_QWORD *)(a1 + 4056);
  v140 = *(_DWORD *)(a1 + 4360);
  v9 = *(unsigned int *)(a1 + 4336);
  v171 = 0;
  memset(v170, 0, sizeof(v170));
  do
  {
    sub_23CCB7FFC((uint64_t)&v170[v6], v8);
    v6 += 15;
  }
  while (v6 != 45);
  v169 = 0x8000;
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v167, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v166, &unk_23CCD46A0, 6uLL);
  sub_23CCC16CC(&v164, v8);
  LODWORD(__p) = 0;
  sub_23CCC14E0(&v162, v8, &__p);
  v10 = v140;
  LODWORD(v158) = 0;
  sub_23CCC14E0(&__p, v8, &v158);
  if ((int)v7 >= 1)
  {
    v11 = 0;
    v136 = 4 * v9;
    v137 = a3;
    v12 = 4 * v8;
    v13 = (_DWORD *)a2;
    v147 = a2;
    v148 = v8;
    v141 = 4 * v8;
    v142 = v7;
    v150 = v8;
    while (v10 && !*(_BYTE *)(a3 + v11))
    {
LABEL_114:
      ++v11;
      v13 = (_DWORD *)((char *)v13 + v12);
      if (v11 == v7)
        goto LABEL_121;
    }
    v14 = *(unsigned int *)(*(_QWORD *)(a1 + 4128) + 4 * v11);
    v151 = v13;
    if ((v14 & 0x80000000) == 0)
    {
      v15 = (int *)(*(_QWORD *)(a1 + 1256) + 12 * v14);
      v16 = *v15;
      LODWORD(v158) = *v15;
      LODWORD(v17) = v15[1];
      HIDWORD(v158) = v17;
      v149 = v15[2];
      v159 = v149;
      v18 = (int *)(*(_QWORD *)(a1 + 1280) + 12 * v14);
      v144 = v18[1];
      v145 = *v18;
      LODWORD(v156) = *v18;
      HIDWORD(v156) = v144;
      v143 = v18[2];
      v157 = v143;
      v155 = -1;
      v154 = -1;
      v153 = -1;
      v152 = -1;
      sub_23CCBBE94((_QWORD *)a1, v14, v11, (unsigned int *)&v158, &v154);
      sub_23CCBBE94((_QWORD *)a1, v14, v11, (unsigned int *)&v156, &v152);
      v19 = v155;
      v20 = v153;
      if ((v155 & 0x80000000) == 0 || v153 < 0)
      {
        v138 = v16;
        v21 = v152;
        v22 = HIDWORD(v152);
      }
      else
      {
        v144 = v17;
        v145 = v16;
        v158 = v156;
        v143 = v149;
        v159 = v157;
        v21 = v154;
        v22 = HIDWORD(v154);
        v154 = v152;
        v20 = v155;
        v19 = v153;
        v155 = v153;
        v17 = HIDWORD(v156);
        v149 = v157;
        v138 = v156;
      }
      v24 = (int)v154;
      v23 = SHIDWORD(v154);
      v139 = v17;
      if (v20 != -1
        && (!v10
         || *(_BYTE *)(a3 + (int)v154)
         && *(_BYTE *)(a3 + SHIDWORD(v154))
         && *(_BYTE *)(a3 + v19)
         && *(_BYTE *)(a3 + v21)
         && *(_BYTE *)(a3 + v22)
         && *(_BYTE *)(a3 + v20)))
      {
        v134 = v22;
        v135 = v21;
        a2 = v147;
        v25 = (int *)(v147 + 4 * (int)v154 * (int)v150);
        v26 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v148);
        v27 = (int *)(v147 + 4 * v19 * (int)v150);
        v28 = sub_23CCB7064((unsigned int *)a1, v166);
        v29 = 1;
        if (v28)
          v29 = 2;
        if (sub_23CCB7064((unsigned int *)a1, &v166[v29]))
          v30 = 2;
        else
          v30 = 0;
        v31 = v30 | v28;
        if (v31)
        {
          v32 = (int *)(v147 + 4 * v135 * (int)v148);
          v33 = (int *)(v147 + 4 * v134 * (int)v150);
          v34 = (int *)(v147 + 4 * v20 * (int)v148);
          if (v31 == 2)
          {
            sub_23CCAE5A4(v25, v26, v27, v150, (int *)(*(_QWORD *)(a1 + 1160) + 12 * v138), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v139), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v149), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), v162);
            sub_23CCAE5A4(v32, v33, v34, v148, (int *)(*(_QWORD *)(a1 + 1160) + 12 * v145), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v144), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v143), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), __p);
            v35 = v150;
            if ((int)v150 >= 1)
            {
              v84 = (int *)v162;
              v85 = (int *)__p;
              v86 = v150;
              do
              {
                v87 = *v85++;
                v88 = v87 + *v84;
                if (v88 < 0 != __OFADD__(v87, *v84))
                  ++v88;
                *v84++ = v88 >> 1;
                --v86;
              }
              while (v86);
            }
            goto LABEL_98;
          }
          if (v31 == 1)
          {
            v35 = v150;
            if ((int)v150 >= 1)
            {
              v36 = v162;
              v37 = v150;
              do
              {
                v39 = *v32++;
                v38 = v39;
                v40 = *v33++;
                v41 = v40 + v38;
                v42 = *v34++;
                *v36++ = v41 - v42;
                --v37;
              }
              while (v37);
            }
            goto LABEL_98;
          }
          if ((_DWORD)v148 == 2)
          {
            sub_23CCAECA0((unint64_t)v25, v26, v27, (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v139), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), (int *)v162);
            sub_23CCAECA0((unint64_t)v32, v33, v34, (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v145), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v144), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), (int *)__p);
            v89 = v162;
            v90 = __p;
            v91 = *((_DWORD *)v162 + 1);
            v92 = *(_DWORD *)__p + *(_DWORD *)v162;
            if (v92 < 0 != __OFADD__(*(_DWORD *)__p, *(_DWORD *)v162))
              ++v92;
            *(_DWORD *)v162 = v92 >> 1;
            v93 = v90[1];
            v75 = __OFADD__(v93, v91);
            v94 = v93 + v91;
            if (v94 < 0 != v75)
              ++v94;
            v89[1] = v94 >> 1;
          }
          else if ((int)v148 >= 1)
          {
            v107 = 0;
            v108 = (char *)v162;
            v35 = v150;
            do
            {
              v109 = v25[v107 / 4];
              v110 = v32[v107 / 4];
              v75 = __OFADD__(v110, v109);
              v111 = v110 + v109;
              if (v111 < 0 != v75)
                ++v111;
              v112 = 1431655766
                   * ((v111 >> 1) - (v27[v107 / 4] + v34[v107 / 4]) + 2 * (v33[v107 / 4] + v26[v107 / 4]));
              *(_DWORD *)&v108[v107] = HIDWORD(v112) + (v112 >> 63);
              v107 += 4;
              v59 = 2;
            }
            while (v136 != v107);
            goto LABEL_108;
          }
          goto LABEL_106;
        }
        if ((int)v148 < 1)
        {
LABEL_106:
          v59 = 2;
LABEL_107:
          v35 = v150;
          goto LABEL_108;
        }
        v77 = v162;
        v35 = v150;
        v78 = v150;
        do
        {
          v80 = *v25++;
          v79 = v80;
          v81 = *v26++;
          v82 = v81 + v79;
          v83 = *v27++;
          *v77++ = v82 - v83;
          --v78;
        }
        while (v78);
        goto LABEL_98;
      }
      if (v19 != -1 && (!v10 || *(_BYTE *)(a3 + (int)v154) && *(_BYTE *)(a3 + SHIDWORD(v154)) && *(_BYTE *)(a3 + v19)))
      {
        v43 = (int *)(v147 + 4 * (int)v154 * (int)v150);
        v44 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v148);
        v45 = (int *)(v147 + 4 * v19 * (int)v150);
        v46 = sub_23CCB7064((unsigned int *)a1, v167);
        v47 = 1;
        if (v46)
          v47 = 2;
        if (sub_23CCB7064((unsigned int *)a1, &v167[v47]))
          v48 = 2;
        else
          v48 = 0;
        v49 = v48 | v46;
        if (v49 == 2)
        {
          sub_23CCAE5A4(v43, v44, v45, v148, (int *)(*(_QWORD *)(a1 + 1160) + 12 * v138), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v139), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v149), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), v162);
          a2 = v147;
          v35 = v150;
          if ((int)v148 >= 1)
          {
            v95 = (int *)v162;
            v96 = v150;
            do
            {
              v98 = *v43++;
              v97 = v98;
              v99 = *v44++;
              v100 = v99 + v97;
              v101 = *v45++;
              v102 = v100 - v101;
              v75 = __OFADD__(v102, *v95);
              v103 = v102 + *v95;
              if (v103 < 0 != v75)
                ++v103;
              *v95++ = v103 >> 1;
              --v96;
            }
            while (v96);
          }
          goto LABEL_98;
        }
        if (v49 != 1)
        {
          if (v49)
          {
            if ((_DWORD)v150 == 2)
            {
              v106 = v147 + 8 * v24;
              a2 = v147;
              sub_23CCAECA0(v106, (int *)(v147 + 8 * v23), (int *)(v147 + 8 * v19), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v139), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), (int *)v162);
              v35 = v150;
              goto LABEL_98;
            }
            v35 = v150;
            if ((int)v150 >= 1)
            {
              v119 = v162;
              v120 = v150;
              a2 = v147;
              do
              {
                v122 = *v43++;
                v121 = v122;
                v124 = *v44++;
                v123 = v124;
                v125 = *v45++;
                *v119++ = v123 + v121 - v125;
                v59 = 2;
                --v120;
              }
              while (v120);
              goto LABEL_108;
            }
          }
          else
          {
            v35 = v150;
            if ((int)v150 >= 1)
            {
              v50 = v162;
              v51 = v150;
              a2 = v147;
              do
              {
                v53 = *v43++;
                v52 = v53;
                v54 = *v44++;
                v55 = v54 + v52;
                v56 = *v45++;
                *v50++ = v55 - v56;
                --v51;
              }
              while (v51);
              goto LABEL_98;
            }
          }
          v59 = 2;
          a2 = v147;
          goto LABEL_108;
        }
        v104 = *(_QWORD *)(a1 + 1160);
        v105 = (int *)(v104 + 12 * v14);
        v35 = v150;
        sub_23CCAE5A4(v43, v44, v45, v150, (int *)(v104 + 12 * v138), (int *)(v104 + 12 * v139), (int *)(v104 + 12 * v149), v105, v162);
        a2 = v147;
LABEL_98:
        v59 = 2;
LABEL_108:
        a3 = v137;
        v12 = v141;
        v7 = v142;
        v8 = v148;
        v10 = v140;
        v13 = v151;
LABEL_109:
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v162, v8, v146, (_BYTE *)(a1 + 4372), &v170[15 * v59], a2 + 4 * v11 * v8);
        if ((int)v35 >= 1)
        {
          v113 = (char *)v164 + 4;
          v114 = v13;
          v115 = v35;
          do
          {
            v117 = *v114++;
            v116 = v117;
            v118 = *((_DWORD *)v113 - 1);
            if (*(_DWORD *)&v113[4 * (((_BYTE)v118 - 1) & 3)] != v117)
            {
              *((_DWORD *)v113 - 1) = v118 + 1;
              *(_DWORD *)&v113[4 * (v118 & 3)] = v116;
            }
            v113 += 20;
            --v115;
          }
          while (v115);
        }
        goto LABEL_114;
      }
      v8 = v148;
      if (HIDWORD(v154) != -1 && (!v10 || *(_BYTE *)(a3 + (int)v154) && *(_BYTE *)(a3 + SHIDWORD(v154))))
      {
        if ((_DWORD)v148 == 2)
        {
          v57 = sub_23CCB7064((unsigned int *)a1, &v169);
          v58 = 2 * v24;
          a2 = v147;
          sub_23CCAEA84((int *)(v147 + 4 * v58), (int *)(v147 + 8 * (_DWORD)v23), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * v139), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v14), v57, (int *)v162);
          v59 = 1;
        }
        else
        {
          if ((int)v148 >= 1)
          {
            a2 = v147;
            v68 = (int *)(v147 + 4 * (int)v154 * (int)v148);
            v35 = v150;
            v69 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v150);
            v70 = (int *)v162;
            v71 = v150;
            do
            {
              v73 = *v68++;
              v72 = v73;
              v74 = *v69++;
              v75 = __OFADD__(v74, v72);
              v76 = v74 + v72;
              if (v76 < 0 != v75)
                ++v76;
              *v70++ = v76 >> 1;
              --v71;
            }
            while (v71);
            v59 = 1;
            goto LABEL_108;
          }
          v59 = 1;
          a2 = v147;
        }
        goto LABEL_107;
      }
      a2 = v147;
      v12 = v141;
      v7 = v142;
      v13 = v151;
    }
    v60 = sub_23CCBE440(a1, v11, a2, a3, (int *)v162, (uint64_t)v163);
    v59 = 0;
    v35 = v150;
    if ((int)v150 >= 1 && !v60)
    {
      v61 = v150;
      v62 = v162;
      v63 = (char *)v164 + 4;
      do
      {
        v64 = sub_23CCB7064((unsigned int *)a1, __b);
        v65 = v64;
        if (v64)
          v66 = 2;
        else
          v66 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v66]))
          v67 = 2;
        else
          v67 = 0;
        *v62++ = *(_DWORD *)&v63[4 * ((*((_DWORD *)v63 - 1) + ~(v67 | v65)) & 3)];
        v63 += 20;
        --v61;
      }
      while (v61);
      v59 = 0;
      a3 = v137;
      a2 = v147;
      v10 = v140;
      v35 = v150;
      v13 = v151;
      v12 = v141;
      v7 = v142;
    }
    goto LABEL_109;
  }
LABEL_121:
  if (__p)
  {
    v161[0] = __p;
    operator delete(__p);
  }
  if (v162)
  {
    v163 = v162;
    operator delete(v162);
  }
  if (v164)
  {
    *(_QWORD *)v165 = v164;
    operator delete(v164);
  }
  v126 = 360;
  do
  {
    v127 = &v170[v126 / 8];
    v128 = *(void **)&v165[v126 / 4 + 4];
    if (v128)
    {
      *((_QWORD *)v127 - 2) = v128;
      operator delete(v128);
    }
    v129 = (void *)*((_QWORD *)v127 - 6);
    if (v129)
    {
      *(_QWORD *)&v165[v126 / 4] = v129;
      operator delete(v129);
    }
    v130 = &v170[v126 / 8];
    v131 = *(void **)((char *)&v162 + v126);
    if (v131)
    {
      *((_QWORD *)v130 - 8) = v131;
      operator delete(v131);
    }
    v132 = (void *)*((_QWORD *)v130 - 12);
    if (v132)
    {
      v161[v126 / 8] = v132;
      operator delete(v132);
    }
    v133 = (void *)*((_QWORD *)v127 - 15);
    if (v133)
    {
      *(unint64_t *)((char *)&v158 + v126) = (unint64_t)v133;
      operator delete(v133);
    }
    v126 -= 120;
  }
  while (v126);
}

void sub_23CCBE3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  if (a38)
    operator delete(a38);
  if (a41)
    operator delete(a41);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a47 + i));
  _Unwind_Resume(a1);
}

uint64_t sub_23CCBE440(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6)
{
  int *v6;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  int *v25;
  uint64_t v26;
  int v27;

  v6 = a5;
  v11 = *(_DWORD *)(a1 + 4360);
  v12 = *(unsigned int *)(a1 + 4336);
  v13 = *(int *)(*(_QWORD *)(a1 + 4176) + 4 * a2);
  v14 = *(_QWORD *)(a1 + 4224);
  v15 = *(int *)(*(_QWORD *)(a1 + 4200) + 4 * a2);
  if (a6 - (uint64_t)a5 >= 1)
    bzero(a5, 4 * (((unint64_t)(a6 - (_QWORD)a5) >> 2) - ((unint64_t)(a6 - (_QWORD)a5) > 3)) + 4);
  if ((int)v15 < 1)
    return 0;
  result = 0;
  v17 = v15 + v13;
  v18 = *(_QWORD *)(a1 + 1208);
  do
  {
    v19 = (int *)(v18 + 4 * *(int *)(v14 + 4 * v13));
    v20 = *v19;
    v21 = v19[1];
    if ((int)v20 < (int)v21)
    {
      v22 = *(_QWORD *)(a1 + 4104);
      do
      {
        v23 = *(int *)(v22 + 4 * v20);
        if ((int)v23 < a2 && (!v11 || *(_BYTE *)(a4 + v23)))
        {
          if ((int)v12 >= 1)
          {
            v24 = (int *)(a3 + 4 * (int)v23 * (int)v12);
            v25 = v6;
            v26 = v12;
            do
            {
              v27 = *v24++;
              *v25++ += v27;
              --v26;
            }
            while (v26);
          }
          result = (result + 1);
        }
        ++v20;
      }
      while (v20 < v21 && (int)result < 4);
    }
    ++v13;
  }
  while (v13 < v17 && (int)result < 4);
  if ((int)v12 >= 1 && (int)result >= 2)
  {
    do
    {
      *v6++ /= (int)result;
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_23CCBE5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  _DWORD *v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int *v25;
  int *v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  _BOOL4 v31;
  int *v32;
  int v33;
  _DWORD *v34;
  uint64_t v35;
  char *v36;
  _BOOL4 v37;
  BOOL v38;
  uint64_t v39;
  char v40;
  int *v41;
  int *v42;
  int *v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  BOOL v48;
  int v49;
  char *v50;
  int *v51;
  uint64_t v52;
  int v53;
  int v54;
  int v55;
  unint64_t v56;
  _BYTE *v57;
  void *v58;
  void *v59;
  _BYTE *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  unint64_t v82;
  unsigned int v83;
  unint64_t v84;
  _DWORD v85[2];
  void *__p;
  _QWORD v87[2];
  void *v88;
  void *v89;
  _BYTE v90[8];
  void *v91;
  _QWORD v92[2];
  __int16 v93;
  _WORD __b[3];
  _QWORD v95[44];
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v72 = (_QWORD *)(a1 + 4056);
  v5 = *(unsigned int *)(a1 + 4332);
  v6 = *(int *)(a1 + 4336);
  v7 = *(unsigned int *)(a1 + 4336);
  v66 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  v8 = 0;
  v96 = 0;
  memset(v95, 0, sizeof(v95));
  do
  {
    sub_23CCB7FFC((uint64_t)&v95[v8], v7);
    v8 += 15;
  }
  while (v8 != 45);
  v93 = 0x8000;
  sub_23CCC16CC(&v91, v6);
  LODWORD(__p) = 0;
  sub_23CCC14E0(&v88, v6, &__p);
  v9 = v66;
  LODWORD(v84) = 0;
  sub_23CCC14E0(&__p, v6, &v84);
  if ((int)v5 >= 1)
  {
    v10 = 0;
    v71 = v6;
    v76 = 4 * v6;
    v11 = (int *)a2;
    v68 = v7;
    v69 = a2;
    v67 = v5;
    while (v9 && !*(_BYTE *)(a3 + v10))
    {
LABEL_63:
      ++v10;
      v11 = (int *)((char *)v11 + v76);
      if (v10 == v5)
        goto LABEL_66;
    }
    v12 = *(unsigned int *)(*(_QWORD *)(a1 + 4128) + 4 * v10);
    if ((v12 & 0x80000000) == 0)
    {
      v13 = (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v12);
      v14 = *v13;
      LODWORD(v84) = *v13;
      v15 = v13[1];
      HIDWORD(v84) = v15;
      v16 = v13[2];
      v85[0] = v16;
      v17 = (_DWORD *)(*(_QWORD *)(a1 + 1280) + 12 * v12);
      v18 = v17[1];
      LODWORD(v82) = *v17;
      HIDWORD(v82) = v18;
      v73 = v18;
      v74 = v17[2];
      v75 = v82;
      v83 = v74;
      v81 = -1;
      v80 = -1;
      v79 = -1;
      v78 = -1;
      sub_23CCBBE94((_QWORD *)a1, v12, v10, (unsigned int *)&v84, &v80);
      sub_23CCBBE94((_QWORD *)a1, v12, v10, (unsigned int *)&v82, &v78);
      v19 = v81;
      v20 = v79;
      if ((v81 & 0x80000000) == 0 || v79 < 0)
      {
        v70 = __PAIR64__(v15, v14);
        v21 = v78;
        v22 = HIDWORD(v78);
      }
      else
      {
        v74 = v16;
        v75 = v14;
        v84 = v82;
        v16 = v83;
        v85[0] = v83;
        v21 = v80;
        v22 = HIDWORD(v80);
        v80 = v78;
        v20 = v81;
        v19 = v79;
        v81 = v79;
        v73 = v15;
        v70 = v82;
      }
      v24 = (int)v80;
      v23 = HIDWORD(v80);
      if (v20 != -1
        && (!v9
         || *(_BYTE *)(a3 + (int)v80)
         && *(_BYTE *)(a3 + SHIDWORD(v80))
         && *(_BYTE *)(a3 + v19)
         && *(_BYTE *)(a3 + v21)
         && *(_BYTE *)(a3 + v22)
         && *(_BYTE *)(a3 + v20)))
      {
        v64 = v22;
        v65 = v21;
        a2 = v69;
        v6 = v71;
        sub_23CCAE5A4((int *)(v69 + 4 * (int)v80 * (int)v68), (int *)(v69 + 4 * HIDWORD(v80) * (int)v71), (int *)(v69 + 4 * v19 * (int)v68), v71, (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v70), (int *)(*(_QWORD *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v16), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v12), v88);
        sub_23CCAE5A4((int *)(a2 + 4 * v65 * (int)v6), (int *)(a2 + 4 * v64 * (int)v68), (int *)(a2 + 4 * v20 * (int)v6), v68, (int *)(*(_QWORD *)(a1 + 1160) + 12 * v75), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v73), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v74), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v12), __p);
        v5 = v67;
        v7 = v68;
        if ((int)v68 >= 1)
        {
          v25 = (int *)v88;
          v26 = (int *)__p;
          v27 = v68;
          v9 = v66;
          do
          {
            v28 = *v26++;
            v29 = v28 + *v25;
            if (v29 < 0 != __OFADD__(v28, *v25))
              ++v29;
            *v25++ = v29 >> 1;
            --v27;
          }
          while (v27);
          v30 = 2;
          goto LABEL_58;
        }
        v30 = 2;
        goto LABEL_51;
      }
      if (v19 != -1 && (!v9 || *(_BYTE *)(a3 + (int)v80) && *(_BYTE *)(a3 + SHIDWORD(v80)) && *(_BYTE *)(a3 + v19)))
      {
        v7 = v68;
        a2 = v69;
        v6 = v71;
        sub_23CCAE5A4((int *)(v69 + 4 * (int)v80 * (int)v68), (int *)(v69 + 4 * HIDWORD(v80) * (int)v71), (int *)(v69 + 4 * v19 * (int)v68), v71, (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v70), (int *)(*(_QWORD *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v16), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v12), v88);
        v30 = 2;
        v5 = v67;
LABEL_51:
        v9 = v66;
        goto LABEL_58;
      }
      v7 = v68;
      if (HIDWORD(v80) != -1 && (!v9 || *(_BYTE *)(a3 + (int)v80) && *(_BYTE *)(a3 + SHIDWORD(v80))))
      {
        v5 = v67;
        if ((_DWORD)v71 == 2)
        {
          v31 = sub_23CCB7064((unsigned int *)a1, &v93);
          v32 = (int *)(v69 + 8 * v24);
          a2 = v69;
          sub_23CCAEA84(v32, (int *)(v69 + 8 * v23), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * (int)v70), (_DWORD *)(*(_QWORD *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(_QWORD *)(a1 + 1160) + 12 * v12), v31, (int *)v88);
        }
        else
        {
          if ((int)v71 < 1)
          {
            v30 = 1;
            a2 = v69;
            v6 = v71;
LABEL_58:
            sub_23CCB6B9C((unsigned int *)a1, (uint64_t)v88, v6, v72, (_BYTE *)(a1 + 4372), &v95[15 * v30], a2 + 4 * v10 * v6);
            if ((int)v7 >= 1)
            {
              v50 = (char *)v91 + 4;
              v51 = v11;
              v52 = v7;
              do
              {
                v54 = *v51++;
                v53 = v54;
                v55 = *((_DWORD *)v50 - 1);
                if (*(_DWORD *)&v50[4 * (((_BYTE)v55 - 1) & 3)] != v54)
                {
                  *((_DWORD *)v50 - 1) = v55 + 1;
                  *(_DWORD *)&v50[4 * (v55 & 3)] = v53;
                }
                v50 += 20;
                --v52;
              }
              while (v52);
            }
            goto LABEL_63;
          }
          a2 = v69;
          v41 = (int *)(v69 + 4 * (int)v80 * (int)v71);
          v42 = (int *)(v69 + 4 * HIDWORD(v80) * (int)v68);
          v43 = (int *)v88;
          v44 = v68;
          do
          {
            v46 = *v41++;
            v45 = v46;
            v47 = *v42++;
            v48 = __OFADD__(v47, v45);
            v49 = v47 + v45;
            if (v49 < 0 != v48)
              ++v49;
            *v43++ = v49 >> 1;
            --v44;
          }
          while (v44);
        }
        v30 = 1;
        v6 = v71;
        goto LABEL_58;
      }
      a2 = v69;
      v5 = v67;
      v6 = v71;
    }
    v33 = sub_23CCBE440(a1, v10, a2, a3, (int *)v88, (uint64_t)v89);
    v30 = 0;
    if ((int)v7 >= 1 && !v33)
    {
      v34 = v88;
      v35 = v7;
      v36 = (char *)v91 + 4;
      do
      {
        v37 = sub_23CCB7064((unsigned int *)a1, __b);
        v38 = v37;
        if (v37)
          v39 = 2;
        else
          v39 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v39]))
          v40 = 2;
        else
          v40 = 0;
        *v34++ = *(_DWORD *)&v36[4 * ((*((_DWORD *)v36 - 1) + ~(v40 | v38)) & 3)];
        v36 += 20;
        --v35;
      }
      while (v35);
      v30 = 0;
      v6 = v71;
      v7 = v68;
      a2 = v69;
      v9 = v66;
      v5 = v67;
    }
    goto LABEL_58;
  }
LABEL_66:
  if (__p)
  {
    v87[0] = __p;
    operator delete(__p);
  }
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  if (v91)
  {
    v92[0] = v91;
    operator delete(v91);
  }
  v56 = 90;
  do
  {
    v57 = &v95[v56 / 2];
    v58 = (void *)v92[v56 / 2];
    if (v58)
    {
      *((_QWORD *)v57 - 2) = v58;
      operator delete(v58);
    }
    v59 = (void *)*((_QWORD *)v57 - 6);
    if (v59)
    {
      *(_QWORD *)&v90[v56 * 4] = v59;
      operator delete(v59);
    }
    v60 = &v95[v56 / 2];
    v61 = (void *)v87[v56 / 2];
    if (v61)
    {
      *((_QWORD *)v60 - 8) = v61;
      operator delete(v61);
    }
    v62 = (void *)*((_QWORD *)v60 - 12);
    if (v62)
    {
      *(_QWORD *)&v85[v56] = v62;
      operator delete(v62);
    }
    v63 = (void *)*((_QWORD *)v57 - 15);
    if (v63)
    {
      *(_QWORD *)((char *)&v81 + v56 * 4) = v63;
      operator delete(v63);
    }
    v56 -= 30;
  }
  while (v56 * 4);
}

void sub_23CCBECCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  if (a34)
    operator delete(a34);
  if (a37)
    operator delete(a37);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a41 + i));
  _Unwind_Resume(a1);
}

void sub_23CCBED48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  int v22;
  int *v23;
  int v24;
  int *v25;
  int v26;
  int *v27;
  int v28;
  int *v29;
  int *v30;
  int *v31;
  _DWORD *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  BOOL v41;
  int v42;
  int *v43;
  int *v44;
  int v45;
  int *v46;
  _DWORD *v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int *v54;
  int *v55;
  int *v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  _DWORD *v64;
  char *v65;
  _BOOL4 v66;
  BOOL v67;
  uint64_t v68;
  char v69;
  _DWORD *v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  _DWORD *v77;
  uint64_t v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  unint64_t v84;
  char *v85;
  int v86;
  int v87;
  int v88;
  unint64_t v89;
  char *v90;
  int *v91;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  unint64_t v96;
  char *v97;
  void *v98;
  void *v99;
  char *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  unint64_t v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  _DWORD v115[2];
  uint64_t v116;
  _DWORD v117[2];
  void *__p;
  void *v119;
  void *v120[3];
  _WORD v121[3];
  _WORD __b[3];
  _OWORD v123[22];
  uint64_t v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v112 = *(unsigned int *)(a1 + 4332);
  v110 = (_QWORD *)(a1 + 4056);
  v111 = *(int *)(a1 + 4336);
  v6 = *(unsigned int *)(a1 + 4336);
  v113 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  memset_pattern16(v121, &unk_23CCD46A0, 6uLL);
  v7 = 0;
  v124 = 0;
  memset(v123, 0, sizeof(v123));
  do
  {
    sub_23CCB7FFC((uint64_t)v123 + v7, v6);
    v7 += 120;
  }
  while (v7 != 360);
  v8 = v111;
  sub_23CCC16CC(v120, v111);
  LODWORD(v116) = 0;
  sub_23CCC14E0(&__p, v111, &v116);
  if ((int)v112 >= 1)
  {
    v9 = 0;
    v109 = a2;
    v104 = 4 * v6;
    v10 = (int *)a2;
    v107 = a3;
    v108 = v6;
    while (v113 && !*(_BYTE *)(a3 + v9))
    {
LABEL_87:
      ++v9;
      v10 += v111;
      if (v9 == v112)
        goto LABEL_88;
    }
    v11 = *(unsigned int *)(*(_QWORD *)(a1 + 4128) + 4 * v9);
    if ((v11 & 0x80000000) == 0)
    {
      v117[0] = -1;
      v116 = -1;
      v115[0] = -1;
      v114 = -1;
      sub_23CCBBE94((_QWORD *)a1, v11, v9, (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v11), &v116);
      sub_23CCBBE94((_QWORD *)a1, v11, v9, (unsigned int *)(*(_QWORD *)(a1 + 1280) + 12 * v11), &v114);
      v12 = v117[0];
      v13 = v115[0];
      if ((v117[0] & 0x80000000) == 0 || (v115[0] & 0x80000000) != 0)
      {
        v14 = v114;
        v15 = HIDWORD(v114);
        v16 = v117[0];
      }
      else
      {
        v14 = v116;
        v15 = HIDWORD(v116);
        v116 = v114;
        v16 = v115[0];
        v117[0] = v115[0];
        v13 = v12;
      }
      v18 = v116;
      v17 = HIDWORD(v116);
      if (v13 != -1
        && (!v113
         || *(_BYTE *)(a3 + (int)v116)
         && *(_BYTE *)(a3 + SHIDWORD(v116))
         && *(_BYTE *)(a3 + v16)
         && *(_BYTE *)(a3 + v14)
         && *(_BYTE *)(a3 + v15)
         && *(_BYTE *)(a3 + v13)))
      {
        v105 = v15;
        v106 = v14;
        v19 = sub_23CCB7064((unsigned int *)a1, v121);
        v20 = 2;
        if (!v19)
          v20 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &v121[v20]))
          v21 = 2;
        else
          v21 = 0;
        v22 = v18 * v108;
        a2 = v109;
        v23 = (int *)(v109 + 4 * v22);
        v24 = v17 * v111;
        v8 = v111;
        v25 = (int *)(v109 + 4 * v24);
        v26 = v16 * v108;
        v6 = v108;
        v27 = (int *)(v109 + 4 * v26);
        v28 = v21 | v19;
        if (v21 | v19)
        {
          v29 = (int *)(v109 + 4 * v106 * (int)v111);
          v30 = (int *)(v109 + 4 * v105 * (int)v108);
          v31 = (int *)(v109 + 4 * v13 * (int)v111);
          if (v28 == 1)
          {
            if ((int)v108 >= 1)
            {
              v77 = __p;
              v78 = v108;
              do
              {
                v80 = *v29++;
                v79 = v80;
                v81 = *v30++;
                v82 = v81 + v79;
                v83 = *v31++;
                *v77++ = v82 - v83;
                --v78;
              }
              while (v78);
            }
          }
          else if (v28 == 2)
          {
            if ((int)v111 >= 1)
            {
              v32 = __p;
              v33 = v108;
              do
              {
                v35 = *v25++;
                v34 = v35;
                v36 = *v30++;
                v37 = v36 + v34;
                v39 = *v23++;
                v38 = v39;
                v40 = *v29++;
                v41 = __OFADD__(v40, v38);
                v42 = v40 + v38;
                if (v42 < 0 != v41)
                  ++v42;
                *v32++ = v37 - (v42 >> 1);
                --v33;
              }
              while (v33);
            }
          }
          else if ((int)v108 >= 1)
          {
            v84 = 0;
            v85 = (char *)__p;
            do
            {
              v86 = v23[v84 / 4];
              v87 = v29[v84 / 4];
              v41 = __OFADD__(v87, v86);
              v88 = v87 + v86;
              if (v88 < 0 != v41)
                ++v88;
              v89 = 1431655766 * ((v88 >> 1) - (v27[v84 / 4] + v31[v84 / 4]) + 2 * (v30[v84 / 4] + v25[v84 / 4]));
              *(_DWORD *)&v85[v84] = HIDWORD(v89) + (v89 >> 63);
              v84 += 4;
            }
            while (v104 != v84);
          }
        }
        else if ((int)v111 >= 1)
        {
          v70 = __p;
          v71 = v108;
          do
          {
            v73 = *v23++;
            v72 = v73;
            v74 = *v25++;
            v75 = v74 + v72;
            v76 = *v27++;
            *v70++ = v75 - v76;
            --v71;
          }
          while (v71);
        }
        goto LABEL_81;
      }
      if (v16 != -1 && (!v113 || *(_BYTE *)(a3 + (int)v116) && *(_BYTE *)(a3 + SHIDWORD(v116)) && *(_BYTE *)(a3 + v16)))
      {
        if ((int)v111 < 1)
        {
          v62 = 2;
          v6 = v108;
          a2 = v109;
          v8 = v111;
          goto LABEL_82;
        }
        a2 = v109;
        v43 = (int *)(v109 + 4 * (int)v116 * (int)v108);
        v44 = (int *)(v109 + 4 * HIDWORD(v116) * (int)v111);
        v45 = v16 * v108;
        v6 = v108;
        v46 = (int *)(v109 + 4 * v45);
        v47 = __p;
        v48 = v108;
        v8 = v111;
        do
        {
          v50 = *v43++;
          v49 = v50;
          v51 = *v44++;
          v52 = v51 + v49;
          v53 = *v46++;
          *v47++ = v52 - v53;
          --v48;
        }
        while (v48);
LABEL_81:
        v62 = 2;
LABEL_82:
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)__p, v8, v110, (_BYTE *)(a1 + 4372), (_QWORD *)v123 + 15 * v62, a2 + 4 * v9 * v8);
        if ((int)v8 >= 1)
        {
          v90 = (char *)v120[0] + 4;
          v91 = v10;
          v92 = v6;
          do
          {
            v94 = *v91++;
            v93 = v94;
            v95 = *((_DWORD *)v90 - 1);
            if (*(_DWORD *)&v90[4 * (((_BYTE)v95 - 1) & 3)] != v94)
            {
              *((_DWORD *)v90 - 1) = v95 + 1;
              *(_DWORD *)&v90[4 * (v95 & 3)] = v93;
            }
            v90 += 20;
            --v92;
          }
          while (v92);
        }
        goto LABEL_87;
      }
      if (HIDWORD(v116) != -1 && (!v113 || *(_BYTE *)(a3 + (int)v116) && *(_BYTE *)(a3 + SHIDWORD(v116))))
      {
        v6 = v108;
        if ((int)v108 < 1)
        {
          v62 = 1;
          a2 = v109;
        }
        else
        {
          a2 = v109;
          v54 = (int *)(v109 + 4 * (int)v116 * (int)v111);
          v55 = (int *)(v109 + 4 * HIDWORD(v116) * (int)v108);
          v56 = (int *)__p;
          v57 = v108;
          do
          {
            v59 = *v54++;
            v58 = v59;
            v60 = *v55++;
            v41 = __OFADD__(v60, v58);
            v61 = v60 + v58;
            if (v61 < 0 != v41)
              ++v61;
            *v56++ = v61 >> 1;
            --v57;
          }
          while (v57);
          v62 = 1;
        }
        v8 = v111;
        goto LABEL_82;
      }
      v6 = v108;
      a2 = v109;
      v8 = v111;
    }
    v63 = sub_23CCBE440(a1, v9, a2, a3, (int *)__p, (uint64_t)v119);
    v62 = 0;
    if ((int)v6 >= 1 && !v63)
    {
      v64 = __p;
      v65 = (char *)v120[0] + 4;
      do
      {
        v66 = sub_23CCB7064((unsigned int *)a1, __b);
        v67 = v66;
        if (v66)
          v68 = 2;
        else
          v68 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v68]))
          v69 = 2;
        else
          v69 = 0;
        *v64++ = *(_DWORD *)&v65[4 * ((*((_DWORD *)v65 - 1) + ~(v69 | v67)) & 3)];
        v65 += 20;
        --v6;
      }
      while (v6);
      v62 = 0;
      v8 = v111;
      a3 = v107;
      v6 = v108;
      a2 = v109;
    }
    goto LABEL_82;
  }
LABEL_88:
  if (__p)
  {
    v119 = __p;
    operator delete(__p);
  }
  if (v120[0])
  {
    v120[1] = v120[0];
    operator delete(v120[0]);
  }
  v96 = 90;
  do
  {
    v97 = (char *)v123 + v96 * 4;
    v98 = v120[v96 / 2 + 2];
    if (v98)
    {
      *((_QWORD *)v97 - 2) = v98;
      operator delete(v98);
    }
    v99 = (void *)*((_QWORD *)v97 - 6);
    if (v99)
    {
      v120[v96 / 2] = v99;
      operator delete(v99);
    }
    v100 = (char *)v123 + v96 * 4;
    v101 = *(void **)&v117[v96];
    if (v101)
    {
      *((_QWORD *)v100 - 8) = v101;
      operator delete(v101);
    }
    v102 = (void *)*((_QWORD *)v100 - 12);
    if (v102)
    {
      *(_QWORD *)&v115[v96] = v102;
      operator delete(v102);
    }
    v103 = (void *)*((_QWORD *)v97 - 15);
    if (v103)
    {
      *(_QWORD *)((char *)&v123[-7] + v96 * 4) = v103;
      operator delete(v103);
    }
    v96 -= 30;
  }
  while (v96 * 4);
}

void sub_23CCBF440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a33 + i));
  _Unwind_Resume(a1);
}

void sub_23CCBF49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int *v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int *v16;
  int *v17;
  int v18;
  int *v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  int *v29;
  int *v30;
  int *v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  BOOL v36;
  int v37;
  int v38;
  _DWORD *v39;
  char *v40;
  _BOOL4 v41;
  BOOL v42;
  uint64_t v43;
  char v44;
  char *v45;
  int *v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  unint64_t v51;
  char *v52;
  void *v53;
  void *v54;
  char *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  int v63[2];
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  void *__p;
  void *v69;
  _BYTE v70[8];
  void *v71;
  _QWORD v72[2];
  _WORD __b[3];
  _OWORD v74[22];
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v64 = *(unsigned int *)(a1 + 4332);
  v61 = (_QWORD *)(a1 + 4056);
  v62 = *(int *)(a1 + 4336);
  v6 = *(unsigned int *)(a1 + 4336);
  v65 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  v7 = 0;
  v75 = 0;
  memset(v74, 0, sizeof(v74));
  do
  {
    sub_23CCB7FFC((uint64_t)v74 + v7, v6);
    v7 += 120;
  }
  while (v7 != 360);
  v8 = v62;
  sub_23CCC16CC(&v71, v62);
  LODWORD(v66) = 0;
  sub_23CCC14E0(&__p, v62, &v66);
  if ((int)v64 >= 1)
  {
    v9 = 0;
    v60 = a2;
    *(_QWORD *)v63 = a3;
    v10 = (int *)a2;
    v59 = v6;
    while (v65 && !*(_BYTE *)(a3 + v9))
    {
LABEL_53:
      ++v9;
      v10 += v62;
      if (v9 == v64)
        goto LABEL_54;
    }
    v11 = *(_DWORD *)(*(_QWORD *)(a1 + 4128) + 4 * v9);
    if ((v11 & 0x80000000) != 0)
    {
      a3 = *(_QWORD *)v63;
LABEL_34:
      v38 = sub_23CCBE440(a1, v9, a2, a3, (int *)__p, (uint64_t)v69);
      v27 = 0;
      if ((int)v6 < 1 || v38)
      {
LABEL_48:
        sub_23CCB6B9C((unsigned int *)a1, (uint64_t)__p, v8, v61, (_BYTE *)(a1 + 4372), (_QWORD *)v74 + 15 * v27, a2 + 4 * v9 * v8);
        if ((int)v8 >= 1)
        {
          v45 = (char *)v71 + 4;
          v46 = v10;
          v47 = v6;
          do
          {
            v49 = *v46++;
            v48 = v49;
            v50 = *((_DWORD *)v45 - 1);
            if (*(_DWORD *)&v45[4 * (((_BYTE)v50 - 1) & 3)] != v49)
            {
              *((_DWORD *)v45 - 1) = v50 + 1;
              *(_DWORD *)&v45[4 * (v50 & 3)] = v48;
            }
            v45 += 20;
            --v47;
          }
          while (v47);
        }
        goto LABEL_53;
      }
      v39 = __p;
      v40 = (char *)v71 + 4;
      do
      {
        v41 = sub_23CCB7064((unsigned int *)a1, __b);
        v42 = v41;
        if (v41)
          v43 = 2;
        else
          v43 = 1;
        if (sub_23CCB7064((unsigned int *)a1, &__b[v43]))
          v44 = 2;
        else
          v44 = 0;
        *v39++ = *(_DWORD *)&v40[4 * ((*((_DWORD *)v40 - 1) + ~(v44 | v42)) & 3)];
        v40 += 20;
        --v6;
      }
      while (v6);
      v27 = 0;
      v8 = v62;
      a3 = *(_QWORD *)v63;
      a2 = v60;
LABEL_45:
      v6 = v59;
      goto LABEL_48;
    }
    v67 = -1;
    v66 = -1;
    sub_23CCBBE94((_QWORD *)a1, v11, v9, (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v11), &v66);
    v13 = v66;
    v12 = HIDWORD(v66);
    v14 = v67;
    if (v67 < 0)
    {
      sub_23CCBBE94((_QWORD *)a1, v11, v9, (unsigned int *)(*(_QWORD *)(a1 + 1280) + 12 * v11), &v66);
      if (v67 < 0)
      {
        a3 = *(_QWORD *)v63;
        if (v14 == -1)
        {
LABEL_23:
          if (v12 != -1 && (!v65 || *(_BYTE *)(a3 + v13) && *(_BYTE *)(a3 + v12)))
          {
            v6 = v59;
            if ((int)v59 < 1)
            {
              v27 = 1;
              a2 = v60;
            }
            else
            {
              v28 = v13 * v62;
              a2 = v60;
              v29 = (int *)(v60 + 4 * v28);
              v30 = (int *)(v60 + 4 * v12 * (int)v59);
              v31 = (int *)__p;
              v32 = v59;
              do
              {
                v34 = *v29++;
                v33 = v34;
                v35 = *v30++;
                v36 = __OFADD__(v35, v33);
                v37 = v35 + v33;
                if (v37 < 0 != v36)
                  ++v37;
                *v31++ = v37 >> 1;
                --v32;
              }
              while (v32);
              v27 = 1;
            }
            v8 = v62;
            goto LABEL_48;
          }
          v6 = v59;
          a2 = v60;
          v8 = v62;
          goto LABEL_34;
        }
LABEL_12:
        if (!v65 || *(_BYTE *)(a3 + v13) && *(_BYTE *)(a3 + v12) && *(_BYTE *)(a3 + v14))
        {
          if ((int)v62 >= 1)
          {
            v15 = v13 * v59;
            a2 = v60;
            v16 = (int *)(v60 + 4 * v15);
            v17 = (int *)(v60 + 4 * v12 * (int)v62);
            v18 = v14 * v59;
            v6 = v59;
            v19 = (int *)(v60 + 4 * v18);
            v20 = __p;
            v21 = v59;
            v8 = v62;
            do
            {
              v23 = *v16++;
              v22 = v23;
              v24 = *v17++;
              v25 = v24 + v22;
              v26 = *v19++;
              *v20++ = v25 - v26;
              --v21;
            }
            while (v21);
            v27 = 2;
            goto LABEL_48;
          }
          v27 = 2;
          a2 = v60;
          v8 = v62;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
      v13 = v66;
      v12 = HIDWORD(v66);
      v14 = v67;
    }
    a3 = *(_QWORD *)v63;
    goto LABEL_12;
  }
LABEL_54:
  if (__p)
  {
    v69 = __p;
    operator delete(__p);
  }
  if (v71)
  {
    v72[0] = v71;
    operator delete(v71);
  }
  v51 = 360;
  do
  {
    v52 = (char *)v74 + v51;
    v53 = (void *)v72[v51 / 8];
    if (v53)
    {
      *((_QWORD *)v52 - 2) = v53;
      operator delete(v53);
    }
    v54 = (void *)*((_QWORD *)v52 - 6);
    if (v54)
    {
      *(_QWORD *)&v70[v51] = v54;
      operator delete(v54);
    }
    v55 = (char *)v74 + v51;
    v56 = *(void **)((char *)&v66 + v51);
    if (v56)
    {
      *((_QWORD *)v55 - 8) = v56;
      operator delete(v56);
    }
    v57 = (void *)*((_QWORD *)v55 - 12);
    if (v57)
    {
      *(_QWORD *)((char *)&v74[-5] + v51 - 8) = v57;
      operator delete(v57);
    }
    v58 = (void *)*((_QWORD *)v52 - 15);
    if (v58)
    {
      *(_QWORD *)((char *)&v74[-7] + v51) = v58;
      operator delete(v58);
    }
    v51 -= 120;
  }
  while (v51);
}

void sub_23CCBF980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a27 + i));
  _Unwind_Resume(a1);
}

void sub_23CCBF9DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int *v11;
  unsigned int v12;
  int v13;
  int v14;
  uint64_t v15;
  int *v16;
  int *v17;
  int *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  int v24;
  unsigned int v25;
  int v26;
  _DWORD *v27;
  char *v28;
  uint64_t v29;
  _BOOL4 v30;
  BOOL v31;
  uint64_t v32;
  char v33;
  char *v34;
  int *v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  uint64_t i;
  _QWORD *v41;
  void *v42;
  void *v43;
  char *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v56;
  int v57;
  void *__p;
  void *v59;
  void *v60[3];
  _WORD __b[3];
  _OWORD v62[15];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v49 = (_QWORD *)(a1 + 4056);
  v53 = *(unsigned int *)(a1 + 4332);
  v5 = *(int *)(a1 + 4336);
  v6 = *(unsigned int *)(a1 + 4336);
  v54 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
  v7 = 0;
  v8 = 0;
  memset(v62, 0, sizeof(v62));
  do
  {
    v9 = v7;
    sub_23CCB7FFC((uint64_t)v62 + 120 * v8, v6);
    v7 = 1;
    v8 = 1;
  }
  while ((v9 & 1) == 0);
  sub_23CCC16CC(v60, v5);
  LODWORD(v56) = 0;
  sub_23CCC14E0(&__p, v5, &v56);
  if ((int)v53 >= 1)
  {
    v10 = 0;
    v48 = a3;
    v50 = v5;
    v51 = 4 * v5;
    v11 = (int *)a2;
    v52 = v6;
    while (v54 && !*(_BYTE *)(a3 + v10))
    {
LABEL_40:
      ++v10;
      v11 = (int *)((char *)v11 + v51);
      if (v10 == v53)
        goto LABEL_41;
    }
    v12 = *(_DWORD *)(*(_QWORD *)(a1 + 4128) + 4 * v10);
    if ((v12 & 0x80000000) != 0)
    {
      v15 = v52;
LABEL_24:
      v26 = sub_23CCBE440(a1, v10, a2, a3, (int *)__p, (uint64_t)v59);
      v25 = 0;
      if ((int)v5 >= 1 && !v26)
      {
        v27 = __p;
        v28 = (char *)v60[0] + 4;
        v29 = v15;
        do
        {
          v30 = sub_23CCB7064((unsigned int *)a1, __b);
          v31 = v30;
          if (v30)
            v32 = 2;
          else
            v32 = 1;
          if (sub_23CCB7064((unsigned int *)a1, &__b[v32]))
            v33 = 2;
          else
            v33 = 0;
          *v27++ = *(_DWORD *)&v28[4 * ((*((_DWORD *)v28 - 1) + ~(v33 | v31)) & 3)];
          v28 += 20;
          --v29;
        }
        while (v29);
        v25 = 0;
        a3 = v48;
        v5 = v50;
        v15 = v52;
      }
      goto LABEL_35;
    }
    v57 = -1;
    v56 = -1;
    sub_23CCBBE94((_QWORD *)a1, v12, v10, (unsigned int *)(*(_QWORD *)(a1 + 1256) + 12 * v12), &v56);
    v13 = v56;
    v14 = HIDWORD(v56);
    if (v56 < 0)
    {
      sub_23CCBBE94((_QWORD *)a1, v12, v10, (unsigned int *)(*(_QWORD *)(a1 + 1280) + 12 * v12), &v56);
      if (v56 < 0)
      {
        v15 = v52;
        if (v14 == -1)
        {
LABEL_23:
          v5 = v50;
          goto LABEL_24;
        }
LABEL_12:
        if (!v54 || *(_BYTE *)(a3 + v13) && *(_BYTE *)(a3 + v14))
        {
          if ((int)v15 >= 1)
          {
            v16 = (int *)(a2 + 4 * v13 * (int)v50);
            v17 = (int *)(a2 + 4 * v14 * (int)v15);
            v18 = (int *)__p;
            v19 = v15;
            do
            {
              v21 = *v16++;
              v20 = v21;
              v22 = *v17++;
              v23 = __OFADD__(v22, v20);
              v24 = v22 + v20;
              if (v24 < 0 != v23)
                ++v24;
              *v18++ = v24 >> 1;
              --v19;
            }
            while (v19);
          }
          v25 = 1;
          v5 = v50;
LABEL_35:
          sub_23CCB6B9C((unsigned int *)a1, (uint64_t)__p, v5, v49, (_BYTE *)(a1 + 4372), (_QWORD *)v62 + 15 * v25, a2 + 4 * v10 * v5);
          if ((int)v15 >= 1)
          {
            v34 = (char *)v60[0] + 4;
            v35 = v11;
            v36 = v15;
            do
            {
              v38 = *v35++;
              v37 = v38;
              v39 = *((_DWORD *)v34 - 1);
              if (*(_DWORD *)&v34[4 * (((_BYTE)v39 - 1) & 3)] != v38)
              {
                *((_DWORD *)v34 - 1) = v39 + 1;
                *(_DWORD *)&v34[4 * (v39 & 3)] = v37;
              }
              v34 += 20;
              --v36;
            }
            while (v36);
          }
          goto LABEL_40;
        }
        goto LABEL_23;
      }
      v13 = v56;
      v14 = HIDWORD(v56);
    }
    v15 = v52;
    goto LABEL_12;
  }
LABEL_41:
  if (__p)
  {
    v59 = __p;
    operator delete(__p);
  }
  if (v60[0])
  {
    v60[1] = v60[0];
    operator delete(v60[0]);
  }
  for (i = 0; i != -240; i -= 120)
  {
    v41 = (_QWORD *)((char *)v62 + i);
    v42 = *(void **)((char *)&v62[13] + i + 8);
    if (v42)
    {
      v41[28] = v42;
      operator delete(v42);
    }
    v43 = (void *)v41[24];
    if (v43)
    {
      *(_QWORD *)((char *)&v62[12] + i + 8) = v43;
      operator delete(v43);
    }
    v44 = (char *)v62 + i;
    v45 = *(void **)((char *)&v62[10] + i + 8);
    if (v45)
    {
      *((_QWORD *)v44 + 22) = v45;
      operator delete(v45);
    }
    v46 = (void *)*((_QWORD *)v44 + 18);
    if (v46)
    {
      *(_QWORD *)((char *)&v62[9] + i + 8) = v46;
      operator delete(v46);
    }
    v47 = (void *)v41[15];
    if (v47)
    {
      *(_QWORD *)((char *)&v62[8] + i) = v47;
      operator delete(v47);
    }
  }
}

void sub_23CCBFE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t i;

  if (__p)
    operator delete(__p);
  for (i = 120; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)(&a27 + i));
  _Unwind_Resume(a1);
}

_QWORD *sub_23CCBFE68(_QWORD *a1)
{
  void *v2;

  v2 = operator new(0x1128uLL);
  sub_23CCC1094((uint64_t)v2);
  *a1 = v2;
  return a1;
}

void sub_23CCBFE9C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_23CCBFEB0(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_23CCBFF28(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + 12 * a2;
  }
}

void sub_23CCBFEEC(uint64_t *a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_23CCC01A8(a1, v5, a3);
  }
  else if (!v4)
  {
    a1[1] = *a1 + 12 * a2;
  }
}

void sub_23CCBFF28(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  void *__p;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555)
      sub_23CCB1C80();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0xAAAAAAAAAAAAAAALL)
      v11 = 0x1555555555555555;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)sub_23CCC0164(v4, v11);
    else
      v12 = 0;
    __p = v12;
    v16 = &v12[12 * v8];
    v18 = &v12[12 * v11];
    v14 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v16, v14);
    v17 = &v16[v14];
    sub_23CCC00FC(a1, &__p);
    if (v17 != v16)
      v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
    if (__p)
      operator delete(__p);
  }
}

void sub_23CCC00B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_23CCC00FC(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *(_DWORD *)(v2 - 12);
    v2 -= 12;
    *(_DWORD *)(v4 - 12) = v5;
    v4 -= 12;
    *(_DWORD *)(v4 + 4) = *(_DWORD *)(v2 + 4);
    *(_DWORD *)(v4 + 8) = *(_DWORD *)(v2 + 8);
  }
  a2[1] = v4;
  v6 = *result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_23CCC0164(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    sub_23CCB1CC8();
  return operator new(12 * a2);
}

void sub_23CCC01A8(uint64_t *a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _DWORD *v15;
  char *v16;
  char *v17;
  void *__p;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)v9) >> 2) >= a2)
  {
    if (a2)
    {
      v15 = &v9[3 * a2];
      do
      {
        *v9 = *a3;
        v9[1] = a3[1];
        v9[2] = a3[2];
        v9 += 3;
      }
      while (v9 != v15);
      v9 = v15;
    }
    a1[1] = (uint64_t)v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *a1) >> 2);
    v11 = v10 + a2;
    if (v10 + a2 > 0x1555555555555555)
      sub_23CCB1C80();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0xAAAAAAAAAAAAAAALL)
      v13 = 0x1555555555555555;
    else
      v13 = v11;
    v22 = v6;
    if (v13)
      v14 = (char *)sub_23CCC0164(v6, v13);
    else
      v14 = 0;
    v16 = &v14[12 * v10];
    __p = v14;
    v19 = v16;
    v21 = &v14[12 * v13];
    v17 = &v16[12 * a2];
    do
    {
      *(_DWORD *)v16 = *a3;
      *((_DWORD *)v16 + 1) = a3[1];
      *((_DWORD *)v16 + 2) = a3[2];
      v16 += 12;
    }
    while (v16 != v17);
    v20 = v17;
    sub_23CCC00FC(a1, &__p);
    if (v20 != v19)
      v20 = &v19[(v20 - v19 - 12) % 0xCuLL];
    if (__p)
      operator delete(__p);
  }
}

void sub_23CCC0330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23CCC037C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_23CCC05B8((char **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 12 * a2;
  }
}

void sub_23CCC03B8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  void *__p;
  void *v6;
  uint64_t v7;

  v2 = a1 + 8;
  v3 = a1 + 1544;
  v4 = a2;
  do
  {
    __p = 0;
    v6 = 0;
    v7 = 0;
    sub_23CCC07A8(&__p, *(const void **)v2, *(_QWORD *)(v2 + 8), (uint64_t)(*(_QWORD *)(v2 + 8) - *(_QWORD *)v2) >> 3);
    sub_23CCC0714(&__p, v4);
    if (__p)
    {
      v6 = __p;
      operator delete(__p);
    }
    v2 += 24;
  }
  while (v2 != v3);
}

void sub_23CCC0430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23CCC044C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_23CCC0894((void **)a1, a2 - v2);
  }
}

void sub_23CCC047C(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      sub_23CCB1C80();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_23CCC09D4(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_23CCC0510(unint64_t *a1, size_t __sz)
{
  unint64_t v2;
  char *v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  char *v9;
  char v10;

  v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      sub_23CCB1C80();
    v5 = (char *)a1[1];
    v6 = operator new(__sz);
    v7 = &v5[(_QWORD)v6 - v2];
    v8 = v7;
    if (v5 != (char *)v2)
    {
      v9 = &v5[~v2];
      do
      {
        v10 = *--v5;
        (v9--)[(_QWORD)v6] = v10;
      }
      while (v5 != (char *)v2);
      v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
      operator delete((void *)v2);
  }
}

void sub_23CCC05B8(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-v7] >> 2) >= a2)
  {
    if (a2)
    {
      v13 = v7 + 12 * a2;
      do
      {
        *(_QWORD *)v7 = 0xFFFFFFFF00000000;
        *(_DWORD *)(v7 + 8) = -1;
        v7 += 12;
      }
      while (v7 != v13);
      v7 = v13;
    }
    a1[1] = (char *)v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)*a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555)
      sub_23CCB1C80();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0xAAAAAAAAAAAAAAALL)
      v11 = 0x1555555555555555;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_23CCC0164(v4, v11);
    else
      v12 = 0;
    v14 = &v12[12 * v8];
    v15 = &v14[12 * a2];
    v16 = v14;
    do
    {
      *(_QWORD *)v16 = 0xFFFFFFFF00000000;
      *((_DWORD *)v16 + 2) = -1;
      v16 += 12;
    }
    while (v16 != v15);
    v17 = &v12[12 * v11];
    v19 = *a1;
    v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_QWORD *)(v18 - 12);
        v18 -= 12;
        v21 = *((_DWORD *)v18 + 2);
        *(_QWORD *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = v17;
    if (v18)
      operator delete(v18);
  }
}

void sub_23CCC0714(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_23CCB1C80();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_23CCC0860(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

_QWORD *sub_23CCC07A8(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_23CCC0820(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23CCC0804(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_23CCC0820(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_23CCB1C80();
  result = (char *)sub_23CCC0860((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_23CCC0860(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_23CCB1CC8();
  return operator new(8 * a2);
}

void sub_23CCC0894(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_23CCB1C80();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_23CCC09A0(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void *sub_23CCC09A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_23CCB1CC8();
  return operator new(16 * a2);
}

void *sub_23CCC09D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_23CCB1CC8();
  return operator new(4 * a2);
}

void sub_23CCC0A08(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 2 * a2;
  }
  else
  {
    sub_23CCC0A38((char **)a1, a2 - v2);
  }
}

void sub_23CCC0A38(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int16 v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_23CCD46A0, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 1);
    if (v10 < 0)
      sub_23CCB1C80();
    v11 = v9 >> 1;
    v12 = v5 - v8;
    if (v12 > v10)
      v10 = v12;
    if (v12 >= 0x7FFFFFFFFFFFFFFELL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)sub_23CCC0B44(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[2 * v11];
    v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_23CCD46A0, 2 * a2);
    v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void *sub_23CCC0B44(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_23CCB1CC8();
  return operator new(2 * a2);
}

uint64_t sub_23CCC0B74(uint64_t a1, int a2)
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3496)))
    return sub_23CCB7218((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + a2;
  v4 = a1 + 3536;
  v5 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3536));
  if (v5)
    v6 = 4;
  else
    v6 = 2;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v4 + v6)))
    v7 = 2;
  else
    v7 = 0;
  v8 = v7 | v5;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v4 + 2 * (v8 + 3))))
    v9 = 4;
  else
    v9 = 0;
  v10 = v8 | v9;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v4 + 2 * (v10 + 7))))
    v11 = 8;
  else
    v11 = 0;
  v12 = v10 | v11;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v4 + 2 * (v12 + 15))))
    v13 = 16;
  else
    v13 = 0;
  v14 = v12 | v13;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(v4 + 2 * ((v12 | v13) + 31))))
    v15 = 32;
  else
    v15 = 0;
  v16 = sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3664));
  if (v16)
    v17 = 4;
  else
    v17 = 2;
  if (sub_23CCB7064((unsigned int *)a1, (_WORD *)(a1 + 3664 + v17)))
    v18 = 2;
  else
    v18 = 0;
  v19 = v18 | v16;
  if (v19 != 3)
    goto LABEL_29;
  v20 = sub_23CCB7154((unsigned int *)a1, 0, (_WORD *)(a1 + 3670));
  if (v20 >= -3)
  {
    v19 = v20 + 3;
LABEL_29:
    v21 = a1 + 24 * (v14 | v15);
    v22 = *(_QWORD *)(v21 + 1512);
    v23 = *(_QWORD *)(v21 + 1504);
    if (v19 < (int)((unint64_t)(v22 - v23) >> 3))
    {
      v24 = *(_QWORD *)(v23 + 8 * v19);
      if (v24)
        return -1431655765 * ((unint64_t)(v24 - *(_QWORD *)(a1 + 1472)) >> 2);
    }
  }
  *(_DWORD *)(a1 + 4384) = 3;
  return 0xFFFFFFFFLL;
}

_QWORD *sub_23CCC0D34(_QWORD *result, int a2, unsigned int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t i;
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  int *v12;
  int v13;
  int v14;
  int v15;
  _DWORD *v16;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  _DWORD *v22;

  v4 = (a4 - 2);
  if (a3 > 2)
  {
    if (a3 == 3 || a3 == 5)
    {
      if (a4 >= 2)
      {
        v12 = (int *)(result[181] + 16 * a2);
        v13 = v12[3];
        v14 = *v12;
        do
        {
          v15 = v14;
          v14 = *(_DWORD *)(result[166] + 4 * v4);
          if (*(_BYTE *)(result[169] + v4))
          {
            v16 = (_DWORD *)(result[157] + 12 * v14);
            *v16 = a2;
            v16[1] = v15;
            v16[2] = v13;
          }
          v13 = v15;
        }
        while (v4-- > 0);
      }
    }
    else if (a4 >= 1)
    {
      v18 = 0;
      v19 = -1;
      v20 = -1;
      do
      {
        v21 = v19;
        v19 = *(_DWORD *)(result[166] + 4 * v18);
        if (*(_BYTE *)(result[169] + v18))
        {
          v22 = (_DWORD *)(result[157] + 12 * v19);
          *v22 = a2;
          v22[1] = v21;
          v22[2] = v20;
        }
        ++v18;
        v20 = v21;
      }
      while (a4 != v18);
    }
  }
  else
  {
    v5 = result[181];
    if (a4 >= 2)
    {
      v6 = *(_DWORD *)(v5 + 16 * a2 + 4);
      v7 = *(_DWORD *)(v5 + 16 * a2 + 8);
      for (i = 1; i != a4; ++i)
      {
        v9 = *(_DWORD *)(result[166] + 4 * i);
        if (*(_BYTE *)(result[169] + i))
        {
          v10 = (_DWORD *)(result[157] + 12 * v9);
          *v10 = a2;
          v10[1] = v6;
          v10[2] = v7;
        }
        v7 = v6;
        v6 = v9;
      }
    }
    if (!a3)
    {
      if (*(_BYTE *)(result[169] + v4))
      {
        v11 = (_DWORD *)(result[160] + 12 * *(int *)(result[166] + 4 * v4));
        *v11 = a2;
        v11[1] = *(_DWORD *)(v5 + 16 * a2);
        v11[2] = *(_DWORD *)(v5 + 16 * a2 + 12);
      }
    }
  }
  return result;
}

void sub_23CCC0EB0(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      sub_23CCB1C80();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

_QWORD *sub_23CCC0FD8(_QWORD *a1, size_t a2, _BYTE *a3)
{
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    v5 = a2;
    sub_23CCC1054(a1, a2);
    v6 = (_BYTE *)a1[1];
    v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_23CCC1038(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_23CCC1054(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_23CCB1C80();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t sub_23CCC1094(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 1140) = 0;
  *(_OWORD *)(a1 + 1072) = 0u;
  *(_OWORD *)(a1 + 1088) = 0u;
  *(_OWORD *)(a1 + 1104) = 0u;
  *(_OWORD *)(a1 + 1120) = 0u;
  *(_BYTE *)(a1 + 1136) = 0;
  *(_BYTE *)(a1 + 1144) = 4;
  *(_QWORD *)(a1 + 1148) = 0x101010100000002;
  *(_BYTE *)(a1 + 1156) = 1;
  *(_DWORD *)(a1 + 1496) = 0;
  *(_OWORD *)(a1 + 1176) = 0u;
  *(_OWORD *)(a1 + 1192) = 0u;
  *(_OWORD *)(a1 + 1208) = 0u;
  *(_OWORD *)(a1 + 1224) = 0u;
  *(_OWORD *)(a1 + 1240) = 0u;
  *(_OWORD *)(a1 + 1256) = 0u;
  *(_OWORD *)(a1 + 1272) = 0u;
  *(_OWORD *)(a1 + 1288) = 0u;
  *(_OWORD *)(a1 + 1304) = 0u;
  *(_OWORD *)(a1 + 1320) = 0u;
  *(_OWORD *)(a1 + 1160) = 0u;
  *(_OWORD *)(a1 + 1336) = 0u;
  *(_OWORD *)(a1 + 1352) = 0u;
  *(_OWORD *)(a1 + 1368) = 0u;
  *(_OWORD *)(a1 + 1384) = 0u;
  *(_OWORD *)(a1 + 1400) = 0u;
  *(_OWORD *)(a1 + 1416) = 0u;
  *(_OWORD *)(a1 + 1432) = 0u;
  *(_OWORD *)(a1 + 1448) = 0u;
  *(_OWORD *)(a1 + 1464) = 0u;
  *(_OWORD *)(a1 + 1480) = 0u;
  *(_DWORD *)(a1 + 1500) = -1;
  bzero((void *)(a1 + 1504), 0x700uLL);
  memset_pattern16((void *)(a1 + 3296), &unk_23CCD46A0, 0xAuLL);
  *(_WORD *)(a1 + 3306) = 0x8000;
  memset_pattern16((void *)(a1 + 3308), &unk_23CCD46A0, 0x60uLL);
  *(_WORD *)(a1 + 3404) = 0x8000;
  memset_pattern16((void *)(a1 + 3406), &unk_23CCD46A0, 6uLL);
  *(_WORD *)(a1 + 3412) = 0x8000;
  memset_pattern16((void *)(a1 + 3414), &unk_23CCD46A0, 0x50uLL);
  *(_DWORD *)(a1 + 3494) = -2147450880;
  memset_pattern16((void *)(a1 + 3498), &unk_23CCD46A0, 0x20uLL);
  *(_DWORD *)(a1 + 3530) = -2147450880;
  *(_WORD *)(a1 + 3534) = 0x8000;
  memset_pattern16((void *)(a1 + 3536), &unk_23CCD46A0, 0x80uLL);
  memset_pattern16((void *)(a1 + 3664), &unk_23CCD46A0, 6uLL);
  *(_WORD *)(a1 + 3670) = 0x8000;
  memset_pattern16((void *)(a1 + 3672), &unk_23CCD46A0, 6uLL);
  *(_OWORD *)(a1 + 4028) = 0u;
  *(_OWORD *)(a1 + 4016) = 0u;
  *(_OWORD *)(a1 + 4000) = 0u;
  *(_OWORD *)(a1 + 3984) = 0u;
  *(_OWORD *)(a1 + 3968) = 0u;
  *(_OWORD *)(a1 + 3952) = 0u;
  *(_OWORD *)(a1 + 3936) = 0u;
  *(_OWORD *)(a1 + 3920) = 0u;
  *(_OWORD *)(a1 + 3904) = 0u;
  *(_OWORD *)(a1 + 3888) = 0u;
  *(_OWORD *)(a1 + 3872) = 0u;
  *(_OWORD *)(a1 + 3856) = 0u;
  *(_OWORD *)(a1 + 3840) = 0u;
  *(_OWORD *)(a1 + 3824) = 0u;
  *(_OWORD *)(a1 + 3808) = 0u;
  *(_OWORD *)(a1 + 3792) = 0u;
  *(_OWORD *)(a1 + 3776) = 0u;
  *(_OWORD *)(a1 + 3760) = 0u;
  *(_OWORD *)(a1 + 3744) = 0u;
  *(_OWORD *)(a1 + 3728) = 0u;
  *(_OWORD *)(a1 + 3712) = 0u;
  *(_OWORD *)(a1 + 3696) = 0u;
  *(_OWORD *)(a1 + 3680) = 0u;
  *(_BYTE *)(a1 + 4044) = 4;
  *(_DWORD *)(a1 + 4048) = 2;
  *(_OWORD *)(a1 + 4356) = 0u;
  *(_OWORD *)(a1 + 4056) = 0u;
  *(_OWORD *)(a1 + 4072) = 0u;
  *(_OWORD *)(a1 + 4088) = 0u;
  *(_OWORD *)(a1 + 4104) = 0u;
  *(_OWORD *)(a1 + 4120) = 0u;
  *(_OWORD *)(a1 + 4136) = 0u;
  *(_OWORD *)(a1 + 4152) = 0u;
  *(_OWORD *)(a1 + 4168) = 0u;
  *(_OWORD *)(a1 + 4184) = 0u;
  *(_OWORD *)(a1 + 4200) = 0u;
  *(_OWORD *)(a1 + 4216) = 0u;
  *(_OWORD *)(a1 + 4232) = 0u;
  *(_OWORD *)(a1 + 4248) = 0u;
  *(_OWORD *)(a1 + 4264) = 0u;
  *(_OWORD *)(a1 + 4280) = 0u;
  *(_OWORD *)(a1 + 4296) = 0u;
  *(_OWORD *)(a1 + 4312) = 0u;
  *(_OWORD *)(a1 + 4328) = 0u;
  *(_OWORD *)(a1 + 4344) = 0u;
  *(_BYTE *)(a1 + 4372) = 4;
  *(_DWORD *)(a1 + 4376) = 2;
  *(_DWORD *)(a1 + 4384) = 6;
  return a1;
}

void sub_23CCC12C8(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      sub_23CCB1C80();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)sub_23CCC09D4(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void sub_23CCC13D0(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      sub_23CCB1C80();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_23CCC09D4(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *sub_23CCC14E0(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_23CCC1560(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_23CCC1544(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_23CCC1560(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_23CCB1C80();
  result = (char *)sub_23CCC09D4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

_QWORD *sub_23CCC15A0(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_23CCC1560(a1, a2);
  v4 = (char *)a1[1];
  bzero(v4, 4 * a2);
  a1[1] = &v4[4 * a2];
  return a1;
}

void sub_23CCC15F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_23CCC160C(_DWORD *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = *(unsigned int *)(a2 + 8);
  if ((v2 & 0x80000000) != 0)
    return 0;
  v3 = *(_DWORD *)(a2 + 4);
  v4 = *(_QWORD *)&a1[6 * v3 + 2];
  v5 = ((unint64_t)(*(_QWORD *)&a1[6 * v3 + 4] - v4) >> 3) - 1;
  if ((_DWORD)v2 != v5)
  {
    v6 = *(_QWORD *)(v4 + 8 * v2);
    *(_QWORD *)(v4 + 8 * v2) = *(_QWORD *)(v4 + 8 * v5);
    *(_QWORD *)(v4 + 8 * v5) = v6;
    *(_DWORD *)(*(_QWORD *)(v4 + 8 * v2) + 8) = v2;
    *(_DWORD *)(v6 + 8) = v5;
  }
  return sub_23CCC1660(a1, v3);
}

uint64_t sub_23CCC1660(_DWORD *a1, int a2)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;

  v2 = &a1[6 * a2];
  v3 = *((_QWORD *)v2 + 2);
  v4 = *(_QWORD *)(v3 - 8);
  *((_QWORD *)v2 + 2) = v3 - 8;
  *(_DWORD *)(v4 + 8) = -1;
  if ((*a1)-- == 1)
  {
    a1[1] = -1;
  }
  else
  {
    v6 = a1[1];
    if ((v6 & 0x80000000) == 0)
    {
      do
      {
        if (*(_QWORD *)&a1[6 * v6 + 2] != *(_QWORD *)&a1[6 * v6 + 4])
          break;
        a1[1] = v6 - 1;
      }
      while (v6-- > 0);
    }
  }
  return v4;
}

_QWORD *sub_23CCC16CC(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_23CCC1750(a1, a2);
    v4 = a1[1];
    v5 = v4 + 20 * a2;
    v6 = 20 * a2;
    v7 = (_QWORD *)(v4 + 4);
    do
    {
      *v7 = 0;
      v7[1] = 0;
      *((_DWORD *)v7 - 1) = 4;
      v7 = (_QWORD *)((char *)v7 + 20);
      v6 -= 20;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_23CCC1734(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_23CCC1750(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xCCCCCCCCCCCCCCDLL)
    sub_23CCB1C80();
  result = (char *)sub_23CCC17A0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[20 * v4];
  return result;
}

void *sub_23CCC17A0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL)
    sub_23CCB1CC8();
  return operator new(20 * a2);
}

_QWORD *sub_23CCC17E4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  _QWORD *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  sub_23CCC1A18((uint64_t)(a1 + 531));
  sub_23CCC1A18((uint64_t)(a1 + 522));
  v2 = (void *)a1[519];
  if (v2)
  {
    a1[520] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[516];
  if (v3)
  {
    a1[517] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[513];
  if (v4)
  {
    a1[514] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[510];
  if (v5)
  {
    a1[511] = v5;
    operator delete(v5);
  }
  v6 = (void *)a1[507];
  if (v6)
  {
    a1[508] = v6;
    operator delete(v6);
  }
  v7 = (void *)a1[496];
  if (v7)
  {
    a1[497] = v7;
    operator delete(v7);
  }
  v8 = (void *)a1[493];
  if (v8)
  {
    a1[494] = v8;
    operator delete(v8);
  }
  v9 = (void *)a1[490];
  if (v9)
  {
    a1[491] = v9;
    operator delete(v9);
  }
  for (i = 488; i != 458; i -= 15)
  {
    v11 = &a1[i];
    v12 = (void *)a1[i - 1];
    if (v12)
    {
      a1[i] = v12;
      operator delete(v12);
    }
    v13 = (void *)*(v11 - 4);
    if (v13)
    {
      a1[i - 3] = v13;
      operator delete(v13);
    }
    v14 = &a1[i];
    v15 = (void *)a1[i - 7];
    if (v15)
    {
      *(v14 - 6) = v15;
      operator delete(v15);
    }
    v16 = (void *)*(v14 - 10);
    if (v16)
    {
      a1[i - 9] = v16;
      operator delete(v16);
    }
    v17 = (void *)*(v11 - 13);
    if (v17)
    {
      a1[i - 12] = v17;
      operator delete(v17);
    }
  }
  v18 = 192;
  do
  {
    v19 = (void *)a1[v18 + 185];
    if (v19)
    {
      a1[v18 + 186] = v19;
      operator delete(v19);
    }
    v18 -= 3;
  }
  while (v18 * 8);
  v20 = (void *)a1[184];
  if (v20)
  {
    a1[185] = v20;
    operator delete(v20);
  }
  v21 = (void *)a1[181];
  if (v21)
  {
    a1[182] = v21;
    operator delete(v21);
  }
  v22 = (void *)a1[178];
  if (v22)
  {
    a1[179] = v22;
    operator delete(v22);
  }
  v23 = (void *)a1[175];
  if (v23)
  {
    a1[176] = v23;
    operator delete(v23);
  }
  v24 = (void *)a1[172];
  if (v24)
  {
    a1[173] = v24;
    operator delete(v24);
  }
  v25 = (void *)a1[169];
  if (v25)
  {
    a1[170] = v25;
    operator delete(v25);
  }
  v26 = (void *)a1[166];
  if (v26)
  {
    a1[167] = v26;
    operator delete(v26);
  }
  v27 = (void *)a1[163];
  if (v27)
  {
    a1[164] = v27;
    operator delete(v27);
  }
  v28 = (void *)a1[160];
  if (v28)
  {
    a1[161] = v28;
    operator delete(v28);
  }
  v29 = (void *)a1[157];
  if (v29)
  {
    a1[158] = v29;
    operator delete(v29);
  }
  v30 = (void *)a1[154];
  if (v30)
  {
    a1[155] = v30;
    operator delete(v30);
  }
  v31 = (void *)a1[151];
  if (v31)
  {
    a1[152] = v31;
    operator delete(v31);
  }
  v32 = (void *)a1[148];
  if (v32)
  {
    a1[149] = v32;
    operator delete(v32);
  }
  v33 = (void *)a1[145];
  if (v33)
  {
    a1[146] = v33;
    operator delete(v33);
  }
  return a1;
}

uint64_t sub_23CCC1A18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v3;
    operator delete(v3);
  }
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_23CCC1A68(int32x2_t *a1, uint64_t a2, int *a3, unint64_t a4, _DWORD *a5, unint64_t a6, _DWORD *a7, uint64_t a8, int *a9, unint64_t *a10, uint64_t *a11)
{
  int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;

  v18 = a9;
  v19 = 4 * a4;
  if (!*(_BYTE *)(a8 + 16))
    v19 = 0;
  v20 = 12 * a2 + 4 * a4 + 4 * a6 + v19 + 1024;
  v21 = *a10;
  v22 = a10[1] - *a10;
  if (v20 <= v22)
  {
    if (v20 < v22)
      a10[1] = v21 + v20;
  }
  else
  {
    v24 = a8;
    sub_23CCC0EB0(a10, v20 - v22);
    v18 = a9;
    a8 = v24;
    v21 = *a10;
  }
  *a11 = 0;
  return sub_23CCC1B84(v18, a1, a2, a3, a4, a5, a6, a7, v21, v20, a11, 0, 0, 0, a8);
}

void sub_23CCC1B5C(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  size_t v4;

  v2 = a1[1] - *a1;
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_23CCC0EB0(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }
}

uint64_t sub_23CCC1B84(int *a1, int32x2_t *a2, uint64_t a3, int *a4, unint64_t a5, _DWORD *a6, unint64_t a7, _DWORD *a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _QWORD *v23;
  const std::locale::facet *v24;
  _QWORD *v25;
  const std::locale::facet *v26;
  _QWORD *v27;
  const std::locale::facet *v28;
  _QWORD *v29;
  const std::locale::facet *v30;
  _QWORD *v31;
  const std::locale::facet *v32;
  _QWORD *v33;
  const std::locale::facet *v34;
  int v35;
  _QWORD *v36;
  const std::locale::facet *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  const char *v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  int v57;
  int v59;
  int v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  int32x2_t v77;
  int32x2_t v78;
  int v79;
  int v80;
  uint64_t v81;
  int *v82;
  int32x2_t v83;
  int v84;
  int v85;
  uint64_t v86;
  _DWORD *v87;
  int v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t i;
  uint64_t v103;
  _BYTE *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int v108;
  uint64_t v109;
  _QWORD *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  char v117;
  char v118;
  char v119;
  char v120;
  unint64_t v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  int32x2_t *v129;
  uint64_t v130;
  _DWORD *v131;
  int v132;
  uint64_t v133;
  _DWORD *v134;
  int v135;
  uint64_t v136;
  int *v137;
  int v138;
  unint64_t v139;
  _BYTE *v140;
  _BYTE *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  uint64_t v147;
  int v148;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  int *v152;
  int *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unsigned int *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  int v176;
  uint64_t v177;
  int v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  int v182;
  _BOOL4 v183;
  _BOOL4 v184;
  unsigned int v185;
  int v186;
  uint64_t v187;
  _QWORD *v188;
  int v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  int *v193;
  int v194;
  int v195;
  int *v196;
  int *v197;
  int *v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  _BOOL4 v219;
  unsigned int v220;
  unsigned int v221;
  unsigned int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  BOOL v229;
  unsigned int v230;
  int v231;
  unsigned int v232;
  uint64_t v233;
  _DWORD *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  BOOL v242;
  unint64_t v243;
  uint64_t v244;
  int v245;
  int v246;
  uint64_t v247;
  int v248;
  int v249;
  int v250;
  int v251;
  unsigned int v252;
  _BOOL4 v253;
  unsigned int v254;
  unsigned int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  unsigned int v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  BOOL v266;
  unint64_t v267;
  uint64_t v268;
  unint64_t v269;
  int v270;
  int v271;
  uint64_t v272;
  int *v273;
  int v274;
  int v275;
  _BOOL4 v276;
  _BOOL4 v277;
  _BOOL4 v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  uint64_t v282;
  int v283;
  uint64_t v284;
  int v285;
  int v286;
  _BOOL4 v287;
  _BOOL4 v288;
  unsigned int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  _BOOL4 v294;
  _BOOL4 v295;
  unsigned int v296;
  uint64_t v297;
  uint64_t v298;
  unint64_t v299;
  int v300;
  uint64_t v301;
  int v302;
  int v303;
  int *v304;
  unsigned int v305;
  uint64_t v306;
  int v307;
  unsigned int v308;
  unsigned int v309;
  _QWORD *v310;
  _QWORD *v311;
  _DWORD *v312;
  unint64_t v313;
  int v314;
  uint64_t v315;
  int v316;
  int *v317;
  unsigned int v318;
  uint64_t v319;
  unsigned int v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  uint64_t v324;
  uint64_t v325;
  int *v326;
  int *v327;
  int v328;
  int v329;
  int *v330;
  int v331;
  uint64_t v332;
  int v333;
  int v334;
  BOOL v335;
  int v336;
  uint64_t v337;
  std::locale::__imp *locale;
  int *v339;
  uint64_t v340;
  int v341;
  _DWORD *v342;
  int v343;
  uint64_t v344;
  int *v345;
  int *v346;
  int *v347;
  uint64_t v348;
  uint64_t v349;
  int v350;
  int v351;
  uint64_t n;
  uint64_t v353;
  BOOL v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unsigned __int8 *v360;
  unsigned int v361;
  int v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  int32x2_t v366;
  int v367;
  uint64_t v368;
  int32x2_t *v369;
  __int32 v370;
  int32x2_t *v371;
  uint64_t v372;
  int *v373;
  _DWORD *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  int *v379;
  uint64_t v380;
  int *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  _DWORD *v385;
  uint64_t v386;
  int *v387;
  uint64_t v388;
  _QWORD *v389;
  int **v390;
  uint64_t v391;
  int **v392;
  uint64_t v393;
  uint64_t *v394;
  _DWORD *v395;
  uint64_t v396;
  unsigned int *v397;
  uint64_t v398;
  _DWORD *v399;
  _QWORD *v400;
  int v401;
  int v402;
  _WORD *v403;
  unsigned int *v404;
  int v405;
  uint64_t v406;
  _QWORD v407[2];
  _QWORD v408[11];
  char v409;
  uint64_t v410;
  int32x2_t v411;
  int v412;
  int32x2_t v413;
  int v414;
  uint64_t v415;
  int v416;
  __int16 v417;
  __int16 v418;
  int v419;
  std::locale __b;
  _QWORD v421[2];
  _WORD v422[16];
  _WORD v423[32];
  _WORD v424[2];
  uint64_t v425;

  v425 = *MEMORY[0x24BDAC8D0];
  sub_23CCAD950((uint64_t)v407);
  if (!a2)
  {
    v25 = sub_23CCADB14(v408, (uint64_t)"[Error] coordinates == nullptr", 30);
    std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(_QWORD *)(*v25 - 24)));
    v26 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a3)
  {
    v27 = sub_23CCADB14(v408, (uint64_t)"[Error] mesh has 0 vertices ", 28);
    std::ios_base::getloc((const std::ios_base *)((char *)v27 + *(_QWORD *)(*v27 - 24)));
    v28 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a5)
  {
    v29 = sub_23CCADB14(v408, (uint64_t)"[Error] mesh has 0 faces ", 25);
    std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(_QWORD *)(*v29 - 24)));
    v30 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a6)
  {
    v31 = sub_23CCADB14(v408, (uint64_t)"[Error] faceVertexCounts == nullptr", 35);
    std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(*v31 - 24)));
    v32 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a7)
  {
    v33 = sub_23CCADB14(v408, (uint64_t)"[Error] mesh has 0 indices ", 27);
    std::ios_base::getloc((const std::ios_base *)((char *)v33 + *(_QWORD *)(*v33 - 24)));
    v34 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v34->__vftable[2].~facet_0)(v34, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a4 && 3 * a5 != a7)
  {
    v23 = sub_23CCADB14(v408, (uint64_t)"[Error] triangular mesh has invalid indexCount ", 47);
    std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(_QWORD *)(*v23 - 24)));
    v24 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
LABEL_17:
    std::ostream::flush();
LABEL_18:
    v38 = 5;
    goto LABEL_19;
  }
  v35 = *(unsigned __int8 *)(a15 + 16);
  if (!a8 && *(_BYTE *)(a15 + 16))
  {
    v36 = sub_23CCADB14(v408, (uint64_t)"[Error] faceGroupIndices == nullptr", 35);
    std::ios_base::getloc((const std::ios_base *)((char *)v36 + *(_QWORD *)(*v36 - 24)));
    v37 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    goto LABEL_17;
  }
  if (!a9)
  {
    v45 = v408;
    v46 = "[Error] outputBuffer == nullptr";
    v47 = 31;
LABEL_60:
    v72 = sub_23CCADB14(v45, (uint64_t)v46, v47);
LABEL_61:
    sub_23CCC4A94(v72);
    goto LABEL_18;
  }
  if ((unint64_t)a10 <= 0x20)
  {
    sub_23CCADB14(v408, (uint64_t)"[Error] output buffer size is ", 30);
    v41 = (_QWORD *)std::ostream::operator<<();
    v42 = sub_23CCADB14(v41, (uint64_t)" bytes", 6);
    sub_23CCADB14(v42, (uint64_t)"It should at least ", 19);
    v43 = (_QWORD *)std::ostream::operator<<();
    v44 = sub_23CCADB14(v43, (uint64_t)" bytes ", 7);
    sub_23CCC4A94(v44);
    v38 = 1;
    goto LABEL_19;
  }
  v48 = *(_DWORD *)(a15 + 4);
  if (v48 >= 0x1C)
  {
    v45 = v408;
    v46 = "[Error] bit depth should be between 0 and 28";
    v47 = 44;
    goto LABEL_60;
  }
  v49 = *(_DWORD *)(a15 + 12);
  if (v49 >= 3)
  {
    sub_23CCADB14(v408, (uint64_t)"[Error] geometry precition mode ", 32);
    v63 = (_QWORD *)std::ostream::operator<<();
    v64 = sub_23CCADB14(v63, (uint64_t)" not supported. Only the following modes are supported : ", 57);
    sub_23CCADB14(v64, (uint64_t)"(", 1);
    v65 = (_QWORD *)std::ostream::operator<<();
    v66 = sub_23CCADB14(v65, (uint64_t)") ", 2);
    v67 = sub_23CCADB14(v66, (uint64_t)" DELTA,", 7);
    sub_23CCADB14(v67, (uint64_t)"(", 1);
    v68 = (_QWORD *)std::ostream::operator<<();
    v69 = sub_23CCADB14(v68, (uint64_t)") ", 2);
    v70 = sub_23CCADB14(v69, (uint64_t)" PARALLELOGRAM, and", 19);
    sub_23CCADB14(v70, (uint64_t)"(", 1);
    v71 = (_QWORD *)std::ostream::operator<<();
    v45 = sub_23CCADB14(v71, (uint64_t)") ", 2);
    v46 = " ADAPTIVE_PARALLELOGRAM.";
    v47 = 24;
    goto LABEL_60;
  }
  v50 = *(unsigned __int8 *)(a15 + 8);
  if (v50 > 4 || ((1 << v50) & 0x15) == 0)
  {
    sub_23CCADB14(v408, (uint64_t)"[Error] geometry binarization mode ", 35);
    v89 = (_QWORD *)std::ostream::operator<<();
    v90 = sub_23CCADB14(v89, (uint64_t)" not supported. Only the following modes are supported : ", 57);
    sub_23CCADB14(v90, (uint64_t)"(", 1);
    v91 = (_QWORD *)std::ostream::operator<<();
    v92 = sub_23CCADB14(v91, (uint64_t)") ", 2);
    v93 = sub_23CCADB14(v92, (uint64_t)" AC,", 4);
    sub_23CCADB14(v93, (uint64_t)"(", 1);
    v94 = (_QWORD *)std::ostream::operator<<();
    v95 = sub_23CCADB14(v94, (uint64_t)") ", 2);
    v96 = sub_23CCADB14(v95, (uint64_t)" EGK, and", 9);
    sub_23CCADB14(v96, (uint64_t)"(", 1);
    v97 = (_QWORD *)std::ostream::operator<<();
    v45 = sub_23CCADB14(v97, (uint64_t)") ", 2);
    v46 = " AC2.";
    v47 = 5;
    goto LABEL_60;
  }
  v395 = a8;
  if (a4)
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0x10000;
    do
    {
      v55 = a4[v51];
      if ((v55 - 3) >= 0xFFFD)
      {
        sub_23CCADB14(v408, (uint64_t)"[Error] faceVertexCounts[", 25);
        v98 = (_QWORD *)std::ostream::operator<<();
        sub_23CCADB14(v98, (uint64_t)"] == ", 5);
        v99 = (_QWORD *)std::ostream::operator<<();
        sub_23CCADB14(v99, (uint64_t)" is not the range 3 to ", 23);
        goto LABEL_377;
      }
      if ((int)v55 < v54)
        v54 = a4[v51];
      if (v53 <= (int)v55)
        v53 = a4[v51];
      v52 += v55;
      ++v51;
    }
    while (a5 != v51);
    if (v53 == 4 && v54 == 3)
      v57 = 2;
    else
      v57 = 3;
    if (v54 == 4 && v53 == 4)
      v59 = 1;
    else
      v59 = v57;
    if (v54 == 3 && v53 == 3)
      v61 = 0;
    else
      v61 = v59;
    if (v52 != a7)
    {
      sub_23CCADB14(v408, (uint64_t)"[Error] indexCount == ", 22);
      v62 = (_QWORD *)std::ostream::operator<<();
      sub_23CCADB14(v62, (uint64_t)" is different from expected value of ", 37);
      v45 = (_QWORD *)std::ostream::operator<<();
      v46 = " computed based on faceVertexCounts";
      v47 = 35;
      goto LABEL_60;
    }
  }
  else
  {
    v61 = 0;
  }
  v73 = 0;
  if (a7 <= 1)
    v74 = 1;
  else
    v74 = a7;
  do
  {
    v75 = a6[v73];
    if (v75 < 0 || v75 >= (int)a3)
    {
      sub_23CCADB14(v408, (uint64_t)"[Error] indices[", 16);
      v100 = (_QWORD *)std::ostream::operator<<();
      sub_23CCADB14(v100, (uint64_t)"] == ", 5);
      v101 = (_QWORD *)std::ostream::operator<<();
      sub_23CCADB14(v101, (uint64_t)" is not the range 0 to ", 23);
      goto LABEL_377;
    }
    ++v73;
  }
  while (v74 != v73);
  v411 = *a2;
  v76 = a2[1].i32[0];
  v413 = v411;
  v412 = v76;
  v414 = v76;
  if ((int)a3 >= 2)
  {
    v77 = v411;
    v78 = v413;
    v79 = v412;
    v80 = v414;
    v81 = a3 - 1;
    v82 = (int *)&a2[2] + 1;
    do
    {
      v83 = *(int32x2_t *)(v82 - 2);
      v77 = vmin_s32(v83, v77);
      v78 = vmax_s32(v78, v83);
      v85 = *v82;
      v82 += 3;
      v84 = v85;
      if (v85 < v79)
        v79 = v84;
      if (v80 <= v84)
        v80 = v84;
      --v81;
    }
    while (v81);
    v411 = v77;
    v413 = v78;
    v412 = v79;
    v414 = v80;
  }
  if (v48)
  {
    v86 = 0;
    while (1)
    {
      v87 = (_DWORD *)&v411 + v86;
      v88 = v87[3];
      if ((*v87 & 0x80000000) != 0 || v88 >= 1 << v48)
        break;
      *((_DWORD *)&v415 + v86++) = v88 - *v87;
      if (v86 == 3)
        goto LABEL_89;
    }
    sub_23CCADB14(v408, (uint64_t)"[Error] boundingBox[", 20);
    v110 = (_QWORD *)std::ostream::operator<<();
    sub_23CCADB14(v110, (uint64_t)"] == [", 6);
    v111 = (_QWORD *)std::ostream::operator<<();
    sub_23CCADB14(v111, (uint64_t)", ", 2);
    v112 = (_QWORD *)std::ostream::operator<<();
    sub_23CCADB14(v112, (uint64_t)"] is not in the range 0 to ", 27);
    goto LABEL_377;
  }
  for (i = 0; i != 3; ++i)
  {
    v103 = v413.i32[i] - (uint64_t)v411.i32[i];
    if (v103 > 0xFFFFFFF)
    {
      sub_23CCADB14(v408, (uint64_t)"[Error] boundingBox.max[", 24);
      v113 = (_QWORD *)std::ostream::operator<<();
      v114 = sub_23CCADB14(v113, (uint64_t)"] - ", 4);
      sub_23CCADB14(v114, (uint64_t)"boundingBox.min[", 16);
      v115 = (_QWORD *)std::ostream::operator<<();
      sub_23CCADB14(v115, (uint64_t)"] == ", 5);
      v116 = (_QWORD *)std::ostream::operator<<();
      sub_23CCADB14(v116, (uint64_t)" is larger than ", 16);
      goto LABEL_377;
    }
    *((_DWORD *)&v415 + i) = v103;
  }
LABEL_89:
  v104 = (_BYTE *)a15;
  if (v395 && v35)
  {
    v105 = 0;
    if (a5 <= 1)
      v106 = 1;
    else
      v106 = a5;
    while (1)
    {
      v107 = v395[v105];
      if (v107 < 0)
        v107 = -v107;
      if (v107 >> 28)
        break;
      if (v106 == ++v105)
        goto LABEL_98;
    }
    sub_23CCADB14(v408, (uint64_t)"[Error] abs(faceGroupIndices[", 29);
    v310 = (_QWORD *)std::ostream::operator<<();
    sub_23CCADB14(v310, (uint64_t)"]) == ", 6);
    v311 = (_QWORD *)std::ostream::operator<<();
    sub_23CCADB14(v311, (uint64_t)" is not in the range 0 to ", 26);
LABEL_377:
    v72 = (_QWORD *)std::ostream::operator<<();
    goto LABEL_61;
  }
LABEL_98:
  v108 = *(unsigned __int8 *)(a15 + 21);
  if (a10 >= 4)
  {
    v117 = *(_BYTE *)(a15 + 17);
    v118 = *(_BYTE *)(a15 + 18);
    v119 = *(_BYTE *)(a15 + 19);
    v120 = *(_BYTE *)(a15 + 20);
    *(_DWORD *)a9 = -90009999;
    *(_BYTE *)(a9 + 8) = 0;
    *(_BYTE *)(a9 + 9) = 8;
    if (((a10 - 8) & 0xFFFFFFFFFFFFFFFELL) == 2)
      goto LABEL_108;
    *(_WORD *)(a9 + 10) = 0;
    *(_DWORD *)(a9 + 16) = a3;
    if (((a10 - 16) & 0xFFFFFFFFFFFFFFFCLL) == 4)
      goto LABEL_108;
    *(_DWORD *)(a9 + 20) = a5;
    *(_BYTE *)(a9 + 24) = v50;
    *(_BYTE *)(a9 + 25) = v49;
    *(_BYTE *)(a9 + 26) = ((_BYTE)v61 << 6) | (2 * v117) | (4 * v118) | (8 * v119) | (16 * v120) | (32 * v108) | v35;
    *(_BYTE *)(a9 + 27) = v48;
    if ((a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x1C
      || (*(_DWORD *)(a9 + 28) = a7, (unint64_t)a10 < 0x24)
      || (*(_DWORD *)(a9 + 32) = v411.i32[0], (a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x24)
      || (*(_DWORD *)(a9 + 36) = v411.i32[1], (a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x28))
    {
LABEL_108:
      v109 = 0;
      v397 = 0;
    }
    else
    {
      v109 = a10 - 44;
      v397 = (unsigned int *)(a9 + 44);
      *(_DWORD *)(a9 + 40) = v412;
    }
    v104 = (_BYTE *)a15;
    v108 = *(unsigned __int8 *)(a15 + 21);
  }
  else
  {
    v109 = 0;
    v397 = 0;
  }
  if (v108)
  {
    v121 = 0;
    do
    {
      v122 = *((_DWORD *)&v415 + v121);
      v123 = 32 - __clz(v122);
      if (v122)
        v124 = v123;
      else
        v124 = 0;
      *((_DWORD *)&v415 + v121) = v124;
      v335 = v109-- < 1;
      if (v335)
      {
        v109 = 0;
        v397 = 0;
        v125 = 1;
      }
      else
      {
        *(_BYTE *)v397 = v124;
        v397 = (unsigned int *)((char *)v397 + 1);
        v125 = v104[21];
      }
      if (v121 > 1)
        break;
      ++v121;
    }
    while (v125);
  }
  v391 = v109;
  *a1 = a3;
  a1[1] = a5;
  a1[2] = a7;
  *(_QWORD *)(a1 + 3) = v415;
  a1[5] = v416;
  *((int32x2_t *)a1 + 3) = v411;
  a1[8] = v412;
  a1[9] = v61;
  v394 = (uint64_t *)(a1 + 16);
  sub_23CCB659C((uint64_t)(a1 + 16), 0);
  LODWORD(__b.__locale_) = -1;
  sub_23CCBA1AC((uint64_t)(a1 + 16), (int)a3, &__b);
  v390 = (int **)(a1 + 10);
  sub_23CCB659C((uint64_t)(a1 + 10), 0);
  LODWORD(__b.__locale_) = -1;
  sub_23CCBA1AC((uint64_t)(a1 + 10), (int)a5, &__b);
  v392 = (int **)(a1 + 28);
  sub_23CCB659C((uint64_t)(a1 + 28), (int)a5);
  sub_23CCB659C((uint64_t)(a1 + 22), (int)a3);
  sub_23CCB659C((uint64_t)(a1 + 64), (int)a5);
  sub_23CCBFEB0((uint64_t *)a1 + 17, 0);
  LODWORD(v421[0]) = -1;
  __b.__locale_ = (std::locale::__imp *)-1;
  sub_23CCBFEEC((uint64_t *)a1 + 17, (int)a3, &__b);
  sub_23CCBFEB0((uint64_t *)a1 + 20, 0);
  LODWORD(v421[0]) = -1;
  __b.__locale_ = (std::locale::__imp *)-1;
  sub_23CCBFEEC((uint64_t *)a1 + 20, (int)a3, &__b);
  sub_23CCBFEB0((uint64_t *)a1 + 23, (int)a3);
  v126 = 0;
  v127 = a3;
  do
  {
    v128 = a2[1].i32[v126] - a1[8];
    v129 = (int32x2_t *)(*((_QWORD *)a1 + 23) + v126 * 4);
    *v129 = vsub_s32(*(int32x2_t *)((char *)a2 + v126 * 4), *(int32x2_t *)(a1 + 6));
    v129[1].i32[0] = v128;
    v126 += 3;
    --v127;
  }
  while (v127);
  v130 = (a5 + 1);
  sub_23CCB659C((uint64_t)(a1 + 58), (int)v130);
  v131 = (_DWORD *)*((_QWORD *)a1 + 29);
  *v131 = 0;
  if (a4)
  {
    if ((int)a5 >= 1)
    {
      v132 = 0;
      v133 = a5;
      v134 = v131 + 1;
      do
      {
        v135 = *a4++;
        v132 += v135;
        *v134++ = v132;
        --v133;
      }
      while (v133);
    }
  }
  else if ((int)a5 >= 1)
  {
    v136 = v130 - 1;
    v137 = v131 + 1;
    v138 = 3;
    do
    {
      *v137++ = v138;
      v138 += 3;
      --v136;
    }
    while (v136);
  }
  sub_23CCB659C((uint64_t)(a1 + 52), (int)a7);
  if ((_DWORD)a7)
    memmove(*((void **)a1 + 26), a6, 4 * (int)a7);
  v139 = *a1;
  if (v104[18] && v104[17]
    || (sub_23CCB659C((uint64_t)(a1 + 126), 0),
        LODWORD(__b.__locale_) = 0,
        sub_23CCBA1AC((uint64_t)(a1 + 126), v139, &__b),
        v104[17]))
  {
    sub_23CCC037C((uint64_t)(a1 + 138), v139);
    sub_23CCC03B8((uint64_t)(a1 + 144), 64);
  }
  v400 = a1 + 132;
  sub_23CCC044C((uint64_t)(a1 + 132), v139);
  v140 = (_BYTE *)*((_QWORD *)a1 + 66);
  v141 = (_BYTE *)*((_QWORD *)a1 + 67);
  if (v140 != v141)
    memset(v140, 255, (v141 - v140) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)a1 + 35) = 0;
  sub_23CCC047C((void **)a1 + 45, 0x100uLL);
  v142 = (char *)*((_QWORD *)a1 + 60);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a1 + 62) - (_QWORD)v142) >> 2) <= 0x3F)
  {
    v143 = (char *)*((_QWORD *)a1 + 61);
    v144 = (char *)operator new(0x300uLL);
    v145 = &v144[12 * ((v143 - v142) / 12)];
    v146 = v145;
    if (v143 != v142)
    {
      v146 = &v144[12 * ((v143 - v142) / 12)];
      do
      {
        v147 = *(_QWORD *)(v143 - 12);
        v143 -= 12;
        v148 = *((_DWORD *)v143 + 2);
        *(_QWORD *)(v146 - 12) = v147;
        v146 -= 12;
        *((_DWORD *)v146 + 2) = v148;
      }
      while (v143 != v142);
    }
    *((_QWORD *)a1 + 60) = v146;
    *((_QWORD *)a1 + 61) = v145;
    *((_QWORD *)a1 + 62) = v144 + 768;
    if (v142)
      operator delete(v142);
  }
  sub_23CCC047C((void **)a1 + 57, 0x40uLL);
  sub_23CCC047C((void **)a1 + 54, 0x40uLL);
  sub_23CCC047C((void **)a1 + 48, 0x20uLL);
  sub_23CCC0510((unint64_t *)a1 + 51, 0x20uLL);
  memset_pattern16(a1 + 594, &unk_23CCD46A0, 0xAuLL);
  v403 = (_WORD *)a1 + 1193;
  *((_WORD *)a1 + 1193) = 0x8000;
  for (j = 2388; j != 2484; j += 6)
    memset_pattern16((char *)a1 + j, &unk_23CCD46A0, 6uLL);
  *((_WORD *)a1 + 1242) = 0x8000;
  memset_pattern16((char *)a1 + 2486, &unk_23CCD46A0, 6uLL);
  *((_WORD *)a1 + 1246) = 0x8000;
  for (k = 2494; k != 2574; k += 16)
    memset_pattern16((char *)a1 + k, &unk_23CCD46A0, 0x10uLL);
  memset_pattern16((char *)a1 + 2578, &unk_23CCD46A0, 0x20uLL);
  memset_pattern16(a1 + 654, &unk_23CCD46A0, 0x80uLL);
  *((_WORD *)a1 + 1307) = 0x8000;
  *(int *)((char *)a1 + 2574) = -2147450880;
  *(int *)((char *)a1 + 2610) = -2147450880;
  memset_pattern16(a1 + 688, &unk_23CCD46A0, 6uLL);
  for (m = 690; m != 750; m += 30)
    sub_23CCB7FFC((uint64_t)&a1[m], 3);
  sub_23CCBC22C((uint64_t)(a1 + 72), *a1);
  v152 = (int *)*((_QWORD *)a1 + 26);
  v153 = (int *)*((_QWORD *)a1 + 27);
  if (v152 != v153)
  {
    v154 = *((_QWORD *)a1 + 36);
    do
    {
      v155 = *v152++;
      ++*(_DWORD *)(v154 + 4 * v155 + 4);
    }
    while (v152 != v153);
  }
  sub_23CCBC298((int **)a1 + 36);
  v156 = a1[1];
  v157 = a1 + 16;
  if ((int)v156 >= 1)
  {
    v158 = 0;
    v159 = *((_QWORD *)a1 + 42);
    v160 = *((_QWORD *)a1 + 29);
    v161 = *((_QWORD *)a1 + 26);
    do
    {
      v162 = *(int *)(v160 + 4 * v158);
      v163 = v158 + 1;
      v164 = *(int *)(v160 + 4 * (v158 + 1));
      if ((int)v162 < (int)v164)
      {
        v165 = *((_QWORD *)a1 + 36);
        v166 = *((_QWORD *)a1 + 39);
        do
        {
          v167 = *(int *)(v161 + 4 * v162);
          v168 = *(int *)(v165 + 4 * v167);
          v169 = *(int *)(v166 + 4 * v167);
          v170 = v169 + v168;
          if ((int)v169 <= 0)
          {
LABEL_161:
            *(_DWORD *)(v166 + 4 * v167) = v169 + 1;
            *(_DWORD *)(v159 + 4 * v170) = v158;
          }
          else
          {
            v170 = (int)v170;
            while (v158 != *(_DWORD *)(v159 + 4 * v168))
            {
              if (++v168 >= (int)v170)
                goto LABEL_161;
            }
          }
          ++v162;
        }
        while (v162 != v164);
      }
      ++v158;
    }
    while (v163 != v156);
  }
  v389 = a1 + 58;
  v171 = (unsigned int *)(a1 + 890);
  a1[891] = (v391 - 4) & ~((v391 - 4) >> 63);
  *((_QWORD *)a1 + 446) = v397 + 1;
  sub_23CCB4BF4((uint64_t)(a1 + 890));
  v172 = *a1;
  v404 = (unsigned int *)(a1 + 890);
  v393 = v172;
  if (v104[17])
  {
    if ((int)v172 >= 1)
    {
      v173 = 0;
      v174 = -1;
      while (1)
      {
        v396 = v173;
        if (*(_DWORD *)(*v157 + 4 * v173) == -1)
          break;
LABEL_168:
        v173 = v396 + 1;
        v157 = a1 + 16;
        if (v396 + 1 == v393)
          goto LABEL_351;
      }
      *(_DWORD *)(*v157 + 4 * v173) = a1[70];
      v175 = a1[70];
      a1[70] = v175 + 1;
      *(_DWORD *)(*((_QWORD *)a1 + 11) + 4 * v175) = v173;
      if (*(_BYTE *)(a15 + 21))
        v176 = -1;
      else
        v176 = v174;
      v177 = 3 * v173;
      *(_DWORD *)(*((_QWORD *)a1 + 17) + 12 * v173) = v176;
      sub_23CCCA6AC((uint64_t)a1, v173, a15);
      sub_23CCBAA6C(a1 + 144, (int *)(*((_QWORD *)a1 + 69) + 4 * v177));
      do
      {
LABEL_174:
        if (!a1[144])
          goto LABEL_168;
        v178 = a1[145];
        if (v178 < 0)
          v179 = 0;
        else
          v179 = sub_23CCC1660(a1 + 144, v178);
        v174 = -1431655765 * ((v179 - *((_QWORD *)a1 + 69)) >> 2);
        sub_23CCCA074((uint64_t)a1, v174);
        v180 = (*((_QWORD *)a1 + 58) - *((_QWORD *)a1 + 57)) >> 2;
        v181 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v174);
        v182 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v174 + 4);
        v183 = v181 != -1;
        v184 = v182 == v181 && v181 != -1;
        v402 = v180 - 1;
        v185 = (v183 | (2 * (v182 != -1))) + v184;
        sub_23CCC4CE0((uint64_t)v171, (int)v180 > 1, (_WORD *)a1 + v185 + 1188);
      }
      while ((int)v180 < 2);
      v186 = 0;
      v187 = v174;
      v401 = v174;
      while (1)
      {
        LODWORD(__b.__locale_) = 0;
        v188 = a1 + 46;
        v189 = sub_23CCCB1E4((uint64_t)a1, v174, v186, v185, (int *)&__b, a15);
        sub_23CCCBC30((uint64_t)a1, (int)__b.__locale_, v189, a15);
        v190 = v189;
        v405 = v189;
        if (v189 > 1)
          break;
LABEL_320:
        if (v405 >= 1)
        {
          v272 = 0;
          do
          {
            v273 = (int *)(*((_QWORD *)a1 + 69) + 12 * *(int *)(*((_QWORD *)a1 + 48) + 4 * v272));
            if (*(_BYTE *)(*((_QWORD *)a1 + 51) + v272))
              sub_23CCBAA6C(a1 + 144, v273);
            else
              sub_23CCBABC0(a1 + 144, v273);
            ++v272;
          }
          while (v190 != v272);
        }
        v274 = *(_DWORD *)(*v400 + 16 * v187);
        v275 = *(_DWORD *)(*v400 + 16 * v187 + 4);
        v276 = v275 != -1;
        v277 = v274 != -1;
        v278 = v275 == v274 && v274 != -1;
        ++v186;
        v171 = (unsigned int *)(a1 + 890);
        sub_23CCC4CE0((uint64_t)v404, v186 < v402, v403);
        v185 = (v277 | (2 * v276)) + v278;
        v174 = v401;
        if (v186 == v402)
          goto LABEL_174;
      }
      v191 = *(unsigned __int8 *)(a15 + 19);
      v192 = v189 - 1;
      v193 = (int *)(*((_QWORD *)a1 + 48) + 4);
      while (1)
      {
        v195 = *(v193 - 1);
        v194 = *v193;
        if (v191)
          break;
        v235 = *((_QWORD *)a1 + 69);
        *(_DWORD *)(v235 + 12 * v195) += 8;
        v234 = (_DWORD *)(v235 + 12 * v194);
        LODWORD(v235) = 8;
LABEL_319:
        ++v193;
        *v234 += v235;
        if (!--v192)
          goto LABEL_320;
      }
      v196 = (int *)(*v188 + 12 * (int)v187);
      v197 = (int *)(*v188 + 12 * v195);
      v198 = (int *)(*v188 + 12 * v194);
      v200 = *v198;
      v199 = v198[1];
      v201 = *v197;
      v202 = v197[1];
      v203 = *v198 - *v197;
      v204 = v199 - v202;
      v205 = v198[2];
      v206 = v197[2];
      v207 = v205 - v206;
      v208 = *v196;
      v209 = v196[1];
      v210 = *v196 - v201;
      v211 = v209 - v202;
      v212 = v196[2];
      v213 = v212 - v206;
      if (v200 - v201 >= 0)
        v214 = v203;
      else
        v214 = -v203;
      if (v204 >= 0)
        v215 = v204;
      else
        v215 = -v204;
      if (v207 >= 0)
        v216 = v207;
      else
        v216 = -v207;
      v219 = v214 < 0x1000 && v215 < 0x1000 && v216 < 0x1000;
      if (v210 >= 0)
        v220 = v210;
      else
        v220 = -v210;
      if (v211 >= 0)
        v221 = v211;
      else
        v221 = -v211;
      if (v213 >= 0)
        v222 = v213;
      else
        v222 = -v213;
      if (v219 && v220 <= 0xFFF && v221 <= 0xFFF && v222 <= 0xFFF)
      {
        v223 = v210 * v203 + v211 * v204 + v213 * v207;
        if (v223)
        {
          v224 = v213 * v204 - v211 * v207;
          if (v224 < 0)
            v224 = v211 * v207 - v213 * v204;
          v225 = v210 * v207 - v213 * v203;
          if (v225 < 0)
            v225 = -v225;
          v226 = v211 * v203 - v210 * v204;
          if (v226 < 0)
            v226 = -v226;
          v227 = v224 + v225;
          if (v225 < v226)
          {
            v228 = v226;
          }
          else
          {
            v227 = v224 + v226;
            v228 = v225;
          }
          v229 = v224 >= v225 && v224 >= v226;
          if (v229)
            v230 = v225 + v226;
          else
            v230 = v227;
          if (v229)
            v231 = v224;
          else
            v231 = v228;
          v232 = v231 + (v230 >> 2);
          if (v223 < 0)
            LODWORD(v233) = -16 * v223 / (int)(v232 - v223) + 16;
          else
            LODWORD(v233) = (int)(16 * v232) / (int)(v232 + v223);
          goto LABEL_264;
        }
      }
      else
      {
        v236 = v211 * (uint64_t)v204 + v210 * (uint64_t)v203 + v213 * (uint64_t)v207;
        if (v236)
        {
          v237 = v213 * (uint64_t)v204 - v211 * (uint64_t)v207;
          if (v237 < 0)
            v237 = v211 * (uint64_t)v207 - v213 * (uint64_t)v204;
          v238 = v210 * (uint64_t)v207 - v213 * (uint64_t)v203;
          if (v238 < 0)
            v238 = -v238;
          v239 = v211 * (uint64_t)v203 - v210 * (uint64_t)v204;
          if (v239 < 0)
            v239 = -v239;
          v240 = v237 + v238;
          if (v238 < (unint64_t)v239)
          {
            v241 = v239;
          }
          else
          {
            v240 = v237 + v239;
            v241 = v238;
          }
          v242 = v237 >= (unint64_t)v238 && v237 >= (unint64_t)v239;
          if (v242)
            v243 = v238 + v239;
          else
            v243 = v240;
          if (v242)
            v244 = v237;
          else
            v244 = v241;
          v233 = v244 + (v243 >> 2);
          if (v236 < 0)
            LODWORD(v233) = -16 * v236 / (v233 - v236) + 16;
          else
            v233 = 16 * v233 / (v233 + v236);
          v188 = a1 + 46;
LABEL_264:
          v245 = v208 - v200;
          v246 = v209 - v199;
          v247 = *((_QWORD *)a1 + 69);
          *(_DWORD *)(v247 + 12 * v195) += v233;
          v248 = v212 - v205;
          v249 = -v203;
          v250 = -v204;
          v251 = -v207;
          if (v245 >= 0)
            v252 = v245;
          else
            v252 = -v245;
          v253 = v252 < 0x1000 && v219;
          if (v246 >= 0)
            v254 = v246;
          else
            v254 = -v246;
          if (v248 >= 0)
            v255 = v248;
          else
            v255 = -v248;
          if (v253 && v254 <= 0xFFF && v255 <= 0xFFF)
          {
            v256 = v245 * v249 + v246 * v250 + v248 * v251;
            if (v256)
            {
              v257 = v246 * v207 + v248 * v250;
              if (v257 < 0)
                v257 = -v257;
              v258 = v245 * v251 + v248 * v203;
              if (v258 < 0)
                v258 = -v258;
              v259 = v245 * v204 + v246 * v249;
              if (v259 < 0)
                v259 = -v259;
              if (v257 < v258 || v257 < v259)
              {
                v260 = v257 + v258;
                v270 = v257 + v259;
                if (v258 < v259)
                {
                  v257 = v259;
                }
                else
                {
                  v260 = v270;
                  v257 = v258;
                }
              }
              else
              {
                v260 = v258 + v259;
              }
              v271 = v257 + (v260 >> 2);
              if (v256 < 0)
                LODWORD(v235) = -16 * v256 / (v271 - v256) + 16;
              else
                LODWORD(v235) = 16 * v271 / (v271 + v256);
              goto LABEL_318;
            }
          }
          else
          {
            v235 = v246 * (uint64_t)v250 + v245 * (uint64_t)v249 + v248 * (uint64_t)v251;
            if (v235)
            {
              v261 = v248 * (uint64_t)v250 - v246 * (uint64_t)v251;
              if (v261 < 0)
                v261 = v246 * (uint64_t)v251 - v248 * (uint64_t)v250;
              v262 = v245 * (uint64_t)v251 - v248 * (uint64_t)v249;
              if (v262 < 0)
                v262 = -v262;
              v263 = v246 * (uint64_t)v249 - v245 * (uint64_t)v250;
              if (v263 < 0)
                v263 = v245 * (uint64_t)v250 - v246 * (uint64_t)v249;
              v264 = v261 + v262;
              if (v262 < (unint64_t)v263)
              {
                v265 = v263;
              }
              else
              {
                v264 = v261 + v263;
                v265 = v262;
              }
              v266 = v261 >= (unint64_t)v262 && v261 >= (unint64_t)v263;
              if (v266)
                v267 = v262 + v263;
              else
                v267 = v264;
              if (v266)
                v268 = v261;
              else
                v268 = v265;
              v269 = v268 + (v267 >> 2);
              if (v235 < 0)
                LODWORD(v235) = -16 * v235 / (uint64_t)(v269 - v235) + 16;
              else
                v235 = (uint64_t)(16 * v269) / (uint64_t)(v269 + v235);
              goto LABEL_318;
            }
          }
          LODWORD(v235) = 16;
LABEL_318:
          v234 = (_DWORD *)(v247 + 12 * v194);
          goto LABEL_319;
        }
      }
      LODWORD(v233) = 16;
      goto LABEL_264;
    }
  }
  else if ((int)v172 >= 1)
  {
    v279 = 0;
    LODWORD(v280) = 0;
    v281 = -1;
    do
    {
      if (*(_DWORD *)(*v157 + 4 * v279) == -1)
      {
        *(_DWORD *)(*v157 + 4 * v279) = a1[70];
        v282 = a1[70];
        a1[70] = v282 + 1;
        *(_DWORD *)(*((_QWORD *)a1 + 11) + 4 * v282) = v279;
        v283 = *(_BYTE *)(a15 + 21) ? -1 : v281;
        *(_DWORD *)(*((_QWORD *)a1 + 17) + 12 * v279) = v283;
        sub_23CCCA6AC((uint64_t)a1, v279, a15);
        if ((int)v280 < a1[70])
        {
          v280 = (int)v280;
          do
          {
            v281 = *(_DWORD *)(*((_QWORD *)a1 + 11) + 4 * v280);
            sub_23CCCA074((uint64_t)a1, v281);
            v284 = (*((_QWORD *)a1 + 58) - *((_QWORD *)a1 + 57)) >> 2;
            v285 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v281);
            v286 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v281 + 4);
            v287 = v285 != -1;
            v288 = v286 == v285 && v285 != -1;
            v289 = (v287 | (2 * (v286 != -1))) + v288;
            sub_23CCC4CE0((uint64_t)v404, (int)v284 > 1, (_WORD *)a1 + v289 + 1188);
            if ((int)v284 >= 2)
            {
              v290 = 1;
              do
              {
                LODWORD(__b.__locale_) = 0;
                v291 = sub_23CCCB1E4((uint64_t)a1, v281, v290 - 1, v289, (int *)&__b, a15);
                sub_23CCCBC30((uint64_t)a1, (int)__b.__locale_, v291, a15);
                v292 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v281);
                v293 = *(_DWORD *)(*((_QWORD *)a1 + 66) + 16 * v281 + 4);
                v294 = v292 != -1;
                v295 = v293 == v292 && v292 != -1;
                v289 = (v294 | (2 * (v293 != -1))) + v295;
                sub_23CCC4CE0((uint64_t)v404, v290++ < (int)v284 - 1, v403);
              }
              while ((_DWORD)v284 != v290);
            }
            ++v280;
          }
          while (v280 < a1[70]);
          v172 = v393;
          v157 = a1 + 16;
          v171 = (unsigned int *)(a1 + 890);
        }
      }
      ++v279;
    }
    while (v279 != v172);
  }
LABEL_351:
  v296 = sub_23CCC9C98((uint64_t)v171);
  if (v391 >= 4)
    *v397 = v296;
  v297 = v296;
  if (v397 != (unsigned int *)-4)
    v297 = (uint64_t)v397 + v296 + 4;
  v38 = *v171;
  if ((_DWORD)v38)
    goto LABEL_19;
  v399 = (_DWORD *)v297;
  v406 = v391 - 4 - v296;
  if (!*(_BYTE *)(a15 + 16))
  {
LABEL_444:
    v38 = 1;
    if (v399 && (v406 & 0x8000000000000000) == 0)
    {
      v353 = (a10 & ~(a10 >> 63)) - v406;
      v354 = a10 - v353 < 0;
      if (a10 - v353 >= 0)
        v355 = (a10 & ~(a10 >> 63)) - v406;
      else
        v355 = 0;
      v356 = a9;
      if (v354)
        v356 = 0;
      v357 = v355 & ~(v355 >> 63);
      *a11 = v357;
      if (v355 >= 16)
        *(_DWORD *)(v356 + 12) = v357;
      v358 = 8;
      if (v355 > 8)
        v358 = v355;
      v359 = v358 - 8;
      if (v358 == 8)
      {
        v361 = -1;
      }
      else
      {
        v360 = (unsigned __int8 *)(v356 + 8);
        v361 = -1;
        do
        {
          v362 = *v360++;
          v361 = dword_23CCD3FC8[v362 ^ HIBYTE(v361)] ^ (v361 << 8);
          --v359;
        }
        while (v359);
      }
      if (v355 >= 8)
        *(_DWORD *)(v356 + 4) = v361;
      if (a12)
      {
        v363 = *a1;
        if ((int)v363 >= 1)
        {
          v364 = 0;
          v365 = 0;
          v366 = *(int32x2_t *)(a1 + 6);
          v367 = a1[8];
          v368 = 12 * v363;
          do
          {
            v369 = (int32x2_t *)(*((_QWORD *)a1 + 23) + v365);
            v370 = v369[1].i32[0] + v367;
            v371 = (int32x2_t *)(a12 + 12 * *(int *)(*v394 + v364));
            *v371 = vadd_s32(*v369, v366);
            v371[1].i32[0] = v370;
            v365 += 12;
            v364 += 4;
          }
          while (v368 != v365);
        }
      }
      if (a13)
      {
        v372 = a1[1];
        if ((int)v372 >= 1)
        {
          v373 = *v390;
          v374 = (_DWORD *)(*v389 + 4);
          do
          {
            v375 = *v373++;
            *(_DWORD *)(a13 + 4 * v375) = *v374 - *(v374 - 1);
            ++v374;
            --v372;
          }
          while (v372);
        }
      }
      if (a14 && (v376 = a1[1], (int)v376 >= 1))
      {
        v377 = 0;
        v378 = 0;
        v379 = *v392;
        v380 = *v389;
        do
        {
          v381 = (int *)(v380 + 4 * v379[v377]);
          v383 = *v381;
          v382 = v381[1];
          if ((int)v383 < (int)v382)
          {
            v384 = *v394;
            v385 = (_DWORD *)(a14 + 4 * v378);
            v386 = v382 - v383;
            v387 = (int *)(*((_QWORD *)a1 + 26) + 4 * v383);
            v378 = v378 + v382 - v383;
            do
            {
              v388 = *v387++;
              *v385++ = *(_DWORD *)(v384 + 4 * v388);
              --v386;
            }
            while (v386);
          }
          v38 = 0;
          ++v377;
        }
        while (v377 != v376);
      }
      else
      {
        v38 = 0;
      }
    }
    goto LABEL_19;
  }
  v298 = a1[1];
  v398 = v297 + 4;
  a1[891] = (v406 - 4) & ~((v406 - 4) >> 63);
  *((_QWORD *)a1 + 446) = v297 + 4;
  sub_23CCB4BF4((uint64_t)v404);
  if (!*(_BYTE *)(a15 + 8))
  {
    LOWORD(v419) = 0x8000;
    v418 = 0x8000;
    memset_pattern16(&__b, &unk_23CCD46A0, 0x80uLL);
    v417 = 0x8000;
    v312 = v395;
    if ((int)v298 < 1)
      goto LABEL_390;
    v313 = 0;
    v314 = 0;
    v315 = 4 * v298;
    while (1)
    {
      v316 = v314;
      v314 = v312[(*v392)[v313 / 4]];
      v317 = &v419;
      v318 = v314 - v316;
      if (v314 == v316)
      {
        v319 = (uint64_t)(a1 + 890);
        v320 = 0;
      }
      else
      {
        sub_23CCC4CE0((uint64_t)v404, 1, &v419);
        if ((v318 & 0x80000000) != 0)
        {
          sub_23CCC4CE0((uint64_t)v404, 0, &v418);
          v318 = -v318;
        }
        else
        {
          sub_23CCC4CE0((uint64_t)v404, 1, &v418);
        }
        if (v318 > 0x3F)
        {
          sub_23CCC4CE0((uint64_t)v404, 1, &__b);
          sub_23CCC4CE0((uint64_t)v404, 1, (_WORD *)&__b.__locale_ + 2);
          sub_23CCC4CE0((uint64_t)v404, 1, (_WORD *)v421 + 2);
          sub_23CCC4CE0((uint64_t)v404, 1, v422);
          sub_23CCC4CE0((uint64_t)v404, 1, v423);
          sub_23CCC4CE0((uint64_t)v404, 1, v424);
          sub_23CCD3C80((uint64_t)v404, v318 - 64, 6, &v417);
          goto LABEL_389;
        }
        v321 = v318 - 1;
        sub_23CCC4CE0((uint64_t)v404, (v318 - 1) & 1, &__b);
        sub_23CCC4CE0((uint64_t)v404, (v321 >> 1) & 1, (_WORD *)&__b.__locale_ + (v321 & 1) + 1);
        sub_23CCC4CE0((uint64_t)v404, (v321 >> 2) & 1, (_WORD *)&__b.__locale_ + (v321 & 3) + 3);
        sub_23CCC4CE0((uint64_t)v404, (v321 >> 3) & 1, (_WORD *)&__b + (v321 & 7) + 7);
        sub_23CCC4CE0((uint64_t)v404, (v321 >> 4) & 1, (_WORD *)&__b + (v321 & 0xF) + 15);
        v320 = ((v318 - 1) >> 5) & 1;
        v317 = (int *)((char *)&__b + 2 * ((v318 - 1) & 0x1F) + 62);
        v319 = (uint64_t)(a1 + 890);
      }
      sub_23CCC4CE0(v319, v320, v317);
LABEL_389:
      v313 += 4;
      v312 = v395;
      if (v315 == v313)
        goto LABEL_390;
    }
  }
  LOWORD(v419) = 0x8000;
  v418 = 0x8000;
  memset_pattern16(&__b, &unk_23CCD46A0, 0x80uLL);
  v417 = 0x8000;
  if ((int)v298 >= 1)
  {
    v299 = 0;
    v300 = 0;
    v301 = 4 * v298;
    v302 = 6;
    do
    {
      v303 = v300;
      v300 = v395[(*v392)[v299 / 4]];
      v304 = &v419;
      v305 = v300 - v303;
      if (v300 == v303)
      {
        v306 = (uint64_t)(a1 + 890);
        v307 = 0;
      }
      else
      {
        sub_23CCC4CE0((uint64_t)v404, 1, &v419);
        if ((v305 & 0x80000000) != 0)
        {
          sub_23CCC4CE0((uint64_t)v404, 0, &v418);
          v305 = -v305;
        }
        else
        {
          sub_23CCC4CE0((uint64_t)v404, 1, &v418);
        }
        v308 = v305 - 1;
        if (v305 > 0x3F)
        {
          sub_23CCC4CE0((uint64_t)v404, 1, &__b);
          sub_23CCC4CE0((uint64_t)v404, 1, (_WORD *)&__b.__locale_ + 2);
          sub_23CCC4CE0((uint64_t)v404, 1, (_WORD *)v421 + 2);
          sub_23CCC4CE0((uint64_t)v404, 1, v422);
          sub_23CCC4CE0((uint64_t)v404, 1, v423);
          sub_23CCC4CE0((uint64_t)v404, 1, v424);
          sub_23CCD3C80((uint64_t)v404, v305 - 64, v302, &v417);
          v309 = v308 >> v302;
          if (!v302 || v309)
          {
            if (v309 > 1)
              ++v302;
          }
          else
          {
            --v302;
          }
          goto LABEL_368;
        }
        sub_23CCC4CE0((uint64_t)v404, (v308 >> 5) & 1, &__b);
        sub_23CCC4CE0((uint64_t)v404, (v308 >> 4) & 1, (_WORD *)&__b.__locale_ + (v308 >> 5) + 1);
        sub_23CCC4CE0((uint64_t)v404, (v308 >> 3) & 1, (_WORD *)&__b.__locale_ + (v308 >> 4) + 3);
        sub_23CCC4CE0((uint64_t)v404, (v308 >> 2) & 1, (_WORD *)&__b + (v308 >> 3) + 7);
        sub_23CCC4CE0((uint64_t)v404, (v308 >> 1) & 1, (_WORD *)&__b + (v308 >> 2) + 15);
        v307 = v308 & 1;
        v304 = (int *)((char *)&__b + 2 * (v308 >> 1) + 62);
        v306 = (uint64_t)(a1 + 890);
      }
      sub_23CCC4CE0(v306, v307, v304);
LABEL_368:
      v299 += 4;
    }
    while (v301 != v299);
  }
LABEL_390:
  v322 = sub_23CCC9C98((uint64_t)v404);
  v323 = v322;
  if (v406 >= 4)
    *v399 = v322;
  v324 = v398 + v322;
  if (!v398)
    v324 = v322;
  v38 = *v404;
  if (!(_DWORD)v38)
  {
    v399 = (_DWORD *)v324;
    v38 = 5;
    if (v395)
    {
      v325 = a1[1];
      if ((int)v325 >= 1)
      {
        v326 = v395;
        v327 = v395;
        if ((_DWORD)v325 != 1)
        {
          v326 = v395 + 1;
          v328 = v395[1];
          v329 = *v395;
          if (v328 >= *v395)
            v327 = v395;
          else
            v327 = v395 + 1;
          if (v328 < v329)
            v326 = v395;
          if ((_DWORD)v325 != 2)
          {
            v330 = v395 + 2;
            if (v328 <= v329)
              v331 = *v395;
            else
              v331 = v395[1];
            if (v328 < v329)
              v329 = v395[1];
            v332 = 4 * v325 - 12;
            while (v332)
            {
              v334 = *v330;
              v333 = v330[1];
              if (v333 >= *v330)
              {
                if (v334 < v329)
                {
                  v329 = *v330;
                  v327 = v330;
                }
                v335 = v333 < v331;
                if (v333 > v331)
                  v331 = v330[1];
                if (!v335)
                  v326 = v330 + 1;
              }
              else
              {
                v329 = *v327;
                if (v333 < *v327)
                {
                  v329 = v330[1];
                  v327 = v330 + 1;
                }
                v331 = *v326;
                if (v334 > *v326)
                  v331 = *v330;
                if (v334 >= *v326)
                  v326 = v330;
              }
              v330 += 2;
              v332 -= 8;
              if (v332 == -4)
                goto LABEL_430;
            }
            v336 = *v330;
            if (*v330 < *v327)
              goto LABEL_431;
            if (v336 >= *v326)
              v326 = v330;
          }
        }
LABEL_430:
        v336 = *v327;
LABEL_431:
        if (v336 < 0)
          goto LABEL_18;
        v337 = *v326 - (uint64_t)v336;
        if ((int)v337 > (int)v325)
          goto LABEL_18;
        v419 = 0;
        sub_23CCC14E0(&__b, v337 + 2, &v419);
        v406 = v406 - 4 - v323;
        locale = __b.__locale_;
        v339 = v395;
        v340 = v325;
        do
        {
          v341 = *v339++;
          ++*((_DWORD *)locale + v341 - v336 + 1);
          --v340;
        }
        while (v340);
        if ((v337 & 0x80000000) == 0)
        {
          v342 = (_DWORD *)((char *)locale + 4);
          v343 = *(_DWORD *)locale;
          v344 = (v337 + 2) - 1;
          do
          {
            v343 += *v342;
            *v342++ = v343;
            --v344;
          }
          while (v344);
        }
        v345 = *v392;
        v346 = *v390;
        v347 = *v392;
        v348 = v325;
        do
        {
          v349 = *v347++;
          v350 = v395[v349] - v336;
          v351 = *((_DWORD *)locale + v350);
          *((_DWORD *)locale + v350) = v351 + 1;
          v346[v349] = v351;
          --v348;
        }
        while (v348);
        for (n = 0; n != v325; ++n)
          v345[v346[n]] = n;
        if (locale)
        {
          v421[0] = locale;
          operator delete(locale);
        }
        goto LABEL_444;
      }
    }
  }
LABEL_19:
  v407[0] = *MEMORY[0x24BEDB7F0];
  v39 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v407 + *(_QWORD *)(v407[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v408[0] = v39;
  v408[1] = MEMORY[0x24BEDB848] + 16;
  if (v409 < 0)
    operator delete((void *)v408[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x242630A2C](&v410);
  return v38;
}

void sub_23CCC3DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  sub_23CCADA7C((uint64_t)&a36);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCC3E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _DWORD *v9;
  _DWORD *v10;
  unint64_t v11;
  unint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  int32x2_t *v21;
  int32x2_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  void *__p;
  void *v34;
  uint64_t v35;
  int v36[1228];

  MEMORY[0x24BDAC7A8]();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_23CCD2DAC((uint64_t)v36);
  __p = 0;
  v34 = 0;
  v35 = 0;
  v32 = 0;
  v23 = sub_23CCC1A68(v22, v20, v18, v16, v14, v12, v10, a9, v36, (unint64_t *)&__p, (uint64_t *)&v32);
  if (!(_DWORD)v23)
  {
    v31 = *(_QWORD *)(a9 + 16);
    v30 = *(_OWORD *)a9;
    v28 = *(_OWORD *)a9;
    v29 = *(_QWORD *)(a9 + 16);
    BYTE1(v31) = 0;
    BYTE3(v31) = 0;
    v27 = 0;
    v23 = sub_23CCC1A68(v22, v20, v18, v16, v14, v12, v10, (uint64_t)&v30, v36, (unint64_t *)&__p, (uint64_t *)&v27);
    if (!(_DWORD)v23)
    {
      BYTE1(v29) = 1;
      BYTE3(v29) = 0;
      v26 = 0;
      v23 = sub_23CCC1A68(v22, v20, v18, v16, v14, v12, v10, (uint64_t)&v28, v36, (unint64_t *)&__p, (uint64_t *)&v26);
      if (!(_DWORD)v23 && (v32 > v27 || v32 > v26))
      {
        v24 = &v30;
        if (v27 > v26)
          v24 = &v28;
        *(_OWORD *)a9 = *v24;
        *(_QWORD *)(a9 + 14) = *(_QWORD *)((char *)v24 + 14);
      }
    }
  }
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  sub_23CCD32C4((uint64_t)v36);
  return v23;
}

void sub_23CCC4030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,char a27)
{
  if (__p)
    operator delete(__p);
  sub_23CCD32C4((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCC405C(uint64_t a1, _BYTE *a2, unsigned int a3, uint64_t a4, unint64_t a5, uint64_t a6, unsigned int *a7, unint64_t *a8, uint64_t *a9)
{
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  if (*(_DWORD *)(a6 + 16))
    v16 = a4;
  else
    v16 = 0;
  v17 = v16 + 4 * a4 * a5 + 1024;
  v18 = *a8;
  v19 = a8[1] - *a8;
  if (v17 <= v19)
  {
    if (v17 < v19)
      a8[1] = v18 + v17;
  }
  else
  {
    sub_23CCC0EB0(a8, v17 - v19);
    v18 = *a8;
  }
  *a9 = 0;
  return sub_23CCC4128(a7, a1, a2, a3, 0, a5, v18, v17, a9, a6);
}

uint64_t sub_23CCC4128(unsigned int *a1, uint64_t a2, _BYTE *a3, unsigned int a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10)
{
  uint64_t result;
  unsigned int v16;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  int *v23;
  int *v24;
  int v25;
  int v26;
  uint64_t v27;
  int *v28;
  int *v29;
  unint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  int *v51;
  unint64_t v52;
  int v53;
  void **v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  unsigned __int8 *v62;
  unsigned int v63;
  int v64;
  unint64_t v65;
  int **v66;
  unsigned int v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  char v73;
  int v74;
  _DWORD *v75;
  uint64_t v76;

  result = 5;
  if (a5 <= 0xFF)
  {
    if (a2)
    {
      if (a6 - 256 >= 0xFFFFFFFFFFFFFF01 && (*(unsigned __int8 *)(a10 + 8) | 2) != 3 && !*(_DWORD *)(a10 + 20))
      {
        v16 = a5;
        if (a3 || !*(_DWORD *)(a10 + 16))
        {
          v19 = *(_DWORD *)(a10 + 4);
          if (v19 <= 0x1B)
          {
            if ((*(_DWORD *)(a10 + 12) - 5) > 1)
            {
              if (!a7)
                return result;
            }
            else if (!a7 || a6 != 2 || !v19)
            {
              return result;
            }
            if ((unint64_t)a8 < 0x21)
              return 1;
            v67 = *(_DWORD *)(a10 + 12) - 5;
            v20 = *a1;
            v65 = (int)v20;
            v21 = a1 + 750;
            a1[780] = a6;
            v68 = v20;
            a1[781] = v20;
            a1[782] = a4;
            v66 = (int **)(a1 + 756);
            sub_23CCB659C((uint64_t)(a1 + 756), a6);
            sub_23CCB659C((uint64_t)(a1 + 762), a6);
            sub_23CCB659C((uint64_t)(a1 + 750), a6);
            v22 = 0;
            v23 = (int *)*((_QWORD *)a1 + 378);
            v24 = (int *)*((_QWORD *)a1 + 381);
            do
            {
              v25 = *(_DWORD *)(a2 + 4 * v22);
              v23[v22] = v25;
              v24[v22++] = v25;
            }
            while (a6 != v22);
            if ((int)v68 >= 2)
            {
              v26 = 1;
              LODWORD(v27) = a6;
              do
              {
                v27 = (int)v27;
                v28 = v23;
                v29 = v24;
                v30 = a6;
                do
                {
                  v31 = *(_DWORD *)(a2 + 4 * v27);
                  if (v31 >= *v28)
                    v31 = *v28;
                  *v28++ = v31;
                  v32 = *v29;
                  if (*v29 <= *(_DWORD *)(a2 + 4 * v27))
                    v32 = *(_DWORD *)(a2 + 4 * v27);
                  *v29++ = v32;
                  ++v27;
                  --v30;
                }
                while (v30);
                ++v26;
              }
              while (v26 != (_DWORD)v68);
            }
            v33 = 0;
            result = 5;
            do
            {
              v34 = v24[v33];
              v35 = v23[v33];
              if (v34 - v35 > 0xFFFFFFF)
                return 5;
              v36 = *(_DWORD *)(a10 + 4);
              if (v36 && ((v35 & 0x80000000) != 0 || (int)v34 >= 1 << v36))
                return result;
              if (v67 > 1)
              {
                *(_DWORD *)(*v21 + 4 * v33) = v34 - v35;
              }
              else
              {
                *(_DWORD *)(*v21 + 4 * v33) = v34;
                v23[v33] = 0;
              }
              ++v33;
            }
            while (a6 != v33);
            v75 = (_DWORD *)a7;
            v76 = a8;
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0;
            HIDWORD(v69) = v68;
            LODWORD(v70) = a6;
            *((_QWORD *)&v70 + 1) = __PAIR64__(*(_DWORD *)(a10 + 4), v16);
            v38 = *(_DWORD *)(a10 + 12);
            v37 = *(_DWORD *)(a10 + 16);
            LODWORD(v71) = a4;
            DWORD2(v71) = v37;
            v73 = *(_BYTE *)(a10 + 8);
            v74 = v38;
            v39 = (_DWORD *)sub_23CCC4B24(a7, a8, (uint64_t)&v69);
            v41 = 0;
            do
            {
              v42 = v40 < 4;
              v40 -= 4;
              if (v42)
              {
                v40 = 0;
                v39 = 0;
              }
              else
              {
                *v39++ = (*v66)[v41];
              }
              v43 = *(_DWORD *)(*v21 + 4 * v41);
              v44 = 32 - __clz(v43);
              if (v43)
                v45 = v44;
              else
                v45 = 0;
              *(_DWORD *)(*v21 + 4 * v41++) = v45;
            }
            while (a6 != v41);
            v46 = 0;
            do
            {
              if (v40)
              {
                --v40;
                *(_BYTE *)v39 = *(_DWORD *)(*v21 + 4 * v46);
                v39 = (_DWORD *)((char *)v39 + 1);
              }
              else
              {
                v39 = 0;
              }
              ++v46;
            }
            while (a6 != v46);
            v75 = v39;
            v76 = v40;
            sub_23CCB659C((uint64_t)(a1 + 768), v65 * a6);
            if ((int)v68 >= 1)
            {
              v47 = 0;
              LODWORD(v48) = 0;
              v49 = *v66;
              v50 = *((_QWORD *)a1 + 384);
              do
              {
                v48 = (int)v48;
                v51 = v49;
                v52 = a6;
                do
                {
                  v53 = *v51++;
                  *(_DWORD *)(v50 + 4 * v48) = *(_DWORD *)(a2 + 4 * v48) - v53;
                  ++v48;
                  --v52;
                }
                while (v52);
                ++v47;
              }
              while (v47 != (_DWORD)v68);
            }
            v54 = (void **)(a1 + 774);
            if (a3 && *(_DWORD *)(a10 + 16))
            {
              sub_23CCC1B5C((unint64_t *)a1 + 387, v65);
              if ((int)v68 >= 1)
              {
                for (i = 0; i != v68; ++i)
                  *((_BYTE *)*v54 + i) = a3[i];
              }
              if ((_DWORD)v68)
                memmove(*v54, a3, v65);
            }
            else
            {
              sub_23CCC1B5C((unint64_t *)a1 + 387, 0);
            }
            result = sub_23CCC4C3C((uint64_t)a1, a10, (uint64_t)&v75);
            if (!(_DWORD)result)
            {
              result = 1;
              if (v75)
              {
                if ((v76 & 0x8000000000000000) == 0)
                {
                  v56 = (a8 & ~(a8 >> 63)) - v76;
                  if (a8 - v56 >= 0)
                    v57 = (a8 & ~(a8 >> 63)) - v76;
                  else
                    v57 = 0;
                  if (a8 - v56 >= 0)
                    v58 = a7;
                  else
                    v58 = 0;
                  v59 = v57 & ~(v57 >> 63);
                  *a9 = v59;
                  if (v57 >= 16)
                  {
                    *(_DWORD *)(v58 + 12) = v59;
                    v61 = v57 - 8;
                  }
                  else
                  {
                    v60 = v57 == 8;
                    v42 = v57 < 8;
                    v61 = v57 - 8;
                    if (v42)
                      return 0;
                    if (v60)
                    {
                      v63 = -1;
LABEL_82:
                      result = 0;
                      *(_DWORD *)(v58 + 4) = v63;
                      return result;
                    }
                  }
                  v62 = (unsigned __int8 *)(v58 + 8);
                  v63 = -1;
                  do
                  {
                    v64 = *v62++;
                    v63 = dword_23CCD3FC8[v64 ^ HIBYTE(v63)] ^ (v63 << 8);
                    --v61;
                  }
                  while (v61);
                  goto LABEL_82;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_23CCC45A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v24;
  unint64_t v25;
  _BYTE v26[28];
  unint64_t v27;
  void *__p;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  char v38[24];
  char v39[24];
  char v40[24];
  char v41[24];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45[24];
  char v46[24];
  char v47[4664];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v0;
  sub_23CCD2DAC((uint64_t)&v31);
  v31 = *(_QWORD *)v13;
  v32 = *(_DWORD *)(v13 + 8);
  v33 = *(_QWORD *)(v13 + 12);
  v34 = *(_DWORD *)(v13 + 20);
  v35 = *(_QWORD *)(v13 + 24);
  v14 = *(_DWORD *)(v13 + 36);
  v36 = *(_DWORD *)(v13 + 32);
  v37 = v14;
  if (&v31 != (uint64_t *)v13)
  {
    sub_23CCD33C0(v38, *(char **)(v13 + 40), *(_QWORD *)(v13 + 48), (uint64_t)(*(_QWORD *)(v13 + 48) - *(_QWORD *)(v13 + 40)) >> 2);
    sub_23CCD33C0(v39, *(char **)(v13 + 64), *(_QWORD *)(v13 + 72), (uint64_t)(*(_QWORD *)(v13 + 72) - *(_QWORD *)(v13 + 64)) >> 2);
    sub_23CCD33C0(v40, *(char **)(v13 + 88), *(_QWORD *)(v13 + 96), (uint64_t)(*(_QWORD *)(v13 + 96) - *(_QWORD *)(v13 + 88)) >> 2);
    sub_23CCD33C0(v41, *(char **)(v13 + 112), *(_QWORD *)(v13 + 120), (uint64_t)(*(_QWORD *)(v13 + 120) - *(_QWORD *)(v13 + 112)) >> 2);
    sub_23CCD34C8((uint64_t)&v42, *(_DWORD **)(v13 + 136), *(_DWORD **)(v13 + 144), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v13 + 144) - *(_QWORD *)(v13 + 136)) >> 2));
    sub_23CCD34C8((uint64_t)&v43, *(_DWORD **)(v13 + 160), *(_DWORD **)(v13 + 168), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v13 + 168) - *(_QWORD *)(v13 + 160)) >> 2));
    sub_23CCD34C8((uint64_t)&v44, *(_DWORD **)(v13 + 184), *(_DWORD **)(v13 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v13 + 192) - *(_QWORD *)(v13 + 184)) >> 2));
    sub_23CCD33C0(v45, *(char **)(v13 + 208), *(_QWORD *)(v13 + 216), (uint64_t)(*(_QWORD *)(v13 + 216) - *(_QWORD *)(v13 + 208)) >> 2);
    sub_23CCD33C0(v46, *(char **)(v13 + 232), *(_QWORD *)(v13 + 240), (uint64_t)(*(_QWORD *)(v13 + 240) - *(_QWORD *)(v13 + 232)) >> 2);
    sub_23CCD33C0(v47, *(char **)(v13 + 256), *(_QWORD *)(v13 + 264), (uint64_t)(*(_QWORD *)(v13 + 264) - *(_QWORD *)(v13 + 256)) >> 2);
  }
  __p = 0;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v15 = sub_23CCC405C(v12, v10, v8, v6, v4, v2, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v27);
  if (!(_DWORD)v15)
  {
    *(_OWORD *)v26 = *(_OWORD *)v2;
    *(_OWORD *)&v26[12] = *(_OWORD *)(v2 + 12);
    if (v8 == 1 && v4 == 2)
    {
      v16 = *(_DWORD *)(v2 + 12) == 4;
      v17 = 3;
    }
    else
    {
      v18 = *(_DWORD *)(v2 + 12);
      if (v8 == 2 && v4 == 2)
      {
        v16 = v18 == 6;
        v17 = 5;
      }
      else
      {
        v16 = v18 == 2;
        v17 = 1;
      }
    }
    v19 = v16 ? v17 : v17 + 1;
    *(_DWORD *)&v26[12] = v19;
    v25 = 0;
    v15 = sub_23CCC405C(v12, v10, v8, v6, v4, (uint64_t)v26, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v25);
    if (!(_DWORD)v15)
    {
      v20 = v27;
      v21 = v25;
      if (v27 <= v25)
      {
        v19 = *(_DWORD *)(v2 + 12);
      }
      else
      {
        *(_DWORD *)(v2 + 12) = v19;
        v20 = v21;
      }
      v22 = v26[8] == 4 ? 2 : 4;
      v26[8] = v22;
      *(_DWORD *)&v26[12] = v19;
      v24 = 0;
      v15 = sub_23CCC405C(v12, v10, v8, v6, v4, (uint64_t)v26, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v24);
      if (!(_DWORD)v15 && v20 > v24)
        *(_BYTE *)(v2 + 8) = v22;
    }
  }
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  sub_23CCD32C4((uint64_t)&v31);
  return v15;
}

void sub_23CCC48D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,char a22)
{
  if (__p)
    operator delete(__p);
  sub_23CCD32C4((uint64_t)&a22);
  _Unwind_Resume(a1);
}

double sub_23CCC4904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  double result;
  _BYTE v14[24];
  uint64_t v15;
  uint64_t v16;

  if (a4 || 3 * a5 == a7)
  {
    v15 = v10;
    v16 = v11;
    *(_QWORD *)&v14[16] = *(_QWORD *)(a10 + 16);
    *(_OWORD *)v14 = *(_OWORD *)a10;
    v14[16] = a8 != 0;
    v14[21] = 1;
    v14[8] = 4;
    v12 = *a9;
    if (*a9 - 3 < 4)
    {
      *(_DWORD *)&v14[12] = 1;
      *(_DWORD *)&v14[17] = 1;
    }
    else if (v12 >= 3)
    {
      if (v12 == 10)
      {
        if (sub_23CCC3E54(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)v14))
          return result;
      }
      else
      {
        *(_DWORD *)&v14[12] = 2;
        *(_DWORD *)&v14[17] = 16843009;
      }
    }
    else
    {
      *(_DWORD *)&v14[12] = 1;
      *(_DWORD *)&v14[17] = 0;
    }
    result = *(double *)v14;
    *(_OWORD *)a10 = *(_OWORD *)v14;
    *(_QWORD *)(a10 + 14) = *(_QWORD *)&v14[14];
  }
  return result;
}

uint64_t sub_23CCC49E0(int *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int *a6, uint64_t a7)
{
  int v7;
  char v8;
  unsigned int v9;
  char v10;
  int v11;
  uint64_t result;

  v7 = *a1;
  *(_DWORD *)(a7 + 16) = a3 != 0;
  if (a4 == 1 && v7 <= 79)
    v8 = 2;
  else
    v8 = 4;
  *(_BYTE *)(a7 + 8) = v8;
  v9 = *a6;
  if (*a6 - 3 < 4)
  {
    v10 = 0;
    if (a4 == 1)
      v11 = 3;
    else
      v11 = 1;
    goto LABEL_11;
  }
  if (v9 < 3)
  {
    v10 = 0;
    v11 = 1;
LABEL_11:
    *(_DWORD *)(a7 + 12) = v11;
    *(_BYTE *)(a7 + 24) = v10;
    return 0;
  }
  if (v9 != 10)
  {
    if (a4 == 1)
      v11 = 4;
    else
      v11 = 2;
    v10 = 1;
    goto LABEL_11;
  }
  result = sub_23CCC45A8();
  if (!(_DWORD)result)
    return 0;
  return result;
}

_QWORD *sub_23CCC4A94(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_23CCC4B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCC4B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2 < 4)
    return 0;
  *(_DWORD *)a1 = -290009985;
  if ((unint64_t)a2 < 9)
    return 0;
  *(_BYTE *)(a1 + 8) = 0;
  if (a2 == 9)
    return 0;
  *(_BYTE *)(a1 + 9) = 8;
  if (((a2 - 8) & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 0;
  *(_WORD *)(a1 + 10) = 0;
  if ((unint64_t)a2 < 0x14)
    return 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a3 + 12);
  if (a2 == 20)
    return 0;
  *(_BYTE *)(a1 + 20) = *(_DWORD *)(a3 + 32);
  if (a2 == 21)
    return 0;
  *(_BYTE *)(a1 + 21) = *(_DWORD *)(a3 + 24);
  if (a2 == 22)
    return 0;
  *(_BYTE *)(a1 + 22) = *(_DWORD *)(a3 + 16);
  if (a2 == 23)
    return 0;
  *(_BYTE *)(a1 + 23) = *(_BYTE *)(a3 + 52);
  if (a2 == 24)
    return 0;
  *(_BYTE *)(a1 + 24) = *(_DWORD *)(a3 + 56);
  v3 = a2 - 25;
  if (a2 == 25)
    return v3;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a3 + 36) | (16 * *(_DWORD *)(a3 + 44));
  if (a2 == 26)
    return 0;
  *(_BYTE *)(a1 + 26) = *(_DWORD *)(a3 + 40);
  if (a2 == 27)
    return 0;
  *(_BYTE *)(a1 + 27) = *(_DWORD *)(a3 + 28);
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0x1C)
    return 0;
  v3 = a1 + 32;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a3 + 20);
  return v3;
}

uint64_t sub_23CCC4C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t result;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(unsigned int **)a3;
  v7 = *(_QWORD *)(a3 + 8);
  v8 = *(_QWORD *)a3 + 4;
  *(_QWORD *)a3 = v8;
  *(_QWORD *)(a3 + 8) = v7 - 4;
  v9 = (unsigned int *)(a1 + 3560);
  *(_DWORD *)(a1 + 3564) = (v7 - 4) & ~((v7 - 4) >> 63);
  *(_QWORD *)(a1 + 3568) = v8;
  sub_23CCB4BF4(a1 + 3560);
  result = sub_23CCC5350((unsigned int *)a1, a2);
  if (!(_DWORD)result)
  {
    v11 = sub_23CCC9C98((uint64_t)v9);
    if (v7 >= 4)
      *v6 = v11;
    v12 = v11;
    if (*(_QWORD *)a3)
      v12 = *(_QWORD *)a3 + v11;
    v13 = *(_QWORD *)(a3 + 8) - v11;
    *(_QWORD *)a3 = v12;
    *(_QWORD *)(a3 + 8) = v13;
    return *v9;
  }
  return result;
}

uint64_t sub_23CCC4CE0(uint64_t result, int a2, _WORD *a3)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  __int16 v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v3 = (unsigned __int16)*a3;
  v4 = *(_DWORD *)(result + 28);
  v5 = (v4 * v3) >> 16;
  if (a2)
  {
    *(_DWORD *)(result + 24) += v5;
    v5 = v4 - v5;
    v6 = v3 - *(_WORD *)(result + ((v3 >> 7) & 0x1FE) + 48);
  }
  else
  {
    v6 = *(_WORD *)(result + (~(*a3 >> 7) & 0x1FE) + 48) + *a3;
  }
  *(_DWORD *)(result + 28) = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    v7 = *(_DWORD *)(result + 24);
    v8 = *(_DWORD *)(result + 40);
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      *(_DWORD *)(result + 24) = v7;
      *(_DWORD *)(result + 28) = v5;
      *(_DWORD *)(result + 40) = ++v8;
      if (v8 == 8)
        break;
LABEL_18:
      if (v5 > 0x4000)
        return result;
    }
    v9 = *(_QWORD *)(result + 16);
    v10 = *(int *)(result + 44);
    if (v9 + v10 + 1 > (unint64_t)*(unsigned int *)(result + 4))
      return result;
    if (HIBYTE(v7))
    {
      ++*(_BYTE *)(v9 + *(_QWORD *)(result + 8) - 1);
      v9 = *(_QWORD *)(result + 16);
      if (*(_DWORD *)(result + 44))
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(result + 8) + v9) = 0;
          v11 = *(_DWORD *)(result + 44);
          v9 = *(_QWORD *)(result + 16) + 1;
          *(_QWORD *)(result + 16) = v9;
          *(_DWORD *)(result + 44) = --v11;
        }
        while (v11);
      }
    }
    else
    {
      if ((v5 + v7) >> 24)
      {
        *(_DWORD *)(result + 44) = v10 + 1;
LABEL_17:
        v8 = 0;
        v7 = (unsigned __int16)v7;
        *(_DWORD *)(result + 24) = (unsigned __int16)v7;
        *(_DWORD *)(result + 40) = 0;
        goto LABEL_18;
      }
      if ((_DWORD)v10)
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(result + 8) + v9) = -1;
          v12 = *(_DWORD *)(result + 44);
          v9 = *(_QWORD *)(result + 16) + 1;
          *(_QWORD *)(result + 16) = v9;
          *(_DWORD *)(result + 44) = --v12;
        }
        while (v12);
      }
    }
    *(_BYTE *)(*(_QWORD *)(result + 8) + v9) = *(_WORD *)(result + 26);
    ++*(_QWORD *)(result + 16);
    LOWORD(v7) = *(_WORD *)(result + 24);
    v5 = *(_DWORD *)(result + 28);
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_23CCC4E54(uint64_t result, uint64_t a2, uint64_t a3, int a4, _QWORD *a5, char a6, _QWORD *a7)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  _WORD *v17;
  uint64_t v18;
  unsigned int v19;
  _WORD *v20;
  unsigned int v21;
  uint64_t v22;
  _WORD *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  signed int v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v34;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  _WORD *v46;
  unsigned int v47;
  _WORD *v48;
  unsigned int v49;
  uint64_t v50;
  _WORD *v51;
  uint64_t v52;
  int v53;
  unsigned int v54;
  unint64_t v55;
  __int16 v57;

  v8 = a3;
  v10 = result + 3560;
  switch(a6)
  {
    case 0:
      if (a4 < 1)
        return result;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = (unint64_t)a4 << 6;
      while (1)
      {
        v15 = *(_DWORD *)(a2 + v11);
        v16 = *(_DWORD *)(v8 + v11);
        v17 = (_WORD *)(*a7 + v12);
        v18 = v10;
        v19 = v15 - v16;
        if (v15 == v16)
        {
          v21 = 0;
        }
        else
        {
          sub_23CCC4CE0(v10, 1, v17);
          v20 = (_WORD *)(a7[3] + v12);
          if ((v19 & 0x80000000) != 0)
          {
            sub_23CCC4CE0(v10, 0, v20);
            v19 = -v19;
          }
          else
          {
            sub_23CCC4CE0(v10, 1, v20);
          }
          v22 = a7[6];
          v23 = (_WORD *)(v22 + 2 * (int)v13);
          if (v19 > 0x3F)
          {
            sub_23CCC4CE0(v10, 1, (_WORD *)(v22 + 2 * (int)v13));
            sub_23CCC4CE0(v10, 1, v23 + 2);
            sub_23CCC4CE0(v10, 1, v23 + 6);
            sub_23CCC4CE0(v10, 1, v23 + 14);
            sub_23CCC4CE0(v10, 1, v23 + 30);
            sub_23CCC4CE0(v10, 1, v23 + 62);
            result = sub_23CCD3C80(v10, v19 - 64, *(_DWORD *)(a7[12] + v11), (_WORD *)(a7[9] + v12));
            goto LABEL_13;
          }
          v24 = v19 - 1;
          sub_23CCC4CE0(v10, (v19 - 1) & 1, (_WORD *)(v22 + 2 * (int)v13));
          sub_23CCC4CE0(v10, (v24 >> 1) & 1, &v23[(v24 & 1) + 1]);
          sub_23CCC4CE0(v10, (v24 >> 2) & 1, &v23[(v24 & 3) + 3]);
          sub_23CCC4CE0(v10, (v24 >> 3) & 1, &v23[(v24 & 7) + 7]);
          sub_23CCC4CE0(v10, (v24 >> 4) & 1, &v23[(v24 & 0xF) + 15]);
          v21 = ((v19 - 1) >> 5) & 1;
          v8 = a3;
          v17 = &v23[((v19 - 1) & 0x1F) + 31];
          v18 = v10;
        }
        result = sub_23CCC4CE0(v18, v21, v17);
LABEL_13:
        v13 += 64;
        v12 += 2;
        v11 += 4;
        if (v14 == v13)
          return result;
      }
    case 2:
      if (a4 < 1)
        return result;
      v25 = 0;
      v26 = 0;
      v27 = 4 * a4;
      while (1)
      {
        v28 = *(_DWORD *)(a2 + v26) - *(_DWORD *)(v8 + v26);
        v29 = a7[12];
        result = sub_23CCCA014(v10, v28, *(_DWORD *)(v29 + v26), (_WORD *)(a7[3] + v25), (_WORD *)(a7[9] + v25));
        v30 = v28 >= 0 ? v28 : -v28;
        v31 = *(_DWORD *)(v29 + v26);
        v32 = v30 >> v31;
        if (v31 && v32 == 0)
          break;
        if (v32 >= 2)
        {
          v34 = 1;
LABEL_27:
          *(_DWORD *)(v29 + v26) = v34 + v31;
        }
        v26 += 4;
        v25 += 2;
        if (v27 == v26)
          return result;
      }
      v34 = -1;
      goto LABEL_27;
    case 3:
      if (a4 >= 1)
      {
        v36 = 0;
        v37 = a4;
        do
        {
          v38 = *(_DWORD *)(*a5 + 4 * v36);
          if (v38 >= 1)
          {
            v39 = 0;
            v40 = *(_DWORD *)(a2 + 4 * v36) - *(_DWORD *)(v8 + 4 * v36);
            do
            {
              v57 = 0x8000;
              result = sub_23CCC4CE0(v10, (v40 >> v39++) & 1, &v57);
            }
            while (v38 != v39);
          }
          ++v36;
        }
        while (v36 != v37);
      }
      return result;
    case 4:
      if (a4 < 1)
        return result;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v55 = (unint64_t)a4 << 6;
      break;
    default:
      return result;
  }
  do
  {
    v44 = *(_DWORD *)(a2 + v41);
    v45 = *(_DWORD *)(v8 + v41);
    v46 = (_WORD *)(*a7 + v42);
    v47 = v44 - v45;
    if (v44 == v45)
    {
      result = sub_23CCC4CE0(v10, 0, v46);
      goto LABEL_50;
    }
    sub_23CCC4CE0(v10, 1, v46);
    v48 = (_WORD *)(a7[3] + v42);
    if ((v47 & 0x80000000) != 0)
    {
      sub_23CCC4CE0(v10, 0, v48);
      v47 = -v47;
    }
    else
    {
      sub_23CCC4CE0(v10, 1, v48);
    }
    v49 = v47 - 1;
    v50 = a7[6];
    v51 = (_WORD *)(v50 + 2 * (int)v43);
    if (v47 <= 0x3F)
    {
      sub_23CCC4CE0(v10, (v49 >> 5) & 1, (_WORD *)(v50 + 2 * (int)v43));
      sub_23CCC4CE0(v10, (v49 >> 4) & 1, &v51[(v49 >> 5) + 1]);
      sub_23CCC4CE0(v10, (v49 >> 3) & 1, &v51[(v49 >> 4) + 3]);
      sub_23CCC4CE0(v10, (v49 >> 2) & 1, &v51[(v49 >> 3) + 7]);
      sub_23CCC4CE0(v10, (v49 >> 1) & 1, &v51[(v49 >> 2) + 15]);
      result = sub_23CCC4CE0(v10, v49 & 1, &v51[(v49 >> 1) + 31]);
LABEL_49:
      v8 = a3;
      goto LABEL_50;
    }
    sub_23CCC4CE0(v10, 1, (_WORD *)(v50 + 2 * (int)v43));
    sub_23CCC4CE0(v10, 1, v51 + 2);
    sub_23CCC4CE0(v10, 1, v51 + 6);
    sub_23CCC4CE0(v10, 1, v51 + 14);
    sub_23CCC4CE0(v10, 1, v51 + 30);
    sub_23CCC4CE0(v10, 1, v51 + 62);
    v52 = a7[12];
    result = sub_23CCD3C80(v10, v47 - 64, *(_DWORD *)(v52 + v41), (_WORD *)(a7[9] + v42));
    v53 = *(_DWORD *)(v52 + v41);
    v54 = v49 >> v53;
    if (v53 && !v54)
    {
      *(_DWORD *)(v52 + v41) = v53 - 1;
      goto LABEL_49;
    }
    v8 = a3;
    if (v54 >= 2)
      *(_DWORD *)(v52 + v41) = v53 + 1;
LABEL_50:
    v43 += 64;
    v42 += 2;
    v41 += 4;
  }
  while (v55 != v43);
  return result;
}

uint64_t sub_23CCC5350(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v20;
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int *v28;
  int v29;
  int v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  BOOL v41;
  int v42;
  _DWORD *v43;
  uint64_t v44;
  int v45;
  int v46;
  unsigned int v47;
  unint64_t i;
  void **v49;
  void *v50;
  void *v51;
  void **v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _DWORD *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int *v69;
  int *v70;
  int *v71;
  _DWORD *v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  unsigned int v80;
  int v81;
  uint64_t v82;
  int *v83;
  int *v84;
  int *v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int *v90;
  _DWORD *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  int *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  int *v111;
  int *v112;
  int *v113;
  int *v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  unint64_t v121;
  int v122;
  signed int v123;
  int v124;
  signed int v125;
  int v126;
  signed int v127;
  int v128;
  signed int v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  void *v143;
  int v144;
  size_t v145;
  uint64_t v146;
  uint64_t v147;
  int *v148;
  int *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  int *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int *v159;
  int *v160;
  int *v161;
  int *v162;
  int *v163;
  void *v164;
  unint64_t v165;
  int *v166;
  _DWORD *v167;
  _DWORD *v168;
  int v169;
  int v170;
  int v171;
  _DWORD *v172;
  int v173;
  int v174;
  int v175;
  int v176;
  uint64_t v177;
  uint64_t v178;
  int *v179;
  int *v180;
  int *v181;
  int v182;
  int v183;
  _DWORD *v184;
  void *v185;
  uint64_t v186;
  int v187;
  uint64_t v188;
  unsigned int v189;
  _DWORD *v190;
  void *v191;
  int v192;
  int v193;
  unsigned int v194;
  unint64_t v195;
  void *v196;
  _DWORD *v197;
  _DWORD *v198;
  _DWORD *v199;
  int *v200;
  int *v201;
  int *v202;
  int *v203;
  int v204;
  int v205;
  int v206;
  int v207;
  uint64_t v208;
  int v209;
  int v210;
  int v211;
  uint64_t v212;
  int v213;
  int v214;
  signed int v215;
  signed int v216;
  signed int v217;
  signed int v218;
  signed int v219;
  int *v220;
  int *v221;
  int *v222;
  int *v223;
  uint64_t v224;
  uint64_t v225;
  int v226;
  int v227;
  int v228;
  unint64_t v229;
  int v230;
  int v231;
  int v232;
  unint64_t v233;
  void *v234;
  int v235;
  uint64_t v236;
  int v237;
  int v238;
  int v239;
  uint64_t v240;
  int *v241;
  int v242;
  signed int v243;
  signed int v244;
  signed int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  uint64_t v256;
  int *v257;
  int v258;
  uint64_t v260;
  unint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  int *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  int v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  unsigned int v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  int v283;
  int v284;
  int v285;
  uint64_t v286;
  uint64_t v287;
  _DWORD *v288;
  uint64_t v289;
  int v290;
  int v291;
  unsigned int v292;
  uint64_t v293;
  unint64_t v294;
  size_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  _QWORD *v300;
  int *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  int *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  int v310;
  int *v311;
  int *v312;
  size_t v313;
  int v314;
  int v315;
  unsigned int v316;
  uint64_t v317;
  uint64_t v318;
  int *v319;
  _DWORD *v320;
  size_t v321;
  int v322;
  uint64_t j;
  int v324;
  int v325;
  unsigned int v326;
  int *v327;
  int *v328;
  int *v329;
  size_t v330;
  int v331;
  int v332;
  int v333;
  int v334;
  unint64_t v335;
  void **v336;
  void *v337;
  void *v338;
  void **v339;
  void *v340;
  void *v341;
  void *v342;
  uint64_t v343;
  int v344;
  uint64_t v345;
  int v346;
  uint64_t v347;
  int v348;
  uint64_t v349;
  char *v350;
  int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  int v356;
  int v357;
  unsigned int *v358;
  int v359;
  int v360;
  int v361;
  uint64_t v362;
  int *v363;
  int v364;
  int v365;
  int v366;
  int v367;
  uint64_t v368;
  char *v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  unint64_t v378;
  unsigned int v379;
  unsigned int v380;
  unsigned int v381;
  void **v383;
  void **v384;
  uint64_t v385;
  int v386;
  int v387;
  int v388;
  int v389;
  int v390;
  uint64_t v391;
  int v392;
  uint64_t v393;
  int v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  int v398;
  uint64_t v399;
  _DWORD *v400;
  int v401;
  int v402;
  int v403;
  int v404;
  int v405;
  int v406;
  int v407;
  int v408;
  int v409;
  int v410;
  uint64_t v411;
  int *v412;
  unsigned int *v413;
  int v414;
  int v415;
  int v416;
  int v417;
  int *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  int *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  _DWORD *v427;
  int v428;
  int v429;
  int v430;
  int v431;
  int v432;
  int v433;
  int v434;
  int v435;
  _DWORD *v436;
  int v437;
  int v438;
  int v439;
  int v440;
  int v441;
  int v442;
  int v443;
  int v444;
  int v445;
  _DWORD *v446;
  int v447;
  int v448;
  int v449;
  int v450;
  int v451;
  int v452;
  int v453;
  int v454;
  int v455;
  _DWORD *v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  int v462;
  int v463;
  int v464;
  _DWORD *v465;
  int v466;
  int v467;
  int v468;
  int v469;
  int v470;
  int v471;
  int v472;
  int v473;
  int v474;
  _DWORD *v475;
  int v476;
  int v477;
  int v478;
  int v479;
  int v480;
  int v481;
  int v482;
  int v483;
  int v484;
  uint64_t v485;
  int v486;
  int v487;
  int v488;
  int v489;
  int v490;
  int v491;
  int v492;
  int v493;
  int v494;
  unint64_t v495;
  int v496;
  int v497;
  int v498;
  int v499;
  unsigned int v500;
  unsigned int v501;
  unsigned int v502;
  int *v503;
  int *v504;
  int v505;
  int v506;
  int v507;
  int v508;
  uint64_t v509;
  _DWORD *v510;
  int v511;
  int v512;
  int v513;
  int v514;
  int v515;
  int v516;
  int v517;
  int v518;
  int v519;
  int v520;
  _DWORD *v521;
  int v522;
  int v523;
  int v524;
  int v525;
  int v526;
  int v527;
  int v528;
  int v529;
  int v530;
  _DWORD *v531;
  int v532;
  int v533;
  int v534;
  int v535;
  int v536;
  int v537;
  int v538;
  int v539;
  int v540;
  uint64_t v541;
  int v542;
  int v543;
  int v544;
  int v545;
  int v546;
  int v547;
  int v548;
  int v549;
  int v550;
  int v551;
  int v552;
  int v553;
  int v554;
  int v555;
  int v556;
  int v557;
  int v558;
  int v559;
  unsigned int v560;
  unsigned int v561;
  unsigned int v562;
  int *v563;
  int *v564;
  int v565;
  uint64_t v566;
  _DWORD *v567;
  _DWORD *v568;
  int v569;
  int v570;
  int v571;
  int v572;
  int v573;
  int v574;
  int v575;
  int v576;
  int v577;
  int v578;
  int v579;
  int v580;
  int v581;
  int v582;
  int v583;
  int v584;
  int v585;
  int v586;
  uint64_t v587;
  int v588;
  int v589;
  int v590;
  int v591;
  int v592;
  int v593;
  int v594;
  int v595;
  int v596;
  int v597;
  unsigned int v598;
  unsigned int v599;
  unsigned int v600;
  void **v601;
  int *v602;
  int v603;
  _DWORD *v604;
  int v605;
  int v606;
  int v607;
  int v608;
  int v609;
  int v610;
  int v611;
  int v612;
  int v613;
  uint64_t v614;
  int v615;
  int v616;
  int v617;
  unsigned int v618;
  unsigned int v619;
  unsigned int v620;
  int v622;
  int v623;
  int v624;
  unint64_t v625;
  unsigned int v626;
  unsigned int v627;
  unsigned int v628;
  void **v630;
  void **v631;
  int v632;
  int v633;
  int v634;
  int v635;
  int v636;
  int v637;
  int v638;
  int v639;
  int *v640;
  int *v641;
  int v642;
  int v643;
  uint64_t v644;
  int v645;
  int v646;
  int v647;
  int v648;
  int v649;
  int v650;
  int v651;
  int v652;
  int v653;
  int v654;
  int v655;
  int v656;
  int v657;
  int v658;
  int v659;
  int v660;
  int v661;
  int v662;
  int v663;
  int v664;
  int v665;
  int v666;
  int v667;
  int v668;
  int v669;
  int v670;
  unsigned int v671;
  unsigned int v672;
  unsigned int v673;
  int *v674;
  int *v675;
  int v676;
  int v677;
  int v678;
  int v679;
  int v680;
  int v681;
  int v682;
  int v683;
  int v684;
  int v685;
  unsigned int v686;
  unsigned int v687;
  unsigned int v688;
  int *v689;
  int *v690;
  int v691;
  int v692;
  int v693;
  int v694;
  int v695;
  int v696;
  int v697;
  int v698;
  int v699;
  unint64_t v700;
  int v701;
  unsigned int v702;
  unsigned int v703;
  unsigned int v704;
  int *v705;
  int *v706;
  int v707;
  int v708;
  int v709;
  int v710;
  int v711;
  int v712;
  int v713;
  int v714;
  int v715;
  uint64_t v716;
  int v717;
  uint64_t v718;
  int v719;
  signed int v720;
  int v721;
  uint64_t v722;
  signed int v723;
  int v724;
  int v725;
  signed int v726;
  signed int v727;
  int v728;
  int v729;
  int v730;
  int v731;
  int v732;
  uint64_t v733;
  int v734;
  int v735;
  int v736;
  int v737;
  unsigned int v738;
  unsigned int v739;
  unsigned int v740;
  int *v741;
  int *v742;
  int v743;
  int v744;
  int v745;
  int v746;
  int v747;
  int v748;
  int v749;
  int v750;
  int v751;
  int v752;
  unsigned int v753;
  unsigned int v754;
  unsigned int v755;
  int *v756;
  int *v757;
  int v758;
  int v759;
  int v760;
  int v761;
  int v762;
  int v763;
  int v764;
  int v765;
  int v766;
  unsigned int v767;
  unsigned int v768;
  unsigned int v769;
  int *v770;
  int *v771;
  int v772;
  int v773;
  int v774;
  int v775;
  int v776;
  int v777;
  int v778;
  int v779;
  int v780;
  uint64_t v781;
  int v782;
  uint64_t v783;
  int v784;
  signed int v785;
  int v786;
  uint64_t v787;
  signed int v788;
  int v789;
  int v790;
  int v791;
  signed int v792;
  signed int v793;
  int v794;
  int v795;
  int v796;
  int v797;
  int v798;
  uint64_t v799;
  int v800;
  int v801;
  int v802;
  unsigned int v803;
  int v804;
  unsigned int v805;
  unsigned int v806;
  unsigned int v807;
  int *v809;
  int *v810;
  int v811;
  int v812;
  int v813;
  int v814;
  int v815;
  int v816;
  int v817;
  int v818;
  int v819;
  int v820;
  int v821;
  int v822;
  unsigned int v823;
  unsigned int v824;
  void **v826;
  int *v827;
  int v828;
  int v829;
  int v830;
  int v831;
  int v832;
  uint64_t v833;
  int v834;
  int v835;
  signed int v836;
  signed int v837;
  _BOOL4 v838;
  unint64_t v839;
  void **v840;
  void *v841;
  void *v842;
  void **v843;
  void *v844;
  void *v845;
  void *v846;
  unint64_t v847;
  void **v848;
  void *v849;
  void *v850;
  void **v851;
  void *v852;
  void *v853;
  void *v854;
  unint64_t v855;
  void **v856;
  void *v857;
  void *v858;
  void **v859;
  void *v860;
  void *v861;
  void *v862;
  unint64_t v863;
  void **v864;
  void *v865;
  void *v866;
  void **v867;
  void *v868;
  void *v869;
  void *v870;
  int v871;
  int v872;
  int v873;
  int v874;
  int v875;
  int v876;
  int v877;
  int v878;
  int v879;
  int v880;
  int v881;
  int v882;
  unsigned int v883;
  unsigned int v884;
  int v885;
  int v886;
  int v887;
  int v888;
  int v889;
  int v890;
  unsigned int v891;
  unsigned int v892;
  int v893;
  int v894;
  int v895;
  int v896;
  int v897;
  int v898;
  int v899;
  int v900;
  int v901;
  int v902;
  int v903;
  int v904;
  int v905;
  unsigned int v906;
  unsigned __int16 **v907;
  int v908;
  int v909;
  int v910;
  int v911;
  signed int v912;
  signed int v913;
  signed int v914;
  int v915;
  int v916;
  int v917;
  uint64_t v918;
  int *v919;
  int v920;
  int v921;
  int v922;
  int v923;
  int v924;
  size_t v925;
  uint64_t v926;
  int v927;
  int v928;
  int v929;
  int v930;
  int v931;
  signed int v932;
  int v933;
  uint64_t v934;
  uint64_t v935;
  int v936;
  unsigned int v937;
  int v938;
  int v939;
  int v940;
  int v941;
  signed int v942;
  signed int v943;
  uint64_t v944;
  int v945;
  int v946;
  int v947;
  unsigned int v948;
  uint64_t v949;
  int v950;
  int v951;
  int v952;
  int v953;
  int v954;
  char *v955;
  char *v956;
  int v957;
  int v958;
  int v959;
  int v960;
  int v961;
  int v962;
  uint64_t v963;
  int v964;
  uint64_t v965;
  int v966;
  size_t v967;
  int v968;
  size_t v969;
  _QWORD *v970;
  int v971;
  uint64_t v972;
  int v973;
  uint64_t v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  _QWORD *v981;
  uint64_t v982;
  uint64_t v983;
  uint64_t v984;
  unint64_t v985;
  int v986;
  int v987;
  int v988;
  _QWORD *v989;
  uint64_t v990;
  uint64_t v991;
  uint64_t v992;
  uint64_t v993;
  int v994;
  _QWORD *v995;
  uint64_t v996;
  int *v997;
  uint64_t v998;
  int v999;
  uint64_t v1000;
  _QWORD *v1001;
  _QWORD *v1002;
  void *v1003;
  _QWORD *v1004;
  _DWORD *v1005;
  char *v1006;
  int v1007;
  int v1008;
  unsigned int *v1009;
  int v1010;
  unsigned __int16 v1011;
  void *v1012;
  void *v1013;
  void *v1014;
  void *v1015;
  void *v1016;
  void *v1017;
  void *v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  void *v1022;
  void *v1023;
  int v1024;
  int v1025;
  int v1026;
  int v1027;
  int v1028;
  int v1029;
  int v1030;
  int v1031;
  int v1032;
  int v1033;
  int v1034;
  int v1035;
  int v1036;
  int v1037;
  int v1038;
  __int16 v1039;
  unsigned __int16 v1040;
  unsigned __int16 v1041;
  unsigned __int16 v1042;
  unsigned __int16 v1043;
  void *v1044;
  _QWORD v1045[2];
  void *__p;
  void *v1047;
  uint64_t v1048;
  __int128 __b;
  void *v1050[2];
  __int128 v1051;
  void *v1052[2];
  void *v1053[2];
  __int128 v1054;
  void *v1055[2];
  __int128 v1056;
  __int128 v1057;
  __int128 v1058;
  __int128 v1059;
  __int128 v1060;
  __int128 v1061;
  __int128 v1062;
  __int128 v1063;
  __int128 v1064;
  __int128 v1065;
  __int128 v1066;
  __int128 v1067;
  __int128 v1068;
  __int128 v1069;
  __int128 v1070;
  uint64_t v1071;
  uint64_t v1072;

  v2 = a2;
  v3 = a1;
  v1072 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    v4 = *a1;
    memset_pattern16(&__b, &unk_23CCD46A0, 4uLL);
    if ((int)v4 >= 1)
    {
      v5 = 0;
      v6 = 4 * v4;
      do
      {
        v7 = *(int *)(*((_QWORD *)v3 + 11) + v5);
        v8 = (int *)(*((_QWORD *)v3 + 17) + 12 * v7);
        v9 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v12 = (int *)(*((_QWORD *)v3 + 20) + 12 * v7);
        v13 = v12[2];
        if ((_DWORD)v13 == -1)
        {
          v14 = *((_QWORD *)v3 + 387);
          if ((_DWORD)v11 == -1)
          {
            if ((_DWORD)v10 == -1)
            {
              if ((_DWORD)v9 == -1)
                v9 = 0;
              else
                v9 = *(unsigned __int8 *)(v14 + v9);
            }
            else
            {
              LODWORD(v9) = *(unsigned __int8 *)(v14 + v9);
              if ((_DWORD)v9)
                LODWORD(v9) = *(_BYTE *)(v14 + v10) != 0;
              v9 = v9;
            }
            goto LABEL_11;
          }
          v15 = *(unsigned __int8 *)(v14 + v10)
              + *(unsigned __int8 *)(v14 + v9)
              + *(unsigned __int8 *)(v14 + v11) > 1;
        }
        else
        {
          v14 = *((_QWORD *)v3 + 387);
          v15 = *(unsigned __int8 *)(v14 + v10)
              + *(unsigned __int8 *)(v14 + v9)
              + *(unsigned __int8 *)(v14 + v11)
              + *(unsigned __int8 *)(v14 + *v12)
              + *(unsigned __int8 *)(v14 + v12[1])
              + *(unsigned __int8 *)(v14 + v13) > 2;
        }
        if (v15)
          v9 = 1;
        else
          v9 = 0;
LABEL_11:
        sub_23CCC4CE0((uint64_t)(v3 + 890), *(unsigned __int8 *)(v14 + v7) != 0, (_WORD *)&v1050[-2] + v9);
        v5 += 4;
      }
      while (v6 != v5);
    }
  }
  v1000 = v2;
  v1009 = v3;
  switch(*(_DWORD *)(v2 + 12))
  {
    case 0:
      v16 = 0;
      v17 = 0;
      v977 = *v3;
      v1001 = v3 + 750;
      v18 = (int)v3[780];
      v984 = *((_QWORD *)v3 + 384);
      v993 = v3[780];
      v1062 = 0u;
      v1063 = 0u;
      v1060 = 0u;
      v1061 = 0u;
      v1058 = 0u;
      v1059 = 0u;
      v1056 = 0u;
      v1057 = 0u;
      v1054 = 0u;
      *(_OWORD *)v1055 = 0u;
      *(_OWORD *)v1052 = 0u;
      *(_OWORD *)v1053 = 0u;
      *(_OWORD *)v1050 = 0u;
      v1051 = 0u;
      __b = 0u;
      do
      {
        v19 = v16;
        sub_23CCB7FFC((uint64_t)&v1050[15 * v17 - 2], v18);
        v16 = 1;
        v17 = 1;
      }
      while ((v19 & 1) == 0);
      LODWORD(v1044) = 0;
      v966 = v18;
      sub_23CCC14E0(&__p, v18, &v1044);
      v20 = v993;
      if ((int)v977 < 1)
        goto LABEL_53;
      v21 = 0;
      v22 = 4 * v993;
      v971 = *(_DWORD *)(v1000 + 16);
      v23 = (uint64_t)(v3 + 890);
      while (1)
      {
        v24 = *(int *)(*((_QWORD *)v3 + 11) + 4 * v21);
        if (!v971)
          break;
        v25 = *((_QWORD *)v3 + 387);
        if (*(_BYTE *)(v25 + v24))
        {
          v26 = v966;
          v27 = v984 + 4 * (int)v24 * v966;
          v3 = v1009;
          v28 = (int *)(*((_QWORD *)v1009 + 17) + 12 * (int)v24);
          v29 = *v28;
          v30 = v28[1];
          if (v30 == -1 || !*(_BYTE *)(v25 + v29) || !*(_BYTE *)(v25 + v30))
          {
            if (v29 == -1 || !*(_BYTE *)(v25 + v29))
            {
LABEL_46:
              if (v20 >= 1)
              {
                v43 = __p;
                bzero(__p, v22);
                v44 = 0;
                do
                {
                  v45 = *(_DWORD *)(*v1001 + 4 * v44);
                  if (v45 >= 1)
                  {
                    v46 = 0;
                    v47 = *(_DWORD *)(v27 + 4 * v44) - v43[v44];
                    do
                    {
                      LOWORD(v1044) = 0x8000;
                      sub_23CCC4CE0(v23, (v47 >> v46++) & 1, &v1044);
                    }
                    while (v45 != v46);
                  }
                  ++v44;
                  v20 = v993;
                }
                while (v44 != v993);
              }
              goto LABEL_52;
            }
LABEL_32:
            v31 = (char *)__p;
            if (v26 >= 1)
            {
              v32 = 0;
              v33 = v984 + 4 * v29 * v20;
              do
              {
                *(_DWORD *)&v31[v32] = *(_DWORD *)(v33 + v32);
                v32 += 4;
              }
              while (v22 != v32);
            }
            v34 = 0;
LABEL_44:
            sub_23CCC4E54((uint64_t)v3, v27, (uint64_t)v31, v26, v1001, *(_BYTE *)(v1000 + 8), &v1050[15 * v34 - 2]);
            goto LABEL_52;
          }
LABEL_38:
          v31 = (char *)__p;
          if (v20 >= 1)
          {
            v36 = 0;
            v37 = v984 + 4 * v29 * v20;
            v38 = v984 + 4 * v30 * v26;
            do
            {
              v39 = *(_DWORD *)(v37 + v36);
              v40 = *(_DWORD *)(v38 + v36);
              v41 = __OFADD__(v40, v39);
              v42 = v40 + v39;
              if (v42 < 0 != v41)
                ++v42;
              *(_DWORD *)&v31[v36] = v42 >> 1;
              v36 += 4;
            }
            while (v22 != v36);
          }
          v34 = 1;
          goto LABEL_44;
        }
LABEL_52:
        ++v21;
        v3 = v1009;
        if (v21 == v977)
        {
LABEL_53:
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          for (i = 0; i != -240; i -= 120)
          {
            v49 = &v1050[i / 8 - 2];
            v50 = *(void **)((char *)&v1062 + i + 8);
            if (v50)
            {
              v49[28] = v50;
              operator delete(v50);
            }
            v51 = v49[24];
            if (v51)
            {
              *(_QWORD *)((char *)&v1061 + i + 8) = v51;
              operator delete(v51);
            }
            v52 = &v1050[i / 8 - 2];
            v53 = *(void **)((char *)&v1059 + i + 8);
            if (v53)
            {
              v52[22] = v53;
              operator delete(v53);
            }
            v54 = v52[18];
            if (v54)
            {
              *(_QWORD *)((char *)&v1058 + i + 8) = v54;
              operator delete(v54);
            }
            v55 = v49[15];
            if (v55)
            {
              *(_QWORD *)((char *)&v1057 + i) = v55;
              operator delete(v55);
            }
          }
          return 0;
        }
      }
      v27 = v984 + 4 * (int)v24 * v20;
      v35 = (int *)(*((_QWORD *)v3 + 17) + 12 * (int)v24);
      v29 = *v35;
      v30 = v35[1];
      if (v30 == -1)
      {
        v26 = v966;
        if (v29 == -1)
          goto LABEL_46;
        goto LABEL_32;
      }
      v26 = v966;
      goto LABEL_38;
    case 1:
      v260 = 0;
      v974 = *v3;
      v1004 = v3 + 750;
      v261 = (int)v3[780];
      v262 = v3[780];
      v980 = *((_QWORD *)v3 + 384);
      v1071 = 0;
      v1069 = 0u;
      v1070 = 0u;
      v1067 = 0u;
      v1068 = 0u;
      v1065 = 0u;
      v1066 = 0u;
      v1063 = 0u;
      v1064 = 0u;
      v1061 = 0u;
      v1062 = 0u;
      v1059 = 0u;
      v1060 = 0u;
      v1057 = 0u;
      v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      v1054 = 0u;
      v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1050[v260 - 2], v262);
        v260 += 15;
      }
      while (v260 != 45);
      LODWORD(v1044) = 0;
      v968 = v261;
      sub_23CCC14E0(&__p, v261, &v1044);
      if ((int)v974 < 1)
        goto LABEL_1257;
      v263 = 0;
      v264 = 4 * v262;
      v987 = *(_DWORD *)(v1000 + 16);
      v265 = (uint64_t)(v3 + 890);
      do
      {
        v266 = *(int *)(*((_QWORD *)v3 + 11) + 4 * v263);
        if (!v987 || *(_BYTE *)(*((_QWORD *)v1009 + 387) + v266))
        {
          v996 = v980 + 4 * (int)v266 * (int)v262;
          v267 = (int *)(*((_QWORD *)v1009 + 17) + 12 * (int)v266);
          v268 = *v267;
          v269 = v267[1];
          v270 = v267[2];
          if ((_DWORD)v270 != -1)
          {
            if (!v987
              || (v271 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v271 + v268))
              && *(_BYTE *)(v271 + v269)
              && *(_BYTE *)(v271 + v270))
            {
              v272 = (char *)__p;
              v273 = v968;
              if ((int)v262 >= 1)
              {
                v274 = 0;
                v275 = v980 + 4 * (int)v268 * v968;
                v276 = v980 + 4 * (int)v269 * (int)v262;
                v277 = v980 + 4 * (int)v270 * v968;
                do
                {
                  *(_DWORD *)&v272[v274] = *(_DWORD *)(v276 + v274)
                                         + *(_DWORD *)(v275 + v274)
                                         - *(_DWORD *)(v277 + v274);
                  v274 += 4;
                }
                while (v264 != v274);
              }
              v278 = 2;
LABEL_324:
              sub_23CCC4E54((uint64_t)v1009, v996, (uint64_t)v272, v273, v1004, *(_BYTE *)(v1000 + 8), &v1050[15 * v278 - 2]);
              goto LABEL_325;
            }
          }
          v273 = v968;
          if ((_DWORD)v269 != -1)
          {
            if (!v987 || (v279 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v279 + v268)) && *(_BYTE *)(v279 + v269))
            {
              v272 = (char *)__p;
              if (v968 >= 1)
              {
                v280 = 0;
                v281 = v980 + 4 * (int)v268 * (int)v262;
                v282 = v980 + 4 * (int)v269 * v968;
                do
                {
                  v283 = *(_DWORD *)(v281 + v280);
                  v284 = *(_DWORD *)(v282 + v280);
                  v41 = __OFADD__(v284, v283);
                  v285 = v284 + v283;
                  if (v285 < 0 != v41)
                    ++v285;
                  *(_DWORD *)&v272[v280] = v285 >> 1;
                  v280 += 4;
                }
                while (v264 != v280);
              }
              v278 = 1;
              goto LABEL_324;
            }
          }
          if ((_DWORD)v268 != -1 && (!v987 || *(_BYTE *)(*((_QWORD *)v1009 + 387) + v268)))
          {
            v272 = (char *)__p;
            if ((int)v262 >= 1)
            {
              v286 = 0;
              v287 = v980 + 4 * (int)v268 * (int)v262;
              do
              {
                *(_DWORD *)&v272[v286] = *(_DWORD *)(v287 + v286);
                v286 += 4;
              }
              while (v264 != v286);
            }
            v278 = 0;
            goto LABEL_324;
          }
          if (v968 >= 1)
          {
            v288 = __p;
            bzero(__p, 4 * v262);
            v289 = 0;
            do
            {
              v290 = *(_DWORD *)(*v1004 + 4 * v289);
              if (v290 >= 1)
              {
                v291 = 0;
                v292 = *(_DWORD *)(v996 + 4 * v289) - v288[v289];
                do
                {
                  LOWORD(v1044) = 0x8000;
                  sub_23CCC4CE0(v265, (v292 >> v291++) & 1, &v1044);
                }
                while (v290 != v291);
              }
              ++v289;
            }
            while (v289 != v262);
          }
        }
LABEL_325:
        ++v263;
        v3 = v1009;
      }
      while (v263 != v974);
LABEL_1257:
      if (__p)
      {
        v1047 = __p;
        operator delete(__p);
      }
      v839 = 360;
      do
      {
        v840 = &v1050[v839 / 8 - 2];
        v841 = *(void **)((char *)&__p + v839);
        if (v841)
        {
          *(v840 - 2) = v841;
          operator delete(v841);
        }
        v842 = *(v840 - 6);
        if (v842)
        {
          v1045[v839 / 8] = v842;
          operator delete(v842);
        }
        v843 = &v1050[v839 / 8 - 2];
        v844 = *(void **)((char *)&v1036 + v839);
        if (v844)
        {
          *(v843 - 8) = v844;
          operator delete(v844);
        }
        v845 = *(v843 - 12);
        if (v845)
        {
          *(_QWORD *)((char *)&v1032 + v839) = v845;
          operator delete(v845);
        }
        v846 = *(v840 - 15);
        if (v846)
        {
          *(_QWORD *)((char *)&v1026 + v839) = v846;
          operator delete(v846);
        }
        v839 -= 120;
      }
      while (v839);
      return 0;
    case 2:
      v56 = 0;
      v972 = *v3;
      v1002 = v3 + 750;
      v985 = (int)v3[780];
      v57 = v3[780];
      v978 = *((_QWORD *)v3 + 384);
      v1071 = 0;
      v1069 = 0u;
      v1070 = 0u;
      v1067 = 0u;
      v1068 = 0u;
      v1065 = 0u;
      v1066 = 0u;
      v1063 = 0u;
      v1064 = 0u;
      v1061 = 0u;
      v1062 = 0u;
      v1059 = 0u;
      v1060 = 0u;
      v1057 = 0u;
      v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      v1054 = 0u;
      v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1050[v56 - 2], v57);
        v56 += 15;
      }
      while (v56 != 45);
      memset_pattern16(&v1041, &unk_23CCD46A0, 6uLL);
      LODWORD(v1044) = 0;
      sub_23CCC14E0(&__p, v985, &v1044);
      LODWORD(v1022) = 0;
      sub_23CCC14E0(&v1044, v985, &v1022);
      LODWORD(v1020) = 0;
      sub_23CCC14E0(&v1022, v985, &v1020);
      LODWORD(v1018) = 0;
      sub_23CCC14E0(&v1020, v985, &v1018);
      LODWORD(v1016) = 0;
      sub_23CCC14E0(&v1018, v985, &v1016);
      LODWORD(v1014) = 0;
      sub_23CCC14E0(&v1016, v985, &v1014);
      LODWORD(v1012) = 0;
      sub_23CCC14E0(&v1014, v985, &v1012);
      v1010 = 0;
      sub_23CCC14E0(&v1012, v985, &v1010);
      if ((int)v972 < 1)
        goto LABEL_1286;
      v58 = 0;
      v994 = *(_DWORD *)(v2 + 16);
      v59 = (uint64_t)(v3 + 890);
      while (1)
      {
        v60 = *(int *)(*((_QWORD *)v3 + 11) + 4 * v58);
        if (v994 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v60))
          goto LABEL_154;
        v61 = (int *)(*((_QWORD *)v1009 + 17) + 12 * (int)v60);
        v63 = *v61;
        v62 = v61[1];
        v64 = v61[2];
        v65 = __p;
        if ((_DWORD)v64 != -1
          && (!v994
           || (v66 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v66 + v63)) && *(_BYTE *)(v66 + v62) && *(_BYTE *)(v66 + v64)))
        {
          v67 = v985;
          v68 = 4 * v57;
          if ((int)v57 >= 1)
          {
            v69 = (int *)(v978 + 4 * (int)v63 * (int)v985);
            v70 = (int *)(v978 + 4 * (int)v62 * (int)v57);
            v71 = (int *)(v978 + 4 * (int)v64 * (int)v985);
            v72 = __p;
            v73 = v57;
            do
            {
              v75 = *v69++;
              v74 = v75;
              v76 = *v70++;
              v77 = v76 + v74;
              v78 = *v71++;
              *v72++ = v77 - v78;
              --v73;
            }
            while (v73);
          }
          LODWORD(v79) = 0;
          v80 = 2;
          v81 = 2;
        }
        else
        {
          v67 = v985;
          v68 = 4 * v57;
          if ((_DWORD)v62 == -1
            || v994 && ((v82 = *((_QWORD *)v1009 + 387), !*(_BYTE *)(v82 + v63)) || !*(_BYTE *)(v82 + v62)))
          {
            if ((_DWORD)v63 == -1 || v994 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v63))
            {
              if ((int)v985 >= 1)
              {
                v94 = v64;
                bzero(__p, 4 * v57);
                v64 = v94;
                v67 = v985;
              }
              v80 = 0;
              v81 = -1;
              LODWORD(v79) = 1;
            }
            else if ((int)v57 < 1)
            {
              v80 = 0;
              LODWORD(v79) = 0;
              v81 = 0;
            }
            else
            {
              v90 = (int *)(v978 + 4 * (int)v63 * (int)v57);
              v91 = __p;
              v92 = v57;
              do
              {
                v93 = *v90++;
                *v91++ = v93;
                --v92;
              }
              while (v92);
              v80 = 0;
              LODWORD(v79) = 0;
              v81 = 0;
            }
          }
          else if ((int)v985 < 1)
          {
            LODWORD(v79) = 0;
            v80 = 1;
            v81 = 1;
          }
          else
          {
            v83 = (int *)(v978 + 4 * (int)v63 * (int)v57);
            v84 = (int *)(v978 + 4 * (int)v62 * (int)v985);
            v85 = (int *)__p;
            v79 = v57;
            do
            {
              v87 = *v83++;
              v86 = v87;
              v88 = *v84++;
              v41 = __OFADD__(v88, v86);
              v89 = v88 + v86;
              if (v89 < 0 != v41)
                ++v89;
              *v85++ = v89 >> 1;
              --v79;
            }
            while (v79);
            v80 = 1;
            v81 = 1;
          }
        }
        v95 = v978 + 4 * (int)v60 * (int)v57;
        v96 = (int *)(*((_QWORD *)v1009 + 20) + 12 * (int)v60);
        v97 = v96[2];
        if ((_DWORD)v97 != -1)
        {
          v98 = *v96;
          v99 = v96[1];
          if (!v994)
            break;
          v100 = *((_QWORD *)v1009 + 387);
          if (*(_BYTE *)(v100 + v63))
          {
            if (*(_BYTE *)(v100 + v62)
              && *(_BYTE *)(v100 + v64)
              && *(_BYTE *)(v100 + v98)
              && *(_BYTE *)(v100 + v99)
              && *(_BYTE *)(v100 + v97))
            {
              break;
            }
          }
        }
        v130 = v1000;
        if ((_DWORD)v79)
          goto LABEL_131;
LABEL_153:
        sub_23CCC4E54((uint64_t)v1009, v95, (uint64_t)v65, v67, v1002, *(_BYTE *)(v130 + 8), &v1050[15 * v81 - 2]);
LABEL_154:
        ++v58;
        v3 = v1009;
        if (v58 == v972)
        {
LABEL_1286:
          if (v1012)
          {
            v1013 = v1012;
            operator delete(v1012);
          }
          if (v1014)
          {
            v1015 = v1014;
            operator delete(v1014);
          }
          if (v1016)
          {
            v1017 = v1016;
            operator delete(v1016);
          }
          if (v1018)
          {
            v1019 = v1018;
            operator delete(v1018);
          }
          if (v1020)
          {
            v1021 = v1020;
            operator delete(v1020);
          }
          if (v1022)
          {
            v1023 = v1022;
            operator delete(v1022);
          }
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          v855 = 360;
          do
          {
            v856 = &v1050[v855 / 8 - 2];
            v857 = *(void **)((char *)&__p + v855);
            if (v857)
            {
              *(v856 - 2) = v857;
              operator delete(v857);
            }
            v858 = *(v856 - 6);
            if (v858)
            {
              v1045[v855 / 8] = v858;
              operator delete(v858);
            }
            v859 = &v1050[v855 / 8 - 2];
            v860 = *(void **)((char *)&v1036 + v855);
            if (v860)
            {
              *(v859 - 8) = v860;
              operator delete(v860);
            }
            v861 = *(v859 - 12);
            if (v861)
            {
              *(_QWORD *)((char *)&v1032 + v855) = v861;
              operator delete(v861);
            }
            v862 = *(v856 - 15);
            if (v862)
            {
              *(_QWORD *)((char *)&v1026 + v855) = v862;
              operator delete(v862);
            }
            v855 -= 120;
          }
          while (v855);
          return 0;
        }
      }
      v962 = v79;
      v954 = v81;
      if ((int)v57 < 1)
      {
        v129 = *(unsigned __int8 *)(v1000 + 24);
        if (!*(_BYTE *)(v1000 + 24))
        {
          v123 = 0;
          v125 = 0;
          v127 = 0;
          goto LABEL_141;
        }
        v111 = (int *)v1018;
        v112 = (int *)v1016;
        v113 = (int *)v1014;
        v114 = (int *)v1012;
      }
      else
      {
        v101 = 0;
        v102 = v978 + 4 * (int)v63 * v67;
        v103 = v978 + 4 * (int)v62 * (int)v57;
        v104 = v978 + 4 * (int)v64 * v67;
        v105 = v978 + 4 * (int)v98 * (int)v57;
        v106 = v978 + 4 * (int)v99 * v67;
        v107 = v978 + 4 * (int)v97 * (int)v57;
        v108 = (char *)v1044;
        v109 = (char *)v1022;
        v110 = (char *)v1020;
        v111 = (int *)v1018;
        v112 = (int *)v1016;
        v113 = (int *)v1014;
        v114 = (int *)v1012;
        do
        {
          *(_DWORD *)&v108[v101] = *(_DWORD *)(v106 + v101) + *(_DWORD *)(v105 + v101) - *(_DWORD *)(v107 + v101);
          v115 = *(_DWORD *)(v102 + v101);
          v116 = *(_DWORD *)(v105 + v101);
          v117 = v116 + v115;
          if (v116 + v115 < 0 != __OFADD__(v116, v115))
            ++v117;
          *(_DWORD *)&v109[v101] = *(_DWORD *)(v106 + v101) + *(_DWORD *)(v103 + v101) - (v117 >> 1);
          v118 = *(_DWORD *)(v102 + v101);
          v119 = *(_DWORD *)(v105 + v101);
          v41 = __OFADD__(v119, v118);
          v120 = v119 + v118;
          if (v120 < 0 != v41)
            ++v120;
          v121 = 1431655766
               * ((v120 >> 1)
                - (*(_DWORD *)(v104 + v101)
                 + *(_DWORD *)(v107 + v101))
                + 2 * (*(_DWORD *)(v106 + v101) + *(_DWORD *)(v103 + v101)));
          *(_DWORD *)&v110[v101] = HIDWORD(v121) + (v121 >> 63);
          v111[v101 / 4] = *(_DWORD *)(v95 + v101) - v65[v101 / 4];
          v112[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v108[v101];
          v113[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v109[v101];
          v114[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v110[v101];
          v101 += 4;
        }
        while (v68 != v101);
        if (!*(_BYTE *)(v1000 + 24))
        {
          v122 = *v111;
          if (*v111 < 0)
            v122 = -v122;
          v123 = -(v67 * __clz(v122 + 1));
          v124 = *v112;
          if (*v112 < 0)
            v124 = -v124;
          v125 = -(v57 * __clz(v124 + 1));
          v126 = *v113;
          if (*v113 < 0)
            v126 = -v126;
          v127 = -(v67 * __clz(v126 + 1));
          v128 = *v114;
          if (*v114 < 0)
            v128 = -v128;
          v129 = -(v57 * __clz(v128 + 1));
LABEL_141:
          if (v123 <= v125 && v123 <= v127 && v123 <= v129)
          {
            v138 = 0;
            v139 = 0;
LABEL_145:
            v140 = 1;
            goto LABEL_152;
          }
          if (v125 > v127 || v125 > v129)
          {
            if (v127 <= v129)
            {
              v139 = 0;
              v138 = 1;
              v65 = v1022;
              goto LABEL_145;
            }
            v138 = 1;
            v65 = v1020;
            v139 = 1;
          }
          else
          {
            v138 = 0;
            v139 = 1;
            v65 = v1044;
          }
          v140 = 2;
LABEL_152:
          v130 = v1000;
          sub_23CCC4CE0(v59, v139, &v1041);
          sub_23CCC4CE0(v59, v138, &v1041 + v140);
          v67 = v985;
          v81 = v954;
          if (v962)
          {
LABEL_131:
            if (v67 >= 1)
            {
              v131 = 0;
              do
              {
                v132 = *(_DWORD *)(*v1002 + 4 * v131);
                if (v132 >= 1)
                {
                  v133 = 0;
                  v134 = *(_DWORD *)(v95 + 4 * v131) - v65[v131];
                  do
                  {
                    LOWORD(v1010) = 0x8000;
                    sub_23CCC4CE0(v59, (v134 >> v133++) & 1, &v1010);
                  }
                  while (v132 != v133);
                }
                ++v131;
              }
              while (v131 != v57);
            }
            goto LABEL_154;
          }
          goto LABEL_153;
        }
      }
      v907 = (unsigned __int16 **)&v1050[15 * v80 - 2];
      v903 = *(unsigned __int8 *)(v1000 + 8);
      v949 = v1041;
      v135 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1041 + 2048) >> 10) & 0x7CLL));
      v940 = v135;
      v925 = v1042;
      v931 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1042 + 2048) >> 10) & 0x7CLL));
      v932 = v931 + v135 + sub_23CCD36C8(v111, v57, v903, v907);
      LODWORD(v949) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v949) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v918 = v1043;
      v911 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1043 + 2048) >> 10) & 0x7CLL));
      v912 = v911 + sub_23CCD36C8(v112, v985, v903, v907) + v949;
      LODWORD(v925) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - v925) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v900 = sub_23CCD36C8(v113, v57, v903, v907);
      v136 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v918) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v137 = sub_23CCD36C8(v114, v985, v903, v907);
      v125 = v912;
      v123 = v932;
      v127 = v925 + v940 + v900;
      v129 = v136 + v949 + v137;
      goto LABEL_141;
    case 3:
      v293 = 0;
      v975 = *v3;
      v981 = v3 + 750;
      v294 = (int)v3[780];
      v295 = v3[780];
      v296 = *((_QWORD *)v3 + 384);
      v1071 = 0;
      v1069 = 0u;
      v1070 = 0u;
      v1067 = 0u;
      v1068 = 0u;
      v1065 = 0u;
      v1066 = 0u;
      v1063 = 0u;
      v1064 = 0u;
      v1061 = 0u;
      v1062 = 0u;
      v1059 = 0u;
      v1060 = 0u;
      v1057 = 0u;
      v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      v1054 = 0u;
      v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1050[v293 - 2], v295);
        v293 += 15;
      }
      while (v293 != 45);
      LOWORD(v1020) = 0x8000;
      LODWORD(v1044) = 0;
      sub_23CCC14E0(&__p, v294, &v1044);
      LODWORD(v1022) = 0;
      v964 = v294;
      sub_23CCC14E0(&v1044, v294, &v1022);
      if ((int)v975 < 1)
        goto LABEL_390;
      v297 = 0;
      v298 = (uint64_t)(v3 + 890);
      v988 = *(_DWORD *)(v1000 + 16);
      v944 = 4 * v295;
      v969 = v295;
      while (1)
      {
        v299 = *(int *)(*((_QWORD *)v3 + 11) + 4 * v297);
        v300 = v981;
        if (v988 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v299))
          goto LABEL_389;
        v997 = (int *)(v296 + 4 * (int)v299 * (int)v295);
        v301 = (int *)(*((_QWORD *)v1009 + 17) + 12 * v299);
        v302 = *v301;
        v303 = v301[1];
        v304 = v301[2];
        v1005 = __p;
        v305 = (int *)(*((_QWORD *)v1009 + 20) + 12 * v299);
        v306 = v305[2];
        if ((_DWORD)v306 != -1
          && ((v308 = *v305, v307 = v305[1], !v988)
           || (v309 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v309 + v302))
           && *(_BYTE *)(v309 + v303)
           && *(_BYTE *)(v309 + v304)
           && *(_BYTE *)(v309 + v308)
           && *(_BYTE *)(v309 + v307)
           && *(_BYTE *)(v309 + v306)))
        {
          v957 = v307;
          v310 = v964;
          sub_23CCAE5A4((int *)(v296 + 4 * (int)v302 * v964), (int *)(v296 + 4 * (int)v303 * (int)v969), (int *)(v296 + 4 * (int)v304 * v964), v964, (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v302), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v303), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v304), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v299), __p);
          sub_23CCAE5A4((int *)(v296 + 4 * (int)v308 * (int)v969), (int *)(v296 + 4 * v957 * v964), (int *)(v296 + 4 * (int)v306 * (int)v969), v969, (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v308), (int *)(*((_QWORD *)v1009 + 23) + 12 * v957), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v306), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v299), v1044);
          if (v964 < 1)
          {
            v316 = 2;
            v300 = v981;
            LODWORD(v295) = v969;
          }
          else
          {
            v311 = (int *)__p;
            v312 = (int *)v1044;
            LODWORD(v295) = v969;
            v313 = v969;
            v300 = v981;
            do
            {
              v314 = *v312++;
              v315 = v314 + *v311;
              if (v315 < 0 != __OFADD__(v314, *v311))
                ++v315;
              *v311++ = v315 >> 1;
              --v313;
            }
            while (v313);
            v316 = 2;
          }
        }
        else
        {
          LODWORD(v295) = v969;
          if ((_DWORD)v304 != -1
            && (!v988
             || (v317 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v317 + v302))
             && *(_BYTE *)(v317 + v303)
             && *(_BYTE *)(v317 + v304)))
          {
            v310 = v964;
            sub_23CCAE5A4((int *)(v296 + 4 * (int)v302 * v964), (int *)(v296 + 4 * (int)v303 * (int)v969), (int *)(v296 + 4 * (int)v304 * v964), v964, (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v302), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v303), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v304), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v299), __p);
            v316 = 2;
            v300 = v981;
          }
          else
          {
            if ((_DWORD)v303 == -1
              || v988 && ((v318 = *((_QWORD *)v1009 + 387), !*(_BYTE *)(v318 + v302)) || !*(_BYTE *)(v318 + v303)))
            {
              if ((_DWORD)v302 == -1 || v988 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v302))
              {
                if ((int)v969 >= 1)
                {
                  bzero(__p, v944);
                  for (j = 0; j != v969; ++j)
                  {
                    v324 = *(_DWORD *)(*v981 + 4 * j);
                    if (v324 >= 1)
                    {
                      v325 = 0;
                      v326 = v997[j] - v1005[j];
                      do
                      {
                        LOWORD(v1022) = 0x8000;
                        sub_23CCC4CE0(v298, (v326 >> v325++) & 1, &v1022);
                      }
                      while (v324 != v325);
                    }
                  }
                }
                goto LABEL_389;
              }
              v310 = v964;
              if (v964 >= 1)
              {
                v319 = (int *)(v296 + 4 * (int)v302 * (int)v969);
                v320 = __p;
                v321 = v969;
                do
                {
                  v322 = *v319++;
                  *v320++ = v322;
                  --v321;
                }
                while (v321);
              }
              v316 = 0;
              goto LABEL_388;
            }
            if ((_DWORD)v969 == 2)
            {
              LODWORD(v1022) = 0;
              sub_23CCAE844((int *)(v296 + 8 * v302), (int *)(v296 + 8 * v303), v997, (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v302), (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v303), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v299), (int *)__p, &v1022);
              sub_23CCC4CE0(v298, (_DWORD)v1022 != 0, &v1020);
            }
            else if ((int)v969 >= 1)
            {
              v327 = (int *)(v296 + 4 * (int)v302 * (int)v969);
              v310 = v964;
              v328 = (int *)(v296 + 4 * (int)v303 * v964);
              v329 = (int *)__p;
              v330 = v969;
              do
              {
                v332 = *v327++;
                v331 = v332;
                v333 = *v328++;
                v41 = __OFADD__(v333, v331);
                v334 = v333 + v331;
                if (v334 < 0 != v41)
                  ++v334;
                *v329++ = v334 >> 1;
                --v330;
              }
              while (v330);
              v316 = 1;
              goto LABEL_388;
            }
            v316 = 1;
            v310 = v964;
          }
        }
LABEL_388:
        sub_23CCC4E54((uint64_t)v1009, (uint64_t)v997, (uint64_t)v1005, v310, v300, *(_BYTE *)(v1000 + 8), &v1050[15 * v316 - 2]);
LABEL_389:
        ++v297;
        v3 = v1009;
        if (v297 == v975)
        {
LABEL_390:
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          v335 = 360;
          do
          {
            v336 = &v1050[v335 / 8 - 2];
            v337 = *(void **)((char *)&__p + v335);
            if (v337)
            {
              *(v336 - 2) = v337;
              operator delete(v337);
            }
            v338 = *(v336 - 6);
            if (v338)
            {
              v1045[v335 / 8] = v338;
              operator delete(v338);
            }
            v339 = &v1050[v335 / 8 - 2];
            v340 = *(void **)((char *)&v1036 + v335);
            if (v340)
            {
              *(v339 - 8) = v340;
              operator delete(v340);
            }
            v341 = *(v339 - 12);
            if (v341)
            {
              *(_QWORD *)((char *)&v1032 + v335) = v341;
              operator delete(v341);
            }
            v342 = *(v336 - 15);
            if (v342)
            {
              *(_QWORD *)((char *)&v1026 + v335) = v342;
              operator delete(v342);
            }
            v335 -= 120;
          }
          while (v335);
          return 0;
        }
      }
    case 4:
      v141 = 0;
      v963 = *v3;
      v995 = v3 + 750;
      v142 = (int)v3[780];
      v143 = (void *)v3[780];
      v979 = *((_QWORD *)v3 + 384);
      v1071 = 0;
      v1069 = 0u;
      v1070 = 0u;
      v1067 = 0u;
      v1068 = 0u;
      v1065 = 0u;
      v1066 = 0u;
      v1063 = 0u;
      v1064 = 0u;
      v1061 = 0u;
      v1062 = 0u;
      v1059 = 0u;
      v1060 = 0u;
      v1057 = 0u;
      v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      v1054 = 0u;
      v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      __b = 0u;
      *(_OWORD *)v1050 = 0u;
      v1003 = v143;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1050[v141 - 2], (int)v143);
        v141 += 15;
        LODWORD(v143) = (_DWORD)v1003;
      }
      while (v141 != 45);
      LOWORD(v1037) = 0x8000;
      memset_pattern16(&v1041, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1010, &unk_23CCD46A0, 6uLL);
      LODWORD(v1044) = 0;
      sub_23CCC14E0(&__p, v142, &v1044);
      LODWORD(v1022) = 0;
      sub_23CCC14E0(&v1044, v142, &v1022);
      LODWORD(v1020) = 0;
      sub_23CCC14E0(&v1022, v142, &v1020);
      LODWORD(v1018) = 0;
      sub_23CCC14E0(&v1020, v142, &v1018);
      LODWORD(v1016) = 0;
      sub_23CCC14E0(&v1018, v142, &v1016);
      LODWORD(v1014) = 0;
      sub_23CCC14E0(&v1016, v142, &v1014);
      LODWORD(v1012) = 0;
      sub_23CCC14E0(&v1014, v142, &v1012);
      v1038 = 0;
      v973 = v142;
      sub_23CCC14E0(&v1012, v142, &v1038);
      v144 = (int)v1003;
      if ((int)v963 < 1)
        goto LABEL_1315;
      v145 = 0;
      v986 = *(_DWORD *)(v2 + 16);
      v146 = (uint64_t)(v3 + 890);
      v926 = 4 * (_QWORD)v1003;
      while (1)
      {
        v147 = *(int *)(*((_QWORD *)v3 + 11) + 4 * v145);
        if (v986 && !*(_BYTE *)(*((_QWORD *)v3 + 387) + v147))
          goto LABEL_288;
        v148 = (int *)(v979 + 4 * (int)v147 * v144);
        v149 = (int *)(*((_QWORD *)v3 + 17) + 12 * v147);
        v151 = *v149;
        v150 = v149[1];
        v152 = v149[2];
        v153 = (char *)__p;
        v154 = (int *)(*((_QWORD *)v3 + 20) + 12 * v147);
        v155 = v154[2];
        if ((_DWORD)v155 != -1)
        {
          v157 = *v154;
          v156 = v154[1];
          if (!v986)
            break;
          v158 = *((_QWORD *)v1009 + 387);
          if (*(_BYTE *)(v158 + v151))
          {
            if (*(_BYTE *)(v158 + v150)
              && *(_BYTE *)(v158 + v152)
              && *(_BYTE *)(v158 + v157)
              && *(_BYTE *)(v158 + v156)
              && *(_BYTE *)(v158 + v155))
            {
              break;
            }
          }
        }
        v3 = v1009;
        if ((_DWORD)v152 != -1)
        {
          if (!v986
            || (v178 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v178 + v151))
            && *(_BYTE *)(v178 + v150)
            && *(_BYTE *)(v178 + v152))
          {
            v956 = (char *)__p;
            v179 = (int *)(v979 + 4 * (int)v151 * v973);
            v180 = (int *)(v979 + 4 * (int)v150 * v144);
            v181 = (int *)(v979 + 4 * (int)v152 * v973);
            v182 = v150;
            v183 = v147;
            sub_23CCAE5A4(v179, v180, v181, v973, (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v151), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v150), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v152), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v147), v1044);
            v967 = v145;
            if (v973 == 2)
            {
              sub_23CCAECA0((unint64_t)v179, v180, v181, (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * v182), (int *)(*((_QWORD *)v1009 + 23) + 12 * v183), (int *)v1020);
              v184 = v1020;
              v2 = v1000;
              v185 = v1003;
LABEL_213:
              v196 = 0;
              v197 = __p;
              v198 = v1044;
              v199 = v1022;
              v200 = (int *)v1018;
              v201 = (int *)v1016;
              v202 = (int *)v1014;
              v203 = (int *)v1012;
              do
              {
                v204 = v180[(_QWORD)v196] + v179[(_QWORD)v196] - v181[(_QWORD)v196];
                v197[(_QWORD)v196] = v204;
                v205 = v198[(_QWORD)v196];
                v41 = __OFADD__(v205, v204);
                v206 = v205 + v204;
                if (v206 < 0 != v41)
                  ++v206;
                v199[(_QWORD)v196] = v206 >> 1;
                v200[(_QWORD)v196] = v148[(_QWORD)v196] - v197[(_QWORD)v196];
                v201[(_QWORD)v196] = v148[(_QWORD)v196] - v198[(_QWORD)v196];
                v202[(_QWORD)v196] = v148[(_QWORD)v196] - v199[(_QWORD)v196];
                v203[(_QWORD)v196] = v148[(_QWORD)v196] - v184[(_QWORD)v196];
                v196 = (char *)v196 + 1;
              }
              while (v185 != v196);
              if (*(_BYTE *)(v2 + 24))
              {
LABEL_218:
                v207 = *(unsigned __int8 *)(v2 + 8);
                v208 = v1041;
                v209 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1041 + 2048) >> 10) & 0x7CLL));
                v951 = v209;
                v934 = v1042;
                v210 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1042 + 2048) >> 10) & 0x7CLL));
                v942 = v210 + v209 + sub_23CCD36C8(v200, (int)v185, v207, (unsigned __int16 **)&v1064);
                v211 = *(_DWORD *)((char *)&unk_23CCD46E0
                                 + (((unint64_t)(67584 - v208) >> 10) & 0x3FFFFFFFFFFFFCLL));
                v920 = v211;
                v212 = v1043;
                LODWORD(v208) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1043 + 2048) >> 10) & 0x7CLL));
                v913 = v208 + sub_23CCD36C8(v201, v973, v207, (unsigned __int16 **)&v1064) + v211;
                v213 = *(_DWORD *)((char *)&unk_23CCD46E0
                                 + (((unint64_t)(67584 - v934) >> 10) & 0x3FFFFFFFFFFFFCLL));
                LODWORD(v208) = sub_23CCD36C8(v202, (int)v1003, v207, (unsigned __int16 **)&v1064);
                LODWORD(v212) = *(_DWORD *)((char *)&unk_23CCD46E0
                                          + (((unint64_t)(67584 - v212) >> 10) & 0x3FFFFFFFFFFFFCLL));
                v214 = sub_23CCD36C8(v203, v973, v207, (unsigned __int16 **)&v1064);
                v215 = v913;
                v216 = v942;
                v217 = v213 + v951 + v208;
                v2 = v1000;
                v218 = v212 + v920 + v214;
                v3 = v1009;
                goto LABEL_274;
              }
              if (v973 >= 1)
              {
                v246 = *v200;
                if (*v200 < 0)
                  v246 = -v246;
                v216 = -((_DWORD)v185 * __clz(v246 + 1));
                v247 = *v201;
                if (*v201 < 0)
                  v247 = -v247;
                v215 = -(v973 * __clz(v247 + 1));
                v248 = *v202;
                if (*v202 < 0)
                  v248 = -v248;
                v217 = -((_DWORD)v185 * __clz(v248 + 1));
                v249 = *v203;
                if (*v203 < 0)
                  v249 = -v249;
                v218 = -(v973 * __clz(v249 + 1));
LABEL_274:
                v153 = v956;
                if (v216 <= v215 && v216 <= v217 && v216 <= v218)
                {
                  v254 = 0;
                  v258 = 0;
                  goto LABEL_278;
                }
                if (v215 <= v217 && v215 <= v218)
                {
                  v254 = 0;
                  v258 = 1;
                  v153 = (char *)v1044;
                  goto LABEL_284;
                }
                if (v217 <= v218)
                {
                  v258 = 0;
                  v254 = 1;
                  v153 = (char *)v1022;
LABEL_278:
                  v256 = 1;
                }
                else
                {
                  v254 = 1;
                  v153 = (char *)v1020;
                  v258 = 1;
LABEL_284:
                  v256 = 2;
                }
                v187 = v973;
                sub_23CCC4CE0(v146, v258, &v1041);
                v257 = (int *)&v1041;
LABEL_286:
                sub_23CCC4CE0(v146, v254, (_WORD *)v257 + v256);
                v189 = 2;
                goto LABEL_287;
              }
              v216 = 0;
              v215 = 0;
              v217 = 0;
            }
            else
            {
              v185 = v1003;
              if ((int)v1003 >= 1)
              {
                v195 = 0;
                v184 = v1020;
                v2 = v1000;
                do
                {
                  v184[v195 / 4] = v180[v195 / 4] + v179[v195 / 4] - v181[v195 / 4];
                  v195 += 4;
                }
                while (v926 != v195);
                goto LABEL_213;
              }
              v2 = v1000;
              v217 = *(unsigned __int8 *)(v1000 + 24);
              if (*(_BYTE *)(v1000 + 24))
              {
                v200 = (int *)v1018;
                v201 = (int *)v1016;
                v202 = (int *)v1014;
                v203 = (int *)v1012;
                goto LABEL_218;
              }
              v216 = 0;
              v215 = 0;
            }
            v218 = 0;
            goto LABEL_274;
          }
        }
        if ((_DWORD)v150 == -1
          || v986 && ((v186 = *((_QWORD *)v1009 + 387), !*(_BYTE *)(v186 + v151)) || !*(_BYTE *)(v186 + v150)))
        {
          if ((_DWORD)v151 == -1 || v986 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v151))
          {
            if (v144 >= 1)
            {
              v190 = __p;
              bzero(__p, v926);
              v191 = 0;
              do
              {
                v192 = *(_DWORD *)(*v995 + 4 * (_QWORD)v191);
                if (v192 >= 1)
                {
                  v193 = 0;
                  v194 = v148[(_QWORD)v191] - v190[(_QWORD)v191];
                  do
                  {
                    LOWORD(v1038) = 0x8000;
                    sub_23CCC4CE0(v146, (v194 >> v193++) & 1, &v1038);
                  }
                  while (v192 != v193);
                }
                v191 = (char *)v191 + 1;
                v144 = (int)v1003;
              }
              while (v191 != v1003);
            }
            goto LABEL_288;
          }
          v967 = v145;
          v187 = v973;
          if (v973 >= 1)
          {
            v188 = 0;
            do
            {
              *(_DWORD *)&v153[v188] = *(_DWORD *)(v979 + 4 * (int)v151 * v144 + v188);
              v188 += 4;
            }
            while (v926 != v188);
          }
          v189 = 0;
          goto LABEL_287;
        }
        v967 = v145;
        if (v144 == 2)
        {
          v1038 = 0;
          sub_23CCAE844((int *)(v979 + 8 * v151), (int *)(v979 + 8 * v150), v148, (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v150), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v147), (int *)__p, &v1038);
          sub_23CCC4CE0(v146, v1038 != 0, &v1037);
        }
        else if (v144 >= 1)
        {
          v224 = 0;
          v187 = v973;
          v225 = v979 + 4 * (int)v151 * v144;
          do
          {
            v226 = *(_DWORD *)(v225 + v224);
            v227 = *(_DWORD *)(v979 + 4 * (int)v150 * v973 + v224);
            v41 = __OFADD__(v227, v226);
            v228 = v227 + v226;
            if (v228 < 0 != v41)
              ++v228;
            *(_DWORD *)&v153[v224] = v228 >> 1;
            v224 += 4;
          }
          while (v926 != v224);
          v189 = 1;
          goto LABEL_287;
        }
        v189 = 1;
        v187 = v973;
LABEL_287:
        sub_23CCC4E54((uint64_t)v3, (uint64_t)v148, (uint64_t)v153, v187, v995, *(_BYTE *)(v2 + 8), &v1050[15 * v189 - 2]);
        v144 = (int)v1003;
        v145 = v967;
LABEL_288:
        if (++v145 == v963)
        {
LABEL_1315:
          if (v1012)
          {
            v1013 = v1012;
            operator delete(v1012);
          }
          if (v1014)
          {
            v1015 = v1014;
            operator delete(v1014);
          }
          if (v1016)
          {
            v1017 = v1016;
            operator delete(v1016);
          }
          if (v1018)
          {
            v1019 = v1018;
            operator delete(v1018);
          }
          if (v1020)
          {
            v1021 = v1020;
            operator delete(v1020);
          }
          if (v1022)
          {
            v1023 = v1022;
            operator delete(v1022);
          }
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          v863 = 360;
          do
          {
            v864 = &v1050[v863 / 8 - 2];
            v865 = *(void **)((char *)&__p + v863);
            if (v865)
            {
              *(v864 - 2) = v865;
              operator delete(v865);
            }
            v866 = *(v864 - 6);
            if (v866)
            {
              v1045[v863 / 8] = v866;
              operator delete(v866);
            }
            v867 = &v1050[v863 / 8 - 2];
            v868 = *(void **)((char *)&v1036 + v863);
            if (v868)
            {
              *(v867 - 8) = v868;
              operator delete(v868);
            }
            v869 = *(v867 - 12);
            if (v869)
            {
              *(_QWORD *)((char *)&v1032 + v863) = v869;
              operator delete(v869);
            }
            v870 = *(v864 - 15);
            if (v870)
            {
              *(_QWORD *)((char *)&v1026 + v863) = v870;
              operator delete(v870);
            }
            v863 -= 120;
          }
          while (v863);
          return 0;
        }
      }
      v933 = v157;
      v941 = v156;
      v967 = v145;
      v159 = (int *)(v979 + 4 * (int)v150 * v144);
      v160 = (int *)(v979 + 4 * (int)v152 * v973);
      v919 = (int *)(v979 + 4 * (int)v151 * v973);
      v904 = v150;
      v950 = v147;
      v955 = (char *)__p;
      sub_23CCAE5A4(v919, v159, v160, v973, (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v151), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v150), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v152), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v147), __p);
      v161 = (int *)(v979 + 4 * v933 * (int)v1003);
      v162 = (int *)(v979 + 4 * v941 * v973);
      v163 = (int *)(v979 + 4 * (int)v155 * (int)v1003);
      sub_23CCAE5A4(v161, v162, v163, (int)v1003, (int *)(*((_QWORD *)v1009 + 23) + 12 * v933), (int *)(*((_QWORD *)v1009 + 23) + 12 * v941), (int *)(*((_QWORD *)v1009 + 23) + 12 * (int)v155), (int *)(*((_QWORD *)v1009 + 23) + 12 * v950), v1044);
      v164 = v1003;
      if (v973 < 1)
      {
        v2 = v1000;
        v219 = *(unsigned __int8 *)(v1000 + 24);
        if (!*(_BYTE *)(v1000 + 24))
        {
          v243 = 0;
          v244 = 0;
          v245 = 0;
          v187 = v973;
          goto LABEL_258;
        }
        v220 = (int *)v1018;
        v221 = (int *)v1016;
        v222 = (int *)v1014;
        v223 = (int *)v1012;
      }
      else
      {
        v165 = 0;
        v166 = (int *)__p;
        v167 = v1044;
        v168 = v1022;
        do
        {
          v169 = v166[v165 / 4];
          v170 = v167[v165 / 4];
          v41 = __OFADD__(v170, v169);
          v171 = v170 + v169;
          if (v171 < 0 != v41)
            ++v171;
          v168[v165 / 4] = v171 >> 1;
          v165 += 4;
        }
        while (v926 != v165);
        if ((_DWORD)v1003 == 2)
        {
          sub_23CCAECA0((unint64_t)v919, v159, v160, (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * v904), (int *)(*((_QWORD *)v1009 + 23) + 12 * v950), v166);
          sub_23CCAECA0((unint64_t)v161, v162, v163, (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * v933), (_DWORD *)(*((_QWORD *)v1009 + 23) + 12 * v941), (int *)(*((_QWORD *)v1009 + 23) + 12 * v950), (int *)v1044);
          v166 = (int *)__p;
          v167 = v1044;
          v172 = v1020;
          v173 = *(_DWORD *)v1044 + *(_DWORD *)__p;
          if (v173 < 0 != __OFADD__(*(_DWORD *)v1044, *(_DWORD *)__p))
            ++v173;
          *(_DWORD *)v1020 = v173 >> 1;
          v174 = v166[1];
          v175 = v167[1];
          v41 = __OFADD__(v175, v174);
          v176 = v175 + v174;
          if (v176 < 0 != v41)
            ++v176;
          v172[1] = v176 >> 1;
          v168 = v1022;
          v164 = v1003;
          v177 = v979 + 4 * (int)v151 * v973;
        }
        else
        {
          v229 = 0;
          v172 = v1020;
          v177 = v979 + 4 * (int)v151 * v973;
          do
          {
            v230 = v919[v229 / 4];
            v231 = v161[v229 / 4];
            v41 = __OFADD__(v231, v230);
            v232 = v231 + v230;
            if (v232 < 0 != v41)
              ++v232;
            v233 = 1431655766
                 * ((v232 >> 1) - (v160[v229 / 4] + v163[v229 / 4]) + 2 * (v162[v229 / 4] + v159[v229 / 4]));
            v172[v229 / 4] = HIDWORD(v233) + (v233 >> 63);
            v229 += 4;
          }
          while (v926 != v229);
        }
        v234 = 0;
        v220 = (int *)v1018;
        v221 = (int *)v1016;
        v222 = (int *)v1014;
        v223 = (int *)v1012;
        do
        {
          v166[(_QWORD)v234] = v159[(_QWORD)v234] + *(_DWORD *)(v177 + 4 * (_QWORD)v234) - v160[(_QWORD)v234];
          v167[(_QWORD)v234] = v162[(_QWORD)v234] + v161[(_QWORD)v234] - v163[(_QWORD)v234];
          v220[(_QWORD)v234] = v148[(_QWORD)v234] - v166[(_QWORD)v234];
          v221[(_QWORD)v234] = v148[(_QWORD)v234] - v167[(_QWORD)v234];
          v222[(_QWORD)v234] = v148[(_QWORD)v234] - v168[(_QWORD)v234];
          v223[(_QWORD)v234] = v148[(_QWORD)v234] - v172[(_QWORD)v234];
          v234 = (char *)v234 + 1;
        }
        while (v164 != v234);
        v2 = v1000;
        if (!*(_BYTE *)(v1000 + 24))
        {
          v250 = *v220;
          if (*v220 < 0)
            v250 = -v250;
          v243 = -((_DWORD)v164 * __clz(v250 + 1));
          v251 = *v221;
          if (*v221 < 0)
            v251 = -v251;
          v244 = -(v973 * __clz(v251 + 1));
          v252 = *v222;
          v187 = v973;
          if (v252 < 0)
            v252 = -v252;
          v219 = -((_DWORD)v164 * __clz(v252 + 1));
          v253 = *v223;
          if (*v223 < 0)
            v253 = -v253;
          v245 = -(v973 * __clz(v253 + 1));
LABEL_258:
          v3 = v1009;
          v153 = v955;
          if (v243 <= v244 && v243 <= v219 && v243 <= v245)
          {
            v254 = 0;
            v255 = 0;
LABEL_269:
            v256 = 1;
            goto LABEL_270;
          }
          if (v244 > v219 || v244 > v245)
          {
            if (v219 <= v245)
            {
              v255 = 0;
              v254 = 1;
              v153 = (char *)v1022;
              goto LABEL_269;
            }
            v254 = 1;
            v153 = (char *)v1020;
            v255 = 1;
          }
          else
          {
            v254 = 0;
            v255 = 1;
            v153 = (char *)v1044;
          }
          v256 = 2;
LABEL_270:
          sub_23CCC4CE0(v146, v255, &v1010);
          v257 = &v1010;
          goto LABEL_286;
        }
      }
      v235 = *(unsigned __int8 *)(v2 + 8);
      v236 = (unsigned __int16)v1010;
      v237 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1010 + 2048) >> 10) & 0x7CLL));
      v952 = v237;
      v935 = HIWORD(v1010);
      v238 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((HIWORD(v1010) + 2048) >> 10) & 0x7CLL));
      v943 = v238 + v237 + sub_23CCD36C8(v220, (int)v164, v235, (unsigned __int16 **)&v1064);
      v239 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v236) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v240 = v1011;
      LODWORD(v236) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1011 + 2048) >> 10) & 0x7CLL));
      v914 = v236 + sub_23CCD36C8(v221, v973, v235, (unsigned __int16 **)&v1064) + v239;
      LODWORD(v935) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v935) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v241 = v222;
      v187 = v973;
      LODWORD(v236) = sub_23CCD36C8(v241, (int)v1003, v235, (unsigned __int16 **)&v1064);
      LODWORD(v240) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v240) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v242 = sub_23CCD36C8(v223, v973, v235, (unsigned __int16 **)&v1064);
      v243 = v943;
      v244 = v914;
      v219 = v935 + v952 + v236;
      v2 = v1000;
      v245 = v240 + v239 + v242;
      goto LABEL_258;
    case 5:
      v343 = *v3;
      v344 = v3[780];
      v1006 = (char *)*((_QWORD *)v3 + 384);
      v345 = *((_QWORD *)v3 + 23);
      v346 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      __p = 0;
      v1047 = 0;
      v1048 = 0;
      sub_23CCBD068((_QWORD *)v3 + 23, (_QWORD *)v3 + 29, (_QWORD *)v3 + 26, (uint64_t *)v3 + 26, -1431655765 * ((unint64_t)(*((_QWORD *)v3 + 24) - v345) >> 2), (uint64_t *)&__p, v346);
      *(_QWORD *)&v1056 = 0;
      v1054 = 0u;
      *(_OWORD *)v1055 = 0u;
      *(_OWORD *)v1052 = 0u;
      *(_OWORD *)v1053 = 0u;
      *(_OWORD *)v1050 = 0u;
      v1051 = 0u;
      __b = 0u;
      sub_23CCB7FFC((uint64_t)&__b, v344);
      LOWORD(v1020) = 0x8000;
      if ((int)v343 < 1)
        goto LABEL_477;
      v347 = 0;
      v348 = *(_DWORD *)(v2 + 16);
      v982 = (uint64_t)(v3 + 890);
      v989 = v3 + 750;
      v998 = 4 * v343;
      while (1)
      {
        v349 = *(int *)(*((_QWORD *)v3 + 11) + v347);
        if (!v348 || *(_BYTE *)(*((_QWORD *)v3 + 387) + v349))
          break;
LABEL_476:
        v347 += 4;
        if (v998 == v347)
        {
LABEL_477:
          if (v1055[0])
          {
            v1055[1] = v1055[0];
            operator delete(v1055[0]);
          }
          if (v1053[1])
          {
            *(void **)&v1054 = v1053[1];
            operator delete(v1053[1]);
          }
          if (v1052[0])
          {
            v1052[1] = v1052[0];
            operator delete(v1052[0]);
          }
          if (v1050[1])
          {
            *(void **)&v1051 = v1050[1];
            operator delete(v1050[1]);
          }
          if ((_QWORD)__b)
          {
            *((_QWORD *)&__b + 1) = __b;
            operator delete((void *)__b);
          }
LABEL_1284:
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          return 0;
        }
      }
      v350 = &v1006[4 * (int)v349 * v344];
      v351 = *(_DWORD *)v350 - v346;
      v352 = *((_DWORD *)v350 + 1) - v346;
      if (v351 >= 0)
        v353 = v351;
      else
        v353 = -v351;
      if (v352 >= 0)
        v354 = v352;
      else
        v354 = -v352;
      v355 = v346 - v353;
      v356 = v354 - v346;
      if (v351 >= 0)
        v356 = v346 - v354;
      v357 = v353 - v346;
      if (v352 >= 0)
        v357 = v355;
      v358 = v3;
      v359 = v355 - v354;
      LODWORD(v1045[0]) = v355 - v354;
      if (v355 - v354 < 0)
        v360 = v356;
      else
        v360 = v351;
      if (v355 - v354 < 0)
        v361 = v357;
      else
        v361 = v352;
      v1044 = (void *)__PAIR64__(v361, v360);
      v362 = 3 * v349;
      v363 = (int *)((char *)__p + 12 * v349);
      v364 = *v363;
      v365 = *v363;
      LODWORD(v1022) = *v363;
      v366 = v363[1];
      HIDWORD(v1022) = v366;
      v367 = v363[2];
      LODWORD(v1023) = v367;
      v368 = *(int *)(*((_QWORD *)v358 + 17) + 4 * v362);
      if ((_DWORD)v368 == -1 || v348 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v368))
      {
        v378 = v365 * (uint64_t)v360 + v366 * (uint64_t)v361 + v367 * (uint64_t)v359;
        if ((v378 & 0x8000000000000000) != 0)
        {
          v364 = -v364;
          v366 = -v366;
          v367 = -v367;
          v1022 = (void *)__PAIR64__(v366, v364);
          LODWORD(v1023) = v367;
        }
        sub_23CCC4CE0(v982, v378 >> 63, &v1020);
      }
      else
      {
        v369 = &v1006[4 * (int)v368 * v344];
        v370 = *(_DWORD *)v369 - v346;
        v371 = *((_DWORD *)v369 + 1) - v346;
        if (v370 >= 0)
          v372 = v370;
        else
          v372 = -v370;
        if (v371 >= 0)
          v373 = v371;
        else
          v373 = -v371;
        v374 = v346 - v372;
        v375 = v373 - v346;
        if (v370 >= 0)
          v375 = v346 - v373;
        v376 = v372 - v346;
        if (v371 >= 0)
          v376 = v374;
        v377 = v374 - v373;
        if (v377 < 0)
        {
          v370 = v375;
          v371 = v376;
        }
        if (v367 * (uint64_t)v377 + v365 * (uint64_t)v370 + v366 * (uint64_t)v371 < 0)
        {
          v364 = -v364;
          v366 = -v366;
          v367 = -v367;
          v1022 = (void *)__PAIR64__(v366, v364);
          LODWORD(v1023) = v367;
        }
      }
      if (v364 >= 0)
        v379 = v364;
      else
        v379 = -v364;
      if (v366 >= 0)
        v380 = v366;
      else
        v380 = -v366;
      if (v367 >= 0)
        v381 = v367;
      else
        v381 = -v367;
      if (v379 >= v380 && v379 >= v381)
      {
        v383 = &v1022;
        v384 = &v1044;
        v361 = v360;
        v366 = v364;
        v385 = v1000;
      }
      else
      {
        v383 = (void **)((char *)&v1022 + 4);
        v384 = (void **)((char *)&v1044 + 4);
        v385 = v1000;
        if (v380 < v381)
        {
          if ((v367 & 0x80000000) == 0)
          {
LABEL_462:
            v386 = (int)v1044;
            v387 = HIDWORD(v1044);
            if (v359 < 0)
            {
              if (SHIDWORD(v1044) >= 0)
                v389 = HIDWORD(v1044);
              else
                v389 = -HIDWORD(v1044);
              v390 = v389 - v346;
              v388 = v346 - v389;
              if ((int)v1044 < 0)
              {
                v388 = v390;
                v386 = -(int)v1044;
              }
              if ((HIDWORD(v1044) & 0x80000000) != 0)
                v387 = v386 - v346;
              else
                v387 = v346 - v386;
            }
            else
            {
              v388 = (int)v1044;
            }
            v3 = v1009;
            v1044 = (void *)__PAIR64__(v387, v388);
            sub_23CCC4E54((uint64_t)v1009, (uint64_t)&v1044, (uint64_t)&v1022, v344, v989, *(_BYTE *)(v385 + 8), &__b);
            goto LABEL_476;
          }
LABEL_466:
          LODWORD(v1023) = -v367;
          v359 = -v359;
          LODWORD(v1045[0]) = v359;
          goto LABEL_462;
        }
      }
      *(_DWORD *)v384 = v359;
      LODWORD(v1045[0]) = v361;
      *(_DWORD *)v383 = v367;
      v359 = v361;
      v367 = v366;
      LODWORD(v1023) = v366;
      if ((v366 & 0x80000000) == 0)
        goto LABEL_462;
      goto LABEL_466;
    case 6:
      v391 = *v3;
      v392 = v3[780];
      v976 = *((_QWORD *)v3 + 384);
      v393 = *((_QWORD *)v3 + 23);
      v394 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      __p = 0;
      v1047 = 0;
      v1048 = 0;
      sub_23CCBD068((_QWORD *)v3 + 23, (_QWORD *)v3 + 29, (_QWORD *)v3 + 26, (uint64_t *)v3 + 26, -1431655765 * ((unint64_t)(*((_QWORD *)v3 + 24) - v393) >> 2), (uint64_t *)&__p, v394);
      v395 = 0;
      v1071 = 0;
      v970 = v3 + 750;
      v1069 = 0u;
      v1070 = 0u;
      v1067 = 0u;
      v1068 = 0u;
      v1065 = 0u;
      v1066 = 0u;
      v1063 = 0u;
      v1064 = 0u;
      v1061 = 0u;
      v1062 = 0u;
      v1059 = 0u;
      v1060 = 0u;
      v1057 = 0u;
      v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      v1054 = 0u;
      v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1050[v395 - 2], v392);
        v395 += 15;
      }
      while (v395 != 45);
      memset_pattern16(&v1012, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1041, &unk_23CCD46A0, 6uLL);
      v1040 = 0x8000;
      v1039 = 0x8000;
      v396 = v976;
      if ((int)v391 <= 0)
        goto LABEL_1272;
      v397 = 0;
      v398 = *(_DWORD *)(v2 + 16);
      v965 = (uint64_t)(v3 + 890);
      v983 = 4 * v391;
      v999 = v392;
      v953 = v398;
      break;
    default:
      return 5;
  }
  while (1)
  {
    v399 = *(int *)(*((_QWORD *)v3 + 11) + v397);
    if (v398 && !*(_BYTE *)(*((_QWORD *)v3 + 387) + v399))
      goto LABEL_1254;
    v400 = (_DWORD *)(v396 + 4 * (int)v399 * v392);
    v401 = *v400 - v394;
    v402 = v400[1] - v394;
    if (v401 >= 0)
      v403 = v401;
    else
      v403 = -v401;
    if (v402 >= 0)
      v404 = v402;
    else
      v404 = -v402;
    v405 = v394 - v403;
    v406 = v404 - v394;
    if (v401 >= 0)
      v406 = v394 - v404;
    v407 = v403 - v394;
    if (v402 >= 0)
      v407 = v405;
    v408 = v405 - v404;
    LODWORD(v1045[0]) = v405 - v404;
    if (v405 - v404 < 0)
      v409 = v406;
    else
      v409 = v401;
    if (v405 - v404 < 0)
      v410 = v407;
    else
      v410 = v402;
    v1044 = (void *)__PAIR64__(v410, v409);
    v411 = 3 * v399;
    v412 = (int *)((char *)__p + 12 * v399);
    v413 = v3;
    v414 = *v412;
    v415 = *v412;
    LODWORD(v1022) = *v412;
    v416 = v412[1];
    HIDWORD(v1022) = v416;
    v417 = v412[2];
    LODWORD(v1023) = v417;
    v418 = (int *)(*((_QWORD *)v413 + 17) + 4 * v411);
    v420 = *v418;
    v419 = v418[1];
    v421 = v418[2];
    v422 = (int *)(*((_QWORD *)v413 + 20) + 4 * v411);
    v423 = v422[2];
    if ((_DWORD)v423 != -1)
    {
      v425 = *v422;
      v424 = v422[1];
      if (!v398
        || (v426 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v426 + v420))
        && *(_BYTE *)(v426 + v419)
        && *(_BYTE *)(v426 + v421)
        && *(_BYTE *)(v426 + v425)
        && *(_BYTE *)(v426 + v424)
        && *(_BYTE *)(v426 + v423))
      {
        v427 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        v428 = *v427 - v394;
        v429 = v427[1] - v394;
        if (v428 >= 0)
          v430 = *v427 - v394;
        else
          v430 = v394 - *v427;
        if (v429 >= 0)
          v431 = v427[1] - v394;
        else
          v431 = v394 - v427[1];
        v432 = v394 - v430;
        v936 = v394 - v430 - v431;
        if (v936 < 0)
        {
          v433 = v431 - v394;
          v434 = v394 - v431;
          if (v428 >= 0)
            v428 = v434;
          else
            v428 = v433;
          v435 = v430 - v394;
          if (v429 >= 0)
            v429 = v432;
          else
            v429 = v435;
        }
        v436 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        v437 = *v436 - v394;
        v438 = v436[1] - v394;
        if (v437 >= 0)
          v439 = *v436 - v394;
        else
          v439 = v394 - *v436;
        if (v438 >= 0)
          v440 = v438;
        else
          v440 = -v438;
        v441 = v394 - v439;
        v442 = v394 - v439 - v440;
        v990 = v397;
        if (v442 < 0)
        {
          v443 = v440 - v394;
          v444 = v394 - v440;
          if (v437 >= 0)
            v437 = v444;
          else
            v437 = v443;
          v445 = v439 - v394;
          if (v438 >= 0)
            v438 = v441;
          else
            v438 = v445;
        }
        v446 = (_DWORD *)(v396 + 4 * (int)v421 * v392);
        v447 = *v446 - v394;
        v448 = v446[1] - v394;
        if (v447 >= 0)
          v449 = *v446 - v394;
        else
          v449 = v394 - *v446;
        if (v448 >= 0)
          v450 = v448;
        else
          v450 = -v448;
        v451 = v394 - v449;
        v452 = v394 - v449 - v450;
        v1007 = v410;
        v927 = v442;
        if (v452 < 0)
        {
          v453 = v450 - v394;
          v454 = v394 - v450;
          if (v447 >= 0)
            v447 = v454;
          else
            v447 = v453;
          v455 = v449 - v394;
          if (v448 >= 0)
            v448 = v451;
          else
            v448 = v455;
        }
        v456 = (_DWORD *)(v396 + 4 * (int)v425 * v392);
        v457 = *v456 - v394;
        v458 = v456[1] - v394;
        if (v457 >= 0)
          v459 = *v456 - v394;
        else
          v459 = v394 - *v456;
        if (v458 >= 0)
          v460 = v458;
        else
          v460 = -v458;
        v461 = v394 - v459;
        v945 = v394 - v459 - v460;
        if (v945 < 0)
        {
          v462 = v460 - v394;
          v463 = v394 - v460;
          if (v457 >= 0)
            v457 = v463;
          else
            v457 = v462;
          v464 = v459 - v394;
          if (v458 >= 0)
            v458 = v461;
          else
            v458 = v464;
        }
        v465 = (_DWORD *)(v396 + 4 * (int)v424 * v392);
        v466 = v465[1];
        v467 = *v465 - v394;
        v468 = v466 - v394;
        if (v467 >= 0)
          v469 = v467;
        else
          v469 = -v467;
        if (v468 >= 0)
          v470 = v468;
        else
          v470 = -v468;
        v471 = v394 - v469;
        v958 = v394 - v469 - v470;
        if (v958 < 0)
        {
          v472 = v470 - v394;
          v473 = v394 - v470;
          if (v467 >= 0)
            v467 = v473;
          else
            v467 = v472;
          v474 = v469 - v394;
          if (v468 >= 0)
            v468 = v471;
          else
            v468 = v474;
        }
        v475 = (_DWORD *)(v396 + 4 * (int)v423 * v392);
        v476 = *v475 - v394;
        v477 = v475[1] - v394;
        if (v476 >= 0)
          v478 = *v475 - v394;
        else
          v478 = v394 - *v475;
        if (v477 >= 0)
          v479 = v477;
        else
          v479 = -v477;
        v480 = v394 - v478;
        v481 = v394 - v478 - v479;
        v921 = v452;
        if (v481 < 0)
        {
          v482 = v479 - v394;
          v483 = v394 - v479;
          if (v476 >= 0)
            v476 = v483;
          else
            v476 = v482;
          v484 = v478 - v394;
          if (v477 >= 0)
            v477 = v480;
          else
            v477 = v484;
        }
        v485 = v417 * (uint64_t)v936 + v415 * (uint64_t)v428 + v416 * (uint64_t)v429;
        if (v485 >= 0)
          v486 = v414;
        else
          v486 = -v414;
        if (v485 >= 0)
          v487 = v416;
        else
          v487 = -v416;
        if (v485 >= 0)
          v488 = v417;
        else
          v488 = -v417;
        v1010 = v486;
        v1038 = v487;
        v489 = v437 + v428 - v447;
        v490 = v438 + v429 - v448;
        v1037 = v489;
        v1036 = v490;
        v491 = v467 + v457 - v476;
        v492 = v468 + v458 - v477;
        v1035 = v491;
        v1034 = v492;
        v493 = v457 + v428;
        v15 = (v457 + v428 < 0) ^ __OFADD__(v457, v428);
        v494 = v945 + v936;
        if (v15)
          ++v493;
        v495 = 1431655766 * ((v493 >> 1) + 2 * (v467 + v437) - (v447 + v476));
        v496 = HIDWORD(v495) + (v495 >> 63);
        v497 = ((v458 + v429) / 2 + 2 * (v468 + v438) - (v448 + v477)) / 3;
        v1033 = v496;
        v1032 = v497;
        if (v494 >= 0)
          v498 = v945 + v936;
        else
          v498 = v494 + 1;
        v1031 = v409;
        v499 = v1007;
        v1030 = v1007;
        v1029 = v409;
        v1028 = v1007;
        v1027 = v409;
        v1026 = v1007;
        v1025 = v409;
        v1024 = v1007;
        if (v414 >= 0)
          v500 = v414;
        else
          v500 = -v414;
        if (v416 >= 0)
          v501 = v416;
        else
          v501 = -v416;
        if (v417 >= 0)
          v502 = v417;
        else
          v502 = -v417;
        if (v500 >= v501 && v500 >= v502)
        {
          v503 = &v1010;
          v504 = &v1031;
          v505 = v409;
          v506 = v927;
          v507 = v958;
          v508 = v481;
          goto LABEL_825;
        }
        v506 = v927;
        v507 = v958;
        v508 = v481;
        if (v501 >= v502)
        {
          v503 = &v1038;
          v504 = &v1030;
          v505 = v1007;
          v486 = v487;
LABEL_825:
          *v504 = v408;
          *v503 = v488;
          v636 = v1031;
          v635 = v1030;
          v488 = v486;
        }
        else
        {
          v635 = v1007;
          v636 = v409;
          v505 = v408;
        }
        if (v488 >= 0)
          v642 = v505;
        else
          v642 = -v505;
        if (v488 >= 0)
          v643 = v488;
        else
          v643 = -v488;
        if (v642 < 0)
        {
          if (v635 >= 0)
            v646 = v635;
          else
            v646 = -v635;
          v647 = v646 - v394;
          v648 = v394 - v646;
          if (v636 < 0)
            v648 = v647;
          v959 = v648;
          if (v636 >= 0)
            v649 = v636;
          else
            v649 = -v636;
          v644 = v1000;
          v645 = v921;
          if (v635 < 0)
            v635 = v649 - v394;
          else
            v635 = v394 - v649;
        }
        else
        {
          v959 = v636;
          v644 = v1000;
          v645 = v921;
        }
        v670 = v506 + v936 - v645;
        v1031 = v959;
        v1030 = v635;
        if (v489 >= 0)
          v671 = v489;
        else
          v671 = -v489;
        if (v490 >= 0)
          v672 = v490;
        else
          v672 = -v490;
        if (v670 >= 0)
          v673 = v506 + v936 - v645;
        else
          v673 = v645 - (v506 + v936);
        if (v671 >= v672 && v671 >= v673)
        {
          v674 = &v1037;
          v675 = &v1029;
          v673 = v671;
          v676 = v409;
          goto LABEL_930;
        }
        if (v672 >= v673)
        {
          v674 = &v1036;
          v675 = &v1028;
          v673 = v672;
          v676 = v1007;
          v489 = v490;
LABEL_930:
          *v675 = v408;
          *v674 = v670;
          v678 = v1029;
          v677 = v1028;
          v670 = v489;
        }
        else
        {
          v677 = v1007;
          v678 = v409;
          v676 = v408;
        }
        if (v670 >= 0)
          v679 = v676;
        else
          v679 = -v676;
        if (v679 < 0)
        {
          if (v677 >= 0)
            v681 = v677;
          else
            v681 = -v677;
          v682 = v681 - v394;
          v683 = v394 - v681;
          if (v678 >= 0)
            v680 = v683;
          else
            v680 = v682;
          if (v678 >= 0)
            v684 = v678;
          else
            v684 = -v678;
          if (v677 < 0)
            v677 = v684 - v394;
          else
            v677 = v394 - v684;
        }
        else
        {
          v680 = v678;
        }
        v685 = v507 + v945 - v508;
        v1029 = v680;
        v1028 = v677;
        if (v491 >= 0)
          v686 = v491;
        else
          v686 = -v491;
        if (v492 >= 0)
          v687 = v492;
        else
          v687 = -v492;
        if (v685 >= 0)
          v688 = v507 + v945 - v508;
        else
          v688 = v508 - (v507 + v945);
        if (v686 >= v687 && v686 >= v688)
        {
          v689 = &v1035;
          v690 = &v1027;
          v688 = v686;
          v691 = v409;
          goto LABEL_963;
        }
        if (v687 >= v688)
        {
          v689 = &v1034;
          v690 = &v1026;
          v688 = v687;
          v691 = v1007;
          v491 = v492;
LABEL_963:
          *v690 = v408;
          *v689 = v685;
          v693 = v1027;
          v692 = v1026;
          v685 = v491;
        }
        else
        {
          v692 = v1007;
          v693 = v409;
          v691 = v408;
        }
        if (v685 >= 0)
          v694 = v691;
        else
          v694 = -v691;
        if (v694 < 0)
        {
          if (v692 >= 0)
            v696 = v692;
          else
            v696 = -v692;
          v697 = v696 - v394;
          v698 = v394 - v696;
          if (v693 >= 0)
            v695 = v698;
          else
            v695 = v697;
          if (v693 >= 0)
            v699 = v693;
          else
            v699 = -v693;
          if (v692 < 0)
            v692 = v699 - v394;
          else
            v692 = v394 - v699;
        }
        else
        {
          v695 = v693;
        }
        v700 = 1431655766 * ((v498 >> 1) + 2 * (v507 + v506) - (v645 + v508));
        v701 = HIDWORD(v700) + (v700 >> 63);
        v1027 = v695;
        v1026 = v692;
        if (v496 >= 0)
          v702 = v496;
        else
          v702 = -v496;
        if (v497 >= 0)
          v703 = v497;
        else
          v703 = -v497;
        if (v701 >= 0)
          v704 = v701;
        else
          v704 = -v701;
        if (v702 >= v703 && v702 >= v704)
        {
          v705 = &v1033;
          v706 = &v1025;
          v704 = v702;
          goto LABEL_995;
        }
        if (v703 >= v704)
        {
          v705 = &v1032;
          v706 = &v1024;
          v704 = v703;
          v409 = v1007;
          v496 = v497;
LABEL_995:
          *v706 = v408;
          v408 = v409;
          *v705 = v701;
          v409 = v1025;
          v499 = v1024;
          v701 = v496;
        }
        if (v701 >= 0)
          v707 = v408;
        else
          v707 = -v408;
        if (v707 < 0)
        {
          if (v499 >= 0)
            v709 = v499;
          else
            v709 = -v499;
          v710 = v709 - v394;
          v711 = v394 - v709;
          if (v409 >= 0)
            v708 = v711;
          else
            v708 = v710;
          if (v409 >= 0)
            v712 = v409;
          else
            v712 = -v409;
          if (v499 < 0)
            v499 = v712 - v394;
          else
            v499 = v394 - v712;
        }
        else
        {
          v708 = v409;
        }
        v1025 = v708;
        v1024 = v499;
        v713 = v1010;
        v714 = v959 - v1010;
        LODWORD(v1020) = v959 - v1010;
        HIDWORD(v1020) = v635 - v1038;
        LODWORD(v1021) = v642 - v643;
        LODWORD(v1018) = v680 - v1037;
        HIDWORD(v1018) = v677 - v1036;
        LODWORD(v1019) = v679 - v673;
        v875 = v1034;
        LODWORD(v1016) = v695 - v1035;
        HIDWORD(v1016) = v692 - v1034;
        LODWORD(v1017) = v694 - v688;
        v873 = v1033;
        v871 = v1032;
        LODWORD(v1014) = v708 - v1033;
        HIDWORD(v1014) = v499 - v1032;
        LODWORD(v1015) = v707 - v704;
        v1008 = v499;
        v915 = v635;
        v908 = v642;
        v937 = v673;
        v901 = v679;
        v905 = v677;
        v898 = v680;
        v889 = v692;
        v891 = v688;
        v885 = v695;
        v887 = v694;
        v881 = v707;
        v883 = v704;
        v877 = v1035;
        v879 = v708;
        v946 = v1038;
        v928 = v1037;
        v922 = v1036;
        if (*(_BYTE *)(v644 + 24))
        {
          v715 = *(unsigned __int8 *)(v644 + 8);
          v895 = v1010;
          v716 = v1041;
          v717 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1041 + 2048) >> 10) & 0x7CLL));
          v893 = v717;
          v718 = v1042;
          v719 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1042 + 2048) >> 10) & 0x7CLL));
          v392 = v999;
          v720 = v719 + v717 + sub_23CCD36C8((int *)&v1020, v999, v715, (unsigned __int16 **)&v1064);
          v721 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v716) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v722 = v1043;
          LODWORD(v716) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1043 + 2048) >> 10) & 0x7CLL));
          v723 = v716 + sub_23CCD36C8((int *)&v1018, v999, v715, (unsigned __int16 **)&v1064) + v721;
          LODWORD(v718) = *(_DWORD *)((char *)&unk_23CCD46E0
                                    + (((unint64_t)(67584 - v718) >> 10) & 0x3FFFFFFFFFFFFCLL));
          LODWORD(v716) = sub_23CCD36C8((int *)&v1016, v999, v715, (unsigned __int16 **)&v1064);
          LODWORD(v722) = *(_DWORD *)((char *)&unk_23CCD46E0
                                    + (((unint64_t)(67584 - v722) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v724 = sub_23CCD36C8((int *)&v1014, v999, v715, (unsigned __int16 **)&v1064);
          v725 = v893 + v716;
          v713 = v895;
          v726 = v718 + v725;
          v727 = v722 + v721 + v724;
        }
        else
        {
          v392 = v999;
          if (v999 < 1)
          {
            v720 = 0;
            v723 = 0;
            v726 = 0;
            v727 = 0;
          }
          else
          {
            if (v714 < 0)
              v714 = v1010 - v959;
            v720 = -(v999 * __clz(v714 + 1));
            if (v680 - v1037 >= 0)
              v728 = v680 - v1037;
            else
              v728 = v1037 - v680;
            v723 = -(v999 * __clz(v728 + 1));
            if (v695 - v1035 >= 0)
              v729 = v695 - v1035;
            else
              v729 = v1035 - v695;
            v726 = -(v999 * __clz(v729 + 1));
            if (v708 - v1033 >= 0)
              v730 = v708 - v1033;
            else
              v730 = v1033 - v708;
            v727 = -(v999 * __clz(v730 + 1));
          }
        }
        v3 = v1009;
        v397 = v990;
        v398 = v953;
        if (v720 > v723 || v720 > v726 || v720 > v727)
        {
          if (v723 > v726 || v723 > v727)
          {
            v2 = v1000;
            if (v726 <= v727)
            {
              v732 = 0;
              v1022 = (void *)__PAIR64__(v875, v877);
              v731 = 1;
              LODWORD(v1023) = v891;
              v735 = v887;
              v734 = v889;
              v733 = 1;
              v736 = v885;
            }
            else
            {
              v1022 = (void *)__PAIR64__(v871, v873);
              v731 = 1;
              v734 = v1008;
              LODWORD(v1023) = v883;
              v736 = v879;
              v735 = v881;
              v732 = 1;
              v733 = 2;
            }
            LODWORD(v1044) = v736;
          }
          else
          {
            v731 = 0;
            v1022 = (void *)__PAIR64__(v922, v928);
            v732 = 1;
            LODWORD(v1023) = v937;
            v735 = v901;
            v734 = v905;
            v733 = 2;
            LODWORD(v1044) = v898;
            v2 = v1000;
          }
        }
        else
        {
          v731 = 0;
          v732 = 0;
          v1022 = (void *)__PAIR64__(v946, v713);
          LODWORD(v1023) = v643;
          v733 = 1;
          LODWORD(v1044) = v959;
          v2 = v1000;
          v734 = v915;
          v735 = v908;
        }
        HIDWORD(v1044) = v734;
        LODWORD(v1045[0]) = v735;
        sub_23CCC4CE0(v965, v732, &v1041);
        sub_23CCC4CE0(v965, v731, &v1041 + v733);
        v803 = 2;
        goto LABEL_1253;
      }
    }
    if ((_DWORD)v421 != -1)
    {
      if (!v398
        || (v509 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v509 + v420))
        && *(_BYTE *)(v509 + v419)
        && *(_BYTE *)(v509 + v421))
      {
        v510 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        v511 = v510[1];
        v512 = *v510 - v394;
        v513 = v511 - v394;
        if (v512 >= 0)
          v514 = v512;
        else
          v514 = -v512;
        if (v513 >= 0)
          v515 = v511 - v394;
        else
          v515 = v394 - v511;
        v516 = v394 - v514;
        v517 = v394 - v514 - v515;
        if (v517 < 0)
        {
          v518 = v515 - v394;
          v519 = v394 - v515;
          if (v512 >= 0)
            v512 = v519;
          else
            v512 = v518;
          v520 = v514 - v394;
          if (v513 >= 0)
            v513 = v516;
          else
            v513 = v520;
        }
        v521 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        v522 = *v521 - v394;
        v523 = v521[1] - v394;
        if (v522 >= 0)
          v524 = *v521 - v394;
        else
          v524 = v394 - *v521;
        if (v523 >= 0)
          v525 = v523;
        else
          v525 = -v523;
        v526 = v394 - v524;
        v527 = v394 - v524 - v525;
        if (v527 < 0)
        {
          v528 = v525 - v394;
          v529 = v394 - v525;
          if (v522 >= 0)
            v522 = v529;
          else
            v522 = v528;
          v530 = v524 - v394;
          if (v523 >= 0)
            v523 = v526;
          else
            v523 = v530;
        }
        v531 = (_DWORD *)(v396 + 4 * (int)v421 * v392);
        v532 = *v531 - v394;
        v533 = v531[1] - v394;
        if (v532 >= 0)
          v534 = *v531 - v394;
        else
          v534 = v394 - *v531;
        if (v533 >= 0)
          v535 = v531[1] - v394;
        else
          v535 = v394 - v531[1];
        v536 = v394 - v534;
        v537 = v394 - v534 - v535;
        if (v537 < 0)
        {
          v538 = v535 - v394;
          v539 = v394 - v535;
          if (v532 >= 0)
            v532 = v539;
          else
            v532 = v538;
          v540 = v534 - v394;
          if (v533 >= 0)
            v533 = v536;
          else
            v533 = v540;
        }
        v541 = v417 * (uint64_t)v517 + v415 * (uint64_t)v512 + v416 * (uint64_t)v513;
        if (v541 >= 0)
          v542 = v414;
        else
          v542 = -v414;
        if (v541 >= 0)
          v543 = v416;
        else
          v543 = -v416;
        if (v541 >= 0)
          v544 = v417;
        else
          v544 = -v417;
        v1010 = v542;
        v1038 = v543;
        v545 = v522 + v512;
        v546 = v523 + v513;
        v547 = v527 + v517;
        v548 = v522 + v512 - v532;
        v549 = v546 - v533;
        v1037 = v545 - v532;
        v1036 = v546 - v533;
        v550 = v545 + 1;
        v551 = v546 + 1;
        v552 = v547 + 1;
        if (v545 + 1 >= 0)
          v553 = v545 + 1;
        else
          v553 = v545 + 2;
        v554 = v553 >> 1;
        v555 = v546 + 2;
        if (v551 >= 0)
          v555 = v546 + 1;
        v556 = v555 >> 1;
        v1035 = v554;
        v1034 = v555 >> 1;
        v557 = (v532 + v550) / 3;
        v558 = (v533 + v551) / 3;
        v1033 = v557;
        v1032 = v558;
        if (v552 >= 0)
          v559 = v547 + 1;
        else
          v559 = v547 + 2;
        v1031 = v409;
        v1030 = v410;
        v1029 = v409;
        v1028 = v410;
        v1027 = v409;
        v1026 = v410;
        v1025 = v409;
        v1024 = v410;
        if (v414 >= 0)
          v560 = v414;
        else
          v560 = -v414;
        if (v416 >= 0)
          v561 = v416;
        else
          v561 = -v416;
        if (v417 >= 0)
          v562 = v417;
        else
          v562 = -v417;
        if (v560 >= v561 && v560 >= v562)
        {
          v563 = &v1010;
          v564 = &v1031;
          v565 = v409;
          goto LABEL_845;
        }
        if (v561 >= v562)
        {
          v563 = &v1038;
          v564 = &v1030;
          v565 = v410;
          v542 = v543;
LABEL_845:
          *v564 = v408;
          *v563 = v544;
          v638 = v1031;
          v637 = v1030;
          v544 = v542;
        }
        else
        {
          v637 = v410;
          v638 = v409;
          v565 = v408;
        }
        if (v544 >= 0)
          v650 = v565;
        else
          v650 = -v565;
        if (v544 >= 0)
          v651 = v544;
        else
          v651 = -v544;
        if (v650 < 0)
        {
          if (v637 >= 0)
            v653 = v637;
          else
            v653 = -v637;
          v654 = v653 - v394;
          v655 = v394 - v653;
          if (v638 >= 0)
            v652 = v655;
          else
            v652 = v654;
          if (v638 >= 0)
            v656 = v638;
          else
            v656 = -v638;
          if (v637 < 0)
            v637 = v656 - v394;
          else
            v637 = v394 - v656;
        }
        else
        {
          v652 = v638;
        }
        v737 = v547 - v537;
        v1031 = v652;
        v1030 = v637;
        if (v548 >= 0)
          v738 = v548;
        else
          v738 = -v548;
        if (v549 >= 0)
          v739 = v549;
        else
          v739 = -v549;
        if (v737 >= 0)
          v740 = v737;
        else
          v740 = -v737;
        if (v738 >= v739 && v738 >= v740)
        {
          v741 = &v1037;
          v742 = &v1029;
          v740 = v738;
          v743 = v409;
          goto LABEL_1054;
        }
        if (v739 >= v740)
        {
          v741 = &v1036;
          v742 = &v1028;
          v740 = v739;
          v743 = v410;
          v548 = v549;
LABEL_1054:
          *v742 = v408;
          *v741 = v737;
          v745 = v1029;
          v744 = v1028;
          v737 = v548;
        }
        else
        {
          v744 = v410;
          v745 = v409;
          v743 = v408;
        }
        if (v737 >= 0)
          v746 = v743;
        else
          v746 = -v743;
        if (v746 < 0)
        {
          if (v744 >= 0)
            v748 = v744;
          else
            v748 = -v744;
          v749 = v748 - v394;
          v750 = v394 - v748;
          if (v745 >= 0)
            v747 = v750;
          else
            v747 = v749;
          if (v745 >= 0)
            v751 = v745;
          else
            v751 = -v745;
          if (v744 < 0)
            v744 = v751 - v394;
          else
            v744 = v394 - v751;
        }
        else
        {
          v747 = v745;
        }
        v752 = v559 >> 1;
        v1029 = v747;
        v1028 = v744;
        if (v554 >= 0)
          v753 = v554;
        else
          v753 = -v554;
        if (v556 >= 0)
          v754 = v556;
        else
          v754 = -v556;
        if (v752 >= 0)
          v755 = v752;
        else
          v755 = -v752;
        if (v753 >= v754 && v753 >= v755)
        {
          v756 = &v1035;
          v757 = &v1027;
          v755 = v753;
          v758 = v409;
          goto LABEL_1087;
        }
        if (v754 >= v755)
        {
          v756 = &v1034;
          v757 = &v1026;
          v755 = v754;
          v758 = v410;
          v554 = v556;
LABEL_1087:
          *v757 = v408;
          *v756 = v752;
          v760 = v1027;
          v759 = v1026;
          v752 = v554;
        }
        else
        {
          v759 = v410;
          v760 = v409;
          v758 = v408;
        }
        if (v752 < 0)
          v758 = -v758;
        if (v758 < 0)
        {
          if (v759 >= 0)
            v762 = v759;
          else
            v762 = -v759;
          v763 = v762 - v394;
          v764 = v394 - v762;
          if (v760 >= 0)
            v761 = v764;
          else
            v761 = v763;
          if (v760 >= 0)
            v765 = v760;
          else
            v765 = -v760;
          if (v759 < 0)
            v759 = v765 - v394;
          else
            v759 = v394 - v765;
        }
        else
        {
          v761 = v760;
        }
        v766 = (v537 + v552) / 3;
        v1027 = v761;
        v1026 = v759;
        if (v557 >= 0)
          v767 = v557;
        else
          v767 = -v557;
        if (v558 >= 0)
          v768 = v558;
        else
          v768 = -v558;
        if (v766 >= 0)
          v769 = v766;
        else
          v769 = -v766;
        if (v767 >= v768 && v767 >= v769)
        {
          v770 = &v1033;
          v771 = &v1025;
          v769 = v767;
          goto LABEL_1118;
        }
        if (v768 >= v769)
        {
          v770 = &v1032;
          v771 = &v1024;
          v769 = v768;
          v409 = v410;
          v557 = v558;
LABEL_1118:
          *v771 = v408;
          v408 = v409;
          *v770 = v766;
          v409 = v1025;
          v410 = v1024;
          v766 = v557;
        }
        if (v766 >= 0)
          v772 = v408;
        else
          v772 = -v408;
        if (v772 < 0)
        {
          if (v410 >= 0)
            v774 = v410;
          else
            v774 = -v410;
          v775 = v774 - v394;
          v776 = v394 - v774;
          if (v409 >= 0)
            v773 = v776;
          else
            v773 = v775;
          if (v409 >= 0)
            v777 = v409;
          else
            v777 = -v409;
          if (v410 < 0)
            v410 = v777 - v394;
          else
            v410 = v394 - v777;
        }
        else
        {
          v773 = v409;
        }
        v1025 = v773;
        v1024 = v410;
        v778 = v1010;
        v779 = v652 - v1010;
        v938 = v1038;
        LODWORD(v1020) = v652 - v1010;
        HIDWORD(v1020) = v637 - v1038;
        LODWORD(v1021) = v650 - v651;
        v896 = v1037;
        v894 = v1036;
        LODWORD(v1018) = v747 - v1037;
        HIDWORD(v1018) = v744 - v1036;
        LODWORD(v1019) = v746 - v740;
        v878 = v1035;
        v876 = v1034;
        LODWORD(v1016) = v761 - v1035;
        HIDWORD(v1016) = v759 - v1034;
        LODWORD(v1017) = v758 - v755;
        v874 = v1033;
        v872 = v1032;
        LODWORD(v1014) = v773 - v1033;
        HIDWORD(v1014) = v410 - v1032;
        LODWORD(v1015) = v772 - v769;
        v960 = v637;
        v947 = v650;
        v902 = v744;
        v906 = v740;
        v897 = v747;
        v899 = v746;
        v890 = v759;
        v892 = v755;
        v886 = v761;
        v888 = v758;
        v882 = v772;
        v884 = v769;
        v880 = v773;
        if (*(_BYTE *)(v2 + 24))
        {
          v780 = *(unsigned __int8 *)(v2 + 8);
          v916 = v1010;
          v781 = (unsigned __int16)v1012;
          v782 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1012 + 2048) >> 10) & 0x7CLL));
          v909 = v782;
          v992 = v397;
          v783 = WORD1(v1012);
          v784 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD1(v1012) + 2048) >> 10) & 0x7CLL));
          v929 = v652;
          v785 = v784 + v782 + sub_23CCD36C8((int *)&v1020, v999, v780, (unsigned __int16 **)&v1056 + 1);
          v786 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v781) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v923 = v651;
          v787 = WORD2(v1012);
          LODWORD(v781) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD2(v1012) + 2048) >> 10) & 0x7CLL));
          v788 = v781 + sub_23CCD36C8((int *)&v1018, v999, v780, (unsigned __int16 **)&v1056 + 1) + v786;
          LODWORD(v783) = *(_DWORD *)((char *)&unk_23CCD46E0
                                    + (((unint64_t)(67584 - v783) >> 10) & 0x3FFFFFFFFFFFFCLL));
          LODWORD(v781) = sub_23CCD36C8((int *)&v1016, v999, v780, (unsigned __int16 **)&v1056 + 1);
          LODWORD(v787) = *(_DWORD *)((char *)&unk_23CCD46E0
                                    + (((unint64_t)(67584 - v787) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v398 = v953;
          v789 = sub_23CCD36C8((int *)&v1014, v999, v780, (unsigned __int16 **)&v1056 + 1);
          v652 = v929;
          v790 = v787 + v786;
          v651 = v923;
          v791 = v909 + v781;
          v778 = v916;
          v392 = v999;
          v792 = v783 + v791;
          v397 = v992;
          v793 = v790 + v789;
        }
        else if (v392 < 1)
        {
          v785 = 0;
          v788 = 0;
          v792 = 0;
          v793 = 0;
        }
        else
        {
          if (v779 < 0)
            v779 = v1010 - v652;
          v785 = -(v392 * __clz(v779 + 1));
          if (v747 - v1037 >= 0)
            v794 = v747 - v1037;
          else
            v794 = v1037 - v747;
          v788 = -(v392 * __clz(v794 + 1));
          if (v761 - v1035 >= 0)
            v795 = v761 - v1035;
          else
            v795 = v1035 - v761;
          v792 = -(v392 * __clz(v795 + 1));
          if (v773 - v1033 >= 0)
            v796 = v773 - v1033;
          else
            v796 = v1033 - v773;
          v793 = -(v392 * __clz(v796 + 1));
        }
        v3 = v1009;
        if (v785 > v788 || v785 > v792 || v785 > v793)
        {
          if (v788 > v792 || v788 > v793)
          {
            v2 = v1000;
            if (v792 <= v793)
            {
              v798 = 0;
              v1022 = (void *)__PAIR64__(v876, v878);
              v797 = 1;
              LODWORD(v1023) = v892;
              v801 = v888;
              v800 = v890;
              v799 = 1;
              v802 = v886;
            }
            else
            {
              v1022 = (void *)__PAIR64__(v872, v874);
              v797 = 1;
              v800 = v410;
              LODWORD(v1023) = v884;
              v802 = v880;
              v801 = v882;
              v798 = 1;
              v799 = 2;
            }
            LODWORD(v1044) = v802;
          }
          else
          {
            v797 = 0;
            v1022 = (void *)__PAIR64__(v894, v896);
            v798 = 1;
            LODWORD(v1023) = v906;
            v801 = v899;
            v800 = v902;
            v799 = 2;
            LODWORD(v1044) = v897;
            v2 = v1000;
          }
        }
        else
        {
          v797 = 0;
          v798 = 0;
          v1022 = (void *)__PAIR64__(v938, v778);
          LODWORD(v1023) = v651;
          v799 = 1;
          LODWORD(v1044) = v652;
          v2 = v1000;
          v800 = v960;
          v801 = v947;
        }
        HIDWORD(v1044) = v800;
        LODWORD(v1045[0]) = v801;
        sub_23CCC4CE0(v965, v798, &v1012);
        sub_23CCC4CE0(v965, v797, (_WORD *)&v1012 + v799);
        v803 = 1;
        goto LABEL_1253;
      }
    }
    if ((_DWORD)v419 != -1)
    {
      if (!v398 || (v566 = *((_QWORD *)v1009 + 387), *(_BYTE *)(v566 + v420)) && *(_BYTE *)(v566 + v419))
      {
        v567 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        v568 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        v569 = *v567 - v394;
        v570 = v567[1] - v394;
        if (v569 >= 0)
          v571 = v569;
        else
          v571 = -v569;
        if (v570 >= 0)
          v572 = v570;
        else
          v572 = -v570;
        v573 = v394 - v571;
        v574 = v572 - v394;
        if (v569 >= 0)
          v574 = v394 - v572;
        v575 = v571 - v394;
        if (v570 >= 0)
          v575 = v573;
        v576 = v573 - v572;
        if (v576 < 0)
          v577 = v574;
        else
          v577 = v569;
        if (v576 >= 0)
          v575 = v570;
        v578 = *v568 - v394;
        v579 = v568[1] - v394;
        if (v578 >= 0)
          v580 = v578;
        else
          v580 = -v578;
        if (v579 >= 0)
          v581 = v579;
        else
          v581 = -v579;
        v582 = v394 - v580;
        v583 = v581 - v394;
        if (v578 >= 0)
          v583 = v394 - v581;
        v584 = v580 - v394;
        if (v579 >= 0)
          v584 = v582;
        v585 = v582 - v581;
        if (v585 < 0)
          v586 = v583;
        else
          v586 = v578;
        if (v585 < 0)
          v579 = v584;
        v587 = v417 * (uint64_t)v576 + v415 * (uint64_t)v577 + v416 * (uint64_t)v575;
        if (v587 >= 0)
          v588 = v414;
        else
          v588 = -v414;
        if (v587 >= 0)
          v589 = v416;
        else
          v589 = -v416;
        if (v587 >= 0)
          v590 = v417;
        else
          v590 = -v417;
        LODWORD(v1016) = v588;
        LODWORD(v1014) = v589;
        v591 = v575 + v579;
        v592 = v576 + v585;
        v593 = v577 + v586 + 2;
        if (v577 + v586 + 1 >= 0)
          v593 = v577 + v586 + 1;
        v594 = v593 >> 1;
        v595 = v591 + 2;
        if (v591 + 1 >= 0)
          v595 = v591 + 1;
        v596 = v595 >> 1;
        v597 = v592 + 2;
        if (v592 + 1 >= 0)
          v597 = v592 + 1;
        v1010 = v594;
        v1038 = v596;
        v1037 = v409;
        v1036 = v410;
        v1035 = v409;
        v1034 = v410;
        if (v414 >= 0)
          v598 = v414;
        else
          v598 = -v414;
        if (v416 >= 0)
          v599 = v416;
        else
          v599 = -v416;
        if (v417 >= 0)
          v600 = v417;
        else
          v600 = -v417;
        if (v598 >= v599 && v598 >= v600)
        {
          v601 = &v1016;
          v602 = &v1037;
          v603 = v409;
          goto LABEL_873;
        }
        if (v599 >= v600)
        {
          v601 = &v1014;
          v602 = &v1036;
          v603 = v410;
          v588 = v589;
LABEL_873:
          *v602 = v408;
          *(_DWORD *)v601 = v590;
          v639 = v1037;
          v622 = v1036;
          v590 = v588;
        }
        else
        {
          v622 = v410;
          v639 = v409;
          v603 = v408;
        }
        if (v590 >= 0)
          v659 = v590;
        else
          v659 = -v590;
        if (v590 >= 0)
          v660 = v603;
        else
          v660 = -v603;
        v991 = v397;
        if (v660 < 0)
        {
          if (v622 >= 0)
            v662 = v622;
          else
            v662 = -v622;
          v663 = v662 - v394;
          v664 = v394 - v662;
          if (v639 >= 0)
            v661 = v664;
          else
            v661 = v663;
          if (v639 >= 0)
            v665 = v639;
          else
            v665 = -v639;
          if (v622 < 0)
            v622 = v665 - v394;
          else
            v622 = v394 - v665;
        }
        else
        {
          v661 = v639;
        }
        v804 = v597 >> 1;
        if (v594 >= 0)
          v805 = v594;
        else
          v805 = -v594;
        if (v596 >= 0)
          v806 = v596;
        else
          v806 = -v596;
        if (v804 >= 0)
          v807 = v804;
        else
          v807 = -v804;
        if (v805 >= v806 && v805 >= v807)
        {
          v809 = &v1010;
          v810 = &v1035;
          v807 = v805;
LABEL_1184:
          *v810 = v408;
          v408 = v409;
          *v809 = v804;
          v409 = v1035;
          v410 = v1034;
          v804 = v594;
        }
        else if (v806 >= v807)
        {
          v809 = &v1038;
          v810 = &v1034;
          v807 = v806;
          v409 = v410;
          v594 = v596;
          goto LABEL_1184;
        }
        if (v804 >= 0)
          v811 = v408;
        else
          v811 = -v408;
        if (v811 < 0)
        {
          if (v410 >= 0)
            v813 = v410;
          else
            v813 = -v410;
          v814 = v813 - v394;
          v815 = v394 - v813;
          if (v409 >= 0)
            v812 = v815;
          else
            v812 = v814;
          if (v409 >= 0)
            v816 = v409;
          else
            v816 = -v409;
          if (v410 < 0)
            v410 = v816 - v394;
          else
            v410 = v394 - v816;
        }
        else
        {
          v812 = v409;
        }
        v817 = (int)v1016;
        v818 = v661 - (_DWORD)v1016;
        v819 = (int)v1014;
        LODWORD(v1020) = v661 - (_DWORD)v1016;
        HIDWORD(v1020) = v622 - (_DWORD)v1014;
        LODWORD(v1021) = v660 - v659;
        v820 = v1010;
        v821 = v812 - v1010;
        v822 = v1038;
        goto LABEL_1241;
      }
    }
    if ((_DWORD)v420 == -1 || v398 && !*(_BYTE *)(*((_QWORD *)v1009 + 387) + v420))
    {
      v625 = v415 * (uint64_t)v409 + v416 * (uint64_t)v410 + v417 * (uint64_t)v408;
      if ((v625 & 0x8000000000000000) != 0)
      {
        v414 = -v414;
        v416 = -v416;
        v417 = -v417;
        v1022 = (void *)__PAIR64__(v416, v414);
        LODWORD(v1023) = v417;
      }
      sub_23CCC4CE0(v965, v625 >> 63, &v1039);
      if (v414 >= 0)
        v626 = v414;
      else
        v626 = -v414;
      if (v416 >= 0)
        v627 = v416;
      else
        v627 = -v416;
      if (v417 >= 0)
        v628 = v417;
      else
        v628 = -v417;
      if (v626 >= v627 && v626 >= v628)
      {
        v630 = &v1022;
        v631 = &v1044;
        v416 = v414;
        v3 = v1009;
      }
      else
      {
        v630 = (void **)((char *)&v1022 + 4);
        v631 = (void **)((char *)&v1044 + 4);
        v3 = v1009;
        v409 = v410;
        if (v627 < v628)
        {
          if ((v417 & 0x80000000) == 0)
          {
LABEL_812:
            v632 = (int)v1044;
            v633 = HIDWORD(v1044);
            if (v408 < 0)
            {
              if (SHIDWORD(v1044) >= 0)
                v657 = HIDWORD(v1044);
              else
                v657 = -HIDWORD(v1044);
              v658 = v657 - v394;
              v634 = v394 - v657;
              if ((int)v1044 < 0)
              {
                v634 = v658;
                v632 = -(int)v1044;
              }
              if ((HIDWORD(v1044) & 0x80000000) != 0)
                v633 = v632 - v394;
              else
                v633 = v394 - v632;
            }
            else
            {
              v634 = (int)v1044;
            }
            v803 = 0;
            v1044 = (void *)__PAIR64__(v633, v634);
            goto LABEL_1253;
          }
LABEL_822:
          LODWORD(v1023) = -v417;
          v408 = -v408;
          LODWORD(v1045[0]) = v408;
          goto LABEL_812;
        }
      }
      *(_DWORD *)v631 = v408;
      LODWORD(v1045[0]) = v409;
      *(_DWORD *)v630 = v417;
      v408 = v409;
      v417 = v416;
      LODWORD(v1023) = v416;
      if ((v416 & 0x80000000) == 0)
        goto LABEL_812;
      goto LABEL_822;
    }
    v604 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
    v605 = *v604 - v394;
    v606 = v604[1] - v394;
    if (v605 >= 0)
      v607 = *v604 - v394;
    else
      v607 = v394 - *v604;
    if (v606 >= 0)
      v608 = v606;
    else
      v608 = -v606;
    v609 = v394 - v607;
    v610 = v608 - v394;
    if (v605 >= 0)
      v610 = v394 - v608;
    v611 = v607 - v394;
    if (v606 >= 0)
      v612 = v609;
    else
      v612 = v611;
    v613 = v609 - v608;
    if (v609 - v608 < 0)
    {
      v605 = v610;
      v606 = v612;
    }
    LODWORD(v1016) = v605;
    LODWORD(v1014) = v606;
    v614 = v417 * (uint64_t)v613 + v415 * (uint64_t)v605 + v416 * (uint64_t)v606;
    if (v614 >= 0)
      v615 = v414;
    else
      v615 = -v414;
    if (v614 >= 0)
      v616 = v416;
    else
      v616 = -v416;
    if (v614 >= 0)
      v617 = v417;
    else
      v617 = -v417;
    v1010 = v615;
    v1038 = v616;
    v1037 = v409;
    v1036 = v410;
    v1035 = v409;
    v1034 = v410;
    if (v414 >= 0)
      v618 = v414;
    else
      v618 = -v414;
    if (v416 >= 0)
      v619 = v416;
    else
      v619 = -v416;
    if (v417 >= 0)
      v620 = v417;
    else
      v620 = -v417;
    if (v618 >= v619 && v618 >= v620)
    {
      v640 = &v1010;
      v641 = &v1037;
      v624 = v409;
    }
    else
    {
      if (v619 < v620)
      {
        v622 = v410;
        v623 = v409;
        v624 = v408;
        goto LABEL_895;
      }
      v640 = &v1038;
      v641 = &v1036;
      v624 = v410;
      v615 = v616;
    }
    *v641 = v408;
    *v640 = v617;
    v623 = v1037;
    v622 = v1036;
    v617 = v615;
LABEL_895:
    if (v617 >= 0)
      v659 = v617;
    else
      v659 = -v617;
    if (v617 >= 0)
      v660 = v624;
    else
      v660 = -v624;
    v991 = v397;
    if (v660 < 0)
    {
      if (v622 >= 0)
        v666 = v622;
      else
        v666 = -v622;
      v667 = v666 - v394;
      v668 = v394 - v666;
      if (v623 >= 0)
        v661 = v668;
      else
        v661 = v667;
      if (v623 >= 0)
        v669 = v623;
      else
        v669 = -v623;
      if (v622 < 0)
        v622 = v669 - v394;
      else
        v622 = v394 - v669;
    }
    else
    {
      v661 = v623;
    }
    if (v605 >= 0)
      v823 = v605;
    else
      v823 = -v605;
    if (v606 >= 0)
      v824 = v606;
    else
      v824 = -v606;
    if (v613 >= 0)
      v807 = v613;
    else
      v807 = -v613;
    if (v823 >= v824 && v823 >= v807)
    {
      v826 = &v1016;
      v827 = &v1035;
      v807 = v823;
      goto LABEL_1222;
    }
    if (v824 >= v807)
    {
      v826 = &v1014;
      v827 = &v1034;
      v807 = v824;
      v409 = v410;
      v605 = v606;
LABEL_1222:
      *v827 = v408;
      v408 = v409;
      *(_DWORD *)v826 = v613;
      v409 = v1035;
      v410 = v1034;
      v613 = v605;
    }
    if (v613 >= 0)
      v811 = v408;
    else
      v811 = -v408;
    if (v811 < 0)
    {
      if (v410 >= 0)
        v828 = v410;
      else
        v828 = -v410;
      v829 = v828 - v394;
      v830 = v394 - v828;
      if (v409 >= 0)
        v812 = v830;
      else
        v812 = v829;
      if (v409 >= 0)
        v831 = v409;
      else
        v831 = -v409;
      if (v410 < 0)
        v410 = v831 - v394;
      else
        v410 = v394 - v831;
    }
    else
    {
      v812 = v409;
    }
    v817 = v1010;
    v818 = v661 - v1010;
    v819 = v1038;
    LODWORD(v1020) = v661 - v1010;
    HIDWORD(v1020) = v622 - v1038;
    LODWORD(v1021) = v660 - v659;
    v820 = (int)v1016;
    v821 = v812 - (_DWORD)v1016;
    v822 = (int)v1014;
LABEL_1241:
    LODWORD(v1018) = v821;
    HIDWORD(v1018) = v410 - v822;
    LODWORD(v1019) = v811 - v807;
    if (*(_BYTE *)(v1000 + 24))
    {
      v832 = *(unsigned __int8 *)(v1000 + 8);
      v833 = v1040;
      v917 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1040 + 2048) >> 10) & 0x7CLL));
      v961 = v661;
      v930 = v820;
      v948 = v807;
      v939 = v819;
      v924 = v622;
      v834 = v659;
      v910 = sub_23CCD36C8((int *)&v1020, v999, v832, (unsigned __int16 **)&__b);
      LODWORD(v833) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v833) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v835 = sub_23CCD36C8((int *)&v1018, v999, v832, (unsigned __int16 **)&__b);
      v820 = v930;
      v819 = v939;
      v807 = v948;
      v659 = v834;
      v622 = v924;
      v836 = v910 + v917;
      v837 = v835 + v833;
      v661 = v961;
LABEL_1249:
      if (v836 > v837)
      {
        v817 = v820;
        v819 = v822;
        v659 = v807;
        v661 = v812;
        v622 = v410;
        v660 = v811;
      }
      v838 = v836 > v837;
      goto LABEL_1252;
    }
    if (v999 >= 1)
    {
      if (v818 < 0)
        v818 = -v818;
      v836 = -(v999 * __clz(v818 + 1));
      if (v821 < 0)
        v821 = -v821;
      v837 = -(v999 * __clz(v821 + 1));
      goto LABEL_1249;
    }
    v838 = 0;
LABEL_1252:
    v1022 = (void *)__PAIR64__(v819, v817);
    LODWORD(v1023) = v659;
    v1044 = (void *)__PAIR64__(v622, v661);
    LODWORD(v1045[0]) = v660;
    sub_23CCC4CE0(v965, v838, &v1040);
    v803 = 0;
    v2 = v1000;
    v3 = v1009;
    v392 = v999;
    v397 = v991;
    v398 = v953;
LABEL_1253:
    sub_23CCC4E54((uint64_t)v3, (uint64_t)&v1044, (uint64_t)&v1022, v392, v970, *(_BYTE *)(v2 + 8), &v1050[15 * v803 - 2]);
    v396 = v976;
LABEL_1254:
    v397 += 4;
    if (v983 == v397)
    {
LABEL_1272:
      v847 = 360;
      do
      {
        v848 = &v1050[v847 / 8 - 2];
        v849 = *(void **)((char *)&__p + v847);
        if (v849)
        {
          *(v848 - 2) = v849;
          operator delete(v849);
        }
        v850 = *(v848 - 6);
        if (v850)
        {
          v1045[v847 / 8] = v850;
          operator delete(v850);
        }
        v851 = &v1050[v847 / 8 - 2];
        v852 = *(void **)((char *)&v1036 + v847);
        if (v852)
        {
          *(v851 - 8) = v852;
          operator delete(v852);
        }
        v853 = *(v851 - 12);
        if (v853)
        {
          *(_QWORD *)((char *)&v1032 + v847) = v853;
          operator delete(v853);
        }
        v854 = *(v848 - 15);
        if (v854)
        {
          *(_QWORD *)((char *)&v1026 + v847) = v854;
          operator delete(v854);
        }
        v847 -= 120;
      }
      while (v847);
      goto LABEL_1284;
    }
  }
}

void sub_23CCC99D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,void *__p,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a69;
  void *a72;
  uint64_t i;

  if (__p)
    operator delete(__p);
  if (a48)
    operator delete(a48);
  if (a51)
    operator delete(a51);
  if (a54)
    operator delete(a54);
  if (a57)
    operator delete(a57);
  if (a69)
    operator delete(a69);
  if (a72)
  {
    STACK[0x200] = (unint64_t)a72;
    operator delete(a72);
  }
  for (i = 240; i != -120; i -= 120)
    sub_23CCB8124((uint64_t)&STACK[0x210] + i);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCC9C98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(int *)(a1 + 44);
  if (v1 + v2 + 3 <= (unint64_t)*(unsigned int *)(a1 + 4))
  {
    v4 = 0;
    v5 = *(_DWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 24);
    do
    {
      if ((((2 << v4) - 1) | v6) > *(_DWORD *)(a1 + 28) - 1)
        break;
      ++v4;
    }
    while (v4 != 16);
    v7 = v6 | ~(-1 << v4);
    *(_DWORD *)(a1 + 24) = v7;
    if (v5 <= 7)
    {
      v8 = v5 - 8;
      do
        v7 = (2 * v7) | 1;
      while (!__CFADD__(v8++, 1));
      *(_DWORD *)(a1 + 24) = v7;
      *(_DWORD *)(a1 + 40) = 8;
    }
    if (HIBYTE(v7))
    {
      ++*(_BYTE *)(v1 + *(_QWORD *)(a1 + 8) - 1);
      v1 = *(_QWORD *)(a1 + 16);
      if (*(_DWORD *)(a1 + 44))
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 8) + v1) = 0;
          v10 = *(_DWORD *)(a1 + 44);
          v1 = *(_QWORD *)(a1 + 16) + 1;
          *(_QWORD *)(a1 + 16) = v1;
          *(_DWORD *)(a1 + 44) = --v10;
        }
        while (v10);
      }
    }
    else if ((_DWORD)v2)
    {
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 8) + v1) = -1;
        v11 = *(_DWORD *)(a1 + 44);
        v1 = *(_QWORD *)(a1 + 16) + 1;
        *(_QWORD *)(a1 + 16) = v1;
        *(_DWORD *)(a1 + 44) = --v11;
      }
      while (v11);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 8) + v1) = *(_WORD *)(a1 + 26);
    v12 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16) + 1;
    *(_QWORD *)(a1 + 16) = v13;
    *(_BYTE *)(v12 + v13) = BYTE1(*(_DWORD *)(a1 + 24));
    v3 = *(_QWORD *)(a1 + 16) + 1;
    *(_QWORD *)(a1 + 16) = v3;
    if (v5 >= 1)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 8) + v3) = *(_DWORD *)(a1 + 24);
      v3 = *(_QWORD *)(a1 + 16) + 1;
      *(_QWORD *)(a1 + 16) = v3;
    }
    if (v3 >= 2)
    {
      v14 = *(_QWORD *)(a1 + 8) - 1;
      while (*(unsigned __int8 *)(v14 + v3) == 255)
      {
        *(_QWORD *)(a1 + 16) = --v3;
        if (v3 <= 1)
          return 1;
      }
    }
  }
  else
  {
    v3 = 0;
    *(_DWORD *)a1 = 1;
  }
  return v3;
}

uint64_t sub_23CCC9E34(uint64_t a1, int a2, int a3)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  signed int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  _WORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  _WORD *v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2);
  v5 = *(_DWORD *)(a1 + 576);
  v6 = 38 - __clz(v5);
  if (v5)
    v7 = v6;
  else
    v7 = 6;
  v8 = v4 - a3;
  if (v4 == a3)
  {
    v9 = 1;
  }
  else
  {
    if (v8 >= 0)
      v10 = v4 - a3;
    else
      v10 = a3 - v4;
    v9 = 64 - 2 * __clz(v10 + 1);
  }
  v11 = a1 + 3560;
  v12 = (_WORD *)(a1 + 2576);
  if (v9 < v7 || (v13 = *(_QWORD *)(a1 + 552) + 12 * a2, v14 = *(_DWORD *)(v13 + 8), (v14 & 0x80000000) != 0))
  {
    sub_23CCC4CE0(a1 + 3560, 0, v12);
    return sub_23CCCA014(a1 + 3560, v8, 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
  }
  else
  {
    v15 = *(_DWORD *)(v13 + 4);
    sub_23CCC4CE0(a1 + 3560, 1, v12);
    sub_23CCC4CE0(a1 + 3560, v15 & 1, (_WORD *)(a1 + 2616));
    sub_23CCC4CE0(a1 + 3560, (v15 >> 1) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 1) + 2));
    sub_23CCC4CE0(a1 + 3560, (v15 >> 2) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 3) + 6));
    sub_23CCC4CE0(a1 + 3560, (v15 >> 3) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 7) + 14));
    sub_23CCC4CE0(a1 + 3560, (v15 >> 4) & 1, (_WORD *)(a1 + 2616 + 2 * ((v15 & 0xF) + 15)));
    sub_23CCC4CE0(a1 + 3560, (v15 >> 5) & 1, (_WORD *)(a1 + 2616 + 2 * ((v15 & 0x1F) + 31)));
    if (v14 > 2)
    {
      sub_23CCC4CE0(a1 + 3560, 1, (_WORD *)(a1 + 2744));
      sub_23CCC4CE0(a1 + 3560, 1, (_WORD *)(a1 + 2748));
      return sub_23CCD3C80(a1 + 3560, v14 - 3, 0, (_WORD *)(a1 + 2750));
    }
    else
    {
      v16 = (_WORD *)(a1 + 2744);
      sub_23CCC4CE0(v11, v14 & 1, v16);
      return sub_23CCC4CE0(v11, (v14 >> 1) & 1, &v16[(v14 & 1) + 1]);
    }
  }
}

uint64_t sub_23CCCA014(uint64_t a1, signed int a2, int a3, _WORD *a4, _WORD *a5)
{
  signed int v6;
  uint64_t result;

  v6 = a2;
  if (a2 < 0)
    a2 = -a2;
  result = sub_23CCD3C80(a1, a2, a3, a5);
  if (v6)
    return sub_23CCC4CE0(a1, v6 >= 0, a4);
  return result;
}

void sub_23CCCA074(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  uint64_t *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  int v22;
  _DWORD *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  _QWORD *v27;
  void **v28;
  int v29;
  int *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _DWORD *v43;
  unint64_t v44;
  int v45;
  BOOL v46;
  int v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  _DWORD *v55;
  unint64_t v56;
  int v57;
  unint64_t v58;
  char *v59;
  _DWORD *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v4 = *(int *)(*(_QWORD *)(a1 + 288) + 4 * a2);
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 312) + 4 * a2);
  v70 = *(_QWORD *)(a1 + 336);
  v6 = (uint64_t *)(a1 + 480);
  sub_23CCCA514(a1 + 480, v5);
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = v5 + (int)v4;
    v9 = v70;
    v69 = v8;
    do
    {
      v10 = *(_DWORD *)(v9 + 4 * v4);
      if (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v10) == -1)
      {
        v11 = v10;
        v12 = *(_QWORD *)(a1 + 480);
        *(_DWORD *)(v12 + 12 * v7) = v10;
        v13 = *(_QWORD *)(a1 + 232);
        v14 = *(_DWORD *)(v13 + 4 * v10);
        v15 = v14;
        v16 = *(_DWORD *)(v13 + 4 * (v10 + 1));
        v17 = *(_QWORD *)(a1 + 208);
        v18 = v16 - v14;
        if (v16 <= v14)
        {
          LODWORD(v19) = 0;
        }
        else
        {
          v19 = 0;
          while (*(_DWORD *)(v17 + 4 * v14 + 4 * v19) != a2)
          {
            if (!(v14 - v16 + (_DWORD)++v19))
            {
              LODWORD(v19) = v16 - v14;
              v20 = v16;
              goto LABEL_11;
            }
          }
          v20 = v14 + v19;
LABEL_11:
          if (v20 != v14)
          {
            v71 = v11;
            sub_23CCB659C(a1 + 360, v18);
            v21 = *(_BYTE **)(a1 + 360);
            v17 = *(_QWORD *)(a1 + 208);
            if (v18 >= 1)
            {
              v22 = v19;
              v23 = *(_DWORD **)(a1 + 360);
              v24 = (v16 - v14);
              do
              {
                *v23++ = *(_DWORD *)(v17 + 4 * (v22 % v18 + v14));
                ++v22;
                --v24;
              }
              while (v24);
            }
            v25 = *(_BYTE **)(a1 + 368);
            v15 = v14;
            if (v25 != v21)
            {
              memmove((void *)(v17 + 4 * v14), v21, v25 - v21);
              v15 = v14;
              v17 = *(_QWORD *)(a1 + 208);
            }
            v9 = v70;
            v11 = v71;
            v8 = v69;
          }
        }
        v26 = v12 + 12 * v7;
        *(_DWORD *)(v26 + 8) = *(_DWORD *)(v17 + 4 * (v16 - 1));
        *(_DWORD *)(v26 + 4) = *(_DWORD *)(v17 + 4 * (v15 + 1));
        *(_DWORD *)(*(_QWORD *)(a1 + 256) + 4 * v11) = v19;
        ++v7;
      }
      ++v4;
    }
    while (v4 < v8);
  }
  sub_23CCCA514((uint64_t)v6, v7);
  v27 = (_QWORD *)(a1 + 432);
  v28 = (void **)(a1 + 456);
  sub_23CCB659C(a1 + 432, v7);
  sub_23CCB659C(a1 + 456, 1uLL);
  **(_DWORD **)(a1 + 456) = 0;
  if (v7 >= 1)
  {
    v29 = 0;
    do
    {
      v30 = (int *)(*(_QWORD *)(a1 + 480) + 12 * (v7 - 1));
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * *v30) = -2;
      v31 = v30[1];
      v32 = v30[2];
      v33 = *v30;
      v34 = v29 + 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 432) + 4 * v29) = v33;
      v35 = v7 - 2;
      if (v7 < 2)
      {
        v7 = 0;
      }
      else
      {
        --v7;
        do
        {
          v36 = *v6;
          if (*(_DWORD *)(*v6 + 12 * v35 + 4) == v32)
          {
            v37 = (int *)(v36 + 12 * v35);
            v38 = *v37;
            *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v38) = -2;
            *(_DWORD *)(*(_QWORD *)(a1 + 432) + 4 * v34++) = v38;
            v32 = v37[2];
            v35 = v7 - 1;
            v39 = v36 + 12 * (v7 - 1);
            v40 = *(_QWORD *)v37;
            v41 = *(_DWORD *)(v39 + 8);
            *(_QWORD *)v37 = *(_QWORD *)v39;
            v37[2] = v41;
            *(_QWORD *)v39 = v40;
            *(_DWORD *)(v39 + 8) = v32;
            --v7;
          }
        }
        while ((int)v35-- > 0);
        if (v7 > 0)
        {
          if (v29 != v34)
          {
            v43 = (_DWORD *)(*v27 + 4 * v34 - 4);
            if ((unint64_t)v43 > *v27 + 4 * v29)
            {
              v44 = *v27 + 4 * v29 + 4;
              do
              {
                v45 = *(_DWORD *)(v44 - 4);
                *(_DWORD *)(v44 - 4) = *v43;
                *v43-- = v45;
                v46 = v44 >= (unint64_t)v43;
                v44 += 4;
              }
              while (!v46);
            }
          }
          v47 = v7;
          do
          {
            --v47;
            v48 = *v6;
            if (*(_DWORD *)(*v6 + 12 * v47 + 8) == v31)
            {
              v49 = (int *)(v48 + 12 * v47);
              v50 = *v49;
              *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v50) = -2;
              *(_DWORD *)(*(_QWORD *)(a1 + 432) + 4 * v34++) = v50;
              v47 = v7 - 1;
              v51 = v48 + 12 * (v7 - 1);
              v31 = v49[1];
              v52 = v49[2];
              v53 = *(_QWORD *)v49;
              v54 = *(_DWORD *)(v51 + 8);
              *(_QWORD *)v49 = *(_QWORD *)v51;
              v49[2] = v54;
              *(_QWORD *)v51 = v53;
              *(_DWORD *)(v51 + 8) = v52;
              --v7;
            }
          }
          while (v47 > 0);
          if (v29 != v34)
          {
            v55 = (_DWORD *)(*v27 + 4 * v34 - 4);
            if ((unint64_t)v55 > *v27 + 4 * v29)
            {
              v56 = *v27 + 4 * v29 + 4;
              do
              {
                v57 = *(_DWORD *)(v56 - 4);
                *(_DWORD *)(v56 - 4) = *v55;
                *v55-- = v57;
                v46 = v56 >= (unint64_t)v55;
                v56 += 4;
              }
              while (!v46);
            }
          }
        }
      }
      v29 = v34;
      v59 = *(char **)(a1 + 464);
      v58 = *(_QWORD *)(a1 + 472);
      if ((unint64_t)v59 >= v58)
      {
        v61 = (char *)*v28;
        v62 = (v59 - (_BYTE *)*v28) >> 2;
        v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 62)
          sub_23CCB1C80();
        v64 = v58 - (_QWORD)v61;
        if (v64 >> 1 > v63)
          v63 = v64 >> 1;
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL)
          v65 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v65 = v63;
        if (v65)
        {
          v66 = (char *)sub_23CCC09D4(a1 + 472, v65);
          v61 = *(char **)(a1 + 456);
          v59 = *(char **)(a1 + 464);
        }
        else
        {
          v66 = 0;
        }
        v67 = &v66[4 * v62];
        *(_DWORD *)v67 = v29;
        v60 = v67 + 4;
        while (v59 != v61)
        {
          v68 = *((_DWORD *)v59 - 1);
          v59 -= 4;
          *((_DWORD *)v67 - 1) = v68;
          v67 -= 4;
        }
        *(_QWORD *)(a1 + 456) = v67;
        *(_QWORD *)(a1 + 464) = v60;
        *(_QWORD *)(a1 + 472) = &v66[4 * v65];
        if (v61)
          operator delete(v61);
      }
      else
      {
        *(_DWORD *)v59 = v29;
        v60 = v59 + 4;
      }
      *(_QWORD *)(a1 + 464) = v60;
    }
    while (v7 > 0);
  }
}

void sub_23CCCA514(uint64_t a1, unint64_t a2)
{
  _DWORD *v3;
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  _DWORD *v19;

  v4 = *(_DWORD **)a1;
  v3 = *(_DWORD **)(a1 + 8);
  v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *(_QWORD *)a1) >> 2);
  v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v19 = &v4[3 * a2];
    goto LABEL_18;
  }
  v7 = *(_QWORD *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 2) >= v6)
  {
    memset(*(void **)(a1 + 8), 255, 12 * ((12 * v6 - 12) / 0xC) + 12);
    v19 = &v3[3 * ((12 * v6 - 12) / 0xC) + 3];
LABEL_18:
    *(_QWORD *)(a1 + 8) = v19;
    return;
  }
  if (a2 > 0x1555555555555555)
    sub_23CCB1C80();
  v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 2);
  v9 = 2 * v8;
  if (2 * v8 <= a2)
    v9 = a2;
  if (v8 >= 0xAAAAAAAAAAAAAAALL)
    v10 = 0x1555555555555555;
  else
    v10 = v9;
  if (v10 > 0x1555555555555555)
    sub_23CCB1CC8();
  v11 = 3 * v10;
  v12 = (char *)operator new(12 * v10);
  v13 = &v12[12 * v5];
  v14 = &v12[4 * v11];
  v15 = 12 * ((12 * v6 - 12) / 0xC) + 12;
  memset(v13, 255, v15);
  v16 = &v13[v15];
  if (v3 != v4)
  {
    do
    {
      v17 = *(_QWORD *)(v3 - 3);
      v3 -= 3;
      v18 = v3[2];
      *(_QWORD *)(v13 - 12) = v17;
      v13 -= 12;
      *((_DWORD *)v13 + 2) = v18;
    }
    while (v3 != v4);
    v3 = v4;
  }
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v16;
  *(_QWORD *)(a1 + 16) = v14;
  if (v3)
    operator delete(v3);
}

uint64_t sub_23CCCA6AC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  int32x2_t *v6;
  int *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int32x2_t *v13;
  int32x2_t *v14;
  int32x2_t *v15;
  int32x2_t v16;
  int v17;
  int32x2_t *v18;
  int32x2_t *v19;
  int32x2_t *v20;
  int32x2_t *v21;
  int32x2_t *v22;
  uint32x2_t v23;
  BOOL v24;
  int v25;
  int32x2_t *v26;
  int32x2_t *v27;
  int32x2_t *v28;
  uint32x2_t v29;
  int v30;
  int32x2_t *v31;
  int *v32;
  int v33;
  int32x2_t *v34;
  int32x2_t *v35;
  __int32 v36;
  const float *v37;
  int32x2_t *v38;
  int32x2_t *v39;
  int32x2_t *v40;
  __int32 v41;
  int v42;
  int32x2_t v43;
  int32x2_t v44;
  int32x2_t v45;
  int v46;
  int32x2_t *v47;
  int32x2_t v48;
  int32x2_t v49;
  int v50;
  int32x2_t v51;
  int32x2_t v52;
  uint32x2_t v53;
  int32x2_t v54;
  int32x2_t v55;
  int64x2_t v56;
  int32x2_t v57;
  unint64_t v58;
  int v59;
  _WORD *v60;
  __int32 v61;
  int32x2_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  unsigned int v67;
  int32x2_t v68;
  int32x2_t v69;
  unsigned int v70;
  int32x2_t v71;
  unsigned int v72;
  int32x2_t v73;
  int32x2_t v74;
  const float *v75;
  int32x2_t v76;
  const float *v77;
  int32x2_t v78;
  int32x2_t v79;
  int32x2_t v80;
  int v81;
  int v82;
  uint64_t v83;
  int32x2_t v84;
  __int32 v85;
  _QWORD *v86;
  char v87;
  uint64_t v88;
  int32x2_t v90;
  unsigned int v91;
  int32x2_t v92;
  __int32 *v93;
  unsigned int v94;
  int v95;
  uint64_t v96;
  int32x2_t v97;
  int32x2_t v98;
  __int32 v99;

  v3 = a3;
  v5 = *(_QWORD *)(a1 + 184);
  v6 = (int32x2_t *)(v5 + 12 * a2);
  v7 = (int *)(*(_QWORD *)(a1 + 136) + 12 * a2);
  v8 = *v7;
  v9 = v7[1];
  v10 = v7[2];
  v11 = *(_DWORD *)(a3 + 12);
  if (v11 == 1)
  {
    if (v10 != -1)
    {
      v12 = 0;
      v18 = (int32x2_t *)(v5 + 12 * v8);
      v19 = (int32x2_t *)(v5 + 12 * v9);
      v20 = (int32x2_t *)(v5 + 12 * v10);
      v16 = vsub_s32(vadd_s32(*v19, *v18), *v20);
      v17 = v19[1].i32[0] + v18[1].i32[0] - v20[1].i32[0];
      goto LABEL_38;
    }
  }
  else if (v11 == 2)
  {
    if (v10 == -1)
    {
      if (v9 == -1)
      {
        if (v8 == -1)
        {
          v17 = 0;
          v12 = -*(char *)(a3 + 21);
          v16 = 0;
        }
        else
        {
          v12 = 0;
          v31 = (int32x2_t *)(v5 + 12 * v8);
          v16 = *v31;
          v17 = v31[1].i32[0];
        }
      }
      else
      {
        v12 = 0;
        v27 = (int32x2_t *)(v5 + 12 * v8);
        v28 = (int32x2_t *)(v5 + 12 * v9);
        v29 = (uint32x2_t)vadd_s32(*v28, *v27);
        LODWORD(v27) = v27[1].i32[0];
        LODWORD(v28) = v28[1].i32[0];
        v24 = __OFADD__((_DWORD)v28, (_DWORD)v27);
        v30 = (_DWORD)v28 + (_DWORD)v27;
        v16 = vshr_n_s32((int32x2_t)vsra_n_u32(v29, v29, 0x1FuLL), 1uLL);
        if (v30 < 0 != v24)
          ++v30;
        v17 = v30 >> 1;
      }
    }
    else
    {
      v12 = 0;
      v13 = (int32x2_t *)(v5 + 12 * v8);
      v14 = (int32x2_t *)(v5 + 12 * v9);
      v15 = (int32x2_t *)(v5 + 12 * v10);
      v16 = vsub_s32(vadd_s32(*v14, *v13), *v15);
      v17 = v14[1].i32[0] + v13[1].i32[0] - v15[1].i32[0];
    }
    v32 = (int *)(*(_QWORD *)(a1 + 160) + 12 * a2);
    v33 = v32[2];
    if (v33 != -1)
    {
      v34 = (int32x2_t *)(v5 + 12 * *v32);
      v35 = (int32x2_t *)(v5 + 12 * v32[1]);
      v36 = v34[1].i32[0];
      v37 = (const float *)&v35[1];
      v38 = (int32x2_t *)(v5 + 12 * v33);
      v39 = (int32x2_t *)(v5 + 12 * v9);
      v40 = (int32x2_t *)(v5 + 12 * v8);
      v41 = v40[1].i32[0];
      v24 = __OFADD__(v41, v36);
      v42 = v41 + v36;
      v43.i32[0] = v36;
      v43.i32[1] = v39[1].i32[0];
      v44 = (int32x2_t)vld1_dup_f32(v37);
      v45 = vadd_s32(v43, v44);
      if (v42 < 0 != v24)
        v46 = v42 + 1;
      else
        v46 = v42;
      v47 = (int32x2_t *)(v5 + 12 * v10);
      v48.i32[0] = v38[1].i32[0];
      v48.i32[1] = v46 >> 1;
      v49 = vsub_s32(v45, v48);
      v50 = 2 * v45.i32[1];
      v51 = vsub_s32(vadd_s32(*v35, *v34), *v38);
      v52 = vadd_s32(*v39, *v35);
      v53 = (uint32x2_t)vadd_s32(*v40, *v34);
      v54 = (int32x2_t)vsra_n_u32(v53, v53, 0x1FuLL);
      v55 = vsub_s32(v52, vshr_n_s32(v54, 1uLL));
      v56 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v52, v52), v54, 1uLL), vadd_s32(*v38, *v47)), vdup_n_s32(0x55555556u));
      v57 = vadd_s32(vshrn_n_s64(v56, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v56, 0x3FuLL)));
      v58 = 1431655766 * (v50 + (v46 >> 1) - (v38[1].i32[0] + v47[1].i32[0]));
      v59 = HIDWORD(v58) + (v58 >> 63);
      v60 = (_WORD *)(a1 + 2752);
      v90 = v16;
      v97 = v49;
      if (*(_BYTE *)(v3 + 20))
      {
        v61 = v6[1].i32[0];
        v62 = *v6;
        v98 = vsub_s32(*v6, v16);
        v99 = v61 - v17;
        v63 = *(unsigned __int8 *)(v3 + 8);
        v64 = *(unsigned __int16 *)(a1 + 2752);
        v95 = HIDWORD(v58) + (v58 >> 63);
        v65 = *(unsigned __int16 *)(a1 + 2754);
        v93 = (__int32 *)((char *)&unk_23CCD46E0 + (((v65 + 2048) >> 10) & 0x7CLL));
        v94 = sub_23CCD36C8((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        v98 = vsub_s32(v62, v51);
        v99 = v61 - v97.i32[0];
        v96 = v3;
        v66 = *(unsigned __int16 *)(a1 + 2756);
        v91 = sub_23CCD36C8((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        v98 = vsub_s32(v62, v55);
        v67 = 67584 - v65;
        v59 = v95;
        v68.i32[0] = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v66 + 2048) >> 10) & 0x7CLL));
        v68.i32[1] = *(_DWORD *)((char *)&unk_23CCD46E0 + ((v67 >> 10) & 0x7CLL));
        v99 = v61 - v97.i32[1];
        v69.i32[0] = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - v64) >> 10) & 0x7CLL));
        v69.i32[1] = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v64 + 2048) >> 10) & 0x7CLL));
        v92 = vadd_s32(vadd_s32(v68, v69), (int32x2_t)__PAIR64__(sub_23CCD36C8((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880)), v91));
        v98 = vsub_s32(v62, v57);
        v99 = v61 - v95;
        v70 = 67584 - v66;
        v3 = v96;
        v68.i32[0] = *(_DWORD *)((char *)&unk_23CCD46E0 + ((v70 >> 10) & 0x7CLL));
        v68.i32[1] = *v93;
        v71 = vadd_s32(v68, v69);
        v72 = sub_23CCD36C8((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        v73 = v92;
        v60 = (_WORD *)(a1 + 2752);
        v74 = vadd_s32(v71, (int32x2_t)__PAIR64__(v94, v72));
      }
      else
      {
        v75 = (const float *)v6;
        v76 = (int32x2_t)vld1_dup_f32(v75++);
        v77 = (const float *)&v6[1];
        v78 = (int32x2_t)vld1_dup_f32(v75);
        v79 = (int32x2_t)vld1_dup_f32(v77);
        v73 = vneg_s32(vadd_s32(vadd_s32(vclz_s32(vaba_s32((int32x2_t)0x100000001, v76, vzip1_s32(v51, v55))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v78, vzip2_s32(v51, v55)))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v79, v49))));
        v74 = vneg_s32(vadd_s32(vadd_s32(vclz_s32(vaba_s32((int32x2_t)0x100000001, v76, vzip1_s32(v57, v16))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v78, vzip2_s32(v57, v16)))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v79, (int32x2_t)__PAIR64__(v17, v59)))));
      }
      if (v73.i32[0] < v74.i32[1]
        && (v80 = vcgt_s32((int32x2_t)__PAIR64__(v73.u32[1], v74.u32[0]), vdup_lane_s32(v73, 0)), (v80.i8[4] & 1) != 0)
        && (v80.i8[0] & 1) != 0)
      {
        v81 = 0;
        v17 = v97.i32[0];
        v82 = 1;
        v83 = 2;
      }
      else
      {
        v84 = vcgt_s32(v74, vdup_lane_s32(v73, 1));
        if ((v84.i8[4] & v84.i8[0] & 1) != 0)
        {
          v82 = 0;
          v17 = v97.i32[1];
          v81 = 1;
          v83 = 1;
          v51 = v55;
        }
        else if (v74.i32[0] >= v74.i32[1])
        {
          v81 = 0;
          v82 = 0;
          v83 = 1;
          v51 = v90;
        }
        else
        {
          v81 = 1;
          v83 = 2;
          v17 = v59;
          v82 = 1;
          v51 = v57;
        }
      }
      sub_23CCC4CE0(a1 + 3560, v82, v60);
      sub_23CCC4CE0(a1 + 3560, v81, (_WORD *)(a1 + 2 * v83 + 2752));
      v12 = 1;
      v16 = v51;
    }
    goto LABEL_38;
  }
  if (v9 == -1)
  {
    if (v8 == -1)
    {
      v17 = 0;
      v12 = -*(char *)(a3 + 21);
      v16 = 0;
    }
    else
    {
      v12 = 0;
      v26 = (int32x2_t *)(v5 + 12 * v8);
      v16 = *v26;
      v17 = v26[1].i32[0];
    }
  }
  else
  {
    v12 = 0;
    v21 = (int32x2_t *)(v5 + 12 * v8);
    v22 = (int32x2_t *)(v5 + 12 * v9);
    v23 = (uint32x2_t)vadd_s32(*v22, *v21);
    LODWORD(v21) = v21[1].i32[0];
    LODWORD(v22) = v22[1].i32[0];
    v24 = __OFADD__((_DWORD)v22, (_DWORD)v21);
    v25 = (_DWORD)v22 + (_DWORD)v21;
    v16 = vshr_n_s32((int32x2_t)vsra_n_u32(v23, v23, 0x1FuLL), 1uLL);
    if (v25 < 0 != v24)
      ++v25;
    v17 = v25 >> 1;
  }
LABEL_38:
  v85 = v6[1].i32[0] - v17;
  v98 = vsub_s32(*v6, v16);
  v99 = v85;
  if ((v12 & 0x80000000) != 0)
  {
    v88 = a1;
    v87 = 3;
    v86 = 0;
  }
  else
  {
    v86 = (_QWORD *)(a1 + 120 * v12 + 2760);
    v87 = *(_BYTE *)(v3 + 8);
    v88 = a1;
  }
  return sub_23CCCAD44(v88, (uint64_t)&v98, v87, v86);
}

uint64_t sub_23CCCAD44(uint64_t result, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  _WORD *v11;
  uint64_t v12;
  _WORD *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  signed int v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  _WORD *v37;
  uint64_t v38;
  _WORD *v39;
  int v40;
  unint64_t v41;
  _WORD *v42;
  _WORD *v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  int v47;
  __int16 v48;

  v6 = result + 3560;
  switch(a3)
  {
    case 0:
      v7 = 0;
      v8 = 0;
      v9 = 124;
      while (1)
      {
        v10 = *(_DWORD *)(a2 + v7);
        v11 = (_WORD *)(*a4 + v8);
        v12 = v6;
        if (v10)
        {
          sub_23CCC4CE0(v6, 1, v11);
          v13 = (_WORD *)(a4[3] + v8);
          if ((v10 & 0x80000000) != 0)
          {
            sub_23CCC4CE0(v6, 0, v13);
            v10 = -v10;
          }
          else
          {
            sub_23CCC4CE0(v6, 1, v13);
          }
          v15 = a4[6];
          v16 = v15 + v9;
          v17 = (_WORD *)(v15 + v9 - 124);
          if (v10 > 0x3F)
          {
            sub_23CCC4CE0(v6, 1, v17);
            sub_23CCC4CE0(v6, 1, (_WORD *)(v16 - 120));
            sub_23CCC4CE0(v6, 1, (_WORD *)(v16 - 112));
            sub_23CCC4CE0(v6, 1, (_WORD *)(v16 - 96));
            sub_23CCC4CE0(v6, 1, (_WORD *)(v16 - 64));
            sub_23CCC4CE0(v6, 1, (_WORD *)(v15 + v9));
            result = sub_23CCD3C80(v6, v10 - 64, *(_DWORD *)(a4[12] + v7), (_WORD *)(a4[9] + v8));
            goto LABEL_12;
          }
          v18 = v10 - 1;
          sub_23CCC4CE0(v6, (v10 - 1) & 1, v17);
          sub_23CCC4CE0(v6, ((v10 - 1) >> 1) & 1, (_WORD *)(v15 + 2 * (((_BYTE)v10 + 1) & 1) + v9 - 122));
          sub_23CCC4CE0(v6, (v18 >> 2) & 1, (_WORD *)(v15 + 2 * (v18 & 3) + v9 - 118));
          sub_23CCC4CE0(v6, (v18 >> 3) & 1, (_WORD *)(v15 + 2 * (v18 & 7) + v9 - 110));
          sub_23CCC4CE0(v6, (v18 >> 4) & 1, (_WORD *)(v15 + 2 * (v18 & 0xF) + v9 - 94));
          v14 = ((v10 - 1) >> 5) & 1;
          v11 = (_WORD *)(v15 + 2 * ((v10 - 1) & 0x1FLL) + v9 - 62);
          v12 = v6;
        }
        else
        {
          v14 = 0;
        }
        result = sub_23CCC4CE0(v12, v14, v11);
LABEL_12:
        v9 += 128;
        v8 += 2;
        v7 += 4;
        if (v9 == 508)
          return result;
      }
    case 2:
      v19 = 0;
      v20 = 0;
      while (1)
      {
        v21 = *(_DWORD *)(a2 + v20);
        v22 = a4[12];
        result = sub_23CCCA014(v6, v21, *(_DWORD *)(v22 + v20), (_WORD *)(a4[3] + v19), (_WORD *)(a4[9] + v19));
        v23 = v21 >= 0 ? v21 : -v21;
        v24 = *(_DWORD *)(v22 + v20);
        v25 = v23 >> v24;
        if (v24 && v25 == 0)
          break;
        if (v25 >= 2)
        {
          v27 = 1;
LABEL_25:
          *(_DWORD *)(v22 + v20) = v27 + v24;
        }
        v20 += 4;
        v19 += 2;
        if (v20 == 12)
          return result;
      }
      v27 = -1;
      goto LABEL_25;
    case 3:
      v28 = 0;
      v29 = result + 12;
      do
      {
        v30 = *(_DWORD *)(v29 + 4 * v28);
        if (v30 >= 1)
        {
          v31 = 0;
          v32 = *(_DWORD *)(a2 + 4 * v28);
          do
          {
            v48 = 0x8000;
            result = sub_23CCC4CE0(v6, (v32 >> v31++) & 1, &v48);
          }
          while (v30 != v31);
        }
        ++v28;
      }
      while (v28 != 3);
      return result;
    case 4:
      v33 = 0;
      v34 = 0;
      v35 = 124;
      break;
    default:
      return result;
  }
  do
  {
    v36 = *(_DWORD *)(a2 + v33);
    v37 = (_WORD *)(*a4 + v34);
    v38 = v6;
    if (!v36)
    {
      v40 = 0;
LABEL_42:
      result = sub_23CCC4CE0(v38, v40, v37);
      goto LABEL_49;
    }
    sub_23CCC4CE0(v6, 1, v37);
    v39 = (_WORD *)(a4[3] + v34);
    if ((v36 & 0x80000000) != 0)
    {
      sub_23CCC4CE0(v6, 0, v39);
      v36 = -v36;
    }
    else
    {
      sub_23CCC4CE0(v6, 1, v39);
    }
    v41 = v36 - 1;
    v42 = (_WORD *)(a4[6] + v35);
    v43 = v42 - 62;
    if (v36 <= 0x3F)
    {
      sub_23CCC4CE0(v6, (v41 >> 5) & 1, v43);
      sub_23CCC4CE0(v6, (v41 >> 4) & 1, (_WORD *)((char *)v42 + ((v41 >> 4) & 0xFFFFFFE) - 122));
      sub_23CCC4CE0(v6, (v41 >> 3) & 1, (_WORD *)((char *)v42 + ((v41 >> 3) & 0x1FFFFFFE) - 118));
      sub_23CCC4CE0(v6, (v41 >> 2) & 1, (_WORD *)((char *)v42 + ((v41 >> 2) & 0x3FFFFFFE) - 110));
      sub_23CCC4CE0(v6, (v41 >> 1) & 1, (_WORD *)((char *)v42 + ((v41 >> 1) & 0x7FFFFFFE) - 94));
      v40 = ((_BYTE)v36 - 1) & 1;
      v37 = (_WORD *)((char *)v42 + (v41 & 0xFFFFFFFE) - 62);
      v38 = v6;
      goto LABEL_42;
    }
    sub_23CCC4CE0(v6, 1, v43);
    sub_23CCC4CE0(v6, 1, v42 - 60);
    sub_23CCC4CE0(v6, 1, v42 - 56);
    sub_23CCC4CE0(v6, 1, v42 - 48);
    sub_23CCC4CE0(v6, 1, v42 - 32);
    sub_23CCC4CE0(v6, 1, v42);
    v44 = a4[12];
    result = sub_23CCD3C80(v6, v36 - 64, *(_DWORD *)(v44 + v33), (_WORD *)(a4[9] + v34));
    v45 = *(_DWORD *)(v44 + v33);
    v46 = v41 >> v45;
    if (!v45 || v46)
    {
      if (v46 < 2)
        goto LABEL_49;
      v47 = v45 + 1;
    }
    else
    {
      v47 = v45 - 1;
    }
    *(_DWORD *)(v44 + v33) = v47;
LABEL_49:
    v35 += 128;
    v34 += 2;
    v33 += 4;
  }
  while (v35 != 508);
  return result;
}

unint64_t sub_23CCCB1E4(uint64_t a1, int a2, int a3, unsigned int a4, int *a5, uint64_t a6)
{
  int *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _DWORD **v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  _DWORD *v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  _BOOL4 v56;
  int v57;
  _BOOL4 v58;
  _BOOL4 v59;
  _BOOL4 v60;
  int v61;
  int v62;
  int v63;
  char v64;
  BOOL v65;
  BOOL v66;
  BOOL v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  BOOL v73;
  int *v74;
  int v75;
  int v76;
  _WORD *v77;
  int v78;
  int v79;
  uint64_t v80;
  _DWORD *v81;
  int v82;
  uint64_t v83;
  _DWORD *v84;
  int v85;
  char v86;
  uint64_t v87;
  char v88;
  int v89;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  char v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  _DWORD *v99;
  unint64_t result;
  int v101;
  int v102;
  uint64_t v103;
  int v104;
  _DWORD *v105;
  _DWORD *v106;
  int *v107;
  int v108;
  int v109;
  int v110;
  _DWORD *v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  _DWORD *v116;
  BOOL v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  int *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _DWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  BOOL v129;
  char v130;
  int v131;
  int v132;
  int v133;
  int v136;
  _DWORD **v137;
  unsigned int v138;
  int v139;
  int v140;

  v9 = (int *)(*(_QWORD *)(a1 + 528) + 16 * a2);
  v10 = (int *)(*(_QWORD *)(a1 + 456) + 4 * a3);
  v12 = *v10;
  v11 = v10[1];
  v13 = *(_DWORD *)(a1 + 36);
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = 2 * (v11 - v12);
    }
    else if ((int)v11 <= (int)v12)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      v15 = v11 - v12;
      v16 = (int *)(*(_QWORD *)(a1 + 432) + 4 * v12);
      do
      {
        v17 = *v16++;
        v14 = v14 - *(_DWORD *)(*(_QWORD *)(a1 + 232) + 4 * v17) + *(_DWORD *)(*(_QWORD *)(a1 + 232) + 4 * v17 + 4) - 2;
        --v15;
      }
      while (v15);
    }
  }
  else
  {
    v14 = v11 - v12;
  }
  v133 = *(_DWORD *)a1;
  v18 = *v9;
  v19 = v9[1];
  v20 = (_QWORD *)(a1 + 408);
  v21 = v14 + 1;
  v137 = (_DWORD **)(a1 + 384);
  sub_23CCB659C(a1 + 384, v21);
  v22 = *(_QWORD *)(a1 + 408);
  v23 = *(_QWORD *)(a1 + 416) - v22;
  if (v21 <= v23)
  {
    v24 = v137;
    if (v21 < v23)
      *(_QWORD *)(a1 + 416) = v22 + v21;
  }
  else
  {
    sub_23CCC0EB0((unint64_t *)(a1 + 408), v21 - v23);
    v24 = v137;
  }
  if ((int)v12 < (int)v11)
  {
    v25 = 0;
    v26 = *(_QWORD *)(a1 + 432);
    v27 = *(_QWORD *)(a1 + 112);
    v28 = *(_QWORD *)(a1 + 40);
    v29 = v12;
    v30 = *(_QWORD *)(a1 + 232);
    do
    {
      v31 = *(int *)(v26 + 4 * v29);
      *(_DWORD *)(v27 + 4 * *(int *)(a1 + 284)) = v31;
      v32 = *(_DWORD *)(a1 + 284);
      *(_DWORD *)(a1 + 284) = v32 + 1;
      *(_DWORD *)(v28 + 4 * v31) = v32;
      v33 = *(_DWORD *)(v30 + 4 * v31);
      if (v29 == v12)
        v34 = 1;
      else
        v34 = 2;
      v35 = v33 + v34;
      v36 = *(int *)(v30 + 4 * ((int)v31 + 1));
      if (v33 + v34 < (int)v36)
      {
        v37 = v36 - v35;
        v38 = (int *)(*(_QWORD *)(a1 + 208) + 4 * v35);
        v39 = (_DWORD *)(*(_QWORD *)(a1 + 384) + 4 * v25);
        v25 = v25 + v36 - v35;
        do
        {
          v40 = *v38++;
          *v39++ = v40;
          --v37;
        }
        while (v37);
      }
      ++v29;
    }
    while (v29 != v11);
  }
  if (**v24 == v19 || (*v24)[v14] != v18)
  {
    if ((v14 & 0x80000000) == 0)
    {
      v47 = 0;
      do
      {
        v48 = *(_DWORD *)(*(_QWORD *)(a1 + 384) + 4 * v47);
        v49 = *(_QWORD *)(a1 + 64);
        v50 = *(_DWORD *)(v49 + 4 * v48);
        if (v50 == -1)
        {
          *(_DWORD *)(v49 + 4 * v48) = *(_DWORD *)(a1 + 280);
          v51 = *(int *)(a1 + 280);
          *(_DWORD *)(a1 + 280) = v51 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * v51) = v48;
        }
        *(_BYTE *)(*v20 + v47++) = v50 == -1;
      }
      while (v21 != v47);
    }
  }
  else if ((v14 & 0x80000000) == 0)
  {
    v41 = v14;
    do
    {
      v42 = *(_DWORD *)(*(_QWORD *)(a1 + 384) + 4 * v41);
      v43 = *(_QWORD *)(a1 + 64);
      v44 = *(_DWORD *)(v43 + 4 * v42);
      if (v44 == -1)
      {
        *(_DWORD *)(v43 + 4 * v42) = *(_DWORD *)(a1 + 280);
        v45 = *(int *)(a1 + 280);
        *(_DWORD *)(a1 + 280) = v45 + 1;
        *(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * v45) = v42;
      }
      *(_BYTE *)(*v20 + v41) = v44 == -1;
      v46 = v41-- <= 0;
    }
    while (!v46);
  }
  v52 = *(int **)(a1 + 384);
  v53 = *v52;
  v54 = v52[v14];
  v55 = *(unsigned __int8 **)(a1 + 408);
  v132 = *v55;
  v56 = v132 == 0;
  v57 = v55[v14];
  v58 = v55[v14] == 0;
  v59 = (_DWORD)v53 == v19 && v132 == 0;
  v60 = (_DWORD)v54 == v18 && v58;
  v129 = v59;
  v130 = v60;
  v61 = !v59;
  v62 = !v60;
  v136 = v14;
  v127 = v53;
  v128 = v54;
  v131 = v57;
  if ((v61 & 1) != 0 || v62)
  {
    if ((v58 | v61) == 1)
    {
      v64 = v61 ^ 1;
      if (v57)
        v64 = 0;
      if ((v64 & 1) != 0)
      {
        v63 = 2;
      }
      else if ((v56 | v62) == 1)
      {
        v65 = v132 != 0;
        if (v57)
          v65 = 0;
        if (v65)
        {
          v63 = 4;
        }
        else
        {
          v66 = v60;
          if (v132)
            v66 = 0;
          if (v66)
          {
            v63 = 5;
          }
          else
          {
            v67 = !v58;
            if (v132)
              v67 = 0;
            if (v67)
            {
              v63 = 6;
            }
            else if (v56 || v58)
            {
              v63 = 8;
            }
            else
            {
              v63 = 7;
            }
          }
        }
      }
      else
      {
        v63 = 3;
      }
    }
    else
    {
      v63 = 1;
    }
  }
  else
  {
    v63 = 0;
  }
  *a5 = v63;
  sub_23CCC4CE0(a1 + 3560, v63 == 0, (_WORD *)(a1 + 16 * a4 + 2494));
  if (*a5)
  {
    v68 = *a5 - 1;
    v69 = a1 + 16 * a4;
    v70 = v69 + 2494;
    sub_23CCC4CE0(a1 + 3560, v68 & 1, (_WORD *)(v69 + 2496));
    sub_23CCC4CE0(a1 + 3560, (v68 >> 1) & 1, (_WORD *)(v70 + 2 * (v68 & 1 | 2)));
    sub_23CCC4CE0(a1 + 3560, (v68 >> 2) & 1, (_WORD *)(v70 + 2 * (v68 & 3 | 4)));
  }
  if (*(_BYTE *)(a6 + 18) && *(_BYTE *)(a6 + 17))
  {
    v71 = *(_DWORD *)(*(_QWORD *)(a1 + 552) + 12 * a2);
    if (v71 <= 19)
      v71 = 19;
    v72 = v71 - 19;
    v138 = v72 >> 1;
    v139 = 15;
    v73 = v72 >= 0x1E;
    v74 = &v139;
    if (!v73)
      v74 = (int *)&v138;
  }
  else
  {
    v140 = 7;
    v74 = (int *)(*(_QWORD *)(a1 + 504) + 4 * a2);
    if (*v74 >= 7)
      v74 = &v140;
  }
  v75 = *v74;
  v76 = v11 + ~(_DWORD)v12;
  v77 = (_WORD *)(a1 + 6 * *v74 + 2388);
  if (v76 > 2)
  {
    sub_23CCC4CE0(a1 + 3560, 1, v77);
    sub_23CCC4CE0(a1 + 3560, 1, (_WORD *)(a1 + 6 * v75 + 2392));
    sub_23CCD3C80(a1 + 3560, v76 - 3, 0, (_WORD *)(a1 + 2484));
  }
  else
  {
    sub_23CCC4CE0(a1 + 3560, v76 & 1, v77);
    sub_23CCC4CE0(a1 + 3560, (v76 >> 1) & 1, (_WORD *)(a1 + 6 * v75 + 2 * ((v76 & 1u) + 1) + 2388));
  }
  v78 = *(_DWORD *)(a1 + 36);
  if (v78 == 3)
  {
    if ((int)v12 < (int)v11)
    {
      v82 = v11 - v12;
      v83 = 4 * v12;
      do
      {
        v84 = (_DWORD *)(*(_QWORD *)(a1 + 232) + 4 * *(int *)(*(_QWORD *)(a1 + 432) + v83));
        v85 = v84[1] - *v84;
        if (v85 > 5)
        {
          sub_23CCC4CE0(a1 + 3560, 1, (_WORD *)(a1 + 2486));
          sub_23CCC4CE0(a1 + 3560, 1, (_WORD *)(a1 + 2490));
          sub_23CCD3C80(a1 + 3560, v85 - 6, 0, (_WORD *)(a1 + 2492));
        }
        else
        {
          sub_23CCC4CE0(a1 + 3560, (v85 - 3) & 1, (_WORD *)(a1 + 2486));
          sub_23CCC4CE0(a1 + 3560, ((v85 - 3) >> 1) & 1, (_WORD *)(a1 + 2 * (((v85 - 3) & 1u) + 1) + 2486));
        }
        v83 += 4;
        --v82;
      }
      while (v82);
    }
  }
  else if (v78 == 2 && (int)v12 < (int)v11)
  {
    v79 = v11 - v12;
    v80 = 4 * v12;
    do
    {
      v81 = (_DWORD *)(*(_QWORD *)(a1 + 232) + 4 * *(int *)(*(_QWORD *)(a1 + 432) + v80));
      sub_23CCC4CE0(a1 + 3560, v81[1] - *v81 != 3, (_WORD *)(a1 + 2486));
      v80 += 4;
      --v79;
    }
    while (v79);
  }
  v86 = v129;
  if (v132)
    v86 = 1;
  if ((v86 & 1) == 0)
  {
    if (*(_BYTE *)(a6 + 17))
      sub_23CCC9E34(a1, v127, *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2) - 1);
    else
      sub_23CCCA014(a1 + 3560, *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v127) - *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2) + 1, 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
  }
  if (v14 >= 2)
  {
    v87 = 1;
    do
    {
      v88 = *(_BYTE *)(*v20 + v87);
      v89 = v88 & 1;
    }
    while (++v87 < v14 && v89 != 0);
    sub_23CCC4CE0(a1 + 3560, v89, (_WORD *)(a1 + 2614));
    if ((v88 & 1) == 0)
    {
      if ((_DWORD)v21 == 3)
      {
        v91 = (int)(*v137)[1];
        if (*(_BYTE *)(a6 + 17))
          sub_23CCC9E34(a1, v91, v133);
        else
          sub_23CCD3C80(a1 + 3560, v133 - *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v91), 0, (_WORD *)(a1 + 2612));
      }
      else
      {
        v92 = 1;
        do
        {
          v93 = *(unsigned __int8 *)(*v20 + v92);
          sub_23CCC4CE0(a1 + 3560, *(_BYTE *)(*v20 + v92) != 0, (_WORD *)(a1 + 2574));
          if (!v93)
          {
            v94 = (int)(*v137)[v92];
            if (*(_BYTE *)(a6 + 17))
              sub_23CCC9E34(a1, v94, v133);
            else
              sub_23CCD3C80(a1 + 3560, v133 - *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v94), 0, (_WORD *)(a1 + 2612));
          }
          ++v92;
        }
        while (v136 != v92);
      }
    }
  }
  v95 = v130;
  if (v131)
    v95 = 1;
  if ((v95 & 1) == 0)
  {
    if (*(_BYTE *)(a6 + 17))
      sub_23CCC9E34(a1, v128, *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2) + 1);
    else
      sub_23CCCA014(a1 + 3560, *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * v128) + ~*(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * a2), 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
  }
  v96 = *a5;
  v97 = (v136 - 1);
  if (*a5 > 2)
  {
    if (v96 == 3 || v96 == 5)
    {
      result = v21;
      if ((int)v21 > 1)
      {
        v107 = (int *)(*(_QWORD *)(a1 + 528) + 16 * a2);
        v108 = v107[3];
        v109 = *v107;
        do
        {
          v110 = v109;
          v109 = (*v137)[v97];
          if (*(_BYTE *)(*v20 + v97))
          {
            v111 = (_DWORD *)(*(_QWORD *)(a1 + 136) + 12 * v109);
            *v111 = a2;
            v111[1] = v110;
            v111[2] = v108;
          }
          v108 = v110;
          v46 = v97-- <= 0;
        }
        while (!v46);
      }
    }
    else
    {
      result = v21;
      if (v136 <= 0x7FFFFFFE)
      {
        v112 = 0;
        v113 = -1;
        v114 = -1;
        do
        {
          v115 = v113;
          v113 = (*v137)[v112];
          if (*(_BYTE *)(*v20 + v112))
          {
            v116 = (_DWORD *)(*(_QWORD *)(a1 + 136) + 12 * v113);
            *v116 = a2;
            v116[1] = v115;
            v116[2] = v114;
          }
          ++v112;
          v114 = v115;
        }
        while (v21 != v112);
      }
    }
  }
  else
  {
    v98 = *(_QWORD *)(a1 + 528);
    v99 = (_DWORD *)(v98 + 16 * a2);
    result = v21;
    if ((int)v21 >= 2)
    {
      v101 = v99[1];
      v102 = v99[2];
      v103 = 1;
      do
      {
        v104 = (*v137)[v103];
        if (*(_BYTE *)(*v20 + v103))
        {
          v105 = (_DWORD *)(*(_QWORD *)(a1 + 136) + 12 * v104);
          *v105 = a2;
          v105[1] = v101;
          v105[2] = v102;
        }
        ++v103;
        v102 = v101;
        v101 = v104;
      }
      while (v21 != v103);
    }
    if (!v96 && *(_BYTE *)(*v20 + (int)v97))
    {
      v106 = (_DWORD *)(*(_QWORD *)(a1 + 160) + 12 * *(int *)(*(_QWORD *)(a1 + 384) + 4 * (int)v97));
      *v106 = a2;
      v106[1] = *v99;
      v106[2] = *(_DWORD *)(v98 + 16 * a2 + 12);
    }
  }
  if (*(_BYTE *)(a6 + 17))
    v117 = *(_BYTE *)(a6 + 18) == 0;
  else
    v117 = 1;
  v118 = v117;
  if (v136 >= 1)
  {
    v119 = *(_QWORD *)(a1 + 528);
    v120 = v136;
    v121 = (int *)(*(_QWORD *)(a1 + 384) + 4);
    do
    {
      v123 = *(v121 - 1);
      v122 = *v121;
      v124 = v119 + 16 * v122;
      *(_DWORD *)(v124 + 4) = v123;
      *(_DWORD *)(v124 + 8) = a2;
      v125 = (_DWORD *)(v119 + 16 * v123);
      *v125 = v122;
      v125[3] = a2;
      if (v118)
      {
        v126 = *(_QWORD *)(a1 + 504);
        ++*(_DWORD *)(v126 + 4 * v123);
        ++*(_DWORD *)(v126 + 4 * v122);
      }
      ++v121;
      --v120;
    }
    while (v120);
  }
  return result;
}

uint64_t sub_23CCCBC30(uint64_t result, int a2, int a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = result;
  if (a2 == 3 || a2 == 5)
  {
    if (a3 >= 1)
    {
      v6 = a3 + 1;
      do
      {
        v7 = (v6 - 2);
        if (*(_BYTE *)(*(_QWORD *)(v5 + 408) + v7))
          result = sub_23CCCA6AC(v5, *(_DWORD *)(*(_QWORD *)(v5 + 384) + 4 * v7), a4);
        --v6;
      }
      while (v6 > 1);
    }
  }
  else if (a3 >= 1)
  {
    v8 = 0;
    v9 = a3;
    do
    {
      if (*(_BYTE *)(*(_QWORD *)(v5 + 408) + v8))
        result = sub_23CCCA6AC(v5, *(_DWORD *)(*(_QWORD *)(v5 + 384) + 4 * v8), a4);
      ++v8;
    }
    while (v9 != v8);
  }
  return result;
}

uint64_t sub_23CCCBCE8(uint64_t a1, int *a2, _BYTE *a3, int a4, unint64_t a5, uint64_t a6, unint64_t a7, int *a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12)
{
  uint64_t result;
  int v14;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int **v32;
  int **v33;
  int *v34;
  _DWORD *v35;
  int *v36;
  unint64_t v37;
  int v38;
  int v39;
  int v40;
  int *v41;
  int *v42;
  int *v43;
  unint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int *v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  int v64;
  int *v65;
  _DWORD *v66;
  int *v67;
  unint64_t v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  int v80;
  uint64_t v81;
  _DWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  uint64_t v89;
  unsigned __int8 *v90;
  unsigned int v91;
  int v92;
  int v93;
  unsigned int v94;
  int **v95;
  _QWORD *v96;
  __int128 v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  uint64_t v104;
  int v105;
  char v106;
  int v107;
  _DWORD *v108;
  uint64_t v109;

  result = 5;
  if (a7 - 255 < 0xFFFFFFFFFFFFFF02)
    return result;
  v14 = a5;
  if (a5 > 0xFE)
    return result;
  if (!a6)
    return result;
  if (!a2)
    return result;
  if (!a9)
    return result;
  if ((*(unsigned __int8 *)(a12 + 8) | 2) == 3)
    return result;
  v21 = *(_DWORD *)(a12 + 12);
  v22 = *(_DWORD *)(a12 + 20);
  if (!a8)
  {
    if (v22)
      return result;
  }
  if (!a3 && *(_DWORD *)(a12 + 16))
    return result;
  v23 = *(_DWORD *)(a12 + 4);
  if (v23 > 0x1B || (v21 - 5) <= 1 && (a7 != 2 || !v23))
    return result;
  if ((unint64_t)a10 < 0x21)
    return 1;
  v24 = *(_QWORD *)(a1 + 216) - *(_QWORD *)(a1 + 208);
  v25 = v24 >> 2;
  if (!v22)
  {
    v30 = *(_QWORD *)(a1 + 3256);
    v31 = *(_QWORD *)(a1 + 3264);
    if (v30 == v31 || v25 != (v31 - v30) >> 2)
      return result;
LABEL_27:
    v93 = v25;
    v94 = v21 - 5;
    *(_DWORD *)(a1 + 3544) = a7;
    *(_DWORD *)(a1 + 3548) = a6;
    v95 = (int **)(a1 + 3160);
    v96 = (_QWORD *)(a1 + 3136);
    *(_DWORD *)(a1 + 3552) = a4;
    sub_23CCB659C(a1 + 3160, a7);
    sub_23CCB659C(a1 + 3184, a7);
    sub_23CCB659C(a1 + 3136, a7);
    v33 = (int **)(a1 + 3160);
    v32 = (int **)(a1 + 3184);
    if (a7)
    {
      v34 = *v95;
      v35 = *(_DWORD **)(a1 + 3184);
      v36 = a2;
      v37 = a7;
      do
      {
        v38 = *v36++;
        *v34++ = v38;
        *v35++ = v38;
        --v37;
      }
      while (v37);
    }
    if ((int)a6 >= 2)
    {
      v39 = 1;
      v40 = a7;
      do
      {
        if (a7)
        {
          v41 = *v33;
          v42 = *v32;
          v43 = &a2[v40];
          v40 += a7;
          v44 = a7;
          do
          {
            v45 = *v43;
            if (*v43 >= *v41)
              v45 = *v41;
            *v41++ = v45;
            v47 = *v43++;
            v46 = v47;
            if (*v42 > v47)
              v46 = *v42;
            *v42++ = v46;
            --v44;
          }
          while (v44);
        }
        ++v39;
      }
      while (v39 != (_DWORD)a6);
    }
    v48 = *(_DWORD *)(a12 + 4);
    if (a7)
    {
      v49 = 0;
      v50 = 1 << v48;
      v51 = *v32;
      v52 = *v33;
      result = 5;
      while (1)
      {
        v53 = v51[v49];
        v54 = v52[v49];
        if (v53 - v54 > 0xFFFFFFF)
          return 5;
        if (*(_DWORD *)(a12 + 4) && ((v54 & 0x80000000) != 0 || (int)v53 >= v50))
          return result;
        if (v94 > 1)
        {
          *(_DWORD *)(*v96 + 4 * v49) = v53 - v54;
        }
        else
        {
          *(_DWORD *)(*v96 + 4 * v49) = v53;
          v52[v49] = 0;
        }
        if (a7 == ++v49)
        {
          v48 = *(_DWORD *)(a12 + 4);
          break;
        }
      }
    }
    v97 = 0u;
    v104 = 0;
    v105 = 0;
    HIDWORD(v97) = a6;
    v98 = a7;
    v99 = v93;
    v100 = v14;
    v101 = v48;
    v102 = a4;
    v103 = 3;
    v104 = *(_QWORD *)(a12 + 16);
    v106 = *(_BYTE *)(a12 + 8);
    v107 = *(_DWORD *)(a12 + 12);
    v55 = (_DWORD *)sub_23CCC4B24(a9, a10, (uint64_t)&v97);
    if (a7)
    {
      v57 = 0;
      do
      {
        v58 = v56 < 4;
        v56 -= 4;
        if (v58)
        {
          v56 = 0;
          v55 = 0;
        }
        else
        {
          *v55++ = (*v95)[v57];
        }
        v59 = *(_DWORD *)(*v96 + 4 * v57);
        v60 = 32 - __clz(v59);
        if (v59)
          v61 = v60;
        else
          v61 = 0;
        *(_DWORD *)(*v96 + 4 * v57++) = v61;
      }
      while (a7 != v57);
      v62 = 0;
      do
      {
        if (v56)
        {
          --v56;
          *(_BYTE *)v55 = *(_DWORD *)(*v96 + 4 * v62);
          v55 = (_DWORD *)((char *)v55 + 1);
        }
        else
        {
          v55 = 0;
        }
        ++v62;
      }
      while (a7 != v62);
    }
    v108 = v55;
    v109 = v56;
    sub_23CCB659C(a1 + 3208, a7 * a6);
    if ((int)a6 >= 1)
    {
      v63 = 0;
      v64 = 0;
      do
      {
        if (a7)
        {
          v65 = *v95;
          v66 = (_DWORD *)(*(_QWORD *)(a1 + 3208) + 4 * v64);
          v67 = &a2[v64];
          v64 += a7;
          v68 = a7;
          do
          {
            v70 = *v67++;
            v69 = v70;
            v71 = *v65++;
            *v66++ = v69 - v71;
            --v68;
          }
          while (v68);
        }
        ++v63;
      }
      while (v63 != (_DWORD)a6);
    }
    if (*(_DWORD *)(a12 + 20))
    {
      v72 = *(unsigned int *)(a1 + 4);
      sub_23CCB659C(a1 + 3256, (uint64_t)(*(_QWORD *)(a1 + 216) - *(_QWORD *)(a1 + 208)) >> 2);
      if ((int)v72 >= 1)
      {
        v73 = 0;
        v74 = *(_QWORD *)(a1 + 256);
        v75 = *(_QWORD *)(a1 + 232);
        do
        {
          v76 = *(int *)(v75 + 4 * v73);
          v77 = v73 + 1;
          v78 = *(int *)(v75 + 4 * (v73 + 1));
          v79 = v78 - v76;
          if ((int)v78 > (int)v76)
          {
            v80 = *(_DWORD *)(v74 + 4 * v73);
            v81 = v78 - v76;
            v82 = (_DWORD *)(*(_QWORD *)(a1 + 3256) + 4 * v76);
            do
            {
              *v82++ = a8[v80 % v79 + (int)v76];
              ++v80;
              --v81;
            }
            while (v81);
          }
          v73 = v77;
        }
        while (v77 != v72);
      }
    }
    if (a3 && *(_DWORD *)(a12 + 16))
    {
      sub_23CCC1B5C((unint64_t *)(a1 + 3232), (int)a6);
      if ((int)a6 >= 1)
      {
        v83 = 0;
        do
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 3232) + v83) = a3[v83];
          ++v83;
        }
        while (a6 != v83);
      }
      sub_23CCC1B5C((unint64_t *)(a1 + 3096), (int)a6);
      if (a6 << 32)
        memmove(*(void **)(a1 + 3096), a3, (int)a6);
    }
    else
    {
      sub_23CCC1B5C((unint64_t *)(a1 + 3232), 0);
    }
    result = sub_23CCCC28C((unsigned int *)a1, a12, &v108);
    if ((_DWORD)result)
      return result;
    result = 1;
    if (!v108 || v109 < 0)
      return result;
    v84 = (a10 & ~(a10 >> 63)) - v109;
    if (a10 - v84 >= 0)
      v85 = (a10 & ~(a10 >> 63)) - v109;
    else
      v85 = 0;
    if (a10 - v84 >= 0)
      v86 = a9;
    else
      v86 = 0;
    v87 = v85 & ~(v85 >> 63);
    *a11 = v87;
    if (v85 >= 16)
    {
      *(_DWORD *)(v86 + 12) = v87;
      v89 = v85 - 8;
    }
    else
    {
      v88 = v85 == 8;
      v58 = v85 < 8;
      v89 = v85 - 8;
      if (v58)
        return 0;
      if (v88)
      {
        v91 = -1;
LABEL_104:
        result = 0;
        *(_DWORD *)(v86 + 4) = v91;
        return result;
      }
    }
    v90 = (unsigned __int8 *)(v86 + 8);
    v91 = -1;
    do
    {
      v92 = *v90++;
      v91 = dword_23CCD3FC8[v92 ^ HIBYTE(v91)] ^ (v91 << 8);
      --v89;
    }
    while (v89);
    goto LABEL_104;
  }
  if ((int)v25 < 1)
    goto LABEL_27;
  v26 = ((unint64_t)v24 >> 2);
  v27 = a8;
  while (1)
  {
    v29 = *v27++;
    v28 = v29;
    if (v29 < 0 || v28 >= (int)a6)
      return result;
    if (!--v26)
      goto LABEL_27;
  }
}

uint64_t sub_23CCCC28C(unsigned int *a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  unsigned int *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  uint64_t v85;
  int v86;
  uint64_t result;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unsigned int *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int **v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  void *__p[3];
  __int16 v104;
  __int16 v105;
  __int16 v106;
  __int16 v107;
  _WORD __b[3];
  _DWORD v109[10];
  uint64_t v110;

  v3 = a3;
  v110 = *MEMORY[0x24BDAC8D0];
  v6 = a3[1];
  v92 = (unsigned int *)*a3;
  *a3 += 4;
  a3[1] = v6 - 4;
  v7 = a1 + 890;
  a1[891] = (v6 - 4) & ~((v6 - 4) >> 63);
  *((_QWORD *)a1 + 446) = v92 + 1;
  sub_23CCB4BF4((uint64_t)(a1 + 890));
  if (*(_DWORD *)(a2 + 20))
  {
    v9 = *a1;
    v8 = a1[1];
    v96 = (int)a1[887];
    v10 = *((_QWORD *)a1 + 27) - *((_QWORD *)a1 + 26);
    v99 = (int **)(a1 + 868);
    sub_23CCBC22C((uint64_t)(a1 + 868), *a1);
    if ((int)(v10 >> 2) >= 1)
    {
      v11 = (int *)*((_QWORD *)a1 + 26);
      v12 = *((_QWORD *)a1 + 434);
      v13 = (v10 >> 2);
      do
      {
        v14 = *v11++;
        ++*(_DWORD *)(v12 + 4 * v14 + 4);
        --v13;
      }
      while (v13);
    }
    sub_23CCBC298(v99);
    if ((int)v8 >= 1)
    {
      v15 = 0;
      v16 = *((_QWORD *)a1 + 440);
      v17 = *((_QWORD *)a1 + 14);
      v18 = *((_QWORD *)a1 + 29);
      do
      {
        v19 = (int *)(v18 + 4 * *(int *)(v17 + 4 * v15));
        v20 = *v19;
        v21 = v19[1];
        if ((int)v20 < (int)v21)
        {
          v22 = *((_QWORD *)a1 + 26);
          v23 = *((_QWORD *)a1 + 407);
          v24 = *((_QWORD *)a1 + 434);
          v25 = *((_QWORD *)a1 + 437);
          do
          {
            v26 = *(int *)(v22 + 4 * v20);
            v27 = *(_DWORD *)(v23 + 4 * v20);
            v28 = *(int *)(v24 + 4 * v26);
            v29 = *(int *)(v25 + 4 * v26);
            v30 = v29 + v28;
            if ((int)v29 <= 0)
            {
LABEL_13:
              *(_DWORD *)(v25 + 4 * v26) = v29 + 1;
              *(_DWORD *)(v16 + 4 * v30) = v27;
            }
            else
            {
              v30 = (int)v30;
              while (*(_DWORD *)(v16 + 4 * v28) != v27)
              {
                if (++v28 >= (int)v30)
                  goto LABEL_13;
              }
            }
            ++v20;
          }
          while (v20 != v21);
        }
        ++v15;
      }
      while (v15 != v8);
    }
    v93 = a2;
    v94 = v6;
    v95 = v3;
    memset_pattern16(__b, &unk_23CCD46A0, 6uLL);
    v107 = 0x8000;
    v106 = 0x8000;
    v31 = (uint64_t *)(a1 + 820);
    sub_23CCB659C((uint64_t)(a1 + 832), 0);
    sub_23CCB659C((uint64_t)(a1 + 820), 0);
    v100 = a1 + 826;
    sub_23CCB659C((uint64_t)(a1 + 826), 0);
    v109[0] = -1;
    sub_23CCBA1AC((uint64_t)(a1 + 832), v96, v109);
    v109[0] = -1;
    sub_23CCBA1AC((uint64_t)(a1 + 820), v96, v109);
    v109[0] = -1;
    sub_23CCBA1AC((uint64_t)(a1 + 826), v96, v109);
    v98 = v8;
    v102 = *((_QWORD *)a1 + 440);
    v91 = (int)v9;
    if ((int)v9 <= 0)
    {
      v49 = 0;
    }
    else
    {
      v32 = 0;
      v97 = v9;
      v33 = 4 * v9;
      do
      {
        v34 = *(int *)(*((_QWORD *)a1 + 11) + v32);
        v35 = *((_QWORD *)a1 + 437);
        v36 = (unsigned int *)(*((_QWORD *)a1 + 17) + 12 * v34);
        v37 = *v36;
        if ((v37 & 0x80000000) != 0)
          v38 = 0;
        else
          v38 = *(_DWORD *)(v35 + 4 * v37);
        v39 = v36[1];
        if ((v39 & 0x80000000) != 0)
          v40 = 0;
        else
          v40 = *(_DWORD *)(v35 + 4 * v39);
        v41 = (unsigned int *)(*((_QWORD *)a1 + 20) + 12 * v34);
        v42 = *v41;
        if ((v42 & 0x80000000) != 0)
          v43 = 0;
        else
          v43 = *(_DWORD *)(v35 + 4 * v42);
        v44 = v41[1];
        if ((v44 & 0x80000000) != 0)
          v45 = 0;
        else
          v45 = *(_DWORD *)(v35 + 4 * v44);
        v46 = *(_DWORD *)(v35 + 4 * v34);
        v47 = v43 == v45;
        if (v38 == v40)
          ++v47;
        sub_23CCC4CE0((uint64_t)v7, v46 == 1, &__b[v47]);
        if (v46 != 1)
        {
          if (v46)
          {
            sub_23CCC4CE0((uint64_t)v7, 0, &v107);
            sub_23CCD3C80((uint64_t)v7, v46 - 2, 0, &v106);
          }
          else
          {
            sub_23CCC4CE0((uint64_t)v7, 1, &v107);
          }
        }
        v32 += 4;
      }
      while (v33 != v32);
      v48 = 0;
      v49 = 0;
      v105 = 0x8000;
      v104 = 0x8000;
      do
      {
        v50 = *(_DWORD *)(*((_QWORD *)a1 + 11) + 4 * v48);
        v51 = *(int *)(*((_QWORD *)a1 + 437) + 4 * v50);
        if ((int)v51 >= 1)
        {
          v52 = (*v99)[v50];
          v53 = v52 + v51;
          do
          {
            v54 = *(_DWORD *)(v102 + 4 * v52);
            if (*(_DWORD *)(*v31 + 4 * v54) == -1)
            {
              sub_23CCC4CE0((uint64_t)v7, 1, &v105);
              *(_DWORD *)(*v31 + 4 * v54) = v49;
              *(_DWORD *)(*v100 + 4 * v49) = v54;
              *(_DWORD *)(*((_QWORD *)a1 + 416) + 4 * v54) = v50;
              ++v49;
            }
            else
            {
              sub_23CCC4CE0((uint64_t)v7, 0, &v105);
              sub_23CCD3C80((uint64_t)v7, v49 + ~*(_DWORD *)(*v31 + 4 * v54), 0, &v104);
            }
            ++v52;
          }
          while (v52 < v53);
        }
        ++v48;
        LODWORD(v9) = v97;
      }
      while (v48 != v97);
    }
    if ((int)v96 >= 1)
    {
      v55 = 0;
      v56 = *v31;
      do
      {
        if (*(_DWORD *)(v56 + 4 * v55) == -1)
        {
          *(_DWORD *)(v56 + 4 * v55) = v49;
          *(_DWORD *)(*v100 + 4 * v49++) = v55;
        }
        ++v55;
      }
      while (v96 != v55);
    }
    sub_23CCBC22C((uint64_t)(a1 + 850), v96);
    if ((int)v98 <= 0)
    {
      sub_23CCBC298((int **)a1 + 425);
      v109[0] = 0;
      sub_23CCC14E0(__p, v91, v109);
    }
    else
    {
      v57 = 0;
      v58 = *((_QWORD *)a1 + 29);
      do
      {
        v59 = *(int *)(v58 + 4 * v57++);
        v60 = *(int *)(v58 + 4 * v57);
        if ((int)v59 < (int)v60)
        {
          v61 = *((_QWORD *)a1 + 425);
          v62 = v60 - v59;
          v63 = (int *)(*((_QWORD *)a1 + 407) + 4 * v59);
          do
          {
            v64 = *v63++;
            ++*(_DWORD *)(v61 + 4 * v64 + 4);
            --v62;
          }
          while (v62);
        }
      }
      while (v57 != v98);
      sub_23CCBC298((int **)a1 + 425);
      v109[0] = 0;
      sub_23CCC14E0(__p, (int)v9, v109);
      memset_pattern16(v109, &unk_23CCD46A0, 0x28uLL);
      v65 = 0;
      v66 = 0;
      do
      {
        v101 = v65;
        v67 = *(int *)(*((_QWORD *)a1 + 14) + 4 * v65);
        v68 = *((_QWORD *)a1 + 29);
        v69 = *(int *)(v68 + 4 * v67);
        v70 = *(_DWORD *)(v68 + 4 * ((int)v67 + 1));
        if ((int)v69 < v70)
        {
          do
          {
            v71 = *(int *)(*((_QWORD *)a1 + 26) + 4 * v69);
            v72 = *(int *)(*((_QWORD *)a1 + 407) + 4 * v69);
            v73 = *((_QWORD *)a1 + 437);
            v74 = *(_DWORD *)(v73 + 4 * v71);
            v75 = *(_DWORD *)(*((_QWORD *)a1 + 425) + 4 * v72);
            v76 = *((_QWORD *)a1 + 428);
            v77 = *(_DWORD *)(v76 + 4 * v72);
            *(_DWORD *)(v76 + 4 * v72) = v77 + 1;
            *(_DWORD *)(*((_QWORD *)a1 + 431) + 4 * (v77 + v75)) = v67;
            if (v74 < 2)
            {
              v79 = v66;
            }
            else
            {
              v78 = *(_DWORD *)(v73 + 4 * v71);
              if (v78 < 1)
              {
LABEL_65:
                v79 = 0;
              }
              else
              {
                v79 = 0;
                v80 = (*v99)[v71];
                v81 = v78 + (int)v80;
                while ((_DWORD)v72 != *(_DWORD *)(v102 + 4 * v80 + 4 * v79))
                {
                  ++v79;
                  if (v80 + v79 >= v81)
                    goto LABEL_65;
                }
              }
              if ((int)v66 >= 1)
                LODWORD(v66) = 1;
              v82 = *((_DWORD *)__p[0] + v71);
              *((_DWORD *)__p[0] + v71) = v82 + 1;
              if (v82 >= 4)
                v83 = 4;
              else
                v83 = v82;
              v84 = v66 + 2 * v83;
              sub_23CCC4CE0((uint64_t)v7, v79 != 0, &v109[v84]);
              if ((_DWORD)v79)
              {
                v85 = v84;
                v86 = v79 - 1;
                if ((_DWORD)v79 != 1)
                {
                  do
                  {
                    sub_23CCC4CE0((uint64_t)v7, 1, (_WORD *)&v109[v85] + 1);
                    --v86;
                  }
                  while (v86);
                }
                if (v74 - 1 > (int)v79)
                  sub_23CCC4CE0((uint64_t)v7, 0, (_WORD *)&v109[v85] + 1);
              }
            }
            ++v69;
            v66 = v79;
          }
          while (v70 != (_DWORD)v69);
        }
        v65 = v101 + 1;
      }
      while (v101 + 1 != v98);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v6 = v94;
    v3 = v95;
    a2 = v93;
  }
  result = sub_23CCCD488((uint64_t)a1, a2);
  if (!(_DWORD)result)
  {
    v88 = sub_23CCC9C98((uint64_t)v7);
    if (v6 >= 4)
      *v92 = v88;
    v89 = v88;
    if (*v3)
      v89 = *v3 + v88;
    v90 = v3[1] - v88;
    *v3 = v89;
    v3[1] = v90;
    return *v7;
  }
  return result;
}

_QWORD *sub_23CCCC9AC(_QWORD *result, unsigned int a2, int a3, unsigned int *a4, _DWORD *a5)
{
  uint64_t v5;
  _QWORD *v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = *a4;
  *(_QWORD *)a5 = -1;
  a5[2] = -1;
  if ((v5 & 0x80000000) == 0)
  {
    v7 = result;
    v8 = a5 + 1;
    v35 = result[440];
    v9 = result[437];
    v10 = *(_DWORD *)(v9 + 4 * a2);
    v11 = a4[2];
    v12 = (int)a4[1];
    v13 = a4[1];
    if ((v11 & 0x80000000) != 0)
    {
      if ((v12 & 0x80000000) == 0)
      {
        v20 = *(_DWORD *)(v9 + 4 * v5);
        v21 = *(_DWORD *)(v9 + 4 * v13);
        if (v10 == 1 && v20 == 1 && v21 == 1)
        {
          v34 = result[434];
          *a5 = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v5));
          a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v13));
        }
        else
        {
          return sub_23CCCCBBC(result, a3, a2, v5, v13, a5, v8);
        }
      }
    }
    else
    {
      v14 = *(_DWORD *)(v9 + 4 * v5);
      v15 = *(_DWORD *)(v9 + 4 * v12);
      if (v10 == 1 && v14 == 1 && v15 == 1)
      {
        v24 = result[434];
        v19 = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v5));
        *a5 = v19;
        a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v12));
        if (v19 < 0)
          return result;
      }
      else
      {
        v18 = a4[1];
        result = sub_23CCCCBBC(result, a3, a2, v5, v12, a5, v8);
        v13 = v18;
        v19 = *a5;
        if ((*a5 & 0x80000000) != 0)
          return result;
      }
      v25 = *v8;
      if ((v25 & 0x80000000) == 0)
      {
        v26 = *(int *)(v7[437] + 4 * v11);
        if ((_DWORD)v26 == 1 && v14 == 1 && v15 == 1)
        {
          a5[2] = *(_DWORD *)(v35 + 4 * *(int *)(v7[434] + 4 * v11));
        }
        else if ((int)v26 >= 1)
        {
          v29 = *(int *)(v7[434] + 4 * v11);
          v30 = v29 + v26;
          do
          {
            v31 = *(_DWORD *)(v35 + 4 * v29);
            v36 = 0;
            v32 = v13;
            result = sub_23CCCCBBC(v7, v31, v11, v5, v13, (_DWORD *)&v36 + 1, (int *)&v36);
            if (HIDWORD(v36) == v19 && (_DWORD)v36 == v25)
              a5[2] = v31;
            ++v29;
            v13 = v32;
          }
          while (v29 < v30);
        }
      }
    }
  }
  return result;
}

_QWORD *sub_23CCCCBBC(_QWORD *result, int a2, int a3, int a4, int a5, _DWORD *a6, int *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;

  v7 = *(int *)(result[428] + 4 * a2);
  if ((int)v7 >= 1)
  {
    v8 = *(int *)(result[425] + 4 * a2);
    v9 = v8 + v7;
    v10 = result[26];
    while (2)
    {
      v11 = (int *)(result[29] + 4 * *(int *)(result[431] + 4 * v8));
      v12 = *v11;
      v13 = v11[1];
      v14 = *(_DWORD *)(v10 + 4 * v12);
      v15 = (int)v12 + 1;
      v16 = 4 * v15 - 4;
      v17 = v15 + 1;
      while (v17 < v13)
      {
        v18 = *(_DWORD *)(v10 + v16 + 4);
        v19 = *(_DWORD *)(v10 + v16 + 8);
        if (v14 == a3 && v18 == a4 && v19 == a5)
        {
          v27 = result[407] + v16;
          *a6 = *(_DWORD *)(v27 + 4);
LABEL_41:
          v26 = *(_DWORD *)(v27 + 8);
          goto LABEL_45;
        }
        if (v14 == a3 && v19 == a4 && v18 == a5)
        {
          v28 = result[407] + v16;
          *a7 = *(_DWORD *)(v28 + 4);
LABEL_43:
          v33 = *(_DWORD *)(v28 + 8);
          goto LABEL_46;
        }
        if (v18 == a3 && v14 == a4 && v19 == a5)
        {
          v29 = result[407];
          *a6 = *(_DWORD *)(v29 + 4 * v12);
          v27 = v29 + v16;
          goto LABEL_41;
        }
        if (v18 == a3 && v19 == a4 && v14 == a5)
        {
          v30 = result[407];
          *a7 = *(_DWORD *)(v30 + 4 * v12);
          v28 = v30 + v16;
          goto LABEL_43;
        }
        if (v19 == a3 && v14 == a4 && v18 == a5)
        {
          v31 = result[407];
          *a6 = *(_DWORD *)(v31 + 4 * v12);
          v26 = *(_DWORD *)(v31 + v16 + 4);
          goto LABEL_45;
        }
        v16 += 4;
        ++v17;
        if (v19 == a3 && v18 == a4 && v14 == a5)
        {
          v32 = result[407];
          *a7 = *(_DWORD *)(v32 + 4 * v12);
          v33 = *(_DWORD *)(v32 + v16);
LABEL_46:
          *a6 = v33;
          return result;
        }
      }
      if (++v8 < v9)
        continue;
      break;
    }
  }
  v26 = -1;
  *a6 = -1;
LABEL_45:
  *a7 = v26;
  return result;
}

uint64_t sub_23CCCCD44(uint64_t a1, int a2, int *a3, uint64_t a4, int a5)
{
  int *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  int *v24;
  uint64_t v25;
  int v26;

  v6 = a3;
  v8 = *(_QWORD *)(a1 + 3208);
  v9 = *(unsigned int *)(a1 + 3544);
  v10 = *(_QWORD *)(a1 + 3280);
  v11 = *(_DWORD *)(v10 + 4 * a2);
  v12 = *(int *)(*(_QWORD *)(a1 + 3400) + 4 * a2);
  v13 = *(_QWORD *)(a1 + 3448);
  v14 = *(int *)(*(_QWORD *)(a1 + 3424) + 4 * a2);
  if (a4 - (uint64_t)a3 >= 1)
    bzero(a3, 4 * (((unint64_t)(a4 - (_QWORD)a3) >> 2) - ((unint64_t)(a4 - (_QWORD)a3) > 3)) + 4);
  if ((int)v14 < 1)
    return 0;
  result = 0;
  v16 = v14 + v12;
  v17 = *(_QWORD *)(a1 + 232);
  do
  {
    v18 = (int *)(v17 + 4 * *(int *)(v13 + 4 * v12));
    v19 = *v18;
    v20 = v18[1];
    if ((int)v19 < (int)v20)
    {
      v21 = *(_QWORD *)(a1 + 3256);
      do
      {
        v22 = *(int *)(v21 + 4 * v19);
        if (*(_DWORD *)(v10 + 4 * v22) < v11 && (!a5 || *(_BYTE *)(*(_QWORD *)(a1 + 3232) + v22)))
        {
          if ((int)v9 >= 1)
          {
            v23 = (int *)(v8 + 4 * (int)v22 * (int)v9);
            v24 = v6;
            v25 = v9;
            do
            {
              v26 = *v23++;
              *v24++ += v26;
              --v25;
            }
            while (v25);
          }
          result = (result + 1);
        }
        ++v19;
      }
      while (v19 < v20 && (int)result < 4);
    }
    ++v12;
  }
  while (v12 < v16 && (int)result < 4);
  if ((int)v9 >= 1 && (int)result >= 2)
  {
    do
    {
      *v6++ /= (int)result;
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_23CCCCEAC(uint64_t a1, int a2, uint64_t a3, char a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t result;
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int32x2_t v25;
  int32x2_t v26;

  v5 = *(_QWORD *)(a1 + 3208);
  v6 = *(_QWORD *)(a1 + 3280);
  v7 = *(_DWORD *)(v6 + 4 * a2);
  v8 = *(unsigned int *)(a1 + 3544);
  v9 = *(_QWORD *)(a1 + 3448);
  v10 = *(int *)(*(_QWORD *)(a1 + 3400) + 4 * a2);
  v11 = *(_DWORD *)(*(_QWORD *)(a1 + 3424) + 4 * a2);
  *(_QWORD *)a3 = 0;
  *(_DWORD *)(a3 + 8) = 0;
  if (v11 < 1)
    return 0;
  result = 0;
  v14 = 0;
  v15 = ~(-1 << (a4 - 1));
  v16 = v11 + v10;
  v17 = *(_QWORD *)(a1 + 232);
  v18 = 0;
  v19 = vdup_n_s32(v15);
  do
  {
    v20 = (int *)(v17 + 4 * *(int *)(v9 + 4 * v10));
    v21 = *v20;
    v22 = v20[1];
    if ((int)v21 < (int)v22)
    {
      v23 = *(_QWORD *)(a1 + 3256);
      do
      {
        v24 = *(int *)(v23 + 4 * v21);
        if (*(_DWORD *)(v6 + 4 * v24) < v7 && (!a5 || *(_BYTE *)(*(_QWORD *)(a1 + 3232) + v24)))
        {
          v25 = vsub_s32(*(int32x2_t *)(v5 + 4 * (int)v24 * (int)v8), v19);
          v26 = vabs_s32(vrev64_s32(v25));
          if ((int)(v15 - v26.i32[1] - v26.i32[0]) < 0)
            v25 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v25), (int8x8_t)vsub_s32(v26, v19), (int8x8_t)__PAIR64__(v15 - v26.i32[1], v15 - v26.i32[0]));
          v18 = vadd_s32(v25, v18);
          *(int32x2_t *)a3 = v18;
          v14 += v15 - v26.i32[1] - v26.i32[0];
          *(_DWORD *)(a3 + 8) = v14;
          result = (result + 1);
        }
        ++v21;
      }
      while (v21 < v22 && (int)result < 4);
    }
    ++v10;
  }
  while (v10 < v16 && (int)result < 4);
  if ((int)v8 >= 1 && (int)result >= 2)
  {
    do
    {
      *(int *)a3 /= (int)result;
      a3 += 4;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_23CCCD000(int a1, int a2, char a3, unsigned __int16 *a4, int a5, _QWORD *a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned __int16 *v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  int v33;
  int v34;
  char v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  unsigned int v53;

  v6 = *a4;
  if ((a3 & 1) != 0)
    v6 = 0x10000 - v6;
  v7 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v6 + 2048) >> 10) & 0xFCLL));
  v8 = 0x10000 - a4[(a3 & 1) + 1];
  if ((a3 & 2) == 0)
    v8 = a4[(a3 & 1) + 1];
  v9 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v8 + 2048) >> 10) & 0xFCLL));
  if (!a5)
  {
    v10 = *(unsigned __int16 *)(*a6 + 2 * a2);
    if (a1)
    {
      v11 = a2;
      v32 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - v10) >> 10) & 0x7CLL));
      v33 = *(unsigned __int16 *)(a6[3] + 2 * a2);
      if (a1 >= 0)
        v33 = 0x10000 - v33;
      v34 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v33 + 2048) >> 10) & 0xFCLL));
      if (a1 >= 0)
        v15 = a1;
      else
        v15 = -a1;
      v16 = v34 + v32;
      v17 = (unsigned __int16 *)(a6[6] + 2 * (a2 << 6));
      if (v15 <= 0x3F)
      {
        v35 = v15 - 1;
        v36 = *v17;
        if ((((_BYTE)v15 - 1) & 1) != 0)
          v36 = 0x10000 - v36;
        v20 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v36 + 2048) >> 10) & 0xFCLL));
        v37 = v17[(v35 & 1) + 1];
        if ((v35 & 2) != 0)
          v37 = 0x10000 - v37;
        v22 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v37 + 2048) >> 10) & 0xFCLL));
        v38 = v17[(v35 & 3) + 3];
        if ((v35 & 4) != 0)
          v38 = 0x10000 - v38;
        v24 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v38 + 2048) >> 10) & 0xFCLL));
        v39 = v17[(v35 & 7) + 7];
        if ((v35 & 8) != 0)
          v39 = 0x10000 - v39;
        v26 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v39 + 2048) >> 10) & 0xFCLL));
        v40 = v17[(v35 & 0xF) + 15];
        if ((v35 & 0x10) != 0)
          v40 = 0x10000 - v40;
        v28 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v40 + 2048) >> 10) & 0xFCLL));
        v29 = v17[(v35 & 0x1F) + 31];
        v30 = 0x10000 - v29;
        v31 = (v35 & 0x20) == 0;
        goto LABEL_44;
      }
LABEL_52:
      v45 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)*v17) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v46 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v17[2]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v47 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v17[6]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v48 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v17[14]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v49 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v17[30]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v50 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v17[62]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v51 = *(_DWORD *)(a6[12] + 4 * v11);
      v41 = v16 + v45 + v46 + v47 + v48 + v49 + v50 + (v51 << 10) + 66560 - (__clz(((v15 - 64) >> v51) + 1) << 11);
      return (v9 + v7 + v41);
    }
LABEL_51:
    v41 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v10 + 2048) >> 10) & 0x7CLL));
    return (v9 + v7 + v41);
  }
  if (a5 == 2)
  {
    if (a1 < 1)
    {
      if ((a1 & 0x80000000) == 0)
      {
        v44 = 0;
        v42 = a2;
        goto LABEL_55;
      }
      v42 = a2;
      v43 = *(unsigned __int16 *)(a6[3] + 2 * a2) + 2048;
    }
    else
    {
      v42 = a2;
      v43 = 67584 - *(unsigned __int16 *)(a6[3] + 2 * a2);
    }
    v44 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((v43 >> 10) & 0x7CLL));
LABEL_55:
    v52 = *(_DWORD *)(a6[12] + 4 * v42);
    if (a1 >= 0)
      v53 = a1;
    else
      v53 = -a1;
    v41 = v44 + (v52 << 10) + 66560 - (__clz((v53 >> v52) + 1) << 11);
    return (v9 + v7 + v41);
  }
  if (a5 != 4)
  {
    v41 = 0;
    return (v9 + v7 + v41);
  }
  v10 = *(unsigned __int16 *)(*a6 + 2 * a2);
  if (!a1)
    goto LABEL_51;
  v11 = a2;
  v12 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - v10) >> 10) & 0x7CLL));
  v13 = *(unsigned __int16 *)(a6[3] + 2 * a2);
  if (a1 >= 0)
    v13 = 0x10000 - v13;
  v14 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v13 + 2048) >> 10) & 0xFCLL));
  if (a1 >= 0)
    v15 = a1;
  else
    v15 = -a1;
  v16 = v14 + v12;
  v17 = (unsigned __int16 *)(a6[6] + 2 * (a2 << 6));
  if (v15 > 0x3F)
    goto LABEL_52;
  v18 = v15 - 1;
  v19 = *v17;
  if (((v15 - 1) & 0x20) != 0)
    v19 = 0x10000 - v19;
  v20 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v19 + 2048) >> 10) & 0xFCLL));
  v21 = v17[(v18 >> 5) + 1];
  if ((v18 & 0x10) != 0)
    v21 = 0x10000 - v21;
  v22 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v21 + 2048) >> 10) & 0xFCLL));
  v23 = v17[(v18 >> 4) + 3];
  if ((v18 & 8) != 0)
    v23 = 0x10000 - v23;
  v24 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v23 + 2048) >> 10) & 0xFCLL));
  v25 = v17[(v18 >> 3) + 7];
  if ((v18 & 4) != 0)
    v25 = 0x10000 - v25;
  v26 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v25 + 2048) >> 10) & 0xFCLL));
  v27 = v17[(v18 >> 2) + 15];
  if ((v18 & 2) != 0)
    v27 = 0x10000 - v27;
  v28 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v27 + 2048) >> 10) & 0xFCLL));
  v29 = v17[(v18 >> 1) + 31];
  v30 = 0x10000 - v29;
  v31 = (v18 & 1) == 0;
LABEL_44:
  if (!v31)
    v29 = v30;
  v41 = v20
      + v16
      + v22
      + v24
      + v26
      + v28
      + *(_DWORD *)((char *)&unk_23CCD46E0 + (((v29 + 2048) >> 10) & 0xFCLL));
  return (v9 + v7 + v41);
}

uint64_t sub_23CCCD488(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  int *v33;
  int *v34;
  int v35;
  int v36;
  int v37;
  BOOL v38;
  int v39;
  unsigned int v40;
  int v41;
  uint64_t j;
  unsigned int v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  int v48;
  char v49;
  unsigned int v50;
  int v51;
  int v52;
  signed int v53;
  int v54;
  char *v55;
  int *v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  unint64_t i;
  void **v62;
  void *v63;
  void *v64;
  void **v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  int v80;
  int v81;
  int v82;
  _DWORD *v83;
  unint64_t v84;
  int v85;
  uint64_t v86;
  int *v87;
  int *v88;
  int *v89;
  _DWORD *v90;
  uint64_t v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  unsigned int v98;
  uint64_t v99;
  int *v100;
  int *v101;
  int *v102;
  uint64_t v103;
  int v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  int *v119;
  int *v120;
  int *v121;
  int *v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  unint64_t v129;
  int v130;
  int v131;
  uint64_t v132;
  int v133;
  int v134;
  int v135;
  uint64_t v136;
  int v137;
  int v138;
  int *v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  uint64_t v151;
  int v152;
  uint64_t v153;
  unsigned int v154;
  _DWORD *v155;
  _DWORD *v156;
  int v157;
  int v158;
  int v159;
  char v160;
  unsigned int v161;
  int v162;
  int v163;
  signed int v164;
  int v165;
  char *v166;
  int *v167;
  uint64_t v168;
  int v169;
  int v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int *v183;
  unsigned int v184;
  uint64_t v185;
  unsigned int *v186;
  unint64_t v187;
  unsigned int v188;
  int v189;
  int *v190;
  int v191;
  int v192;
  int v193;
  unsigned int v194;
  unsigned int v195;
  int v196;
  int v197;
  uint64_t v198;
  unsigned int v199;
  int *v200;
  int v201;
  int *v202;
  int *v203;
  int *v204;
  int *v205;
  unint64_t v206;
  int *v207;
  char *v208;
  _DWORD *v209;
  int v210;
  int v211;
  int v212;
  _DWORD *v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int *v218;
  uint64_t v219;
  int *v220;
  int *v221;
  int *v222;
  int v223;
  _DWORD *v224;
  uint64_t v225;
  uint64_t v226;
  int v227;
  int v228;
  unsigned int v229;
  uint64_t v230;
  uint64_t v231;
  unsigned int v232;
  _DWORD *v233;
  _DWORD *v234;
  int v235;
  int v236;
  char v237;
  unsigned int v238;
  int v239;
  int v240;
  signed int v241;
  int v242;
  unint64_t v243;
  int v244;
  int v245;
  int v246;
  uint64_t v247;
  _DWORD *v248;
  char *v249;
  _DWORD *v250;
  int *v251;
  int *v252;
  int *v253;
  int v254;
  int v255;
  int v256;
  int v257;
  uint64_t v258;
  int v259;
  int v260;
  int v261;
  uint64_t v262;
  signed int v263;
  int v264;
  int v265;
  signed int v266;
  int v267;
  signed int v268;
  signed int v269;
  signed int v270;
  int *v271;
  int *v272;
  int *v273;
  int *v274;
  unint64_t v275;
  uint64_t v276;
  uint64_t v277;
  int v278;
  int v279;
  int v280;
  unint64_t v281;
  int v282;
  int v283;
  int v284;
  unint64_t v285;
  uint64_t v286;
  int v287;
  uint64_t v288;
  int v289;
  int v290;
  int v291;
  uint64_t v292;
  signed int v293;
  int v294;
  unint64_t v295;
  int v296;
  int v297;
  signed int v298;
  signed int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  uint64_t v310;
  uint64_t v311;
  int *v312;
  int v313;
  char *v314;
  int *v315;
  uint64_t v316;
  int v317;
  int v318;
  int v319;
  _QWORD *v321;
  uint64_t v322;
  unint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  unsigned int v328;
  _QWORD *v329;
  int v330;
  int v331;
  int v332;
  uint64_t v333;
  int *v334;
  int *v335;
  int *v336;
  _DWORD *v337;
  uint64_t v338;
  int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  unsigned int v344;
  uint64_t v345;
  int *v346;
  int *v347;
  int *v348;
  uint64_t v349;
  int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  uint64_t v355;
  unsigned int v356;
  char *v357;
  char *v358;
  int v359;
  int v360;
  int v361;
  char v362;
  unsigned int v363;
  int v364;
  int v365;
  signed int v366;
  int v367;
  char *v368;
  int *v369;
  uint64_t v370;
  int v371;
  int v372;
  int v373;
  unint64_t v374;
  void **v375;
  void *v376;
  void *v377;
  void **v378;
  void *v379;
  void *v380;
  void *v381;
  uint64_t v382;
  unint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  _QWORD *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  int *v391;
  int v392;
  int v393;
  int v394;
  int *v395;
  int v396;
  int v397;
  int v398;
  int v399;
  int v400;
  unint64_t v401;
  int v402;
  uint64_t v403;
  int v404;
  int *v405;
  uint64_t v406;
  int *v407;
  int *v408;
  char *v409;
  uint64_t v410;
  int v411;
  int v412;
  unsigned int v413;
  uint64_t v414;
  int *v415;
  uint64_t v416;
  int *v417;
  uint64_t v418;
  int v419;
  uint64_t v420;
  unsigned int v421;
  _DWORD *v422;
  _DWORD *v423;
  int v424;
  int v425;
  int v426;
  char v427;
  unsigned int v428;
  int v429;
  int v430;
  signed int v431;
  int v432;
  int *v433;
  int *v434;
  int *v435;
  uint64_t v436;
  int v437;
  int v438;
  int v439;
  int v440;
  char *v441;
  int *v442;
  uint64_t v443;
  int v444;
  int v445;
  int v446;
  unint64_t v447;
  void **v448;
  void *v449;
  void *v450;
  void **v451;
  void *v452;
  void *v453;
  void *v454;
  uint64_t v455;
  int v456;
  int v457;
  uint64_t v458;
  uint64_t v459;
  _DWORD *v460;
  int v461;
  int v462;
  int v463;
  int v464;
  int v465;
  int v466;
  int v467;
  int v468;
  int v469;
  int v470;
  int *v471;
  int v472;
  int v473;
  int v474;
  int v475;
  int v476;
  int v477;
  int v478;
  uint64_t v479;
  int v480;
  int v481;
  int v482;
  unsigned int v483;
  unsigned int v484;
  unsigned int v485;
  int v487;
  int v488;
  int v489;
  unint64_t v490;
  unsigned int v491;
  unsigned int v492;
  unsigned int v493;
  void **v495;
  int *p_b;
  int v497;
  int v498;
  int v499;
  void **v500;
  void **v501;
  int v502;
  int v503;
  int v504;
  int v505;
  int v506;
  int v507;
  unsigned int v508;
  unsigned int v509;
  unsigned int v510;
  void **v511;
  unint64_t *v512;
  int v513;
  int v514;
  int v515;
  int v516;
  int v517;
  int v518;
  int v519;
  int v520;
  unsigned int v521;
  unsigned int v522;
  int v523;
  uint64_t v524;
  int v525;
  uint64_t v526;
  int v527;
  int v528;
  int v529;
  signed int v530;
  signed int v531;
  int v532;
  int v533;
  int v534;
  uint64_t v535;
  int v536;
  uint64_t v537;
  int v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  _DWORD *v542;
  uint64_t v543;
  int v544;
  int v545;
  int v546;
  int v547;
  int v548;
  int v549;
  int v550;
  int v551;
  int v552;
  _DWORD *v553;
  int v554;
  _QWORD *v555;
  int v556;
  int v557;
  int v558;
  int v559;
  unsigned int v560;
  unsigned int v561;
  int v562;
  uint64_t v563;
  _DWORD *v564;
  int v565;
  int v566;
  int v567;
  int v568;
  int v569;
  int v570;
  int v571;
  int v572;
  int v573;
  int v574;
  _DWORD *v575;
  int v576;
  int v577;
  int v578;
  int v579;
  int v580;
  int v581;
  int v582;
  int v583;
  int v584;
  _DWORD *v585;
  int v586;
  int v587;
  int v588;
  int v589;
  int v590;
  int v591;
  int v592;
  int v593;
  int v594;
  _DWORD *v595;
  int v596;
  int v597;
  int v598;
  int v599;
  int v600;
  int v601;
  int v602;
  int v603;
  int v604;
  int v605;
  _DWORD *v606;
  int v607;
  int v608;
  int v609;
  int v610;
  int v611;
  int v612;
  int v613;
  int v614;
  int v615;
  _DWORD *v616;
  int v617;
  int v618;
  int v619;
  int v620;
  int v621;
  int v622;
  int v623;
  int v624;
  int v625;
  int v626;
  uint64_t v627;
  int v628;
  int v629;
  int v630;
  int v631;
  int v632;
  int v633;
  int v634;
  int v635;
  int v636;
  int v637;
  unint64_t v638;
  int v639;
  int v640;
  int v641;
  unsigned int v642;
  unsigned int v643;
  unsigned int v644;
  uint64_t *v645;
  int *v646;
  int v647;
  uint64_t v648;
  int v649;
  int v650;
  uint64_t v651;
  _DWORD *v652;
  int v653;
  int v654;
  int v655;
  int v656;
  int v657;
  int v658;
  int v659;
  int v660;
  int v661;
  int v662;
  int v663;
  _DWORD *v664;
  int v665;
  int v666;
  int v667;
  int v668;
  int v669;
  int v670;
  int v671;
  int v672;
  int v673;
  _DWORD *v674;
  int v675;
  int v676;
  int v677;
  int v678;
  int v679;
  int v680;
  int v681;
  int v682;
  int v683;
  uint64_t v684;
  int v685;
  int v686;
  int v687;
  int v688;
  int v689;
  int v690;
  int v691;
  int v692;
  int v693;
  int v694;
  int v695;
  int v696;
  int v697;
  int v698;
  int v699;
  int v700;
  int v701;
  int v702;
  unsigned int v703;
  unsigned int v704;
  unsigned int v705;
  uint64_t *v706;
  int *v707;
  int v708;
  int v709;
  uint64_t v710;
  _DWORD *v711;
  int v712;
  int v713;
  int v714;
  int v715;
  int v716;
  int v717;
  int v718;
  int v719;
  int v720;
  int v721;
  _DWORD *v722;
  int v723;
  int v724;
  int v725;
  int v726;
  int v727;
  int v728;
  int v729;
  int v730;
  int v731;
  uint64_t v732;
  int v733;
  int v734;
  int v735;
  int v736;
  int v737;
  int v738;
  int v739;
  int v740;
  int v741;
  int v742;
  int v743;
  unsigned int v744;
  unsigned int v745;
  unsigned int v746;
  void **v747;
  int *v748;
  int v749;
  int v750;
  int v751;
  int v752;
  int v753;
  uint64_t v754;
  int v755;
  int v756;
  int v757;
  unsigned int v758;
  unsigned int v759;
  unsigned int v760;
  int v762;
  int v763;
  int v764;
  int v765;
  int v766;
  unint64_t v767;
  unsigned int v768;
  unsigned int v769;
  unsigned int v770;
  void **v772;
  _DWORD *v773;
  void **v774;
  void **v775;
  int v776;
  int v777;
  int v778;
  int v779;
  int v780;
  int v781;
  int v782;
  unsigned int v783;
  unsigned int v784;
  unsigned int v785;
  void **v786;
  unint64_t *v787;
  int v788;
  int v789;
  int v790;
  int v791;
  int v792;
  int v793;
  int v794;
  int v795;
  int v796;
  int v797;
  int v798;
  int v799;
  int v800;
  int v801;
  int v802;
  int v803;
  int v804;
  unsigned int v805;
  unsigned int v806;
  int v807;
  uint64_t v808;
  int v809;
  int v810;
  unsigned int v811;
  int v812;
  signed int v813;
  signed int v814;
  int v815;
  int v816;
  int v817;
  int v818;
  int v819;
  int v820;
  int v821;
  int v822;
  int v823;
  int v824;
  int v825;
  int v826;
  int v827;
  int v828;
  int v829;
  int v830;
  int v831;
  int v832;
  int v833;
  int v834;
  int v835;
  int v836;
  int v837;
  int v838;
  int v839;
  unsigned int v840;
  int v841;
  unsigned int v842;
  unsigned int v843;
  unsigned int v844;
  int *v845;
  int *v846;
  int v847;
  int v848;
  int v849;
  int v850;
  int v851;
  int v852;
  int v853;
  int v854;
  int v855;
  int v856;
  unsigned int v857;
  unsigned int v858;
  unsigned int v859;
  int *v860;
  int *v861;
  int v862;
  int v863;
  int v864;
  int v865;
  int v866;
  int v867;
  int v868;
  int v869;
  int v870;
  unint64_t v871;
  int v872;
  unsigned int v873;
  unsigned int v874;
  unsigned int v875;
  int *v876;
  int *v877;
  int v878;
  int v879;
  int v880;
  int v881;
  int v882;
  int v883;
  int v884;
  unsigned int v885;
  int v886;
  unsigned int v887;
  int v888;
  uint64_t v889;
  int v890;
  uint64_t v891;
  int v892;
  signed int v893;
  int v894;
  uint64_t v895;
  signed int v896;
  int v897;
  int v898;
  signed int v899;
  signed int v900;
  int v901;
  int v902;
  int v903;
  int v904;
  int v905;
  uint64_t v906;
  int v907;
  int v908;
  int v909;
  int v910;
  unsigned int v911;
  unsigned int v912;
  unsigned int v913;
  int *v914;
  int *v915;
  int v916;
  int v917;
  int v918;
  int v919;
  int v920;
  int v921;
  int v922;
  int v923;
  int v924;
  int v925;
  unsigned int v926;
  unsigned int v927;
  unsigned int v928;
  int *v929;
  int *v930;
  int v931;
  int v932;
  int v933;
  int v934;
  int v935;
  int v936;
  int v937;
  int v938;
  int v939;
  unsigned int v940;
  unsigned int v941;
  unsigned int v942;
  int *v943;
  int *v944;
  int v945;
  int v946;
  int v947;
  int v948;
  int v949;
  int v950;
  unsigned int v951;
  int v952;
  unsigned int v953;
  int v954;
  uint64_t v955;
  int v956;
  uint64_t v957;
  int v958;
  signed int v959;
  int v960;
  uint64_t v961;
  signed int v962;
  int v963;
  int v964;
  int v965;
  signed int v966;
  signed int v967;
  int v968;
  int v969;
  int v970;
  int v971;
  int v972;
  uint64_t v973;
  int v974;
  int v975;
  int v976;
  int v977;
  unsigned int v978;
  unsigned int v979;
  unsigned int v980;
  uint64_t *v981;
  int *v982;
  int v983;
  int v984;
  int v985;
  int v986;
  int v987;
  int v988;
  unsigned int v989;
  int v990;
  unsigned int v991;
  unsigned int v992;
  int v993;
  unsigned int v994;
  int v995;
  uint64_t v996;
  int v997;
  unsigned int v998;
  int v999;
  int v1000;
  signed int v1001;
  signed int v1002;
  int v1003;
  unint64_t v1004;
  void **v1005;
  void *v1006;
  void *v1007;
  void **v1008;
  void *v1009;
  void *v1010;
  void *v1011;
  unint64_t v1012;
  void **v1013;
  void *v1014;
  void *v1015;
  void **v1016;
  void *v1017;
  void *v1018;
  void *v1019;
  unint64_t v1020;
  void **v1021;
  void *v1022;
  void *v1023;
  void **v1024;
  void *v1025;
  void *v1026;
  void *v1027;
  int v1028;
  int v1029;
  int v1030;
  int v1031;
  int v1032;
  int v1033;
  int v1034;
  int v1035;
  int v1036;
  int v1037;
  int v1038;
  int v1039;
  unsigned int v1040;
  unsigned int v1041;
  int v1042;
  int v1043;
  int v1044;
  int v1045;
  int v1046;
  int v1047;
  unsigned int v1048;
  unsigned int v1049;
  int v1050;
  int v1051;
  int v1052;
  int v1053;
  unsigned int v1054;
  unsigned int v1055;
  unsigned int v1056;
  unsigned int v1057;
  uint64_t v1058;
  int v1059;
  unsigned int v1060;
  unsigned int v1061;
  unsigned __int16 **v1062;
  int v1063;
  int v1064;
  int v1065;
  uint64_t v1066;
  int v1067;
  int v1068;
  uint64_t v1069;
  int *v1070;
  int v1071;
  int v1072;
  unsigned int v1073;
  int v1074;
  int v1075;
  unsigned int v1076;
  unsigned int v1077;
  unsigned int v1078;
  int v1079;
  int v1080;
  unsigned int v1081;
  int v1082;
  _QWORD *v1083;
  int v1084;
  uint64_t v1085;
  int v1086;
  int v1087;
  int v1088;
  uint64_t v1089;
  int v1090;
  _QWORD *v1091;
  uint64_t v1092;
  _QWORD *v1093;
  int *v1094;
  int *v1095;
  int *v1096;
  int v1097;
  _QWORD *v1098;
  unsigned int v1099;
  int v1100;
  int v1101;
  uint64_t v1102;
  unsigned int v1103;
  uint64_t v1104;
  uint64_t v1105;
  _QWORD *v1106;
  uint64_t v1107;
  int v1108;
  uint64_t v1109;
  _QWORD *v1110;
  uint64_t v1111;
  unsigned int v1112;
  signed int v1113;
  signed int v1114;
  uint64_t v1115;
  int v1116;
  int v1117;
  uint64_t v1118;
  uint64_t v1119;
  uint64_t v1120;
  uint64_t v1121;
  uint64_t v1122;
  int v1123;
  uint64_t v1124;
  int v1125;
  int v1126;
  int v1127;
  uint64_t v1128;
  int v1129;
  uint64_t v1130;
  uint64_t v1131;
  uint64_t v1132;
  int v1133;
  int v1134;
  int v1135;
  int v1136;
  int v1137;
  int v1138;
  _DWORD *v1139;
  uint64_t v1140;
  int v1141;
  int v1142;
  int v1143;
  uint64_t v1144;
  uint64_t v1145;
  uint64_t v1146;
  uint64_t v1147;
  uint64_t v1148;
  uint64_t v1149;
  uint64_t v1150;
  int v1151;
  _QWORD *v1152;
  uint64_t v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  uint64_t v1157;
  uint64_t v1158;
  int v1159;
  uint64_t v1160;
  _DWORD *v1161;
  unsigned int v1162;
  _DWORD *v1163;
  int v1164;
  _DWORD *v1165;
  _DWORD *v1166;
  int v1167;
  _DWORD *v1168;
  int v1169;
  int v1170;
  unsigned int v1171;
  int v1172;
  int v1173;
  int v1174;
  uint64_t v1175;
  uint64_t v1176;
  int *v1177;
  int v1178;
  uint64_t v1179;
  int *v1180;
  int v1181;
  int v1182;
  int v1183;
  int v1184;
  int v1185;
  int v1186;
  unint64_t v1187;
  int v1188;
  uint64_t v1189;
  int v1190;
  unint64_t v1191;
  int v1192;
  unint64_t v1193;
  int v1194;
  void *v1195;
  void *v1196;
  void *v1197;
  void *v1198;
  void *v1199;
  void *v1200;
  void *v1201;
  void *v1202;
  void *v1203;
  void *v1204;
  void *v1205;
  void *v1206;
  void *v1207;
  void *v1208;
  char *__b;
  _QWORD v1210[2];
  int v1211;
  unsigned __int16 v1212;
  int v1213;
  unsigned __int16 v1214;
  unsigned __int16 v1215[4];
  int v1216;
  int v1217;
  int v1218;
  int v1219;
  int v1220;
  int v1221;
  int v1222;
  int v1223;
  int v1224;
  int v1225;
  int v1226;
  __int16 v1227;
  unsigned __int16 v1228;
  void *__p;
  uint64_t v1230;
  uint64_t v1231;
  void *v1232[2];
  void *v1233[2];
  __int128 v1234;
  void *v1235[2];
  void *v1236[2];
  __int128 v1237;
  void *v1238[2];
  __int128 v1239;
  __int128 v1240;
  __int128 v1241;
  __int128 v1242;
  __int128 v1243;
  __int128 v1244;
  __int128 v1245;
  __int128 v1246;
  __int128 v1247;
  __int128 v1248;
  __int128 v1249;
  __int128 v1250;
  __int128 v1251;
  __int128 v1252;
  __int128 v1253;
  uint64_t v1254;
  uint64_t v1255;

  v2 = a2;
  v3 = a1;
  v1255 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    v4 = *(unsigned int *)(a1 + 3548);
    memset_pattern16(&__b, &unk_23CCD46A0, 4uLL);
    if ((int)v4 >= 1)
    {
      v5 = 0;
      v6 = 4 * v4;
      do
      {
        v7 = *(int *)(*(_QWORD *)(v3 + 3304) + v5);
        v8 = *(unsigned int *)(*(_QWORD *)(v3 + 3328) + 4 * v7);
        LODWORD(v1232[1]) = -1;
        v1232[0] = (void *)-1;
        LODWORD(v1230) = -1;
        __p = (void *)-1;
        if ((v8 & 0x80000000) != 0)
        {
          v13 = 0;
          v14 = *(_QWORD *)(v3 + 3096);
        }
        else
        {
          v9 = (unsigned int *)(*(_QWORD *)(v3 + 160) + 12 * v8);
          sub_23CCCC9AC((_QWORD *)v3, v8, v7, (unsigned int *)(*(_QWORD *)(v3 + 136) + 12 * v8), v1232);
          sub_23CCCC9AC((_QWORD *)v3, v8, v7, v9, &__p);
          v10 = (int)v1232[1];
          if (((uint64_t)v1232[1] & 0x80000000) == 0 || (v1230 & 0x80000000) != 0)
          {
            v12 = (int)v1232[1];
            v10 = v1230;
          }
          else
          {
            v11 = v1232[0];
            v1232[0] = __p;
            v12 = v1230;
            LODWORD(v1232[1]) = v1230;
            __p = v11;
          }
          if (v10 == -1)
          {
            v14 = *(_QWORD *)(v3 + 3096);
            if (v12 == -1)
            {
              if (HIDWORD(v1232[0]) == -1)
              {
                if (LODWORD(v1232[0]) == -1)
                  v13 = 0;
                else
                  v13 = *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]));
              }
              else
              {
                LODWORD(v13) = *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]));
                if (*(_BYTE *)(v14 + SLODWORD(v1232[0])))
                  LODWORD(v13) = *(_BYTE *)(v14 + SHIDWORD(v1232[0])) != 0;
                v13 = v13;
              }
              goto LABEL_17;
            }
            v15 = *(unsigned __int8 *)(v14 + SHIDWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + v12) > 1;
          }
          else
          {
            v14 = *(_QWORD *)(v3 + 3096);
            v15 = *(unsigned __int8 *)(v14 + SHIDWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + v12)
                + *(unsigned __int8 *)(v14 + (int)__p)
                + *(unsigned __int8 *)(v14 + SHIDWORD(__p))
                + *(unsigned __int8 *)(v14 + v10) > 2;
          }
          v13 = v15;
        }
LABEL_17:
        sub_23CCC4CE0(v3 + 3560, *(unsigned __int8 *)(v14 + v7) != 0, (_WORD *)&v1210[-1] + v13);
        v5 += 4;
      }
      while (v6 != v5);
    }
  }
  v1160 = v2;
  v1152 = (_QWORD *)v3;
  switch(*(_DWORD *)(v2 + 12))
  {
    case 0:
      v16 = (_QWORD *)(v3 + 3136);
      v17 = *(unsigned int *)(v3 + 3548);
      v18 = *(int *)(v3 + 3544);
      v1153 = *(unsigned int *)(v3 + 3544);
      v19 = *(_QWORD *)(v3 + 3208);
      v1138 = *(_DWORD *)(v2 + 16);
      memset_pattern16(&v1205, &unk_23CCD46A0, 6uLL);
      v20 = 0;
      v21 = 0;
      v1245 = 0u;
      v1246 = 0u;
      v1243 = 0u;
      v1244 = 0u;
      v1241 = 0u;
      v1242 = 0u;
      v1239 = 0u;
      v1240 = 0u;
      v1237 = 0u;
      *(_OWORD *)v1238 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1236 = 0u;
      *(_OWORD *)v1233 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1232 = 0u;
      do
      {
        v22 = v20;
        sub_23CCB7FFC((uint64_t)&v1232[15 * v21], v18);
        v20 = 1;
        v21 = 1;
      }
      while ((v22 & 1) == 0);
      LODWORD(__b) = 0;
      sub_23CCC14E0(&__p, v18, &__b);
      sub_23CCC16CC(&__b, v18);
      if ((int)v17 < 1)
        goto LABEL_70;
      v23 = 0;
      v1145 = v3 + 3560;
      v1101 = v18;
      v1110 = (_QWORD *)(v3 + 3136);
      v1128 = v17;
      v1092 = v19;
      while (1)
      {
        v24 = *(int *)(*(_QWORD *)(v3 + 3304) + 4 * v23);
        if (!v1138 || *(_BYTE *)(*(_QWORD *)(v3 + 3232) + v24))
          break;
LABEL_69:
        if (++v23 == v17)
        {
LABEL_70:
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          for (i = 0; i != -240; i -= 120)
          {
            v62 = &v1232[i / 8];
            v63 = *(void **)((char *)&v1245 + i + 8);
            if (v63)
            {
              v62[28] = v63;
              operator delete(v63);
            }
            v64 = v62[24];
            if (v64)
            {
              *(_QWORD *)((char *)&v1244 + i + 8) = v64;
              operator delete(v64);
            }
            v65 = &v1232[i / 8];
            v66 = *(void **)((char *)&v1242 + i + 8);
            if (v66)
            {
              v65[22] = v66;
              operator delete(v66);
            }
            v67 = v65[18];
            if (v67)
            {
              *(_QWORD *)((char *)&v1241 + i + 8) = v67;
              operator delete(v67);
            }
            v68 = v62[15];
            if (v68)
            {
              *(_QWORD *)((char *)&v1240 + i) = v68;
              operator delete(v68);
            }
          }
          return 0;
        }
      }
      v1175 = v19 + 4 * (int)v24 * (int)v1153;
      v25 = *(_DWORD *)(*(_QWORD *)(v3 + 3328) + 4 * v24);
      if ((v25 & 0x80000000) != 0)
        goto LABEL_48;
      v26 = v16;
      v27 = v23;
      LODWORD(v1208) = -1;
      v1207 = (void *)-1;
      sub_23CCCC9AC((_QWORD *)v3, v25, v24, (unsigned int *)(*(_QWORD *)(v3 + 136) + 12 * v25), &v1207);
      v28 = (int)v1207;
      v29 = HIDWORD(v1207);
      if ((HIDWORD(v1207) & 0x80000000) == 0)
        goto LABEL_38;
      sub_23CCCC9AC((_QWORD *)v3, v25, v24, (unsigned int *)(*(_QWORD *)(v3 + 160) + 12 * v25), &v1207);
      if ((HIDWORD(v1207) & 0x80000000) != 0)
      {
        if (v29 == -1)
          goto LABEL_47;
      }
      else
      {
        v28 = (int)v1207;
        v29 = HIDWORD(v1207);
      }
LABEL_38:
      if (!v1138 || (v30 = *(_QWORD *)(v3 + 3232), *(_BYTE *)(v30 + v28)) && *(_BYTE *)(v30 + v29))
      {
        if ((int)v1153 >= 1)
        {
          v31 = (int *)(v19 + 4 * v28 * (int)v18);
          v32 = v1153;
          v33 = (int *)(v19 + 4 * v29 * (int)v1153);
          v34 = (int *)__p;
          do
          {
            v36 = *v31++;
            v35 = v36;
            v37 = *v33++;
            v38 = __OFADD__(v37, v35);
            v39 = v37 + v35;
            if (v39 < 0 != v38)
              ++v39;
            *v34++ = v39 >> 1;
            --v32;
          }
          while (v32);
        }
        v40 = 1;
        v23 = v27;
        v16 = v26;
        v17 = v1128;
        goto LABEL_63;
      }
LABEL_47:
      v23 = v27;
      v16 = v26;
      v17 = v1128;
LABEL_48:
      v41 = sub_23CCCCD44(v3, v24, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
      v40 = 0;
      if ((int)v1153 >= 1 && !v41)
      {
        v1119 = v23;
        for (j = 0; j != v1153; ++j)
        {
          v43 = 0;
          v44 = __b;
          v45 = &__b[20 * j];
          v46 = *(unsigned __int8 *)(v2 + 24);
          v47 = *(unsigned __int8 *)(v2 + 8);
          v48 = 0x7FFFFFFF;
          v49 = -1;
          v1161 = __p;
          v50 = -1;
          do
          {
            v51 = *(_DWORD *)&v44[20 * j + 4 + 4 * ((v49 + *(_DWORD *)v45) & 3)];
            v52 = *(_DWORD *)(v1175 + 4 * j) - v51;
            if (v46)
            {
              v53 = sub_23CCCD000(v52, j, v43, (unsigned __int16 *)&v1205, v47, v1232);
            }
            else
            {
              if (v52 >= 0)
                v54 = *(_DWORD *)(v1175 + 4 * j) - v51;
              else
                v54 = v51 - *(_DWORD *)(v1175 + 4 * j);
              v53 = -__clz(v54 + 1);
            }
            if (v53 < v48)
            {
              v1161[j] = v51;
              v48 = v53;
              v50 = v43;
            }
            ++v43;
            --v49;
          }
          while (v43 != 4);
          sub_23CCC4CE0(v1145, v50 & 1, &v1205);
          sub_23CCC4CE0(v1145, (v50 >> 1) & 1, (_WORD *)&v1205 + (v50 & 1) + 1);
          v2 = v1160;
        }
        v40 = 0;
        v3 = (uint64_t)v1152;
        LODWORD(v18) = v1101;
        v16 = v1110;
        v23 = v1119;
        v17 = v1128;
        v19 = v1092;
      }
LABEL_63:
      if ((int)v18 >= 1)
      {
        v55 = __b + 4;
        v56 = (int *)v1175;
        v57 = v1153;
        do
        {
          v59 = *v56++;
          v58 = v59;
          v60 = *((_DWORD *)v55 - 1);
          if (*(_DWORD *)&v55[4 * (((_BYTE)v60 - 1) & 3)] != v59)
          {
            *((_DWORD *)v55 - 1) = v60 + 1;
            *(_DWORD *)&v55[4 * (v60 & 3)] = v58;
          }
          v55 += 20;
          --v57;
        }
        while (v57);
      }
      sub_23CCC4E54(v3, v1175, (uint64_t)__p, v18, v16, *(_BYTE *)(v2 + 8), &v1232[15 * v40]);
      goto LABEL_69;
    case 1:
      v321 = (_QWORD *)(v3 + 3136);
      v322 = *(unsigned int *)(v3 + 3548);
      v323 = *(int *)(v3 + 3544);
      v324 = *(unsigned int *)(v3 + 3544);
      v1131 = *(_QWORD *)(v3 + 3208);
      memset_pattern16(&v1205, &unk_23CCD46A0, 6uLL);
      v325 = 0;
      v1254 = 0;
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1248 = 0u;
      v1249 = 0u;
      v1246 = 0u;
      v1247 = 0u;
      v1244 = 0u;
      v1245 = 0u;
      v1242 = 0u;
      v1243 = 0u;
      v1240 = 0u;
      v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      v1237 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1232[v325], v323);
        v325 += 15;
      }
      while (v325 != 45);
      LODWORD(__b) = 0;
      sub_23CCC14E0(&__p, v323, &__b);
      v1141 = *(_DWORD *)(v2 + 16);
      sub_23CCC16CC(&__b, v323);
      if ((int)v322 < 1)
        goto LABEL_386;
      v326 = 0;
      v1148 = v3 + 3560;
      v1156 = v324;
      v1097 = v323;
      v1106 = (_QWORD *)(v3 + 3136);
      v1122 = v322;
      do
      {
        v327 = *(int *)(*(_QWORD *)(v3 + 3304) + 4 * v326);
        if (v1141 && !*(_BYTE *)(*(_QWORD *)(v3 + 3232) + v327))
          goto LABEL_385;
        v1179 = v1131 + 4 * (int)v327 * (int)v323;
        v328 = *(_DWORD *)(*(_QWORD *)(v3 + 3328) + 4 * v327);
        if ((v328 & 0x80000000) != 0)
          goto LABEL_361;
        v329 = v321;
        LODWORD(v1208) = -1;
        v1207 = (void *)-1;
        sub_23CCCC9AC((_QWORD *)v3, v328, v327, (unsigned int *)(*(_QWORD *)(v3 + 136) + 12 * v328), &v1207);
        v330 = (int)v1207;
        v331 = HIDWORD(v1207);
        v332 = (int)v1208;
        if ((v1208 & 0x80000000) != 0)
        {
          sub_23CCCC9AC((_QWORD *)v3, v328, v327, (unsigned int *)(*(_QWORD *)(v3 + 160) + 12 * v328), &v1207);
          if ((v1208 & 0x80000000) != 0)
          {
            if (v332 == -1)
              goto LABEL_350;
          }
          else
          {
            v330 = (int)v1207;
            v331 = HIDWORD(v1207);
            v332 = (int)v1208;
          }
        }
        if (!v1141
          || (v333 = *(_QWORD *)(v3 + 3232), *(_BYTE *)(v333 + v330))
          && *(_BYTE *)(v333 + v331)
          && *(_BYTE *)(v333 + v332))
        {
          if ((int)v1156 < 1)
          {
            v344 = 2;
            v324 = v1156;
          }
          else
          {
            v334 = (int *)(v1131 + 4 * v330 * (int)v1156);
            v335 = (int *)(v1131 + 4 * v331 * (int)v323);
            v336 = (int *)(v1131 + 4 * v332 * (int)v1156);
            v337 = __p;
            v338 = v1156;
            v324 = v1156;
            do
            {
              v340 = *v334++;
              v339 = v340;
              v341 = *v335++;
              v342 = v341 + v339;
              v343 = *v336++;
              *v337++ = v342 - v343;
              --v338;
            }
            while (v338);
            v344 = 2;
          }
          goto LABEL_378;
        }
LABEL_350:
        if (v331 == -1
          || v1141 && ((v345 = *(_QWORD *)(v3 + 3232), !*(_BYTE *)(v345 + v330)) || !*(_BYTE *)(v345 + v331)))
        {
          v324 = v1156;
          v321 = v329;
          v322 = v1122;
LABEL_361:
          v354 = sub_23CCCCD44(v3, v327, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
          v344 = 0;
          if ((int)v324 >= 1 && !v354)
          {
            v1115 = v326;
            v355 = 0;
            do
            {
              v356 = 0;
              v357 = __b;
              v358 = &__b[20 * v355];
              v359 = *(unsigned __int8 *)(v2 + 24);
              v360 = *(unsigned __int8 *)(v2 + 8);
              v361 = 0x7FFFFFFF;
              v362 = -1;
              v1166 = __p;
              v363 = -1;
              do
              {
                v364 = *(_DWORD *)&v357[20 * v355 + 4 + 4 * ((v362 + *(_DWORD *)v358) & 3)];
                v365 = *(_DWORD *)(v1179 + 4 * v355) - v364;
                if (v359)
                {
                  v366 = sub_23CCCD000(v365, v355, v356, (unsigned __int16 *)&v1205, v360, v1232);
                }
                else
                {
                  if (v365 >= 0)
                    v367 = *(_DWORD *)(v1179 + 4 * v355) - v364;
                  else
                    v367 = v364 - *(_DWORD *)(v1179 + 4 * v355);
                  v366 = -__clz(v367 + 1);
                }
                if (v366 < v361)
                {
                  v1166[v355] = v364;
                  v361 = v366;
                  v363 = v356;
                }
                ++v356;
                --v362;
              }
              while (v356 != 4);
              sub_23CCC4CE0(v1148, v363 & 1, &v1205);
              sub_23CCC4CE0(v1148, (v363 >> 1) & 1, (_WORD *)&v1205 + (v363 & 1) + 1);
              ++v355;
              v324 = v1156;
              v2 = v1160;
            }
            while (v355 != v1156);
            v344 = 0;
            v3 = (uint64_t)v1152;
            LODWORD(v323) = v1097;
            v321 = v1106;
            v326 = v1115;
            v322 = v1122;
          }
          goto LABEL_379;
        }
        if ((int)v323 < 1)
        {
          v344 = 1;
          v324 = v1156;
        }
        else
        {
          v346 = (int *)(v1131 + 4 * v330 * (int)v323);
          v324 = v1156;
          v347 = (int *)(v1131 + 4 * v331 * (int)v1156);
          v348 = (int *)__p;
          v349 = v1156;
          do
          {
            v351 = *v346++;
            v350 = v351;
            v352 = *v347++;
            v38 = __OFADD__(v352, v350);
            v353 = v352 + v350;
            if (v353 < 0 != v38)
              ++v353;
            *v348++ = v353 >> 1;
            --v349;
          }
          while (v349);
          v344 = 1;
        }
LABEL_378:
        v321 = v329;
        v322 = v1122;
LABEL_379:
        if ((int)v324 >= 1)
        {
          v368 = __b + 4;
          v369 = (int *)v1179;
          v370 = v324;
          do
          {
            v372 = *v369++;
            v371 = v372;
            v373 = *((_DWORD *)v368 - 1);
            if (*(_DWORD *)&v368[4 * (((_BYTE)v373 - 1) & 3)] != v372)
            {
              *((_DWORD *)v368 - 1) = v373 + 1;
              *(_DWORD *)&v368[4 * (v373 & 3)] = v371;
            }
            v368 += 20;
            --v370;
          }
          while (v370);
        }
        sub_23CCC4E54(v3, v1179, (uint64_t)__p, v323, v321, *(_BYTE *)(v2 + 8), &v1232[15 * v344]);
LABEL_385:
        ++v326;
      }
      while (v326 != v322);
LABEL_386:
      if (__b)
      {
        v1210[0] = __b;
        operator delete(__b);
      }
      if (__p)
      {
        v1230 = (uint64_t)__p;
        operator delete(__p);
      }
      v374 = 360;
      do
      {
        v375 = &v1232[v374 / 8];
        v376 = *(void **)((char *)&__p + v374);
        if (v376)
        {
          *(v375 - 2) = v376;
          operator delete(v376);
        }
        v377 = *(v375 - 6);
        if (v377)
        {
          *(_QWORD *)((char *)&v1224 + v374) = v377;
          operator delete(v377);
        }
        v378 = &v1232[v374 / 8];
        v379 = *(void **)((char *)&v1216 + v374);
        if (v379)
        {
          *(v378 - 8) = v379;
          operator delete(v379);
        }
        v380 = *(v378 - 12);
        if (v380)
        {
          *(_QWORD *)((char *)&v1213 + v374) = v380;
          operator delete(v380);
        }
        v381 = *(v375 - 15);
        if (v381)
        {
          v1210[v374 / 8] = v381;
          operator delete(v381);
        }
        v374 -= 120;
      }
      while (v374);
      return 0;
    case 2:
      v69 = 0;
      v70 = *(unsigned int *)(v3 + 3548);
      v71 = (_QWORD *)(v3 + 3136);
      v72 = *(int *)(v3 + 3544);
      v73 = *(unsigned int *)(v3 + 3544);
      v74 = *(_QWORD *)(v3 + 3208);
      v1254 = 0;
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1248 = 0u;
      v1249 = 0u;
      v1246 = 0u;
      v1247 = 0u;
      v1244 = 0u;
      v1245 = 0u;
      v1242 = 0u;
      v1243 = 0u;
      v1240 = 0u;
      v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      v1237 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1232[v69], v73);
        v69 += 15;
      }
      while (v69 != 45);
      memset_pattern16(&v1189, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1187, &unk_23CCD46A0, 6uLL);
      LODWORD(__b) = 0;
      sub_23CCC14E0(&__p, v72, &__b);
      LODWORD(v1207) = 0;
      sub_23CCC14E0(&__b, v72, &v1207);
      LODWORD(v1205) = 0;
      sub_23CCC14E0(&v1207, v72, &v1205);
      LODWORD(v1203) = 0;
      sub_23CCC14E0(&v1205, v72, &v1203);
      LODWORD(v1201) = 0;
      sub_23CCC14E0(&v1203, v72, &v1201);
      LODWORD(v1199) = 0;
      sub_23CCC14E0(&v1201, v72, &v1199);
      LODWORD(v1197) = 0;
      sub_23CCC14E0(&v1199, v72, &v1197);
      LODWORD(v1195) = 0;
      sub_23CCC14E0(&v1197, v72, &v1195);
      v1129 = *(_DWORD *)(v2 + 16);
      sub_23CCC16CC(&v1195, v72);
      if ((int)v70 < 1)
        goto LABEL_1425;
      v75 = 0;
      v1146 = v3 + 3560;
      v1058 = 4 * v73;
      v1093 = (_QWORD *)(v3 + 3136);
      v1102 = v70;
      v1086 = v72;
      v1154 = v73;
      v1111 = v74;
      while (1)
      {
        v76 = (_QWORD *)v3;
        v77 = *(int *)(*(_QWORD *)(v3 + 3304) + 4 * v75);
        if (!v1129 || *(_BYTE *)(v76[404] + v77))
          break;
LABEL_183:
        ++v75;
        v3 = (uint64_t)v76;
        if (v75 == v70)
        {
LABEL_1425:
          if (v1195)
          {
            v1196 = v1195;
            operator delete(v1195);
          }
          if (v1197)
          {
            v1198 = v1197;
            operator delete(v1197);
          }
          if (v1199)
          {
            v1200 = v1199;
            operator delete(v1199);
          }
          if (v1201)
          {
            v1202 = v1201;
            operator delete(v1201);
          }
          if (v1203)
          {
            v1204 = v1203;
            operator delete(v1203);
          }
          if (v1205)
          {
            v1206 = v1205;
            operator delete(v1205);
          }
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          v1012 = 360;
          do
          {
            v1013 = &v1232[v1012 / 8];
            v1014 = *(void **)((char *)&__p + v1012);
            if (v1014)
            {
              *(v1013 - 2) = v1014;
              operator delete(v1014);
            }
            v1015 = *(v1013 - 6);
            if (v1015)
            {
              *(_QWORD *)((char *)&v1224 + v1012) = v1015;
              operator delete(v1015);
            }
            v1016 = &v1232[v1012 / 8];
            v1017 = *(void **)((char *)&v1216 + v1012);
            if (v1017)
            {
              *(v1016 - 8) = v1017;
              operator delete(v1017);
            }
            v1018 = *(v1016 - 12);
            if (v1018)
            {
              *(_QWORD *)((char *)&v1213 + v1012) = v1018;
              operator delete(v1018);
            }
            v1019 = *(v1013 - 15);
            if (v1019)
            {
              v1210[v1012 / 8] = v1019;
              operator delete(v1019);
            }
            v1012 -= 120;
          }
          while (v1012);
          return 0;
        }
      }
      v1176 = v74 + 4 * (int)v77 * (int)v72;
      v78 = *(unsigned int *)(v76[416] + 4 * v77);
      v79 = (int *)__p;
      v1139 = __p;
      v1120 = v75;
      if ((v78 & 0x80000000) != 0)
        goto LABEL_162;
      v1194 = -1;
      v1193 = -1;
      v1192 = -1;
      v1191 = -1;
      sub_23CCCC9AC(v76, v78, v77, (unsigned int *)(v76[17] + 12 * v78), &v1193);
      sub_23CCCC9AC(v76, v78, v77, (unsigned int *)(v76[20] + 12 * v78), &v1191);
      v80 = v1194;
      if (v1194 < 0)
      {
        if ((v1192 & 0x80000000) == 0)
        {
          v84 = v1193;
          v1193 = v1191;
          v85 = v1192;
          v1194 = v1192;
          v1191 = v84;
          v1192 = v80;
          v80 = v85;
        }
        v83 = v1139;
        v81 = v1193;
        v82 = HIDWORD(v1193);
        if (v80 == -1)
          goto LABEL_107;
      }
      else
      {
        v81 = v1193;
        v82 = HIDWORD(v1193);
        v83 = v1139;
      }
      if (!v1129 || (v86 = v1152[404], *(_BYTE *)(v86 + v81)) && *(_BYTE *)(v86 + v82) && *(_BYTE *)(v86 + v80))
      {
        if ((int)v73 >= 1)
        {
          v87 = (int *)(v74 + 4 * v81 * (int)v73);
          v88 = (int *)(v74 + 4 * v82 * (int)v72);
          v89 = (int *)(v74 + 4 * v80 * (int)v73);
          v90 = v83;
          v91 = v73;
          do
          {
            v93 = *v87++;
            v92 = v93;
            v94 = *v88++;
            v95 = v94 + v92;
            v96 = *v89++;
            *v90++ = v95 - v96;
            --v91;
          }
          while (v91);
        }
        v97 = 0;
        v98 = 2;
        goto LABEL_118;
      }
LABEL_107:
      if (v82 == -1 || v1129 && ((v99 = v1152[404], !*(_BYTE *)(v99 + v81)) || !*(_BYTE *)(v99 + v82)))
      {
        v98 = 0;
        v97 = 1;
      }
      else
      {
        if ((int)v72 >= 1)
        {
          v100 = (int *)(v74 + 4 * v81 * (int)v72);
          v101 = (int *)(v74 + 4 * v82 * (int)v73);
          v102 = v83;
          v103 = v73;
          do
          {
            v105 = *v100++;
            v104 = v105;
            v106 = *v101++;
            v38 = __OFADD__(v106, v104);
            v107 = v106 + v104;
            if (v107 < 0 != v38)
              ++v107;
            *v102++ = v107 >> 1;
            --v103;
          }
          while (v103);
        }
        v97 = 0;
        v98 = 1;
      }
LABEL_118:
      if (v1192 == -1
        || v1129
        && ((v108 = v1152[404], !*(_BYTE *)(v108 + v81))
         || !*(_BYTE *)(v108 + v82)
         || !*(_BYTE *)(v108 + v80)
         || !*(_BYTE *)(v108 + (int)v1191)
         || !*(_BYTE *)(v108 + SHIDWORD(v1191))
         || !*(_BYTE *)(v108 + v1192)))
      {
LABEL_160:
        if (v97)
        {
          v79 = (int *)__p;
LABEL_162:
          v152 = sub_23CCCCD44((uint64_t)v1152, v77, v79, v1230, *(_DWORD *)(v2 + 16));
          v98 = 0;
          if ((int)v73 >= 1 && !v152)
          {
            v153 = 0;
            do
            {
              v154 = 0;
              v155 = v1195;
              v156 = (char *)v1195 + 20 * v153;
              v157 = *(unsigned __int8 *)(v1160 + 24);
              v158 = *(unsigned __int8 *)(v1160 + 8);
              v159 = 0x7FFFFFFF;
              v160 = -1;
              v1163 = __p;
              v161 = -1;
              do
              {
                v162 = v155[5 * v153 + 1 + ((v160 + *v156) & 3)];
                v163 = *(_DWORD *)(v1176 + 4 * v153) - v162;
                if (v157)
                {
                  v164 = sub_23CCCD000(v163, v153, v154, (unsigned __int16 *)&v1189, v158, v1232);
                }
                else
                {
                  if (v163 >= 0)
                    v165 = *(_DWORD *)(v1176 + 4 * v153) - v162;
                  else
                    v165 = v162 - *(_DWORD *)(v1176 + 4 * v153);
                  v164 = -__clz(v165 + 1);
                }
                if (v164 < v159)
                {
                  v1163[v153] = v162;
                  v159 = v164;
                  v161 = v154;
                }
                ++v154;
                --v160;
              }
              while (v154 != 4);
              sub_23CCC4CE0(v1146, v161 & 1, &v1189);
              sub_23CCC4CE0(v1146, (v161 >> 1) & 1, (_WORD *)&v1189 + (v161 & 1) + 1);
              ++v153;
              v73 = v1154;
            }
            while (v153 != v1154);
            v98 = 0;
            v2 = v1160;
            v71 = v1093;
            v70 = v1102;
            LODWORD(v72) = v1086;
            v74 = v1111;
          }
        }
        v76 = v1152;
        if ((int)v72 >= 1)
        {
          v166 = (char *)v1195 + 4;
          v167 = (int *)v1176;
          v168 = v73;
          do
          {
            v170 = *v167++;
            v169 = v170;
            v171 = *((_DWORD *)v166 - 1);
            if (*(_DWORD *)&v166[4 * (((_BYTE)v171 - 1) & 3)] != v170)
            {
              *((_DWORD *)v166 - 1) = v171 + 1;
              *(_DWORD *)&v166[4 * (v171 & 3)] = v169;
            }
            v166 += 20;
            --v168;
          }
          while (v168);
        }
        sub_23CCC4E54((uint64_t)v1152, v1176, (uint64_t)v1139, v72, v71, *(_BYTE *)(v2 + 8), &v1232[15 * v98]);
        v75 = v1120;
        goto LABEL_183;
      }
      v1082 = v97;
      v1162 = v98;
      if ((int)v73 < 1)
      {
        v130 = *(unsigned __int8 *)(v2 + 24);
        if (!*(_BYTE *)(v2 + 24))
        {
          v142 = 0;
          v137 = 0;
          v144 = 0;
          goto LABEL_148;
        }
        v119 = (int *)v1203;
        v120 = (int *)v1201;
        v121 = (int *)v1199;
        v122 = (int *)v1197;
      }
      else
      {
        v109 = 0;
        v110 = v74 + 4 * v81 * (int)v72;
        v111 = v74 + 4 * v82 * (int)v73;
        v112 = v74 + 4 * v80 * (int)v72;
        v113 = v74 + 4 * (int)v1191 * (int)v73;
        v114 = v74 + 4 * HIDWORD(v1191) * (int)v72;
        v115 = v74 + 4 * v1192 * (int)v73;
        v116 = __b;
        v117 = (char *)v1207;
        v118 = (char *)v1205;
        v119 = (int *)v1203;
        v120 = (int *)v1201;
        v121 = (int *)v1199;
        v122 = (int *)v1197;
        do
        {
          *(_DWORD *)&v116[v109] = *(_DWORD *)(v114 + v109) + *(_DWORD *)(v113 + v109) - *(_DWORD *)(v115 + v109);
          v123 = *(_DWORD *)(v110 + v109);
          v124 = *(_DWORD *)(v113 + v109);
          v125 = v124 + v123;
          if (v124 + v123 < 0 != __OFADD__(v124, v123))
            ++v125;
          *(_DWORD *)&v117[v109] = *(_DWORD *)(v114 + v109) + *(_DWORD *)(v111 + v109) - (v125 >> 1);
          v126 = *(_DWORD *)(v110 + v109);
          v127 = *(_DWORD *)(v113 + v109);
          v38 = __OFADD__(v127, v126);
          v128 = v127 + v126;
          if (v128 < 0 != v38)
            ++v128;
          v129 = 1431655766
               * ((v128 >> 1)
                - (*(_DWORD *)(v112 + v109)
                 + *(_DWORD *)(v115 + v109))
                + 2 * (*(_DWORD *)(v114 + v109) + *(_DWORD *)(v111 + v109)));
          *(_DWORD *)&v118[v109] = HIDWORD(v129) + (v129 >> 63);
          v119[v109 / 4] = *(_DWORD *)(v1176 + v109) - v83[v109 / 4];
          v120[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v116[v109];
          v121[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v117[v109];
          v122[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v118[v109];
          v109 += 4;
        }
        while (v1058 != v109);
        if (!*(_BYTE *)(v1160 + 24))
        {
          v145 = *v119;
          if (*v119 < 0)
            v145 = -v145;
          v142 = -(v72 * __clz(v145 + 1));
          v146 = *v120;
          if (*v120 < 0)
            v146 = -v146;
          v137 = -(v73 * __clz(v146 + 1));
          v147 = *v121;
          if (*v121 < 0)
            v147 = -v147;
          v130 = -(v72 * __clz(v147 + 1));
          v148 = *v122;
          if (*v122 < 0)
            v148 = -v148;
          v144 = -(v73 * __clz(v148 + 1));
          v2 = v1160;
LABEL_148:
          if (v142 <= v137 && v142 <= v130 && v142 <= v144)
          {
            v149 = 0;
            v150 = 0;
LABEL_152:
            v151 = 1;
LABEL_159:
            v74 = v1111;
            sub_23CCC4CE0(v1146, v150, &v1187);
            sub_23CCC4CE0(v1146, v149, (_WORD *)&v1187 + v151);
            v98 = v1162;
            v97 = v1082;
            goto LABEL_160;
          }
          if (v137 > v130 || v137 > v144)
          {
            if (v130 <= v144)
            {
              v150 = 0;
              v149 = 1;
              v1139 = v1207;
              goto LABEL_152;
            }
            v149 = 1;
            v1139 = v1205;
            v150 = 1;
          }
          else
          {
            v149 = 0;
            v150 = 1;
            v1139 = __b;
          }
          v151 = 2;
          goto LABEL_159;
        }
        v98 = v1162;
      }
      v1062 = (unsigned __int16 **)&v1232[15 * v98];
      v131 = *(unsigned __int8 *)(v1160 + 8);
      v132 = (unsigned __int16)v1187;
      v133 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1187 + 2048) >> 10) & 0x7CLL));
      v1069 = WORD1(v1187);
      v134 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD1(v1187) + 2048) >> 10) & 0x7CLL));
      v1074 = v134 + v133 + sub_23CCD36C8(v119, v73, v131, v1062);
      v135 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v132) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v1065 = v135;
      v136 = WORD2(v1187);
      LODWORD(v132) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD2(v1187) + 2048) >> 10) & 0x7CLL));
      LODWORD(v72) = v1086;
      v137 = v132 + sub_23CCD36C8(v120, v1086, v131, v1062) + v135;
      v138 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v1069) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v139 = v121;
      v2 = v1160;
      v140 = sub_23CCD36C8(v139, v1154, v131, v1062);
      LODWORD(v136) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v136) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v141 = sub_23CCD36C8(v122, v1086, v131, v1062);
      v142 = v1074;
      v143 = v136 + v1065;
      v73 = v1154;
      v130 = v138 + v133 + v140;
      v144 = v143 + v141;
      v71 = v1093;
      v70 = v1102;
      goto LABEL_148;
    case 3:
      v382 = *(unsigned int *)(v3 + 3548);
      v383 = *(int *)(v3 + 3544);
      v384 = *(unsigned int *)(v3 + 3544);
      v385 = *(_QWORD *)(v3 + 3208);
      memset_pattern16(&v1197, &unk_23CCD46A0, 6uLL);
      v386 = 0;
      v1254 = 0;
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1248 = 0u;
      v1249 = 0u;
      v1246 = 0u;
      v1247 = 0u;
      v1244 = 0u;
      v1245 = 0u;
      v1242 = 0u;
      v1243 = 0u;
      v1240 = 0u;
      v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      v1237 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1232[v386], v383);
        v386 += 15;
      }
      while (v386 != 45);
      LOWORD(v1193) = 0x8000;
      LODWORD(__b) = 0;
      sub_23CCC14E0(&__p, v383, &__b);
      LODWORD(v1207) = 0;
      sub_23CCC14E0(&__b, v383, &v1207);
      v387 = (_QWORD *)(v3 + 3136);
      v1142 = *(_DWORD *)(v2 + 16);
      sub_23CCC16CC(&v1207, v383);
      if ((int)v382 < 1)
        goto LABEL_470;
      v388 = 0;
      v1157 = v3 + 3560;
      v1098 = (_QWORD *)(v3 + 3136);
      v1107 = v385;
      v1089 = v382;
      v1116 = v383;
      v1149 = v384;
      while (1)
      {
        v389 = *(int *)(*(_QWORD *)(v3 + 3304) + 4 * v388);
        if (!v1142 || *(_BYTE *)(*(_QWORD *)(v3 + 3232) + v389))
          break;
LABEL_469:
        if (++v388 == v382)
        {
LABEL_470:
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          v447 = 360;
          do
          {
            v448 = &v1232[v447 / 8];
            v449 = *(void **)((char *)&__p + v447);
            if (v449)
            {
              *(v448 - 2) = v449;
              operator delete(v449);
            }
            v450 = *(v448 - 6);
            if (v450)
            {
              *(_QWORD *)((char *)&v1224 + v447) = v450;
              operator delete(v450);
            }
            v451 = &v1232[v447 / 8];
            v452 = *(void **)((char *)&v1216 + v447);
            if (v452)
            {
              *(v451 - 8) = v452;
              operator delete(v452);
            }
            v453 = *(v451 - 12);
            if (v453)
            {
              *(_QWORD *)((char *)&v1213 + v447) = v453;
              operator delete(v453);
            }
            v454 = *(v448 - 15);
            if (v454)
            {
              v1210[v447 / 8] = v454;
              operator delete(v454);
            }
            v447 -= 120;
          }
          while (v447);
          return 0;
        }
      }
      v1180 = (int *)(v385 + 4 * (int)v389 * (int)v383);
      v390 = *(unsigned int *)(*(_QWORD *)(v3 + 3328) + 4 * v389);
      v1132 = v388;
      if ((v390 & 0x80000000) != 0)
        goto LABEL_442;
      v391 = (int *)(*(_QWORD *)(v3 + 136) + 12 * v390);
      v392 = *v391;
      LODWORD(v1205) = *v391;
      v393 = v391[1];
      HIDWORD(v1205) = v393;
      v394 = v391[2];
      LODWORD(v1206) = v394;
      v395 = (int *)(*(_QWORD *)(v3 + 160) + 12 * v390);
      v1167 = *v395;
      LODWORD(v1203) = *v395;
      v396 = v395[1];
      HIDWORD(v1203) = v396;
      v1123 = v395[2];
      LODWORD(v1204) = v1123;
      LODWORD(v1202) = -1;
      v1201 = (void *)-1;
      LODWORD(v1200) = -1;
      v1199 = (void *)-1;
      sub_23CCCC9AC((_QWORD *)v3, v390, v389, (unsigned int *)&v1205, &v1201);
      sub_23CCCC9AC((_QWORD *)v3, v390, v389, (unsigned int *)&v1203, &v1199);
      v397 = (int)v1202;
      v398 = (int)v1200;
      if ((v1202 & 0x80000000) == 0 || (v1200 & 0x80000000) != 0)
      {
        v399 = (int)v1199;
        v400 = HIDWORD(v1199);
        LODWORD(v401) = v393;
        v402 = v392;
      }
      else
      {
        v1167 = v392;
        v1205 = v1203;
        v1123 = v394;
        v394 = (int)v1204;
        LODWORD(v1206) = (_DWORD)v1204;
        v399 = (int)v1201;
        v400 = HIDWORD(v1201);
        v1201 = v1199;
        v398 = (int)v1202;
        v397 = (int)v1200;
        LODWORD(v1202) = (_DWORD)v1200;
        v396 = v393;
        v401 = (unint64_t)v1203 >> 32;
        v402 = (int)v1203;
      }
      LODWORD(v383) = v1116;
      if (v398 != -1
        && (!v1142
         || (v403 = *(_QWORD *)(v3 + 3232), *(_BYTE *)(v403 + (int)v1201))
         && *(_BYTE *)(v403 + SHIDWORD(v1201))
         && *(_BYTE *)(v403 + v397)
         && *(_BYTE *)(v403 + v399)
         && *(_BYTE *)(v403 + v400)
         && *(_BYTE *)(v403 + v398)))
      {
        v404 = v399;
        v405 = (int *)(v1107 + 4 * v397 * (int)v384);
        v406 = *(_QWORD *)(v3 + 184);
        v407 = (int *)(v406 + 12 * v394);
        v385 = v1107;
        sub_23CCAE5A4((int *)(v1107 + 4 * (int)v1201 * (int)v384), (int *)(v1107 + 4 * HIDWORD(v1201) * v1116), v405, v384, (int *)(v406 + 12 * v402), (int *)(v406 + 12 * (int)v401), v407, (int *)(v406 + 12 * v390), __p);
        sub_23CCAE5A4((int *)(v385 + 4 * v404 * v1116), (int *)(v385 + 4 * v400 * (int)v384), (int *)(v385 + 4 * v398 * v1116), v1116, (int *)(*(_QWORD *)(v3 + 184) + 12 * v1167), (int *)(*(_QWORD *)(v3 + 184) + 12 * v396), (int *)(*(_QWORD *)(v3 + 184) + 12 * v1123), (int *)(*(_QWORD *)(v3 + 184) + 12 * v390), __b);
        if (v1116 >= 1)
        {
          v408 = (int *)__p;
          v409 = __b;
          v410 = v384;
          v2 = v1160;
          v388 = v1132;
          v387 = v1098;
          do
          {
            v411 = *(_DWORD *)v409;
            v409 += 4;
            v412 = v411 + *v408;
            if (v412 < 0 != __OFADD__(v411, *v408))
              ++v412;
            *v408++ = v412 >> 1;
            --v410;
          }
          while (v410);
          v413 = 2;
          v382 = v1089;
          goto LABEL_463;
        }
      }
      else
      {
        if (v397 == -1
          || v1142
          && ((v414 = *(_QWORD *)(v3 + 3232), !*(_BYTE *)(v414 + (int)v1201))
           || !*(_BYTE *)(v414 + SHIDWORD(v1201))
           || !*(_BYTE *)(v414 + v397)))
        {
          if (HIDWORD(v1201) == -1
            || v1142
            && ((v418 = *(_QWORD *)(v3 + 3232), !*(_BYTE *)(v418 + (int)v1201)) || !*(_BYTE *)(v418 + SHIDWORD(v1201))))
          {
            v2 = v1160;
            v387 = v1098;
            v385 = v1107;
            v388 = v1132;
            v382 = v1089;
LABEL_442:
            v419 = sub_23CCCCD44(v3, v389, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
            v413 = 0;
            if ((int)v384 >= 1 && !v419)
            {
              v420 = 0;
              do
              {
                v421 = 0;
                v422 = v1207;
                v423 = (char *)v1207 + 20 * v420;
                v424 = *(unsigned __int8 *)(v1160 + 24);
                v425 = *(unsigned __int8 *)(v1160 + 8);
                v426 = 0x7FFFFFFF;
                v427 = -1;
                v1168 = __p;
                v428 = -1;
                do
                {
                  v429 = v422[5 * v420 + 1 + ((v427 + *v423) & 3)];
                  v430 = v1180[v420] - v429;
                  if (v424)
                  {
                    v431 = sub_23CCCD000(v430, v420, v421, (unsigned __int16 *)&v1197, v425, v1232);
                  }
                  else
                  {
                    if (v430 >= 0)
                      v432 = v1180[v420] - v429;
                    else
                      v432 = v429 - v1180[v420];
                    v431 = -__clz(v432 + 1);
                  }
                  if (v431 < v426)
                  {
                    v1168[v420] = v429;
                    v426 = v431;
                    v428 = v421;
                  }
                  ++v421;
                  --v427;
                }
                while (v421 != 4);
                sub_23CCC4CE0(v1157, v428 & 1, &v1197);
                sub_23CCC4CE0(v1157, (v428 >> 1) & 1, (_WORD *)&v1197 + (v428 & 1) + 1);
                ++v420;
                v384 = v1149;
              }
              while (v420 != v1149);
              v413 = 0;
              v2 = v1160;
              v3 = (uint64_t)v1152;
              v382 = v1089;
              v387 = v1098;
              v385 = v1107;
              LODWORD(v383) = v1116;
              v388 = v1132;
            }
          }
          else
          {
            v2 = v1160;
            v387 = v1098;
            v385 = v1107;
            v388 = v1132;
            if ((_DWORD)v384 == 2)
            {
              LODWORD(v1195) = 0;
              sub_23CCAE844((int *)(v1107 + 8 * (_DWORD)v1201), (int *)(v1107 + 8 * HIDWORD(v1201)), v1180, (_DWORD *)(*(_QWORD *)(v3 + 184) + 12 * v402), (_DWORD *)(*(_QWORD *)(v3 + 184) + 12 * (int)v401), (int *)(*(_QWORD *)(v3 + 184) + 12 * v390), (int *)__p, &v1195);
              v382 = v1089;
              sub_23CCC4CE0(v1157, (_DWORD)v1195 != 0, &v1193);
            }
            else
            {
              v382 = v1089;
              if ((int)v384 >= 1)
              {
                v433 = (int *)(v1107 + 4 * (int)v1201 * v1116);
                v434 = (int *)(v1107 + 4 * HIDWORD(v1201) * (int)v384);
                v435 = (int *)__p;
                v436 = v384;
                do
                {
                  v438 = *v433++;
                  v437 = v438;
                  v439 = *v434++;
                  v38 = __OFADD__(v439, v437);
                  v440 = v439 + v437;
                  if (v440 < 0 != v38)
                    ++v440;
                  *v435++ = v440 >> 1;
                  --v436;
                }
                while (v436);
              }
            }
            v413 = 1;
          }
LABEL_463:
          if ((int)v383 >= 1)
          {
            v441 = (char *)v1207 + 4;
            v442 = v1180;
            v443 = v384;
            do
            {
              v445 = *v442++;
              v444 = v445;
              v446 = *((_DWORD *)v441 - 1);
              if (*(_DWORD *)&v441[4 * (((_BYTE)v446 - 1) & 3)] != v445)
              {
                *((_DWORD *)v441 - 1) = v446 + 1;
                *(_DWORD *)&v441[4 * (v446 & 3)] = v444;
              }
              v441 += 20;
              --v443;
            }
            while (v443);
          }
          sub_23CCC4E54(v3, (uint64_t)v1180, (uint64_t)__p, v383, v387, *(_BYTE *)(v2 + 8), &v1232[15 * v413]);
          goto LABEL_469;
        }
        v415 = (int *)(v1107 + 4 * v397 * (int)v384);
        v416 = *(_QWORD *)(v3 + 184);
        v417 = (int *)(v416 + 12 * v394);
        v385 = v1107;
        sub_23CCAE5A4((int *)(v1107 + 4 * (int)v1201 * (int)v384), (int *)(v1107 + 4 * HIDWORD(v1201) * v1116), v415, v384, (int *)(v416 + 12 * v402), (int *)(v416 + 12 * (int)v401), v417, (int *)(v416 + 12 * v390), __p);
      }
      v413 = 2;
      v2 = v1160;
      v388 = v1132;
      v382 = v1089;
      v387 = v1098;
      goto LABEL_463;
    case 4:
      v172 = 0;
      v173 = *(unsigned int *)(v3 + 3548);
      v1083 = (_QWORD *)(v3 + 3136);
      v174 = *(int *)(v3 + 3544);
      v175 = v3;
      v176 = *(unsigned int *)(v3 + 3544);
      v1130 = *(_QWORD *)(v175 + 3208);
      v1254 = 0;
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1248 = 0u;
      v1249 = 0u;
      v1246 = 0u;
      v1247 = 0u;
      v1244 = 0u;
      v1245 = 0u;
      v1242 = 0u;
      v1243 = 0u;
      v1240 = 0u;
      v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      v1237 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1232[v172], v174);
        v172 += 15;
      }
      while (v172 != 45);
      LOWORD(v1225) = 0x8000;
      memset_pattern16(v1215, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1213, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1211, &unk_23CCD46A0, 6uLL);
      LODWORD(__b) = 0;
      sub_23CCC14E0(&__p, v174, &__b);
      LODWORD(v1207) = 0;
      sub_23CCC14E0(&__b, v174, &v1207);
      LODWORD(v1205) = 0;
      sub_23CCC14E0(&v1207, v174, &v1205);
      LODWORD(v1203) = 0;
      sub_23CCC14E0(&v1205, v174, &v1203);
      LODWORD(v1201) = 0;
      sub_23CCC14E0(&v1203, v174, &v1201);
      LODWORD(v1199) = 0;
      sub_23CCC14E0(&v1201, v174, &v1199);
      LODWORD(v1197) = 0;
      sub_23CCC14E0(&v1199, v174, &v1197);
      LODWORD(v1195) = 0;
      sub_23CCC14E0(&v1197, v174, &v1195);
      v177 = *(_DWORD *)(v2 + 16);
      sub_23CCC16CC(&v1195, v174);
      if ((int)v173 < 1)
        goto LABEL_1456;
      v178 = 0;
      v1147 = (uint64_t)(v1152 + 445);
      v1066 = 4 * v176;
      v1121 = v173;
      v1075 = v174;
      v1155 = v176;
      v1079 = v177;
      while (1)
      {
        v179 = (uint64_t)v1152;
        v180 = *(int *)(v1152[413] + 4 * v178);
        if (!v177 || *(_BYTE *)(v1152[404] + v180))
          break;
LABEL_327:
        if (++v178 == v173)
        {
LABEL_1456:
          if (v1195)
          {
            v1196 = v1195;
            operator delete(v1195);
          }
          if (v1197)
          {
            v1198 = v1197;
            operator delete(v1197);
          }
          if (v1199)
          {
            v1200 = v1199;
            operator delete(v1199);
          }
          if (v1201)
          {
            v1202 = v1201;
            operator delete(v1201);
          }
          if (v1203)
          {
            v1204 = v1203;
            operator delete(v1203);
          }
          if (v1205)
          {
            v1206 = v1205;
            operator delete(v1205);
          }
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          v1020 = 360;
          do
          {
            v1021 = &v1232[v1020 / 8];
            v1022 = *(void **)((char *)&__p + v1020);
            if (v1022)
            {
              *(v1021 - 2) = v1022;
              operator delete(v1022);
            }
            v1023 = *(v1021 - 6);
            if (v1023)
            {
              *(_QWORD *)((char *)&v1224 + v1020) = v1023;
              operator delete(v1023);
            }
            v1024 = &v1232[v1020 / 8];
            v1025 = *(void **)((char *)&v1216 + v1020);
            if (v1025)
            {
              *(v1024 - 8) = v1025;
              operator delete(v1025);
            }
            v1026 = *(v1024 - 12);
            if (v1026)
            {
              *(_QWORD *)((char *)&v1213 + v1020) = v1026;
              operator delete(v1026);
            }
            v1027 = *(v1021 - 15);
            if (v1027)
            {
              v1210[v1020 / 8] = v1027;
              operator delete(v1027);
            }
            v1020 -= 120;
          }
          while (v1020);
          return 0;
        }
      }
      v181 = v1130 + 4 * (int)v180 * (int)v174;
      v182 = *(unsigned int *)(v1152[416] + 4 * v180);
      v183 = (int *)__p;
      v1140 = v178;
      if ((v182 & 0x80000000) != 0)
        goto LABEL_230;
      v1177 = (int *)(v1130 + 4 * (int)v180 * (int)v174);
      v184 = *(_DWORD *)(v1152[416] + 4 * v180);
      v185 = 3 * v182;
      v186 = (unsigned int *)(v1152[17] + 4 * v185);
      LODWORD(v187) = v186[1];
      v188 = *v186;
      LODWORD(v1193) = *v186;
      HIDWORD(v1193) = v187;
      v189 = v186[2];
      v1194 = v189;
      v190 = (int *)(v1152[20] + 4 * v185);
      LODWORD(v185) = v190[1];
      v1112 = *v190;
      LODWORD(v1191) = *v190;
      v1164 = v185;
      HIDWORD(v1191) = v185;
      v1087 = v190[2];
      v1192 = v1087;
      v1190 = -1;
      v1189 = -1;
      v1188 = -1;
      v1187 = -1;
      sub_23CCCC9AC(v1152, v184, v180, (unsigned int *)&v1193, &v1189);
      v1103 = v184;
      sub_23CCCC9AC(v1152, v184, v180, (unsigned int *)&v1191, &v1187);
      v191 = v1190;
      v192 = v1188;
      if ((v1190 & 0x80000000) == 0 || v1188 < 0)
      {
        v194 = v1187;
        v195 = HIDWORD(v1187);
        v197 = v188;
      }
      else
      {
        v1193 = v1191;
        v193 = v1192;
        v1194 = v1192;
        v1191 = __PAIR64__(v187, v188);
        v1192 = v189;
        v194 = v1189;
        v195 = HIDWORD(v1189);
        v1189 = v1187;
        v196 = v1188;
        v1190 = v1188;
        v1187 = __PAIR64__(v195, v194);
        v1188 = v191;
        v192 = v191;
        v191 = v196;
        v1087 = v189;
        v1164 = v187;
        v1112 = v188;
        v189 = v193;
        v187 = HIDWORD(v1193);
        v197 = v1193;
      }
      v173 = v1121;
      if (v192 != -1)
      {
        if (!v177
          || (v198 = v1152[404], *(_BYTE *)(v198 + (int)v1189))
          && *(_BYTE *)(v198 + SHIDWORD(v1189))
          && *(_BYTE *)(v198 + v191)
          && *(_BYTE *)(v198 + (int)v194)
          && *(_BYTE *)(v198 + (int)v195)
          && *(_BYTE *)(v198 + v192))
        {
          v199 = v195;
          v200 = (int *)(v1130 + 4 * HIDWORD(v1189) * (int)v174);
          v201 = v174;
          v202 = (int *)(v1130 + 4 * v191 * (int)v176);
          v1059 = v197;
          v1094 = v183;
          v1070 = (int *)(v1130 + 4 * (int)v1189 * (int)v176);
          sub_23CCAE5A4(v1070, v200, v202, v176, (int *)(v1152[23] + 12 * v197), (int *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v189), (int *)(v1152[23] + 12 * v1103), v183);
          v203 = (int *)(v1130 + 4 * (int)(v194 * v201));
          v204 = (int *)(v1130 + 4 * (int)(v199 * v1155));
          v205 = (int *)(v1130 + 4 * v192 * v201);
          sub_23CCAE5A4(v203, v204, v205, v201, (int *)(v1152[23] + 12 * (int)v1112), (int *)(v1152[23] + 12 * v1164), (int *)(v1152[23] + 12 * v1087), (int *)(v1152[23] + 12 * v1103), __b);
          if (v201 < 1)
          {
            v2 = v1160;
            v270 = *(unsigned __int8 *)(v1160 + 24);
            v173 = v1121;
            if (!*(_BYTE *)(v1160 + 24))
            {
              v298 = 0;
              v293 = 0;
              v299 = 0;
              LODWORD(v174) = v1075;
              v176 = v1155;
              goto LABEL_294;
            }
            v271 = (int *)v1203;
            v272 = (int *)v1201;
            v273 = (int *)v1199;
            v274 = (int *)v1197;
          }
          else
          {
            v206 = 0;
            v173 = v1121;
            v207 = (int *)__p;
            v208 = __b;
            v209 = v1207;
            v176 = v1155;
            do
            {
              v210 = v207[v206 / 4];
              v211 = *(_DWORD *)&v208[v206];
              v38 = __OFADD__(v211, v210);
              v212 = v211 + v210;
              if (v212 < 0 != v38)
                ++v212;
              v209[v206 / 4] = v212 >> 1;
              v206 += 4;
            }
            while (v1066 != v206);
            if ((_DWORD)v1155 == 2)
            {
              sub_23CCAECA0((unint64_t)v1070, v200, v202, (_DWORD *)(v1152[23] + 12 * v1059), (_DWORD *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v1103), v207);
              sub_23CCAECA0((unint64_t)v203, v204, v205, (_DWORD *)(v1152[23] + 12 * (int)v1112), (_DWORD *)(v1152[23] + 12 * v1164), (int *)(v1152[23] + 12 * v1103), (int *)__b);
              v207 = (int *)__p;
              v208 = __b;
              v213 = v1205;
              v214 = *(_DWORD *)__b + *(_DWORD *)__p;
              if (v214 < 0 != __OFADD__(*(_DWORD *)__b, *(_DWORD *)__p))
                ++v214;
              *(_DWORD *)v1205 = v214 >> 1;
              v215 = v207[1];
              v216 = *((_DWORD *)v208 + 1);
              v38 = __OFADD__(v216, v215);
              v217 = v216 + v215;
              if (v217 < 0 != v38)
                ++v217;
              v213[1] = v217 >> 1;
              v209 = v1207;
              v176 = v1155;
              v173 = v1121;
              v218 = v1070;
            }
            else
            {
              v281 = 0;
              v213 = v1205;
              v218 = v1070;
              do
              {
                v282 = v1070[v281 / 4];
                v283 = v203[v281 / 4];
                v38 = __OFADD__(v283, v282);
                v284 = v283 + v282;
                if (v284 < 0 != v38)
                  ++v284;
                v285 = 1431655766
                     * ((v284 >> 1) - (v202[v281 / 4] + v205[v281 / 4]) + 2 * (v204[v281 / 4] + v200[v281 / 4]));
                v213[v281 / 4] = HIDWORD(v285) + (v285 >> 63);
                v281 += 4;
              }
              while (v1066 != v281);
            }
            v286 = 0;
            v271 = (int *)v1203;
            v272 = (int *)v1201;
            v273 = (int *)v1199;
            v274 = (int *)v1197;
            do
            {
              v207[v286] = v200[v286] + v218[v286] - v202[v286];
              *(_DWORD *)&v208[4 * v286] = v204[v286] + v203[v286] - v205[v286];
              v271[v286] = v1177[v286] - v207[v286];
              v272[v286] = v1177[v286] - *(_DWORD *)&v208[4 * v286];
              v273[v286] = v1177[v286] - v209[v286];
              v274[v286] = v1177[v286] - v213[v286];
              ++v286;
            }
            while (v176 != v286);
            v2 = v1160;
            if (!*(_BYTE *)(v1160 + 24))
            {
              v304 = *v271;
              if (*v271 < 0)
                v304 = -v304;
              LODWORD(v174) = v1075;
              v298 = -(v1075 * __clz(v304 + 1));
              v305 = *v272;
              if (*v272 < 0)
                v305 = -v305;
              v293 = -(v176 * __clz(v305 + 1));
              v306 = *v273;
              if (*v273 < 0)
                v306 = -v306;
              v270 = -(v1075 * __clz(v306 + 1));
              v307 = *v274;
              if (*v274 < 0)
                v307 = -v307;
              v299 = -(v176 * __clz(v307 + 1));
LABEL_294:
              v183 = v1094;
              if (v298 > v293 || v298 > v270 || v298 > v299)
              {
                if (v293 > v270 || v293 > v299)
                {
                  v177 = v1079;
                  if (v270 <= v299)
                  {
                    v309 = 0;
                    v308 = 1;
                    v183 = (int *)v1207;
                    v310 = 1;
                  }
                  else
                  {
                    v308 = 1;
                    v183 = (int *)v1205;
                    v309 = 1;
                    v310 = 2;
                  }
                  goto LABEL_302;
                }
                v308 = 0;
                v309 = 1;
                v183 = (int *)__b;
                v310 = 2;
              }
              else
              {
                v308 = 0;
                v309 = 0;
                v310 = 1;
              }
              v177 = v1079;
LABEL_302:
              v178 = v1140;
              v311 = (uint64_t)(v1152 + 445);
              sub_23CCC4CE0(v1147, v309, &v1211);
              v312 = &v1211;
LABEL_320:
              sub_23CCC4CE0(v311, v308, (_WORD *)v312 + v310);
              v229 = 2;
              v181 = (uint64_t)v1177;
              goto LABEL_321;
            }
          }
          v287 = *(unsigned __int8 *)(v2 + 8);
          v288 = (unsigned __int16)v1211;
          v289 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1211 + 2048) >> 10) & 0x7CLL));
          v1105 = HIWORD(v1211);
          v290 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((HIWORD(v1211) + 2048) >> 10) & 0x7CLL));
          LODWORD(v174) = v1075;
          v1114 = v290 + v289 + sub_23CCD36C8(v271, v1075, v287, (unsigned __int16 **)&v1247);
          v291 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v288) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v292 = v1212;
          LODWORD(v288) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1212 + 2048) >> 10) & 0x7CLL));
          v293 = v288 + sub_23CCD36C8(v272, v1155, v287, (unsigned __int16 **)&v1247) + v291;
          LODWORD(v1105) = *(_DWORD *)((char *)&unk_23CCD46E0
                                     + (((unint64_t)(67584 - v1105) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v294 = sub_23CCD36C8(v273, v1075, v287, (unsigned __int16 **)&v1247);
          v295 = 67584 - v292;
          v2 = v1160;
          v296 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((v295 >> 10) & 0x3FFFFFFFFFFFFCLL));
          v297 = sub_23CCD36C8(v274, v1155, v287, (unsigned __int16 **)&v1247);
          v298 = v1114;
          v270 = v1105 + v289 + v294;
          v176 = v1155;
          v299 = v296 + v291 + v297;
          v173 = v1121;
          goto LABEL_294;
        }
      }
      if (v191 == -1
        || v177
        && ((v219 = v1152[404], !*(_BYTE *)(v219 + (int)v1189))
         || !*(_BYTE *)(v219 + SHIDWORD(v1189))
         || !*(_BYTE *)(v219 + v191)))
      {
        if (HIDWORD(v1189) == -1
          || v177 && ((v226 = v1152[404], !*(_BYTE *)(v226 + (int)v1189)) || !*(_BYTE *)(v226 + SHIDWORD(v1189))))
        {
          v2 = v1160;
          v178 = v1140;
          v181 = v1130 + 4 * (int)v180 * (int)v174;
          v179 = (uint64_t)v1152;
LABEL_230:
          v228 = sub_23CCCCD44(v179, v180, v183, v1230, *(_DWORD *)(v2 + 16));
          v229 = 0;
          if ((int)v176 >= 1 && !v228)
          {
            v1096 = v183;
            v230 = v181;
            v231 = 0;
            do
            {
              v232 = 0;
              v233 = v1195;
              v234 = (char *)v1195 + 20 * v231;
              v235 = *(unsigned __int8 *)(v2 + 24);
              v1178 = *(unsigned __int8 *)(v2 + 8);
              v236 = 0x7FFFFFFF;
              v237 = -1;
              v1165 = __p;
              v238 = -1;
              do
              {
                v239 = v233[5 * v231 + 1 + ((v237 + *v234) & 3)];
                v240 = *(_DWORD *)(v230 + 4 * v231) - v239;
                if (v235)
                {
                  v241 = sub_23CCCD000(v240, v231, v232, v1215, v1178, v1232);
                }
                else
                {
                  if (v240 >= 0)
                    v242 = *(_DWORD *)(v230 + 4 * v231) - v239;
                  else
                    v242 = v239 - *(_DWORD *)(v230 + 4 * v231);
                  v241 = -__clz(v242 + 1);
                }
                if (v241 < v236)
                {
                  v1165[v231] = v239;
                  v236 = v241;
                  v238 = v232;
                }
                ++v232;
                --v237;
              }
              while (v232 != 4);
              sub_23CCC4CE0(v1147, v238 & 1, v1215);
              sub_23CCC4CE0(v1147, (v238 >> 1) & 1, &v1215[(v238 & 1) + 1]);
              ++v231;
              v176 = v1155;
              v2 = v1160;
            }
            while (v231 != v1155);
            v229 = 0;
            LODWORD(v174) = v1075;
            v177 = v1079;
            v178 = v1140;
            v181 = v230;
            v173 = v1121;
            v183 = v1096;
          }
        }
        else
        {
          v227 = v187;
          v2 = v1160;
          v178 = v1140;
          v181 = v1130 + 4 * (int)v180 * (int)v174;
          if ((_DWORD)v176 == 2)
          {
            v1226 = 0;
            sub_23CCAE844((int *)(v1130 + 8 * (_DWORD)v1189), (int *)(v1130 + 8 * HIDWORD(v1189)), v1177, (_DWORD *)(v1152[23] + 12 * v197), (_DWORD *)(v1152[23] + 12 * v227), (int *)(v1152[23] + 12 * v1103), v183, &v1226);
            sub_23CCC4CE0(v1147, v1226 != 0, &v1225);
          }
          else if ((int)v176 >= 1)
          {
            v275 = 0;
            v276 = v1130 + 4 * (int)v1189 * (int)v174;
            v277 = v1130 + 4 * HIDWORD(v1189) * (int)v176;
            do
            {
              v278 = *(_DWORD *)(v276 + v275);
              v279 = *(_DWORD *)(v277 + v275);
              v38 = __OFADD__(v279, v278);
              v280 = v279 + v278;
              if (v280 < 0 != v38)
                ++v280;
              v183[v275 / 4] = v280 >> 1;
              v275 += 4;
            }
            while (v1066 != v275);
          }
          v229 = 1;
        }
LABEL_321:
        if ((int)v174 >= 1)
        {
          v314 = (char *)v1195 + 4;
          v315 = (int *)v181;
          v316 = v176;
          do
          {
            v318 = *v315++;
            v317 = v318;
            v319 = *((_DWORD *)v314 - 1);
            if (*(_DWORD *)&v314[4 * (((_BYTE)v319 - 1) & 3)] != v318)
            {
              *((_DWORD *)v314 - 1) = v319 + 1;
              *(_DWORD *)&v314[4 * (v319 & 3)] = v317;
            }
            v314 += 20;
            --v316;
          }
          while (v316);
        }
        sub_23CCC4E54((uint64_t)v1152, v181, (uint64_t)v183, v174, v1083, *(_BYTE *)(v2 + 8), &v1232[15 * v229]);
        goto LABEL_327;
      }
      v220 = (int *)(v1130 + 4 * (int)v1189 * (int)v176);
      v221 = (int *)(v1130 + 4 * HIDWORD(v1189) * (int)v174);
      v222 = (int *)(v1130 + 4 * v191 * (int)v176);
      v223 = v197;
      sub_23CCAE5A4(v220, v221, v222, v176, (int *)(v1152[23] + 12 * v197), (int *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v189), (int *)(v1152[23] + 12 * v1103), __b);
      v2 = v1160;
      v1095 = v183;
      if ((_DWORD)v174 == 2)
      {
        sub_23CCAECA0((unint64_t)v220, v221, v222, (_DWORD *)(v1152[23] + 12 * v223), (_DWORD *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v1103), (int *)v1205);
        v224 = v1205;
        v225 = v1130 + 8 * (_DWORD)v180;
        v173 = v1121;
      }
      else
      {
        if ((int)v176 < 1)
        {
          v268 = *(unsigned __int8 *)(v1160 + 24);
          v173 = v1121;
          if (!*(_BYTE *)(v1160 + 24))
          {
            v266 = 0;
            v263 = 0;
            v269 = 0;
            goto LABEL_308;
          }
          v251 = (int *)v1203;
          v252 = (int *)v1201;
          v174 = (unint64_t)v1199;
          v253 = (int *)v1197;
          goto LABEL_255;
        }
        v243 = 0;
        v224 = v1205;
        v225 = v1130 + 4 * (int)v180 * (int)v174;
        v173 = v1121;
        do
        {
          v244 = v220[v243 / 4];
          v245 = v221[v243 / 4];
          v38 = __OFADD__(v245, v244);
          v246 = v245 + v244;
          if (v246 < 0 != v38)
            ++v246;
          v224[v243 / 4] = v246 >> 1;
          v243 += 4;
        }
        while (v1066 != v243);
      }
      v247 = 0;
      v248 = __p;
      v249 = __b;
      v250 = v1207;
      v251 = (int *)v1203;
      v252 = (int *)v1201;
      v174 = (unint64_t)v1199;
      v253 = (int *)v1197;
      do
      {
        v254 = v221[v247] + v220[v247] - v222[v247];
        v248[v247] = v254;
        v255 = *(_DWORD *)&v249[4 * v247];
        v38 = __OFADD__(v255, v254);
        v256 = v255 + v254;
        if (v256 < 0 != v38)
          ++v256;
        v250[v247] = v256 >> 1;
        v251[v247] = *(_DWORD *)(v225 + 4 * v247) - v248[v247];
        v252[v247] = *(_DWORD *)(v225 + 4 * v247) - *(_DWORD *)&v249[4 * v247];
        *(_DWORD *)(v174 + 4 * v247) = *(_DWORD *)(v225 + 4 * v247) - v250[v247];
        v253[v247] = *(_DWORD *)(v225 + 4 * v247) - v224[v247];
        ++v247;
      }
      while (v176 != v247);
      if (!*(_BYTE *)(v1160 + 24))
      {
        if (v1075 < 1)
        {
          v266 = 0;
          v263 = 0;
          v268 = 0;
          v269 = 0;
        }
        else
        {
          v300 = *v251;
          if (*v251 < 0)
            v300 = -v300;
          v266 = -(v1075 * __clz(v300 + 1));
          v301 = *v252;
          if (*v252 < 0)
            v301 = -v301;
          v263 = -(v176 * __clz(v301 + 1));
          v302 = *(_DWORD *)v174;
          if (*(int *)v174 < 0)
            v302 = -v302;
          v268 = -(v1075 * __clz(v302 + 1));
          v303 = *v253;
          if (*v253 < 0)
            v303 = -v303;
          v269 = -(v176 * __clz(v303 + 1));
        }
        LODWORD(v174) = v1075;
LABEL_308:
        v177 = v1079;
        v178 = v1140;
        if (v266 > v263 || v266 > v268 || v266 > v269)
        {
          if (v263 > v268 || v263 > v269)
          {
            if (v268 <= v269)
            {
              v313 = 0;
              v308 = 1;
              v183 = (int *)v1207;
              v310 = 1;
              goto LABEL_319;
            }
            v308 = 1;
            v183 = (int *)v1205;
            v313 = 1;
          }
          else
          {
            v308 = 0;
            v313 = 1;
            v183 = (int *)__b;
          }
          v310 = 2;
        }
        else
        {
          v308 = 0;
          v313 = 0;
          v310 = 1;
          v183 = v1095;
        }
LABEL_319:
        v311 = (uint64_t)(v1152 + 445);
        sub_23CCC4CE0(v1147, v313, &v1213);
        v312 = &v1213;
        goto LABEL_320;
      }
LABEL_255:
      v257 = *(unsigned __int8 *)(v1160 + 8);
      v258 = (unsigned __int16)v1213;
      v259 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1213 + 2048) >> 10) & 0x7CLL));
      v1104 = HIWORD(v1213);
      v260 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((HIWORD(v1213) + 2048) >> 10) & 0x7CLL));
      v1113 = v260 + v259 + sub_23CCD36C8(v251, v1075, v257, (unsigned __int16 **)&v1247);
      v261 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v258) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v1088 = v261;
      v262 = v1214;
      LODWORD(v258) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1214 + 2048) >> 10) & 0x7CLL));
      v263 = v258 + sub_23CCD36C8(v252, v1155, v257, (unsigned __int16 **)&v1247) + v261;
      LODWORD(v1104) = *(_DWORD *)((char *)&unk_23CCD46E0
                                 + (((unint64_t)(67584 - v1104) >> 10) & 0x3FFFFFFFFFFFFCLL));
      LODWORD(v258) = sub_23CCD36C8((int *)v174, v1075, v257, (unsigned __int16 **)&v1247);
      v176 = v1155;
      v264 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v262) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v265 = sub_23CCD36C8(v253, v1155, v257, (unsigned __int16 **)&v1247);
      v266 = v1113;
      v267 = v264 + v1088;
      LODWORD(v174) = v1075;
      v2 = v1160;
      v268 = v1104 + v259 + v258;
      v269 = v267 + v265;
      v173 = v1121;
      goto LABEL_308;
    case 5:
      v455 = *(unsigned int *)(v3 + 3548);
      v456 = *(_DWORD *)(v3 + 3544);
      v1150 = *(_QWORD *)(v3 + 3208);
      v457 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      v1169 = *(_DWORD *)(v2 + 16);
      v1230 = 0;
      __p = 0;
      v1231 = 0;
      sub_23CCBD068((_QWORD *)(v3 + 184), (_QWORD *)(v3 + 232), (_QWORD *)(v3 + 208), (uint64_t *)(v3 + 3256), v455, (uint64_t *)&__p, v457);
      *(_QWORD *)&v1239 = 0;
      v1237 = 0u;
      *(_OWORD *)v1238 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1236 = 0u;
      *(_OWORD *)v1233 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1232 = 0u;
      sub_23CCB7FFC((uint64_t)v1232, v456);
      LOWORD(v1187) = 0x8000;
      v1215[0] = 0x8000;
      if ((int)v455 < 1)
        goto LABEL_633;
      v458 = 0;
      v1124 = (uint64_t)(v1152 + 445);
      v1158 = 4 * v455;
      v1143 = v456;
      v1181 = v457;
      while (1)
      {
        v459 = *(int *)(v1152[413] + v458);
        if (v1169 && !*(_BYTE *)(v1152[404] + v459))
          goto LABEL_632;
        v460 = (_DWORD *)(v1150 + 4 * (int)v459 * v456);
        v461 = *v460 - v457;
        v462 = v460[1] - v457;
        if (v461 >= 0)
          v463 = v461;
        else
          v463 = -v461;
        if (v462 >= 0)
          v464 = v462;
        else
          v464 = -v462;
        v465 = v457 - v463;
        v466 = v464 - v457;
        if (v461 >= 0)
          v466 = v457 - v464;
        v467 = v463 - v457;
        if (v462 >= 0)
          v467 = v465;
        v468 = v465 - v464;
        LODWORD(v1210[0]) = v465 - v464;
        if (v465 - v464 < 0)
          v469 = v466;
        else
          v469 = v461;
        if (v465 - v464 < 0)
          v470 = v467;
        else
          v470 = v462;
        __b = (char *)__PAIR64__(v470, v469);
        v471 = (int *)((char *)__p + 12 * (int)v459);
        v472 = *v471;
        v473 = *v471;
        LODWORD(v1207) = *v471;
        v474 = v471[1];
        HIDWORD(v1207) = v474;
        v475 = v471[2];
        LODWORD(v1208) = v475;
        if (!sub_23CCCCEAC((uint64_t)v1152, v459, (uint64_t)&v1205, *(_DWORD *)(v2 + 4), *(_DWORD *)(v2 + 16)))
        {
          v490 = v473 * (uint64_t)v469 + v474 * (uint64_t)v470 + v475 * (uint64_t)v468;
          if ((v490 & 0x8000000000000000) != 0)
          {
            v472 = -v472;
            v474 = -v474;
            v475 = -v475;
            v1207 = (void *)__PAIR64__(v474, v472);
            LODWORD(v1208) = v475;
          }
          v2 = v1160;
          v456 = v1143;
          sub_23CCC4CE0(v1124, v490 >> 63, v1215);
          if (v472 >= 0)
            v491 = v472;
          else
            v491 = -v472;
          if (v474 >= 0)
            v492 = v474;
          else
            v492 = -v474;
          if (v475 >= 0)
            v493 = v475;
          else
            v493 = -v475;
          if (v491 >= v492 && v491 >= v493)
          {
            v495 = &v1207;
            p_b = (int *)&__b;
            v470 = v469;
            v474 = v472;
            v457 = v1181;
          }
          else
          {
            v495 = (void **)((char *)&v1207 + 4);
            p_b = (int *)&__b + 1;
            v457 = v1181;
            if (v492 < v493)
            {
              if ((v475 & 0x80000000) == 0)
              {
LABEL_551:
                v497 = (int)__b;
                v498 = HIDWORD(__b);
                if (v468 < 0)
                {
                  if (SHIDWORD(__b) >= 0)
                    v519 = HIDWORD(__b);
                  else
                    v519 = -HIDWORD(__b);
                  v520 = v519 - v457;
                  v499 = v457 - v519;
                  if ((int)__b < 0)
                  {
                    v499 = v520;
                    v497 = -(int)__b;
                  }
                  if ((HIDWORD(__b) & 0x80000000) != 0)
                    v498 = v497 - v457;
                  else
                    v498 = v457 - v497;
                }
                else
                {
                  v499 = (int)__b;
                }
                __b = (char *)__PAIR64__(v498, v499);
                goto LABEL_631;
              }
LABEL_556:
              LODWORD(v1208) = -v475;
              v468 = -v468;
              LODWORD(v1210[0]) = v468;
              goto LABEL_551;
            }
          }
          *p_b = v468;
          LODWORD(v1210[0]) = v470;
          *(_DWORD *)v495 = v475;
          v468 = v470;
          v475 = v474;
          LODWORD(v1208) = v474;
          if ((v474 & 0x80000000) == 0)
            goto LABEL_551;
          goto LABEL_556;
        }
        v476 = (int)v1205;
        v477 = HIDWORD(v1205);
        v478 = (int)v1206;
        v479 = (int)v1205 * (uint64_t)v473 + SHIDWORD(v1205) * (uint64_t)v474 + (int)v1206 * (uint64_t)v475;
        if (v479 >= 0)
          v480 = v472;
        else
          v480 = -v472;
        if (v479 >= 0)
          v481 = v474;
        else
          v481 = -v474;
        if (v479 >= 0)
          v482 = v475;
        else
          v482 = -v475;
        LODWORD(v1199) = v480;
        LODWORD(v1197) = v481;
        LODWORD(v1195) = v469;
        LODWORD(v1193) = v470;
        LODWORD(v1191) = v469;
        LODWORD(v1189) = v470;
        if (v472 >= 0)
          v483 = v472;
        else
          v483 = -v472;
        if (v474 >= 0)
          v484 = v474;
        else
          v484 = -v474;
        if (v475 >= 0)
          v485 = v475;
        else
          v485 = -v475;
        if (v483 >= v484 && v483 >= v485)
        {
          v500 = &v1199;
          v501 = &v1195;
          v489 = v469;
          v457 = v1181;
        }
        else
        {
          v457 = v1181;
          if (v484 < v485)
          {
            v487 = v470;
            v488 = v469;
            v489 = v468;
            goto LABEL_559;
          }
          v500 = &v1197;
          v501 = (void **)&v1193;
          v489 = v470;
          v480 = v481;
        }
        *(_DWORD *)v501 = v468;
        *(_DWORD *)v500 = v482;
        v488 = (int)v1195;
        v487 = v1193;
        v482 = v480;
LABEL_559:
        if (v482 >= 0)
          v502 = v489;
        else
          v502 = -v489;
        if (v482 >= 0)
          v503 = v482;
        else
          v503 = -v482;
        if (v502 < 0)
        {
          if (v487 >= 0)
            v504 = v487;
          else
            v504 = -v487;
          v505 = v504 - v457;
          v506 = v457 - v504;
          if (v488 >= 0)
            v507 = v488;
          else
            v507 = -v488;
          if (v488 >= 0)
            v488 = v506;
          else
            v488 = v505;
          if (v487 >= 0)
            v487 = v457 - v507;
          else
            v487 = v507 - v457;
        }
        LODWORD(v1195) = v488;
        LODWORD(v1193) = v487;
        if (v476 >= 0)
          v508 = v476;
        else
          v508 = -v476;
        if (v477 >= 0)
          v509 = v477;
        else
          v509 = -v477;
        if (v478 >= 0)
          v510 = v478;
        else
          v510 = -v478;
        if (v508 < v509 || v508 < v510)
        {
          if (v509 < v510)
            goto LABEL_593;
          v512 = (unint64_t *)&v1189;
          v469 = v470;
          v511 = (void **)((char *)&v1205 + 4);
          v476 = v477;
        }
        else
        {
          v511 = &v1205;
          v512 = &v1191;
        }
        *(_DWORD *)v512 = v468;
        *(_DWORD *)v511 = v478;
        v468 = v469;
        v478 = v476;
        LODWORD(v1206) = v476;
LABEL_593:
        if (v478 < 0)
        {
          v478 = -v478;
          LODWORD(v1206) = v478;
          v468 = -v468;
        }
        v513 = v1191;
        v514 = v1189;
        if (v468 < 0)
        {
          if ((int)v1189 >= 0)
            v516 = v1189;
          else
            v516 = -(int)v1189;
          v517 = v516 - v457;
          v518 = v457 - v516;
          if ((v1191 & 0x80000000) == 0)
            v515 = v518;
          else
            v515 = v517;
          if ((v1191 & 0x80000000) != 0)
            v513 = -(int)v1191;
          if ((v1189 & 0x80000000) != 0)
            v514 = v513 - v457;
          else
            v514 = v457 - v513;
        }
        else
        {
          v515 = v1191;
        }
        v521 = v1199;
        v522 = v1197;
        LODWORD(v1203) = v488 - (_DWORD)v1199;
        HIDWORD(v1203) = v487 - (_DWORD)v1197;
        LODWORD(v1204) = v502 - v503;
        LODWORD(v1201) = v515 - (_DWORD)v1205;
        HIDWORD(v1201) = v514 - HIDWORD(v1205);
        LODWORD(v1202) = v468 - v478;
        if (*(_BYTE *)(v1160 + 24))
        {
          v523 = *(unsigned __int8 *)(v1160 + 8);
          v524 = (unsigned __int16)v1187;
          v1117 = v488;
          v1090 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1187 + 2048) >> 10) & 0x7CLL));
          v1099 = v1197;
          v456 = v1143;
          v1108 = v487;
          v525 = v503;
          v526 = v458;
          v527 = v468;
          v528 = v515;
          v1084 = sub_23CCD36C8((int *)&v1203, v1143, v523, (unsigned __int16 **)v1232);
          LODWORD(v524) = *(_DWORD *)((char *)&unk_23CCD46E0
                                    + (((unint64_t)(67584 - v524) >> 10) & 0x3FFFFFFFFFFFFCLL));
          v529 = sub_23CCD36C8((int *)&v1201, v1143, v523, (unsigned __int16 **)v1232);
          v515 = v528;
          v468 = v527;
          v458 = v526;
          v503 = v525;
          v487 = v1108;
          v530 = v1084 + v1090;
          v488 = v1117;
          v531 = v529 + v524;
          v522 = v1099;
          v457 = v1181;
        }
        else
        {
          v456 = v1143;
          if (v1143 < 1)
            goto LABEL_627;
          if (v488 - (int)v1199 >= 0)
            v532 = v488 - (_DWORD)v1199;
          else
            v532 = (_DWORD)v1199 - v488;
          v530 = -(v1143 * __clz(v532 + 1));
          if (v515 - (int)v1205 >= 0)
            v533 = v515 - (_DWORD)v1205;
          else
            v533 = (_DWORD)v1205 - v515;
          v531 = -(v1143 * __clz(v533 + 1));
        }
        if (v530 <= v531)
        {
LABEL_627:
          v534 = 0;
          v1207 = (void *)__PAIR64__(v522, v521);
          v468 = v502;
          LODWORD(v1208) = v503;
          goto LABEL_628;
        }
        v1207 = v1205;
        LODWORD(v1208) = (_DWORD)v1206;
        v534 = 1;
        v488 = v515;
        v487 = v514;
LABEL_628:
        v2 = v1160;
        __b = (char *)__PAIR64__(v487, v488);
        LODWORD(v1210[0]) = v468;
        sub_23CCC4CE0(v1124, v534, &v1187);
LABEL_631:
        sub_23CCC4E54((uint64_t)v1152, (uint64_t)&__b, (uint64_t)&v1207, v456, v1152 + 392, *(_BYTE *)(v2 + 8), v1232);
LABEL_632:
        v458 += 4;
        if (v1158 == v458)
        {
LABEL_633:
          if (v1238[0])
          {
            v1238[1] = v1238[0];
            operator delete(v1238[0]);
          }
          if (v1236[1])
          {
            *(void **)&v1237 = v1236[1];
            operator delete(v1236[1]);
          }
          if (v1235[0])
          {
            v1235[1] = v1235[0];
            operator delete(v1235[0]);
          }
          if (v1233[1])
          {
            *(void **)&v1234 = v1233[1];
            operator delete(v1233[1]);
          }
          if (v1232[0])
          {
            v1232[1] = v1232[0];
            operator delete(v1232[0]);
          }
LABEL_1423:
          if (__p)
          {
            v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          return 0;
        }
      }
    case 6:
      v535 = *(unsigned int *)(v3 + 3548);
      v536 = *(_DWORD *)(v3 + 3544);
      v537 = *(_QWORD *)(v3 + 3208);
      v538 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      v1230 = 0;
      __p = 0;
      v1231 = 0;
      v1159 = v538;
      sub_23CCBD068((_QWORD *)(v3 + 184), (_QWORD *)(v3 + 232), (_QWORD *)(v3 + 208), (uint64_t *)(v3 + 3256), v535, (uint64_t *)&__p, v538);
      v539 = 0;
      v1254 = 0;
      v1091 = (_QWORD *)(v3 + 3136);
      v1252 = 0u;
      v1253 = 0u;
      v1250 = 0u;
      v1251 = 0u;
      v1248 = 0u;
      v1249 = 0u;
      v1246 = 0u;
      v1247 = 0u;
      v1244 = 0u;
      v1245 = 0u;
      v1242 = 0u;
      v1243 = 0u;
      v1240 = 0u;
      v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      v1237 = 0u;
      v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_23CCB7FFC((uint64_t)&v1232[v539], v536);
        v539 += 15;
      }
      while (v539 != 45);
      memset_pattern16(&v1193, &unk_23CCD46A0, 6uLL);
      memset_pattern16(&v1191, &unk_23CCD46A0, 6uLL);
      v1228 = 0x8000;
      v1227 = 0x8000;
      if ((int)v535 <= 0)
        goto LABEL_1411;
      v540 = 0;
      v1151 = *(_DWORD *)(v2 + 16);
      v1085 = v3 + 3560;
      v1109 = 4 * v535;
      v1118 = v537;
      v1100 = v536;
      break;
    default:
      return 5;
  }
  while (1)
  {
    v541 = *(int *)(*(_QWORD *)(v3 + 3304) + v540);
    if (v1151 && !*(_BYTE *)(*(_QWORD *)(v3 + 3232) + v541))
      goto LABEL_1410;
    v1144 = v540;
    v542 = (_DWORD *)(v537 + 4 * (int)v541 * v536);
    v543 = *(unsigned int *)(*(_QWORD *)(v3 + 3328) + 4 * v541);
    v544 = *v542 - v1159;
    v545 = v542[1] - v1159;
    if (v544 >= 0)
      v546 = v544;
    else
      v546 = -v544;
    if (v545 >= 0)
      v547 = v545;
    else
      v547 = -v545;
    v548 = v1159 - v546;
    v549 = v547 - v1159;
    if (v544 >= 0)
      v549 = v1159 - v547;
    v550 = v546 - v1159;
    if (v545 >= 0)
      v550 = v548;
    v551 = v548 - v547;
    v1170 = v551;
    LODWORD(v1210[0]) = v551;
    if (v551 < 0)
      v552 = v549;
    else
      v552 = v544;
    if (v551 < 0)
      v545 = v550;
    __b = (char *)__PAIR64__(v545, v552);
    v1182 = v545;
    v553 = (char *)__p + 12 * (int)v541;
    LODWORD(v1207) = *v553;
    v554 = (int)v1207;
    v555 = (_QWORD *)v3;
    v556 = v553[1];
    HIDWORD(v1207) = v556;
    v557 = v553[2];
    v1133 = (int)v1207;
    LODWORD(v1208) = v557;
    if ((v543 & 0x80000000) == 0)
    {
      LODWORD(v1206) = -1;
      v1205 = (void *)-1;
      LODWORD(v1204) = -1;
      v1203 = (void *)-1;
      sub_23CCCC9AC(v555, v543, v541, (unsigned int *)(v555[17] + 12 * v543), &v1205);
      sub_23CCCC9AC(v555, v543, v541, (unsigned int *)(v555[20] + 12 * v543), &v1203);
      v558 = (int)v1206;
      v559 = (int)v1204;
      if ((v1206 & 0x80000000) == 0 || (v1204 & 0x80000000) != 0)
      {
        v560 = v1203;
        v561 = HIDWORD(v1203);
        v562 = (int)v1206;
      }
      else
      {
        v560 = v1205;
        v561 = HIDWORD(v1205);
        v1205 = v1203;
        v562 = (int)v1204;
        LODWORD(v1206) = (_DWORD)v1204;
        v1203 = (void *)__PAIR64__(v561, v560);
        LODWORD(v1204) = v558;
        v559 = v558;
      }
      v536 = v1100;
      v537 = v1118;
      if (v559 != -1)
      {
        if (!v1151
          || (v563 = v1152[404], *(_BYTE *)(v563 + (int)v1205))
          && *(_BYTE *)(v563 + SHIDWORD(v1205))
          && *(_BYTE *)(v563 + v562)
          && *(_BYTE *)(v563 + (int)v560)
          && *(_BYTE *)(v563 + (int)v561)
          && *(_BYTE *)(v563 + v559))
        {
          v564 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          v565 = v564[1];
          v566 = *v564 - v1159;
          v567 = v565 - v1159;
          if (v566 >= 0)
            v568 = v566;
          else
            v568 = -v566;
          if (v567 >= 0)
            v569 = v565 - v1159;
          else
            v569 = v1159 - v565;
          v570 = v1159 - v568;
          v571 = v1159 - v568 - v569;
          if (v571 < 0)
          {
            v572 = v569 - v1159;
            v573 = v1159 - v569;
            if (v566 >= 0)
              v566 = v573;
            else
              v566 = v572;
            v574 = v568 - v1159;
            if (v567 >= 0)
              v567 = v570;
            else
              v567 = v574;
          }
          v575 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          v576 = *v575 - v1159;
          v577 = v575[1] - v1159;
          if (v576 >= 0)
            v578 = *v575 - v1159;
          else
            v578 = v1159 - *v575;
          if (v577 >= 0)
            v579 = v577;
          else
            v579 = -v577;
          v580 = v1159 - v578;
          v581 = v1159 - v578 - v579;
          if (v581 < 0)
          {
            v582 = v579 - v1159;
            v583 = v1159 - v579;
            if (v576 >= 0)
              v576 = v583;
            else
              v576 = v582;
            v584 = v578 - v1159;
            if (v577 >= 0)
              v577 = v580;
            else
              v577 = v584;
          }
          v585 = (_DWORD *)(v1118 + 4 * v562 * v1100);
          v586 = *v585 - v1159;
          v587 = v585[1] - v1159;
          if (v586 >= 0)
            v588 = *v585 - v1159;
          else
            v588 = v1159 - *v585;
          if (v587 >= 0)
            v589 = v587;
          else
            v589 = -v587;
          v590 = v1159 - v588;
          v591 = v1159 - v588 - v589;
          if (v591 < 0)
          {
            v592 = v589 - v1159;
            v593 = v1159 - v589;
            if (v586 >= 0)
              v586 = v593;
            else
              v586 = v592;
            v594 = v588 - v1159;
            if (v587 >= 0)
              v587 = v590;
            else
              v587 = v594;
          }
          v1080 = v591;
          v595 = (_DWORD *)(v1118 + 4 * (int)(v560 * v1100));
          v596 = *v595 - v1159;
          v597 = v595[1] - v1159;
          if (v596 >= 0)
            v598 = *v595 - v1159;
          else
            v598 = v1159 - *v595;
          if (v597 >= 0)
            v599 = v597;
          else
            v599 = -v597;
          v600 = v1159 - v598;
          v601 = v581;
          v602 = v1159 - v598 - v599;
          if (v602 < 0)
          {
            v603 = v599 - v1159;
            v604 = v1159 - v599;
            if (v596 >= 0)
              v596 = v604;
            else
              v596 = v603;
            v605 = v598 - v1159;
            if (v597 >= 0)
              v597 = v600;
            else
              v597 = v605;
          }
          v606 = (_DWORD *)(v1118 + 4 * (int)(v561 * v1100));
          v607 = *v606 - v1159;
          v608 = v606[1] - v1159;
          if (v607 >= 0)
            v609 = *v606 - v1159;
          else
            v609 = v1159 - *v606;
          if (v608 >= 0)
            v610 = v608;
          else
            v610 = -v608;
          v611 = v1159 - v609;
          v612 = v1159 - v609 - v610;
          if (v612 < 0)
          {
            v613 = v610 - v1159;
            v614 = v1159 - v610;
            if (v607 >= 0)
              v607 = v614;
            else
              v607 = v613;
            v615 = v609 - v1159;
            if (v608 >= 0)
              v608 = v611;
            else
              v608 = v615;
          }
          v616 = (_DWORD *)(v1118 + 4 * v559 * v1100);
          v617 = v616[1];
          v618 = *v616 - v1159;
          v619 = v617 - v1159;
          if (v618 >= 0)
            v620 = v618;
          else
            v620 = -v618;
          if (v619 >= 0)
            v621 = v619;
          else
            v621 = -v619;
          v622 = v1159 - v620;
          v623 = v1159 - v620 - v621;
          if (v623 < 0)
          {
            v624 = v621 - v1159;
            v625 = v1159 - v621;
            if (v618 >= 0)
              v618 = v625;
            else
              v618 = v624;
            v626 = v620 - v1159;
            if (v619 >= 0)
              v619 = v622;
            else
              v619 = v626;
          }
          v627 = v557 * (uint64_t)v571 + v1133 * (uint64_t)v566 + v556 * (uint64_t)v567;
          if (v627 >= 0)
            v628 = v554;
          else
            v628 = -v554;
          if (v627 >= 0)
            v629 = v556;
          else
            v629 = -v556;
          if (v627 >= 0)
            v630 = v557;
          else
            v630 = -v557;
          LODWORD(v1189) = v628;
          LODWORD(v1187) = v629;
          v631 = v576 + v566 - v586;
          v632 = v577 + v567 - v587;
          *(_DWORD *)v1215 = v631;
          v1213 = v632;
          v633 = v607 + v596 - v618;
          v634 = v608 + v597 - v619;
          v1211 = v633;
          v1226 = v634;
          v38 = __OFADD__(v596, v566);
          v635 = v596 + v566;
          v636 = v597 + v567;
          v637 = v602 + v571;
          if (v635 < 0 != v38)
            ++v635;
          v638 = 1431655766 * ((v635 >> 1) + 2 * (v607 + v576) - (v586 + v618));
          v639 = HIDWORD(v638) + (v638 >> 63);
          v640 = v636 / 2 + 2 * (v608 + v577) - (v587 + v619);
          v1225 = v639;
          v1224 = v640 / 3;
          if (v637 >= 0)
            v641 = v602 + v571;
          else
            v641 = v637 + 1;
          v1223 = v552;
          v1222 = v1182;
          v1221 = v552;
          v1220 = v1182;
          v1219 = v552;
          v1218 = v1182;
          v1217 = v552;
          v1216 = v1182;
          if (v554 >= 0)
            v642 = v554;
          else
            v642 = -v554;
          if (v556 >= 0)
            v643 = v556;
          else
            v643 = -v556;
          if (v557 >= 0)
            v644 = v557;
          else
            v644 = -v557;
          if (v642 >= v643 && v642 >= v644)
          {
            v645 = &v1189;
            v646 = &v1223;
            v647 = v552;
            v648 = v1160;
            v649 = v1159;
            v650 = v1170;
            goto LABEL_1043;
          }
          v648 = v1160;
          v649 = v1159;
          v650 = v1170;
          if (v643 >= v644)
          {
            v645 = (uint64_t *)&v1187;
            v646 = &v1222;
            v647 = v1182;
            v628 = v629;
LABEL_1043:
            *v646 = v650;
            *(_DWORD *)v645 = v630;
            v795 = v1223;
            v794 = v1222;
            v630 = v628;
          }
          else
          {
            v794 = v1182;
            v795 = v552;
            v647 = v1170;
          }
          if (v630 >= 0)
            v818 = v647;
          else
            v818 = -v647;
          if (v630 >= 0)
            v819 = v630;
          else
            v819 = -v630;
          if (v818 < 0)
          {
            if (v794 >= 0)
              v822 = v794;
            else
              v822 = -v794;
            v823 = v822 - v649;
            v824 = v649 - v822;
            if (v795 >= 0)
              v820 = v824;
            else
              v820 = v823;
            if (v795 >= 0)
              v825 = v795;
            else
              v825 = -v795;
            v821 = v601;
            if (v794 < 0)
              v794 = v825 - v649;
            else
              v794 = v649 - v825;
          }
          else
          {
            v820 = v795;
            v821 = v601;
          }
          v841 = v821 + v571 - v1080;
          v1223 = v820;
          v1222 = v794;
          if (v631 >= 0)
            v842 = v631;
          else
            v842 = -v631;
          if (v632 >= 0)
            v843 = v632;
          else
            v843 = -v632;
          if (v841 >= 0)
            v844 = v841;
          else
            v844 = -v841;
          if (v842 >= v843 && v842 >= v844)
          {
            v845 = (int *)v1215;
            v846 = &v1221;
            v844 = v842;
            v847 = v552;
            goto LABEL_1124;
          }
          if (v843 >= v844)
          {
            v845 = &v1213;
            v846 = &v1220;
            v844 = v843;
            v847 = v1182;
            v631 = v632;
LABEL_1124:
            *v846 = v650;
            *v845 = v841;
            v849 = v1221;
            v848 = v1220;
            v841 = v631;
          }
          else
          {
            v848 = v1182;
            v849 = v552;
            v847 = v650;
          }
          if (v841 >= 0)
            v850 = v847;
          else
            v850 = -v847;
          if (v850 < 0)
          {
            if (v848 >= 0)
              v852 = v848;
            else
              v852 = -v848;
            v853 = v852 - v649;
            v854 = v649 - v852;
            if (v849 >= 0)
              v851 = v854;
            else
              v851 = v853;
            if (v849 >= 0)
              v855 = v849;
            else
              v855 = -v849;
            if (v848 < 0)
              v848 = v855 - v649;
            else
              v848 = v649 - v855;
          }
          else
          {
            v851 = v849;
          }
          v856 = v612 + v602 - v623;
          v1221 = v851;
          v1220 = v848;
          if (v633 >= 0)
            v857 = v633;
          else
            v857 = -v633;
          if (v634 >= 0)
            v858 = v634;
          else
            v858 = -v634;
          if (v856 >= 0)
            v859 = v856;
          else
            v859 = -v856;
          if (v857 >= v858 && v857 >= v859)
          {
            v860 = &v1211;
            v861 = &v1219;
            v859 = v857;
            v862 = v552;
            goto LABEL_1157;
          }
          if (v858 >= v859)
          {
            v860 = &v1226;
            v861 = &v1218;
            v859 = v858;
            v862 = v1182;
            v633 = v634;
LABEL_1157:
            *v861 = v650;
            *v860 = v856;
            v864 = v1219;
            v863 = v1218;
            v856 = v633;
          }
          else
          {
            v863 = v1182;
            v864 = v552;
            v862 = v650;
          }
          if (v856 >= 0)
            v865 = v862;
          else
            v865 = -v862;
          if (v865 < 0)
          {
            if (v863 >= 0)
              v867 = v863;
            else
              v867 = -v863;
            v868 = v867 - v649;
            v869 = v649 - v867;
            if (v864 >= 0)
              v866 = v869;
            else
              v866 = v868;
            if (v864 >= 0)
              v870 = v864;
            else
              v870 = -v864;
            if (v863 < 0)
              v863 = v870 - v649;
            else
              v863 = v649 - v870;
          }
          else
          {
            v866 = v864;
          }
          v871 = 1431655766 * ((v641 >> 1) + 2 * (v612 + v821) - (v1080 + v623));
          v872 = HIDWORD(v871) + (v871 >> 63);
          v1219 = v866;
          v1218 = v863;
          if (v639 >= 0)
            v873 = v639;
          else
            v873 = -v639;
          if (v640 / 3 >= 0)
            v874 = v640 / 3;
          else
            v874 = v640 / -3;
          if (v872 >= 0)
            v875 = v872;
          else
            v875 = -v872;
          if (v873 >= v874 && v873 >= v875)
          {
            v876 = &v1225;
            v877 = &v1217;
            v875 = v873;
            goto LABEL_1190;
          }
          if (v874 >= v875)
          {
            v876 = &v1224;
            v877 = &v1216;
            v875 = v874;
            v552 = v1182;
            v639 = v640 / 3;
LABEL_1190:
            *v877 = v650;
            *v876 = v872;
            v650 = v552;
            v552 = v1217;
            v878 = v1216;
            v872 = v639;
          }
          else
          {
            v878 = v1182;
          }
          if (v872 >= 0)
            v879 = v650;
          else
            v879 = -v650;
          if (v879 < 0)
          {
            if (v878 >= 0)
              v881 = v878;
            else
              v881 = -v878;
            v882 = v881 - v649;
            v883 = v649 - v881;
            if (v552 >= 0)
              v880 = v883;
            else
              v880 = v882;
            if (v552 >= 0)
              v884 = v552;
            else
              v884 = -v552;
            if (v878 < 0)
              v878 = v884 - v649;
            else
              v878 = v649 - v884;
          }
          else
          {
            v880 = v552;
          }
          v1217 = v880;
          v1216 = v878;
          v885 = v1189;
          v886 = v820 - v1189;
          v887 = v1187;
          LODWORD(v1201) = v820 - v1189;
          HIDWORD(v1201) = v794 - v1187;
          LODWORD(v1202) = v818 - v819;
          LODWORD(v1199) = v851 - *(_DWORD *)v1215;
          HIDWORD(v1199) = v848 - v1213;
          LODWORD(v1200) = v850 - v844;
          v1032 = v1226;
          LODWORD(v1197) = v866 - v1211;
          HIDWORD(v1197) = v863 - v1226;
          LODWORD(v1198) = v865 - v859;
          v1030 = v1225;
          v1028 = v1224;
          LODWORD(v1195) = v880 - v1225;
          HIDWORD(v1195) = v878 - v1224;
          LODWORD(v1196) = v879 - v875;
          v1184 = v878;
          v1172 = v794;
          v1135 = v818;
          v1076 = v844;
          v1071 = v848;
          v1067 = v850;
          v1063 = v851;
          v1046 = v863;
          v1048 = v859;
          v1042 = v866;
          v1044 = v865;
          v1038 = v879;
          v1040 = v875;
          v1034 = v1211;
          v1036 = v880;
          v1052 = v1213;
          v1054 = *(_DWORD *)v1215;
          if (*(_BYTE *)(v648 + 24))
          {
            v888 = *(unsigned __int8 *)(v648 + 8);
            v1056 = v1187;
            v889 = (unsigned __int16)v1191;
            v890 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1191 + 2048) >> 10) & 0x7CLL));
            v1050 = v890;
            v891 = WORD1(v1191);
            v892 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD1(v1191) + 2048) >> 10) & 0x7CLL));
            v1060 = v1189;
            v893 = v892 + v890 + sub_23CCD36C8((int *)&v1201, v1100, v888, (unsigned __int16 **)&v1247);
            v894 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v889) >> 10) & 0x3FFFFFFFFFFFFCLL));
            v895 = WORD2(v1191);
            LODWORD(v889) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD2(v1191) + 2048) >> 10) & 0x7CLL));
            v896 = v889 + sub_23CCD36C8((int *)&v1199, v1100, v888, (unsigned __int16 **)&v1247) + v894;
            LODWORD(v891) = *(_DWORD *)((char *)&unk_23CCD46E0
                                      + (((unint64_t)(67584 - v891) >> 10) & 0x3FFFFFFFFFFFFCLL));
            LODWORD(v889) = sub_23CCD36C8((int *)&v1197, v1100, v888, (unsigned __int16 **)&v1247);
            LODWORD(v895) = *(_DWORD *)((char *)&unk_23CCD46E0
                                      + (((unint64_t)(67584 - v895) >> 10) & 0x3FFFFFFFFFFFFCLL));
            v897 = sub_23CCD36C8((int *)&v1195, v1100, v888, (unsigned __int16 **)&v1247);
            v885 = v1060;
            v898 = v1050 + v889;
            v887 = v1056;
            v899 = v891 + v898;
            v900 = v895 + v894 + v897;
          }
          else if (v1100 < 1)
          {
            v893 = 0;
            v896 = 0;
            v899 = 0;
            v900 = 0;
          }
          else
          {
            if (v886 < 0)
              v886 = v1189 - v820;
            v893 = -(v1100 * __clz(v886 + 1));
            if (v851 - *(_DWORD *)v1215 >= 0)
              v901 = v851 - *(_DWORD *)v1215;
            else
              v901 = *(_DWORD *)v1215 - v851;
            v896 = -(v1100 * __clz(v901 + 1));
            if (v866 - v1211 >= 0)
              v902 = v866 - v1211;
            else
              v902 = v1211 - v866;
            v899 = -(v1100 * __clz(v902 + 1));
            if (v880 - v1225 >= 0)
              v903 = v880 - v1225;
            else
              v903 = v1225 - v880;
            v900 = -(v1100 * __clz(v903 + 1));
          }
          v537 = v1118;
          v540 = v1144;
          if (v893 > v896 || v893 > v899 || v893 > v900)
          {
            if (v896 > v899 || v896 > v900)
            {
              v2 = v1160;
              if (v899 <= v900)
              {
                v905 = 0;
                v1207 = (void *)__PAIR64__(v1032, v1034);
                v904 = 1;
                LODWORD(v1208) = v1048;
                v908 = v1044;
                v907 = v1046;
                v906 = 1;
                v909 = v1042;
              }
              else
              {
                v1207 = (void *)__PAIR64__(v1028, v1030);
                v904 = 1;
                v907 = v1184;
                LODWORD(v1208) = v1040;
                v909 = v1036;
                v908 = v1038;
                v905 = 1;
                v906 = 2;
              }
              LODWORD(__b) = v909;
            }
            else
            {
              v904 = 0;
              v1207 = (void *)__PAIR64__(v1052, v1054);
              v905 = 1;
              LODWORD(v1208) = v1076;
              v907 = v1071;
              v908 = v1067;
              v906 = 2;
              LODWORD(__b) = v1063;
              v2 = v1160;
            }
          }
          else
          {
            v904 = 0;
            v905 = 0;
            v1207 = (void *)__PAIR64__(v887, v885);
            LODWORD(v1208) = v819;
            v906 = 1;
            LODWORD(__b) = v820;
            v2 = v1160;
            v907 = v1172;
            v908 = v1135;
          }
          HIDWORD(__b) = v907;
          LODWORD(v1210[0]) = v908;
          sub_23CCC4CE0(v1085, v905, &v1191);
          sub_23CCC4CE0(v1085, v904, (_WORD *)&v1191 + v906);
          v840 = 2;
LABEL_1362:
          v3 = (uint64_t)v1152;
          goto LABEL_1409;
        }
      }
      if (v562 != -1)
      {
        if (!v1151
          || (v651 = v1152[404], *(_BYTE *)(v651 + (int)v1205))
          && *(_BYTE *)(v651 + SHIDWORD(v1205))
          && *(_BYTE *)(v651 + v562))
        {
          v652 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          v653 = v652[1];
          v654 = *v652 - v1159;
          v655 = v653 - v1159;
          if (v654 >= 0)
            v656 = v654;
          else
            v656 = -v654;
          if (v655 >= 0)
            v657 = v653 - v1159;
          else
            v657 = v1159 - v653;
          v658 = v1159 - v656;
          v659 = v1159 - v656 - v657;
          if (v659 < 0)
          {
            v660 = v657 - v1159;
            v661 = v1159 - v657;
            if (v654 >= 0)
              v654 = v661;
            else
              v654 = v660;
            v662 = v656 - v1159;
            if (v655 >= 0)
              v655 = v658;
            else
              v655 = v662;
          }
          v663 = v1182;
          v664 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          v665 = *v664 - v1159;
          v666 = v664[1] - v1159;
          if (v665 >= 0)
            v667 = *v664 - v1159;
          else
            v667 = v1159 - *v664;
          if (v666 >= 0)
            v668 = v666;
          else
            v668 = -v666;
          v669 = v1159 - v667;
          v670 = v1159 - v667 - v668;
          if (v670 < 0)
          {
            v671 = v668 - v1159;
            v672 = v1159 - v668;
            if (v665 >= 0)
              v665 = v672;
            else
              v665 = v671;
            v673 = v667 - v1159;
            if (v666 >= 0)
              v666 = v669;
            else
              v666 = v673;
          }
          v674 = (_DWORD *)(v1118 + 4 * v562 * v1100);
          v675 = *v674 - v1159;
          v676 = v674[1] - v1159;
          if (v675 >= 0)
            v677 = *v674 - v1159;
          else
            v677 = v1159 - *v674;
          if (v676 >= 0)
            v678 = v674[1] - v1159;
          else
            v678 = v1159 - v674[1];
          v679 = v1159 - v677;
          v680 = v1159 - v677 - v678;
          if (v680 < 0)
          {
            v681 = v678 - v1159;
            v682 = v1159 - v678;
            if (v675 >= 0)
              v675 = v682;
            else
              v675 = v681;
            v683 = v677 - v1159;
            if (v676 >= 0)
              v676 = v679;
            else
              v676 = v683;
          }
          v684 = v557 * (uint64_t)v659 + v1133 * (uint64_t)v654 + v556 * (uint64_t)v655;
          if (v684 >= 0)
            v685 = v554;
          else
            v685 = -v554;
          if (v684 >= 0)
            v686 = v556;
          else
            v686 = -v556;
          if (v684 >= 0)
            v687 = v557;
          else
            v687 = -v557;
          LODWORD(v1189) = v685;
          LODWORD(v1187) = v686;
          v688 = v665 + v654;
          v689 = v666 + v655;
          v690 = v670 + v659;
          v691 = v688 - v675;
          v692 = v666 + v655 - v676;
          *(_DWORD *)v1215 = v688 - v675;
          v1213 = v692;
          v693 = v688 + 1;
          v694 = v689 + 1;
          v695 = v690 + 1;
          if (v688 + 1 >= 0)
            v696 = v688 + 1;
          else
            v696 = v688 + 2;
          v697 = v696 >> 1;
          v698 = v689 + 2;
          if (v694 >= 0)
            v698 = v689 + 1;
          v699 = v698 >> 1;
          v1211 = v697;
          v1226 = v698 >> 1;
          v700 = (v675 + v693) / 3;
          v701 = (v676 + v694) / 3;
          v1225 = v700;
          v1224 = v701;
          if (v695 >= 0)
            v702 = v690 + 1;
          else
            v702 = v690 + 2;
          v1223 = v552;
          v1222 = v1182;
          v1221 = v552;
          v1220 = v1182;
          v1219 = v552;
          v1218 = v1182;
          v1217 = v552;
          v1216 = v1182;
          if (v554 >= 0)
            v703 = v554;
          else
            v703 = -v554;
          if (v556 >= 0)
            v704 = v556;
          else
            v704 = -v556;
          if (v557 >= 0)
            v705 = v557;
          else
            v705 = -v557;
          if (v703 >= v704 && v703 >= v705)
          {
            v706 = &v1189;
            v707 = &v1223;
            v708 = v552;
            v709 = v1170;
            goto LABEL_1064;
          }
          v709 = v1170;
          if (v704 >= v705)
          {
            v706 = (uint64_t *)&v1187;
            v707 = &v1222;
            v708 = v1182;
            v685 = v686;
LABEL_1064:
            *v707 = v709;
            *(_DWORD *)v706 = v687;
            v802 = v1223;
            v801 = v1222;
            v687 = v685;
          }
          else
          {
            v801 = v1182;
            v802 = v552;
            v708 = v1170;
          }
          if (v687 >= 0)
            v826 = v708;
          else
            v826 = -v708;
          if (v687 >= 0)
            v827 = v687;
          else
            v827 = -v687;
          if (v826 < 0)
          {
            if (v801 >= 0)
              v829 = v801;
            else
              v829 = -v801;
            v830 = v829 - v1159;
            v831 = v1159 - v829;
            if (v802 >= 0)
              v828 = v831;
            else
              v828 = v830;
            if (v802 >= 0)
              v832 = v802;
            else
              v832 = -v802;
            if (v801 < 0)
              v801 = v832 - v1159;
            else
              v801 = v1159 - v832;
          }
          else
          {
            v828 = v802;
          }
          v910 = v690 - v680;
          v1223 = v828;
          v1222 = v801;
          if (v691 >= 0)
            v911 = v691;
          else
            v911 = -v691;
          if (v692 >= 0)
            v912 = v692;
          else
            v912 = -v692;
          if (v910 >= 0)
            v913 = v910;
          else
            v913 = -v910;
          if (v911 >= v912 && v911 >= v913)
          {
            v914 = (int *)v1215;
            v915 = &v1221;
            v913 = v911;
            v916 = v552;
            goto LABEL_1249;
          }
          if (v912 >= v913)
          {
            v914 = &v1213;
            v915 = &v1220;
            v913 = v912;
            v916 = v1182;
            v691 = v692;
LABEL_1249:
            *v915 = v709;
            *v914 = v910;
            v918 = v1221;
            v917 = v1220;
            v910 = v691;
          }
          else
          {
            v917 = v1182;
            v918 = v552;
            v916 = v709;
          }
          if (v910 >= 0)
            v919 = v916;
          else
            v919 = -v916;
          if (v919 < 0)
          {
            if (v917 >= 0)
              v921 = v917;
            else
              v921 = -v917;
            v922 = v921 - v1159;
            v923 = v1159 - v921;
            if (v918 >= 0)
              v920 = v923;
            else
              v920 = v922;
            if (v918 >= 0)
              v924 = v918;
            else
              v924 = -v918;
            if (v917 < 0)
              v917 = v924 - v1159;
            else
              v917 = v1159 - v924;
          }
          else
          {
            v920 = v918;
          }
          v925 = v702 >> 1;
          v1221 = v920;
          v1220 = v917;
          if (v697 >= 0)
            v926 = v697;
          else
            v926 = -v697;
          if (v699 >= 0)
            v927 = v699;
          else
            v927 = -v699;
          if (v925 >= 0)
            v928 = v925;
          else
            v928 = -v925;
          if (v926 >= v927 && v926 >= v928)
          {
            v929 = &v1211;
            v930 = &v1219;
            v928 = v926;
            v931 = v552;
            goto LABEL_1282;
          }
          if (v927 >= v928)
          {
            v929 = &v1226;
            v930 = &v1218;
            v928 = v927;
            v931 = v1182;
            v697 = v699;
LABEL_1282:
            *v930 = v709;
            *v929 = v925;
            v933 = v1219;
            v932 = v1218;
            v925 = v697;
          }
          else
          {
            v932 = v1182;
            v933 = v552;
            v931 = v709;
          }
          if (v925 < 0)
            v931 = -v931;
          if (v931 < 0)
          {
            if (v932 >= 0)
              v935 = v932;
            else
              v935 = -v932;
            v936 = v935 - v1159;
            v937 = v1159 - v935;
            if (v933 >= 0)
              v934 = v937;
            else
              v934 = v936;
            if (v933 >= 0)
              v938 = v933;
            else
              v938 = -v933;
            if (v932 < 0)
              v932 = v938 - v1159;
            else
              v932 = v1159 - v938;
          }
          else
          {
            v934 = v933;
          }
          v939 = (v680 + v695) / 3;
          v1219 = v934;
          v1218 = v932;
          if (v700 >= 0)
            v940 = v700;
          else
            v940 = -v700;
          if (v701 >= 0)
            v941 = v701;
          else
            v941 = -v701;
          if (v939 >= 0)
            v942 = v939;
          else
            v942 = -v939;
          if (v940 >= v941 && v940 >= v942)
          {
            v943 = &v1225;
            v944 = &v1217;
            v942 = v940;
            goto LABEL_1313;
          }
          if (v941 >= v942)
          {
            v943 = &v1224;
            v944 = &v1216;
            v942 = v941;
            v552 = v1182;
            v700 = v701;
LABEL_1313:
            *v944 = v709;
            *v943 = v939;
            v709 = v552;
            v552 = v1217;
            v663 = v1216;
            v939 = v700;
          }
          if (v939 >= 0)
            v945 = v709;
          else
            v945 = -v709;
          if (v945 < 0)
          {
            if (v663 >= 0)
              v947 = v663;
            else
              v947 = -v663;
            v948 = v947 - v1159;
            v949 = v1159 - v947;
            if (v552 >= 0)
              v946 = v949;
            else
              v946 = v948;
            if (v552 >= 0)
              v950 = v552;
            else
              v950 = -v552;
            if (v663 < 0)
              v663 = v950 - v1159;
            else
              v663 = v1159 - v950;
          }
          else
          {
            v946 = v552;
          }
          v1217 = v946;
          v1216 = v663;
          v951 = v1189;
          v952 = v828 - v1189;
          v953 = v1187;
          LODWORD(v1201) = v828 - v1189;
          HIDWORD(v1201) = v801 - v1187;
          LODWORD(v1202) = v826 - v827;
          v1055 = *(_DWORD *)v1215;
          v1053 = v1213;
          LODWORD(v1199) = v920 - *(_DWORD *)v1215;
          HIDWORD(v1199) = v917 - v1213;
          LODWORD(v1200) = v919 - v913;
          v1035 = v1211;
          v1033 = v1226;
          LODWORD(v1197) = v934 - v1211;
          HIDWORD(v1197) = v932 - v1226;
          LODWORD(v1198) = v931 - v928;
          v1031 = v1225;
          v1029 = v1224;
          LODWORD(v1195) = v946 - v1225;
          HIDWORD(v1195) = v663 - v1224;
          LODWORD(v1196) = v945 - v942;
          v1185 = v663;
          v1173 = v801;
          v1136 = v826;
          v1077 = v913;
          v1072 = v917;
          v1068 = v919;
          v1064 = v920;
          v1047 = v932;
          v1049 = v928;
          v1043 = v934;
          v1045 = v931;
          v1039 = v945;
          v1041 = v942;
          v1037 = v946;
          if (*(_BYTE *)(v2 + 24))
          {
            v954 = *(unsigned __int8 *)(v2 + 8);
            v1057 = v1187;
            v955 = (unsigned __int16)v1193;
            v956 = *(_DWORD *)((char *)&unk_23CCD46E0 + ((((unsigned __int16)v1193 + 2048) >> 10) & 0x7CLL));
            v1051 = v956;
            v1126 = v828;
            v957 = WORD1(v1193);
            v958 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD1(v1193) + 2048) >> 10) & 0x7CLL));
            v1061 = v1189;
            v959 = v958 + v956 + sub_23CCD36C8((int *)&v1201, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            v960 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v955) >> 10) & 0x3FFFFFFFFFFFFCLL));
            v961 = WORD2(v1193);
            LODWORD(v955) = *(_DWORD *)((char *)&unk_23CCD46E0 + (((WORD2(v1193) + 2048) >> 10) & 0x7CLL));
            v962 = v955 + sub_23CCD36C8((int *)&v1199, v1100, v954, (unsigned __int16 **)&v1239 + 1) + v960;
            LODWORD(v957) = *(_DWORD *)((char *)&unk_23CCD46E0
                                      + (((unint64_t)(67584 - v957) >> 10) & 0x3FFFFFFFFFFFFCLL));
            LODWORD(v955) = sub_23CCD36C8((int *)&v1197, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            LODWORD(v961) = *(_DWORD *)((char *)&unk_23CCD46E0
                                      + (((unint64_t)(67584 - v961) >> 10) & 0x3FFFFFFFFFFFFCLL));
            v963 = sub_23CCD36C8((int *)&v1195, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            v951 = v1061;
            v964 = v961 + v960;
            v537 = v1118;
            v965 = v1051 + v955;
            v953 = v1057;
            v966 = v957 + v965;
            v828 = v1126;
            v967 = v964 + v963;
          }
          else if (v1100 < 1)
          {
            v959 = 0;
            v962 = 0;
            v966 = 0;
            v967 = 0;
          }
          else
          {
            if (v952 < 0)
              v952 = v1189 - v828;
            v959 = -(v1100 * __clz(v952 + 1));
            if (v920 - *(_DWORD *)v1215 >= 0)
              v968 = v920 - *(_DWORD *)v1215;
            else
              v968 = *(_DWORD *)v1215 - v920;
            v962 = -(v1100 * __clz(v968 + 1));
            if (v934 - v1211 >= 0)
              v969 = v934 - v1211;
            else
              v969 = v1211 - v934;
            v966 = -(v1100 * __clz(v969 + 1));
            if (v946 - v1225 >= 0)
              v970 = v946 - v1225;
            else
              v970 = v1225 - v946;
            v967 = -(v1100 * __clz(v970 + 1));
          }
          v540 = v1144;
          if (v959 > v962 || v959 > v966 || v959 > v967)
          {
            if (v962 > v966 || v962 > v967)
            {
              v2 = v1160;
              if (v966 <= v967)
              {
                v972 = 0;
                v1207 = (void *)__PAIR64__(v1033, v1035);
                v971 = 1;
                LODWORD(v1208) = v1049;
                v975 = v1045;
                v974 = v1047;
                v973 = 1;
                v976 = v1043;
              }
              else
              {
                v1207 = (void *)__PAIR64__(v1029, v1031);
                v971 = 1;
                v974 = v1185;
                LODWORD(v1208) = v1041;
                v976 = v1037;
                v975 = v1039;
                v972 = 1;
                v973 = 2;
              }
              LODWORD(__b) = v976;
            }
            else
            {
              v971 = 0;
              v1207 = (void *)__PAIR64__(v1053, v1055);
              v972 = 1;
              LODWORD(v1208) = v1077;
              v974 = v1072;
              v975 = v1068;
              v973 = 2;
              LODWORD(__b) = v1064;
              v2 = v1160;
            }
          }
          else
          {
            v971 = 0;
            v972 = 0;
            v1207 = (void *)__PAIR64__(v953, v951);
            LODWORD(v1208) = v827;
            v973 = 1;
            LODWORD(__b) = v828;
            v2 = v1160;
            v974 = v1173;
            v975 = v1136;
          }
          HIDWORD(__b) = v974;
          LODWORD(v1210[0]) = v975;
          sub_23CCC4CE0(v1085, v972, &v1193);
          sub_23CCC4CE0(v1085, v971, (_WORD *)&v1193 + v973);
          v840 = 1;
          goto LABEL_1362;
        }
      }
      if (HIDWORD(v1205) != -1)
      {
        if (!v1151 || (v710 = v1152[404], *(_BYTE *)(v710 + (int)v1205)) && *(_BYTE *)(v710 + SHIDWORD(v1205)))
        {
          v711 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          v712 = *v711 - v1159;
          v713 = v711[1] - v1159;
          if (v712 >= 0)
            v714 = v712;
          else
            v714 = -v712;
          if (v713 >= 0)
            v715 = v713;
          else
            v715 = -v713;
          v716 = v1159 - v714;
          v717 = v1159 - v714 - v715;
          if (v717 < 0)
          {
            v718 = v715 - v1159;
            v719 = v1159 - v715;
            if (v712 >= 0)
              v712 = v719;
            else
              v712 = v718;
            v720 = v714 - v1159;
            if (v713 >= 0)
              v713 = v716;
            else
              v713 = v720;
          }
          v721 = v1182;
          v722 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          v723 = *v722 - v1159;
          v724 = v722[1] - v1159;
          if (v723 >= 0)
            v725 = v723;
          else
            v725 = -v723;
          if (v724 >= 0)
            v726 = v724;
          else
            v726 = -v724;
          v727 = v1159 - v725;
          v728 = v1159 - v725 - v726;
          if (v728 < 0)
          {
            v729 = v726 - v1159;
            v730 = v1159 - v726;
            if (v723 >= 0)
              v723 = v730;
            else
              v723 = v729;
            v731 = v725 - v1159;
            if (v724 >= 0)
              v724 = v727;
            else
              v724 = v731;
          }
          v732 = v557 * (uint64_t)v717 + v1133 * (uint64_t)v712 + v556 * (uint64_t)v713;
          if (v732 >= 0)
            v733 = v554;
          else
            v733 = -v554;
          if (v732 >= 0)
            v734 = v556;
          else
            v734 = -v556;
          if (v732 >= 0)
            v735 = v557;
          else
            v735 = -v557;
          LODWORD(v1197) = v733;
          LODWORD(v1195) = v734;
          v736 = v712 + v723;
          v737 = v713 + v724;
          v738 = v717 + v728;
          v739 = v736 + 2;
          if (v736 + 1 >= 0)
            v739 = v736 + 1;
          v740 = v739 >> 1;
          if (v737 + 1 >= 0)
            v741 = v737 + 1;
          else
            v741 = v737 + 2;
          v742 = v741 >> 1;
          v743 = v738 + 2;
          if (v738 + 1 >= 0)
            v743 = v738 + 1;
          LODWORD(v1189) = v740;
          LODWORD(v1187) = v742;
          *(_DWORD *)v1215 = v552;
          v1213 = v1182;
          v1211 = v552;
          v1226 = v1182;
          if (v554 >= 0)
            v744 = v554;
          else
            v744 = -v554;
          if (v556 >= 0)
            v745 = v556;
          else
            v745 = -v556;
          if (v557 >= 0)
            v746 = v557;
          else
            v746 = -v557;
          if (v744 >= v745 && v744 >= v746)
          {
            v747 = &v1197;
            v748 = (int *)v1215;
            v749 = v552;
            v750 = v1170;
            goto LABEL_1085;
          }
          v750 = v1170;
          if (v745 >= v746)
          {
            v747 = &v1195;
            v748 = &v1213;
            v749 = v1182;
            v733 = v734;
LABEL_1085:
            *v748 = v750;
            *(_DWORD *)v747 = v735;
            v804 = *(_DWORD *)v1215;
            v803 = v1213;
            v735 = v733;
          }
          else
          {
            v803 = v1182;
            v804 = v552;
            v749 = v1170;
          }
          if (v735 >= 0)
            v833 = v735;
          else
            v833 = -v735;
          if (v735 >= 0)
            v834 = v749;
          else
            v834 = -v749;
          if (v834 < 0)
          {
            if (v803 >= 0)
              v836 = v803;
            else
              v836 = -v803;
            v837 = v836 - v1159;
            v838 = v1159 - v836;
            if (v804 >= 0)
              v835 = v838;
            else
              v835 = v837;
            if (v804 >= 0)
              v839 = v804;
            else
              v839 = -v804;
            if (v803 < 0)
              v803 = v839 - v1159;
            else
              v803 = v1159 - v839;
          }
          else
          {
            v835 = v804;
          }
          v977 = v743 >> 1;
          if (v740 >= 0)
            v978 = v740;
          else
            v978 = -v740;
          if (v742 >= 0)
            v979 = v742;
          else
            v979 = -v742;
          if (v977 >= 0)
            v980 = v977;
          else
            v980 = -v977;
          if (v978 >= v979 && v978 >= v980)
          {
            v981 = &v1189;
            v982 = &v1211;
            v980 = v978;
            goto LABEL_1378;
          }
          if (v979 >= v980)
          {
            v981 = (uint64_t *)&v1187;
            v982 = &v1226;
            v980 = v979;
            v552 = v1182;
            v740 = v742;
LABEL_1378:
            *v982 = v750;
            *(_DWORD *)v981 = v977;
            v750 = v552;
            v552 = v1211;
            v721 = v1226;
            v977 = v740;
          }
          if (v977 >= 0)
            v983 = v750;
          else
            v983 = -v750;
          if (v983 < 0)
          {
            if (v721 >= 0)
              v985 = v721;
            else
              v985 = -v721;
            v986 = v985 - v1159;
            v987 = v1159 - v985;
            if (v552 >= 0)
              v984 = v987;
            else
              v984 = v986;
            if (v552 >= 0)
              v988 = v552;
            else
              v988 = -v552;
            if (v721 < 0)
              v721 = v988 - v1159;
            else
              v721 = v1159 - v988;
          }
          else
          {
            v984 = v552;
          }
          v989 = v1197;
          v990 = v835 - (_DWORD)v1197;
          v991 = v1195;
          LODWORD(v1201) = v835 - (_DWORD)v1197;
          HIDWORD(v1201) = v803 - (_DWORD)v1195;
          LODWORD(v1202) = v834 - v833;
          v992 = v1189;
          v993 = v984 - v1189;
          v994 = v1187;
          LODWORD(v1199) = v984 - v1189;
          HIDWORD(v1199) = v721 - v1187;
          LODWORD(v1200) = v983 - v980;
          if (*(_BYTE *)(v1160 + 24))
          {
            v1078 = v1195;
            v1081 = v1197;
            v1127 = v835;
            v1137 = v834;
            v1174 = v833;
            v1186 = v803;
            v995 = *(unsigned __int8 *)(v1160 + 8);
            v996 = v1228;
            v997 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1228 + 2048) >> 10) & 0x7CLL));
            v1073 = v1189;
            v998 = v980;
            v999 = sub_23CCD36C8((int *)&v1201, v1100, v995, (unsigned __int16 **)v1232);
            LODWORD(v996) = *(_DWORD *)((char *)&unk_23CCD46E0
                                      + (((unint64_t)(67584 - v996) >> 10) & 0x3FFFFFFFFFFFFCLL));
            v1000 = sub_23CCD36C8((int *)&v1199, v1100, v995, (unsigned __int16 **)v1232);
            v980 = v998;
            v1001 = v999 + v997;
            v1002 = v1000 + v996;
            v992 = v1073;
            goto LABEL_1404;
          }
          if (v1100 < 1)
          {
            v1003 = 0;
          }
          else
          {
            v1078 = v1195;
            v1081 = v1197;
            v1127 = v835;
            v1137 = v834;
            v1174 = v833;
            v1186 = v803;
            if (v990 < 0)
              v990 = (_DWORD)v1197 - v835;
            v1001 = -(v1100 * __clz(v990 + 1));
            if (v993 < 0)
              v993 = v1189 - v984;
            v1002 = -(v1100 * __clz(v993 + 1));
LABEL_1404:
            if (v1001 <= v1002)
            {
              v1003 = 0;
              v803 = v1186;
              v833 = v1174;
              v834 = v1137;
              v835 = v1127;
              v989 = v1081;
              v991 = v1078;
            }
            else
            {
              v1003 = 1;
              v989 = v992;
              v991 = v994;
              v833 = v980;
              v835 = v984;
              v803 = v721;
              v834 = v983;
            }
          }
          v1207 = (void *)__PAIR64__(v991, v989);
          LODWORD(v1208) = v833;
          __b = (char *)__PAIR64__(v803, v835);
          LODWORD(v1210[0]) = v834;
          sub_23CCC4CE0(v1085, v1003, &v1228);
          v840 = 0;
          v2 = v1160;
          v3 = (uint64_t)v1152;
          v537 = v1118;
          v540 = v1144;
          goto LABEL_1409;
        }
      }
      v555 = v1152;
    }
    if (!sub_23CCCCEAC((uint64_t)v555, v541, (uint64_t)&v1205, *(_DWORD *)(v2 + 4), *(_DWORD *)(v2 + 16)))
    {
      v766 = v1182;
      v767 = v1133 * (uint64_t)v552 + v556 * (uint64_t)v1182 + v557 * (uint64_t)v1170;
      v536 = v1100;
      if ((v767 & 0x8000000000000000) != 0)
      {
        v554 = -v554;
        v556 = -v556;
        v557 = -v557;
        v1207 = (void *)__PAIR64__(v556, v554);
        LODWORD(v1208) = v557;
      }
      sub_23CCC4CE0(v1085, v767 >> 63, &v1227);
      if (v554 >= 0)
        v768 = v554;
      else
        v768 = -v554;
      if (v556 >= 0)
        v769 = v556;
      else
        v769 = -v556;
      if (v557 >= 0)
        v770 = v557;
      else
        v770 = -v557;
      if (v768 >= v769 && v768 >= v770)
      {
        v772 = &v1207;
        v773 = &__b;
        v766 = v552;
        v556 = v554;
      }
      else
      {
        v772 = (void **)((char *)&v1207 + 4);
        v773 = (_DWORD *)&__b + 1;
        if (v769 < v770)
          goto LABEL_958;
      }
      *v773 = v1170;
      LODWORD(v1210[0]) = v766;
      *(_DWORD *)v772 = v557;
      v1170 = v766;
      v557 = v556;
      LODWORD(v1208) = v556;
LABEL_958:
      v3 = (uint64_t)v1152;
      if (v557 < 0)
      {
        LODWORD(v1208) = -v557;
        v776 = -v1170;
        LODWORD(v1210[0]) = -v1170;
      }
      else
      {
        v776 = v1170;
      }
      v796 = (int)__b;
      v797 = HIDWORD(__b);
      if (v776 < 0)
      {
        if (SHIDWORD(__b) >= 0)
          v799 = HIDWORD(__b);
        else
          v799 = -HIDWORD(__b);
        v800 = v799 - v1159;
        v798 = v1159 - v799;
        if ((int)__b < 0)
        {
          v798 = v800;
          v796 = -(int)__b;
        }
        if ((HIDWORD(__b) & 0x80000000) != 0)
          v797 = v796 - v1159;
        else
          v797 = v1159 - v796;
      }
      else
      {
        v798 = (int)__b;
      }
      __b = (char *)__PAIR64__(v797, v798);
      goto LABEL_1107;
    }
    v751 = (int)v1205;
    v752 = HIDWORD(v1205);
    v753 = (int)v1206;
    v754 = (int)v1205 * (uint64_t)v1133 + SHIDWORD(v1205) * (uint64_t)v556 + (int)v1206 * (uint64_t)v557;
    if (v754 >= 0)
      v755 = v554;
    else
      v755 = -v554;
    if (v754 >= 0)
      v756 = v556;
    else
      v756 = -v556;
    if (v754 >= 0)
      v757 = v557;
    else
      v757 = -v557;
    LODWORD(v1199) = v755;
    LODWORD(v1197) = v756;
    LODWORD(v1195) = v552;
    LODWORD(v1189) = v1182;
    LODWORD(v1187) = v552;
    *(_DWORD *)v1215 = v1182;
    if (v554 >= 0)
      v758 = v554;
    else
      v758 = -v554;
    if (v556 >= 0)
      v759 = v556;
    else
      v759 = -v556;
    if (v557 >= 0)
      v760 = v557;
    else
      v760 = -v557;
    if (v758 >= v759 && v758 >= v760)
    {
      v774 = &v1199;
      v775 = &v1195;
      v765 = v552;
      v3 = (uint64_t)v1152;
      v762 = v1170;
    }
    else
    {
      v3 = (uint64_t)v1152;
      v762 = v1170;
      if (v759 < v760)
      {
        v763 = v1182;
        v764 = v552;
        v765 = v1170;
        goto LABEL_962;
      }
      v774 = &v1197;
      v775 = (void **)&v1189;
      v765 = v1182;
      v755 = v756;
    }
    *(_DWORD *)v775 = v762;
    *(_DWORD *)v774 = v757;
    v764 = (int)v1195;
    v763 = v1189;
    v757 = v755;
LABEL_962:
    if (v757 >= 0)
      v777 = v757;
    else
      v777 = -v757;
    if (v757 >= 0)
      v778 = v765;
    else
      v778 = -v765;
    if (v778 < 0)
    {
      if (v763 >= 0)
        v779 = v763;
      else
        v779 = -v763;
      v780 = v779 - v1159;
      v781 = v1159 - v779;
      if (v764 >= 0)
        v782 = v764;
      else
        v782 = -v764;
      if (v764 >= 0)
        v764 = v781;
      else
        v764 = v780;
      if (v763 >= 0)
        v763 = v1159 - v782;
      else
        v763 = v782 - v1159;
      v762 = v1170;
    }
    LODWORD(v1195) = v764;
    LODWORD(v1189) = v763;
    if (v751 >= 0)
      v783 = v751;
    else
      v783 = -v751;
    if (v752 >= 0)
      v784 = v752;
    else
      v784 = -v752;
    if (v753 >= 0)
      v785 = v753;
    else
      v785 = -v753;
    if (v783 < v784 || v783 < v785)
    {
      if (v784 < v785)
        goto LABEL_997;
      v787 = (unint64_t *)v1215;
      v552 = v1182;
      v786 = (void **)((char *)&v1205 + 4);
      v751 = v752;
    }
    else
    {
      v786 = &v1205;
      v787 = &v1187;
    }
    *(_DWORD *)v787 = v762;
    *(_DWORD *)v786 = v753;
    v762 = v552;
    v753 = v751;
    LODWORD(v1206) = v751;
LABEL_997:
    if (v753 < 0)
    {
      v753 = -v753;
      LODWORD(v1206) = v753;
      v762 = -v762;
    }
    v788 = v1187;
    v789 = *(_DWORD *)v1215;
    if (v762 < 0)
    {
      if (*(int *)v1215 >= 0)
        v791 = *(_DWORD *)v1215;
      else
        v791 = -*(_DWORD *)v1215;
      v792 = v791 - v1159;
      v793 = v1159 - v791;
      if ((v1187 & 0x80000000) == 0)
        v790 = v793;
      else
        v790 = v792;
      if ((v1187 & 0x80000000) != 0)
        v788 = -(int)v1187;
      if ((*(_DWORD *)v1215 & 0x80000000) != 0)
        v789 = v788 - v1159;
      else
        v789 = v1159 - v788;
    }
    else
    {
      v790 = v1187;
    }
    v805 = v1199;
    v806 = v1197;
    LODWORD(v1203) = v764 - (_DWORD)v1199;
    HIDWORD(v1203) = v763 - (_DWORD)v1197;
    LODWORD(v1204) = v778 - v777;
    LODWORD(v1201) = v790 - (_DWORD)v1205;
    HIDWORD(v1201) = v789 - HIDWORD(v1205);
    LODWORD(v1202) = v762 - v753;
    if (*(_BYTE *)(v1160 + 24))
    {
      v807 = *(unsigned __int8 *)(v1160 + 8);
      v808 = v1228;
      v1134 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v1228 + 2048) >> 10) & 0x7CLL));
      v1171 = v1197;
      v536 = v1100;
      v1183 = v778;
      v809 = v763;
      v810 = v764;
      v811 = v1199;
      v1125 = sub_23CCD36C8((int *)&v1203, v1100, v807, (unsigned __int16 **)v1232);
      LODWORD(v808) = *(_DWORD *)((char *)&unk_23CCD46E0
                                + (((unint64_t)(67584 - v808) >> 10) & 0x3FFFFFFFFFFFFCLL));
      v812 = sub_23CCD36C8((int *)&v1201, v1100, v807, (unsigned __int16 **)v1232);
      v805 = v811;
      v778 = v1183;
      v764 = v810;
      v763 = v809;
      v813 = v1125 + v1134;
      v3 = (uint64_t)v1152;
      v814 = v812 + v808;
      v806 = v1171;
    }
    else
    {
      v536 = v1100;
      if (v1100 < 1)
        goto LABEL_1040;
      if (v764 - (int)v1199 >= 0)
        v815 = v764 - (_DWORD)v1199;
      else
        v815 = (_DWORD)v1199 - v764;
      v813 = -(v1100 * __clz(v815 + 1));
      if (v790 - (int)v1205 >= 0)
        v816 = v790 - (_DWORD)v1205;
      else
        v816 = (_DWORD)v1205 - v790;
      v814 = -(v1100 * __clz(v816 + 1));
    }
    if (v813 <= v814)
    {
LABEL_1040:
      v817 = 0;
      v1207 = (void *)__PAIR64__(v806, v805);
      v762 = v778;
      LODWORD(v1208) = v777;
      goto LABEL_1041;
    }
    v1207 = v1205;
    LODWORD(v1208) = (_DWORD)v1206;
    v817 = 1;
    v764 = v790;
    v763 = v789;
LABEL_1041:
    v2 = v1160;
    v537 = v1118;
    v540 = v1144;
    __b = (char *)__PAIR64__(v763, v764);
    LODWORD(v1210[0]) = v762;
    sub_23CCC4CE0(v1085, v817, &v1228);
LABEL_1107:
    v840 = 0;
LABEL_1409:
    sub_23CCC4E54(v3, (uint64_t)&__b, (uint64_t)&v1207, v536, v1091, *(_BYTE *)(v2 + 8), &v1232[15 * v840]);
LABEL_1410:
    v540 += 4;
    if (v1109 == v540)
    {
LABEL_1411:
      v1004 = 360;
      do
      {
        v1005 = &v1232[v1004 / 8];
        v1006 = *(void **)((char *)&__p + v1004);
        if (v1006)
        {
          *(v1005 - 2) = v1006;
          operator delete(v1006);
        }
        v1007 = *(v1005 - 6);
        if (v1007)
        {
          *(_QWORD *)((char *)&v1224 + v1004) = v1007;
          operator delete(v1007);
        }
        v1008 = &v1232[v1004 / 8];
        v1009 = *(void **)((char *)&v1216 + v1004);
        if (v1009)
        {
          *(v1008 - 8) = v1009;
          operator delete(v1009);
        }
        v1010 = *(v1008 - 12);
        if (v1010)
        {
          *(_QWORD *)((char *)&v1213 + v1004) = v1010;
          operator delete(v1010);
        }
        v1011 = *(v1005 - 15);
        if (v1011)
        {
          v1210[v1004 / 8] = v1011;
          operator delete(v1011);
        }
        v1004 -= 120;
      }
      while (v1004);
      goto LABEL_1423;
    }
  }
}

void sub_23CCD2870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,void *a60,uint64_t a61,uint64_t a62,void *a63)
{
  void *__p;
  void *a72;
  void *v73;
  uint64_t v74;
  char *v75;
  void *v76;
  void *v77;
  char *v78;
  void *v79;
  void *v80;
  void *v81;

  if (__p)
    operator delete(__p);
  if (a72)
  {
    STACK[0x200] = (unint64_t)a72;
    operator delete(a72);
  }
  v73 = (void *)STACK[0x258];
  if (STACK[0x258])
  {
    STACK[0x260] = (unint64_t)v73;
    operator delete(v73);
  }
  v74 = 360;
  while (1)
  {
    v75 = (char *)&STACK[0x270] + v74;
    v76 = *(void **)((char *)&STACK[0x270] + v74 - 24);
    if (v76)
    {
      *((_QWORD *)v75 - 2) = v76;
      operator delete(v76);
    }
    v77 = (void *)*((_QWORD *)v75 - 6);
    if (v77)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 40) = (unint64_t)v77;
      operator delete(v77);
    }
    v78 = (char *)&STACK[0x270] + v74;
    v79 = *(void **)((char *)&STACK[0x270] + v74 - 72);
    if (v79)
    {
      *((_QWORD *)v78 - 8) = v79;
      operator delete(v79);
    }
    v80 = (void *)*((_QWORD *)v78 - 12);
    if (v80)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 88) = (unint64_t)v80;
      operator delete(v80);
    }
    v81 = (void *)*((_QWORD *)v75 - 15);
    if (v81)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 112) = (unint64_t)v81;
      operator delete(v81);
    }
    v74 -= 120;
    if (!v74)
      _Unwind_Resume(a1);
  }
}

_QWORD *sub_23CCD2D64(_QWORD *a1)
{
  void *v2;

  v2 = operator new(0x1330uLL);
  sub_23CCD2DAC((uint64_t)v2);
  *a1 = v2;
  return a1;
}

void sub_23CCD2D98(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCD2DAC(uint64_t a1)
{
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  bzero((void *)(a1 + 36), 0x220uLL);
  *(_DWORD *)(a1 + 580) = -1;
  bzero((void *)(a1 + 584), 0x700uLL);
  memset_pattern16((void *)(a1 + 2376), &unk_23CCD46A0, 0xAuLL);
  *(_WORD *)(a1 + 2386) = 0x8000;
  memset_pattern16((void *)(a1 + 2388), &unk_23CCD46A0, 0x60uLL);
  *(_WORD *)(a1 + 2484) = 0x8000;
  memset_pattern16((void *)(a1 + 2486), &unk_23CCD46A0, 6uLL);
  *(_WORD *)(a1 + 2492) = 0x8000;
  memset_pattern16((void *)(a1 + 2494), &unk_23CCD46A0, 0x50uLL);
  *(_DWORD *)(a1 + 2574) = -2147450880;
  memset_pattern16((void *)(a1 + 2578), &unk_23CCD46A0, 0x20uLL);
  *(_DWORD *)(a1 + 2610) = -2147450880;
  *(_WORD *)(a1 + 2614) = 0x8000;
  memset_pattern16((void *)(a1 + 2616), &unk_23CCD46A0, 0x80uLL);
  memset_pattern16((void *)(a1 + 2744), &unk_23CCD46A0, 6uLL);
  *(_WORD *)(a1 + 2750) = 0x8000;
  memset_pattern16((void *)(a1 + 2752), &unk_23CCD46A0, 6uLL);
  *(_DWORD *)(a1 + 3552) = 0;
  *(_OWORD *)(a1 + 3536) = 0u;
  *(_OWORD *)(a1 + 3520) = 0u;
  *(_OWORD *)(a1 + 3504) = 0u;
  *(_OWORD *)(a1 + 3488) = 0u;
  *(_OWORD *)(a1 + 3472) = 0u;
  *(_OWORD *)(a1 + 3456) = 0u;
  *(_OWORD *)(a1 + 3440) = 0u;
  *(_OWORD *)(a1 + 3424) = 0u;
  *(_OWORD *)(a1 + 3408) = 0u;
  *(_OWORD *)(a1 + 3392) = 0u;
  *(_OWORD *)(a1 + 3376) = 0u;
  *(_OWORD *)(a1 + 3360) = 0u;
  *(_OWORD *)(a1 + 3344) = 0u;
  *(_OWORD *)(a1 + 3328) = 0u;
  *(_OWORD *)(a1 + 3312) = 0u;
  *(_OWORD *)(a1 + 3296) = 0u;
  *(_OWORD *)(a1 + 3280) = 0u;
  *(_OWORD *)(a1 + 3264) = 0u;
  *(_OWORD *)(a1 + 3248) = 0u;
  *(_OWORD *)(a1 + 3232) = 0u;
  *(_OWORD *)(a1 + 3216) = 0u;
  *(_OWORD *)(a1 + 3200) = 0u;
  *(_OWORD *)(a1 + 3184) = 0u;
  *(_OWORD *)(a1 + 3168) = 0u;
  *(_OWORD *)(a1 + 3152) = 0u;
  *(_OWORD *)(a1 + 3136) = 0u;
  *(_QWORD *)(a1 + 3568) = 0;
  *(_OWORD *)(a1 + 2760) = 0u;
  *(_OWORD *)(a1 + 2776) = 0u;
  *(_OWORD *)(a1 + 2792) = 0u;
  *(_OWORD *)(a1 + 2808) = 0u;
  *(_OWORD *)(a1 + 2824) = 0u;
  *(_OWORD *)(a1 + 2840) = 0u;
  *(_OWORD *)(a1 + 2856) = 0u;
  *(_OWORD *)(a1 + 2872) = 0u;
  *(_OWORD *)(a1 + 2888) = 0u;
  *(_OWORD *)(a1 + 2904) = 0u;
  *(_OWORD *)(a1 + 2920) = 0u;
  *(_OWORD *)(a1 + 2936) = 0u;
  *(_OWORD *)(a1 + 2952) = 0u;
  *(_OWORD *)(a1 + 2968) = 0u;
  *(_OWORD *)(a1 + 2984) = 0u;
  *(_OWORD *)(a1 + 3000) = 0u;
  *(_OWORD *)(a1 + 3016) = 0u;
  *(_OWORD *)(a1 + 3032) = 0u;
  *(_OWORD *)(a1 + 3048) = 0u;
  *(_OWORD *)(a1 + 3064) = 0u;
  *(_OWORD *)(a1 + 3080) = 0u;
  *(_OWORD *)(a1 + 3096) = 0u;
  *(_OWORD *)(a1 + 3112) = 0u;
  *(_DWORD *)(a1 + 3128) = 0;
  sub_23CCAD950(a1 + 4632);
  return a1;
}

void sub_23CCD2FA0(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23CCD2FD0(v3);
  sub_23CCB8124((uint64_t)(v1 + 375));
  sub_23CCD30B0(v2);
  sub_23CCD3204(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23CCD2FD0(uint64_t a1)
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
  void *v11;
  void *v12;

  sub_23CCC1A18(a1 + 336);
  sub_23CCC1A18(a1 + 264);
  v2 = *(void **)(a1 + 240);
  if (v2)
  {
    *(_QWORD *)(a1 + 248) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 216);
  if (v3)
  {
    *(_QWORD *)(a1 + 224) = v3;
    operator delete(v3);
  }
  v4 = *(void **)(a1 + 192);
  if (v4)
  {
    *(_QWORD *)(a1 + 200) = v4;
    operator delete(v4);
  }
  v5 = *(void **)(a1 + 168);
  if (v5)
  {
    *(_QWORD *)(a1 + 176) = v5;
    operator delete(v5);
  }
  v6 = *(void **)(a1 + 144);
  if (v6)
  {
    *(_QWORD *)(a1 + 152) = v6;
    operator delete(v6);
  }
  v7 = *(void **)(a1 + 120);
  if (v7)
  {
    *(_QWORD *)(a1 + 128) = v7;
    operator delete(v7);
  }
  v8 = *(void **)(a1 + 96);
  if (v8)
  {
    *(_QWORD *)(a1 + 104) = v8;
    operator delete(v8);
  }
  v9 = *(void **)(a1 + 72);
  if (v9)
  {
    *(_QWORD *)(a1 + 80) = v9;
    operator delete(v9);
  }
  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    *(_QWORD *)(a1 + 56) = v10;
    operator delete(v10);
  }
  v11 = *(void **)(a1 + 24);
  if (v11)
  {
    *(_QWORD *)(a1 + 32) = v11;
    operator delete(v11);
  }
  v12 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v12;
    operator delete(v12);
  }
  return a1;
}

_QWORD *sub_23CCD30B0(_QWORD *a1)
{
  uint64_t i;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  for (i = 338; i != 308; i -= 15)
  {
    v3 = &a1[i];
    v4 = (void *)a1[i - 1];
    if (v4)
    {
      a1[i] = v4;
      operator delete(v4);
    }
    v5 = (void *)*(v3 - 4);
    if (v5)
    {
      a1[i - 3] = v5;
      operator delete(v5);
    }
    v6 = &a1[i];
    v7 = (void *)a1[i - 7];
    if (v7)
    {
      *(v6 - 6) = v7;
      operator delete(v7);
    }
    v8 = (void *)*(v6 - 10);
    if (v8)
    {
      a1[i - 9] = v8;
      operator delete(v8);
    }
    v9 = (void *)*(v3 - 13);
    if (v9)
    {
      a1[i - 12] = v9;
      operator delete(v9);
    }
  }
  v10 = 192;
  do
  {
    v11 = (void *)a1[v10 + 35];
    if (v11)
    {
      a1[v10 + 36] = v11;
      operator delete(v11);
    }
    v10 -= 3;
  }
  while (v10 * 8);
  v12 = (void *)a1[34];
  if (v12)
  {
    a1[35] = v12;
    operator delete(v12);
  }
  v13 = (void *)a1[31];
  if (v13)
  {
    a1[32] = v13;
    operator delete(v13);
  }
  v14 = (void *)a1[28];
  if (v14)
  {
    a1[29] = v14;
    operator delete(v14);
  }
  v15 = (void *)a1[25];
  if (v15)
  {
    a1[26] = v15;
    operator delete(v15);
  }
  v16 = (void *)a1[22];
  if (v16)
  {
    a1[23] = v16;
    operator delete(v16);
  }
  v17 = (void *)a1[19];
  if (v17)
  {
    a1[20] = v17;
    operator delete(v17);
  }
  v18 = (void *)a1[16];
  if (v18)
  {
    a1[17] = v18;
    operator delete(v18);
  }
  v19 = (void *)a1[13];
  if (v19)
  {
    a1[14] = v19;
    operator delete(v19);
  }
  v20 = (void *)a1[10];
  if (v20)
  {
    a1[11] = v20;
    operator delete(v20);
  }
  sub_23CCC1A18((uint64_t)(a1 + 1));
  return a1;
}

_QWORD *sub_23CCD3204(_QWORD *a1)
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
  void *v11;

  v2 = (void *)a1[32];
  if (v2)
  {
    a1[33] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[29];
  if (v3)
  {
    a1[30] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[26];
  if (v4)
  {
    a1[27] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[23];
  if (v5)
  {
    a1[24] = v5;
    operator delete(v5);
  }
  v6 = (void *)a1[20];
  if (v6)
  {
    a1[21] = v6;
    operator delete(v6);
  }
  v7 = (void *)a1[17];
  if (v7)
  {
    a1[18] = v7;
    operator delete(v7);
  }
  v8 = (void *)a1[14];
  if (v8)
  {
    a1[15] = v8;
    operator delete(v8);
  }
  v9 = (void *)a1[11];
  if (v9)
  {
    a1[12] = v9;
    operator delete(v9);
  }
  v10 = (void *)a1[8];
  if (v10)
  {
    a1[9] = v10;
    operator delete(v10);
  }
  v11 = (void *)a1[5];
  if (v11)
  {
    a1[6] = v11;
    operator delete(v11);
  }
  return a1;
}

_QWORD *sub_23CCD32C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)(a1 + 4632) = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + 4632 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 4648) = v4;
  *(_QWORD *)(a1 + 4656) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 4743) < 0)
    operator delete(*(void **)(a1 + 4720));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x242630A2C](a1 + 4760);
  sub_23CCD2FD0(a1 + 3136);
  v5 = *(void **)(a1 + 3096);
  if (v5)
  {
    *(_QWORD *)(a1 + 3104) = v5;
    operator delete(v5);
  }
  v6 = *(void **)(a1 + 3072);
  if (v6)
  {
    *(_QWORD *)(a1 + 3080) = v6;
    operator delete(v6);
  }
  v7 = *(void **)(a1 + 3048);
  if (v7)
  {
    *(_QWORD *)(a1 + 3056) = v7;
    operator delete(v7);
  }
  v8 = *(void **)(a1 + 3024);
  if (v8)
  {
    *(_QWORD *)(a1 + 3032) = v8;
    operator delete(v8);
  }
  v9 = *(void **)(a1 + 3000);
  if (v9)
  {
    *(_QWORD *)(a1 + 3008) = v9;
    operator delete(v9);
  }
  sub_23CCD30B0((_QWORD *)(a1 + 280));
  return sub_23CCD3204((_QWORD *)a1);
}

char *sub_23CCD33C0(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      sub_23CCB1C80();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_23CCC1560(v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *sub_23CCD34C8(uint64_t a1, _DWORD *a2, _DWORD *a3, unint64_t a4)
{
  _DWORD *v6;
  uint64_t v8;
  uint64_t v9;
  char *result;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int64_t v17;
  void **v18;
  char *v19;
  char *v20;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;

  v6 = a2;
  v9 = a1 + 16;
  v8 = *(_QWORD *)(a1 + 16);
  result = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 2) >= a4)
  {
    v20 = *(char **)(a1 + 8);
    v18 = (void **)(a1 + 8);
    v19 = v20;
    v21 = 0xAAAAAAAAAAAAAAABLL * ((v20 - result) >> 2);
    if (v21 >= a4)
    {
      v27 = result;
      if (a2 != a3)
      {
        v28 = result;
        do
        {
          v29 = *(_QWORD *)v6;
          *((_DWORD *)v28 + 2) = v6[2];
          *(_QWORD *)v28 = v29;
          v28 += 12;
          v6 += 3;
          v27 += 12;
        }
        while (v6 != a3);
      }
      v17 = v27 - result;
    }
    else
    {
      v22 = &a2[3 * v21];
      if (v19 != result)
      {
        v23 = 12 * v21;
        do
        {
          v24 = *(_QWORD *)v6;
          *((_DWORD *)result + 2) = v6[2];
          *(_QWORD *)result = v24;
          result += 12;
          v6 += 3;
          v23 -= 12;
        }
        while (v23);
        result = (char *)*v18;
      }
      v25 = result;
      if (v22 != a3)
      {
        v25 = result;
        v26 = result;
        do
        {
          *(_DWORD *)v26 = *v22;
          *((_DWORD *)v26 + 1) = v22[1];
          *((_DWORD *)v26 + 2) = v22[2];
          v25 += 12;
          v22 += 3;
          v26 += 12;
        }
        while (v22 != a3);
      }
      v17 = v25 - result;
    }
  }
  else
  {
    if (result)
    {
      *(_QWORD *)(a1 + 8) = result;
      operator delete(result);
      v8 = 0;
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
    if (a4 > 0x1555555555555555)
      goto LABEL_29;
    v11 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    v12 = 2 * v11;
    if (2 * v11 <= a4)
      v12 = a4;
    v13 = v11 >= 0xAAAAAAAAAAAAAAALL ? 0x1555555555555555 : v12;
    if (v13 > 0x1555555555555555)
LABEL_29:
      sub_23CCB1C80();
    result = (char *)sub_23CCC0164(v9, v13);
    *(_QWORD *)a1 = result;
    *(_QWORD *)(a1 + 16) = &result[12 * v14];
    v15 = result;
    if (v6 != a3)
    {
      v15 = result;
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *v6;
        *((_DWORD *)v16 + 1) = v6[1];
        *((_DWORD *)v16 + 2) = v6[2];
        v15 += 12;
        v6 += 3;
        v16 += 12;
      }
      while (v6 != a3);
    }
    v17 = v15 - result;
    v18 = (void **)(a1 + 8);
  }
  *v18 = &result[v17];
  return result;
}

uint64_t sub_23CCD36C8(int *a1, int a2, int a3, unsigned __int16 **a4)
{
  uint64_t v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  unsigned __int16 *v26;
  char v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  int v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  int v51;
  int v52;
  unsigned __int16 *v53;
  unsigned int v54;
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
  int v66;

  if (a3)
  {
    if (a3 != 4)
    {
      if (a3 == 2 && a2 >= 1)
      {
        LODWORD(v4) = 0;
        v5 = a4[3];
        v6 = a4[12];
        v7 = a2;
        while (1)
        {
          v9 = *a1++;
          v8 = v9;
          if (v9 < 1)
          {
            if ((v8 & 0x80000000) == 0)
              goto LABEL_10;
            v10 = *v5 + 2048;
          }
          else
          {
            v10 = 67584 - *v5;
          }
          LODWORD(v4) = *(_DWORD *)((char *)&unk_23CCD46E0 + ((v10 >> 10) & 0x3FFFFFFFFFFFFCLL)) + v4;
LABEL_10:
          v12 = *(_DWORD *)v6;
          v6 += 2;
          v11 = v12;
          if (v8 < 0)
            v8 = -v8;
          v4 = (_DWORD)v4 + 66560 + (v11 << 10) - (__clz((v8 >> v11) + 1) << 11);
          ++v5;
          if (!--v7)
            return v4;
        }
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v40 = 0;
      LODWORD(v4) = 0;
      v41 = *a4;
      v42 = a4[3];
      v43 = a4[6];
      v44 = a4[12];
      do
      {
        v46 = *a1++;
        v45 = v46;
        v48 = *v41++;
        v47 = v48;
        if (v45)
        {
          v49 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v47) >> 10) & 0x3FFFFFFFFFFFFCLL))
              + v4;
          if (v45 >= 0)
            v50 = v45;
          else
            v50 = -v45;
          if (v45 >= 0)
            v51 = 0x10000 - *v42;
          else
            v51 = *v42;
          v52 = v49 + *(_DWORD *)((char *)&unk_23CCD46E0 + (((v51 + 2048) >> 10) & 0xFCLL));
          v53 = &v43[(int)v40];
          if (v50 > 0x3F)
          {
            v66 = *(_DWORD *)v44;
            v4 = v52
               + 66560
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)*v53) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v53[2]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v53[6]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v53[14]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v53[30]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v53[62]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + (v66 << 10)
               - (__clz(((v50 - 64) >> v66) + 1) << 11);
          }
          else
          {
            v54 = v50 - 1;
            v55 = *v53;
            if ((v54 & 0x20) != 0)
              v55 = 0x10000 - v55;
            v56 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v55 + 2048) >> 10) & 0xFCLL));
            v57 = v53[(v54 >> 5) + 1];
            if ((v54 & 0x10) != 0)
              v57 = 0x10000 - v57;
            v58 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v57 + 2048) >> 10) & 0xFCLL));
            v59 = v53[(v54 >> 4) + 3];
            if ((v54 & 8) != 0)
              v59 = 0x10000 - v59;
            v60 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v59 + 2048) >> 10) & 0xFCLL));
            v61 = v53[(v54 >> 3) + 7];
            if ((v54 & 4) != 0)
              v61 = 0x10000 - v61;
            v62 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v61 + 2048) >> 10) & 0xFCLL));
            v63 = v53[(v54 >> 2) + 15];
            if ((v54 & 2) != 0)
              v63 = 0x10000 - v63;
            v64 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v63 + 2048) >> 10) & 0xFCLL));
            v65 = v53[(v54 >> 1) + 31];
            if ((v54 & 1) != 0)
              v65 = 0x10000 - v65;
            v4 = (v56
                              + v52
                              + v58
                              + v60
                              + v62
                              + v64
                              + *(_DWORD *)((char *)&unk_23CCD46E0 + (((v65 + 2048) >> 10) & 0xFCLL)));
          }
        }
        else
        {
          v4 = (*(_DWORD *)((char *)&unk_23CCD46E0 + (((v47 + 2048) >> 10) & 0x7CLL)) + v4);
        }
        v40 += 64;
        v44 += 2;
        ++v42;
      }
      while ((unint64_t)a2 << 6 != v40);
      return v4;
    }
    return 0;
  }
  if (a2 < 1)
    return 0;
  v13 = 0;
  LODWORD(v4) = 0;
  v14 = *a4;
  v15 = a4[3];
  v16 = a4[6];
  v17 = a4[12];
  do
  {
    v19 = *a1++;
    v18 = v19;
    v21 = *v14++;
    v20 = v21;
    if (v18)
    {
      v22 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((unint64_t)(67584 - v20) >> 10) & 0x3FFFFFFFFFFFFCLL)) + v4;
      if (v18 >= 0)
        v23 = v18;
      else
        v23 = -v18;
      if (v18 >= 0)
        v24 = 0x10000 - *v15;
      else
        v24 = *v15;
      v25 = v22 + *(_DWORD *)((char *)&unk_23CCD46E0 + (((v24 + 2048) >> 10) & 0xFCLL));
      v26 = &v16[(int)v13];
      if (v23 > 0x3F)
      {
        v39 = *(_DWORD *)v17;
        v4 = v25
           + 66560
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)*v26) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v26[2]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v26[6]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v26[14]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v26[30]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_23CCD46E0 + (((67584 - (unint64_t)v26[62]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + (v39 << 10)
           - (__clz(((v23 - 64) >> v39) + 1) << 11);
      }
      else
      {
        v27 = v23 - 1;
        v28 = *v26;
        if ((v27 & 1) != 0)
          v28 = 0x10000 - v28;
        v29 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v28 + 2048) >> 10) & 0xFCLL));
        v30 = v26[(v27 & 1) + 1];
        if ((v27 & 2) != 0)
          v30 = 0x10000 - v30;
        v31 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v30 + 2048) >> 10) & 0xFCLL));
        v32 = v26[(v27 & 3) + 3];
        if ((v27 & 4) != 0)
          v32 = 0x10000 - v32;
        v33 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v32 + 2048) >> 10) & 0xFCLL));
        v34 = v26[(v27 & 7) + 7];
        if ((v27 & 8) != 0)
          v34 = 0x10000 - v34;
        v35 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v34 + 2048) >> 10) & 0xFCLL));
        v36 = v26[(v27 & 0xF) + 15];
        if ((v27 & 0x10) != 0)
          v36 = 0x10000 - v36;
        v37 = *(_DWORD *)((char *)&unk_23CCD46E0 + (((v36 + 2048) >> 10) & 0xFCLL));
        v38 = v26[(v27 & 0x1F) + 31];
        if ((v27 & 0x20) != 0)
          v38 = 0x10000 - v38;
        v4 = (v29
                          + v25
                          + v31
                          + v33
                          + v35
                          + v37
                          + *(_DWORD *)((char *)&unk_23CCD46E0 + (((v38 + 2048) >> 10) & 0xFCLL)));
      }
    }
    else
    {
      v4 = (*(_DWORD *)((char *)&unk_23CCD46E0 + (((v20 + 2048) >> 10) & 0x7CLL)) + v4);
    }
    v13 += 64;
    v17 += 2;
    ++v15;
  }
  while ((unint64_t)a2 << 6 != v13);
  return v4;
}

uint64_t sub_23CCD3C80(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  int v5;
  unsigned int v6;
  int i;
  uint64_t result;
  int v10;
  __int16 v11;

  v5 = a3;
  v6 = a2;
  for (i = 1 << a3; v6 >= 1 << v5; i = 1 << v5)
  {
    sub_23CCC4CE0(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  result = sub_23CCC4CE0(a1, 0, a4);
  if (v5)
  {
    v10 = v5 - 1;
    do
    {
      v11 = 0x8000;
      result = sub_23CCC4CE0(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF78]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_250DE3E68(__p);
}

void operator delete(void *__p)
{
  off_250DE3E70(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_250DE3E78(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250DE3E80(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

