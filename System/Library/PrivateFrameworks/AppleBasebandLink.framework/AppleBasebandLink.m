void abb::link::XpcClientLink::create(xpc_object_t *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  xpc_endpoint_t v5;
  xpc_endpoint_t v6;

  if (MEMORY[0x23B7F09AC](*a1) == MEMORY[0x24BDACFB0])
  {
    v4 = operator new(0x70uLL);
    v6 = (xpc_endpoint_t)*a1;
    v5 = v6;
    *a1 = xpc_null_create();
    abb::link::XpcClientLink::XpcClientLink((uint64_t)v4, &v6);
    std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(a2, (uint64_t)v4);
    xpc_release(v5);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
}

void sub_236354628(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::XpcClientLink::create@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;

  v4 = operator new(0x70uLL);
  abb::link::XpcClientLink::XpcClientLink((uint64_t)v4, a1);
  return std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(a2, (uint64_t)v4);
}

void sub_23635468C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t abb::link::XpcClientLink::XpcClientLink(uint64_t a1, xpc_endpoint_t *a2)
{
  void *v4;
  xpc_object_t v5;
  void *v6;

  *(_QWORD *)a1 = off_2507ADCF0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 24) = xpc_null_create();
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 96) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a1 + 96) = xpc_null_create();
  if (MEMORY[0x23B7F09AC](*a2) == MEMORY[0x24BDACFB0])
  {
    v4 = xpc_connection_create_from_endpoint(*a2);
    if (!v4)
      v4 = xpc_null_create();
    v5 = xpc_null_create();
    v6 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;
    xpc_release(v6);
    xpc_release(v5);
  }
  *(_BYTE *)(a1 + 104) = 0;
  return a1;
}

uint64_t abb::link::XpcClientLink::XpcClientLink(uint64_t a1, __int128 *a2)
{
  xpc_object_t v4;
  _OWORD *v5;
  __int128 v6;
  const char *v7;
  xpc_connection_t mach_service;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = off_2507ADCF0;
  *(_QWORD *)(a1 + 24) = 0;
  v4 = xpc_null_create();
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 24) = v4;
  v5 = (_OWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = 0u;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 64), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v6 = *a2;
    *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 2);
    *v5 = v6;
  }
  *(_QWORD *)(a1 + 88) = 0;
  v7 = (const char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
    v7 = *(const char **)v5;
  mach_service = xpc_connection_create_mach_service(v7, 0, 2uLL);
  *(_QWORD *)(a1 + 96) = mach_service;
  if (!mach_service)
    *(_QWORD *)(a1 + 96) = xpc_null_create();
  *(_BYTE *)(a1 + 104) = 0;
  return a1;
}

void sub_236354838(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;

  if (*(char *)(v1 + 63) < 0)
  {
    operator delete(*(void **)(v1 + 40));
    v5 = *v3;
    *v3 = 0;
    if (!v5)
    {
LABEL_3:
      MEMORY[0x23B7F0790](v2);
      v6 = *(std::__shared_weak_count **)(v1 + 16);
      if (!v6)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else
  {
    v5 = *v3;
    *v3 = 0;
    if (!v5)
      goto LABEL_3;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  MEMORY[0x23B7F0790](v2);
  v6 = *(std::__shared_weak_count **)(v1 + 16);
  if (!v6)
LABEL_4:
    _Unwind_Resume(a1);
LABEL_7:
  std::__shared_weak_count::__release_weak(v6);
  _Unwind_Resume(a1);
}

void abb::link::XpcClientLink::~XpcClientLink(abb::link::XpcClientLink *this)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 4);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  *((_BYTE *)this + 104) = 0;
  ctu::XpcClientHelper::setServer();
  xpc_release(*((xpc_object_t *)this + 12));
  *((_QWORD *)this + 12) = 0;
  v3 = *((_QWORD *)this + 11);
  if (v3)
    dispatch_release(v3);
  if (*((char *)this + 87) < 0)
  {
    operator delete(*((void **)this + 8));
    if ((*((char *)this + 63) & 0x80000000) == 0)
    {
LABEL_7:
      v4 = *((_QWORD *)this + 4);
      *((_QWORD *)this + 4) = 0;
      if (!v4)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((char *)this + 63) & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(*((void **)this + 5));
  v4 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v4)
LABEL_8:
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
LABEL_9:
  MEMORY[0x23B7F0790]((char *)this + 24);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
}

{
  void *v1;

  abb::link::XpcClientLink::~XpcClientLink(this);
  operator delete(v1);
}

uint64_t abb::link::XpcClientLink::disconnect(abb::link::XpcClientLink *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 4);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  *((_BYTE *)this + 104) = 0;
  return ctu::XpcClientHelper::setServer();
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL abb::link::XpcClientLink::isConnected(abb::link::XpcClientLink *this)
{
  return *((_BYTE *)this + 104) && MEMORY[0x23B7F09AC](*((_QWORD *)this + 3)) == MEMORY[0x24BDACF88];
}

void abb::link::XpcClientLink::flush(abb::link::XpcClientLink *this, const group *a2)
{
  char *gr_name;
  xpc_object_t v5;
  NSObject *global_queue;
  xpc_connection_t *v7;
  uint64_t v8;
  _QWORD handler[4];
  dispatch_group_t group;

  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  v5 = xpc_null_create();
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcClientLink5flushERKN8dispatch5groupE_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  group = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  v8 = *((_QWORD *)this + 3);
  v7 = (xpc_connection_t *)((char *)this + 24);
  if (v8 && MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
    xpc_connection_send_message_with_reply(*v7, v5, global_queue, handler);
  xpc_release(v5);
  ctu::XpcClientHelper::flush((ctu::XpcClientHelper *)v7, a2);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

void sub_236354B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  NSObject *v14;
  void *v15;

  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  xpc_release(v15);
  if (v14)
  {
    dispatch_group_leave(v14);
    dispatch_release(v14);
  }
  _Unwind_Resume(a1);
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2, NSObject *a3, void *a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
    {
      xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 24), *a2, a3, a4);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = *(NSObject **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_group_enter(v4);
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
}

uint64_t abb::link::XpcClientLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
    {
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), *a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
    {
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), *a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2, uint64_t *a3, NSObject **a4, _QWORD *a5)
{
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_weak_owners;
  unint64_t v18;
  uint64_t v19;
  _QWORD handler[6];
  std::__shared_weak_count *v22;

  v10 = operator new(0x20uLL);
  v11 = v10;
  v12 = a5 + 3;
  v13 = (_QWORD *)a5[3];
  if (!v13)
  {
    v12 = v10 + 3;
    goto LABEL_5;
  }
  if (v13 != a5)
  {
    v10[3] = v13;
LABEL_5:
    *v12 = 0;
    goto LABEL_7;
  }
  v10[3] = v10;
  (*(void (**)(_QWORD *, _QWORD *))(*a5 + 24))(a5, v10);
LABEL_7:
  v14 = *a4;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_1;
  v15 = *a3;
  v16 = (std::__shared_weak_count *)a3[1];
  handler[4] = v11;
  handler[5] = v15;
  v22 = v16;
  if (v16)
  {
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v18 = __ldxr(p_shared_weak_owners);
    while (__stxr(v18 + 1, p_shared_weak_owners));
  }
  if (*(_QWORD *)(a1 + 24) && MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
  {
    xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 24), *a2, v14, handler);
    v19 = 1;
    v16 = v22;
    if (!v22)
      return v19;
    goto LABEL_13;
  }
  v19 = 0;
  if (v16)
LABEL_13:
    std::__shared_weak_count::__release_weak(v16);
  return v19;
}

void sub_236354EC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  _Unwind_Resume(exception_object);
}

void ___ZNK3abb4link13XpcClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEE_block_invoke(uint64_t a1, void *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  xpc_object_t object;
  std::__shared_weak_count *v16;
  void *__p;

  __p = *(void **)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    v16 = v5;
    if (v5)
    {
      v6 = v5;
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_7;
      v7 = *(_QWORD *)(a1 + 32);
      object = a2;
      if (a2)
      {
        xpc_retain(a2);
        v8 = *(_QWORD *)(v7 + 24);
        if (v8)
        {
LABEL_6:
          (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v8 + 48))(v8, &object);
          xpc_release(object);
          object = 0;
LABEL_7:
          p_shared_owners = (unint64_t *)&v6->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
          goto LABEL_11;
        }
      }
      else
      {
        object = xpc_null_create();
        v8 = *(_QWORD *)(v7 + 24);
        if (v8)
          goto LABEL_6;
      }
      std::__throw_bad_function_call[abi:ne180100]();
    }
  }
LABEL_11:
  v11 = __p;
  if (!__p)
    return;
  v12 = (_QWORD *)*((_QWORD *)__p + 3);
  if (v12 == __p)
  {
    v13 = 4;
    v12 = __p;
    goto LABEL_16;
  }
  if (v12)
  {
    v13 = 5;
LABEL_16:
    (*(void (**)(_QWORD *))(*v12 + 8 * v13))(v12);
  }
  operator delete(v11);
}

void sub_236354FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, _QWORD *a12)
{
  xpc_release(object);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::unique_ptr<std::function<void ()(xpc::object)>>::~unique_ptr[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<void const>::~shared_ptr[abi:ne180100](uint64_t result)
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

_QWORD **std::unique_ptr<std::function<void ()(xpc::object)>>::~unique_ptr[abi:ne180100](_QWORD **a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = (_QWORD *)v2[3];
    if (v3 == v2)
    {
      v4 = 4;
      v3 = v2;
    }
    else
    {
      if (!v3)
      {
LABEL_7:
        operator delete(v2);
        return a1;
      }
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
    goto LABEL_7;
  }
  return a1;
}

uint64_t __copy_helper_block_e8_40c25_ZTSNSt3__18weak_ptrIKvEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c25_ZTSNSt3__18weak_ptrIKvEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void abb::link::XpcClientLink::handleServerError(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *v3;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *a2;
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v2 + 40))(v2, &object);
  xpc_release(object);
}

void sub_236355184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abb::link::XpcClientLink::handleMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4;
  xpc_object_t value;
  uint64_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t object;

  if (xpc_dictionary_get_value(*a2, "ConnectLink"))
  {
    *(_BYTE *)(a1 + 104) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    value = xpc_dictionary_get_value(*a2, "ConnectLink");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v4 + 16))(v4, &object);
    xpc_release(object);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *a2;
    v8 = v7;
    if (v7)
      xpc_retain(v7);
    else
      v8 = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v6 + 24))(v6, &v8);
    xpc_release(v8);
  }
}

void sub_236355270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abb::link::XpcClientLink::connectInternal(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  const char *v6;
  xpc_object_t v7;
  xpc_object_t v8;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23B7F09AC](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
      v5 = v4;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v4 = 0;
  }
  xpc_release(v4);
  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  v7 = xpc_string_create(v6);
  if (!v7)
    v7 = xpc_null_create();
  xpc_dictionary_set_value(v5, "Name", v7);
  v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  if (*(_QWORD *)(a1 + 24) && MEMORY[0x23B7F09AC]() == MEMORY[0x24BDACF88])
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), v5);
  xpc_release(v5);
}

void sub_2363553C4(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::LocalClientLink::create@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v3;

  v3 = operator new(0x68uLL);
  v3[2] = 0;
  v3[3] = 0;
  *v3 = off_2507ADD98;
  v3[1] = &unk_2507ADDF8;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_BYTE *)v3 + 96) = 0;
  return std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(a1, (uint64_t)v3);
}

double abb::link::LocalClientLink::LocalClientLink(abb::link::LocalClientLink *this)
{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = off_2507ADD98;
  *((_QWORD *)this + 1) = &unk_2507ADDF8;
  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_BYTE *)this + 96) = 0;
  return result;
}

{
  double result;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = off_2507ADD98;
  *((_QWORD *)this + 1) = &unk_2507ADDF8;
  result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_BYTE *)this + 96) = 0;
  return result;
}

void abb::link::LocalClientLink::~LocalClientLink(void **this)
{
  NSObject *v2;
  void *v3;
  std::__shared_weak_count *v4;
  void *v5;
  std::__shared_weak_count *v6;

  abb::link::LocalClientLink::disconnect((abb::link::LocalClientLink *)this);
  v2 = this[11];
  if (v2)
    dispatch_release(v2);
  if (*((char *)this + 87) < 0)
    operator delete(this[8]);
  v3 = this[7];
  this[7] = 0;
  if (v3)
    (*(void (**)(void *))(*(_QWORD *)v3 + 8))(v3);
  v4 = (std::__shared_weak_count *)this[6];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  v5 = this[4];
  this[4] = 0;
  if (v5)
    (*(void (**)(void *))(*(_QWORD *)v5 + 8))(v5);
  v6 = (std::__shared_weak_count *)this[3];
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

{
  void *v1;

  abb::link::LocalClientLink::~LocalClientLink(this);
  operator delete(v1);
}

uint64_t abb::link::LocalClientLink::disconnect(abb::link::LocalClientLink *this)
{
  uint64_t result;
  uint64_t v3;
  xpc_object_t object;

  result = *((_QWORD *)this + 7);
  if (result)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  v3 = *((_QWORD *)this + 4);
  if (v3)
  {
    object = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v3 + 32))(v3, &object);
    xpc_release(object);
    object = 0;
    result = *((_QWORD *)this + 4);
    *((_BYTE *)this + 96) = 0;
    *((_QWORD *)this + 4) = 0;
    if (result)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  else
  {
    *((_BYTE *)this + 96) = 0;
    *((_QWORD *)this + 4) = 0;
  }
  return result;
}

void sub_2363555D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void `non-virtual thunk to'abb::link::LocalClientLink::~LocalClientLink(void **this)
{
  abb::link::LocalClientLink::~LocalClientLink(this - 1);
}

{
  void *v1;

  abb::link::LocalClientLink::~LocalClientLink(this - 1);
  operator delete(v1);
}

BOOL abb::link::LocalClientLink::isConnected(abb::link::LocalClientLink *this)
{
  return *((_BYTE *)this + 96) && *((_QWORD *)this + 4) && *((_QWORD *)this + 7) && *((_QWORD *)this + 11) != 0;
}

void abb::link::LocalClientLink::flush(abb::link::LocalClientLink *this, const group *a2)
{
  char *gr_name;
  NSObject *global_queue;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  xpc_object_t object;
  dispatch_object_t v26;
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v26 = global_queue;
  if (global_queue)
    dispatch_retain(global_queue);
  object = xpc_null_create();
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
  if (!v5 || (v6 = std::__shared_weak_count::lock(v5)) == 0)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v8 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v10 = __ldxr(p_shared_weak_owners);
  while (__stxr(v10 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (v12)
  {
    v13 = std::__shared_weak_count::lock(v6);
    if (v13)
    {
LABEL_13:
      v14 = v13;
      v15 = (unint64_t *)&v13->__shared_weak_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
      v23 = v8;
      v24 = v13;
      std::__shared_weak_count::__release_weak(v7);
      v17 = (unint64_t *)&v14->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        v19 = v14;
        goto LABEL_36;
      }
LABEL_20:
      if (!gr_name)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
    v13 = std::__shared_weak_count::lock(v7);
    if (v13)
      goto LABEL_13;
  }
  v23 = 0;
  v24 = 0;
  v19 = v7;
LABEL_36:
  std::__shared_weak_count::__release_weak(v19);
  if (gr_name)
  {
LABEL_21:
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
LABEL_22:
  v27[0] = &off_2507AE0A8;
  v27[1] = gr_name;
  v28 = v27;
  abb::link::LocalClientLink::send((uint64_t)this, &object, &v23, &v26, v27);
  v21 = v28;
  if (v28 == v27)
  {
    v22 = 4;
    v21 = v27;
  }
  else
  {
    if (!v28)
      goto LABEL_27;
    v22 = 5;
  }
  (*(void (**)(_QWORD *, uint64_t))(*v21 + 8 * v22))(v21, v20);
LABEL_27:
  if (v24)
    std::__shared_weak_count::__release_weak(v24);
  xpc_release(object);
  if (v26)
    dispatch_release(v26);
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

void sub_236355878(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, xpc_object_t object, dispatch_object_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t abb::link::LocalClientLink::send(uint64_t a1, void **a2, std::__shared_weak_count **a3, NSObject **a4, _QWORD *a5)
{
  uint64_t v7;
  void *v9;
  std::__shared_weak_count *v10;
  _QWORD *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t *p_shared_weak_owners;
  unint64_t v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  NSObject *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  xpc_object_t v28;
  std::__shared_weak_count *v29[2];
  dispatch_object_t object;
  _QWORD v31[3];
  _QWORD *v32;
  _BYTE v33[24];
  _BYTE *v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 96) || (v7 = *(_QWORD *)(a1 + 32)) == 0 || !*(_QWORD *)(a1 + 56) || !*(_QWORD *)(a1 + 88))
  {
    v11 = (_QWORD *)a5[3];
    if (v11)
    {
      if (v11 == a5)
      {
        v36 = v35;
        (*(void (**)(_QWORD *, _QWORD *))(*a5 + 24))(a5, v35);
      }
      else
      {
        v36 = (_QWORD *)a5[3];
        a5[3] = 0;
      }
    }
    else
    {
      v36 = 0;
    }
    v12 = *a4;
    v13 = operator new(0x20uLL);
    v14 = v13;
    if (v36)
    {
      if (v36 == v35)
      {
        *((_QWORD *)v13 + 3) = v13;
        (*(void (**)(_QWORD *, void *))(v35[0] + 24))(v35, v13);
      }
      else
      {
        *((_QWORD *)v13 + 3) = v36;
        v36 = 0;
      }
    }
    else
    {
      *((_QWORD *)v13 + 3) = 0;
    }
    dispatch_async_f(v12, v14, (dispatch_function_t)dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
    v15 = v36;
    if (v36 == v35)
    {
      v16 = 4;
      v15 = v35;
    }
    else
    {
      if (!v36)
        return 0;
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
    return 0;
  }
  v9 = *a2;
  v28 = v9;
  if (v9)
  {
    xpc_retain(v9);
    v10 = a3[1];
    v29[0] = *a3;
    v29[1] = v10;
    if (!v10)
      goto LABEL_27;
  }
  else
  {
    v28 = xpc_null_create();
    v10 = a3[1];
    v29[0] = *a3;
    v29[1] = v10;
    if (!v10)
      goto LABEL_27;
  }
  p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
  do
    v19 = __ldxr(p_shared_weak_owners);
  while (__stxr(v19 + 1, p_shared_weak_owners));
LABEL_27:
  v20 = *a4;
  object = v20;
  if (v20)
    dispatch_retain(v20);
  v21 = v31;
  v22 = (_QWORD *)a5[3];
  if (v22)
  {
    if (v22 == a5)
    {
      v32 = v31;
      (*(void (**)(_QWORD *, _QWORD *))(*a5 + 24))(a5, v31);
    }
    else
    {
      v32 = (_QWORD *)a5[3];
      a5[3] = 0;
    }
  }
  else
  {
    v32 = 0;
  }
  v34 = 0;
  v23 = (char *)operator new(0x40uLL);
  *(_QWORD *)v23 = &off_2507AE138;
  *(_OWORD *)(v23 + 8) = *(_OWORD *)v29;
  v29[0] = 0;
  v29[1] = 0;
  v24 = object;
  *((_QWORD *)v23 + 3) = object;
  if (v24)
    dispatch_retain(v24);
  if (v32)
  {
    if (v32 == v31)
    {
      *((_QWORD *)v23 + 7) = v23 + 32;
      (*(void (**)(_QWORD *))(v31[0] + 24))(v31);
    }
    else
    {
      *((_QWORD *)v23 + 7) = v32;
      v32 = 0;
    }
  }
  else
  {
    *((_QWORD *)v23 + 7) = 0;
  }
  v34 = v23;
  (*(void (**)(uint64_t, xpc_object_t *, _BYTE *))(*(_QWORD *)v7 + 24))(v7, &v28, v33);
  v25 = v34;
  if (v34 == v33)
  {
    v26 = 4;
    v25 = v33;
  }
  else
  {
    if (!v34)
      goto LABEL_46;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_46:
  if (v32 == v31)
  {
    v27 = 4;
    goto LABEL_50;
  }
  if (v32)
  {
    v27 = 5;
    v21 = v32;
LABEL_50:
    (*(void (**)(_QWORD *))(*v21 + 8 * v27))(v21);
  }
  if (object)
    dispatch_release(object);
  if (v29[1])
    std::__shared_weak_count::__release_weak(v29[1]);
  xpc_release(v28);
  return 1;
}

void sub_236355C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

dispatch_object_t *abb::link::LocalClientLink::flush(dispatch::group const&)const::$_0::~$_0(dispatch_object_t *a1)
{
  NSObject *v2;

  v2 = *a1;
  if (v2)
  {
    dispatch_group_leave(v2);
    if (*a1)
      dispatch_release(*a1);
  }
  return a1;
}

uint64_t abb::link::LocalClientLink::send(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *v3;
  xpc_object_t object;

  if (!*(_BYTE *)(a1 + 96))
    return 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || !*(_QWORD *)(a1 + 56) || !*(_QWORD *)(a1 + 88))
    return 0;
  v3 = *a2;
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v2 + 16))(v2, &object);
  xpc_release(object);
  return 1;
}

void sub_236355D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)const::$_1::~$_1(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  v2 = a1 + 3;
  v3 = (_QWORD *)a1[6];
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
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = a1[2];
  if (v5)
    dispatch_release(v5);
  v6 = (std::__shared_weak_count *)a1[1];
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  return a1;
}

void abb::link::LocalClientLink::connectInternal(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;

  v3 = (std::__shared_weak_count *)a1[6];
  if (!v3)
    return;
  v5 = std::__shared_weak_count::lock(v3);
  v20 = v5;
  if (!v5)
    return;
  v6 = (_QWORD *)a1[5];
  v19 = v6;
  if (!v6)
  {
    v14 = v5;
LABEL_16:
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return;
  }
  v7 = (std::__shared_weak_count *)a1[3];
  if (!v7 || (v8 = a1[2], (v9 = std::__shared_weak_count::lock(v7)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v10 = v8 + 8;
  if (!v8)
    v10 = 0;
  v17 = v10;
  v18 = v9;
  abb::link::LocalLinkAccepter::handleNewClient(v6, a2, &v17);
  v11 = v18;
  if (v18)
  {
    v12 = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
    goto LABEL_16;
}

void sub_236355F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_236355F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void abb::link::LocalClientLink::handleServerMessage(_QWORD *a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t v10;
  NSObject *v11;
  _QWORD *v12;
  xpc_object_t v13;
  unint64_t v14;

  v3 = *a2;
  *a2 = xpc_null_create();
  if (a1[11])
  {
    v4 = (std::__shared_weak_count *)a1[3];
    if (!v4 || (v5 = a1[2], (v6 = std::__shared_weak_count::lock(v4)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v7 = v6;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = xpc_null_create();
    v11 = a1[11];
    v12 = operator new(0x20uLL);
    *v12 = v5;
    v12[1] = v7;
    v12[2] = a1;
    v12[3] = v3;
    v13 = xpc_null_create();
    dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke);
    xpc_release(v13);
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    v10 = v3;
  }
  xpc_release(v10);
}

void `non-virtual thunk to'abb::link::LocalClientLink::handleServerMessage(uint64_t a1, xpc_object_t *a2)
{
  abb::link::LocalClientLink::handleServerMessage((_QWORD *)(a1 - 8), a2);
}

void abb::link::LocalClientLink::handleServerMessage(_QWORD *a1, void **a2, NSObject **a3, _QWORD *a4)
{
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  xpc_object_t v17;
  _QWORD *v18;
  NSObject *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  xpc_object_t v23;
  _QWORD *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  xpc_object_t v34[2];
  dispatch_object_t v35;
  _QWORD v36[3];
  _QWORD *v37;
  __int128 v38;
  xpc_object_t v39[2];
  dispatch_object_t object;
  _QWORD v41[3];
  _QWORD *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = *a2;
  v34[0] = a1;
  v34[1] = v7;
  *a2 = xpc_null_create();
  v8 = *a3;
  v35 = v8;
  if (v8)
    dispatch_retain(v8);
  v9 = v36;
  v10 = (_QWORD *)a4[3];
  if (v10)
  {
    if (v10 == a4)
    {
      v37 = v36;
      (*(void (**)(_QWORD *, _QWORD *))(*a4 + 24))(a4, v36);
    }
    else
    {
      v37 = (_QWORD *)a4[3];
      a4[3] = 0;
    }
  }
  else
  {
    v37 = 0;
  }
  if (!a1[11])
    goto LABEL_37;
  v11 = (std::__shared_weak_count *)a1[3];
  if (!v11 || (v12 = a1[2], (v13 = std::__shared_weak_count::lock(v11)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v14 = v13;
  *(_QWORD *)&v38 = v12;
  *((_QWORD *)&v38 + 1) = v13;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  *(_OWORD *)v39 = *(_OWORD *)v34;
  v17 = xpc_null_create();
  object = v35;
  v34[1] = v17;
  v35 = 0;
  v18 = v41;
  if (v37)
  {
    if (v37 == v36)
    {
      v42 = v41;
      (*(void (**)(_QWORD *, _QWORD *))(v36[0] + 24))(v36, v41);
    }
    else
    {
      v42 = v37;
      v37 = 0;
    }
  }
  else
  {
    v42 = 0;
  }
  v19 = a1[11];
  v20 = operator new(0x48uLL);
  v21 = v38;
  v22 = *(_OWORD *)v39;
  v38 = 0uLL;
  *v20 = v21;
  v20[1] = v22;
  v23 = xpc_null_create();
  v24 = v42;
  *((_QWORD *)v20 + 4) = object;
  v39[1] = v23;
  object = 0;
  if (v24)
  {
    if (v24 == v41)
    {
      *((_QWORD *)v20 + 8) = (char *)v20 + 40;
      (*(void (**)(_QWORD *))(v41[0] + 24))(v41);
    }
    else
    {
      *((_QWORD *)v20 + 8) = v24;
      v42 = 0;
    }
  }
  else
  {
    *((_QWORD *)v20 + 8) = 0;
  }
  v32 = 0;
  v33 = 0;
  dispatch_async_f(v19, v20, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v32);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v33);
  if (v42 == v41)
  {
    v25 = 4;
  }
  else
  {
    if (!v42)
      goto LABEL_28;
    v25 = 5;
    v18 = v42;
  }
  (*(void (**)(_QWORD *))(*v18 + 8 * v25))(v18);
LABEL_28:
  if (object)
    dispatch_release(object);
  xpc_release(v39[1]);
  v39[1] = 0;
  v26 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v27 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
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
    v29 = __ldaxr(p_shared_owners);
  while (__stlxr(v29 - 1, p_shared_owners));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    v30 = v37;
    if (v37 != v36)
      goto LABEL_38;
LABEL_41:
    v31 = 4;
    goto LABEL_42;
  }
LABEL_37:
  v30 = v37;
  if (v37 == v36)
    goto LABEL_41;
LABEL_38:
  if (!v30)
    goto LABEL_43;
  v31 = 5;
  v9 = v30;
LABEL_42:
  (*(void (**)(_QWORD *))(*v9 + 8 * v31))(v9);
LABEL_43:
  if (v35)
    dispatch_release(v35);
  xpc_release(v34[1]);
}

void sub_2363563D4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void `non-virtual thunk to'abb::link::LocalClientLink::handleServerMessage(uint64_t a1, void **a2, NSObject **a3, _QWORD *a4)
{
  abb::link::LocalClientLink::handleServerMessage((_QWORD *)(a1 - 8), a2, a3, a4);
}

void abb::link::LocalClientLink::handleServerError(_QWORD *a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t v10;
  NSObject *v11;
  _QWORD *v12;
  xpc_object_t v13;
  unint64_t v14;

  v3 = *a2;
  *a2 = xpc_null_create();
  if (a1[11])
  {
    v4 = (std::__shared_weak_count *)a1[3];
    if (!v4 || (v5 = a1[2], (v6 = std::__shared_weak_count::lock(v4)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v7 = v6;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = xpc_null_create();
    v11 = a1[11];
    v12 = operator new(0x20uLL);
    *v12 = v5;
    v12[1] = v7;
    v12[2] = a1;
    v12[3] = v3;
    v13 = xpc_null_create();
    dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>(abb::link::LocalClientLink::handleServerError(xpc::object)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
    xpc_release(v13);
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    v10 = v3;
  }
  xpc_release(v10);
}

void `non-virtual thunk to'abb::link::LocalClientLink::handleServerError(uint64_t a1, xpc_object_t *a2)
{
  abb::link::LocalClientLink::handleServerError((_QWORD *)(a1 - 8), a2);
}

void abb::link::LocalClientLink::registerAccepter(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = v3;
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

uint64_t abb::link::XpcClientLink::isXpc(abb::link::XpcClientLink *this)
{
  return 1;
}

uint64_t abb::link::LocalClientLink::isXpc(abb::link::LocalClientLink *this)
{
  return 0;
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2507ADB58, MEMORY[0x24BEDAAF0]);
}

void sub_23635665C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_QWORD *std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(_QWORD *a1, uint64_t a2)
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

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_2507ADFC8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 16);
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        return a1;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      *(_QWORD *)(a2 + 8) = a2;
      *(_QWORD *)(a2 + 16) = v4;
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
      *(_QWORD *)(a2 + 8) = a2;
      *(_QWORD *)(a2 + 16) = v4;
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
  return a1;
}

void sub_2363567A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<abb::link::XpcClientLink>::~unique_ptr[abi:ne180100]((abb::link::XpcClientLink **)va);
  _Unwind_Resume(a1);
}

abb::link::XpcClientLink **std::unique_ptr<abb::link::XpcClientLink>::~unique_ptr[abi:ne180100](abb::link::XpcClientLink **a1)
{
  abb::link::XpcClientLink *v2;
  void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::XpcClientLink::~XpcClientLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::__on_zero_shared(uint64_t a1)
{
  abb::link::XpcClientLink *v1;
  void *v2;

  v1 = *(abb::link::XpcClientLink **)(a1 + 24);
  if (v1)
  {
    abb::link::XpcClientLink::~XpcClientLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635DF19)
    return a1 + 24;
  if (((v3 & 0x800000023635DF19 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635DF19))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635DF19 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
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

_QWORD *std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(_QWORD *a1, uint64_t a2)
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

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_2507AE058;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 24);
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        return a1;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      *(_QWORD *)(a2 + 16) = a2;
      *(_QWORD *)(a2 + 24) = v4;
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
      *(_QWORD *)(a2 + 16) = a2;
      *(_QWORD *)(a2 + 24) = v4;
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
  return a1;
}

void sub_236356A0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<abb::link::LocalClientLink>::~unique_ptr[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void ***std::unique_ptr<abb::link::LocalClientLink>::~unique_ptr[abi:ne180100](void ***a1)
{
  void **v2;
  void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::LocalClientLink::~LocalClientLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::__on_zero_shared(uint64_t a1)
{
  void **v1;
  void *v2;

  v1 = *(void ***)(a1 + 24);
  if (v1)
  {
    abb::link::LocalClientLink::~LocalClientLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635E016)
    return a1 + 24;
  if (((v3 & 0x800000023635E016 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635E016))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635E016 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

_QWORD *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::~__func(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;

  *a1 = &off_2507AE0A8;
  v2 = a1[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = a1[1];
    if (v3)
      dispatch_release(v3);
  }
  return a1;
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::~__func(_QWORD *__p)
{
  NSObject *v2;
  NSObject *v3;

  *__p = &off_2507AE0A8;
  v2 = __p[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = __p[1];
    if (v3)
      dispatch_release(v3);
  }
  operator delete(__p);
}

_QWORD *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;

  v2 = operator new(0x10uLL);
  v3 = *(NSObject **)(a1 + 8);
  *v2 = &off_2507AE0A8;
  v2[1] = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v3);
  }
  return v2;
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1, _QWORD *a2)
{
  NSObject *v2;
  NSObject *v4;

  v2 = *(NSObject **)(a1 + 8);
  *a2 = &off_2507AE0A8;
  a2[1] = v2;
  if (v2)
  {
    dispatch_retain(v2);
    v4 = a2[1];
    if (v4)
      dispatch_group_enter(v4);
  }
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::destroy(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 8);
    if (v3)
      dispatch_release(v3);
  }
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::destroy_deallocate(_QWORD *__p)
{
  NSObject *v2;
  NSObject *v3;

  v2 = __p[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = __p[1];
    if (v3)
      dispatch_release(v3);
  }
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::operator()(uint64_t a1, void **a2)
{
  void *v2;

  v2 = *a2;
  *a2 = xpc_null_create();
  xpc_release(v2);
}

uint64_t std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::target_type()
{
}

void dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  xpc_object_t object;

  object = (xpc_object_t)MEMORY[0x24BDACF38];
  xpc_retain(MEMORY[0x24BDACF38]);
  v2 = a1[3];
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v2 + 48))(v2, &object);
  xpc_release(object);
  v3 = (_QWORD *)a1[3];
  if (v3 == a1)
  {
    v4 = 4;
    v3 = a1;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 5;
LABEL_6:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  operator delete(a1);
}

void sub_236356DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;

  xpc_release(object);
  v12 = (_QWORD *)v10[3];
  if (v12 == v10)
  {
    v13 = 4;
    v12 = v10;
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_6:
  operator delete(v10);
  _Unwind_Resume(a1);
}

_QWORD *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  *a1 = &off_2507AE138;
  v2 = a1 + 4;
  v3 = (_QWORD *)a1[7];
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
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = a1[3];
  if (v5)
    dispatch_release(v5);
  v6 = (std::__shared_weak_count *)a1[2];
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  return a1;
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::~__func(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  *(_QWORD *)__p = &off_2507AE138;
  v2 = __p + 32;
  v3 = (char *)*((_QWORD *)__p + 7);
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
  v5 = *((_QWORD *)__p + 3);
  if (v5)
    dispatch_release(v5);
  v6 = (std::__shared_weak_count *)*((_QWORD *)__p + 2);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  operator delete(__p);
}

_QWORD *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::__clone(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;

  v2 = operator new(0x40uLL);
  v4 = a1[1];
  v3 = a1[2];
  *v2 = &off_2507AE138;
  v2[1] = v4;
  v2[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = a1[3];
  v2[3] = v7;
  if (v7)
    dispatch_retain(v7);
  v8 = a1[7];
  if (!v8)
    goto LABEL_9;
  if ((_QWORD *)v8 != a1 + 4)
  {
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
LABEL_9:
    v2[7] = v8;
    return v2;
  }
  v2[7] = v2 + 4;
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
  return v2;
}

void sub_236356FD0(_Unwind_Exception *a1)
{
  _QWORD *v1;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v3 = v1[3];
  if (v3)
  {
    dispatch_release(v3);
    v4 = (std::__shared_weak_count *)v1[2];
    if (!v4)
    {
LABEL_3:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v4 = (std::__shared_weak_count *)v1[2];
    if (!v4)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::__clone(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t result;

  v5 = a1[1];
  v4 = a1[2];
  *a2 = &off_2507AE138;
  a2[1] = v5;
  a2[2] = v4;
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = a1[3];
  a2[3] = v8;
  if (v8)
    dispatch_retain(v8);
  result = a1[7];
  if (!result)
    goto LABEL_9;
  if ((_QWORD *)result != a1 + 4)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
LABEL_9:
    a2[7] = result;
    return result;
  }
  a2[7] = a2 + 4;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1[7] + 24))(a1[7]);
}

void sub_2363570B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v3 = *(NSObject **)(v1 + 24);
  if (v3)
  {
    dispatch_release(v3);
    v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::destroy(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  v2 = a1 + 4;
  v3 = (_QWORD *)a1[7];
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
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = a1[3];
  if (v5)
    dispatch_release(v5);
  v6 = (std::__shared_weak_count *)a1[2];
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  v2 = __p + 32;
  v3 = (char *)*((_QWORD *)__p + 7);
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
  v5 = *((_QWORD *)__p + 3);
  if (v5)
    dispatch_release(v5);
  v6 = (std::__shared_weak_count *)*((_QWORD *)__p + 2);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::operator()(_QWORD *a1, void **a2)
{
  void *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  xpc_object_t object;
  xpc_object_t objecta;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  *a2 = xpc_null_create();
  v4 = (std::__shared_weak_count *)a1[2];
  if (!v4)
    goto LABEL_29;
  v5 = std::__shared_weak_count::lock(v4);
  if (!v5)
    goto LABEL_29;
  v6 = v5;
  if (a1[1])
  {
    *(_QWORD *)&v16 = a1[1];
    *((_QWORD *)&v16 + 1) = v5;
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    object = v3;
    if (v3)
    {
      xpc_retain(v3);
      v9 = v19;
      v10 = a1[7];
      if (!v10)
        goto LABEL_12;
    }
    else
    {
      object = xpc_null_create();
      v9 = v19;
      v10 = a1[7];
      if (!v10)
        goto LABEL_12;
    }
    if ((_QWORD *)v10 == a1 + 4)
    {
      v20 = v19;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v19);
LABEL_14:
      v11 = a1[3];
      v12 = operator new(0x38uLL);
      *(_OWORD *)v12 = v16;
      v12[2] = object;
      objecta = xpc_null_create();
      if (v20)
      {
        if (v20 == v19)
        {
          v12[6] = v12 + 3;
          (*(void (**)(_QWORD *))(v19[0] + 24))(v19);
        }
        else
        {
          v12[6] = v20;
          v20 = 0;
        }
      }
      else
      {
        v12[6] = 0;
      }
      dispatch_async_f(v11, v12, (dispatch_function_t)dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
      if (v20 == v19)
      {
        v13 = 4;
      }
      else
      {
        if (!v20)
        {
LABEL_24:
          xpc_release(objecta);
          goto LABEL_25;
        }
        v13 = 5;
        v9 = v20;
      }
      (*(void (**)(_QWORD *))(*v9 + 8 * v13))(v9);
      goto LABEL_24;
    }
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
LABEL_12:
    v20 = (_QWORD *)v10;
    goto LABEL_14;
  }
LABEL_25:
  v14 = (unint64_t *)&v6->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_29:
  xpc_release(v3);
}

void sub_236357404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functi"
                     "onIFvNS2_6objectEEEEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueE"
                                "NS6_8functionIFvNS2_6objectEEEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::target_type()
{
}

void dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  xpc_object_t object;

  v2 = *(void **)(a1 + 16);
  object = v2;
  if (v2)
  {
    xpc_retain(v2);
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      goto LABEL_3;
LABEL_7:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  object = xpc_null_create();
  v3 = *(_QWORD *)(a1 + 48);
  if (!v3)
    goto LABEL_7;
LABEL_3:
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v3 + 48))(v3, &object);
  xpc_release(object);
  v4 = *(_QWORD **)(a1 + 48);
  if (v4 == (_QWORD *)(a1 + 24))
  {
    v5 = 4;
    v4 = (_QWORD *)(a1 + 24);
    goto LABEL_9;
  }
  if (v4)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  xpc_release(*(xpc_object_t *)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  v6 = *(std::__shared_weak_count **)(a1 + 8);
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
  operator delete((void *)a1);
}

void sub_236357630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;

  xpc_release(object);
  v12 = *(_QWORD **)(v10 + 48);
  if (v12 == (_QWORD *)(v10 + 24))
  {
    v13 = 4;
    v12 = (_QWORD *)(v10 + 24);
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_6:
  xpc_release(*(xpc_object_t *)(v10 + 16));
  *(_QWORD *)(v10 + 16) = 0;
  v14 = *(std::__shared_weak_count **)(v10 + 8);
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
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t value;
  uint64_t v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 16);
  if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 24), "ConnectLink"))
  {
    *(_BYTE *)(v2 + 96) = 1;
    v3 = *(_QWORD *)(v2 + 56);
    value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 24), "ConnectLink");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v3 + 16))(v3, &object);
    xpc_release(object);
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 56);
    v6 = *(void **)(a1 + 24);
    object = v6;
    if (v6)
      xpc_retain(v6);
    else
      object = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v5 + 24))(v5, &object);
    xpc_release(object);
  }
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
  v7 = *(std::__shared_weak_count **)(a1 + 8);
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
  operator delete((void *)a1);
}

void sub_23635781C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;

  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(_QWORD *)(v10 + 24) = 0;
  v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *a1;
  *a1 = 0;
  if (!v2)
    return a1;
  v3 = *(_QWORD **)(v2 + 64);
  if (v3 == (_QWORD *)(v2 + 40))
  {
    v4 = 4;
    v3 = (_QWORD *)(v2 + 40);
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 5;
LABEL_6:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  v5 = *(NSObject **)(v2 + 32);
  if (v5)
    dispatch_release(v5);
  xpc_release(*(xpc_object_t *)(v2 + 24));
  *(_QWORD *)(v2 + 24) = 0;
  v6 = *(std::__shared_weak_count **)(v2 + 8);
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
  operator delete((void *)v2);
  return a1;
}

uint64_t *dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v10;
  dispatch_object_t object;
  xpc_object_t v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v3 = a1[2];
  v2 = (void *)a1[3];
  v4 = *(_QWORD *)(v3 + 56);
  v12 = v2;
  if (v2)
  {
    xpc_retain(v2);
    v5 = a1[4];
    object = v5;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = xpc_null_create();
  v5 = a1[4];
  object = v5;
  if (v5)
LABEL_3:
    dispatch_retain(v5);
LABEL_4:
  v6 = a1[8];
  if (!v6)
  {
LABEL_7:
    v14 = (_BYTE *)v6;
    goto LABEL_11;
  }
  if ((_QWORD *)v6 != a1 + 5)
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
    goto LABEL_7;
  }
  v14 = v13;
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v6 + 24))(v6, v13);
LABEL_11:
  (*(void (**)(uint64_t, xpc_object_t *, dispatch_object_t *, _BYTE *))(*(_QWORD *)v4 + 32))(v4, &v12, &object, v13);
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v8))(v7);
LABEL_16:
  if (object)
    dispatch_release(object);
  xpc_release(v12);
  return std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100]((uint64_t *)&v10);
}

void sub_236357AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, xpc_object_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (object)
    dispatch_release(object);
  xpc_release(a11);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_236357B08(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>(abb::link::LocalClientLink::handleServerError(xpc::object)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  xpc_object_t object;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(void **)(a1 + 24);
  v4 = *(_QWORD *)(v3 + 56);
  object = v2;
  if (v2)
    xpc_retain(v2);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v4 + 40))(v4, &object);
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
  v5 = *(std::__shared_weak_count **)(a1 + 8);
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
  operator delete((void *)a1);
}

void sub_236357BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;

  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(_QWORD *)(v10 + 24) = 0;
  v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void abb::link::XpcServerLink::create(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  xpc_object_t v7;
  std::string *v8;
  xpc_object_t v9;
  const char *v10;

  v6 = operator new(0x48uLL);
  v7 = *a2;
  *a2 = xpc_null_create();
  *v6 = off_2507AE1B8;
  v8 = (std::string *)(v6 + 1);
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v6[3] = *(_QWORD *)(a1 + 16);
  }
  v6[4] = 0;
  v6[5] = 0;
  *v6 = off_2507AE1F8;
  v6[6] = 0;
  v6[7] = v7;
  v9 = xpc_null_create();
  if (*(char *)(a1 + 23) >= 0)
    v10 = (const char *)a1;
  else
    v10 = *(const char **)a1;
  v6[8] = dispatch_queue_create(v10, 0);
  std::shared_ptr<abb::link::XpcServerLink>::shared_ptr[abi:ne180100]<abb::link::XpcServerLink,void>(a3, (uint64_t)v6);
  xpc_release(v9);
}

void sub_236357D2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  int v3;

  xpc_release(v2);
  if (v3)
    operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::XpcServerLink::XpcServerLink(_QWORD *a1, __int128 *a2, xpc_object_t *a3)
{
  std::string *v6;
  __int128 v7;
  xpc_object_t v8;
  const char *v9;

  *a1 = off_2507AE1B8;
  v6 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    v6->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  a1[4] = 0;
  a1[5] = 0;
  *a1 = off_2507AE1F8;
  v8 = *a3;
  a1[6] = 0;
  a1[7] = v8;
  *a3 = xpc_null_create();
  if (*((char *)a2 + 23) >= 0)
    v9 = (const char *)a2;
  else
    v9 = *(const char **)a2;
  a1[8] = dispatch_queue_create(v9, 0);
  return a1;
}

{
  std::string *v6;
  __int128 v7;
  xpc_object_t v8;
  const char *v9;

  *a1 = off_2507AE1B8;
  v6 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    v6->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  a1[4] = 0;
  a1[5] = 0;
  *a1 = off_2507AE1F8;
  v8 = *a3;
  a1[6] = 0;
  a1[7] = v8;
  *a3 = xpc_null_create();
  if (*((char *)a2 + 23) >= 0)
    v9 = (const char *)a2;
  else
    v9 = *(const char **)a2;
  a1[8] = dispatch_queue_create(v9, 0);
  return a1;
}

void abb::link::ServerLink::~ServerLink(void **this)
{
  *this = off_2507AE1B8;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

void abb::link::XpcServerLink::~XpcServerLink(abb::link::XpcServerLink *this)
{
  NSObject *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  v2 = *((_QWORD *)this + 8);
  if (v2)
    dispatch_release(v2);
  xpc_release(*((xpc_object_t *)this + 7));
  v3 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  *(_QWORD *)this = off_2507AE1B8;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  void *v1;

  abb::link::XpcServerLink::~XpcServerLink(this);
  operator delete(v1);
}

uint64_t abb::link::XpcServerLink::getXpcConnection(abb::link::XpcServerLink *this)
{
  return (uint64_t)this + 56;
}

void abb::link::XpcServerLink::connectLink(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23B7F09AC](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
      v5 = v4;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v4 = 0;
  }
  xpc_release(v4);
  v6 = *a2;
  if (v6)
    xpc_retain(v6);
  else
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v5, "ConnectLink", v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  if (v5)
  {
    xpc_retain(v5);
    v8 = v5;
  }
  else
  {
    v8 = xpc_null_create();
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), v8);
  xpc_release(v8);
  xpc_release(v5);
}

void sub_2363580AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  xpc_release(v2);
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void abb::link::XpcServerLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), *a2);
}

void abb::link::XpcServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, _QWORD *a4)
{
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD handler[4];
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_xpc_connection_s **)(a1 + 56);
  v5 = *a2;
  v6 = *a3;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENSt3__18functionIFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  v7 = v11;
  v8 = (_QWORD *)a4[3];
  if (v8)
  {
    if (v8 == a4)
    {
      v12 = v11;
      (*(void (**)(_QWORD *, _BYTE *))(*a4 + 24))(a4, v11);
    }
    else
    {
      v12 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v8 + 16))(v8);
    }
  }
  else
  {
    v12 = 0;
  }
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  if (v12 == v11)
  {
    v9 = 4;
  }
  else
  {
    if (!v12)
      return;
    v9 = 5;
    v7 = v12;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v9))(v7);
}

void sub_236358220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;

  if (a17 == v17)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 32))(v17);
    _Unwind_Resume(exception_object);
  }
  if (!a17)
    _Unwind_Resume(exception_object);
  (*(void (**)(uint64_t))(*(_QWORD *)a17 + 40))(a17);
  _Unwind_Resume(exception_object);
}

void ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENSt3__18functionIFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t objecta;

  objecta = object;
  if (!object)
  {
    objecta = xpc_null_create();
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      goto LABEL_3;
LABEL_5:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  xpc_retain(object);
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    goto LABEL_5;
LABEL_3:
  (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v3 + 48))(v3, &objecta);
  xpc_release(objecta);
}

void sub_2363582EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c39_ZTSNSt3__18functionIFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a2 + 56);
  if (result)
  {
    if (result == a2 + 32)
    {
      *(_QWORD *)(a1 + 56) = a1 + 32;
      return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 56) + 24))(*(_QWORD *)(a2 + 56), a1 + 32);
    }
    else
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
      *(_QWORD *)(a1 + 56) = result;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 56) = 0;
  }
  return result;
}

uint64_t __destroy_helper_block_e8_32c39_ZTSNSt3__18functionIFvN3xpc6objectEEEE(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 + 32;
  result = *(_QWORD *)(a1 + 56);
  if (result == v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 32))(v1);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 40))(result);
  return result;
}

void abb::link::XpcServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, void **a4)
{
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD handler[4];
  void *aBlock;

  v4 = *(_xpc_connection_s **)(a1 + 56);
  v5 = *a2;
  v6 = *a3;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_2;
  v7 = *a4;
  if (*a4)
    v7 = _Block_copy(v7);
  aBlock = v7;
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  if (aBlock)
    _Block_release(aBlock);
}

void sub_23635844C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
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

void sub_2363584E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
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

void abb::link::XpcServerLink::handleClientMessage(_QWORD *a1, uint64_t a2, xpc_object_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  xpc_object_t v8;
  NSObject *v9;
  _QWORD *v10;
  xpc_object_t v11;

  v4 = a1[4];
  v5 = a1[5];
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = *a3;
  if (*a3)
    xpc_retain(*a3);
  else
    v8 = xpc_null_create();
  v9 = a1[8];
  v10 = operator new(0x20uLL);
  *v10 = a1;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v8;
  v11 = xpc_null_create();
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>>)::{lambda(void *)#1}::__invoke);
  xpc_release(v11);
}

void abb::link::XpcServerLink::handleClientError(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD *v7;

  v2 = a1[4];
  v3 = a1[5];
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a1[8];
  v7 = operator new(0x18uLL);
  *v7 = a1;
  v7[1] = v2;
  v7[2] = v3;
  dispatch_async_f(v6, v7, (dispatch_function_t)dispatch::async<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>>)::{lambda(void *)#1}::__invoke);
}

_QWORD *abb::link::LocalServerLink::create@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  std::string *v5;
  _BOOL4 v6;
  const char *v7;

  v4 = operator new(0x50uLL);
  *v4 = off_2507AE1B8;
  v5 = (std::string *)(v4 + 1);
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    v6 = *(char *)(a1 + 23) < 0;
  }
  else
  {
    v6 = 0;
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v4[3] = *(_QWORD *)(a1 + 16);
  }
  *v4 = off_2507AE298;
  v4[4] = &unk_2507AE2F0;
  v4[5] = 0;
  v4[7] = 0;
  v4[8] = 0;
  v4[6] = 0;
  if (v6)
    v7 = *(const char **)a1;
  else
    v7 = (const char *)a1;
  v4[9] = dispatch_queue_create(v7, 0);
  return std::shared_ptr<abb::link::LocalServerLink>::shared_ptr[abi:ne180100]<abb::link::LocalServerLink,void>(a2, (uint64_t)v4);
}

void sub_236358730(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::LocalServerLink::LocalServerLink(_QWORD *a1, __int128 *a2)
{
  std::string *v4;
  __int128 v5;
  const char *v6;

  *a1 = off_2507AE1B8;
  v4 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    v4->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  *a1 = off_2507AE298;
  a1[4] = &unk_2507AE2F0;
  a1[5] = 0;
  a1[7] = 0;
  a1[8] = 0;
  a1[6] = 0;
  if (*((char *)a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  a1[9] = dispatch_queue_create(v6, 0);
  return a1;
}

{
  std::string *v4;
  __int128 v5;
  const char *v6;

  *a1 = off_2507AE1B8;
  v4 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    v4->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  *a1 = off_2507AE298;
  a1[4] = &unk_2507AE2F0;
  a1[5] = 0;
  a1[7] = 0;
  a1[8] = 0;
  a1[6] = 0;
  if (*((char *)a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  a1[9] = dispatch_queue_create(v6, 0);
  return a1;
}

void abb::link::LocalServerLink::~LocalServerLink(abb::link::LocalServerLink *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 9);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *(_QWORD *)this = off_2507AE1B8;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 9);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *(_QWORD *)this = off_2507AE1B8;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 9);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *(_QWORD *)this = off_2507AE1B8;
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
  operator delete(this);
}

void `non-virtual thunk to'abb::link::LocalServerLink::~LocalServerLink(abb::link::LocalServerLink *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *((_QWORD *)this - 4) = off_2507AE1B8;
  if (*((char *)this - 1) < 0)
    operator delete(*((void **)this - 3));
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    dispatch_release(v2);
  v3 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  *((_QWORD *)this - 4) = off_2507AE1B8;
  if (*((char *)this - 1) < 0)
    operator delete(*((void **)this - 3));
  operator delete((char *)this - 32);
}

void abb::link::LocalServerLink::connectLink(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t object;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23B7F09AC](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
      v5 = v4;
    }
    else
    {
      v5 = xpc_null_create();
    }
  }
  else
  {
    v5 = xpc_null_create();
    v4 = 0;
  }
  xpc_release(v4);
  v6 = *a2;
  if (v6)
    xpc_retain(v6);
  else
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v5, "ConnectLink", v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  abb::link::LocalServerLink::sendMessage(a1, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v5);
}

void sub_236358C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v2;
  xpc_object_t object;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    object = *a2;
    *a2 = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v2 + 16))(v2, &object);
    xpc_release(object);
  }
}

void sub_236358D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, _QWORD *a4)
{
  uint64_t v4;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  dispatch_object_t object;
  xpc_object_t v13;
  _BYTE v14[24];
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    return;
  v7 = *a2;
  v13 = v7;
  if (v7)
  {
    xpc_retain(v7);
    v8 = *a3;
    object = v8;
    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  v13 = xpc_null_create();
  v8 = *a3;
  object = v8;
  if (v8)
LABEL_4:
    dispatch_retain(v8);
LABEL_5:
  v9 = a4[3];
  if (!v9)
  {
LABEL_8:
    v15 = (_BYTE *)v9;
    goto LABEL_12;
  }
  if ((_QWORD *)v9 != a4)
  {
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
    goto LABEL_8;
  }
  v15 = v14;
  (*(void (**)(_QWORD *, _BYTE *))(*a4 + 24))(a4, v14);
LABEL_12:
  (*(void (**)(uint64_t, xpc_object_t *, dispatch_object_t *, _BYTE *))(*(_QWORD *)v4 + 24))(v4, &v13, &object, v14);
  v10 = v15;
  if (v15 == v14)
  {
    v11 = 4;
    v10 = v14;
    goto LABEL_16;
  }
  if (v15)
  {
    v11 = 5;
LABEL_16:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  if (object)
    dispatch_release(object);
  xpc_release(v13);
}

void sub_236358E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, xpc_object_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (object)
    dispatch_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, xpc_object_t *a2, NSObject **a3, void **a4)
{
  xpc_object_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 64))
    return;
  v7 = *a2;
  v15 = v7;
  if (v7)
  {
    xpc_retain(v7);
    v8 = *a3;
    v14 = v8;
    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = xpc_null_create();
  v8 = *a3;
  v14 = v8;
  v15 = v7;
  if (v8)
LABEL_4:
    dispatch_retain(v8);
LABEL_5:
  v9 = *a4;
  if (*a4)
    v9 = _Block_copy(v9);
  v16[0] = &off_2507AE4C0;
  v16[1] = v9;
  v17 = v16;
  abb::link::LocalServerLink::sendMessage(a1, &v15, &v14, v16);
  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
    goto LABEL_13;
  }
  if (v17)
  {
    v13 = 5;
LABEL_13:
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v12 + 8 * v13))(v12, v10, v11);
  }
  if (v8)
    dispatch_release(v8);
  xpc_release(v7);
}

void sub_236359004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

const void **abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)const::$_0::~$_0(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    _Block_release(v2);
  return a1;
}

void abb::link::LocalServerLink::handleClientMessage(_QWORD *a1, xpc_object_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  xpc_object_t v7;
  NSObject *v8;
  _QWORD *v9;
  xpc_object_t v10;

  v3 = a1[5];
  v4 = a1[6];
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = *a2;
  *a2 = xpc_null_create();
  v8 = a1[9];
  v9 = operator new(0x20uLL);
  *v9 = a1;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v7;
  v10 = xpc_null_create();
  dispatch_async_f(v8, v9, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke);
  xpc_release(v10);
}

void `non-virtual thunk to'abb::link::LocalServerLink::handleClientMessage(uint64_t a1, xpc_object_t *a2)
{
  abb::link::LocalServerLink::handleClientMessage((_QWORD *)(a1 - 32), a2);
}

void abb::link::LocalServerLink::handleClientMessage(_QWORD *a1, xpc_object_t *a2, _QWORD *a3)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  xpc_object_t object;
  xpc_object_t objecta;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a1[6];
  *(_QWORD *)&v13 = a1;
  *((_QWORD *)&v13 + 1) = a1[5];
  v14 = v5;
  if (v5)
  {
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
  }
  object = *a2;
  *a2 = xpc_null_create();
  v8 = v17;
  v9 = (_QWORD *)a3[3];
  if (v9)
  {
    if (v9 == a3)
    {
      v18 = v17;
      (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v17);
    }
    else
    {
      v18 = (_QWORD *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  v10 = a1[9];
  v11 = operator new(0x40uLL);
  *(_OWORD *)v11 = v13;
  v11[2] = v14;
  v11[3] = object;
  objecta = xpc_null_create();
  if (v18)
  {
    if (v18 == v17)
    {
      v11[7] = v11 + 4;
      (*(void (**)(_QWORD *))(v17[0] + 24))(v17);
    }
    else
    {
      v11[7] = v18;
      v18 = 0;
    }
  }
  else
  {
    v11[7] = 0;
  }
  dispatch_async_f(v10, v11, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (v18 == v17)
  {
    v12 = 4;
    goto LABEL_18;
  }
  if (v18)
  {
    v12 = 5;
    v8 = v18;
LABEL_18:
    (*(void (**)(_QWORD *))(*v8 + 8 * v12))(v8);
  }
  xpc_release(objecta);
}

void sub_236359308(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void `non-virtual thunk to'abb::link::LocalServerLink::handleClientMessage(uint64_t a1, xpc_object_t *a2, _QWORD *a3)
{
  abb::link::LocalServerLink::handleClientMessage((_QWORD *)(a1 - 32), a2, a3);
}

void abb::link::LocalServerLink::handleClientError(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD *v7;

  v2 = a1[5];
  v3 = a1[6];
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a1[9];
  v7 = operator new(0x18uLL);
  *v7 = a1;
  v7[1] = v2;
  v7[2] = v3;
  dispatch_async_f(v6, v7, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
}

void `non-virtual thunk to'abb::link::LocalServerLink::handleClientError(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD *v7;

  v2 = a1[1];
  v3 = a1[2];
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a1[5];
  v7 = operator new(0x18uLL);
  *v7 = a1 - 4;
  v7[1] = v2;
  v7[2] = v3;
  dispatch_async_f(v6, v7, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
}

uint64_t abb::link::ServerLink::isXpc(abb::link::ServerLink *this)
{
  return 0;
}

uint64_t abb::link::XpcServerLink::isXpc(abb::link::XpcServerLink *this)
{
  return 1;
}

uint64_t abb::link::LocalServerLink::isXpc(abb::link::LocalServerLink *this)
{
  return 0;
}

_QWORD *std::shared_ptr<abb::link::XpcServerLink>::shared_ptr[abi:ne180100]<abb::link::XpcServerLink,void>(_QWORD *a1, uint64_t a2)
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

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_2507AE420;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 40);
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        return a1;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      *(_QWORD *)(a2 + 32) = a2;
      *(_QWORD *)(a2 + 40) = v4;
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
      *(_QWORD *)(a2 + 32) = a2;
      *(_QWORD *)(a2 + 40) = v4;
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
  return a1;
}

void sub_236359540(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<abb::link::XpcServerLink>::~unique_ptr[abi:ne180100]((abb::link::XpcServerLink **)va);
  _Unwind_Resume(a1);
}

abb::link::XpcServerLink **std::unique_ptr<abb::link::XpcServerLink>::~unique_ptr[abi:ne180100](abb::link::XpcServerLink **a1)
{
  abb::link::XpcServerLink *v2;
  void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::XpcServerLink::~XpcServerLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::__on_zero_shared(uint64_t a1)
{
  abb::link::XpcServerLink *v1;
  void *v2;

  v1 = *(abb::link::XpcServerLink **)(a1 + 24);
  if (v1)
  {
    abb::link::XpcServerLink::~XpcServerLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635E3F3)
    return a1 + 24;
  if (((v3 & 0x800000023635E3F3 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635E3F3))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635E3F3 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void dispatch::async<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  xpc_object_t object;

  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
  {
    v3 = *a1;
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[1])
      {
        v6 = *(_QWORD *)(v3 + 48);
        if (v6)
        {
          v7 = (void *)a1[3];
          object = v7;
          if (v7)
            xpc_retain(v7);
          else
            object = xpc_null_create();
          (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v6 + 16))(v6, &object);
          xpc_release(object);
          object = 0;
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  xpc_release((xpc_object_t)a1[3]);
  a1[3] = 0;
  v10 = (std::__shared_weak_count *)a1[2];
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  operator delete(a1);
}

void sub_236359728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;

  xpc_release(object);
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(_QWORD *)(v10 + 24) = 0;
  v15 = *(std::__shared_weak_count **)(v10 + 16);
  if (v15)
    std::__shared_weak_count::__release_weak(v15);
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void dispatch::async<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *__p)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
  {
    v3 = *__p;
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (__p[1])
      {
        v6 = *(_QWORD *)(v3 + 48);
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 32))(v6);
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v9 = (std::__shared_weak_count *)__p[2];
    if (v9)
      std::__shared_weak_count::__release_weak(v9);
  }
  operator delete(__p);
}

void sub_236359838(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;

  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
  {
    v6 = (std::__shared_weak_count *)v1[2];
    if (!v6)
      goto LABEL_5;
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v6 = (std::__shared_weak_count *)v1[2];
    if (!v6)
    {
LABEL_5:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  std::__shared_weak_count::__release_weak(v6);
  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<abb::link::LocalServerLink>::shared_ptr[abi:ne180100]<abb::link::LocalServerLink,void>(_QWORD *a1, uint64_t a2)
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

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_2507AE470;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    v6 = *(std::__shared_weak_count **)(a2 + 48);
    if (v6)
    {
      if (v6->__shared_owners_ != -1)
        return a1;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v9 = __ldxr(p_shared_weak_owners);
      while (__stxr(v9 + 1, p_shared_weak_owners));
      *(_QWORD *)(a2 + 40) = a2;
      *(_QWORD *)(a2 + 48) = v4;
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
      *(_QWORD *)(a2 + 40) = a2;
      *(_QWORD *)(a2 + 48) = v4;
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
  return a1;
}

void sub_236359A18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<abb::link::LocalServerLink>::reset[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::__on_zero_shared(uint64_t a1)
{
  char *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v1 = *(char **)(a1 + 24);
  if (v1)
  {
    v2 = *((_QWORD *)v1 + 9);
    if (v2)
      dispatch_release(v2);
    v3 = *((_QWORD *)v1 + 8);
    *((_QWORD *)v1 + 8) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    v4 = *((_QWORD *)v1 + 7);
    *((_QWORD *)v1 + 7) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = (std::__shared_weak_count *)*((_QWORD *)v1 + 6);
    if (v5)
      std::__shared_weak_count::__release_weak(v5);
    *(_QWORD *)v1 = off_2507AE1B8;
    if (v1[31] < 0)
      operator delete(*((void **)v1 + 1));
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635E4D4)
    return a1 + 24;
  if (((v3 & 0x800000023635E4D4 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635E4D4))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635E4D4 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::unique_ptr<abb::link::LocalServerLink>::reset[abi:ne180100](void **a1)
{
  char *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v1 = (char *)*a1;
  *a1 = 0;
  if (v1)
  {
    v2 = *((_QWORD *)v1 + 9);
    if (v2)
      dispatch_release(v2);
    v3 = *((_QWORD *)v1 + 8);
    *((_QWORD *)v1 + 8) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    v4 = *((_QWORD *)v1 + 7);
    *((_QWORD *)v1 + 7) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = (std::__shared_weak_count *)*((_QWORD *)v1 + 6);
    if (v5)
      std::__shared_weak_count::__release_weak(v5);
    *(_QWORD *)v1 = off_2507AE1B8;
    if (v1[31] < 0)
      operator delete(*((void **)v1 + 1));
    operator delete(v1);
  }
}

_QWORD *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::~__func(_QWORD *a1)
{
  const void *v2;

  *a1 = &off_2507AE4C0;
  v2 = (const void *)a1[1];
  if (v2)
    _Block_release(v2);
  return a1;
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::~__func(_QWORD *__p)
{
  const void *v2;

  *__p = &off_2507AE4C0;
  v2 = (const void *)__p[1];
  if (v2)
    _Block_release(v2);
  operator delete(__p);
}

_QWORD *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = &off_2507AE4C0;
  if (v3)
    v3 = _Block_copy(v3);
  v2[1] = v3;
  return v2;
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1, _QWORD *a2)
{
  void *result;

  result = *(void **)(a1 + 8);
  *a2 = &off_2507AE4C0;
  if (result)
    result = _Block_copy(result);
  a2[1] = result;
  return result;
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::destroy(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    _Block_release(v1);
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::destroy_deallocate(_QWORD *__p)
{
  const void *v2;

  v2 = (const void *)__p[1];
  if (v2)
    _Block_release(v2);
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::operator()(uint64_t a1, void **a2)
{
  void *v3;
  uint64_t v4;
  xpc_object_t object;

  v3 = *a2;
  *a2 = xpc_null_create();
  v4 = *(_QWORD *)(a1 + 8);
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &object);
  xpc_release(object);
  xpc_release(v3);
}

void sub_236359DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerF"
                     "vNS2_6objectEEEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13blo"
                                "ck_pointerFvNS2_6objectEEEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::target_type()
{
}

void dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  xpc_object_t object;

  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
  {
    v3 = *a1;
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[1])
      {
        v6 = *(_QWORD *)(v3 + 56);
        if (v6)
        {
          v7 = (void *)a1[3];
          object = v7;
          if (v7)
            xpc_retain(v7);
          else
            object = xpc_null_create();
          (*(void (**)(uint64_t, xpc_object_t *))(*(_QWORD *)v6 + 16))(v6, &object);
          xpc_release(object);
          object = 0;
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  xpc_release((xpc_object_t)a1[3]);
  a1[3] = 0;
  v10 = (std::__shared_weak_count *)a1[2];
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  operator delete(a1);
}

void sub_236359F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;

  xpc_release(object);
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(_QWORD *)(v10 + 24) = 0;
  v15 = *(std::__shared_weak_count **)(v10 + 16);
  if (v15)
    std::__shared_weak_count::__release_weak(v15);
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(char *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  xpc_object_t object;
  _BYTE v18[24];
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (std::__shared_weak_count *)*((_QWORD *)a1 + 2);
  if (!v2)
    goto LABEL_22;
  v3 = *(_QWORD *)a1;
  v4 = std::__shared_weak_count::lock(v2);
  if (!v4)
    goto LABEL_22;
  v5 = v4;
  if (*((_QWORD *)a1 + 1))
  {
    v6 = *(_QWORD *)(v3 + 56);
    if (v6)
    {
      v7 = (void *)*((_QWORD *)a1 + 3);
      object = v7;
      if (v7)
      {
        xpc_retain(v7);
        v8 = *((_QWORD *)a1 + 7);
        if (!v8)
          goto LABEL_11;
      }
      else
      {
        object = xpc_null_create();
        v8 = *((_QWORD *)a1 + 7);
        if (!v8)
          goto LABEL_11;
      }
      if ((char *)v8 == a1 + 32)
      {
        v19 = v18;
        (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 24))(v8, v18);
LABEL_13:
        (*(void (**)(uint64_t, xpc_object_t *, _BYTE *))(*(_QWORD *)v6 + 24))(v6, &object, v18);
        v9 = v19;
        if (v19 == v18)
        {
          v10 = 4;
          v9 = v18;
        }
        else
        {
          if (!v19)
          {
LABEL_18:
            xpc_release(object);
            object = 0;
            goto LABEL_19;
          }
          v10 = 5;
        }
        (*(void (**)(_QWORD *))(*v9 + 8 * v10))(v9);
        goto LABEL_18;
      }
      v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
LABEL_11:
      v19 = (_BYTE *)v8;
      goto LABEL_13;
    }
  }
LABEL_19:
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    v13 = a1 + 32;
    v14 = (char *)*((_QWORD *)a1 + 7);
    if (v14 != a1 + 32)
      goto LABEL_23;
LABEL_26:
    v15 = 4;
    v14 = v13;
    goto LABEL_27;
  }
LABEL_22:
  v13 = a1 + 32;
  v14 = (char *)*((_QWORD *)a1 + 7);
  if (v14 == a1 + 32)
    goto LABEL_26;
LABEL_23:
  if (!v14)
    goto LABEL_28;
  v15 = 5;
LABEL_27:
  (*(void (**)(char *))(*(_QWORD *)v14 + 8 * v15))(v14);
LABEL_28:
  xpc_release(*((xpc_object_t *)a1 + 3));
  *((_QWORD *)a1 + 3) = 0;
  v16 = (std::__shared_weak_count *)*((_QWORD *)a1 + 2);
  if (v16)
    std::__shared_weak_count::__release_weak(v16);
  operator delete(a1);
}

void sub_23635A1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  xpc_release(object);
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  v18 = *(_QWORD **)(v13 + 56);
  if (v18 == (_QWORD *)(v13 + 32))
  {
    v19 = 4;
    v18 = (_QWORD *)(v13 + 32);
  }
  else
  {
    if (!v18)
      goto LABEL_10;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_10:
  xpc_release(*(xpc_object_t *)(v13 + 24));
  *(_QWORD *)(v13 + 24) = 0;
  v20 = *(std::__shared_weak_count **)(v13 + 16);
  if (v20)
    std::__shared_weak_count::__release_weak(v20);
  operator delete((void *)v13);
  _Unwind_Resume(a1);
}

void sub_23635A288(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *__p)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;

  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
  {
    v3 = *__p;
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (__p[1])
      {
        v6 = *(_QWORD *)(v3 + 56);
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 32))(v6);
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v9 = (std::__shared_weak_count *)__p[2];
    if (v9)
      std::__shared_weak_count::__release_weak(v9);
  }
  operator delete(__p);
}

void sub_23635A338(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;

  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
  {
    v6 = (std::__shared_weak_count *)v1[2];
    if (!v6)
      goto LABEL_5;
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v6 = (std::__shared_weak_count *)v1[2];
    if (!v6)
    {
LABEL_5:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  std::__shared_weak_count::__release_weak(v6);
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *abb::link::XpcLinkAccepter::Configuration::Configuration(std::string *this, __int128 *a2)
{
  std::string *v2;
  __int128 v3;

  v2 = this;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    return v2;
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  return this;
}

{
  std::string *v2;
  __int128 v3;

  v2 = this;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    return v2;
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  return this;
}

uint64_t abb::link::XpcLinkAccepter::Configuration::isEntitled(uint64_t *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  xpc_object_t v6;
  _BOOL8 v7;
  xpc_object_t v8;
  xpc_object_t value;

  if (MEMORY[0x23B7F09AC](*a2) != MEMORY[0x24BDACF88])
    return 0;
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    if (*((_BYTE *)a1 + 23))
      goto LABEL_5;
    return 1;
  }
  if (!a1[1])
    return 1;
LABEL_5:
  xpc_connection_get_audit_token();
  v4 = (void *)xpc_copy_entitlement_for_token();
  v5 = MEMORY[0x24BDACFA0];
  if (v4 || (v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23B7F09AC](v4) == v5)
    {
      xpc_retain(v4);
      v6 = v4;
    }
    else
    {
      v6 = xpc_null_create();
    }
  }
  else
  {
    v6 = xpc_null_create();
    v4 = 0;
  }
  xpc_release(v4);
  if (MEMORY[0x23B7F09AC](v6) != v5)
    goto LABEL_14;
  if (*((char *)a1 + 23) < 0)
    a1 = (uint64_t *)*a1;
  if (xpc_dictionary_get_value(v6, (const char *)a1)
    && (v8 = xpc_dictionary_get_value(v6, (const char *)a1), MEMORY[0x23B7F09AC](v8) == MEMORY[0x24BDACF80]))
  {
    value = xpc_dictionary_get_value(v6, (const char *)a1);
    v7 = xpc_BOOL_get_value(value);
  }
  else
  {
LABEL_14:
    v7 = 0;
  }
  xpc_release(v6);
  return v7;
}

void sub_23635A5F4(_Unwind_Exception *a1)
{
  void *v1;

  xpc_release(v1);
  _Unwind_Resume(a1);
}

void abb::link::XpcLinkAccepter::create(xpc_object_t *a1@<X0>, dispatch_object_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v11;
  unint64_t v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  std::string __p;
  dispatch_object_t object;
  xpc_object_t v21;

  v8 = operator new(0x50uLL);
  v21 = *a1;
  *a1 = xpc_null_create();
  object = *a2;
  *a2 = 0;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  abb::link::XpcLinkAccepter::XpcLinkAccepter((uint64_t)v8, &v21, &object, (__int128 *)&__p);
  *a4 = v8;
  v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)off_2507AE6A8;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  a4[1] = v9;
  v11 = (std::__shared_weak_count *)*((_QWORD *)v8 + 2);
  if (v11)
  {
    if (v11->__shared_owners_ != -1)
      goto LABEL_16;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    *((_QWORD *)v8 + 1) = v8;
    *((_QWORD *)v8 + 2) = v9;
    std::__shared_weak_count::__release_weak(v11);
  }
  else
  {
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    v16 = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    *((_QWORD *)v8 + 1) = v8;
    *((_QWORD *)v8 + 2) = v9;
  }
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (v18)
  {
LABEL_16:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_17:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_18:
  if (object)
    dispatch_release(object);
  xpc_release(v21);
}

void sub_23635A7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, dispatch_object_t object, xpc_object_t a17)
{
  void *v17;

  if (object)
    dispatch_release(object);
  xpc_release(a17);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void xpc::connection::~connection(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

uint64_t abb::link::XpcLinkAccepter::XpcLinkAccepter(uint64_t a1, xpc_object_t *a2, _QWORD *a3, __int128 *a4)
{
  __int128 v7;
  xpc_object_t object;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = off_2507AE540;
  *(_QWORD *)(a1 + 24) = *a2;
  *a2 = xpc_null_create();
  *(_QWORD *)(a1 + 32) = *a3;
  *a3 = 0;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 40), *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v7 = *a4;
    *(_QWORD *)(a1 + 56) = *((_QWORD *)a4 + 2);
    *(_OWORD *)(a1 + 40) = v7;
  }
  *(_QWORD *)(a1 + 64) = 0;
  object = xpc_null_create();
  MEMORY[0x23B7F07A8](a1 + 72, &object);
  xpc_release(object);
  return a1;
}

void sub_23635A920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v10;
  xpc_object_t *v11;
  NSObject *v13;
  std::__shared_weak_count *v14;

  v13 = *(NSObject **)(v10 + 32);
  if (v13)
  {
    dispatch_release(v13);
    xpc::connection::~connection(v11);
    v14 = *(std::__shared_weak_count **)(v10 + 16);
    if (!v14)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else
  {
    xpc::connection::~connection(v11);
    v14 = *(std::__shared_weak_count **)(v10 + 16);
    if (!v14)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v14);
  _Unwind_Resume(a1);
}

void abb::link::XpcLinkAccepter::createClientLink(NSObject **this@<X0>, _QWORD *a2@<X8>)
{
  NSObject *v2;
  abb::link::XpcLinkAccepter *v3;
  _QWORD block[6];

  v3 = (abb::link::XpcLinkAccepter *)this;
  v2 = this[4];
  *a2 = 0;
  a2[1] = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN8dispatch9sync_implIZN3abb4link15XpcLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  block[4] = a2;
  block[5] = &v3;
  dispatch_sync(v2, block);
}

void abb::link::XpcLinkAccepter::startAccepting(abb::link::XpcLinkAccepter *this)
{
  NSObject *v2;
  _QWORD *v3;

  v2 = *((_QWORD *)this + 4);
  v3 = operator new(8uLL);
  *v3 = this;
  dispatch_async_f(v2, v3, (dispatch_function_t)dispatch::async<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcLinkAccepter::startAccepting(void)::$_0,std::default_delete<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>>)::{lambda(void *)#1}::__invoke);
}

uint64_t abb::link::XpcLinkAccepter::handleNewClient(uint64_t a1, xpc_connection_t *a2)
{
  void *v4;
  char isEntitled;
  xpc_connection_t v6;
  xpc_object_t v8;
  unint64_t v9;
  NSObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  xpc_object_t object;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  __int128 handler;
  void (*v32)(_QWORD *, xpc_object_t);
  void *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  xpc_object_t v36;

  if (MEMORY[0x23B7F09AC](*a2) != MEMORY[0x24BDACF88])
    return 0;
  xpc_connection_get_pid(*a2);
  v4 = *a2;
  v30 = v4;
  if (v4)
  {
    xpc_retain(v4);
  }
  else
  {
    v4 = xpc_null_create();
    v30 = v4;
  }
  isEntitled = abb::link::XpcLinkAccepter::Configuration::isEntitled((uint64_t *)(a1 + 40), &v30);
  xpc_release(v4);
  v30 = 0;
  if ((isEntitled & 1) == 0)
    return 0;
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  HIBYTE(v32) = 11;
  strcpy((char *)&handler, "client-name");
  v6 = *a2;
  object = v6;
  if (v6)
    xpc_retain(v6);
  else
    object = xpc_null_create();
  abb::link::XpcServerLink::create((uint64_t)&handler, &object, &v28);
  xpc_release(object);
  object = 0;
  if ((SHIBYTE(v32) & 0x80000000) == 0)
  {
    v8 = *(xpc_object_t *)(v28 + 56);
    if (v8)
      goto LABEL_12;
LABEL_40:
    v8 = xpc_null_create();
    v9 = v28;
    v10 = *(NSObject **)(v28 + 64);
    if (!v10)
      goto LABEL_14;
    goto LABEL_13;
  }
  operator delete((void *)handler);
  v8 = *(xpc_object_t *)(v28 + 56);
  if (!v8)
    goto LABEL_40;
LABEL_12:
  xpc_retain(v8);
  v9 = v28;
  v10 = *(NSObject **)(v28 + 64);
  if (v10)
  {
LABEL_13:
    dispatch_retain(v10);
    v9 = v28;
  }
LABEL_14:
  v11 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v12 = (unint64_t *)(v29 + 16);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *(_QWORD *)&handler = MEMORY[0x24BDAC760];
  *((_QWORD *)&handler + 1) = 1174405120;
  v32 = ___ZNK3ctu15XpcServerHelper12acceptClientIN3abb4link13XpcServerLinkEEEvN3xpc10connectionEN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke;
  v33 = &__block_descriptor_tmp_5;
  v34 = v9;
  v35 = v11;
  if (v11)
  {
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
  }
  v36 = v8;
  xpc_connection_set_event_handler((xpc_connection_t)v8, &handler);
  xpc_connection_set_target_queue((xpc_connection_t)v8, v10);
  xpc_connection_resume((xpc_connection_t)v8);
  if (v35)
    std::__shared_weak_count::__release_weak(v35);
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  if (v10)
    dispatch_release(v10);
  xpc_release(v8);
  v16 = *(_QWORD *)(a1 + 64);
  v25 = v28;
  v26 = (std::__shared_weak_count *)v29;
  if (v29)
  {
    v17 = (unint64_t *)(v29 + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  (*(void (**)(uint64_t, unint64_t *))(*(_QWORD *)v16 + 16))(v16, &v25);
  v19 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = (std::__shared_weak_count *)v29;
  if (!v29)
    return 1;
  v23 = (unint64_t *)(v29 + 8);
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (v24)
    return 1;
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  return 1;
}

void sub_23635AD54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_23635AD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  void *v24;
  NSObject *v25;
  std::__shared_weak_count *v26;

  if (a24)
  {
    std::__shared_weak_count::__release_weak(a24);
    if (!v26)
    {
LABEL_3:
      if (!v25)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if (!v26)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v26);
  if (!v25)
  {
LABEL_5:
    xpc_release(v24);
    std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
LABEL_4:
  dispatch_release(v25);
  goto LABEL_5;
}

void sub_23635ADFC()
{
  void *v0;

  xpc_release(v0);
  JUMPOUT(0x23635AE08);
}

void abb::link::LocalLinkAccepter::create(const void *(__cdecl **a1)(const std::__shared_weak_count *__hidden this, const std::type_info *)@<X0>, std::__shared_weak_count_vtbl **a2@<X8>)
{
  std::__shared_weak_count_vtbl *v4;
  const void *(__cdecl *v5)(const std::__shared_weak_count *__hidden, const std::type_info *);
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  unint64_t v12;

  v4 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
  v5 = *a1;
  *a1 = 0;
  v4->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_2507AE570;
  v4->~__shared_weak_count_0 = 0;
  v4->__on_zero_shared = 0;
  v4->__get_deleter = v5;
  v4->__on_zero_shared_weak = 0;
  *a2 = v4;
  v6 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7 = v6;
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_2507AE778;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = v4;
  a2[1] = (std::__shared_weak_count_vtbl *)v6;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
  do
    v11 = __ldxr(p_shared_weak_owners);
  while (__stxr(v11 + 1, p_shared_weak_owners));
  v4->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
  v4->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v6;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void sub_23635AF00(_Unwind_Exception *a1)
{
  abb::link::LocalLinkAccepter *v1;

  abb::link::LocalLinkAccepter::~LocalLinkAccepter(v1);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::LocalLinkAccepter::LocalLinkAccepter(_QWORD *result, _QWORD *a2)
{
  result[1] = 0;
  result[2] = 0;
  *result = off_2507AE570;
  result[3] = *a2;
  *a2 = 0;
  result[4] = 0;
  return result;
}

{
  result[1] = 0;
  result[2] = 0;
  *result = off_2507AE570;
  result[3] = *a2;
  *a2 = 0;
  result[4] = 0;
  return result;
}

void abb::link::LocalLinkAccepter::createClientLink(NSObject **this@<X0>, _QWORD *a2@<X8>)
{
  NSObject *v2;
  abb::link::LocalLinkAccepter *v3;
  _QWORD block[6];

  v3 = (abb::link::LocalLinkAccepter *)this;
  v2 = this[3];
  *a2 = 0;
  a2[1] = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN8dispatch9sync_implIZN3abb4link17LocalLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_6;
  block[4] = a2;
  block[5] = &v3;
  dispatch_sync(v2, block);
}

void abb::link::LocalLinkAccepter::handleNewClient(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  std::string *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  std::__shared_weak_count *v19;
  std::string __p;
  __int128 v21;

  v5 = a1[1];
  v6 = (std::__shared_weak_count *)a1[2];
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    *(_QWORD *)&v18 = a1;
    *((_QWORD *)&v18 + 1) = v5;
    v19 = v6;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      goto LABEL_7;
  }
  else
  {
    *(_QWORD *)&v18 = a1;
    *((_QWORD *)&v18 + 1) = a1[1];
    v19 = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
    {
LABEL_7:
      __p = *(std::string *)a2;
      goto LABEL_10;
    }
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
LABEL_10:
  v10 = a3[1];
  *(_QWORD *)&v21 = *a3;
  *((_QWORD *)&v21 + 1) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = a1[3];
  v14 = (std::string *)operator new(0x40uLL);
  *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v18;
  v14->__r_.__value_.__r.__words[2] = (std::string::size_type)v19;
  v14[1] = __p;
  memset(&__p, 0, sizeof(__p));
  *(_OWORD *)&v14[2].__r_.__value_.__l.__data_ = v21;
  v21 = 0uLL;
  dispatch_async_f(v13, v14, (dispatch_function_t)dispatch::async<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0,std::default_delete<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>>)::{lambda(void *)#1}::__invoke);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (!*((_QWORD *)&v21 + 1))
    goto LABEL_17;
  v16 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (v17)
  {
LABEL_17:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_18:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_19:
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void sub_23635B16C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  std::__shared_weak_count *v11;

  if (a11)
  {
    std::__shared_weak_count::__release_weak(a11);
    if (!v11)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if (!v11)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v11);
  _Unwind_Resume(exception_object);
}

void abb::link::XpcLinkAccepter::~XpcLinkAccepter(abb::link::XpcLinkAccepter *this)
{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_2507AE540;
  MEMORY[0x23B7F07B4]((char *)this + 72);
  v2 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  v3 = *((_QWORD *)this + 4);
  if (v3)
    dispatch_release(v3);
  xpc_release(*((xpc_object_t *)this + 3));
  *((_QWORD *)this + 3) = 0;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_2507AE540;
  MEMORY[0x23B7F07B4]((char *)this + 72);
  v2 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  v3 = *((_QWORD *)this + 4);
  if (v3)
    dispatch_release(v3);
  xpc_release(*((xpc_object_t *)this + 3));
  *((_QWORD *)this + 3) = 0;
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(this);
}

void abb::link::LocalLinkAccepter::~LocalLinkAccepter(abb::link::LocalLinkAccepter *this)
{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_2507AE570;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 3);
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = off_2507AE570;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 3);
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(this);
}

void std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635E7E9)
    return a1 + 24;
  if (((v3 & 0x800000023635E7E9 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635E7E9))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635E7E9 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void ___ZN8dispatch9sync_implIZN3abb4link15XpcLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  xpc_object_t object;
  unint64_t v15;
  unint64_t v16;

  v2 = *(_xpc_connection_s **)(**(_QWORD **)(a1 + 40) + 24);
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  object = xpc_endpoint_create(v2);
  if (!object)
    object = xpc_null_create();
  abb::link::XpcClientLink::create(&object, &v15);
  xpc_release(object);
  object = 0;
  v4 = v15;
  v3 = v16;
  if (v16)
  {
    v5 = (unint64_t *)(v16 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
    v7 = (std::__shared_weak_count *)v16;
    if (v16)
    {
      v8 = (unint64_t *)(v16 + 8);
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
  v10 = *(unint64_t **)(a1 + 32);
  v11 = (std::__shared_weak_count *)v10[1];
  *v10 = v4;
  v10[1] = v3;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_23635B528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void dispatch::async<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcLinkAccepter::startAccepting(void)::$_0,std::default_delete<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  xpc_connection_t *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  _xpc_connection_s *v10;
  unint64_t *v11;
  unint64_t v12;
  xpc_object_t object;
  _QWORD handler[6];
  std::__shared_weak_count *v15;
  _xpc_connection_s *v16;

  v2 = *a1;
  v3 = *(void **)(*a1 + 24);
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  v4 = (xpc_connection_t *)(v2 + 72);
  ctu::XpcServerHelper::setListener();
  xpc_release(object);
  v5 = *(NSObject **)(v2 + 32);
  if (v5)
    dispatch_retain(*(dispatch_object_t *)(v2 + 32));
  v7 = *(_QWORD *)(v2 + 8);
  v6 = *(std::__shared_weak_count **)(v2 + 16);
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }
  if (MEMORY[0x23B7F09AC](*v4) == MEMORY[0x24BDACF88])
  {
    v10 = *v4;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN3ctu15XpcServerHelper13startListenerIN3abb4link15XpcLinkAccepterEEEvN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke;
    handler[3] = &__block_descriptor_tmp_4;
    handler[4] = v4;
    handler[5] = v7;
    v15 = v6;
    if (v6)
    {
      v11 = (unint64_t *)&v6->__shared_weak_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    v16 = v10;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_set_target_queue(*v4, v5);
    xpc_connection_resume(*v4);
    if (v15)
      std::__shared_weak_count::__release_weak(v15);
  }
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
  if (v5)
    dispatch_release(v5);
  operator delete(a1);
}

void sub_23635B694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  void *v17;
  NSObject *v18;
  std::__shared_weak_count *v19;

  if (a17)
  {
    std::__shared_weak_count::__release_weak(a17);
    if (!v19)
    {
LABEL_3:
      if (!v18)
      {
LABEL_8:
        operator delete(v17);
        _Unwind_Resume(a1);
      }
LABEL_7:
      dispatch_release(v18);
      operator delete(v17);
      _Unwind_Resume(a1);
    }
  }
  else if (!v19)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v19);
  if (!v18)
    goto LABEL_8;
  goto LABEL_7;
}

void ___ZN3ctu15XpcServerHelper13startListenerIN3abb4link15XpcLinkAccepterEEEvN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke(_QWORD *a1, xpc_object_t a2)
{
  ctu::XpcServerHelper *v3;
  std::__shared_weak_count *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _xpc_connection_s *v9;
  _xpc_connection_s *v10;
  char v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  xpc_connection_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v3 = (ctu::XpcServerHelper *)a1[4];
  v16 = 0;
  v17 = 0;
  v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    v17 = std::__shared_weak_count::lock(v4);
    if (!v17)
      return;
    v6 = a1[5];
    v16 = v6;
    if (v6)
    {
      v7 = MEMORY[0x23B7F09AC](a2);
      v8 = MEMORY[0x24BDACF88];
      if (v7 != MEMORY[0x24BDACF88])
      {
        if (v7 == MEMORY[0x24BDACFB8] && *(_QWORD *)ctu::XpcServerHelper::getListener(v3) == a1[7])
        {
          if (a2)
            xpc_retain(a2);
          else
            a2 = xpc_null_create();
          xpc_release(a2);
        }
        goto LABEL_21;
      }
      if (a2)
      {
        xpc_retain(a2);
        v15 = (xpc_connection_t)a2;
        v9 = (_xpc_connection_s *)a2;
      }
      else
      {
        v9 = (_xpc_connection_s *)xpc_null_create();
        v15 = v9;
        if (!v9)
        {
          v10 = (_xpc_connection_s *)xpc_null_create();
          v9 = 0;
          goto LABEL_16;
        }
      }
      if (MEMORY[0x23B7F09AC](v9) == v8)
      {
        xpc_retain(v9);
        v10 = v9;
        goto LABEL_17;
      }
      v10 = (_xpc_connection_s *)xpc_null_create();
LABEL_16:
      v15 = v10;
LABEL_17:
      v11 = abb::link::XpcLinkAccepter::handleNewClient(v6, &v15);
      xpc_release(v10);
      v15 = 0;
      xpc_release(v9);
      if ((v11 & 1) == 0)
        xpc_connection_cancel((xpc_connection_t)a2);
    }
  }
LABEL_21:
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_23635B8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c51_ZTSNSt3__18weak_ptrIN3abb4link15XpcLinkAccepterEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c51_ZTSNSt3__18weak_ptrIN3abb4link15XpcLinkAccepterEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZNK3ctu15XpcServerHelper12acceptClientIN3abb4link13XpcServerLinkEEEvN3xpc10connectionEN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke(_QWORD *a1, xpc_object_t a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  _QWORD *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  xpc_object_t v21;
  xpc_object_t object[2];
  std::__shared_weak_count *v23;

  v3 = (std::__shared_weak_count *)a1[5];
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    v23 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = (_QWORD *)a1[4];
      object[1] = v7;
      if (!v7)
        goto LABEL_26;
      v8 = MEMORY[0x23B7F09AC](a2);
      v9 = MEMORY[0x24BDACFA0];
      if (v8 != MEMORY[0x24BDACFA0])
      {
        if (v8 != MEMORY[0x24BDACFB8])
          goto LABEL_26;
        v10 = (xpc_object_t)a1[6];
        if (v10)
        {
          xpc_retain(v10);
          if (a2)
            goto LABEL_8;
        }
        else
        {
          v10 = xpc_null_create();
          if (a2)
          {
LABEL_8:
            xpc_retain(a2);
            v11 = v7[4];
            v12 = v7[5];
            if (!v12)
              goto LABEL_22;
            goto LABEL_20;
          }
        }
        a2 = xpc_null_create();
        v11 = v7[4];
        v12 = v7[5];
        if (!v12)
        {
LABEL_22:
          v17 = v7[8];
          v18 = operator new(0x18uLL);
          *v18 = v7;
          v18[1] = v11;
          v18[2] = v12;
          dispatch_async_f(v17, v18, (dispatch_function_t)dispatch::async<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>>)::{lambda(void *)#1}::__invoke);
          xpc_release(a2);
          xpc_release(v10);
LABEL_26:
          p_shared_owners = (unint64_t *)&v6->__shared_owners_;
          do
            v20 = __ldaxr(p_shared_owners);
          while (__stlxr(v20 - 1, p_shared_owners));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
          return;
        }
LABEL_20:
        v15 = (unint64_t *)(v12 + 16);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
        goto LABEL_22;
      }
      v13 = (void *)a1[6];
      object[0] = v13;
      if (v13)
      {
        xpc_retain(v13);
        if (a2)
        {
LABEL_12:
          xpc_retain(a2);
          v21 = a2;
          goto LABEL_15;
        }
      }
      else
      {
        object[0] = xpc_null_create();
        if (a2)
          goto LABEL_12;
      }
      a2 = xpc_null_create();
      v21 = a2;
      if (!a2)
      {
        v14 = xpc_null_create();
        a2 = 0;
        goto LABEL_24;
      }
LABEL_15:
      if (MEMORY[0x23B7F09AC](a2) == v9)
      {
        xpc_retain(a2);
        v14 = a2;
        goto LABEL_25;
      }
      v14 = xpc_null_create();
LABEL_24:
      v21 = v14;
LABEL_25:
      abb::link::XpcServerLink::handleClientMessage(v7, (uint64_t)object, &v21);
      xpc_release(v14);
      v21 = 0;
      xpc_release(a2);
      xpc_release(object[0]);
      v6 = v23;
      if (!v23)
        return;
      goto LABEL_26;
    }
  }
}

void sub_23635BB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c49_ZTSNSt3__18weak_ptrIN3abb4link13XpcServerLinkEEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_32c49_ZTSNSt3__18weak_ptrIN3abb4link13XpcServerLinkEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000023635E8CELL)
    return a1 + 24;
  if (((v3 & 0x800000023635E8CELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000023635E8CELL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000023635E8CELL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void ___ZN8dispatch9sync_implIZN3abb4link17LocalLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v2 = **(_QWORD **)(a1 + 40);
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = operator new(0x68uLL);
  v3[2] = 0;
  v3[3] = 0;
  *v3 = off_2507ADD98;
  v3[1] = &unk_2507ADDF8;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_BYTE *)v3 + 96) = 0;
  std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(&v20, (uint64_t)v3);
  v4 = v20;
  v6 = *(_QWORD *)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 16);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = *(std::__shared_weak_count **)(v4 + 48);
  *(_QWORD *)(v4 + 40) = v6;
  *(_QWORD *)(v4 + 48) = v5;
  if (v9)
  {
    std::__shared_weak_count::__release_weak(v9);
    v4 = v20;
  }
  v10 = v21;
  if (v21)
  {
    v11 = (unint64_t *)(v21 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    v13 = (std::__shared_weak_count *)v21;
    if (v21)
    {
      v14 = (unint64_t *)(v21 + 8);
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
  v16 = *(unint64_t **)(a1 + 32);
  v17 = (std::__shared_weak_count *)v16[1];
  *v16 = v4;
  v16[1] = v10;
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
}

void dispatch::async<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0,std::default_delete<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>>)::{lambda(void *)#1}::__invoke(char *__p)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _OWORD *v6;
  _QWORD *v7;
  std::string *v8;
  _BOOL4 v9;
  const char *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *p_shared_weak_owners;
  unint64_t v17;
  _QWORD *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t v54;
  unint64_t v55;

  v2 = (std::__shared_weak_count *)*((_QWORD *)__p + 2);
  if (!v2)
    goto LABEL_58;
  v3 = *(_QWORD *)__p;
  v4 = std::__shared_weak_count::lock(v2);
  if (!v4)
    goto LABEL_58;
  v5 = v4;
  if (*((_QWORD *)__p + 1))
  {
    v6 = __p + 24;
    v54 = 0xAAAAAAAAAAAAAAAALL;
    v55 = 0xAAAAAAAAAAAAAAAALL;
    v7 = operator new(0x50uLL);
    *v7 = off_2507AE1B8;
    v8 = (std::string *)(v7 + 1);
    if (__p[47] < 0)
    {
      std::string::__init_copy_ctor_external(v8, *((const std::string::value_type **)__p + 3), *((_QWORD *)__p + 4));
      v9 = __p[47] < 0;
    }
    else
    {
      v9 = 0;
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *v6;
      v7[3] = *((_QWORD *)__p + 5);
    }
    *v7 = off_2507AE298;
    v7[4] = &unk_2507AE2F0;
    v7[5] = 0;
    v7[7] = 0;
    v7[8] = 0;
    v7[6] = 0;
    if (v9)
      v10 = *(const char **)v6;
    else
      v10 = __p + 24;
    v7[9] = dispatch_queue_create(v10, 0);
    std::shared_ptr<abb::link::LocalServerLink>::shared_ptr[abi:ne180100]<abb::link::LocalServerLink,void>(&v54, (uint64_t)v7);
    v11 = v54;
    v13 = *((_QWORD *)__p + 6);
    v12 = (std::__shared_weak_count *)*((_QWORD *)__p + 7);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v17 = __ldxr(p_shared_weak_owners);
      while (__stxr(v17 + 1, p_shared_weak_owners));
    }
    v18 = operator new(0x18uLL);
    *v18 = &off_2507AE7E8;
    v18[1] = v13;
    v18[2] = v12;
    if (v12)
    {
      v19 = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
      std::__shared_weak_count::__release_weak(v12);
    }
    v21 = *(_QWORD *)(v11 + 64);
    *(_QWORD *)(v11 + 64) = v18;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    if (v12)
    {
      v22 = (unint64_t *)&v12->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v24 = *((_QWORD *)__p + 6);
    v25 = (std::__shared_weak_count *)*((_QWORD *)__p + 7);
    if (v24)
      v26 = v24 - 8;
    else
      v26 = 0;
    if (v25)
    {
      v27 = (unint64_t *)&v25->__shared_owners_;
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    v30 = v54;
    v29 = v55;
    if (v55)
    {
      v31 = (unint64_t *)(v55 + 16);
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    v33 = operator new(0x18uLL);
    *v33 = &off_2507AE838;
    v33[1] = v30;
    v33[2] = v29;
    v34 = *(_QWORD *)(v26 + 32);
    *(_QWORD *)(v26 + 32) = v33;
    if (v34)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
      v30 = v54;
      v29 = v55;
    }
    v35 = *(_QWORD *)(v3 + 32);
    v52 = v30;
    v53 = (std::__shared_weak_count *)v29;
    if (v29)
    {
      v36 = (unint64_t *)(v29 + 8);
      do
        v37 = __ldxr(v36);
      while (__stxr(v37 + 1, v36));
    }
    (*(void (**)(uint64_t, unint64_t *))(*(_QWORD *)v35 + 16))(v35, &v52);
    v38 = v53;
    if (v53)
    {
      v39 = (unint64_t *)&v53->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    if (v25)
    {
      v41 = (unint64_t *)&v25->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v43 = (std::__shared_weak_count *)v55;
    if (v55)
    {
      v44 = (unint64_t *)(v55 + 8);
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }
  v46 = (unint64_t *)&v5->__shared_owners_;
  do
    v47 = __ldaxr(v46);
  while (__stlxr(v47 - 1, v46));
  if (!v47)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    v48 = (std::__shared_weak_count *)*((_QWORD *)__p + 7);
    if (!v48)
      goto LABEL_62;
  }
  else
  {
LABEL_58:
    v48 = (std::__shared_weak_count *)*((_QWORD *)__p + 7);
    if (!v48)
      goto LABEL_62;
  }
  v49 = (unint64_t *)&v48->__shared_owners_;
  do
    v50 = __ldaxr(v49);
  while (__stlxr(v50 - 1, v49));
  if (v50)
  {
LABEL_62:
    if ((__p[47] & 0x80000000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
  ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
  std::__shared_weak_count::__release_weak(v48);
  if (__p[47] < 0)
LABEL_63:
    operator delete(*((void **)__p + 3));
LABEL_64:
  v51 = (std::__shared_weak_count *)*((_QWORD *)__p + 2);
  if (v51)
    std::__shared_weak_count::__release_weak(v51);
  operator delete(__p);
}

void sub_23635C17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  std::__shared_weak_count *v13;
  void *v14;
  void **v15;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;

  operator delete(v14);
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v19 = *(std::__shared_weak_count **)(v12 + 56);
  if (v19)
  {
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
  if (*(char *)(v12 + 47) < 0)
  {
    operator delete(*v15);
    v22 = *(std::__shared_weak_count **)(v12 + 16);
    if (v22)
      goto LABEL_12;
  }
  else
  {
    v22 = *(std::__shared_weak_count **)(v12 + 16);
    if (v22)
    {
LABEL_12:
      std::__shared_weak_count::__release_weak(v22);
      operator delete((void *)v12);
      _Unwind_Resume(a1);
    }
  }
  operator delete((void *)v12);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::ClientHandle<abb::link::ClientHandleBase>::~ClientHandle(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_2507AE7E8;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::~ClientHandle(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_2507AE7E8;
  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerMessage(uint64_t a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t object[3];

  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    object[2] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(void **)(a1 + 8);
      object[1] = v7;
      if (v7)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        (*(void (**)(void *, xpc_object_t *))(*(_QWORD *)v7 + 16))(v7, object);
        xpc_release(object[0]);
        object[0] = 0;
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_23635C460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
  xpc_release(object);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerMessage(uint64_t a1, xpc_object_t *a2, dispatch_object_t *a3, _QWORD *a4)
{
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  dispatch_object_t object;
  xpc_object_t v18[3];
  _BYTE v19[24];
  _BYTE *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    v9 = std::__shared_weak_count::lock(v5);
    v18[2] = v9;
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(a1 + 8);
      v18[1] = v11;
      if (!v11)
      {
LABEL_17:
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        return;
      }
      v18[0] = *a2;
      *a2 = xpc_null_create();
      object = *a3;
      *a3 = 0;
      v12 = (_QWORD *)a4[3];
      if (v12)
      {
        if (v12 == a4)
        {
          v20 = v19;
          (*(void (**)(_QWORD *, _BYTE *))(*a4 + 24))(a4, v19);
        }
        else
        {
          v20 = (_BYTE *)a4[3];
          a4[3] = 0;
        }
      }
      else
      {
        v20 = 0;
      }
      (*(void (**)(void *, xpc_object_t *, dispatch_object_t *, _BYTE *))(*(_QWORD *)v11 + 24))(v11, v18, &object, v19);
      v13 = v20;
      if (v20 == v19)
      {
        v14 = 4;
        v13 = v19;
      }
      else
      {
        if (!v20)
        {
LABEL_14:
          if (object)
            dispatch_release(object);
          xpc_release(v18[0]);
          v18[0] = 0;
          goto LABEL_17;
        }
        v14 = 5;
      }
      (*(void (**)(void))(*v13 + 8 * v14))();
      goto LABEL_14;
    }
  }
}

void sub_23635C610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, xpc_object_t a11, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerError(uint64_t a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t object[3];

  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    object[2] = v5;
    if (v5)
    {
      v6 = v5;
      v7 = *(void **)(a1 + 8);
      object[1] = v7;
      if (v7)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        (*(void (**)(void *, xpc_object_t *))(*(_QWORD *)v7 + 32))(v7, object);
        xpc_release(object[0]);
        object[0] = 0;
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_23635C758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
  xpc_release(object);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

_QWORD *abb::link::ServerHandle<abb::link::LocalServerLink>::~ServerHandle(_QWORD *a1)
{
  std::__shared_weak_count *v2;

  *a1 = &off_2507AE838;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::~ServerHandle(_QWORD *__p)
{
  std::__shared_weak_count *v2;

  *__p = &off_2507AE838;
  v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  operator delete(__p);
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientMessage(uint64_t a1, xpc_object_t *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  xpc_object_t object;

  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD **)(a1 + 8);
      if (v7)
      {
        object = *a2;
        *a2 = xpc_null_create();
        abb::link::LocalServerLink::handleClientMessage(v7, &object);
        xpc_release(object);
        object = 0;
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientMessage(uint64_t a1, xpc_object_t *a2, _QWORD *a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  xpc_object_t object[3];
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    v7 = std::__shared_weak_count::lock(v4);
    object[2] = v7;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD **)(a1 + 8);
      object[1] = v9;
      if (!v9)
        goto LABEL_15;
      object[0] = *a2;
      *a2 = xpc_null_create();
      v10 = (_QWORD *)a3[3];
      if (v10)
      {
        if (v10 == a3)
        {
          v19 = v18;
          (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v18);
        }
        else
        {
          v19 = (_QWORD *)a3[3];
          a3[3] = 0;
        }
      }
      else
      {
        v19 = 0;
      }
      abb::link::LocalServerLink::handleClientMessage(v9, object, v18);
      v13 = v19;
      if (v19 == v18)
      {
        v14 = 4;
        v13 = v18;
      }
      else
      {
        if (!v19)
        {
LABEL_14:
          xpc_release(object[0]);
          object[0] = 0;
LABEL_15:
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v16 = __ldaxr(p_shared_owners);
          while (__stlxr(v16 - 1, p_shared_owners));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
          return;
        }
        v14 = 5;
      }
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v13 + 8 * v14))(v13, v11, v12);
      goto LABEL_14;
    }
  }
}

void sub_23635CA04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientError(uint64_t a1, void **a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;

  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD **)(a1 + 8);
      if (v7)
      {
        v8 = *a2;
        *a2 = xpc_null_create();
        v9 = v7[5];
        v10 = v7[6];
        if (v10)
        {
          v11 = (unint64_t *)(v10 + 16);
          do
            v12 = __ldxr(v11);
          while (__stxr(v12 + 1, v11));
        }
        v13 = v7[9];
        v14 = operator new(0x18uLL);
        *v14 = v7;
        v14[1] = v9;
        v14[2] = v10;
        dispatch_async_f(v13, v14, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
        xpc_release(v8);
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::XpcClientHelper::setServer()
{
  return MEMORY[0x24BED9940]();
}

void ctu::XpcClientHelper::~XpcClientHelper(ctu::XpcClientHelper *this)
{
  MEMORY[0x24BED9948](this);
}

uint64_t ctu::XpcServerHelper::setListener()
{
  return MEMORY[0x24BED9950]();
}

uint64_t ctu::XpcServerHelper::XpcServerHelper()
{
  return MEMORY[0x24BED9958]();
}

void ctu::XpcServerHelper::~XpcServerHelper(ctu::XpcServerHelper *this)
{
  MEMORY[0x24BED9960](this);
}

uint64_t ctu::XpcClientHelper::flush(ctu::XpcClientHelper *this, const group *a2)
{
  return MEMORY[0x24BED9E48](this, a2);
}

uint64_t ctu::XpcServerHelper::getListener(ctu::XpcServerHelper *this)
{
  return MEMORY[0x24BED9E50](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
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
  off_2507ADB70(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2507ADB78(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

