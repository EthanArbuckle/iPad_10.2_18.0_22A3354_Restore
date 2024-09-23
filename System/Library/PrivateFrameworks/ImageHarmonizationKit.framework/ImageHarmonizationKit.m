void sub_23ECAD8FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECAD914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

_QWORD *sub_23ECAD948(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      v5 = (void *)a1[2];
      if (!v5)
        return a1;
      goto LABEL_6;
    }
  }
  v5 = (void *)a1[2];
  if (v5)
  {
LABEL_6:
    a1[3] = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_23ECADB74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECADB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;

  sub_23ECAD948(&a18);
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_23ECADBBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECADBD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECADBE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECADBF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECAE074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  uint64_t v18;

  sub_23ECAD948(&a9);
  sub_23ECAD948((_QWORD *)(v18 - 104));

  _Unwind_Resume(a1);
}

void sub_23ECAE114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAE374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  uint64_t v17;

  sub_23ECAD948(&a9);
  sub_23ECAD948((_QWORD *)(v17 - 104));
  _Unwind_Resume(a1);
}

void sub_23ECAE6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  void *v17;

  __cxa_free_exception(v17);
  sub_23ECAD948(&a9);
  sub_23ECAE84C(&a16);

  _Unwind_Resume(a1);
}

_QWORD *sub_23ECAE738(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 64;
  a1[52] = MEMORY[0x24BEDB840] + 64;
  v4 = a1 + 1;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 1);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[52] = v3;
  MEMORY[0x24265E0B8](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_23ECAE808(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x24265E154](v1 + 416);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECAE84C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x24265E0C4](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x24265E154](a1 + 52);
  return a1;
}

void sub_23ECAEA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;

  sub_23ECAD948(&a9);
  sub_23ECAD948(&a16);

  _Unwind_Resume(a1);
}

void sub_23ECAEA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  va_list va;

  va_start(va, a8);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECAEAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  va_list va;

  va_start(va, a8);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECAEACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAEADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAED7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12)
{
  void *v12;

  __cxa_free_exception(v12);
  sub_23ECAD948(&a12);

  _Unwind_Resume(a1);
}

void sub_23ECAEDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_23ECAF098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  __cxa_free_exception(v10);
  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF0BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAF0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  __cxa_free_exception(v10);
  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF3B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAF3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_23ECAD948(&a9);

  _Unwind_Resume(a1);
}

void sub_23ECAF700(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  sub_23ECAD948((_QWORD *)(v2 - 120));

  _Unwind_Resume(a1);
}

void sub_23ECAF718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  va_list va;

  va_start(va, a17);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECAF730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECAF740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  sub_23ECAD948(va);
  sub_23ECAD948((_QWORD *)(v3 - 120));

  _Unwind_Resume(a1);
}

void sub_23ECAF784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  sub_23ECAD948((uint64_t *)va);
  sub_23ECAD948((uint64_t *)va1);

  _Unwind_Resume(a1);
}

void sub_23ECAF7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;
  uint64_t v14;

  if (__p)
    operator delete(__p);
  sub_23ECAD948((_QWORD *)(v14 - 120));

  _Unwind_Resume(a1);
}

void *sub_23ECAF7CC(uint64_t a1, uint64_t a2)
{
  const void *v3;
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  std::runtime_error *exception;

  if (*(_DWORD *)(a2 + 8) != *(_DWORD *)(a1 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tensor types mismatch.");
    goto LABEL_6;
  }
  v3 = (const void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a2 + 40) + 24))(*(_QWORD *)(a2 + 40));
  v5 = v4;
  v6 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 24))(*(_QWORD *)(a1 + 40));
  if (v5 != v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tensor sizes mismatch.");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return memcpy(v6, v3, v5);
}

void sub_23ECAF884(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECAF898(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECAFD48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  void *v25;
  void *v26;
  void *v27;

  __cxa_free_exception(v27);
  sub_23ECAD948(&a25);

  _Unwind_Resume(a1);
}

void sub_23ECAFDE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECAFDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  void *v25;
  void *v26;

  if (__p)
  {
    operator delete(__p);
    sub_23ECAD948(&a25);

    _Unwind_Resume(a1);
  }
  sub_23ECAD948(&a25);

  _Unwind_Resume(a1);
}

void sub_23ECAFE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  void *v18;
  va_list va;

  va_start(va, a17);
  sub_23ECAD948((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECB0228(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  __cxa_free_exception(v2);
  sub_23ECAD948((_QWORD *)(v3 - 120));

  _Unwind_Resume(a1);
}

void sub_23ECB0248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB0258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;
  uint64_t v20;

  sub_23ECAD948(&a12);
  sub_23ECAD948((_QWORD *)(v20 - 120));

  _Unwind_Resume(a1);
}

void sub_23ECB05CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  sub_23ECAD948((uint64_t *)va);
  sub_23ECAD948((uint64_t *)va1);
  if (v3)
    operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_23ECB09B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  void *v21;

  sub_23ECAD948(&a9);
  sub_23ECAD948(&a20);
  operator delete(v21);

  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB0A50(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  _BYTE *v5;
  _BYTE *v6;
  int64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;

  v3 = result;
  *result = &off_250F5D430;
  v4 = *(_DWORD *)(a2 + 8);
  result[2] = 0;
  *((_DWORD *)result + 2) = v4;
  result[3] = 0;
  result[4] = 0;
  v6 = *(_BYTE **)(a2 + 16);
  v5 = *(_BYTE **)(a2 + 24);
  v7 = v5 - v6;
  if (v5 != v6)
  {
    if (v7 < 0)
      sub_23ECB1668();
    v8 = (char *)operator new(v5 - v6);
    v3[2] = v8;
    v3[3] = v8;
    v9 = &v8[8 * (v7 >> 3)];
    v3[4] = v9;
    result = memcpy(v8, v6, v7);
    v3[3] = v9;
  }
  v10 = *(_QWORD *)(a2 + 48);
  v3[5] = *(_QWORD *)(a2 + 40);
  v3[6] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  *v3 = &off_250F5D3E8;
  return result;
}

void sub_23ECB0B10(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_23ECB0B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;

  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  if (a1 != a2)
    sub_23ECB18EC((_QWORD *)(a1 + 16), *(char **)(a2 + 16), *(char **)(a2 + 24), (uint64_t)(*(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16)) >> 3);
  v5 = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 48);
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v4;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_23ECB0CA0(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  else
  {
LABEL_5:
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  a1[3] = v5;
  operator delete(v5);
LABEL_9:
  JUMPOUT(0x24265E1B4);
}

_QWORD *sub_23ECB0D30(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      v5 = (void *)a1[2];
      if (!v5)
        return a1;
      goto LABEL_6;
    }
  }
  v5 = (void *)a1[2];
  if (v5)
  {
LABEL_6:
    a1[3] = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_23ECB0DB0(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  else
  {
LABEL_5:
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  a1[3] = v5;
  operator delete(v5);
LABEL_9:
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB0E40(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t sub_23ECB0EA8(uint64_t a1, int *a2, uint64_t a3)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  int v8;
  int32x4_t *v9;
  int64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;

  v6 = (std::__shared_weak_count *)operator new(0xD0uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D450;
  sub_23ECB10B4((uint64_t)&v6[1], a2, (int32x4_t **)a3);
  *(_QWORD *)a1 = &off_250F5D430;
  v8 = *a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v9 = *(int32x4_t **)a3;
  v10 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  if (v10)
  {
    if (v10 < 0)
      sub_23ECB1668();
    v11 = (char *)operator new(v10);
    *(_QWORD *)(a1 + 16) = v11;
    *(_QWORD *)(a1 + 24) = v11;
    v12 = &v11[8 * (v10 >> 3)];
    *(_QWORD *)(a1 + 32) = v12;
    memcpy(v11, v9, v10);
    *(_QWORD *)(a1 + 24) = v12;
  }
  *(_QWORD *)(a1 + 40) = v6 + 1;
  *(_QWORD *)(a1 + 48) = v6;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(_QWORD *)a1 = &off_250F5D3E8;
  return a1;
}

void sub_23ECB1018(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_23ECB1030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;
  void **v12;
  void *v14;

  v14 = *v12;
  if (*v12)
  {
    *(_QWORD *)(v11 + 24) = v14;
    operator delete(v14);
  }
  sub_23ECB0E40((uint64_t)&a11);
  sub_23ECB0E40((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_23ECB105C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D450;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23ECB106C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D450;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

void sub_23ECB109C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 201))
    free(*(void **)(a1 + 32));
}

uint64_t sub_23ECB10B4(uint64_t a1, int *a2, int32x4_t **a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int32x4_t *v9;
  unint64_t v10;
  int v11;
  int32x4_t *v12;
  uint64_t v13;
  uint64_t v14;
  int32x4_t *v15;
  int32x4_t v16;
  uint64_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int8x16_t v23;
  __int32 v24;
  uint64_t v25;
  unsigned int v26;
  std::runtime_error *exception;
  __int128 v29;
  void *memptr;

  v29 = 0u;
  espresso_buffer_pack_tensor_shape();
  v6 = *a2;
  if (v6 >= 5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unknown data type");
    goto LABEL_20;
  }
  v7 = qword_23ECC7880[v6];
  v9 = *a3;
  v8 = (char *)a3[1];
  if (*a3 == (int32x4_t *)v8)
  {
    v13 = 0;
    goto LABEL_11;
  }
  v10 = v8 - (char *)v9 - 8;
  if (v10 >= 0x38)
  {
    v14 = (v10 >> 3) + 1;
    v12 = (int32x4_t *)((char *)v9 + 8 * (v14 & 0x3FFFFFFFFFFFFFF8));
    v15 = v9 + 2;
    v16.i64[0] = 0x100000001;
    v16.i64[1] = 0x100000001;
    v17 = v14 & 0x3FFFFFFFFFFFFFF8;
    v18.i64[0] = 0x100000001;
    v18.i64[1] = 0x100000001;
    do
    {
      v20 = v15[-2];
      v19 = v15[-1];
      v22 = *v15;
      v21 = v15[1];
      v15 += 4;
      v16 = vmulq_s32(v16, vuzp1q_s32(v20, v19));
      v18 = vmulq_s32(v18, vuzp1q_s32(v22, v21));
      v17 -= 8;
    }
    while (v17);
    v23 = (int8x16_t)vmulq_s32(v18, v16);
    *(int32x2_t *)v23.i8 = vmul_s32(*(int32x2_t *)v23.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
    v11 = v23.i32[0] * v23.i32[1];
    if (v14 == (v14 & 0x3FFFFFFFFFFFFFF8))
      goto LABEL_10;
  }
  else
  {
    v11 = 1;
    v12 = *a3;
  }
  do
  {
    v24 = v12->i32[0];
    v12 = (int32x4_t *)((char *)v12 + 8);
    v11 *= v24;
  }
  while (v12 != (int32x4_t *)v8);
LABEL_10:
  v13 = v11;
LABEL_11:
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x1000uLL, (v13 * v7 + 4095) & 0xFFFFFFFFFFFFF000, 0x1E091250uLL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to allocate aligned memory.");
    goto LABEL_20;
  }
  *(_QWORD *)&v29 = memptr;
  v25 = *a2;
  if (v25 >= 5 || ((0x1Du >> v25) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unknown data type.");
    goto LABEL_20;
  }
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  v26 = dword_23ECC78A8[v25];
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 8) = v29;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_QWORD *)a1 = &off_250F5D4A0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 168) = v26;
  *(_WORD *)(a1 + 176) = 257;
  if (*(_DWORD *)(a1 + 168) != 65568)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unexpected espresso buffer storage type");
LABEL_20:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_23ECB131C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB1330(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB1344(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB1358(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB136C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 177))
    free(*(void **)(a1 + 8));
  return a1;
}

void sub_23ECB139C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 177))
    free(*(void **)(a1 + 8));
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB13DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 32))(a2, a1 + 8);
}

uint64_t sub_23ECB13F4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

unint64_t sub_23ECB1410@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  unint64_t result;
  unint64_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  __int8 *v11;
  char *v12;
  std::runtime_error *exception;
  std::string *v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  uint64_t v18;
  std::string v19;

  result = espresso_buffer_get_rank();
  v5 = result;
  if (result >= 6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v19, v5);
    v14 = std::string::insert(&v19, 0, "Unsupported tensor rank: ");
    v15 = *(int8x16_t *)&v14->__r_.__value_.__l.__data_;
    v17.i64[0] = v14->__r_.__value_.__r.__words[2];
    v16 = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, (const std::string *)&v16);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v6 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)(a1 + 152), 2uLL);
  v7 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)(a1 + 136), 2uLL);
  v16 = vextq_s8(v6, v6, 8uLL);
  v17 = vextq_s8(v7, v7, 8uLL);
  v18 = 4 * *(_QWORD *)(a1 + 128);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (result)
  {
    v8 = 8 * (5 - result);
    v9 = 40 - v8;
    v10 = (char *)operator new(40 - v8);
    v11 = &v16.i8[v8];
    *a2 = v10;
    v12 = &v10[8 * ((unint64_t)(40 - v8) >> 3)];
    a2[2] = v12;
    result = (unint64_t)memcpy(v10, v11, v9);
    a2[1] = v12;
  }
  return result;
}

void sub_23ECB153C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  _Unwind_Resume(a1);
}

void sub_23ECB15C0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  const void *v4;
  size_t v5;
  size_t v6;
  void *__p[3];

  v4 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v6 = v5;
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a1 + 32))(__p, a1);
  sub_23ECB16F0(a2, v4, v6, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_23ECB163C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23ECB1658(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_23ECB1668()
{
  sub_23ECB167C("vector");
}

void sub_23ECB167C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23ECB16CC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250F5CF38, MEMORY[0x24BEDAAF0]);
}

void sub_23ECB16B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_23ECB16CC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t sub_23ECB16F0(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  const void *v10;
  int64_t v11;
  char *v12;
  char *v13;

  v8 = operator new[]();
  *(_QWORD *)a1 = v8;
  v9 = (_QWORD *)operator new();
  *v9 = &unk_250F5D508;
  v9[1] = 0;
  v9[2] = 0;
  v9[3] = v8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 16) = a3;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v10 = *(const void **)a4;
  v11 = *(_QWORD *)(a4 + 8) - *(_QWORD *)a4;
  if (v11)
  {
    if (v11 < 0)
      sub_23ECB1668();
    v12 = (char *)operator new(v11);
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = v12;
    v13 = &v12[8 * (v11 >> 3)];
    *(_QWORD *)(a1 + 40) = v13;
    memcpy(v12, v10, v11);
    *(_QWORD *)(a1 + 32) = v13;
  }
  memcpy(*(void **)a1, a2, a3);
  return a1;
}

void sub_23ECB17DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24265E1B4](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

void sub_23ECB1800(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v4;
    operator delete(v4);
  }
  sub_23ECB0E40(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB1828(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB184C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    JUMPOUT(0x24265E19CLL);
  return result;
}

uint64_t sub_23ECB186C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023ECC7B98)
    return a1 + 24;
  if (((v3 & 0x800000023ECC7B98 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023ECC7B98))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023ECC7B98 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

_QWORD *sub_23ECB18EC(_QWORD *result, char *__src, char *a3, size_t __sz)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  void **v15;
  _BYTE *v16;
  unint64_t v17;
  char *v18;
  void *v19;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 61)
      goto LABEL_22;
    v10 = v8 >> 2;
    if (v8 >> 2 <= __sz)
      v10 = __sz;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8;
    v12 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v10;
    if (v12 >> 61)
LABEL_22:
      sub_23ECB1668();
    v13 = v12;
    result = operator new(8 * v12);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[v13];
    v14 = a3 - v6;
    if (v14)
      result = memcpy(result, v6, v14);
    v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  v15 = (void **)(result + 1);
  v16 = (_BYTE *)result[1];
  v17 = (v16 - v9) >> 3;
  if (v17 >= __sz)
  {
    v14 = a3 - __src;
    if (a3 == __src)
      goto LABEL_21;
    v19 = (void *)*result;
LABEL_20:
    result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  v18 = &__src[8 * v17];
  if (v16 != v9)
  {
    result = memmove((void *)*result, __src, v16 - v9);
    v9 = (char *)*v15;
  }
  v14 = a3 - v18;
  if (v14)
  {
    v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  *v15 = &v9[v14];
  return result;
}

_QWORD *sub_23ECB1A30(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x24265E0D0](v13, a1);
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
    if (!sub_23ECB1B94(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x24265E0DC](v13);
  return a1;
}

void sub_23ECB1B38(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24265E0DC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23ECB1B18);
}

void sub_23ECB1B80(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB1B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[2];
  int64_t v22;

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
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_23ECB1D38();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (v22 >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_23ECB1D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23ECB1D38()
{
  sub_23ECB167C("basic_string");
}

void sub_23ECB1F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_23ECB20F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB2104(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB211C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_23ECB2148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23ECB2164(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECB217C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB2190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB22E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB2300(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECB2318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB232C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB2340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB2354(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB23D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB23E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB24E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB24F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB2508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB25E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECB25F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECB2930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_23ECB2E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{

  _Unwind_Resume(a1);
}

void sub_23ECB3288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{

  _Unwind_Resume(a1);
}

void sub_23ECB37C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_23ECB3994(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB39E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECB41D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  std::__shared_weak_count *v6;
  void *v8;

  std::__shared_weak_count::~__shared_weak_count(v6);
  operator delete(v8);

  _Unwind_Resume(a1);
}

void sub_23ECB47C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  void *v42;
  void *v43;
  void *v44;

  sub_23ECAD948(&a35);
  sub_23ECB4CDC(&a42);

  _Unwind_Resume(a1);
}

void sub_23ECB4894(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  _BYTE *v11;
  _BYTE *v12;
  int64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void **v19;
  void **v20;
  void *v21;
  void *__p;
  void **v23;
  _QWORD v24[5];
  void *__dst[2];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a3 + 23) < 0)
  {
    sub_23ECB9310(__dst, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    v26 = *(_QWORD *)(a3 + 16);
  }
  sub_23ECB9D80(&__p, (uint64_t)__dst, 1uLL);
  sub_23ECB5A28(a1, a2, (__int128 **)&__p, (uint64_t)v24);
  v8 = sub_23ECB70A4(v24, a3);
  v9 = v8;
  if (!v8)
    sub_23ECB7054("unordered_map::at: key not found");
  *(_QWORD *)a4 = &off_250F5D430;
  v10 = *((_DWORD *)v8 + 12);
  *(_QWORD *)(a4 + 16) = 0;
  *(_DWORD *)(a4 + 8) = v10;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  v12 = (_BYTE *)v8[7];
  v11 = (_BYTE *)v8[8];
  v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0)
      sub_23ECB1668();
    v14 = (char *)operator new(v11 - v12);
    *(_QWORD *)(a4 + 16) = v14;
    v15 = &v14[8 * (v13 >> 3)];
    *(_QWORD *)(a4 + 32) = v15;
    memcpy(v14, v12, v13);
    *(_QWORD *)(a4 + 24) = v15;
  }
  *(_QWORD *)(a4 + 40) = v9[10];
  v16 = v9[11];
  *(_QWORD *)(a4 + 48) = v16;
  if (v16)
  {
    v17 = (unint64_t *)(v16 + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  *(_QWORD *)a4 = &off_250F5D3E8;
  sub_23ECB8F84((uint64_t)v24);
  v19 = (void **)__p;
  if (__p)
  {
    v20 = v23;
    v21 = __p;
    if (v23 != __p)
    {
      do
      {
        if (*((char *)v20 - 1) < 0)
          operator delete(*(v20 - 3));
        v20 -= 3;
      }
      while (v20 != v19);
      v21 = __p;
    }
    v23 = v19;
    operator delete(v21);
  }
  if (SHIBYTE(v26) < 0)
    operator delete(__dst[0]);
}

void sub_23ECB4A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  sub_23ECB5E38((void **)&a9);
  if (a22 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB4AC0(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    v5 = *(void **)(a1 + 40);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
LABEL_6:
    *(_QWORD *)(a1 + 48) = v5;
    operator delete(v5);
  }
LABEL_7:
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_23ECB4B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  const void **v7;
  size_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  std::runtime_error *exception;
  _OWORD v19[10];
  uint64_t v20;
  void *memptr;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_DWORD *)(v3 + 168);
  if (v4 == 65568 || v4 == 131104)
  {
    v6 = 4;
  }
  else
  {
    if (v4 != 262152)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported espresso type encountered.");
LABEL_13:
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    v6 = 1;
  }
  v7 = (const void **)(v3 + 8);
  v8 = *(_QWORD *)(v3 + 160) * *(_QWORD *)(v3 + 120) * v6;
  v9 = *(_OWORD *)(v3 + 120);
  v10 = *(_OWORD *)(v3 + 136);
  v11 = *(_OWORD *)(v3 + 152);
  v20 = *(_QWORD *)(v3 + 168);
  v12 = *(_OWORD *)(v3 + 8);
  v13 = *(_OWORD *)(v3 + 40);
  v19[1] = *(_OWORD *)(v3 + 24);
  v19[2] = v13;
  v19[0] = v12;
  v14 = *(_OWORD *)(v3 + 56);
  v15 = *(_OWORD *)(v3 + 72);
  v16 = *(_OWORD *)(v3 + 104);
  v19[5] = *(_OWORD *)(v3 + 88);
  v19[6] = v16;
  v19[3] = v14;
  v19[4] = v15;
  v19[8] = v10;
  v19[9] = v11;
  v19[7] = v9;
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x1000uLL, (v8 + 4095) & 0xFFFFFFFFFFFFF000, 0x1E091250uLL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to allocate aligned memory.");
    goto LABEL_13;
  }
  *(_QWORD *)&v19[0] = memptr;
  memcpy(memptr, *v7, v8);
  LOWORD(memptr) = 257;
  return sub_23ECB789C(a2, (uint64_t)v19, &memptr);
}

void sub_23ECB4CB4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB4CC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB4CDC(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      v5 = (void *)a1[2];
      if (!v5)
        return a1;
      goto LABEL_6;
    }
  }
  v5 = (void *)a1[2];
  if (v5)
  {
LABEL_6:
    a1[3] = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_23ECB51DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  void *v42;
  void *v43;
  void *v44;

  sub_23ECAD948(&a35);
  sub_23ECB4CDC(&a42);

  _Unwind_Resume(a1);
}

void sub_23ECB58C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,char a52)
{
  void *v52;
  void *v53;
  uint64_t v54;

  sub_23ECB8F84((uint64_t)&a29);
  sub_23ECB4AC0(v54);
  sub_23ECB4AC0((uint64_t)&a52);
  sub_23ECAD948(&a13);
  sub_23ECAD948(&a21);
  if (a45 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t sub_23ECB5A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X2>, uint64_t a4@<X8>)
{
  __int128 *v6;
  uint64_t *i;
  __int128 v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t *v11;
  uint64_t *v12;
  _BYTE *v13;
  _BYTE *v14;
  int64_t v15;
  char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t (**v35)();
  int v36;
  void *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  __int128 *v42[3];
  int v43;
  _BYTE v44[24];
  uint64_t v45;
  __int128 v46;

  v6 = *(__int128 **)(a1 + 8);
  for (i = *(uint64_t **)(a2 + 16); i; i = (uint64_t *)*i)
  {
    *(_QWORD *)v44 = off_250F5D6B0;
    if (*((char *)i + 39) < 0)
    {
      sub_23ECB9310(&v44[8], (void *)i[2], i[3]);
    }
    else
    {
      v8 = *((_OWORD *)i + 1);
      v45 = i[4];
      *(_OWORD *)&v44[8] = v8;
    }
    v46 = *v6;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)i[10] + 16))(i[10], v44);
    if (SHIBYTE(v45) < 0)
      operator delete(*(void **)&v44[8]);
  }
  v34 = a4;
  v9 = *a3;
  v10 = a3[1];
  if (*a3 != v10)
  {
    while (!sub_23ECB8464((_QWORD *)v6 + 24, (uint64_t)v9))
    {
      v43 = espresso_network_bind_buffer();
      HIBYTE(v42[2]) = 21;
      strcpy((char *)v42, "Binding output buffer");
      sub_23ECB7D5C(&v43, (uint64_t *)v42);
      if (SHIBYTE(v42[2]) < 0)
        operator delete(v42[0]);
      LOWORD(v42[0]) = 0;
      sub_23ECB789C((uint64_t)&v35, (uint64_t)v44, v42);
      v42[0] = v9;
      v21 = sub_23ECB939C((uint64_t)(v6 + 12), (uint64_t)v9, (uint64_t)&unk_23ECC7A21, v42);
      v22 = v21;
      *((_DWORD *)v21 + 12) = v36;
      if (v21 + 5 != (uint64_t *)&v35)
        sub_23ECB18EC(v21 + 7, (char *)v37, v38, (v38 - (_BYTE *)v37) >> 3);
      v24 = v40;
      v23 = v41;
      if (v41)
      {
        p_shared_owners = (unint64_t *)&v41->__shared_owners_;
        do
          v26 = __ldxr(p_shared_owners);
        while (__stxr(v26 + 1, p_shared_owners));
      }
      v27 = (std::__shared_weak_count *)v22[11];
      v22[10] = v24;
      v22[11] = (uint64_t)v23;
      if (!v27)
        goto LABEL_32;
      v28 = (unint64_t *)&v27->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (v29)
        goto LABEL_32;
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
      v30 = v41;
      v35 = &off_250F5D430;
      if (v41)
      {
LABEL_33:
        v31 = (unint64_t *)&v30->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
LABEL_38:
      if (v37)
      {
        v38 = (char *)v37;
        operator delete(v37);
      }
      v9 = (__int128 *)((char *)v9 + 24);
      if (v9 == v10)
        goto LABEL_42;
    }
    v11 = sub_23ECB70A4((_QWORD *)v6 + 24, (uint64_t)v9);
    if (!v11)
      sub_23ECB7054("unordered_map::at: key not found");
    v12 = v11;
    v35 = &off_250F5D430;
    v36 = *((_DWORD *)v11 + 12);
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v14 = (_BYTE *)v11[7];
    v13 = (_BYTE *)v11[8];
    v15 = v13 - v14;
    if (v13 != v14)
    {
      if (v15 < 0)
        sub_23ECB1668();
      v16 = (char *)operator new(v13 - v14);
      v17 = &v16[8 * (v15 >> 3)];
      v37 = v16;
      v39 = v17;
      memcpy(v16, v14, v15);
      v38 = v17;
    }
    v18 = (std::__shared_weak_count *)v12[11];
    v40 = v12[10];
    v41 = v18;
    if (!v18)
    {
      v35 = &off_250F5D430;
      goto LABEL_38;
    }
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
LABEL_32:
    v30 = v41;
    v35 = &off_250F5D430;
    if (v41)
      goto LABEL_33;
    goto LABEL_38;
  }
LABEL_42:
  LODWORD(v42[0]) = espresso_plan_execute_sync();
  v44[23] = 14;
  strcpy(v44, "Executing plan");
  sub_23ECB7D5C((int *)v42, (uint64_t *)v44);
  if ((v44[23] & 0x80000000) != 0)
    operator delete(*(void **)v44);
  return sub_23ECB8690(v34, (uint64_t)(v6 + 12));
}

void sub_23ECB5DC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,int a30,__int16 a31,char a32,char a33)
{
  if (a29 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void **sub_23ECB5E38(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_23ECB5F1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECB5F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_23ECB62BC(uint64_t a1, __CVBuffer *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  int v5;
  __CVBuffer *v6;
  size_t Height;
  size_t Width;
  uint64_t v9;
  char *v10;
  int64_t v11;
  char *v12;
  char *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  char *v22;
  char *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  CVPixelBufferRef pixelBuffer;

  pixelBuffer = a2;
  sub_23ECB6738(&pixelBuffer, &v24);
  v4 = v24;
  v3 = v25;
  v26 = v24;
  v27 = v25;
  v24 = 0;
  v25 = 0;
  v5 = sub_23ECB64E0(pixelBuffer);
  v6 = pixelBuffer;
  Height = CVPixelBufferGetHeight(pixelBuffer);
  Width = CVPixelBufferGetWidth(v6);
  v9 = sub_23ECB6B74(v6);
  sub_23ECB6E78(&v22, Height, Width, v9);
  *(_QWORD *)a1 = &off_250F5D430;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v10 = v22;
  v11 = v23 - v22;
  if (v23 != v22)
  {
    if (v11 < 0)
      sub_23ECB1668();
    v12 = (char *)operator new(v23 - v22);
    *(_QWORD *)(a1 + 16) = v12;
    *(_QWORD *)(a1 + 24) = v12;
    v13 = &v12[8 * (v11 >> 3)];
    *(_QWORD *)(a1 + 32) = v13;
    memcpy(v12, v10, v11);
    *(_QWORD *)(a1 + 24) = v13;
  }
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  if (v10)
  {
    v23 = v10;
    operator delete(v10);
  }
  if (v3)
  {
    v16 = (unint64_t *)&v3->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v18 = v25;
  if (v25)
  {
    v19 = (unint64_t *)&v25->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  *(_QWORD *)a1 = &off_250F5D560;
  return a1;
}

void sub_23ECB6464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  sub_23ECB0E40((uint64_t)&a14);
  sub_23ECB0E40((uint64_t)&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB64E0(__CVBuffer *a1)
{
  signed int PixelFormatType;
  int v2;
  unsigned int v4;
  std::runtime_error *exception;
  std::string *v6;
  __int128 v7;
  std::string v8;
  std::string v9;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        v2 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369)
      return 0;
    v2 = 1278226488;
LABEL_10:
    if (PixelFormatType == v2)
      return 0;
LABEL_15:
    v4 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v8, v4);
    v6 = std::string::insert(&v8, 0, "Unsupported CVPixelBuffer type: ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v9.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v9);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600)
      goto LABEL_15;
  }
  else if (PixelFormatType != 1278226534)
  {
    v2 = 1380401729;
    goto LABEL_10;
  }
  return 4;
}

void sub_23ECB6648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_23ECB66A8(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;

  *a1 = &off_250F5D430;
  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  else
  {
LABEL_5:
    v5 = (void *)a1[2];
    if (!v5)
      goto LABEL_9;
  }
  a1[3] = v5;
  operator delete(v5);
LABEL_9:
  JUMPOUT(0x24265E1B4);
}

CVPixelBufferRef sub_23ECB6738@<X0>(__CVBuffer **a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  __CVBuffer *v5;
  CVPixelBufferRef result;
  std::runtime_error *exception;

  v4 = operator new(0x28uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_250F5D598;
  v4[3] = &off_250F5D5E8;
  v5 = *a1;
  v4[4] = *a1;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Null CVPixelBuffer encountered.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  result = CVPixelBufferRetain(v5);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_23ECB67D4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v2;
  void *v4;

  __cxa_free_exception(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v4);
  _Unwind_Resume(a1);
}

void sub_23ECB67F4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_23ECB680C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_23ECB6834(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D598;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23ECB6844(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D598;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

void sub_23ECB6874(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

uint64_t sub_23ECB6894(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 8));
  return a1;
}

void sub_23ECB68C0(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 8));
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB68FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 24))(a2, *(_QWORD *)(a1 + 8));
}

void *sub_23ECB6914(uint64_t a1)
{
  void *BaseAddress;
  void *v3;
  std::runtime_error *exception;

  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 8));
  if (!BaseAddress)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to get CVPixelBuffer's data. Ensure the buffer was locked.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v3 = BaseAddress;
  CVPixelBufferGetDataSize(*(CVPixelBufferRef *)(a1 + 8));
  return v3;
}

void sub_23ECB6980(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB6994@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  size_t BytesPerRow;
  uint64_t v6;
  _QWORD *result;

  v4 = qword_23ECC7AD0[sub_23ECB64E0(*(__CVBuffer **)(a1 + 8))];
  BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 8));
  v6 = sub_23ECB6B74(*(__CVBuffer **)(a1 + 8));
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  result = operator new(0x18uLL);
  a2[1] = result + 3;
  a2[2] = result + 3;
  *result = BytesPerRow;
  result[1] = v6 * v4;
  result[2] = v4;
  *a2 = result;
  return result;
}

uint64_t sub_23ECB6A10@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  __CVBuffer *v4;
  const void *v5;
  size_t v6;
  size_t v7;
  uint64_t result;
  std::runtime_error *exception;
  void *__p[3];

  v4 = (__CVBuffer *)a1[1];
  if (CVPixelBufferLockBaseAddress(v4, 1uLL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_8;
  }
  v5 = (const void *)(*(uint64_t (**)(_QWORD *))(*a1 + 24))(a1);
  v7 = v6;
  (*(void (**)(void **__return_ptr, _QWORD *))(*a1 + 32))(__p, a1);
  sub_23ECB16F0(a2, v5, v7, (uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  result = CVPixelBufferUnlockBaseAddress(v4, 1uLL);
  if ((_DWORD)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_8:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_23ECB6B1C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB6B30(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB6B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    a13 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_23ECB6D3C((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB6B74(__CVBuffer *a1)
{
  signed int PixelFormatType;
  int v2;
  int v4;
  unsigned int v5;
  std::runtime_error *exception;
  std::string *v7;
  __int128 v8;
  std::string v9;
  std::string v10;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32)
        return 4;
      v2 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369)
      return 4;
    v4 = 1278226488;
LABEL_14:
    if (PixelFormatType != v4)
      goto LABEL_16;
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627)
      return 1;
    v4 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    v2 = 1380401729;
LABEL_8:
    if (PixelFormatType == v2)
      return 4;
LABEL_16:
    v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return 1;
}

void sub_23ECB6CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_23ECB6D3C(uint64_t a1)
{
  std::runtime_error *exception;

  *(_QWORD *)a1 = &off_250F5D640;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(_QWORD *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_23ECB6DA8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB6DBC(uint64_t a1)
{
  std::runtime_error *exception;

  *(_QWORD *)a1 = &off_250F5D640;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(_QWORD *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  JUMPOUT(0x24265E1B4);
}

void sub_23ECB6E44(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  __cxa_free_exception(v2);
  MEMORY[0x24265E1B4](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

char **sub_23ECB6E78(char **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v8 = (char *)operator new(8uLL);
  *(_QWORD *)v8 = a2;
  a1[1] = v8 + 8;
  a1[2] = v8 + 8;
  *a1 = v8;
  v9 = (char *)operator new(0x10uLL);
  v10 = v9 + 16;
  *(_QWORD *)v9 = *(_QWORD *)v8;
  *((_QWORD *)v9 + 1) = a3;
  *a1 = v9;
  a1[1] = v9 + 16;
  a1[2] = v9 + 16;
  operator delete(v8);
  v11 = (unint64_t)a1[2];
  a1[1] = v9 + 16;
  if ((unint64_t)(v9 + 16) < v11)
  {
    *((_QWORD *)v9 + 2) = a4;
    v12 = (uint64_t)(v9 + 24);
    goto LABEL_21;
  }
  v13 = *a1;
  v14 = (v10 - *a1) >> 3;
  v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) >> 61)
    sub_23ECB1668();
  v16 = v11 - (_QWORD)v13;
  if (v16 >> 2 > v15)
    v15 = v16 >> 2;
  if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
    v17 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v17 = v15;
  if (v17)
  {
    if (v17 >> 61)
      sub_23ECB680C();
    v18 = (char *)operator new(8 * v17);
    v19 = &v18[8 * v14];
    v20 = &v18[8 * v17];
    *(_QWORD *)v19 = a4;
    v12 = (uint64_t)(v19 + 8);
    if (v10 == v13)
      goto LABEL_19;
    goto LABEL_14;
  }
  v18 = 0;
  v19 = (char *)(8 * v14);
  v20 = 0;
  *(_QWORD *)(8 * v14) = a4;
  v12 = 8 * v14 + 8;
  if (v10 != v13)
  {
LABEL_14:
    v21 = v9 - v13 + 8;
    if (v21 < 0x18)
      goto LABEL_26;
    v22 = (v21 >> 3) + 1;
    v23 = 8 * (v22 & 0x3FFFFFFFFFFFFFFCLL);
    v10 -= v23;
    v19 -= v23;
    v24 = &v18[8 * v14 - 16];
    v25 = v22 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v26 = *(_OWORD *)v9;
      *((_OWORD *)v24 - 1) = *((_OWORD *)v9 - 1);
      *(_OWORD *)v24 = v26;
      v24 -= 32;
      v9 -= 32;
      v25 -= 4;
    }
    while (v25);
    if (v22 != (v22 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_26:
      do
      {
        v27 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v19 - 1) = v27;
        v19 -= 8;
      }
      while (v10 != v13);
    }
  }
LABEL_19:
  *a1 = v19;
  a1[1] = (char *)v12;
  a1[2] = v20;
  if (v13)
    operator delete(v13);
LABEL_21:
  a1[1] = (char *)v12;
  return a1;
}

void sub_23ECB7038(_Unwind_Exception *exception_object)
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

void sub_23ECB7054(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23ECB771C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250F5CF40, MEMORY[0x24BEDAB00]);
}

void sub_23ECB7090(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_23ECB70A4(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t *result;
  uint64_t **v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v2 = (_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  v6 = sub_23ECB72D0((uint64_t)&v25, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v10 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v10 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    v13 = *v12;
    if (*v12)
    {
      v14 = v2[23];
      if (v14 >= 0)
        v15 = v2[23];
      else
        v15 = *((_QWORD *)v2 + 1);
      if (v14 < 0)
        v2 = *(_BYTE **)v2;
      if (v9.u32[0] < 2uLL)
      {
        v16 = *(_QWORD *)&v7 - 1;
        while (1)
        {
          v21 = v13[1];
          if (v21 == v8)
          {
            v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0)
              v23 = *((unsigned __int8 *)v13 + 39);
            else
              v23 = v13[3];
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3]))
                  return v13;
              }
              else
              {
                if (!*((_BYTE *)v13 + 39))
                  return v13;
                v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24)
                    return v13;
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          result = 0;
          v13 = (uint64_t *)*v13;
          if (!v13)
            return result;
        }
      }
      while (1)
      {
        v17 = v13[1];
        if (v17 == v8)
        {
          v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0)
            v19 = *((unsigned __int8 *)v13 + 39);
          else
            v19 = v13[3];
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3]))
                return v13;
            }
            else
            {
              if (!*((_BYTE *)v13 + 39))
                return v13;
              v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20)
                  return v13;
              }
            }
          }
        }
        else
        {
          if (v17 >= *(_QWORD *)&v7)
            v17 %= *(_QWORD *)&v7;
          if (v17 != v10)
            return 0;
        }
        result = 0;
        v13 = (uint64_t *)*v13;
        if (!v13)
          return result;
      }
    }
  }
  return 0;
}

unint64_t sub_23ECB72D0(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
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
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      v30 = v26 + v28;
      v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      v33 = v27 + a3 + v26 + v23;
      v34 = v33 + v24;
      v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v24 + v27 + a3 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v37 = v36 + v25 + v28;
      v38 = __ROR8__(v37, 44);
      v39 = v37 + v29;
      v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      v42 = *a2;
      v41 = a2 + 4;
      v43 = v42 - 0x4B6D499041670D8DLL * v24;
      v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v45 = *(v41 - 3);
        v46 = v43 + v34 + v30 + v45;
        v47 = v41[2];
        v48 = v41[3];
        v49 = v41[1];
        v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        v50 = v32 + v39;
        v51 = *(v41 - 2);
        v52 = *(v41 - 1);
        v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        v54 = v53 + v39 + v52;
        v55 = v53 + v45 + v51;
        v34 = v55 + v52;
        v56 = __ROR8__(v55, 44) + v53;
        v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        v35 = v56 + __ROR8__(v54 + v57, 21);
        v58 = v43 + v40 + *v41;
        v39 = v58 + v49 + v47 + v48;
        v40 = __ROR8__(v58 + v49 + v47, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        v32 = v57;
        v44 += 64;
      }
      while (v44);
      v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      v9 = a2[2];
      v8 = a2[3];
      v10 = __ROR8__(v7 + v8, 52);
      v11 = v7 + a2[1];
      v12 = __ROR8__(v11, 7);
      v13 = v11 + v9;
      v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    v18 = a2[1];
    v19 = 0xB492B66FBE98F273 * *a2;
    v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

std::logic_error *sub_23ECB771C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t sub_23ECB7740(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECB7878(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB789C(uint64_t a1, uint64_t a2, _WORD *a3)
{
  std::__shared_weak_count *v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::runtime_error *exception;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  void *__p[3];
  int v29;
  char *v30;
  char __src[80];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  sub_23ECB7C4C(a2, a3, &v24);
  v6 = v24;
  v5 = v25;
  v26 = v24;
  v27 = v25;
  v24 = 0;
  v25 = 0;
  v7 = *(_DWORD *)(a2 + 160);
  switch(v7)
  {
    case 65568:
      v8 = 4;
      break;
    case 262152:
      v8 = 0;
      break;
    case 131104:
      v8 = 2;
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported espresso type encountered.");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v30 = 0;
  v29 = espresso_buffer_unpack_tensor_shape();
  strcpy((char *)__p, "Unpacking tensor shape");
  HIBYTE(__p[2]) = 22;
  sub_23ECB7D5C(&v29, (uint64_t *)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    v9 = (unint64_t)v30;
    memset(__p, 0, sizeof(__p));
    if (v30)
      goto LABEL_9;
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v9 = (unint64_t)v30;
  memset(__p, 0, sizeof(__p));
  if (!v30)
    goto LABEL_13;
LABEL_9:
  if (v9 >> 61)
    sub_23ECB1668();
  v10 = 8 * v9;
  if (((8 * v9) & 0x8000000000000000) != 0)
    sub_23ECB1668();
  v11 = (char *)operator new(8 * v9);
  v9 = (unint64_t)&v11[8 * ((uint64_t)(8 * v9) >> 3)];
  memcpy(v11, __src, v10);
LABEL_14:
  *(_QWORD *)a1 = &off_250F5D430;
  *(_DWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v12 = v9 - (_QWORD)v11;
  if ((char *)v9 != v11)
  {
    if (v12 < 0)
      sub_23ECB1668();
    v13 = (char *)operator new(v9 - (_QWORD)v11);
    *(_QWORD *)(a1 + 16) = v13;
    v14 = &v13[8 * (v12 >> 3)];
    *(_QWORD *)(a1 + 32) = v14;
    memcpy(v13, v11, v9 - (_QWORD)v11);
    *(_QWORD *)(a1 + 24) = v14;
  }
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  if (v11)
    operator delete(v11);
  if (v5)
  {
    v17 = (unint64_t *)&v5->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v19 = v25;
  if (v25)
  {
    v20 = (unint64_t *)&v25->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  *(_QWORD *)a1 = &off_250F5D3E8;
  return a1;
}

void sub_23ECB7B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  sub_23ECB0E40((uint64_t)&a15);
  sub_23ECB0E40((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_23ECB7BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v9;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v9 = *v7;
  if (*v7)
  {
    *(_QWORD *)(v5 + 24) = v9;
    operator delete(v9);
  }
  if (v6)
    JUMPOUT(0x23ECB7C04);
  sub_23ECB0E40((uint64_t)va1);
  sub_23ECB0E40((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23ECB7C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  sub_23ECB0E40((uint64_t)&a15);
  sub_23ECB0E40((uint64_t)&a13);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB7C4C@<X0>(uint64_t a1@<X1>, _WORD *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12;
  std::runtime_error *exception;

  result = operator new(0xD0uLL);
  result[1] = 0;
  result[2] = 0;
  *result = &off_250F5D450;
  result[3] = &off_250F5D4A0;
  v7 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)result + 10) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)result + 11) = v7;
  result[24] = *(_QWORD *)(a1 + 160);
  v8 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)result + 6) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)result + 7) = v8;
  v9 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)result + 8) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)result + 9) = v9;
  v10 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)result + 2) = *(_OWORD *)a1;
  *((_OWORD *)result + 3) = v10;
  v11 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)result + 4) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)result + 5) = v11;
  v12 = *((_DWORD *)result + 48) - 0x10000;
  *((_WORD *)result + 100) = *a2;
  if (v12 != 32)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unexpected espresso buffer storage type");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  *a3 = result + 3;
  a3[1] = result;
  return result;
}

void sub_23ECB7D24(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_23ECB7D3C(_Unwind_Exception *a1)
{
  void *v1;
  std::__shared_weak_count *v2;
  void *v4;

  __cxa_free_exception(v1);
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  _Unwind_Resume(a1);
}

int *sub_23ECB7D5C(int *result, uint64_t *a2)
{
  int *v2;
  std::runtime_error *exception;
  std::string *v4;
  __int128 v5;
  std::string *v6;
  std::string::size_type size;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  __int128 v11;
  std::string v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;

  if (*result)
  {
    v2 = result;
    sub_23ECB7F78((uint64_t)result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    v4 = std::string::append(&v13, " [espresso error: ");
    v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v12, *v2);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v12;
    else
      v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    else
      size = v12.__r_.__value_.__l.__size_;
    v8 = std::string::append(&v14, (const std::string::value_type *)v6, size);
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    v10 = std::string::append(&v15, "]");
    v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    exception->__vftable = (std::runtime_error_vtbl *)&off_250F5D688;
    __cxa_throw(exception, (struct type_info *)&unk_250F5D660, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  return result;
}

void sub_23ECB7E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  int v34;
  uint64_t v35;

  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0)
LABEL_14:
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34)
    goto LABEL_14;
  goto LABEL_13;
}

void sub_23ECB7F78(uint64_t a1, uint64_t *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_23ECC62B4(a2);
}

void sub_23ECB7FC8(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB7FEC(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_23ECB802C(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  JUMPOUT(0x24265E1B4);
}

void sub_23ECB806C(uint64_t a1, __int128 *a2, _DWORD *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  std::runtime_error *exception;
  char __p[22];
  char v9;
  __int128 v10;
  __int128 v11;
  int v12;

  switch(*a3)
  {
    case 0:
      v3 = a2[1];
      v10 = *a2;
      v11 = v3;
      v12 = espresso_network_bind_input_vimagebuffer_bgra8();
      v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_23ECB7D5C(&v12, (uint64_t *)__p);
      break;
    case 1:
      v5 = a2[1];
      v10 = *a2;
      v11 = v5;
      v12 = espresso_network_bind_input_vimagebuffer_rgba8();
      v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_23ECB7D5C(&v12, (uint64_t *)__p);
      break;
    case 2:
      v4 = a2[1];
      v10 = *a2;
      v11 = v4;
      v12 = espresso_network_bind_input_vimagebuffer_argb8();
      v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_23ECB7D5C(&v12, (uint64_t *)__p);
      break;
    case 3:
      v6 = a2[1];
      v10 = *a2;
      v11 = v6;
      v12 = espresso_network_bind_input_vimagebuffer_planar8();
      v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_23ECB7D5C(&v12, (uint64_t *)__p);
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported image buffer type");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  if (v9 < 0)
    operator delete(*(void **)__p);
}

void sub_23ECB82A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB82B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23ECB82DC()
{
  char __p[22];
  char v1;
  int v2;

  v2 = espresso_network_bind_cvpixelbuffer();
  v1 = 21;
  strcpy(__p, "Binding CVPixelBuffer");
  sub_23ECB7D5C(&v2, (uint64_t *)__p);
  if (v1 < 0)
    operator delete(*(void **)__p);
}

void sub_23ECB8378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23ECB8394()
{
  void *__p;
  __int128 v1;
  int v2;

  v2 = espresso_network_bind_buffer();
  __p = operator new(0x20uLL);
  v1 = xmmword_23ECC7B00;
  strcpy((char *)__p, "Binding espresso_buffer_t");
  sub_23ECB7D5C(&v2, (uint64_t *)&__p);
  if (SHIBYTE(v1) < 0)
    operator delete(__p);
}

void sub_23ECB8448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_23ECB8464(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t *result;
  uint64_t **v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v2 = (_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  v6 = sub_23ECB72D0((uint64_t)&v25, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v10 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v10 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    v13 = *v12;
    if (*v12)
    {
      v14 = v2[23];
      if (v14 >= 0)
        v15 = v2[23];
      else
        v15 = *((_QWORD *)v2 + 1);
      if (v14 < 0)
        v2 = *(_BYTE **)v2;
      if (v9.u32[0] < 2uLL)
      {
        v16 = *(_QWORD *)&v7 - 1;
        while (1)
        {
          v21 = v13[1];
          if (v8 == v21)
          {
            v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0)
              v23 = *((unsigned __int8 *)v13 + 39);
            else
              v23 = v13[3];
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3]))
                  return v13;
              }
              else
              {
                if (!*((_BYTE *)v13 + 39))
                  return v13;
                v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24)
                    return v13;
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          result = 0;
          v13 = (uint64_t *)*v13;
          if (!v13)
            return result;
        }
      }
      while (1)
      {
        v17 = v13[1];
        if (v8 == v17)
        {
          v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0)
            v19 = *((unsigned __int8 *)v13 + 39);
          else
            v19 = v13[3];
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3]))
                return v13;
            }
            else
            {
              if (!*((_BYTE *)v13 + 39))
                return v13;
              v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20)
                  return v13;
              }
            }
          }
        }
        else
        {
          if (v17 >= *(_QWORD *)&v7)
            v17 %= *(_QWORD *)&v7;
          if (v17 != v10)
            return 0;
        }
        result = 0;
        v13 = (uint64_t *)*v13;
        if (!v13)
          return result;
      }
    }
  }
  return 0;
}

uint64_t sub_23ECB8690(uint64_t a1, uint64_t a2)
{
  size_t prime;
  int8x8_t v5;
  BOOL v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t v9;
  __int128 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  prime = *(_QWORD *)(a2 + 8);
  if (prime == 1)
  {
    prime = 2;
LABEL_17:
    sub_23ECB87D0(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(*(_QWORD *)(a2 + 8));
    v5 = *(int8x8_t *)(a1 + 8);
    v6 = prime >= *(_QWORD *)&v5;
    if (prime > *(_QWORD *)&v5)
      goto LABEL_17;
  }
  else
  {
    v5 = 0;
    v6 = 1;
    if (prime)
      goto LABEL_17;
  }
  if (!v6)
  {
    v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v5 < 3uLL || (v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      v7 = std::__next_prime(v7);
    }
    else
    {
      v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2)
        v7 = v9;
    }
    if (prime <= v7)
      prime = v7;
    if (prime < *(_QWORD *)&v5)
      goto LABEL_17;
  }
LABEL_18:
  for (i = *(__int128 **)(a2 + 16); i; i = *(__int128 **)i)
    sub_23ECB897C(a1, (uint64_t)(i + 1), i + 1);
  return a1;
}

void sub_23ECB87A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23ECB8F84(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB87BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23ECB8F84(v1);
  _Unwind_Resume(a1);
}

void sub_23ECB87D0(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  if (!a2)
  {
    v15 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v15)
      operator delete(v15);
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61)
    sub_23ECB680C();
  v4 = operator new(8 * a2);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v6 = 0;
  *(_QWORD *)(a1 + 8) = a2;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  v8 = a1 + 16;
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v9 = v7[1];
    v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      v11 = v9 & v10;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = v8;
      while (1)
      {
        v12 = (_QWORD *)*v7;
        if (!*v7)
          break;
        v13 = v12[1] & v10;
        if (v13 == v11)
        {
          v7 = (_QWORD *)*v7;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          *v7 = *v12;
          v14 = 8 * v13;
          *v12 = **(_QWORD **)(*(_QWORD *)a1 + v14);
          **(_QWORD **)(*(_QWORD *)a1 + v14) = v12;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = v12;
          v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2)
      v9 %= a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v8;
    v16 = (_QWORD *)*v7;
    if (*v7)
    {
      while (1)
      {
        v18 = v16[1];
        if (v18 >= a2)
          v18 %= a2;
        if (v18 == v9)
          goto LABEL_25;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v18))
        {
          *v7 = *v16;
          v17 = 8 * v18;
          *v16 = **(_QWORD **)(*(_QWORD *)a1 + v17);
          **(_QWORD **)(*(_QWORD *)a1 + v17) = v16;
          v16 = v7;
LABEL_25:
          v7 = v16;
          v16 = (_QWORD *)*v16;
          if (!v16)
            return;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v7;
          v7 = v16;
          v16 = (_QWORD *)*v16;
          v9 = v18;
          if (!v16)
            return;
        }
      }
    }
  }
}

uint64_t *sub_23ECB897C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  unint64_t v3;
  _BYTE *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t **v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  float v26;
  float v27;
  _QWORD *v28;
  _QWORD *v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  size_t prime;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD v41[2];
  char v42;

  v5 = (_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = sub_23ECB72D0((uint64_t)v41, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v11)
        v3 = v9 % v11;
    }
    else
    {
      v3 = (v11 - 1) & v9;
    }
    v13 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v5[23];
        if (v15 >= 0)
          v16 = v5[23];
        else
          v16 = *((_QWORD *)v5 + 1);
        if (v15 < 0)
          v5 = *(_BYTE **)v5;
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = v14[1];
            if (v21 == v10)
            {
              v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0)
                v23 = *((unsigned __int8 *)v14 + 39);
              else
                v23 = v14[3];
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3]))
                    return v14;
                }
                else
                {
                  if (!*((_BYTE *)v14 + 39))
                    return v14;
                  v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24)
                      return v14;
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            v14 = (uint64_t *)*v14;
            if (!v14)
              goto LABEL_51;
          }
        }
        do
        {
          v17 = v14[1];
          if (v17 == v10)
          {
            v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0)
              v19 = *((unsigned __int8 *)v14 + 39);
            else
              v19 = v14[3];
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3]))
                  return v14;
              }
              else
              {
                if (!*((_BYTE *)v14 + 39))
                  return v14;
                v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20)
                    return v14;
                }
              }
            }
          }
          else
          {
            if (v17 >= v11)
              v17 %= v11;
            if (v17 != v3)
              break;
          }
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  v25 = operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  v42 = 0;
  *v25 = 0;
  v25[1] = v10;
  sub_23ECB8E74(v25 + 2, a3);
  v42 = 1;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    v30 = 1;
    if (v11 >= 3)
      v30 = (v11 & (v11 - 1)) != 0;
    v31 = v30 | (2 * v11);
    v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32)
      prime = v32;
    else
      prime = v31;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v34)
      goto LABEL_65;
    if (prime < *(_QWORD *)&v34)
    {
      v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v34 < 3uLL || (v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        v35 = std::__next_prime(v35);
      }
      else
      {
        v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2)
          v35 = v37;
      }
      if (prime <= v35)
        prime = v35;
      if (prime < *(_QWORD *)&v34)
LABEL_65:
        sub_23ECB87D0(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        v3 = v10 % v11;
        v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v10 % v11));
        v29 = (_QWORD *)v41[0];
        if (v28)
          goto LABEL_54;
      }
      else
      {
        v3 = v10;
        v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v10);
        v29 = (_QWORD *)v41[0];
        if (v28)
          goto LABEL_54;
      }
    }
    else
    {
      v3 = v38 & v10;
      v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v38 & v10));
      v29 = (_QWORD *)v41[0];
      if (v28)
        goto LABEL_54;
    }
LABEL_78:
    *v29 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v41[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v41[0])
    {
      v39 = *(_QWORD *)(*(_QWORD *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11)
          v39 %= v11;
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  v29 = (_QWORD *)v41[0];
  if (!v28)
    goto LABEL_78;
LABEL_54:
  *v29 = *v28;
  *v28 = v41[0];
LABEL_89:
  v14 = (uint64_t *)v41[0];
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_23ECB8DA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_23ECB8DB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23ECB8DCC(uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {
      *(_QWORD *)(v2 + 40) = &off_250F5D430;
      v3 = *(std::__shared_weak_count **)(v2 + 88);
      if (v3)
      {
        p_shared_owners = (unint64_t *)&v3->__shared_owners_;
        do
          v5 = __ldaxr(p_shared_owners);
        while (__stlxr(v5 - 1, p_shared_owners));
        if (!v5)
        {
          ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
          std::__shared_weak_count::__release_weak(v3);
        }
      }
      v6 = *(void **)(v2 + 56);
      if (v6)
      {
        *(_QWORD *)(v2 + 64) = v6;
        operator delete(v6);
      }
      if (*(char *)(v2 + 39) < 0)
        operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

_QWORD *sub_23ECB8E74(_QWORD *__dst, __int128 *a2)
{
  __int128 v4;
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;

  if (*((char *)a2 + 23) < 0)
  {
    sub_23ECB9310(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    __dst[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  v5 = *((_DWORD *)a2 + 8);
  __dst[5] = 0;
  __dst[3] = &off_250F5D430;
  *((_DWORD *)__dst + 8) = v5;
  __dst[6] = 0;
  __dst[7] = 0;
  v7 = (_BYTE *)*((_QWORD *)a2 + 5);
  v6 = (_BYTE *)*((_QWORD *)a2 + 6);
  v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0)
      sub_23ECB1668();
    v9 = (char *)operator new(v6 - v7);
    __dst[5] = v9;
    __dst[6] = v9;
    v10 = &v9[8 * (v8 >> 3)];
    __dst[7] = v10;
    memcpy(v9, v7, v8);
    __dst[6] = v10;
  }
  v11 = *((_QWORD *)a2 + 9);
  __dst[8] = *((_QWORD *)a2 + 8);
  __dst[9] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  __dst[3] = &off_250F5D3E8;
  return __dst;
}

void sub_23ECB8F60(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB8F84(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    while (1)
    {
      v3 = (_QWORD *)*v2;
      v2[5] = &off_250F5D430;
      v4 = (std::__shared_weak_count *)v2[11];
      if (v4)
      {
        p_shared_owners = (unint64_t *)&v4->__shared_owners_;
        do
          v6 = __ldaxr(p_shared_owners);
        while (__stlxr(v6 - 1, p_shared_owners));
        if (!v6)
          break;
      }
      v7 = (void *)v2[7];
      if (v7)
        goto LABEL_9;
LABEL_10:
      if (*((char *)v2 + 39) < 0)
        operator delete((void *)v2[2]);
      operator delete(v2);
      v2 = v3;
      if (!v3)
        goto LABEL_14;
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    v7 = (void *)v2[7];
    if (!v7)
      goto LABEL_10;
LABEL_9:
    v2[8] = v7;
    operator delete(v7);
    goto LABEL_10;
  }
LABEL_14:
  v8 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v8)
    operator delete(v8);
  return a1;
}

uint64_t sub_23ECB9058(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECB9190(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECB91B4(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECB92EC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

void *sub_23ECB9310(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_23ECB1D38();
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

uint64_t *sub_23ECB939C(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _BYTE *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  uint64_t **v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _BYTE *v27;
  __int128 *v28;
  __int128 v29;
  float v30;
  float v31;
  _QWORD *v32;
  _QWORD *v33;
  _BOOL8 v34;
  unint64_t v35;
  unint64_t v36;
  size_t prime;
  int8x8_t v38;
  unint64_t v39;
  uint8x8_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD v45[2];
  char v46;

  v6 = (_BYTE *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v9 = v8;
  }
  v10 = sub_23ECB72D0((uint64_t)v45, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v14 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = *v14;
      if (*v14)
      {
        v16 = v6[23];
        if (v16 >= 0)
          v17 = v6[23];
        else
          v17 = *((_QWORD *)v6 + 1);
        if (v16 < 0)
          v6 = *(_BYTE **)v6;
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            v22 = v15[1];
            if (v22 == v11)
            {
              v23 = *((unsigned __int8 *)v15 + 39);
              if ((v23 & 0x80u) == 0)
                v24 = *((unsigned __int8 *)v15 + 39);
              else
                v24 = v15[3];
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v15[2], v6, v15[3]))
                    return v15;
                }
                else
                {
                  if (!*((_BYTE *)v15 + 39))
                    return v15;
                  v25 = 0;
                  while (*((unsigned __int8 *)v15 + v25 + 16) == v6[v25])
                  {
                    if (v23 == ++v25)
                      return v15;
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            v15 = (uint64_t *)*v15;
            if (!v15)
              goto LABEL_51;
          }
        }
        do
        {
          v18 = v15[1];
          if (v18 == v11)
          {
            v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0)
              v20 = *((unsigned __int8 *)v15 + 39);
            else
              v20 = v15[3];
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v6, v15[3]))
                  return v15;
              }
              else
              {
                if (!*((_BYTE *)v15 + 39))
                  return v15;
                v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v6[v21])
                {
                  if (v19 == ++v21)
                    return v15;
                }
              }
            }
          }
          else
          {
            if (v18 >= v12)
              v18 %= v12;
            if (v18 != v4)
              break;
          }
          v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  v26 = (char *)operator new(0x60uLL);
  v45[0] = v26;
  v45[1] = a1 + 16;
  v46 = 0;
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = v11;
  v27 = v26 + 16;
  v28 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_23ECB9310(v27, *(void **)v28, *((_QWORD *)v28 + 1));
  }
  else
  {
    v29 = *v28;
    *((_QWORD *)v26 + 4) = *((_QWORD *)v28 + 2);
    *(_OWORD *)v27 = v29;
  }
  *((_DWORD *)v26 + 12) = 4;
  *(_OWORD *)(v26 + 56) = 0u;
  *(_OWORD *)(v26 + 72) = 0u;
  *((_QWORD *)v26 + 11) = 0;
  *((_QWORD *)v26 + 5) = &off_250F5D3E8;
  v46 = 1;
  v30 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v31 = *(float *)(a1 + 32);
  if (!v12 || (float)(v31 * (float)v12) < v30)
  {
    v34 = 1;
    if (v12 >= 3)
      v34 = (v12 & (v12 - 1)) != 0;
    v35 = v34 | (2 * v12);
    v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36)
      prime = v36;
    else
      prime = v35;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v38 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v38)
      goto LABEL_68;
    if (prime < *(_QWORD *)&v38)
    {
      v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v38 < 3uLL || (v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        v39 = std::__next_prime(v39);
      }
      else
      {
        v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2)
          v39 = v41;
      }
      if (prime <= v39)
        prime = v39;
      if (prime < *(_QWORD *)&v38)
LABEL_68:
        sub_23ECB87D0(a1, prime);
    }
    v12 = *(_QWORD *)(a1 + 8);
    v42 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        v4 = v11 % v12;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v11 % v12));
        v33 = (_QWORD *)v45[0];
        if (v32)
          goto LABEL_57;
      }
      else
      {
        v4 = v11;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
        v33 = (_QWORD *)v45[0];
        if (v32)
          goto LABEL_57;
      }
    }
    else
    {
      v4 = v42 & v11;
      v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v42 & v11));
      v33 = (_QWORD *)v45[0];
      if (v32)
        goto LABEL_57;
    }
LABEL_81:
    *v33 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v45[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v45[0])
    {
      v43 = *(_QWORD *)(*(_QWORD *)v45[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v43 >= v12)
          v43 %= v12;
      }
      else
      {
        v43 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v43) = v45[0];
    }
    goto LABEL_92;
  }
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  v33 = (_QWORD *)v45[0];
  if (!v32)
    goto LABEL_81;
LABEL_57:
  *v33 = *v32;
  *v32 = v45[0];
LABEL_92:
  v15 = (uint64_t *)v45[0];
  ++*(_QWORD *)(a1 + 24);
  return v15;
}

void sub_23ECB9800(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_23ECB9814(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23ECB982C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  unint64_t v3;
  _BYTE *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t **v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  float v26;
  float v27;
  _QWORD *v28;
  _QWORD *v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  size_t prime;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD v41[2];
  char v42;

  v5 = (_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = sub_23ECB72D0((uint64_t)v41, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v11)
        v3 = v9 % v11;
    }
    else
    {
      v3 = (v11 - 1) & v9;
    }
    v13 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v5[23];
        if (v15 >= 0)
          v16 = v5[23];
        else
          v16 = *((_QWORD *)v5 + 1);
        if (v15 < 0)
          v5 = *(_BYTE **)v5;
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = v14[1];
            if (v21 == v10)
            {
              v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0)
                v23 = *((unsigned __int8 *)v14 + 39);
              else
                v23 = v14[3];
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3]))
                    return v14;
                }
                else
                {
                  if (!*((_BYTE *)v14 + 39))
                    return v14;
                  v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24)
                      return v14;
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            v14 = (uint64_t *)*v14;
            if (!v14)
              goto LABEL_51;
          }
        }
        do
        {
          v17 = v14[1];
          if (v17 == v10)
          {
            v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0)
              v19 = *((unsigned __int8 *)v14 + 39);
            else
              v19 = v14[3];
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3]))
                  return v14;
              }
              else
              {
                if (!*((_BYTE *)v14 + 39))
                  return v14;
                v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20)
                    return v14;
                }
              }
            }
          }
          else
          {
            if (v17 >= v11)
              v17 %= v11;
            if (v17 != v3)
              break;
          }
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  v25 = operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  v42 = 0;
  *v25 = 0;
  v25[1] = v10;
  sub_23ECB9C7C(v25 + 2, a3);
  v42 = 1;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    v30 = 1;
    if (v11 >= 3)
      v30 = (v11 & (v11 - 1)) != 0;
    v31 = v30 | (2 * v11);
    v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32)
      prime = v32;
    else
      prime = v31;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v34)
      goto LABEL_65;
    if (prime < *(_QWORD *)&v34)
    {
      v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v34 < 3uLL || (v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        v35 = std::__next_prime(v35);
      }
      else
      {
        v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2)
          v35 = v37;
      }
      if (prime <= v35)
        prime = v35;
      if (prime < *(_QWORD *)&v34)
LABEL_65:
        sub_23ECB87D0(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        v3 = v10 % v11;
        v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v10 % v11));
        v29 = (_QWORD *)v41[0];
        if (v28)
          goto LABEL_54;
      }
      else
      {
        v3 = v10;
        v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v10);
        v29 = (_QWORD *)v41[0];
        if (v28)
          goto LABEL_54;
      }
    }
    else
    {
      v3 = v38 & v10;
      v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v38 & v10));
      v29 = (_QWORD *)v41[0];
      if (v28)
        goto LABEL_54;
    }
LABEL_78:
    *v29 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v41[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v41[0])
    {
      v39 = *(_QWORD *)(*(_QWORD *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11)
          v39 %= v11;
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  v29 = (_QWORD *)v41[0];
  if (!v28)
    goto LABEL_78;
LABEL_54:
  *v29 = *v28;
  *v28 = v41[0];
LABEL_89:
  v14 = (uint64_t *)v41[0];
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_23ECB9C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_23ECB9C64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB8DCC((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB9C7C(_QWORD *__dst, __int128 *a2)
{
  __int128 v4;
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;

  if (*((char *)a2 + 23) < 0)
  {
    sub_23ECB9310(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    __dst[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  v5 = *((_DWORD *)a2 + 8);
  __dst[5] = 0;
  __dst[3] = &off_250F5D430;
  *((_DWORD *)__dst + 8) = v5;
  __dst[6] = 0;
  __dst[7] = 0;
  v7 = (_BYTE *)*((_QWORD *)a2 + 5);
  v6 = (_BYTE *)*((_QWORD *)a2 + 6);
  v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0)
      sub_23ECB1668();
    v9 = (char *)operator new(v6 - v7);
    __dst[5] = v9;
    __dst[6] = v9;
    v10 = &v9[8 * (v8 >> 3)];
    __dst[7] = v10;
    memcpy(v9, v7, v8);
    __dst[6] = v10;
  }
  v11 = *((_QWORD *)a2 + 9);
  __dst[8] = *((_QWORD *)a2 + 8);
  __dst[9] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  return __dst;
}

void sub_23ECB9D5C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_23ECB9D80(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  char *v9;
  __int128 *v10;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL)
      sub_23ECB1668();
    v5 = 24 * a3;
    v6 = (char *)operator new(24 * a3);
    v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      v9 = &v6[v7];
      v10 = (__int128 *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_23ECB9310(v9, *(void **)v10, *((_QWORD *)v10 + 1));
      }
      else
      {
        v8 = *v10;
        *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
        *(_OWORD *)v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_23ECB9E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_23ECB9EA8(&a9);
  _Unwind_Resume(a1);
}

void sub_23ECB9E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0)
      operator delete(*(void **)(v10 + v11 - 24));
  }
  *(_QWORD *)(v9 + 8) = v10;
  sub_23ECB9EA8(&a9);
  _Unwind_Resume(a1);
}

void ***sub_23ECB9EA8(void ***result)
{
  void ***v1;
  void **v2;
  void **v3;
  void **v4;
  void *v5;

  v1 = result;
  if (!*((_BYTE *)result + 8))
  {
    v2 = *result;
    v3 = (void **)**result;
    if (v3)
    {
      v4 = (void **)v2[1];
      v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0)
            operator delete(*(v4 - 3));
          v4 -= 3;
        }
        while (v4 != v3);
        v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_23ECB9F3C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D710;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23ECB9F4C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D710;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECB9F7C(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void sub_23ECB9F8C(uint64_t a1, _QWORD *a2, const char **a3)
{
  const char *v4;
  size_t v5;
  size_t v6;
  __int128 *p_dst;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void **v11;
  void *v12;
  void **v13;
  void **v14;
  void *v15;
  void **v16;
  void *v17;
  void **v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  void *v29[2];
  void *v30[2];
  int v31;
  void *__p;
  char v33;
  __int128 __dst;
  unint64_t v35;

  v4 = *a3;
  v5 = strlen(*a3);
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v6 = v5;
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    p_dst = (__int128 *)operator new(v8 + 1);
    *((_QWORD *)&__dst + 1) = v6;
    v35 = v9 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v35) = v5;
  p_dst = &__dst;
  if (v5)
LABEL_8:
    memmove(p_dst, v4, v6);
  *((_BYTE *)p_dst + v6) = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v20 = 0;
  v24 = 0xFFFFFFFFLL;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  *(_OWORD *)v29 = 0u;
  *(_OWORD *)v30 = 0u;
  v31 = 1065353216;
  v33 = 0;
  LOBYTE(__p) = 0;
  *a2 = &off_250F5D760;
  v10 = operator new(0x128uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = &off_250F5D790;
  a2[1] = sub_23ECBA358((uint64_t)(v10 + 3), &__dst, (uint64_t)&v17);
  a2[2] = v10;
  if (v33 < 0)
    operator delete(__p);
  v11 = (void **)v30[0];
  if (v30[0])
  {
    do
    {
      v16 = (void **)*v11;
      if (*((char *)v11 + 39) < 0)
        operator delete(v11[2]);
      operator delete(v11);
      v11 = v16;
    }
    while (v16);
  }
  v12 = v29[0];
  v29[0] = 0;
  if (v12)
    operator delete(v12);
  v13 = (void **)v17;
  if (v17)
  {
    v14 = v18;
    v15 = v17;
    if (v18 != v17)
    {
      do
      {
        if (*((char *)v14 - 1) < 0)
          operator delete(*(v14 - 3));
        v14 -= 3;
      }
      while (v14 != v13);
      v15 = v17;
    }
    v18 = v13;
    operator delete(v15);
  }
  if (SHIBYTE(v35) < 0)
    operator delete((void *)__dst);
}

void sub_23ECBA184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count *v9;
  uint64_t v10;
  void *v12;

  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  sub_23ECBB3BC((uint64_t)&a9);
  if (*(char *)(v10 - 49) < 0)
    operator delete(*(void **)(v10 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBA1BC(uint64_t a1)
{
  void **v2;
  void *v3;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v5;
    }
    while (v5);
  }
  v3 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v3)
    operator delete(v3);
  return a1;
}

_QWORD *sub_23ECBA224(_QWORD *result)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  *result = &off_250F5D760;
  v2 = (std::__shared_weak_count *)result[2];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_23ECBA298(_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  *a1 = &off_250F5D760;
  v1 = (std::__shared_weak_count *)a1[2];
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  JUMPOUT(0x24265E1B4);
}

void sub_23ECBA30C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23ECBA31C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250F5D790;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECBA34C(uint64_t a1)
{
  return sub_23ECBB348(a1 + 24);
}

uint64_t sub_23ECBA358(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t *v6;
  __int128 v7;
  uint64_t context;
  uint64_t plan;
  int v10;
  std::string::size_type v11;
  int v12;
  size_t v13;
  unint64_t v14;
  std::string *p_dst;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  const std::string::value_type *v19;
  std::string *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *i;
  std::runtime_error *exception;
  int v28;
  std::string __dst;
  void *__p[4];
  __int128 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v6 = (uint64_t *)(a1 + 16);
  *(_QWORD *)(a1 + 24) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    sub_23ECB9310((_BYTE *)(a1 + 32), *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
  }
  sub_23ECBAAA8(a1 + 56, a3);
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 1065353216;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_DWORD *)(a1 + 264) = 1065353216;
  if (!*(_BYTE *)(a3 + 28) && qword_256DCCB58 != -1)
    dispatch_once(&qword_256DCCB58, &unk_250F5D7F0);
  context = espresso_create_context();
  *v6 = context;
  if (!context)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso context.");
    goto LABEL_63;
  }
  plan = espresso_create_plan();
  *(_QWORD *)(a1 + 24) = plan;
  if (!plan)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso plan.");
LABEL_63:
    exception->__vftable = (std::runtime_error_vtbl *)&off_250F5D688;
    __cxa_throw(exception, (struct type_info *)&unk_250F5D660, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if (*(_BYTE *)(a3 + 52)
    && (LODWORD(__dst.__r_.__value_.__l.__data_) = espresso_plan_set_priority(),
        HIBYTE(__p[2]) = 20,
        strcpy((char *)__p, "Setting plan priorty"),
        sub_23ECB7D5C((int *)&__dst, (uint64_t *)__p),
        SHIBYTE(__p[2]) < 0))
  {
    operator delete(__p[0]);
    if ((*((char *)a2 + 23) & 0x80000000) == 0)
      goto LABEL_12;
  }
  else if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
LABEL_12:
    *(_OWORD *)__p = *a2;
    __p[2] = *((void **)a2 + 2);
    goto LABEL_15;
  }
  sub_23ECB9310(__p, *(void **)a2, *((_QWORD *)a2 + 1));
LABEL_15:
  v10 = *(char *)(a3 + 135);
  if (v10 >= 0)
    v11 = *(unsigned __int8 *)(a3 + 135);
  else
    v11 = *(_QWORD *)(a3 + 120);
  if (!v11)
    goto LABEL_40;
  v12 = SHIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v13 = HIBYTE(__p[2]);
  else
    v13 = (size_t)__p[1];
  v14 = v13 + 1;
  if (v13 + 1 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  if (v14 >= 0x17)
  {
    v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v16 = v14 | 7;
    v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v13 + 1;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_29;
  }
  memset(&__dst, 0, sizeof(__dst));
  p_dst = &__dst;
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v13 + 1;
  if (v13)
  {
LABEL_29:
    if (v12 >= 0)
      v18 = __p;
    else
      v18 = (void **)__p[0];
    memmove(p_dst, v18, v13);
  }
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v13) = 58;
  if (v10 >= 0)
    v19 = (const std::string::value_type *)(a3 + 112);
  else
    v19 = *(const std::string::value_type **)(a3 + 112);
  v20 = std::string::append(&__dst, v19, v11);
  v21 = (void *)v20->__r_.__value_.__r.__words[0];
  *(_QWORD *)&v31 = v20->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)&v31 + 7) = *(std::string::size_type *)((char *)&v20->__r_.__value_.__r.__words[1] + 7);
  v22 = HIBYTE(v20->__r_.__value_.__r.__words[2]);
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  __p[0] = v21;
  __p[1] = (void *)v31;
  *(void **)((char *)&__p[1] + 7) = *(void **)((char *)&v31 + 7);
  HIBYTE(__p[2]) = v22;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_40:
  LODWORD(v31) = espresso_plan_add_network();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_23ECC7B10;
  strcpy(__dst.__r_.__value_.__l.__data_, "Loading espresso Network");
  sub_23ECB7D5C((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (!*(_BYTE *)(a3 + 64))
      goto LABEL_45;
  }
  else if (!*(_BYTE *)(a3 + 64))
  {
    goto LABEL_45;
  }
  LODWORD(v31) = espresso_plan_share_intermediate_buffer();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_23ECC7B20;
  strcpy(__dst.__r_.__value_.__l.__data_, "Sharing intermediate buffer");
  sub_23ECB7D5C((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    v24 = *(_QWORD *)a3;
    v23 = *(_QWORD *)(a3 + 8);
    if (*(_QWORD *)a3 == v23)
      goto LABEL_51;
    goto LABEL_48;
  }
LABEL_45:
  v24 = *(_QWORD *)a3;
  v23 = *(_QWORD *)(a3 + 8);
  if (*(_QWORD *)a3 == v23)
    goto LABEL_51;
  do
  {
LABEL_48:
    LODWORD(v31) = espresso_network_declare_output();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_23ECC7B10;
    strcpy(__dst.__r_.__value_.__l.__data_, "Declaring network output");
    sub_23ECB7D5C((int *)&v31, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    v24 += 24;
  }
  while (v24 != v23);
LABEL_51:
  for (i = *(uint64_t **)(a3 + 88); i; i = (uint64_t *)*i)
  {
    v31 = *(_OWORD *)(i + 5);
    v32 = *((_DWORD *)i + 14);
    v28 = espresso_set_image_preprocessing_params();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_23ECC7B30;
    strcpy(__dst.__r_.__value_.__l.__data_, "Setting preprocessing params");
    sub_23ECB7D5C(&v28, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
  }
  LODWORD(v31) = espresso_plan_build();
  strcpy((char *)&__dst, "Building espresso plan");
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 22;
  sub_23ECB7D5C((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      return a1;
LABEL_60:
    operator delete(__p[0]);
    return a1;
  }
  if (SHIBYTE(__p[2]) < 0)
    goto LABEL_60;
  return a1;
}

void sub_23ECBA998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  sub_23ECB8F84(a10);
  sub_23ECB8F84(a11);
  sub_23ECBB3BC(a12);
  if (*(char *)(v29 + 55) < 0)
    operator delete(*a9);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBAAA8(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  _BYTE *v6;
  __int128 v7;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  sub_23ECBABF0((char *)a1, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v4 = *(_OWORD *)(a2 + 24);
  v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  sub_23ECBAD20(a1 + 72, a2 + 72);
  v6 = (_BYTE *)(a1 + 112);
  if (*(char *)(a2 + 135) < 0)
  {
    sub_23ECB9310(v6, *(void **)(a2 + 112), *(_QWORD *)(a2 + 120));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    *(_OWORD *)v6 = v7;
  }
  return a1;
}

void sub_23ECBAB60(_Unwind_Exception *exception_object)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;
  void **v7;
  void *v8;

  v4 = (void **)v1[11];
  if (v4)
    sub_23ECC6368(v4);
  v5 = *v2;
  *v2 = 0;
  if (v5)
  {
    operator delete(v5);
    v6 = (void **)*v1;
    if (!*v1)
LABEL_5:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v6 = (void **)*v1;
    if (!*v1)
      goto LABEL_5;
  }
  v7 = (void **)v1[1];
  v8 = v6;
  if (v7 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0)
        operator delete(*(v7 - 3));
      v7 -= 3;
    }
    while (v7 != v6);
    v8 = *v1;
  }
  v1[1] = v6;
  operator delete(v8);
  _Unwind_Resume(exception_object);
}

char *sub_23ECBABF0(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v5;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (a4)
  {
    v5 = result;
    if (a4 >= 0xAAAAAAAAAAAAAABLL)
      sub_23ECB1668();
    result = (char *)operator new(24 * a4);
    v8 = result;
    *v5 = result;
    v5[1] = result;
    v5[2] = &result[24 * a4];
    if (a2 != a3)
    {
      v9 = 0;
      do
      {
        result = &v8[v9];
        v10 = a2 + v9;
        if (*(char *)(a2 + v9 + 23) < 0)
        {
          result = (char *)sub_23ECB9310(result, *(void **)v10, *(_QWORD *)(v10 + 8));
        }
        else
        {
          *(_OWORD *)result = *(_OWORD *)v10;
          *((_QWORD *)result + 2) = *(_QWORD *)(v10 + 16);
        }
        v9 += 24;
      }
      while (a2 + v9 != a3);
      v8 += v9;
    }
    v5[1] = v8;
  }
  return result;
}

void sub_23ECBACD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_23ECB9EA8(&a9);
  _Unwind_Resume(a1);
}

void sub_23ECBACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0)
      operator delete(*(void **)(v10 + v11 - 24));
  }
  *(_QWORD *)(v9 + 8) = v10;
  sub_23ECB9EA8(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBAD20(uint64_t a1, uint64_t a2)
{
  size_t prime;
  int8x8_t v5;
  BOOL v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  prime = *(_QWORD *)(a2 + 8);
  if (prime == 1)
  {
    prime = 2;
LABEL_17:
    sub_23ECB87D0(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(*(_QWORD *)(a2 + 8));
    v5 = *(int8x8_t *)(a1 + 8);
    v6 = prime >= *(_QWORD *)&v5;
    if (prime > *(_QWORD *)&v5)
      goto LABEL_17;
  }
  else
  {
    v5 = 0;
    v6 = 1;
    if (prime)
      goto LABEL_17;
  }
  if (!v6)
  {
    v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v5 < 3uLL || (v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      v7 = std::__next_prime(v7);
    }
    else
    {
      v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2)
        v7 = v9;
    }
    if (prime <= v7)
      prime = v7;
    if (prime < *(_QWORD *)&v5)
      goto LABEL_17;
  }
LABEL_18:
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    sub_23ECBAE60(a1, (uint64_t)(i + 2), (uint64_t)(i + 2));
  return a1;
}

void sub_23ECBAE38(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23ECBA1BC(v1);
  _Unwind_Resume(a1);
}

void sub_23ECBAE4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_23ECBA1BC(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_23ECBAE60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  _BYTE *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t **v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _BYTE *v26;
  float v27;
  float v28;
  _QWORD *v29;
  _QWORD *v30;
  _BOOL8 v31;
  unint64_t v32;
  unint64_t v33;
  size_t prime;
  int8x8_t v35;
  unint64_t v36;
  uint8x8_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD v42[2];
  char v43;

  v5 = (_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = sub_23ECB72D0((uint64_t)v42, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v11)
        v3 = v9 % v11;
    }
    else
    {
      v3 = (v11 - 1) & v9;
    }
    v13 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v5[23];
        if (v15 >= 0)
          v16 = v5[23];
        else
          v16 = *((_QWORD *)v5 + 1);
        if (v15 < 0)
          v5 = *(_BYTE **)v5;
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = v14[1];
            if (v21 == v10)
            {
              v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0)
                v23 = *((unsigned __int8 *)v14 + 39);
              else
                v23 = v14[3];
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3]))
                    return v14;
                }
                else
                {
                  if (!*((_BYTE *)v14 + 39))
                    return v14;
                  v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24)
                      return v14;
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            v14 = (uint64_t *)*v14;
            if (!v14)
              goto LABEL_51;
          }
        }
        do
        {
          v17 = v14[1];
          if (v17 == v10)
          {
            v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0)
              v19 = *((unsigned __int8 *)v14 + 39);
            else
              v19 = v14[3];
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3]))
                  return v14;
              }
              else
              {
                if (!*((_BYTE *)v14 + 39))
                  return v14;
                v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20)
                    return v14;
                }
              }
            }
          }
          else
          {
            if (v17 >= v11)
              v17 %= v11;
            if (v17 != v3)
              break;
          }
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  v25 = (char *)operator new(0x40uLL);
  v42[0] = v25;
  v42[1] = a1 + 16;
  v43 = 0;
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = v10;
  v26 = v25 + 16;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_23ECB9310(v26, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)v26 = *(_OWORD *)a3;
    *((_QWORD *)v25 + 4) = *(_QWORD *)(a3 + 16);
  }
  *(_OWORD *)(v25 + 40) = *(_OWORD *)(a3 + 24);
  *((_DWORD *)v25 + 14) = *(_DWORD *)(a3 + 40);
  v43 = 1;
  v27 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v28 = *(float *)(a1 + 32);
  if (!v11 || (float)(v28 * (float)v11) < v27)
  {
    v31 = 1;
    if (v11 >= 3)
      v31 = (v11 & (v11 - 1)) != 0;
    v32 = v31 | (2 * v11);
    v33 = vcvtps_u32_f32(v27 / v28);
    if (v32 <= v33)
      prime = v33;
    else
      prime = v32;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v35 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v35)
      goto LABEL_68;
    if (prime < *(_QWORD *)&v35)
    {
      v36 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v35 < 3uLL || (v37 = (uint8x8_t)vcnt_s8(v35), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        v36 = std::__next_prime(v36);
      }
      else
      {
        v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2)
          v36 = v38;
      }
      if (prime <= v36)
        prime = v36;
      if (prime < *(_QWORD *)&v35)
LABEL_68:
        sub_23ECB87D0(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    v39 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        v3 = v10 % v11;
        v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v10 % v11));
        v30 = (_QWORD *)v42[0];
        if (v29)
          goto LABEL_57;
      }
      else
      {
        v3 = v10;
        v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v10);
        v30 = (_QWORD *)v42[0];
        if (v29)
          goto LABEL_57;
      }
    }
    else
    {
      v3 = v39 & v10;
      v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v39 & v10));
      v30 = (_QWORD *)v42[0];
      if (v29)
        goto LABEL_57;
    }
LABEL_81:
    *v30 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v42[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v42[0])
    {
      v40 = *(_QWORD *)(*(_QWORD *)v42[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v40 >= v11)
          v40 %= v11;
      }
      else
      {
        v40 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v40) = v42[0];
    }
    goto LABEL_92;
  }
  v29 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  v30 = (_QWORD *)v42[0];
  if (!v29)
    goto LABEL_81;
LABEL_57:
  *v30 = *v29;
  *v29 = v42[0];
LABEL_92:
  v14 = (uint64_t *)v42[0];
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_23ECBB2AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECBB2D8((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_23ECBB2C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECBB2D8((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23ECBB2D8(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16) && *(char *)(v2 + 39) < 0)
      operator delete(*(void **)(v2 + 16));
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t sub_23ECBB324()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_256DCCB50 = result;
  return result;
}

uint64_t sub_23ECBB348(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    espresso_plan_destroy();
  if (*(_QWORD *)(a1 + 16))
    espresso_context_destroy();
  sub_23ECB8F84(a1 + 232);
  sub_23ECB8F84(a1 + 192);
  sub_23ECBB3BC(a1 + 56);
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  return a1;
}

uint64_t sub_23ECBB3BC(uint64_t a1)
{
  void **v2;
  void *v3;
  void **v4;
  void **v5;
  void **v6;
  void **v7;

  if (*(char *)(a1 + 135) < 0)
  {
    operator delete(*(void **)(a1 + 112));
    v2 = *(void ***)(a1 + 88);
    if (!v2)
      goto LABEL_5;
  }
  else
  {
    v2 = *(void ***)(a1 + 88);
    if (!v2)
      goto LABEL_5;
  }
  do
  {
    v7 = (void **)*v2;
    if (*((char *)v2 + 39) < 0)
      operator delete(v2[2]);
    operator delete(v2);
    v2 = v7;
  }
  while (v7);
LABEL_5:
  v3 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;
  if (v3)
    operator delete(v3);
  v4 = *(void ***)a1;
  if (*(_QWORD *)a1)
  {
    v5 = *(void ***)(a1 + 8);
    v6 = *(void ***)a1;
    if (v5 != v4)
    {
      do
      {
        if (*((char *)v5 - 1) < 0)
          operator delete(*(v5 - 3));
        v5 -= 3;
      }
      while (v5 != v4);
      v6 = *(void ***)a1;
    }
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v6);
  }
  return a1;
}

void sub_23ECBB488(void **a1)
{
  operator delete(*a1);
}

void sub_23ECBB594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBB6A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_23ECBB6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBB704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBB810(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_23ECBB828(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBB838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBB848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBB934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBB94C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_23ECBBA58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23ECBBA7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBBD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_23ECBBE90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBBEA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBBEB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBBEC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBBFC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBBFD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBBFE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBBFF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBC17C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBC194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBC1A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23ECBC1C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBC25C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBC274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECBC3B0(_Unwind_Exception *a1)
{
  CFTypeRef **v1;
  CFTypeRef *v3;

  v3 = *v1;
  *v1 = 0;
  if (v3)
  {
    if (*v3)
      CFRelease(*v3);
    MEMORY[0x24265E1B4](v3, 0x20C4093837F09);
  }
  MEMORY[0x24265E1B4](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_23ECBC558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v14;
  void *v15;

  __cxa_free_exception(v15);
  MEMORY[0x24265E1B4](v14, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBC5D4(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v6;
  const void *v7;
  CFNumberRef v8;
  CVReturn v9;
  __CVBuffer *v10;
  std::runtime_error *exception;
  std::runtime_error *v13;
  std::string *v14;
  __int128 v15;
  std::string v16;
  std::string v17;
  __CFDictionary *v18;
  CVPixelBufferRef pixelBufferOut;

  if (!*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  pixelBufferOut = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v18 = Mutable;
  if (*(_BYTE *)(a2 + 20))
  {
    v6 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v7 = (const void *)*MEMORY[0x24BDC5668];
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
    CFDictionarySetValue(Mutable, v7, v6);
    if (v6)
      CFRelease(v6);
  }
  if (*(_BYTE *)(a2 + 32))
  {
    v8 = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(a2 + 24));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], v8);
    CFRelease(v8);
  }
  v9 = CVPixelBufferCreate(v4, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16), Mutable, &pixelBufferOut);
  if (v9)
  {
    v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v16, v9);
    v14 = std::string::insert(&v16, 0, "Failed to create CVPixelBuffer. Status = ");
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v13, &v17);
    __cxa_throw(v13, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v10 = pixelBufferOut;
  if (Mutable)
    CFRelease(Mutable);
  sub_23ECB62BC(a1, v10);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 40) + 8));
  return a1;
}

void sub_23ECBC7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,const void *a23)
{
  void *v23;
  int v24;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v24 & 1) == 0)
    {
LABEL_8:
      sub_23ECBD30C(&a23);
      _Unwind_Resume(a1);
    }
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);
  sub_23ECBD30C(&a23);
  _Unwind_Resume(a1);
}

CFTypeRef **sub_23ECBC89C(CFTypeRef **a1)
{
  CFTypeRef *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*v2)
      CFRelease(*v2);
    MEMORY[0x24265E1B4](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_23ECBC9B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBC9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBCBBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB0E40((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23ECBCC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECBCC6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Class sub_23ECBCD98(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_256DCCB68)
  {
    qword_256DCCB68 = _sl_dlopen();
    if (!qword_256DCCB68)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNCreateSceneprintRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)sub_23ECC63A8();
    free(v3);
  }
  qword_256DCCB60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_23ECBCE8C(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_256DCCB68)
  {
    qword_256DCCB68 = _sl_dlopen();
    if (!qword_256DCCB68)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VNImageRequestHandler");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)sub_23ECC63CC();
    free(v3);
  }
  qword_256DCCB70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23ECBCF80@<X0>(VTPixelTransferSessionRef **a1@<X8>)
{
  VTPixelTransferSessionRef *v2;
  uint64_t v3;
  uint64_t result;
  std::runtime_error *exception;

  v2 = (VTPixelTransferSessionRef *)operator new();
  *v2 = 0;
  v3 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v2);
  result = sub_23ECBD058(v3, "Session Creation");
  if (!*v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PixelBufferTransfer internal inconsistency: null session.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  *a1 = v2;
  return result;
}

void sub_23ECBD024(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  __cxa_free_exception(v2);
  MEMORY[0x24265E1B4](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBD058(uint64_t result, char *a2)
{
  int v2;
  std::runtime_error *exception;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  std::string::size_type size;
  std::string *v11;
  __int128 v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;
  std::string v17;

  if ((_DWORD)result)
  {
    v2 = result;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_23ECBD25C(&v14, a2);
    v5 = std::string::insert(&v14, 0, "PixelBufferTransfer operation [");
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    v7 = std::string::append(&v15, "] failed. Status = ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, v2);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v13;
    else
      v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    else
      size = v13.__r_.__value_.__l.__size_;
    v11 = std::string::append(&v16, (const std::string::value_type *)v9, size);
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_23ECBD170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  int v34;
  uint64_t v35;

  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a28);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0)
LABEL_14:
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34)
    goto LABEL_14;
  goto LABEL_13;
}

_QWORD *sub_23ECBD25C(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
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

const void **sub_23ECBD30C(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_23ECBD340(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24265E1B4);
}

uint64_t sub_23ECBD364(uint64_t result)
{
  CFTypeRef **v1;
  CFTypeRef *v2;

  v1 = *(CFTypeRef ***)(result + 24);
  if (v1)
  {
    v2 = *v1;
    *v1 = 0;
    if (v2)
    {
      if (*v2)
        CFRelease(*v2);
      MEMORY[0x24265E1B4](v2, 0x20C4093837F09);
    }
    JUMPOUT(0x24265E1B4);
  }
  return result;
}

uint64_t sub_23ECBD3D8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t sub_23ECBD448(void *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_opt_new();
  v6 = objc_msgSend_toCVPixelBufferRefWithCIContext_(a1, v3, (uint64_t)v2, v4, v5);

  return v6;
}

void sub_23ECBD48C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CVPixelBufferRef sub_23ECBD49C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  CVPixelBufferRef v18;
  CVPixelBufferRef pixelBufferOut;

  v4 = a3;
  objc_msgSend_extent(a1, v5, v6, v7, v8);
  v10 = v9;
  objc_msgSend_extent(a1, v11, v12, v13, v14);
  pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v10, (unint64_t)v15, 0x42475241u, 0, &pixelBufferOut);
  objc_msgSend_render_toCVPixelBuffer_(v4, v16, (uint64_t)a1, (uint64_t)pixelBufferOut, v17);
  v18 = pixelBufferOut;

  return v18;
}

void sub_23ECBD52C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBD53C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBD54C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBD96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;
  int v26;
  uint64_t v27;

  if (a25 < 0)
    operator delete(__p);
  if (a19 < 0)
  {
    operator delete(a14);
    if ((v26 & 1) == 0)
    {
LABEL_8:
      sub_23ECBD30C((const void **)(v27 - 80));
      _Unwind_Resume(a1);
    }
  }
  else if (!v26)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v25);
  goto LABEL_8;
}

uint64_t sub_23ECBDA54(uint64_t a1)
{
  std::runtime_error *exception;

  *(_QWORD *)a1 = &off_250F5D640;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(_QWORD *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return a1;
}

void sub_23ECBDAC0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_23ECBDBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  void *v11;

  __cxa_free_exception(v11);
  MEMORY[0x24265E1B4](v10, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_23ECBDC08(uint64_t a1)
{
  std::runtime_error *exception;

  *(_QWORD *)a1 = &off_250F5D640;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(_QWORD *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  JUMPOUT(0x24265E1B4);
}

void sub_23ECBDC90(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  __cxa_free_exception(v2);
  MEMORY[0x24265E1B4](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECBDCC4(uint64_t result, char *a2)
{
  int v2;
  std::runtime_error *exception;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  std::string::size_type size;
  std::string *v11;
  __int128 v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;
  std::string v17;

  if ((_DWORD)result)
  {
    v2 = result;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_23ECBD25C(&v14, a2);
    v5 = std::string::insert(&v14, 0, "PixelBufferTransfer operation [");
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    v7 = std::string::append(&v15, "] failed. Status = ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, v2);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v13;
    else
      v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    else
      size = v13.__r_.__value_.__l.__size_;
    v11 = std::string::append(&v16, (const std::string::value_type *)v9, size);
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  return result;
}

void sub_23ECBDDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  int v34;
  uint64_t v35;

  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a28);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0)
LABEL_14:
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34)
    goto LABEL_14;
  goto LABEL_13;
}

void sub_23ECBDF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n128 sub_23ECBDF7C@<Q0>(_QWORD *__s@<X0>, uint64_t a2@<X8>)
{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  char *v7;
  void *v8;
  char *v9;
  unint64_t v10;
  _QWORD *v11;
  __int128 *p_dst;
  size_t v13;
  _QWORD *v14;
  int64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  unint64_t v21;
  _QWORD *v22;
  __int128 *v23;
  size_t v24;
  _QWORD *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  void *v30;
  _BYTE *v31;
  size_t v32;
  _QWORD *v33;
  __int128 *v34;
  uint64_t v35;
  uint64_t v36;
  __n128 result;
  __int128 __dst;
  unint64_t v39;

  v4 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    v5 = (_QWORD *)*__s;
    v6 = __s[1];
    v7 = (char *)(*__s + v6);
    if (v6 < 1)
      goto LABEL_9;
  }
  else
  {
    v5 = __s;
    v6 = *((unsigned __int8 *)__s + 23);
    v7 = (char *)__s + v4;
    if (!*((_BYTE *)__s + 23))
      goto LABEL_9;
  }
  v8 = v5;
  do
  {
    v9 = (char *)memchr(v8, 47, v6);
    if (!v9)
      break;
    if (*v9 == 47)
      goto LABEL_10;
    v8 = v9 + 1;
    v6 = v7 - (_BYTE *)v8;
  }
  while (v7 - (_BYTE *)v8 > 0);
LABEL_9:
  v9 = v7;
LABEL_10:
  if (v9 == v7)
    v10 = 0;
  else
    v10 = v9 - (char *)v5 + 1;
  if ((v4 & 0x80) != 0)
  {
    v4 = __s[1];
    if (v4 < v10)
      goto LABEL_86;
    v11 = (_QWORD *)*__s;
  }
  else
  {
    v11 = __s;
    if (v10 > v4)
LABEL_86:
      sub_23ECC2244();
  }
  if (v4 - v10 < v4)
    v4 -= v10;
  if (v4 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_85;
  if (v4 >= 0x17)
  {
    v17 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v17 = v4 | 7;
    v18 = v17 + 1;
    p_dst = (__int128 *)operator new(v17 + 1);
    *((_QWORD *)&__dst + 1) = v4;
    v39 = v18 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
LABEL_30:
    memmove(p_dst, (char *)v11 + v10, v4);
    *((_BYTE *)p_dst + v4) = 0;
    if ((*((char *)__s + 23) & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_31;
  }
  HIBYTE(v39) = v4;
  p_dst = &__dst;
  if (v4)
    goto LABEL_30;
  LOBYTE(__dst) = 0;
  if ((*((char *)__s + 23) & 0x80000000) == 0)
    goto LABEL_24;
LABEL_31:
  operator delete((void *)*__s);
LABEL_24:
  *(_OWORD *)__s = __dst;
  __s[2] = v39;
  v13 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    v14 = (_QWORD *)*__s;
    v15 = __s[1];
    v16 = (char *)(*__s + v15);
    if (v15 < 1)
      goto LABEL_37;
  }
  else
  {
    v14 = __s;
    v15 = *((unsigned __int8 *)__s + 23);
    v16 = (char *)__s + v13;
    if (!*((_BYTE *)__s + 23))
      goto LABEL_37;
  }
  v19 = v14;
  do
  {
    v20 = (char *)memchr(v19, 47, v15);
    if (!v20)
      break;
    if (*v20 == 47)
      goto LABEL_38;
    v19 = v20 + 1;
    v15 = v16 - (_BYTE *)v19;
  }
  while (v16 - (_BYTE *)v19 > 0);
LABEL_37:
  v20 = v16;
LABEL_38:
  v21 = v20 - (char *)v14;
  if (v20 == v16)
    v21 = -1;
  if ((v13 & 0x80) != 0)
  {
    v22 = (_QWORD *)*__s;
    v13 = __s[1];
    if (v13 >= v21)
      v13 = v21;
    if (v13 <= 0x7FFFFFFFFFFFFFF7)
      goto LABEL_48;
LABEL_85:
    sub_23ECB1D38();
  }
  v22 = __s;
  if (v13 >= v21)
    v13 = v21;
  if (v13 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_85;
LABEL_48:
  if (v13 >= 0x17)
  {
    v27 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v27 = v13 | 7;
    v28 = v27 + 1;
    v23 = (__int128 *)operator new(v27 + 1);
    *((_QWORD *)&__dst + 1) = v13;
    v39 = v28 | 0x8000000000000000;
    *(_QWORD *)&__dst = v23;
LABEL_57:
    memmove(v23, v22, v13);
    *((_BYTE *)v23 + v13) = 0;
    if ((*((char *)__s + 23) & 0x80000000) == 0)
      goto LABEL_51;
    goto LABEL_58;
  }
  HIBYTE(v39) = v13;
  v23 = &__dst;
  if (v13)
    goto LABEL_57;
  LOBYTE(__dst) = 0;
  if ((*((char *)__s + 23) & 0x80000000) == 0)
    goto LABEL_51;
LABEL_58:
  operator delete((void *)*__s);
LABEL_51:
  *(_OWORD *)__s = __dst;
  __s[2] = v39;
  v24 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    v25 = (_QWORD *)*__s;
    v26 = __s[1];
    if (v26 < 1)
      goto LABEL_81;
  }
  else
  {
    v25 = __s;
    v26 = *((unsigned __int8 *)__s + 23);
    if (!*((_BYTE *)__s + 23))
      goto LABEL_81;
  }
  v29 = (char *)v25 + v26;
  v30 = v25;
  while (1)
  {
    v31 = memchr(v30, 95, v26);
    if (!v31)
      goto LABEL_81;
    if (*v31 == 95)
      break;
    v30 = v31 + 1;
    v26 = v29 - (_BYTE *)v30;
    if (v29 - (_BYTE *)v30 < 1)
      goto LABEL_81;
  }
  if (v31 != v29)
  {
    v32 = v31 - (_BYTE *)v25;
    if (v31 - (_BYTE *)v25 != -1)
    {
      if ((v24 & 0x80) != 0)
      {
        v33 = (_QWORD *)*__s;
        v24 = __s[1];
        if (v24 >= v32)
          v24 = v32;
        if (v24 > 0x7FFFFFFFFFFFFFF7)
          goto LABEL_85;
      }
      else
      {
        v33 = __s;
        if (v24 >= v32)
          v24 = v32;
        if (v24 > 0x7FFFFFFFFFFFFFF7)
          goto LABEL_85;
      }
      if (v24 >= 0x17)
      {
        v35 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v24 | 7) != 0x17)
          v35 = v24 | 7;
        v36 = v35 + 1;
        v34 = (__int128 *)operator new(v35 + 1);
        *((_QWORD *)&__dst + 1) = v24;
        v39 = v36 | 0x8000000000000000;
        *(_QWORD *)&__dst = v34;
      }
      else
      {
        HIBYTE(v39) = v24;
        v34 = &__dst;
        if (!v24)
          goto LABEL_78;
      }
      memmove(v34, v33, v24);
LABEL_78:
      *((_BYTE *)v34 + v24) = 0;
      if (*((char *)__s + 23) < 0)
        operator delete((void *)*__s);
      *(_OWORD *)__s = __dst;
      __s[2] = v39;
    }
  }
LABEL_81:
  result = *(__n128 *)__s;
  *(_OWORD *)a2 = *(_OWORD *)__s;
  *(_QWORD *)(a2 + 16) = __s[2];
  __s[1] = 0;
  __s[2] = 0;
  *__s = 0;
  return result;
}

void sub_23ECBE3A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBE3F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECBF350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  void *v47;
  void *v48;

  _Unwind_Resume(a1);
}

void sub_23ECBFA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  void *v42;
  void *v43;
  void *v44;

  sub_23ECAD948(&a35);
  sub_23ECB4CDC(&a42);

  _Unwind_Resume(a1);
}

void sub_23ECC0000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  void *v39;
  void *v40;
  uint64_t v41;

  sub_23ECAD948(&a13);
  sub_23ECAD948(&a39);
  sub_23ECB4CDC((_QWORD *)(v41 - 240));

  _Unwind_Resume(a1);
}

void sub_23ECC0304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  _QWORD *v17;

  sub_23ECAD948(v17);
  if (v16)
    operator delete(v16);

  _Unwind_Resume(a1);
}

void sub_23ECC1580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;
  void *v67;
  int v68;

  if (v68 < 0)
    operator delete(__p);

  sub_23ECB8F84((uint64_t)&a20);
  sub_23ECB5E38(&a34);
  sub_23ECAD948(&a53);
  sub_23ECAD948(&a60);

  _Unwind_Resume(a1);
}

void sub_23ECC18A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECC18B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC18C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECC18E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC1964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECC197C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_23ECC1CD4(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECC1E0C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECC1E30(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECC1F68(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECC1F8C(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECC20C4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECC20E8(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECC2220(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

void sub_23ECC2244()
{
  sub_23ECB7054("basic_string");
}

char *sub_23ECC2258(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  char *v14;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_23ECB1668();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_23ECB680C();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v3];
  v9 = &v7[24 * v6];
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v10 = v8 + 24;
  v11 = (char *)*a1;
  v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12)
      return v10;
    goto LABEL_20;
  }
  do
  {
    v13 = *(_OWORD *)(v12 - 24);
    *((_QWORD *)v8 - 1) = *((_QWORD *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((_QWORD *)v12 - 2) = 0;
    *((_QWORD *)v12 - 1) = 0;
    *((_QWORD *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  v14 = (char *)*a1;
  v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0)
        operator delete(*((void **)v12 - 3));
      v12 -= 24;
    }
    while (v12 != v14);
    v12 = v14;
  }
  if (v12)
LABEL_20:
    operator delete(v12);
  return v10;
}

uint64_t getImageHarmonizationKitVersion()
{
  return 20230629;
}

void sub_23ECC24DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC2560(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC25F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC27C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECC27D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC288C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC28EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)IHKHarmonizationRequest;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_23ECC29C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC2A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)IHKHarmonizationResult;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_23ECC2B34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC2B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23ECC2F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  va_list va;

  va_start(va, a13);
  sub_23ECB4CDC((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_23ECC2FCC(const char **a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  const char *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void **v12;
  void *v13;
  void **v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  void *v30[2];
  void *v31[2];
  int v32;
  void *__p;
  char v34;
  __int128 __dst;
  unint64_t v36;

  v4 = (_QWORD *)operator new();
  v5 = *a1;
  v6 = strlen(*a1);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (__int128 *)operator new(v9 + 1);
    *((_QWORD *)&__dst + 1) = v7;
    v36 = v10 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v36) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_8:
    memmove(p_dst, v5, v7);
  *((_BYTE *)p_dst + v7) = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v21 = 0;
  v25 = 0xFFFFFFFFLL;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  *(_OWORD *)v30 = 0u;
  *(_OWORD *)v31 = 0u;
  v32 = 1065353216;
  v34 = 0;
  LOBYTE(__p) = 0;
  *v4 = &off_250F5D760;
  v11 = operator new(0x128uLL);
  v11[1] = 0;
  v11[2] = 0;
  *v11 = &off_250F5D790;
  v4[1] = sub_23ECBA358((uint64_t)(v11 + 3), &__dst, (uint64_t)&v18);
  v4[2] = v11;
  *a2 = v4;
  if (v34 < 0)
    operator delete(__p);
  v12 = (void **)v31[0];
  if (v31[0])
  {
    do
    {
      v17 = (void **)*v12;
      if (*((char *)v12 + 39) < 0)
        operator delete(v12[2]);
      operator delete(v12);
      v12 = v17;
    }
    while (v17);
  }
  v13 = v30[0];
  v30[0] = 0;
  if (v13)
    operator delete(v13);
  v14 = (void **)v18;
  if (v18)
  {
    v15 = v19;
    v16 = v18;
    if (v19 != v18)
    {
      do
      {
        if (*((char *)v15 - 1) < 0)
          operator delete(*(v15 - 3));
        v15 -= 3;
      }
      while (v15 != v14);
      v16 = v18;
    }
    v19 = v14;
    operator delete(v16);
  }
  if (SHIBYTE(v36) < 0)
    operator delete((void *)__dst);
}

void sub_23ECC31EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  void *v13;

  std::__shared_weak_count::~__shared_weak_count(v10);
  operator delete(v13);
  sub_23ECBB3BC((uint64_t)&a9);
  if (*(char *)(v11 - 49) < 0)
    operator delete(*(void **)(v11 - 72));
  MEMORY[0x24265E1B4](v9, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void sub_23ECC32F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23ECC3314(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23ECC39A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,void *__p,uint64_t a33)
{
  void *v33;

  if (__p)
  {
    a33 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a20 < 0)
    operator delete(a15);
  sub_23ECB8F84((uint64_t)&a24);

  _Unwind_Resume(a1);
}

void sub_23ECC3A54(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  void **v10;
  void *v11;
  void *__p;
  void **v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(v6 + 56);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 == v8)
  {
    sub_23ECC3CCC((uint64_t)&__p);
  }
  else
  {
    __p = 0;
    v13 = 0;
    v14 = 0;
    sub_23ECBABF0((char *)&__p, v7, v8, 0xAAAAAAAAAAAAAAABLL * ((v8 - v7) >> 3));
  }
  sub_23ECB5A28(a1, a2, (__int128 **)&__p, a3);
  v9 = (void **)__p;
  if (__p)
  {
    v10 = v13;
    v11 = __p;
    if (v13 != __p)
    {
      do
      {
        if (*((char *)v10 - 1) < 0)
          operator delete(*(v10 - 3));
        v10 -= 3;
      }
      while (v10 != v9);
      v11 = __p;
    }
    v13 = v9;
    operator delete(v11);
  }
}

void sub_23ECC3B28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECB5E38((void **)va);
  _Unwind_Resume(a1);
}

const char *sub_23ECC3CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  const char *result;
  const char *v5;
  char *v6;
  size_t v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v2 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  v12 = 0;
  while (1)
  {
    result = (const char *)espresso_get_output_blob_name();
    v5 = result;
    v12 = result;
    if (!result)
      return result;
    v6 = *(char **)(a1 + 8);
    if ((unint64_t)v6 >= *(_QWORD *)(a1 + 16))
    {
      v3 = sub_23ECC3E1C((void **)a1, &v12);
      goto LABEL_3;
    }
    v7 = strlen(result);
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      sub_23ECB1D38();
    v8 = v7;
    if (v7 >= 0x17)
    {
      v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17)
        v10 = v7 | 7;
      v11 = v10 + 1;
      v9 = operator new(v10 + 1);
      *((_QWORD *)v6 + 1) = v8;
      *((_QWORD *)v6 + 2) = v11 | 0x8000000000000000;
      *(_QWORD *)v6 = v9;
    }
    else
    {
      v6[23] = v7;
      v9 = v6;
      if (!v7)
        goto LABEL_14;
    }
    memmove(v9, v5, v8);
LABEL_14:
    *((_BYTE *)v9 + v8) = 0;
    v3 = v6 + 24;
    *(_QWORD *)(a1 + 8) = v6 + 24;
LABEL_3:
    *(_QWORD *)(a1 + 8) = v3;
    ++v2;
  }
}

void sub_23ECC3DEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  if (*(_QWORD *)v1)
    sub_23ECC63F0((void **)(v1 + 8), *(void ***)v1, (void **)v1);
  _Unwind_Resume(exception_object);
}

char *sub_23ECC3E1C(void **a1, const char **a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  const char *v9;
  size_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  char *v20;
  char *v22;
  char *v23;
  char *v24;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_23ECB1668();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_23ECB680C();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v3];
  v22 = v8;
  v23 = v8;
  v24 = &v7[24 * v6];
  v9 = *a2;
  v10 = strlen(*a2);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v16 = v10 | 7;
    v17 = v16 + 1;
    v18 = (char *)operator new(v16 + 1);
    *((_QWORD *)v8 + 1) = v11;
    *((_QWORD *)v8 + 2) = v17 | 0x8000000000000000;
    *(_QWORD *)v8 = v18;
    v8 = v18;
  }
  else
  {
    v8[23] = v10;
    if (!v10)
    {
      *v8 = 0;
      v12 = v8;
      v13 = v8 + 24;
      v14 = (char *)*a1;
      v15 = (char *)a1[1];
      if (v15 == *a1)
        goto LABEL_23;
      goto LABEL_20;
    }
  }
  memmove(v8, v9, v11);
  v8[v11] = 0;
  v12 = v22;
  v13 = v23 + 24;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == *a1)
  {
LABEL_23:
    *a1 = v12;
    a1[1] = v13;
    a1[2] = v24;
    goto LABEL_28;
  }
  do
  {
LABEL_20:
    v19 = *(_OWORD *)(v15 - 24);
    *((_QWORD *)v12 - 1) = *((_QWORD *)v15 - 1);
    *(_OWORD *)(v12 - 24) = v19;
    v12 -= 24;
    *((_QWORD *)v15 - 2) = 0;
    *((_QWORD *)v15 - 1) = 0;
    *((_QWORD *)v15 - 3) = 0;
    v15 -= 24;
  }
  while (v15 != v14);
  v20 = (char *)*a1;
  v15 = (char *)a1[1];
  *a1 = v12;
  a1[1] = v13;
  a1[2] = v24;
  if (v15 != v20)
  {
    do
    {
      if (*(v15 - 1) < 0)
        operator delete(*((void **)v15 - 3));
      v15 -= 24;
    }
    while (v15 != v20);
    v15 = v20;
  }
LABEL_28:
  if (v15)
    operator delete(v15);
  return v13;
}

void sub_23ECC4038(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_23ECC404C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23ECC404C(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v5;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_23ECC40B0(uint64_t a1, const char **a2, uint64_t a3)
{
  const char *v5;
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v5 = *a2;
  v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_23ECB1D38();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v10 | 0x8000000000000000;
    *(_QWORD *)a1 = v8;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 23) = v6;
  v8 = (void *)a1;
  if (v6)
LABEL_8:
    memmove(v8, v5, v7);
  *((_BYTE *)v8 + v7) = 0;
  v11 = *(_DWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = &off_250F5D430;
  *(_DWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v13 = *(_BYTE **)(a3 + 16);
  v12 = *(_BYTE **)(a3 + 24);
  v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0)
      sub_23ECB1668();
    v15 = (char *)operator new(v12 - v13);
    *(_QWORD *)(a1 + 40) = v15;
    *(_QWORD *)(a1 + 48) = v15;
    v16 = &v15[8 * (v14 >> 3)];
    *(_QWORD *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 48) = v16;
  }
  v17 = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(a1 + 72) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  return a1;
}

void sub_23ECC41E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_23ECC62A4((void **)v1);
  _Unwind_Resume(a1);
}

void sub_23ECC43B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t sub_23ECC4430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = v1;
  if (v1 == 1)
  {
    v2 = (uint64_t)MTLCreateSystemDefaultDevice();
    v3 = *(_QWORD *)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v2;
    swift_unknownObjectRetain();
    sub_23ECC4638(v3);
  }
  sub_23ECC4648(v1);
  return v2;
}

uint64_t sub_23ECC4488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  return sub_23ECC4638(v2);
}

uint64_t (*sub_23ECC4498(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_23ECC4430();
  return sub_23ECC44CC;
}

uint64_t sub_23ECC44CC(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = *a1;
  if ((a2 & 1) == 0)
    return sub_23ECC4638(v3);
  swift_unknownObjectRetain();
  sub_23ECC4638(v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23ECC4518()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t result;
  void *v9;
  id v10;

  v1 = v0[3];
  v2 = (id)v1;
  if (v1 != 1)
    goto LABEL_5;
  v3 = (id)(*(uint64_t (**)(void))(*v0 + 112))();
  if (v3)
  {
    v4 = v3;
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v10 = 0;
    v2 = objc_msgSend(v4, sel_newDefaultLibraryWithBundle_error_, v6, &v10);

    swift_unknownObjectRelease();
    v3 = v10;
    if (v2)
    {
      v7 = v0[3];
      v0[3] = v2;
      swift_unknownObjectRetain();
      sub_23ECC4638(v7);
LABEL_5:
      sub_23ECC4648(v1);
      return (uint64_t)v2;
    }
  }
  else
  {
    __break(1u);
  }
  v9 = v3;
  sub_23ECC6454();

  swift_willThrow();
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_23ECC4638(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRelease();
  return result;
}

uint64_t sub_23ECC4648(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRetain();
  return result;
}

uint64_t sub_23ECC4658(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;
  return sub_23ECC4638(v2);
}

uint64_t (*sub_23ECC4668(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_23ECC4518();
  return sub_23ECC469C;
}

uint64_t sub_23ECC469C(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = *a1;
  if ((a2 & 1) == 0)
    return sub_23ECC4638(v3);
  swift_unknownObjectRetain();
  sub_23ECC4638(v3);
  return swift_unknownObjectRelease();
}

id sub_23ECC46E8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id result;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v2;
  v4 = v2[4];
  v5 = (id)v4;
  if (v4 != 1)
    goto LABEL_5;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(*v3 + 112);
  result = (id)v6(a1, a2);
  if (result)
  {
    v8 = objc_msgSend(result, sel_name);
    swift_unknownObjectRelease();
    sub_23ECC64A8();

    sub_23ECC64B4();
    swift_bridgeObjectRelease();
    sub_23ECC6460();
    v9 = swift_bridgeObjectRelease();
    result = (id)((uint64_t (*)(uint64_t))v6)(v9);
    if (result)
    {
      v5 = objc_msgSend(result, sel_newCommandQueue);
      swift_unknownObjectRelease();
      v10 = v3[4];
      v3[4] = v5;
      swift_unknownObjectRetain();
      sub_23ECC4638(v10);
LABEL_5:
      sub_23ECC4648(v4);
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23ECC4810(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;
  return sub_23ECC4638(v2);
}

uint64_t (*sub_23ECC4820(id *a1, uint64_t a2))(_QWORD *a1, char a2)
{
  void *v2;

  a1[1] = v2;
  *a1 = sub_23ECC46E8((uint64_t)a1, a2);
  return sub_23ECC4854;
}

uint64_t sub_23ECC4854(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 32) = *a1;
  if ((a2 & 1) == 0)
    return sub_23ECC4638(v3);
  swift_unknownObjectRetain();
  sub_23ECC4638(v3);
  return swift_unknownObjectRelease();
}

unint64_t sub_23ECC48A0()
{
  unint64_t result;

  result = qword_256DCC490;
  if (!qword_256DCC490)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DCC490);
  }
  return result;
}

unint64_t sub_23ECC48DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DCC498;
  if (!qword_256DCC498)
  {
    v1 = sub_23ECC64CC();
    result = MEMORY[0x24265E6E8](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_256DCC498);
  }
  return result;
}

uint64_t sub_23ECC4924(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265E6D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23ECC4964()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DCC4A8;
  if (!qword_256DCC4A8)
  {
    v1 = sub_23ECC49B0(&qword_256DCC4A0);
    result = MEMORY[0x24265E6E8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256DCC4A8);
  }
  return result;
}

uint64_t sub_23ECC49B0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24265E6DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23ECC49F4()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_23ECC4A28();
  return v0;
}

int64x2_t *sub_23ECC4A28()
{
  int64x2_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v6[2];

  v1 = sub_23ECC64D8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23ECC64CC();
  MEMORY[0x24BDAC7A8]();
  sub_23ECC6478();
  MEMORY[0x24BDAC7A8]();
  v0[1] = vdupq_n_s64(1uLL);
  v0[2].i64[0] = 1;
  sub_23ECC48A0();
  sub_23ECC646C();
  v6[1] = MEMORY[0x24BEE4AF8];
  sub_23ECC48DC();
  sub_23ECC4924(&qword_256DCC4A0);
  sub_23ECC4964();
  sub_23ECC64F0();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  v0[2].i64[1] = sub_23ECC64E4();
  (*(void (**)(void))(v0->i64[0] + 200))();
  return v0;
}

uint64_t sub_23ECC4BDC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t result;
  void *v9;
  id v10[4];

  v10[3] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
  if (!v1)
    __break(1u);
  v2 = (void *)v1;
  v3 = (void *)sub_23ECC649C();
  v4 = objc_msgSend(v2, sel_newFunctionWithName_, v3);

  v5 = swift_unknownObjectRelease();
  if (!v4)
    return 0;
  v6 = (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 112))(v5);
  if (v6)
  {
    v10[0] = 0;
    v7 = objc_msgSend(v6, sel_newComputePipelineStateWithFunction_error_, v4, v10);
    swift_unknownObjectRelease();
    v6 = v10[0];
    if (v7)
    {
      swift_unknownObjectRelease();
      return (uint64_t)v7;
    }
  }
  else
  {
    __break(1u);
  }
  v9 = v6;
  sub_23ECC6454();

  swift_willThrow();
  v10[0] = 0;
  v10[1] = (id)0xE000000000000000;
  sub_23ECC64FC();
  sub_23ECC64B4();
  sub_23ECC4924(&qword_256DCC4B0);
  sub_23ECC6508();
  result = sub_23ECC6514();
  __break(1u);
  return result;
}

uint64_t sub_23ECC4DA4(CGImage *a1)
{
  uint64_t v1;
  void *v3;
  size_t Width;
  id v5;
  void *v6;
  id v7;
  size_t v8;
  size_t Height;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGDataProvider *v16;
  CGDataProvider *v17;
  const __CFData *v18;
  const UInt8 *BytePtr;
  size_t BytesPerRow;
  uint64_t result;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (void *)objc_opt_self();
  Width = CGImageGetWidth(a1);
  v5 = objc_msgSend(v3, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, Width, CGImageGetHeight(a1), 0);
  v6 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 112))();
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  v7 = objc_msgSend(v6, sel_newTextureWithDescriptor_, v5);
  swift_unknownObjectRelease();
  if (v7)
  {
    v22 = v5;
    v8 = CGImageGetWidth(a1);
    Height = CGImageGetHeight(a1);
    sub_23ECC4F70(v8, Height, &v23);
    v10 = v23;
    v11 = v24;
    v12 = v25;
    v13 = v26;
    v15 = v27;
    v14 = v28;
    v16 = CGImageGetDataProvider(a1);
    if (v16)
    {
      v17 = v16;
      v18 = CGDataProviderCopyData(v16);

      BytePtr = CFDataGetBytePtr(v18);
      if (BytePtr)
      {
        BytesPerRow = CGImageGetBytesPerRow(a1);
        v23 = v10;
        v24 = v11;
        v25 = v12;
        v26 = v13;
        v27 = v15;
        v28 = v14;
        objc_msgSend(v7, sel_replaceRegion_mipmapLevel_withBytes_bytesPerRow_, &v23, 0, BytePtr, BytesPerRow);

        return (uint64_t)v7;
      }
      goto LABEL_8;
    }
LABEL_7:
    __break(1u);
LABEL_8:
    __break(1u);
  }
  result = sub_23ECC6514();
  __break(1u);
  return result;
}

uint64_t sub_23ECC4F70@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  a3[3] = result;
  a3[4] = a2;
  a3[5] = 1;
  return result;
}

uint64_t sub_23ECC4F84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *))
{
  uint64_t v5;
  uint64_t result;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  result = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 160))();
  if (!result)
    goto LABEL_30;
  v12 = objc_msgSend((id)result, sel_commandBuffer);
  result = swift_unknownObjectRelease();
  if (!v12)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  result = (uint64_t)objc_msgSend(v12, sel_computeCommandEncoder);
  if (!result)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v13 = (void *)result;
  objc_msgSend((id)result, sel_setComputePipelineState_, a1);
  a5(v13);
  v14 = (uint64_t)objc_msgSend(a1, sel_threadExecutionWidth);
  result = (uint64_t)objc_msgSend(a1, sel_maxTotalThreadsPerThreadgroup);
  if (!v14)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (result == 0x8000000000000000 && v14 == -1)
    goto LABEL_22;
  v27 = a4;
  v15 = result / v14;
  v16 = sub_23ECC51F4(v14, result / v14, &v29);
  v18 = v29;
  v17 = v30;
  v26 = v31;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 112))(v16);
  if (result)
  {
    v19 = objc_msgSend((id)result, sel_supportsFamily_, 1004);
    result = swift_unknownObjectRelease();
    if (v19)
    {
      v20 = sel_dispatchThreads_threadsPerThreadgroup_;
      v29 = a2;
      v30 = a3;
LABEL_20:
      v31 = v27;
      v28[0] = v18;
      v28[1] = v17;
      v28[2] = v26;
      objc_msgSend(v13, v20, &v29, v28);
      objc_msgSend(v13, sel_endEncoding);
      objc_msgSend(v12, sel_commit);
      objc_msgSend(v12, sel_waitUntilCompleted);
      swift_unknownObjectRelease();
      return swift_unknownObjectRelease();
    }
    v21 = a2 + v14;
    if (!__OFADD__(a2, v14))
    {
      v22 = __OFSUB__(v21, 1);
      v23 = v21 - 1;
      if (!v22)
      {
        if (v23 == 0x8000000000000000 && v14 == -1)
          goto LABEL_28;
        v24 = a3 + v15;
        if (!__OFADD__(a3, v15))
        {
          v22 = __OFSUB__(v24, 1);
          v25 = v24 - 1;
          if (!v22)
          {
            if (v15)
            {
              if (v15 != -1 || v25 != 0x8000000000000000)
              {
                v20 = sel_dispatchThreadgroups_threadsPerThreadgroup_;
                v29 = v23 / v14;
                v30 = v25 / v15;
                goto LABEL_20;
              }
              goto LABEL_29;
            }
            goto LABEL_27;
          }
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23ECC51F4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 1;
  return result;
}

uint64_t sub_23ECC5204()
{
  uint64_t v0;

  sub_23ECC4638(*(_QWORD *)(v0 + 16));
  sub_23ECC4638(*(_QWORD *)(v0 + 24));
  sub_23ECC4638(*(_QWORD *)(v0 + 32));

  return v0;
}

uint64_t sub_23ECC5238()
{
  uint64_t v0;

  sub_23ECC4638(*(_QWORD *)(v0 + 16));
  sub_23ECC4638(*(_QWORD *)(v0 + 24));
  sub_23ECC4638(*(_QWORD *)(v0 + 32));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IHKMetalProcessing()
{
  return objc_opt_self();
}

uint64_t sub_23ECC5294()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 48);
}

uint64_t sub_23ECC52C8(unint64_t a1, int a2)
{
  _DWORD *v2;
  int v4;
  unint64_t v5;
  uint64_t result;

  v4 = a1;
  v5 = HIDWORD(a1);
  result = swift_beginAccess();
  v2[12] = v4;
  v2[13] = v5;
  v2[14] = a2;
  return result;
}

uint64_t (*sub_23ECC5318())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23ECC5358()
{
  _QWORD *v0;

  v0[11] = (*(uint64_t (**)(uint64_t, unint64_t))(*v0 + 192))(0x697247796C707061, 0xE900000000000064);
  return swift_unknownObjectRelease();
}

uint64_t sub_23ECC5398(void *a1, uint64_t a2, uint64_t a3, float a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, char a9)
{
  _QWORD *v9;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  CGImage *v31;
  CGImage *v32;
  __int16 BitmapInfo;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  char *v41;
  id v42;
  void *v43;
  id v44;
  char *v45;
  uint64_t (*v46)(uint64_t, CGImage *);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t result;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;

  v54 = a8;
  v55 = a7;
  v16 = sub_23ECC6490();
  v53 = *(_QWORD *)(v16 - 8);
  v17 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v52 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v52 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v57 = (char *)&v52 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v52 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v58 = (char *)&v52 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v52 - v29;
  sub_23ECC6484();
  v56 = v21;
  if ((a9 & 1) != 0)
    v31 = a1;
  else
    v31 = (CGImage *)objc_msgSend((id)objc_opt_self(), sel_convertCGImageToBGRA_sRGB_, a1);
  v32 = v31;
  sub_23ECC6484();
  BitmapInfo = CGImageGetBitmapInfo(v32);
  v9[8] = (*(uint64_t (**)(CGImage *))(*v9 + 208))(v32);
  v34 = swift_unknownObjectRelease();
  if ((BitmapInfo & 0x2000) == 0 || (((BitmapInfo & 0x1Fu) < 7) & (0x54u >> BitmapInfo)) == 0)
    goto LABEL_23;
  v35 = *(uint64_t (**)(uint64_t))(*v9 + 112);
  v36 = (void *)v35(v34);
  if (!v36)
    goto LABEL_17;
  if (!a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((unsigned __int128)(a6 * (__int128)a3) >> 64 != (a6 * a3) >> 63)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v37 = objc_msgSend(v36, sel_newBufferWithBytes_length_options_, a2);
  swift_unknownObjectRelease();
  v9[10] = v37;
  swift_unknownObjectRelease();
  v38 = (void *)v9[8];
  if (!v38)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v39 = objc_msgSend(v38, sel_width);
  v40 = (void *)v9[8];
  v41 = v57;
  if (!v40)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v42 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, v39, objc_msgSend(v40, sel_height), 0);
  v43 = (void *)v35((uint64_t)objc_msgSend(v42, sel_setUsage_, 2));
  if (v43)
  {
    v44 = objc_msgSend(v43, sel_newTextureWithDescriptor_, v42);
    swift_unknownObjectRelease();
    v9[9] = v44;
    swift_unknownObjectRelease();
    sub_23ECC6484();
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, float))(*v9 + 392))(v55, v54 | ((HIDWORD(v54) & 1) << 32), 1, 1, a4);
    sub_23ECC6484();
    v45 = v56;
    sub_23ECC6484();
    if (v9[9])
    {
      v46 = *(uint64_t (**)(uint64_t, CGImage *))(*v9 + 400);
      v47 = swift_unknownObjectRetain();
      v48 = v46(v47, v32);
      swift_unknownObjectRelease();
      v49 = v52;
      sub_23ECC6484();

      v50 = *(void (**)(char *, uint64_t))(v53 + 8);
      v50(v49, v16);
      v50(v45, v16);
      v50(v41, v16);
      v50(v26, v16);
      v50(v58, v16);
      v50(v30, v16);
      return v48;
    }
    goto LABEL_22;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  v59 = 0;
  v60 = 0xE000000000000000;
  sub_23ECC64FC();
  sub_23ECC64B4();
  sub_23ECC64B4();
  swift_bridgeObjectRelease();
  sub_23ECC64B4();
  sub_23ECC64B4();
  swift_bridgeObjectRelease();
  sub_23ECC64B4();
  result = sub_23ECC6514();
  __break(1u);
  return result;
}

id sub_23ECC5874(uint64_t a1, uint64_t a2, char a3, char a4, float a5)
{
  _QWORD *v5;
  id result;
  id v12;
  id v13;
  void (*v14)(uint64_t, id, id, uint64_t, void *(*)(void *), _QWORD *);
  uint64_t v15;
  _QWORD v16[4];
  int v17;
  char v18;
  char v19;
  char v20;
  float v21;

  result = (id)v5[8];
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v12 = objc_msgSend(result, sel_width);
  result = (id)v5[8];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = objc_msgSend(result, sel_height);
  if (v5[11])
  {
    v13 = result;
    MEMORY[0x24BDAC7A8](result);
    v16[2] = v5;
    v16[3] = a1;
    v17 = a2;
    v18 = BYTE4(a2) & 1;
    v19 = a3 & 1;
    v20 = a4 & 1;
    v21 = a5;
    v14 = *(void (**)(uint64_t, id, id, uint64_t, void *(*)(void *), _QWORD *))(*v5 + 216);
    v15 = swift_unknownObjectRetain();
    v14(v15, v12, v13, 1, sub_23ECC5D68, v16);
    return (id)swift_unknownObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

CGContext *sub_23ECC5984(void *a1)
{
  uint64_t v2;
  CGContext *result;
  uint64_t v4;
  size_t v5;
  size_t v6;
  uint64_t v7;
  CGColorSpace *v8;
  id v9;
  id v10;
  void *v11;
  CGContext *v12;
  __int128 v13;

  v2 = (uint64_t)objc_msgSend(a1, sel_width);
  result = (CGContext *)objc_msgSend(a1, sel_height);
  v4 = v2 * (_QWORD)result;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)result) >> 64 != (v2 * (uint64_t)result) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)(v4 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  result = (CGContext *)objc_msgSend(a1, sel_width);
  if (((unint64_t)result - 0x2000000000000000) >> 62 != 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v5 = 4 * v4;
  if (4 * v4 < 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v6 = 4 * (_QWORD)result;
  if (v5)
  {
    v7 = sub_23ECC64C0();
    *(_QWORD *)(v7 + 16) = v5;
    bzero((void *)(v7 + 32), v5);
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
  sub_23ECC4F70((uint64_t)objc_msgSend(a1, sel_width), (uint64_t)objc_msgSend(a1, sel_height), &v13);
  objc_msgSend(a1, sel_getBytes_bytesPerRow_fromRegion_mipmapLevel_, v7 + 32, v6, &v13, 0);
  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  if (!result)
    goto LABEL_18;
  v8 = result;
  v9 = objc_msgSend(a1, sel_width);
  v10 = objc_msgSend(a1, sel_height);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = (uint64_t)sub_23ECC5F94(0, *(_QWORD *)(v7 + 16), 0, (char *)v7);
  result = CGBitmapContextCreate((void *)(v7 + 32), (size_t)v9, (size_t)v10, 8uLL, v6, v8, 0x2002u);
  if (!result)
    goto LABEL_19;
  v11 = result;
  result = CGBitmapContextCreateImage(result);
  if (result)
  {
    v12 = result;

    swift_bridgeObjectRelease();
    return v12;
  }
LABEL_20:
  __break(1u);
  return result;
}

int64x2_t *sub_23ECC5B74()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = 0x1000000010;
  *(_DWORD *)(v0 + 56) = 8;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  return sub_23ECC4A28();
}

uint64_t sub_23ECC5BBC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_23ECC5BE8()
{
  sub_23ECC5204();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

id sub_23ECC5CAC()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_23ECC5CCC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_23ECC5D38()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_23ECC5D68(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  id v5;
  int v6;
  char v7;
  char v8;
  char v9;
  int v10;
  id v11;
  int v12;
  uint64_t (*v13)(id);
  void *result;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  char v20;
  char v21;
  id v22;
  int v23;

  v2 = v1;
  v4 = *(_QWORD **)(v1 + 16);
  v5 = *(id *)(v2 + 24);
  v6 = *(_DWORD *)(v2 + 32);
  v7 = *(_BYTE *)(v2 + 36);
  v8 = *(_BYTE *)(v2 + 37);
  v9 = *(_BYTE *)(v2 + 38);
  v10 = *(_DWORD *)(v2 + 40);
  objc_msgSend(a1, sel_setTexture_atIndex_, v4[8], 0);
  objc_msgSend(a1, sel_setTexture_atIndex_, v4[9], 1);
  v11 = objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v4[10], 0, 0);
  if ((v7 & 1) != 0)
  {
    v11 = (id)(*(uint64_t (**)(id))(*v4 + 264))(v11);
    v5 = v11;
    v6 = v12;
  }
  v22 = v5;
  v23 = v6;
  v13 = *(uint64_t (**)(id))(*v4 + 112);
  result = (void *)v13(v11);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v15 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v22, 12, 0);
  swift_unknownObjectRelease();
  v21 = v8;
  result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v15, 0, 1));
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v16 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v21, 1, 0);
  swift_unknownObjectRelease();
  v20 = v9;
  result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v16, 0, 2));
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v17 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v20, 1, 0);
  swift_unknownObjectRelease();
  v19 = v10;
  result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v17, 0, 3));
  if (result)
  {
    v18 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v19, 4, 0);
    swift_unknownObjectRelease();
    objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v18, 0, 4);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (void *)swift_unknownObjectRelease();
  }
LABEL_11:
  __break(1u);
  return result;
}

char *sub_23ECC5F94(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_23ECC4924((uint64_t *)&unk_256DCCA80);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

int64x2_t *sub_23ECC607C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, float a7)
{
  uint64_t v14;
  int64x2_t *result;
  unint64_t v16;
  uint64_t v17;

  type metadata accessor for IHKBilateralGrid();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 48) = 0x1000000010;
  *(_DWORD *)(v14 + 56) = 8;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  result = sub_23ECC4A28();
  if (a3 < 0 || (a3 | a2) >> 32)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v16 = a4 / 48 / a3;
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v16))
  {
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, float))(result->i64[0] + 384))(a5, a1, a2, a3, a4, a2 | (a3 << 32), a4 / 48 / a3, a6 & 1, a7);
    swift_release();
    return (int64x2_t *)v17;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IHKBilateralGridUtils()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for IHKBGGridSize(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IHKBGGridSize(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IHKBGGridSize(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IHKBGGridSize()
{
  return &type metadata for IHKBGGridSize;
}

uint64_t type metadata accessor for IHKBilateralGrid()
{
  return objc_opt_self();
}

void sub_23ECC6258(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_23ECC62A4(void **a1)
{
  if (*((char *)a1 + 23) < 0)
    sub_23ECBB488(a1);
}

void sub_23ECC62B4(uint64_t *a1)
{
  int v2;
  uint64_t *v3;
  uint64_t status_string;
  uint64_t *v5;
  int v6;
  uint64_t *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *((char *)a1 + 23);
  v3 = (uint64_t *)*a1;
  status_string = espresso_get_status_string();
  if (v2 >= 0)
    v5 = a1;
  else
    v5 = v3;
  v6 = 136315394;
  v7 = v5;
  v8 = 2080;
  v9 = status_string;
  _os_log_error_impl(&dword_23ECAB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v6, 0x16u);
}

void sub_23ECC6368(void **__p)
{
  void **v2;

  do
  {
    v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

uint64_t sub_23ECC63A8()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_23ECC63CC(v0);
}

uint64_t sub_23ECC63CC()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_23ECC63F0(v0);
}

void sub_23ECC63F0(void **a1, void **a2, void **a3)
{
  void **v5;
  void *v6;

  v5 = (void **)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0)
        operator delete(*(v5 - 3));
      v5 -= 3;
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_23ECC6454()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23ECC6460()
{
  return MEMORY[0x24BDCEAC8]();
}

uint64_t sub_23ECC646C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23ECC6478()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23ECC6484()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23ECC6490()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23ECC649C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23ECC64A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23ECC64B4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23ECC64C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23ECC64CC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23ECC64D8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23ECC64E4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23ECC64F0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23ECC64FC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23ECC6508()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23ECC6514()
{
  return MEMORY[0x24BEE2F48]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
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

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x24BDBE5F0](image, space);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
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

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5138](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x24BDC51D8](imageBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x24BDF9020](pixelBuffer, options, imageOut);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF60]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250F5CF78();
}

void operator delete(void *__p)
{
  off_250F5CF80(__p);
}

uint64_t operator delete()
{
  return off_250F5CF88();
}

uint64_t operator new[]()
{
  return off_250F5CF90();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250F5CF98(__sz);
}

uint64_t operator new()
{
  return off_250F5CFA0();
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x24BE2FAE0]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x24BE2FB68]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x24BE2FB70]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_argb8()
{
  return MEMORY[0x24BE2FBC8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x24BE2FBD0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x24BE2FBE8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_rgba8()
{
  return MEMORY[0x24BE2FBF8]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x24BE2FC18]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x24BE2FCC0]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x24BE2FCC8]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x24BE2FCE0]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
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

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x24BEDD010](dest, src, copyHelper);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

