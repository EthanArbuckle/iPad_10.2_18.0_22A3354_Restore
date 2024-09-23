void __destroy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEPvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void *__copy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEPvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c21_ZTSN8dispatch5groupE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    v5 = *(NSObject **)(a1 + 32);
    if (!v5)
      return;
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  v5 = *(NSObject **)(a1 + 32);
  if (v5)
LABEL_6:
    dispatch_release(v5);
}

void ___ZN3abm6client15GetBasebandTimeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t value;
  int v13;
  xpc_object_t v14;
  int v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t *v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t object[3];
  uint64_t v26;

  if (!*(_QWORD *)(a1 + 32))
    return;
  v6 = xpc_null_create();
  v7 = v6;
  if (!*(_DWORD *)a2)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C3B88380](v10) == MEMORY[0x1E0C812F8])
      {
        xpc_retain(v10);
        v8 = v10;
      }
      else
      {
        v8 = xpc_null_create();
      }
    }
    else
    {
      v8 = xpc_null_create();
      v10 = 0;
    }
    xpc_release(v10);
    v11 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v11);
    value = xpc_dictionary_get_value(*a3, "KeyBasebandTimeSeconds");
    object[0] = value;
    if (value)
      xpc_retain(value);
    else
      object[0] = xpc_null_create();
    v13 = xpc::dyn_cast_or_default();
    xpc_release(object[0]);
    v14 = xpc_dictionary_get_value(*a3, "KeyBasebandTimeMicroSeconds");
    object[0] = v14;
    if (v14)
      xpc_retain(v14);
    else
      object[0] = xpc_null_create();
    v15 = xpc::dyn_cast_or_default();
    xpc_release(object[0]);
    memset(object, 170, sizeof(object));
    v16 = xpc_dictionary_get_value(*a3, "KeyBasebandTimeAsString");
    v24 = v16;
    if (v16)
      xpc_retain(v16);
    else
      v24 = xpc_null_create();
    xpc::dyn_cast_or_default();
    xpc_release(v24);
    v17 = xpc_int64_create(v13);
    if (!v17)
      v17 = xpc_null_create();
    xpc_dictionary_set_value(v8, "KeyBasebandTimeSeconds", v17);
    v18 = xpc_null_create();
    xpc_release(v17);
    xpc_release(v18);
    v19 = xpc_int64_create(v15);
    if (!v19)
      v19 = xpc_null_create();
    xpc_dictionary_set_value(v8, "KeyBasebandTimeMicroSeconds", v19);
    v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    if (SHIBYTE(object[2]) >= 0)
      v21 = object;
    else
      v21 = (xpc_object_t *)object[0];
    v22 = xpc_string_create((const char *)v21);
    if (!v22)
      v22 = xpc_null_create();
    xpc_dictionary_set_value(v8, "KeyBasebandTimeAsString", v22);
    v23 = xpc_null_create();
    xpc_release(v22);
    xpc_release(v23);
    if (SHIBYTE(object[2]) < 0)
      operator delete(object[0]);
    v9 = *(_QWORD *)(a1 + 32);
    LODWORD(object[0]) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0)
      goto LABEL_4;
LABEL_32:
    std::string::__init_copy_ctor_external((std::string *)&object[1], *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
    goto LABEL_33;
  }
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  LODWORD(object[0]) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
    goto LABEL_32;
LABEL_4:
  *(_OWORD *)&object[1] = *(_OWORD *)(a2 + 8);
  v26 = *(_QWORD *)(a2 + 24);
LABEL_33:
  (*(void (**)(uint64_t, xpc_object_t *, xpc_object_t))(v9 + 16))(v9, object, v8);
  if (SHIBYTE(v26) < 0)
    operator delete(object[1]);
  xpc_release(v8);
}

void sub_1BF309AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  xpc_release(v17);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvEN3xpc4dictE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v3 = *a3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *a2;
  if (*((char *)a2 + 31) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
  else
    __p = *(std::string *)(a2 + 2);
  (*(void (**)(uint64_t, int *, uint64_t))(v4 + 16))(v4, &v5, v3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1BF309C4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::GetBasebandTime(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  void *v5;
  const void *v6;
  void *v7;
  char v8;
  char *v9;
  uint64_t v10;
  void *v11;
  xpc_object_t object;
  char __p[23];
  char v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, xpc_object_t *);
  void *v18;
  void *aBlocka;

  if (!*a2)
  {
    v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v9;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  if (aBlock)
  {
    v5 = _Block_copy(aBlock);
    v6 = v5;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client15GetBasebandTimeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_138;
    if (v5)
    {
      v7 = _Block_copy(v5);
      v8 = 0;
      goto LABEL_9;
    }
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client15GetBasebandTimeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_138;
  }
  v8 = 1;
LABEL_9:
  aBlocka = v7;
  v10 = *a2;
  strcpy(__p, "CommandGetBasebandTime");
  v14 = 22;
  object = xpc_null_create();
  abm::client::Manager::perform(v10, (int)__p, &v15, &object);
  xpc_release(object);
  object = 0;
  if (v14 < 0)
  {
    operator delete(*(void **)__p);
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v11 = aBlocka;
    if (!aBlocka)
      goto LABEL_14;
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v11 = aBlocka;
  if (aBlocka)
LABEL_13:
    _Block_release(v11);
LABEL_14:
  if ((v8 & 1) == 0)
    _Block_release(v6);
}

void sub_1BF309E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  const void *v21;
  char v22;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v22 & 1) == 0)
    _Block_release(v21);
  _Unwind_Resume(a1);
}

void abm::client::Manager::perform(uint64_t a1, int a2, void *aBlock, xpc_object_t *a4)
{
  void *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  xpc_object_t object;

  if (aBlock)
  {
    v6 = _Block_copy(aBlock);
    v7 = *(NSObject **)(a1 + 16);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  v7 = *(NSObject **)(a1 + 16);
  if (v7)
LABEL_3:
    dispatch_retain(v7);
LABEL_4:
  object = *a4;
  if (*a4)
    xpc_retain(*a4);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v7)
    dispatch_release(v7);
  if (v6)
    _Block_release(v6);
  do
    v8 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v8 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  do
    v9 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v9 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  TelephonyXPC::Client::perform();
  do
    v10 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v10 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v10)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v11 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v11 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v11)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v12 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v12 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v12)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
}

void sub_1BF30A06C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;
  uint64_t v11;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v9 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_1BF30A094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13)
{
  xpc_release(object);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c21_ZTSN8dispatch5groupE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v4 = a2[4];
  a1[4] = v4;
  if (v4)
    dispatch_retain(v4);
  v5 = a2[6];
  a1[5] = a2[5];
  a1[6] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
}

void abm::client::PerformCommand(uint64_t *a1, int a2, void *a3, void *a4)
{
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t object;

  if (*a1)
  {
    v8 = xpc_null_create();
    v9 = v8;
    if (a4)
    {
      xpc_retain(a4);
      xpc_release(v9);
      v10 = *a1;
      object = a4;
    }
    else
    {
      v10 = *a1;
      object = v8;
      if (!v8)
      {
        v11 = xpc_null_create();
        a4 = 0;
        goto LABEL_10;
      }
      a4 = v8;
    }
    if (MEMORY[0x1C3B88380](a4) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(a4);
LABEL_11:
      abm::client::Manager::perform(v10, a2, a3, &object);
      xpc_release(object);
      object = 0;
      xpc_release(a4);
      return;
    }
    v11 = xpc_null_create();
LABEL_10:
    object = v11;
    goto LABEL_11;
  }
}

void sub_1BF30A1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void abm::client::Manager::perform(uint64_t a1, int a2, void *aBlock, void **a4)
{
  const void **v4;
  void *v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  xpc_object_t object;
  void *v22;
  NSObject *v23;
  _QWORD aBlocka[4];
  void *v25;
  const void *v26;
  dispatch_object_t v27;
  unint64_t v28;
  unint64_t v29;

  if (!aBlock)
  {
    v27 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
LABEL_11:
    v8 = 0;
    v12 = 0;
    v26 = 0;
    v27 = 0;
    v22 = 0;
    v23 = 0;
    v13 = *a4;
    object = *a4;
    if (!*a4)
      goto LABEL_9;
    goto LABEL_12;
  }
  v7 = _Block_copy(aBlock);
  v8 = v7;
  v26 = (const void *)0xAAAAAAAAAAAAAAAALL;
  v27 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  if (!v7)
    goto LABEL_11;
  aBlocka[0] = MEMORY[0x1E0C809B0];
  aBlocka[1] = 1174405120;
  aBlocka[2] = ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvEN3xpc4dictE_block_invoke;
  aBlocka[3] = &__block_descriptor_tmp_5_1;
  v25 = _Block_copy(v7);
  v9 = _Block_copy(aBlocka);
  v10 = *(NSObject **)(a1 + 16);
  if (v10)
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  v26 = v9;
  v27 = v10;
  if (v9)
  {
    v11 = _Block_copy(v9);
    v10 = v27;
    v4 = (const void **)&v25;
    v22 = v11;
    v23 = v27;
    if (!v27)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = (const void **)&v25;
  v22 = 0;
  v23 = v10;
  if (v10)
LABEL_7:
    dispatch_retain(v10);
LABEL_8:
  v12 = 1;
  v13 = *a4;
  object = *a4;
  if (!*a4)
  {
LABEL_9:
    object = xpc_null_create();
    goto LABEL_13;
  }
LABEL_12:
  xpc_retain(v13);
LABEL_13:
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v23)
    dispatch_release(v23);
  if (v22)
    _Block_release(v22);
  do
    v14 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v14 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v29 = 0xAAAAAAAAAAAAAAAALL;
  do
    v15 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v15 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v28 = 0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Client::perform();
  v16 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v17 = (unint64_t *)(v29 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  do
    v19 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v19 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v19)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v20 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v20 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v20)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (v27)
    dispatch_release(v27);
  if (v26)
    _Block_release(v26);
  if (v12 && *v4)
    _Block_release(*v4);
  if (v8)
    _Block_release(v8);
}

void sub_1BF30A4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12, uint64_t a13, char a14)
{
  const void *v14;
  char v15;
  const void **v16;
  uint64_t v17;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v17 - 64);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(v17 - 80);
  if ((v15 & 1) != 0 && *v16)
    _Block_release(*v16);
  if (v14)
    _Block_release(v14);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *global_queue;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD v12[4];
  dispatch_object_t object;
  TelephonyXPC::Event *v14;
  std::__shared_weak_count *v15;
  xpc_object_t v16;

  v16 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Event::getData(*(TelephonyXPC::Event **)a2);
  v4 = dispatch_group_create();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  global_queue = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1174405120;
  v12[2] = ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke_2;
  v12[3] = &__block_descriptor_tmp_5;
  object = v4;
  if (v4)
    dispatch_retain(v4);
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  v14 = *(TelephonyXPC::Event **)a2;
  v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  dispatch_group_notify(v4, global_queue, v12);
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (object)
    dispatch_release(object);
  if (v4)
    dispatch_release(v4);
  xpc_release(v16);
}

void sub_1BF30A6B0(_Unwind_Exception *a1)
{
  NSObject *v1;
  uint64_t v2;

  if (v1)
    dispatch_release(v1);
  xpc_release(*(xpc_object_t *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_1BF308000);
  }
  return result;
}

void AppleBasebandManager::create(const void **a1@<X0>, const void **a2@<X1>, _QWORD *a3@<X8>)
{
  const void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  CFTypeRef v11;
  _QWORD *v12;
  AppleBasebandManager::State *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  uint64_t v26;
  CFTypeRef cf;
  unint64_t v28;
  unint64_t v29;
  _QWORD block[5];

  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a2;
  cf = v5;
  if (v5)
    CFRetain(v5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v6 = (std::__shared_weak_count *)unk_1ED02D3E0;
    v25 = ClientGetLogServer(void)::sLogServer;
    v26 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
    v6 = (std::__shared_weak_count *)unk_1ED02D3E0;
    v25 = ClientGetLogServer(void)::sLogServer;
    v26 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_7;
  }
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
LABEL_7:
  AppleBasebandManager::State::create(&v28, a1, v5, &v25);
  if (!v6)
    goto LABEL_11;
  v9 = (unint64_t *)&v6->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (v10)
  {
LABEL_11:
    v11 = cf;
    if (!cf)
      goto LABEL_13;
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  v11 = cf;
  if (cf)
LABEL_12:
    CFRelease(v11);
LABEL_13:
  v12 = operator new(0x10uLL);
  v13 = (AppleBasebandManager::State *)v28;
  v14 = v29;
  v24 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v15 = (unint64_t *)(v29 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    *v12 = v13;
    v12[1] = v14;
    do
      v17 = __ldxr(v15);
    while (__stxr(v17 + 1, v15));
  }
  else
  {
    *v12 = v28;
    v12[1] = 0;
  }
  AppleBasebandManager::State::init(v13);
  *a3 = v12;
  v18 = operator new(0x20uLL);
  *v18 = off_1E78F5240;
  v18[1] = 0;
  v18[2] = 0;
  v18[3] = v12;
  a3[1] = v18;
  if (v24)
  {
    v19 = (unint64_t *)&v24->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v21 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v22 = (unint64_t *)(v29 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

void sub_1BF30AA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;
  std::__shared_weak_count **v15;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;

  v17 = *v15;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1BF30AA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;
  std::__shared_weak_count **v15;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;

  v17 = *v15;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1BF30AAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF30AAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::create(_QWORD *a1, const void **a2, const void *a3, uint64_t *a4)
{
  char *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  NSObject *initially_inactive;
  NSObject *v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  size_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  std::__shared_weak_count *v26;
  unint64_t v27;
  unint64_t *p_shared_weak_owners;
  unint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  std::__shared_weak_count *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  const void *v47;
  std::__shared_weak_count *v48;
  CFTypeRef cf;
  _BYTE v50[16];
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;

  v8 = (char *)operator new(0xB8uLL);
  cf = a3;
  if (a3)
    CFRetain(a3);
  v10 = *a4;
  v9 = (std::__shared_weak_count *)a4[1];
  v48 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *(_QWORD *)v8 = off_1E78F4D38;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v50, "com.apple.telephony.abm", "AppleBasebandManager::State");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v14 = dispatch_queue_create_with_target_V2("AppleBasebandManager::State", initially_inactive, 0);
  dispatch_set_qos_class_floor(v14, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v14);
  *((_QWORD *)v8 + 9) = 0;
  *((_QWORD *)v8 + 10) = 0;
  *((_QWORD *)v8 + 11) = v14;
  if (v14)
  {
    dispatch_retain(v14);
    *((_QWORD *)v8 + 12) = 0;
    dispatch_release(v14);
  }
  else
  {
    *((_QWORD *)v8 + 12) = 0;
  }
  *(_QWORD *)v8 = off_1E78F4E48;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v53);
  *((_QWORD *)v8 + 1) = &unk_1E78F5290;
  *((_QWORD *)v8 + 7) = v10;
  *((_QWORD *)v8 + 8) = v9;
  if (v9)
  {
    v15 = (unint64_t *)&v9->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v51);
  *(_QWORD *)v8 = off_1E78F4E08;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v50);
  *(_QWORD *)v8 = off_1E78F4D38;
  *((_QWORD *)v8 + 13) = 0xAAAAAAAAAAAAAAAALL;
  v17 = *((char *)a2 + 23);
  if (v17 >= 0)
    v18 = *((unsigned __int8 *)a2 + 23);
  else
    v18 = (size_t)a2[1];
  v19 = v18 + 7;
  *((_QWORD *)v8 + 14) = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)v8 + 15) = 0xAAAAAAAAAAAAAAAALL;
  if (v18 + 7 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v19 >= 0x17)
  {
    v21 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v21 = v19 | 7;
    v22 = v21 + 1;
    v20 = operator new(v21 + 1);
    *((_QWORD *)v8 + 14) = v19;
    *((_QWORD *)v8 + 15) = v22 | 0x8000000000000000;
    *((_QWORD *)v8 + 13) = v20;
  }
  else
  {
    *((_QWORD *)v8 + 14) = 0;
    *((_QWORD *)v8 + 15) = 0;
    *((_QWORD *)v8 + 13) = 0;
    v20 = v8 + 104;
    v8[127] = v19;
    if (!v18)
      goto LABEL_26;
  }
  if (v17 >= 0)
    v23 = a2;
  else
    v23 = *a2;
  memmove(v20, v23, v18);
LABEL_26:
  strcpy((char *)v20 + v18, ".client");
  *((_QWORD *)v8 + 16) = a3;
  if (a3)
    CFRetain(a3);
  *((_QWORD *)v8 + 17) = 0;
  *((_QWORD *)v8 + 18) = 0;
  *((_QWORD *)v8 + 19) = 0;
  *((_QWORD *)v8 + 20) = v8 + 160;
  *((_QWORD *)v8 + 21) = v8 + 160;
  *((_QWORD *)v8 + 22) = 0;
  ctu::LoggerCommonBase::setLogLevel();
  *a1 = v8;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  v24 = (std::__shared_weak_count *)operator new(0x20uLL);
  v24->__shared_owners_ = 0;
  v25 = (unint64_t *)&v24->__shared_owners_;
  v24->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F4CE8;
  v24->__shared_weak_owners_ = 0;
  v24[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  a1[1] = v24;
  v26 = (std::__shared_weak_count *)*((_QWORD *)v8 + 10);
  if (v26)
  {
    if (v26->__shared_owners_ != -1)
      goto LABEL_40;
    do
      v27 = __ldxr(v25);
    while (__stxr(v27 + 1, v25));
    p_shared_weak_owners = (unint64_t *)&v24->__shared_weak_owners_;
    do
      v29 = __ldxr(p_shared_weak_owners);
    while (__stxr(v29 + 1, p_shared_weak_owners));
    *((_QWORD *)v8 + 9) = v8;
    *((_QWORD *)v8 + 10) = v24;
    std::__shared_weak_count::__release_weak(v26);
  }
  else
  {
    do
      v30 = __ldxr(v25);
    while (__stxr(v30 + 1, v25));
    v31 = (unint64_t *)&v24->__shared_weak_owners_;
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
    *((_QWORD *)v8 + 9) = v8;
    *((_QWORD *)v8 + 10) = v24;
  }
  do
    v33 = __ldaxr(v25);
  while (__stlxr(v33 - 1, v25));
  if (v33)
  {
LABEL_40:
    v34 = (_QWORD *)*a1;
    if (!*(_QWORD *)(*a1 + 56))
      goto LABEL_54;
    goto LABEL_41;
  }
  ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
  std::__shared_weak_count::__release_weak(v24);
  v34 = (_QWORD *)*a1;
  if (!*(_QWORD *)(*a1 + 56))
    goto LABEL_54;
LABEL_41:
  v35 = (std::__shared_weak_count *)v34[10];
  if (!v35 || (v36 = v34[9], (v37 = std::__shared_weak_count::lock(v35)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v38 = v37;
  v53 = v36;
  v54 = v37;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v34 + 1));
  v51 = v36;
  v52 = v38;
  v53 = 0;
  v54 = 0;
  ctu::TrackedLogger::registerLoggerToServer();
  v39 = v52;
  if (v52)
  {
    v40 = (unint64_t *)&v52->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v42 = v54;
  if (v54)
  {
    v43 = (unint64_t *)&v54->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
LABEL_54:
  if (!v48)
    goto LABEL_58;
  v45 = (unint64_t *)&v48->__shared_owners_;
  do
    v46 = __ldaxr(v45);
  while (__stlxr(v46 - 1, v45));
  if (v46)
  {
LABEL_58:
    v47 = cf;
    if (!cf)
      return;
    goto LABEL_59;
  }
  ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
  std::__shared_weak_count::__release_weak(v48);
  v47 = cf;
  if (cf)
LABEL_59:
    CFRelease(v47);
}

void sub_1BF30AF74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  const void *v7;
  va_list va1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va2;
  uint64_t v13;
  va_list va3;

  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, const void *);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  va_copy(va3, va2);
  v11 = va_arg(va3, _QWORD);
  v13 = va_arg(va3, _QWORD);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1BF30AFA0(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State*)#1}::operator() const(AppleBasebandManager::State*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1BF30AFC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  __cxa_end_catch();
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1BF30AFD4()
{
  uint64_t v0;
  void **v1;
  const void **v2;
  uint64_t *v3;

  std::list<boost::signals2::connection>::~list(v3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v0 + 144);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(v2);
  if (*(char *)(v0 + 127) < 0)
    operator delete(*v1);
  ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable((_QWORD *)v0);
  JUMPOUT(0x1BF30B05CLL);
}

void sub_1BF30B008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  _QWORD *v4;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  va_list va1;
  uint64_t v10;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v8 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  ctu::SharedSynchronizable<AppleBasebandManager::State>::~SharedSynchronizable(v4);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  JUMPOUT(0x1BF30B058);
}

void sub_1BF30B030()
{
  JUMPOUT(0x1BF30B058);
}

uint64_t std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](uint64_t result)
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

const void **ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

AppleBasebandManager::State **AppleBasebandManager::AppleBasebandManager(AppleBasebandManager::State **a1, uint64_t a2)
{
  AppleBasebandManager::State *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;

  v3 = *(AppleBasebandManager::State **)a2;
  v4 = *(unint64_t **)(a2 + 8);
  *a1 = *(AppleBasebandManager::State **)a2;
  a1[1] = (AppleBasebandManager::State *)v4;
  if (v4)
  {
    v5 = v4 + 1;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    v3 = *a1;
  }
  AppleBasebandManager::State::init(v3);
  return a1;
}

{
  AppleBasebandManager::State *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;

  v3 = *(AppleBasebandManager::State **)a2;
  v4 = *(unint64_t **)(a2 + 8);
  *a1 = *(AppleBasebandManager::State **)a2;
  a1[1] = (AppleBasebandManager::State *)v4;
  if (v4)
  {
    v5 = v4 + 1;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    v3 = *a1;
  }
  AppleBasebandManager::State::init(v3);
  return a1;
}

void sub_1BF30B160(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v3 = *(std::__shared_weak_count **)(v1 + 8);
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
  _Unwind_Resume(exception_object);
}

void AppleBasebandManager::create(const void **a1@<X0>, const void **a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  const void *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  CFTypeRef v15;
  _QWORD *v16;
  AppleBasebandManager::State *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  _QWORD *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36[2];
  CFTypeRef cf;
  unint64_t block;
  unint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  uint64_t *v42;

  if (*a3)
    goto LABEL_2;
  block = MEMORY[0x1E0C809B0];
  v39 = 0x40000000;
  v40 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v41 = &__block_descriptor_tmp_3;
  v42 = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v23 = ClientGetLogServer(void)::sLogServer;
    v22 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_23;
  }
  else
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v23 = ClientGetLogServer(void)::sLogServer;
    v22 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_23;
  }
  v24 = (unint64_t *)(v22 + 8);
  do
    v25 = __ldxr(v24);
  while (__stxr(v25 + 1, v24));
LABEL_23:
  v26 = (std::__shared_weak_count *)a3[1];
  *a3 = v23;
  a3[1] = v22;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
LABEL_2:
  block = 0xAAAAAAAAAAAAAAAALL;
  v39 = 0xAAAAAAAAAAAAAAAALL;
  v8 = *a2;
  cf = v8;
  if (v8)
    CFRetain(v8);
  v9 = *a3;
  v10 = (std::__shared_weak_count *)a3[1];
  v36[0] = v9;
  v36[1] = (uint64_t)v10;
  if (v10)
  {
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  AppleBasebandManager::State::create(&block, a1, v8, v36);
  if (!v10)
    goto LABEL_11;
  v13 = (unint64_t *)&v10->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v14)
  {
LABEL_11:
    v15 = cf;
    if (!cf)
      goto LABEL_13;
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  v15 = cf;
  if (cf)
LABEL_12:
    CFRelease(v15);
LABEL_13:
  v16 = operator new(0x10uLL);
  v17 = (AppleBasebandManager::State *)block;
  v18 = v39;
  v35 = (std::__shared_weak_count *)v39;
  if (v39)
  {
    v19 = (unint64_t *)(v39 + 8);
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    *v16 = v17;
    v16[1] = v18;
    do
      v21 = __ldxr(v19);
    while (__stxr(v21 + 1, v19));
  }
  else
  {
    *v16 = block;
    v16[1] = 0;
  }
  AppleBasebandManager::State::init(v17);
  *a4 = v16;
  v29 = operator new(0x20uLL);
  *v29 = off_1E78F5240;
  v29[1] = 0;
  v29[2] = 0;
  v29[3] = v16;
  a4[1] = v29;
  if (v35)
  {
    v30 = (unint64_t *)&v35->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v32 = (std::__shared_weak_count *)v39;
  if (v39)
  {
    v33 = (unint64_t *)(v39 + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
}

void sub_1BF30B454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;
  std::__shared_weak_count **v15;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;

  v17 = *v15;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1BF30B4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  void *v14;
  std::__shared_weak_count **v15;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;

  v17 = *v15;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1BF30B50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF30B520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1BF30B584(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::init(AppleBasebandManager::State *this)
{
  std::__shared_weak_count *v3;
  char *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  std::__shared_weak_count *v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  _QWORD *v18;
  _QWORD block[6];

  v5 = *((_QWORD *)this + 9);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  v4 = (char *)this + 72;
  if (!v3 || (v6 = std::__shared_weak_count::lock(v3)) == 0)
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1174405120;
  v16[2] = ___ZN20AppleBasebandManager5State4initEv_block_invoke;
  v16[3] = &__block_descriptor_tmp_15;
  v16[4] = this;
  v16[5] = v5;
  v17 = v7;
  do
    v13 = __ldxr(p_shared_weak_owners);
  while (__stxr(v13 + 1, p_shared_weak_owners));
  v18 = v16;
  block[0] = v12;
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = v4;
  block[5] = &v18;
  v14 = *((_QWORD *)this + 11);
  if (!*((_QWORD *)this + 12))
  {
    dispatch_sync(v14, block);
    v15 = v17;
    if (!v17)
      goto LABEL_14;
    goto LABEL_13;
  }
  dispatch_async_and_wait(v14, block);
  v15 = v17;
  if (v17)
LABEL_13:
    std::__shared_weak_count::__release_weak(v15);
LABEL_14:
  std::__shared_weak_count::__release_weak(v7);
}

void AppleBasebandManager::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  std::string v10;
  __int128 v11;
  uint64_t v12;

  v11 = 0uLL;
  v12 = 0;
  ctu::cf::assign();
  v5 = *a1;
  memset(&v10, 0, sizeof(v10));
  if (*(_QWORD *)a3)
  {
    v6 = _Block_copy(*(const void **)a3);
    v7 = *(NSObject **)(a3 + 8);
    v8 = v6;
    v9 = v7;
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  v7 = *(NSObject **)(a3 + 8);
  v8 = 0;
  v9 = v7;
  if (v7)
LABEL_3:
    dispatch_retain(v7);
LABEL_4:
  AppleBasebandManager::State::setEventHandler(v5, (uint64_t)&v10, (uint64_t)&v8);
  if (v7)
    dispatch_release(v7);
  if (v6)
    _Block_release(v6);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

{
  uint64_t v4;
  const void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  std::string v10;

  v4 = *a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v5 = *(const void **)a3;
    if (*(_QWORD *)a3)
    {
LABEL_3:
      v6 = _Block_copy(v5);
      v7 = *(NSObject **)(a3 + 8);
      v8 = v6;
      v9 = v7;
      if (!v7)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    v10 = *(std::string *)a2;
    v5 = *(const void **)a3;
    if (*(_QWORD *)a3)
      goto LABEL_3;
  }
  v6 = 0;
  v7 = *(NSObject **)(a3 + 8);
  v8 = 0;
  v9 = v7;
  if (v7)
LABEL_4:
    dispatch_retain(v7);
LABEL_5:
  AppleBasebandManager::State::setEventHandler(v4, (uint64_t)&v10, (uint64_t)&v8);
  if (v7)
    dispatch_release(v7);
  if (v6)
    _Block_release(v6);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

void sub_1BF30B7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  operator delete(v22);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  std::string __p;
  void *aBlock;
  dispatch_object_t object;
  _QWORD *v14;
  _QWORD block[6];

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___ZN20AppleBasebandManager5State15setEventHandlerENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS1_10shared_ptrIN3abm6client5EventEEEEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_21;
  v10[4] = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v6 = *(void **)a3;
    if (!*(_QWORD *)a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  __p = *(std::string *)a2;
  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
LABEL_5:
    v6 = _Block_copy(v6);
LABEL_6:
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  object = v7;
  if (v7)
    dispatch_retain(v7);
  v14 = v10;
  block[0] = v5;
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = a1 + 72;
  block[5] = &v14;
  v8 = *(NSObject **)(a1 + 88);
  if (*(_QWORD *)(a1 + 96))
  {
    dispatch_async_and_wait(v8, block);
    v9 = object;
    if (!object)
      goto LABEL_11;
    goto LABEL_10;
  }
  dispatch_sync(v8, block);
  v9 = object;
  if (object)
LABEL_10:
    dispatch_release(v9);
LABEL_11:
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void sub_1BF30BAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)this + 72;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN20AppleBasebandManager5State8eventsOnEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_22;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = v2;
  block[5] = &v5;
  v3 = *(NSObject **)(v1 + 88);
  if (*(_QWORD *)(v1 + 96))
    dispatch_async_and_wait(v3, block);
  else
    dispatch_sync(v3, block);
}

void AppleBasebandManager::perform(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    AppleBasebandManager::State::perform(v3, v4, v5);
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v3, v4, 0);
  }
}

void AppleBasebandManager::State::perform(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3)
{
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[6];
  std::__shared_weak_count *v12;
  _QWORD *v13;
  _QWORD block[6];

  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1174405120;
  v11[2] = ___ZN20AppleBasebandManager5State7performENSt3__110shared_ptrIN3abm6client7CommandEEE_block_invoke;
  v11[3] = &__block_descriptor_tmp_23;
  v11[4] = a1;
  v11[5] = a2;
  v12 = a3;
  if (a3)
  {
    p_shared_owners = (unint64_t *)&a3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v13 = v11;
  block[0] = v3;
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = a1 + 72;
  block[5] = &v13;
  v7 = a1 + 88;
  v6 = *(NSObject **)(a1 + 88);
  if (*(_QWORD *)(v7 + 8))
  {
    dispatch_async_and_wait(v6, block);
    v8 = v12;
    if (!v12)
      return;
  }
  else
  {
    dispatch_sync(v6, block);
    v8 = v12;
    if (!v12)
      return;
  }
  v9 = (unint64_t *)&v8->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
}

void AppleBasebandManager::perform(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  CFTypeRef cf;
  void *aBlock;
  dispatch_object_t object;
  uint64_t v19;
  unint64_t v20;

  v19 = 0xAAAAAAAAAAAAAAAALL;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *(void **)a3;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(v5);
  v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  object = v6;
  if (v6)
    dispatch_retain(v6);
  cf = 0;
  abm::client::Command::create((uint64_t)&aBlock, (ctu **)&cf, &v19);
  if (cf)
    CFRelease(cf);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  v7 = *a1;
  v8 = v19;
  v9 = (std::__shared_weak_count *)v20;
  if (v20)
  {
    v10 = (unint64_t *)(v20 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    AppleBasebandManager::State::perform(v7, v8, v9);
    do
      v12 = __ldaxr(v10);
    while (__stlxr(v12 - 1, v10));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v7, v19, 0);
  }
  v13 = (std::__shared_weak_count *)v20;
  if (v20)
  {
    v14 = (unint64_t *)(v20 + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  CFTypeRef cf;
  void *aBlock;
  dispatch_object_t object;
  uint64_t v20;
  unint64_t v21;

  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  object = v7;
  if (v7)
    dispatch_retain(v7);
  cf = 0;
  abm::client::Command::create(a2, (uint64_t)&aBlock, (ctu **)&cf, &v20);
  if (cf)
    CFRelease(cf);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  v8 = *a1;
  v9 = v20;
  v10 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v11 = (unint64_t *)(v21 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    AppleBasebandManager::State::perform(v8, v9, v10);
    do
      v13 = __ldaxr(v11);
    while (__stlxr(v13 - 1, v11));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v8, v20, 0);
  }
  v14 = (std::__shared_weak_count *)v21;
  if (v21)
  {
    v15 = (unint64_t *)(v21 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void sub_1BF30BE48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void sub_1BF30BFF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::eventsOff(AppleBasebandManager *this)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)this + 72;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN20AppleBasebandManager5State9eventsOffEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_24;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = v2;
  block[5] = &v5;
  v3 = *(NSObject **)(v1 + 88);
  if (*(_QWORD *)(v1 + 96))
    dispatch_async_and_wait(v3, block);
  else
    dispatch_sync(v3, block);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E78F4980, MEMORY[0x1E0DE42D0]);
}

void sub_1BF30C0F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 88), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State*)#1}::operator() const(AppleBasebandManager::State*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_"
                     "ptrIT_EEPS7_EUlPS2_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3_"
                                "_110shared_ptrIT_EEPS7_EUlPS2_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_ptrIT_EEPS7_EUlPS2_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_ptrIT_EEPS7_EUlPS2_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State*)#1}::operator() const(AppleBasebandManager::State*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x1E0DE4F80] + 16;
  __cxa_throw(exception, MEMORY[0x1E0DE4E28], MEMORY[0x1E0DE43F0]);
}

uint64_t *std::list<boost::signals2::connection>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

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
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 3;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

_QWORD *ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void AppleBasebandManager::State::~State(AppleBasebandManager::State *this)
{
  void *v1;

  AppleBasebandManager::State::~State(this);
  operator delete(v1);
}

{
  char *v2;
  char *i;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int j;
  unsigned int v7;
  boost::signals2::detail::connection_body_base *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  const void *v24;
  NSObject *v25;
  NSObject *v26;
  std::__shared_weak_count *v27;
  char *v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  char *v33;
  unsigned int *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  boost::signals2::detail::connection_body_base *v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  uint64_t v42;

  *(_QWORD *)this = off_1E78F4D38;
  v2 = (char *)this + 160;
  for (i = (char *)*((_QWORD *)this + 21); i != v2; i = (char *)*((_QWORD *)i + 1))
  {
    v4 = (unsigned int *)*((_QWORD *)i + 3);
    v38 = 0;
    v39 = (uint64_t)v4;
    if (v4)
    {
      v5 = v4 + 2;
      for (j = v4[2]; j; j = v7)
      {
        v7 = __ldxr(v5);
        if (v7 == j)
        {
          if (!__stxr(j + 1, v5))
          {
            v8 = (boost::signals2::detail::connection_body_base *)*((_QWORD *)i + 2);
            v38 = v8;
            if (v8)
              boost::signals2::detail::connection_body_base::disconnect(v8);
            do
            {
              v9 = __ldaxr(v5);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v5));
            if (!v10)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
              v11 = v4 + 3;
              do
              {
                v12 = __ldaxr(v11);
                v13 = v12 - 1;
              }
              while (__stlxr(v13, v11));
              if (!v13)
                (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 24))(v4);
            }
            break;
          }
        }
        else
        {
          __clrex();
        }
      }
    }
  }
  if (*((_QWORD *)this + 22))
  {
    v14 = *((_QWORD *)this + 20);
    v15 = (char *)*((_QWORD *)this + 21);
    v16 = *(_QWORD *)v15;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)(v14 + 8);
    **(_QWORD **)(v14 + 8) = v16;
    *((_QWORD *)this + 22) = 0;
    if (v15 != v2)
    {
      do
      {
        v28 = (char *)*((_QWORD *)v15 + 1);
        v29 = (unsigned int *)*((_QWORD *)v15 + 3);
        if (v29)
        {
          v30 = v29 + 3;
          do
          {
            v31 = __ldaxr(v30);
            v32 = v31 - 1;
          }
          while (__stlxr(v32, v30));
          if (!v32)
            (*(void (**)(unsigned int *))(*(_QWORD *)v29 + 24))(v29);
        }
        operator delete(v15);
        v15 = v28;
      }
      while (v28 != v2);
    }
  }
  v17 = **((_QWORD **)this + 18);
  v38 = (boost::signals2::detail::connection_body_base *)MEMORY[0x1E0C809B0];
  v39 = 0x40000000;
  v40 = ___ZN3abm6client9Transport5State8checkOutEv_block_invoke;
  v41 = &__block_descriptor_tmp_33;
  v42 = v17;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v17 + 8), (uint64_t)&v38);
  if (*((_QWORD *)this + 22))
  {
    v18 = *((_QWORD *)this + 20);
    v19 = (char *)*((_QWORD *)this + 21);
    v20 = *(_QWORD *)v19;
    *(_QWORD *)(v20 + 8) = *(_QWORD *)(v18 + 8);
    **(_QWORD **)(v18 + 8) = v20;
    *((_QWORD *)this + 22) = 0;
    if (v19 != v2)
    {
      do
      {
        v33 = (char *)*((_QWORD *)v19 + 1);
        v34 = (unsigned int *)*((_QWORD *)v19 + 3);
        if (v34)
        {
          v35 = v34 + 3;
          do
          {
            v36 = __ldaxr(v35);
            v37 = v36 - 1;
          }
          while (__stlxr(v37, v35));
          if (!v37)
            (*(void (**)(unsigned int *))(*(_QWORD *)v34 + 24))(v34);
        }
        operator delete(v19);
        v19 = v33;
      }
      while (v33 != v2);
    }
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)this + 19);
  if (!v21)
    goto LABEL_27;
  p_shared_owners = (unint64_t *)&v21->__shared_owners_;
  do
    v23 = __ldaxr(p_shared_owners);
  while (__stlxr(v23 - 1, p_shared_owners));
  if (v23)
  {
LABEL_27:
    v24 = (const void *)*((_QWORD *)this + 16);
    if (!v24)
      goto LABEL_29;
    goto LABEL_28;
  }
  ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
  std::__shared_weak_count::__release_weak(v21);
  v24 = (const void *)*((_QWORD *)this + 16);
  if (v24)
LABEL_28:
    CFRelease(v24);
LABEL_29:
  if (*((char *)this + 127) < 0)
    operator delete(*((void **)this + 13));
  *(_QWORD *)this = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v25 = *((_QWORD *)this + 12);
  if (v25)
    dispatch_release(v25);
  v26 = *((_QWORD *)this + 11);
  if (v26)
    dispatch_release(v26);
  v27 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v27)
    std::__shared_weak_count::__release_weak(v27);
}

uint64_t ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

double ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<D0>(uint64_t a1@<X8>)
{
  char *v2;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)a1 = v2;
  *(_OWORD *)(a1 + 8) = xmmword_1BF3321F0;
  strcpy(v2, "AppleBasebandManager::State");
  return *(double *)"ndManager::State";
}

uint64_t ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::SharedSynchronizable<AppleBasebandManager::State>::~SharedSynchronizable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

_QWORD *ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F4E48;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void boost::signals2::connection::~connection(boost::signals2::connection *this)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v1 = (unsigned int *)*((_QWORD *)this + 1);
  if (v1)
  {
    v2 = v1 + 3;
    do
    {
      v3 = __ldaxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
      (*(void (**)(unsigned int *))(*(_QWORD *)v1 + 24))(v1);
  }
}

void sub_1BF30C81C(void *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  boost::shared_ptr<boost::signals2::detail::connection_body_base>::~shared_ptr((uint64_t)va);
  __clang_call_terminate(a1);
}

void boost::signals2::detail::connection_body_base::disconnect(boost::signals2::detail::connection_body_base *this)
{
  __int128 v2;
  char *v3;
  char *v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  _OWORD v12[10];
  unint64_t v13;
  void *__p;
  uint64_t v15;
  boost::signals2::detail::connection_body_base *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[8] = v2;
  v12[9] = v2;
  v12[6] = v2;
  v12[7] = v2;
  v12[4] = v2;
  v12[5] = v2;
  v12[2] = v2;
  v12[3] = v2;
  v12[0] = v2;
  v12[1] = v2;
  v13 = 10;
  __p = v12;
  v15 = 0;
  v16 = this;
  (*(void (**)(boost::signals2::detail::connection_body_base *))(*(_QWORD *)this + 24))(this);
  if (*((_BYTE *)this + 24))
  {
    *((_BYTE *)this + 24) = 0;
    boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(this, v12);
  }
  (*(void (**)(boost::signals2::detail::connection_body_base *))(*(_QWORD *)v16 + 32))(v16);
  v3 = (char *)__p;
  if (__p)
  {
    if (v15 - 1 >= 0)
    {
      v4 = (char *)__p + 16 * v15;
      do
      {
        v5 = (unsigned int *)*((_QWORD *)v4 - 1);
        if (v5)
        {
          v6 = v5 + 2;
          do
          {
            v7 = __ldaxr(v6);
            v8 = v7 - 1;
          }
          while (__stlxr(v8, v6));
          if (!v8)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
            v9 = v5 + 3;
            do
            {
              v10 = __ldaxr(v9);
              v11 = v10 - 1;
            }
            while (__stlxr(v11, v9));
            if (!v11)
              (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 24))(v5);
          }
        }
        v4 -= 16;
      }
      while (v4 > v3);
    }
    if (v13 >= 0xB)
      operator delete(__p);
  }
}

void sub_1BF30C990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1BF30C9A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body_base>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 184) + 32))(*(_QWORD *)(a1 + 184));
  v2 = *(_QWORD *)(a1 + 168);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 176);
    if (v3 - 1 >= 0)
    {
      v4 = v2 + 16 * v3;
      do
      {
        v5 = *(unsigned int **)(v4 - 8);
        if (v5)
        {
          v6 = v5 + 2;
          do
          {
            v7 = __ldaxr(v6);
            v8 = v7 - 1;
          }
          while (__stlxr(v8, v6));
          if (!v8)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
            v9 = v5 + 3;
            do
            {
              v10 = __ldaxr(v9);
              v11 = v10 - 1;
            }
            while (__stlxr(v11, v9));
            if (!v11)
              (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 24))(v5);
          }
        }
        v4 -= 16;
      }
      while (v4 > v2);
    }
    if (*(_QWORD *)(a1 + 160) >= 0xBuLL)
      operator delete(*(void **)(a1 + 168));
  }
  return a1;
}

uint64_t boost::shared_ptr<void>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(_DWORD *a1, _QWORD *a2)
{
  int v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  __int128 v16;

  v2 = a1[7] - 1;
  a1[7] = v2;
  if (!v2)
  {
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)a1 + 40))(&v16);
    v4 = a2[22];
    if (v4 == a2[20] && v4 != -1)
    {
      if (4 * v4 <= (unint64_t)(v4 + 1))
        v5 = v4 + 1;
      else
        v5 = 4 * v4;
      boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl((uint64_t)a2, v5);
      v4 = a2[22];
    }
    v6 = *((_QWORD *)&v16 + 1);
    *(_OWORD *)(a2[21] + 16 * v4) = v16;
    if (v6)
    {
      v7 = (unsigned int *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      v4 = a2[22];
    }
    a2[22] = v4 + 1;
    v9 = (unsigned int *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v10 = (unsigned int *)(*((_QWORD *)&v16 + 1) + 8);
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
  }
}

void sub_1BF30CD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  boost::shared_ptr<void>::~shared_ptr((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;

  v4 = (_QWORD *)a1;
  if (a2 >= 0xB)
  {
    if (a2 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(16 * a2);
  }
  v6 = *(_QWORD **)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 176);
  if (v5)
  {
    v7 = &v6[2 * v5];
    v8 = v4;
    do
    {
      v9 = v6[1];
      *v8 = *v6;
      v8[1] = v9;
      if (v9)
      {
        v10 = (unsigned int *)(v9 + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      v6 += 2;
      v8 += 2;
    }
    while (v6 != v7);
    v6 = *(_QWORD **)(a1 + 168);
  }
  if (v6)
  {
    v12 = *(_QWORD *)(a1 + 176);
    if (v12 - 1 >= 0)
    {
      v13 = &v6[2 * v12];
      do
      {
        v14 = (unsigned int *)*(v13 - 1);
        if (v14)
        {
          v15 = v14 + 2;
          do
          {
            v16 = __ldaxr(v15);
            v17 = v16 - 1;
          }
          while (__stlxr(v17, v15));
          if (!v17)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 16))(v14);
            v18 = v14 + 3;
            do
            {
              v19 = __ldaxr(v18);
              v20 = v19 - 1;
            }
            while (__stlxr(v20, v18));
            if (!v20)
              (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 24))(v14);
          }
        }
        v13 -= 2;
      }
      while (v13 > v6);
    }
    if (*(_QWORD *)(a1 + 160) >= 0xBuLL)
      operator delete(*(void **)(a1 + 168));
  }
  *(_QWORD *)(a1 + 160) = a2;
  *(_QWORD *)(a1 + 168) = v4;
}

void ___ZN20AppleBasebandManager5State4initEv_block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  const void *v2;
  ConnectionObserver *v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  std::__shared_weak_count *v14;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  char v27;
  char v28;
  std::__shared_weak_count *v29;
  void (*v30)(_BYTE *, _BYTE *, uint64_t);
  void (*v31)(uint64_t, _WORD *, unsigned int);
  unint64_t *p_shared_weak_owners;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD *v36;
  void *v37;
  unint64_t v38;
  int *v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t (**v42)();
  uint64_t **v43;
  __int128 v44;
  pthread_mutex_t *v45;
  unsigned int *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t *v49;
  int v50;
  uint64_t *v51;
  uint64_t **v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unsigned int *v56;
  unsigned int v57;
  uint64_t *v58;
  uint64_t *v59;
  unsigned int *v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int *v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t *v71;
  uint64_t i;
  uint64_t v73;
  unsigned int v74;
  char *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  int v83;
  int v84;
  uint64_t v85;
  unsigned int *v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int *v89;
  unsigned int v90;
  uint64_t v91;
  int *v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t *v98;
  unsigned int *v99;
  unsigned int v100;
  unsigned int *v101;
  unsigned int *v102;
  uint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  _QWORD *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  BOOL v113;
  BOOL v114;
  uint64_t *v115;
  int v116;
  uint64_t *v117;
  _QWORD *v118;
  uint64_t v119;
  unsigned int *v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int *v125;
  const void *v126;
  unsigned int *v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int *v130;
  unsigned int v131;
  unsigned int v132;
  _DWORD *v133;
  char *v134;
  _QWORD *v135;
  unint64_t v136;
  _DWORD *v137;
  int *v138;
  int v139;
  int v140;
  uint64_t v141;
  unsigned int *v142;
  unsigned int v143;
  uint64_t v144;
  unsigned int *v145;
  unsigned int v146;
  int *v147;
  uint64_t v148;
  unsigned int v149;
  uint64_t v150;
  unsigned int *v151;
  unsigned int v152;
  unsigned int v153;
  int v154;
  int v155;
  unsigned int *v156;
  unsigned int *v157;
  unsigned int v158;
  unsigned int v159;
  uint64_t v160;
  unsigned int *v161;
  unsigned int v162;
  unsigned int v163;
  char *v164;
  char *v165;
  unsigned int *v166;
  unsigned int *v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int *v170;
  unsigned int v171;
  unsigned int v172;
  void (*v173)(__int128 *, __int128 *, uint64_t);
  uint64_t v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  int v178;
  int v179;
  unsigned int *v180;
  unsigned int *v181;
  unsigned int v182;
  unsigned int v183;
  uint64_t v184;
  unsigned int *v185;
  unsigned int v186;
  unsigned int v187;
  unint64_t *v188;
  unint64_t v189;
  _OWORD *v190;
  uint64_t v191;
  uint64_t *v192;
  unint64_t v193;
  std::__shared_weak_count *v194;
  uint64_t v195;
  unint64_t *v196;
  unint64_t v197;
  const void *v198;
  unint64_t *v199;
  unint64_t v200;
  std::__shared_weak_count *v201;
  unint64_t *v202;
  unint64_t v203;
  void *v204;
  NSObject *v205;
  __int128 v206;
  std::__shared_weak_count *v207;
  unint64_t *v208;
  unint64_t v209;
  std::__shared_weak_count *v210;
  unint64_t *v211;
  unint64_t v212;
  std::__shared_weak_count *v213;
  unint64_t *v214;
  unint64_t v215;
  CFTypeRef v216;
  std::__shared_weak_count *v217;
  unint64_t *v218;
  unint64_t v219;
  unsigned int *v220;
  unsigned int v221;
  unsigned int v222;
  void *v223;
  const void *v225;
  const void *v226;
  uint64_t v227;
  std::__shared_weak_count *v228;
  _QWORD *v229;
  _QWORD v230[5];
  std::__shared_weak_count *v231;
  void *v232;
  dispatch_object_t v233;
  uint64_t v234;
  std::__shared_weak_count *v235;
  CFTypeRef cf[2];
  std::__shared_weak_count *v237;
  __int128 v238;
  _QWORD aBlock[7];
  dispatch_object_t v240;
  void *v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  uint64_t v245;
  uint64_t *v246;
  NSObject *v247;
  __int128 *v248;
  unint64_t v249;
  __int128 v250;
  __int128 v251;
  dispatch_object_t object;
  void *v253;
  uint64_t v254;
  _BYTE v255[32];
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  unint64_t v264;
  void *__p;
  uint64_t v266;
  pthread_mutex_t *v267;
  uint64_t v268;

  v268 = *MEMORY[0x1E0C80C00];
  v1 = (_QWORD *)a1[4];
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  v2 = (const void *)off_1ED02D398;
  if (!off_1ED02D398)
  {
    v3 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v3);
    ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v3, (uint64_t *)v255);
    v4 = *(_OWORD *)v255;
    *(_QWORD *)v255 = 0;
    *(_QWORD *)&v255[8] = 0;
    v5 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    off_1ED02D398 = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v8 = *(std::__shared_weak_count **)&v255[8];
    if (*(_QWORD *)&v255[8])
    {
      v9 = (unint64_t *)(*(_QWORD *)&v255[8] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v2 = (const void *)off_1ED02D398;
  }
  cf[1] = v2;
  v237 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
  if (*(&off_1ED02D398 + 1))
  {
    v11 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE13connect_eventIN5boost8signals26signalIFvvENS6_19optional_last_valueIvEEiNSt3__14lessIiEENS5_8functionIS8_EENSE_IFvRKNS6_10connectionEEEENS6_5mutexEEES2_vJEEEDTcl7connectfp_cvNSB_10shared_ptrIS2_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSR_ST_E_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_17;
  aBlock[4] = v1 + 9;
  aBlock[5] = AppleBasebandManager::State::handleServerReady_sync;
  aBlock[6] = 0;
  v13 = _Block_copy(aBlock);
  v226 = v2;
  v14 = (std::__shared_weak_count *)v1[10];
  if (!v14 || (v227 = v1[9], (v15 = std::__shared_weak_count::lock(v14)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v16 = v15;
  v17 = v1[11];
  v240 = v17;
  v225 = v13;
  if (v13)
    v18 = _Block_copy(v13);
  else
    v18 = 0;
  v241 = v18;
  dispatch_retain(v17);
  v242 = 0u;
  v243 = 0u;
  *(_QWORD *)&v251 = v17;
  if (v18)
    v18 = _Block_copy(v18);
  *((_QWORD *)&v251 + 1) = v18;
  dispatch_retain(v17);
  object = v17;
  v228 = v16;
  v229 = v1;
  if (!v18)
  {
    v253 = 0;
    dispatch_retain(v17);
    goto LABEL_32;
  }
  v19 = _Block_copy(v18);
  v253 = v19;
  dispatch_retain(v17);
  if (!v19)
  {
LABEL_32:
    dispatch_retain(v17);
    v246 = 0;
    goto LABEL_33;
  }
  v20 = _Block_copy(v19);
  dispatch_retain(v17);
  v246 = 0;
  if (!v20)
  {
LABEL_33:
    dispatch_retain(v17);
    v223 = 0;
    v25 = 1;
LABEL_34:
    dispatch_retain(v17);
    v21 = 0;
    v26 = 1;
LABEL_35:
    dispatch_retain(v17);
    v22 = 0;
    v27 = 1;
LABEL_36:
    dispatch_retain(v17);
    v23 = 0;
    v247 = v17;
    v28 = 1;
    goto LABEL_37;
  }
  v21 = _Block_copy(v20);
  dispatch_retain(v17);
  v223 = v20;
  if (!v21)
  {
    v25 = 0;
    goto LABEL_34;
  }
  v22 = _Block_copy(v21);
  dispatch_retain(v17);
  if (!v22)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_35;
  }
  v23 = _Block_copy(v22);
  dispatch_retain(v17);
  if (!v23)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_36;
  }
  v24 = _Block_copy(v23);
  dispatch_retain(v17);
  v247 = v17;
  if (v24)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v248 = (__int128 *)_Block_copy(v24);
    dispatch_retain(v17);
    dispatch_release(v17);
    _Block_release(v24);
    goto LABEL_38;
  }
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
LABEL_37:
  v248 = 0;
  dispatch_retain(v17);
  dispatch_release(v17);
LABEL_38:
  dispatch_release(v17);
  if ((v28 & 1) == 0)
    _Block_release(v23);
  dispatch_release(v17);
  if ((v27 & 1) == 0)
    _Block_release(v22);
  v246 = (uint64_t *)boost::function0<void>::assign_to<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>>(ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>)::stored_vtable;
  dispatch_release(v17);
  if ((v26 & 1) == 0)
    _Block_release(v21);
  dispatch_release(v17);
  if ((v25 & 1) == 0)
    _Block_release(v223);
  *(_QWORD *)v255 = 0;
  memset(&v255[8], 170, 24);
  boost::function0<void>::move_assign((uint64_t)v255, (uint64_t *)&v246);
  boost::function0<void>::move_assign((uint64_t)&v246, (uint64_t *)&v243 + 1);
  boost::function0<void>::move_assign((uint64_t)&v243 + 8, (uint64_t *)v255);
  v29 = v228;
  if (*(_QWORD *)v255)
  {
    if ((v255[0] & 1) == 0)
    {
      v30 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)v255 & 0xFFFFFFFFFFFFFFFELL);
      if (v30)
        v30(&v255[8], &v255[8], 2);
    }
  }
  if (v246)
  {
    if ((v246 & 1) == 0)
    {
      v31 = *(void (**)(uint64_t, _WORD *, unsigned int))((unint64_t)v246 & 0xFFFFFFFFFFFFFFFELL);
      if (v31)
        v31((uint64_t)&v247, &v247, 2u);
    }
    v246 = 0;
  }
  dispatch_release(object);
  if (v253)
    _Block_release(v253);
  dispatch_release((dispatch_object_t)v251);
  if (*((_QWORD *)&v251 + 1))
    _Block_release(*((const void **)&v251 + 1));
  p_shared_weak_owners = (unint64_t *)&v228->__shared_weak_owners_;
  do
    v33 = __ldxr(p_shared_weak_owners);
  while (__stxr(v33 + 1, p_shared_weak_owners));
  v34 = operator new(0x18uLL);
  *v34 = &off_1E78F50F0;
  v34[1] = v227;
  v34[2] = v228;
  do
    v35 = __ldxr(p_shared_weak_owners);
  while (__stxr(v35 + 1, p_shared_weak_owners));
  v36 = operator new(0x18uLL);
  v37 = v36;
  *v36 = &off_1E78F50F0;
  v36[1] = v227;
  v36[2] = v228;
  do
    v38 = __ldxr(p_shared_weak_owners);
  while (__stxr(v38 + 1, p_shared_weak_owners));
  v253 = v36;
  LODWORD(object) = 2;
  v39 = (int *)*((_QWORD *)&v242 + 1);
  if (*((_QWORD *)&v242 + 1) < (unint64_t)v243)
  {
    v40 = operator new(0x18uLL);
    *v40 = &off_1E78F50F0;
    v40[1] = v227;
    v40[2] = v228;
    do
      v41 = __ldxr(p_shared_weak_owners);
    while (__stxr(v41 + 1, p_shared_weak_owners));
    *((_QWORD *)v39 + 1) = v40;
    *v39 = 2;
    *((_QWORD *)&v242 + 1) = v39 + 6;
    v42 = &off_1E78F50F0;
LABEL_69:
    ((void (*)(void *))v42[1])(v37);
    goto LABEL_70;
  }
  v92 = (int *)v242;
  v93 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v242 + 1) - v242) >> 3);
  v94 = v93 + 1;
  if (v93 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((uint64_t)(v243 - v242) >> 3) > v94)
    v94 = 0x5555555555555556 * ((uint64_t)(v243 - v242) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v243 - v242) >> 3) >= 0x555555555555555)
    v95 = 0xAAAAAAAAAAAAAAALL;
  else
    v95 = v94;
  *(_QWORD *)&v256 = &v243;
  if (v95)
  {
    if (v95 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v96 = operator new(24 * v95);
  }
  else
  {
    v96 = 0;
  }
  v133 = &v96[3 * v93];
  *(_QWORD *)v255 = v96;
  *(_QWORD *)&v255[8] = v133;
  v134 = (char *)&v96[3 * v95];
  *(_QWORD *)&v255[16] = v133;
  *(_QWORD *)&v255[24] = v134;
  v135 = operator new(0x18uLL);
  *v135 = &off_1E78F50F0;
  v135[1] = v227;
  v135[2] = v228;
  do
    v136 = __ldxr(p_shared_weak_owners);
  while (__stxr(v136 + 1, p_shared_weak_owners));
  v96[3 * v93 + 1] = v135;
  *v133 = 2;
  v137 = v133 + 6;
  *(_QWORD *)&v255[16] = v133 + 6;
  *(_QWORD *)&v251 = v133;
  *((_QWORD *)&v251 + 1) = v133;
  v250 = v251;
  v246 = (uint64_t *)&v243;
  v247 = &v250;
  v248 = &v251;
  v249 = 0xAAAAAAAAAAAAAA00;
  if (v39 == v92)
  {
    v147 = v39;
  }
  else
  {
    v138 = v39;
    do
    {
      v139 = *(v138 - 6);
      v138 -= 6;
      v140 = v139 ^ (v139 >> 31);
      if (v140 == 2)
      {
        *((_QWORD *)v133 - 2) = (*(uint64_t (**)(_QWORD))(**((_QWORD **)v39 - 2) + 32))(*((_QWORD *)v39 - 2));
      }
      else if (v140 == 1)
      {
        *((_QWORD *)v133 - 2) = *((_QWORD *)v39 - 2);
        v141 = *((_QWORD *)v39 - 1);
        *((_QWORD *)v133 - 1) = v141;
        if (v141)
        {
          v142 = (unsigned int *)(v141 + 12);
          do
            v143 = __ldxr(v142);
          while (__stxr(v143 + 1, v142));
        }
      }
      else
      {
        *((_QWORD *)v133 - 2) = *((_QWORD *)v39 - 2);
        v144 = *((_QWORD *)v39 - 1);
        *((_QWORD *)v133 - 1) = v144;
        if (v144)
        {
          v145 = (unsigned int *)(v144 + 12);
          do
            v146 = __ldxr(v145);
          while (__stxr(v146 + 1, v145));
        }
      }
      *(v133 - 6) = *v138 ^ (*v138 >> 31);
      v133 = (_DWORD *)(*((_QWORD *)&v251 + 1) - 24);
      *((_QWORD *)&v251 + 1) -= 24;
      v39 = v138;
    }
    while (v138 != v92);
    v39 = (int *)*((_QWORD *)&v242 + 1);
    v147 = (int *)v242;
  }
  *(_QWORD *)&v242 = v133;
  *((_QWORD *)&v242 + 1) = v137;
  v148 = v243;
  *(_QWORD *)&v243 = v134;
  *(_QWORD *)&v255[24] = v148;
  *(_QWORD *)v255 = v147;
  *(_QWORD *)&v255[8] = v147;
  if (v39 == v147)
  {
    v29 = v228;
    if (!v39)
      goto LABEL_203;
    goto LABEL_202;
  }
  do
  {
    v154 = *(v39 - 6);
    *(_QWORD *)&v255[16] = v39 - 6;
    v155 = v154 ^ (v154 >> 31);
    if (v155 == 2)
    {
      v160 = *((_QWORD *)v39 - 2);
      if (v160)
        (*(void (**)(uint64_t))(*(_QWORD *)v160 + 8))(v160);
    }
    else if (v155 == 1)
    {
      v156 = (unsigned int *)*((_QWORD *)v39 - 1);
      if (v156)
      {
        v157 = v156 + 3;
        do
        {
          v158 = __ldaxr(v157);
          v159 = v158 - 1;
        }
        while (__stlxr(v159, v157));
        if (!v159)
          goto LABEL_217;
      }
    }
    else
    {
      v156 = (unsigned int *)*((_QWORD *)v39 - 1);
      if (v156)
      {
        v161 = v156 + 3;
        do
        {
          v162 = __ldaxr(v161);
          v163 = v162 - 1;
        }
        while (__stlxr(v163, v161));
        if (!v163)
LABEL_217:
          (*(void (**)(unsigned int *))(*(_QWORD *)v156 + 24))(v156);
      }
    }
    v39 = *(int **)&v255[16];
  }
  while (*(int **)&v255[16] != v147);
  v39 = *(int **)v255;
  v29 = v228;
  if (*(_QWORD *)v255)
LABEL_202:
    operator delete(v39);
LABEL_203:
  v149 = object ^ ((int)object >> 31);
  *((_QWORD *)&v242 + 1) = v137;
  if (v149 == 2)
  {
    v37 = v253;
    if (!v253)
      goto LABEL_70;
    v42 = *(uint64_t (***)())v253;
    goto LABEL_69;
  }
  if (v149 == 1)
  {
    v150 = v254;
    if (v254)
    {
      v151 = (unsigned int *)(v254 + 12);
      do
      {
        v152 = __ldaxr(v151);
        v153 = v152 - 1;
      }
      while (__stlxr(v153, v151));
      if (!v153)
        goto LABEL_209;
    }
  }
  else
  {
    v150 = v254;
    if (v254)
    {
      v220 = (unsigned int *)(v254 + 12);
      do
      {
        v221 = __ldaxr(v220);
        v222 = v221 - 1;
      }
      while (__stlxr(v222, v220));
      if (!v222)
LABEL_209:
        (*(void (**)(uint64_t))(*(_QWORD *)v150 + 24))(v150);
    }
  }
LABEL_70:
  (*(void (**)(_QWORD *))(*v34 + 8))(v34);
  std::__shared_weak_count::__release_weak(v29);
  v43 = (uint64_t **)*((_QWORD *)v226 + 13);
  *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v262 = v44;
  v263 = v44;
  v260 = v44;
  v261 = v44;
  v258 = v44;
  v259 = v44;
  v256 = v44;
  v257 = v44;
  *(_OWORD *)v255 = v44;
  *(_OWORD *)&v255[16] = v44;
  v45 = (pthread_mutex_t *)v43[3];
  v264 = 10;
  __p = v255;
  v266 = 0;
  v267 = v45;
  pthread_mutex_lock(v45);
  object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  v253 = (void *)0xAAAAAAAAAAAAAAAALL;
  v46 = (unsigned int *)v43[1];
  if (v46 && (v47 = atomic_load(v46 + 2), v47 == 1))
  {
    v48 = **v43;
    v49 = v43[2];
    v50 = 2;
    if (v49 != (uint64_t *)v48)
    {
      v246 = v43[2];
      if ((uint64_t *)**v43 == v49)
        goto LABEL_108;
      goto LABEL_88;
    }
  }
  else
  {
    v51 = (uint64_t *)operator new(0x20uLL);
    v52 = (uint64_t **)*v43;
    v53 = **v43;
    v54 = operator new(0x40uLL);
    boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v54, v53);
    boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v51, (uint64_t)v54);
    v51[2] = (uint64_t)v52[2];
    v55 = (uint64_t)v52[3];
    v51[3] = v55;
    if (v55)
    {
      v56 = (unsigned int *)(v55 + 8);
      do
        v57 = __ldxr(v56);
      while (__stxr(v57 + 1, v56));
    }
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>((uint64_t *)&v246, (uint64_t)v51);
    v58 = v246;
    v59 = v43[1];
    v246 = *v43;
    *v43 = v58;
    v43[1] = (uint64_t *)v247;
    v247 = v59;
    if (v59)
    {
      v60 = (unsigned int *)(v59 + 1);
      do
      {
        v61 = __ldaxr(v60);
        v62 = v61 - 1;
      }
      while (__stlxr(v62, v60));
      if (!v62)
      {
        (*(void (**)(uint64_t *))(*v59 + 16))(v59);
        v63 = (unsigned int *)v59 + 3;
        do
        {
          v64 = __ldaxr(v63);
          v65 = v64 - 1;
        }
        while (__stlxr(v65, v63));
        if (!v65)
          (*(void (**)(uint64_t *))(*v59 + 24))(v59);
      }
    }
    v50 = 0;
    v48 = **v43;
  }
  v49 = *(uint64_t **)(v48 + 8);
  v246 = v49;
  if ((uint64_t *)**v43 == v49)
    goto LABEL_108;
LABEL_88:
  v66 = 0;
  v67 = v50 - 1;
  do
  {
    v70 = v49[2];
    v71 = *(uint64_t **)(v70 + 32);
    if (v71)
    {
      for (i = *v71; i != v71[1]; i += 24)
      {
        if ((*(_DWORD *)i ^ (*(int *)i >> 31)) > 1)
        {
          if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(i + 8) + 24))(*(_QWORD *)(i + 8)) & 1) != 0)
            goto LABEL_105;
        }
        else
        {
          v73 = *(_QWORD *)(i + 16);
          if (!v73 || (v74 = atomic_load((unsigned int *)(v73 + 8))) == 0)
          {
LABEL_105:
            if (*(_BYTE *)(v70 + 24))
            {
              *(_BYTE *)(v70 + 24) = 0;
              boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)v70, v255);
            }
            break;
          }
        }
      }
    }
    v68 = v246[2];
    if (*(_BYTE *)(v68 + 24))
      v49 = (uint64_t *)v246[1];
    else
      v49 = (uint64_t *)boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase((uint64_t *)**v43, (int *)(v68 + 64), &v246);
    v246 = v49;
    ++v66;
  }
  while (v49 != (uint64_t *)**v43 && v67 >= v66);
LABEL_108:
  v43[2] = v49;
  v75 = (char *)operator new(0x50uLL);
  *((_QWORD *)v75 + 1) = 0;
  *((_QWORD *)v75 + 2) = 0;
  v75[24] = 1;
  *((_DWORD *)v75 + 7) = 1;
  *(_QWORD *)v75 = off_1E78F4F28;
  v76 = operator new(0x38uLL);
  *v76 = 0;
  v76[1] = 0;
  v76[2] = 0;
  v78 = *((_QWORD *)&v242 + 1);
  v77 = v242;
  v79 = *((_QWORD *)&v242 + 1) - v242;
  if (*((_QWORD *)&v242 + 1) != (_QWORD)v242)
  {
    v80 = 0xAAAAAAAAAAAAAAABLL * (v79 >> 3);
    if (v80 > 0xAAAAAAAAAAAAAAALL)
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
    v81 = (char *)operator new(v79);
    *v76 = v81;
    v76[1] = v81;
    v76[2] = &v81[24 * v80];
    v82 = v81;
    do
    {
      v84 = *(_DWORD *)v77 ^ (*(int *)v77 >> 31);
      if (v84 == 2)
      {
        *((_QWORD *)v82 + 1) = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v77 + 8) + 32))(*(_QWORD *)(v77 + 8));
      }
      else if (v84 == 1)
      {
        *((_QWORD *)v82 + 1) = *(_QWORD *)(v77 + 8);
        v85 = *(_QWORD *)(v77 + 16);
        *((_QWORD *)v82 + 2) = v85;
        if (v85)
        {
          v86 = (unsigned int *)(v85 + 12);
          do
            v87 = __ldxr(v86);
          while (__stxr(v87 + 1, v86));
        }
      }
      else
      {
        *((_QWORD *)v82 + 1) = *(_QWORD *)(v77 + 8);
        v88 = *(_QWORD *)(v77 + 16);
        *((_QWORD *)v82 + 2) = v88;
        if (v88)
        {
          v89 = (unsigned int *)(v88 + 12);
          do
            v90 = __ldxr(v89);
          while (__stxr(v90 + 1, v89));
        }
      }
      v83 = *(_DWORD *)v77;
      v77 += 24;
      *(_DWORD *)v82 = v83 ^ (v83 >> 31);
      v82 += 24;
    }
    while (v77 != v78);
    v76[1] = v82;
  }
  v76[3] = 0;
  v91 = *((_QWORD *)&v243 + 1);
  if (*((_QWORD *)&v243 + 1))
  {
    v76[3] = *((_QWORD *)&v243 + 1);
    if ((v91 & 1) != 0)
    {
      *((_OWORD *)v76 + 2) = v244;
      v76[6] = v245;
    }
    else
    {
      (*(void (**)(__int128 *, _QWORD *, _QWORD))(v91 & 0xFFFFFFFFFFFFFFFELL))(&v244, v76 + 4, 0);
    }
  }
  *((_QWORD *)v75 + 4) = v76;
  *((_QWORD *)v75 + 5) = 0;
  v97 = operator new(0x18uLL);
  v97[1] = 0x100000001;
  *v97 = off_1E78F4FD0;
  v97[2] = v76;
  *((_QWORD *)v75 + 5) = v97;
  *((_QWORD *)v75 + 6) = v43[3];
  v98 = v43[4];
  *((_QWORD *)v75 + 7) = v98;
  if (v98)
  {
    v99 = (unsigned int *)(v98 + 1);
    do
      v100 = __ldxr(v99);
    while (__stxr(v100 + 1, v99));
  }
  *((_DWORD *)v75 + 16) = 0;
  v75[68] = 0;
  object = (dispatch_object_t)v75;
  v253 = 0;
  v101 = (unsigned int *)operator new(0x18uLL);
  *((_QWORD *)v101 + 1) = 0x100000001;
  v102 = v101 + 2;
  *(_QWORD *)v101 = off_1E78F5030;
  *((_QWORD *)v101 + 2) = v75;
  v253 = v101;
  v103 = **v43;
  v104 = operator new(0x20uLL);
  v105 = v104;
  v106 = (_QWORD *)(v103 + 32);
  v104[2] = v75;
  v104[3] = v101;
  do
    v107 = __ldxr(v102);
  while (__stxr(v107 + 1, v102));
  v108 = *(_QWORD *)v103;
  *(_QWORD *)(v108 + 8) = v104;
  *v104 = v108;
  *(_QWORD *)v103 = v104;
  v104[1] = v103;
  ++*(_QWORD *)(v103 + 16);
  v109 = *(uint64_t **)(v103 + 32);
  if (v109)
  {
    v110 = v103 + 32;
    v111 = *(_QWORD *)(v103 + 32);
    do
    {
      v112 = *(_DWORD *)(v111 + 32);
      v113 = v112 == 2;
      v114 = v112 < 2;
      if (v112 >= 2)
        v115 = (uint64_t *)v111;
      else
        v115 = (uint64_t *)(v111 + 8);
      if (!v114)
        v110 = v111;
      if (v113)
      {
        v115 = (uint64_t *)v111;
        v110 = v111;
      }
      v111 = *v115;
    }
    while (*v115);
    if ((_QWORD *)v110 == v106 || *(_DWORD *)(v110 + 32) != 2)
    {
      v116 = *((_DWORD *)v109 + 8);
      while (v116 != 2)
      {
        if (v116 < 3)
        {
          v117 = (uint64_t *)v109[1];
          if (!v117)
          {
            v106 = v109 + 1;
            goto LABEL_163;
          }
        }
        else
        {
          v117 = (uint64_t *)*v109;
          v106 = v109;
          if (!*v109)
            goto LABEL_163;
        }
        v116 = *((_DWORD *)v117 + 8);
        v109 = v117;
      }
    }
    *((_DWORD *)v75 + 16) = 2;
    *(_QWORD *)(v75 + 68) = 0xAAAAAAAAAAAAAA00;
LABEL_166:
    v120 = v101 + 3;
    do
      v121 = __ldxr(v120);
    while (__stxr(v121 + 1, v120));
    *(_QWORD *)&v238 = v75;
    *((_QWORD *)&v238 + 1) = v101;
    do
      v122 = __ldxr(v120);
    while (__stxr(v122 + 1, v120));
    do
    {
      v123 = __ldaxr(v120);
      v124 = v123 - 1;
    }
    while (__stlxr(v124, v120));
    if (!v124)
      (*(void (**)(unsigned int *))(*(_QWORD *)v101 + 24))(v101);
    v125 = (unsigned int *)v253;
    v126 = v225;
    if (v253)
      goto LABEL_174;
  }
  else
  {
    v109 = (uint64_t *)(v103 + 32);
LABEL_163:
    v118 = operator new(0x38uLL);
    v118[4] = 0xAAAAAA0000000002;
    *((_DWORD *)v118 + 10) = -1431655766;
    v118[6] = v105;
    *v118 = 0;
    v118[1] = 0;
    v118[2] = v109;
    *v106 = v118;
    v119 = **(_QWORD **)(v103 + 24);
    if (v119)
    {
      *(_QWORD *)(v103 + 24) = v119;
      v118 = (_QWORD *)*v106;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v103 + 32), v118);
    ++*(_QWORD *)(v103 + 40);
    v75 = (char *)object;
    v101 = (unsigned int *)v253;
    LODWORD(object[8].isa) = 2;
    *(_QWORD *)(v75 + 68) = 0xAAAAAAAAAAAAAA00;
    if (v101)
      goto LABEL_166;
    v238 = (unint64_t)v75;
    v125 = (unsigned int *)v253;
    v126 = v225;
    if (v253)
    {
LABEL_174:
      v127 = v125 + 2;
      do
      {
        v128 = __ldaxr(v127);
        v129 = v128 - 1;
      }
      while (__stlxr(v129, v127));
      if (!v129)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v125 + 16))(v125);
        v130 = v125 + 3;
        do
        {
          v131 = __ldaxr(v130);
          v132 = v131 - 1;
        }
        while (__stlxr(v132, v130));
        if (!v132)
          (*(void (**)(unsigned int *))(*(_QWORD *)v125 + 24))(v125);
      }
    }
  }
  pthread_mutex_unlock(v267);
  v164 = (char *)__p;
  if (__p)
  {
    if (v266 - 1 >= 0)
    {
      v165 = (char *)__p + 16 * v266;
      do
      {
        v166 = (unsigned int *)*((_QWORD *)v165 - 1);
        if (v166)
        {
          v167 = v166 + 2;
          do
          {
            v168 = __ldaxr(v167);
            v169 = v168 - 1;
          }
          while (__stlxr(v169, v167));
          if (!v169)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v166 + 16))(v166);
            v170 = v166 + 3;
            do
            {
              v171 = __ldaxr(v170);
              v172 = v171 - 1;
            }
            while (__stlxr(v172, v170));
            if (!v172)
              (*(void (**)(unsigned int *))(*(_QWORD *)v166 + 24))(v166);
          }
        }
        v165 -= 16;
      }
      while (v165 > v164);
    }
    if (v264 >= 0xB)
      operator delete(__p);
  }
  if (*((_QWORD *)&v243 + 1))
  {
    if ((BYTE8(v243) & 1) == 0)
    {
      v173 = *(void (**)(__int128 *, __int128 *, uint64_t))(*((_QWORD *)&v243 + 1) & 0xFFFFFFFFFFFFFFFELL);
      if (v173)
        v173(&v244, &v244, 2);
    }
    *((_QWORD *)&v243 + 1) = 0;
  }
  v174 = v242;
  if (!(_QWORD)v242)
    goto LABEL_267;
  v175 = *((_QWORD *)&v242 + 1);
  v176 = (void *)v242;
  if (*((_QWORD *)&v242 + 1) == (_QWORD)v242)
    goto LABEL_266;
  v177 = *((_QWORD *)&v242 + 1);
  while (2)
  {
    v178 = *(_DWORD *)(v177 - 24);
    v177 -= 24;
    v179 = v178 ^ (v178 >> 31);
    if (v179 == 2)
    {
      v184 = *(_QWORD *)(v175 - 16);
      if (v184)
        (*(void (**)(uint64_t))(*(_QWORD *)v184 + 8))(v184);
    }
    else if (v179 == 1)
    {
      v180 = *(unsigned int **)(v175 - 8);
      if (v180)
      {
        v181 = v180 + 3;
        do
        {
          v182 = __ldaxr(v181);
          v183 = v182 - 1;
        }
        while (__stlxr(v183, v181));
        if (!v183)
          goto LABEL_257;
      }
    }
    else
    {
      v180 = *(unsigned int **)(v175 - 8);
      if (v180)
      {
        v185 = v180 + 3;
        do
        {
          v186 = __ldaxr(v185);
          v187 = v186 - 1;
        }
        while (__stlxr(v187, v185));
        if (!v187)
LABEL_257:
          (*(void (**)(unsigned int *))(*(_QWORD *)v180 + 24))(v180);
      }
    }
    v175 = v177;
    if (v177 != v174)
      continue;
    break;
  }
  v176 = (void *)v242;
LABEL_266:
  *((_QWORD *)&v242 + 1) = v174;
  operator delete(v176);
LABEL_267:
  dispatch_release(v240);
  if (v241)
    _Block_release(v241);
  v188 = (unint64_t *)&v228->__shared_owners_;
  do
    v189 = __ldaxr(v188);
  while (__stlxr(v189 - 1, v188));
  if (v189)
  {
    if (!v126)
      goto LABEL_276;
LABEL_275:
    _Block_release(v126);
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v228->__on_zero_shared)(v228);
    std::__shared_weak_count::__release_weak(v228);
    if (v126)
      goto LABEL_275;
  }
LABEL_276:
  v190 = operator new(0x20uLL);
  v190[1] = v238;
  v238 = 0uLL;
  *((_QWORD *)v190 + 1) = v229 + 20;
  v191 = v229[20];
  *(_QWORD *)v190 = v191;
  *(_QWORD *)(v191 + 8) = v190;
  v229[20] = v190;
  ++v229[22];
  if (v237)
  {
    v192 = &v237->__shared_owners_;
    do
      v193 = __ldaxr((unint64_t *)v192);
    while (__stlxr(v193 - 1, (unint64_t *)v192));
    if (!v193)
    {
      ((void (*)(std::__shared_weak_count *))v237->__on_zero_shared)(v237);
      std::__shared_weak_count::__release_weak(v237);
    }
  }
  v195 = v229[7];
  v194 = (std::__shared_weak_count *)v229[8];
  *(_QWORD *)v255 = v195;
  *(_QWORD *)&v255[8] = v194;
  if (v194)
  {
    v196 = (unint64_t *)&v194->__shared_owners_;
    do
      v197 = __ldxr(v196);
    while (__stxr(v197 + 1, v196));
  }
  v198 = (const void *)v229[16];
  cf[0] = v198;
  if (v198)
    CFRetain(v198);
  v234 = v195;
  v235 = v194;
  if (v194)
  {
    v199 = (unint64_t *)&v194->__shared_owners_;
    do
      v200 = __ldxr(v199);
    while (__stxr(v200 + 1, v199));
  }
  v230[0] = MEMORY[0x1E0C809B0];
  v230[1] = 1174405120;
  v230[2] = ___ZN20AppleBasebandManager5State4initEv_block_invoke_2;
  v230[3] = &__block_descriptor_tmp;
  v201 = (std::__shared_weak_count *)a1[6];
  v230[4] = a1[5];
  v231 = v201;
  if (v201)
  {
    v202 = (unint64_t *)&v201->__shared_weak_owners_;
    do
      v203 = __ldxr(v202);
    while (__stxr(v203 + 1, v202));
  }
  v204 = _Block_copy(v230);
  v205 = v229[11];
  if (v205)
    dispatch_retain((dispatch_object_t)v229[11]);
  v232 = v204;
  v233 = v205;
  abm::client::Transport::create((uint64_t)(v229 + 13), cf, &v234, (uint64_t)&v232, &v242);
  v206 = v242;
  v242 = 0uLL;
  v207 = (std::__shared_weak_count *)v229[19];
  *((_OWORD *)v229 + 9) = v206;
  if (v207)
  {
    v208 = (unint64_t *)&v207->__shared_owners_;
    do
      v209 = __ldaxr(v208);
    while (__stlxr(v209 - 1, v208));
    if (!v209)
    {
      ((void (*)(std::__shared_weak_count *))v207->__on_zero_shared)(v207);
      std::__shared_weak_count::__release_weak(v207);
    }
  }
  v210 = (std::__shared_weak_count *)*((_QWORD *)&v242 + 1);
  if (*((_QWORD *)&v242 + 1))
  {
    v211 = (unint64_t *)(*((_QWORD *)&v242 + 1) + 8);
    do
      v212 = __ldaxr(v211);
    while (__stlxr(v212 - 1, v211));
    if (!v212)
    {
      ((void (*)(std::__shared_weak_count *))v210->__on_zero_shared)(v210);
      std::__shared_weak_count::__release_weak(v210);
    }
  }
  if (v233)
    dispatch_release(v233);
  if (v232)
    _Block_release(v232);
  v213 = v235;
  if (!v235)
    goto LABEL_312;
  v214 = (unint64_t *)&v235->__shared_owners_;
  do
    v215 = __ldaxr(v214);
  while (__stlxr(v215 - 1, v214));
  if (!v215)
  {
    ((void (*)(std::__shared_weak_count *))v213->__on_zero_shared)(v213);
    std::__shared_weak_count::__release_weak(v213);
    v216 = cf[0];
    if (cf[0])
LABEL_313:
      CFRelease(v216);
  }
  else
  {
LABEL_312:
    v216 = cf[0];
    if (cf[0])
      goto LABEL_313;
  }
  AppleBasebandManager::State::checkIn_sync((AppleBasebandManager::State *)v229);
  if (v231)
    std::__shared_weak_count::__release_weak(v231);
  v217 = *(std::__shared_weak_count **)&v255[8];
  if (*(_QWORD *)&v255[8])
  {
    v218 = (unint64_t *)(*(_QWORD *)&v255[8] + 8);
    do
      v219 = __ldaxr(v218);
    while (__stlxr(v219 - 1, v218));
    if (!v219)
    {
      ((void (*)(std::__shared_weak_count *))v217->__on_zero_shared)(v217);
      std::__shared_weak_count::__release_weak(v217);
    }
  }
}

void sub_1BF30E2F8()
{
  void *v0;

  operator delete(v0);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,char a22,uint64_t a23,char a24,uint64_t a25,const void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)&a22);
  if (a21)
    std::__shared_weak_count::__release_weak(a21);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a26);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a61);
  _Unwind_Resume(a1);
}

void sub_1BF30E3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,char a29)
{
  boost::signals2::connection::~connection((boost::signals2::connection *)&a29);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a27);
  _Unwind_Resume(a1);
}

void sub_1BF30E3E8(void *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    __cxa_begin_catch(a1);
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    __cxa_rethrow();
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E410(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unsigned int *a59)
{
  unsigned int *v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int *v62;
  unsigned int v63;
  unsigned int v64;

  if (a2)
  {
    __cxa_end_catch();
    if (a59)
    {
      v59 = a59 + 2;
      do
      {
        v60 = __ldaxr(v59);
        v61 = v60 - 1;
      }
      while (__stlxr(v61, v59));
      if (!v61)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)a59 + 16))(a59);
        v62 = a59 + 3;
        do
        {
          v63 = __ldaxr(v62);
          v64 = v63 - 1;
        }
        while (__stlxr(v64, v62));
        if (!v64)
          (*(void (**)(unsigned int *))(*(_QWORD *)a59 + 24))(a59);
      }
    }
    JUMPOUT(0x1BF30E7A8);
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E480(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);

  if (a2)
  {
    __cxa_begin_catch(a1);
    v3 = *(_QWORD *)(v2 + 24);
    if (v3)
    {
      if ((v3 & 1) == 0)
      {
        v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 & 0xFFFFFFFFFFFFFFFELL);
        if (v4)
          v4(v2 + 32, v2 + 32, 2);
      }
      *(_QWORD *)(v2 + 24) = 0;
    }
    if (*(_QWORD *)v2)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)v2, *(_QWORD *)v2);
      operator delete(*(void **)v2);
    }
    operator delete((void *)v2);
    __cxa_rethrow();
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E4E8(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  if (a2)
  {
    __cxa_end_catch();
    v3 = *(unsigned int **)(v2 + 40);
    if (v3)
    {
      v4 = v3 + 2;
      do
      {
        v5 = __ldaxr(v4);
        v6 = v5 - 1;
      }
      while (__stlxr(v6, v4));
      if (!v6)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
        v7 = v3 + 3;
        do
        {
          v8 = __ldaxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
          (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
      }
    }
    JUMPOUT(0x1BF30E778);
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E558(uint64_t a1, int a2)
{
  if (!a2)
    JUMPOUT(0x1BF30E7A0);
  JUMPOUT(0x1BF30E778);
}

void sub_1BF30E564(uint64_t a1, int a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

  if (a2)
  {
    v2 = STACK[0x248];
    if (STACK[0x248])
    {
      if ((uint64_t)(STACK[0x250] - 1) >= 0)
      {
        v3 = v2 + 16 * STACK[0x250];
        do
        {
          v4 = *(unsigned int **)(v3 - 8);
          if (v4)
          {
            v5 = v4 + 2;
            do
            {
              v6 = __ldaxr(v5);
              v7 = v6 - 1;
            }
            while (__stlxr(v7, v5));
            if (!v7)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 16))(v4);
              v8 = v4 + 3;
              do
              {
                v9 = __ldaxr(v8);
                v10 = v9 - 1;
              }
              while (__stlxr(v10, v8));
              if (!v10)
                (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 24))(v4);
            }
          }
          v3 -= 16;
        }
        while (v3 > v2);
      }
      if (STACK[0x240] >= 0xB)
        operator delete((void *)STACK[0x248]);
    }
    JUMPOUT(0x1BF30E7B0);
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E60C(uint64_t a1, int a2)
{
  if (a2)
    JUMPOUT(0x1BF30E724);
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E620(uint64_t a1, int a2)
{
  if (!a2)
    JUMPOUT(0x1BF30E7A0);
  JUMPOUT(0x1BF30E730);
}

void sub_1BF30E648(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,char a61)
{
  boost::signals2::detail::connection_body_base *v61;
  unsigned int *v62;
  void *v63;

  if (a2)
  {
    if (*(_QWORD *)v62)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100](v62, *(_QWORD *)v62);
      operator delete(*(void **)v62);
    }
    operator delete(v62);
    boost::signals2::detail::connection_body_base::~connection_body_base(v61);
    operator delete(v63);
    JUMPOUT(0x1BF30E7A8);
  }
  JUMPOUT(0x1BF30E7A0);
}

void sub_1BF30E788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void AppleBasebandManager::State::handleServerReady_sync(AppleBasebandManager::State *this)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[6];

  v2 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v4[0]) = 0;
    _os_log_debug_impl(&dword_1BF308000, v2, OS_LOG_TYPE_DEBUG, "#D Server ready", (uint8_t *)v4, 2u);
  }
  v3 = **((_QWORD **)this + 18);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State9reconnectEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_23_0;
  v4[4] = v3;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v3 + 8), (uint64_t)v4);
  AppleBasebandManager::State::checkIn_sync(this);
  if (*((_DWORD *)this + 35))
    AppleBasebandManager::State::eventsOn_sync(this);
}

void ___ZN20AppleBasebandManager5State4initEv_block_invoke_2(uint64_t a1, int a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;

  v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
        v10 = 2;
        switch(a2)
        {
          case 0:
            goto LABEL_8;
          case 1:
          case 4:
            LODWORD(v10) = 0;
LABEL_8:
            AppleBasebandManager::State::changeCheckInState_sync(v7, v10);
            goto LABEL_11;
          case 2:
            goto LABEL_10;
          case 3:
            a2 = 0;
LABEL_10:
            AppleBasebandManager::State::changeEventsState_sync(v7, a2);
            break;
          default:
            goto LABEL_11;
        }
        do
LABEL_11:
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *, uint64_t))v6->__on_zero_shared)(v6, v10);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v12 = (unint64_t *)&v6->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

uint64_t __copy_helper_block_e8_32c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void AppleBasebandManager::State::checkIn_sync(AppleBasebandManager::State *this)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  __int128 *p_buf;
  __int128 block;
  _QWORD *(*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  __int128 **p_p_buf;
  __int128 buf;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *((_DWORD *)this + 34);
  if (v2)
  {
    v3 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      if (v2 == 2)
      {
        HIBYTE(v8) = 9;
        strcpy((char *)&block, "CheckedIn");
      }
      else if (v2 == 1)
      {
        HIBYTE(v8) = 10;
        strcpy((char *)&block, "CheckingIn");
      }
      else
      {
        HIBYTE(v8) = 7;
        strcpy((char *)&block, "Unknown");
      }
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = &block;
      _os_log_debug_impl(&dword_1BF308000, v3, OS_LOG_TYPE_DEBUG, "#D Checked in state is %s, skipping", (uint8_t *)&buf, 0xCu);
      if (SHIBYTE(v8) < 0)
        operator delete((void *)block);
    }
  }
  else
  {
    AppleBasebandManager::State::changeCheckInState_sync((uint64_t)this, 1);
    v4 = **((_QWORD **)this + 18);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 0x40000000;
    v13 = ___ZN3abm6client9Transport5State7checkInEv_block_invoke;
    v14 = &__block_descriptor_tmp_24_0;
    v15 = v4;
    p_buf = &buf;
    *(_QWORD *)&block = MEMORY[0x1E0C809B0];
    *((_QWORD *)&block + 1) = 0x40000000;
    v8 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v9 = &__block_descriptor_tmp_12;
    v10 = v4 + 8;
    p_p_buf = &p_buf;
    v5 = *(NSObject **)(v4 + 24);
    if (*(_QWORD *)(v4 + 32))
      dispatch_async_and_wait(v5, &block);
    else
      dispatch_sync(v5, &block);
  }
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t ___ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE13connect_eventIN5boost8signals26signalIFvvENS6_19optional_last_valueIvEEiNSt3__14lessIiEENS5_8functionIS8_EENSE_IFvRKNS6_10connectionEEEENS6_5mutexEEES2_vJEEEDTcl7connectfp_cvNSB_10shared_ptrIS2_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSR_ST_E_block_invoke(_QWORD *a1)
{
  uint64_t (*v1)(_QWORD *);
  uint64_t v2;
  _QWORD *v3;

  v1 = (uint64_t (*)(_QWORD *))a1[5];
  v2 = a1[6];
  v3 = (_QWORD *)(a1[4] + (v2 >> 1) - 72);
  if ((v2 & 1) != 0)
    v1 = *(uint64_t (**)(_QWORD *))(*v3 + v1);
  return v1(v3);
}

uint64_t boost::signals2::slot<void ()(void),boost::function<void ()(void)>>::~slot(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 32, a1 + 32, 2);
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
  if (*(_QWORD *)a1)
  {
    std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)a1, *(_QWORD *)a1);
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>::~DispatchSlot(uint64_t a1)
{
  const void *v2;

  dispatch_release(*(dispatch_object_t *)a1);
  v2 = *(const void **)(a1 + 8);
  if (v2)
    _Block_release(v2);
  return a1;
}

uint64_t boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;

  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 184));
  v2 = *(_QWORD *)(a1 + 168);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 176);
    if (v3 - 1 >= 0)
    {
      v4 = v2 + 16 * v3;
      do
      {
        v5 = *(unsigned int **)(v4 - 8);
        if (v5)
        {
          v6 = v5 + 2;
          do
          {
            v7 = __ldaxr(v6);
            v8 = v7 - 1;
          }
          while (__stlxr(v8, v6));
          if (!v8)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
            v9 = v5 + 3;
            do
            {
              v10 = __ldaxr(v9);
              v11 = v10 - 1;
            }
            while (__stlxr(v11, v9));
            if (!v11)
              (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 24))(v5);
          }
        }
        v4 -= 16;
      }
      while (v4 > v2);
    }
    if (*(_QWORD *)(a1 + 160) >= 0xBuLL)
      operator delete(*(void **)(a1 + 168));
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t *boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(uint64_t *a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v11;

  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(&v11, a2);
  v3 = (unsigned int *)a1[1];
  a1[1] = (uint64_t)v11;
  v11 = v3;
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  return a1;
}

void sub_1BF30EEA4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  v3 = *(unsigned int **)(v1 + 8);
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

_QWORD *boost::detail::shared_count::shared_count<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = 0;
  v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  *v4 = off_1E78F5340;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_1BF30EF58(void *a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  __cxa_begin_catch(a1);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_1BF30F028(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_base::destroy(uint64_t this)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(uint64_t *a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v11;

  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(&v11, a2);
  v3 = (unsigned int *)a1[1];
  a1[1] = (uint64_t)v11;
  v11 = v3;
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  return a1;
}

void sub_1BF30F1F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  v3 = *(unsigned int **)(v1 + 8);
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;

  v4 = std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::list((_QWORD *)a1, (_QWORD *)a2);
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  *((_BYTE *)v4 + 48) = *(_BYTE *)(a2 + 48);
  v4[3] = v4 + 4;
  v5 = (_QWORD *)(a2 + 32);
  std::map<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::group_key_less<int,std::less<int>>,std::allocator<std::pair<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__tree_node<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,void *> *,long>>>(v4 + 3, *(int **)(a2 + 24), (int *)(a2 + 32));
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD **)(a2 + 24);
  if (v6 != (_QWORD *)(a2 + 32))
  {
    v7 = *(_QWORD **)(a1 + 24);
    v8 = *(_QWORD *)(a1 + 8);
    do
    {
      v7[6] = v8;
      v9 = a2;
      if (v6 != v5)
        v9 = v6[6];
      v10 = (_QWORD *)v6[1];
      v11 = v10;
      v12 = v6;
      if (v10)
      {
        do
        {
          v13 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)v12[2];
          v14 = *v13 == (_QWORD)v12;
          v12 = v13;
        }
        while (!v14);
      }
      v15 = a2;
      if (v13 != v5)
        v15 = v13[6];
      while (v9 != v15)
      {
        v9 = *(_QWORD *)(v9 + 8);
        v8 = *(_QWORD *)(v8 + 8);
      }
      if (v10)
      {
        do
        {
          v16 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v6[2];
          v14 = *v16 == (_QWORD)v6;
          v6 = v16;
        }
        while (!v14);
      }
      v17 = (_QWORD *)v7[1];
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (_QWORD *)v7[2];
          v14 = *v18 == (_QWORD)v7;
          v7 = v18;
        }
        while (!v14);
      }
      v6 = v16;
      v7 = v18;
    }
    while (v16 != v5);
  }
  return a1;
}

void sub_1BF30F3B4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v2, *(_QWORD **)(v1 + 32));
  std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~list((uint64_t *)v1);
  _Unwind_Resume(a1);
}

_QWORD *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::list(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;

  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  v3 = (_QWORD *)a2[1];
  if (v3 != a2)
  {
    v5 = 0;
    v6 = a1;
    do
    {
      v7 = operator new(0x20uLL);
      v8 = v3[3];
      v7[2] = v3[2];
      v7[3] = v8;
      if (v8)
      {
        v9 = (unsigned int *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
        v6 = (_QWORD *)*a1;
        v5 = a1[2];
      }
      *v7 = v6;
      v7[1] = a1;
      v6[1] = v7;
      *a1 = v7;
      a1[2] = ++v5;
      v3 = (_QWORD *)v3[1];
      v6 = v7;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_1BF30F480(_Unwind_Exception *exception_object)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;

  if (v2)
  {
    v5 = (uint64_t *)v1[1];
    v6 = *v5;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(v3 + 8);
    **(_QWORD **)(v3 + 8) = v6;
    v1[2] = 0;
    if (v5 != v1)
    {
      do
      {
        v7 = (uint64_t *)v5[1];
        v8 = (unsigned int *)v5[3];
        if (v8)
        {
          v9 = v8 + 2;
          do
          {
            v10 = __ldaxr(v9);
            v11 = v10 - 1;
          }
          while (__stlxr(v11, v9));
          if (!v11)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 16))(v8);
            v12 = v8 + 3;
            do
            {
              v13 = __ldaxr(v12);
              v14 = v13 - 1;
            }
            while (__stlxr(v14, v12));
            if (!v14)
              (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 24))(v8);
          }
        }
        operator delete(v5);
        v5 = v7;
      }
      while (v7 != v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

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
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t *std::map<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::group_key_less<int,std::less<int>>,std::allocator<std::pair<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__tree_node<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  int *v6;
  uint64_t *v7;
  uint64_t *v8;
  int *v9;
  uint64_t *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t *v15;
  int *v16;
  BOOL v17;
  uint64_t *v18;
  uint64_t *v19[11];

  if (a2 != a3)
  {
    v19[9] = v3;
    v19[10] = v4;
    v6 = a2;
    v7 = result;
    v8 = result + 1;
    do
    {
      v18 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      v19[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      result = std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__find_equal<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>>(v7, v8, v19, &v18, v6 + 8);
      if (*result)
      {
        v9 = (int *)*((_QWORD *)v6 + 1);
        if (v9)
          goto LABEL_11;
      }
      else
      {
        v10 = result;
        v11 = operator new(0x38uLL);
        v12 = *((_QWORD *)v6 + 6);
        v11[2] = *((_OWORD *)v6 + 2);
        *((_QWORD *)v11 + 6) = v12;
        v13 = v19[0];
        *(_QWORD *)v11 = 0;
        *((_QWORD *)v11 + 1) = 0;
        *((_QWORD *)v11 + 2) = v13;
        *v10 = (uint64_t)v11;
        v14 = *(_QWORD **)*v7;
        if (v14)
        {
          *v7 = (uint64_t)v14;
          v15 = (uint64_t *)*v10;
        }
        else
        {
          v15 = (uint64_t *)v11;
        }
        result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[1], v15);
        ++v7[2];
        v9 = (int *)*((_QWORD *)v6 + 1);
        if (v9)
        {
          do
          {
LABEL_11:
            v16 = v9;
            v9 = *(int **)v9;
          }
          while (v9);
          goto LABEL_3;
        }
      }
      do
      {
        v16 = (int *)*((_QWORD *)v6 + 2);
        v17 = *(_QWORD *)v16 == (_QWORD)v6;
        v6 = v16;
      }
      while (!v17);
LABEL_3:
      v6 = v16;
    }
    while (v16 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__find_equal<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  BOOL v18;
  int v19;
  int v20;
  _QWORD *v21;
  int v22;
  uint64_t *v23;
  int v24;
  int v25;
  int v26;
  uint64_t *v27;
  int v28;
  int v29;
  _QWORD *v30;
  _QWORD *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;

  v5 = a1 + 1;
  if (a1 + 1 == a2)
    goto LABEL_8;
  v6 = *a5;
  v7 = *((_DWORD *)a2 + 8);
  if (*a5 == v7)
  {
    if (v6 != 1)
    {
LABEL_6:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
    v8 = a5[2];
    v9 = *((_DWORD *)a2 + 10);
    if (v8 >= v9)
    {
      if (v9 >= v8)
        goto LABEL_6;
      goto LABEL_15;
    }
LABEL_8:
    v11 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v13 = a2;
    }
    else
    {
      if (v11)
      {
        v12 = (uint64_t *)*a2;
        do
        {
          v13 = v12;
          v12 = (uint64_t *)v12[1];
        }
        while (v12);
      }
      else
      {
        v17 = a2;
        do
        {
          v13 = (uint64_t *)v17[2];
          v18 = *v13 == (_QWORD)v17;
          v17 = v13;
        }
        while (v18);
      }
      v19 = *((_DWORD *)v13 + 8);
      v20 = *a5;
      if (v19 == *a5)
      {
        if (v19 != 1 || *((_DWORD *)v13 + 10) >= a5[2])
          goto LABEL_24;
      }
      else if (v19 >= v20)
      {
LABEL_24:
        v21 = (_QWORD *)*v5;
        if (!*v5)
        {
          *a3 = v5;
          return a1 + 1;
        }
        if (v20 != 1)
        {
          while (1)
          {
            v26 = *((_DWORD *)v21 + 8);
            v23 = v21;
            if (v20 == v26)
              break;
            if (v20 < v26)
            {
              v21 = (_QWORD *)*v21;
              v5 = v23;
              if (!*v23)
                break;
            }
            else
            {
              if (v26 >= v20)
                break;
              v5 = v21 + 1;
              v21 = (_QWORD *)v21[1];
              if (!v21)
                break;
            }
          }
LABEL_40:
          *a3 = v23;
          return v5;
        }
        v22 = a5[2];
        while (1)
        {
          v23 = v21;
          v24 = *((_DWORD *)v21 + 8);
          if (v24 == 1)
          {
            v25 = *((_DWORD *)v23 + 10);
            if (v22 >= v25)
            {
              if (v25 >= v22)
                goto LABEL_40;
              goto LABEL_33;
            }
LABEL_27:
            v21 = (_QWORD *)*v23;
            v5 = v23;
            if (!*v23)
              goto LABEL_40;
          }
          else
          {
            if (v24 > 1)
              goto LABEL_27;
LABEL_33:
            v5 = v23 + 1;
            v21 = (_QWORD *)v23[1];
            if (!v21)
              goto LABEL_40;
          }
        }
      }
    }
    if (v11)
    {
      *a3 = v13;
      return v13 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v6 < v7)
    goto LABEL_8;
  if (v7 >= v6)
    goto LABEL_6;
LABEL_15:
  v14 = a2[1];
  if (v14)
  {
    v15 = (uint64_t *)a2[1];
    do
    {
      v16 = v15;
      v15 = (uint64_t *)*v15;
    }
    while (v15);
  }
  else
  {
    v27 = a2;
    do
    {
      v16 = (uint64_t *)v27[2];
      v18 = *v16 == (_QWORD)v27;
      v27 = v16;
    }
    while (!v18);
  }
  if (v16 == v5)
    goto LABEL_56;
  v28 = *((_DWORD *)v16 + 8);
  if (v6 == v28)
  {
    if (v6 == 1)
    {
      v29 = a5[2];
      if (v29 >= *((_DWORD *)v16 + 10))
      {
        v30 = (_QWORD *)*v5;
        if (!*v5)
        {
          *a3 = v5;
          return a1 + 1;
        }
        goto LABEL_61;
      }
      goto LABEL_56;
    }
    goto LABEL_58;
  }
  if (v6 < v28)
  {
LABEL_56:
    if (v14)
    {
      *a3 = v16;
      return v16;
    }
    else
    {
      *a3 = a2;
      return a2 + 1;
    }
  }
LABEL_58:
  v30 = (_QWORD *)*v5;
  if (*v5)
  {
    if (v6 == 1)
    {
      v29 = a5[2];
LABEL_61:
      v31 = v30;
      while (1)
      {
        v30 = v31;
        v32 = *((_DWORD *)v31 + 8);
        if (v32 == 1)
        {
          v33 = *((_DWORD *)v30 + 10);
          if (v29 >= v33)
          {
            if (v33 >= v29)
              goto LABEL_72;
            goto LABEL_68;
          }
LABEL_62:
          v31 = (_QWORD *)*v30;
          v5 = v30;
          if (!*v30)
            goto LABEL_72;
        }
        else
        {
          if (v32 > 1)
            goto LABEL_62;
LABEL_68:
          v5 = v30 + 1;
          v31 = (_QWORD *)v30[1];
          if (!v31)
            goto LABEL_72;
        }
      }
    }
    v34 = *((_DWORD *)v30 + 8);
    while (v6 != v34)
    {
      if (v6 < v34)
      {
        v35 = *v30;
        v5 = v30;
        if (!*v30)
          break;
      }
      else
      {
        if (v34 >= v6)
          break;
        v5 = v30 + 1;
        v35 = v30[1];
        if (!v35)
          break;
      }
      v34 = *(_DWORD *)(v35 + 32);
      v30 = (_QWORD *)v35;
    }
  }
  else
  {
    v30 = a1 + 1;
  }
LABEL_72:
  *a3 = v30;
  return v5;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
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
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
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
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

_QWORD *boost::detail::shared_count::shared_count<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = 0;
  v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  *v4 = off_1E78F52D0;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_1BF30FC4C(void *a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  __cxa_begin_catch(a1);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(v1 + 3), (_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_1BF30FD14(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(v1 + 3), (_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

uint64_t boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(uint64_t *a1, int *a2, uint64_t **a3)
{
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  int v8;
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  BOOL v12;
  BOOL v13;
  uint64_t **v14;
  uint64_t *v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t **v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  int v28;
  uint64_t **v29;
  BOOL v30;
  BOOL v31;
  uint64_t **v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int v43;
  _QWORD *v45;

  v6 = a1 + 4;
  v5 = (uint64_t *)a1[4];
  if (!v5)
  {
    v23 = a1[10];
    if ((uint64_t *)v23 != *a3)
      goto LABEL_55;
    v19 = *(uint64_t **)(v23 + 8);
    v9 = v6;
    v24 = (uint64_t **)(v6 - 1);
    if (v19 != a1)
    {
LABEL_46:
      v45 = a2;
      std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__emplace_unique_key_args<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::piecewise_construct_t const&,std::tuple<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const&>,std::tuple<>>(v24, a2, (uint64_t)&std::piecewise_construct, &v45)[6] = v19;
      goto LABEL_55;
    }
    goto LABEL_31;
  }
  v7 = *a2;
  v8 = a2[2];
  v9 = v6;
  v10 = v5;
  if (*a2 == 1)
  {
    do
    {
      while (1)
      {
        v16 = *((_DWORD *)v10 + 8);
        v17 = v16 < 1;
        if (v16 == 1)
          v17 = *((_DWORD *)v10 + 10) < v8;
        if (!v17)
          break;
        v10 = (uint64_t *)v10[1];
        if (!v10)
          goto LABEL_19;
      }
      v9 = v10;
      v10 = (uint64_t *)*v10;
    }
    while (v10);
  }
  else
  {
    do
    {
      v11 = *((_DWORD *)v10 + 8);
      v12 = v11 == v7;
      v13 = v11 < v7;
      if (v11 >= v7)
        v14 = (uint64_t **)v10;
      else
        v14 = (uint64_t **)(v10 + 1);
      if (v13)
        v15 = v9;
      else
        v15 = v10;
      if (v12)
      {
        v14 = (uint64_t **)v10;
        v9 = v10;
      }
      else
      {
        v9 = v15;
      }
      v10 = *v14;
    }
    while (*v14);
  }
LABEL_19:
  v18 = v9[6];
  if ((uint64_t *)v18 == *a3)
  {
    v19 = *(uint64_t **)(v18 + 8);
    v20 = v6;
    if (v7 == 1)
    {
      v21 = v5;
      while (1)
      {
        v22 = *((_DWORD *)v21 + 8);
        if (v22 == 1)
        {
          if (v8 < *((_DWORD *)v21 + 10))
            goto LABEL_27;
LABEL_22:
          v21 = (uint64_t *)v21[1];
          if (!v21)
            goto LABEL_44;
        }
        else
        {
          if (v22 <= 1)
            goto LABEL_22;
LABEL_27:
          v20 = v21;
          v21 = (uint64_t *)*v21;
          if (!v21)
            goto LABEL_44;
        }
      }
    }
    v27 = v5;
    do
    {
      v28 = *((_DWORD *)v27 + 8);
      v29 = (uint64_t **)(v27 + 1);
      v30 = v7 == v28;
      v31 = v7 < v28;
      if (v7 >= v28)
        v32 = (uint64_t **)(v27 + 1);
      else
        v32 = (uint64_t **)v27;
      if (!v31)
        v27 = v20;
      if (v30)
        v32 = v29;
      else
        v20 = v27;
      v27 = *v32;
    }
    while (*v32);
LABEL_44:
    if (v20 == v6)
    {
      v24 = (uint64_t **)(v6 - 1);
      if (v19 != a1)
        goto LABEL_46;
    }
    else
    {
      v24 = (uint64_t **)(v6 - 1);
      if (v19 != (uint64_t *)v20[6])
        goto LABEL_46;
    }
LABEL_31:
    v25 = (uint64_t *)v9[1];
    if (v25)
    {
      do
      {
        v26 = v25;
        v25 = (uint64_t *)*v25;
      }
      while (v25);
    }
    else
    {
      v33 = v9;
      do
      {
        v26 = (uint64_t *)v33[2];
        v12 = *v26 == (_QWORD)v33;
        v33 = v26;
      }
      while (!v12);
    }
    if (*v24 == v9)
      *v24 = v26;
    --a1[5];
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v5, v9);
    operator delete(v9);
  }
LABEL_55:
  v34 = *a3;
  v35 = **a3;
  v36 = (*a3)[1];
  *(_QWORD *)(v35 + 8) = v36;
  *(_QWORD *)v34[1] = v35;
  --a1[2];
  v37 = (unsigned int *)v34[3];
  if (v37)
  {
    v38 = v37 + 2;
    do
    {
      v39 = __ldaxr(v38);
      v40 = v39 - 1;
    }
    while (__stlxr(v40, v38));
    if (!v40)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 16))(v37);
      v41 = v37 + 3;
      do
      {
        v42 = __ldaxr(v41);
        v43 = v42 - 1;
      }
      while (__stlxr(v43, v41));
      if (!v43)
        (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 24))(v37);
    }
  }
  operator delete(v34);
  return v36;
}

void boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>(_DWORD *a1, _QWORD *a2)
{
  int v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  __int128 v16;

  v2 = a1[7] - 1;
  a1[7] = v2;
  if (!v2)
  {
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)a1 + 40))(&v16);
    v4 = a2[22];
    if (v4 == a2[20] && v4 != -1)
    {
      if (4 * v4 <= (unint64_t)(v4 + 1))
        v5 = v4 + 1;
      else
        v5 = 4 * v4;
      boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl((uint64_t)a2, v5);
      v4 = a2[22];
    }
    v6 = *((_QWORD *)&v16 + 1);
    *(_OWORD *)(a2[21] + 16 * v4) = v16;
    if (v6)
    {
      v7 = (unsigned int *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      v4 = a2[22];
    }
    a2[22] = v4 + 1;
    v9 = (unsigned int *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v10 = (unsigned int *)(*((_QWORD *)&v16 + 1) + 8);
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
  }
}

void sub_1BF3101D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  boost::shared_ptr<void>::~shared_ptr((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__emplace_unique_key_args<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::piecewise_construct_t const&,std::tuple<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _QWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  int v9;
  uint64_t **v10;
  int v11;
  int v12;
  _QWORD *v13;
  int v14;
  uint64_t *v15;
  uint64_t *v16;
  int v18;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    if (*a2 != 1)
    {
      v18 = *((_DWORD *)v6 + 8);
      if (v8 == v18)
        return (uint64_t **)v6;
      v10 = (uint64_t **)a1[1];
      while (1)
      {
        if (v8 < v18)
        {
          v6 = *v10;
          v7 = v10;
          if (!*v10)
            goto LABEL_13;
        }
        else
        {
          if (v18 >= v8)
            return v10;
          v6 = v10[1];
          if (!v6)
          {
LABEL_11:
            v7 = v10 + 1;
            goto LABEL_13;
          }
        }
        v18 = *((_DWORD *)v6 + 8);
        v10 = (uint64_t **)v6;
        if (v8 == v18)
          return (uint64_t **)v6;
      }
    }
    v9 = a2[2];
    while (1)
    {
      v10 = (uint64_t **)v6;
      v11 = *((_DWORD *)v6 + 8);
      if (v11 == 1)
      {
        v12 = *((_DWORD *)v6 + 10);
        if (v9 >= v12)
        {
          if (v12 >= v9)
            return v10;
          goto LABEL_10;
        }
LABEL_4:
        v6 = (uint64_t *)*v6;
        v7 = v10;
        if (!*v10)
          goto LABEL_13;
      }
      else
      {
        if (v11 > 1)
          goto LABEL_4;
LABEL_10:
        v6 = (uint64_t *)v6[1];
        if (!v6)
          goto LABEL_11;
      }
    }
  }
  v10 = a1 + 1;
LABEL_13:
  v13 = operator new(0x38uLL);
  v14 = *((_DWORD *)*a4 + 2);
  v13[4] = **a4;
  *((_DWORD *)v13 + 10) = v14;
  v13[6] = 0;
  *v13 = 0;
  v13[1] = 0;
  v13[2] = v10;
  *v7 = v13;
  v15 = (uint64_t *)**a1;
  v16 = v13;
  if (v15)
  {
    *a1 = v15;
    v16 = *v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v13;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t **v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_10;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (!v2)
  {
    v5 = 1;
    v6 = (uint64_t **)v3[2];
    v7 = *v6;
    if (*v6 == v3)
      goto LABEL_6;
LABEL_11:
    v6[1] = (uint64_t *)v2;
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_10:
  v5 = 0;
  *(_QWORD *)(v2 + 16) = v3[2];
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 != v3)
    goto LABEL_11;
LABEL_6:
  *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    v7 = v6[1];
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
LABEL_12:
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
    goto LABEL_16;
  }
  v7 = 0;
  result = (uint64_t *)v2;
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
    goto LABEL_12;
LABEL_16:
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v14 = (uint64_t **)v7[2];
    if (*v14 != v7)
      break;
    if (*((_BYTE *)v7 + 24))
    {
      v16 = (_QWORD *)*v7;
      if (*v7)
        goto LABEL_48;
    }
    else
    {
      *((_BYTE *)v7 + 24) = 1;
      *((_BYTE *)v14 + 24) = 0;
      v20 = (uint64_t *)v7[1];
      *v14 = v20;
      if (v20)
        v20[2] = (uint64_t)v14;
      v7[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v7;
      v7[1] = (uint64_t)v14;
      v14[2] = v7;
      if (result == (uint64_t *)v14)
        result = v7;
      v7 = *v14;
      v16 = (_QWORD *)**v14;
      if (v16)
      {
LABEL_48:
        if (!*((_BYTE *)v16 + 24))
          goto LABEL_71;
      }
    }
    v21 = (uint64_t *)v7[1];
    if (v21 && !*((_BYTE *)v21 + 24))
    {
      if (v16 && !*((_BYTE *)v16 + 24))
      {
LABEL_71:
        v21 = v7;
      }
      else
      {
        *((_BYTE *)v21 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = *v21;
        v7[1] = *v21;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v21[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v21;
        *v21 = (uint64_t)v7;
        v7[2] = (uint64_t)v21;
        v16 = v7;
      }
      v27 = (uint64_t *)v21[2];
      *((_BYTE *)v21 + 24) = *((_BYTE *)v27 + 24);
      *((_BYTE *)v27 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v28 = *v27;
      v29 = *(_QWORD *)(*v27 + 8);
      *v27 = v29;
      if (v29)
        *(_QWORD *)(v29 + 16) = v27;
      *(_QWORD *)(v28 + 16) = v27[2];
      *(_QWORD *)(v27[2] + 8 * (*(_QWORD *)v27[2] != (_QWORD)v27)) = v28;
      *(_QWORD *)(v28 + 8) = v27;
      v27[2] = v28;
      return result;
    }
    *((_BYTE *)v7 + 24) = 0;
    v12 = (uint64_t *)v7[2];
    if (*((_BYTE *)v12 + 24))
      v13 = v12 == result;
    else
      v13 = 1;
    if (v13)
      goto LABEL_61;
LABEL_24:
    v7 = *(uint64_t **)(v12[2] + 8 * (*(_QWORD *)v12[2] == (_QWORD)v12));
  }
  if (*((_BYTE *)v7 + 24))
  {
    v15 = (_QWORD *)*v7;
    if (!*v7)
    {
LABEL_38:
      v19 = (uint64_t *)v7[1];
      if (v19 && !*((_BYTE *)v19 + 24))
        goto LABEL_67;
      *((_BYTE *)v7 + 24) = 0;
      v12 = (uint64_t *)v7[2];
      if (v12 == result)
      {
        v12 = result;
LABEL_61:
        *((_BYTE *)v12 + 24) = 1;
        return result;
      }
      if (!*((_BYTE *)v12 + 24))
        goto LABEL_61;
      goto LABEL_24;
    }
  }
  else
  {
    *((_BYTE *)v7 + 24) = 1;
    *((_BYTE *)v14 + 24) = 0;
    v17 = v14[1];
    v18 = (uint64_t *)*v17;
    v14[1] = (uint64_t *)*v17;
    if (v18)
      v18[2] = (uint64_t)v14;
    v17[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v17;
    *v17 = (uint64_t)v14;
    v14[2] = v17;
    if (result == (uint64_t *)*v7)
      result = v7;
    v7 = *(uint64_t **)(*v7 + 8);
    v15 = (_QWORD *)*v7;
    if (!*v7)
      goto LABEL_38;
  }
  if (*((_BYTE *)v15 + 24))
    goto LABEL_38;
  v19 = (uint64_t *)v7[1];
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_67:
    v15 = v7;
  }
  else
  {
    *((_BYTE *)v15 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v23 = v15[1];
    *v7 = v23;
    if (v23)
      *(_QWORD *)(v23 + 16) = v7;
    v15[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    v19 = v7;
  }
  v24 = v15[2];
  *((_BYTE *)v15 + 24) = *(_BYTE *)(v24 + 24);
  *(_BYTE *)(v24 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v25 = *(uint64_t **)(v24 + 8);
  v26 = *v25;
  *(_QWORD *)(v24 + 8) = *v25;
  if (v26)
    *(_QWORD *)(v26 + 16) = v24;
  v25[2] = *(_QWORD *)(v24 + 16);
  *(_QWORD *)(*(_QWORD *)(v24 + 16) + 8 * (**(_QWORD **)(v24 + 16) != v24)) = v25;
  *v25 = v24;
  *(_QWORD *)(v24 + 16) = v25;
  return result;
}

void boost::signals2::detail::connection_body_base::~connection_body_base(boost::signals2::detail::connection_body_base *this)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  *(_QWORD *)this = off_1E78F4F90;
  v1 = (unsigned int *)*((_QWORD *)this + 2);
  if (v1)
  {
    v2 = v1 + 3;
    do
    {
      v3 = __ldaxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
      (*(void (**)(unsigned int *))(*(_QWORD *)v1 + 24))(v1);
  }
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(_QWORD *a1)
{
  _QWORD *v1;

  v1 = boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(a1);
  operator delete(v1);
}

BOOL boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::connected(uint64_t a1)
{
  __int128 v2;
  pthread_mutex_t *v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int i;
  unsigned int v10;
  uint64_t v11;
  char v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  char *v22;
  char *v23;
  unsigned int *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v32;
  _OWORD v33[10];
  unint64_t v34;
  void *__p;
  uint64_t v36;
  pthread_mutex_t *v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[8] = v2;
  v33[9] = v2;
  v33[6] = v2;
  v33[7] = v2;
  v33[4] = v2;
  v33[5] = v2;
  v33[2] = v2;
  v33[3] = v2;
  v33[0] = v2;
  v33[1] = v2;
  v3 = *(pthread_mutex_t **)(a1 + 48);
  v34 = 10;
  __p = v33;
  v36 = 0;
  v37 = v3;
  pthread_mutex_lock(v3);
  v4 = *(uint64_t **)(a1 + 32);
  if (!v4)
    goto LABEL_40;
  v5 = *v4;
  if (*v4 == v4[1])
    goto LABEL_40;
  do
  {
    memset(v38, 170, 24);
    v6 = *(_DWORD *)v5 ^ (*(int *)v5 >> 31);
    if (v6 == 2)
    {
      (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(v5 + 8) + 16))(&v32);
      v38[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 16))(v32);
      LODWORD(v38[0]) = 1;
      if (v32)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
        if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
          goto LABEL_26;
LABEL_19:
        v11 = *(_QWORD *)(v5 + 16);
        if (!v11)
          goto LABEL_27;
        if (!atomic_load((unsigned int *)(v11 + 8)))
          goto LABEL_27;
LABEL_21:
        v13 = 0;
        if (LODWORD(v38[0]) == SLODWORD(v38[0]) >> 31)
          goto LABEL_30;
        goto LABEL_22;
      }
LABEL_18:
      if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v6 != 1)
    {
      LODWORD(v38[0]) = 0;
      v38[1] = 0;
      v38[2] = 0;
      goto LABEL_18;
    }
    v7 = *(_QWORD *)(v5 + 16);
    if (!v7)
    {
LABEL_25:
      v38[1] = 0;
      v38[2] = v7;
      LODWORD(v38[0]) = 0;
      if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        goto LABEL_26;
      goto LABEL_19;
    }
    v8 = (unsigned int *)(v7 + 8);
    for (i = *(_DWORD *)(v7 + 8); ; i = v10)
    {
      if (!i)
      {
        v7 = 0;
        goto LABEL_25;
      }
      v10 = __ldxr(v8);
      if (v10 != i)
      {
        __clrex();
        continue;
      }
      if (!__stxr(i + 1, v8))
        break;
    }
    v38[1] = *(_QWORD *)(v5 + 8);
    v38[2] = v7;
    LODWORD(v38[0]) = 0;
    if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) != 2)
      goto LABEL_19;
LABEL_26:
    if (!(*(unsigned int (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 24))(*(_QWORD *)(v5 + 8)))
      goto LABEL_21;
LABEL_27:
    if (*(_BYTE *)(a1 + 24))
    {
      *(_BYTE *)(a1 + 24) = 0;
      boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)a1, v33);
    }
    v13 = 1;
    if (LODWORD(v38[0]) == SLODWORD(v38[0]) >> 31)
    {
LABEL_30:
      v14 = (unsigned int *)v38[2];
      if (v38[2])
      {
        v15 = (unsigned int *)(v38[2] + 8);
        do
        {
          v16 = __ldaxr(v15);
          v17 = v16 - 1;
        }
        while (__stlxr(v17, v15));
        if (!v17)
        {
          (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 16))(v14);
          v18 = v14 + 3;
          do
          {
            v19 = __ldaxr(v18);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v18));
          if (!v20)
            (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 24))(v14);
        }
      }
      goto LABEL_38;
    }
LABEL_22:
    if (v38[1])
      (*(void (**)(_QWORD))(*(_QWORD *)v38[1] + 8))(v38[1]);
LABEL_38:
    if ((v13 & 1) != 0)
      break;
    v5 += 24;
  }
  while (v5 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
LABEL_40:
  v21 = *(unsigned __int8 *)(a1 + 24);
  pthread_mutex_unlock(v37);
  v22 = (char *)__p;
  if (__p)
  {
    if (v36 - 1 >= 0)
    {
      v23 = (char *)__p + 16 * v36;
      do
      {
        v24 = (unsigned int *)*((_QWORD *)v23 - 1);
        if (v24)
        {
          v25 = v24 + 2;
          do
          {
            v26 = __ldaxr(v25);
            v27 = v26 - 1;
          }
          while (__stlxr(v27, v25));
          if (!v27)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 16))(v24);
            v28 = v24 + 3;
            do
            {
              v29 = __ldaxr(v28);
              v30 = v29 - 1;
            }
            while (__stlxr(v30, v28));
            if (!v30)
              (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 24))(v24);
          }
        }
        v23 -= 16;
      }
      while (v23 > v22);
    }
    if (v34 >= 0xB)
      operator delete(__p);
  }
  return v21 != 0;
}

void sub_1BF310B14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::lock(uint64_t a1)
{
  return pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::unlock(uint64_t a1)
{
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::release_slot@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v3 = *(_QWORD *)(result + 40);
  v2 = (_QWORD *)(result + 32);
  *a2 = *(_QWORD *)(result + 32);
  a2[1] = v3;
  if (v3)
  {
    v4 = (unsigned int *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    v6 = *(unsigned int **)(result + 40);
    *v2 = 0;
    *(_QWORD *)(result + 40) = 0;
    if (v6)
    {
      v7 = v6 + 2;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
      {
        result = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
        v10 = v6 + 3;
        do
        {
          v11 = __ldaxr(v10);
          v12 = v11 - 1;
        }
        while (__stlxr(v12, v10));
        if (!v12)
          return (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
      }
    }
  }
  else
  {
    *v2 = 0;
    *(_QWORD *)(result + 40) = 0;
  }
  return result;
}

void std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

uint64_t std::_AllocatorDestroyRangeReverse<std::allocator<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>,boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>*>::operator()[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;

  if (a2 != result)
  {
    v2 = result;
    v3 = a2;
    do
    {
      v4 = *(_DWORD *)(v3 - 24);
      v3 -= 24;
      v5 = v4 ^ (v4 >> 31);
      if (v5 == 2)
      {
        result = *(_QWORD *)(a2 - 16);
        if (result)
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
        goto LABEL_3;
      }
      if (v5 == 1)
      {
        result = *(_QWORD *)(a2 - 8);
        if (!result)
          goto LABEL_3;
        v6 = (unsigned int *)(result + 12);
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (v8)
          goto LABEL_3;
      }
      else
      {
        result = *(_QWORD *)(a2 - 8);
        if (!result)
          goto LABEL_3;
        v9 = (unsigned int *)(result + 12);
        do
        {
          v10 = __ldaxr(v9);
          v11 = v10 - 1;
        }
        while (__stlxr(v11, v9));
        if (v11)
          goto LABEL_3;
      }
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
LABEL_3:
      a2 = v3;
    }
    while (v3 != v2);
  }
  return result;
}

uint64_t boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::~variant(uint64_t a1)
{
  int v2;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;

  v2 = *(_DWORD *)a1 ^ (*(int *)a1 >> 31);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      v3 = *(unsigned int **)(a1 + 16);
      if (!v3)
        return a1;
      v4 = v3 + 3;
      do
      {
        v5 = __ldaxr(v4);
        v6 = v5 - 1;
      }
      while (__stlxr(v6, v4));
      if (v6)
        return a1;
    }
    else
    {
      v3 = *(unsigned int **)(a1 + 16);
      if (!v3)
        return a1;
      v9 = v3 + 3;
      do
      {
        v10 = __ldaxr(v9);
        v11 = v10 - 1;
      }
      while (__stlxr(v11, v9));
      if (v11)
        return a1;
    }
    (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    return a1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8)
    return a1;
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  return a1;
}

unsigned int *std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100](unsigned int *result, uint64_t a2)
{
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  v3 = result;
  v4 = *((_QWORD *)result + 1);
  if (v4 != a2)
  {
    v5 = *((_QWORD *)result + 1);
    do
    {
      v6 = *(_DWORD *)(v5 - 24);
      v5 -= 24;
      v7 = v6 ^ (v6 >> 31);
      if (v7 == 2)
      {
        result = *(unsigned int **)(v4 - 16);
        if (result)
          result = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
        goto LABEL_3;
      }
      if (v7 == 1)
      {
        result = *(unsigned int **)(v4 - 8);
        if (!result)
          goto LABEL_3;
        v8 = result + 3;
        do
        {
          v9 = __ldaxr(v8);
          v10 = v9 - 1;
        }
        while (__stlxr(v10, v8));
        if (v10)
          goto LABEL_3;
      }
      else
      {
        result = *(unsigned int **)(v4 - 8);
        if (!result)
          goto LABEL_3;
        v11 = result + 3;
        do
        {
          v12 = __ldaxr(v11);
          v13 = v12 - 1;
        }
        while (__stlxr(v13, v11));
        if (v13)
          goto LABEL_3;
      }
      result = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 24))(result);
LABEL_3:
      v4 = v5;
    }
    while (v5 != a2);
  }
  *((_QWORD *)v3 + 1) = a2;
  return result;
}

void boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::dispose(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
    {
      if ((v2 & 1) == 0)
      {
        v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
        if (v3)
          v3(v1 + 32, v1 + 32, 2);
      }
      *(_QWORD *)(v1 + 24) = 0;
    }
    if (*(_QWORD *)v1)
    {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__base_destruct_at_end[abi:ne180100]((unsigned int *)v1, *(_QWORD *)v1);
      operator delete(*(void **)v1);
    }
    operator delete((void *)v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_untyped_deleter()
{
  return 0;
}

_QWORD *boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;

  *a1 = off_1E78F4F28;
  v2 = (unsigned int *)a1[7];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  v9 = (unsigned int *)a1[5];
  if (v9)
  {
    v10 = v9 + 2;
    do
    {
      v11 = __ldaxr(v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, v10));
    if (!v12)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
      v13 = v9 + 3;
      do
      {
        v14 = __ldaxr(v13);
        v15 = v14 - 1;
      }
      while (__stlxr(v15, v13));
      if (!v15)
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
    }
  }
  *a1 = off_1E78F4F90;
  v16 = (unsigned int *)a1[2];
  if (v16)
  {
    v17 = v16 + 3;
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 24))(v16);
  }
  return a1;
}

uint64_t boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>::~variant(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v10;

  if (*(_DWORD *)a1 == *(int *)a1 >> 31)
  {
    v2 = *(unsigned int **)(a1 + 16);
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    return a1;
  }
  v10 = *(_QWORD *)(a1 + 8);
  if (!v10)
    return a1;
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return a1;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::function<void ()(void)>::~function(uint64_t *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t *, uint64_t *, uint64_t);

  v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 1, a1 + 1, 2);
    }
    *a1 = 0;
  }
  return a1;
}

void boost::detail::function::functor_manager<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>>::manage(uint64_t a1, _WORD *a2, unsigned int a3)
{
  NSObject *v6;
  void *v7;
  const void *v8;
  const char *v9;

  if (a3 == 4)
    goto LABEL_2;
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      v9 = (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v9 == (const char *)((unint64_t)"N3ctu12DispatchSlotIN8dispatch5blockIU13block_pointerFvvEEEEE" & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v9, (const char *)((unint64_t)"N3ctu12DispatchSlotIN8dispatch5blockIU13block_pointerFvvEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(_QWORD *)a2 = a1;
      }
      else
      {
        *(_QWORD *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      dispatch_release(*(dispatch_object_t *)a2);
      v8 = (const void *)*((_QWORD *)a2 + 1);
      if (v8)
LABEL_9:
        _Block_release(v8);
    }
  }
  else
  {
    v6 = *(NSObject **)a1;
    v7 = *(void **)(a1 + 8);
    *(_QWORD *)a2 = *(_QWORD *)a1;
    if (v7)
    {
      v7 = _Block_copy(v7);
      v6 = *(NSObject **)a2;
    }
    *((_QWORD *)a2 + 1) = v7;
    dispatch_retain(v6);
    if (a3 == 1)
    {
      dispatch_release(*(dispatch_object_t *)a1);
      v8 = *(const void **)(a1 + 8);
      if (v8)
        goto LABEL_9;
    }
  }
}

void boost::detail::function::void_function_obj_invoker0<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>,void>::invoke(uint64_t a1)
{
  const void *v1;
  NSObject *v2;
  void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  void *v9;
  const void *v10;
  void *v11;
  const void *v12;
  void *v13;
  const void *v14;
  void *v15;
  char v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(_QWORD *, _QWORD *, uint64_t);
  _QWORD v21[3];
  _QWORD block[5];

  v2 = *(NSObject **)a1;
  v1 = *(const void **)(a1 + 8);
  if (!v1)
  {
    v4 = 0;
    goto LABEL_10;
  }
  v3 = _Block_copy(v1);
  v4 = v3;
  if (!v3)
  {
LABEL_10:
    v16 = 1;
LABEL_11:
    v15 = 0;
    v21[0] = 0;
    goto LABEL_21;
  }
  v5 = _Block_copy(v3);
  v6 = v5;
  if (!v5)
  {
    v16 = 0;
    goto LABEL_11;
  }
  v7 = _Block_copy(v5);
  v8 = v7;
  if (v7)
  {
    v9 = _Block_copy(v7);
    v10 = v9;
    if (v9)
    {
      v11 = _Block_copy(v9);
      v12 = v11;
      if (v11)
      {
        v13 = _Block_copy(v11);
        v14 = v13;
        if (v13)
        {
          v15 = _Block_copy(v13);
          v21[0] = v15;
          _Block_release(v14);
        }
        else
        {
          v15 = 0;
          v21[0] = 0;
        }
        _Block_release(v12);
      }
      else
      {
        v15 = 0;
        v21[0] = 0;
      }
      _Block_release(v10);
    }
    else
    {
      v15 = 0;
      v21[0] = 0;
    }
    _Block_release(v8);
  }
  else
  {
    v15 = 0;
    v21[0] = 0;
  }
  _Block_release(v6);
  v16 = 0;
LABEL_21:
  v17 = operator new(0x20uLL);
  *v17 = boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable;
  if (v15)
    v18 = _Block_copy(v15);
  else
    v18 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v17[1] = v18;
  block[0] = v19;
  block[1] = 0x40000000;
  block[2] = ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_19;
  block[4] = v17;
  dispatch_async(v2, block);
  if (boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable)
  {
    if ((boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable & 1) == 0)
    {
      v20 = *(void (**)(_QWORD *, _QWORD *, uint64_t))((unint64_t)boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL);
      if (v20)
        v20(v21, v21, 2);
    }
  }
  if ((v16 & 1) == 0)
    _Block_release(v4);
}

void sub_1BF311598(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  const void *v10;
  const void *v11;
  char v12;

  if (v11)
    _Block_release(v11);
  if ((v12 & 1) == 0)
    _Block_release(v10);
  _Unwind_Resume(exception_object);
}

void ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvvEEE_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t *, uint64_t *, uint64_t);
  std::runtime_error v6;

  v1 = *(_QWORD **)(a1 + 32);
  if (!*v1)
  {
    std::runtime_error::runtime_error(&v6, "call to empty boost::function");
    v6.__vftable = (std::runtime_error_vtbl *)&unk_1E78F5518;
    boost::throw_exception<boost::bad_function_call>(&v6);
  }
  (*(void (**)(_QWORD *))((*v1 & 0xFFFFFFFFFFFFFFFELL) + 8))(v1 + 1);
  v3 = *(uint64_t **)(a1 + 32);
  if (v3)
  {
    v4 = *v3;
    if (*v3)
    {
      if ((v4 & 1) == 0)
      {
        v5 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL);
        if (v5)
          v5(v3 + 1, v3 + 1, 2);
      }
      *v3 = 0;
    }
    operator delete(v3);
  }
}

void sub_1BF311680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::runtime_error a9)
{
  std::runtime_error::~runtime_error(&a9);
  _Unwind_Resume(a1);
}

void boost::throw_exception<boost::bad_function_call>(const std::runtime_error *a1)
{
  void *exception;

  exception = __cxa_allocate_exception(0x40uLL);
  boost::wrapexcept<boost::bad_function_call>::wrapexcept((uint64_t)exception, a1);
}

void sub_1BF3116D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t boost::wrapexcept<boost::bad_function_call>::wrapexcept(uint64_t a1, const std::runtime_error *a2)
{
  *(_QWORD *)a1 = &unk_1E78F54E8;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), a2);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = -1;
  *(_QWORD *)a1 = &unk_1E78F5470;
  *(_QWORD *)(a1 + 8) = &unk_1E78F54A0;
  *(_QWORD *)(a1 + 24) = &unk_1E78F54C8;
  *(_QWORD *)(a1 + 32) = 0;
  return a1;
}

uint64_t boost::wrapexcept<boost::bad_function_call>::~wrapexcept(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 24) = &unk_1E78F5540;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2))
    *(_QWORD *)(a1 + 32) = 0;
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  return a1;
}

char *boost::wrapexcept<boost::bad_function_call>::clone(uint64_t a1)
{
  char *v2;
  uint64_t v3;

  v2 = (char *)operator new(0x40uLL);
  *(_QWORD *)v2 = &unk_1E78F54E8;
  std::runtime_error::runtime_error((std::runtime_error *)(v2 + 8), (const std::runtime_error *)(a1 + 8));
  *((_QWORD *)v2 + 1) = &unk_1E78F5518;
  *((_QWORD *)v2 + 3) = &unk_1E78F5540;
  v3 = *(_QWORD *)(a1 + 32);
  *((_QWORD *)v2 + 4) = v3;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *((_DWORD *)v2 + 14) = *(_DWORD *)(a1 + 56);
  *(_QWORD *)v2 = &unk_1E78F5470;
  *((_QWORD *)v2 + 1) = &unk_1E78F54A0;
  *((_QWORD *)v2 + 3) = &unk_1E78F54C8;
  boost::exception_detail::copy_boost_exception((uint64_t)(v2 + 24), a1 + 24);
  return v2;
}

void sub_1BF311864(_Unwind_Exception *a1)
{
  void *v1;
  std::runtime_error *v2;

  std::runtime_error::~runtime_error(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1BF311880(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void boost::wrapexcept<boost::bad_function_call>::rethrow(uint64_t a1)
{
  void *exception;

  exception = __cxa_allocate_exception(0x40uLL);
  boost::wrapexcept<boost::bad_function_call>::wrapexcept((uint64_t)exception, a1);
}

void sub_1BF3118D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void boost::wrapexcept<boost::bad_function_call>::~wrapexcept(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 24) = &unk_1E78F5540;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2))
    *(_QWORD *)(a1 + 32) = 0;
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  operator delete((void *)a1);
}

void `non-virtual thunk to'boost::wrapexcept<boost::bad_function_call>::~wrapexcept(std::runtime_error *this)
{
  const char *imp;

  this[1].__vftable = (std::runtime_error_vtbl *)&unk_1E78F5540;
  imp = this[1].__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(_QWORD *)imp + 32))(imp))
    this[1].__imp_.__imp_ = 0;
  std::runtime_error::~runtime_error(this);
}

{
  const char *imp;

  this[1].__vftable = (std::runtime_error_vtbl *)&unk_1E78F5540;
  imp = this[1].__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(_QWORD *)imp + 32))(imp))
    this[1].__imp_.__imp_ = 0;
  std::runtime_error::~runtime_error(this);
  operator delete(&this[-1].__imp_);
}

void `non-virtual thunk to'boost::wrapexcept<boost::bad_function_call>::~wrapexcept(std::runtime_error *a1)
{
  const char *imp;

  a1->__vftable = (std::runtime_error_vtbl *)&unk_1E78F5540;
  imp = a1->__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(_QWORD *)imp + 32))(imp))
    a1->__imp_.__imp_ = 0;
  std::runtime_error::~runtime_error(a1 - 1);
}

{
  const char *imp;

  a1->__vftable = (std::runtime_error_vtbl *)&unk_1E78F5540;
  imp = a1->__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(_QWORD *)imp + 32))(imp))
    a1->__imp_.__imp_ = 0;
  std::runtime_error::~runtime_error(a1 - 1);
  operator delete(&a1[-2].__imp_);
}

void boost::bad_function_call::~bad_function_call(std::runtime_error *this)
{
  void *v1;

  std::runtime_error::~runtime_error(this);
  operator delete(v1);
}

uint64_t boost::wrapexcept<boost::bad_function_call>::wrapexcept(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  *(_QWORD *)a1 = &unk_1E78F54E8;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)(a2 + 8));
  *(_QWORD *)(a1 + 8) = &unk_1E78F5518;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = &unk_1E78F5540;
  *(_QWORD *)(a1 + 32) = v4;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  v5 = *(_OWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  *(_QWORD *)a1 = &unk_1E78F5470;
  *(_QWORD *)(a1 + 8) = &unk_1E78F54A0;
  *(_QWORD *)(a1 + 24) = &unk_1E78F54C8;
  return a1;
}

void sub_1BF311B64(_Unwind_Exception *a1)
{
  std::runtime_error *v1;

  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t boost::exception_detail::copy_boost_exception(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  if (!v4)
  {
    v5 = 0;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    result = *(_QWORD *)(a1 + 8);
    if (!result)
      goto LABEL_9;
    goto LABEL_8;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v4 + 40))(&v7);
  v5 = v7;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 32))(v7);
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  result = *(_QWORD *)(a1 + 8);
  if (result)
LABEL_8:
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 32))(result);
LABEL_9:
  *(_QWORD *)(a1 + 8) = v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 32))(v5);
  }
  return result;
}

void sub_1BF311C5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 32))(a10);
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
  _Unwind_Resume(exception_object);
}

void boost::detail::function::functor_manager<dispatch::block<void({block_pointer})(void)>>::manage(void **a1, _WORD *a2, unsigned int a3)
{
  void *v6;
  void *v7;
  const char *v8;

  if (a3 == 4)
    goto LABEL_2;
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      v8 = (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v8 == (const char *)((unint64_t)"N8dispatch5blockIU13block_pointerFvvEEE" & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v8, (const char *)((unint64_t)"N8dispatch5blockIU13block_pointerFvvEEE" & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(_QWORD *)a2 = a1;
      }
      else
      {
        *(_QWORD *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      v7 = *(void **)a2;
      if (*(_QWORD *)a2)
LABEL_9:
        _Block_release(v7);
    }
  }
  else
  {
    v6 = *a1;
    if (*a1)
      v6 = _Block_copy(v6);
    *(_QWORD *)a2 = v6;
    if (a3 == 1)
    {
      v7 = *a1;
      if (*a1)
        goto LABEL_9;
    }
  }
}

uint64_t boost::detail::function::void_function_obj_invoker0<dispatch::block<void({block_pointer})(void)>,void>::invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)a1 + 16))();
}

uint64_t boost::function0<void>::move_assign(uint64_t result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  __int128 v7;

  if (a2 != (uint64_t *)result)
  {
    v2 = a2;
    v3 = (uint64_t *)result;
    v4 = *a2;
    if (*a2)
    {
      *(_QWORD *)result = v4;
      if ((v4 & 1) != 0)
      {
        v7 = *(_OWORD *)(a2 + 1);
        *(_QWORD *)(result + 24) = a2[3];
        *(_OWORD *)(result + 8) = v7;
      }
      else
      {
        result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL))(a2 + 1, result + 8, 1);
      }
    }
    else
    {
      v5 = *(_QWORD *)result;
      if (!*(_QWORD *)result)
        return result;
      if ((v5 & 1) == 0)
      {
        v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 & 0xFFFFFFFFFFFFFFFELL);
        if (v6)
          result = v6(result + 8, result + 8, 2);
      }
      v2 = v3;
    }
    *v2 = 0;
  }
  return result;
}

void sub_1BF311E44(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_rethrow();
}

void sub_1BF311E54(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *boost::function0<void>::~function0(uint64_t *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t *, uint64_t *, uint64_t);

  v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3)
        v3(a1 + 1, a1 + 1, 2);
    }
    *a1 = 0;
  }
  return a1;
}

uint64_t std::__split_buffer<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(_DWORD *)(i - 24);
    *(_QWORD *)(a1 + 16) = i - 24;
    v5 = v4 ^ (v4 >> 31);
    if (v5 == 2)
    {
      v10 = *(_QWORD *)(i - 16);
      if (v10)
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
    }
    else if (v5 == 1)
    {
      v6 = *(unsigned int **)(i - 8);
      if (v6)
      {
        v7 = v6 + 3;
        do
        {
          v8 = __ldaxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
          goto LABEL_10;
      }
    }
    else
    {
      v6 = *(unsigned int **)(i - 8);
      if (v6)
      {
        v11 = v6 + 3;
        do
        {
          v12 = __ldaxr(v11);
          v13 = v12 - 1;
        }
        while (__stlxr(v13, v11));
        if (!v13)
        {
LABEL_10:
          (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
          continue;
        }
      }
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>,std::reverse_iterator<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t i;
  int v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
    for (i = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8); ; i += 24)
    {
      if (i == v3)
        return a1;
      v5 = *(_DWORD *)i ^ (*(int *)i >> 31);
      if (v5 == 2)
      {
        v10 = *(_QWORD *)(i + 8);
        if (v10)
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
      else if (v5 == 1)
      {
        v6 = *(unsigned int **)(i + 16);
        if (v6)
        {
          v7 = v6 + 3;
          do
          {
            v8 = __ldaxr(v7);
            v9 = v8 - 1;
          }
          while (__stlxr(v9, v7));
          if (!v9)
            goto LABEL_12;
        }
      }
      else
      {
        v6 = *(unsigned int **)(i + 16);
        if (v6)
        {
          v11 = v6 + 3;
          do
          {
            v12 = __ldaxr(v11);
            v13 = v12 - 1;
          }
          while (__stlxr(v13, v11));
          if (!v13)
          {
LABEL_12:
            (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            continue;
          }
        }
      }
    }
  }
  return a1;
}

_QWORD *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::~foreign_weak_ptr_impl(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_1E78F50F0;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::~foreign_weak_ptr_impl(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_1E78F50F0;
  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::lock(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t v10;

  v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  v7 = operator new(0x18uLL);
  *v7 = &off_1E78F5150;
  v7[1] = v6;
  v7[2] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    *a2 = v7;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    *a2 = v7;
  }
}

void sub_1BF3121D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::expired(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  return !v1 || *(_QWORD *)(v1 + 8) == -1;
}

_QWORD *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_1E78F50F0;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

_QWORD *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::~foreign_shared_ptr_impl(_QWORD *result)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  *result = &off_1E78F5150;
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

void boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::~foreign_shared_ptr_impl(_QWORD *__p)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  *__p = &off_1E78F5150;
  v2 = (std::__shared_weak_count *)__p[2];
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
    operator delete(__p);
  }
  else
  {
LABEL_5:
    operator delete(__p);
  }
}

_QWORD *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_1E78F5150;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

void ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v6;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;

  *a2 = a1;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F53A0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a1;
  a2[1] = (uint64_t)v4;
  if (a1)
  {
    v6 = *(std::__shared_weak_count **)(a1 + 80);
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        goto LABEL_15;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      *(_QWORD *)(a1 + 72) = a1;
      *(_QWORD *)(a1 + 80) = v4;
      std::__shared_weak_count::__release_weak(v6);
    }
    else
    {
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      v11 = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      *(_QWORD *)(a1 + 72) = a1;
      *(_QWORD *)(a1 + 80) = v4;
    }
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
LABEL_15:
  ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*a2);
}

void sub_1BF31248C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_1BF3124A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = a1 + 56;
  if (*(_QWORD *)(a1 + 56))
  {
    if (!*(_QWORD *)(a1 + 80) || (v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0)
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
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
}

void sub_1BF3125BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_1BF3125D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

void AppleBasebandManager::State::eventsOn_sync(AppleBasebandManager::State *this)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  char v6;
  __int128 *p_buf;
  __int128 block;
  _QWORD *(*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  __int128 **p_p_buf;
  __int128 buf;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *((_DWORD *)this + 35);
  if (v2 == 1)
    goto LABEL_4;
  if (!v2)
  {
    AppleBasebandManager::State::changeEventsState_sync((uint64_t)this, 1);
LABEL_4:
    v3 = **((_QWORD **)this + 18);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 0x40000000;
    v14 = ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke;
    v15 = &__block_descriptor_tmp_35;
    v16 = v3;
    p_buf = &buf;
    *(_QWORD *)&block = MEMORY[0x1E0C809B0];
    *((_QWORD *)&block + 1) = 0x40000000;
    v9 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v10 = &__block_descriptor_tmp_12;
    v11 = v3 + 8;
    p_p_buf = &p_buf;
    v4 = *(NSObject **)(v3 + 24);
    if (*(_QWORD *)(v3 + 32))
      dispatch_async_and_wait(v4, &block);
    else
      dispatch_sync(v4, &block);
    return;
  }
  v5 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v2 == 2)
    {
      strcpy((char *)&block, "EventsOn");
      v6 = 8;
    }
    else
    {
      strcpy((char *)&block, "Unknown");
      v6 = 7;
    }
    HIBYTE(v9) = v6;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = &block;
    _os_log_debug_impl(&dword_1BF308000, v5, OS_LOG_TYPE_DEBUG, "#D Events state is %s, skipping", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(v9) < 0)
      operator delete((void *)block);
  }
}

void AppleBasebandManager::State::changeEventsState_sync(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD *v5;
  int v6;
  void *__p[2];
  char v8;
  void *v9[2];
  char v10;
  uint8_t buf[4];
  _QWORD *v12;
  __int16 v13;
  void **v14;
  __int16 v15;
  void **v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (_QWORD *)(a1 + 104);
    if (*(char *)(a1 + 127) < 0)
    {
      v5 = (_QWORD *)*v5;
      v6 = *(_DWORD *)(a1 + 140);
      if (v6 != 2)
      {
LABEL_4:
        if (v6 == 1)
        {
          v10 = 14;
          strcpy((char *)v9, "EventsChanging");
          if (a2 != 2)
            goto LABEL_14;
        }
        else
        {
          if (!v6)
          {
            v10 = 9;
            strcpy((char *)v9, "EventsOff");
            if (a2 == 2)
              goto LABEL_12;
LABEL_14:
            if (a2 == 1)
            {
              v8 = 14;
              strcpy((char *)__p, "EventsChanging");
            }
            else if (a2)
            {
              v8 = 7;
              strcpy((char *)__p, "Unknown");
            }
            else
            {
              v8 = 9;
              strcpy((char *)__p, "EventsOff");
            }
LABEL_19:
            *(_DWORD *)buf = 136315650;
            v12 = v5;
            v13 = 2080;
            v14 = v9;
            v15 = 2080;
            v16 = __p;
            _os_log_impl(&dword_1BF308000, v4, OS_LOG_TYPE_DEFAULT, "#I [%s] Changing event state from %s to %s", buf, 0x20u);
            if (v8 < 0)
            {
              operator delete(__p[0]);
              if ((v10 & 0x80000000) == 0)
                goto LABEL_21;
            }
            else if ((v10 & 0x80000000) == 0)
            {
              goto LABEL_21;
            }
            operator delete(v9[0]);
            goto LABEL_21;
          }
          v10 = 7;
          strcpy((char *)v9, "Unknown");
          if (a2 != 2)
            goto LABEL_14;
        }
LABEL_12:
        v8 = 8;
        strcpy((char *)__p, "EventsOn");
        goto LABEL_19;
      }
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 140);
      if (v6 != 2)
        goto LABEL_4;
    }
    v10 = 8;
    strcpy((char *)v9, "EventsOn");
    if (a2 == 2)
      goto LABEL_12;
    goto LABEL_14;
  }
LABEL_21:
  *(_DWORD *)(a1 + 140) = a2;
}

void AppleBasebandManager::State::changeCheckInState_sync(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD *v5;
  int v6;
  void *__p[2];
  char v8;
  void *v9[2];
  char v10;
  uint8_t buf[4];
  _QWORD *v12;
  __int16 v13;
  void **v14;
  __int16 v15;
  void **v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (_QWORD *)(a1 + 104);
    if (*(char *)(a1 + 127) < 0)
    {
      v5 = (_QWORD *)*v5;
      v6 = *(_DWORD *)(a1 + 136);
      if (v6 != 2)
      {
LABEL_4:
        if (v6 == 1)
        {
          v10 = 10;
          strcpy((char *)v9, "CheckingIn");
          if (a2 != 2)
            goto LABEL_14;
        }
        else
        {
          if (!v6)
          {
            v10 = 12;
            strcpy((char *)v9, "NotCheckedIn");
            if (a2 == 2)
              goto LABEL_12;
LABEL_14:
            if (a2 == 1)
            {
              v8 = 10;
              strcpy((char *)__p, "CheckingIn");
            }
            else if (a2)
            {
              v8 = 7;
              strcpy((char *)__p, "Unknown");
            }
            else
            {
              v8 = 12;
              strcpy((char *)__p, "NotCheckedIn");
            }
LABEL_19:
            *(_DWORD *)buf = 136315650;
            v12 = v5;
            v13 = 2080;
            v14 = v9;
            v15 = 2080;
            v16 = __p;
            _os_log_impl(&dword_1BF308000, v4, OS_LOG_TYPE_DEFAULT, "#I [%s] Changing checked in state from %s to %s", buf, 0x20u);
            if (v8 < 0)
            {
              operator delete(__p[0]);
              if ((v10 & 0x80000000) == 0)
                goto LABEL_21;
            }
            else if ((v10 & 0x80000000) == 0)
            {
              goto LABEL_21;
            }
            operator delete(v9[0]);
            goto LABEL_21;
          }
          v10 = 7;
          strcpy((char *)v9, "Unknown");
          if (a2 != 2)
            goto LABEL_14;
        }
LABEL_12:
        v8 = 9;
        strcpy((char *)__p, "CheckedIn");
        goto LABEL_19;
      }
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 136);
      if (v6 != 2)
        goto LABEL_4;
    }
    v10 = 9;
    strcpy((char *)v9, "CheckedIn");
    if (a2 == 2)
      goto LABEL_12;
    goto LABEL_14;
  }
LABEL_21:
  *(_DWORD *)(a1 + 136) = a2;
}

void ___ZN20AppleBasebandManager5State15setEventHandlerENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS1_10shared_ptrIN3abm6client5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  void *v7;
  std::string v8;
  void *v9;
  NSObject *v10;
  std::string v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(const void **)(a1 + 64);
    if (v3)
    {
LABEL_3:
      v4 = _Block_copy(v3);
      v5 = *(NSObject **)(a1 + 72);
      if (!v5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    v8 = *(std::string *)(a1 + 40);
    v3 = *(const void **)(a1 + 64);
    if (v3)
      goto LABEL_3;
  }
  v4 = 0;
  v5 = *(NSObject **)(a1 + 72);
  if (v5)
LABEL_4:
    dispatch_retain(v5);
LABEL_5:
  v6 = *(uint64_t **)(v2 + 144);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v11, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
  else
    v11 = v8;
  if (v4)
  {
    v7 = _Block_copy(v4);
    v9 = v7;
    v10 = v5;
    if (!v5)
      goto LABEL_14;
    goto LABEL_13;
  }
  v7 = 0;
  v9 = 0;
  v10 = v5;
  if (v5)
LABEL_13:
    dispatch_retain(v5);
LABEL_14:
  abm::client::Transport::setEventHandler(v6, (uint64_t)&v11, (uint64_t)&v9);
  if (v5)
    dispatch_release(v5);
  if (v7)
    _Block_release(v7);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (v5)
    dispatch_release(v5);
  if (v4)
    _Block_release(v4);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_1BF312E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback((uint64_t)&a9);
  if ((a16 & 0x80000000) == 0)
    _Unwind_Resume(a1);
  operator delete(__p);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c86_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;

  v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
    v6 = *(void **)(a2 + 64);
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = *(_OWORD *)(a2 + 40);
  v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
  *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  v6 = *(void **)(a2 + 64);
  if (v6)
LABEL_5:
    v6 = _Block_copy(v6);
LABEL_6:
  v7 = *(NSObject **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v7;
  if (v7)
    dispatch_retain(v7);
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c86_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void ___ZN20AppleBasebandManager5State8eventsOnEv_block_invoke(uint64_t a1)
{
  AppleBasebandManager::State::eventsOn_sync(*(AppleBasebandManager::State **)(a1 + 32));
}

void ___ZN20AppleBasebandManager5State7performENSt3__110shared_ptrIN3abm6client7CommandEEE_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD v21[6];
  std::__shared_weak_count *v22;

  v2 = a1[4];
  v1 = a1[5];
  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = *(uint64_t **)(v2 + 144);
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    v8 = *v6;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  else
  {
    v8 = **(_QWORD **)(v2 + 144);
  }
  v10 = (uint64_t *)(v8 + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1174405120;
  v21[2] = ___ZN3abm6client9Transport5State7performENSt3__110shared_ptrINS0_7CommandEEE_block_invoke;
  v21[3] = &__block_descriptor_tmp_13;
  v21[4] = v8;
  v21[5] = v1;
  v22 = v3;
  if (v3)
  {
    v11 = (unint64_t *)&v3->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v10, (uint64_t)v21);
  v13 = v22;
  if (!v22)
    goto LABEL_17;
  v14 = (unint64_t *)&v22->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (!v3)
      return;
  }
  else
  {
LABEL_17:
    if (!v3)
      return;
  }
  v16 = (unint64_t *)&v3->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  do
    v18 = __ldaxr(v16);
  while (__stlxr(v18 - 1, v16));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  v19 = (unint64_t *)&v3->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t __copy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
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
}

void ___ZN20AppleBasebandManager5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  __int128 *p_buf;
  void *block;
  uint64_t v10;
  _QWORD *(*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  __int128 **p_p_buf;
  __int128 buf;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 140);
  if (v2 == 1)
    goto LABEL_4;
  if (v2 == 2)
  {
    AppleBasebandManager::State::changeEventsState_sync(*(_QWORD *)(a1 + 32), 1);
LABEL_4:
    v3 = **(_QWORD **)(v1 + 144);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 0x40000000;
    v16 = ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke;
    v17 = &__block_descriptor_tmp_36;
    v18 = v3;
    p_buf = &buf;
    block = (void *)MEMORY[0x1E0C809B0];
    v10 = 0x40000000;
    v11 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v12 = &__block_descriptor_tmp_12;
    v13 = v3 + 8;
    p_p_buf = &p_buf;
    v4 = *(NSObject **)(v3 + 24);
    if (*(_QWORD *)(v3 + 32))
      dispatch_async_and_wait(v4, &block);
    else
      dispatch_sync(v4, &block);
    return;
  }
  v5 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v2)
    {
      qmemcpy(&block, "Unknown", 7);
      v6 = 7;
      v7 = 7;
    }
    else
    {
      LOBYTE(v10) = 102;
      block = *(void **)"EventsOff";
      v6 = 9;
      v7 = 9;
    }
    *((_BYTE *)&block + v6) = 0;
    HIBYTE(v11) = v7;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = &block;
    _os_log_debug_impl(&dword_1BF308000, v5, OS_LOG_TYPE_DEBUG, "#D Events state is %s, skipping", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(v11) < 0)
      operator delete(block);
  }
}

uint64_t ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = (std::__shared_weak_count *)v1[1];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF332876)
    return a1 + 24;
  if (((v3 & 0x80000001BF332876 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF332876))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF332876 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t __cxx_global_var_init_8()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1BF308000);
  }
  return result;
}

std::string *abm::trace::getBasebandTraceDirSuffix@<X0>(abm::trace *this@<X0>, std::string *a2@<X8>)
{
  int v2;
  std::string *result;
  char **v5;

  v2 = (int)this;
  memset(a2, 170, sizeof(std::string));
  *((_BYTE *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  result = (std::string *)capabilities::radio::vendor(this);
  if (((_DWORD)result - 2) >= 2)
  {
    if ((_DWORD)result != 1)
      return result;
    if (v2)
    {
      *((_BYTE *)&a2->__r_.__value_.__s + 23) = 5;
      strcpy((char *)a2, "-qdss");
      return result;
    }
    v5 = abm::trace::kEURTraceSnapshotDirectorySuffix;
  }
  else
  {
    v5 = abm::trace::kICETraceSnapshotDirectorySuffix;
  }
  return std::string::__assign_external(a2, *v5);
}

void sub_1BF3136BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

size_t std::string::basic_string[abi:ne180100]<0>(const char *a1)
{
  size_t result;
  size_t v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;

  result = strlen(a1);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v3 = result;
  if (result >= 0x17)
  {
    v5 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v5 = result | 7;
    v6 = v5 + 1;
    v4 = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&xmmword_1EF57CB88 + 1) = v3;
    unk_1EF57CB98 = v6 | 0x8000000000000000;
    *(_QWORD *)&xmmword_1EF57CB88 = v4;
  }
  else
  {
    v4 = &xmmword_1EF57CB88;
    byte_1EF57CB9F = result;
    if (!result)
    {
      LOBYTE(xmmword_1EF57CB88) = 0;
      return result;
    }
  }
  result = (size_t)memmove(v4, a1, v3);
  *((_BYTE *)v4 + v3) = 0;
  return result;
}

void abm::trace::getCoreDumpDirSuffix(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;
  int v5;
  char **v6;

  v3 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::radio *)__cxa_guard_acquire(&_MergedGlobals);
    if ((_DWORD)v4)
    {
      v5 = capabilities::radio::maverick(v4);
      v6 = abm::trace::kEURCoreDumpSnapshotDirectorySuffix;
      if (!v5)
        v6 = abm::trace::kCoreDumpSnapshotDirectorySuffix;
      std::string::basic_string[abi:ne180100]<0>(*v6);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  if (byte_1EF57CB9F < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_1EF57CB88, *((std::string::size_type *)&xmmword_1EF57CB88 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_1EF57CB88;
    a1->__r_.__value_.__r.__words[2] = unk_1EF57CB98;
  }
}

void sub_1BF313844(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_MergedGlobals);
  _Unwind_Resume(a1);
}

uint64_t abm::trace::isSupported(uint64_t a1)
{
  const char *v1;
  int v2;
  capabilities::radio *v3;
  const char *v4;
  capabilities::radio *v5;
  const char *v6;
  capabilities::radio *v7;
  capabilities::trace *v8;
  capabilities::trace *v9;

  v1 = (const char *)a1;
  v2 = *(char *)(a1 + 23);
  if (v2 < 0)
  {
    v3 = (capabilities::radio *)strcasecmp(*(const char **)a1, (const char *)abm::trace::kDIAG);
    if ((_DWORD)v3)
    {
LABEL_3:
      v4 = v1;
      if ((v2 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = (capabilities::radio *)strcasecmp((const char *)a1, (const char *)abm::trace::kDIAG);
    if ((_DWORD)v3)
      goto LABEL_3;
  }
  if ((capabilities::radio::maverick(v3) & 1) != 0)
    return 1;
  LOBYTE(v2) = v1[23];
  v4 = v1;
  if ((v2 & 0x80) == 0)
  {
LABEL_4:
    v5 = (capabilities::radio *)strcasecmp(v4, (const char *)abm::trace::kICETrace);
    if ((_DWORD)v5)
      goto LABEL_5;
LABEL_12:
    if ((capabilities::radio::ice(v5) & 1) != 0)
      return 1;
    LOBYTE(v2) = v1[23];
    if ((v2 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_11:
  v5 = (capabilities::radio *)strcasecmp(*(const char **)v1, (const char *)abm::trace::kICETrace);
  if (!(_DWORD)v5)
    goto LABEL_12;
LABEL_5:
  if ((v2 & 0x80) == 0)
  {
LABEL_6:
    v6 = v1;
    if (!strcasecmp(v1, (const char *)abm::trace::kBasebandTrace))
      return 1;
    goto LABEL_15;
  }
LABEL_14:
  v6 = *(const char **)v1;
  if (!strcasecmp(*(const char **)v1, (const char *)abm::trace::kBasebandTrace))
    return 1;
LABEL_15:
  v7 = (capabilities::radio *)strcasecmp(v6, (const char *)abm::trace::kEURCoreDump);
  if ((_DWORD)v7)
  {
    if ((v2 & 0x80) == 0)
      goto LABEL_17;
  }
  else
  {
    if ((capabilities::radio::maverick(v7) & 1) != 0)
      return 1;
    if ((v1[23] & 0x80) == 0)
    {
LABEL_17:
      if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump)
        || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
      {
        return 1;
      }
      v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kCompression);
      if (!(_DWORD)v8)
        return capabilities::trace::allowed(v8);
      v9 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kBasebandIPC);
      if ((_DWORD)v9)
      {
        v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kIPC);
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        v8 = (capabilities::trace *)strcasecmp(v1, "KernelPCI");
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTapToRadar);
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        goto LABEL_34;
      }
      return capabilities::trace::supportsBasebandIPCTrace(v9);
    }
  }
  v1 = *(const char **)v1;
  if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump) || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
    return 1;
  v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kCompression);
  if (!(_DWORD)v8)
    return capabilities::trace::allowed(v8);
  v9 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kBasebandIPC);
  if ((_DWORD)v9)
  {
    v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kIPC);
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
    v8 = (capabilities::trace *)strcasecmp(v1, "KernelPCI");
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
    v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTapToRadar);
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
LABEL_34:
    if (strcasecmp(v1, (const char *)abm::trace::kProfile))
    {
      v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTraceTailspin);
      if ((_DWORD)v8)
      {
        v8 = (capabilities::trace *)strcasecmp(v1, "Settings");
        if ((_DWORD)v8)
        {
          v8 = (capabilities::trace *)strcasecmp(v1, "LogFilter");
          if ((_DWORD)v8)
            return 0;
        }
      }
      return capabilities::trace::allowed(v8);
    }
    return 1;
  }
  return capabilities::trace::supportsBasebandIPCTrace(v9);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  size_t v11;
  std::string::size_type v12;
  uint64_t v13;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22)
            operator delete(v9);
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__n > 2 * v8)
          v12 = __n;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    v6 = HIBYTE(v10);
    v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void abm::client::GetTraceProperty(xpc_object_t object@<X1>, uint64_t *a2@<X0>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v6;
  uint64_t v8;
  char *v9;
  xpc_object_t v10;
  char *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  xpc_object_t objecta;
  void *__p;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, xpc_object_t *);
  void *v23;
  void *aBlock;

  if (!*a2)
  {
    v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v9;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v6 = object;
  v8 = MEMORY[0x1E0C812F8];
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    v6 = xpc_null_create();
    if (!v6)
    {
      v10 = xpc_null_create();
      v6 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C3B88380](v6) == v8)
  {
    xpc_retain(v6);
    v10 = v6;
  }
  else
  {
    v10 = xpc_null_create();
  }
LABEL_10:
  xpc_release(v6);
  if (MEMORY[0x1C3B88380](v10) == v8)
  {
    if (a3)
    {
      v12 = _Block_copy(a3);
      a3 = v12;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 1174405120;
      v22 = ___ZN3abm6client16GetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
      v23 = &__block_descriptor_tmp_0;
      if (v12)
      {
        v13 = _Block_copy(v12);
        v14 = 0;
        goto LABEL_18;
      }
      v13 = 0;
    }
    else
    {
      v13 = 0;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 1174405120;
      v22 = ___ZN3abm6client16GetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
      v23 = &__block_descriptor_tmp_0;
    }
    v14 = 1;
LABEL_18:
    aBlock = v13;
    v15 = *a2;
    objecta = v10;
    __p = operator new(0x20uLL);
    v19 = xmmword_1BF332C40;
    strcpy((char *)__p, "kCommandGetTraceProperty");
    if (v10)
      xpc_retain(v10);
    else
      objecta = xpc_null_create();
    abm::client::Manager::perform(v15, (int)&__p, &v20, &objecta);
    xpc_release(objecta);
    objecta = 0;
    if (SHIBYTE(v19) < 0)
    {
      operator delete(__p);
      *(_DWORD *)a4 = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 8) = 0;
      v16 = aBlock;
      if (!aBlock)
        goto LABEL_26;
    }
    else
    {
      *(_DWORD *)a4 = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 8) = 0;
      v16 = aBlock;
      if (!aBlock)
      {
LABEL_26:
        if ((v14 & 1) == 0)
          _Block_release(a3);
        goto LABEL_28;
      }
    }
    _Block_release(v16);
    goto LABEL_26;
  }
  v11 = (char *)operator new(0x20uLL);
  strcpy(v11, "Invalid input dictionary passed");
  *(_DWORD *)a4 = -534716414;
  *(_QWORD *)(a4 + 8) = v11;
  *(_OWORD *)(a4 + 16) = xmmword_1BF332C30;
LABEL_28:
  xpc_release(v10);
}

void sub_1BF313F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client16GetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t value;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  char *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void **v15;
  xpc_object_t v16;
  xpc_object_t object;
  void *v18[3];
  xpc_object_t v19;
  void *__p;
  std::string v21;

  if (!*(_QWORD *)(a1 + 32))
    return;
  v6 = xpc_null_create();
  v19 = v6;
  if (!*(_DWORD *)a2)
  {
    memset(v18, 170, sizeof(v18));
    value = xpc_dictionary_get_value(*a3, "kKeyTracePropertyName");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    __p = 0;
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = 0uLL;
    xpc::dyn_cast_or_default();
    xpc_release(object);
    v9 = (void *)HIBYTE(v18[2]);
    if (SHIBYTE(v18[2]) < 0)
      v9 = v18[1];
    if (v9)
    {
      v10 = xpc_dictionary_create(0, 0, 0);
      if (v10 || (v10 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1C3B88380](v10) == MEMORY[0x1E0C812F8])
        {
          xpc_retain(v10);
          v11 = v10;
        }
        else
        {
          v11 = xpc_null_create();
        }
      }
      else
      {
        v11 = xpc_null_create();
        v10 = 0;
      }
      xpc_release(v10);
      v13 = xpc_null_create();
      v14 = v19;
      v19 = v11;
      xpc_release(v14);
      xpc_release(v13);
      v15 = v18;
      if (SHIBYTE(v18[2]) < 0)
        v15 = (void **)v18[0];
      __p = &v19;
      v21.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
      xpc::dict::object_proxy::operator=(&v16, (uint64_t)&__p, *a3, "kKeyTracePropertyValue");
      xpc_release(v16);
      v16 = 0;
      if (SHIBYTE(v18[2]) < 0)
LABEL_24:
        operator delete(v18[0]);
    }
    else
    {
      v12 = (char *)operator new(0x28uLL);
      strcpy(v12, "Invalid trace property key returned");
      *(_DWORD *)a2 = -534716416;
      if (*(char *)(a2 + 31) < 0)
        operator delete(*(void **)(a2 + 8));
      *(_QWORD *)(a2 + 8) = v12;
      *(_OWORD *)(a2 + 16) = xmmword_1BF332C60;
      if (SHIBYTE(v18[2]) < 0)
        goto LABEL_24;
    }
    v6 = v19;
    v7 = *(_QWORD *)(a1 + 32);
    LODWORD(__p) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0)
      goto LABEL_4;
LABEL_26:
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
    goto LABEL_27;
  }
  v7 = *(_QWORD *)(a1 + 32);
  LODWORD(__p) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
    goto LABEL_26;
LABEL_4:
  v21 = *(std::string *)(a2 + 8);
LABEL_27:
  (*(void (**)(uint64_t, void **, xpc_object_t))(v7 + 16))(v7, &__p, v6);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
  xpc_release(v19);
}

void sub_1BF314274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, void *__p, uint64_t a12, uint64_t a13, xpc_object_t object, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,int a21,__int16 a22,char a23,char a24)
{
  int v24;

  if (v24 < 0)
    operator delete(__p);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::object_proxy::operator=(_QWORD *a1, uint64_t a2, xpc_object_t xdict, char *key)
{
  xpc_object_t value;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;

  value = xpc_dictionary_get_value(xdict, key);
  v7 = value;
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    v7 = xpc_null_create();
    if (!v7)
    {
      v8 = xpc_null_create();
      v7 = 0;
      goto LABEL_5;
    }
  }
  xpc_retain(v7);
  v8 = v7;
LABEL_5:
  xpc_dictionary_set_value(**(xpc_object_t **)a2, *(const char **)(a2 + 8), v8);
  *a1 = v8;
  v9 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v7);
}

void abm::client::SetTraceProperty(xpc_object_t object@<X1>, uint64_t *a2@<X0>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v6;
  uint64_t v8;
  char *v9;
  xpc_object_t v10;
  char *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  xpc_object_t objecta;
  void *__p;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, int *);
  void *v25;
  void *aBlock;

  if (!*a2)
  {
    v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v9;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v6 = object;
  v8 = MEMORY[0x1E0C812F8];
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    v6 = xpc_null_create();
    if (!v6)
    {
      v10 = xpc_null_create();
      v6 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C3B88380](v6) == v8)
  {
    xpc_retain(v6);
    v10 = v6;
  }
  else
  {
    v10 = xpc_null_create();
  }
LABEL_10:
  xpc_release(v6);
  if (MEMORY[0x1C3B88380](v10) == v8)
  {
    v12 = xpc_BOOL_create(1);
    if (!v12)
      v12 = xpc_null_create();
    xpc_dictionary_set_value(v10, "kKeyTracePropertyWaitForCompletion", v12);
    v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (a3)
    {
      v14 = _Block_copy(a3);
      a3 = v14;
      v22 = MEMORY[0x1E0C809B0];
      v23 = 1174405120;
      v24 = ___ZN3abm6client16SetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
      v25 = &__block_descriptor_tmp_4;
      if (v14)
      {
        v15 = _Block_copy(v14);
        v16 = 0;
        goto LABEL_20;
      }
      v15 = 0;
    }
    else
    {
      v15 = 0;
      v22 = MEMORY[0x1E0C809B0];
      v23 = 1174405120;
      v24 = ___ZN3abm6client16SetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
      v25 = &__block_descriptor_tmp_4;
    }
    v16 = 1;
LABEL_20:
    aBlock = v15;
    v17 = *a2;
    objecta = v10;
    __p = operator new(0x20uLL);
    v21 = xmmword_1BF332C40;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    if (v10)
      xpc_retain(v10);
    else
      objecta = xpc_null_create();
    abm::client::Manager::perform(v17, (int)&__p, &v22, &objecta);
    xpc_release(objecta);
    objecta = 0;
    if (SHIBYTE(v21) < 0)
    {
      operator delete(__p);
      *(_DWORD *)a4 = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 8) = 0;
      v18 = aBlock;
      if (!aBlock)
        goto LABEL_28;
    }
    else
    {
      *(_DWORD *)a4 = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 8) = 0;
      v18 = aBlock;
      if (!aBlock)
      {
LABEL_28:
        if ((v16 & 1) == 0)
          _Block_release(a3);
        goto LABEL_30;
      }
    }
    _Block_release(v18);
    goto LABEL_28;
  }
  v11 = (char *)operator new(0x20uLL);
  strcpy(v11, "Invalid input dictionary passed");
  *(_DWORD *)a4 = -534716414;
  *(_QWORD *)(a4 + 8) = v11;
  *(_OWORD *)(a4 + 16) = xmmword_1BF332C30;
LABEL_30:
  xpc_release(v10);
}

void sub_1BF3146C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client16SetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF3147F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::CollectTelephonyLogs(uint64_t *a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  char *v10;
  const char *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  xpc_object_t object;
  char __p[23];
  char v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int *, uint64_t *);
  void *v27;
  void *aBlock;

  if (!*a1)
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v8) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v8);
      v9 = v8;
    }
    else
    {
      v9 = xpc_null_create();
    }
  }
  else
  {
    v9 = xpc_null_create();
    v8 = 0;
  }
  xpc_release(v8);
  if (*(char *)(a2 + 23) >= 0)
    v11 = (const char *)a2;
  else
    v11 = *(const char **)a2;
  v12 = xpc_string_create(v11);
  if (!v12)
    v12 = xpc_null_create();
  xpc_dictionary_set_value(v9, "kKeyTraceDumpStateReason", v12);
  v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  v14 = xpc_string_create("kCollectTelephonyLogs");
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (a3)
  {
    v16 = _Block_copy(a3);
    a3 = v16;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 1174405120;
    v26 = ___ZN3abm6client20CollectTelephonyLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v27 = &__block_descriptor_tmp_5;
    if (v16)
    {
      v17 = _Block_copy(v16);
      v18 = 0;
      goto LABEL_22;
    }
    v17 = 0;
  }
  else
  {
    v17 = 0;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 1174405120;
    v26 = ___ZN3abm6client20CollectTelephonyLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v27 = &__block_descriptor_tmp_5;
  }
  v18 = 1;
LABEL_22:
  aBlock = v17;
  v19 = *a1;
  strcpy(__p, "kCommandTraceDumpState");
  v23 = 22;
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v19, (int)__p, &v24, &object);
  xpc_release(object);
  object = 0;
  if ((v23 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v20 = aBlock;
    if (!aBlock)
      goto LABEL_30;
    goto LABEL_29;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v20 = aBlock;
  if (aBlock)
LABEL_29:
    _Block_release(v20);
LABEL_30:
  if ((v18 & 1) == 0)
    _Block_release(a3);
  xpc_release(v9);
}

void sub_1BF314B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client20CollectTelephonyLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF314C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::CollectTelephonyLogsWithCoredump(uint64_t *a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  const char *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  xpc_object_t object;
  char __p[21];
  char v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, int *, uint64_t *);
  void *v31;
  void *aBlock;

  if (!*a1)
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v8) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v8);
      v9 = v8;
    }
    else
    {
      v9 = xpc_null_create();
    }
  }
  else
  {
    v9 = xpc_null_create();
    v8 = 0;
  }
  xpc_release(v8);
  v11 = xpc_string_create("HardReset");
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v9, "KeyBasebandResetType", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  v13 = xpc_string_create("OtherErrors");
  if (!v13)
    v13 = xpc_null_create();
  xpc_dictionary_set_value(v9, "KeyBasebandResetSubType", v13);
  v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  v15 = xpc_string_create("kCollectTelephonyLogsWithCoredump");
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  if (*(char *)(a2 + 23) >= 0)
    v17 = (const char *)a2;
  else
    v17 = *(const char **)a2;
  v18 = xpc_string_create(v17);
  if (!v18)
    v18 = xpc_null_create();
  xpc_dictionary_set_value(v9, "KeyBasebandResetReason", v18);
  v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  if (a3)
  {
    v20 = _Block_copy(a3);
    a3 = v20;
    v28 = MEMORY[0x1E0C809B0];
    v29 = 1174405120;
    v30 = ___ZN3abm6client32CollectTelephonyLogsWithCoredumpENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v31 = &__block_descriptor_tmp_6;
    if (v20)
    {
      v21 = _Block_copy(v20);
      v22 = 0;
      goto LABEL_26;
    }
    v21 = 0;
  }
  else
  {
    v21 = 0;
    v28 = MEMORY[0x1E0C809B0];
    v29 = 1174405120;
    v30 = ___ZN3abm6client32CollectTelephonyLogsWithCoredumpENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v31 = &__block_descriptor_tmp_6;
  }
  v22 = 1;
LABEL_26:
  aBlock = v21;
  v23 = *a1;
  v27 = 20;
  strcpy(__p, "CommandResetBaseband");
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v23, (int)__p, &v28, &object);
  xpc_release(object);
  object = 0;
  if ((v27 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v24 = aBlock;
    if (!aBlock)
      goto LABEL_34;
    goto LABEL_33;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v24 = aBlock;
  if (aBlock)
LABEL_33:
    _Block_release(v24);
LABEL_34:
  if ((v22 & 1) == 0)
    _Block_release(a3);
  xpc_release(v9);
}

void sub_1BF315000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client32CollectTelephonyLogsWithCoredumpENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF315154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::CollectBasebandLogs(uint64_t *a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  char *v10;
  const char *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  xpc_object_t object;
  char __p[23];
  char v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int *, uint64_t *);
  void *v27;
  void *aBlock;

  if (!*a1)
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v8) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v8);
      v9 = v8;
    }
    else
    {
      v9 = xpc_null_create();
    }
  }
  else
  {
    v9 = xpc_null_create();
    v8 = 0;
  }
  xpc_release(v8);
  if (*(char *)(a2 + 23) >= 0)
    v11 = (const char *)a2;
  else
    v11 = *(const char **)a2;
  v12 = xpc_string_create(v11);
  if (!v12)
    v12 = xpc_null_create();
  xpc_dictionary_set_value(v9, "kKeyTraceDumpStateReason", v12);
  v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  v14 = xpc_string_create("kCollectBasebandLogs");
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (a3)
  {
    v16 = _Block_copy(a3);
    a3 = v16;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 1174405120;
    v26 = ___ZN3abm6client19CollectBasebandLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v27 = &__block_descriptor_tmp_7;
    if (v16)
    {
      v17 = _Block_copy(v16);
      v18 = 0;
      goto LABEL_22;
    }
    v17 = 0;
  }
  else
  {
    v17 = 0;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 1174405120;
    v26 = ___ZN3abm6client19CollectBasebandLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v27 = &__block_descriptor_tmp_7;
  }
  v18 = 1;
LABEL_22:
  aBlock = v17;
  v19 = *a1;
  strcpy(__p, "kCommandTraceDumpState");
  v23 = 22;
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v19, (int)__p, &v24, &object);
  xpc_release(object);
  object = 0;
  if ((v23 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v20 = aBlock;
    if (!aBlock)
      goto LABEL_30;
    goto LABEL_29;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v20 = aBlock;
  if (aBlock)
LABEL_29:
    _Block_release(v20);
LABEL_30:
  if ((v18 & 1) == 0)
    _Block_release(a3);
  xpc_release(v9);
}

void sub_1BF31547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client19CollectBasebandLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF3155A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::GetTraceModeWithOwnership(uint64_t **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  xpc_object_t v6;
  xpc_object_t v7;
  char *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  uint64_t *v17;
  int v18;
  char *v19;
  int v20;
  char *v21;
  xpc_object_t v22;
  xpc_object_t v23;
  uint64_t *v24;
  int v25;
  char v26;
  char *v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t object;
  void *__p;
  __int128 v33;
  uint64_t v34;
  const char *v35;
  char v36;
  xpc_object_t v37;

  if (!*a1)
  {
    v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  v37 = xpc_null_create();
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v6) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v9 = xpc_int64_create(5000);
  if (!v9)
    v9 = xpc_null_create();
  xpc_dictionary_set_value(v7, "Timeout", v9);
  v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  v11 = xpc_string_create("BasebandTrace");
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v7, "kKeyTraceName", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  v13 = xpc_BOOL_create(1);
  if (!v13)
    v13 = xpc_null_create();
  xpc_dictionary_set_value(v7, "kKeyTracePropertyWaitForCompletion", v13);
  v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  v15 = xpc_string_create("TraceOwnership");
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v7, "kKeyTracePropertyName", v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  v17 = *a1;
  object = v7;
  __p = operator new(0x20uLL);
  v33 = xmmword_1BF332C40;
  strcpy((char *)__p, "kCommandGetTraceProperty");
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v17, &object, &v37, &v34);
  v18 = v34;
  v19 = (char *)v35;
  v20 = v36;
  v36 = 0;
  LOBYTE(v35) = 0;
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v33) < 0)
  {
    operator delete(__p);
    if (v18)
    {
LABEL_22:
      v21 = (char *)operator new(0x28uLL);
      strcpy(v21, "Failed to get Baseband Trace ownership");
      *(_DWORD *)a3 = -534716414;
      *(_QWORD *)(a3 + 8) = v21;
      *(_OWORD *)(a3 + 16) = xmmword_1BF332C70;
      if ((v20 & 0x80) != 0)
        goto LABEL_35;
      goto LABEL_36;
    }
  }
  else if (v18)
  {
    goto LABEL_22;
  }
  v34 = a2;
  v35 = "TraceOwnership";
  xpc::dict::object_proxy::operator=(&v30, (uint64_t)&v34, v37, "kKeyTracePropertyValue");
  xpc_release(v30);
  v30 = 0;
  v22 = xpc_string_create("Mode");
  if (!v22)
    v22 = xpc_null_create();
  xpc_dictionary_set_value(v7, "kKeyTracePropertyName", v22);
  v23 = xpc_null_create();
  xpc_release(v22);
  xpc_release(v23);
  v24 = *a1;
  __p = operator new(0x20uLL);
  v33 = xmmword_1BF332C40;
  strcpy((char *)__p, "kCommandGetTraceProperty");
  v29 = v7;
  if (v7)
    xpc_retain(v7);
  else
    v29 = xpc_null_create();
  abm::client::Manager::perform(v24, &v29, &v37, &v34);
  v25 = v34;
  if (v20 < 0)
    operator delete(v19);
  v19 = (char *)v35;
  v26 = v36;
  v36 = 0;
  LOBYTE(v35) = 0;
  xpc_release(v29);
  v29 = 0;
  if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    if (v25)
      goto LABEL_34;
LABEL_39:
    v34 = a2;
    v35 = "Mode";
    xpc::dict::object_proxy::operator=(&v28, (uint64_t)&v34, v37, "kKeyTracePropertyValue");
    xpc_release(v28);
    v28 = 0;
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    if ((v26 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  operator delete(__p);
  if (!v25)
    goto LABEL_39;
LABEL_34:
  v27 = (char *)operator new(0x28uLL);
  strcpy(v27, "Failed to get Baseband Trace Mode");
  *(_DWORD *)a3 = -534716414;
  *(_QWORD *)(a3 + 8) = v27;
  *(_OWORD *)(a3 + 16) = xmmword_1BF332C80;
  if (v26 < 0)
LABEL_35:
    operator delete(v19);
LABEL_36:
  xpc_release(v7);
  xpc_release(v37);
}

void sub_1BF315A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, xpc_object_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;

  if (v24 < 0)
    operator delete(v23);
  xpc_release(v22);
  xpc_release(*(xpc_object_t *)(v25 - 88));
  _Unwind_Resume(a1);
}

void abm::client::SetTraceModeWithOwnership(uint64_t **a1@<X0>, int a2@<W1>, xpc_object_t *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t *v22;
  int v23;
  char *v24;
  int v25;
  char *v26;
  xpc_object_t v27;
  xpc_object_t v28;
  uint64_t *v29;
  int v30;
  char *v31;
  xpc_object_t v32;
  xpc_object_t v33;
  uint64_t *v34;
  int v35;
  char *v36;
  xpc_object_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  uint64_t *v41;
  int v42;
  char *v43;
  int v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t object;
  void *__p;
  __int128 v52;
  xpc_object_t *v53;
  const char *v54;
  char v55;
  xpc_object_t v56;
  void *v57[2];

  if (!*a1)
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v56 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v57[0] = xpc_null_create();
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = v8;
  if (v8)
  {
    v56 = v8;
  }
  else
  {
    v9 = xpc_null_create();
    v56 = v9;
    if (!v9)
    {
      v11 = xpc_null_create();
      v9 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C3B88380](v9) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v9);
    goto LABEL_11;
  }
  v11 = xpc_null_create();
LABEL_10:
  v56 = v11;
LABEL_11:
  xpc_release(v9);
  v12 = xpc_int64_create(5000);
  if (!v12)
    v12 = xpc_null_create();
  xpc_dictionary_set_value(v56, "Timeout", v12);
  v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  v14 = xpc_string_create("BasebandTrace");
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v56, "kKeyTraceName", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  v16 = xpc_BOOL_create(1);
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(v56, "kKeyTracePropertyWaitForCompletion", v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  v44 = a2;
  if (!a2)
  {
    LOBYTE(v23) = 0;
    v24 = 0;
    goto LABEL_30;
  }
  v18 = xpc_string_create("Enabled");
  if (!v18)
    v18 = xpc_null_create();
  xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v18);
  v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  v20 = xpc_string_create("false");
  if (!v20)
    v20 = xpc_null_create();
  xpc_dictionary_set_value(v56, "kKeyTracePropertyValue", v20);
  v21 = xpc_null_create();
  xpc_release(v20);
  xpc_release(v21);
  v22 = *a1;
  __p = operator new(0x20uLL);
  v52 = xmmword_1BF332C40;
  strcpy((char *)__p, "kCommandSetTraceProperty");
  object = v56;
  if (v56)
    xpc_retain(v56);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v22, &object, v57, &v53);
  v25 = (int)v53;
  v24 = (char *)v54;
  LOBYTE(v23) = v55;
  v55 = 0;
  LOBYTE(v54) = 0;
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v52) < 0)
  {
    operator delete(__p);
    if (v25)
      goto LABEL_28;
LABEL_30:
    v27 = xpc_string_create("TraceOwnership");
    if (!v27)
      v27 = xpc_null_create();
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v27);
    v28 = xpc_null_create();
    xpc_release(v27);
    xpc_release(v28);
    v53 = &v56;
    v54 = "kKeyTracePropertyValue";
    xpc::dict::object_proxy::operator=(&v49, (uint64_t)&v53, *a3, "TraceOwnership");
    xpc_release(v49);
    v49 = 0;
    v29 = *a1;
    __p = operator new(0x20uLL);
    v52 = xmmword_1BF332C40;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    v48 = v56;
    if (v56)
      xpc_retain(v56);
    else
      v48 = xpc_null_create();
    abm::client::Manager::perform(v29, &v48, v57, &v53);
    v30 = (int)v53;
    if ((v23 & 0x80) != 0)
      operator delete(v24);
    v24 = (char *)v54;
    v23 = v55;
    v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v48);
    v48 = 0;
    if (SHIBYTE(v52) < 0)
    {
      operator delete(__p);
      if (v30)
        goto LABEL_39;
    }
    else if (v30)
    {
LABEL_39:
      v31 = (char *)operator new(0x20uLL);
      strcpy(v31, "Failed to set trace ownership");
      *(_DWORD *)a4 = -534716414;
      *(_QWORD *)(a4 + 8) = v31;
      *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
      goto LABEL_67;
    }
    v32 = xpc_string_create("Mode");
    if (!v32)
      v32 = xpc_null_create();
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v32);
    v33 = xpc_null_create();
    xpc_release(v32);
    xpc_release(v33);
    v53 = &v56;
    v54 = "kKeyTracePropertyValue";
    xpc::dict::object_proxy::operator=(&v47, (uint64_t)&v53, *a3, "Mode");
    xpc_release(v47);
    v47 = 0;
    v34 = *a1;
    __p = operator new(0x20uLL);
    v52 = xmmword_1BF332C40;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    v46 = v56;
    if (v56)
      xpc_retain(v56);
    else
      v46 = xpc_null_create();
    abm::client::Manager::perform(v34, &v46, v57, &v53);
    v35 = (int)v53;
    if (v23 < 0)
      operator delete(v24);
    v24 = (char *)v54;
    v23 = v55;
    v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v46);
    v46 = 0;
    if (SHIBYTE(v52) < 0)
    {
      operator delete(__p);
      if (v35)
        goto LABEL_50;
    }
    else if (v35)
    {
LABEL_50:
      v36 = (char *)operator new(0x20uLL);
      strcpy(v36, "Failed to set trace mode");
      *(_DWORD *)a4 = -534716414;
      *(_QWORD *)(a4 + 8) = v36;
      *(_OWORD *)(a4 + 16) = xmmword_1BF332C40;
      goto LABEL_67;
    }
    if (!v44)
      goto LABEL_66;
    v37 = xpc_string_create("Enabled");
    if (!v37)
      v37 = xpc_null_create();
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v37);
    v38 = xpc_null_create();
    xpc_release(v37);
    xpc_release(v38);
    v39 = xpc_string_create("true");
    if (!v39)
      v39 = xpc_null_create();
    xpc_dictionary_set_value(v56, "kKeyTracePropertyValue", v39);
    v40 = xpc_null_create();
    xpc_release(v39);
    xpc_release(v40);
    v41 = *a1;
    __p = operator new(0x20uLL);
    v52 = xmmword_1BF332C40;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    v45 = v56;
    if (v56)
      xpc_retain(v56);
    else
      v45 = xpc_null_create();
    abm::client::Manager::perform(v41, &v45, v57, &v53);
    v42 = (int)v53;
    if (v23 < 0)
      operator delete(v24);
    v24 = (char *)v54;
    LOBYTE(v23) = v55;
    v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v45);
    v45 = 0;
    if (SHIBYTE(v52) < 0)
      operator delete(__p);
    if (v42)
    {
      v43 = (char *)operator new(0x28uLL);
      strcpy(v43, "Failed to set trace enabled to true");
      *(_DWORD *)a4 = -534716414;
      *(_QWORD *)(a4 + 8) = v43;
      *(_OWORD *)(a4 + 16) = xmmword_1BF332C60;
    }
    else
    {
LABEL_66:
      *(_DWORD *)a4 = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    goto LABEL_67;
  }
  if (!v25)
    goto LABEL_30;
LABEL_28:
  v26 = (char *)operator new(0x28uLL);
  strcpy(v26, "Failed to set trace enabled to false");
  *(_DWORD *)a4 = -534716414;
  *(_QWORD *)(a4 + 8) = v26;
  *(_OWORD *)(a4 + 16) = xmmword_1BF332C90;
LABEL_67:
  if ((v23 & 0x80) != 0)
    operator delete(v24);
  xpc_release(v56);
  xpc_release(v57[0]);
}

void sub_1BF3163AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object, xpc_object_t a16, uint64_t a17, xpc_object_t a18, uint64_t a19, xpc_object_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;
  char v27;
  uint64_t v28;

  if (v27 < 0)
    operator delete(v26);
  xpc_release(*(xpc_object_t *)(v28 - 104));
  xpc_release(*(xpc_object_t *)(v28 - 96));
  _Unwind_Resume(a1);
}

uint64_t abm::asString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch((int)result)
  {
    case -1:
      a2[23] = 13;
      strcpy(a2, "Uninitialized");
      break;
    case 0:
      a2[23] = 3;
      *(_DWORD *)a2 = 5067591;
      break;
    case 2:
      a2[23] = 5;
      strcpy(a2, "UTRAN");
      break;
    case 3:
      a2[23] = 6;
      strcpy(a2, "CDMA1x");
      break;
    case 4:
      a2[23] = 8;
      strcpy(a2, "CDMAEVDO");
      break;
    case 5:
      a2[23] = 10;
      strcpy(a2, "CDMAHybrid");
      break;
    case 7:
      a2[23] = 3;
      *(_DWORD *)a2 = 4543564;
      break;
    case 8:
      a2[23] = 5;
      strcpy(a2, "1xLTE");
      break;
    case 9:
      a2[23] = 7;
      strcpy(a2, "TDSCDMA");
      break;
    case 10:
      a2[23] = 2;
      strcpy(a2, "NR");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

{
  switch((int)result)
  {
    case 0:
      a2[23] = 5;
      *(_DWORD *)a2 = 1969382724;
      a2[4] = 103;
      a2[5] = 0;
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "Manager");
      break;
    case 2:
      a2[23] = 7;
      strcpy(a2, "Factory");
      break;
    case 3:
      a2[23] = 9;
      strcpy(a2, "Telephony");
      break;
    default:
      a2[23] = 11;
      strcpy(a2, "Unsupported");
      break;
  }
  return result;
}

{
  switch((int)result)
  {
    case 0:
      a2[23] = 2;
      strcpy(a2, "UI");
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "ABMtool");
      break;
    case 2:
      a2[23] = 7;
      strcpy(a2, "Profile");
      break;
    case 3:
      a2[23] = 10;
      strcpy(a2, "24hr_Timer");
      break;
    default:
      a2[23] = 11;
      strcpy(a2, "UnSpecified");
      break;
  }
  return result;
}

void abm::client::GetBasebandBootState(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  xpc_object_t v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  xpc_object_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  xpc_object_t v17;
  xpc_object_t value;
  xpc_object_t object;
  void *__p[2];
  uint64_t *v21;
  std::__shared_weak_count *v22;
  xpc_object_t v23;

  v6 = xpc_null_create();
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *a3 = v7;
  a3[1] = v7;
  v8 = *(std::__shared_weak_count **)(a1 + 8);
  v21 = *(uint64_t **)a1;
  v22 = v8;
  v23 = v6;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  __p[0] = operator new(0x20uLL);
  __p[1] = (void *)27;
  strcpy((char *)__p[0], "CommandGetBasebandBootState");
  v11 = xpc_null_create();
  abm::client::PerformCommand(&v21, v11, &v23, (uint64_t)a3);
  operator delete(__p[0]);
  v12 = v22;
  if (!v22)
    goto LABEL_10;
  v13 = (unint64_t *)&v22->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    v15 = v23;
    v16 = MEMORY[0x1E0C812F8];
    if (v23)
      goto LABEL_14;
  }
  else
  {
LABEL_10:
    v15 = v23;
    v16 = MEMORY[0x1E0C812F8];
    if (v23)
      goto LABEL_14;
  }
  v15 = xpc_null_create();
  if (!v15)
  {
    v17 = xpc_null_create();
    v15 = 0;
    goto LABEL_17;
  }
LABEL_14:
  if (MEMORY[0x1C3B88380](v15) == v16)
  {
    xpc_retain(v15);
    v17 = v15;
  }
  else
  {
    v17 = xpc_null_create();
  }
LABEL_17:
  xpc_release(v15);
  if (!*(_DWORD *)a3 && MEMORY[0x1C3B88380](v17) == v16)
  {
    value = xpc_dictionary_get_value(v17, "KeyBasebandBootState");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    xpc::dyn_cast_or_default();
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
    *(_OWORD *)a2 = *(_OWORD *)__p;
    *(_QWORD *)(a2 + 16) = 0x8000000000000020;
    xpc_release(object);
  }
  xpc_release(v17);
}

void sub_1BF316920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  void *v11;

  xpc_release(object);
  xpc_release(v11);
  if (*(char *)(v10 + 31) < 0)
    operator delete(*(void **)(v10 + 8));
  _Unwind_Resume(a1);
}

void sub_1BF316970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF316988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0)
    operator delete(__p);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void abm::client::GetBasebandOperatingMode(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  void *v5;
  const void *v6;
  void *v7;
  char v8;
  char *v9;
  uint64_t v10;
  void *v11;
  xpc_object_t object;
  void *__p;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, xpc_object_t *);
  void *v18;
  void *aBlocka;

  if (!*a2)
  {
    v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v9;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  if (aBlock)
  {
    v5 = _Block_copy(aBlock);
    v6 = v5;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client24GetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_1;
    if (v5)
    {
      v7 = _Block_copy(v5);
      v8 = 0;
      goto LABEL_9;
    }
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client24GetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_1;
  }
  v8 = 1;
LABEL_9:
  aBlocka = v7;
  v10 = *a2;
  __p = operator new(0x20uLL);
  v14 = xmmword_1BF332C30;
  strcpy((char *)__p, "CommandGetBasebandOperatingMode");
  object = xpc_null_create();
  abm::client::Manager::perform(v10, (int)&__p, &v15, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v14) < 0)
  {
    operator delete(__p);
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v11 = aBlocka;
    if (!aBlocka)
      goto LABEL_14;
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v11 = aBlocka;
  if (aBlocka)
LABEL_13:
    _Block_release(v11);
LABEL_14:
  if ((v8 & 1) == 0)
    _Block_release(v6);
}

void sub_1BF316B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  const void *v21;
  char v22;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v22 & 1) == 0)
    _Block_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24GetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t value;
  int v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t object;
  std::string __p;

  if (!*(_QWORD *)(a1 + 32))
    return;
  v6 = xpc_null_create();
  v7 = v6;
  if (!*(_DWORD *)a2)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C3B88380](v10) == MEMORY[0x1E0C812F8])
      {
        xpc_retain(v10);
        v8 = v10;
      }
      else
      {
        v8 = xpc_null_create();
      }
    }
    else
    {
      v8 = xpc_null_create();
      v10 = 0;
    }
    xpc_release(v10);
    v11 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v11);
    value = xpc_dictionary_get_value(*a3, "KeyBasebandOperatingMode");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    v13 = xpc::dyn_cast_or_default();
    xpc_release(object);
    v14 = xpc_int64_create(v13);
    if (!v14)
      v14 = xpc_null_create();
    xpc_dictionary_set_value(v8, "KeyBasebandOperatingMode", v14);
    v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    v9 = *(_QWORD *)(a1 + 32);
    LODWORD(object) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0)
      goto LABEL_4;
LABEL_17:
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
    goto LABEL_18;
  }
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  LODWORD(object) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
    goto LABEL_17;
LABEL_4:
  __p = *(std::string *)(a2 + 8);
LABEL_18:
  (*(void (**)(uint64_t, xpc_object_t *, xpc_object_t))(v9 + 16))(v9, &object, v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  xpc_release(v8);
}

void sub_1BF316DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  xpc_release(v15);
  _Unwind_Resume(a1);
}

void abm::client::SetBasebandOperatingMode(uint64_t *a1@<X0>, int a2@<W1>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  xpc_object_t object;
  void *__p;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, int *);
  void *v24;
  void *aBlock;

  if (!*a1)
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
    return;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v8) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v8);
      v9 = v8;
    }
    else
    {
      v9 = xpc_null_create();
    }
  }
  else
  {
    v9 = xpc_null_create();
    v8 = 0;
  }
  xpc_release(v8);
  v11 = xpc_int64_create(a2);
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v9, "KeyBasebandOperatingMode", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  if (a3)
  {
    v13 = _Block_copy(a3);
    a3 = v13;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 1174405120;
    v23 = ___ZN3abm6client24SetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEiU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v24 = &__block_descriptor_tmp_137;
    if (v13)
    {
      v14 = _Block_copy(v13);
      v15 = 0;
      goto LABEL_17;
    }
    v14 = 0;
  }
  else
  {
    v14 = 0;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 1174405120;
    v23 = ___ZN3abm6client24SetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEiU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v24 = &__block_descriptor_tmp_137;
  }
  v15 = 1;
LABEL_17:
  aBlock = v14;
  v16 = *a1;
  object = v9;
  __p = operator new(0x20uLL);
  v20 = xmmword_1BF332C30;
  strcpy((char *)__p, "CommandSetBasebandOperatingMode");
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v16, (int)&__p, &v21, &object);
  xpc_release(object);
  object = 0;
  if ((SHIBYTE(v20) & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v17 = aBlock;
    if (!aBlock)
      goto LABEL_25;
    goto LABEL_24;
  }
  operator delete(__p);
  *(_DWORD *)a4 = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v17 = aBlock;
  if (aBlock)
LABEL_24:
    _Block_release(v17);
LABEL_25:
  if ((v15 & 1) == 0)
    _Block_release(a3);
  xpc_release(v9);
}

void sub_1BF31712C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24SetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEiU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF31724C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::GetBasebandWakeReason(uint64_t a1@<X0>, _QWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  xpc_object_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  char *__p;
  uint64_t *v14;
  std::__shared_weak_count *v15;

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *a3 = v5;
  a3[1] = v5;
  v6 = *(std::__shared_weak_count **)(a1 + 8);
  v14 = *(uint64_t **)a1;
  v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  __p = (char *)operator new(0x20uLL);
  strcpy(__p, "CommandGetBasebandWakeReason");
  v9 = xpc_null_create();
  abm::client::PerformCommand(&v14, v9, a2, (uint64_t)a3);
  operator delete(__p);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_1BF317360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF317374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void abm::client::GetBasebandLTEStatistics(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  void *v5;
  const void *v6;
  void *v7;
  char v8;
  char *v9;
  uint64_t v10;
  void *v11;
  xpc_object_t object;
  void *__p;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int *, uint64_t *);
  void *v18;
  void *aBlocka;

  if (!*a2)
  {
    v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v9;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  if (aBlock)
  {
    v5 = _Block_copy(aBlock);
    v6 = v5;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client24GetBasebandLTEStatisticsENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_139;
    if (v5)
    {
      v7 = _Block_copy(v5);
      v8 = 0;
      goto LABEL_9;
    }
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 1174405120;
    v17 = ___ZN3abm6client24GetBasebandLTEStatisticsENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v18 = &__block_descriptor_tmp_139;
  }
  v8 = 1;
LABEL_9:
  aBlocka = v7;
  v10 = *a2;
  __p = operator new(0x20uLL);
  v14 = xmmword_1BF332C30;
  strcpy((char *)__p, "CommandGetBasebandLTEStatistics");
  object = xpc_null_create();
  abm::client::Manager::perform(v10, (int)&__p, &v15, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v14) < 0)
  {
    operator delete(__p);
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v11 = aBlocka;
    if (!aBlocka)
      goto LABEL_14;
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v11 = aBlocka;
  if (aBlocka)
LABEL_13:
    _Block_release(v11);
LABEL_14:
  if ((v8 & 1) == 0)
    _Block_release(v6);
}

void sub_1BF317588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  const void *v21;
  char v22;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v22 & 1) == 0)
    _Block_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24GetBasebandLTEStatisticsENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  std::string __p;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF317680(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::ResetBaseband(uint64_t *a1@<X0>, const char *a2@<X1>, const char *a3@<X2>, const void *a4@<X3>, uint64_t a5@<X8>)
{
  const char *v8;
  xpc_object_t v10;
  xpc_object_t v11;
  char *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  xpc_object_t object;
  char __p[21];
  char v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, int *);
  void *v30;
  void *aBlock;

  if (!*a1)
    goto LABEL_9;
  v8 = a2;
  if (a2[23] < 0)
  {
    if (*((_QWORD *)a2 + 1))
      goto LABEL_4;
LABEL_9:
    v12 = (char *)operator new(0x20uLL);
    strcpy(v12, "Invalid manager object passed");
    *(_DWORD *)a5 = -534716414;
    *(_QWORD *)(a5 + 8) = v12;
    *(_OWORD *)(a5 + 16) = xmmword_1BF332C50;
    return;
  }
  if (!a2[23])
    goto LABEL_9;
LABEL_4:
  v10 = xpc_dictionary_create(0, 0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v10) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v10);
      v11 = v10;
    }
    else
    {
      v11 = xpc_null_create();
    }
  }
  else
  {
    v11 = xpc_null_create();
    v10 = 0;
  }
  xpc_release(v10);
  if (v8[23] < 0)
    v8 = *(const char **)v8;
  v13 = xpc_string_create(v8);
  if (!v13)
    v13 = xpc_null_create();
  xpc_dictionary_set_value(v11, "KeyBasebandResetType", v13);
  v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  v15 = xpc_string_create("OtherErrors");
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v11, "KeyBasebandResetSubType", v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  if (a3[23] < 0)
    a3 = *(const char **)a3;
  v17 = xpc_string_create(a3);
  if (!v17)
    v17 = xpc_null_create();
  xpc_dictionary_set_value(v11, "KeyBasebandResetReason", v17);
  v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  if (a4)
  {
    v19 = _Block_copy(a4);
    a4 = v19;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 1174405120;
    v29 = ___ZN3abm6client13ResetBasebandENSt3__110shared_ptrINS0_7ManagerEEENS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEESA_U13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v30 = &__block_descriptor_tmp_140;
    if (v19)
    {
      v20 = _Block_copy(v19);
      v21 = 0;
      goto LABEL_28;
    }
    v20 = 0;
  }
  else
  {
    v20 = 0;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 1174405120;
    v29 = ___ZN3abm6client13ResetBasebandENSt3__110shared_ptrINS0_7ManagerEEENS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEESA_U13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v30 = &__block_descriptor_tmp_140;
  }
  v21 = 1;
LABEL_28:
  aBlock = v20;
  v22 = *a1;
  v26 = 20;
  strcpy(__p, "CommandResetBaseband");
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v22, (int)__p, &v27, &object);
  xpc_release(object);
  object = 0;
  if ((v26 & 0x80000000) == 0)
  {
    *(_DWORD *)a5 = 0;
    *(_QWORD *)(a5 + 16) = 0;
    *(_QWORD *)(a5 + 24) = 0;
    *(_QWORD *)(a5 + 8) = 0;
    v23 = aBlock;
    if (!aBlock)
      goto LABEL_36;
    goto LABEL_35;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a5 = 0;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 8) = 0;
  v23 = aBlock;
  if (aBlock)
LABEL_35:
    _Block_release(v23);
LABEL_36:
  if ((v21 & 1) == 0)
    _Block_release(a4);
  xpc_release(v11);
}

void sub_1BF317A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client13ResetBasebandENSt3__110shared_ptrINS0_7ManagerEEENS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEESA_U13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF317B50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::SyncBasebandFilesystem(uint64_t *a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  xpc_object_t v6;
  xpc_object_t v7;
  char *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  xpc_object_t object;
  char __p[22];
  char v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int *);
  void *v22;
  void *aBlock;

  if (!*a1)
  {
    v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v6) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v9 = xpc_BOOL_create(1);
  if (!v9)
    v9 = xpc_null_create();
  xpc_dictionary_set_value(v7, "KeyFSSyncWaitForCompletion", v9);
  v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2)
  {
    v11 = _Block_copy(a2);
    a2 = v11;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client22SyncBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_141;
    if (v11)
    {
      v12 = _Block_copy(v11);
      v13 = 0;
      goto LABEL_17;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client22SyncBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_141;
  }
  v13 = 1;
LABEL_17:
  aBlock = v12;
  v14 = *a1;
  v18 = 21;
  strcpy(__p, "CommandBasebandSyncFS");
  object = v7;
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v14, (int)__p, &v19, &object);
  xpc_release(object);
  object = 0;
  if ((v18 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v15 = aBlock;
    if (!aBlock)
      goto LABEL_25;
    goto LABEL_24;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v15 = aBlock;
  if (aBlock)
LABEL_24:
    _Block_release(v15);
LABEL_25:
  if ((v13 & 1) == 0)
    _Block_release(a2);
  xpc_release(v7);
}

void sub_1BF317E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client22SyncBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF317F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::EraseBasebandFilesystem(uint64_t *a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  xpc_object_t v6;
  xpc_object_t v7;
  char *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  xpc_object_t object;
  char __p[22];
  char v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int *);
  void *v22;
  void *aBlock;

  if (!*a1)
  {
    v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v6) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v9 = xpc_string_create("BasebandNVDataErase");
  if (!v9)
    v9 = xpc_null_create();
  xpc_dictionary_set_value(v7, "KeyBasebandNVDataAction", v9);
  v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2)
  {
    v11 = _Block_copy(a2);
    a2 = v11;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client23EraseBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_142;
    if (v11)
    {
      v12 = _Block_copy(v11);
      v13 = 0;
      goto LABEL_17;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client23EraseBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_142;
  }
  v13 = 1;
LABEL_17:
  aBlock = v12;
  v14 = *a1;
  v18 = 21;
  strcpy(__p, "CommandBasebandNVData");
  object = v7;
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v14, (int)__p, &v19, &object);
  xpc_release(object);
  object = 0;
  if ((v18 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v15 = aBlock;
    if (!aBlock)
      goto LABEL_25;
    goto LABEL_24;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v15 = aBlock;
  if (aBlock)
LABEL_24:
    _Block_release(v15);
LABEL_25:
  if ((v13 & 1) == 0)
    _Block_release(a2);
  xpc_release(v7);
}

void sub_1BF318208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client23EraseBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF31831C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void abm::client::RestoreBasebandFilesystemToCarrierDefault(uint64_t *a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  xpc_object_t v6;
  xpc_object_t v7;
  char *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  xpc_object_t object;
  char __p[22];
  char v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int *);
  void *v22;
  void *aBlock;

  if (!*a1)
  {
    v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(_QWORD *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1BF332C50;
    return;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v6) == MEMORY[0x1E0C812F8])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v9 = xpc_string_create("BasebandNVDataRestoreCarrierDefaults");
  if (!v9)
    v9 = xpc_null_create();
  xpc_dictionary_set_value(v7, "KeyBasebandNVDataAction", v9);
  v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2)
  {
    v11 = _Block_copy(a2);
    a2 = v11;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client41RestoreBasebandFilesystemToCarrierDefaultENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_143;
    if (v11)
    {
      v12 = _Block_copy(v11);
      v13 = 0;
      goto LABEL_17;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1174405120;
    v21 = ___ZN3abm6client41RestoreBasebandFilesystemToCarrierDefaultENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
    v22 = &__block_descriptor_tmp_143;
  }
  v13 = 1;
LABEL_17:
  aBlock = v12;
  v14 = *a1;
  v18 = 21;
  strcpy(__p, "CommandBasebandNVData");
  object = v7;
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  abm::client::Manager::perform(v14, (int)__p, &v19, &object);
  xpc_release(object);
  object = 0;
  if ((v18 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v15 = aBlock;
    if (!aBlock)
      goto LABEL_25;
    goto LABEL_24;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v15 = aBlock;
  if (aBlock)
LABEL_24:
    _Block_release(v15);
LABEL_25:
  if ((v13 & 1) == 0)
    _Block_release(a2);
  xpc_release(v7);
}

void sub_1BF3185F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  void *v21;
  const void *v22;
  char v23;

  xpc_release(object);
  if (a16 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if ((v23 & 1) == 0)
    _Block_release(v22);
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client41RestoreBasebandFilesystemToCarrierDefaultENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  std::string __p;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *a2;
    if (*((char *)a2 + 31) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
    else
      __p = *(std::string *)(a2 + 2);
    (*(void (**)(uint64_t, int *, _QWORD))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1BF318704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t abm::AccessorySimulate::create(xpc_object_t *a1)
{
  xpc_object_t value;
  int v4;
  xpc_object_t object;

  if (MEMORY[0x1C3B88380](*a1) != MEMORY[0x1E0C812F8] || !xpc_dictionary_get_value(*a1, "kAccessorySimulateEnabled"))
    return 170;
  value = xpc_dictionary_get_value(*a1, "kAccessorySimulateEnabled");
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  return v4 | 0x100u;
}

void sub_1BF3187D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::AccessorySimulate::create(abm::AccessorySimulate *this)
{
  return this | 0x100;
}

void abm::AccessorySimulate::toDict(abm::AccessorySimulate *this@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_BOOL_create(*(_BYTE *)this);
  if (!v7)
    v7 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kAccessorySimulateEnabled", v7);
  v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
}

const char *abm::AccessorySimulate::asString(abm::AccessorySimulate *this)
{
  if (*(_BYTE *)this)
    return "enabled";
  else
    return "disabled";
}

const char *abm::asString(int a1)
{
  const char *result;

  result = "Generic";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "Lightning to Headphone Jack Adapter";
      break;
    case 2:
      result = "EarPods with Lightening";
      break;
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
LABEL_7:
      result = "???";
      break;
    case 4:
      result = "Lightning Cable";
      break;
    case 5:
      result = "Charging Dock";
      break;
    case 12:
      result = "SmartKeyboard";
      break;
    case 13:
      result = "DisplayCover";
      break;
    case 14:
      result = "Pencil";
      break;
    case 15:
      result = "MagSafeCharger";
      break;
    case 16:
      result = "MagSafeBatteryPack";
      break;
    case 17:
      result = "USB3";
      break;
    case 18:
      result = "DisplayPort";
      break;
    case 19:
      result = "USB-C to Headphone Jack Adapter";
      break;
    case 20:
      result = "EarPods with USB-C";
      break;
    default:
      switch(a1)
      {
        case 2048:
          result = "AppleMagSafeSiliconCase";
          break;
        case 2049:
          result = "AppleMagSafeLeatherCase";
          break;
        case 2050:
          result = "AppleMagSafeClearCase";
          break;
        case 2051:
          result = "AppleMagSafeSleeve";
          break;
        case 2052:
          result = "AppleMagSafeWallet";
          break;
        case 2053:
          result = "AppleMagSafeBatteryPack";
          break;
        case 2054:
          result = "AppleMagSafeChargingMat";
          break;
        case 2055:
          result = "AppleMagSafeChargingCable";
          break;
        case 2056:
          result = "AppleMagSafeRuggedCase";
          break;
        case 2057:
          result = "AppleMagSafeTextileCase";
          break;
        default:
          if (a1 != 0xFFFF)
            goto LABEL_7;
          result = "Unknown";
          break;
      }
      break;
  }
  return result;
}

{
  if ((a1 - 1) > 2)
    return "Unknown";
  else
    return off_1E78F5FF0[a1 - 1];
}

{
  if ((a1 - 1) > 2)
    return "Unknown";
  else
    return off_1E78F6008[a1 - 1];
}

const char *abm::asString(__int16 a1)
{
  if ((unsigned __int16)(a1 + 1) > 5u)
    return "???";
  else
    return off_1E78F5BF0[(__int16)(a1 + 1)];
}

{
  if ((unsigned __int16)(a1 + 1) > 4u)
    return "???";
  else
    return off_1E78F5C20[(__int16)(a1 + 1)];
}

{
  if ((unsigned __int16)(a1 + 1) > 4u)
    return "???";
  else
    return off_1E78F5C48[(__int16)(a1 + 1)];
}

{
  if ((unsigned __int16)(a1 + 1) > 5u)
    return "???";
  else
    return off_1E78F5C70[(__int16)(a1 + 1)];
}

{
  if ((unsigned __int16)(a1 + 1) > 5u)
    return "NotApplicable";
  else
    return off_1E78F5CA0[(__int16)(a1 + 1)];
}

unint64_t abm::AccessoryInfo::create(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;
  _BYTE *v7;
  char v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char v19;
  int v20;
  unsigned __int8 v21;
  void *v22;
  size_t v23;
  size_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  int v31;
  size_t v32;
  void *v33;
  _BYTE *v34;
  unint64_t v35;
  void **v36;
  unint64_t v37;
  size_t v38;
  char *v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void **v49;
  int v50;
  void **v51;
  void **v52;
  __int16 v53;
  void **v54;
  __int16 v55;
  void **v56;
  uint64_t v57;
  void **v58;
  __int16 v59;
  unsigned int v60;
  unsigned __int16 v62;
  unsigned __int16 v63;
  uint64_t v64;
  unsigned __int16 v65;
  int v66;
  char *v67;
  void *__p[3];
  void *__dst[3];
  void *v70;
  size_t v71;
  int64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[48];
  _QWORD v79[2];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  unint64_t v88;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v87 = v2;
  v86 = v2;
  v85 = v2;
  v84 = v2;
  v83 = v2;
  v82 = v2;
  v81 = v2;
  v80 = v2;
  v79[1] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v78[32] = v2;
  *(_OWORD *)&v78[16] = v2;
  *(_OWORD *)v78 = v2;
  v77 = v2;
  v75 = v2;
  v76 = v2;
  v74 = v2;
  v3 = MEMORY[0x1E0DE4FD8];
  v4 = MEMORY[0x1E0DE4FD8] + 64;
  v88 = 0xAAAAAAAAAAAAAAAALL;
  v79[0] = MEMORY[0x1E0DE4FD8] + 64;
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 16);
  v73 = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 8);
  *(uint64_t *)((char *)&v73 + *(_QWORD *)(v73 - 24)) = v5;
  *(_QWORD *)&v74 = 0;
  v6 = (std::ios_base *)((char *)&v73 + *(_QWORD *)(v73 - 24));
  std::ios_base::init(v6, (char *)&v74 + 8);
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  v73 = v3 + 24;
  v79[0] = v4;
  std::streambuf::basic_streambuf();
  *((_QWORD *)&v74 + 1) = MEMORY[0x1E0DE4FB8] + 16;
  v7 = &v78[8];
  memset(&v78[8], 0, 32);
  v8 = 8;
  *(_DWORD *)&v78[40] = 8;
  if (&v78[8] != (_BYTE *)a1)
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__assign_no_alias<true>(&v78[8], *(void **)a1, *(_QWORD *)(a1 + 8));
      v8 = v78[40];
    }
    else
    {
      *(_OWORD *)&v78[8] = *(_OWORD *)a1;
      *(_QWORD *)&v78[24] = *(_QWORD *)(a1 + 16);
    }
  }
  *(_QWORD *)&v78[32] = 0;
  v9 = v78[31];
  if (v78[31] >= 0)
    v10 = &v78[8];
  else
    v10 = *(_BYTE **)&v78[8];
  if (v78[31] >= 0)
    v11 = v78[31];
  else
    v11 = *(_QWORD *)&v78[16];
  if ((v8 & 8) != 0)
  {
    *((_QWORD *)&v75 + 1) = v10;
    *(_QWORD *)&v76 = v10;
    *(_QWORD *)&v78[32] = &v10[v11];
    *((_QWORD *)&v76 + 1) = &v10[v11];
  }
  if ((v8 & 0x10) != 0)
  {
    *(_QWORD *)&v78[32] = &v10[v11];
    if ((v78[31] & 0x80) != 0)
    {
      v12 = (*(_QWORD *)&v78[24] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (*(_QWORD *)&v78[16] >= v12)
      {
        *(_QWORD *)&v78[16] = (*(_QWORD *)&v78[24] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        v7 = *(_BYTE **)&v78[8];
        goto LABEL_21;
      }
      v9 = *(_QWORD *)&v78[16];
    }
    else
    {
      v12 = 22;
      if (v78[31] > 0x15u)
      {
        v78[31] = 22;
LABEL_21:
        v7[v12] = 0;
        goto LABEL_22;
      }
    }
    std::string::append((std::string *)&v78[8], v12 - v9, 0);
LABEL_22:
    v13 = v78[31];
    if (v78[31] < 0)
      v13 = *(_QWORD *)&v78[16];
    *(_QWORD *)&v77 = v10;
    *((_QWORD *)&v77 + 1) = v10;
    *(_QWORD *)v78 = &v10[v13];
    if ((v78[40] & 3) != 0)
    {
      if (v11 >> 31)
      {
        v14 = ((v11 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v15 = 0x7FFFFFFF * ((v14 + ((v11 - 0x80000000 - v14) >> 1)) >> 30);
        v10 += v15 + 0x7FFFFFFF;
        v11 = v11 - v15 - 0x7FFFFFFF;
        *((_QWORD *)&v77 + 1) = v10;
      }
      if (v11)
        *((_QWORD *)&v77 + 1) = &v10[v11];
    }
  }
  v62 = 0;
  v63 = 0;
  v66 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v67 = (char *)&v75 + 8;
  v64 = 0;
  v65 = -1;
  while (2)
  {
    LOBYTE(__dst[0]) = -86;
    MEMORY[0x1C3B87F9C](__dst, &v73, 1);
    if (!LOBYTE(__dst[0]))
      goto LABEL_68;
    if (SHIBYTE(v72) < 0)
    {
      *(_BYTE *)v70 = 0;
      v71 = 0;
    }
    else
    {
      LOBYTE(v70) = 0;
      HIBYTE(v72) = 0;
    }
    v16 = 0;
    while (1)
    {
      v17 = *(_QWORD **)((char *)&v76 + *(_QWORD *)(v73 - 24));
      v18 = (char *)v17[3];
      if (v18 == (char *)v17[4])
        break;
      v17[3] = v18 + 1;
      v19 = *v18;
LABEL_38:
      if (v19 == 44)
      {
        v31 = 0;
        goto LABEL_67;
      }
      v21 = HIBYTE(v72);
      if (SHIBYTE(v72) < 0)
      {
        v23 = (v72 & 0x7FFFFFFFFFFFFFFFLL) - 1;
        if (v71 == v23)
        {
          if ((v72 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
            std::string::__throw_length_error[abi:ne180100]();
          v22 = v70;
          v24 = 0x7FFFFFFFFFFFFFF7;
          if (v23 <= 0x3FFFFFFFFFFFFFF2)
          {
LABEL_45:
            if (v23 + 1 > 2 * v23)
              v25 = v23 + 1;
            else
              v25 = 2 * v23;
            v26 = (v25 & 0x7FFFFFFFFFFFFFF8) + 8;
            if ((v25 | 7) != 0x17)
              v26 = v25 | 7;
            if (v25 >= 0x17)
              v24 = v26 + 1;
            else
              v24 = 23;
          }
          v27 = (char *)operator new(v24);
          v28 = v27;
          if (!v23 || (memmove(v27, v22, v23), v23 != 22))
            operator delete(v22);
          v70 = v28;
          v72 = v24 | 0x8000000000000000;
          goto LABEL_60;
        }
        v28 = (char *)v70;
        v23 = v71;
LABEL_60:
        v71 = v23 + 1;
        v30 = &v28[v23];
        *v30 = v19;
        v30[1] = 0;
        --v16;
        if (SHIBYTE(v72) < 0)
          goto LABEL_61;
      }
      else
      {
        if (HIBYTE(v72) == 22)
        {
          v22 = &v70;
          v23 = 22;
          goto LABEL_45;
        }
        HIBYTE(v72) = (HIBYTE(v72) + 1) & 0x7F;
        v29 = (char *)&v70 + v21;
        *v29 = v19;
        v29[1] = 0;
        --v16;
        if (SHIBYTE(v72) < 0)
        {
LABEL_61:
          if (v71 == 0x7FFFFFFFFFFFFFF7)
          {
            v31 = 4;
            goto LABEL_67;
          }
        }
      }
    }
    v20 = (*(uint64_t (**)(_QWORD *))(*v17 + 80))(v17);
    v19 = v20;
    if (v20 != -1)
      goto LABEL_38;
    if (v16)
      v31 = 2;
    else
      v31 = 6;
LABEL_67:
    std::ios_base::clear((std::ios_base *)((char *)&v73 + *(_QWORD *)(v73 - 24)), *(_DWORD *)((char *)&v75 + *(_QWORD *)(v73 - 24) + 8) | v31);
LABEL_68:
    if ((v67[*(_QWORD *)(v73 - 24)] & 5) == 0)
    {
      if (v72 >= 0)
        v32 = HIBYTE(v72);
      else
        v32 = v71;
      if (v72 >= 0)
        v33 = &v70;
      else
        v33 = v70;
      if (v32)
      {
        v34 = memchr(v33, 58, v32);
        if (v34)
          v35 = v34 - (_BYTE *)v33;
        else
          v35 = -1;
        __dst[1] = (void *)0xAAAAAAAAAAAAAAAALL;
        __dst[2] = (void *)0xAAAAAAAAAAAAAAAALL;
        if (v32 >= v35)
          v32 = v35;
        __dst[0] = (void *)0xAAAAAAAAAAAAAAAALL;
        if (v32 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
      }
      else
      {
        v35 = -1;
        memset(__dst, 170, sizeof(__dst));
      }
      if (v32 >= 0x17)
      {
        v41 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v32 | 7) != 0x17)
          v41 = v32 | 7;
        v42 = v41 + 1;
        v36 = (void **)operator new(v41 + 1);
        __dst[1] = (void *)v32;
        __dst[2] = (void *)(v42 | 0x8000000000000000);
        __dst[0] = v36;
      }
      else
      {
        HIBYTE(__dst[2]) = v32;
        v36 = __dst;
        if (!v32)
        {
          LOBYTE(__dst[0]) = 0;
          v37 = v35 + 1;
          memset(__p, 170, sizeof(__p));
          LOBYTE(v38) = HIBYTE(v72);
          if ((SHIBYTE(v72) & 0x80000000) == 0)
            goto LABEL_87;
LABEL_94:
          v38 = v71;
          if (v71 >= v37)
          {
            v39 = (char *)v70;
            v40 = v71 - v37;
            if (v71 - v37 <= 0x7FFFFFFFFFFFFFF7)
            {
LABEL_96:
              if (v40 >= 0x17)
              {
                v46 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v40 | 7) != 0x17)
                  v46 = v40 | 7;
                v47 = v46 + 1;
                v43 = operator new(v46 + 1);
                __p[1] = (void *)v40;
                __p[2] = (void *)(v47 | 0x8000000000000000);
                __p[0] = v43;
              }
              else
              {
                HIBYTE(__p[2]) = v40;
                v43 = __p;
                if (v38 == v37)
                {
                  *((_BYTE *)__p + v40) = 0;
                  v44 = SHIBYTE(__dst[2]);
                  if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                    goto LABEL_99;
LABEL_106:
                  if (__dst[1])
                  {
                    v45 = *(char *)__dst[0] - 99;
                    goto LABEL_108;
                  }
                  goto LABEL_249;
                }
              }
              memmove(v43, &v39[v37], v40);
              *((_BYTE *)v43 + v40) = 0;
              v44 = SHIBYTE(__dst[2]);
              if (SHIBYTE(__dst[2]) < 0)
                goto LABEL_106;
LABEL_99:
              if (v44)
              {
                v45 = SLOBYTE(__dst[0]) - 99;
                if (v45 <= 0x10)
                {
LABEL_108:
                  switch(v45)
                  {
                    case 0u:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v49 = __p;
                      else
                        v49 = (void **)__p[0];
                      if (!strcasecmp("NotApplicable", (const char *)v49))
                      {
                        v50 = 0;
                      }
                      else if (!strcasecmp("Lightning", (const char *)v49))
                      {
                        v50 = 0x10000;
                      }
                      else if (!strcasecmp("USBC", (const char *)v49))
                      {
                        v50 = 0x20000;
                      }
                      else if (!strcasecmp("NFC", (const char *)v49))
                      {
                        v50 = 196608;
                      }
                      else if (!strcasecmp("SmartConnector", (const char *)v49))
                      {
                        v50 = 0x40000;
                      }
                      else
                      {
                        v50 = -65536;
                      }
                      v60 = (unsigned __int16)v66;
                      goto LABEL_214;
                    case 6u:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v54 = __p;
                      else
                        v54 = (void **)__p[0];
                      if (!strcasecmp("Generic", (const char *)v54))
                      {
                        v65 = 0;
                      }
                      else if (!strcasecmp("Lightning to Headphone Jack Adapter", (const char *)v54))
                      {
                        v65 = 1;
                      }
                      else if (!strcasecmp("EarPods with Lightening", (const char *)v54))
                      {
                        v65 = 2;
                      }
                      else if (!strcasecmp("Lightning Cable", (const char *)v54))
                      {
                        v65 = 4;
                      }
                      else if (!strcasecmp("Charging Dock", (const char *)v54))
                      {
                        v65 = 5;
                      }
                      else if (!strcasecmp("SmartKeyboard", (const char *)v54))
                      {
                        v65 = 12;
                      }
                      else if (!strcasecmp("DisplayCover", (const char *)v54))
                      {
                        v65 = 13;
                      }
                      else if (!strcasecmp("Pencil", (const char *)v54))
                      {
                        v65 = 14;
                      }
                      else if (!strcasecmp("USB3", (const char *)v54))
                      {
                        v65 = 17;
                      }
                      else if (!strcasecmp("DisplayPort", (const char *)v54))
                      {
                        v65 = 18;
                      }
                      else if (!strcasecmp("USB-C to Headphone Jack Adapter", (const char *)v54))
                      {
                        v65 = 19;
                      }
                      else if (!strcasecmp("EarPods with USB-C", (const char *)v54))
                      {
                        v65 = 20;
                      }
                      else if (!strcasecmp("MagSafeCharger", (const char *)v54))
                      {
                        v65 = 15;
                      }
                      else if (!strcasecmp("MagSafeBatteryPack", (const char *)v54))
                      {
                        v65 = 16;
                      }
                      else if (!strcasecmp("AppleMagSafeSiliconCase", (const char *)v54))
                      {
                        v65 = 2048;
                      }
                      else if (!strcasecmp("AppleMagSafeLeatherCase", (const char *)v54))
                      {
                        v65 = 2049;
                      }
                      else if (!strcasecmp("AppleMagSafeClearCase", (const char *)v54))
                      {
                        v65 = 2050;
                      }
                      else if (!strcasecmp("AppleMagSafeSleeve", (const char *)v54))
                      {
                        v65 = 2051;
                      }
                      else if (!strcasecmp("AppleMagSafeWallet", (const char *)v54))
                      {
                        v65 = 2052;
                      }
                      else if (!strcasecmp("AppleMagSafeBatteryPack", (const char *)v54))
                      {
                        v65 = 2053;
                      }
                      else if (!strcasecmp("AppleMagSafeChargingMat", (const char *)v54))
                      {
                        v65 = 2054;
                      }
                      else if (!strcasecmp("AppleMagSafeChargingCable", (const char *)v54))
                      {
                        v65 = 2055;
                      }
                      else if (!strcasecmp("AppleMagSafeRuggedCase", (const char *)v54))
                      {
                        v65 = 2056;
                      }
                      else
                      {
                        if (!strcasecmp("AppleMagSafeTextileCase", (const char *)v54))
                          v55 = 2057;
                        else
                          v55 = -1;
                        v65 = v55;
                      }
                      break;
                    case 0xAu:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v51 = __p;
                      else
                        v51 = (void **)__p[0];
                      if (!strcasecmp("NotApplicable", (const char *)v51))
                      {
                        v50 = 0;
                      }
                      else if (!strcasecmp("Leather", (const char *)v51))
                      {
                        v50 = 1;
                      }
                      else if (!strcasecmp("Silicone", (const char *)v51))
                      {
                        v50 = 2;
                      }
                      else if (!strcasecmp("Plastic", (const char *)v51))
                      {
                        v50 = 3;
                      }
                      else if (!strcasecmp("Textile", (const char *)v51))
                      {
                        v50 = 4;
                      }
                      else
                      {
                        v50 = 0xFFFF;
                      }
                      v60 = v66 & 0xFFFF0000;
LABEL_214:
                      v66 = v50 | v60;
                      break;
                    case 0xDu:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v56 = __p;
                      else
                        v56 = (void **)__p[0];
                      if (!strcasecmp("NotApplicable", (const char *)v56))
                      {
                        v64 = 0;
                      }
                      else if (!strcasecmp("Battery", (const char *)v56))
                      {
                        v64 = 1;
                      }
                      else if (!strcasecmp("Wired", (const char *)v56))
                      {
                        v64 = 2;
                      }
                      else
                      {
                        if (!strcasecmp("Inductive", (const char *)v56))
                          v57 = 3;
                        else
                          v57 = 0xFFFFFFFFLL;
                        v64 = v57;
                      }
                      break;
                    case 0xFu:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v58 = __p;
                      else
                        v58 = (void **)__p[0];
                      if (!strcasecmp("NotApplicable", (const char *)v58))
                      {
                        v63 = 0;
                      }
                      else if (!strcasecmp("White", (const char *)v58))
                      {
                        v63 = 1;
                      }
                      else if (!strcasecmp("Black", (const char *)v58))
                      {
                        v63 = 2;
                      }
                      else
                      {
                        if (!strcasecmp("Brown", (const char *)v58))
                          v59 = 3;
                        else
                          v59 = -1;
                        v63 = v59;
                      }
                      break;
                    case 0x10u:
                      v48 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0)
                        v52 = __p;
                      else
                        v52 = (void **)__p[0];
                      if (!strcasecmp("NotApplicable", (const char *)v52))
                      {
                        v62 = 0;
                      }
                      else if (!strcasecmp("Detached", (const char *)v52))
                      {
                        v62 = 1;
                      }
                      else if (!strcasecmp("Attached", (const char *)v52))
                      {
                        v62 = 2;
                      }
                      else if (!strcasecmp("Opened", (const char *)v52))
                      {
                        v62 = 3;
                      }
                      else
                      {
                        if (!strcasecmp("Closed", (const char *)v52))
                          v53 = 4;
                        else
                          v53 = -1;
                        v62 = v53;
                      }
                      break;
                    default:
                      goto LABEL_140;
                  }
                }
                else
                {
LABEL_140:
                  v48 = HIBYTE(__p[2]);
                }
                if (v48 < 0)
                {
                  operator delete(__p[0]);
                  if ((HIBYTE(__dst[2]) & 0x80) == 0)
                    continue;
                }
                else if ((v44 & 0x80) == 0)
                {
                  continue;
                }
                operator delete(__dst[0]);
                continue;
              }
LABEL_249:
              std::string::__throw_out_of_range[abi:ne180100]();
            }
LABEL_248:
            std::string::__throw_length_error[abi:ne180100]();
          }
          goto LABEL_247;
        }
      }
      memmove(v36, v33, v32);
      *((_BYTE *)v36 + v32) = 0;
      v37 = v35 + 1;
      memset(__p, 170, sizeof(__p));
      LOBYTE(v38) = HIBYTE(v72);
      if (SHIBYTE(v72) < 0)
        goto LABEL_94;
LABEL_87:
      v38 = v38;
      if (v37 <= v38)
      {
        v39 = (char *)&v70;
        v40 = v38 - v37;
        if (v40 <= 0x7FFFFFFFFFFFFFF7)
          goto LABEL_96;
        goto LABEL_248;
      }
LABEL_247:
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    break;
  }
  if (v72 < 0)
    operator delete(v70);
  v73 = *MEMORY[0x1E0DE4F58];
  *(uint64_t *)((char *)&v73 + *(_QWORD *)(v73 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 24);
  *((_QWORD *)&v74 + 1) = MEMORY[0x1E0DE4FB8] + 16;
  if ((v78[31] & 0x80000000) != 0)
    operator delete(*(void **)&v78[8]);
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1C3B88050](v79);
  return ((unint64_t)v63 << 32) | (v64 << 48) | ((unint64_t)v62 << 16) | v65;
}

void sub_1BF3199FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52)
{
  __cxa_end_catch();
  if (a36 < 0)
    operator delete(__p);
  std::istringstream::~istringstream((uint64_t)&a37);
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F58];
  v3 = *MEMORY[0x1E0DE4F58];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F58];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1C3B88050](a1 + 120);
  return a1;
}

unint64_t abm::AccessoryInfo::create(xpc_object_t *a1)
{
  uint64_t v2;
  unsigned __int16 v3;
  unsigned __int16 v4;
  unsigned __int16 v5;
  xpc_object_t value;
  unsigned __int16 v7;
  xpc_object_t v8;
  unsigned __int16 v9;
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t object;
  xpc_object_t objecta;
  xpc_object_t objectb;
  xpc_object_t objectc;
  xpc_object_t objectd;
  xpc_object_t objecte;

  if (MEMORY[0x1C3B88380](*a1) != MEMORY[0x1E0C812F8])
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = -1;
    return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
  }
  if (xpc_dictionary_get_value(*a1, "kAccessoryID"))
  {
    value = xpc_dictionary_get_value(*a1, "kAccessoryID");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    v7 = xpc::dyn_cast_or_default();
    xpc_release(object);
    v5 = v7;
    if (xpc_dictionary_get_value(*a1, "kAccessoryState"))
    {
LABEL_11:
      v8 = xpc_dictionary_get_value(*a1, "kAccessoryState");
      objecta = v8;
      if (v8)
        xpc_retain(v8);
      else
        objecta = xpc_null_create();
      v9 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      v4 = v9;
      if (xpc_dictionary_get_value(*a1, "kAccessoryColor"))
        goto LABEL_15;
LABEL_8:
      v3 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v5 = -1;
    if (xpc_dictionary_get_value(*a1, "kAccessoryState"))
      goto LABEL_11;
  }
  v4 = 0;
  if (!xpc_dictionary_get_value(*a1, "kAccessoryColor"))
    goto LABEL_8;
LABEL_15:
  v10 = xpc_dictionary_get_value(*a1, "kAccessoryColor");
  objectb = v10;
  if (v10)
    xpc_retain(v10);
  else
    objectb = xpc_null_create();
  v3 = xpc::dyn_cast_or_default();
  xpc_release(objectb);
LABEL_19:
  if (!xpc_dictionary_get_value(*a1, "kAccessoryPower"))
  {
    v2 = 0;
    if (xpc_dictionary_get_value(*a1, "kAccessoryMaterial"))
      goto LABEL_27;
LABEL_23:
    if (!xpc_dictionary_get_value(*a1, "kAccessoryConnection"))
      return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
    goto LABEL_31;
  }
  v11 = xpc_dictionary_get_value(*a1, "kAccessoryPower");
  objectc = v11;
  if (v11)
    xpc_retain(v11);
  else
    objectc = xpc_null_create();
  v12 = xpc::dyn_cast_or_default();
  xpc_release(objectc);
  v2 = v12;
  if (!xpc_dictionary_get_value(*a1, "kAccessoryMaterial"))
    goto LABEL_23;
LABEL_27:
  v13 = xpc_dictionary_get_value(*a1, "kAccessoryMaterial");
  objectd = v13;
  if (v13)
    xpc_retain(v13);
  else
    objectd = xpc_null_create();
  xpc::dyn_cast_or_default();
  xpc_release(objectd);
  if (xpc_dictionary_get_value(*a1, "kAccessoryConnection"))
  {
LABEL_31:
    v14 = xpc_dictionary_get_value(*a1, "kAccessoryConnection");
    objecte = v14;
    if (v14)
      xpc_retain(v14);
    else
      objecte = xpc_null_create();
    xpc::dyn_cast_or_default();
    xpc_release(objecte);
  }
  return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
}

void sub_1BF319E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abm::AccessoryInfo::toDict(abm::AccessoryInfo *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(*(unsigned __int16 *)this);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kAccessoryID", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned __int16 *)this + 1));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kAccessoryState", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  v12 = xpc_int64_create(*((unsigned __int16 *)this + 2));
  if (!v12)
    v12 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kAccessoryColor", v12);
  v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  v14 = xpc_int64_create(*((unsigned __int16 *)this + 3));
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kAccessoryPower", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  v16 = xpc_int64_create(*((unsigned __int16 *)this + 4));
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kAccessoryMaterial", v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  v18 = xpc_int64_create(*((unsigned __int16 *)this + 5));
  if (!v18)
    v18 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kAccessoryConnection", v18);
  v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E78F4988, MEMORY[0x1E0DE42E0]);
}

void sub_1BF31A21C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

_QWORD *std::string::__assign_no_alias<true>(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

uint64_t *GetOsLogContext(void)
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)&qword_1EF57CBA8);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1EF57CBA8))
  {
    qword_1EF57CBC8 = 0;
    qword_1EF57CBC0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x1E0DE3768], &qword_1EF57CBC0, &dword_1BF308000);
    __cxa_guard_release(&qword_1EF57CBA8);
  }
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  return &qword_1EF57CBC0;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  _BYTE v0[16];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(uint64_t *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];
  std::__shared_weak_count *v11;

  v2 = atomic_load((unsigned __int8 *)&qword_1EF57CBB8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1EF57CBB8))
  {
    MEMORY[0x1C3B87D8C](&unk_1EF57CBD0);
    __cxa_atexit((void (*)(void *))MEMORY[0x1E0DE3788], &unk_1EF57CBD0, &dword_1BF308000);
    __cxa_guard_release(&qword_1EF57CBB8);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_3;
  v3 = *a1;
  v4 = (std::__shared_weak_count *)a1[1];
  v10[4] = v3;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  if (qword_1EF57CBB0 != -1)
  {
    dispatch_once(&qword_1EF57CBB0, v10);
    v4 = v11;
    if (v11)
      goto LABEL_7;
    return &unk_1EF57CBD0;
  }
  if (!v4)
    return &unk_1EF57CBD0;
LABEL_7:
  v7 = (unint64_t *)&v4->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8)
    return &unk_1EF57CBD0;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return &unk_1EF57CBD0;
}

void sub_1BF31A54C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CBB8);
  _Unwind_Resume(a1);
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v10[16];
  _BYTE v11[48];
  uint64_t v12;
  uint64_t v13;

  v2 = atomic_load((unsigned __int8 *)&qword_1EF57CBA8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1EF57CBA8))
  {
    qword_1EF57CBC8 = 0;
    qword_1EF57CBC0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x1E0DE3768], &qword_1EF57CBC0, &dword_1BF308000);
    __cxa_guard_release(&qword_1EF57CBA8);
  }
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v10, (const ctu::OsLogContext *)&qword_1EF57CBC0);
  MEMORY[0x1C3B87D80](v11, v10, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  v4 = v12;
  v3 = v13;
  if (v13)
  {
    v5 = (unint64_t *)(v13 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)qword_1EF57CC08;
  qword_1EF57CC00 = v4;
  qword_1EF57CC08 = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  ctu::StaticLogger::~StaticLogger((ctu::StaticLogger *)v11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
}

void sub_1BF31A6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
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
}

uint64_t ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>(uint64_t a1, char *__s, const char **a3)
{
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = strlen(__s);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
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
  v11 = (void *)(a1 + 24);
  v12 = *a3;
  v13 = strlen(*a3);
  if (v13 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v14 = v13;
  if (v13 >= 0x17)
  {
    v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v15 = v13 | 7;
    v16 = v15 + 1;
    v11 = operator new(v15 + 1);
    *(_QWORD *)(a1 + 32) = v14;
    *(_QWORD *)(a1 + 40) = v16 | 0x8000000000000000;
    *(_QWORD *)(a1 + 24) = v11;
  }
  else
  {
    *(_BYTE *)(a1 + 47) = v13;
    if (!v13)
      goto LABEL_17;
  }
  memmove(v11, v12, v14);
LABEL_17:
  *((_BYTE *)v11 + v14) = 0;
  return a1;
}

void sub_1BF31A928(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {
      if (*(char *)(v2 + 79) < 0)
      {
        operator delete(*(void **)(v2 + 56));
        if ((*(char *)(v2 + 55) & 0x80000000) == 0)
          goto LABEL_5;
      }
      else if ((*(char *)(v2 + 55) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 32));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
        goto LABEL_4;
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
LABEL_4:
      operator delete((void *)a1);
      return;
    }
    operator delete(*(void **)(a1 + 32));
    operator delete((void *)a1);
  }
}

uint64_t __cxx_global_var_init_22()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_1BF308000);
  }
  return result;
}

void _GLOBAL__sub_I_BasebandNVRAM_mm()
{
  uint64_t v0;
  uint64_t v1;
  void **v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  BOOL v6;
  int v7;
  const void *v8;
  size_t v9;
  int v10;
  const std::string::value_type *v11;
  size_t v12;
  size_t v13;
  int v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  uint64_t *v21;
  size_t v22;
  size_t v23;
  int v24;
  int v25;
  char *v26;
  uint64_t *v27;
  std::string *v28;
  const std::string::value_type **v29;
  void *v30[2];
  char v31;
  _BYTE v32[23];
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  void *v66;
  char v67;
  void *v68;
  char v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *__p;
  char v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)v30, "boot-args", (const char **)kBootArgsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v34, "boot-command", (const char **)kBootCommadShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v38, "auto-boot", (const char **)kAutoBootShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v42, "bootdelay", (const char **)kBootDelayShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v46, "boot-script", (const char **)kBootScriptShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v50, "boot-device", (const char **)kBootDeviceShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v54, "debug-soc", (const char **)kDebugSocShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v58, "debug-uarts", (const char **)kDebugUartsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v62, "force-ctrr-lock", (const char **)kForceCtrrLockShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v66, "enable-auth-debug", (const char **)kEnableAuthDebugShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v70, "reconfig-breakpoints", (const char **)kReconfigBreakpointsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v74, "reconfig-behavior", (const char **)&kReconfigBehaviorShort);
  v0 = 0;
  v1 = 0;
  qword_1ED02D3D0 = 0;
  qword_1ED02D3C8 = 0;
  mNVRAMItems = (uint64_t)&qword_1ED02D3C8;
  v2 = v30;
LABEL_5:
  v4 = &qword_1ED02D3C8;
  while (1)
  {
    if (!v0)
      goto LABEL_51;
    v16 = v4 + 1;
    if (!v4[1])
      goto LABEL_52;
LABEL_61:
    if (++v1 == 12)
      break;
    v0 = qword_1ED02D3C8;
    v2 = &v30[6 * v1];
    if ((uint64_t *)mNVRAMItems == &qword_1ED02D3C8)
      goto LABEL_5;
    v3 = qword_1ED02D3C8;
    if (qword_1ED02D3C8)
    {
      do
      {
        v4 = (uint64_t *)v3;
        v3 = *(_QWORD *)(v3 + 8);
      }
      while (v3);
    }
    else
    {
      v5 = &qword_1ED02D3C8;
      do
      {
        v4 = (uint64_t *)v5[2];
        v6 = *v4 == (_QWORD)v5;
        v5 = v4;
      }
      while (v6);
    }
    v7 = *((char *)v4 + 55);
    if (v7 >= 0)
      v8 = v4 + 4;
    else
      v8 = (const void *)v4[4];
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)v4 + 55);
    else
      v9 = v4[5];
    v10 = *((char *)v2 + 23);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)&v30[6 * v1];
    else
      v11 = (const std::string::value_type *)*v2;
    if (v10 >= 0)
      v12 = *((unsigned __int8 *)v2 + 23);
    else
      v12 = (size_t)v2[1];
    if (v12 >= v9)
      v13 = v9;
    else
      v13 = v12;
    v14 = memcmp(v8, v11, v13);
    if (v14)
    {
      if ((v14 & 0x80000000) == 0)
        goto LABEL_25;
    }
    else if (v9 >= v12)
    {
LABEL_25:
      if (v0)
      {
        v15 = (uint64_t *)v0;
        while (1)
        {
          v4 = v15;
          v19 = (uint64_t *)v15[4];
          v17 = v15 + 4;
          v18 = v19;
          v20 = *((char *)v17 + 23);
          if (v20 >= 0)
            v21 = v17;
          else
            v21 = v18;
          if (v20 >= 0)
            v22 = *((unsigned __int8 *)v17 + 23);
          else
            v22 = v17[1];
          if (v22 >= v12)
            v23 = v12;
          else
            v23 = v22;
          v24 = memcmp(v11, v21, v23);
          if (v24)
          {
            if (v24 < 0)
              goto LABEL_27;
LABEL_41:
            v25 = memcmp(v21, v11, v23);
            if (v25)
            {
              if ((v25 & 0x80000000) == 0)
                goto LABEL_61;
            }
            else if (v22 >= v12)
            {
              goto LABEL_61;
            }
            v15 = (uint64_t *)v4[1];
            if (!v15)
            {
              v16 = v4 + 1;
              goto LABEL_52;
            }
          }
          else
          {
            if (v12 >= v22)
              goto LABEL_41;
LABEL_27:
            v15 = (uint64_t *)*v4;
            v16 = v4;
            if (!*v4)
              goto LABEL_52;
          }
        }
      }
LABEL_51:
      v16 = &qword_1ED02D3C8;
      v4 = &qword_1ED02D3C8;
LABEL_52:
      v26 = (char *)operator new(0x50uLL);
      v27 = (uint64_t *)v26;
      if (*((char *)v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v26 + 32), (const std::string::value_type *)*v2, (std::string::size_type)v2[1]);
      }
      else
      {
        *((_OWORD *)v26 + 2) = *(_OWORD *)v2;
        *((_QWORD *)v26 + 6) = v2[2];
      }
      v28 = (std::string *)(v27 + 7);
      v29 = (const std::string::value_type **)&v32[48 * v1];
      if (*((char *)v2 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(v28, *v29, *(_QWORD *)&v32[48 * v1 + 8]);
      }
      else
      {
        *(_OWORD *)&v28->__r_.__value_.__l.__data_ = *(_OWORD *)v29;
        v27[9] = *(_QWORD *)&v32[48 * v1 + 16];
      }
      *v27 = 0;
      v27[1] = 0;
      v27[2] = (uint64_t)v4;
      *v16 = (uint64_t)v27;
      if (*(_QWORD *)mNVRAMItems)
      {
        mNVRAMItems = *(_QWORD *)mNVRAMItems;
        v27 = (uint64_t *)*v16;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_1ED02D3C8, v27);
      ++qword_1ED02D3D0;
      goto LABEL_61;
    }
  }
  if ((v77 & 0x80000000) == 0)
  {
    if ((v75 & 0x80000000) == 0)
      goto LABEL_66;
LABEL_90:
    operator delete(v74);
    if (v73 < 0)
      goto LABEL_91;
LABEL_67:
    if ((v71 & 0x80000000) == 0)
      goto LABEL_68;
LABEL_92:
    operator delete(v70);
    if (v69 < 0)
      goto LABEL_93;
LABEL_69:
    if ((v67 & 0x80000000) == 0)
      goto LABEL_70;
LABEL_94:
    operator delete(v66);
    if (v65 < 0)
      goto LABEL_95;
LABEL_71:
    if ((v63 & 0x80000000) == 0)
      goto LABEL_72;
LABEL_96:
    operator delete(v62);
    if (v61 < 0)
      goto LABEL_97;
LABEL_73:
    if ((v59 & 0x80000000) == 0)
      goto LABEL_74;
LABEL_98:
    operator delete(v58);
    if (v57 < 0)
      goto LABEL_99;
LABEL_75:
    if ((v55 & 0x80000000) == 0)
      goto LABEL_76;
LABEL_100:
    operator delete(v54);
    if (v53 < 0)
      goto LABEL_101;
LABEL_77:
    if ((v51 & 0x80000000) == 0)
      goto LABEL_78;
LABEL_102:
    operator delete(v50);
    if (v49 < 0)
      goto LABEL_103;
LABEL_79:
    if ((v47 & 0x80000000) == 0)
      goto LABEL_80;
LABEL_104:
    operator delete(v46);
    if (v45 < 0)
      goto LABEL_105;
LABEL_81:
    if ((v43 & 0x80000000) == 0)
      goto LABEL_82;
LABEL_106:
    operator delete(v42);
    if (v41 < 0)
      goto LABEL_107;
LABEL_83:
    if ((v39 & 0x80000000) == 0)
      goto LABEL_84;
LABEL_108:
    operator delete(v38);
    if (v37 < 0)
      goto LABEL_109;
LABEL_85:
    if ((v35 & 0x80000000) == 0)
      goto LABEL_86;
LABEL_110:
    operator delete(v34);
    if (v33 < 0)
      goto LABEL_111;
LABEL_87:
    if ((v31 & 0x80000000) == 0)
      return;
LABEL_112:
    operator delete(v30[0]);
    return;
  }
  operator delete(__p);
  if (v75 < 0)
    goto LABEL_90;
LABEL_66:
  if ((v73 & 0x80000000) == 0)
    goto LABEL_67;
LABEL_91:
  operator delete(v72);
  if (v71 < 0)
    goto LABEL_92;
LABEL_68:
  if ((v69 & 0x80000000) == 0)
    goto LABEL_69;
LABEL_93:
  operator delete(v68);
  if (v67 < 0)
    goto LABEL_94;
LABEL_70:
  if ((v65 & 0x80000000) == 0)
    goto LABEL_71;
LABEL_95:
  operator delete(v64);
  if (v63 < 0)
    goto LABEL_96;
LABEL_72:
  if ((v61 & 0x80000000) == 0)
    goto LABEL_73;
LABEL_97:
  operator delete(v60);
  if (v59 < 0)
    goto LABEL_98;
LABEL_74:
  if ((v57 & 0x80000000) == 0)
    goto LABEL_75;
LABEL_99:
  operator delete(v56);
  if (v55 < 0)
    goto LABEL_100;
LABEL_76:
  if ((v53 & 0x80000000) == 0)
    goto LABEL_77;
LABEL_101:
  operator delete(v52);
  if (v51 < 0)
    goto LABEL_102;
LABEL_78:
  if ((v49 & 0x80000000) == 0)
    goto LABEL_79;
LABEL_103:
  operator delete(v48);
  if (v47 < 0)
    goto LABEL_104;
LABEL_80:
  if ((v45 & 0x80000000) == 0)
    goto LABEL_81;
LABEL_105:
  operator delete(v44);
  if (v43 < 0)
    goto LABEL_106;
LABEL_82:
  if ((v41 & 0x80000000) == 0)
    goto LABEL_83;
LABEL_107:
  operator delete(v40);
  if (v39 < 0)
    goto LABEL_108;
LABEL_84:
  if ((v37 & 0x80000000) == 0)
    goto LABEL_85;
LABEL_109:
  operator delete(v36);
  if (v35 < 0)
    goto LABEL_110;
LABEL_86:
  if ((v33 & 0x80000000) == 0)
    goto LABEL_87;
LABEL_111:
  operator delete(*(void **)v32);
  if (v31 < 0)
    goto LABEL_112;
}

void sub_1BF31B268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60,void *a61,uint64_t a62,int a63)
{
  char a66;
  void *a67;
  char a72;
  void *a73;
  char a74;
  void *a75;
  char a76;
  void *a77;
  char a78;
  void *a79;
  char a80;
  void *a81;
  char a82;
  void *a83;
  char a84;
  void *a85;
  char a86;
  void *a87;
  char a88;
  void *a89;
  char a90;
  void *a91;
  char a92;
  uint64_t v92;
  void **v93;
  uint64_t v94;

  v94 = v92;
  if (*(char *)(v94 + 55) < 0)
    operator delete(*v93);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](&a10);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(qword_1ED02D3C8);
  if (SLOBYTE(STACK[0x25F]) < 0)
  {
    operator delete((void *)STACK[0x248]);
    if ((SLOBYTE(STACK[0x247]) & 0x80000000) == 0)
    {
LABEL_5:
      if ((SLOBYTE(STACK[0x22F]) & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((SLOBYTE(STACK[0x247]) & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  operator delete((void *)STACK[0x230]);
  if ((SLOBYTE(STACK[0x22F]) & 0x80000000) == 0)
  {
LABEL_6:
    if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  operator delete((void *)STACK[0x218]);
  if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0)
  {
LABEL_7:
    if ((a92 & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  operator delete((void *)STACK[0x200]);
  if ((a92 & 0x80000000) == 0)
  {
LABEL_8:
    if ((a90 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  operator delete(a91);
  if ((a90 & 0x80000000) == 0)
  {
LABEL_9:
    if ((a88 & 0x80000000) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  operator delete(a89);
  if ((a88 & 0x80000000) == 0)
  {
LABEL_10:
    if ((a86 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  operator delete(a87);
  if ((a86 & 0x80000000) == 0)
  {
LABEL_11:
    if ((a84 & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  operator delete(a85);
  if ((a84 & 0x80000000) == 0)
  {
LABEL_12:
    if ((a82 & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  operator delete(a83);
  if ((a82 & 0x80000000) == 0)
  {
LABEL_13:
    if ((a80 & 0x80000000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  operator delete(a81);
  if ((a80 & 0x80000000) == 0)
  {
LABEL_14:
    if ((a78 & 0x80000000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  operator delete(a79);
  if ((a78 & 0x80000000) == 0)
  {
LABEL_15:
    if ((a76 & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  operator delete(a77);
  if ((a76 & 0x80000000) == 0)
  {
LABEL_16:
    if ((a74 & 0x80000000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  operator delete(a75);
  if ((a74 & 0x80000000) == 0)
  {
LABEL_17:
    if ((a72 & 0x80000000) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  operator delete(a73);
  if ((a72 & 0x80000000) == 0)
  {
LABEL_18:
    if ((a66 & 0x80000000) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  operator delete(a67);
  if ((a66 & 0x80000000) == 0)
  {
LABEL_19:
    if ((a60 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  operator delete(a61);
  if ((a60 & 0x80000000) == 0)
  {
LABEL_20:
    if ((a54 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  operator delete(a55);
  if ((a54 & 0x80000000) == 0)
  {
LABEL_21:
    if ((a48 & 0x80000000) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  operator delete(a49);
  if ((a48 & 0x80000000) == 0)
  {
LABEL_22:
    if ((a42 & 0x80000000) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  operator delete(a43);
  if ((a42 & 0x80000000) == 0)
  {
LABEL_23:
    if ((a36 & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  operator delete(a37);
  if ((a36 & 0x80000000) == 0)
  {
LABEL_24:
    if ((a30 & 0x80000000) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  operator delete(a31);
  if ((a30 & 0x80000000) == 0)
  {
LABEL_25:
    if ((a24 & 0x80000000) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  operator delete(a25);
  if ((a24 & 0x80000000) == 0)
  {
LABEL_26:
    if (a18 < 0)
      goto LABEL_27;
    goto LABEL_51;
  }
LABEL_50:
  operator delete(a19);
  if (a18 < 0)
  {
LABEL_27:
    operator delete(__p);
    _Unwind_Resume(a1);
  }
LABEL_51:
  _Unwind_Resume(a1);
}

uint64_t ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  std::ios_base *v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  std::__shared_weak_count_vtbl *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v28;
  void *__p;
  _OWORD v30[4];
  void *v31[2];
  __int128 v32;
  unint64_t v33;
  uint64_t v34;
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

  __p = operator new(0x20uLL);
  v30[0] = xmmword_1BF332C50;
  strcpy((char *)__p, "AppleBasebandManagerClientLog");
  ctu::LogServer::create();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = v44;
  v44 = 0uLL;
  v4 = *(std::__shared_weak_count **)(v2 + 8);
  *(_OWORD *)v2 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (*((_QWORD *)&v44 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v44 + 1) + 16))(*((_QWORD *)&v44 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v44 + 1));
      if ((SHIBYTE(v30[0]) & 0x80000000) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (SHIBYTE(v30[0]) < 0)
LABEL_11:
    operator delete(__p);
LABEL_12:
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32 = v9;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v43 = v9;
  v42 = v9;
  v41 = v9;
  v40 = v9;
  v39 = v9;
  v38 = v9;
  v37 = v9;
  v36 = v9;
  v35 = v9;
  v30[3] = v9;
  *(_OWORD *)v31 = v9;
  v30[1] = v9;
  v30[2] = v9;
  v30[0] = v9;
  v10 = MEMORY[0x1E0DE4FE0];
  v11 = MEMORY[0x1E0DE4FE0] + 64;
  v34 = MEMORY[0x1E0DE4FE0] + 64;
  v12 = MEMORY[0x1E0DE4F60];
  v13 = *(void **)(MEMORY[0x1E0DE4F60] + 16);
  __p = *(void **)(MEMORY[0x1E0DE4F60] + 8);
  *(void **)((char *)&__p + *((_QWORD *)__p - 3)) = v13;
  v14 = (std::ios_base *)((char *)&__p + *((_QWORD *)__p - 3));
  std::ios_base::init(v14, v30);
  v14[1].__vftable = 0;
  v14[1].__fmtflags_ = -1;
  __p = (void *)(v10 + 24);
  v34 = v11;
  std::streambuf::basic_streambuf();
  v15 = MEMORY[0x1E0DE4FB8];
  *(_QWORD *)&v30[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)v31 = 0u;
  v32 = 0u;
  LODWORD(v33) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)"/tmp/ABM.", 9);
  v16 = getprogname();
  v17 = strlen(v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)v16, v17);
  LOBYTE(v44) = 46;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)&v44, 1);
  getpid();
  std::ostream::operator<<();
  v18 = (std::__shared_weak_count_vtbl *)operator new(8uLL);
  v18->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_1E78F5DD0;
  *(_QWORD *)&v44 = v18;
  v19 = (std::__shared_weak_count *)operator new(0x20uLL);
  v19->__shared_owners_ = 0;
  v20 = (unint64_t *)&v19->__shared_owners_;
  v19->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F5E38;
  v19->__shared_weak_owners_ = 0;
  v19[1].__vftable = v18;
  *((_QWORD *)&v44 + 1) = v19;
  v28 = v19;
  do
    v21 = __ldxr(v20);
  while (__stxr(v21 + 1, v20));
  ctu::LogServer::addWriter();
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  ctu::LogServer::start(**(ctu::LogServer ***)(a1 + 32));
  ctu::LogServer::setEnabled(**(ctu::LogServer ***)(a1 + 32));
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
  if (*((_QWORD *)&v44 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  __p = *(void **)v12;
  *(void **)((char *)&__p + *((_QWORD *)__p - 3)) = *(void **)(v12 + 24);
  *(_QWORD *)&v30[0] = v15 + 16;
  if (SBYTE7(v32) < 0)
    operator delete(v31[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1C3B88050](&v34);
}

void sub_1BF31B8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v17 - 80);
  std::ostringstream::~ostringstream((uint64_t)&__p);
  _Unwind_Resume(a1);
}

void sub_1BF31B960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C3B88050](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const std::locale::facet *v12;
  uint64_t v13;
  BOOL v14;
  size_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  void *locale;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  std::locale __b[3];

  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x1C3B87FB4](v24, a1);
  if (LOBYTE(v24[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v12 = std::locale::use_facet(__b, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    else
    {
      v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        if (v16 >= 0x17)
        {
          v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v18 = v16 | 7;
          v19 = v18 + 1;
          v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((_BYTE *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0)
          locale = __b;
        else
          locale = __b[0].__locale_;
        v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v7 + 96))(v7, locale, v16);
        v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16)
            goto LABEL_34;
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((_QWORD *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x1C3B87FC0](v24);
  return a1;
}

void sub_1BF31BC58(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1C3B87FC0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1BF31BC28);
}

void sub_1BF31BCB8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

_QWORD *abm::client::Event::Event(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void abm::client::Event::getName(_QWORD *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
}

void abm::client::Event::getData(xpc_object_t **this@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t *v3;
  xpc_object_t value;
  uint64_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  CFTypeID v8;
  const void *v9;
  xpc_object_t object;
  CFTypeRef cf;

  v3 = *this;
  *a2 = 0;
  value = xpc_dictionary_get_value(*v3, (const char *)kKeyEventData);
  v5 = MEMORY[0x1E0C812F8];
  if (value)
  {
    v6 = value;
    xpc_retain(value);
  }
  else
  {
    v6 = xpc_null_create();
    if (!v6)
    {
      v7 = xpc_null_create();
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v6) == v5)
  {
    xpc_retain(v6);
    v7 = v6;
  }
  else
  {
    v7 = xpc_null_create();
  }
LABEL_8:
  xpc_release(v6);
  if (MEMORY[0x1C3B88380](v7) == v5)
  {
    object = v7;
    if (v7)
      xpc_retain(v7);
    else
      object = xpc_null_create();
    xpc::bridge();
    if (cf)
    {
      v8 = CFGetTypeID(cf);
      if (v8 == CFDictionaryGetTypeID())
      {
        CFRetain(cf);
        v9 = cf;
        *a2 = cf;
      }
      else
      {
        v9 = cf;
        *a2 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      *a2 = 0;
    }
    xpc_release(object);
  }
  xpc_release(v7);
}

void sub_1BF31BF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, CFTypeRef cf)
{
  CFTypeRef *v10;
  void *v11;

  xpc_release(object);
  xpc_release(v11);
  if (*v10)
    CFRelease(*v10);
  _Unwind_Resume(a1);
}

void abm::client::Event::name(xpc_object_t **this)
{
  abm::client::Event::State::name(*this);
}

void abm::client::Event::State::name(xpc_object_t *this)
{
  xpc_object_t value;
  xpc_object_t object;

  value = xpc_dictionary_get_value(*this, (const char *)kKeyEvent);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_1BF31BFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abm::client::Event::create(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  std::__shared_weak_count_vtbl *v6;
  xpc_object_t v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;

  v6 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v7 = *a1;
  if (v7)
  {
    xpc_retain(v7);
    v8 = *(const void **)a2;
    if (*(_QWORD *)a2)
      goto LABEL_3;
  }
  else
  {
    v7 = xpc_null_create();
    v8 = *(const void **)a2;
    if (*(_QWORD *)a2)
    {
LABEL_3:
      v9 = _Block_copy(v8);
      v10 = *(NSObject **)(a2 + 8);
      if (!v10)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v9 = 0;
  v10 = *(NSObject **)(a2 + 8);
  if (v10)
LABEL_4:
    dispatch_retain(v10);
LABEL_5:
  v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  if (v7)
  {
    xpc_retain(v7);
    if (v9)
      goto LABEL_7;
  }
  else
  {
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    if (v9)
    {
LABEL_7:
      v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(v9);
      v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v10;
      if (!v10)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  v6->~__shared_weak_count_0 = 0;
  v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v10;
  if (v10)
LABEL_8:
    dispatch_retain(v10);
LABEL_9:
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F5E88;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v6;
  if (v10)
    dispatch_release(v10);
  if (v9)
    _Block_release(v9);
  xpc_release(v7);
  v13 = operator new(0x10uLL);
  v14 = v13;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  *v13 = v6;
  v13[1] = v11;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  *a3 = v13;
  v17 = operator new(0x20uLL);
  *v17 = off_1E78F5F08;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = v14;
  a3[1] = v17;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (v18)
  {
    v19 = v11;
    if (!v11)
      return;
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    v19 = v11;
    if (!v11)
      return;
  }
  v20 = (unint64_t *)&v19->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
}

void sub_1BF31C244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v17;

  do
    v17 = __ldaxr(v15);
  while (__stlxr(v17 - 1, v15));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  operator delete(v13);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_1BF31C2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  abm::client::Event::State *v11;
  void *v12;
  void *v14;

  abm::client::Event::State::~State(v11);
  operator delete(v14);
  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a11);
  xpc_release(v12);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

const void **ctu::cf::CFSharedRef<void const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::__on_zero_shared(uint64_t a1)
{
  abm::client::Event::State *v1;
  void *v2;

  v1 = *(abm::client::Event::State **)(a1 + 24);
  if (v1)
  {
    abm::client::Event::State::~State(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF332E80)
    return a1 + 24;
  if (((v3 & 0x80000001BF332E80 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF332E80))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF332E80 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void abm::client::Event::State::~State(abm::client::Event::State *this)
{
  int v2;
  size_t v3;
  const void *p_p;
  BOOL v5;
  xpc_object_t v6;
  const void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const void *v11;
  void *__p;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  void *aBlock;
  xpc_object_t object;

  if (!*((_QWORD *)this + 1) || !*((_QWORD *)this + 2))
    goto LABEL_31;
  abm::client::Event::State::name((xpc_object_t *)this);
  v2 = SHIBYTE(v14);
  if (SHIBYTE(v14) >= 0)
    v3 = HIBYTE(v14);
  else
    v3 = v13;
  if (v3 == strlen((const char *)kValueInvalid))
  {
    if (SHIBYTE(v14) >= 0)
      p_p = &__p;
    else
      p_p = __p;
    v5 = memcmp(p_p, (const void *)kValueInvalid, v3) == 0;
    if (v2 < 0)
    {
LABEL_15:
      operator delete(__p);
      if (v5)
        goto LABEL_31;
      goto LABEL_16;
    }
  }
  else
  {
    v5 = 0;
    if (SHIBYTE(v14) < 0)
      goto LABEL_15;
  }
  if (v5)
    goto LABEL_31;
LABEL_16:
  v6 = *(xpc_object_t *)this;
  if (*(_QWORD *)this)
  {
    xpc_retain(*(xpc_object_t *)this);
    v7 = (const void *)*((_QWORD *)this + 1);
    if (v7)
    {
LABEL_18:
      v8 = _Block_copy(v7);
      goto LABEL_21;
    }
  }
  else
  {
    v6 = xpc_null_create();
    v7 = (const void *)*((_QWORD *)this + 1);
    if (v7)
      goto LABEL_18;
  }
  v8 = 0;
LABEL_21:
  v9 = *((_QWORD *)this + 2);
  __p = (void *)MEMORY[0x1E0C809B0];
  v13 = 1174405120;
  v14 = ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke;
  v15 = &__block_descriptor_tmp_4;
  if (!v8)
  {
    aBlock = 0;
    object = v6;
    if (v6)
      goto LABEL_23;
LABEL_25:
    object = xpc_null_create();
    goto LABEL_26;
  }
  aBlock = _Block_copy(v8);
  object = v6;
  if (!v6)
    goto LABEL_25;
LABEL_23:
  xpc_retain(v6);
LABEL_26:
  dispatch_async(v9, &__p);
  xpc_release(object);
  object = 0;
  if (aBlock)
    _Block_release(aBlock);
  if (v8)
    _Block_release(v8);
  xpc_release(v6);
LABEL_31:
  v10 = *((_QWORD *)this + 2);
  if (v10)
    dispatch_release(v10);
  v11 = (const void *)*((_QWORD *)this + 1);
  if (v11)
    _Block_release(v11);
  xpc_release(*(xpc_object_t *)this);
  *(_QWORD *)this = 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  object = v1;
  if (v1)
    xpc_retain(v1);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_1BF31C638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  void *v6;
  xpc_object_t result;

  v4 = *(const void **)(a2 + 32);
  if (v4)
  {
    v5 = _Block_copy(v4);
    v6 = *(void **)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v5;
    *(_QWORD *)(a1 + 40) = v6;
    if (v6)
      return xpc_retain(v6);
  }
  else
  {
    v6 = *(void **)(a2 + 40);
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = v6;
    if (v6)
      return xpc_retain(v6);
  }
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = (std::__shared_weak_count *)v1[1];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF332F57)
    return a1 + 24;
  if (((v3 & 0x80000001BF332F57 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF332F57))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF332F57 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

const char *abm::asString(unsigned int a1)
{
  if (a1 > 9)
    return "Unknown";
  else
    return off_1E78F5F80[a1];
}

{
  if (a1 > 3)
    return "Unknown";
  else
    return off_1E78F5FD0[a1];
}

char *abm::data::getDataPropertyNameFromDict(xpc_object_t *a1)
{
  xpc_object_t value;
  unsigned int v3;
  xpc_object_t object;

  if (MEMORY[0x1C3B88380](*a1) != MEMORY[0x1E0C812F8])
    return "Unknown";
  value = xpc_dictionary_get_value(*a1, "kDataProperty");
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v3 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v3 < 5)
    return off_1E78F64F8[v3];
  else
    return "Unknown";
}

void sub_1BF31C954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::getDataPropertyTypeFromDict(xpc_object_t *a1)
{
  xpc_object_t value;
  unsigned int v4;
  xpc_object_t object;

  if (MEMORY[0x1C3B88380](*a1) != MEMORY[0x1E0C812F8])
    return 5;
  value = xpc_dictionary_get_value(*a1, "kDataProperty");
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v4 >= 5)
    return 5;
  else
    return v4;
}

void sub_1BF31CA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abm::data::DataAggregationProtocol::toDict(abm::data::DataAggregationProtocol *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(0);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationProtocol", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationProtocol::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationProtocol", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

const char *abm::data::DataAggregationProtocol::asString(abm::data::DataAggregationProtocol *this)
{
  uint64_t v1;

  v1 = *((int *)this + 3);
  if (v1 > 2)
    return "unknown";
  else
    return off_1E78F6520[v1];
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(0);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  int v5;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_1E78F63A0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C3B88380](*a1) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(*a1, "kDataAggregationProtocol"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationProtocol");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    v5 = xpc::dyn_cast_or_default();
    xpc_release(object);
    if (v5)
    {
      if (v5 == 1)
      {
        *(_DWORD *)(a2 + 12) = 1;
      }
      else if (v5 == 2)
      {
        *(_DWORD *)(a2 + 12) = 2;
      }
      else
      {
        *(_BYTE *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 12) = 3;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 12) = 0;
    }
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_1BF31CE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationProtocol>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_1E78F63A0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (result >= 3)
  {
    *(_BYTE *)(a2 + 8) = 0;
    result = 3;
  }
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxDatagrams::toDict(abm::data::DataAggregationMaxDatagrams *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(1);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationMaxDatagrams", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxDatagrams::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxDatagrams", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(1);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_1E78F63E8;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C3B88380](*a1) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_1BF31D248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_1E78F63E8;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxSize::toDict(abm::data::DataAggregationMaxSize *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(2);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationMaxSize", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxSize::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxSize", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(2);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_1E78F6430;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C3B88380](*a1) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_1BF31D624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_1E78F6430;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataFlowControl::toDict(abm::data::DataFlowControl *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(3);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_BOOL_create(*((_BYTE *)this + 9));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataFlowControl", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataFlowControl::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_BOOL_create(*(_BYTE *)(a1 + 9));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataFlowControl", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(3);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_1E78F6478;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C3B88380](*a1) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(*a1, "kDataFlowControl"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataFlowControl");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_BYTE *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_1BF31DA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataFlowControl>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_1E78F6478;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_BYTE *)(a2 + 9) = (_DWORD)result != 0;
  return result;
}

void abm::data::DataPowerSave::toDict(abm::data::DataPowerSave *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v5) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(4);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_BOOL_create(*((_BYTE *)this + 9));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataPowerSave", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataPowerSave::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_BOOL_create(*(_BYTE *)(a1 + 9));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataPowerSave", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C3B88380](v3) == MEMORY[0x1E0C812F8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(4);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_1E78F64C0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C3B88380](*a1) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(*a1, "kDataPowerSave"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataPowerSave");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_BYTE *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_1BF31DDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataPowerSave>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_1E78F64C0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_BYTE *)(a2 + 9) = (_DWORD)result != 0;
  return result;
}

void ConnectionObserver::ConnectionObserver(ConnectionObserver *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  pthread_mutex_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  NSObject *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 *v23;
  unsigned int *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  __int128 __p;
  uint64_t (*v32)(uint64_t);
  _QWORD **v33;
  _QWORD *v34[4];

  *(_QWORD *)this = off_1E78F6548;
  *(_QWORD *)&__p = MEMORY[0x1E0C809B0];
  *((_QWORD *)&__p + 1) = 0x40000000;
  v32 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v33 = (_QWORD **)&__block_descriptor_tmp_3;
  v34[0] = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v3 = ClientGetLogServer(void)::sLogServer;
    v2 = (std::__shared_weak_count *)unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_5;
  }
  else
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &__p);
    v3 = ClientGetLogServer(void)::sLogServer;
    v2 = (std::__shared_weak_count *)unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_5;
  }
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v5 = __ldxr(p_shared_owners);
  while (__stxr(v5 + 1, p_shared_owners));
LABEL_5:
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *(_QWORD *)this = off_1E78F6688;
  HIBYTE(v32) = 13;
  strcpy((char *)&__p, "conn.observer");
  ctu::LoggerCommonBase::LoggerCommonBase();
  *((_QWORD *)this + 1) = &unk_1E78F5290;
  *((_QWORD *)this + 7) = v3;
  *((_QWORD *)this + 8) = v2;
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  if (SHIBYTE(v32) < 0)
    operator delete((void *)__p);
  *(_QWORD *)this = off_1E78F66C8;
  if (v2)
  {
    v8 = (unint64_t *)&v2->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  *(_QWORD *)this = off_1E78F6548;
  *((_QWORD *)this + 12) = &off_1E78F6708;
  v10 = (uint64_t *)operator new(0x28uLL);
  v11 = (uint64_t *)operator new(0x20uLL);
  *(_QWORD *)&__p = &__p;
  *((_QWORD *)&__p + 1) = &__p;
  v34[0] = 0;
  v34[1] = 0;
  v32 = 0;
  v33 = v34;
  v12 = operator new(0x40uLL);
  boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v12, (uint64_t)&__p);
  boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v11, (uint64_t)v12);
  v13 = operator new(1uLL);
  v11[2] = (uint64_t)v13;
  v11[3] = 0;
  v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  *v14 = off_1E78F67C8;
  v14[2] = v13;
  v11[3] = (uint64_t)v14;
  boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(v10, (uint64_t)v11);
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)&v33, v34[0]);
  if (v32)
  {
    v16 = (__int128 *)*((_QWORD *)&__p + 1);
    v15 = __p;
    v17 = **((_QWORD **)&__p + 1);
    *(_QWORD *)(v17 + 8) = *(_QWORD *)(__p + 8);
    **(_QWORD **)(v15 + 8) = v17;
    v32 = 0;
    if (v16 != &__p)
    {
      do
      {
        v23 = (__int128 *)*((_QWORD *)v16 + 1);
        v24 = (unsigned int *)*((_QWORD *)v16 + 3);
        if (v24)
        {
          v25 = v24 + 2;
          do
          {
            v26 = __ldaxr(v25);
            v27 = v26 - 1;
          }
          while (__stlxr(v27, v25));
          if (!v27)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 16))(v24);
            v28 = v24 + 3;
            do
            {
              v29 = __ldaxr(v28);
              v30 = v29 - 1;
            }
            while (__stlxr(v30, v28));
            if (!v30)
              (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 24))(v24);
          }
        }
        operator delete(v16);
        v16 = v23;
      }
      while (v23 != &__p);
    }
  }
  v10[2] = *(_QWORD *)*v10;
  v18 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v18, 0);
  v10[3] = (uint64_t)v18;
  v10[4] = 0;
  v19 = operator new(0x18uLL);
  v19[1] = 0x100000001;
  *v19 = off_1E78F6828;
  v19[2] = v18;
  v10[4] = (uint64_t)v19;
  *((_QWORD *)this + 13) = v10;
  *((_QWORD *)this + 14) = 0;
  v20 = operator new(0x18uLL);
  v20[1] = 0x100000001;
  *v20 = off_1E78F6888;
  v20[2] = v10;
  *((_QWORD *)this + 14) = v20;
  *((_QWORD *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  *((_QWORD *)this + 17) = dispatch_queue_create("conn.observer", v21);
  ctu::LoggerCommonBase::setLogLevel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, (CFNotificationCallback)ConnectionObserver::handleDaemonReadyNotificationStatic, CFSTR("kAppleBasebandManagerDaemonReady"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_1BF31E1E0(void *a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  __cxa_begin_catch(a1);
  v2 = (unsigned int *)v1[4];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  v9 = (unsigned int *)v1[1];
  if (v9)
  {
    v10 = v9 + 2;
    do
    {
      v11 = __ldaxr(v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, v10));
    if (!v12)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
      v13 = v9 + 3;
      do
      {
        v14 = __ldaxr(v13);
        v15 = v14 - 1;
      }
      while (__stlxr(v15, v13));
      if (!v15)
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
    }
  }
  operator delete(v1);
  __cxa_rethrow();
}

void sub_1BF31E2A0()
{
  __break(1u);
}

void sub_1BF31E3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;

  __cxa_end_catch();
  v20 = (unsigned int *)v18[3];
  if (v20)
  {
    v21 = v20 + 2;
    do
    {
      v22 = __ldaxr(v21);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, v21));
    if (!v23)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v20 + 16))(v20);
      v24 = v20 + 3;
      do
      {
        v25 = __ldaxr(v24);
        v26 = v25 - 1;
      }
      while (__stlxr(v26, v24));
      if (!v26)
        (*(void (**)(unsigned int *))(*(_QWORD *)v20 + 24))(v20);
    }
  }
  boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr((uint64_t)v18);
  boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list((uint64_t *)&__p);
  operator delete(v18);
  operator delete(v17);
  ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(v16);
  _Unwind_Resume(a1);
}

void sub_1BF31E504()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;

  v2 = *(NSObject **)(v0 + 136);
  if (v2)
    dispatch_release(v2);
  v3 = *(NSObject **)(v0 + 120);
  if (v3)
  {
    dispatch_resume(v3);
    v4 = *(NSObject **)(v0 + 120);
    if (v4)
      dispatch_release(v4);
  }
  boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(v1);
  JUMPOUT(0x1BF31E534);
}

void ConnectionObserver::handleDaemonReadyNotificationStatic(ConnectionObserver *this, __CFNotificationCenter *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  os_unfair_lock_s *v6;
  ConnectionObserver *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  os_unfair_lock_s *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21;
  void (*v22)(uint64_t);
  void *v23;
  os_unfair_lock_s *v24;

  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  v6 = (os_unfair_lock_s *)off_1ED02D398;
  if (!off_1ED02D398)
  {
    v7 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v7);
    ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v7, (uint64_t *)&v21);
    v8 = v21;
    v21 = 0uLL;
    v9 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    off_1ED02D398 = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v6 = (os_unfair_lock_s *)off_1ED02D398;
  }
  v15 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
  if (*(&off_1ED02D398 + 1))
  {
    v16 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  *(_QWORD *)&v21 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v21 + 1) = 0x40000000;
  v22 = ___ZN18ConnectionObserver17handleDaemonReadyEv_block_invoke;
  v23 = &__block_descriptor_tmp_5_0;
  v24 = v6;
  v18 = v6 + 22;
  os_unfair_lock_lock(v18);
  ___ZN18ConnectionObserver17handleDaemonReadyEv_block_invoke((uint64_t)&v21);
  os_unfair_lock_unlock(v18);
  if (v15)
  {
    v19 = (unint64_t *)&v15->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_1BF31E6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;
  operator delete(v2);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  _Unwind_Resume(a1);
}

_QWORD *boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_1E78F6708;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = (std::__shared_weak_count *)a1[10];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

{
  std::__shared_weak_count *v2;

  *a1 = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = (std::__shared_weak_count *)a1[10];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void ConnectionObserver::~ConnectionObserver(ConnectionObserver *this)
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  std::__shared_weak_count *v14;

  *(_QWORD *)this = off_1E78F6548;
  v2 = *((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = 0;
  if (v2)
  {
    dispatch_resume(v2);
    dispatch_release(v2);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, this, CFSTR("kAppleBasebandManagerDaemonReady"), 0);
  v4 = *((_QWORD *)this + 17);
  if (v4)
    dispatch_release(v4);
  v5 = *((_QWORD *)this + 15);
  if (v5)
  {
    dispatch_resume(v5);
    v6 = *((_QWORD *)this + 15);
    if (v6)
      dispatch_release(v6);
  }
  *((_QWORD *)this + 12) = &off_1E78F6708;
  v7 = (unsigned int *)*((_QWORD *)this + 14);
  if (v7)
  {
    v8 = v7 + 2;
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
      v11 = v7 + 3;
      do
      {
        v12 = __ldaxr(v11);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, v11));
      if (!v13)
        (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
    }
  }
  *(_QWORD *)this = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v14 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v14)
    std::__shared_weak_count::__release_weak(v14);
}

{
  void *v1;

  ConnectionObserver::~ConnectionObserver(this);
  operator delete(v1);
}

void ConnectionObserver::resume(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  v3 = *(NSObject **)&this[10]._os_unfair_lock_opaque;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1BF308000, v3, OS_LOG_TYPE_DEBUG, "#D Resuming", v5, 2u);
    v4 = *(NSObject **)&this[30]._os_unfair_lock_opaque;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = *(NSObject **)&this[30]._os_unfair_lock_opaque;
  if (v4)
  {
LABEL_3:
    *(_QWORD *)&this[30]._os_unfair_lock_opaque = 0;
    dispatch_resume(v4);
    dispatch_release(v4);
  }
LABEL_4:
  os_unfair_lock_unlock(v2);
}

void ___ZN18ConnectionObserver7suspendEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  ConnectionObserver *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[16];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BF308000, v2, OS_LOG_TYPE_DEBUG, "#D Suspending", buf, 2u);
    v3 = *(_DWORD *)(v1 + 128);
    if (v3)
      goto LABEL_3;
LABEL_26:
    v20 = *(NSObject **)(v1 + 136);
    if (v20)
    {
      dispatch_retain(*(dispatch_object_t *)(v1 + 136));
      dispatch_suspend(v20);
    }
    v21 = *(NSObject **)(v1 + 120);
    *(_QWORD *)(v1 + 120) = v20;
    if (v21)
    {
      dispatch_resume(v21);
      dispatch_release(v21);
    }
    return;
  }
  v3 = *(_DWORD *)(v1 + 128);
  if (!v3)
    goto LABEL_26;
LABEL_3:
  v4 = v3 - 1;
  *(_DWORD *)(v1 + 128) = v3 - 1;
  v5 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_debug_impl(&dword_1BF308000, v5, OS_LOG_TYPE_DEBUG, "#D Extra decreased to %d", buf, 8u);
    if (!*(_DWORD *)(v1 + 128))
      return;
  }
  else if (!v4)
  {
    return;
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  v6 = off_1ED02D398;
  if (!off_1ED02D398)
  {
    v7 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v7);
    ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v7, (uint64_t *)buf);
    v8 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v9 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    off_1ED02D398 = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v6 = off_1ED02D398;
  }
  v15 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
  if (*(&off_1ED02D398 + 1))
  {
    v16 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(*(uint64_t ****)(v6 + 104));
  if (v15)
  {
    v18 = (unint64_t *)&v15->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_1BF31EC10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;
  operator delete(v2);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  _Unwind_Resume(a1);
}

void ___ZN18ConnectionObserver17handleDaemonReadyEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  ConnectionObserver *v4;
  __int128 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  NSObject *v18;
  uint8_t buf[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BF308000, v2, OS_LOG_TYPE_DEBUG, "#D Daemon ready received", buf, 2u);
    if (*(_QWORD *)(v1 + 120))
      goto LABEL_3;
  }
  else if (*(_QWORD *)(v1 + 120))
  {
LABEL_3:
    pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    v3 = off_1ED02D398;
    if (!off_1ED02D398)
    {
      v4 = (ConnectionObserver *)operator new(0x90uLL);
      ConnectionObserver::ConnectionObserver(v4);
      ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v4, (uint64_t *)buf);
      v5 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      v6 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
      off_1ED02D398 = v5;
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v8 = __ldaxr(p_shared_owners);
        while (__stlxr(v8 - 1, p_shared_owners));
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
      v9 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v3 = off_1ED02D398;
    }
    v12 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    if (*(&off_1ED02D398 + 1))
    {
      v13 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(*(uint64_t ****)(v3 + 104));
    if (v12)
    {
      v15 = (unint64_t *)&v12->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    return;
  }
  v17 = *(_DWORD *)(v1 + 128) + 1;
  *(_DWORD *)(v1 + 128) = v17;
  v18 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    _os_log_debug_impl(&dword_1BF308000, v18, OS_LOG_TYPE_DEBUG, "#D Extra increased to %d", buf, 8u);
  }
}

void sub_1BF31EEC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;
  operator delete(v2);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 13;
  strcpy(a1, "conn.observer");
}

uint64_t ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = off_1E78F6688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = (std::__shared_weak_count *)a1[10];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(a1);
}

void boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_1E78F6708;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(a1 + 3), (_QWORD *)a1[4]);
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
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::dispose(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
    operator delete(v1);
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::mutex>::dispose(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
  {
    pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 16));
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(uint64_t ***a1)
{
  __int128 v2;
  pthread_mutex_t *v3;
  uint64_t **v4;
  unsigned int v5;
  uint64_t **v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  __int128 v28;
  uint64_t **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int v47;
  _QWORD v48[4];
  __int128 v49;
  __int128 v50;
  __int128 *v51;
  uint64_t ***v52;
  uint64_t v53;
  uint64_t **v54;
  unsigned int *v55;
  __int128 v56;
  __int128 v57;
  std::runtime_error v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  unint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = 0;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v67 = v2;
  v68 = v2;
  v65 = v2;
  v66 = v2;
  v63 = v2;
  v64 = v2;
  v61 = v2;
  v62 = v2;
  v59 = v2;
  v60 = v2;
  v3 = (pthread_mutex_t *)a1[3];
  *(_QWORD *)&v69 = 10;
  *((_QWORD *)&v69 + 1) = &v59;
  *(_QWORD *)&v70 = 0;
  *((_QWORD *)&v70 + 1) = v3;
  pthread_mutex_lock(v3);
  v4 = a1[1];
  if (!v4)
  {
    v6 = *a1;
    goto LABEL_15;
  }
  v5 = atomic_load((unsigned int *)v4 + 2);
  v6 = *a1;
  if (v5 == 1)
  {
    v7 = (uint64_t)a1[2];
    if ((uint64_t *)v7 == *v6)
    {
      v7 = (*v6)[1];
      *(_QWORD *)&v56 = v7;
      v8 = *v6;
      if (*v6 == (uint64_t *)v7)
      {
LABEL_11:
        a1[2] = (uint64_t **)v7;
        goto LABEL_12;
      }
    }
    else
    {
      *(_QWORD *)&v56 = a1[2];
      v8 = *v6;
      if (*v6 == (uint64_t *)v7)
        goto LABEL_11;
    }
    v9 = *(_QWORD *)(v7 + 16);
    if (*(_BYTE *)(v9 + 24))
    {
      v7 = *(_QWORD *)(v7 + 8);
    }
    else
    {
      v7 = boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(v8, (int *)(v9 + 64), (uint64_t **)&v56);
      v6 = *a1;
    }
    goto LABEL_11;
  }
LABEL_12:
  v4 = a1[1];
  if (v4)
  {
    v10 = (unsigned int *)(v4 + 1);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
LABEL_15:
  v12 = v55;
  v54 = v6;
  v55 = (unsigned int *)v4;
  if (v12)
  {
    v13 = v12 + 2;
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v12 + 16))(v12);
      v16 = v12 + 3;
      do
      {
        v17 = __ldaxr(v16);
        v18 = v17 - 1;
      }
      while (__stlxr(v18, v16));
      if (!v18)
        (*(void (**)(unsigned int *))(*(_QWORD *)v12 + 24))(v12);
    }
  }
  pthread_mutex_unlock(*((pthread_mutex_t **)&v70 + 1));
  v19 = *((_QWORD *)&v69 + 1);
  if (*((_QWORD *)&v69 + 1))
  {
    if ((uint64_t)v70 - 1 >= 0)
    {
      v20 = *((_QWORD *)&v69 + 1) + 16 * v70;
      do
      {
        v21 = *(unsigned int **)(v20 - 8);
        if (v21)
        {
          v22 = v21 + 2;
          do
          {
            v23 = __ldaxr(v22);
            v24 = v23 - 1;
          }
          while (__stlxr(v24, v22));
          if (!v24)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v21 + 16))(v21);
            v25 = v21 + 3;
            do
            {
              v26 = __ldaxr(v25);
              v27 = v26 - 1;
            }
            while (__stlxr(v27, v25));
            if (!v27)
              (*(void (**)(unsigned int *))(*(_QWORD *)v21 + 24))(v21);
          }
        }
        v20 -= 16;
      }
      while (v20 > v19);
    }
    if ((unint64_t)v69 >= 0xB)
      operator delete(*((void **)&v69 + 1));
  }
  *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v78 = v28;
  v73 = v28;
  v74 = 0xAAAAAAAAAAAAAAAALL;
  v71 = v28;
  v72 = v28;
  v69 = v28;
  v70 = v28;
  v67 = v28;
  v68 = v28;
  v65 = v28;
  v66 = v28;
  v63 = v28;
  v64 = v28;
  v61 = v28;
  v62 = v28;
  v59 = v28;
  v60 = v28;
  LOBYTE(v59) = 0;
  v75 = 10;
  v76 = (char *)&v59 + 8;
  *(_QWORD *)((char *)&v78 + 4) = 0;
  v77 = 0;
  v79 = 0;
  v29 = v54;
  v30 = (uint64_t)*v54;
  v51 = &v59;
  v52 = a1;
  v53 = v30;
  *(_QWORD *)&v49 = *(_QWORD *)(v30 + 8);
  *((_QWORD *)&v49 + 1) = v30;
  *(_QWORD *)&v50 = &v59;
  *((_QWORD *)&v50 + 1) = v30;
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v49);
  v48[0] = *v29;
  v48[1] = v48[0];
  v48[2] = &v59;
  v48[3] = v48[0];
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(v48);
  v56 = v49;
  v57 = v50;
  v31 = v48[0];
  v32 = v49;
  if ((_QWORD)v49 == v48[0])
  {
    if (DWORD2(v78) <= DWORD1(v78))
      goto LABEL_57;
LABEL_56:
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections((uint64_t)v52, v53);
    goto LABEL_57;
  }
  v33 = (_BYTE *)v57;
  if (!*(_BYTE *)v57)
  {
    v34 = *(_QWORD *)(*(_QWORD *)(v49 + 16) + 32);
    v35 = *(_QWORD *)(v34 + 24);
    if (!v35)
    {
      std::runtime_error::runtime_error(&v58, "call to empty boost::function");
      v58.__vftable = (std::runtime_error_vtbl *)&unk_1E78F5518;
      boost::throw_exception<boost::bad_function_call>(&v58);
    }
    (*(void (**)(uint64_t))((v35 & 0xFFFFFFFFFFFFFFFELL) + 8))(v34 + 32);
    if (!*v33)
      *v33 = 1;
  }
  *(_QWORD *)&v56 = *(_QWORD *)(v32 + 8);
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v56);
  v36 = (_BYTE *)v57;
  if (*(_BYTE *)v57)
    *(_BYTE *)v57 = 0;
  for (i = v56; (_QWORD)v56 != v31; i = v56)
  {
    v38 = *(_QWORD *)(*(_QWORD *)(i + 16) + 32);
    v39 = *(_QWORD *)(v38 + 24);
    if (!v39)
    {
      std::runtime_error::runtime_error(&v58, "call to empty boost::function");
      v58.__vftable = (std::runtime_error_vtbl *)&unk_1E78F5518;
      boost::throw_exception<boost::bad_function_call>(&v58);
    }
    (*(void (**)(uint64_t))((v39 & 0xFFFFFFFFFFFFFFFELL) + 8))(v38 + 32);
    if (!*v36)
      *v36 = 1;
    *(_QWORD *)&v56 = *(_QWORD *)(i + 8);
    boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v56);
    v36 = (_BYTE *)v57;
    if (*(_BYTE *)v57)
      *(_BYTE *)v57 = 0;
  }
  if (*((_DWORD *)v51 + 70) > *((_DWORD *)v51 + 69))
    goto LABEL_56;
LABEL_57:
  result = boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v59);
  v41 = v55;
  if (v55)
  {
    v42 = v55 + 2;
    do
    {
      v43 = __ldaxr(v42);
      v44 = v43 - 1;
    }
    while (__stlxr(v44, v42));
    if (!v44)
    {
      result = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v41 + 16))(v41);
      v45 = v41 + 3;
      do
      {
        v46 = __ldaxr(v45);
        v47 = v46 - 1;
      }
      while (__stlxr(v47, v45));
      if (!v47)
        return (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v41 + 24))(v41);
    }
  }
  return result;
}

void sub_1BF31F96C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock((uint64_t)&a29);
  JUMPOUT(0x1BF31FAE0);
}

void sub_1BF31F97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,std::runtime_error a27)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  std::runtime_error::~runtime_error(&a27);
  if (a2 != 2)
  {
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(&v29);
    boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v31);
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr((uint64_t)&v30);
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  boost::signals2::detail::connection_body_base::disconnect(*(boost::signals2::detail::connection_body_base **)(a23 + 16));
  __cxa_rethrow();
}

void sub_1BF31F9DC(_Unwind_Exception *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __cxa_end_catch();
  if (a2 != 2)
  {
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(&v4);
    boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v6);
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr((uint64_t)&v5);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1BF31F9ACLL);
}

void sub_1BF31FA14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unint64_t a49,char *__p,uint64_t a51)
{
  char *v51;
  unsigned int *v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int v58;

  if (__p)
  {
    if (a51 - 1 >= 0)
    {
      v51 = &__p[16 * a51];
      do
      {
        v52 = (unsigned int *)*((_QWORD *)v51 - 1);
        if (v52)
        {
          v53 = v52 + 2;
          do
          {
            v54 = __ldaxr(v53);
            v55 = v54 - 1;
          }
          while (__stlxr(v55, v53));
          if (!v55)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 16))(v52);
            v56 = v52 + 3;
            do
            {
              v57 = __ldaxr(v56);
              v58 = v57 - 1;
            }
            while (__stlxr(v58, v56));
            if (!v58)
              (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 24))(v52);
          }
        }
        v51 -= 16;
      }
      while (v51 > __p);
    }
    if (a49 >= 0xB)
      operator delete(__p);
  }
  JUMPOUT(0x1BF31FAE0);
}

void sub_1BF31FABC(void *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  JUMPOUT(0x1BF31FAE8);
}

uint64_t *boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(uint64_t *a1)
{
  if (*(_DWORD *)(*a1 + 280) > *(_DWORD *)(*a1 + 276))
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections(a1[1], a1[2]);
  return a1;
}

void boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unsigned int *v27;
  unsigned int i;
  unsigned int v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned int v42;
  uint64_t v43;
  _QWORD *v44;
  int v45;
  int v46;
  uint64_t v47;
  unsigned int *v48;
  unsigned int v49;
  uint64_t v50;
  int *v51;
  char v52;
  unsigned int *v53;
  unsigned int *v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int v59;
  _QWORD *v60;
  uint64_t v61;
  unsigned int *v62;
  unsigned int v63;
  uint64_t v64;
  int v66;
  uint64_t v67;
  _DWORD *v68;
  _DWORD *v69;
  unint64_t v70;
  unint64_t v71;
  unsigned int *v72;
  unsigned int *v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int *v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  _DWORD *v84;
  unint64_t v85;
  unint64_t v86;
  unsigned int *v87;
  unsigned int *v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int *v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
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
  _QWORD v107[6];

  v107[3] = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  if (*a1 == a1[3])
    return;
  if (v1 == a1[1])
  {
LABEL_126:
    v80 = a1[3];
    if (v80 != v1)
    {
      *(_QWORD *)&v81 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v81 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v103 = v81;
      v104 = v81;
      v101 = v81;
      v102 = v81;
      v99 = v81;
      v100 = v81;
      v97 = v81;
      v98 = v81;
      v95 = v81;
      v96 = v81;
      v82 = *(_QWORD *)(v80 + 16);
      *(_QWORD *)&v105 = 10;
      *((_QWORD *)&v105 + 1) = &v95;
      *(_QWORD *)&v106 = 0;
      *((_QWORD *)&v106 + 1) = v82;
      (*(void (**)(uint64_t))(*(_QWORD *)v82 + 24))(v82);
      v83 = a1[2];
      a1[3] = a1[1];
      v84 = *(_DWORD **)(v83 + 288);
      if (v84)
        boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v84, &v95);
      *(_QWORD *)(v83 + 288) = 0;
      (*(void (**)(_QWORD))(**((_QWORD **)&v106 + 1) + 32))(*((_QWORD *)&v106 + 1));
      v85 = *((_QWORD *)&v105 + 1);
      if (*((_QWORD *)&v105 + 1))
      {
        if ((uint64_t)v106 - 1 >= 0)
        {
          v86 = *((_QWORD *)&v105 + 1) + 16 * v106;
          do
          {
            v87 = *(unsigned int **)(v86 - 8);
            if (v87)
            {
              v88 = v87 + 2;
              do
              {
                v89 = __ldaxr(v88);
                v90 = v89 - 1;
              }
              while (__stlxr(v90, v88));
              if (!v90)
              {
                (*(void (**)(unsigned int *))(*(_QWORD *)v87 + 16))(v87);
                v91 = v87 + 3;
                do
                {
                  v92 = __ldaxr(v91);
                  v93 = v92 - 1;
                }
                while (__stlxr(v93, v91));
                if (!v93)
                  (*(void (**)(unsigned int *))(*(_QWORD *)v87 + 24))(v87);
              }
            }
            v86 -= 16;
          }
          while (v86 > v85);
        }
        if ((unint64_t)v105 >= 0xB)
          operator delete(*((void **)&v105 + 1));
      }
    }
    return;
  }
  while (1)
  {
    v3 = a1[2];
    v4 = *(_QWORD *)(v3 + 264);
    if (v4)
    {
      if (v4 - 1 < 0)
      {
        v17 = *(_QWORD *)(v3 + 264);
      }
      else
      {
        v5 = *(_QWORD *)(v3 + 256);
        v6 = v5 + 24 * v4;
        v7 = v6;
        do
        {
          v8 = *(_DWORD *)(v7 - 24);
          v7 -= 24;
          if (v8 == v8 >> 31)
          {
            v9 = *(unsigned int **)(v6 - 8);
            if (v9)
            {
              v10 = v9 + 2;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
              {
                (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
                v13 = v9 + 3;
                do
                {
                  v14 = __ldaxr(v13);
                  v15 = v14 - 1;
                }
                while (__stlxr(v15, v13));
                if (!v15)
                  (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
              }
            }
          }
          else
          {
            v16 = *(_QWORD *)(v6 - 16);
            if (v16)
              (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
          }
          v6 = v7;
        }
        while (v7 > v5);
        v17 = *(_QWORD *)(v3 + 264);
        v1 = *a1;
      }
      *(_QWORD *)(v3 + 264) = v17 - v4;
    }
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v105 = v18;
    v106 = v18;
    v103 = v18;
    v104 = v18;
    v101 = v18;
    v102 = v18;
    v99 = v18;
    v100 = v18;
    v97 = v18;
    v98 = v18;
    v95 = v18;
    v96 = v18;
    v19 = *(_QWORD *)(v1 + 16);
    *(_QWORD *)&v105 = 10;
    *((_QWORD *)&v105 + 1) = &v95;
    *(_QWORD *)&v106 = 0;
    *((_QWORD *)&v106 + 1) = v19;
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
    v20 = *a1;
    v21 = *(_QWORD *)(*a1 + 16);
    v22 = a1[2];
    v23 = *(uint64_t **)(v21 + 32);
    if (v23)
    {
      v24 = *v23;
      if (*v23 != v23[1])
      {
        while (1)
        {
          memset(v107, 170, 24);
          v25 = *(_DWORD *)v24 ^ (*(int *)v24 >> 31);
          if (v25 == 2)
          {
            (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(v24 + 8) + 16))(&v94);
            v107[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v94 + 16))(v94);
            LODWORD(v107[0]) = 1;
            if (v94)
            {
              (*(void (**)(uint64_t))(*(_QWORD *)v94 + 8))(v94);
              if ((*(_DWORD *)v24 ^ (*(int *)v24 >> 31)) == 2)
                goto LABEL_68;
LABEL_39:
              v30 = *(_QWORD *)(v24 + 16);
              if (!v30)
                goto LABEL_69;
              if (!atomic_load((unsigned int *)(v30 + 8)))
                goto LABEL_69;
              goto LABEL_41;
            }
LABEL_38:
            if ((*(_DWORD *)v24 ^ (*(int *)v24 >> 31)) == 2)
              goto LABEL_68;
            goto LABEL_39;
          }
          if (v25 != 1)
          {
            LODWORD(v107[0]) = 0;
            v107[1] = 0;
            v107[2] = 0;
            goto LABEL_38;
          }
          v26 = *(_QWORD *)(v24 + 16);
          if (!v26)
          {
LABEL_67:
            v107[1] = 0;
            v107[2] = v26;
            LODWORD(v107[0]) = 0;
            if ((*(_DWORD *)v24 ^ (*(int *)v24 >> 31)) == 2)
              goto LABEL_68;
            goto LABEL_39;
          }
          v27 = (unsigned int *)(v26 + 8);
          for (i = *(_DWORD *)(v26 + 8); ; i = v29)
          {
            if (!i)
            {
              v26 = 0;
              goto LABEL_67;
            }
            v29 = __ldxr(v27);
            if (v29 != i)
            {
              __clrex();
              continue;
            }
            if (!__stxr(i + 1, v27))
              break;
          }
          v107[1] = *(_QWORD *)(v24 + 8);
          v107[2] = v26;
          LODWORD(v107[0]) = 0;
          if ((*(_DWORD *)v24 ^ (*(int *)v24 >> 31)) != 2)
            goto LABEL_39;
LABEL_68:
          if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(v24 + 8) + 24))(*(_QWORD *)(v24 + 8)))
          {
LABEL_69:
            if (*(_BYTE *)(v21 + 24))
            {
              *(_BYTE *)(v21 + 24) = 0;
              boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>((_DWORD *)v21, &v95);
            }
            v52 = 1;
            if (LODWORD(v107[0]) == SLODWORD(v107[0]) >> 31)
              goto LABEL_72;
LABEL_89:
            if (v107[1])
              (*(void (**)(_QWORD))(*(_QWORD *)v107[1] + 8))(v107[1]);
            goto LABEL_91;
          }
LABEL_41:
          v32 = *(_QWORD *)(v22 + 264);
          if (v32 == *(_QWORD *)(v22 + 248))
          {
            if (v32 == -1)
            {
              v34 = *(_QWORD **)(v22 + 256);
              v50 = -1;
            }
            else
            {
              if (4 * v32 <= (unint64_t)(v32 + 1))
                v33 = v32 + 1;
              else
                v33 = 4 * v32;
              v34 = (_QWORD *)(v22 + 8);
              if (v33 >= 0xB)
              {
                if (v33 >= 0xAAAAAAAAAAAAAABLL)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v34 = operator new(24 * v33);
              }
              if (v32)
              {
                v35 = *(_QWORD *)(v22 + 256);
                v36 = v35 + 24 * v32;
                v37 = v34;
                do
                {
                  v39 = *(_QWORD *)(v35 + 8);
                  if (*(_DWORD *)v35 == *(int *)v35 >> 31)
                  {
                    v37[1] = v39;
                    v40 = *(_QWORD *)(v35 + 16);
                    v37[2] = v40;
                    if (v40)
                    {
                      v41 = (unsigned int *)(v40 + 8);
                      do
                        v42 = __ldxr(v41);
                      while (__stxr(v42 + 1, v41));
                    }
                  }
                  else
                  {
                    v37[1] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v39 + 16))(v39);
                  }
                  v38 = *(_DWORD *)v35;
                  v35 += 24;
                  *(_DWORD *)v37 = v38 ^ (v38 >> 31);
                  v37 += 3;
                }
                while (v35 != v36);
              }
              boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy((_QWORD *)(v22 + 8));
              *(_QWORD *)(v22 + 248) = v33;
              *(_QWORD *)(v22 + 256) = v34;
              v50 = *(_QWORD *)(v22 + 264);
            }
            v60 = &v34[3 * v50 + 1];
            v45 = v107[0];
            v46 = SLODWORD(v107[0]) >> 31;
            if (SLODWORD(v107[0]) >> 31 == LODWORD(v107[0]))
            {
              *v60 = v107[1];
              v61 = v107[2];
              v34[3 * v50 + 2] = v107[2];
              if (v61)
              {
                v62 = (unsigned int *)(v61 + 8);
                do
                  v63 = __ldxr(v62);
                while (__stxr(v63 + 1, v62));
              }
            }
            else
            {
              *v60 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v107[1] + 16))(v107[1]);
            }
            v51 = (int *)&v34[3 * v50];
          }
          else
          {
            v43 = *(_QWORD *)(v22 + 256);
            v44 = (_QWORD *)(v43 + 24 * v32 + 8);
            v45 = v107[0];
            v46 = SLODWORD(v107[0]) >> 31;
            if (SLODWORD(v107[0]) >> 31 == LODWORD(v107[0]))
            {
              *v44 = v107[1];
              v47 = v107[2];
              *(_QWORD *)(v43 + 24 * v32 + 16) = v107[2];
              if (v47)
              {
                v48 = (unsigned int *)(v47 + 8);
                do
                  v49 = __ldxr(v48);
                while (__stxr(v49 + 1, v48));
              }
            }
            else
            {
              *v44 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v107[1] + 16))(v107[1]);
            }
            v51 = (int *)(v43 + 24 * v32);
          }
          v52 = 0;
          *v51 = v45 ^ v46;
          ++*(_QWORD *)(v22 + 264);
          if (LODWORD(v107[0]) != SLODWORD(v107[0]) >> 31)
            goto LABEL_89;
LABEL_72:
          v53 = (unsigned int *)v107[2];
          if (v107[2])
          {
            v54 = (unsigned int *)(v107[2] + 8);
            do
            {
              v55 = __ldaxr(v54);
              v56 = v55 - 1;
            }
            while (__stlxr(v56, v54));
            if (!v56)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v53 + 16))(v53);
              v57 = v53 + 3;
              do
              {
                v58 = __ldaxr(v57);
                v59 = v58 - 1;
              }
              while (__stlxr(v59, v57));
              if (!v59)
                (*(void (**)(unsigned int *))(*(_QWORD *)v53 + 24))(v53);
            }
          }
LABEL_91:
          if ((v52 & 1) == 0)
          {
            v24 += 24;
            if (v24 != *(_QWORD *)(*(_QWORD *)(v21 + 32) + 8))
              continue;
          }
          v20 = *a1;
          v21 = *(_QWORD *)(*a1 + 16);
          v22 = a1[2];
          break;
        }
      }
    }
    if (*(_BYTE *)(v21 + 24))
    {
      ++*(_DWORD *)(v22 + 276);
      v64 = *(_QWORD *)(v21 + 16);
      if (v64)
      {
        if (atomic_load((unsigned int *)(v64 + 8)))
        {
          v66 = 1;
          goto LABEL_108;
        }
        v22 = a1[2];
        v20 = *a1;
      }
      a1[3] = v20;
      if (a1[1] == v20)
      {
        v69 = *(_DWORD **)(v22 + 288);
        if (v69)
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v69, &v95);
        v66 = 0;
        *(_QWORD *)(v22 + 288) = 0;
      }
      else
      {
        v67 = *(_QWORD *)(v20 + 16);
        v68 = *(_DWORD **)(v22 + 288);
        if (v68)
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v68, &v95);
        *(_QWORD *)(v22 + 288) = v67;
        v66 = 0;
        if (v67)
          ++*(_DWORD *)(v67 + 28);
      }
    }
    else
    {
      ++*(_DWORD *)(v22 + 280);
      v66 = 1;
    }
LABEL_108:
    (*(void (**)(_QWORD))(**((_QWORD **)&v106 + 1) + 32))(*((_QWORD *)&v106 + 1));
    v70 = *((_QWORD *)&v105 + 1);
    if (*((_QWORD *)&v105 + 1))
    {
      if ((uint64_t)v106 - 1 >= 0)
      {
        v71 = *((_QWORD *)&v105 + 1) + 16 * v106;
        do
        {
          v72 = *(unsigned int **)(v71 - 8);
          if (v72)
          {
            v73 = v72 + 2;
            do
            {
              v74 = __ldaxr(v73);
              v75 = v74 - 1;
            }
            while (__stlxr(v75, v73));
            if (!v75)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v72 + 16))(v72);
              v76 = v72 + 3;
              do
              {
                v77 = __ldaxr(v76);
                v78 = v77 - 1;
              }
              while (__stlxr(v78, v76));
              if (!v78)
                (*(void (**)(unsigned int *))(*(_QWORD *)v72 + 24))(v72);
            }
          }
          v71 -= 16;
        }
        while (v71 > v70);
      }
      if ((unint64_t)v105 >= 0xB)
        operator delete(*((void **)&v105 + 1));
    }
    v1 = *a1;
    v79 = a1[1];
    if (!v66)
      break;
    v1 = *(_QWORD *)(v1 + 8);
    *a1 = v1;
    if (v1 == v79)
    {
      v1 = v79;
      goto LABEL_126;
    }
  }
  if (v1 == v79)
    goto LABEL_126;
}

void sub_1BF32037C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF320394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,unint64_t a33,char *__p,uint64_t a35)
{
  char *v36;
  unsigned int *v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int v43;

  if (__p)
  {
    if (a35 - 1 >= 0)
    {
      v36 = &__p[16 * a35];
      do
      {
        v37 = (unsigned int *)*((_QWORD *)v36 - 1);
        if (v37)
        {
          v38 = v37 + 2;
          do
          {
            v39 = __ldaxr(v38);
            v40 = v39 - 1;
          }
          while (__stlxr(v40, v38));
          if (!v40)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 16))(v37);
            v41 = v37 + 3;
            do
            {
              v42 = __ldaxr(v41);
              v43 = v42 - 1;
            }
            while (__stlxr(v43, v41));
            if (!v43)
              (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 24))(v37);
          }
        }
        v36 -= 16;
      }
      while (v36 > __p);
    }
    if (a33 >= 0xB)
    {
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  JUMPOUT(0x1BF320630);
}

void sub_1BF3204F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  if (a5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a5 + 8))(a5);
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1BF32053CLL);
}

void sub_1BF320518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF320530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>::~variant(v5 - 128);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF320554(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  if (a2)
  {
    __cxa_begin_catch(a1);
    if (v3 != v2)
    {
      v4 = v2;
      do
      {
        if (*(_DWORD *)v4 == *(int *)v4 >> 31)
        {
          v5 = *(unsigned int **)(v4 + 16);
          if (v5)
          {
            v6 = v5 + 2;
            do
            {
              v7 = __ldaxr(v6);
              v8 = v7 - 1;
            }
            while (__stlxr(v8, v6));
            if (!v8)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
              v9 = v5 + 3;
              do
              {
                v10 = __ldaxr(v9);
                v11 = v10 - 1;
              }
              while (__stlxr(v11, v9));
              if (!v11)
                (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 24))(v5);
            }
          }
        }
        else
        {
          v12 = *(_QWORD *)(v4 + 8);
          if (v12)
            (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
        }
        v4 += 24;
      }
      while (v4 != v3);
    }
    __cxa_rethrow();
  }
  JUMPOUT(0x1BF320630);
}

void sub_1BF32060C()
{
  void *v0;
  unint64_t v1;

  __cxa_end_catch();
  if (v1 >= 0xB)
    operator delete(v0);
  JUMPOUT(0x1BF320534);
}

void sub_1BF320628(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;

  v1 = a1[31];
  if (v1)
  {
    v3 = a1[32];
    if (v3 - 1 >= 0)
    {
      v4 = v1 + 24 * v3;
      v5 = v4;
      do
      {
        v6 = *(_DWORD *)(v5 - 24);
        v5 -= 24;
        if (v6 == v6 >> 31)
        {
          v7 = *(unsigned int **)(v4 - 8);
          if (v7)
          {
            v8 = v7 + 2;
            do
            {
              v9 = __ldaxr(v8);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v8));
            if (!v10)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
              v11 = v7 + 3;
              do
              {
                v12 = __ldaxr(v11);
                v13 = v12 - 1;
              }
              while (__stlxr(v13, v11));
              if (!v13)
                (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
            }
          }
        }
        else
        {
          v14 = *(_QWORD *)(v4 - 16);
          if (v14)
            (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
        }
        v4 = v5;
      }
      while (v5 > v1);
    }
    if (a1[30] >= 0xBuLL)
      operator delete((void *)a1[31]);
  }
}

void boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  pthread_mutex_t *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t *v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t **v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;
  __int128 v36;
  _OWORD v37[10];
  unint64_t v38;
  void *__p;
  uint64_t v40;
  pthread_mutex_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37[8] = v4;
  v37[9] = v4;
  v37[6] = v4;
  v37[7] = v4;
  v37[4] = v4;
  v37[5] = v4;
  v37[2] = v4;
  v37[3] = v4;
  v37[0] = v4;
  v37[1] = v4;
  v5 = *(pthread_mutex_t **)(a1 + 24);
  v38 = 10;
  __p = v37;
  v40 = 0;
  v41 = v5;
  pthread_mutex_lock(v5);
  if (**(_QWORD **)a1 == a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (!v6 || (v7 = atomic_load((unsigned int *)(v6 + 8)), v7 != 1))
    {
      v8 = (uint64_t *)operator new(0x20uLL);
      v9 = *(uint64_t **)a1;
      v10 = **(_QWORD **)a1;
      v11 = operator new(0x40uLL);
      boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v11, v10);
      boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v8, (uint64_t)v11);
      v8[2] = v9[2];
      v12 = v9[3];
      v8[3] = v12;
      if (v12)
      {
        v13 = (unsigned int *)(v12 + 8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>((uint64_t *)&v36, (uint64_t)v8);
      v15 = *(uint64_t **)a1;
      v16 = *(unsigned int **)(a1 + 8);
      *(_OWORD *)a1 = v36;
      *(_QWORD *)&v36 = v15;
      *((_QWORD *)&v36 + 1) = v16;
      if (v16)
      {
        v17 = v16 + 2;
        do
        {
          v18 = __ldaxr(v17);
          v19 = v18 - 1;
        }
        while (__stlxr(v19, v17));
        if (!v19)
        {
          (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 16))(v16);
          v20 = v16 + 3;
          do
          {
            v21 = __ldaxr(v20);
            v22 = v21 - 1;
          }
          while (__stlxr(v22, v20));
          if (!v22)
            (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 24))(v16);
        }
      }
    }
    v23 = *(uint64_t ***)a1;
    v24 = **(uint64_t ***)a1;
    v25 = v24[1];
    *(_QWORD *)&v36 = v25;
    if (v24 != (uint64_t *)v25)
    {
      do
      {
        while (1)
        {
          v26 = *(_QWORD *)(v25 + 16);
          if (!*(_BYTE *)(v26 + 24))
            break;
          v25 = *(_QWORD *)(v25 + 8);
          *(_QWORD *)&v36 = v25;
          v24 = *v23;
          if ((uint64_t *)v25 == *v23)
            goto LABEL_20;
        }
        v25 = boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(v24, (int *)(v26 + 64), (uint64_t **)&v36);
        v23 = *(uint64_t ***)a1;
        *(_QWORD *)&v36 = v25;
        v24 = *v23;
      }
      while ((uint64_t *)v25 != *v23);
    }
LABEL_20:
    *(_QWORD *)(a1 + 16) = v25;
  }
  pthread_mutex_unlock(v41);
  v27 = (char *)__p;
  if (__p)
  {
    if (v40 - 1 >= 0)
    {
      v28 = (char *)__p + 16 * v40;
      do
      {
        v29 = (unsigned int *)*((_QWORD *)v28 - 1);
        if (v29)
        {
          v30 = v29 + 2;
          do
          {
            v31 = __ldaxr(v30);
            v32 = v31 - 1;
          }
          while (__stlxr(v32, v30));
          if (!v32)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v29 + 16))(v29);
            v33 = v29 + 3;
            do
            {
              v34 = __ldaxr(v33);
              v35 = v34 - 1;
            }
            while (__stlxr(v35, v33));
            if (!v35)
              (*(void (**)(unsigned int *))(*(_QWORD *)v29 + 24))(v29);
          }
        }
        v28 -= 16;
      }
      while (v28 > v27);
    }
    if (v38 >= 0xB)
      operator delete(__p);
  }
}

void sub_1BF3209C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  char *v4;
  char *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  _OWORD v14[10];
  unint64_t v15;
  void *__p;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 288);
  if (v2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v14[8] = v3;
    v14[9] = v3;
    v14[6] = v3;
    v14[7] = v3;
    v14[4] = v3;
    v14[5] = v3;
    v14[2] = v3;
    v14[3] = v3;
    v14[0] = v3;
    v14[1] = v3;
    v15 = 10;
    __p = v14;
    v17 = 0;
    v18 = v2;
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(*(_DWORD **)(a1 + 288), v14);
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 32))(v18);
    v4 = (char *)__p;
    if (__p)
    {
      if (v17 - 1 >= 0)
      {
        v5 = (char *)__p + 16 * v17;
        do
        {
          v6 = (unsigned int *)*((_QWORD *)v5 - 1);
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          v5 -= 16;
        }
        while (v5 > v4);
      }
      if (v15 >= 0xB)
        operator delete(__p);
    }
  }
  boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy((_QWORD *)(a1 + 8));
  if (*(_BYTE *)a1)
    *(_BYTE *)a1 = 0;
  return a1;
}

void sub_1BF320C2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t __cxx_global_var_init_6()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1BF308000);
  }
  return result;
}

void BudgetData::BudgetData(BudgetData *this)
{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
}

{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
}

void BudgetData::~BudgetData(BudgetData *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((_QWORD **)this + 1));
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 2) = 0;
  *v2 = 0;
}

{
  _QWORD *v2;

  v2 = (_QWORD *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((_QWORD **)this + 1));
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 2) = 0;
  *v2 = 0;
}

void BudgetData::BudgetData(BudgetData *this, const BudgetData *a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  if (this != a2)
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>((uint64_t **)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  if (this != a2)
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>((uint64_t **)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

void sub_1BF320E0C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_1BF320E68(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

_QWORD *BudgetData::BudgetData(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = result + 1;
  v2 = result[1];
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = 0;
  if (result[2])
    v3 = (_QWORD *)(result[1] + 16);
  else
    v3 = result;
  *v3 = result + 1;
  *(_QWORD *)a2 = a2 + 8;
  return result;
}

{
  uint64_t v2;
  _QWORD *v3;

  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = result + 1;
  v2 = result[1];
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = 0;
  if (result[2])
    v3 = (_QWORD *)(result[1] + 16);
  else
    v3 = result;
  *v3 = result + 1;
  *(_QWORD *)a2 = a2 + 8;
  return result;
}

uint64_t **BudgetData::operator=(uint64_t **a1, uint64_t **a2)
{
  if (a2 != a1)
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>(a1, *a2, a2 + 1);
  return a1;
}

uint64_t BudgetData::get(uint64_t **a1, unsigned int a2)
{
  char v2;
  unsigned __int8 *v4;
  uint64_t **v5;
  _QWORD *v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t *v10;

  v2 = a2;
  v5 = a1 + 1;
  v4 = (unsigned __int8 *)a1[1];
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v6 = v4;
        v7 = v4[28];
        if (v7 <= a2)
          break;
        v4 = (unsigned __int8 *)*v6;
        v5 = (uint64_t **)v6;
        if (!*v6)
          goto LABEL_8;
      }
      if (v7 >= a2)
        break;
      v4 = (unsigned __int8 *)v6[1];
      if (!v4)
      {
        v5 = (uint64_t **)(v6 + 1);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v6 = a1 + 1;
LABEL_8:
    v8 = v6;
    v6 = operator new(0x28uLL);
    *((_BYTE *)v6 + 28) = v2;
    *((_BYTE *)v6 + 32) = 0;
    *((_BYTE *)v6 + 36) = 0;
    *v6 = 0;
    v6[1] = 0;
    v6[2] = v8;
    *v5 = v6;
    v9 = (uint64_t *)**a1;
    v10 = v6;
    if (v9)
    {
      *a1 = v9;
      v10 = *v5;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v10);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6[4];
}

uint64_t *BudgetData::set(uint64_t *result, unsigned int a2, int a3)
{
  char v4;
  uint64_t *v5;
  unsigned __int8 *v6;
  uint64_t **v7;
  _QWORD *v8;
  unsigned int v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;

  v4 = a2;
  v5 = result;
  v7 = (uint64_t **)(result + 1);
  v6 = (unsigned __int8 *)result[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v8 = v6;
        v9 = v6[28];
        if (v9 <= a2)
          break;
        v6 = (unsigned __int8 *)*v8;
        v7 = (uint64_t **)v8;
        if (!*v8)
          goto LABEL_8;
      }
      if (v9 >= a2)
        break;
      v6 = (unsigned __int8 *)v8[1];
      if (!v6)
      {
        v7 = (uint64_t **)(v8 + 1);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v8 = result + 1;
LABEL_8:
    v10 = v8;
    v8 = operator new(0x28uLL);
    *((_BYTE *)v8 + 28) = v4;
    *((_BYTE *)v8 + 32) = 0;
    *((_BYTE *)v8 + 36) = 0;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = v10;
    *v7 = v8;
    v11 = *(_QWORD *)*v5;
    v12 = v8;
    if (v11)
    {
      *v5 = v11;
      v12 = *v7;
    }
    result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v12);
    ++v5[2];
  }
  *((_DWORD *)v8 + 8) = a3;
  *((_BYTE *)v8 + 36) = 1;
  return result;
}

void BudgetData::clear(BudgetData *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((_QWORD **)this + 1));
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 2) = 0;
  *v2 = 0;
}

_QWORD *BudgetData::for_each(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  v2 = result + 1;
  v3 = (_QWORD *)*result;
  if ((_QWORD *)*result != result + 1)
  {
    do
    {
      v5 = *(_QWORD *)(a2 + 24);
      if (!v5)
        std::__throw_bad_function_call[abi:ne180100]();
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v5 + 48))(v5, (uint64_t)v3 + 28, v3 + 4);
      if (!(_DWORD)result)
        break;
      v6 = (_QWORD *)v3[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v3[2];
          v8 = *v7 == (_QWORD)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != v2);
  }
  return result;
}

void std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>(uint64_t **a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  _QWORD *v13;
  unsigned int v14;
  int v15;
  uint64_t *v16;
  uint64_t **v17;
  uint64_t **v18;
  uint64_t *v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *i;
  uint64_t ***v25;
  uint64_t *v26;
  uint64_t *v27;
  int v28;
  uint64_t **v29;
  uint64_t **v30;
  uint64_t **v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t *v35;

  v4 = a2;
  if (a1[2])
  {
    v6 = (uint64_t **)*a1;
    v8 = a1 + 1;
    v7 = a1[1];
    *a1 = (uint64_t *)(a1 + 1);
    v7[2] = 0;
    a1[2] = 0;
    a1[1] = 0;
    v9 = v6[1] ? v6[1] : (uint64_t *)v6;
    if (v9)
    {
      v10 = (uint64_t *)v9[2];
      if (v10)
      {
        v11 = (uint64_t *)*v10;
        if ((uint64_t *)*v10 == v9)
        {
          *v10 = 0;
          while (1)
          {
            v35 = (_QWORD *)v10[1];
            if (!v35)
              break;
            do
            {
              v10 = v35;
              v35 = (_QWORD *)*v35;
            }
            while (v35);
          }
        }
        else
        {
          for (v10[1] = 0; v11; v11 = (uint64_t *)v10[1])
          {
            do
            {
              v10 = v11;
              v11 = (uint64_t *)*v11;
            }
            while (v11);
          }
        }
      }
      if (a2 != a3)
      {
        v12 = v9;
        v13 = v4;
        while (1)
        {
          v9 = v10;
          v14 = *((unsigned __int8 *)v13 + 28);
          *((_BYTE *)v12 + 28) = v14;
          v15 = *((_DWORD *)v13 + 8);
          *((_BYTE *)v12 + 36) = *((_BYTE *)v13 + 36);
          *((_DWORD *)v12 + 8) = v15;
          v16 = *v8;
          v17 = a1 + 1;
          v18 = a1 + 1;
          if (*v8)
            break;
LABEL_14:
          *v12 = 0;
          v12[1] = 0;
          v12[2] = (uint64_t)v17;
          *v18 = v12;
          v19 = (uint64_t *)**a1;
          if (v19)
            goto LABEL_15;
LABEL_16:
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
          a1[2] = (uint64_t *)((char *)a1[2] + 1);
          if (v10)
          {
            v10 = (uint64_t *)v10[2];
            if (v10)
            {
              v22 = (_QWORD *)*v10;
              if ((uint64_t *)*v10 == v9)
              {
                *v10 = 0;
                while (1)
                {
                  v23 = (_QWORD *)v10[1];
                  if (!v23)
                    break;
                  do
                  {
                    v10 = v23;
                    v23 = (_QWORD *)*v23;
                  }
                  while (v23);
                }
              }
              else
              {
                for (v10[1] = 0; v22; v22 = (_QWORD *)v10[1])
                {
                  do
                  {
                    v10 = v22;
                    v22 = (_QWORD *)*v22;
                  }
                  while (v22);
                }
              }
            }
          }
          else
          {
            v10 = 0;
          }
          v20 = (_QWORD *)v13[1];
          if (v20)
          {
            do
            {
              v4 = v20;
              v20 = (_QWORD *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              v4 = (_QWORD *)v13[2];
              v21 = *v4 == (_QWORD)v13;
              v13 = v4;
            }
            while (!v21);
          }
          if (v9)
          {
            v12 = v9;
            v13 = v4;
            if (v4 != a3)
              continue;
          }
          goto LABEL_42;
        }
        do
        {
          while (1)
          {
            v17 = v16;
            if (v14 >= *((unsigned __int8 *)v16 + 28))
              break;
            v16 = (uint64_t *)*v16;
            v18 = (uint64_t **)v17;
            if (!*v17)
              goto LABEL_14;
          }
          v16 = (uint64_t *)v16[1];
        }
        while (v16);
        v18 = (uint64_t **)(v17 + 1);
        *v12 = 0;
        v12[1] = 0;
        v12[2] = (uint64_t)v17;
        v17[1] = v12;
        v19 = (uint64_t *)**a1;
        if (!v19)
          goto LABEL_16;
LABEL_15:
        *a1 = v19;
        v12 = *v18;
        goto LABEL_16;
      }
LABEL_42:
      std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(v9);
      if (v10)
      {
        for (i = (_QWORD *)v10[2]; i; i = (_QWORD *)i[2])
          v10 = i;
        std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(v10);
      }
    }
  }
  if (v4 != a3)
  {
    v25 = (uint64_t ***)(a1 + 1);
    while (1)
    {
      v26 = (uint64_t *)operator new(0x28uLL);
      v27 = v26;
      v28 = *((_DWORD *)v4 + 9);
      *(uint64_t *)((char *)v26 + 28) = *(_QWORD *)((char *)v4 + 28);
      *((_DWORD *)v26 + 9) = v28;
      v29 = *v25;
      v30 = a1 + 1;
      v31 = a1 + 1;
      if (*v25)
        break;
LABEL_54:
      *v26 = 0;
      v26[1] = 0;
      v26[2] = (uint64_t)v30;
      *v31 = v26;
      v32 = (uint64_t *)**a1;
      if (v32)
        goto LABEL_55;
LABEL_56:
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v27);
      a1[2] = (uint64_t *)((char *)a1[2] + 1);
      v33 = (_QWORD *)v4[1];
      if (v33)
      {
        do
        {
          v34 = v33;
          v33 = (_QWORD *)*v33;
        }
        while (v33);
      }
      else
      {
        do
        {
          v34 = (_QWORD *)v4[2];
          v21 = *v34 == (_QWORD)v4;
          v4 = v34;
        }
        while (!v21);
      }
      v4 = v34;
      if (v34 == a3)
        return;
    }
    do
    {
      while (1)
      {
        v30 = v29;
        if (*((unsigned __int8 *)v26 + 28) >= *((unsigned __int8 *)v29 + 28))
          break;
        v29 = (uint64_t **)*v29;
        v31 = v30;
        if (!*v30)
          goto LABEL_54;
      }
      v29 = (uint64_t **)v29[1];
    }
    while (v29);
    v31 = v30 + 1;
    *v26 = 0;
    v26[1] = 0;
    v26[2] = (uint64_t)v30;
    v30[1] = v26;
    v32 = (uint64_t *)**a1;
    if (!v32)
      goto LABEL_56;
LABEL_55:
    *a1 = v32;
    v27 = *v31;
    goto LABEL_56;
  }
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  void *v1;

  std::exception::~exception(this);
  operator delete(v1);
}

char *ABMGetRootVersionString@<X0>(uint64_t a1@<X8>)
{
  char *result;

  result = (char *)operator new(0x28uLL);
  *(_QWORD *)a1 = result;
  *(_OWORD *)(a1 + 8) = xmmword_1BF3335B0;
  strcpy(result, "AppleBasebandServices_Manager-1180");
  return result;
}

uint64_t abm::asString@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a2 + 16) = 0xAAAAAAAAAAAAAAAALL;
  *(_BYTE *)(a2 + 23) = 7;
  strcpy((char *)a2, "Invalid");
  if (result <= 2)
  {
    *(_BYTE *)(a2 + 23) = 4;
    *(_DWORD *)a2 = ((_DWORD)result << 16) + 1378894420;
    *(_BYTE *)(a2 + 4) = 0;
  }
  return result;
}

{
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a2 + 16) = 0xAAAAAAAAAAAAAAAALL;
  *(_BYTE *)(a2 + 23) = 7;
  strcpy((char *)a2, "Invalid");
  switch((int)result)
  {
    case 0:
      *(_BYTE *)(a2 + 23) = 8;
      strcpy((char *)a2, "1000msec");
      break;
    case 1:
      *(_DWORD *)(a2 + 3) = 1667593069;
      *(_DWORD *)a2 = 1831874609;
      break;
    case 2:
      *(_BYTE *)(a2 + 23) = 5;
      strcpy((char *)a2, "1msec");
      break;
    case 10:
      *(_BYTE *)(a2 + 23) = 9;
      strcpy((char *)a2, "ModemSkin");
      break;
    case 11:
      *(_BYTE *)(a2 + 23) = 9;
      strcpy((char *)a2, "TangierBG");
      break;
    case 12:
      *(_BYTE *)(a2 + 23) = 9;
      strcpy((char *)a2, "TangierCG");
      break;
    case 13:
      *(_BYTE *)(a2 + 23) = 3;
      *(_DWORD *)a2 = 5915974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t abm::convertBasebandCPMSPowerBudgetScale(unsigned __int16 *a1)
{
  uint64_t v1;
  int v2;
  unsigned __int16 *v3;
  unsigned __int8 v4;
  uint64_t result;
  unsigned __int16 *v6;
  int v7;
  int v8;
  int *v10;
  int v11;
  int v12;
  _QWORD *v14;
  unsigned __int16 *v15;
  uint64_t v18;
  int v19;

  v1 = *((unsigned __int8 *)a1 + 23);
  v2 = (char)v1;
  if ((v1 & 0x80u) != 0)
    v1 = *((_QWORD *)a1 + 1);
  switch(v1)
  {
    case 3:
      if (v2 >= 0)
        v3 = a1;
      else
        v3 = *(unsigned __int16 **)a1;
      if (bswap32(*v3) >> 16 == 17989)
      {
        if (*((_BYTE *)v3 + 2) == 90)
          v4 = 13;
        else
          v4 = -1;
        result = v4;
      }
      else
      {
        result = 255;
      }
      break;
    case 5:
      if (v2 >= 0)
        v6 = a1;
      else
        v6 = *(unsigned __int16 **)a1;
      v7 = *(_DWORD *)v6;
      v8 = *((unsigned __int8 *)v6 + 4);
      if (v7 != 1702063409 || v8 != 99)
        goto LABEL_50;
      result = 2;
      break;
    case 7:
      if (v2 >= 0)
        v10 = (int *)a1;
      else
        v10 = *(int **)a1;
      v11 = *v10;
      v12 = *(int *)((char *)v10 + 3);
      if (v11 != 1831874609 || v12 != 1667593069)
        goto LABEL_50;
      result = 1;
      break;
    case 8:
      if (v2 >= 0)
        v14 = a1;
      else
        v14 = *(_QWORD **)a1;
      if (*v14 != 0x6365736D30303031)
        goto LABEL_50;
      result = 0;
      break;
    case 9:
      if (v2 >= 0)
        v15 = a1;
      else
        v15 = *(unsigned __int16 **)a1;
      if (*(_QWORD *)v15 == 0x696B536D65646F4DLL && *((_BYTE *)v15 + 8) == 110)
      {
        result = 10;
      }
      else if (*(_QWORD *)v15 == 0x42726569676E6154 && *((_BYTE *)v15 + 8) == 71)
      {
        result = 11;
      }
      else
      {
        v18 = *(_QWORD *)v15;
        v19 = *((unsigned __int8 *)v15 + 8);
        if (v18 != 0x43726569676E6154 || v19 != 71)
          goto LABEL_50;
        result = 12;
      }
      break;
    default:
LABEL_50:
      result = 255;
      break;
  }
  return result;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1180";
}

void abm::client::Manager::create(uint64_t a1@<X0>, NSObject **a2@<X1>, std::__shared_weak_count_vtbl ***a3@<X8>)
{
  std::__shared_weak_count_vtbl *v6;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  const char *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  std::__shared_weak_count_vtbl **v28;
  std::__shared_weak_count_vtbl **v29;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  unint64_t v33;
  std::__shared_weak_count_vtbl **v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  xpc_object_t object;
  __int128 v39;
  uint64_t block;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  uint64_t *v44;

  v6 = (std::__shared_weak_count_vtbl *)operator new(0x10uLL);
  v6->~__shared_weak_count = 0;
  v6->~__shared_weak_count_0 = 0;
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = MEMORY[0x1E0C812F8];
  if (v7 || (v7 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C3B88380](v7) == v8)
    {
      xpc_retain(v7);
      v9 = v7;
    }
    else
    {
      v9 = xpc_null_create();
    }
  }
  else
  {
    v9 = xpc_null_create();
    v7 = 0;
  }
  xpc_release(v7);
  if (MEMORY[0x1C3B88380](v9) == v8)
  {
    v10 = xpc_string_create("com.apple.basebandd.xpc");
    if (!v10)
      v10 = xpc_null_create();
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E0DBD848], v10);
    v11 = xpc_null_create();
    xpc_release(v10);
    xpc_release(v11);
    v12 = xpc_string_create((const char *)abm::client::Manager::kABMDaemonReadyNotification);
    if (!v12)
      v12 = xpc_null_create();
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E0DBD850], v12);
    v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (*(char *)(a1 + 23) >= 0)
      v14 = (const char *)a1;
    else
      v14 = *(const char **)a1;
    v15 = xpc_string_create(v14);
    if (!v15)
      v15 = xpc_null_create();
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E0DBD838], v15);
    v16 = xpc_null_create();
    xpc_release(v15);
    xpc_release(v16);
  }
  object = v9;
  if (v9)
    xpc_retain(v9);
  else
    object = xpc_null_create();
  block = MEMORY[0x1E0C809B0];
  v41 = 0x40000000;
  v42 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v43 = &__block_descriptor_tmp_3;
  v44 = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v17 = unk_1ED02D3E0;
    block = ClientGetLogServer(void)::sLogServer;
    v41 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_25;
  }
  else
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v17 = unk_1ED02D3E0;
    block = ClientGetLogServer(void)::sLogServer;
    v41 = unk_1ED02D3E0;
    if (!unk_1ED02D3E0)
      goto LABEL_25;
  }
  v18 = (unint64_t *)(v17 + 8);
  do
    v19 = __ldxr(v18);
  while (__stxr(v19 + 1, v18));
LABEL_25:
  TelephonyXPC::Client::create();
  v20 = (std::__shared_weak_count *)v6->~__shared_weak_count_0;
  *(_OWORD *)&v6->~__shared_weak_count = v39;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v24 = (unint64_t *)(v41 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  xpc_release(object);
  xpc_release(v9);
  v26 = (std::__shared_weak_count *)operator new(0x20uLL);
  v26->__shared_owners_ = 0;
  v27 = (unint64_t *)&v26->__shared_owners_;
  v26->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F6F20;
  v26->__shared_weak_owners_ = 0;
  v26[1].__vftable = v6;
  v28 = (std::__shared_weak_count_vtbl **)operator new(0x18uLL);
  v29 = v28;
  do
    v30 = __ldxr(v27);
  while (__stxr(v30 + 1, v27));
  v31 = *a2;
  if (v31)
  {
    dispatch_retain(v31);
    *v29 = v6;
    v29[1] = (std::__shared_weak_count_vtbl *)v26;
    do
      v32 = __ldxr(v27);
    while (__stxr(v32 + 1, v27));
    v29[2] = (std::__shared_weak_count_vtbl *)v31;
    dispatch_retain(v31);
  }
  else
  {
    *v28 = v6;
    v28[1] = (std::__shared_weak_count_vtbl *)v26;
    do
      v33 = __ldxr(v27);
    while (__stxr(v33 + 1, v27));
    v28[2] = 0;
  }
  *a3 = v29;
  v34 = (std::__shared_weak_count_vtbl **)operator new(0x20uLL);
  *v34 = (std::__shared_weak_count_vtbl *)off_1E78F6F70;
  v34[1] = 0;
  v34[2] = 0;
  v34[3] = (std::__shared_weak_count_vtbl *)v29;
  a3[1] = v34;
  if (v31)
    dispatch_release(v31);
  do
    v35 = __ldaxr(v27);
  while (__stlxr(v35 - 1, v27));
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  if (v26)
  {
    v36 = (unint64_t *)&v26->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_1BF321E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  std::__shared_weak_count **v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  void *v15;
  unint64_t *p_shared_owners;
  unint64_t v18;

  if (!v13 || (dispatch_release(v13), (v14 = *v12) != 0))
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    operator delete(v15);
    if (!v13)
    {
LABEL_10:
      std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
      std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    operator delete(v15);
  }
  dispatch_release(v13);
  goto LABEL_10;
}

void sub_1BF321E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF321E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  _QWORD *v12;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;

  v14 = (std::__shared_weak_count *)v12[1];
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  operator delete(v12);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_1BF321EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  uint64_t v18;
  void *v19;
  void *v21;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  xpc_release(object);
  object = 0;
  xpc_release(v19);
  v21 = (void *)std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v18);
  operator delete(v21);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_1BF321F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *abm::client::Manager::Manager(_QWORD *a1, _QWORD *a2, NSObject **a3)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *a3;
  a1[2] = *a3;
  if (v7)
    dispatch_retain(v7);
  return a1;
}

{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *a3;
  a1[2] = *a3;
  if (v7)
    dispatch_retain(v7);
  return a1;
}

void abm::client::Manager::~Manager(abm::client::Manager *this)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *((_QWORD *)this + 2);
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
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
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *((_QWORD *)this + 2);
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
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
}

void abm::client::Manager::setEventHandler(uint64_t *a1, uint64_t a2, void *aBlock)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD aBlocka[4];
  void *v11;
  void *v12;
  dispatch_object_t object;

  if (aBlock)
    v5 = _Block_copy(aBlock);
  else
    v5 = 0;
  v6 = *a1;
  aBlocka[0] = MEMORY[0x1E0C809B0];
  aBlocka[1] = 1174405120;
  aBlocka[2] = ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke;
  aBlocka[3] = &__block_descriptor_tmp_3_0;
  if (v5)
    v7 = _Block_copy(v5);
  else
    v7 = 0;
  v11 = v7;
  v8 = _Block_copy(aBlocka);
  v9 = a1[2];
  if (v9)
    dispatch_retain(v9);
  v12 = v8;
  object = v9;
  abm::client::Manager::State::setEventHandler(v6, a2, (uint64_t)&v12);
  if (object)
    dispatch_release(object);
  if (v12)
    _Block_release(v12);
  if (v11)
    _Block_release(v11);
  if (v5)
    _Block_release(v5);
}

void sub_1BF3221F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, char a15)
{
  const void *v15;

  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a15);
  if (aBlock)
    _Block_release(aBlock);
  if (v15)
    _Block_release(v15);
  _Unwind_Resume(a1);
}

void abm::client::Manager::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *aBlock;
  NSObject *object;

  v4 = *(void **)a3;
  if (*(_QWORD *)a3)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a3 + 8);
  aBlock = v4;
  object = v5;
  if (v5)
    dispatch_retain(v5);
  TelephonyXPC::Client::setEventHandler();
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_1BF3222B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c63_ZTSN8dispatch5blockIU13block_pointerFvPvP16dispatch_group_sEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c63_ZTSN8dispatch5blockIU13block_pointerFvPvP16dispatch_group_sEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void abm::client::Manager::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *aBlock;
  dispatch_object_t object;

  v5 = *a1;
  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  object = v7;
  if (v7)
    dispatch_retain(v7);
  abm::client::Manager::State::setEventHandler(v5, a2, (uint64_t)&aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_1BF3223D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t abm::client::Manager::eventsOn(TelephonyXPC::Client ***this)
{
  return TelephonyXPC::Client::eventsOn(**this);
}

void abm::client::Manager::perform(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;

  v2 = *(std::__shared_weak_count **)(a2 + 8);
  v10 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
    v11 = v2;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  else
  {
    v11 = 0;
  }
  TelephonyXPC::Client::perform();
  if (v11)
  {
    v6 = (unint64_t *)&v11->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v10)
  {
    v8 = (unint64_t *)&v10->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_1BF3224E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void abm::client::Manager::perform(uint64_t a1, uint64_t a2, uint64_t a3, xpc_object_t *a4)
{
  void *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  xpc_object_t object;
  void *aBlock;
  NSObject *v15;

  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  v15 = v7;
  if (v7)
    dispatch_retain(v7);
  object = *a4;
  if (*a4)
    xpc_retain(*a4);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v15)
    dispatch_release(v15);
  if (aBlock)
    _Block_release(aBlock);
  do
    v8 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v8 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  do
    v9 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v9 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  TelephonyXPC::Client::perform();
  do
    v10 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v10 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v10)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v11 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v11 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v11)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v12 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v12 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v12)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
}

void sub_1BF32270C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2 - 48);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_1BF322734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13)
{
  xpc_release(object);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void abm::client::Manager::perform(uint64_t *a1@<X0>, xpc_object_t *a2@<X2>, void **a3@<X3>, _DWORD *a4@<X8>)
{
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  NSObject *global_queue;
  NSObject *v20;
  uint64_t *v21;
  std::string *v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t *v32;
  xpc_object_t value;
  unsigned int v34;
  dispatch_time_t v35;
  xpc_object_t v36;
  void *v37;
  xpc_object_t object;
  const void *v39;
  NSObject *v40;
  _QWORD aBlock[7];
  std::__shared_weak_count *v42;
  dispatch_group_t group;
  void *v44;
  dispatch_object_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, __n128 *);
  void (*v50)(uint64_t);
  unint64_t v51;
  void *__p;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  xpc_object_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  xpc_object_t v60;
  xpc_object_t v61;
  unint64_t v62;

  v55 = 0;
  v56 = &v55;
  v57 = 0x3002000000;
  v58 = __Block_byref_object_copy_;
  v59 = __Block_byref_object_dispose_;
  v60 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v60 = xpc_null_create();
  v46 = 0;
  v47 = &v46;
  v48 = 0x4802000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__7;
  v51 = 0xAAAAAAAAE020E002;
  __p = 0;
  v53 = 0;
  v54 = 0;
  v8 = (std::__shared_weak_count *)a1[1];
  if (!v8)
    goto LABEL_23;
  v9 = *a1;
  p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
  do
    v11 = __ldxr(p_shared_weak_owners);
  while (__stxr(v11 + 1, p_shared_weak_owners));
  v12 = std::__shared_weak_count::lock(v8);
  v13 = v12;
  if (!v12)
    goto LABEL_24;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (v15)
  {
    if (v9)
      goto LABEL_9;
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v13);
  if (!v9)
    goto LABEL_23;
LABEL_9:
  v16 = dispatch_group_create();
  v13 = (std::__shared_weak_count *)v16;
  if (v16)
  {
    dispatch_retain(v16);
    dispatch_group_enter((dispatch_group_t)v13);
  }
  v44 = (void *)0xAAAAAAAAAAAAAAAALL;
  v45 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictERSC__block_invoke;
  aBlock[3] = &unk_1E78F6EE0;
  aBlock[6] = v9;
  v42 = v8;
  do
    v17 = __ldxr(p_shared_weak_owners);
  while (__stxr(v17 + 1, p_shared_weak_owners));
  group = (dispatch_group_t)v13;
  if (v13)
  {
    dispatch_retain((dispatch_object_t)v13);
    dispatch_group_enter(group);
  }
  aBlock[4] = &v46;
  aBlock[5] = &v55;
  v18 = _Block_copy(aBlock);
  global_queue = dispatch_get_global_queue(0, 0);
  v20 = global_queue;
  if (global_queue)
    dispatch_retain(global_queue);
  v44 = v18;
  v45 = v20;
  if (v18)
  {
    v39 = _Block_copy(v18);
    v40 = v20;
    if (!v20)
      goto LABEL_20;
    goto LABEL_19;
  }
  v39 = 0;
  v40 = v20;
  if (v20)
LABEL_19:
    dispatch_retain(v20);
LABEL_20:
  object = *a2;
  if (*a2)
    xpc_retain(*a2);
  else
    object = xpc_null_create();
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v40)
    dispatch_release(v40);
  if (v39)
    _Block_release(v39);
  do
    v24 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v24 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v62 = 0xAAAAAAAAAAAAAAAALL;
  do
    v25 = __ldxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stxr(v25 + 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  v61 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Client::perform();
  v26 = (std::__shared_weak_count *)v62;
  if (v62)
  {
    v27 = (unint64_t *)(v62 + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  do
    v29 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v29 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v29)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  do
    v30 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v30 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v30)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (v45)
    dispatch_release(v45);
  if (v44)
    _Block_release(v44);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (v42)
    std::__shared_weak_count::__release_weak(v42);
  if (v13)
  {
    dispatch_group_leave((dispatch_group_t)v13);
    dispatch_release((dispatch_object_t)v13);
    if (MEMORY[0x1C3B88380](*a2) != MEMORY[0x1E0C812F8])
      goto LABEL_66;
    value = xpc_dictionary_get_value(*a2, "Timeout");
    v61 = value;
    if (value)
      xpc_retain(value);
    else
      v61 = xpc_null_create();
    v34 = xpc::dyn_cast_or_default();
    xpc_release(v61);
    if (v34)
    {
      v35 = dispatch_time(0, 1000000 * v34);
      if (!dispatch_group_wait((dispatch_group_t)v13, v35))
        goto LABEL_75;
    }
    else
    {
LABEL_66:
      if (!dispatch_group_wait((dispatch_group_t)v13, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_75:
        v36 = (xpc_object_t)v56[5];
        if (v36)
          xpc_retain((xpc_object_t)v56[5]);
        else
          v36 = xpc_null_create();
        v37 = *a3;
        *a3 = v36;
        xpc_release(v37);
        goto LABEL_24;
      }
    }
    v31 = (char *)operator new(0x30uLL);
    strcpy(v31, "Timeout waiting for response from server");
    v32 = v47;
    *((_DWORD *)v47 + 10) = -534716413;
    if (*((char *)v32 + 71) < 0)
      operator delete((void *)v32[6]);
    v32[6] = (uint64_t)v31;
    v32[7] = 40;
    v32[8] = 0x8000000000000030;
  }
LABEL_24:
  v21 = v47;
  *a4 = *((_DWORD *)v47 + 10);
  v22 = (std::string *)(a4 + 2);
  if (*((char *)v21 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)v21[6], v21[7]);
  }
  else
  {
    v23 = *((_OWORD *)v21 + 3);
    v22->__r_.__value_.__r.__words[2] = v21[8];
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
  }
  if (v8)
    std::__shared_weak_count::__release_weak(v8);
  if (v13)
    dispatch_release((dispatch_object_t)v13);
  _Block_object_dispose(&v46, 8);
  if (SHIBYTE(v54) < 0)
    operator delete(__p);
  _Block_object_dispose(&v55, 8);
  xpc_release(v60);
}

void sub_1BF322CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,dispatch_group_t group,char a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  std::__shared_weak_count *v39;
  NSObject *v40;
  uint64_t v41;

  xpc_release(*(xpc_object_t *)(v41 - 96));
  std::__shared_weak_count::__release_weak(v39);
  if (v40)
  {
    dispatch_release(v40);
    _Block_object_dispose(&a28, 8);
    if ((a39 & 0x80000000) == 0)
    {
LABEL_4:
      _Block_object_dispose((const void *)(v41 - 144), 8);
      xpc_release(*(xpc_object_t *)(v41 - 104));
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a28, 8);
    if ((a39 & 0x80000000) == 0)
      goto LABEL_4;
  }
  operator delete(__p);
  goto LABEL_4;
}

xpc_object_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  xpc_object_t result;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  result = xpc_null_create();
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

__n128 __Block_byref_object_copy__6(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[2].n128_u32[2] = a2[2].n128_u32[2];
  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[3].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
}

void ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictERSC__block_invoke(_QWORD *a1, uint64_t a2, xpc_object_t *a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  __int128 v13;
  void *v14;
  size_t v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;

  v4 = (std::__shared_weak_count *)a1[7];
  if (v4)
  {
    v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      v8 = v7;
      if (a1[6])
      {
        v9 = *(_QWORD *)(a1[4] + 8);
        *(_DWORD *)(v9 + 40) = *(_DWORD *)a2;
        if (v9 + 40 != a2)
        {
          v10 = v9 + 48;
          v11 = *(char *)(v9 + 71);
          v12 = *(_BYTE *)(a2 + 31);
          if (v11 < 0)
          {
            if (v12 >= 0)
              v14 = (void *)(a2 + 8);
            else
              v14 = *(void **)(a2 + 8);
            if (v12 >= 0)
              v15 = *(unsigned __int8 *)(a2 + 31);
            else
              v15 = *(_QWORD *)(a2 + 16);
            std::string::__assign_no_alias<false>((void **)v10, v14, v15);
          }
          else if ((*(_BYTE *)(a2 + 31) & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)v10, *(void **)(a2 + 8), *(_QWORD *)(a2 + 16));
          }
          else
          {
            v13 = *(_OWORD *)(a2 + 8);
            *(_QWORD *)(v10 + 16) = *(_QWORD *)(a2 + 24);
            *(_OWORD *)v10 = v13;
          }
        }
        v16 = *(_QWORD *)(a1[5] + 8);
        v17 = *a3;
        if (v17)
          xpc_retain(v17);
        else
          v17 = xpc_null_create();
        v18 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v17;
        xpc_release(v18);
      }
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_1BF322FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_48c50_ZTSNSt3__18weak_ptrIN3abm6client7Manager5StateEEE64c30_ZTSN8dispatch13group_sessionE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2[7];
  a1[6] = a2[6];
  a1[7] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a2[8];
  a1[8] = v6;
  if (v6)
  {
    dispatch_retain(v6);
    v7 = a1[8];
    if (v7)
      dispatch_group_enter(v7);
  }
}

void __destroy_helper_block_e8_48c50_ZTSNSt3__18weak_ptrIN3abm6client7Manager5StateEEE64c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = *(NSObject **)(a1 + 64);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 64);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(std::__shared_weak_count **)(a1 + 56);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

uint64_t abm::client::Manager::eventsOff(TelephonyXPC::Client ***this)
{
  return TelephonyXPC::Client::eventsOff(**this);
}

void std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = (std::__shared_weak_count *)v1[1];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF333672)
    return a1 + 24;
  if (((v3 & 0x80000001BF333672 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF333672))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF333672 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = v1[2];
    if (v2)
      dispatch_release(v2);
    v3 = (std::__shared_weak_count *)v1[1];
    if (!v3)
      goto LABEL_8;
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      operator delete(v1);
    }
    else
    {
LABEL_8:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF33374DLL)
    return a1 + 24;
  if (((v3 & 0x80000001BF33374DLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF33374DLL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF33374DLL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

_QWORD *abm::client::Command::Command(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void abm::client::Command::name(xpc_object_t **this)
{
  abm::client::Command::State::name(*this);
}

void abm::client::Command::State::name(xpc_object_t *this)
{
  xpc_object_t value;
  xpc_object_t object;

  value = xpc_dictionary_get_value(this[2], (const char *)kKeyCommand);
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_1BF323388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abm::client::Command::getName(_QWORD *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
}

xpc_object_t abm::client::Command::get@<X0>(abm::client::Command *this@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  xpc_object_t result;

  v3 = *(void **)(*(_QWORD *)this + 16);
  *a2 = v3;
  if (v3)
    return xpc_retain(v3);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

BOOL abm::client::Command::notifiable(abm::client::Command *this)
{
  return **(_QWORD **)this && *(_QWORD *)(*(_QWORD *)this + 8) != 0;
}

void abm::client::Command::notify(uint64_t *a1, int a2, const void **a3)
{
  uint64_t v4;
  const void *v5;
  CFTypeRef cf;

  v4 = *a1;
  v5 = *a3;
  cf = v5;
  if (v5)
    CFRetain(v5);
  abm::client::Command::State::notify(v4, a2, &cf);
  if (cf)
    CFRelease(cf);
}

void sub_1BF323478(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void abm::client::Command::State::notify(uint64_t a1, int a2, CFTypeRef *a3)
{
  const void *v4;
  CFTypeRef v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  void *aBlock;
  CFTypeRef cf;
  int v12;

  v4 = *(const void **)a1;
  if (!v4 || !*(_QWORD *)(a1 + 8))
    return;
  v6 = *a3;
  if (*a3 && (CFRetain(*a3), (v4 = *(const void **)a1) == 0))
    v7 = 0;
  else
    v7 = _Block_copy(v4);
  v8 = *(NSObject **)(a1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEclIJiS6_EEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_6;
  if (v7)
  {
    v12 = a2;
    aBlock = _Block_copy(v7);
    cf = v6;
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  v12 = a2;
  aBlock = 0;
  cf = v6;
  if (v6)
LABEL_11:
    CFRetain(v6);
LABEL_12:
  dispatch_async(v8, block);
  if (cf)
    CFRelease(cf);
  if (aBlock)
    _Block_release(aBlock);
  if (v7)
    _Block_release(v7);
  if (v6)
    CFRelease(v6);
}

void abm::client::Command::create(uint64_t a1@<X1>, ctu **a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  ctu *v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  ctu *v22;
  void *v23;
  NSObject *v24;
  void *__p[2];
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v28 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = 0uLL;
  v26 = 0;
  *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6 = operator new(0x18uLL);
  if (*(_QWORD *)a1)
  {
    v7 = _Block_copy(*(const void **)a1);
    v8 = *(NSObject **)(a1 + 8);
    v23 = v7;
    v24 = v8;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  v8 = *(NSObject **)(a1 + 8);
  v23 = 0;
  v24 = v8;
  if (v8)
LABEL_3:
    dispatch_retain(v8);
LABEL_4:
  v9 = *a2;
  v22 = v9;
  if (v9)
    CFRetain(v9);
  abm::client::Command::State::State(v6, (uint64_t)__p, (uint64_t)&v23, &v22);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v27, (uint64_t)v6);
  if (v9)
    CFRelease(v9);
  if (v8)
    dispatch_release(v8);
  if (v7)
    _Block_release(v7);
  v10 = operator new(0x10uLL);
  v11 = v10;
  v12 = v27;
  if (*((_QWORD *)&v27 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
    *v10 = v12;
    do
      v15 = __ldxr(v13);
    while (__stxr(v15 + 1, v13));
  }
  else
  {
    *v10 = (unint64_t)v27;
  }
  *a3 = v10;
  v16 = operator new(0x20uLL);
  *v16 = off_1E78F7040;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = v11;
  a3[1] = v16;
  if (*((_QWORD *)&v12 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v12 + 1) + 16))(*((_QWORD *)&v12 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v12 + 1));
    }
  }
  v19 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (!*((_QWORD *)&v27 + 1))
    goto LABEL_30;
  v20 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (v21)
  {
LABEL_30:
    if ((SHIBYTE(v26) & 0x80000000) == 0)
      return;
LABEL_33:
    operator delete(__p[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
  std::__shared_weak_count::__release_weak(v19);
  if (SHIBYTE(v26) < 0)
    goto LABEL_33;
}

void sub_1BF3237DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::__shared_weak_count *v29;
  void *v30;
  unint64_t *p_shared_owners;
  unint64_t v33;

  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v33 = __ldaxr(p_shared_owners);
    while (__stlxr(v33 - 1, p_shared_owners));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  operator delete(v30);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = operator new(0x20uLL);
  *v4 = off_1E78F6FF0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1BF3238D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  NSObject *v3;

  if (v1)
  {
    xpc_release(*(xpc_object_t *)(v1 + 16));
    *(_QWORD *)(v1 + 16) = 0;
    v3 = *(NSObject **)(v1 + 8);
    if (v3)
      dispatch_release(v3);
    if (*(_QWORD *)v1)
      _Block_release(*(const void **)v1);
    operator delete((void *)v1);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::Command::create(uint64_t a1@<X0>, uint64_t a2@<X1>, ctu **a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  ctu *v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  ctu *v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  unint64_t v29;

  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v8 = operator new(0x18uLL);
  if (*(_QWORD *)a2)
  {
    v9 = _Block_copy(*(const void **)a2);
    v10 = *(NSObject **)(a2 + 8);
    v26 = v9;
    v27 = v10;
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v10 = *(NSObject **)(a2 + 8);
  v26 = 0;
  v27 = v10;
  if (v10)
LABEL_3:
    dispatch_retain(v10);
LABEL_4:
  v11 = *a3;
  v25 = v11;
  if (v11)
    CFRetain(v11);
  abm::client::Command::State::State(v8, a1, (uint64_t)&v26, &v25);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v28, (uint64_t)v8);
  if (v11)
    CFRelease(v11);
  if (v10)
    dispatch_release(v10);
  if (v9)
    _Block_release(v9);
  v12 = operator new(0x10uLL);
  v13 = v12;
  v14 = v28;
  v15 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v16 = (unint64_t *)(v29 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    *v12 = v14;
    v12[1] = v15;
    do
      v18 = __ldxr(v16);
    while (__stxr(v18 + 1, v16));
  }
  else
  {
    *v12 = v28;
    v12[1] = 0;
  }
  *a4 = v12;
  v19 = operator new(0x20uLL);
  *v19 = off_1E78F7040;
  v19[1] = 0;
  v19[2] = 0;
  v19[3] = v13;
  a4[1] = v19;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v22 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v23 = (unint64_t *)(v29 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
}

void sub_1BF323AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  std::__shared_weak_count *v15;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v19;

  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  operator delete(v16);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_1BF323B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  int v5;
  const void *v7;
  va_list va;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v7 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  if (v5)
    operator delete(v4);
  _Unwind_Resume(a1);
}

void abm::client::Command::create(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  const char *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v8 = operator new(0x18uLL);
  if (*(_QWORD *)a3)
  {
    v9 = _Block_copy(*(const void **)a3);
    v10 = *(NSObject **)(a3 + 8);
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v10 = *(NSObject **)(a3 + 8);
  if (v10)
LABEL_3:
    dispatch_retain(v10);
LABEL_4:
  v11 = *a2;
  if (v11)
  {
    xpc_retain(v11);
    if (v9)
      goto LABEL_6;
  }
  else
  {
    v11 = xpc_null_create();
    if (v9)
    {
LABEL_6:
      *v8 = _Block_copy(v9);
      v8[1] = v10;
      if (!v10)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  *v8 = 0;
  v8[1] = v10;
  if (v10)
LABEL_7:
    dispatch_retain(v10);
LABEL_8:
  v8[2] = v11;
  v12 = xpc_null_create();
  if (*(char *)(a1 + 23) >= 0)
    v13 = (const char *)a1;
  else
    v13 = *(const char **)a1;
  v14 = xpc_string_create(v13);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v11, (const char *)kKeyCommand, v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v29, (uint64_t)v8);
  xpc_release(v12);
  if (v10)
    dispatch_release(v10);
  if (v9)
    _Block_release(v9);
  v16 = operator new(0x10uLL);
  v17 = v16;
  v18 = v29;
  v19 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v20 = (unint64_t *)(v30 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
    *v16 = v18;
    v16[1] = v19;
    do
      v22 = __ldxr(v20);
    while (__stxr(v22 + 1, v20));
  }
  else
  {
    *v16 = v29;
    v16[1] = 0;
  }
  *a4 = v16;
  v23 = operator new(0x20uLL);
  *v23 = off_1E78F7040;
  v23[1] = 0;
  v23[2] = 0;
  v23[3] = v17;
  a4[1] = v23;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v26 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v27 = (unint64_t *)(v30 + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_1BF323DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  std::__shared_weak_count *v13;
  void *v14;
  unint64_t *p_shared_owners;
  unint64_t v17;

  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_1BF323E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1BF323E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;

  xpc_release(v11);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEclIJiS6_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  CFTypeRef cf;

  v1 = *(unsigned int *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(a1 + 40);
  cf = v2;
  if (v2)
    CFRetain(v2);
  (*(void (**)(uint64_t, uint64_t, CFTypeRef *))(v3 + 16))(v3, v1, &cf);
  if (cf)
    CFRelease(cf);
}

void sub_1BF323EF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

CFTypeRef __copy_helper_block_e8_32c84_ZTSN8dispatch5blockIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEE40c45_ZTSN3ctu2cf11CFSharedRefIK14__CFDictionaryEE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  CFTypeRef result;

  v4 = *(const void **)(a2 + 32);
  if (!v4)
  {
    result = *(CFTypeRef *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = result;
    if (!result)
      return result;
    return CFRetain(result);
  }
  v5 = _Block_copy(v4);
  result = *(CFTypeRef *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_e8_32c84_ZTSN8dispatch5blockIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEE40c45_ZTSN3ctu2cf11CFSharedRefIK14__CFDictionaryEE(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    _Block_release(v3);
}

_QWORD *abm::client::Command::State::State(_QWORD *a1, uint64_t a2, uint64_t a3, ctu **a4)
{
  void *v8;
  NSObject *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t *v12;
  uint64_t v13;
  xpc_object_t v14;
  const void *v15;
  uint64_t (*v16)(uint64_t);
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  const char *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t object;

  v8 = *(void **)a3;
  if (*(_QWORD *)a3)
    v8 = _Block_copy(v8);
  v9 = *(NSObject **)(a3 + 8);
  *a1 = v8;
  a1[1] = v9;
  if (v9)
    dispatch_retain(v9);
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  v12 = (xpc_object_t *)(a1 + 2);
  v13 = MEMORY[0x1E0C812F8];
  if (v10)
  {
    *v12 = v10;
  }
  else
  {
    v11 = xpc_null_create();
    *v12 = v11;
    if (!v11)
    {
      v14 = xpc_null_create();
      v11 = 0;
      goto LABEL_12;
    }
  }
  if (MEMORY[0x1C3B88380](v11) == v13)
  {
    xpc_retain(v11);
    goto LABEL_13;
  }
  v14 = xpc_null_create();
LABEL_12:
  *v12 = v14;
LABEL_13:
  xpc_release(v11);
  v16 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!*a4)
    v16 = 0;
  if (v16)
  {
    ctu::cf_to_xpc(*a4, v15);
    v17 = object;
    if (object && MEMORY[0x1C3B88380]() == v13)
      xpc_retain(object);
    else
      v17 = xpc_null_create();
    v18 = xpc_null_create();
    v19 = *v12;
    *v12 = v17;
    xpc_release(v19);
    xpc_release(v18);
    xpc_release(object);
  }
  if (*(char *)(a2 + 23) >= 0)
    v20 = (const char *)a2;
  else
    v20 = *(const char **)a2;
  v21 = xpc_string_create(v20);
  if (!v21)
    v21 = xpc_null_create();
  xpc_dictionary_set_value(*v12, (const char *)kKeyCommand, v21);
  v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  return a1;
}

void sub_1BF324158(_Unwind_Exception *a1)
{
  uint64_t v1;
  xpc_object_t *v2;

  xpc::dict::~dict(v2);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(v1);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    xpc_release(*(xpc_object_t *)(v1 + 16));
    *(_QWORD *)(v1 + 16) = 0;
    v2 = *(NSObject **)(v1 + 8);
    if (v2)
      dispatch_release(v2);
    if (*(_QWORD *)v1)
      _Block_release(*(const void **)v1);
    operator delete((void *)v1);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF333828)
    return a1 + 24;
  if (((v3 & 0x80000001BF333828 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF333828))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF333828 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = (std::__shared_weak_count *)v1[1];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF333903)
    return a1 + 24;
  if (((v3 & 0x80000001BF333903 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF333903))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF333903 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void abm::client::Transport::create(uint64_t a1@<X0>, const void **a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  const void *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  char *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  int v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  NSObject *v27;
  const char *p_dst;
  unint64_t *v29;
  unint64_t v30;
  void **v31;
  _QWORD *v32;
  _QWORD *v33;
  const void *v34;
  size_t v35;
  size_t v36;
  __int128 *v37;
  uint64_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  std::__shared_weak_count *v42;
  unint64_t v43;
  unint64_t *p_shared_weak_owners;
  unint64_t v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  const void *v52;
  NSObject *v53;
  NSObject *v54;
  unint64_t *v55;
  unint64_t v56;
  const void *v57;
  _QWORD *v58;
  _QWORD *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  void *v68;
  dispatch_object_t v69;
  CFTypeRef v70;
  std::__shared_weak_count *v71;
  void *aBlock;
  NSObject *object;
  CFTypeRef cf;
  std::string v75;
  void *v76;
  char *v77;
  __int128 __p;
  _QWORD *(*v79)(uint64_t);
  void *v80;
  char *v81;
  __int128 *v82;
  dispatch_object_t v83;
  std::string v84;
  __int128 __dst;
  int64_t v86;
  dispatch_object_t v87;

  v9 = *a2;
  v70 = *a2;
  if (*a2)
    CFRetain(v9);
  v11 = *a3;
  v10 = (std::__shared_weak_count *)a3[1];
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  if (*(_QWORD *)a4)
  {
    v14 = _Block_copy(*(const void **)a4);
    v15 = *(NSObject **)(a4 + 8);
    v68 = v14;
    v69 = v15;
    if (!v15)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 0;
  v15 = *(NSObject **)(a4 + 8);
  v68 = 0;
  v69 = v15;
  if (v15)
LABEL_8:
    dispatch_retain(v15);
LABEL_9:
  v16 = (char *)operator new(0xE0uLL);
  cf = v9;
  if (v9)
    CFRetain(v9);
  if (v10)
  {
    v17 = (unint64_t *)&v10->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  if (v14)
  {
    v19 = _Block_copy(v14);
    aBlock = v19;
    object = v15;
    if (!v15)
      goto LABEL_17;
    goto LABEL_16;
  }
  v19 = 0;
  aBlock = 0;
  object = v15;
  if (v15)
LABEL_16:
    dispatch_retain(v15);
LABEL_17:
  *((_BYTE *)&v75.__r_.__value_.__s + 23) = 4;
  strcpy((char *)&v75, ".xpc");
  v20 = *(char *)(a1 + 23);
  if (v20 >= 0)
    v21 = (const std::string::value_type *)a1;
  else
    v21 = *(const std::string::value_type **)a1;
  if (v20 >= 0)
    v22 = *(unsigned __int8 *)(a1 + 23);
  else
    v22 = *(_QWORD *)(a1 + 8);
  v23 = std::string::insert(&v75, 0, v21, v22);
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v79 = (_QWORD *(*)(uint64_t))v23->__r_.__value_.__r.__words[2];
  __p = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v84, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v84 = *(std::string *)a1;
  v25 = std::string::append(&v84, ".xpc.queue", 0xAuLL);
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v86 = v25->__r_.__value_.__r.__words[2];
  __dst = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  if (v86 >= 0)
    p_dst = (const char *)&__dst;
  else
    p_dst = (const char *)__dst;
  v87 = dispatch_queue_create(p_dst, v27);
  v83 = 0;
  ctu::XpcClient::XpcClient();
  if (v83)
    dispatch_release(v83);
  if (v87)
    dispatch_release(v87);
  if (SHIBYTE(v86) < 0)
  {
    operator delete((void *)__dst);
    if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_39:
      if ((SHIBYTE(v79) & 0x80000000) == 0)
        goto LABEL_40;
LABEL_48:
      operator delete((void *)__p);
      if ((SHIBYTE(v75.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_41;
      goto LABEL_49;
    }
  }
  else if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_39;
  }
  operator delete(v84.__r_.__value_.__l.__data_);
  if (SHIBYTE(v79) < 0)
    goto LABEL_48;
LABEL_40:
  if ((SHIBYTE(v75.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_41;
LABEL_49:
  operator delete(v75.__r_.__value_.__l.__data_);
LABEL_41:
  *(_QWORD *)v16 = &off_1E78F7130;
  *((_QWORD *)v16 + 9) = &unk_1E78F7160;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v84, "com.apple.telephony.abm", "abm.client");
  *((_QWORD *)v16 + 9) = off_1E78F71F0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v75);
  *((_QWORD *)v16 + 10) = &unk_1E78F5290;
  *((_QWORD *)v16 + 16) = v11;
  *((_QWORD *)v16 + 17) = v10;
  if (v10)
  {
    v29 = (unint64_t *)&v10->__shared_owners_;
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 + 1, v29));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__dst);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v84);
  *(_QWORD *)v16 = &off_1E78F7130;
  *((_QWORD *)v16 + 9) = &unk_1E78F7160;
  *((_QWORD *)v16 + 18) = 0;
  v31 = (void **)(v16 + 144);
  *((_QWORD *)v16 + 19) = 0;
  *((_QWORD *)v16 + 20) = 0;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v16 + 7, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)(v16 + 168) = *(_OWORD *)a1;
    *((_QWORD *)v16 + 23) = *(_QWORD *)(a1 + 16);
  }
  if (v19)
  {
    *((_QWORD *)v16 + 24) = _Block_copy(v19);
    *((_QWORD *)v16 + 25) = v15;
    if (!v15)
      goto LABEL_54;
    goto LABEL_53;
  }
  *((_QWORD *)v16 + 24) = 0;
  *((_QWORD *)v16 + 25) = v15;
  if (v15)
LABEL_53:
    dispatch_retain(v15);
LABEL_54:
  v32 = operator new(0x18uLL);
  v32[2] = 0;
  v32[1] = 0;
  *v32 = v32 + 1;
  *((_QWORD *)v16 + 26) = v32;
  v33 = operator new(0x20uLL);
  *v33 = off_1E78F7230;
  v33[1] = 0;
  v33[2] = 0;
  v33[3] = v32;
  *((_QWORD *)v16 + 27) = v33;
  ctu::LoggerCommonBase::setLogLevel();
  v84.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v84.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v84, (const __CFDictionary *)v9);
  v34 = (const void *)kABMDefaultServiceName;
  v35 = strlen((const char *)kABMDefaultServiceName);
  if (v35 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v36 = v35;
  if (v35 >= 0x17)
  {
    v38 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v35 | 7) != 0x17)
      v38 = v35 | 7;
    v39 = v38 + 1;
    v37 = (__int128 *)operator new(v38 + 1);
    *((_QWORD *)&__dst + 1) = v36;
    v86 = v39 | 0x8000000000000000;
    *(_QWORD *)&__dst = v37;
    goto LABEL_61;
  }
  HIBYTE(v86) = v35;
  v37 = &__dst;
  if (v35)
LABEL_61:
    memmove(v37, v34, v36);
  *((_BYTE *)v37 + v36) = 0;
  ctu::cf::map_adapter::getString();
  if (v16[167] < 0)
    operator delete(*v31);
  *(_OWORD *)v31 = *(_OWORD *)&v75.__r_.__value_.__l.__data_;
  *((_QWORD *)v16 + 20) = *((_QWORD *)&v75.__r_.__value_.__l + 2);
  *((_BYTE *)&v75.__r_.__value_.__s + 23) = 0;
  v75.__r_.__value_.__s.__data_[0] = 0;
  if (SHIBYTE(v86) < 0)
    operator delete((void *)__dst);
  MEMORY[0x1C3B87E10](&v84);
  v40 = (std::__shared_weak_count *)operator new(0x20uLL);
  v40->__shared_owners_ = 0;
  v41 = (unint64_t *)&v40->__shared_owners_;
  v40->__vftable = (std::__shared_weak_count_vtbl *)off_1E78F70E0;
  v40->__shared_weak_owners_ = 0;
  v40[1].__vftable = (std::__shared_weak_count_vtbl *)v16;
  v71 = v40;
  v42 = (std::__shared_weak_count *)*((_QWORD *)v16 + 2);
  if (v42)
  {
    if (v42->__shared_owners_ != -1)
      goto LABEL_79;
    do
      v43 = __ldxr(v41);
    while (__stxr(v43 + 1, v41));
    p_shared_weak_owners = (unint64_t *)&v40->__shared_weak_owners_;
    do
      v45 = __ldxr(p_shared_weak_owners);
    while (__stxr(v45 + 1, p_shared_weak_owners));
    *((_QWORD *)v16 + 1) = v16;
    *((_QWORD *)v16 + 2) = v40;
    std::__shared_weak_count::__release_weak(v42);
  }
  else
  {
    do
      v46 = __ldxr(v41);
    while (__stxr(v46 + 1, v41));
    v47 = (unint64_t *)&v40->__shared_weak_owners_;
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
    *((_QWORD *)v16 + 1) = v16;
    *((_QWORD *)v16 + 2) = v40;
  }
  do
    v49 = __ldaxr(v41);
  while (__stlxr(v49 - 1, v41));
  if (!v49)
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
LABEL_79:
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (!v10)
    goto LABEL_87;
  v50 = (unint64_t *)&v10->__shared_owners_;
  do
    v51 = __ldaxr(v50);
  while (__stlxr(v51 - 1, v50));
  if (v51)
  {
LABEL_87:
    v52 = cf;
    if (!cf)
      goto LABEL_89;
    goto LABEL_88;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  v52 = cf;
  if (cf)
LABEL_88:
    CFRelease(v52);
LABEL_89:
  v75.__r_.__value_.__r.__words[0] = MEMORY[0x1E0C809B0];
  v75.__r_.__value_.__l.__size_ = 0x40000000;
  v75.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN3abm6client9Transport5State4initEv_block_invoke;
  v76 = &__block_descriptor_tmp_11;
  v77 = v16;
  *(_QWORD *)&__p = MEMORY[0x1E0C809B0];
  *(_QWORD *)&__dst = &v75;
  *((_QWORD *)&__p + 1) = 0x40000000;
  v79 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v80 = &__block_descriptor_tmp_12;
  v81 = v16 + 8;
  v82 = &__dst;
  v53 = *((_QWORD *)v16 + 3);
  if (*((_QWORD *)v16 + 4))
  {
    dispatch_async_and_wait(v53, &__p);
    v54 = v69;
    if (!v69)
      goto LABEL_92;
    goto LABEL_91;
  }
  dispatch_sync(v53, &__p);
  v54 = v69;
  if (v69)
LABEL_91:
    dispatch_release(v54);
LABEL_92:
  if (v68)
    _Block_release(v68);
  if (!v10)
    goto LABEL_98;
  v55 = (unint64_t *)&v10->__shared_owners_;
  do
    v56 = __ldaxr(v55);
  while (__stlxr(v56 - 1, v55));
  if (v56)
  {
LABEL_98:
    v57 = v70;
    if (!v70)
      goto LABEL_100;
    goto LABEL_99;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  v57 = v70;
  if (v70)
LABEL_99:
    CFRelease(v57);
LABEL_100:
  v58 = operator new(0x10uLL);
  v59 = v58;
  if (v71)
  {
    v60 = (unint64_t *)&v71->__shared_owners_;
    do
      v61 = __ldxr(v60);
    while (__stxr(v61 + 1, v60));
    *v58 = v16;
    v58[1] = v71;
    do
      v62 = __ldxr(v60);
    while (__stxr(v62 + 1, v60));
  }
  else
  {
    *v58 = v16;
    v58[1] = 0;
  }
  *a5 = v58;
  v63 = operator new(0x20uLL);
  *v63 = off_1E78F75B0;
  v63[1] = 0;
  v63[2] = 0;
  v63[3] = v59;
  a5[1] = v63;
  if (v71)
  {
    v64 = (unint64_t *)&v71->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
  if (v71)
  {
    v66 = (unint64_t *)&v71->__shared_owners_;
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
}

void sub_1BF324B80(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  __break(1u);
}

void sub_1BF324C4C()
{
  __cxa_end_catch();
  JUMPOUT(0x1BF324DD8);
}

void sub_1BF324C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void **v7;
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  va_list va1;
  uint64_t v15;
  const void *v16;
  va_list va2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  va_list va3;
  uint64_t v22;
  uint64_t v23;
  va_list va4;
  uint64_t v25;
  va_list va5;

  va_start(va5, a4);
  va_start(va4, a4);
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v13 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  va_copy(va3, va2);
  v16 = va_arg(va3, const void *);
  v18 = va_arg(va3, _QWORD);
  v19 = va_arg(va3, _QWORD);
  va_copy(va4, va3);
  v20 = va_arg(va4, _QWORD);
  v22 = va_arg(va4, _QWORD);
  va_copy(va5, va4);
  v23 = va_arg(va5, _QWORD);
  v25 = va_arg(va5, _QWORD);
  if (*(char *)(v8 - 105) < 0)
    operator delete(*(void **)(v8 - 128));
  MEMORY[0x1C3B87E10](v8 - 160);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v5);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback(v4 + 192);
  if (*(char *)(v4 + 191) < 0)
    operator delete(*v6);
  if (*(char *)(v4 + 167) < 0)
    operator delete(*v7);
  *(_QWORD *)(v4 + 72) = off_1E78F71F0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)v4);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)va3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va4);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va5);
  operator delete((void *)v4);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

void sub_1BF324C78()
{
  JUMPOUT(0x1BF324D88);
}

void sub_1BF324C80()
{
  JUMPOUT(0x1BF324D88);
}

void sub_1BF324C88()
{
  void *v0;

  operator delete(v0);
  JUMPOUT(0x1BF324D90);
}

void sub_1BF324C98()
{
  JUMPOUT(0x1BF324D90);
}

void sub_1BF324CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v15 - 128));
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v15 - 160));
  JUMPOUT(0x1BF324DCCLL);
}

void sub_1BF324CC0()
{
  JUMPOUT(0x1BF324DCCLL);
}

void sub_1BF324CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;

  v38 = *(NSObject **)(v37 - 168);
  if (v38)
  {
    dispatch_release(v38);
    v39 = *(NSObject **)(v37 - 104);
    if (!v39)
    {
LABEL_3:
      if ((*(char *)(v37 - 105) & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v39 = *(NSObject **)(v37 - 104);
    if (!v39)
      goto LABEL_3;
  }
  dispatch_release(v39);
  if ((*(char *)(v37 - 105) & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(char *)(v37 - 137) & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  operator delete(*(void **)(v37 - 128));
  if ((*(char *)(v37 - 137) & 0x80000000) == 0)
  {
LABEL_5:
    if ((a37 & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  operator delete(*(void **)(v37 - 160));
  if ((a37 & 0x80000000) == 0)
  {
LABEL_6:
    if ((a29 & 0x80000000) == 0)
      goto LABEL_15;
    goto LABEL_16;
  }
LABEL_12:
  operator delete(a32);
  if ((a29 & 0x80000000) == 0)
LABEL_15:
    JUMPOUT(0x1BF324DD4);
LABEL_16:
  JUMPOUT(0x1BF324D68);
}

void sub_1BF324D2C()
{
  uint64_t v0;

  if (*(char *)(v0 - 137) < 0)
    JUMPOUT(0x1BF324D38);
  JUMPOUT(0x1BF324CECLL);
}

void sub_1BF324D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
    JUMPOUT(0x1BF324D68);
  JUMPOUT(0x1BF324DD4);
}

void sub_1BF324D74()
{
  JUMPOUT(0x1BF324DFCLL);
}

_QWORD *abm::client::Transport::Transport(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void abm::client::Transport::perform(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[6];
  std::__shared_weak_count *v16;

  v2 = *a1;
  v3 = *a2;
  v4 = (std::__shared_weak_count *)a2[1];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = (uint64_t *)(v2 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1174405120;
  v15[2] = ___ZN3abm6client9Transport5State7performENSt3__110shared_ptrINS0_7CommandEEE_block_invoke;
  v15[3] = &__block_descriptor_tmp_13;
  v15[4] = v2;
  v15[5] = v3;
  v16 = v4;
  if (v4)
  {
    v8 = (unint64_t *)&v4->__shared_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v7, (uint64_t)v15);
  v10 = v16;
  if (!v16)
    goto LABEL_11;
  v11 = (unint64_t *)&v16->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    if (!v4)
      return;
  }
  else
  {
LABEL_11:
    if (!v4)
      return;
  }
  v13 = (unint64_t *)&v4->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void abm::client::Transport::reconnect(abm::client::Transport *this)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)this;
  v2 = (uint64_t *)(*(_QWORD *)this + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___ZN3abm6client9Transport5State9reconnectEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_23_0;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void abm::client::Transport::checkIn(abm::client::Transport *this)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)this + 8;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State7checkInEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_24_0;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_12;
  block[4] = v2;
  block[5] = &v5;
  v3 = *(NSObject **)(v1 + 24);
  if (*(_QWORD *)(v1 + 32))
    dispatch_async_and_wait(v3, block);
  else
    dispatch_sync(v3, block);
}

void abm::client::Transport::checkOut(abm::client::Transport *this)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)this;
  v2 = (uint64_t *)(*(_QWORD *)this + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___ZN3abm6client9Transport5State8checkOutEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_33;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void abm::client::Transport::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *aBlock;
  dispatch_object_t object;
  std::string v9;

  v4 = *a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v5 = *(void **)a3;
    if (!*(_QWORD *)a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = *(std::string *)a2;
  v5 = *(void **)a3;
  if (*(_QWORD *)a3)
LABEL_5:
    v5 = _Block_copy(v5);
LABEL_6:
  v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  object = v6;
  if (v6)
    dispatch_retain(v6);
  abm::client::Transport::State::setEventHandler(v4, (uint64_t)&v9, (uint64_t)&aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_1BF325194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t *v6;
  NSObject *v7;
  _QWORD v8[5];
  std::string __p;
  void *aBlock;
  dispatch_object_t object;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1174405120;
  v8[2] = ___ZN3abm6client9Transport5State15setEventHandlerENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS3_10shared_ptrINS0_5EventEEEEEE_block_invoke;
  v8[3] = &__block_descriptor_tmp_34;
  v8[4] = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v5 = *(void **)a3;
    if (!*(_QWORD *)a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  __p = *(std::string *)a2;
  v5 = *(void **)a3;
  if (*(_QWORD *)a3)
LABEL_5:
    v5 = _Block_copy(v5);
LABEL_6:
  v6 = (uint64_t *)(a1 + 8);
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  object = v7;
  if (v7)
    dispatch_retain(v7);
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v6, (uint64_t)v8);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void abm::client::Transport::eventsOn(abm::client::Transport *this)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)this + 8;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_35;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_12;
  block[4] = v2;
  block[5] = &v5;
  v3 = *(NSObject **)(v1 + 24);
  if (*(_QWORD *)(v1 + 32))
    dispatch_async_and_wait(v3, block);
  else
    dispatch_sync(v3, block);
}

void abm::client::Transport::eventsOff(abm::client::Transport *this)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)this + 8;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_36;
  v4[4] = v1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_12;
  block[4] = v2;
  block[5] = &v5;
  v3 = *(NSObject **)(v1 + 24);
  if (*(_QWORD *)(v1 + 32))
    dispatch_async_and_wait(v3, block);
  else
    dispatch_sync(v3, block);
}

void std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 24), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State*)#1}::operator() const(abm::client::Transport::State*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__"
                     "110shared_ptrIT_EEPSA_EUlPS7_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5Sta"
                                "teEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

uint64_t std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State*)#1}::operator() const(abm::client::Transport::State*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

void abm::client::Transport::State::handleServerError_sync(_QWORD *a1, xpc::object *a2)
{
  NSObject *v4;
  os_unfair_lock_s *v5;
  ConnectionObserver *v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  const void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  void *v24;
  xpc_object_t *v25;
  xpc_object_t object[2];
  void *v27;
  void *v28;
  void *aBlock;
  int v30;
  uint8_t buf[4];
  xpc_object_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a1[14];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    xpc::object::to_string(a2);
    v25 = SHIBYTE(v27) >= 0 ? object : (xpc_object_t *)object[0];
    *(_DWORD *)buf = 136315138;
    v32 = v25;
    _os_log_error_impl(&dword_1BF308000, v4, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    if (SHIBYTE(v27) < 0)
      operator delete(object[0]);
  }
  if (*(_QWORD *)a2 != MEMORY[0x1E0C81288])
  {
    pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    v5 = (os_unfair_lock_s *)off_1ED02D398;
    if (!off_1ED02D398)
    {
      v6 = (ConnectionObserver *)operator new(0x90uLL);
      ConnectionObserver::ConnectionObserver(v6);
      ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v6, (uint64_t *)object);
      v7 = *(_OWORD *)object;
      object[0] = 0;
      object[1] = 0;
      v8 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
      off_1ED02D398 = v7;
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
      v11 = (std::__shared_weak_count *)object[1];
      if (object[1])
      {
        v12 = (unint64_t *)((char *)object[1] + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      v5 = (os_unfair_lock_s *)off_1ED02D398;
    }
    v14 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    if (*(&off_1ED02D398 + 1))
    {
      v15 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    v17 = (void *)MEMORY[0x1E0C809B0];
    object[0] = (xpc_object_t)MEMORY[0x1E0C809B0];
    object[1] = (xpc_object_t)0x40000000;
    v27 = ___ZN18ConnectionObserver7suspendEv_block_invoke;
    v28 = &__block_descriptor_tmp_4_0;
    aBlock = v5;
    os_unfair_lock_lock(v5 + 22);
    ___ZN18ConnectionObserver7suspendEv_block_invoke((uint64_t)object);
    os_unfair_lock_unlock(v5 + 22);
    if (v14)
    {
      v18 = (unint64_t *)&v14->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    object[0] = xpc_null_create();
    ctu::XpcClient::setServer_sync();
    xpc_release(object[0]);
    v20 = (const void *)a1[24];
    if (v20 && a1[25])
    {
      v21 = _Block_copy(v20);
      v22 = v21;
      v23 = a1[25];
      object[0] = v17;
      object[1] = (xpc_object_t)1174405120;
      v27 = ___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke;
      v28 = &__block_descriptor_tmp_7;
      if (v21)
        v24 = _Block_copy(v21);
      else
        v24 = 0;
      aBlock = v24;
      v30 = 4;
      dispatch_async(v23, object);
      if (aBlock)
        _Block_release(aBlock);
      if (v22)
        _Block_release(v22);
    }
  }
}

void sub_1BF325794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void abm::client::Transport::State::handleMessage_sync(uint64_t a1, xpc::object *a2)
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  size_t v19;
  const void *p_p;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  char v26;
  const void *v27;
  size_t v28;
  uint64_t *v29;
  int v30;
  uint64_t *v31;
  size_t v32;
  size_t v33;
  int v34;
  int v35;
  const void *v36;
  size_t v37;
  size_t v38;
  int v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  const void *v44;
  void *v45;
  NSObject *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  void *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  void **v58;
  _QWORD aBlock[6];
  std::__shared_weak_count *v60;
  void *v61;
  dispatch_object_t object;
  xpc_object_t v63;
  void *__p;
  uint64_t v65;
  void (*v66)(_QWORD *);
  void *v67;
  void *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  uint8_t buf[16];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    xpc::object::to_string(a2);
    v58 = SHIBYTE(v66) >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v58;
    _os_log_debug_impl(&dword_1BF308000, v4, OS_LOG_TYPE_DEBUG, "#D Message From Server: %s", buf, 0xCu);
    if (SHIBYTE(v66) < 0)
      operator delete(__p);
  }
  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5 || (v6 = *(_QWORD *)(a1 + 8), (v7 = std::__shared_weak_count::lock(v5)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v8 = v7;
  p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
  do
    v10 = __ldxr(p_shared_weak_owners);
  while (__stxr(v10 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v8);
    memset(buf, 170, sizeof(buf));
    v13 = *(void **)a2;
    v63 = v13;
    if (v13)
      goto LABEL_10;
LABEL_12:
    v63 = xpc_null_create();
    goto LABEL_13;
  }
  memset(buf, 170, sizeof(buf));
  v13 = *(void **)a2;
  v63 = v13;
  if (!v13)
    goto LABEL_12;
LABEL_10:
  xpc_retain(v13);
LABEL_13:
  v14 = (void *)MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client9Transport5State18handleMessage_syncEN3xpc4dictE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_9;
  aBlock[4] = a1;
  aBlock[5] = v6;
  v60 = v8;
  do
    v15 = __ldxr(p_shared_weak_owners);
  while (__stxr(v15 + 1, p_shared_weak_owners));
  v16 = _Block_copy(aBlock);
  v17 = *(NSObject **)(a1 + 24);
  if (v17)
    dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  v61 = v16;
  object = v17;
  abm::client::Event::create(&v63, (uint64_t)&v61, buf);
  if (object)
    dispatch_release(object);
  if (v61)
    _Block_release(v61);
  xpc_release(v63);
  v63 = 0;
  abm::client::Event::State::name(**(xpc_object_t ***)buf);
  v18 = SHIBYTE(v66);
  if (SHIBYTE(v66) >= 0)
    v19 = HIBYTE(v66);
  else
    v19 = v65;
  if (v19 == strlen((const char *)kValueInvalid))
  {
    if (SHIBYTE(v66) >= 0)
      p_p = &__p;
    else
      p_p = __p;
    v21 = memcmp(p_p, (const void *)kValueInvalid, v19) == 0;
    if ((v18 & 0x80000000) == 0)
    {
LABEL_29:
      if (v21)
        goto LABEL_98;
      goto LABEL_33;
    }
  }
  else
  {
    v21 = 0;
    if ((SHIBYTE(v66) & 0x80000000) == 0)
      goto LABEL_29;
  }
  operator delete(__p);
  if (v21)
    goto LABEL_98;
LABEL_33:
  v22 = *(_QWORD *)(a1 + 208);
  abm::client::Event::State::name(**(xpc_object_t ***)buf);
  v25 = *(uint64_t **)(v22 + 8);
  v23 = (uint64_t *)(v22 + 8);
  v24 = v25;
  v26 = HIBYTE(v66);
  if (!v25)
    goto LABEL_68;
  if (SHIBYTE(v66) >= 0)
    v27 = &__p;
  else
    v27 = __p;
  if (SHIBYTE(v66) >= 0)
    v28 = HIBYTE(v66);
  else
    v28 = v65;
  v29 = v23;
  do
  {
    while (1)
    {
      v30 = *((char *)v24 + 55);
      v31 = v30 >= 0 ? v24 + 4 : (uint64_t *)v24[4];
      v32 = v30 >= 0 ? *((unsigned __int8 *)v24 + 55) : v24[5];
      v33 = v28 >= v32 ? v32 : v28;
      v34 = memcmp(v31, v27, v33);
      if (v34)
        break;
      if (v32 >= v28)
        goto LABEL_55;
LABEL_41:
      v24 = (uint64_t *)v24[1];
      if (!v24)
        goto LABEL_56;
    }
    if (v34 < 0)
      goto LABEL_41;
LABEL_55:
    v29 = v24;
    v24 = (uint64_t *)*v24;
  }
  while (v24);
LABEL_56:
  if (v29 == v23)
    goto LABEL_68;
  v35 = *((char *)v29 + 55);
  if (v35 >= 0)
    v36 = v29 + 4;
  else
    v36 = (const void *)v29[4];
  if (v35 >= 0)
    v37 = *((unsigned __int8 *)v29 + 55);
  else
    v37 = v29[5];
  if (v37 >= v28)
    v38 = v28;
  else
    v38 = v37;
  v39 = memcmp(v27, v36, v38);
  if (v39)
  {
    if (v39 < 0)
      goto LABEL_68;
  }
  else if (v28 < v37)
  {
LABEL_68:
    v29 = v23;
  }
  if (v26 < 0)
  {
    operator delete(__p);
    if ((uint64_t *)(*(_QWORD *)(a1 + 208) + 8) != v29)
      goto LABEL_73;
  }
  else
  {
    if ((uint64_t *)(*(_QWORD *)(a1 + 208) + 8) == v29)
      goto LABEL_98;
LABEL_73:
    v41 = *(_QWORD *)buf;
    v40 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v42 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    v44 = (const void *)v29[7];
    if (v44)
      v45 = _Block_copy(v44);
    else
      v45 = 0;
    v46 = v29[8];
    __p = v14;
    v65 = 1174405120;
    v66 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEclIJS6_EEEvDpT__block_invoke;
    v67 = &__block_descriptor_tmp_10;
    if (v45)
    {
      v68 = _Block_copy(v45);
      v69 = v41;
      v70 = v40;
      if (!v40)
        goto LABEL_85;
LABEL_83:
      v47 = (unint64_t *)&v40->__shared_owners_;
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    else
    {
      v68 = 0;
      v69 = v41;
      v70 = v40;
      if (v40)
        goto LABEL_83;
    }
LABEL_85:
    dispatch_async(v46, &__p);
    v49 = v70;
    if (!v70)
      goto LABEL_89;
    v50 = (unint64_t *)&v70->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
      v52 = v68;
      if (v68)
LABEL_90:
        _Block_release(v52);
    }
    else
    {
LABEL_89:
      v52 = v68;
      if (v68)
        goto LABEL_90;
    }
    if (v45)
      _Block_release(v45);
    if (v40)
    {
      v53 = (unint64_t *)&v40->__shared_owners_;
      do
        v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
  }
LABEL_98:
  v55 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v56 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  if (v60)
    std::__shared_weak_count::__release_weak(v60);
  std::__shared_weak_count::__release_weak(v8);
}

void sub_1BF325D4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, char a17, uint64_t a18, xpc_object_t object)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void abm::client::Transport::State::~State(abm::client::Transport::State *this)
{
  void *v1;

  abm::client::Transport::State::~State(this);
  operator delete(v1);
}

{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;
  const void *v6;

  *(_QWORD *)this = &off_1E78F7130;
  *((_QWORD *)this + 9) = &unk_1E78F7160;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 27);
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
    }
  }
  v5 = *((_QWORD *)this + 25);
  if (v5)
    dispatch_release(v5);
  v6 = (const void *)*((_QWORD *)this + 24);
  if (v6)
    _Block_release(v6);
  if (*((char *)this + 191) < 0)
  {
    operator delete(*((void **)this + 21));
    if ((*((char *)this + 167) & 0x80000000) == 0)
      goto LABEL_12;
LABEL_14:
    operator delete(*((void **)this + 18));
    goto LABEL_12;
  }
  if (*((char *)this + 167) < 0)
    goto LABEL_14;
LABEL_12:
  *((_QWORD *)this + 9) = off_1E78F71F0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  ctu::XpcClient::~XpcClient(this);
}

void `non-virtual thunk to'abm::client::Transport::State::~State(abm::client::Transport::State *this)
{
  abm::client::Transport::State::~State((abm::client::Transport::State *)((char *)this - 72));
}

{
  void *v1;

  abm::client::Transport::State::~State((abm::client::Transport::State *)((char *)this - 72));
  operator delete(v1);
}

uint64_t ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 10;
  strcpy(a1, "abm.client");
}

uint64_t ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F71F0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_1E78F71F0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::__on_zero_shared(uint64_t a1)
{
  char **v1;

  v1 = *(char ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8ca"
                     "llbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27_"
                     "_shared_ptr_default_deleteISN_SN_EE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8"
                                "dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4"
                                "pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(char *a1)
{
  NSObject *v2;
  const void *v3;

  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(*((_QWORD *)a1 + 1));
    v2 = *((_QWORD *)a1 + 8);
    if (v2)
      dispatch_release(v2);
    v3 = (const void *)*((_QWORD *)a1 + 7);
    if (v3)
      _Block_release(v3);
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c72_ZTSN8dispatch5blockIU13block_pointerFvN3abm6client15TransportStatusEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c72_ZTSN8dispatch5blockIU13block_pointerFvN3abm6client15TransportStatusEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZN3abm6client9Transport5State18handleMessage_syncEN3xpc4dictE_block_invoke(_QWORD *a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  xpc_object_t reply;
  uint64_t v8;
  xpc_object_t v9;
  std::__shared_weak_count *v10;
  xpc_object_t v11;
  NSObject *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  void *p_p;
  void *__p;
  char v17;
  std::__shared_weak_count *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    v19 = v6;
    if (v6)
    {
      if (!a1[5])
      {
        v10 = v6;
LABEL_19:
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v14 = __ldaxr(p_shared_owners);
        while (__stlxr(v14 - 1, p_shared_owners));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        return;
      }
      reply = xpc_dictionary_create_reply(*a2);
      v8 = MEMORY[0x1E0C812F8];
      if (reply || (reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1C3B88380](reply) == v8)
        {
          xpc_retain(reply);
          v9 = reply;
        }
        else
        {
          v9 = xpc_null_create();
        }
      }
      else
      {
        v9 = xpc_null_create();
        reply = 0;
      }
      xpc_release(reply);
      if (MEMORY[0x1C3B88380](v9) == v8)
      {
        if (v9)
        {
          xpc_retain(v9);
          v11 = v9;
        }
        else
        {
          v11 = xpc_null_create();
        }
        if (MEMORY[0x1C3B88380](*(_QWORD *)(v5 + 40)) == MEMORY[0x1E0C812E0])
          xpc_connection_send_message(*(xpc_connection_t *)(v5 + 40), v11);
        xpc_release(v11);
        v12 = *(NSObject **)(v5 + 112);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          xpc::object::to_string((xpc::object *)a2);
          if (v17 >= 0)
            p_p = &__p;
          else
            p_p = __p;
          *(_DWORD *)buf = 136315138;
          v21 = p_p;
          _os_log_debug_impl(&dword_1BF308000, v12, OS_LOG_TYPE_DEBUG, "#D Sent reply for: %s", buf, 0xCu);
          if (v17 < 0)
            operator delete(__p);
        }
      }
      xpc_release(v9);
      v10 = v19;
      if (v19)
        goto LABEL_19;
    }
  }
}

void sub_1BF326264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  void *v13;

  xpc_release(v13);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEclIJS6_EEEvDpT__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v2 = a1[4];
  v4 = a1[5];
  v3 = (std::__shared_weak_count *)a1[6];
  v10 = v4;
  v11 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v10);
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_1BF3263A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  unint64_t *p_shared_owners;
  unint64_t v12;

  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_32c83_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(_QWORD *a1, _QWORD *a2)
{
  void *result;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  result = (void *)a2[4];
  if (result)
    result = _Block_copy(result);
  v6 = a2[5];
  v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

void __destroy_helper_block_e8_32c83_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  const void *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
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
    v5 = *(const void **)(a1 + 32);
    if (!v5)
      return;
  }
  else
  {
LABEL_5:
    v5 = *(const void **)(a1 + 32);
    if (!v5)
      return;
  }
  _Block_release(v5);
}

void ___ZN3abm6client9Transport5State4initEv_block_invoke(uint64_t a1)
{
  abm::client::Transport::State::reconnect_sync(*(dispatch_queue_t **)(a1 + 32));
}

void abm::client::Transport::State::reconnect_sync(dispatch_queue_t *this)
{
  const char **v2;
  xpc_connection_t mach_service;
  xpc_object_t v4;
  NSObject *v5;
  _QWORD *v6;
  os_unfair_lock_s *v7;
  ConnectionObserver *v8;
  __int128 v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  xpc_object_t object;
  uint64_t buf[3];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (const char **)(this + 18);
  if (*((char *)this + 167) < 0)
  {
    mach_service = xpc_connection_create_mach_service(*v2, this[3], 2uLL);
    if (mach_service)
      goto LABEL_3;
  }
  else
  {
    mach_service = xpc_connection_create_mach_service((const char *)v2, this[3], 2uLL);
    if (mach_service)
    {
LABEL_3:
      v4 = mach_service;
      object = mach_service;
LABEL_6:
      xpc_retain(v4);
      goto LABEL_7;
    }
  }
  v4 = xpc_null_create();
  object = v4;
  if (v4)
    goto LABEL_6;
  v4 = 0;
  object = xpc_null_create();
LABEL_7:
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  v5 = this[14];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = this + 21;
    if (*((char *)this + 191) < 0)
      v6 = (_QWORD *)*v6;
    LODWORD(buf[0]) = 136315138;
    *(uint64_t *)((char *)buf + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1BF308000, v5, OS_LOG_TYPE_DEFAULT, "#I [%s] Connecting to server", (uint8_t *)buf, 0xCu);
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  v7 = (os_unfair_lock_s *)off_1ED02D398;
  if (!off_1ED02D398)
  {
    v8 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v8);
    ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v8, buf);
    v9 = *(_OWORD *)buf;
    memset(buf, 0, 16);
    v10 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    off_1ED02D398 = v9;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)buf[1];
    if (buf[1])
    {
      v14 = (unint64_t *)(buf[1] + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v7 = (os_unfair_lock_s *)off_1ED02D398;
  }
  v16 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
  if (*(&off_1ED02D398 + 1))
  {
    v17 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  ConnectionObserver::resume(v7);
  if (v16)
  {
    v19 = (unint64_t *)&v16->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  xpc_release(v4);
}

void sub_1BF3267D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object)
{
  void *v12;
  void *v13;

  operator delete(v13);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  xpc_release(v12);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State7performENSt3__110shared_ptrINS0_7CommandEEE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8[2];

  v2 = a1[4];
  v3 = (std::__shared_weak_count *)a1[6];
  v8[0] = a1[5];
  v8[1] = (uint64_t)v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  abm::client::Transport::State::perform_sync(v2, v8);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1BF326900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::perform_sync(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  ConnectionObserver *v26;
  __int128 v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  const void *v39;
  NSObject *v40;
  void *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  _QWORD v47[6];
  std::__shared_weak_count *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  __int128 aBlock;
  void (*v52)(uint64_t *);
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  _QWORD block[4];
  void *v58;

  if (!*a2)
    return;
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3 || (v5 = *(_QWORD *)(a1 + 8), (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 1174405120;
  v47[2] = ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke;
  v47[3] = &__block_descriptor_tmp_18;
  v47[4] = a1;
  v47[5] = v5;
  v48 = v7;
  do
    v13 = __ldxr(p_shared_weak_owners);
  while (__stxr(v13 + 1, p_shared_weak_owners));
  v14 = (std::__shared_weak_count *)a2[1];
  v49 = *a2;
  v50 = v14;
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v17 || (v18 = *(_QWORD *)(a1 + 8), (v19 = std::__shared_weak_count::lock(v17)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v20 = v19;
  v21 = (unint64_t *)&v19->__shared_weak_owners_;
  do
    v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
  v23 = (unint64_t *)&v19->__shared_owners_;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v20);
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  v25 = off_1ED02D398;
  if (!off_1ED02D398)
  {
    v26 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v26);
    ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::make_shared_ptr<ConnectionObserver>((uint64_t)v26, (uint64_t *)&aBlock);
    v27 = aBlock;
    aBlock = 0uLL;
    v28 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
    off_1ED02D398 = v27;
    if (v28)
    {
      v29 = (unint64_t *)&v28->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = (std::__shared_weak_count *)*((_QWORD *)&aBlock + 1);
    if (*((_QWORD *)&aBlock + 1))
    {
      v32 = (unint64_t *)(*((_QWORD *)&aBlock + 1) + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v25 = off_1ED02D398;
  }
  v34 = (std::__shared_weak_count *)*(&off_1ED02D398 + 1);
  if (*(&off_1ED02D398 + 1))
  {
    v35 = (unint64_t *)(*(&off_1ED02D398 + 1) + 8);
    do
      v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  *(_QWORD *)&aBlock = v12;
  *((_QWORD *)&aBlock + 1) = 1174405120;
  v52 = ___ZN3abm6client9Transport5State10gateServerIU13block_pointerFvvEEEvT__block_invoke;
  v53 = &unk_1E78F7410;
  v55 = v18;
  v56 = v20;
  do
    v37 = __ldxr(v21);
  while (__stxr(v37 + 1, v21));
  v54 = v47;
  v38 = _Block_copy(&aBlock);
  v39 = v38;
  v40 = *(NSObject **)(v25 + 136);
  block[0] = v12;
  block[1] = 1174405120;
  block[2] = ___ZN18ConnectionObserver4gateEN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_20;
  if (v38)
  {
    v58 = _Block_copy(v38);
    dispatch_async(v40, block);
    v41 = v58;
    if (!v58)
      goto LABEL_45;
    goto LABEL_44;
  }
  v58 = 0;
  dispatch_async(v40, block);
  v41 = v58;
  if (v58)
LABEL_44:
    _Block_release(v41);
LABEL_45:
  if (v39)
    _Block_release(v39);
  if (v34)
  {
    v42 = (unint64_t *)&v34->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (v56)
    std::__shared_weak_count::__release_weak(v56);
  std::__shared_weak_count::__release_weak(v20);
  v44 = v50;
  if (v50)
  {
    v45 = (unint64_t *)&v50->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  if (v48)
    std::__shared_weak_count::__release_weak(v48);
  std::__shared_weak_count::__release_weak(v7);
}

void sub_1BF326CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17)
{
  std::__shared_weak_count *v17;
  std::__shared_weak_count *v18;
  void *v19;

  operator delete(v19);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  std::__shared_weak_count::__release_weak(v18);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  std::__shared_weak_count::__release_weak(v17);
  _Unwind_Resume(a1);
}

void ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD block[6];
  std::__shared_weak_count *v16;

  v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = a1[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_1E78F7378;
  block[5] = v5;
  v16 = v7;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  block[4] = a2;
  dispatch_async(v8, block);
  v11 = v16;
  if (v16)
  {
    v12 = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
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
}

void ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  NSObject *v5;
  uint64_t v6;
  xpc_object_t v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  _xpc_connection_s *v18;
  NSObject *v19;
  const void *v20;
  std::string *v21;
  xpc_object_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  _QWORD aBlock[6];
  std::__shared_weak_count *v29;
  std::string __p;
  uint64_t v31;
  std::__shared_weak_count *v32;
  std::string v33;
  std::__shared_weak_count *v35;
  __int128 buf;
  void (*v37)(uint64_t, xpc_object_t);
  void *v38;
  const void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    return;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = std::__shared_weak_count::lock(v2);
  v35 = v4;
  if (!v4)
    return;
  if (!*(_QWORD *)(a1 + 40))
  {
    v8 = v4;
LABEL_49:
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    return;
  }
  memset(&v33, 170, sizeof(v33));
  abm::client::Command::State::name(**(xpc_object_t ***)(a1 + 56));
  v5 = *(NSObject **)(v3 + 112);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v21 = &v33;
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v21 = (std::string *)v33.__r_.__value_.__r.__words[0];
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v21;
    _os_log_debug_impl(&dword_1BF308000, v5, OS_LOG_TYPE_DEBUG, "#D Performing %s", (uint8_t *)&buf, 0xCu);
    v6 = **(_QWORD **)(a1 + 56);
    if (!*(_QWORD *)v6)
      goto LABEL_26;
  }
  else
  {
    v6 = **(_QWORD **)(a1 + 56);
    if (!*(_QWORD *)v6)
      goto LABEL_26;
  }
  if (*(_QWORD *)(v6 + 8))
  {
    v7 = *(xpc_object_t *)(v6 + 16);
    if (v7)
      xpc_retain(*(xpc_object_t *)(v6 + 16));
    else
      v7 = xpc_null_create();
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke_15;
    aBlock[3] = &__block_descriptor_tmp_17_0;
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(std::__shared_weak_count **)(a1 + 48);
    aBlock[4] = v3;
    aBlock[5] = v11;
    v29 = v10;
    if (v10)
    {
      p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
      do
        v13 = __ldxr(p_shared_weak_owners);
      while (__stxr(v13 + 1, p_shared_weak_owners));
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
    else
      __p = v33;
    v14 = *(std::__shared_weak_count **)(a1 + 64);
    v31 = *(_QWORD *)(a1 + 56);
    v32 = v14;
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v17 = _Block_copy(aBlock);
    if (MEMORY[0x1C3B88380](*(_QWORD *)(v3 + 40)) == MEMORY[0x1E0C812E0])
    {
      v18 = *(_xpc_connection_s **)(v3 + 40);
      v19 = *(NSObject **)(v3 + 24);
      *(_QWORD *)&buf = v9;
      *((_QWORD *)&buf + 1) = 1174405120;
      v37 = ___ZN3abm6client9Transport5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS3_6objectEEEE_block_invoke;
      v38 = &__block_descriptor_tmp_22_0;
      v20 = v17 ? _Block_copy(v17) : 0;
      v39 = v20;
      xpc_connection_send_message_with_reply(v18, v7, v19, &buf);
      if (v39)
        _Block_release(v39);
    }
    if (v17)
      _Block_release(v17);
    xpc_release(v7);
    v23 = v32;
    if (v32)
    {
      v24 = (unint64_t *)&v32->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v29)
      std::__shared_weak_count::__release_weak(v29);
    goto LABEL_46;
  }
LABEL_26:
  v22 = *(xpc_object_t *)(v6 + 16);
  if (v22)
    xpc_retain(*(xpc_object_t *)(v6 + 16));
  else
    v22 = xpc_null_create();
  if (MEMORY[0x1C3B88380](*(_QWORD *)(v3 + 40)) == MEMORY[0x1E0C812E0])
    xpc_connection_send_message(*(xpc_connection_t *)(v3 + 40), v22);
  xpc_release(v22);
LABEL_46:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  v8 = v35;
  if (v35)
    goto LABEL_49;
}

void sub_1BF327250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke_15(uint64_t a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;
  int v13;
  ctu *value;
  void *v15;
  __CFDictionary *v16;
  CFTypeID v17;
  xpc_object_t v18;
  CFTypeID v19;
  const void *v20;
  NSObject *v21;
  _BOOL4 v22;
  _QWORD *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t *v27;
  CFMutableDictionaryRef v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  CFMutableDictionaryRef v33;
  std::__shared_weak_count *v34;
  __CFDictionary *cf;
  xpc_object_t cfa;
  _BYTE v37[12];
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3)
    return;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = std::__shared_weak_count::lock(v3);
  v34 = v6;
  if (!v6)
    return;
  if (!*(_QWORD *)(a1 + 40))
  {
    v10 = v6;
LABEL_52:
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v32 = __ldaxr(p_shared_owners);
    while (__stlxr(v32 - 1, p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    return;
  }
  v7 = *a2;
  v8 = MEMORY[0x1E0C812F8];
  if (v7 && MEMORY[0x1C3B88380](v7) == v8)
  {
    xpc_retain(v7);
  }
  else
  {
    v7 = xpc_null_create();
    if (!v7)
    {
      v7 = xpc_null_create();
      v9 = 0;
      goto LABEL_11;
    }
  }
  xpc_retain(v7);
  v9 = v7;
LABEL_11:
  *(_QWORD *)v37 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v12 = Mutable;
  if (Mutable)
    *(_QWORD *)v37 = Mutable;
  if (MEMORY[0x1C3B88380](v7) != v8)
  {
    v13 = -534716416;
    if (!v12)
      goto LABEL_32;
    goto LABEL_29;
  }
  value = (ctu *)xpc_dictionary_get_value(v7, (const char *)kKeyCommandData);
  ctu::xpc_to_cf(value, v15);
  v16 = cf;
  if (cf)
  {
    v17 = CFGetTypeID(cf);
    if (v17 != CFDictionaryGetTypeID())
    {
      v16 = 0;
      *(_QWORD *)v37 = 0;
      if (!v12)
        goto LABEL_23;
      goto LABEL_22;
    }
    CFRetain(cf);
  }
  *(_QWORD *)v37 = cf;
  if (v12)
LABEL_22:
    CFRelease(v12);
LABEL_23:
  if (cf)
    CFRelease(cf);
  v18 = xpc_dictionary_get_value(v7, (const char *)kKeyCommandResult);
  cfa = v18;
  if (v18)
    xpc_retain(v18);
  else
    cfa = xpc_null_create();
  v13 = xpc::dyn_cast_or_default();
  xpc_release(cfa);
  v12 = v16;
  if (!v16)
  {
LABEL_32:
    v33 = 0;
    v20 = *(const void **)v37;
    if (!*(_QWORD *)v37)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_29:
  v19 = CFGetTypeID(v12);
  if (v19 != CFDictionaryGetTypeID())
    goto LABEL_32;
  v33 = v12;
  CFRetain(v12);
  v20 = *(const void **)v37;
  if (*(_QWORD *)v37)
LABEL_33:
    CFRelease(v20);
LABEL_34:
  xpc_release(v7);
  v21 = *(NSObject **)(v5 + 112);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v22)
    {
      v23 = (_QWORD *)(a1 + 56);
      if (*(char *)(a1 + 79) < 0)
        v23 = (_QWORD *)*v23;
      *(_DWORD *)v37 = 136315394;
      *(_QWORD *)&v37[4] = v23;
      v38 = 1024;
      v39 = v13;
      v24 = "#D Failure: %s Error: 0x%x";
      v25 = v21;
      v26 = 18;
      goto LABEL_45;
    }
  }
  else if (v22)
  {
    v30 = (_QWORD *)(a1 + 56);
    if (*(char *)(a1 + 79) < 0)
      v30 = (_QWORD *)*v30;
    *(_DWORD *)v37 = 136315138;
    *(_QWORD *)&v37[4] = v30;
    v24 = "#D Successful: %s";
    v25 = v21;
    v26 = 12;
LABEL_45:
    _os_log_debug_impl(&dword_1BF308000, v25, OS_LOG_TYPE_DEBUG, v24, v37, v26);
    v27 = *(uint64_t **)(a1 + 80);
    v28 = v33;
    if (!v33)
      goto LABEL_46;
LABEL_41:
    CFRetain(v28);
    v29 = *v27;
    *(_QWORD *)v37 = v28;
    CFRetain(v28);
    goto LABEL_47;
  }
  v27 = *(uint64_t **)(a1 + 80);
  v28 = v33;
  if (v33)
    goto LABEL_41;
LABEL_46:
  v29 = *v27;
  *(_QWORD *)v37 = 0;
LABEL_47:
  abm::client::Command::State::notify(v29, v13, (CFTypeRef *)v37);
  if (*(_QWORD *)v37)
    CFRelease(*(CFTypeRef *)v37);
  if (v28)
  {
    CFRelease(v28);
    CFRelease(v28);
  }
  xpc_release(v9);
  v10 = v34;
  if (v34)
    goto LABEL_52;
}

void sub_1BF3276D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, xpc_object_t object,char a21)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::string *v7;
  __int128 v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  v4 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 56), *(_QWORD *)(a2 + 64));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 56);
    a1[9] = *(_QWORD *)(a2 + 72);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  v9 = *(_QWORD *)(a2 + 88);
  a1[10] = *(_QWORD *)(a2 + 80);
  a1[11] = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
}

void sub_1BF327830(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 88);
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
    if ((*(char *)(a1 + 79) & 0x80000000) == 0)
    {
LABEL_6:
      v5 = *(std::__shared_weak_count **)(a1 + 48);
      if (!v5)
        return;
      goto LABEL_7;
    }
  }
  else
  {
LABEL_5:
    if ((*(char *)(a1 + 79) & 0x80000000) == 0)
      goto LABEL_6;
  }
  operator delete(*(void **)(a1 + 56));
  v5 = *(std::__shared_weak_count **)(a1 + 48);
  if (v5)
LABEL_7:
    std::__shared_weak_count::__release_weak(v5);
}

_QWORD *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    v5 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v5)
      return;
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  v5 = *(std::__shared_weak_count **)(a1 + 48);
  if (v5)
LABEL_6:
    std::__shared_weak_count::__release_weak(v5);
}

void ___ZN3abm6client9Transport5State10gateServerIU13block_pointerFvvEEEvT__block_invoke(uint64_t *a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      v5 = a1[5];
      if (v5)
        ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v5 + 8), a1[4]);
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

uint64_t ___ZN18ConnectionObserver4gateEN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZN3abm6client9Transport5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS3_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t objecta;

  if (object)
  {
    v3 = object;
    xpc_retain(object);
  }
  else
  {
    v3 = xpc_null_create();
  }
  v4 = *(_QWORD *)(a1 + 32);
  objecta = v3;
  v5 = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &objecta);
  xpc_release(objecta);
  xpc_release(v5);
}

void sub_1BF327ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZN3abm6client9Transport5State9reconnectEv_block_invoke(uint64_t a1)
{
  abm::client::Transport::State::reconnect_sync(*(dispatch_queue_t **)(a1 + 32));
}

void ___ZN3abm6client9Transport5State7checkInEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CFTypeRef v11;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (const void *)kCommandCheckIn;
  v3 = strlen((const char *)kCommandCheckIn);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v14 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v14) = v3;
    v5 = __dst;
    if (!v3)
      goto LABEL_9;
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  cf = 0;
  abm::client::Transport::State::createInternal_sync(&v15, v1, (uint64_t)__dst, 0, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v15);
  v8 = v16;
  if (!v16)
    goto LABEL_13;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (v10)
  {
LABEL_13:
    v11 = cf;
    if (!cf)
      goto LABEL_15;
    goto LABEL_14;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  v11 = cf;
  if (cf)
LABEL_14:
    CFRelease(v11);
LABEL_15:
  if (SHIBYTE(v14) < 0)
    operator delete(__dst[0]);
}

void sub_1BF327CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef((const void **)&a9);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::createInternal_sync(_QWORD *a1, uint64_t a2, uint64_t a3, int a4, __CFDictionary **a5)
{
  const __CFAllocator *v9;
  const __CFAllocator *v10;
  __CFDictionary *Mutable;
  uint64_t (*v12)(uint64_t);
  const __CFString **v13;
  __CFDictionary *v14;
  const void *v15;
  const void *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_weak_owners;
  unint64_t v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  __CFDictionary *v28;
  CFTypeID v29;
  __int128 v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  CFTypeRef v37;
  CFTypeRef cf;
  void *v39;
  dispatch_object_t object;
  void *value[2];
  _QWORD aBlock[6];
  std::__shared_weak_count *v43;
  int v44;
  CFTypeRef v45;
  std::string v46;
  void *v47;
  void *v48;

  v45 = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  ctu::cf::convert_copy();
  Mutable = *a5;
  v12 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!*a5)
    v12 = 0;
  if (!v12)
  {
    Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v14 = *a5;
    if (Mutable)
    {
      *a5 = Mutable;
      if (v14)
      {
        CFRelease(v14);
        Mutable = *a5;
      }
    }
    else
    {
      Mutable = *a5;
    }
  }
  v13 = (const __CFString **)kKeyClientName;
  if (*(char *)(a2 + 191) < 0)
    std::string::__init_copy_ctor_external(&v46, *(const std::string::value_type **)(a2 + 168), *(_QWORD *)(a2 + 176));
  else
    v46 = *(std::string *)(a2 + 168);
  value[0] = 0;
  ctu::cf::convert_copy((ctu::cf *)value, v13, (const char *)0x8000100, (uint64_t)v9, v10);
  v15 = value[0];
  v48 = value[0];
  value[0] = 0;
  ctu::cf::convert_copy();
  v16 = value[0];
  v47 = value[0];
  if (v15 && value[0])
  {
    CFDictionaryAddValue(Mutable, v15, value[0]);
  }
  else if (!value[0])
  {
    goto LABEL_15;
  }
  CFRelease(v16);
LABEL_15:
  if (v15)
    CFRelease(v15);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  *a1 = 0;
  a1[1] = 0;
  v17 = *(std::__shared_weak_count **)(a2 + 16);
  if (!v17 || (v18 = *(_QWORD *)(a2 + 8), (v19 = std::__shared_weak_count::lock(v17)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v20 = v19;
  p_shared_weak_owners = (unint64_t *)&v19->__shared_weak_owners_;
  do
    v22 = __ldxr(p_shared_weak_owners);
  while (__stxr(v22 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v19->__shared_owners_;
  do
    v24 = __ldaxr(p_shared_owners);
  while (__stlxr(v24 - 1, p_shared_owners));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v20);
  }
  v46.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v46.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client9Transport5State19createInternal_syncENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEENS0_15TransportStatusEN3ctu2cf11CFSharedRefI14__CFDictionaryEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_26;
  aBlock[4] = a2;
  aBlock[5] = v18;
  v43 = v20;
  do
    v25 = __ldxr(p_shared_weak_owners);
  while (__stxr(v25 + 1, p_shared_weak_owners));
  v44 = a4;
  v26 = _Block_copy(aBlock);
  v27 = *(NSObject **)(a2 + 24);
  if (v27)
    dispatch_retain(*(dispatch_object_t *)(a2 + 24));
  v46.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
  v46.__r_.__value_.__l.__size_ = (std::string::size_type)v27;
  if (!v26)
  {
    v39 = 0;
    object = v27;
    if (!v27)
      goto LABEL_34;
    goto LABEL_33;
  }
  v39 = _Block_copy(v26);
  object = v27;
  if (v27)
LABEL_33:
    dispatch_retain(v27);
LABEL_34:
  v28 = *a5;
  if (v28 && (v29 = CFGetTypeID(v28), v29 == CFDictionaryGetTypeID()))
  {
    cf = v28;
    CFRetain(v28);
  }
  else
  {
    cf = 0;
  }
  abm::client::Command::create((uint64_t)&v39, (ctu **)&cf, value);
  v30 = *(_OWORD *)value;
  value[0] = 0;
  value[1] = 0;
  v31 = (std::__shared_weak_count *)a1[1];
  *(_OWORD *)a1 = v30;
  if (v31)
  {
    v32 = (unint64_t *)&v31->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = (std::__shared_weak_count *)value[1];
  if (!value[1])
    goto LABEL_47;
  v35 = (unint64_t *)((char *)value[1] + 8);
  do
    v36 = __ldaxr(v35);
  while (__stlxr(v36 - 1, v35));
  if (v36)
  {
LABEL_47:
    v37 = cf;
    if (!cf)
      goto LABEL_49;
    goto LABEL_48;
  }
  ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
  std::__shared_weak_count::__release_weak(v34);
  v37 = cf;
  if (cf)
LABEL_48:
    CFRelease(v37);
LABEL_49:
  if (object)
    dispatch_release(object);
  if (v39)
    _Block_release(v39);
  CFRelease(v45);
  if (v46.__r_.__value_.__l.__size_)
    dispatch_release((dispatch_object_t)v46.__r_.__value_.__l.__size_);
  if (v46.__r_.__value_.__r.__words[0])
    _Block_release(v46.__r_.__value_.__l.__data_);
  if (v43)
    std::__shared_weak_count::__release_weak(v43);
  std::__shared_weak_count::__release_weak(v20);
}

void sub_1BF3280B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  uint64_t v25;

  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)(v25 - 80));
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)(v25 - 72));
  if (*(char *)(v25 - 89) < 0)
    operator delete(*(void **)(v25 - 112));
  _Unwind_Resume(a1);
}

void sub_1BF32815C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State19createInternal_syncENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEENS0_15TransportStatusEN3ctu2cf11CFSharedRefI14__CFDictionaryEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  _QWORD *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  const void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  const char *v14;
  __int128 __p;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void *aBlock;
  int v19;
  uint8_t buf[4];
  __int128 *p_p;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (!*(_QWORD *)(a1 + 40) || (v6 = (const void *)v3[24]) == 0 || !v3[25])
      {
LABEL_16:
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        return;
      }
      v7 = v3[14];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        switch(*(_DWORD *)(a1 + 56))
        {
          case 0:
            HIBYTE(v16) = 9;
            WORD4(__p) = 110;
            v14 = "CheckedIn";
            goto LABEL_27;
          case 1:
            HIBYTE(v16) = 10;
            strcpy((char *)&__p, "CheckedOut");
            break;
          case 2:
            HIBYTE(v16) = 8;
            strcpy((char *)&__p, "EventsOn");
            break;
          case 3:
            HIBYTE(v16) = 9;
            WORD4(__p) = 102;
            v14 = "EventsOff";
LABEL_27:
            *(_QWORD *)&__p = *(_QWORD *)v14;
            break;
          case 4:
            HIBYTE(v16) = 5;
            strcpy((char *)&__p, "Error");
            break;
          default:
            HIBYTE(v16) = 0;
            LOBYTE(__p) = 0;
            break;
        }
        *(_DWORD *)buf = 136315138;
        p_p = &__p;
        _os_log_debug_impl(&dword_1BF308000, v7, OS_LOG_TYPE_DEBUG, "#D %s", buf, 0xCu);
        if (SHIBYTE(v16) < 0)
          operator delete((void *)__p);
        v6 = (const void *)v3[24];
        v8 = *(_DWORD *)(a1 + 56);
        if (!v6)
        {
          v9 = 0;
          goto LABEL_9;
        }
      }
      else
      {
        v8 = *(_DWORD *)(a1 + 56);
      }
      v9 = _Block_copy(v6);
LABEL_9:
      v10 = v3[25];
      *(_QWORD *)&__p = MEMORY[0x1E0C809B0];
      *((_QWORD *)&__p + 1) = 1174405120;
      v16 = ___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke;
      v17 = &__block_descriptor_tmp_7;
      if (v9)
        v11 = _Block_copy(v9);
      else
        v11 = 0;
      aBlock = v11;
      v19 = v8;
      dispatch_async(v10, &__p);
      if (aBlock)
        _Block_release(aBlock);
      if (v9)
        _Block_release(v9);
      goto LABEL_16;
    }
  }
}

void sub_1BF3283F8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void ___ZN3abm6client9Transport5State8checkOutEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CFTypeRef v11;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (const void *)kCommandCheckOut;
  v3 = strlen((const char *)kCommandCheckOut);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v14 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v14) = v3;
    v5 = __dst;
    if (!v3)
      goto LABEL_9;
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  cf = 0;
  abm::client::Transport::State::createInternal_sync(&v15, v1, (uint64_t)__dst, 1, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v15);
  v8 = v16;
  if (!v16)
    goto LABEL_13;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (v10)
  {
LABEL_13:
    v11 = cf;
    if (!cf)
      goto LABEL_15;
    goto LABEL_14;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  v11 = cf;
  if (cf)
LABEL_14:
    CFRelease(v11);
LABEL_15:
  if (SHIBYTE(v14) < 0)
    operator delete(__dst[0]);
}

void sub_1BF3285A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef((const void **)&a9);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State15setEventHandlerENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS3_10shared_ptrINS0_5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  std::string::size_type size;
  std::string::size_type v8;
  BOOL v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t **v12;
  std::string *v13;
  uint64_t *v14;
  _QWORD *v15;
  const void *v16;
  const void *v17;
  int v18;
  const void *v19;
  size_t v20;
  size_t v21;
  int v22;
  int v23;
  _QWORD *v24;
  std::string *v25;
  uint64_t *v26;
  uint64_t *v27;
  void *v28;
  const void *v29;
  NSObject *v30;
  NSObject *object;
  std::string v32;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(const void **)(a1 + 64);
    if (v3)
    {
LABEL_3:
      v4 = _Block_copy(v3);
      v5 = *(NSObject **)(a1 + 72);
      object = v5;
      if (!v5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    v32 = *(std::string *)(a1 + 40);
    v3 = *(const void **)(a1 + 64);
    if (v3)
      goto LABEL_3;
  }
  v4 = 0;
  v5 = *(NSObject **)(a1 + 72);
  object = v5;
  if (v5)
LABEL_4:
    dispatch_retain(v5);
LABEL_5:
  v6 = SHIBYTE(v32.__r_.__value_.__r.__words[2]);
  size = v32.__r_.__value_.__l.__size_;
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = HIBYTE(v32.__r_.__value_.__r.__words[2]);
  else
    v8 = v32.__r_.__value_.__l.__size_;
  if (v8)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (!v5)
    {
LABEL_57:
      _Block_release(v4);
      goto LABEL_58;
    }
    v10 = *(uint64_t ***)(v2 + 208);
    v12 = v10 + 1;
    v11 = v10[1];
    if (v11)
    {
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v32;
      else
        v13 = (std::string *)v32.__r_.__value_.__r.__words[0];
      while (1)
      {
        v14 = v11;
        v17 = (const void *)v11[4];
        v15 = v11 + 4;
        v16 = v17;
        v18 = *((char *)v15 + 23);
        if (v18 >= 0)
          v19 = v15;
        else
          v19 = v16;
        if (v18 >= 0)
          v20 = *((unsigned __int8 *)v15 + 23);
        else
          v20 = v15[1];
        if (v20 >= v8)
          v21 = v8;
        else
          v21 = v20;
        v22 = memcmp(v13, v19, v21);
        if (v22)
        {
          if (v22 < 0)
            goto LABEL_17;
LABEL_31:
          v23 = memcmp(v19, v13, v21);
          if (v23)
          {
            if ((v23 & 0x80000000) == 0)
              goto LABEL_47;
          }
          else if (v20 >= v8)
          {
LABEL_47:
            v24 = v14;
            goto LABEL_48;
          }
          v11 = (uint64_t *)v14[1];
          if (!v11)
          {
            v12 = (uint64_t **)(v14 + 1);
            goto LABEL_41;
          }
        }
        else
        {
          if (v8 >= v20)
            goto LABEL_31;
LABEL_17:
          v11 = (uint64_t *)*v14;
          v12 = (uint64_t **)v14;
          if (!*v14)
            goto LABEL_41;
        }
      }
    }
    v14 = (uint64_t *)(v10 + 1);
LABEL_41:
    v24 = operator new(0x48uLL);
    v25 = (std::string *)(v24 + 4);
    if (v6 < 0)
    {
      std::string::__init_copy_ctor_external(v25, v32.__r_.__value_.__l.__data_, size);
    }
    else
    {
      *(_OWORD *)&v25->__r_.__value_.__l.__data_ = *(_OWORD *)&v32.__r_.__value_.__l.__data_;
      v24[6] = *((_QWORD *)&v32.__r_.__value_.__l + 2);
    }
    v24[7] = 0;
    v24[8] = 0;
    *v24 = 0;
    v24[1] = 0;
    v24[2] = v14;
    *v12 = v24;
    v26 = (uint64_t *)**v10;
    v27 = v24;
    if (v26)
    {
      *v10 = v26;
      v27 = *v12;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v10[1], v27);
    v10[2] = (uint64_t *)((char *)v10[2] + 1);
LABEL_48:
    v28 = _Block_copy(v4);
    v29 = (const void *)v24[7];
    v24[7] = v28;
    if (v29)
      _Block_release(v29);
    v5 = object;
    if (object)
      dispatch_retain(object);
    v30 = v24[8];
    v24[8] = object;
    if (v30)
      dispatch_release(v30);
  }
  if (v5)
    dispatch_release(v5);
  if (v4)
    goto LABEL_57;
LABEL_58:
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
}

void sub_1BF32883C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  operator delete(v16);
  dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  CFTypeRef v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (const void *)kCommandEventsOn;
  v3 = strlen((const char *)kCommandEventsOn);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v8 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v8 = v3 | 7;
    v9 = v8 + 1;
    v5 = (void **)operator new(v8 + 1);
    __dst[1] = v4;
    v21 = v9 | 0x8000000000000000;
    __dst[0] = v5;
LABEL_9:
    memmove(v5, v2, (size_t)v4);
    *((_BYTE *)v4 + (_QWORD)v5) = 0;
    v6 = *(_QWORD *)(v1 + 208);
    v7 = *(std::__shared_weak_count **)(v1 + 216);
    v18 = v7;
    if (!v7)
      goto LABEL_12;
    goto LABEL_10;
  }
  HIBYTE(v21) = v3;
  v5 = __dst;
  if (v3)
    goto LABEL_9;
  LOBYTE(__dst[0]) = 0;
  v6 = *(_QWORD *)(v1 + 208);
  v7 = *(std::__shared_weak_count **)(v1 + 216);
  v18 = v7;
  if (!v7)
    goto LABEL_12;
LABEL_10:
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
LABEL_12:
  abm::client::Transport::State::convert_sync((CFMutableDictionaryRef *)&cf, v1, *(_QWORD *)(v6 + 16));
  abm::client::Transport::State::createInternal_sync(&v22, v1, (uint64_t)__dst, 2, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v22);
  v12 = v23;
  if (v23)
  {
    v13 = (unint64_t *)&v23->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      v15 = cf;
      if (!cf)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v15 = cf;
  if (cf)
LABEL_17:
    CFRelease(v15);
LABEL_18:
  if (!v18)
    goto LABEL_22;
  v16 = (unint64_t *)&v18->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (v17)
  {
LABEL_22:
    if ((SHIBYTE(v21) & 0x80000000) == 0)
      return;
LABEL_27:
    operator delete(__dst[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  if (SHIBYTE(v21) < 0)
    goto LABEL_27;
}

void sub_1BF328A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a11);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::convert_sync(CFMutableDictionaryRef *a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v5;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  __CFArray *v9;
  _QWORD *v10;
  _QWORD *v11;
  const void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  std::string cf;
  void *v18;
  void *value;

  *a1 = 0;
  if (!a3)
    return;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = Mutable;
  if (Mutable)
    *a1 = Mutable;
  v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x1E0C9B378]);
  v10 = *(_QWORD **)(a2 + 208);
  v11 = (_QWORD *)*v10;
  if ((_QWORD *)*v10 != v10 + 1)
  {
    do
    {
      if (*((char *)v11 + 55) < 0)
        std::string::__init_copy_ctor_external(&cf, (const std::string::value_type *)v11[4], v11[5]);
      else
        cf = *(std::string *)(v11 + 4);
      value = 0;
      ctu::cf::convert_copy();
      v13 = value;
      v18 = value;
      if (value)
      {
        CFArrayAppendValue(v9, value);
        CFRelease(v13);
      }
      if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(cf.__r_.__value_.__l.__data_);
        v14 = (_QWORD *)v11[1];
        if (v14)
        {
          do
          {
LABEL_24:
            v15 = v14;
            v14 = (_QWORD *)*v14;
          }
          while (v14);
          goto LABEL_14;
        }
      }
      else
      {
        v14 = (_QWORD *)v11[1];
        if (v14)
          goto LABEL_24;
      }
      do
      {
        v15 = (_QWORD *)v11[2];
        v16 = *v15 == (_QWORD)v11;
        v11 = v15;
      }
      while (!v16);
LABEL_14:
      v11 = v15;
    }
    while (v15 != (_QWORD *)(*(_QWORD *)(a2 + 208) + 8));
  }
  cf.__r_.__value_.__r.__words[0] = 0;
  ctu::cf::convert_copy((ctu::cf *)&cf, (const __CFString **)kKeyEventsList, (const char *)0x8000100, (uint64_t)v5, v8);
  v12 = (const void *)cf.__r_.__value_.__r.__words[0];
  value = (void *)cf.__r_.__value_.__r.__words[0];
  cf.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
  if (v9)
  {
    CFRetain(v9);
    if (v12)
      CFDictionaryAddValue(v7, v12, v9);
    CFRelease(v9);
  }
  if (v12)
    CFRelease(v12);
  if (v9)
    CFRelease(v9);
}

void sub_1BF328C80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  const void *v4;
  va_list va;
  const void *v6;
  va_list va1;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v6 = va_arg(va2, const void *);
  v8 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va2);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v2);
  _Unwind_Resume(a1);
}

void sub_1BF328CC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void **v2;
  va_list va;

  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v2);
  _Unwind_Resume(a1);
}

void sub_1BF328CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, const void *a18)
{
  const void **v18;

  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a18);
  if (a16 < 0)
    operator delete(__p);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef(&a10);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v18);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  CFTypeRef v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  CFTypeRef cf;
  void *__dst[2];
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (const void *)kCommandEventsOff;
  v3 = strlen((const char *)kCommandEventsOff);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v8 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v8 = v3 | 7;
    v9 = v8 + 1;
    v5 = (void **)operator new(v8 + 1);
    __dst[1] = v4;
    v21 = v9 | 0x8000000000000000;
    __dst[0] = v5;
LABEL_9:
    memmove(v5, v2, (size_t)v4);
    *((_BYTE *)v4 + (_QWORD)v5) = 0;
    v6 = *(_QWORD *)(v1 + 208);
    v7 = *(std::__shared_weak_count **)(v1 + 216);
    v18 = v7;
    if (!v7)
      goto LABEL_12;
    goto LABEL_10;
  }
  HIBYTE(v21) = v3;
  v5 = __dst;
  if (v3)
    goto LABEL_9;
  LOBYTE(__dst[0]) = 0;
  v6 = *(_QWORD *)(v1 + 208);
  v7 = *(std::__shared_weak_count **)(v1 + 216);
  v18 = v7;
  if (!v7)
    goto LABEL_12;
LABEL_10:
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
LABEL_12:
  abm::client::Transport::State::convert_sync((CFMutableDictionaryRef *)&cf, v1, *(_QWORD *)(v6 + 16));
  abm::client::Transport::State::createInternal_sync(&v22, v1, (uint64_t)__dst, 3, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v22);
  v12 = v23;
  if (v23)
  {
    v13 = (unint64_t *)&v23->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
      v15 = cf;
      if (!cf)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v15 = cf;
  if (cf)
LABEL_17:
    CFRelease(v15);
LABEL_18:
  if (!v18)
    goto LABEL_22;
  v16 = (unint64_t *)&v18->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (v17)
  {
LABEL_22:
    if ((SHIBYTE(v21) & 0x80000000) == 0)
      return;
LABEL_27:
    operator delete(__dst[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  if (SHIBYTE(v21) < 0)
    goto LABEL_27;
}

void sub_1BF328F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a11);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::__on_zero_shared(uint64_t a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    v2 = (std::__shared_weak_count *)v1[1];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000001BF333DA5)
    return a1 + 24;
  if (((v3 & 0x80000001BF333DA5 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001BF333DA5))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001BF333DA5 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t __cxx_global_var_init_2()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1BF308000);
  }
  return result;
}

double abm::Overrides::Overrides(abm::Overrides *this)
{
  double result;

  *((_BYTE *)this + 48) = 0;
  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  *((_BYTE *)this + 48) = 0;
  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void abm::InitServer(abm *this, const char *a2, const abm::Overrides *a3)
{
  uint64_t v5;
  uint8_t v6[8];
  _QWORD block[7];

  if (qword_1EF57CC78 == -1)
  {
    v5 = qword_1EF57CC70;
    if (qword_1EF57CC70)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&qword_1EF57CC78, &__block_literal_global_0);
    v5 = qword_1EF57CC70;
    if (qword_1EF57CC70)
    {
LABEL_3:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = ___ZN3abm10InitServerEPKcRKNS_9OverridesE_block_invoke;
      block[3] = &__block_descriptor_tmp_8;
      block[4] = v5;
      block[5] = this;
      block[6] = a2;
      if (_MergedGlobals_1 != -1)
        dispatch_once(&_MergedGlobals_1, block);
      return;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1BF308000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed on loading BasebandManager library for initializing server", v6, 2u);
  }
}

void ___ZN3abm10InitServerEPKcRKNS_9OverridesE_block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  int v3;
  uint8_t v4[16];

  v1 = atomic_load((unsigned __int8 *)&qword_1EF57CC20);
  if ((v1 & 1) == 0)
  {
    v2 = a1;
    v3 = __cxa_guard_acquire(&qword_1EF57CC20);
    a1 = v2;
    if (v3)
    {
      off_1EF57CC18 = (uint64_t (*)(_QWORD, _QWORD))dlsym(*(void **)(v2 + 32), "AppleBasebandManagerInitServer");
      __cxa_guard_release(&qword_1EF57CC20);
      a1 = v2;
    }
  }
  if (off_1EF57CC18)
  {
    off_1EF57CC18(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1BF308000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed on loading AppleBasebandManagerInitServer", v4, 2u);
  }
}

void sub_1BF3293E4(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CC20);
  _Unwind_Resume(a1);
}

uint64_t abm::StartServer(abm *this, dispatch_group_s *a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *__handle;
  uint8_t buf[2];
  __int16 v11;

  if (qword_1EF57CC78 == -1)
  {
    v3 = qword_1EF57CC70;
    if (qword_1EF57CC70)
    {
LABEL_3:
      v4 = atomic_load((unsigned __int8 *)&qword_1EF57CC30);
      if ((v4 & 1) == 0)
      {
        __handle = (void *)v3;
        if (__cxa_guard_acquire(&qword_1EF57CC30))
        {
          off_1EF57CC28 = (uint64_t (*)(_QWORD))dlsym(__handle, "AppleBasebandManagerStartServer");
          __cxa_guard_release(&qword_1EF57CC30);
        }
      }
      if (off_1EF57CC28)
        return off_1EF57CC28(this);
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        return 0;
      v11 = 0;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Failed on loading AppleBasebandManagerStartServer";
      v8 = (uint8_t *)&v11;
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&qword_1EF57CC78, &__block_literal_global_0);
    v3 = qword_1EF57CC70;
    if (qword_1EF57CC70)
      goto LABEL_3;
  }
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    return 0;
  *(_WORD *)buf = 0;
  v6 = MEMORY[0x1E0C81028];
  v7 = "Failed on loading BasebandManager library for starting service";
  v8 = buf;
LABEL_12:
  _os_log_error_impl(&dword_1BF308000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
  return 0;
}

void sub_1BF32955C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CC30);
  _Unwind_Resume(a1);
}

uint64_t abm::StopServer(abm *this, dispatch_group_s *a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  void *__handle;

  if (qword_1EF57CC78 == -1)
  {
    v3 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return 0;
  }
  else
  {
    dispatch_once(&qword_1EF57CC78, &__block_literal_global_0);
    v3 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return 0;
  }
  v4 = atomic_load((unsigned __int8 *)&qword_1EF57CC40);
  if ((v4 & 1) == 0)
  {
    __handle = (void *)v3;
    if (__cxa_guard_acquire(&qword_1EF57CC40))
    {
      off_1EF57CC38 = (uint64_t (*)(_QWORD))dlsym(__handle, "AppleBasebandManagerStopServer");
      __cxa_guard_release(&qword_1EF57CC40);
    }
  }
  if (off_1EF57CC38)
    return off_1EF57CC38(this);
  return 0;
}

void sub_1BF329648(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CC40);
  _Unwind_Resume(a1);
}

uint64_t abm::ShutdownServer(abm *this, dispatch_group_s *a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  void *__handle;

  if (qword_1EF57CC78 == -1)
  {
    v3 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return 0;
  }
  else
  {
    dispatch_once(&qword_1EF57CC78, &__block_literal_global_0);
    v3 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return 0;
  }
  v4 = atomic_load((unsigned __int8 *)&qword_1EF57CC50);
  if ((v4 & 1) == 0)
  {
    __handle = (void *)v3;
    if (__cxa_guard_acquire(&qword_1EF57CC50))
    {
      off_1EF57CC48 = (uint64_t (*)(_QWORD))dlsym(__handle, "AppleBasebandManagerShutdownServer");
      __cxa_guard_release(&qword_1EF57CC50);
    }
  }
  if (off_1EF57CC48)
    return off_1EF57CC48(this);
  return 0;
}

void sub_1BF329734(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CC50);
  _Unwind_Resume(a1);
}

uint64_t abm::GetProfile(abm *this)
{
  uint64_t v1;
  _QWORD block[5];

  if (qword_1EF57CC78 == -1)
  {
    v1 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return abm::GetProfile(void)::sProfile;
  }
  else
  {
    dispatch_once(&qword_1EF57CC78, &__block_literal_global_0);
    v1 = qword_1EF57CC70;
    if (!qword_1EF57CC70)
      return abm::GetProfile(void)::sProfile;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN3abm10GetProfileEv_block_invoke;
  block[3] = &__block_descriptor_tmp_11_0;
  block[4] = v1;
  if (qword_1EF57CC58 == -1)
    return abm::GetProfile(void)::sProfile;
  dispatch_once(&qword_1EF57CC58, block);
  return abm::GetProfile(void)::sProfile;
}

void ___ZN3abm10GetProfileEv_block_invoke(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_1EF57CC68);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_1EF57CC68))
  {
    off_1EF57CC60 = (uint64_t (*)(void))dlsym(*(void **)(a1 + 32), "AppleBasebandManagerGetProfile");
    __cxa_guard_release(&qword_1EF57CC68);
  }
  if (off_1EF57CC60)
    abm::GetProfile(void)::sProfile = off_1EF57CC60();
}

void sub_1BF329890(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1EF57CC68);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3abmL11loadLibraryEv_block_invoke(capabilities::radio *a1)
{
  uint64_t result;

  result = capabilities::radio::vendor(a1);
  if ((result - 1) <= 2)
  {
    result = (uint64_t)dlopen(off_1E78F7718[(int)result - 1], 1);
    qword_1EF57CC70 = result;
  }
  return result;
}

void abm::client::CreateManager(dispatch_object_t object@<X1>, uint64_t a2@<X0>, std::__shared_weak_count_vtbl ***a3@<X8>)
{
  dispatch_object_t objecta;

  objecta = object;
  if (object)
    dispatch_retain(object);
  abm::client::Manager::create(a2, &objecta, a3);
  if (objecta)
    dispatch_release(objecta);
}

void sub_1BF329938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  _Unwind_Resume(exception_object);
}

void abm::client::RegisterEventHandler(uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t *v3;

  v3 = *a1;
  if (v3)
    abm::client::Manager::setEventHandler(v3, a2, a3);
}

void abm::client::PerformCommand(uint64_t **a1@<X0>, void *a2@<X2>, _QWORD *a3@<X3>, uint64_t a4@<X8>)
{
  xpc_object_t v8;
  void *v9;
  char *v10;
  __int128 v11;
  uint64_t *v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t object;
  xpc_object_t v16;

  if (*a1)
  {
    v8 = xpc_null_create();
    v9 = v8;
    if (a2)
    {
      xpc_retain(a2);
      xpc_release(v9);
    }
    else
    {
      a2 = v8;
    }
    object = a2;
    v16 = xpc_null_create();
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)a4 = v11;
    *(_OWORD *)(a4 + 16) = v11;
    v12 = *a1;
    if (a2 && MEMORY[0x1C3B88380](a2) == MEMORY[0x1E0C812F8])
      xpc_retain(a2);
    else
      object = xpc_null_create();
    abm::client::Manager::perform(v12, &object, &v16, (_DWORD *)a4);
    xpc_release(object);
    object = 0;
    if (!a3 || *(_DWORD *)a4)
    {
      v13 = v16;
    }
    else
    {
      v13 = xpc_null_create();
      v14 = v16;
      v16 = v13;
      *a3 = v14;
    }
    xpc_release(v13);
    xpc_release(a2);
  }
  else
  {
    v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(_QWORD *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1BF332C50;
  }
}

void sub_1BF329AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, xpc_object_t object)
{
  void *v10;
  uint64_t v11;

  if (*(char *)(v11 + 31) < 0)
    operator delete(*(void **)(v11 + 8));
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

TelephonyXPC::Client ****abm::client::EventsOn(TelephonyXPC::Client ****result)
{
  if (*result)
    return (TelephonyXPC::Client ****)TelephonyXPC::Client::eventsOn(***result);
  return result;
}

TelephonyXPC::Client ****abm::client::EventsOff(TelephonyXPC::Client ****result)
{
  if (*result)
    return (TelephonyXPC::Client ****)TelephonyXPC::Client::eventsOff(***result);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t TelephonyXPC::Client::setEventHandler()
{
  return MEMORY[0x1E0DBD858]();
}

uint64_t TelephonyXPC::Client::create()
{
  return MEMORY[0x1E0DBD860]();
}

uint64_t TelephonyXPC::Client::perform()
{
  return MEMORY[0x1E0DBD868]();
}

uint64_t TelephonyXPC::Client::eventsOn(TelephonyXPC::Client *this)
{
  return MEMORY[0x1E0DBD878](this);
}

uint64_t TelephonyXPC::Client::eventsOff(TelephonyXPC::Client *this)
{
  return MEMORY[0x1E0DBD880](this);
}

uint64_t TelephonyXPC::Command::create()
{
  return MEMORY[0x1E0DBD888]();
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x1E0DE3398](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x1E0DE33A0](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x1E0DE33B0](this);
}

uint64_t capabilities::trace::supportsBasebandIPCTrace(capabilities::trace *this)
{
  return MEMORY[0x1E0DE3410](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x1E0DE3450](this);
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x1E0DE3720]();
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x1E0DE3750]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x1E0DE3758](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x1E0DE3760](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x1E0DE3768](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x1E0DE3770]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x1E0DE3778]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x1E0DE3780](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
  MEMORY[0x1E0DE3788](this);
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x1E0DE3790]();
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x1E0DE3810]();
}

uint64_t ctu::LoggerCommonBase::setInheritedLogLevel()
{
  return MEMORY[0x1E0DE3818]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x1E0DE3820]();
}

{
  return MEMORY[0x1E0DE3828]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x1E0DE3830]();
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x1E0DE3868](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1E0DE3870]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x1E0DE3880](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x1E0DE3890](this);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1E0DE38B8]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x1E0DE39D0](this);
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x1E0DE39E8](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x1E0DE39F0]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x1E0DE39F8]();
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x1E0DE3A00]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x1E0DE3A10]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
  MEMORY[0x1E0DE3A18](this);
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1E0DE3A40](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1E0DE3A48](this, a2);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1E0DE3A78]();
}

{
  return MEMORY[0x1E0DE3A80]();
}

{
  return MEMORY[0x1E0DE3A90]();
}

{
  return MEMORY[0x1E0DE3AA0]();
}

{
  return MEMORY[0x1E0DE3AA8]();
}

{
  return MEMORY[0x1E0DE3AB8]();
}

uint64_t xpc::bridge()
{
  return MEMORY[0x1E0DE3AC8]();
}

uint64_t TelephonyXPC::Event::getData(TelephonyXPC::Event *this)
{
  return MEMORY[0x1E0DBD890](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x1E0DE3AD8](this);
}

uint64_t ctu::LoggerCommonBase::getLocalLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x1E0DE3AE0](this);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x1E0DE3B20]();
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1E0DE3B48](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4330](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4700]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1E0DE48F8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E78F49D8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E78F49E0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C40](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x1E0C82F00](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

