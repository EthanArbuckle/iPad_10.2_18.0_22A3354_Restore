__n128 sub_206288770()
{
  __int128 v0;
  __int128 v1;
  __n128 result;
  __int128 v3;

  v0 = *(_OWORD *)(MEMORY[0x24BDAEDE0] + 48);
  xmmword_253CF8020 = *(_OWORD *)(MEMORY[0x24BDAEDE0] + 32);
  unk_253CF8030 = v0;
  v1 = *(_OWORD *)(MEMORY[0x24BDAEDE0] + 80);
  xmmword_253CF8040 = *(_OWORD *)(MEMORY[0x24BDAEDE0] + 64);
  unk_253CF8050 = v1;
  result = *(__n128 *)MEMORY[0x24BDAEDE0];
  v3 = *(_OWORD *)(MEMORY[0x24BDAEDE0] + 16);
  xmmword_253CF8000 = *MEMORY[0x24BDAEDE0];
  *(_OWORD *)algn_253CF8010 = v3;
  return result;
}

_QWORD *sub_20628879C(_QWORD *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v6;

  *a1 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[1];
  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5)
          (*v5)(0, v5, 0, 0, 0);
        v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_206288834(_QWORD *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v6;

  *a1 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[1];
  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5)
          (*v5)(0, v5, 0, 0, 0);
        v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  JUMPOUT(0x20BCF13ACLL);
}

uint64_t sub_2062888DC()
{
  return 1;
}

uint64_t sub_2062888E4()
{
  return 1;
}

BOOL sub_2062888EC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64) == 0;
}

uint64_t sub_2062888FC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_206288904(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_20628890C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_206288914(uint64_t a1)
{
  return (2 * *(_DWORD *)(a1 + 32));
}

uint64_t sub_206288920(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

void sub_206288928(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v5 = *(_BYTE **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if (a2 <= (v4 - (uint64_t)v5) >> 3)
  {
    *(_QWORD *)(a1 + 8) = &v5[8 * a2];
  }
  else
  {
    v6 = *(_BYTE **)a1;
    v7 = (uint64_t)&v5[-*(_QWORD *)a1];
    v8 = v7 >> 3;
    v9 = (v7 >> 3) + a2;
    if (v9 >> 61)
      sub_206288A90();
    v10 = v4 - (_QWORD)v6;
    if (v10 >> 2 > v9)
      v9 = v10 >> 2;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
    {
      if (v11 >> 61)
        sub_206288AA4();
      v12 = (char *)operator new(8 * v11);
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[8 * v8];
    v14 = &v13[8 * a2];
    if (v5 != v6)
    {
      v15 = v5 - v6 - 8;
      if (v15 < 0x58)
        goto LABEL_27;
      if ((unint64_t)(v5 - &v12[v7]) < 0x20)
        goto LABEL_27;
      v16 = (v15 >> 3) + 1;
      v17 = &v12[8 * v8 - 16];
      v18 = (__int128 *)(v5 - 16);
      v19 = v16 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v20 = *v18;
        *((_OWORD *)v17 - 1) = *(v18 - 1);
        *(_OWORD *)v17 = v20;
        v17 -= 32;
        v18 -= 2;
        v19 -= 4;
      }
      while (v19);
      v13 -= 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
      v5 -= 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
      if (v16 != (v16 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_27:
        do
        {
          v21 = *((_QWORD *)v5 - 1);
          v5 -= 8;
          *((_QWORD *)v13 - 1) = v21;
          v13 -= 8;
        }
        while (v5 != v6);
      }
    }
    *(_QWORD *)a1 = v13;
    *(_QWORD *)(a1 + 8) = v14;
    *(_QWORD *)(a1 + 16) = &v12[8 * v11];
    if (v6)
      operator delete(v6);
  }
}

void sub_206288A90()
{
  sub_206288ACC("vector");
}

void sub_206288AA4()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_206288ACC(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_206288B1C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24BEFD1F0, MEMORY[0x24BEDAAF0]);
}

void sub_206288B08(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_206288B1C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_206288B48(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_206288B58(_QWORD *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v6;

  *a1 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[1];
  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5)
          (*v5)(0, v5, 0, 0, 0);
        v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_206288BF0(_QWORD *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v6;

  *a1 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[1];
  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a1[2];
    v4 = (void *)a1[1];
    if (v3 != v2)
    {
      v5 = v3 - 4;
      do
      {
        if (*v5)
          (*v5)(0, v5, 0, 0, 0);
        v6 = v5 == v2;
        v5 -= 4;
      }
      while (!v6);
      v4 = (void *)a1[1];
    }
    a1[2] = v2;
    operator delete(v4);
  }
  JUMPOUT(0x20BCF13ACLL);
}

uint64_t sub_206288C98()
{
  return 0;
}

uint64_t sub_206288CA0()
{
  return 1;
}

BOOL sub_206288CA8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == 0;
}

uint64_t sub_206288CB8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sub_206288CC0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
}

uint64_t sub_206288CCC()
{
  return 1;
}

uint64_t sub_206288CD4(uint64_t a1)
{
  return 2 * *(_QWORD *)(a1 + 32);
}

uint64_t sub_206288CE0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
}

uint64_t sub_206288CEC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24BEFD7B0;
  sub_2062896CC(*(_QWORD **)(a1 + 48));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2 == (_QWORD *)(a1 + 8))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 8);
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

void sub_206288D50(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24BEFD7B0;
  sub_2062896CC(*(_QWORD **)(a1 + 48));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2 == (_QWORD *)(a1 + 8))
  {
    v3 = 4;
    v2 = (_QWORD *)(a1 + 8);
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x20BCF13ACLL);
}

char *sub_206288DC4(uint64_t a1, unint64_t a2)
{
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  _BYTE v12[24];

  memset(v12, 0, sizeof(v12));
  v5 = (uint64_t **)(a1 + 48);
  v4 = *(uint64_t **)(a1 + 48);
  if (!v4)
  {
    v6 = (uint64_t **)(a1 + 48);
    goto LABEL_8;
  }
  do
  {
    while (1)
    {
      v6 = (uint64_t **)v4;
      v7 = v4[4];
      if (v7 <= a2)
        break;
      v4 = *v6;
      v5 = v6;
      if (!*v6)
        goto LABEL_8;
    }
    if (v7 >= a2)
    {
      v8 = (char *)v6;
      if (!*((_DWORD *)v6 + 80))
        return v8 + 40;
LABEL_13:
      sub_2062892C8();
    }
    v4 = v6[1];
  }
  while (v4);
  v5 = v6 + 1;
LABEL_8:
  v8 = (char *)operator new(0x148uLL);
  *((_QWORD *)v8 + 6) = 0;
  *((_QWORD *)v8 + 4) = a2;
  *((_QWORD *)v8 + 5) = off_24BEFD7E8;
  *((_QWORD *)v8 + 7) = 0;
  *((_QWORD *)v8 + 8) = 0;
  sub_206289368((_QWORD *)v8 + 6, 0, 0, 0);
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *((_QWORD *)v8 + 5) = &off_24BEFD848;
  *(_OWORD *)(v8 + 72) = *(_OWORD *)&v12[8];
  *((_DWORD *)v8 + 80) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = v6;
  *v5 = (uint64_t *)v8;
  v9 = **(_QWORD **)(a1 + 40);
  v10 = (uint64_t *)v8;
  if (v9)
  {
    *(_QWORD *)(a1 + 40) = v9;
    v10 = *v5;
  }
  sub_206289490(*(uint64_t **)(a1 + 48), v10);
  ++*(_QWORD *)(a1 + 56);
  if (*((_DWORD *)v8 + 80))
    goto LABEL_13;
  return v8 + 40;
}

void sub_206288F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  operator delete(v9);
  sub_206288B58(&a9);
  _Unwind_Resume(a1);
}

char *sub_206288FA0(uint64_t a1, unint64_t a2)
{
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;
  unint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  _BYTE v12[248];

  memset(v12, 0, sizeof(v12));
  v5 = (uint64_t **)(a1 + 48);
  v4 = *(uint64_t **)(a1 + 48);
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v6 = (uint64_t **)v4;
        v7 = v4[4];
        if (v7 <= a2)
          break;
        v4 = *v6;
        v5 = v6;
        if (!*v6)
          goto LABEL_8;
      }
      if (v7 >= a2)
        break;
      v4 = v6[1];
      if (!v4)
      {
        v5 = v6 + 1;
        goto LABEL_8;
      }
    }
    v8 = (char *)v6;
  }
  else
  {
    v6 = (uint64_t **)(a1 + 48);
LABEL_8:
    v8 = (char *)operator new(0x148uLL);
    *((_QWORD *)v8 + 6) = 0;
    *((_QWORD *)v8 + 4) = a2;
    *((_QWORD *)v8 + 5) = off_24BEFD7E8;
    *((_QWORD *)v8 + 7) = 0;
    *((_QWORD *)v8 + 8) = 0;
    sub_206289368((_QWORD *)v8 + 6, 0, 0, 0);
    *(_OWORD *)(v8 + 200) = *(_OWORD *)&v12[136];
    *(_OWORD *)(v8 + 216) = *(_OWORD *)&v12[152];
    *(_OWORD *)(v8 + 232) = *(_OWORD *)&v12[168];
    *(_OWORD *)(v8 + 248) = *(_OWORD *)&v12[184];
    *(_OWORD *)(v8 + 136) = *(_OWORD *)&v12[72];
    *(_OWORD *)(v8 + 152) = *(_OWORD *)&v12[88];
    *(_OWORD *)(v8 + 168) = *(_OWORD *)&v12[104];
    *(_OWORD *)(v8 + 184) = *(_OWORD *)&v12[120];
    *(_OWORD *)(v8 + 72) = *(_OWORD *)&v12[8];
    *(_OWORD *)(v8 + 88) = *(_OWORD *)&v12[24];
    *(_OWORD *)(v8 + 104) = *(_OWORD *)&v12[40];
    *(_OWORD *)(v8 + 120) = *(_OWORD *)&v12[56];
    *(_OWORD *)(v8 + 264) = *(_OWORD *)&v12[200];
    *((_QWORD *)v8 + 5) = &off_24BEFD8F0;
    *((_QWORD *)v8 + 39) = 0;
    *(_OWORD *)(v8 + 280) = *(_OWORD *)&v12[216];
    *(_OWORD *)(v8 + 296) = *(_OWORD *)&v12[232];
    *((_DWORD *)v8 + 80) = 1;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v6;
    *v5 = (uint64_t *)v8;
    v9 = (uint64_t *)v8;
    v10 = **(_QWORD **)(a1 + 40);
    if (v10)
    {
      *(_QWORD *)(a1 + 40) = v10;
      v9 = *v5;
    }
    sub_206289490(*(uint64_t **)(a1 + 48), v9);
    ++*(_QWORD *)(a1 + 56);
  }
  if (*((_DWORD *)v8 + 80) != 1)
    sub_2062892C8();
  return v8 + 40;
}

void sub_2062891F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  operator delete(v10);
  sub_20628879C(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_206289218(uint64_t a1, char *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char *v12;

  v3 = *(_QWORD **)(a1 + 48);
  if (!v3)
    goto LABEL_12;
  v4 = (_QWORD *)(a1 + 48);
  do
  {
    v5 = v3[4];
    v6 = v5 >= (unint64_t)a2;
    if (v5 >= (unint64_t)a2)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6)
      v4 = v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 != (_QWORD *)(a1 + 48) && v4[4] <= (unint64_t)a2)
  {
    v10 = *((unsigned int *)v4 + 80);
    if ((_DWORD)v10 == -1)
      sub_2062892C8();
    v12 = &v11;
    return ((uint64_t (*)(char **, _QWORD *, uint64_t))*(&off_24BEFE138 + v10))(&v12, v4 + 5, a1);
  }
  else
  {
LABEL_12:
    v12 = a2;
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
      sub_2062892FC();
    return (*(uint64_t (**)(uint64_t, char **, uint64_t))(*(_QWORD *)v8 + 48))(v8, &v12, a1);
  }
}

void sub_2062892C8()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::exception::~exception);
}

void sub_2062892FC()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = &off_24BEFE120;
  __cxa_throw(exception, (struct type_info *)&unk_24BEFD648, (void (*)(void *))std::exception::~exception);
}

void sub_206289330(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x20BCF13ACLL);
}

uint64_t sub_206289354(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_20628935C(uint64_t a1, uint64_t a2)
{
  return a2;
}

_QWORD *sub_206289368(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t (*v11)(uint64_t);

  if (a4)
  {
    if (a4 >> 59)
      sub_206288A90();
    v7 = result;
    result = operator new(32 * a4);
    v8 = result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[4 * a4];
    if (a2 != a3)
    {
      v9 = 0;
      do
      {
        v10 = &v8[v9 / 8];
        *v10 = 0;
        v10[1] = 0;
        v11 = *(uint64_t (**)(uint64_t))(a2 + v9);
        if (v11)
          result = (_QWORD *)v11(1);
        v9 += 32;
      }
      while (a2 + v9 != a3);
      v8 = (_QWORD *)((char *)v8 + v9);
    }
    v7[1] = v8;
  }
  return result;
}

void sub_206289430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_206289630(&a9);
  _Unwind_Resume(a1);
}

uint64_t *sub_206289490(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = a2[2];
      if (*(_BYTE *)(v2 + 24))
        break;
      v3 = *(uint64_t **)(v2 + 16);
      v4 = *v3;
      if (*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if (*(uint64_t **)v2 == a2)
          {
            v9 = (uint64_t *)a2[2];
          }
          else
          {
            v9 = *(uint64_t **)(v2 + 8);
            v10 = *v9;
            *(_QWORD *)(v2 + 8) = *v9;
            if (v10)
            {
              *(_QWORD *)(v10 + 16) = v2;
              v3 = *(uint64_t **)(v2 + 16);
            }
            v9[2] = (uint64_t)v3;
            *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
            *v9 = v2;
            *(_QWORD *)(v2 + 16) = v9;
            v3 = (uint64_t *)v9[2];
            v2 = *v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v14 = *(_QWORD *)(v2 + 8);
          *v3 = v14;
          if (v14)
            *(_QWORD *)(v14 + 16) = v3;
          *(_QWORD *)(v2 + 16) = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          *(_QWORD *)(v2 + 8) = v3;
          v3[2] = v2;
          return result;
        }
      }
      else if (!v4 || (v6 = *(unsigned __int8 *)(v4 + 24), v5 = (_BYTE *)(v4 + 24), v6))
      {
        if (*(uint64_t **)v2 == a2)
        {
          v11 = a2[1];
          *(_QWORD *)v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = *(uint64_t **)(v2 + 16);
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
          a2[1] = v2;
          *(_QWORD *)(v2 + 16) = a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v12 = (uint64_t *)v3[1];
        v13 = *v12;
        v3[1] = *v12;
        if (v13)
          *(_QWORD *)(v13 + 16) = v3;
        v12[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v12;
        *v12 = (uint64_t)v3;
        v3[2] = (uint64_t)v12;
        return result;
      }
      *(_BYTE *)(v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void ***sub_206289630(void ***a1)
{
  void **v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v7;

  if (!*((_BYTE *)a1 + 8))
  {
    v2 = *a1;
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))**a1;
    if (v3)
    {
      v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v2[1];
      v5 = **a1;
      if (v4 != v3)
      {
        v6 = v4 - 4;
        do
        {
          if (*v6)
            (*v6)(0, v6, 0, 0, 0);
          v7 = v6 == v3;
          v6 -= 4;
        }
        while (!v7);
        v5 = **a1;
      }
      v2[1] = v3;
      operator delete(v5);
    }
  }
  return a1;
}

void sub_2062896CC(_QWORD *a1)
{
  uint64_t v2;
  char v3;

  if (a1)
  {
    sub_2062896CC(*a1);
    sub_2062896CC(a1[1]);
    v2 = *((unsigned int *)a1 + 80);
    if ((_DWORD)v2 != -1)
      ((void (*)(char *, _QWORD *))*(&off_24BEFE148 + v2))(&v3, a1 + 5);
    operator delete(a1);
  }
}

void sub_206289734(uint64_t a1, _QWORD *a2)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v7;

  *a2 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a2[1];
  if (v2)
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a2[2];
    v5 = (void *)a2[1];
    if (v4 != v2)
    {
      v6 = v4 - 4;
      do
      {
        if (*v6)
          (*v6)(0, v6, 0, 0, 0);
        v7 = v6 == v2;
        v6 -= 4;
      }
      while (!v7);
      v5 = (void *)a2[1];
    }
    a2[2] = v2;
    operator delete(v5);
  }
}

void sub_2062897D4(uint64_t a1, _QWORD *a2)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v7;

  *a2 = off_24BEFD7E8;
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a2[1];
  if (v2)
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a2[2];
    v5 = (void *)a2[1];
    if (v4 != v2)
    {
      v6 = v4 - 4;
      do
      {
        if (*v6)
          (*v6)(0, v6, 0, 0, 0);
        v7 = v6 == v2;
        v6 -= 4;
      }
      while (!v7);
      v5 = (void *)a2[1];
    }
    a2[2] = v2;
    operator delete(v5);
  }
}

void HVF::PartTransform::~PartTransform(HVF::PartTransform *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  HVF::PartTransform *v5;
  uint64_t v6;
  HVF::PartTransform *v7;
  uint64_t v8;
  HVF::PartTransform *v9;
  uint64_t v10;
  HVF::PartTransform *v11;
  uint64_t v12;
  HVF::PartTransform *v13;
  uint64_t v14;

  v2 = (char *)this + 160;
  v3 = (char *)*((_QWORD *)this + 23);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (HVF::PartTransform *)*((_QWORD *)this + 19);
  if (v5 == (HVF::PartTransform *)((char *)this + 128))
  {
    v6 = 4;
    v5 = (HVF::PartTransform *)((char *)this + 128);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  v7 = (HVF::PartTransform *)*((_QWORD *)this + 15);
  if (v7 == (HVF::PartTransform *)((char *)this + 96))
  {
    v8 = 4;
    v7 = (HVF::PartTransform *)((char *)this + 96);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_16:
  v9 = (HVF::PartTransform *)*((_QWORD *)this + 11);
  if (v9 == (HVF::PartTransform *)((char *)this + 64))
  {
    v10 = 4;
    v9 = (HVF::PartTransform *)((char *)this + 64);
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
LABEL_21:
  v11 = (HVF::PartTransform *)*((_QWORD *)this + 7);
  if (v11 == (HVF::PartTransform *)((char *)this + 32))
  {
    v12 = 4;
    v11 = (HVF::PartTransform *)((char *)this + 32);
  }
  else
  {
    if (!v11)
      goto LABEL_26;
    v12 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v11 + 8 * v12))();
LABEL_26:
  v13 = (HVF::PartTransform *)*((_QWORD *)this + 3);
  if (v13 == this)
  {
    v14 = 4;
    v13 = this;
  }
  else
  {
    if (!v13)
      return;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  HVF::PartTransform *v5;
  uint64_t v6;
  HVF::PartTransform *v7;
  uint64_t v8;
  HVF::PartTransform *v9;
  uint64_t v10;
  HVF::PartTransform *v11;
  uint64_t v12;
  HVF::PartTransform *v13;
  uint64_t v14;

  v2 = (char *)this + 160;
  v3 = (char *)*((_QWORD *)this + 23);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (HVF::PartTransform *)*((_QWORD *)this + 19);
  if (v5 == (HVF::PartTransform *)((char *)this + 128))
  {
    v6 = 4;
    v5 = (HVF::PartTransform *)((char *)this + 128);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  v7 = (HVF::PartTransform *)*((_QWORD *)this + 15);
  if (v7 == (HVF::PartTransform *)((char *)this + 96))
  {
    v8 = 4;
    v7 = (HVF::PartTransform *)((char *)this + 96);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_16:
  v9 = (HVF::PartTransform *)*((_QWORD *)this + 11);
  if (v9 == (HVF::PartTransform *)((char *)this + 64))
  {
    v10 = 4;
    v9 = (HVF::PartTransform *)((char *)this + 64);
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
LABEL_21:
  v11 = (HVF::PartTransform *)*((_QWORD *)this + 7);
  if (v11 == (HVF::PartTransform *)((char *)this + 32))
  {
    v12 = 4;
    v11 = (HVF::PartTransform *)((char *)this + 32);
  }
  else
  {
    if (!v11)
      goto LABEL_26;
    v12 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v11 + 8 * v12))();
LABEL_26:
  v13 = (HVF::PartTransform *)*((_QWORD *)this + 3);
  if (v13 == this)
  {
    v14 = 4;
    v13 = this;
  }
  else
  {
    if (!v13)
      return;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
}

HVF::PartTransformRenderer *HVF::PartTransformRenderer::PartTransformRenderer(HVF::PartTransformRenderer *this, unint64_t a2, _QWORD *a3, char a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 4) = &off_24BEFDCA8;
  *((_QWORD *)this + 8) = &off_24BEFDD00;
  *((_QWORD *)this + 12) = &off_24BEFDD58;
  *((_QWORD *)this + 7) = (char *)this + 32;
  *(_QWORD *)this = &off_24BEFDC50;
  *((_QWORD *)this + 1) = this;
  *((_QWORD *)this + 3) = this;
  *((_QWORD *)this + 5) = this;
  *((_QWORD *)this + 9) = this;
  *((_QWORD *)this + 11) = (char *)this + 64;
  *((_QWORD *)this + 13) = this;
  *((_QWORD *)this + 15) = (char *)this + 96;
  *((_QWORD *)this + 16) = &off_24BEFDDB0;
  *((_QWORD *)this + 17) = this;
  *((_QWORD *)this + 19) = (char *)this + 128;
  *((_QWORD *)this + 20) = &off_24BEFDE08;
  *((_QWORD *)this + 21) = this;
  *((_QWORD *)this + 23) = (char *)this + 160;
  v7 = (_QWORD *)a3[3];
  if (!v7)
    goto LABEL_4;
  if (v7 != a3)
  {
    v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
LABEL_4:
    v12 = v7;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v11);
  v7 = v12;
LABEL_6:
  *((_QWORD *)this + 24) = &off_24BEFD7B0;
  if (!v7)
  {
LABEL_9:
    *((_QWORD *)this + 28) = v7;
    goto LABEL_11;
  }
  if (v7 != v11)
  {
    v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v7 + 16))(v7);
    goto LABEL_9;
  }
  *((_QWORD *)this + 28) = (char *)this + 200;
  (*(void (**)(_QWORD *))(v11[0] + 24))(v11);
LABEL_11:
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 29) = (char *)this + 240;
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_15;
  }
  if (v12)
  {
    v9 = 5;
LABEL_15:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  *((_BYTE *)this + 256) = a4;
  *((_QWORD *)this + 34) = a2;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  HVF::PartTransformRenderer::setRenderPart(this, a2);
  return this;
}

void sub_206289CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  HVF::PartTransform *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == &a10)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  HVF::PartTransform::~PartTransform(v13);
  _Unwind_Resume(a1);
}

void HVF::PartTransformRenderer::setRenderPart(HVF::PartTransformRenderer *this, unint64_t a2)
{
  char *v3;
  _QWORD *v4;
  char *v5;
  unint64_t v6;
  BOOL v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  __int128 *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  _BYTE *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char *v48;
  unint64_t v49;
  double *v50;
  double *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  __int128 *v64;
  uint64_t v65;
  __int128 *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  float64x2_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 vars0;
  __int128 v82;
  __int128 v83;
  float64x2_t v84;

  v3 = (char *)this + 240;
  v4 = (_QWORD *)*((_QWORD *)this + 30);
  *((_QWORD *)this + 34) = a2;
  if (!v4)
    goto LABEL_12;
  v5 = (char *)this + 240;
  do
  {
    v6 = v4[4];
    v7 = v6 >= a2;
    if (v6 >= a2)
      v8 = v4;
    else
      v8 = v4 + 1;
    if (v7)
      v5 = (char *)v4;
    v4 = (_QWORD *)*v8;
  }
  while (*v8);
  if (v5 != v3 && *((_QWORD *)v5 + 4) <= a2)
  {
    v19 = *((unsigned int *)v5 + 80);
    if ((_DWORD)v19 == -1)
      sub_2062892C8();
    *(_QWORD *)&v79 = (char *)&v78 + 7;
    v10 = ((uint64_t (*)(__int128 *, char *))*(&off_24BEFE138 + v19))(&v79, v5 + 40);
  }
  else
  {
LABEL_12:
    *(_QWORD *)&v79 = a2;
    v9 = *((_QWORD *)this + 28);
    if (!v9)
      sub_2062892FC();
    v10 = (*(uint64_t (**)(uint64_t, __int128 *, char *))(*(_QWORD *)v9 + 48))(v9, &v79, v3 - 48);
  }
  *((_QWORD *)this + 33) = v10;
  if (v10)
  {
    v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 72))(v10);
    v12 = (_BYTE *)*((_QWORD *)this + 47);
    if (v11 <= (uint64_t)(*((_QWORD *)this + 49) - (_QWORD)v12) >> 3)
      goto LABEL_29;
    if (v11 >> 61)
      sub_206288A90();
    v13 = (_BYTE *)*((_QWORD *)this + 48);
    v14 = 8 * v11;
    v15 = (char *)operator new(8 * v11);
    v16 = v13 - v12;
    v17 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
    v18 = v17;
    if (v13 != v12)
    {
      if ((unint64_t)(v16 - 8) < 0x58)
      {
        v18 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_26:
          v26 = *((_QWORD *)v13 - 1);
          v13 -= 8;
          *((_QWORD *)v18 - 1) = v26;
          v18 -= 8;
        }
        while (v13 != v12);
        goto LABEL_27;
      }
      v18 = &v15[(v13 - v12) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(&v13[-(v16 & 0xFFFFFFFFFFFFFFF8)] - v15) < 0x20)
        goto LABEL_26;
      v20 = v16 >> 3;
      v21 = ((unint64_t)(v16 - 8) >> 3) + 1;
      v22 = &v15[8 * v20 - 16];
      v23 = (__int128 *)(v13 - 16);
      v24 = v21 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v25 = *v23;
        *((_OWORD *)v22 - 1) = *(v23 - 1);
        *(_OWORD *)v22 = v25;
        v22 -= 32;
        v23 -= 2;
        v24 -= 4;
      }
      while (v24);
      v18 = &v17[-8 * (v21 & 0x3FFFFFFFFFFFFFFCLL)];
      v13 -= 8 * (v21 & 0x3FFFFFFFFFFFFFFCLL);
      if (v21 != (v21 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_26;
    }
LABEL_27:
    *((_QWORD *)this + 47) = v18;
    *((_QWORD *)this + 48) = v17;
    *((_QWORD *)this + 49) = &v15[v14];
    if (v12)
      operator delete(v12);
LABEL_29:
    if (*((_BYTE *)this + 256))
    {
      v27 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 48))(*((_QWORD *)this + 33));
      v28 = *((_QWORD *)this + 41);
      v29 = (*((_QWORD *)this + 42) - v28) >> 3;
      if (v27 <= v29)
      {
        if (v27 < v29)
          *((_QWORD *)this + 42) = v28 + 8 * v27;
      }
      else
      {
        sub_206288928((uint64_t)this + 328, v27 - v29);
      }
      v30 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 56))(*((_QWORD *)this + 33));
      v32 = (_BYTE *)*((_QWORD *)this + 44);
      v31 = (char *)*((_QWORD *)this + 45);
      v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - v32) >> 5);
      v34 = v30 - v33;
      if (v30 > v33)
      {
        v35 = *((_QWORD *)this + 46);
        if (0xAAAAAAAAAAAAAAABLL * ((v35 - (uint64_t)v31) >> 5) < v34)
        {
          if (v30 > 0x2AAAAAAAAAAAAAALL)
            sub_206288A90();
          v36 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (uint64_t)v32) >> 5);
          v37 = 2 * v36;
          if (2 * v36 <= v30)
            v37 = v30;
          if (v36 >= 0x155555555555555)
            v38 = 0x2AAAAAAAAAAAAAALL;
          else
            v38 = v37;
          if (v38 > 0x2AAAAAAAAAAAAAALL)
            sub_206288AA4();
          v39 = 96 * v38;
          v40 = (char *)operator new(96 * v38);
          v41 = &v40[32 * ((v31 - v32) >> 5)];
          v42 = &v40[v39];
          bzero(v41, 96 * ((96 * v34 - 96) / 0x60) + 96);
          v43 = &v41[96 * ((96 * v34 - 96) / 0x60) + 96];
          if (v31 != v32)
          {
            do
            {
              v44 = *((_OWORD *)v31 - 5);
              *((_OWORD *)v41 - 6) = *((_OWORD *)v31 - 6);
              *((_OWORD *)v41 - 5) = v44;
              v45 = *((_OWORD *)v31 - 4);
              v46 = *((_OWORD *)v31 - 3);
              v47 = *((_OWORD *)v31 - 1);
              *((_OWORD *)v41 - 2) = *((_OWORD *)v31 - 2);
              *((_OWORD *)v41 - 1) = v47;
              *((_OWORD *)v41 - 4) = v45;
              *((_OWORD *)v41 - 3) = v46;
              v41 -= 96;
              v31 -= 96;
            }
            while (v31 != v32);
            v31 = (char *)*((_QWORD *)this + 44);
          }
          *((_QWORD *)this + 44) = v41;
          *((_QWORD *)this + 45) = v43;
          *((_QWORD *)this + 46) = v42;
          if (v31)
            operator delete(v31);
          goto LABEL_52;
        }
        bzero(*((void **)this + 45), 96 * ((96 * v34 - 96) / 0x60) + 96);
        v48 = &v31[96 * ((96 * v34 - 96) / 0x60) + 96];
        goto LABEL_51;
      }
      if (v30 < v33)
      {
        v48 = &v32[96 * v30];
LABEL_51:
        *((_QWORD *)this + 45) = v48;
      }
    }
LABEL_52:
    v49 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 48))(*((_QWORD *)this + 33));
    v50 = (double *)*((_QWORD *)this + 35);
    v51 = (double *)*((_QWORD *)this + 36);
    v52 = v51 - v50;
    if (v49 <= v52)
    {
      if (v49 < v52)
      {
        v51 = &v50[v49];
        *((_QWORD *)this + 36) = v51;
      }
    }
    else
    {
      sub_206288928((uint64_t)this + 280, v49 - v52);
      v50 = (double *)*((_QWORD *)this + 35);
      v51 = (double *)*((_QWORD *)this + 36);
    }
    vDSP_vclrD(v50, 1, v51 - v50);
    *((_QWORD *)this + 39) = *((_QWORD *)this + 38);
    v53 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 56))(*((_QWORD *)this + 33));
    v54 = v53;
    vars0 = xmmword_253CF8020;
    v82 = unk_253CF8030;
    v83 = xmmword_253CF8040;
    v84 = qword_253CF8050;
    v79 = xmmword_253CF8000;
    v80 = *(_OWORD *)algn_253CF8010;
    v56 = (char *)*((_QWORD *)this + 38);
    v55 = (char *)*((_QWORD *)this + 39);
    v57 = 0xAAAAAAAAAAAAAAABLL * ((v55 - v56) >> 5);
    v58 = v53 - v57;
    if (v53 <= v57)
    {
      if (v53 < v57)
        *((_QWORD *)this + 39) = &v56[96 * v53];
    }
    else
    {
      v59 = *((_QWORD *)this + 40);
      if (0xAAAAAAAAAAAAAAABLL * ((v59 - (uint64_t)v55) >> 5) >= v58)
      {
        v72 = &v55[96 * v58];
        v73 = -32 * ((v55 - v56) >> 5) + 96 * v53;
        do
        {
          v74 = *(_OWORD *)algn_253CF8010;
          *(_OWORD *)v55 = xmmword_253CF8000;
          *((_OWORD *)v55 + 1) = v74;
          v75 = xmmword_253CF8020;
          v76 = unk_253CF8030;
          v77 = qword_253CF8050;
          *((_OWORD *)v55 + 4) = xmmword_253CF8040;
          *((float64x2_t *)v55 + 5) = v77;
          *((_OWORD *)v55 + 2) = v75;
          *((_OWORD *)v55 + 3) = v76;
          v55 += 96;
          v73 -= 96;
        }
        while (v73);
        *((_QWORD *)this + 39) = v72;
      }
      else
      {
        if (v53 > 0x2AAAAAAAAAAAAAALL)
          sub_206288A90();
        v60 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (uint64_t)v56) >> 5);
        v61 = 0x5555555555555556 * ((v59 - (uint64_t)v56) >> 5);
        if (v61 <= v53)
          v61 = v53;
        if (v60 >= 0x155555555555555)
          v62 = 0x2AAAAAAAAAAAAAALL;
        else
          v62 = v61;
        if (v62 > 0x2AAAAAAAAAAAAAALL)
          sub_206288AA4();
        v63 = (char *)operator new(96 * v62);
        v64 = (__int128 *)&v63[32 * ((v55 - v56) >> 5)];
        v65 = 96 * v54 - 32 * ((v55 - v56) >> 5);
        v66 = v64;
        do
        {
          v66[2] = vars0;
          v66[3] = v82;
          v66[4] = v83;
          v66[5] = (__int128)v84;
          v67 = v80;
          *v66 = v79;
          v66[1] = v67;
          v66 += 6;
          v65 -= 96;
        }
        while (v65);
        if (v55 != v56)
        {
          do
          {
            v68 = *((_OWORD *)v55 - 5);
            *(v64 - 6) = *((_OWORD *)v55 - 6);
            *(v64 - 5) = v68;
            v69 = *((_OWORD *)v55 - 4);
            v70 = *((_OWORD *)v55 - 3);
            v71 = *((_OWORD *)v55 - 1);
            *(v64 - 2) = *((_OWORD *)v55 - 2);
            *(v64 - 1) = v71;
            *(v64 - 4) = v69;
            *(v64 - 3) = v70;
            v64 -= 6;
            v55 -= 96;
          }
          while (v55 != v56);
          v55 = (char *)*((_QWORD *)this + 38);
        }
        *((_QWORD *)this + 38) = v64;
        *((_QWORD *)this + 39) = &v63[96 * v54];
        *((_QWORD *)this + 40) = &v63[96 * v62];
        if (v55)
          operator delete(v55);
      }
    }
  }
}

uint64_t sub_20628A348(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(_QWORD *)(a1 + 80) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    *(_QWORD *)(a1 + 56) = v3;
    operator delete(v3);
  }
  v4 = *(void **)(a1 + 24);
  if (v4)
  {
    *(_QWORD *)(a1 + 32) = v4;
    operator delete(v4);
  }
  v5 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_20628A3AC()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628A3C0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDE08;
  result[1] = v3;
  return result;
}

uint64_t sub_20628A3F4(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDE08;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628A410@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  v4 = *a2;
  *a3 = &off_24BEFE0C8;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &off_24BEFE070;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

uint64_t sub_20628A444(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A498()
{
  return &unk_24BEFD710;
}

void sub_20628A4A8()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628A4BC(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFE070;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628A4F4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFE070;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_20628A518(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRK"
                     "NS_13PartTransformEE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$"
                                "_5clEmEUlRKNS_13PartTransformEE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A56C()
{
  return &unk_24BEFD780;
}

void sub_20628A57C()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628A590(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFE0C8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628A5C8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFE0C8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628A5E8@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_20628A608(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A65C()
{
  return &unk_24BEFD790;
}

void sub_20628A66C()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628A680(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDDB0;
  result[1] = v3;
  return result;
}

uint64_t sub_20628A6B4(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDDB0;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628A6D0@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  v4 = *a2;
  *a3 = &off_24BEFE018;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &off_24BEFDFC0;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

uint64_t sub_20628A704(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A758()
{
  return &unk_24BEFD700;
}

void sub_20628A768()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628A77C(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFDFC0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628A7B4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFDFC0;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628A7D4(uint64_t a1, double *a2)
{
  unint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(v4 + 264) + 40))(*(_QWORD *)(v4 + 264)) > v3)
  {
    v6 = *(_QWORD *)(v4 + 280);
    if (v3 < (*(_QWORD *)(v4 + 288) - v6) >> 3)
    {
      result = *a2;
      *(double *)(v6 + 8 * v3) = *a2;
    }
  }
  return result;
}

uint64_t sub_20628A82C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A880()
{
  return &unk_24BEFD760;
}

void sub_20628A890()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628A8A4(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFE018;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628A8DC(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFE018;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628A8FC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  double result;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 264) + 40))(*(_QWORD *)(v2 + 264));
  result = 0.0;
  if (v3 > v1)
  {
    v5 = *(_QWORD *)(v2 + 280);
    if (v1 < (*(_QWORD *)(v2 + 288) - v5) >> 3)
      return *(double *)(v5 + 8 * v1);
  }
  return result;
}

uint64_t sub_20628A948(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628A99C()
{
  return &unk_24BEFD770;
}

void sub_20628A9AC()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628A9C0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDD58;
  result[1] = v3;
  return result;
}

uint64_t sub_20628A9F4(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDD58;
  a2[1] = v2;
  return result;
}

void sub_20628AA10(uint64_t a1, double *a2)
{
  float64x2_t v2;
  float64x2_t v3;
  uint64_t v4;
  float64x2_t *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  __double2 v18;
  double v19;
  double v20;
  float64_t v21;
  float64_t v22;
  double v23;
  float64_t v24;
  double v25;
  float64_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(float64x2_t **)(v4 + 304);
  if (*(float64x2_t **)(v4 + 312) == v5)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v5[1].f64[0];
    v3.f64[0] = v5[3].f64[0];
    if (*a2 == 0.0)
    {
      v6 = (float64x2_t)xmmword_253CF8000;
      v7 = *(float64x2_t *)algn_253CF8010;
      v9 = (float64x2_t)xmmword_253CF8040;
      v8 = qword_253CF8050;
      v10 = (float64x2_t)xmmword_253CF8040;
      v11 = qword_253CF8050;
      v12 = (float64x2_t)xmmword_253CF8020;
      v13 = (float64x2_t)unk_253CF8030;
      v14 = (float64x2_t)xmmword_253CF8020;
      v15 = (float64x2_t)unk_253CF8030;
      v16 = (float64x2_t)xmmword_253CF8000;
      v17 = *(float64x2_t *)algn_253CF8010;
    }
    else
    {
      v29 = v3;
      v30 = v2;
      v18 = __sincos_stret(*a2 * 0.5);
      v15.f64[0] = v18.__cosval;
      v11.f64[0] = v18.__sinval;
      v19 = vmuld_n_f64(0.0, 0.0);
      v20 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v21 = v11.f64[0] * v11.f64[0];
      v22 = v15.f64[0] * v15.f64[0];
      v16.f64[0] = v15.f64[0] * v15.f64[0] - (v11.f64[0] * v11.f64[0] + v20) + v19;
      v17.f64[0] = v20;
      v14.f64[0] = v17.f64[0] + v11.f64[0] * v15.f64[0] + v17.f64[0] + v11.f64[0] * v15.f64[0];
      v23 = vmuld_lane_f64(v18.__cosval, (float64x2_t)0, 1);
      v10.f64[0] = v11.f64[0] * 0.0 - v23 + v11.f64[0] * 0.0 - v23;
      v24 = v17.f64[0] - v11.f64[0] * v15.f64[0] + v17.f64[0] - v11.f64[0] * v15.f64[0];
      v25 = v20 + v15.f64[0] * v15.f64[0] - (v19 + v11.f64[0] * v11.f64[0]);
      v11.f64[0] = vmuld_lane_f64(v18.__sinval, (float64x2_t)0, 1);
      v15.f64[0] = v18.__cosval * 0.0;
      v26 = v11.f64[0] + v15.f64[0] + v11.f64[0] + v15.f64[0];
      v17.f64[0] = v18.__sinval * 0.0 + v23;
      v3 = v29;
      v2 = v30;
      v17.f64[0] = v17.f64[0] + v17.f64[0];
      v15.f64[0] = v11.f64[0] - v15.f64[0] + v11.f64[0] - v15.f64[0];
      v11.f64[0] = v21 + v22 - (v20 + v19);
      v16.f64[1] = v24;
      v14.f64[1] = v25;
      v10.f64[1] = v26;
      v6 = (float64x2_t)xmmword_253CF8000;
      v7 = *(float64x2_t *)algn_253CF8010;
      v12 = (float64x2_t)xmmword_253CF8020;
      v13 = (float64x2_t)unk_253CF8030;
      v9 = (float64x2_t)xmmword_253CF8040;
      v8 = qword_253CF8050;
    }
    v27 = vaddq_f64(v7, v2);
    v28 = vaddq_f64(v13, v3);
    *v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v6.f64[0]), v14, v6, 1), v10, v27.f64[0]);
    v5[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v6), v15, v6, 1), v27, v11);
    v5[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v12.f64[0]), v14, v12, 1), v10, v28.f64[0]);
    v5[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v12), v15, v12, 1), v28, v11);
    v5[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v9.f64[0]), v14, v9, 1), v10, v8.f64[0]);
    v5[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v9), v15, v9, 1), v8, v11);
  }
}

uint64_t sub_20628AB9C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628ABF0()
{
  return &unk_24BEFD6F0;
}

void sub_20628AC00()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628AC14(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDD00;
  result[1] = v3;
  return result;
}

uint64_t sub_20628AC48(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDD00;
  a2[1] = v2;
  return result;
}

double sub_20628AC64(uint64_t a1)
{
  uint64_t v1;
  long double *v2;
  double result;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(long double **)(v1 + 304);
  if (*(long double **)(v1 + 312) != v2)
    return atan2(v2[4], *v2);
  __break(1u);
  return result;
}

uint64_t sub_20628AC84(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628ACD8()
{
  return &unk_24BEFD6E0;
}

void sub_20628ACE8()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628ACFC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDCA8;
  result[1] = v3;
  return result;
}

uint64_t sub_20628AD30(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDCA8;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628AD4C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 8);
  v3 = *(_QWORD *)(v2 + 304);
  if (*(_QWORD *)(v2 + 312) == v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = *a2;
    *(_QWORD *)(v3 + 48) = a2[1];
  }
  return result;
}

uint64_t sub_20628AD74(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628ADC8()
{
  return &unk_24BEFD6D0;
}

void sub_20628ADD8()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628ADEC(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDC50;
  result[1] = v3;
  return result;
}

uint64_t sub_20628AE20(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDC50;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628AE3C(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 8) + 312) == *(_QWORD *)(*(_QWORD *)(result + 8) + 304))
    __break(1u);
  return result;
}

uint64_t sub_20628AE5C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1EmNSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628AEB0()
{
  return &unk_24BEFD6C0;
}

uint64_t HVF::PartTransformRenderer::PartTransformRenderer(uint64_t a1, _QWORD *a2, char a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 32) = &off_24BEFDA98;
  *(_QWORD *)(a1 + 64) = &off_24BEFDAF0;
  *(_QWORD *)(a1 + 96) = &off_24BEFDB48;
  *(_QWORD *)(a1 + 56) = a1 + 32;
  *(_QWORD *)a1 = &off_24BEFDA40;
  *(_QWORD *)(a1 + 8) = a1;
  *(_QWORD *)(a1 + 24) = a1;
  *(_QWORD *)(a1 + 40) = a1;
  *(_QWORD *)(a1 + 72) = a1;
  *(_QWORD *)(a1 + 88) = a1 + 64;
  *(_QWORD *)(a1 + 104) = a1;
  *(_QWORD *)(a1 + 120) = a1 + 96;
  *(_QWORD *)(a1 + 128) = &off_24BEFDBA0;
  *(_QWORD *)(a1 + 136) = a1;
  *(_QWORD *)(a1 + 152) = a1 + 128;
  *(_QWORD *)(a1 + 160) = &off_24BEFDBF8;
  *(_QWORD *)(a1 + 168) = a1;
  *(_QWORD *)(a1 + 184) = a1 + 160;
  v5 = (_QWORD *)a2[3];
  if (!v5)
    goto LABEL_4;
  if (v5 != a2)
  {
    v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 16))(v5);
LABEL_4:
    v10 = v5;
    goto LABEL_6;
  }
  v10 = v9;
  (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, v9);
  v5 = v10;
LABEL_6:
  *(_QWORD *)(a1 + 192) = &off_24BEFD7B0;
  if (!v5)
  {
LABEL_9:
    *(_QWORD *)(a1 + 224) = v5;
    goto LABEL_11;
  }
  if (v5 != v9)
  {
    v5 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 16))(v5);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 224) = a1 + 200;
  (*(void (**)(_QWORD *))(v9[0] + 24))(v9);
LABEL_11:
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 248) = 0;
  *(_QWORD *)(a1 + 232) = a1 + 240;
  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
    goto LABEL_15;
  }
  if (v10)
  {
    v7 = 5;
LABEL_15:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  *(_BYTE *)(a1 + 256) = a3;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  return a1;
}

void sub_20628B08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  HVF::PartTransform *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == &a10)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  HVF::PartTransform::~PartTransform(v13);
  _Unwind_Resume(a1);
}

void sub_20628B0DC()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628B0F0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDBF8;
  result[1] = v3;
  return result;
}

uint64_t sub_20628B124(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDBF8;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628B140@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  v4 = *a2;
  *a3 = &off_24BEFDF68;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &off_24BEFDF10;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

uint64_t sub_20628B174(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_5" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B1C8()
{
  return &unk_24BEFD6B0;
}

void sub_20628B1D8()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628B1EC(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFDF10;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628B224(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFDF10;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_20628B248(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKN"
                     "S_13PartTransformEE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_"
                                "5clEmEUlRKNS_13PartTransformEE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlRKNS_13PartTransformEE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B29C()
{
  return &unk_24BEFD740;
}

void sub_20628B2AC()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628B2C0(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFDF68;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628B2F8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFDF68;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628B318@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_20628B338(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_5clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B38C()
{
  return &unk_24BEFD750;
}

void sub_20628B39C()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628B3B0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDBA0;
  result[1] = v3;
  return result;
}

uint64_t sub_20628B3E4(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDBA0;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628B400@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  v4 = *a2;
  *a3 = &off_24BEFDEB8;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = a3;
  a3[4] = &off_24BEFDE60;
  a3[5] = v3;
  a3[6] = v4;
  a3[7] = a3 + 4;
  return result;
}

uint64_t sub_20628B434(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_4" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B488()
{
  return &unk_24BEFD6A0;
}

void sub_20628B498()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628B4AC(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFDE60;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628B4E4(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFDE60;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628B504(uint64_t a1, double *a2)
{
  unint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(v4 + 264) + 40))(*(_QWORD *)(v4 + 264)) > v3)
  {
    v6 = *(_QWORD *)(v4 + 280);
    if (v3 < (*(_QWORD *)(v4 + 288) - v6) >> 3)
    {
      result = *a2;
      *(double *)(v6 + 8 * v3) = *a2;
    }
  }
  return result;
}

uint64_t sub_20628B55C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlRKdE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B5B0()
{
  return &unk_24BEFD720;
}

void sub_20628B5C0()
{
  JUMPOUT(0x20BCF13ACLL);
}

__n128 sub_20628B5D4(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24BEFDEB8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_20628B60C(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24BEFDEB8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

double sub_20628B62C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  double result;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 264) + 40))(*(_QWORD *)(v2 + 264));
  result = 0.0;
  if (v3 > v1)
  {
    v5 = *(_QWORD *)(v2 + 280);
    if (v1 < (*(_QWORD *)(v2 + 288) - v5) >> 3)
      return *(double *)(v5 + 8 * v1);
  }
  return result;
}

uint64_t sub_20628B678(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_"
    || ((v3 & (unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbENK3$_4clEmEUlvE_" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B6CC()
{
  return &unk_24BEFD730;
}

void sub_20628B6DC()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628B6F0(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDB48;
  result[1] = v3;
  return result;
}

uint64_t sub_20628B724(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDB48;
  a2[1] = v2;
  return result;
}

void sub_20628B740(uint64_t a1, double *a2)
{
  float64x2_t v2;
  float64x2_t v3;
  uint64_t v4;
  float64x2_t *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  __double2 v18;
  double v19;
  double v20;
  float64_t v21;
  float64_t v22;
  double v23;
  float64_t v24;
  double v25;
  float64_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(float64x2_t **)(v4 + 304);
  if (*(float64x2_t **)(v4 + 312) == v5)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v5[1].f64[0];
    v3.f64[0] = v5[3].f64[0];
    if (*a2 == 0.0)
    {
      v6 = (float64x2_t)xmmword_253CF8000;
      v7 = *(float64x2_t *)algn_253CF8010;
      v9 = (float64x2_t)xmmword_253CF8040;
      v8 = qword_253CF8050;
      v10 = (float64x2_t)xmmword_253CF8040;
      v11 = qword_253CF8050;
      v12 = (float64x2_t)xmmword_253CF8020;
      v13 = (float64x2_t)unk_253CF8030;
      v14 = (float64x2_t)xmmword_253CF8020;
      v15 = (float64x2_t)unk_253CF8030;
      v16 = (float64x2_t)xmmword_253CF8000;
      v17 = *(float64x2_t *)algn_253CF8010;
    }
    else
    {
      v29 = v3;
      v30 = v2;
      v18 = __sincos_stret(*a2 * 0.5);
      v15.f64[0] = v18.__cosval;
      v11.f64[0] = v18.__sinval;
      v19 = vmuld_n_f64(0.0, 0.0);
      v20 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v21 = v11.f64[0] * v11.f64[0];
      v22 = v15.f64[0] * v15.f64[0];
      v16.f64[0] = v15.f64[0] * v15.f64[0] - (v11.f64[0] * v11.f64[0] + v20) + v19;
      v17.f64[0] = v20;
      v14.f64[0] = v17.f64[0] + v11.f64[0] * v15.f64[0] + v17.f64[0] + v11.f64[0] * v15.f64[0];
      v23 = vmuld_lane_f64(v18.__cosval, (float64x2_t)0, 1);
      v10.f64[0] = v11.f64[0] * 0.0 - v23 + v11.f64[0] * 0.0 - v23;
      v24 = v17.f64[0] - v11.f64[0] * v15.f64[0] + v17.f64[0] - v11.f64[0] * v15.f64[0];
      v25 = v20 + v15.f64[0] * v15.f64[0] - (v19 + v11.f64[0] * v11.f64[0]);
      v11.f64[0] = vmuld_lane_f64(v18.__sinval, (float64x2_t)0, 1);
      v15.f64[0] = v18.__cosval * 0.0;
      v26 = v11.f64[0] + v15.f64[0] + v11.f64[0] + v15.f64[0];
      v17.f64[0] = v18.__sinval * 0.0 + v23;
      v3 = v29;
      v2 = v30;
      v17.f64[0] = v17.f64[0] + v17.f64[0];
      v15.f64[0] = v11.f64[0] - v15.f64[0] + v11.f64[0] - v15.f64[0];
      v11.f64[0] = v21 + v22 - (v20 + v19);
      v16.f64[1] = v24;
      v14.f64[1] = v25;
      v10.f64[1] = v26;
      v6 = (float64x2_t)xmmword_253CF8000;
      v7 = *(float64x2_t *)algn_253CF8010;
      v12 = (float64x2_t)xmmword_253CF8020;
      v13 = (float64x2_t)unk_253CF8030;
      v9 = (float64x2_t)xmmword_253CF8040;
      v8 = qword_253CF8050;
    }
    v27 = vaddq_f64(v7, v2);
    v28 = vaddq_f64(v13, v3);
    *v5 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v6.f64[0]), v14, v6, 1), v10, v27.f64[0]);
    v5[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v6), v15, v6, 1), v27, v11);
    v5[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v12.f64[0]), v14, v12, 1), v10, v28.f64[0]);
    v5[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v12), v15, v12, 1), v28, v11);
    v5[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v16, v9.f64[0]), v14, v9, 1), v10, v8.f64[0]);
    v5[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v17, v9), v15, v9, 1), v8, v11);
  }
}

uint64_t sub_20628B8CC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628B920()
{
  return &unk_24BEFD690;
}

void sub_20628B930()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628B944(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDAF0;
  result[1] = v3;
  return result;
}

uint64_t sub_20628B978(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDAF0;
  a2[1] = v2;
  return result;
}

double sub_20628B994(uint64_t a1)
{
  uint64_t v1;
  long double *v2;
  double result;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(long double **)(v1 + 304);
  if (*(long double **)(v1 + 312) != v2)
    return atan2(v2[4], *v2);
  __break(1u);
  return result;
}

uint64_t sub_20628B9B4(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628BA08()
{
  return &unk_24BEFD680;
}

void sub_20628BA18()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628BA2C(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDA98;
  result[1] = v3;
  return result;
}

uint64_t sub_20628BA60(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDA98;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628BA7C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 8);
  v3 = *(_QWORD *)(v2 + 304);
  if (*(_QWORD *)(v2 + 312) == v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = *a2;
    *(_QWORD *)(v3 + 48) = a2[1];
  }
  return result;
}

uint64_t sub_20628BAA4(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628BAF8()
{
  return &unk_24BEFD670;
}

void sub_20628BB08()
{
  JUMPOUT(0x20BCF13ACLL);
}

_QWORD *sub_20628BB1C(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24BEFDA40;
  result[1] = v3;
  return result;
}

uint64_t sub_20628BB50(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24BEFDA40;
  a2[1] = v2;
  return result;
}

uint64_t sub_20628BB6C(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 8) + 312) == *(_QWORD *)(*(_QWORD *)(result + 8) + 304))
    __break(1u);
  return result;
}

uint64_t sub_20628BB8C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0"
    || ((v3 & (unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0")
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3HVF21PartTransformRendererC1ENSt3__18functionIFPKNS_4PartEmRNS_9PartCacheEEEEbE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *sub_20628BBE0()
{
  return &unk_24BEFD660;
}

uint64_t HVF::PartTransformRenderer::getPartTranslation(uint64_t this)
{
  if (*(_QWORD *)(this + 312) == *(_QWORD *)(this + 304))
    __break(1u);
  return this;
}

uint64_t HVF::PartTransformRenderer::setPartTranslation(uint64_t this, const CGVector *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 304);
  if (*(_QWORD *)(this + 312) == v2)
  {
    __break(1u);
  }
  else
  {
    *(CGFloat *)(v2 + 16) = a2->dx;
    *(CGFloat *)(v2 + 48) = a2->dy;
  }
  return this;
}

long double HVF::PartTransformRenderer::getPartRotation(HVF::PartTransformRenderer *this)
{
  long double *v1;
  long double result;

  v1 = (long double *)*((_QWORD *)this + 38);
  if (*((long double **)this + 39) != v1)
    return atan2(v1[4], *v1);
  __break(1u);
  return result;
}

void HVF::PartTransformRenderer::setPartRotation(HVF::PartTransformRenderer *this, const double *a2)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t *v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  __double2 v17;
  double v18;
  double v19;
  float64_t v20;
  float64_t v21;
  double v22;
  float64_t v23;
  double v24;
  float64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;

  v4 = (float64x2_t *)*((_QWORD *)this + 38);
  if (*((float64x2_t **)this + 39) == v4)
  {
    __break(1u);
  }
  else
  {
    v2.f64[0] = v4[1].f64[0];
    v3.f64[0] = v4[3].f64[0];
    if (*a2 == 0.0)
    {
      v5 = (float64x2_t)xmmword_253CF8000;
      v6 = *(float64x2_t *)algn_253CF8010;
      v8 = (float64x2_t)xmmword_253CF8040;
      v7 = qword_253CF8050;
      v9 = (float64x2_t)xmmword_253CF8040;
      v10 = qword_253CF8050;
      v11 = (float64x2_t)xmmword_253CF8020;
      v12 = (float64x2_t)unk_253CF8030;
      v13 = (float64x2_t)xmmword_253CF8020;
      v14 = (float64x2_t)unk_253CF8030;
      v15 = (float64x2_t)xmmword_253CF8000;
      v16 = *(float64x2_t *)algn_253CF8010;
    }
    else
    {
      v28 = v3;
      v29 = v2;
      v17 = __sincos_stret(*a2 * 0.5);
      v14.f64[0] = v17.__cosval;
      v10.f64[0] = v17.__sinval;
      v18 = vmuld_n_f64(0.0, 0.0);
      v19 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v20 = v10.f64[0] * v10.f64[0];
      v21 = v14.f64[0] * v14.f64[0];
      v15.f64[0] = v14.f64[0] * v14.f64[0] - (v19 + v10.f64[0] * v10.f64[0]) + v18;
      v16.f64[0] = v19;
      v13.f64[0] = v16.f64[0] + v10.f64[0] * v14.f64[0] + v16.f64[0] + v10.f64[0] * v14.f64[0];
      v22 = vmuld_lane_f64(v17.__cosval, (float64x2_t)0, 1);
      v9.f64[0] = v10.f64[0] * 0.0 - v22 + v10.f64[0] * 0.0 - v22;
      v23 = v16.f64[0] - v10.f64[0] * v14.f64[0] + v16.f64[0] - v10.f64[0] * v14.f64[0];
      v24 = v19 + v14.f64[0] * v14.f64[0] - (v10.f64[0] * v10.f64[0] + v18);
      v10.f64[0] = vmuld_lane_f64(v17.__sinval, (float64x2_t)0, 1);
      v14.f64[0] = v17.__cosval * 0.0;
      v25 = v10.f64[0] + v14.f64[0] + v10.f64[0] + v14.f64[0];
      v16.f64[0] = v17.__sinval * 0.0 + v22;
      v3 = v28;
      v2 = v29;
      v16.f64[0] = v16.f64[0] + v16.f64[0];
      v14.f64[0] = v10.f64[0] - v14.f64[0] + v10.f64[0] - v14.f64[0];
      v10.f64[0] = v20 + v21 - (v18 + v19);
      v15.f64[1] = v23;
      v13.f64[1] = v24;
      v9.f64[1] = v25;
      v5 = (float64x2_t)xmmword_253CF8000;
      v6 = *(float64x2_t *)algn_253CF8010;
      v11 = (float64x2_t)xmmword_253CF8020;
      v12 = (float64x2_t)unk_253CF8030;
      v8 = (float64x2_t)xmmword_253CF8040;
      v7 = qword_253CF8050;
    }
    v26 = vaddq_f64(v6, v2);
    v27 = vaddq_f64(v12, v3);
    *v4 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v5.f64[0]), v13, v5, 1), v9, v26.f64[0]);
    v4[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v5, v16), v14, v5, 1), v26, v10);
    v4[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v11.f64[0]), v13, v11, 1), v9, v27.f64[0]);
    v4[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v11, v16), v14, v11, 1), v27, v10);
    v4[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v8.f64[0]), v13, v8, 1), v9, v7.f64[0]);
    v4[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v8, v16), v14, v8, 1), v7, v10);
  }
}

double HVF::PartTransformRenderer::getPartAxisValueAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  unint64_t v4;
  double result;
  uint64_t v6;

  v4 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 40))(*((_QWORD *)this + 33));
  result = 0.0;
  if (v4 > a2)
  {
    v6 = *((_QWORD *)this + 35);
    if (a2 < (*((_QWORD *)this + 36) - v6) >> 3)
      return *(double *)(v6 + 8 * a2);
  }
  return result;
}

double HVF::PartTransformRenderer::setPartAxisValueAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, double *a3)
{
  double result;
  uint64_t v7;

  if ((*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 33) + 40))(*((_QWORD *)this + 33)) > a2)
  {
    v7 = *((_QWORD *)this + 35);
    if (a2 < (*((_QWORD *)this + 36) - v7) >> 3)
    {
      result = *a3;
      *(double *)(v7 + 8 * a2) = *a3;
    }
  }
  return result;
}

double HVF::PartTransformRenderer::getSubpartTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)this + 39) - v2) >> 5) <= a2)
    return 0.0;
  else
    return *(double *)(v2 + 96 * a2 + 16);
}

CGFloat HVF::PartTransformRenderer::setSubpartTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, const CGVector *a3)
{
  uint64_t v3;
  uint64_t v4;
  CGFloat result;

  v3 = *((_QWORD *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)this + 39) - v3) >> 5) > a2)
  {
    v4 = v3 + 96 * a2;
    *(CGFloat *)(v4 + 16) = a3->dx;
    result = a3->dy;
    *(CGFloat *)(v4 + 48) = result;
  }
  return result;
}

double HVF::PartTransformRenderer::getBlendedTranslationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*((_BYTE *)this + 256))
  {
    v2 = *((_QWORD *)this + 44);
    v3 = *((_QWORD *)this + 45);
  }
  else
  {
    v2 = *((_QWORD *)this + 38);
    v3 = *((_QWORD *)this + 39);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - v2) >> 5) <= a2)
    return 0.0;
  else
    return *(double *)(v2 + 96 * a2 + 16);
}

long double HVF::PartTransformRenderer::getSubpartRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)this + 39) - v2) >> 5) <= a2)
    return 0.0;
  else
    return atan2(*(long double *)(v2 + 96 * a2 + 32), *(long double *)(v2 + 96 * a2));
}

void HVF::PartTransformRenderer::setSubpartRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2, const double *a3)
{
  float64x2_t v3;
  float64x2_t v4;
  uint64_t v5;
  float64x2_t *v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  __double2 v19;
  double v20;
  double v21;
  float64_t v22;
  float64_t v23;
  double v24;
  float64_t v25;
  double v26;
  float64_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;

  v5 = *((_QWORD *)this + 38);
  if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)this + 39) - v5) >> 5) > a2)
  {
    v6 = (float64x2_t *)(v5 + 96 * a2);
    v3.f64[0] = v6[1].f64[0];
    v4.f64[0] = v6[3].f64[0];
    if (*a3 == 0.0)
    {
      v7 = (float64x2_t)xmmword_253CF8000;
      v8 = *(float64x2_t *)algn_253CF8010;
      v10 = (float64x2_t)xmmword_253CF8040;
      v9 = qword_253CF8050;
      v11 = (float64x2_t)xmmword_253CF8040;
      v12 = qword_253CF8050;
      v13 = (float64x2_t)xmmword_253CF8020;
      v14 = (float64x2_t)unk_253CF8030;
      v15 = (float64x2_t)xmmword_253CF8020;
      v16 = (float64x2_t)unk_253CF8030;
      v17 = (float64x2_t)xmmword_253CF8000;
      v18 = *(float64x2_t *)algn_253CF8010;
    }
    else
    {
      v30 = v4;
      v31 = v3;
      v19 = __sincos_stret(*a3 * 0.5);
      v16.f64[0] = v19.__cosval;
      v12.f64[0] = v19.__sinval;
      v20 = vmuld_n_f64(0.0, 0.0);
      v21 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v22 = v12.f64[0] * v12.f64[0];
      v23 = v16.f64[0] * v16.f64[0];
      v17.f64[0] = v16.f64[0] * v16.f64[0] - (v21 + v12.f64[0] * v12.f64[0]) + v20;
      v18.f64[0] = v21;
      v15.f64[0] = v18.f64[0] + v12.f64[0] * v16.f64[0] + v18.f64[0] + v12.f64[0] * v16.f64[0];
      v24 = vmuld_lane_f64(v19.__cosval, (float64x2_t)0, 1);
      v11.f64[0] = v12.f64[0] * 0.0 - v24 + v12.f64[0] * 0.0 - v24;
      v25 = v18.f64[0] - v12.f64[0] * v16.f64[0] + v18.f64[0] - v12.f64[0] * v16.f64[0];
      v26 = v21 + v16.f64[0] * v16.f64[0] - (v12.f64[0] * v12.f64[0] + v20);
      v12.f64[0] = vmuld_lane_f64(v19.__sinval, (float64x2_t)0, 1);
      v16.f64[0] = v19.__cosval * 0.0;
      v27 = v12.f64[0] + v16.f64[0] + v12.f64[0] + v16.f64[0];
      v18.f64[0] = v19.__sinval * 0.0 + v24;
      v4 = v30;
      v3 = v31;
      v18.f64[0] = v18.f64[0] + v18.f64[0];
      v16.f64[0] = v12.f64[0] - v16.f64[0] + v12.f64[0] - v16.f64[0];
      v12.f64[0] = v22 + v23 - (v20 + v21);
      v17.f64[1] = v25;
      v15.f64[1] = v26;
      v11.f64[1] = v27;
      v7 = (float64x2_t)xmmword_253CF8000;
      v8 = *(float64x2_t *)algn_253CF8010;
      v13 = (float64x2_t)xmmword_253CF8020;
      v14 = (float64x2_t)unk_253CF8030;
      v10 = (float64x2_t)xmmword_253CF8040;
      v9 = qword_253CF8050;
    }
    v28 = vaddq_f64(v8, v3);
    v29 = vaddq_f64(v14, v4);
    *v6 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v7.f64[0]), v15, v7, 1), v11, v28.f64[0]);
    v6[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v7, v18), v16, v7, 1), v28, v12);
    v6[2] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v13.f64[0]), v15, v13, 1), v11, v29.f64[0]);
    v6[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v13, v18), v16, v13, 1), v29, v12);
    v6[4] = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v17, v10.f64[0]), v15, v10, 1), v11, v9.f64[0]);
    v6[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v10, v18), v16, v10, 1), v9, v12);
  }
}

long double HVF::PartTransformRenderer::getBlendedRotationAtIndex(HVF::PartTransformRenderer *this, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*((_BYTE *)this + 256))
  {
    v2 = *((_QWORD *)this + 44);
    v3 = *((_QWORD *)this + 45);
  }
  else
  {
    v2 = *((_QWORD *)this + 38);
    v3 = *((_QWORD *)this + 39);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - v2) >> 5) <= a2)
    return 0.0;
  else
    return atan2(*(long double *)(v2 + 96 * a2 + 32), *(long double *)(v2 + 96 * a2));
}

double HVF::PartTransformRenderer::getSubpartAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 35);
  if (a3 + a2 >= (unint64_t)((*((_QWORD *)this + 36) - v3) >> 3))
    return 0.0;
  else
    return *(double *)(v3 + 8 * (a3 + a2));
}

double HVF::PartTransformRenderer::setSubpartAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3, double *a4)
{
  uint64_t v4;
  double result;

  v4 = *((_QWORD *)this + 35);
  if (a3 + a2 < (unint64_t)((*((_QWORD *)this + 36) - v4) >> 3))
  {
    result = *a4;
    *(double *)(v4 + 8 * (a3 + a2)) = *a4;
  }
  return result;
}

double HVF::PartTransformRenderer::getBlendedAxisValueAtIndex(HVF::PartTransformRenderer *this, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3 + a2;
  if (*((_BYTE *)this + 256))
  {
    v4 = *((_QWORD *)this + 41);
    v5 = *((_QWORD *)this + 42);
  }
  else
  {
    v4 = *((_QWORD *)this + 35);
    v5 = *((_QWORD *)this + 36);
  }
  if (v3 >= (v5 - v4) >> 3)
    return 0.0;
  else
    return *(double *)(v4 + 8 * v3);
}

double HVF::PartTransformRenderer::blendedAxisValueBounds(HVF::PartTransformRenderer *this)
{
  uint64_t v1;
  double *v2;
  char *v3;
  double *v4;
  uint64_t v5;
  double *v6;
  BOOL v7;
  double *v8;
  double *v9;
  double v10;
  uint64_t v11;
  double *v12;
  double v13;
  double *v14;
  uint64_t v15;
  double *v16;
  BOOL v17;
  double *v18;
  double v19;
  double v20;
  double result;

  v1 = 328;
  if (!*((_BYTE *)this + 256))
    v1 = 280;
  v2 = *(double **)((char *)this + v1);
  if (*((_BYTE *)this + 256))
    v3 = (char *)this + 328;
  else
    v3 = (char *)this + 280;
  v4 = (double *)*((_QWORD *)v3 + 1);
  v5 = (char *)v4 - (char *)v2;
  v7 = v4 == v2;
  v6 = (double *)((char *)v2 + (((char *)v4 - (char *)v2) & 0xFFFFFFFFFFFFFFF8));
  v7 = v7 || v5 == 8;
  if (v7)
  {
    v8 = v2;
  }
  else
  {
    v9 = v2 + 1;
    v10 = v2[1];
    if (v10 >= *v2)
      v8 = v2;
    else
      v8 = v2 + 1;
    if (v10 < *v2)
      v9 = v2;
    if (v5 != 16)
    {
      v11 = v5 >> 3;
      v12 = v2 + 2;
      v13 = fmin(v10, *v2);
      v14 = v2 + 3;
      v15 = 8 * v11 - 24;
      while (1)
      {
        v18 = v12;
        if (!v15)
          break;
        v20 = *(v14 - 1);
        v19 = *v14;
        if (*v14 >= v20)
        {
          v16 = v2 + 3;
          v17 = v20 < v13;
          v13 = fmin(v20, v13);
          if (v17)
            v8 = v14 - 1;
          if (v19 >= *v9)
            v9 = v16;
        }
        else
        {
          v13 = fmin(v19, *v8);
          if (v19 < *v8)
            v8 = v14;
          if (v20 >= *v9)
            v9 = v14 - 1;
        }
        v12 += 2;
        v14 += 2;
        v15 -= 16;
        v2 = v18;
        if (v15 == -8)
          goto LABEL_33;
      }
      if (*(v14 - 1) < *v8)
        v8 = v14 - 1;
    }
  }
LABEL_33:
  result = 0.0;
  if (v8 != v6)
    return *v8;
  return result;
}

uint64_t HVF::PartTransformRenderer::partIndexAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  char *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char *v16;

  v4 = (char *)this + 240;
  v5 = (_QWORD *)*((_QWORD *)this + 30);
  if (!v5)
    goto LABEL_12;
  v6 = (char *)this + 240;
  do
  {
    v7 = v5[4];
    v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (char *)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((_QWORD *)v6 + 4) <= (unint64_t)a2)
  {
    v14 = *((unsigned int *)v6 + 80);
    if ((_DWORD)v14 == -1)
      sub_2062892C8();
    v16 = &v15;
    v11 = ((uint64_t (*)(char **, char *))*(&off_24BEFE138 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    v16 = a2;
    v10 = *((_QWORD *)this + 28);
    if (!v10)
      sub_2062892FC();
    v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(_QWORD *)v10 + 48))(v10, &v16, v4 - 48);
  }
  v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) && *(_QWORD *)(v12 + 64) > a3)
    return *(unsigned int *)(*(_QWORD *)(v12 + 56) + 8 * a3);
  else
    return 0;
}

uint64_t HVF::PartTransformRenderer::nestixAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  char *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char *v16;

  v4 = (char *)this + 240;
  v5 = (_QWORD *)*((_QWORD *)this + 30);
  if (!v5)
    goto LABEL_12;
  v6 = (char *)this + 240;
  do
  {
    v7 = v5[4];
    v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (char *)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((_QWORD *)v6 + 4) <= (unint64_t)a2)
  {
    v14 = *((unsigned int *)v6 + 80);
    if ((_DWORD)v14 == -1)
      sub_2062892C8();
    v16 = &v15;
    v11 = ((uint64_t (*)(char **, char *))*(&off_24BEFE138 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    v16 = a2;
    v10 = *((_QWORD *)this + 28);
    if (!v10)
      sub_2062892FC();
    v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(_QWORD *)v10 + 48))(v10, &v16, v4 - 48);
  }
  v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) && *(_QWORD *)(v12 + 64) > a3)
    return *(unsigned __int16 *)(*(_QWORD *)(v12 + 56) + 8 * a3 + 4) + 1;
  else
    return 0;
}

uint64_t HVF::PartTransformRenderer::treeAxixAtSubpartIndex(HVF::PartTransformRenderer *this, char *a2, unint64_t a3)
{
  char *v4;
  _QWORD *v5;
  char *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char *v16;

  v4 = (char *)this + 240;
  v5 = (_QWORD *)*((_QWORD *)this + 30);
  if (!v5)
    goto LABEL_12;
  v6 = (char *)this + 240;
  do
  {
    v7 = v5[4];
    v8 = v7 >= (unint64_t)a2;
    if (v7 >= (unint64_t)a2)
      v9 = v5;
    else
      v9 = v5 + 1;
    if (v8)
      v6 = (char *)v5;
    v5 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != v4 && *((_QWORD *)v6 + 4) <= (unint64_t)a2)
  {
    v14 = *((unsigned int *)v6 + 80);
    if ((_DWORD)v14 == -1)
      sub_2062892C8();
    v16 = &v15;
    v11 = ((uint64_t (*)(char **, char *))*(&off_24BEFE138 + v14))(&v16, v6 + 40);
  }
  else
  {
LABEL_12:
    v16 = a2;
    v10 = *((_QWORD *)this + 28);
    if (!v10)
      sub_2062892FC();
    v11 = (*(uint64_t (**)(uint64_t, char **, char *))(*(_QWORD *)v10 + 48))(v10, &v16, v4 - 48);
  }
  v12 = v11;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) && *(_QWORD *)(v12 + 64) > a3)
    return *(_DWORD *)(v12 + 32) + *(unsigned __int16 *)(*(_QWORD *)(v12 + 56) + 8 * a3 + 6);
  else
    return 0;
}

uint64_t HVF::PartTransformRenderer::renderToContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  void **v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  _QWORD v17[4];
  uint8_t buf[8];
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  if (!*(_QWORD *)(a1 + 264))
    return 0;
  if (os_signpost_enabled(0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_206287000, 0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "renderPart", "", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 280);
  v5 = (*(_QWORD *)(a1 + 288) - v4) >> 3;
  if (*(_BYTE *)(a1 + 256))
  {
    cblas_dcopy_NEWLAPACK_ILP64();
    v6 = *(_BYTE **)(a1 + 304);
    v7 = *(_BYTE **)(a1 + 312);
    v8 = (void **)(a1 + 352);
    if (v7 != v6)
      memmove(*v8, v6, v7 - v6);
    v4 = *(_QWORD *)(a1 + 328);
    v5 = (*(_QWORD *)(a1 + 336) - v4) >> 3;
    v9 = (_QWORD *)(a1 + 360);
  }
  else
  {
    v8 = (void **)(a1 + 304);
    v9 = (_QWORD *)(a1 + 312);
  }
  v11 = *v8;
  v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v9 - (_QWORD)*v8) >> 5);
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v11;
  v17[3] = v12;
  v14 = *(_QWORD **)(a1 + 264);
  v13 = *(_QWORD *)(a1 + 272);
  v20 = 0u;
  v21 = 0u;
  *(_QWORD *)buf = v13;
  v19 = 0;
  v15 = (*(uint64_t (**)(uint64_t, _QWORD, uint8_t *))(a2 + 16))(a2, 0, buf);
  if (v15 != 2)
  {
    if (v15 || ((*(uint64_t (**)(_QWORD *))(*v14 + 32))(v14) & 1) != 0)
      goto LABEL_15;
    if ((*(unsigned int (**)(_QWORD *))(*v14 + 16))(v14))
    {
      if ((HVF::PartTransformRenderer::renderComposite(a1, v14, v17, a2) & 1) != 0)
      {
LABEL_15:
        (*(void (**)(uint64_t, uint64_t, uint8_t *))(a2 + 16))(a2, 8, buf);
        v10 = 1;
        goto LABEL_18;
      }
    }
    else if (HVF::PartTransformRenderer::renderShape((_QWORD *)a1, v14, (uint64_t)v17, a2))
    {
      goto LABEL_15;
    }
  }
  v10 = 0;
LABEL_18:
  if (os_signpost_enabled(0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_206287000, 0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "renderPart", "", buf, 2u);
  }
  return v10;
}

uint64_t HVF::PartTransformRenderer::renderComposite(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unsigned int *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  float64x2_t *v35;
  float64x2_t *v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  int v50;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD v54[4];
  _QWORD v55[2];
  __int128 v56;
  __int128 v57;

  v7 = (_QWORD *)a1;
  HVF::PartTransformRenderer::blendComposite(a1, (uint64_t)a2, (uint64_t)a3);
  if (a2[8])
  {
    v8 = 0;
    v9 = v7 + 24;
    v10 = v7 + 30;
    v53 = v7 + 30;
    v52 = v7 + 24;
    do
    {
      v11 = (unsigned int *)(a2[7] + 8 * v8);
      v12 = *v11;
      v13 = *((unsigned __int16 *)v11 + 2);
      v14 = *((unsigned __int16 *)v11 + 3);
      v15 = (_QWORD *)*v10;
      if (!*v10)
        goto LABEL_17;
      v16 = v10;
      do
      {
        v17 = v15[4];
        v18 = v17 >= v12;
        if (v17 >= v12)
          v19 = v15;
        else
          v19 = v15 + 1;
        if (v18)
          v16 = v15;
        v15 = (_QWORD *)*v19;
      }
      while (*v19);
      if (v16 != v10 && v16[4] <= v12)
      {
        v31 = *((unsigned int *)v16 + 80);
        if ((_DWORD)v31 == -1)
          sub_2062892C8();
        v55[0] = v54;
        v21 = (_QWORD *)((uint64_t (*)(_QWORD *, _QWORD *))*(&off_24BEFE138 + v31))(v55, v16 + 5);
        if (!v21)
          return 0;
      }
      else
      {
LABEL_17:
        v55[0] = v12;
        v20 = v7[28];
        if (!v20)
          goto LABEL_50;
        v21 = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)v20 + 48))(v20, v55, v9);
        if (!v21)
          return 0;
      }
      if (((*(uint64_t (**)(_QWORD *))(*v21 + 32))(v21) & 1) == 0)
      {
        v22 = (*(uint64_t (**)(_QWORD *))(*a2 + 40))(a2);
        if (a3[3] <= v13)
          return 0;
        v23 = v7;
        v24 = a4;
        v25 = v13 + 1;
        v26 = v22 + v14;
        v27 = (*(uint64_t (**)(_QWORD *))(*v21 + 56))(v21) + v13 + 1 > a3[3] || v26 > a3[1];
        if (v27 || (*(uint64_t (**)(_QWORD *))(*v21 + 48))(v21) + v26 > a3[1])
          return 0;
        v28 = (*(uint64_t (**)(_QWORD *))(*v21 + 48))(v21);
        v29 = a3[1];
        v18 = v29 >= v26;
        v30 = v29 - v26;
        if (!v18)
          goto LABEL_49;
        if (v28 == -1)
        {
          v28 = v30;
        }
        else if (v30 < v28)
        {
          goto LABEL_49;
        }
        v54[0] = *a3 + 8 * v26;
        v54[1] = v28;
        v32 = (*(uint64_t (**)(_QWORD *))(*v21 + 56))(v21);
        v33 = a3[3];
        if (v33 <= v13)
          goto LABEL_49;
        v34 = v33 - v25;
        if (v32 == -1)
        {
          v32 = v34;
        }
        else if (v34 < v32)
        {
          goto LABEL_49;
        }
        v35 = (float64x2_t *)a3[2];
        v36 = &v35[6 * v25];
        v54[2] = v36;
        v54[3] = v32;
        if (!v32)
        {
LABEL_49:
          __break(1u);
LABEL_50:
          sub_2062892FC();
        }
        v37 = v36[1];
        v39 = v36[2];
        v38 = v36[3];
        v40 = v36[4];
        v41 = v36[5];
        v42 = v35[1];
        v44 = v35[2];
        v43 = v35[3];
        v46 = v35[4];
        v45 = v35[5];
        v47 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(*v35, v37), v38, *v35, 1), v42, v41);
        v48 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v44.f64[0]), v39, v44, 1), v40, v43.f64[0]);
        v49 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v46.f64[0]), v39, v46, 1), v40, v45.f64[0]);
        *v36 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*v36, v35->f64[0]), v39, *v35, 1), v40, v42.f64[0]);
        v36[1] = v47;
        v36[2] = v48;
        v36[3] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v44, v37), v38, v44, 1), v43, v41);
        v36[4] = v49;
        v36[5] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v46, v37), v38, v46, 1), v45, v41);
        v56 = 0u;
        v57 = 0u;
        v55[0] = v12;
        v55[1] = 0;
        a4 = v24;
        v50 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD *))(v24 + 16))(v24, 0, v55);
        if (v50)
        {
          v7 = v23;
          v9 = v52;
          if (v50 == 2)
            return 0;
        }
        else
        {
          v7 = v23;
          v9 = v52;
          if (((*(uint64_t (**)(_QWORD *))(*v21 + 32))(v21) & 1) == 0)
          {
            if ((*(unsigned int (**)(_QWORD *))(*v21 + 16))(v21))
            {
              if ((HVF::PartTransformRenderer::renderComposite(v7, v21, v54, a4) & 1) == 0)
                return 0;
            }
            else if (!HVF::PartTransformRenderer::renderShape(v7, v21, (uint64_t)v54, a4))
            {
              return 0;
            }
          }
        }
        (*(void (**)(uint64_t, uint64_t, _QWORD *))(a4 + 16))(a4, 8, v55);
      }
      ++v8;
      v10 = v53;
    }
    while (v8 < a2[8]);
  }
  return 1;
}

BOOL HVF::PartTransformRenderer::renderShape(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  _WORD *v9;
  __int128 *v10;
  _WORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  unsigned int v16;
  unint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;

  HVF::PartTransformRenderer::blendShape(a1, a2, a3);
  v7 = a2[7];
  if (v7)
  {
    v8 = 0;
    v9 = (_WORD *)a2[6];
    v10 = (__int128 *)a1[50];
    v11 = v9;
    while (1)
    {
      v12 = (unsigned __int16)*v11;
      if (v12 > 2)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 1, 0) == 2)
          return 0;
        v13 = *(_QWORD *)v10;
        v14 = *((_QWORD *)v10 + 1);
        *(_QWORD *)&v21 = *(_QWORD *)v10;
        *((_QWORD *)&v21 + 1) = v14;
        v8 = (*(uint64_t (**)(uint64_t, uint64_t, __int128 *))(a4 + 16))(a4, 2, &v21);
        v15 = v10 + 1;
        v16 = (unsigned __int16)*v11;
        if (v16 >= 2 && v8 != 2)
        {
          v18 = 2;
          do
          {
            v21 = *v15;
            v22 = v15[1];
            if (!v8)
            {
              v8 = (*(uint64_t (**)(uint64_t, uint64_t, __int128 *))(a4 + 16))(a4, 4, &v21);
              LOWORD(v16) = *v11;
            }
            v15 += 2;
            if (v18 >= (unsigned __int16)v16)
              break;
            ++v18;
          }
          while (v8 != 2);
          v10 = v15 - 1;
        }
        v19 = *((_QWORD *)v10 + 3);
        *(_QWORD *)&v21 = *(_QWORD *)v15;
        *((_QWORD *)&v21 + 1) = v19;
        *(_QWORD *)&v22 = v13;
        *((_QWORD *)&v22 + 1) = v14;
        if (!v8)
        {
          v8 = (*(uint64_t (**)(uint64_t, uint64_t, __int128 *))(a4 + 16))(a4, 4, &v21);
          if (!v8)
            v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 6, 0);
        }
        if (v8 == 2)
          return v8 != 2;
        v10 += 2;
        v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 7, 0);
        v9 = (_WORD *)a2[6];
        v7 = a2[7];
      }
      else
      {
        v10 += 2 * v12;
      }
      if (++v11 == &v9[v7] || v8 == 2)
        return v8 != 2;
    }
  }
  v8 = 0;
  return v8 != 2;
}

void HVF::PartTransformRenderer::blendShape(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  double *v7;
  unint64_t v8;
  double *v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unsigned __int8 *v17;
  float64x2_t *v18;
  unsigned __int8 *v19;
  unsigned int v20;
  double *v21;
  double *v22;
  int64x2_t *v23;
  int64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  unsigned __int8 *v28[2];
  float64x2_t *v29[2];

  v6 = *(_QWORD *)(a3 + 8);
  v7 = (double *)a1[47];
  v8 = (uint64_t)(a1[48] - (_QWORD)v7) >> 3;
  if (2 * v6 <= v8)
  {
    if (2 * v6 < v8)
      a1[48] = &v7[2 * v6];
  }
  else
  {
    sub_206288928((uint64_t)(a1 + 47), 2 * v6 - v8);
    v7 = (double *)a1[47];
    v6 = *(_QWORD *)(a3 + 8);
  }
  if (v6)
  {
    v9 = *(double **)a3;
    v10 = 8 * v6;
    do
    {
      if (*v9 >= 0.0)
      {
        *v7 = 0.0;
        v11 = *v9;
      }
      else
      {
        *v7 = -*v9;
        v11 = 0.0;
      }
      v7[1] = v11;
      v7 += 2;
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  v12 = a2[11];
  v13 = a1[50];
  v14 = (a1[51] - v13) >> 3;
  if (v12 <= v14)
  {
    if (v12 < v14)
      a1[51] = v13 + 8 * v12;
  }
  else
  {
    sub_206288928((uint64_t)(a1 + 50), v12 - v14);
  }
  cblas_dcopy_NEWLAPACK_ILP64();
  v15 = cblas_dgemv_NEWLAPACK_ILP64();
  if (a2[7])
  {
    v16 = (unsigned __int16 *)a2[6];
    v17 = (unsigned __int8 *)a2[8];
    v18 = (float64x2_t *)a1[50];
    do
    {
      v19 = (unsigned __int8 *)*v16;
      v29[0] = v18;
      v29[1] = (float64x2_t *)(4 * (_QWORD)v19);
      v28[0] = v17;
      v28[1] = v19;
      HVF::PartTransformRenderer::adjustShapePoints(v15, v29, v28);
      v20 = *v16++;
      v18 += 2 * (_QWORD)v19;
      v17 += v20;
    }
    while (v16 != (unsigned __int16 *)(a2[6] + 2 * a2[7]));
  }
  if (*(_QWORD *)(a3 + 24))
  {
    v21 = (double *)a1[50];
    v22 = (double *)a1[51];
    if (v21 != v22)
    {
      v23 = *(int64x2_t **)(a3 + 16);
      v24 = v23[2];
      v25 = (float64x2_t)vzip1q_s64(*v23, v24);
      v26 = (float64x2_t)vzip2q_s64(*v23, v24);
      v27 = (float64x2_t)vzip1q_s64(v23[1], v23[3]);
      *(_QWORD *)&v25.f64[1] = vextq_s8((int8x16_t)v25, (int8x16_t)v25, 8uLL).u64[0];
      *(_QWORD *)&v26.f64[1] = vextq_s8((int8x16_t)v26, (int8x16_t)v26, 8uLL).u64[0];
      *(_QWORD *)&v27.f64[1] = vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL).u64[0];
      do
      {
        *(float64x2_t *)v21 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v25, *v21), v26, v21[1]), v27);
        v21 += 2;
      }
      while (v21 != v22);
    }
  }
  else
  {
    __break(1u);
  }
}

void HVF::PartTransformRenderer::adjustShapePoints(uint64_t a1, float64x2_t **a2, unsigned __int8 **a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unint64_t v5;
  unint64_t v6;
  float64x2_t *v7;
  _BYTE *v8;
  float64x2_t v9;
  float64x2_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  float64x2_t *v14;
  float64x2_t v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  double v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  _BYTE *v38;
  float64x2_t *v39;
  uint64_t v40;
  double v41;
  float64x2_t v42;
  int v43;
  float64x2_t v44;
  double v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  float64x2_t *v49;
  float64x2_t v50;
  double v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  double v56;
  double v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  float64x2_t v65;
  double v66;
  double v67;
  double v68;

  v3 = a3[1];
  if (!v3)
    return;
  v4 = v3 - 1;
  v5 = (unint64_t)a2[1];
  v6 = (4 * (_QWORD)(v3 - 1)) | 2;
  if (v5 <= v6 || v5 <= ((4 * (_QWORD)v4) | 3uLL))
    goto LABEL_71;
  v7 = *a2;
  v8 = *a3;
  v9 = *(float64x2_t *)((char *)*a2 + 8 * v6);
  v10 = (*a2)[1];
  v11 = **a3;
  if (!**a3)
  {
    v18 = 1.0;
    if (v7->f64[0] <= 1.0)
      v18 = v7->f64[0];
    if (v7->f64[0] >= 0.0)
      v19 = v18;
    else
      v19 = 0.0;
    v9 = vmlaq_n_f64(v9, vsubq_f64(v10, v9), v19);
    goto LABEL_23;
  }
  if (v11 == 2)
  {
    v20 = vpmaxq_f64(vabdq_f64(v10, v9));
    if (v20 != 0.0)
    {
      v21 = vsubq_f64(v10, v9);
      v22 = vdivq_f64(v21, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v20, 0));
      v23 = vmulq_n_f64(v22, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v22, v22))));
      v24 = vaddvq_f64(vmulq_f64(vsubq_f64(*v7, v9), v23));
      v25 = fmin(sqrt(vaddvq_f64(vmulq_f64(v21, v21))), v24);
      if (v24 < 0.0)
        v25 = 0.0;
      v9 = vmlaq_n_f64(v9, v23, v25);
    }
LABEL_23:
    *v7 = v9;
    goto LABEL_24;
  }
  if (v11 == 3)
  {
    v12 = 4 * (v3 != (unsigned __int8 *)1);
    if (v5 > v12 && v5 > (v12 | 1))
    {
      v13 = v12 | 2;
      if (v5 > (v12 | 2) && v5 > (v12 | 3))
      {
        v14 = &v7[2 * (v3 != (unsigned __int8 *)1)];
        v15 = *(float64x2_t *)((char *)v7 + 8 * v13);
        v16 = vpmaxq_f64(vabdq_f64(v15, v9));
        if (v16 == 0.0)
        {
          v17 = v9;
        }
        else
        {
          v26 = vsubq_f64(v15, v9);
          v27 = vdivq_f64(v26, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0));
          v28 = vmulq_n_f64(v27, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v27, v27))));
          v29 = vaddvq_f64(vmulq_f64(v28, vsubq_f64(*v7, v9)));
          v30 = sqrt(vaddvq_f64(vmulq_f64(v26, v26)));
          v31 = fmin(v30, v29);
          v32 = v29 < 0.0;
          v33 = 0.0;
          if (v32)
            v34 = 0.0;
          else
            v34 = v31;
          v35 = vsubq_f64(*v14, v9);
          v36 = v9;
          v9 = vmlaq_n_f64(v9, v28, v34);
          v35.f64[0] = vaddvq_f64(vmulq_f64(v28, v35));
          v37 = fmin(v30, v35.f64[0]);
          if (v35.f64[0] >= 0.0)
            v33 = v37;
          v17 = vmlaq_n_f64(v36, v28, v33);
        }
        *v7 = v9;
        *v14 = v17;
        if (v3 != (unsigned __int8 *)1)
          goto LABEL_33;
        return;
      }
    }
LABEL_71:
    __break(1u);
    return;
  }
LABEL_24:
  if (v3 != (unsigned __int8 *)1)
  {
LABEL_33:
    v38 = v8 + 1;
    v39 = v7 + 2;
    v40 = 8;
    do
    {
      if (v5 <= v40 - 6 || v5 <= v40 - 5 || v5 <= v40 - 2 || v5 <= v40 - 1)
        goto LABEL_71;
      v42 = v39[-1];
      v43 = *v38;
      if (v43 == 3)
      {
        if (v4 == (unsigned __int8 *)1)
          v47 = 0;
        else
          v47 = v40;
        if (v5 <= v47)
          goto LABEL_71;
        if (v5 <= (v47 | 1))
          goto LABEL_71;
        v48 = v47 | 2;
        if (v5 <= (v47 | 2) || v5 <= (v47 | 3))
          goto LABEL_71;
        v49 = (float64x2_t *)((char *)v7 + 8 * v47);
        v50 = *(float64x2_t *)((char *)v7 + 8 * v48);
        v51 = vpmaxq_f64(vabdq_f64(v50, v42));
        if (v51 == 0.0)
        {
          v52 = v39[-1];
        }
        else
        {
          v58 = vsubq_f64(v50, v42);
          v59 = vdivq_f64(v58, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v51, 0));
          v60 = vmulq_n_f64(v59, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v59, v59))));
          v61 = vaddvq_f64(vmulq_f64(v60, vsubq_f64(*v39, v42)));
          v62 = sqrt(vaddvq_f64(vmulq_f64(v58, v58)));
          v63 = fmin(v62, v61);
          if (v61 >= 0.0)
            v64 = v63;
          else
            v64 = 0.0;
          v65 = vsubq_f64(*v49, v42);
          v42 = vmlaq_n_f64(v42, v60, v64);
          v66 = vaddvq_f64(vmulq_f64(v60, v65));
          v67 = fmin(v62, v66);
          if (v66 >= 0.0)
            v68 = v67;
          else
            v68 = 0.0;
          v52 = vmlaq_n_f64(v39[-1], v60, v68);
        }
        *v39 = v42;
        *v49 = v52;
      }
      else
      {
        v44 = v39[1];
        if (v43 == 2)
        {
          v41 = vpmaxq_f64(vabdq_f64(v44, v42));
          if (v41 != 0.0)
          {
            v53 = vsubq_f64(v44, v42);
            v54 = vdivq_f64(v53, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v41, 0));
            v55 = vmulq_n_f64(v54, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v54, v54))));
            v56 = vaddvq_f64(vmulq_f64(vsubq_f64(*v39, v42), v55));
            v57 = fmin(sqrt(vaddvq_f64(vmulq_f64(v53, v53))), v56);
            if (v56 < 0.0)
              v57 = 0.0;
            v42 = vmlaq_n_f64(v42, v55, v57);
          }
        }
        else
        {
          if (*v38)
            goto LABEL_36;
          if (v39->f64[0] <= 1.0)
            v45 = v39->f64[0];
          else
            v45 = 1.0;
          if (v39->f64[0] >= 0.0)
            v46 = v45;
          else
            v46 = 0.0;
          v42 = vmlaq_n_f64(v42, vsubq_f64(v44, v42), v46);
        }
        *v39 = v42;
      }
LABEL_36:
      ++v38;
      v40 += 4;
      v39 += 2;
      --v4;
    }
    while (v4);
  }
}

void HVF::PartTransformRenderer::blendComposite(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  double *v7;
  double **v8;
  double *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 *v21;
  float *v22;
  uint64_t v23;
  unint64_t v24;
  float v25;
  uint64_t v26;
  float *v27;
  unsigned __int16 *v28;
  unsigned __int16 *v29;
  unsigned __int16 *v30;
  double *v31;
  double v32;
  float *v33;
  unsigned __int16 *v34;
  unint64_t v35;
  float v36;
  double v37;
  uint64_t v38;
  _QWORD v39[2];

  v3 = *(unsigned int *)(a2 + 32);
  if (*(_QWORD *)(a3 + 8) < v3)
    goto LABEL_31;
  v7 = *(double **)a3;
  v8 = (double **)(a1 + 376);
  v9 = *(double **)(a1 + 376);
  v10 = (uint64_t)(*(_QWORD *)(a1 + 384) - (_QWORD)v9) >> 3;
  if (2 * v3 <= v10)
  {
    if (2 * v3 < v10)
      *(_QWORD *)(a1 + 384) = &v9[2 * v3];
  }
  else
  {
    sub_206288928(a1 + 376, 2 * v3 - v10);
    v9 = *v8;
  }
  if ((_DWORD)v3)
  {
    v11 = 8 * v3;
    do
    {
      if (*v7 >= 0.0)
      {
        *v9 = 0.0;
        v12 = *v7;
      }
      else
      {
        *v9 = -*v7;
        v12 = 0.0;
      }
      v9[1] = v12;
      v9 += 2;
      ++v7;
      v11 -= 8;
    }
    while (v11);
  }
  v13 = *(unsigned int *)(a2 + 32);
  v14 = *(_QWORD *)(a3 + 8);
  v15 = v14 - v13;
  if (v14 < v13
    || (v16 = (*(_DWORD *)(a2 + 44) - v13), v15 < v16)
    || (v17 = *(_QWORD *)(a3 + 24)) == 0
    || (v18 = (*(_DWORD *)(a2 + 40) - 1), v17 - 1 < v18))
  {
LABEL_31:
    __break(1u);
    return;
  }
  v19 = *(_QWORD *)a3 + 8 * v13;
  v39[0] = *(_QWORD *)(a3 + 16) + 96;
  v39[1] = v18;
  v20 = *(_QWORD *)(a2 + 96);
  if (v20)
  {
    v21 = *(unsigned __int16 **)(a2 + 88);
    v22 = *(float **)(a2 + 120);
    v23 = 2 * v20;
    do
    {
      v24 = *v21;
      if (v24 >= v16)
        goto LABEL_31;
      ++v21;
      v25 = *v22++;
      *(double *)(v19 + 8 * v24) = *(double *)(v19 + 8 * v24) + v25;
      v23 -= 2;
    }
    while (v23);
  }
  v26 = *(_QWORD *)(a2 + 112);
  if (v26)
  {
    v27 = *(float **)(a2 + 136);
    v28 = *(unsigned __int16 **)(a2 + 104);
    v29 = &v28[v26];
    v30 = *(unsigned __int16 **)(a2 + 72);
    v31 = *v8;
    v32 = 0.0;
    v33 = v27;
    v34 = v28;
    do
    {
      if (*v30 == v34 - v28)
      {
        ++v30;
        v37 = *v31++;
        v32 = v37;
        if (v37 == 0.0)
        {
          v38 = *v30;
          v34 = &v28[v38];
          v33 = &v27[v38];
        }
      }
      else
      {
        v35 = *v34;
        if (v35 >= v16)
          goto LABEL_31;
        ++v34;
        v36 = *v33++;
        *(double *)(v19 + 8 * v35) = *(double *)(v19 + 8 * v35) + v32 * v36;
      }
    }
    while (v34 != v29);
  }
  if (*(_QWORD *)(a2 + 192) | *(_QWORD *)(a2 + 256))
    HVF::PartTransformRenderer::blendTransforms(a1, (_QWORD *)a2, v39);
  else
    HVF::PartTransformRenderer::blendTranslations(a1, (_QWORD *)a2, v39);
}

uint64_t HVF::PartTransformRenderer::blendTranslations(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  float32x2_t *v5;
  float32x2_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  float32x2_t *v9;
  float32x2_t *v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  int32x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  unint64_t v33;
  BOOL v34;
  int *v35;
  unsigned int v36;
  float64x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  unsigned int v40;
  float32x2_t v41;
  float32x2_t v42;
  unint64_t v43;
  uint64_t v44;
  int v45;

  v3 = (unsigned __int16 *)a2[19];
  v4 = &v3[a2[20]];
  v5 = (float32x2_t *)a2[21];
  v6 = &v5[a2[22]];
  v7 = (unsigned int *)a2[27];
  v8 = &v7[a2[28]];
  v9 = (float32x2_t *)a2[29];
  v10 = &v9[a2[30]];
  v45 = -1;
  v12 = (float64x2_t)xmmword_253CF8000;
  v11 = *(float64x2_t *)algn_253CF8010;
  v14 = (float64x2_t)xmmword_253CF8020;
  v13 = (float64x2_t)unk_253CF8030;
  v16 = (float64x2_t)xmmword_253CF8040;
  v15 = qword_253CF8050;
  v19 = (float64x2_t)vdupq_lane_s64(xmmword_253CF8040, 0);
  v17 = (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  v20 = (float64x2_t)vdupq_laneq_s64((int64x2_t)xmmword_253CF8040, 1);
  v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&qword_253CF8050.f64[0], 0);
  v18 = vdup_n_s32(0x7FC00000u);
  *(_QWORD *)&v19.f64[1] = vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL).u64[0];
  *(_QWORD *)&v20.f64[1] = vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL).u64[0];
  *(_QWORD *)&v21.f64[1] = vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL).u64[0];
  while (1)
  {
    LODWORD(v33) = 0xFFFF;
    if (v3 != v4 && v5 != v6)
      LODWORD(v33) = *v3;
    v34 = v9 == v10 || v7 == v8;
    v35 = v34 ? &v45 : (int *)v7;
    v36 = *(unsigned __int16 *)v35;
    v33 = v33 >= v36 ? v36 : v33;
    if (a3[1] <= v33)
      return result;
    if (v3 == v4)
    {
      v37 = 0uLL;
      v3 = v4;
    }
    else
    {
      if (v5 != v6)
      {
        v37 = 0uLL;
        if ((_DWORD)v33 != *v3)
          goto LABEL_24;
        v38 = *v5++;
        v39 = v38;
        ++v3;
        goto LABEL_36;
      }
      v37 = 0uLL;
      v5 = v6;
    }
    v39 = (float32x2_t)v18;
    if ((_DWORD)v33 != 0xFFFF)
    {
LABEL_24:
      if (v7 != v8)
        goto LABEL_25;
LABEL_30:
      if ((_DWORD)v33 == 0xFFFF)
      {
        v40 = -1;
        v7 = v8;
        goto LABEL_32;
      }
      v7 = v8;
      goto LABEL_3;
    }
LABEL_36:
    v37 = vcvtq_f64_f32(v39);
    if (v7 == v8)
      goto LABEL_30;
LABEL_25:
    while (v9 != v10)
    {
      v40 = *v7;
      if ((_DWORD)v33 != (unsigned __int16)*v7)
        goto LABEL_3;
      v41 = *v9++;
      v42 = v41;
      ++v7;
LABEL_33:
      v43 = HIWORD(v40);
      v44 = *(_QWORD *)(result + 376);
      if (v43 >= (*(_QWORD *)(result + 384) - v44) >> 3)
      {
        __break(1u);
        return result;
      }
      v37 = vmlaq_n_f64(v37, vcvtq_f64_f32(v42), *(double *)(v44 + 8 * v43));
      if (v7 == v8)
        goto LABEL_30;
    }
    if ((_DWORD)v33 == 0xFFFF)
    {
      v40 = -1;
      v9 = v10;
LABEL_32:
      v42 = (float32x2_t)v18;
      goto LABEL_33;
    }
    v9 = v10;
LABEL_3:
    v22 = *a3 + 96 * v33;
    v23 = *(float64x2_t *)(v22 + 16);
    v25 = *(float64x2_t *)(v22 + 32);
    v24 = *(float64x2_t *)(v22 + 48);
    v26 = *(float64x2_t *)(v22 + 64);
    v27 = *(float64x2_t *)(v22 + 80);
    v28 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v37, 1);
    v29 = vaddq_f64(v11, v37);
    v30 = vaddq_f64(v13, v28);
    v31 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v22, v14.f64[0]), v25, v14, 1), v26, v30.f64[0]);
    v32 = vmlaq_f64(vmulq_f64(v19, *(float64x2_t *)v22), v20, v25);
    *(float64x2_t *)v22 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v22, v12.f64[0]), v25, v12, 1), v26, v29.f64[0]);
    *(float64x2_t *)(v22 + 16) = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v12, v23), v24, v12, 1), v29, v27);
    *(float64x2_t *)(v22 + 32) = v31;
    *(float64x2_t *)(v22 + 48) = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v14, v23), v24, v14, 1), v30, v27);
    *(float64x2_t *)(v22 + 64) = vmlaq_f64(v32, v21, v26);
    *(float64x2_t *)(v22 + 80) = vmlaq_f64(vmlaq_f64(vmulq_f64(v16, v23), v17, v24), v15, v27);
  }
}

void HVF::PartTransformRenderer::blendTransforms(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  float64x2_t v3;
  uint64_t v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  float *v7;
  float *v8;
  unsigned __int16 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  int8x16_t v22;
  float64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  uint64_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  BOOL v43;
  char v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t *v47;
  unsigned int v49;
  int *v50;
  unsigned int v52;
  unint64_t v53;
  float64x2_t v54;
  float *v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64_t v62;
  float64_t v63;
  float64x2_t v64;
  float64_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  __double2 v70;
  double v71;
  float64_t v72;
  double v73;
  float64_t v74;
  double v75;
  _DWORD *v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float *v83;
  int *v84;
  uint64_t *v85;
  float *v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  uint64_t *v99;
  BOOL v100;
  int *v101;
  uint64_t *v102;
  unsigned int v103;
  int *v104;
  unsigned int v105;
  float v106;
  float v107;
  float v108;
  float v109;
  uint64_t v110;
  double v111;
  __double2 v112;
  int v113;
  double v114;
  double v115;
  double v116;
  float64x2_t v117;
  long double v118;
  float64x2_t v119;
  float64_t v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t v123;
  float64_t v124;
  float64x2_t v125;
  float64x2_t v126;
  float64x2_t v127;
  float64x2_t v128;
  float64x2_t v129;
  float64_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  __double2 v136;
  double v137;
  float64_t v138;
  float64_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  float64x2_t v144;
  float64x2_t v145;
  float64x2_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  unsigned __int16 *v154;
  unsigned __int16 *v155;
  _QWORD *v156;
  _DWORD *v157;
  float *v158;
  float *v159;
  unsigned __int16 *v160;
  _DWORD *v161;
  unsigned __int16 *v162;
  float *v163;
  int *v164;
  float *v165;
  uint64_t *v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t v169;
  float64x2_t v170;
  float64_t v172;
  float64_t v173;
  float64x2_t v174;
  float64_t v175;
  float64_t v176;
  float64_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  __int128 v181;
  float64x2_t v182;
  __int128 v183;
  float64x2_t v184;
  __int128 v185;
  double v186;
  double v187;
  double v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  int v195;
  int32x2_t v196;
  uint64_t *v197;
  uint64_t v198;
  float *v199;
  uint64_t v200;
  uint64_t v201;
  int v202;

  v4 = a1;
  v5 = (unsigned __int16 *)a2[23];
  v6 = &v5[a2[24]];
  v7 = (float *)a2[25];
  v8 = &v7[a2[26]];
  v202 = 2143289344;
  v162 = (unsigned __int16 *)a2[19];
  v9 = &v162[a2[20]];
  v161 = (_DWORD *)a2[21];
  v157 = &v161[2 * a2[22]];
  v158 = v8;
  v10 = a2[31] + 4 * a2[32];
  v166 = (uint64_t *)a2[31];
  v197 = v166;
  v198 = v10;
  v11 = a2[33] + 4 * a2[34];
  v165 = (float *)a2[33];
  v199 = v165;
  v200 = v11;
  v201 = 0x7FC00000FFFFFFFFLL;
  v12 = a2[27] + 4 * a2[28];
  v164 = (int *)a2[27];
  v13 = a2[29] + 8 * a2[30];
  v14 = (float64x2_t)xmmword_253CF8000;
  v15 = *(float64x2_t *)algn_253CF8010;
  v16 = (float64x2_t)xmmword_253CF8020;
  v17 = (float64x2_t)unk_253CF8030;
  v18 = (float64x2_t)xmmword_253CF8040;
  v19 = qword_253CF8050;
  v20 = (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL);
  v21 = (float64x2_t)vextq_s8((int8x16_t)v18, (int8x16_t)v18, 8uLL);
  v22 = (int8x16_t)vdupq_lane_s64(xmmword_253CF8040, 0);
  v23 = (float64x2_t)vextq_s8(v22, v22, 8uLL);
  v24 = (int8x16_t)vdupq_laneq_s64((int64x2_t)xmmword_253CF8040, 1);
  v25 = vextq_s8(v24, v24, 8uLL);
  v26 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&qword_253CF8050.f64[0], 0);
  v27 = (float64x2_t)vextq_s8(v26, v26, 8uLL);
  v163 = (float *)a2[29];
  v195 = -1;
  *(_QWORD *)&v28.f64[0] = xmmword_253CF8000;
  *(_QWORD *)&v29.f64[0] = xmmword_253CF8020;
  *(_QWORD *)&v33.f64[0] = xmmword_253CF8040;
  *(_QWORD *)&v30.f64[0] = v22.i64[0];
  *(_QWORD *)&v31.f64[0] = v24.i64[0];
  *(_QWORD *)&v32.f64[0] = v26.i64[0];
  v196 = vdup_n_s32(0x7FC00000u);
  *(_QWORD *)&v28.f64[1] = vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).u64[0];
  v29.f64[1] = v20.f64[0];
  v152 = v29;
  v153 = v28;
  v33.f64[1] = v21.f64[0];
  v30.f64[1] = v23.f64[0];
  v150 = v30;
  v151 = v33;
  *(_QWORD *)&v31.f64[1] = v25.i64[0];
  v32.f64[1] = v27.f64[0];
  v148 = v32;
  v149 = v31;
  *(_QWORD *)&v34.f64[0] = xmmword_253CF8040;
  v34.f64[1] = v21.f64[0];
  v176 = v23.f64[0];
  v177 = *(double *)v22.i64;
  v22.i64[1] = *(_QWORD *)&v23.f64[0];
  v169 = (float64x2_t)v22;
  v170 = v34;
  v174 = (float64x2_t)v25;
  v175 = *(double *)v24.i64;
  v24.i64[1] = v25.i64[0];
  v172 = v27.f64[0];
  v173 = *(double *)v26.i64;
  v26.i64[1] = *(_QWORD *)&v27.f64[0];
  v167 = (float64x2_t)v26;
  v168 = (float64x2_t)v24;
  v155 = v6;
  v156 = a3;
  v154 = v9;
  v184 = *(float64x2_t *)algn_253CF8010;
  v185 = xmmword_253CF8000;
  v182 = (float64x2_t)unk_253CF8030;
  v183 = xmmword_253CF8020;
  v180 = qword_253CF8050;
  v181 = xmmword_253CF8040;
  v178 = v21;
LABEL_3:
  v43 = v5 == v6 || v7 == v158;
  v44 = v43;
  if (v43)
    v45 = 0xFFFF;
  else
    v45 = *v5;
  v46 = 0xFFFF;
  if (v162 != v9 && v161 != v157)
    v46 = *v162;
  v47 = v166;
  if (v165 == (float *)v11 || v166 == (uint64_t *)v10)
    v47 = &v201;
  v49 = *(unsigned __int16 *)v47;
  v50 = v164;
  if (v163 == (float *)v13 || v164 == (int *)v12)
    v50 = &v195;
  v52 = *(unsigned __int16 *)v50;
  if (v46 < v45)
    v45 = v46;
  if (v49 < v45)
    v45 = v49;
  if (v45 >= v52)
    v53 = v52;
  else
    v53 = v45;
  if (a3[1] > v53)
  {
    v54.f64[1] = 0.0;
    if (v5 == v6)
    {
      if ((_DWORD)v53 != 0xFFFF)
      {
        v5 = v6;
        goto LABEL_41;
      }
    }
    else
    {
      if (v7 != v158)
      {
        v55 = v7;
        if ((_DWORD)v53 == *v5)
          goto LABEL_43;
LABEL_41:
        v56 = v14;
        v57 = v15;
        v58 = v16;
        v59 = v17;
        v60 = v18;
        v61 = v19;
        goto LABEL_47;
      }
      if ((_DWORD)v53 != 0xFFFF)
      {
        v7 = v158;
        goto LABEL_41;
      }
    }
    v55 = (float *)&v202;
LABEL_43:
    v62 = v172;
    v54.f64[0] = v173;
    v23.f64[0] = v19.f64[0];
    v63 = v174.f64[0];
    v20.f64[0] = v175;
    v27.f64[0] = v21.f64[0];
    v65 = v176;
    v64.f64[0] = v177;
    v33.f64[0] = v18.f64[0];
    v66 = v16;
    v67 = v17;
    v68 = v14;
    v69 = v15;
    if (*v55 != 0.0)
    {
      v70 = __sincos_stret(*v55 * 0.5);
      v20.f64[0] = v70.__cosval;
      v54.f64[0] = v70.__sinval;
      v21 = v178;
      v19 = v180;
      v18 = (float64x2_t)v181;
      v17 = v182;
      v16 = (float64x2_t)v183;
      v15 = v184;
      v14 = (float64x2_t)v185;
      v23.f64[0] = vmuld_n_f64(0.0, 0.0);
      v71 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
      v27.f64[0] = v54.f64[0] * v54.f64[0];
      v72 = v20.f64[0] * v20.f64[0];
      v68.f64[0] = v20.f64[0] * v20.f64[0] - (v71 + v54.f64[0] * v54.f64[0]) + v23.f64[0];
      v67.f64[0] = v71;
      v66.f64[0] = v67.f64[0] + v54.f64[0] * v20.f64[0] + v67.f64[0] + v54.f64[0] * v20.f64[0];
      v73 = vmuld_lane_f64(v70.__cosval, (float64x2_t)0, 1);
      v64.f64[0] = v54.f64[0] * 0.0 - v73 + v54.f64[0] * 0.0 - v73;
      v74 = v67.f64[0] - v54.f64[0] * v20.f64[0] + v67.f64[0] - v54.f64[0] * v20.f64[0];
      v75 = v71 + v20.f64[0] * v20.f64[0] - (v54.f64[0] * v54.f64[0] + v23.f64[0]);
      v54.f64[0] = vmuld_lane_f64(v70.__sinval, (float64x2_t)0, 1);
      v67.f64[0] = v70.__cosval * 0.0;
      v20.f64[0] = v54.f64[0] + v67.f64[0] + v54.f64[0] + v67.f64[0];
      v69.f64[0] = v70.__sinval * 0.0 + v73 + v70.__sinval * 0.0 + v73;
      v67.f64[0] = v54.f64[0] - v67.f64[0] + v54.f64[0] - v67.f64[0];
      v54.f64[0] = v27.f64[0] + v72 - (v23.f64[0] + v71);
      v68.f64[1] = v74;
      v62 = v54.f64[0];
      v23.f64[0] = v54.f64[0];
      v66.f64[1] = v75;
      v63 = v20.f64[0];
      v27.f64[0] = v20.f64[0];
      v65 = v64.f64[0];
      v33.f64[0] = v64.f64[0];
    }
    v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v68.f64[0]), v152, v68, 1), v151, v69.f64[0]);
    v57 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v68, v15), v17, v68, 1), v69, v19);
    v58 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v66.f64[0]), v152, v66, 1), v151, v67.f64[0]);
    v59 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v66, v15), v17, v66, 1), v67, v19);
    v64.f64[1] = v65;
    v20.f64[1] = v63;
    v54.f64[1] = v62;
    v60 = vmlaq_f64(vmlaq_f64(vmulq_f64(v64, v153), v20, v152), v54, v151);
    v61 = vmlaq_f64(vmlaq_f64(vmulq_f64(v33, v15), v27, v17), v23, v19);
    if ((v44 & 1) == 0)
    {
      ++v5;
      ++v7;
    }
LABEL_47:
    v159 = v7;
    v160 = v5;
    if (v162 == v9)
    {
      if ((_DWORD)v53 == 0xFFFF)
      {
        LODWORD(v54.f64[0]) = 2143289344;
        LODWORD(v20.f64[0]) = 2143289344;
        v162 = v9;
LABEL_58:
        v20.f64[0] = *(float *)v20.f64;
        v77 = vaddq_f64(v20, v15);
        v54.f64[0] = *(float *)v54.f64;
        v78 = vaddq_f64(v17, v54);
        v79 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v16, v57), v59, v16, 1), v78, v61);
        v80 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v56, v16.f64[0]), v58, v16, 1), v60, v78.f64[0]);
        v81 = vmlaq_f64(vmulq_f64(v18, v57), v21, v59);
        v82 = vmlaq_f64(vmlaq_f64(vmulq_f64(v150, v56), v149, v58), v148, v60);
        v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v56, v14.f64[0]), v58, v14, 1), v60, v77.f64[0]);
        v57 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v14, v57), v59, v14, 1), v77, v61);
        v58 = v80;
        v59 = v79;
        v60 = v82;
        v61 = vmlaq_f64(v81, v19, v61);
        goto LABEL_59;
      }
      v162 = v9;
    }
    else if (v161 == v157)
    {
      if ((_DWORD)v53 == 0xFFFF)
      {
        LODWORD(v54.f64[0]) = 2143289344;
        LODWORD(v20.f64[0]) = 2143289344;
        v76 = v157;
        goto LABEL_57;
      }
      v161 = v157;
    }
    else if ((_DWORD)v53 == *v162)
    {
      LODWORD(v20.f64[0]) = *v161;
      LODWORD(v54.f64[0]) = v161[1];
      v76 = v161 + 2;
      ++v162;
LABEL_57:
      v161 = v76;
      goto LABEL_58;
    }
LABEL_59:
    v83 = v163;
    v84 = v164;
    v86 = v165;
    v85 = v166;
    while (1)
    {
      if (v86 == (float *)v11 || v85 == (uint64_t *)v10)
        v99 = &v201;
      else
        v99 = v85;
      if ((_DWORD)v53 != *(unsigned __int16 *)v99)
      {
        v100 = v83 == (float *)v13 || v84 == (int *)v12;
        v101 = v100 ? &v195 : v84;
        if ((_DWORD)v53 != *(unsigned __int16 *)v101)
        {
          a3 = v156;
          v35 = *v156 + 96 * v53;
          v36 = *(float64x2_t *)(v35 + 16);
          v38 = *(float64x2_t *)(v35 + 32);
          v37 = *(float64x2_t *)(v35 + 48);
          v23 = *(float64x2_t *)(v35 + 64);
          v39 = *(float64x2_t *)(v35 + 80);
          v40 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v56, v36), v37, v56, 1), v57, v39);
          v27 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v58, v36), v37, v58, 1), v59, v39);
          v41 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v58.f64[0]), v38, v58, 1), v23, v59.f64[0]);
          v42 = vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v60.f64[0]), v38, v60, 1);
          v20 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v60, v36), v37, v60, 1), v61, v39);
          *(float64x2_t *)v35 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)v35, v56.f64[0]), v38, v56, 1), v23, v57.f64[0]);
          *(float64x2_t *)(v35 + 16) = v40;
          *(float64x2_t *)(v35 + 32) = v41;
          *(float64x2_t *)(v35 + 48) = v27;
          *(float64x2_t *)(v35 + 64) = vmlaq_n_f64(v42, v23, v61.f64[0]);
          *(float64x2_t *)(v35 + 80) = v20;
          v7 = v159;
          v5 = v160;
          v9 = v154;
          v6 = v155;
          v21 = v178;
          goto LABEL_3;
        }
      }
      if (v85 == (uint64_t *)v10 || v86 == (float *)v11)
      {
        v103 = 0xFFFF;
        v102 = &v201;
        if ((_DWORD)v53 != 0xFFFF)
        {
          if (v84 == (int *)v12)
            goto LABEL_99;
          goto LABEL_86;
        }
      }
      else
      {
        v102 = v85;
        if ((_DWORD)v53 != *(unsigned __int16 *)v85)
        {
          v103 = 0xFFFF;
          if (v84 == (int *)v12)
            goto LABEL_99;
          goto LABEL_86;
        }
      }
      v103 = *((unsigned __int16 *)v102 + 1);
      if (v84 == (int *)v12)
        goto LABEL_99;
LABEL_86:
      if (v83 != (float *)v13)
      {
        v104 = v84;
        if ((_DWORD)v53 != *(unsigned __int16 *)v84)
          goto LABEL_100;
        goto LABEL_88;
      }
LABEL_99:
      v104 = &v195;
      if ((_DWORD)v53 != 0xFFFF)
      {
LABEL_100:
        if (v85 == (uint64_t *)v10)
          goto LABEL_91;
        goto LABEL_101;
      }
LABEL_88:
      v105 = *((unsigned __int16 *)v104 + 1);
      if (v105 < v103)
        v103 = v105;
      if (v85 == (uint64_t *)v10)
      {
LABEL_91:
        v106 = 0.0;
        if ((_DWORD)v53 == 0xFFFF)
        {
          v106 = NAN;
          if (v103 != 0xFFFF)
            v106 = 0.0;
        }
        v85 = (uint64_t *)v10;
        if (v84 == (int *)v12)
        {
LABEL_95:
          if ((v53 & v103) == 0xFFFF)
            v107 = NAN;
          else
            v107 = 0.0;
          v84 = (int *)v12;
          v108 = v107;
          goto LABEL_119;
        }
        goto LABEL_110;
      }
LABEL_101:
      if (v86 == (float *)v11)
      {
        v106 = NAN;
        if ((v53 & v103) != 0xFFFF)
          v106 = 0.0;
        v86 = (float *)v11;
      }
      else
      {
        v106 = 0.0;
        if ((_DWORD)v53 == (unsigned __int16)*(_DWORD *)v85 && v103 == HIWORD(*(_DWORD *)v85))
        {
          v109 = *v86++;
          v106 = v109;
          v85 = (uint64_t *)((char *)v85 + 4);
          v197 = v85;
          v199 = v86;
          v165 = v86;
          v166 = v85;
          if (v84 == (int *)v12)
            goto LABEL_95;
          goto LABEL_110;
        }
      }
      if (v84 == (int *)v12)
        goto LABEL_95;
LABEL_110:
      if (v83 == (float *)v13)
      {
        if ((v53 & v103) == 0xFFFF)
          v107 = NAN;
        else
          v107 = 0.0;
        v83 = (float *)v13;
        v108 = v107;
      }
      else
      {
        v107 = 0.0;
        if ((_DWORD)v53 == (unsigned __int16)*v84 && v103 == HIWORD(*v84))
        {
          v107 = *v83;
          v108 = v83[1];
          v83 += 2;
          ++v84;
          v163 = v83;
          v164 = v84;
        }
        else
        {
          v108 = 0.0;
        }
      }
LABEL_119:
      v110 = *(_QWORD *)(v4 + 376);
      if (v103 >= (unint64_t)((*(_QWORD *)(v4 + 384) - v110) >> 3))
      {
        __break(1u);
        return;
      }
      v91 = v18;
      v92 = v19;
      v93 = v16;
      v90 = v17;
      v94 = v14;
      v89 = v15;
      if (*(double *)(v110 + 8 * v103) != 0.0)
      {
        v188 = *(double *)(v110 + 8 * v103);
        v189 = v56;
        v190 = v57;
        v191 = v60;
        v192 = v58;
        v193 = v59;
        v194 = v61;
        v111 = remainder(v106, 6.28318531);
        if (fabs(v111) <= 2.22044605e-10)
        {
          v87.f64[1] = v108;
          v87.f64[0] = v107;
          v88 = vmulq_n_f64(v87, v188);
          v16 = (float64x2_t)v183;
          v15 = v184;
          v89 = vaddq_f64(v88, v184);
          v18 = (float64x2_t)v181;
          v17 = v182;
          v90 = vaddq_f64(v182, (float64x2_t)vdupq_laneq_s64((int64x2_t)v88, 1));
          v91 = (float64x2_t)v181;
          v19 = v180;
          v92 = v180;
          v93 = (float64x2_t)v183;
          v14 = (float64x2_t)v185;
          v94 = (float64x2_t)v185;
        }
        else
        {
          v186 = v107;
          v187 = v108;
          v112 = __sincos_stret(v111);
          v113 = -(int)logb(fmax(vabdd_f64(1.0, v112.__cosval), fabs(v112.__sinval)));
          v114 = scalbn(1.0 - v112.__cosval, v113);
          v115 = scalbn(-v112.__sinval, v113);
          v116 = v114 * v114 + v115 * v115;
          v117.f64[0] = scalbn((v114 * v186 + v115 * v187) / v116, v113);
          v179 = v117;
          v118 = scalbn(-(v115 * v186 - v114 * v187) / v116, v113);
          v119 = v179;
          v19 = v180;
          v3.f64[0] = v118;
          v120 = v179.f64[0];
          v123.f64[1] = v3.f64[0];
          v16 = (float64x2_t)v183;
          v15 = v184;
          v121 = vsubq_f64(v184, v123);
          v18 = (float64x2_t)v181;
          v17 = v182;
          v122 = vaddq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)vnegq_f64(v123), 1), v182);
          v124 = v172;
          v123.f64[0] = v173;
          v125.f64[0] = v180.f64[0];
          v33 = v174;
          v126.f64[0] = v175;
          v127.f64[0] = v177;
          v128 = v178;
          v129.f64[0] = v178.f64[0];
          v130 = v176;
          *(_QWORD *)&v131.f64[0] = v181;
          v132 = (float64x2_t)v183;
          v133 = v182;
          v14 = (float64x2_t)v185;
          v134 = (float64x2_t)v185;
          v135 = v184;
          if (v111 * v188 != 0.0)
          {
            v136 = __sincos_stret(v111 * v188 * 0.5);
            v126.f64[0] = v136.__cosval;
            v123.f64[0] = v136.__sinval;
            v119 = v179;
            v19 = v180;
            v128 = v178;
            v18 = (float64x2_t)v181;
            v17 = v182;
            v16 = (float64x2_t)v183;
            v15 = v184;
            v14 = (float64x2_t)v185;
            v125.f64[0] = vmuld_n_f64(0.0, 0.0);
            v137 = vmuld_lane_f64(0.0, (float64x2_t)0, 1);
            v138 = v123.f64[0] * v123.f64[0];
            v139 = v126.f64[0] * v126.f64[0];
            v134.f64[0] = v126.f64[0] * v126.f64[0] - (v123.f64[0] * v123.f64[0] + v137) + v125.f64[0];
            v133.f64[0] = v137;
            v132.f64[0] = v133.f64[0] + v123.f64[0] * v126.f64[0] + v133.f64[0] + v123.f64[0] * v126.f64[0];
            v135.f64[0] = vmuld_lane_f64(v136.__cosval, (float64x2_t)0, 1);
            v127.f64[0] = v123.f64[0] * 0.0 - v135.f64[0] + v123.f64[0] * 0.0 - v135.f64[0];
            v129.f64[0] = v133.f64[0] - v123.f64[0] * v126.f64[0] + v133.f64[0] - v123.f64[0] * v126.f64[0];
            v131.f64[0] = v137 + v126.f64[0] * v126.f64[0] - (v125.f64[0] + v123.f64[0] * v123.f64[0]);
            v123.f64[0] = vmuld_lane_f64(v136.__sinval, (float64x2_t)0, 1);
            v133.f64[0] = v136.__cosval * 0.0;
            v126.f64[0] = v123.f64[0] + v133.f64[0] + v123.f64[0] + v133.f64[0];
            v135.f64[0] = v136.__sinval * 0.0 + v135.f64[0] + v136.__sinval * 0.0 + v135.f64[0];
            v133.f64[0] = v123.f64[0] - v133.f64[0] + v123.f64[0] - v133.f64[0];
            v123.f64[0] = v138 + v139 - (v137 + v125.f64[0]);
            v134.f64[1] = v129.f64[0];
            v124 = v123.f64[0];
            v125.f64[0] = v123.f64[0];
            v132.f64[1] = v131.f64[0];
            v33.f64[0] = v126.f64[0];
            v129.f64[0] = v126.f64[0];
            v130 = v127.f64[0];
            v131.f64[0] = v127.f64[0];
          }
          v140 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v134, v121), v122, v134, 1), v135, v19);
          v141 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v14, v134.f64[0]), v16, v134, 1), v170, v135.f64[0]);
          v142 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v14, v132.f64[0]), v16, v132, 1), v170, v133.f64[0]);
          v143 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v132, v121), v122, v132, 1), v133, v19);
          v127.f64[1] = v130;
          v126.f64[1] = v33.f64[0];
          v123.f64[1] = v124;
          v144 = vmlaq_f64(vmlaq_f64(vmulq_f64(v127, v14), v126, v16), v123, v170);
          v145 = vmlaq_f64(vmlaq_f64(vmulq_f64(v131, v121), v129, v122), v125, v19);
          v146 = vaddq_f64(v119, v15);
          v147 = vaddq_f64(v3, v17);
          v94 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v141, v14.f64[0]), v142, v14, 1), v144, v146.f64[0]);
          v89 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v14), v143, v14, 1), v146, v145);
          v93 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v141, v16.f64[0]), v142, v16, 1), v144, v147.f64[0]);
          v90 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v140, v16), v143, v16, 1), v147, v145);
          v91 = vmlaq_f64(vmlaq_f64(vmulq_f64(v141, v169), v168, v142), v167, v144);
          v92 = vmlaq_f64(vmlaq_f64(vmulq_f64(v140, v18), v128, v143), v19, v145);
          v4 = a1;
        }
        v59 = v193;
        v61 = v194;
        v60 = v191;
        v58 = v192;
        v56 = v189;
        v57 = v190;
      }
      v95 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v56, v89), v90, v56, 1), v57, v92);
      v96 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v58, v89), v90, v58, 1), v59, v92);
      v56 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v56.f64[0]), v93, v56, 1), v91, v57.f64[0]);
      v57 = v95;
      v97 = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v60, v89), v90, v60, 1), v61, v92);
      v58 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v58.f64[0]), v93, v58, 1), v91, v59.f64[0]);
      v59 = v96;
      v60 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v60.f64[0]), v93, v60, 1), v91, v61.f64[0]);
      v61 = v97;
    }
  }
}

BOOL HVF::PartTransformRenderer::render(_QWORD *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  int v10;
  _BOOL8 result;
  _QWORD v12[2];
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12[0] = a2;
  v12[1] = a6;
  v10 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD *))(a5 + 16))(a5, 0, v12);
  if (v10 == 2)
    return 0;
  if (!v10 && ((*(uint64_t (**)(_QWORD *))(*a3 + 32))(a3) & 1) == 0)
  {
    if ((*(unsigned int (**)(_QWORD *))(*a3 + 16))(a3))
    {
      if ((HVF::PartTransformRenderer::renderComposite((uint64_t)a1, a3, a4, a5) & 1) == 0)
        return 0;
    }
    else
    {
      result = HVF::PartTransformRenderer::renderShape(a1, a3, (uint64_t)a4, a5);
      if (!result)
        return result;
    }
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(a5 + 16))(a5, 8, v12);
  return 1;
}

void HVF::PartTransformRenderer::~PartTransformRenderer(HVF::PartTransformRenderer *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HVF::PartTransformRenderer *v8;
  uint64_t v9;
  HVF::PartTransformRenderer *v10;
  uint64_t v11;
  HVF::PartTransformRenderer *v12;
  uint64_t v13;
  HVF::PartTransformRenderer *v14;
  uint64_t v15;
  HVF::PartTransformRenderer *v16;
  uint64_t v17;
  HVF::PartTransformRenderer *v18;
  uint64_t v19;
  HVF::PartTransformRenderer *v20;
  uint64_t v21;

  v2 = (void *)*((_QWORD *)this + 50);
  if (v2)
  {
    *((_QWORD *)this + 51) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 47);
  if (v3)
  {
    *((_QWORD *)this + 48) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 44);
  if (v4)
  {
    *((_QWORD *)this + 45) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 41);
  if (v5)
  {
    *((_QWORD *)this + 42) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 38);
  if (v6)
  {
    *((_QWORD *)this + 39) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 35);
  if (v7)
  {
    *((_QWORD *)this + 36) = v7;
    operator delete(v7);
  }
  *((_QWORD *)this + 24) = &off_24BEFD7B0;
  sub_2062896CC(*((_QWORD **)this + 30));
  v8 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 28);
  if (v8 == (HVF::PartTransformRenderer *)((char *)this + 200))
  {
    v9 = 4;
    v8 = (HVF::PartTransformRenderer *)((char *)this + 200);
  }
  else
  {
    if (!v8)
      goto LABEL_18;
    v9 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
LABEL_18:
  v10 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 23);
  if (v10 == (HVF::PartTransformRenderer *)((char *)this + 160))
  {
    v11 = 4;
    v10 = (HVF::PartTransformRenderer *)((char *)this + 160);
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    v11 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
LABEL_23:
  v12 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 19);
  if (v12 == (HVF::PartTransformRenderer *)((char *)this + 128))
  {
    v13 = 4;
    v12 = (HVF::PartTransformRenderer *)((char *)this + 128);
  }
  else
  {
    if (!v12)
      goto LABEL_28;
    v13 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v12 + 8 * v13))();
LABEL_28:
  v14 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 15);
  if (v14 == (HVF::PartTransformRenderer *)((char *)this + 96))
  {
    v15 = 4;
    v14 = (HVF::PartTransformRenderer *)((char *)this + 96);
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_33:
  v16 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 11);
  if (v16 == (HVF::PartTransformRenderer *)((char *)this + 64))
  {
    v17 = 4;
    v16 = (HVF::PartTransformRenderer *)((char *)this + 64);
  }
  else
  {
    if (!v16)
      goto LABEL_38;
    v17 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
LABEL_38:
  v18 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 7);
  if (v18 == (HVF::PartTransformRenderer *)((char *)this + 32))
  {
    v19 = 4;
    v18 = (HVF::PartTransformRenderer *)((char *)this + 32);
  }
  else
  {
    if (!v18)
      goto LABEL_43;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_43:
  v20 = (HVF::PartTransformRenderer *)*((_QWORD *)this + 3);
  if (v20 == this)
  {
    v21 = 4;
    v20 = this;
  }
  else
  {
    if (!v20)
      return;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
}

void Util::StackMemResource::~StackMemResource(Util::StackMemResource *this)
{
  uint64_t v1;
  _OWORD *v2;

  *(_QWORD *)this = &off_24BEFDA08;
  v2 = (_OWORD *)((char *)this + 16);
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v1, *((_QWORD *)this + 3), 8);
  *v2 = 0u;
  v2[1] = 0u;
}

{
  uint64_t v1;
  _OWORD *v2;

  *(_QWORD *)this = &off_24BEFDA08;
  v2 = (_OWORD *)((char *)this + 16);
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v1, *((_QWORD *)this + 3), 8);
  *v2 = 0u;
  v2[1] = 0u;
  JUMPOUT(0x20BCF13ACLL);
}

{
  uint64_t v1;
  _OWORD *v2;

  *(_QWORD *)this = &off_24BEFDA08;
  v2 = (_OWORD *)((char *)this + 16);
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v1, *((_QWORD *)this + 3), 8);
  *v2 = 0u;
  v2[1] = 0u;
}

char *Util::StackMemResource::do_allocate(size_t *__ptr, size_t __sz, size_t __align)
{
  void **v6;
  void *v7;
  uint64_t v8;
  char *result;

  v6 = (void **)(__ptr + 5);
  if (!__ptr[5])
  {
    v7 = (void *)__ptr[3];
    if (v7)
    {
      v8 = (*(uint64_t (**)(size_t, void *, uint64_t))(*(_QWORD *)__ptr[1] + 16))(__ptr[1], v7, 8);
      __ptr[2] = v8;
      __ptr[4] = __ptr[3];
      __ptr[5] = v8;
    }
  }
  result = (char *)std::align(__align, __sz, v6, __ptr + 4);
  if (!result)
    return (char *)(*(uint64_t (**)(size_t, size_t, size_t))(*(_QWORD *)__ptr[1] + 16))(__ptr[1], __sz, __align);
  *v6 = &result[__sz];
  __ptr[4] -= __sz;
  return result;
}

uint64_t Util::StackMemResource::do_deallocate(uint64_t this, char *a2, uint64_t a3)
{
  unint64_t v3;

  v3 = *(_QWORD *)(this + 16);
  if (v3)
  {
    if (v3 > (unint64_t)a2)
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 8) + 24))(*(_QWORD *)(this + 8));
  }
  else
  {
    v3 = *(_QWORD *)(this + 40) + *(_QWORD *)(this + 32) - *(_QWORD *)(this + 24);
    if (v3 > (unint64_t)a2)
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 8) + 24))(*(_QWORD *)(this + 8));
  }
  if (!a2 || v3 + *(_QWORD *)(this + 24) < (unint64_t)a2)
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 8) + 24))(*(_QWORD *)(this + 8));
  if (&a2[a3] == *(char **)(this + 40))
  {
    *(_QWORD *)(this + 32) += a3;
    *(_QWORD *)(this + 40) = a2;
  }
  return this;
}

BOOL sub_20628E70C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void Util::MemoryResource::~MemoryResource(Util::MemoryResource *this)
{
  JUMPOUT(0x20BCF13ACLL);
}

void *Util::MemoryResource::do_allocate(Util::MemoryResource *this, size_t __sz)
{
  return operator new(__sz);
}

void Util::MemoryResource::do_deallocate(Util::MemoryResource *this, void *__p)
{
  operator delete(__p);
}

uint64_t Util::MemoryResource::defaultResource(Util::MemoryResource *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&qword_2544DCFA0);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&qword_2544DCFA0, &v4, (void (__cdecl *)(void *))sub_20628E7A0);
  }
  return qword_2544DCFA8;
}

_QWORD *sub_20628E7A0()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24BEFD9D0;
  qword_2544DCFA8 = (uint64_t)result;
  return result;
}

void *Util::getAllocStats(Util *this)
{
  return &unk_2544DCFB0;
}

_QWORD *Util::AllocStats::Bucket::printStats(_QWORD *this)
{
  _QWORD *v1;
  FILE **v2;

  if (*this)
  {
    v1 = this;
    v2 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "allocs %6zd hiwater %6zd", *this, this[3]);
    if (v1[1])
      fprintf(*v2, " LEAKED %6zd bytes %6zd", v1[1], v1[2]);
    return (_QWORD *)fputc(10, *v2);
  }
  return this;
}

double Util::AllocStats::Bucket::reset(Util::AllocStats::Bucket *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t Util::AllocStats::bucketFor(uint64_t this, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x3FF)
  {
    if (a3 < 5)
    {
      this += 32 * a3 + 81920;
      return this;
    }
  }
  else if (a3 < 5)
  {
    this += (a3 << 14) + 32 * (a2 >> 1);
    return this;
  }
  __break(1u);
  return this;
}

uint64_t Util::AllocStats::allocate(uint64_t this, unint64_t a2, unint64_t a3)
{
  unsigned int v3;
  BOOL v4;
  int64x2_t *v5;
  unint64_t v6;
  unint64_t v7;

  if (a3 >= 2)
  {
    v3 = 0;
    do
    {
      ++v3;
      v4 = a3 > 3;
      a3 >>= 1;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
  }
  if (a2 <= 0x3FF)
  {
    if (v3 < 5)
    {
      v5 = (int64x2_t *)(this + ((unint64_t)v3 << 14) + 32 * (a2 >> 1));
      goto LABEL_10;
    }
LABEL_13:
    __break(1u);
    return this;
  }
  if (v3 >= 5)
    goto LABEL_13;
  v5 = (int64x2_t *)(this + 32 * v3 + 81920);
LABEL_10:
  *v5 = vaddq_s64(*v5, vdupq_n_s64(1uLL));
  v6 = v5[1].u64[1];
  v7 = v5[1].i64[0] + a2;
  v5[1].i64[0] = v7;
  if (v6 < v7)
    v5[1].i64[1] = v7;
  return this;
}

uint64_t Util::AllocStats::deallocate(uint64_t this, unint64_t a2, unint64_t a3)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;

  if (a3 >= 2)
  {
    v3 = 0;
    do
    {
      ++v3;
      v4 = a3 > 3;
      a3 >>= 1;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
  }
  if (a2 > 0x3FF)
  {
    if (v3 < 5)
    {
      v5 = this + 32 * v3 + 81920;
      goto LABEL_10;
    }
  }
  else if (v3 < 5)
  {
    v5 = this + ((unint64_t)v3 << 14) + 32 * (a2 >> 1);
LABEL_10:
    v6 = *(_QWORD *)(v5 + 16) - a2;
    --*(_QWORD *)(v5 + 8);
    *(_QWORD *)(v5 + 16) = v6;
    return this;
  }
  __break(1u);
  return this;
}

uint64_t Util::AllocStats::printStats(Util::AllocStats *this)
{
  _QWORD *v2;
  _QWORD *v3;
  FILE **v4;
  uint64_t v5;
  Util::AllocStats *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t i;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  char *v15;

  v2 = (_QWORD *)((char *)this + 81920);
  v3 = (_QWORD *)((char *)this + 0x8000);
  v15 = (char *)this + 0x8000;
  v4 = (FILE **)MEMORY[0x24BDAC8D8];
  fwrite("Small sizes:\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v5 = 0;
  v6 = this;
  do
  {
    if (*(_QWORD *)v6)
    {
      fprintf(*v4, "align %2d size %6zd: ", 1, v5);
      if (*(_QWORD *)v6)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *(_QWORD *)v6, *((_QWORD *)v6 + 3));
        if (*((_QWORD *)v6 + 1))
          fprintf(*v4, " LEAKED %6zd bytes %6zd", *((_QWORD *)v6 + 1), *((_QWORD *)v6 + 2));
        fputc(10, *v4);
      }
    }
    v6 = (Util::AllocStats *)((char *)v6 + 32);
    v5 += 2;
  }
  while (v5 != 1024);
  v7 = 0;
  v8 = (_QWORD *)((char *)this + 0x4000);
  do
  {
    if (*v8)
    {
      fprintf(*v4, "align %2d size %6zd: ", 2, v7);
      if (*v8)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v8, v8[3]);
        if (v8[1])
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v8[1], v8[2]);
        fputc(10, *v4);
      }
    }
    v8 += 4;
    v7 += 2;
  }
  while (v7 != 1024);
  for (i = 0; i != 1024; i += 2)
  {
    if (*v3)
    {
      fprintf(*v4, "align %2d size %6zd: ", 4, i);
      if (*v3)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v3, v3[3]);
        if (v3[1])
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v3[1], v3[2]);
        fputc(10, *v4);
      }
    }
    v3 += 4;
  }
  v10 = 0;
  v11 = v15 + 0x4000;
  do
  {
    if (*v11)
    {
      fprintf(*v4, "align %2d size %6zd: ", 8, v10);
      if (*v11)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v11, v11[3]);
        if (v11[1])
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v11[1], v11[2]);
        fputc(10, *v4);
      }
    }
    v11 += 4;
    v10 += 2;
  }
  while (v10 != 1024);
  v12 = 0;
  v13 = v15 + 0x8000;
  do
  {
    if (*v13)
    {
      fprintf(*v4, "align %2d size %6zd: ", 16, v12);
      if (*v13)
      {
        fprintf(*v4, "allocs %6zd hiwater %6zd", *v13, v13[3]);
        if (v13[1])
          fprintf(*v4, " LEAKED %6zd bytes %6zd", v13[1], v13[2]);
        fputc(10, *v4);
      }
    }
    v13 += 4;
    v12 += 2;
  }
  while (v12 != 1024);
  result = fprintf(*v4, "Large size (>%d):\n", 1024);
  if (*v2)
  {
    result = fprintf(*v4, "align %2d: ", 1);
    if (*v2)
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", *v2, v2[3]);
      if (v2[1])
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[1], v2[2]);
      result = fputc(10, *v4);
    }
  }
  if (v2[4])
  {
    result = fprintf(*v4, "align %2d: ", 2);
    if (v2[4])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[4], v2[7]);
      if (v2[5])
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[5], v2[6]);
      result = fputc(10, *v4);
    }
  }
  if (v2[8])
  {
    result = fprintf(*v4, "align %2d: ", 4);
    if (v2[8])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[8], v2[11]);
      if (v2[9])
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[9], v2[10]);
      result = fputc(10, *v4);
    }
  }
  if (v2[12])
  {
    result = fprintf(*v4, "align %2d: ", 8);
    if (v2[12])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[12], v2[15]);
      if (v2[13])
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[13], v2[14]);
      result = fputc(10, *v4);
    }
  }
  if (v2[16])
  {
    result = fprintf(*v4, "align %2d: ", 16);
    if (v2[16])
    {
      fprintf(*v4, "allocs %6zd hiwater %6zd", v2[16], v2[19]);
      if (v2[17])
        fprintf(*v4, " LEAKED %6zd bytes %6zd", v2[17], v2[18]);
      return fputc(10, *v4);
    }
  }
  return result;
}

double Util::StackMemResource::reset(Util::StackMemResource *this)
{
  uint64_t v1;
  _OWORD *v2;
  double result;

  v2 = (_OWORD *)((char *)this + 16);
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v1, *((_QWORD *)this + 3), 8);
  result = 0.0;
  *v2 = 0u;
  v2[1] = 0u;
  return result;
}

double Util::StackMemResource::reset(Util::StackMemResource *this, Util::MemoryResource *a2)
{
  uint64_t v4;
  _OWORD *v5;
  double result;

  v5 = (_OWORD *)((char *)this + 16);
  v4 = *((_QWORD *)this + 2);
  if (v4)
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v4, *((_QWORD *)this + 3), 8);
  result = 0.0;
  *v5 = 0u;
  v5[1] = 0u;
  *((_QWORD *)this + 1) = a2;
  return result;
}

uint64_t Util::StackMemResource::reset(uint64_t this, uint64_t a2, byte *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (_QWORD *)this;
  v6 = *(_QWORD *)(this + 16);
  if (v6)
    this = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(**(_QWORD **)(this + 8) + 24))(*(_QWORD *)(this + 8), v6, *(_QWORD *)(this + 24), 8);
  v5[2] = 0;
  v5[3] = a2;
  if (a3)
    v7 = a2;
  else
    v7 = 0;
  v5[4] = v7;
  v5[5] = a3;
  return this;
}

unint64_t Util::StackMemResource::owns(Util::StackMemResource *this, unint64_t a2)
{
  unint64_t v2;

  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    if (v2 > a2)
      return 0;
  }
  else
  {
    v2 = *((_QWORD *)this + 5) + *((_QWORD *)this + 4) - *((_QWORD *)this + 3);
    if (v2 > a2)
      return 0;
  }
  if (v2 + *((_QWORD *)this + 3) >= a2)
    return a2;
  else
    return 0;
}

void sub_20628F10C()
{
  JUMPOUT(0x20BCF13ACLL);
}

BOOL sub_20628F120(uint64_t a1)
{
  return *(_WORD *)(a1 + 24) == 3 && *(_WORD *)(a1 + 26) != 0;
}

uint64_t sub_20628F144()
{
  return 196609;
}

uint64_t sub_20628F150(_QWORD *a1)
{
  if ((*(unsigned int (**)(_QWORD *))(*a1 + 16))(a1))
    return a1[4];
  else
    return 0;
}

uint64_t sub_20628F188(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_20628F190(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;
  uint16x4_t *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint16x4_t *v23;
  unint64_t v24;
  uint64_t v25;
  unsigned __int16 *v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  uint64_t v50;
  unint64_t v51;
  uint16x4_t *v52;
  unint64_t v53;
  _WORD *v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unsigned __int16 *v60;
  unsigned __int16 *v61;
  unsigned int v62;
  uint64_t v63;
  unsigned __int16 *v64;
  unsigned int v65;
  unint64_t v67;
  unint64_t v68;
  unsigned __int16 *v69;
  unsigned __int16 *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  int64x2_t v76;
  int64x2_t v77;
  uint64_t v78;
  uint16x4_t *v79;
  unint64_t v80;
  int64x2_t v81;
  int64x2_t v82;
  int64x2_t v83;
  int64x2_t v84;
  int64x2_t v85;
  int64x2_t v86;
  uint16x8_t v87;
  uint32x4_t v88;
  uint32x4_t v89;
  uint32x4_t v90;
  uint32x4_t v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned __int16 *v95;
  uint64_t v96;
  _WORD *v98;
  unint64_t v99;
  unint64_t v100;
  unsigned __int16 *v101;
  unint64_t v102;
  uint64_t v103;
  unsigned __int16 *v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v108;
  uint64_t v109;
  unsigned __int16 *v110;
  uint64_t v111;
  _WORD *v113;
  _WORD *v114;
  uint64_t v115;
  _WORD *v116;
  _WORD *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  _WORD *v121;
  _WORD *v122;
  uint64_t v123;
  _WORD *v124;
  int v125;
  unint64_t v126;
  uint64_t v127;
  uint8_t buf[4];
  unint64_t v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  if ((*(uint64_t (**)(_QWORD *))(*a1 + 32))(a1) <= a2)
  {
LABEL_148:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v129 = a2;
      _os_log_error_impl(&dword_206287000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "HVF font: glyph index %lud out of range", buf, 0xCu);
      return 0;
    }
    return 0;
  }
  v6 = a1[7];
  if (v6 <= a2)
    goto LABEL_147;
  v7 = a1[6];
  v8 = *(unsigned int *)(v7 + 4 * a2);
  if ((v8 & 1) != 0)
    return 0;
  if (v6 <= a2 + 1)
  {
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  v9 = *(unsigned int *)(v7 + 4 * (a2 + 1)) - v8;
  if (v8 < (uint64_t)(4 * v6) || (uint64_t)v9 < 3)
    return 0;
  v11 = v7 + v8;
  v12 = a1[1] <= v11 && v9 + v11 <= a1[2] + a1[1] ? (uint16x4_t *)(v7 + v8) : 0;
  if (a1[1] > v11 || v9 + v11 > a1[2] + a1[1])
    return 0;
  if ((v12->i16[0] & 1) == 0)
  {
    if (v9 < 8 || (v12 & 7) != 0)
      return 0;
    v14 = a3;
    v15 = v12->u16[1];
    v16 = v12->u16[2];
    v17 = v12->u16[3];
    v18 = 2 * v16 + 8;
    v19 = ((v18 + v17) & 7) != 0 ? ((v18 + v17) & 0x7FFF8) + 8 : v18 + v17;
    v20 = v19 + 32 * v17;
    v21 = v12->u16[1] * (unint64_t)(4 * v17);
    if (v20 + 16 * v21 != v9)
      return 0;
    v22 = a2;
    v23 = v12 + 1;
    if (!v12->i16[2])
    {
      v25 = 0;
      goto LABEL_106;
    }
    v24 = 2 * v16 - 2;
    if (v24 >= 0x1E)
    {
      v76 = 0uLL;
      v77 = 0uLL;
      v78 = (v24 >> 1) + 1;
      v79 = v12 + 3;
      v80 = v78 & 0xFFFFFFFFFFFFFFF0;
      v81 = 0uLL;
      v82 = 0uLL;
      v83 = 0uLL;
      v84 = 0uLL;
      v85 = 0uLL;
      v86 = 0uLL;
      do
      {
        v87 = *(uint16x8_t *)v79[-2].i8;
        v88 = vmovl_u16(*(uint16x4_t *)v87.i8);
        v89 = vmovl_high_u16(v87);
        v90 = vmovl_u16(*v79);
        v91 = vmovl_high_u16(*(uint16x8_t *)v79->i8);
        v82 = (int64x2_t)vaddw_high_u32((uint64x2_t)v82, v89);
        v81 = (int64x2_t)vaddw_u32((uint64x2_t)v81, *(uint32x2_t *)v89.i8);
        v77 = (int64x2_t)vaddw_high_u32((uint64x2_t)v77, v88);
        v76 = (int64x2_t)vaddw_u32((uint64x2_t)v76, *(uint32x2_t *)v88.i8);
        v86 = (int64x2_t)vaddw_high_u32((uint64x2_t)v86, v91);
        v85 = (int64x2_t)vaddw_u32((uint64x2_t)v85, *(uint32x2_t *)v91.i8);
        v84 = (int64x2_t)vaddw_high_u32((uint64x2_t)v84, v90);
        v83 = (int64x2_t)vaddw_u32((uint64x2_t)v83, *(uint32x2_t *)v90.i8);
        v79 += 4;
        v80 -= 16;
      }
      while (v80);
      v25 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v83, v76), vaddq_s64(v85, v81)), vaddq_s64(vaddq_s64(v84, v77), vaddq_s64(v86, v82))));
      if (v78 == (v78 & 0xFFFFFFFFFFFFFFF0))
      {
LABEL_106:
        if (v25 == v17)
        {
          result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v14 + 16))(v14, v22);
          *(_QWORD *)(result + 32) = v15;
          *(_QWORD *)(result + 40) = v17;
          *(_QWORD *)(result + 48) = v23;
          *(_QWORD *)(result + 56) = v16;
          *(_QWORD *)(result + 64) = (char *)v12 + v18;
          *(_QWORD *)(result + 72) = v17;
          *(_QWORD *)(result + 80) = (char *)v12 + v19;
          *(_QWORD *)(result + 88) = 4 * v17;
          *(_QWORD *)(result + 96) = (char *)v12 + v20;
          *(_QWORD *)(result + 104) = 2 * v21;
          return result;
        }
        return 0;
      }
      v26 = (unsigned __int16 *)v23 + (v78 & 0xFFFFFFFFFFFFFFF0);
    }
    else
    {
      v25 = 0;
      v26 = (unsigned __int16 *)&v12[1];
    }
    do
    {
      v92 = *v26++;
      v25 += v92;
    }
    while (v26 != (unsigned __int16 *)((char *)v23 + 2 * v16));
    goto LABEL_106;
  }
  result = 0;
  if ((v12 & 3) == 0 && v9 >= 0x24)
  {
    v28 = v12->u16[1];
    v29 = v12->u16[2];
    v30 = v12->u16[3];
    v31 = v12[1].u16[0];
    if (v28 > v31 || v29 >= v30)
      return 0;
    v33 = 2 * v12->u16[1];
    v34 = v31 - v28;
    if (!is_mul_ok(v31 - v28, v33))
      return 0;
    v35 = a3;
    v36 = a2;
    v37 = v12[1].u16[2];
    v38 = v12[1].u16[3];
    v39 = v12[2].u16[1];
    v40 = v12[2].u16[2];
    v41 = v12[2].u16[3];
    v42 = v30 - 1;
    v43 = v42 * (unint64_t)(2 * v28);
    v44 = v37 <= v34 && (int)v34 * (uint64_t)(2 * (int)v28) >= v38;
    v45 = v44 && v42 >= v12[2].u16[0];
    v46 = v45 && v42 >= v39;
    v47 = v46 && v43 >= v40;
    v48 = v47 && v43 >= v41;
    if (!v48 || 2 * (int)v31 < v12[1].u16[1])
      return 0;
    v50 = 8 * v29;
    v51 = (unint64_t)v12 + v9;
    if ((unint64_t)&v12[v29] + 4 * v12[3].u16[0] > v51)
      return 0;
    v127 = v12[2].u16[0];
    if (v12->i16[2])
    {
      v52 = (uint16x4_t *)((char *)v12 + 4 * v12[3].u16[0]);
      do
      {
        v53 = (unint64_t)*v52;
        if (a1[4] <= (unint64_t)v52->u32[0])
          return 0;
        if (v42 <= WORD2(v53) || HIWORD(v53) >= v34)
          return 0;
        ++v52;
        v50 -= 8;
      }
      while (v50);
    }
    v55 = (_WORD *)v12 + 2 * v12[3].u16[1];
    v56 = (unint64_t)&v55[v33 | 1];
    if (v56 > v51)
      return 0;
    v123 = v33 | 1;
    v124 = (_WORD *)v12 + 2 * v12[3].u16[0];
    v125 = v12[1].u16[1];
    result = 0;
    if (v56 < (unint64_t)v12)
      return result;
    v57 = 2 * v37;
    if (2 * v37 + v56 > v51)
      return result;
    result = 0;
    v58 = v56 + 2 * v37;
    if (v58 < (unint64_t)v12)
      return result;
    v59 = 2 * v38;
    if (2 * v38 + v58 > v51)
      return result;
    if (v12[1].i16[2])
    {
      v60 = &v55[v33 | 1];
      while (*v60 < v34)
      {
        ++v60;
        v57 -= 2;
        if (!v57)
          goto LABEL_71;
      }
      return 0;
    }
LABEL_71:
    v61 = (unsigned __int16 *)(v56 + 2 * v37);
    if (v12[1].i16[3])
    {
      while (*v61 < v34)
      {
        ++v61;
        v59 -= 2;
        if (!v59)
          goto LABEL_74;
      }
      return 0;
    }
LABEL_74:
    if (v12->i16[1])
    {
      v62 = 0;
      v63 = 4 * v28;
      v64 = (unsigned __int16 *)v12 + 2 * v12[3].u16[1];
      do
      {
        v65 = *v64;
        if (v65 > v38 || v65 < v62)
          return 0;
        ++v64;
        v62 = v65;
        v63 -= 2;
      }
      while (v63);
    }
    if ((unsigned __int16)v55[2 * v12->u16[1]] != (_DWORD)v38)
      return 0;
    if ((unint64_t)v12 + 4 * v12[3].u16[2] + 4 * v37 > v51)
      return 0;
    if ((unint64_t)v12 + 4 * v12[3].u16[3] + 4 * v38 > v51)
      return 0;
    v67 = (unint64_t)&v12[v127] + 4 * v12[4].u16[0];
    if (v67 > v51)
      return 0;
    v121 = (_WORD *)v12 + 2 * v12[4].u16[0];
    v122 = (_WORD *)v12 + 2 * v12[3].u16[3];
    result = 0;
    v68 = v67 + 8 * v40;
    if (v68 < (unint64_t)v12)
      return result;
    v126 = v67 + 8 * v40;
    if (v68 + 4 * v40 > v51)
      return result;
    v69 = (unsigned __int16 *)(v67 + 8 * v40);
    v70 = (unsigned __int16 *)(v126 + 4 * v40);
    if (v12[2].i16[2])
    {
      v71 = 0;
      v72 = -1;
      do
      {
        v73 = *v69;
        if (v73 >= v42)
          return 0;
        v74 = v69[1];
        if (v74 >= v33)
          return 0;
        if (v72 >= (uint64_t)v73 && (v72 != v73 || v71 >= v74))
          return 0;
        v69 += 2;
        v71 = v74;
        v72 = v73;
      }
      while (v69 != v70);
    }
    result = 0;
    if (v70 < (unsigned __int16 *)v12)
      return result;
    v93 = 2 * v127;
    if ((unint64_t)&v70[v127] > v51)
      return result;
    if (v12[2].i16[0])
    {
      v94 = -1;
      v95 = (unsigned __int16 *)(v126 + 4 * v40);
      do
      {
        v96 = v94;
        v94 = *v95;
        if (v94 >= v42 || v96 >= v94)
          return 0;
        ++v95;
        v93 -= 2;
      }
      while (v93);
    }
    v98 = (_WORD *)v12 + 2 * v12[4].u16[1];
    v99 = (unint64_t)&v98[2 * v39];
    if (v99 > v51)
      return 0;
    result = 0;
    if (v99 >= (unint64_t)v12 && 4 * v41 + v99 <= v51)
    {
      result = 0;
      v100 = v99 + 4 * v41;
      if (v100 >= (unint64_t)v12 && 4 * v41 + v100 <= v51)
      {
        v120 = v99 + 4 * v41;
        v101 = (unsigned __int16 *)(v100 + 4 * v41);
        if (v12[2].i16[3])
        {
          v102 = 0;
          v103 = -1;
          v104 = (unsigned __int16 *)(v99 + 4 * v41);
          do
          {
            v105 = *v104;
            if (v105 >= v42)
              return 0;
            v106 = v104[1];
            if (v106 >= v33)
              return 0;
            if (v103 >= (uint64_t)v105 && (v103 != v105 || v102 >= v106))
              return 0;
            v104 += 2;
            v102 = v106;
            v103 = v105;
          }
          while (v104 != v101);
        }
        result = 0;
        if (v101 >= (unsigned __int16 *)v12)
        {
          v108 = 2 * v39;
          if ((unint64_t)&v101[v39] <= v51)
          {
            if (!v12[2].i16[1])
            {
LABEL_146:
              v113 = (_WORD *)v12 + 2 * v12[4].u16[1];
              v114 = &v98[2 * v39];
              v115 = (uint64_t)&v12[v127] + 4 * v12[4].u16[0];
              v116 = (_WORD *)v12 + 2 * v12[3].u16[2];
              v117 = (_WORD *)v12 + 2 * v12[3].u16[1];
              v118 = v12[2].u16[1];
              v119 = v12[2].u16[3];
              result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v35 + 24))(v35, v36);
              *(_DWORD *)(result + 32) = v28;
              *(_DWORD *)(result + 36) = v29;
              *(_DWORD *)(result + 40) = v30;
              *(_DWORD *)(result + 44) = v31;
              *(_DWORD *)(result + 48) = v125;
              *(_QWORD *)(result + 56) = v124;
              *(_QWORD *)(result + 64) = v29;
              *(_QWORD *)(result + 72) = v117;
              *(_QWORD *)(result + 80) = v123;
              *(_QWORD *)(result + 88) = v56;
              *(_QWORD *)(result + 96) = v37;
              *(_QWORD *)(result + 104) = v56 + 2 * v37;
              *(_QWORD *)(result + 112) = v38;
              *(_QWORD *)(result + 120) = v116;
              *(_QWORD *)(result + 128) = v37;
              *(_QWORD *)(result + 136) = v122;
              *(_QWORD *)(result + 144) = v38;
              *(_QWORD *)(result + 152) = v70;
              *(_QWORD *)(result + 160) = v127;
              *(_QWORD *)(result + 168) = v121;
              *(_QWORD *)(result + 176) = v127;
              *(_QWORD *)(result + 184) = v101;
              *(_QWORD *)(result + 192) = v118;
              *(_QWORD *)(result + 200) = v113;
              *(_QWORD *)(result + 208) = v118;
              *(_QWORD *)(result + 216) = v126;
              *(_QWORD *)(result + 224) = v40;
              *(_QWORD *)(result + 232) = v115;
              *(_QWORD *)(result + 240) = v40;
              *(_QWORD *)(result + 248) = v120;
              *(_QWORD *)(result + 256) = v119;
              *(_QWORD *)(result + 264) = v114;
              *(_QWORD *)(result + 272) = v119;
              return result;
            }
            v109 = -1;
            v110 = v101;
            while (1)
            {
              v111 = v109;
              v109 = *v110;
              if (v109 >= v42 || v111 >= v109)
                return 0;
              ++v110;
              v108 -= 2;
              if (!v108)
                goto LABEL_146;
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL HVF::Loader::withTableData@<W0>(HVF::Loader *this@<X0>, char *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char *v13;
  _BOOL8 result;
  void *v15;
  void *v16;
  void *v17;
  void *exception;
  __int16 v19[12];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!this || !a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v19[0] = 0;
      _os_log_error_impl(&dword_206287000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load HVF font; hvgl missing data or bad version",
        (uint8_t *)v19,
        2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BCF1358](exception, "HVF font not loaded");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = operator new();
  v7 = v6;
  *(_QWORD *)v6 = &off_24BEFD950;
  *(_QWORD *)(v6 + 8) = this;
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  if ((unint64_t)a2 <= 0x18)
  {
    v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BCF1358](v16, "hvgl table header too small");
    __cxa_throw(v16, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v8 = *(unsigned __int16 *)this;
  *(_WORD *)(v6 + 24) = v8;
  v9 = *((unsigned __int16 *)this + 1);
  *(_WORD *)(v6 + 26) = v9;
  if (v8 != 3 || !v9)
  {
    v17 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BCF1358](v17, "hvgl table is wrong version");
    __cxa_throw(v17, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v10 = *((unsigned int *)this + 2);
  *(_DWORD *)(v6 + 28) = *((_DWORD *)this + 1);
  *(_QWORD *)(v6 + 32) = v10;
  v12 = *((unsigned int *)this + 3);
  v11 = *((_DWORD *)this + 4);
  *(_DWORD *)(v6 + 40) = v11;
  v13 = (char *)this + v12;
  *(_QWORD *)(v6 + 48) = v13;
  *(_QWORD *)(v6 + 56) = v10 + 1;
  if (&v13[4 * v10 + 4] > &a2[(_QWORD)this] || v10 < v11)
  {
    v15 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BCF1358](v15, "hvgl part table malformed");
    __cxa_throw(v15, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  result = sub_20628F120(v6);
  if (!result)
    sub_20628F10C();
  *a3 = v7;
  return result;
}

void sub_20628FAFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  uint64_t v9;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *exception;
  void *v16;

  if (a2)
  {
    MEMORY[0x20BCF13AC](v9, 0x10D1C403060C5FCLL);
    v12 = __cxa_begin_catch(exception_object);
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (a2 == 2)
    {
      if (v13)
      {
        v14 = (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12);
        LODWORD(a9) = 136446210;
        *(_QWORD *)((char *)&a9 + 4) = v14;
        _os_log_error_impl(&dword_206287000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load HVF font; reason: %{public}s",
          (uint8_t *)&a9,
          0xCu);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x20BCF1358](exception, "HVF font not loaded");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    if (v13)
    {
      LOWORD(a9) = 0;
      _os_log_error_impl(&dword_206287000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load HVF font; reason unknown.",
        (uint8_t *)&a9,
        2u);
    }
    v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x20BCF1358](v16, "HVF font not loaded");
    __cxa_throw(v16, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  _Unwind_Resume(exception_object);
}

void sub_20628FC94(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_20628FCB8()
{
  void *v0;

  __cxa_free_exception(v0);
  JUMPOUT(0x20628FCC4);
}

void sub_20628FCCC(void *a1, int a2)
{
  if (!a2)
    JUMPOUT(0x20628FCD4);
  sub_206288B48(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x24BEDB340](__align, __sz, __ptr, __space);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24BEFD228(__p);
}

uint64_t operator delete()
{
  return off_24BEFD230();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24BEFD238(__sz);
}

uint64_t operator new()
{
  return off_24BEFD240();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cblas_dcopy_NEWLAPACK_ILP64()
{
  return MEMORY[0x24BDB2AB0]();
}

uint64_t cblas_dgemv_NEWLAPACK_ILP64()
{
  return MEMORY[0x24BDB2AE8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

long double logb(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAE8](__x);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAFB28](__x, __y);
  return result;
}

long double scalbn(long double __x, int __y)
{
  long double result;

  MEMORY[0x24BDAFC38](*(_QWORD *)&__y, __x);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

