uint64_t sub_1A19F5304(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAndRunBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1A19F539C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAndRunBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1A19F53A8(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 56);
}

uint64_t sub_1A19F53B4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(result + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 64) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void sub_1A19F53EC(uint64_t *a1, unsigned __int8 ***a2, int a3, void (**a4)(_QWORD, _QWORD))
{
  unsigned __int8 **v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *p_shared_owners;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unsigned __int8 **v22;
  std::__shared_weak_count *v23;
  unsigned __int8 **v24[2];

  v7 = a2[1];
  v24[0] = *a2;
  v24[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 1);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  sub_1A19F879C((uint64_t)a1, v24, a3, a4);
  if (v7)
  {
    v10 = (unint64_t *)(v7 + 1);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*((void (**)(unsigned __int8 **))*v7 + 2))(v7);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
    }
  }
  v12 = *a1;
  if (!*a1)
  {
    v20 = 0;
    v21 = 0;
    ((void (**)(_QWORD, uint64_t *))a4)[2](a4, &v20);
    v16 = v21;
    if (!v21)
      return;
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    goto LABEL_20;
  }
  v13 = (std::__shared_weak_count *)a2[1];
  v22 = *a2;
  v23 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  CLConnection::sendMessage(v12, (const char **)&v22, a4);
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
LABEL_20:
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

void sub_1A19F5524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A19F5ACC()
{
  uint64_t v0;
  void *v1;

  +[CLSilo main](CLSilo, "main");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24D20;
  qword_1ECE24D20 = v0;

}

BOOL sub_1A19F5AF8(id *a1, _QWORD *a2, void *a3)
{
  id v5;
  Class Class;
  id v7;
  id v8;
  _BOOL8 v9;

  v5 = a3;
  *a1 = 0;
  *a2 = 0;
  Class = (Class)*a1;
  if (!*a1)
  {
    v7 = objc_retainAutorelease(v5);
    Class = objc_getClass((const char *)objc_msgSend(v7, "UTF8String"));
    *a1 = Class;
    if (!Class)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("Adapter"));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a1 = objc_getClass((const char *)objc_msgSend(v8, "UTF8String"));

      Class = (Class)*a1;
      if (!*a1)
        goto LABEL_8;
    }
  }
  if (-[objc_class isSupported](Class, "isSupported"))
  {
    objc_msgSend(*a1, "getSilo");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*a1)
    v9 = *a2 != 0;
  else
LABEL_8:
    v9 = 0;

  return v9;
}

void sub_1A19F5BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A19F5FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A19F63E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A19F6400(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = qword_1ECE24D08;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A19FA6B8;
  v6[3] = &unk_1E45FBC70;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  dispatch_barrier_async(v4, v6);

}

void sub_1A19F6514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A19F6524(_QWORD *a1)
{
  uint64_t *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v2 = (uint64_t *)a1[7];
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (void *)a1[4];
  v7 = a1[6];
  if (v7 && *(_QWORD *)(v7 + 8) != -1)
    sub_1A1A0DCE0(v2, v6);
  if (v3)
  {
    v8 = (unint64_t *)&v3->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F6600(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A19F6614(uint64_t a1)
{
  sub_1A1A0DCE0(*(uint64_t **)(a1 + 40), *(void **)(a1 + 32));
}

void sub_1A19F6620(uint64_t a1)
{
  xpc_connection_t *v1;

  v1 = *(xpc_connection_t **)(a1 + 32);
  xpc_connection_cancel(*v1);
  xpc_release(*v1);
  *v1 = 0;
}

uint64_t sub_1A19F6650()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  qword_1ECE24E58 = result;
  return result;
}

void sub_1A19F670C(uint64_t a1)
{
  std::__shared_weak_count *v2;

  sub_1A1A057B8(a1 + 64);
  v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

uint64_t sub_1A19F68D4(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    dispatch_release(*(dispatch_object_t *)v1);
    v2 = *(std::__shared_weak_count **)(v1 + 32);
    if (v2)
      std::__shared_weak_count::__release_weak(v2);
    sub_1A1A057B8(v1 + 8);
    JUMPOUT(0x1A1B0FFE8);
  }
  return result;
}

void sub_1A19F6934(uint64_t a1)
{
  std::__shared_weak_count *v2;

  sub_1A1A057B8(a1 + 48);
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void sub_1A19F696C(uint64_t a1)
{
  std::__shared_weak_count *v2;

  sub_1A1A057B8(a1 + 56);
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void sub_1A19F6A60(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = a1[6];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[5];
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A1A0D450(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F6B34(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A19F6B48(uint64_t a1)
{
  sub_1A1A0D450(*(_QWORD *)(a1 + 32));
}

void sub_1A19F6B50()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  dispatch_source_t v4;
  void *v5;
  uint64_t v6;

  v0 = dispatch_queue_create("CLServiceVendorQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)qword_1ECE24D08;
  qword_1ECE24D08 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECE24D10;
  qword_1ECE24D10 = v2;

  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)qword_1ECE24D08);
  v5 = (void *)qword_1ECE24D18;
  qword_1ECE24D18 = (uint64_t)v4;

  dispatch_source_set_timer((dispatch_source_t)qword_1ECE24D18, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1ECE24D18, &unk_1E45FBD40);
  if (*(double *)&qword_1ECE24CC0 > 0.0)
    dispatch_resume((dispatch_object_t)qword_1ECE24D18);
  v6 = objc_opt_class();
  sub_1A19F6400(v6, CFSTR("_CLMainService"));
}

uint64_t sub_1A19F6C24(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 32;
  sub_1A1A057B8(a1 + 48);
  return sub_1A1A057B8(v1);
}

uint64_t CLConnection::getAuditToken(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  return xpc_connection_get_audit_token();
}

void sub_1A19F6C7C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  const void *v3;
  const void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
  sub_1A19F6CDC(v1);
  v2 = *(void **)(v1 + 16);
  if (v2)
  {

    *(_QWORD *)(v1 + 16) = 0;
  }
  v3 = *(const void **)(v1 + 24);
  if (v3)
  {
    _Block_release(v3);
    *(_QWORD *)(v1 + 24) = 0;
  }
  v4 = *(const void **)(v1 + 32);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(v1 + 32) = 0;
  }
  *(_BYTE *)(v1 + 96) = 0;
}

void sub_1A19F6CDC(uint64_t a1)
{
  NSObject *v2;
  CLConnection *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(_QWORD *)a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_DEBUG, "Invalidating connection", v4, 2u);
    }
    v3 = *(CLConnection **)a1;
    *(_QWORD *)a1 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 100));
    CLConnection::deferredDelete(v3);
  }
}

uint64_t sub_1A19F6DA4(uint64_t a1)
{
  return sub_1A1A0DC30(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void sub_1A19F6DB4(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = a1[8];
  v3 = (std::__shared_weak_count *)a1[9];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = a1[7];
  if (v8 && *(_QWORD *)(v8 + 8) != -1)
    sub_1A1A0DC30(v2, v6, v7);
  if (v3)
  {
    v9 = (unint64_t *)&v3->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F6E90(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A19F6EA4(const void *a1)
{
  void *v2;
  void (**v3)(void);

  v2 = (void *)MEMORY[0x1A1B10324]();
  v3 = (void (**)(void))_Block_copy(a1);
  v3[2]();

  objc_autoreleasePoolPop(v2);
}

void sub_1A19F707C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A19F70A8(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v2 = a1[7];
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = (void *)a1[4];
  v7 = a1[6];
  if (v7 && *(_QWORD *)(v7 + 8) != -1)
    sub_1A1A0DEAC(v2, v6);
  if (v3)
  {
    v8 = (unint64_t *)&v3->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F7184(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void *sub_1A19F7198(uint64_t a1)
{
  return sub_1A1A0DEAC(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

uint64_t CLConnection::getUniqueRemotePid(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  dispatch_assert_queue_V2(this[1]);
  if (!MEMORY[0x1E0D01678])
    return xpc_connection_get_pid((xpc_connection_t)*this);
  xpc_connection_get_audit_token();
  return BSVersionedPIDForAuditToken();
}

void CLConnectionClient::~CLConnectionClient(const void **this)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v3;
  const void *v4;
  const void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  std::__shared_weak_count *v20;
  _QWORD block[5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, this[6]);
  v3 = MEMORY[0x1E0C809B0];
  v4 = this[6];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A19F68D4;
  block[3] = &unk_1E45FB9A0;
  block[4] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5 = this[4];
  v6 = (std::__shared_weak_count *)this[5];
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *this;
  v19[0] = v3;
  v19[1] = 3321888768;
  v19[2] = sub_1A19F6C7C;
  v19[3] = &unk_1E45FB1D8;
  v19[4] = v5;
  v20 = v6;
  if (v6)
  {
    v10 = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  dispatch_async(v9, v19);
  v12 = *this;
  *this = 0;
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = sub_1A1A029C8;
  v18[3] = &unk_1E45FB9C8;
  v18[4] = v12;
  dispatch_async(v12, v18);
  v13 = v20;
  if (v20)
  {
    v14 = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v6)
  {
    v16 = (unint64_t *)&v6->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  sub_1A1A057B8((uint64_t)(this + 4));
  sub_1A19F761C(this + 1);
}

_QWORD *sub_1A19F761C(_QWORD *a1)
{
  *a1 = &unk_1E45FB0A8;
  sub_1A19F7660((uint64_t)a1);
  sub_1A1A057B8((uint64_t)(a1 + 1));
  return a1;
}

void sub_1A19F7660(uint64_t a1)
{
  _QWORD *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v6;

  v2 = operator new(0x20uLL);
  v2[2] = 0;
  *v2 = &unk_1E45FB1B0;
  v2[1] = 0;
  *((_QWORD *)&v6 + 1) = v2;
  *((_DWORD *)v2 + 6) = 31337;
  *(_QWORD *)&v6 = v2 + 3;
  sub_1A1A05810(a1 + 8, &v6);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v6 + 1);
  if (*((_QWORD *)&v6 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void CLConnectionClient::setDefaultMessageHandler(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t *p_shared_weak_owners;
  unint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD v25[6];
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(std::__shared_weak_count **)(a1 + 40);
  v35 = v5;
  v36 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  sub_1A1A0569C(a1 + 8, &v33);
  v8 = v33;
  v9 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3321888768;
    v29[2] = sub_1A19FE9E0;
    v29[3] = &unk_1E45FB240;
    v10 = v34;
    v31 = v33;
    v32 = v34;
    if (v34)
    {
      p_shared_weak_owners = &v34->__shared_weak_owners_;
      do
        v12 = __ldxr((unint64_t *)p_shared_weak_owners);
      while (__stxr(v12 + 1, (unint64_t *)p_shared_weak_owners));
      v30 = a2;
      std::__shared_weak_count::__release_weak(v10);
      v13 = v29;
      v8 = v33;
    }
    else
    {
      v30 = a2;
      v13 = v29;
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = *(NSObject **)a1;
  v25[0] = v9;
  v25[1] = 3321888768;
  v25[2] = sub_1A19F6524;
  v25[3] = &unk_1E45FB450;
  v25[5] = v8;
  v26 = v34;
  if (v34)
  {
    v15 = &v34->__shared_weak_owners_;
    do
      v16 = __ldxr((unint64_t *)v15);
    while (__stxr(v16 + 1, (unint64_t *)v15));
  }
  v27 = v5;
  v28 = v4;
  if (v4)
  {
    v17 = (unint64_t *)&v4->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v25[4] = v13;
  dispatch_async(v14, v25);
  v19 = v28;
  if (v28)
  {
    v20 = (unint64_t *)&v28->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  v22 = v36;
  if (v36)
  {
    v23 = (unint64_t *)&v36->__shared_owners_;
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

void sub_1A19F796C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 - 64);
  _Unwind_Resume(a1);
}

CLConnection *CLConnection::connectionFinalizer(CLConnection *this, void *a2)
{
  if (this)
  {
    CLConnection::~CLConnection(this);
    JUMPOUT(0x1A1B0FFE8);
  }
  return this;
}

void CLConnection::~CLConnection(CLConnection *this)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)this)
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v4 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fConnection";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v5 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fConnection";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "deferredDelete() should have nulled out connection", "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v6 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fConnection";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_27:
    abort_report_np();
    __break(1u);
  }
  if (*((_QWORD *)this + 8))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v7 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v8 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "deferredDelete() should have nulled out handler", "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v9 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2082;
      v16 = "assert";
      v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_27;
  }
  v2 = *((_QWORD *)this + 1);
  v3 = MEMORY[0x1E0C809B0];
  *((_QWORD *)this + 1) = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = sub_1A1A0296C;
  block[3] = &unk_1E45FB9C8;
  block[4] = v2;
  dispatch_async(v2, block);

  *((_QWORD *)this + 3) = 0;
  if (*((char *)this + 119) < 0)
    operator delete(*((void **)this + 12));
  sub_1A1A057B8((uint64_t)this + 80);
}

void sub_1A19F7EB0(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_1A1A05668(a1);
}

void sub_1A19F7EBC(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = a1[6];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[5];
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A19F7FAC(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F7F90(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A19F7FA4(uint64_t a1)
{
  sub_1A19F7FAC(*(_QWORD *)(a1 + 32));
}

void sub_1A19F7FAC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  void *__p[2];
  uint64_t v12;
  uint8_t buf[16];

  if (!*(_QWORD *)a1)
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_DEBUG, "Creating connection", buf, 2u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    v3 = operator new();
    if (*(char *)(a1 + 95) < 0)
    {
      sub_1A19FA49C(__p, *(void **)(a1 + 72), *(_QWORD *)(a1 + 80));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)(a1 + 72);
      v12 = *(_QWORD *)(a1 + 88);
    }
    CLConnection::CLConnection(v3, (const char *)__p, *(_QWORD *)(a1 + 8));
    *(_QWORD *)a1 = v3;
    if (SHIBYTE(v12) < 0)
      operator delete(__p[0]);
    v4 = *(void **)(a1 + 16);
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1A1A0EBAC;
      v10[3] = &unk_1E45FBA88;
      v10[4] = a1;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    }
    v6 = *(const void **)(a1 + 24);
    v7 = *(_QWORD *)a1;
    if (v6)
    {
      CLConnection::setDefaultMessageHandler(v7, v6);
      v7 = *(_QWORD *)a1;
    }
    CLConnection::setInterruptionHandler(v7, *(const void **)(a1 + 32));
    v8 = *(_QWORD *)a1;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = sub_1A1A0EBB8;
    v9[3] = &unk_1E45FB9A0;
    v9[4] = a1;
    CLConnection::setDisconnectionHandler(v8, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 100));
    if (*(_BYTE *)(a1 + 40))
      sub_1A19F81B0(a1);
    if (!*(_BYTE *)(a1 + 97))
      CLConnection::start(*(dispatch_queue_t **)a1);
  }
}

void sub_1A19F8174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  MEMORY[0x1A1B0FFE8](v24, 0x10B2C40D4E86D64);
  _Unwind_Resume(a1);
}

void sub_1A19F81B0(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  const char *v22;
  std::__shared_weak_count *v23;
  id v24;
  os_activity_scope_state_s state;
  const char *v26;
  std::__shared_weak_count *v27;
  uint64_t buf;
  _BYTE v29[20];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_1A19F4000, "CL: Sending cached messages to daemon", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v3 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289282;
    *(_WORD *)v29 = 2082;
    *(_QWORD *)&v29[2] = &unk_1A1A18FAF;
    *(_WORD *)&v29[10] = 2082;
    *(_QWORD *)&v29[12] = "activity";
    _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sending cached messages to daemon\", \"event\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  while (v4 != v5)
  {
    sub_1A1A0E95C(&buf, v4);
    sub_1A1A0E95C(&v22, (uint64_t)&buf);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v6 = *(_QWORD *)a1;
    if (!*(_QWORD *)a1)
      goto LABEL_25;
    v7 = v24;
    if (v24)
    {
      v26 = v22;
      v27 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
        v7 = v24;
      }
      CLConnection::sendMessage(v6, &v26, v7);
      v10 = v27;
      if (v27)
      {
        v11 = (unint64_t *)&v27->__shared_owners_;
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        goto LABEL_23;
      }
    }
    else
    {
      v10 = v23;
      v26 = v22;
      v27 = v23;
      if (v23)
      {
        v13 = (unint64_t *)&v23->__shared_owners_;
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 1, v13));
      }
      CLConnection::sendMessage(v6, (uint64_t)&v26);
      if (v10)
      {
        v15 = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldaxr(v15);
        while (__stlxr(v12 - 1, v15));
LABEL_23:
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
    }
LABEL_25:

    v16 = v23;
    if (v23)
    {
      v17 = (unint64_t *)&v23->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    v19 = *(std::__shared_weak_count **)v29;
    if (*(_QWORD *)v29)
    {
      v20 = (unint64_t *)(*(_QWORD *)v29 + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v4 += 24;
  }
  os_activity_scope_leave(&state);
}

void sub_1A19F8450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state, char a14, uint64_t a15, char a16)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void CLConnectionClient::start(CLConnectionClient *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v3 = *((_QWORD *)this + 4);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  v23 = v3;
  v24 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  sub_1A1A0569C((uint64_t)this + 8, &v21);
  v6 = *(NSObject **)this;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = sub_1A19F6A60;
  v17[3] = &unk_1E45FB350;
  v17[4] = v21;
  v18 = v22;
  if (v22)
  {
    p_shared_weak_owners = &v22->__shared_weak_owners_;
    do
      v8 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v8 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v19 = v3;
  v20 = v2;
  if (v2)
  {
    v9 = (unint64_t *)&v2->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  dispatch_async(v6, v17);
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  if (v22)
    std::__shared_weak_count::__release_weak(v22);
  v14 = v24;
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
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

void sub_1A19F8604(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 - 48);
  _Unwind_Resume(a1);
}

void sub_1A19F8618(uint64_t a1)
{
  uint64_t *v1;
  unsigned __int8 **v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unsigned __int8 **v17;
  _QWORD v18[2];
  unsigned __int8 **v19;
  std::__shared_weak_count *v20;

  v1 = *(uint64_t **)(a1 + 32);
  v2 = *(unsigned __int8 ***)(a1 + 48);
  v3 = *(std::__shared_weak_count **)(a1 + 56);
  v17 = v2;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    v6 = *(unsigned __int8 *)(a1 + 64);
    v19 = v2;
    v20 = v3;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 64);
    v19 = *(unsigned __int8 ***)(a1 + 48);
    v20 = 0;
  }
  sub_1A19F879C((uint64_t)v1, &v19, v6 != 0, 0);
  if (v3)
  {
    v8 = (unint64_t *)&v3->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v10 = *v1;
  if (*v1)
  {
    v18[0] = v17;
    v18[1] = v3;
    if (v3)
    {
      v11 = (unint64_t *)&v3->__shared_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    CLConnection::sendMessage(v10, (uint64_t)v18);
    if (v3)
    {
      v13 = (unint64_t *)&v3->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  if (v3)
  {
    v15 = (unint64_t *)&v3->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19F8774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_1A1A057B8((uint64_t)&a11);
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A19F879C(uint64_t a1, unsigned __int8 ***a2, int a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 **v10;
  int v11;
  unsigned __int8 *v12;
  const void **v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unsigned __int8 **v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned __int8 **v25;
  NSObject *v26;
  unsigned __int8 **v27;
  NSObject *v28;
  unsigned __int8 **v29;
  uint64_t v30;
  unsigned __int8 **v31;
  void *v32;
  void *v33;
  unsigned __int8 **v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  unsigned __int8 **v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _BYTE buf[28];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(_QWORD *)a1)
  {
    v9 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    if (v9 == v8)
    {
LABEL_20:
      if (a3)
        goto LABEL_34;
      return;
    }
    v10 = *a2;
    v11 = *((char *)*a2 + 23);
    if (v11 >= 0)
      v12 = (unsigned __int8 *)*((unsigned __int8 *)*a2 + 23);
    else
      v12 = (*a2)[1];
    while (1)
    {
      v13 = *(const void ***)v9;
      v14 = *(unsigned __int8 *)(*(_QWORD *)v9 + 23);
      if ((v14 & 0x80u) == 0)
        v15 = (unsigned __int8 *)*(unsigned __int8 *)(*(_QWORD *)v9 + 23);
      else
        v15 = *(unsigned __int8 **)(*(_QWORD *)v9 + 8);
      if (v15 == v12)
      {
        if (v11 >= 0)
          v16 = (unsigned __int8 *)v10;
        else
          v16 = *v10;
        if ((v14 & 0x80) != 0)
        {
          if (!memcmp(*v13, v16, *(_QWORD *)(*(_QWORD *)v9 + 8)))
          {
LABEL_28:
            if (v9 + 24 != v8)
            {
              do
              {
                v22 = v9 + 24;
                sub_1A1A05810(v9, (__int128 *)(v9 + 24));
                v23 = *(void **)(v9 + 16);
                *(_QWORD *)(v9 + 16) = *(_QWORD *)(v9 + 40);
                *(_QWORD *)(v9 + 40) = 0;

                v24 = v9 + 48;
                v9 += 24;
              }
              while (v24 != v8);
              v8 = *(_QWORD *)(a1 + 56);
              v9 = v22;
            }
            while (v8 != v9)
            {
              v8 -= 24;
              sub_1A1A0EB6C(v8);
            }
            *(_QWORD *)(a1 + 56) = v9;
            if ((a3 & 1) != 0)
            {
LABEL_34:
              v25 = *a2;
              if ((*a2)[6])
              {
                if (qword_1ECE24CD0 != -1)
                  dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
                v26 = qword_1ECE24CC8;
                if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
                {
                  v27 = *a2;
                  if (*((char *)*a2 + 23) < 0)
                    v27 = (unsigned __int8 **)**a2;
                  *(_DWORD *)buf = 68289282;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)&buf[8] = 2082;
                  *(_QWORD *)&buf[10] = &unk_1A1A18FAF;
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = v27;
                  _os_log_impl(&dword_1A19F4000, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Trying to cache a reply message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
                  if (qword_1ECE24CD0 != -1)
                    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
                }
                v28 = qword_1ECE24CC8;
                if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
                {
                  v29 = *a2;
                  if (*((char *)*a2 + 23) < 0)
                    v29 = (unsigned __int8 **)**a2;
                  *(_DWORD *)buf = 68289282;
                  *(_DWORD *)&buf[4] = 0;
                  *(_WORD *)&buf[8] = 2082;
                  *(_QWORD *)&buf[10] = &unk_1A1A18FAF;
                  *(_WORD *)&buf[18] = 2082;
                  *(_QWORD *)&buf[20] = v29;
                  _os_signpost_emit_with_name_impl(&dword_1A19F4000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Trying to cache a reply message", "{\"msg%{public}.0s\":\"Trying to cache a reply message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
                }
              }
              else if (a4)
              {
                v32 = (void *)objc_msgSend(a4, "copy");
                v33 = v32;
                v34 = a2[1];
                *(_QWORD *)buf = *a2;
                *(_QWORD *)&buf[8] = v34;
                if (v34)
                {
                  v35 = (unint64_t *)(v34 + 1);
                  do
                    v36 = __ldxr(v35);
                  while (__stxr(v36 + 1, v35));
                }
                *(_QWORD *)&buf[16] = v32;
                sub_1A1A0E9C0((_QWORD *)(a1 + 48), (uint64_t)buf);

                v37 = *(std::__shared_weak_count **)&buf[8];
                if (*(_QWORD *)&buf[8])
                {
                  v38 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
                  do
                    v39 = __ldaxr(v38);
                  while (__stlxr(v39 - 1, v38));
                  if (!v39)
                  {
                    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
                    std::__shared_weak_count::__release_weak(v37);
                  }
                }

              }
              else
              {
                v40 = a2[1];
                if (v40)
                {
                  v41 = (unint64_t *)(v40 + 1);
                  do
                    v42 = __ldxr(v41);
                  while (__stxr(v42 + 1, v41));
                }
                *(_QWORD *)buf = v25;
                *(_QWORD *)&buf[8] = v40;
                *(_QWORD *)&buf[16] = 0;
                sub_1A1A0E9C0((_QWORD *)(a1 + 48), (uint64_t)buf);

                v43 = *(std::__shared_weak_count **)&buf[8];
                if (*(_QWORD *)&buf[8])
                {
                  v44 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
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
              return;
            }
            if (qword_1ECE24CD0 != -1)
              dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
            v30 = qword_1ECE24CC8;
            if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
            {
              v31 = *a2;
              if (*((char *)*a2 + 23) < 0)
                v31 = (unsigned __int8 **)**a2;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v31;
              v19 = "#Warning Sending an un-cached message '%{public}s' without first clearing the previously cached value";
              v20 = v30;
              v21 = 12;
LABEL_52:
              _os_log_impl(&dword_1A19F4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
              return;
            }
            return;
          }
        }
        else
        {
          if (!*(_BYTE *)(*(_QWORD *)v9 + 23))
            goto LABEL_28;
          while (*(unsigned __int8 *)v13 == *v16)
          {
            v13 = (const void **)((char *)v13 + 1);
            ++v16;
            if (!--v14)
              goto LABEL_28;
          }
        }
      }
      v9 += 24;
      if (v9 == v8)
        goto LABEL_20;
    }
  }
  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v17 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *a2;
    if (*((char *)*a2 + 23) < 0)
      v18 = (unsigned __int8 **)**a2;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = &unk_1A1A18FAF;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = v18;
    v19 = "{\"msg%{public}.0s\":\"No connection fConnection\", \"messageName\":%{public, location:escape_only}s}";
    v20 = v17;
    v21 = 28;
    goto LABEL_52;
  }
}

void sub_1A19F8D08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  sub_1A1A05668(exception_object);
}

uint64_t sub_1A19F8D84(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;
    sub_1A1A0EB6C(i - 24);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void CLConnectionClient::setHandlerForMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v5;
  void *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t *p_shared_weak_owners;
  unint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD block[7];
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(std::__shared_weak_count **)(a1 + 40);
  v39 = v8;
  v40 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  sub_1A1A0569C(a1 + 8, &v37);
  v11 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    v12 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend(v6, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v42 = v13;
      _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_DEBUG, "Setting handler for message %s", buf, 0xCu);
    }
    v33[0] = v11;
    v33[1] = 3321888768;
    v33[2] = sub_1A1A0064C;
    v33[3] = &unk_1E45FB240;
    v14 = v38;
    v35 = v37;
    v36 = v38;
    if (v38)
    {
      p_shared_weak_owners = &v38->__shared_weak_owners_;
      do
        v16 = __ldxr((unint64_t *)p_shared_weak_owners);
      while (__stxr(v16 + 1, (unint64_t *)p_shared_weak_owners));
      v34 = a3;
      std::__shared_weak_count::__release_weak(v14);
    }
    else
    {
      v34 = a3;
    }
    v17 = v33;
  }
  else
  {
    v17 = 0;
  }
  v18 = *(NSObject **)a1;
  block[0] = v11;
  block[1] = 3321888768;
  block[2] = sub_1A19F6DB4;
  block[3] = &unk_1E45FB530;
  block[6] = v37;
  v30 = v38;
  if (v38)
  {
    v19 = &v38->__shared_weak_owners_;
    do
      v20 = __ldxr((unint64_t *)v19);
    while (__stxr(v20 + 1, (unint64_t *)v19));
  }
  v31 = v8;
  v32 = v7;
  if (v7)
  {
    v21 = (unint64_t *)&v7->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  block[4] = v6;
  block[5] = v17;
  dispatch_async(v18, block);
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
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  if (v38)
    std::__shared_weak_count::__release_weak(v38);
  v26 = v40;
  if (v40)
  {
    v27 = (unint64_t *)&v40->__shared_owners_;
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

void sub_1A19F90A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,std::__shared_weak_count *a28)
{
  uint64_t v28;

  if (a28)
    std::__shared_weak_count::__release_weak(a28);
  sub_1A1A057B8(v28 - 128);
  _Unwind_Resume(a1);
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  if (qword_1ECE24E60 != -1)
    dispatch_once(&qword_1ECE24E60, &unk_1E45FBA30);
  return CLConnectionMessage::getObjectOfClasses(this, (NSSet *)objc_msgSend((id)qword_1ECE24E58, "setByAddingObjectsFromSet:", a2));
}

void sub_1A19F912C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v3, "setTarget:", v4);

  objc_msgSend(v3, "retainArguments");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A19FEC7C;
  v7[3] = &unk_1E45FBBD8;
  v5 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "async:", v7);

}

void sub_1A19F91E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void CLConnectionClient::sendMessage(uint64_t a1, uint64_t *a2, char a3)
{
  NSObject *v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  _QWORD block[5];
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  char v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v36[10];
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_1A19F4000, "CL: CLConnectionClient::sendMessage(cache)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v7 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v36 = 2082;
    *(_QWORD *)&v36[2] = &unk_1A1A18FAF;
    v37 = 2082;
    v38 = "activity";
    _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessage(cache)\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(std::__shared_weak_count **)(a1 + 40);
  *(_QWORD *)buf = v9;
  *(_QWORD *)v36 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  sub_1A1A0569C(a1 + 8, &v32);
  v12 = *(NSObject **)a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = sub_1A19F8618;
  block[3] = &unk_1E45FB418;
  block[4] = v9;
  v28 = v8;
  if (v8)
  {
    v13 = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = (std::__shared_weak_count *)a2[1];
  v29 = *a2;
  v30 = v15;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v31 = a3;
  dispatch_async(v12, block);
  v18 = v30;
  if (v30)
  {
    v19 = (unint64_t *)&v30->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v28;
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v33)
    std::__shared_weak_count::__release_weak(v33);
  v24 = *(std::__shared_weak_count **)v36;
  if (*(_QWORD *)v36)
  {
    v25 = (unint64_t *)(*(_QWORD *)v36 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  os_activity_scope_leave(&state);
}

void sub_1A19F94AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  uint64_t v21;

  sub_1A1A057B8(v21 - 96);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A19F962C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t CLConnectionClient::CLConnectionClient(uint64_t a1, char *a2, NSObject *a3)
{
  NSObject *v3;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  const __CFString *v9;
  NSObject **v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  NSObject *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v25;
  std::__shared_weak_count *v26;
  NSObject *v27;
  std::__shared_weak_count *v28;
  void *__p[2];
  uint64_t v30;

  v3 = a3;
  *(_QWORD *)a1 = a3;
  *(_QWORD *)(a1 + 8) = &unk_1E45FB0A8;
  v6 = a1 + 8;
  v7 = operator new(0x20uLL);
  v7[2] = 0;
  *v7 = &unk_1E45FB1B0;
  v7[1] = 0;
  *(_QWORD *)(a1 + 24) = v7;
  *((_DWORD *)v7 + 6) = 31337;
  *(_QWORD *)(a1 + 16) = v7 + 3;
  v8 = (char *)operator new(0x80uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_1E45FB108;
  if (a2[23] < 0)
  {
    sub_1A19FA49C(__p, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v30 = *((_QWORD *)a2 + 2);
  }
  *((_QWORD *)v8 + 9) = 0;
  *((_QWORD *)v8 + 3) = 0;
  *((_QWORD *)v8 + 4) = v3;
  *((_QWORD *)v8 + 6) = 0;
  *((_QWORD *)v8 + 7) = 0;
  *((_QWORD *)v8 + 5) = 0;
  v8[64] = 1;
  *((_QWORD *)v8 + 10) = 0;
  *((_QWORD *)v8 + 11) = 0;
  if (SHIBYTE(v30) < 0)
  {
    sub_1A19FA49C(v8 + 96, __p[0], (unint64_t)__p[1]);
    v3 = *((_QWORD *)v8 + 4);
  }
  else
  {
    *((_OWORD *)v8 + 6) = *(_OWORD *)__p;
    *((_QWORD *)v8 + 14) = v30;
  }
  *((_WORD *)v8 + 60) = 256;
  dispatch_retain(v3);
  *((_QWORD *)v8 + 5) = objc_opt_new();
  v8[120] = 1;
  *((_DWORD *)v8 + 31) = 0;
  if (SHIBYTE(v30) < 0)
    operator delete(__p[0]);
  *(_QWORD *)(a1 + 32) = v8 + 24;
  *(_QWORD *)(a1 + 40) = v8;
  dispatch_retain(*(dispatch_object_t *)a1);
  if (a2[23] < 0)
    a2 = *(char **)a2;
  v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v10 = (NSObject **)operator new();
  v11 = *(NSObject **)a1;
  v13 = *(NSObject **)(a1 + 32);
  v12 = *(std::__shared_weak_count **)(a1 + 40);
  v27 = v13;
  v28 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  sub_1A1A0569C(v6, &v25);
  *v10 = v11;
  v10[1] = v13;
  v10[2] = v12;
  if (v12)
  {
    v16 = (unint64_t *)&v12->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = v26;
  v10[3] = v25;
  v10[4] = v18;
  if (v18)
  {
    p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
    do
      v20 = __ldxr(p_shared_weak_owners);
    while (__stxr(v20 + 1, p_shared_weak_owners));
    v11 = *v10;
  }
  dispatch_retain(v11);
  *(_QWORD *)(a1 + 48) = v10;
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  if (v12)
  {
    v21 = (unint64_t *)&v12->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 48), (CFNotificationCallback)sub_1A1A0D254, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CLConnectionClient::createConnection((CLConnectionClient *)a1);
  CLConnectionClient::setInterruptionHandler((NSObject **)a1, 0);
  return a1;
}

void sub_1A19F9DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  _QWORD *v19;
  std::__shared_weak_count *v20;
  void *v22;

  sub_1A1A0EC00((void ***)&a19);
  if (a18 < 0)
    operator delete(__p);
  std::__shared_weak_count::~__shared_weak_count(v20);
  operator delete(v22);
  sub_1A19F761C(v19);
  _Unwind_Resume(a1);
}

void CLConnectionClient::setInterruptionHandler(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD block[6];
  std::__shared_weak_count *v30;
  NSObject *v31;
  std::__shared_weak_count *v32;
  _QWORD v33[7];
  std::__shared_weak_count *v34;
  NSObject *v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;

  sub_1A1A0569C((uint64_t)(a1 + 1), &v37);
  v4 = a1[4];
  v5 = (std::__shared_weak_count *)a1[5];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = *a1;
  v9 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = sub_1A1A0DD6C;
  v33[3] = &unk_1E45FB530;
  v10 = v37;
  v11 = v38;
  v33[6] = v37;
  v34 = v38;
  if (v38)
  {
    p_shared_weak_owners = &v38->__shared_weak_owners_;
    do
      v13 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v13 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v33[4] = v8;
  v35 = v4;
  v36 = v5;
  if (v5)
  {
    v14 = (unint64_t *)&v5->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    v11 = v38;
  }
  v33[5] = a2;
  v16 = *a1;
  block[0] = v9;
  block[1] = 3321888768;
  block[2] = sub_1A19F70A8;
  block[3] = &unk_1E45FB450;
  block[5] = v10;
  v30 = v11;
  if (v11)
  {
    v17 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v31 = v4;
  v32 = v5;
  if (v5)
  {
    v19 = (unint64_t *)&v5->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  block[4] = v33;
  dispatch_async(v16, block);
  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  v24 = v36;
  if (v36)
  {
    v25 = (unint64_t *)&v36->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  if (v5)
  {
    v27 = (unint64_t *)&v5->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v38)
    std::__shared_weak_count::__release_weak(v38);
}

void CLConnectionClient::createConnection(CLConnectionClient *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v3 = *((_QWORD *)this + 4);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  v23 = v3;
  v24 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  sub_1A1A0569C((uint64_t)this + 8, &v21);
  v6 = *(NSObject **)this;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = sub_1A19F7EBC;
  v17[3] = &unk_1E45FB350;
  v17[4] = v21;
  v18 = v22;
  if (v22)
  {
    p_shared_weak_owners = &v22->__shared_weak_owners_;
    do
      v8 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v8 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v19 = v3;
  v20 = v2;
  if (v2)
  {
    v9 = (unint64_t *)&v2->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  dispatch_async(v6, v17);
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  if (v22)
    std::__shared_weak_count::__release_weak(v22);
  v14 = v24;
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
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

void sub_1A19FA1EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 - 48);
  _Unwind_Resume(a1);
}

uint64_t CLConnection::getRemotePid(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  return xpc_connection_get_pid((xpc_connection_t)*this);
}

uint64_t CLConnectionMessage::getObjectOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  void *v3;
  const void *bytes_ptr;
  size_t length;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*((_QWORD *)this + 7);
  if (!v3)
    return 0;
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  length = xpc_data_get_length(*((xpc_object_t *)this + 7));
  if (bytes_ptr)
    bytes_ptr = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes_ptr, length);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", bytes_ptr, 0);
  v11 = 0;
  v8 = objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", a2, *MEMORY[0x1E0CB2CD0], &v11);

  if (v11)
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v9 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138477827;
      v13 = v11;
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_FAULT, "The received data object is invalid: %{private}@", buf, 0xCu);
    }
  }
  return v8;
}

char *CLConnectionMessage::CLConnectionMessage(char *__dst, __int128 *a2, void *a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    sub_1A19FA49C(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v5;
  }
  *((_QWORD *)__dst + 3) = 0;
  __dst[32] = 0;
  *(_OWORD *)(__dst + 40) = 0u;
  *(_OWORD *)(__dst + 56) = 0u;
  *(_OWORD *)(__dst + 72) = 0u;
  *((_QWORD *)__dst + 7) = CLConnectionMessage::createXPCObject(a3);
  return __dst;
}

void sub_1A19FA3F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 + 72);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

xpc_object_t CLConnectionMessage::createXPCObject(void *a1)
{
  xpc_object_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1A1B10324]();
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, 0);
    v1 = v3;
    if (v3)
      v1 = xpc_data_create((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"));
    objc_autoreleasePoolPop(v2);
  }
  return v1;
}

void *sub_1A19FA49C(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1A1A05FDC();
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

void sub_1A19FA6B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CLSiloHeartbeatRecord *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)qword_1ECE24D10;
  objc_msgSend(*(id *)(a1 + 40), "getSilo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setResidentCount:", objc_msgSend(v4, "residentCount") + 1);
  }
  else
  {
    v5 = [CLSiloHeartbeatRecord alloc];
    v6 = -[CLSiloHeartbeatRecord initTrackingServiceClass:name:](v5, "initTrackingServiceClass:name:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    v7 = (void *)qword_1ECE24D10;
    objc_msgSend(v6, "silo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v9 = (id)qword_1ECE24CA8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "silo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = 68289282;
      v12[1] = 0;
      v13 = 2082;
      v14 = &unk_1A1A18FAF;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking commenced\", \"silo\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);

    }
    v4 = v6;
  }

}

void sub_1A19FA874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A19FAB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A19FAC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A19FB34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  void *v42;
  uint64_t v43;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);

  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A19FB898(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A19FB94C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A19FB9AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A19FBA40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A19FBAD4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "prepareAndRunBlock:", 0);

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldFire");

}

void CLConnection::handleMessage(uint64_t a1, const char **a2)
{
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  int v32;
  const char *v33;
  std::__shared_weak_count *v34;
  const char *v35;
  std::__shared_weak_count *v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *a2;
  if ((*a2)[32] && *((_QWORD *)v4 + 3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v4 + 3));
    v6 = objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v5);
    if (v6)
    {
      v7 = v6;
      v8 = _os_activity_create(&dword_1A19F4000, "CL: Invoking reply-handler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v8, &state);

      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v9 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
      {
        v10 = *a2;
        if ((*a2)[23] < 0)
          v10 = *(const char **)v10;
        v11 = objc_msgSend(v5, "intValue");
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)v39 = 0;
        *(_WORD *)&v39[4] = 2082;
        *(_QWORD *)&v39[6] = &unk_1A1A18FAF;
        v40 = 2082;
        v41 = "activity";
        v42 = 2082;
        v43 = v10;
        v44 = 1026;
        v45 = v11;
        _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Invoking reply-handler\", \"event\":%{public, location:escape_only}s, \"MessageName\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x2Cu);
      }
      v12 = (std::__shared_weak_count *)a2[1];
      v35 = *a2;
      v36 = v12;
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      (*(void (**)(uint64_t, const char **))(v7 + 16))(v7, &v35);
      v15 = v36;
      if (v36)
      {
        v16 = (unint64_t *)&v36->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v5);
      os_activity_scope_leave(&state);
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v28 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
      {
        v29 = *a2;
        if ((*a2)[23] < 0)
          v29 = *(const char **)v29;
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)v39 = 0;
        *(_WORD *)&v39[4] = 2082;
        *(_QWORD *)&v39[6] = &unk_1A1A18FAF;
        v40 = 2082;
        v41 = v29;
        v42 = 1026;
        LODWORD(v43) = objc_msgSend(v5, "intValue");
        _os_log_impl(&dword_1A19F4000, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No ReplyHandler found\", \"Message Name\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x22u);
        if (qword_1ECE24CD0 != -1)
          dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      }
      v30 = qword_1ECE24CC8;
      if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
      {
        v31 = *a2;
        if (v31[23] < 0)
          v31 = *(const char **)v31;
        v32 = objc_msgSend(v5, "intValue");
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)v39 = 0;
        *(_WORD *)&v39[4] = 2082;
        *(_QWORD *)&v39[6] = &unk_1A1A18FAF;
        v40 = 2082;
        v41 = v31;
        v42 = 1026;
        LODWORD(v43) = v32;
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No ReplyHandler found", "{\"msg%{public}.0s\":\"No ReplyHandler found\", \"Message Name\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x22u);
      }
    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 56);
    if (v4[23] < 0)
      v4 = *(const char **)v4;
    v19 = objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4));
    if (!v19)
      v19 = v18;
    if (v19)
    {
      v20 = (std::__shared_weak_count *)a2[1];
      v33 = *a2;
      v34 = v20;
      if (v20)
      {
        v21 = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldxr(v21);
        while (__stxr(v22 + 1, v21));
      }
      (*(void (**)(uint64_t, const char **))(v19 + 16))(v19, &v33);
      v23 = v34;
      if (v34)
      {
        v24 = (unint64_t *)&v34->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v26 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *a2;
        if ((*a2)[23] < 0)
          v27 = *(const char **)v27;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v39 = v27;
        _os_log_impl(&dword_1A19F4000, v26, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled message %s", buf, 0xCu);
      }
    }
  }
}

void sub_1A19FC100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void CLConnectionMessage::~CLConnectionMessage(CLConnectionMessage *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
    xpc_release(v2);
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
    xpc_release(v3);

  sub_1A1A057B8((uint64_t)this + 72);
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void CLProfilingIdentifySiloInvocation(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  if (qword_1ECE24E38 != -1)
    dispatch_once(&qword_1ECE24E38, &unk_1E45FB870);
  if (byte_1ECE24E20)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%@ %@]"), a1, NSStringFromSelector((SEL)objc_msgSend(a2, "selector")));
    v4 = objc_msgSend(v5, "UTF8String");
    off_1EE64C248(v4);

  }
}

void sub_1A19FD440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A19FD6B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A19FD7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1A19FD7E0(void *a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  void (**v3)(id, uint64_t);

  v3 = a1;
  v1 = atomic_load((unsigned __int8 *)&qword_1ECE24DA0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_1ECE24DA0))
  {
    v2 = operator new();
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_DWORD *)(v2 + 32) = 1065353216;
    qword_1ECE24D98 = v2;
    __cxa_guard_release(&qword_1ECE24DA0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECE24D68);
  v3[2](v3, qword_1ECE24D98);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24D68);

}

void sub_1A19FD898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __cxa_guard_abort(&qword_1ECE24DA0);

  _Unwind_Resume(a1);
}

void sub_1A19FD8C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = sub_1A19FDADC(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a1 + 40));
  if (!v3)
  {
    sub_1A1A05938();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "iter != selectorMap.end()";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A05938();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "iter != selectorMap.end()";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "getInfoForSelector called on a missing selector", "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A05938();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v8 = 0;
      v9 = 2082;
      v10 = &unk_1A1A18FAF;
      v11 = 2082;
      v12 = "assert";
      v13 = 2081;
      v14 = "iter != selectorMap.end()";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)v3[3]);
}

_QWORD *sub_1A19FDADC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  if (!a2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ HIDWORD(a3));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a3) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= a2)
      v7 = v5 % a2;
  }
  else
  {
    v7 = v5 & (a2 - 1);
  }
  v8 = *(_QWORD **)(a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == a3)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= a2)
            v10 %= a2;
        }
        else
        {
          v10 &= a2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t CLConnectionMessage::CLConnectionMessage(uint64_t a1, xpc_object_t xdict, _QWORD *a3)
{
  xpc_object_t *v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  int64_t int64;
  xpc_object_t value;
  id v12;
  xpc_connection_t remote_connection;
  xpc_object_t reply;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v21[3];

  *(_OWORD *)(a1 + 40) = 0u;
  v5 = (xpc_object_t *)(a1 + 40);
  *(_BYTE *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = *a3;
  v6 = (_QWORD *)(a1 + 72);
  v7 = a3[1];
  *(_QWORD *)(a1 + 80) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  if (xpc_dictionary_get_string(xdict, "kCLConnectionMessageNameKey"))
    MEMORY[0x1A1B0FF28](a1);
  int64 = xpc_dictionary_get_int64(xdict, "kCLConnectionMessageReplyHandlerIdentifierKey");
  if (int64)
    *(_QWORD *)(a1 + 24) = int64;
  *(_BYTE *)(a1 + 32) = xpc_dictionary_get_BOOL(xdict, "kCLConnectionMessageIsReplyingKey");
  value = xpc_dictionary_get_value(xdict, "kCLConnectionMessageInfoKey");
  *(_QWORD *)(a1 + 56) = value;
  v12 = value;
  *(_QWORD *)(a1 + 64) = xpc_dictionary_get_value(xdict, "kCLConnectionMessageFileDescriptorKey");
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  reply = xpc_dictionary_create_reply(xdict);
  *(_QWORD *)(a1 + 48) = reply;
  if (reply || *(_QWORD *)(a1 + 24) && !*(_BYTE *)(a1 + 32))
    *v5 = xpc_retain(remote_connection);
  if (remote_connection)
  {
    if (!*v6)
    {
      xpc_connection_get_audit_token();
      v16 = operator new(0x58uLL);
      v16[1] = 0;
      v16[2] = 0;
      *v16 = &off_1E45FB140;
      v17 = v21[2];
      *((_OWORD *)v16 + 3) = v21[1];
      *((_OWORD *)v16 + 4) = v17;
      v16[5] = 0;
      v16[4] = 0;
      v16[3] = v16 + 4;
      *((_DWORD *)v16 + 20) = 0;
      *(_QWORD *)&v21[0] = v16 + 3;
      *((_QWORD *)&v21[0] + 1) = v16;
      sub_1A1A05810((uint64_t)v6, v21);
      v18 = (std::__shared_weak_count *)*((_QWORD *)&v21[0] + 1);
      if (*((_QWORD *)&v21[0] + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v21[0] + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
  }
  return a1;
}

void sub_1A19FDDB8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_1A1A057B8(v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

BOOL CLConnection::sendMessage(uint64_t a1, uint64_t a2)
{
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  _BOOL8 v5;
  unint64_t *v6;
  unint64_t v7;
  const char *v9[2];

  v2 = *(char **)(a2 + 8);
  v9[0] = *(const char **)a2;
  v9[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = CLConnection::sendMessage(a1, v9, 0);
  if (v2)
  {
    v6 = (unint64_t *)(v2 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(char *))(*(_QWORD *)v2 + 16))(v2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v2);
    }
  }
  return v5;
}

void sub_1A19FDE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL CLConnection::sendMessage(uint64_t a1, const char **a2, void *a3)
{
  int64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  __int128 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *__p[2];
  uint64_t v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32) + 1;
    *(_QWORD *)(a1 + 32) = v6;
    v7 = (id)objc_msgSend(a3, "copy");
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6));
    v8 = _os_activity_create(&dword_1A19F4000, "CL: ReplyHandler cached", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);

    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v9 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
    {
      v10 = *a2;
      if ((*a2)[23] < 0)
        v10 = *(const char **)v10;
      *(_DWORD *)buf = 68289794;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "activity";
      v34 = 2082;
      v35 = v10;
      v36 = 1026;
      v37 = v6;
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"ReplyHandler cached\", \"event\":%{public, location:escape_only}s, \"MessageName\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x2Cu);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    v6 = 0;
  }
  v11 = *a2;
  if ((*a2)[23] < 0)
  {
    sub_1A19FA49C(__p, *(void **)v11, *((_QWORD *)v11 + 1));
    v11 = *a2;
  }
  else
  {
    v12 = *(_OWORD *)v11;
    v26 = *((_QWORD *)v11 + 2);
    *(_OWORD *)__p = v12;
  }
  v13 = sub_1A19FE8E4((const char *)__p, *((void **)v11 + 7), *((void **)v11 + 8), v6, 0);
  v14 = v13;
  if (SHIBYTE(v26) < 0)
  {
    operator delete(__p[0]);
    if (v14)
      goto LABEL_15;
  }
  else if (v13)
  {
LABEL_15:
    if (*(_BYTE *)(a1 + 73))
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v15 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
      {
        v16 = *a2;
        if ((*a2)[23] < 0)
          v16 = *(const char **)v16;
        *(_DWORD *)buf = 68289282;
        v29 = 0;
        v30 = 2082;
        v31 = &unk_1A1A18FAF;
        v32 = 2082;
        v33 = v16;
        _os_log_impl(&dword_1A19F4000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnection::sendMessage\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      xpc_connection_send_notification();
    }
    else
    {
      v21 = _os_activity_create(&dword_1A19F4000, "CL: CLConnection::sendMessage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v21, &state);

      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v22 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
      {
        v23 = *a2;
        if ((*a2)[23] < 0)
          v23 = *(const char **)v23;
        *(_DWORD *)buf = 68289538;
        v29 = 0;
        v30 = 2082;
        v31 = &unk_1A1A18FAF;
        v32 = 2082;
        v33 = "activity";
        v34 = 2082;
        v35 = v23;
        _os_log_impl(&dword_1A19F4000, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnection::sendMessage\", \"event\":%{public, location:escape_only}s, \"name\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v14);
      os_activity_scope_leave(&state);
    }
    xpc_release(v14);
    return v14 != 0;
  }
  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v17 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
  {
    v18 = *a2;
    if ((*a2)[23] < 0)
      v18 = *(const char **)v18;
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = &unk_1A1A18FAF;
    v32 = 2082;
    v33 = v18;
    _os_log_impl(&dword_1A19F4000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't create XPC message\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  }
  v19 = qword_1ECE24CC8;
  if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
  {
    v20 = *a2;
    if ((*a2)[23] < 0)
      v20 = *(const char **)v20;
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = &unk_1A1A18FAF;
    v32 = 2082;
    v33 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A19F4000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Couldn't create XPC message", "{\"msg%{public}.0s\":\"Couldn't create XPC message\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  return v14 != 0;
}

void sub_1A19FE390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void *CLConnection::setInterruptionHandler(uint64_t a1, const void *a2)
{
  const void *v4;
  void *result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *(const void **)(a1 + 48);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void sub_1A19FE448(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  _QWORD *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  NSObject *v27;
  _QWORD *v28;
  std::__shared_weak_count *v29;
  _QWORD *v30;
  std::__shared_weak_count *v31;
  uint8_t buf[8];
  std::__shared_weak_count *v33;

  v4 = (void *)MEMORY[0x1A1B10324]();
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    goto LABEL_42;
  v5 = MEMORY[0x1A1B1081C](a2);
  if (v5 != MEMORY[0x1E0C81310])
  {
    if (v5 == MEMORY[0x1E0C812F8])
    {
      v10 = a1[8];
      v9 = (std::__shared_weak_count *)a1[9];
      v11 = (std::__shared_weak_count *)operator new(0x70uLL);
      v12 = v11;
      v11->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB0D0;
      v14 = &v11[1].__vftable;
      *(_QWORD *)buf = v10;
      v33 = v9;
      if (v9)
      {
        v15 = (unint64_t *)&v9->__shared_owners_;
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      CLConnectionMessage::CLConnectionMessage((uint64_t)&v11[1], a2, buf);
      if (v9)
      {
        v17 = (unint64_t *)&v9->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v30 = v14;
      v31 = v12;
      v19 = a1[6];
      v28 = v14;
      v29 = v12;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      (*(void (**)(uint64_t, _QWORD **))(v19 + 16))(v19, &v28);
      v21 = v29;
      if (v29)
      {
        v22 = (unint64_t *)&v29->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v24 = v31;
      if (v31)
      {
        v25 = (unint64_t *)&v31->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v6 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_FAULT, "Got unexpected location event", buf, 2u);
      }
    }
    goto LABEL_42;
  }
  if (a2 != (void *)MEMORY[0x1E0C81258])
  {
    if (a2 != (void *)MEMORY[0x1E0C81260])
      goto LABEL_42;
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v7 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Location connection invalid!", buf, 2u);
    }
    v8 = a1[5];
    if (!v8)
      goto LABEL_42;
LABEL_41:
    (*(void (**)(void))(v8 + 16))();
    goto LABEL_42;
  }
  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v27 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A19F4000, v27, OS_LOG_TYPE_DEFAULT, "#Warning Connection interrupted!", buf, 2u);
  }
  v8 = a1[4];
  if (v8)
    goto LABEL_41;
LABEL_42:
  objc_autoreleasePoolPop(v4);
}

void sub_1A19FE770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_1A1A057B8((uint64_t)&a9);
  sub_1A1A057B8((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_1A19FE7A8(char *a1)
{
  if (a1)
  {
    sub_1A19FE7A8(*(_QWORD *)a1);
    sub_1A19FE7A8(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

void sub_1A19FE7F0(uint64_t a1)
{
  sub_1A19FE7A8(*(char **)(a1 + 32));
}

void sub_1A19FE7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  const char *v8[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(char **)(a2 + 8);
  v8[0] = *(const char **)a2;
  v8[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  CLConnection::handleMessage(v2, v8);
  if (v3)
  {
    v6 = (unint64_t *)(v3 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(char *))(*(_QWORD *)v3 + 16))(v3);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v3);
    }
  }
}

void sub_1A19FE884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A19FE898(uint64_t a1)
{
  CLConnectionMessage::~CLConnectionMessage((CLConnectionMessage *)(a1 + 24));
}

void *CLConnection::setDisconnectionHandler(uint64_t a1, const void *a2)
{
  const void *v4;
  void *result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *(const void **)(a1 + 40);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void *sub_1A19FE8E4(const char *a1, void *a2, void *a3, int64_t a4, BOOL a5)
{
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v13[2];
  char *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v9 = xpc_string_create(a1);
  *(_OWORD *)keys = xmmword_1E45FBA50;
  v13[0] = v9;
  v13[1] = a2;
  v10 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  v11 = v10;
  if (a3)
    xpc_dictionary_set_value(v10, "kCLConnectionMessageFileDescriptorKey", a3);
  if (a4)
    xpc_dictionary_set_int64(v11, "kCLConnectionMessageReplyHandlerIdentifierKey", a4);
  xpc_dictionary_set_BOOL(v11, "kCLConnectionMessageIsReplyingKey", a5);
  if (v9)
    xpc_release(v9);
  return v11;
}

void sub_1A19FE9E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[7];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = sub_1A19FEACC;
  v9[3] = &unk_1E45FB278;
  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v2;
  v9[6] = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A19FEACC(v9);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A19FEAB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A19FEACC(_QWORD *a1)
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

void sub_1A19FEB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1A19FEB6C(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1A19FECB4;
  v3[3] = &unk_1E45FB9A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "async:", v3);
}

void sub_1A19FEBC4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 24);
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A19FEB6C;
  v8[3] = &unk_1E45FBC28;
  v5 = v3;
  v9 = v5;
  v10 = v2;
  objc_msgSend(v4, "async:", v8);
  v6 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

  v7 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

}

uint64_t sub_1A19FEC7C(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valid");
  if ((_DWORD)result)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 40), sel_invoke);
  return result;
}

void sub_1A19FECB4(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t CLConnection::CLConnection(uint64_t a1, const char *a2, uint64_t a3)
{
  id v5;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 72) = 1;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  *(_QWORD *)a1 = xpc_connection_create_mach_service(a2, *(dispatch_queue_t *)(a1 + 8), 0);
  CLConnection::initializeConnection_nl((dispatch_queue_t *)a1);
  return a1;
}

void sub_1A19FED54(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*(char *)(v1 + 119) < 0)
    operator delete(*(void **)(v1 + 96));
  sub_1A1A057B8(v2);
  _Unwind_Resume(a1);
}

void CLConnection::initializeConnection_nl(dispatch_queue_t *this)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  __int128 aBlock;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  _BYTE handler[40];
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  dispatch_queue_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  v2 = this[1];
  if (!v2)
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v21 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(_QWORD *)&handler[10] = &unk_1A1A18FAF;
      *(_WORD *)&handler[18] = 2082;
      *(_QWORD *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(_QWORD *)&handler[30] = "fEventQueue";
      _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v22 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_QWORD *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(_QWORD *)&handler[10] = &unk_1A1A18FAF;
      *(_WORD *)&handler[18] = 2082;
      *(_QWORD *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(_QWORD *)&handler[30] = "fEventQueue";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLConnections must always have event queues", "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v23 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_QWORD *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(_QWORD *)&handler[10] = &unk_1A1A18FAF;
      *(_WORD *)&handler[18] = 2082;
      *(_QWORD *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(_QWORD *)&handler[30] = "fEventQueue";
      _os_log_impl(&dword_1A19F4000, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  dispatch_retain(v2);
  xpc_connection_set_context((xpc_connection_t)*this, this);
  xpc_connection_set_finalizer_f((xpc_connection_t)*this, (xpc_finalizer_t)CLConnection::connectionFinalizer);
  v3 = MEMORY[0x1E0C809B0];
  v26[4] = this;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1A19FE7F8;
  v27[3] = &unk_1E45FB9E8;
  v27[4] = this;
  v25[4] = this;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1A1A0ACB4;
  v26[3] = &unk_1E45FB9A0;
  v25[1] = 3221225472;
  v25[2] = sub_1A1A007D8;
  v25[3] = &unk_1E45FB9A0;
  v4 = *this;
  v5 = this[10];
  v6 = (std::__shared_weak_count *)this[11];
  v24 = v6;
  v25[0] = MEMORY[0x1E0C809B0];
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 1;
  *(_QWORD *)handler = v3;
  *(_QWORD *)&handler[8] = 3321888768;
  *(_QWORD *)&handler[16] = sub_1A19FE448;
  *(_QWORD *)&handler[24] = &unk_1E45FB4F8;
  *(_QWORD *)&handler[32] = v26;
  v35 = v25;
  v37 = v32;
  v38 = v5;
  v39 = v6;
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v36 = v27;
  xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
  *(_QWORD *)&aBlock = v3;
  *((_QWORD *)&aBlock + 1) = 3221225472;
  v29 = sub_1A1A00394;
  v30 = &unk_1E45FBA10;
  v31 = v32;
  this[8] = (dispatch_queue_t)_Block_copy(&aBlock);
  v11 = v39;
  if (v39)
  {
    v12 = (unint64_t *)&v39->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  _Block_object_dispose(v32, 8);
  if (v24)
  {
    v14 = (unint64_t *)&v24->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  dispatch_assert_queue_V2(this[1]);
  xpc_connection_get_audit_token();
  v16 = operator new(0x58uLL);
  v16[1] = 0;
  v16[2] = 0;
  *v16 = &off_1E45FB140;
  v17 = *(_OWORD *)&handler[16];
  *((_OWORD *)v16 + 3) = *(_OWORD *)handler;
  *((_OWORD *)v16 + 4) = v17;
  v16[5] = 0;
  v16[4] = 0;
  v16[3] = v16 + 4;
  *((_DWORD *)v16 + 20) = 0;
  *(_QWORD *)&aBlock = v16 + 3;
  *((_QWORD *)&aBlock + 1) = v16;
  sub_1A1A05810((uint64_t)(this + 10), &aBlock);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&aBlock + 1);
  if (*((_QWORD *)&aBlock + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&aBlock + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

void sub_1A19FF264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  sub_1A1A057B8(v35 - 128);
  _Block_object_dispose(&a35, 8);
  sub_1A1A057B8((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t CLConnection::setHandlerForMessage(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  result = objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", a2);
  if (a3)
    return objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", (id)objc_msgSend(a3, "copy"), a2);
  return result;
}

void CLConnectionServer::handleConnection(uint64_t *a1, uint64_t a2)
{
  dispatch_queue_t *v4;
  uint64_t v5;
  uint64_t *p_shared_weak_owners;
  unint64_t v7;
  _QWORD v8[6];
  std::__shared_weak_count *v9;
  dispatch_queue_t *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  _QWORD v13[6];

  v4 = (dispatch_queue_t *)operator new();
  CLConnection::CLConnection((uint64_t)v4, a2, *a1);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A1A0568C;
  v13[3] = &unk_1E45FB7A0;
  v13[4] = a1;
  v13[5] = v4;
  CLConnection::setDisconnectionHandler((uint64_t)v4, v13);
  sub_1A1A0569C((uint64_t)(a1 + 3), &v11);
  v8[0] = v5;
  v8[1] = 3321888768;
  v8[2] = sub_1A1A001FC;
  v8[3] = &unk_1E45FB3B8;
  v8[4] = a1;
  v8[5] = v11;
  v9 = v12;
  if (v12)
  {
    p_shared_weak_owners = &v12->__shared_weak_owners_;
    do
      v7 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v7 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v10 = v4;
  CLConnection::setDefaultMessageHandler((uint64_t)v4, v8);
  CLConnection::start(v4);
  if (v9)
    std::__shared_weak_count::__release_weak(v9);
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
}

void sub_1A19FF420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a15)
    std::__shared_weak_count::__release_weak(a15);
  if (a18)
    std::__shared_weak_count::__release_weak(a18);
  _Unwind_Resume(exception_object);
}

void CLConnection::start(dispatch_queue_t *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  if (!*((_BYTE *)this + 72))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v3 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call start() on an unpaused CLConnection.", "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v4 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  xpc_connection_resume((xpc_connection_t)*this);
  *((_BYTE *)this + 72) = 0;
}

void *CLConnection::setDefaultMessageHandler(uint64_t a1, const void *a2)
{
  const void *v4;
  void *result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = *(const void **)(a1 + 56);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(a1 + 56) = result;
  return result;
}

void CLConnectionServer::handleEvent(uint64_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *string;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1A1B1081C](a2);
  if (v4 == MEMORY[0x1E0C812E0])
  {
    CLConnectionServer::handleConnection(a1, (uint64_t)a2);
    return;
  }
  v5 = v4;
  if (v4 == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    v9 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      v12 = 136446210;
      v13 = string;
      v10 = "Got error: %{public}s";
      v11 = v9;
LABEL_39:
      _os_log_impl(&dword_1A19F4000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    v6 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      if (v5 == MEMORY[0x1E0C81350])
      {
        v7 = "XPC_TYPE_NULL";
      }
      else if (v5 == MEMORY[0x1E0C812D0])
      {
        v7 = "XPC_TYPE_BOOL";
      }
      else if (v5 == MEMORY[0x1E0C81328])
      {
        v7 = "XPC_TYPE_INT64";
      }
      else if (v5 == MEMORY[0x1E0C81398])
      {
        v7 = "XPC_TYPE_UINT64";
      }
      else if (v5 == MEMORY[0x1E0C81300])
      {
        v7 = "XPC_TYPE_DOUBLE";
      }
      else if (v5 == MEMORY[0x1E0C812F0])
      {
        v7 = "XPC_TYPE_DATE";
      }
      else if (v5 == MEMORY[0x1E0C812E8])
      {
        v7 = "XPC_TYPE_DATA";
      }
      else if (v5 == MEMORY[0x1E0C81390])
      {
        v7 = "XPC_TYPE_STRING";
      }
      else if (v5 == MEMORY[0x1E0C813A0])
      {
        v7 = "XPC_TYPE_UUID";
      }
      else if (v5 == MEMORY[0x1E0C81318])
      {
        v7 = "XPC_TYPE_FD";
      }
      else if (v5 == MEMORY[0x1E0C81388])
      {
        v7 = "XPC_TYPE_SHMEM";
      }
      else if (v5 == MEMORY[0x1E0C812C8])
      {
        v7 = "XPC_TYPE_ARRAY";
      }
      else if (v5 == MEMORY[0x1E0C812F8])
      {
        v7 = "XPC_TYPE_DICTIONARY";
      }
      else
      {
        v7 = "Unknown type";
      }
      v12 = 136446210;
      v13 = v7;
      v10 = "Unexpected event type %{public}s";
      v11 = v6;
      goto LABEL_39;
    }
  }
}

uint64_t CLConnection::CLConnection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 72) = 257;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  xpc_retain(*(xpc_object_t *)a1);
  xpc_connection_set_target_queue(*(xpc_connection_t *)a1, *(dispatch_queue_t *)(a1 + 8));
  CLConnection::initializeConnection_nl((dispatch_queue_t *)a1);
  return a1;
}

void sub_1A19FFAC8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*(char *)(v1 + 119) < 0)
    operator delete(*(void **)(v1 + 96));
  sub_1A1A057B8(v2);
  _Unwind_Resume(a1);
}

void CLConnection::deferredDelete(CLConnection *this)
{
  uint64_t v2;
  dispatch_queue_t v3;
  _QWORD barrier[5];

  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 1));
  if (*((_BYTE *)this + 72))
    CLConnection::start((dispatch_queue_t *)this);
  CLConnection::resetAllHandlers(this);
  v2 = *((_QWORD *)this + 8);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    _Block_release(*((const void **)this + 8));
    *((_QWORD *)this + 8) = 0;
  }
  v3 = *(dispatch_queue_t *)this;
  if (*(_QWORD *)this)
  {
    barrier[0] = MEMORY[0x1E0C809B0];
    barrier[1] = 3221225472;
    barrier[2] = sub_1A19F6620;
    barrier[3] = &unk_1E45FB9A0;
    barrier[4] = this;
    xpc_connection_send_barrier((xpc_connection_t)v3, barrier);
  }
}

void CLConnectionServer::handleMessage(uint64_t a1, dispatch_queue_t *this, uint64_t *a3)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  CLConnection *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  CLConnection *v16;

  if (this)
  {
    CLConnection::pause(this);
    CLConnection::resetAllHandlers((CLConnection *)this);
    v6 = *(_QWORD *)(a1 + 16);
    v7 = (std::__shared_weak_count *)a3[1];
    v14 = *a3;
    v15 = v7;
    v16 = (CLConnection *)this;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t, CLConnection **, uint64_t *))(v6 + 16))(v6, &v16, &v14);
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
    v13 = v16;
    v16 = 0;
    if (v13)
      CLConnection::deferredDelete(v13);
  }
}

void sub_1A19FFC58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  sub_1A1A057B8((uint64_t)va);
  sub_1A1A05874((CLConnection **)va1);
  _Unwind_Resume(a1);
}

uint64_t CLConnection::resetAllHandlers(CLConnection *this)
{
  const void *v2;
  const void *v3;
  const void *v4;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 1));
  v2 = (const void *)*((_QWORD *)this + 5);
  if (v2)
  {
    _Block_release(v2);
    *((_QWORD *)this + 5) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 6);
  if (v3)
  {
    _Block_release(v3);
    *((_QWORD *)this + 6) = 0;
  }
  v4 = (const void *)*((_QWORD *)this + 7);
  if (v4)
  {
    _Block_release(v4);
    *((_QWORD *)this + 7) = 0;
  }
  return objc_msgSend(*((id *)this + 2), "removeAllObjects");
}

void CLConnection::pause(dispatch_queue_t *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  if (*((_BYTE *)this + 72))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!fPaused";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v3 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call pause() on a paused CLConnection.", "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v4 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "!fPaused";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  xpc_connection_suspend((xpc_connection_t)*this);
  *((_BYTE *)this + 72) = 1;
}

void CLConnection::handleDisconnection(dispatch_queue_t *this)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  os_activity_scope_state_s v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  v2 = _os_activity_create(&dword_1A19F4000, "CL: CLConnection::handleDisconnection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v5);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v3 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v7 = 0;
    v8 = 2082;
    v9 = &unk_1A1A18FAF;
    v10 = 2082;
    v11 = "activity";
    _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection::handleDisconnection\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::resetReplyHandlers((CLConnection *)this);
  v4 = this[5];
  if (v4)
    ((void (*)(void))v4[2].isa)();
  os_activity_scope_leave(&v5);
}

void sub_1A1A00088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t CLConnection::resetReplyHandlers(CLConnection *this)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)*((_QWORD *)this + 3);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(*((id *)this + 3), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v11 = 0;
        v12 = 0;
        (*(void (**)(uint64_t, uint64_t *))(v6 + 16))(v6, &v11);
        v7 = v12;
        if (v12)
        {
          p_shared_owners = (unint64_t *)&v12->__shared_owners_;
          do
            v9 = __ldaxr(p_shared_owners);
          while (__stlxr(v9 - 1, p_shared_owners));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
  return objc_msgSend(*((id *)this + 3), "removeAllObjects");
}

void sub_1A1A001DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A001FC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[8];

  v2 = a1[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = sub_1A1A002EC;
  v10[3] = &unk_1E45FB3E8;
  v3 = a1[7];
  v10[4] = v2;
  v10[5] = v3;
  v4 = (std::__shared_weak_count *)a2[1];
  v10[6] = *a2;
  v10[7] = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = a1[6];
  if (v7 && *(_QWORD *)(v7 + 8) != -1)
    sub_1A1A002EC(v10);
  if (v4)
  {
    v8 = (unint64_t *)&v4->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_1A1A002D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A002EC(_QWORD *a1)
{
  uint64_t v2;
  dispatch_queue_t *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9[2];

  v2 = a1[4];
  v3 = (dispatch_queue_t *)a1[5];
  v4 = (std::__shared_weak_count *)a1[7];
  v9[0] = a1[6];
  v9[1] = (uint64_t)v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  CLConnectionServer::handleMessage(v2, v3, v9);
  if (v4)
  {
    v7 = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_1A1A00380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A00394(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void sub_1A1A00424(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v2 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v15[0] = 68289282;
      v15[1] = 0;
      v16 = 2082;
      v17 = &unk_1A1A18FAF;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Unavailable service requested\", \"RequestedServiceName\":%{public, location:escape_only}@}", (uint8_t *)v15, 0x1Cu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    if (v8)
    {
      sub_1A1A005C8(v8, *(_DWORD *)(v7 + 40), *(void **)(a1 + 40));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
    }
  }
}

__CFString *sub_1A1A005C8(void *a1, int a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;

  v5 = a3;
  objc_msgSend(a1, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a2)
    {
      if (a2 == 1)
        v6 = CFSTR("_CLUnSupportedService");
      else
        v6 = 0;
    }
    else
    {
      v6 = (__CFString *)v5;
    }
  }
  v7 = v6;

  return v7;
}

void sub_1A1A0063C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A1A0064C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[7];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = sub_1A1A00738;
  v9[3] = &unk_1E45FB278;
  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v2;
  v9[6] = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A1A00738(v9);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A00724(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A00738(_QWORD *a1)
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

void sub_1A1A007C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A007D8(uint64_t a1)
{
  CLConnection::handleDisconnection(*(dispatch_queue_t **)(a1 + 32));
}

void sub_1A1A007E0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[5];
  void **v5;

  if (*(_BYTE *)(a1 + 120))
    __assert_rtn("~CLConnectionClientInternal", "CLConnectionClient.mm", 73, "!fIsValid");
  v2 = *(NSObject **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  *(_QWORD *)(a1 + 32) = 0;
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = sub_1A1A029AC;
  v4[3] = &unk_1E45FB9C8;
  v4[4] = v2;
  dispatch_async(v2, v4);
  if (*(char *)(a1 + 119) < 0)
    operator delete(*(void **)(a1 + 96));
  v5 = (void **)(a1 + 72);
  sub_1A1A0EC00(&v5);
}

_QWORD *sub_1A1A00894(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = sub_1A19FDADC(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), **(_QWORD **)(a1 + 40));
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

double sub_1A1A00AF4(unint64_t a1)
{
  double v2;
  unint64_t numer;
  unint64_t denom;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  mach_timebase_info info;

  v2 = *(double *)&qword_1ECE24CE0;
  if (*(double *)&qword_1ECE24CE0 == 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    numer = info.numer;
    if (info.denom)
    {
      denom = info.denom;
      v5 = info.numer;
      do
      {
        numer = denom;
        denom = v5 % denom;
        v5 = numer;
      }
      while (denom);
    }
    v6 = info.numer / numer;
    v7 = 1000000000;
    v8 = v6;
    do
    {
      v9 = v8;
      v8 = v7;
      v7 = v9 % v7;
    }
    while (v7);
    v2 = (double)(v6 / v8) / (double)(0x3B9ACA00 / v8 * (info.denom / numer));
    *(double *)&qword_1ECE24CE0 = v2;
  }
  return v2 * (double)a1;
}

uint64_t sub_1A1A00BB0(void *a1, void *a2)
{
  Protocol *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const char *Name;
  NSObject *v9;
  objc_method_description *v10;
  int v11;
  objc_method_description *v12;
  uint64_t v13;
  Protocol **v14;
  Protocol **v15;
  uint64_t v16;
  Protocol *v17;
  unsigned int outCount;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        if (protocol_isEqual(v3, *(Protocol **)(*((_QWORD *)&v20 + 1) + 8 * i)))
        {

LABEL_21:
          v13 = 1;
          goto LABEL_24;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v5)
        continue;
      break;
    }
  }

  outCount = 0;
  Name = protocol_getName(v3);
  if (qword_1ECE24D70 != -1)
    dispatch_once(&qword_1ECE24D70, &unk_1E45FB760);
  v9 = qword_1ECE24D78;
  if (os_log_type_enabled((os_log_t)qword_1ECE24D78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v25 = 0;
    v26 = 2082;
    v27 = &unk_1A1A18FAF;
    v28 = 2082;
    v29 = Name;
    _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#registerSelectorInfosAndValidateProtocolRecursively \", \"protocolName\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v10 = protocol_copyMethodDescriptionList(v3, 0, 1, &outCount);
  v11 = sub_1A1A00E70((uint64_t)v10, outCount, (uint64_t)Name);
  free(v10);
  if (!v11)
    goto LABEL_23;
  v12 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  v13 = sub_1A1A00E70((uint64_t)v12, outCount, (uint64_t)Name);
  free(v12);
  if ((_DWORD)v13)
  {
    v14 = protocol_copyProtocolList(v3, &outCount);
    if (outCount)
    {
      v15 = v14;
      v16 = 0;
      while (1)
      {
        v17 = v15[v16];
        if ((sub_1A1A00BB0() & 1) == 0)
          break;

        if (++v16 >= (unint64_t)outCount)
        {
          free(v15);
          goto LABEL_21;
        }
      }
      free(v15);

    }
LABEL_23:
    v13 = 0;
  }
LABEL_24:

  return v13;
}

void sub_1A1A00E30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1A1A00E70(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint8_t *v12;
  int64_t v13;
  uint8_t *v14;
  uint64_t *v15;
  int v16;
  uint64_t *v17;
  int64_t v18;
  int v19;
  int64_t v20;
  uint8_t *v21;
  int64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  int v25;
  void *v26;
  CLIntersiloInterfaceSelectorInfo *v27;
  CLIntersiloInterfaceSelectorInfo *v28;
  char v29;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  _QWORD *v41;
  uint8_t *__p;
  _QWORD *v43;
  id v44;
  _QWORD v45[4];
  CLIntersiloInterfaceSelectorInfo *v46;
  _QWORD *v47;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[8];
  _BYTE v54[10];
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
LABEL_41:
    v29 = 1;
    return v29 & 1;
  }
  v3 = a1;
  v4 = 0;
  v5 = 0;
  v38 = a2;
  while (1)
  {
    v37 = v5;
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(v3 + 16 * v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%s::%@"), a3, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = v3 + 16 * v4;
    v10 = *(char **)(v9 + 8);
    v41 = (_QWORD *)(v9 + 8);
    LOBYTE(v9) = atomic_load((unsigned __int8 *)&qword_1ECE24D80);
    v43 = (_QWORD *)(v3 + 16 * v4);
    v44 = (id)v8;
    if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_1ECE24D80))
    {
      sub_1A1A05F2C(&qword_1ECE24DA8, "basic_string");
      sub_1A1A05F2C(qword_1ECE24DC0, "allocator");
      sub_1A1A05F2C(qword_1ECE24DD8, "__compressed_pair");
      sub_1A1A05F2C(qword_1ECE24DF0, "__list_node_base");
      sub_1A1A05F2C(qword_1ECE24E08, "__split_buffer");
      __cxa_atexit((void (*)(void *))sub_1A1A059A8, &qword_1ECE24DA8, &dword_1A19F4000);
      __cxa_guard_release(&qword_1ECE24D80);
    }
    sub_1A1A05F2C(buf, v10);
    v11 = SBYTE3(v56);
    __p = *(uint8_t **)buf;
    if ((v56 & 0x80000000) == 0)
      v12 = buf;
    else
      v12 = *(uint8_t **)buf;
    if ((v56 & 0x80000000) == 0)
      v13 = BYTE3(v56);
    else
      v13 = *(_QWORD *)v54;
    v14 = &v12[v13];
    v15 = &qword_1ECE24DA8;
    while (1)
    {
      v16 = *((char *)v15 + 23);
      v17 = v16 >= 0 ? v15 : (uint64_t *)*v15;
      v18 = v16 >= 0 ? *((unsigned __int8 *)v15 + 23) : v15[1];
      if (!v18)
        break;
      if (v13 >= v18)
      {
        v19 = *(char *)v17;
        v20 = v13;
        v21 = v12;
        do
        {
          v22 = v20 - v18;
          if (v22 == -1)
            break;
          v23 = (uint8_t *)memchr(v21, v19, v22 + 1);
          if (!v23)
            break;
          v24 = v23;
          if (!memcmp(v23, v17, v18))
          {
            if (v24 == v14 || v24 - v12 == -1)
              break;
            goto LABEL_29;
          }
          v21 = v24 + 1;
          v20 = v14 - (v24 + 1);
        }
        while (v20 >= v18);
      }
      v15 += 3;
      if (v15 == (uint64_t *)&byte_1ECE24E20)
      {
        v25 = 0;
        goto LABEL_30;
      }
    }
LABEL_29:
    v25 = 1;
LABEL_30:
    if (v11 < 0)
      operator delete(__p);
    if (v25)
    {
      sub_1A1A05938();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        v32 = objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
        *(_QWORD *)buf = 68289795;
        *(_WORD *)v54 = 2082;
        *(_QWORD *)&v54[2] = &unk_1A1A18FAF;
        v55 = 2082;
        v56 = v32;
        v57 = 2082;
        v58 = "assert";
        v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_log_impl(&dword_1A19F4000, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v33))
      {
        v34 = objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
        *(_QWORD *)buf = 68289795;
        *(_WORD *)v54 = 2082;
        *(_QWORD *)&v54[2] = &unk_1A1A18FAF;
        v55 = 2082;
        v56 = v34;
        v57 = 2082;
        v58 = "assert";
        v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Method potentially contains a non POD or non Obj-C type in its arguments", "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      sub_1A1A05938();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
        *(_QWORD *)buf = 68289795;
        *(_WORD *)v54 = 2082;
        *(_QWORD *)&v54[2] = &unk_1A1A18FAF;
        v55 = 2082;
        v56 = v36;
        v57 = 2082;
        v58 = "assert";
        v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_log_impl(&dword_1A19F4000, v35, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      abort_report_np();
      __break(1u);
    }
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = sub_1A1A00894;
    v48[3] = &unk_1E45FB7E8;
    v48[4] = &v49;
    v48[5] = v43;
    sub_1A19FD7E0(v48);
    v3 = a1;
    if (*((_BYTE *)v50 + 24))
      goto LABEL_37;
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", *v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_43;
    v27 = -[CLIntersiloInterfaceSelectorInfo initWithSelector:andMethodSignature:]([CLIntersiloInterfaceSelectorInfo alloc], "initWithSelector:andMethodSignature:", *v43, v26);
    if (!v27)
      break;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1A1A059EC;
    v45[3] = &unk_1E45FB810;
    v47 = v43;
    v28 = v27;
    v46 = v28;
    sub_1A19FD7E0(v45);

LABEL_37:
    _Block_object_dispose(&v49, 8);

    v5 = ++v4 >= v38;
    if (v4 == v38)
      goto LABEL_41;
  }

LABEL_43:
  _Block_object_dispose(&v49, 8);

  v29 = v37;
  return v29 & 1;
}

void sub_1A1A01470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  uint64_t *v20;

  while (1)
  {
    if (*((char *)v20 - 1) < 0)
      operator delete((void *)*(v20 - 3));
    v20 -= 3;
    if (v20 == &qword_1ECE24DA8)
    {
      __cxa_guard_abort(&qword_1ECE24D80);

      _Unwind_Resume(a1);
    }
  }
}

void sub_1A1A017F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A1A025D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

BOOL sub_1A1A026A4(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 13) != 0x7FFFFFFFFFFFFFFFLL;
}

_QWORD *sub_1A1A02778(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

_QWORD *sub_1A1A027BC(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[9];
  result[8] = a2[8];
  result[9] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

uint64_t sub_1A1A02800(uint64_t result, uint64_t a2)
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

_QWORD *sub_1A1A02824(_QWORD *result, _QWORD *a2)
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

_QWORD *sub_1A1A02868(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void CLProfilingIdentify(uint64_t a1)
{
  if (qword_1ECE24E38 != -1)
    dispatch_once(&qword_1ECE24E38, &unk_1E45FB870);
  if (byte_1ECE24E20)
    off_1EE64C248(a1);
}

uint64_t sub_1A1A02914(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAndRunBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1A1A02920(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(result + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(result + 72) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void sub_1A1A02944(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

uint64_t sub_1A1A02964(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 64);
}

void sub_1A1A0296C(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t sub_1A1A02988(uint64_t result, uint64_t a2)
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

void sub_1A1A029AC(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t sub_1A1A029B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAndRunBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1A1A029C0(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 32);
}

void sub_1A1A029C8(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

BOOL CLConnection::isEntitled(uint64_t a1, uint64_t *a2)
{
  return CLConnectionEntitlementCache::isEntitled(*(uint64_t ***)(a1 + 80), a2);
}

_QWORD *CLConnection::getUserNameFromAuditToken@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A1A05F2C(a1, "mobile");
}

void sub_1A1A029EC(uint64_t a1)
{

}

void sub_1A1A029F4(uint64_t a1)
{

}

void sub_1A1A029FC(uint64_t a1)
{

}

void sub_1A1A02A04(uint64_t a1)
{

}

uint64_t sub_1A1A02A0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1A1A02A1C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1A1A02A2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1A1A02A3C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t CLConnectionMessage::getDictionary(CLConnectionMessage *this)
{
  if (qword_1ECE24E60 != -1)
    dispatch_once(&qword_1ECE24E60, &unk_1E45FBA30);
  return CLConnectionMessage::getObjectOfClasses(this, (NSSet *)qword_1ECE24E58);
}

void CLConnection::getName(CLConnection *this@<X0>, uint64_t a2@<X8>)
{
  int v4;
  uint64_t v5;
  void **v6;
  NSObject *v7;
  uint8_t v8[40];
  __int128 v9;
  uint64_t v10;

  v4 = *((char *)this + 119);
  if (v4 < 0)
    v5 = *((_QWORD *)this + 13);
  else
    v5 = *((unsigned __int8 *)this + 119);
  v6 = (void **)((char *)this + 96);
  if (!v5)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 1));
    xpc_connection_get_audit_token();
    sub_1A1A02BF8((uint64_t)&v9);
    if (*((char *)this + 119) < 0)
      operator delete(*v6);
    *(_OWORD *)v6 = v9;
    *((_QWORD *)this + 14) = v10;
    v4 = *((char *)this + 119);
    if ((v4 & 0x80000000) == 0)
    {
      if (*((_BYTE *)this + 119))
        goto LABEL_9;
LABEL_12:
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v7 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEFAULT, "#Warning The client name could not be determined.", v8, 2u);
      }
      MEMORY[0x1A1B0FF28]((char *)this + 96, "<Indeterminate>");
      if ((*((_BYTE *)this + 119) & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
    if (!*((_QWORD *)this + 13))
      goto LABEL_12;
  }
LABEL_9:
  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    *(_OWORD *)a2 = *(_OWORD *)v6;
    *(_QWORD *)(a2 + 16) = *((_QWORD *)this + 14);
    return;
  }
LABEL_17:
  sub_1A19FA49C((_BYTE *)a2, *((void **)this + 12), *((_QWORD *)this + 13));
}

void sub_1A1A02BF8(uint64_t a1)
{
  const __CFAllocator *v2;
  const char *p_p;
  const __CFString *v4;
  CFURLRef v5;
  const __CFURL *v6;
  __CFBundle *v7;
  __CFBundle *v8;
  __CFString *Identifier;
  void *v10;
  void *v11[2];
  uint64_t v12;
  void *__p;
  char v14;

  v11[0] = 0;
  v11[1] = 0;
  v12 = 0;
  sub_1A1A02D90();
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v14 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], p_p, 4u);
  if (v4)
  {
    v5 = CFURLCreateWithFileSystemPath(v2, v4, kCFURLPOSIXPathStyle, 0);
    if (v5)
    {
      v6 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v6)
      {
        v7 = CFBundleCreate(v2, v6);
        v8 = v7;
        if (v7)
        {
          Identifier = (__CFString *)CFBundleGetIdentifier(v7);
          if (Identifier)
            MEMORY[0x1A1B0FF28](v11, -[__CFString UTF8String](Identifier, "UTF8String"));
          CFRelease(v8);
        }
        CFRelease(v6);
      }
      CFRelease(v5);
    }
    CFRelease(v4);
  }
  if (v14 < 0)
    operator delete(__p);
  v10 = (void *)HIBYTE(v12);
  if (v12 < 0)
    v10 = v11[1];
  if (v10)
  {
    *(_OWORD *)a1 = *(_OWORD *)v11;
    *(_QWORD *)(a1 + 16) = v12;
  }
  else
  {
    sub_1A1A02D90();
    if (SHIBYTE(v12) < 0)
      operator delete(v11[0]);
  }
}

void sub_1A1A02D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A1A02D90()
{
  _QWORD *v0;
  audit_token_t *v1;
  uint64_t result;
  _BYTE buffer[4096];
  uint64_t v4;

  v0 = (_QWORD *)MEMORY[0x1E0C80A78]();
  v4 = *MEMORY[0x1E0C80C00];
  *v0 = 0;
  v0[1] = 0;
  v0[2] = 0;
  result = proc_pidpath_audittoken(v1, buffer, 0x1000u);
  if ((int)result >= 1)
    return MEMORY[0x1A1B0FF28](v0, buffer);
  return result;
}

void sub_1A1A02E30(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

BOOL CLConnectionEntitlementCache::isEntitled(uint64_t **a1, uint64_t *a2)
{
  os_unfair_lock_s *v4;
  uint64_t *v5;
  char **v6;
  char **v7;
  _BOOL4 v8;
  uint64_t **v9;
  uint64_t *v10;
  const __CFString *v11;
  const __CFAllocator *v12;
  __int128 v13;
  __SecTask *v14;
  __SecTask *v15;
  CFTypeRef v16;
  CFErrorRef v17;
  NSObject *v18;
  _BYTE *v19;
  CFErrorDomain Domain;
  CFIndex Code;
  CFTypeID v22;
  _BOOL8 v23;
  NSObject *v24;
  NSObject *v25;
  _BYTE *v26;
  NSObject *v27;
  int v28;
  uint64_t *v29;
  int v30;
  uint64_t *v31;
  _BYTE *v32;
  char *v33;
  char **v34;
  char *v35;
  _QWORD *v36;
  char *v37;
  _BYTE *v38;
  uint64_t *v39;
  char *v40;
  char *v41;
  BOOL v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  _BYTE *v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  audit_token_t token;
  CFErrorRef error;
  _BYTE __p[12];
  char v59;
  _BYTE buf[12];
  __int16 v61;
  _BYTE v62[18];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)(a1 + 7);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 14);
  v6 = (char **)(a1 + 1);
  v5 = a1[1];
  if (!v5)
    goto LABEL_8;
  v7 = (char **)(a1 + 1);
  do
  {
    v8 = sub_1A1A0B7DC(v5 + 4, a2);
    v9 = (uint64_t **)(v5 + 1);
    if (!v8)
    {
      v9 = (uint64_t **)v5;
      v7 = (char **)v5;
    }
    v5 = *v9;
  }
  while (*v9);
  if (v7 == v6 || sub_1A1A0B7DC(a2, v7 + 4))
  {
LABEL_8:
    if (*((char *)a2 + 23) >= 0)
      v10 = a2;
    else
      v10 = (uint64_t *)*a2;
    v11 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    if (v11)
    {
      error = 0;
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v13 = *(_OWORD *)(a1 + 5);
      *(_OWORD *)token.val = *(_OWORD *)(a1 + 3);
      *(_OWORD *)&token.val[4] = v13;
      v14 = SecTaskCreateWithAuditToken(v12, &token);
      v15 = v14;
      if (v14)
      {
        v16 = SecTaskCopyValueForEntitlement(v14, v11, &error);
        v17 = error;
        if (error)
        {
          if (qword_1ECE24CD0 != -1)
            dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
          v18 = qword_1ECE24CC8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
          {
            v19 = __p;
            sub_1A1A0A858();
            if (v59 < 0)
              v19 = *(_BYTE **)__p;
            Domain = CFErrorGetDomain(error);
            Code = CFErrorGetCode(error);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v19;
            v61 = 2112;
            *(_QWORD *)v62 = Domain;
            *(_WORD *)&v62[8] = 2048;
            *(_QWORD *)&v62[10] = Code;
            _os_log_impl(&dword_1A19F4000, v18, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCopyValueForEntitlement failed for token '%s' with error '%@' (%ld)", buf, 0x20u);
            if (v59 < 0)
              operator delete(*(void **)__p);
          }
          CFRelease(error);
        }
        if (v16)
        {
          v22 = CFGetTypeID(v16);
          v23 = v22 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16) != 0;
          CFRelease(v16);
        }
        else
        {
          v23 = 0;
        }
        if (v17)
        {
          if (qword_1ECE24CD0 != -1)
            dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
          v27 = qword_1ECE24CC8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *((char *)a2 + 23);
            v29 = (uint64_t *)*a2;
            v30 = *((_DWORD *)a1 + 11);
            sub_1A1A02BF8((uint64_t)__p);
            if (v28 >= 0)
              v31 = a2;
            else
              v31 = v29;
            v32 = __p;
            if (v59 < 0)
              v32 = *(_BYTE **)__p;
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v31;
            v61 = 1024;
            *(_DWORD *)v62 = v30;
            *(_WORD *)&v62[4] = 2080;
            *(_QWORD *)&v62[6] = v32;
            _os_log_impl(&dword_1A19F4000, v27, OS_LOG_TYPE_DEFAULT, "#Warning Issue retrieving entitlement, '%s', pid, %d, executable or bundle, '%s'", buf, 0x1Cu);
            if (v59 < 0)
              operator delete(*(void **)__p);
          }
        }
        CFRelease(v15);
      }
      else
      {
        if (qword_1ECE24CD0 != -1)
          dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
        v25 = qword_1ECE24CC8;
        v23 = 0;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
        {
          sub_1A1A0A858();
          if (v62[9] >= 0)
            v26 = buf;
          else
            v26 = *(_BYTE **)buf;
          *(_DWORD *)__p = 136315138;
          *(_QWORD *)&__p[4] = v26;
          _os_log_impl(&dword_1A19F4000, v25, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCreateWithAuditToken failed for token '%s'", __p, 0xCu);
          if ((v62[9] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          v23 = 0;
        }
      }
      v33 = *v6;
      v34 = (char **)(a1 + 1);
      v35 = (char *)(a1 + 1);
      if (*v6)
      {
        while (1)
        {
          while (1)
          {
            v35 = v33;
            v36 = v33 + 32;
            if (!sub_1A1A0B7DC(a2, (_QWORD *)v33 + 4))
              break;
            v33 = *(char **)v35;
            v34 = (char **)v35;
            if (!*(_QWORD *)v35)
              goto LABEL_62;
          }
          if (!sub_1A1A0B7DC(v36, a2))
            break;
          v33 = (char *)*((_QWORD *)v35 + 1);
          if (!v33)
          {
            v34 = (char **)(v35 + 8);
            goto LABEL_62;
          }
        }
        v37 = v35;
      }
      else
      {
LABEL_62:
        v37 = (char *)operator new(0x40uLL);
        v38 = v37 + 32;
        if (*((char *)a2 + 23) < 0)
        {
          sub_1A19FA49C(v38, (void *)*a2, a2[1]);
        }
        else
        {
          *(_OWORD *)v38 = *(_OWORD *)a2;
          *((_QWORD *)v37 + 6) = a2[2];
        }
        v37[56] = 0;
        *(_QWORD *)v37 = 0;
        *((_QWORD *)v37 + 1) = 0;
        *((_QWORD *)v37 + 2) = v35;
        *v34 = v37;
        v39 = (uint64_t *)**a1;
        v40 = v37;
        if (v39)
        {
          *a1 = v39;
          v40 = *v34;
        }
        v41 = *v6;
        v42 = v40 == *v6;
        v40[24] = v42;
        if (!v42)
        {
          do
          {
            v43 = *((_QWORD *)v40 + 2);
            if (*(_BYTE *)(v43 + 24))
              break;
            v44 = *(char **)(v43 + 16);
            v45 = *(_QWORD *)v44;
            if (*(_QWORD *)v44 == v43)
            {
              v48 = *((_QWORD *)v44 + 1);
              if (!v48 || (v49 = *(unsigned __int8 *)(v48 + 24), v46 = (_BYTE *)(v48 + 24), v49))
              {
                if (*(char **)v43 == v40)
                {
                  v50 = (uint64_t *)*((_QWORD *)v40 + 2);
                }
                else
                {
                  v50 = *(uint64_t **)(v43 + 8);
                  v51 = *v50;
                  *(_QWORD *)(v43 + 8) = *v50;
                  if (v51)
                  {
                    *(_QWORD *)(v51 + 16) = v43;
                    v44 = *(char **)(v43 + 16);
                  }
                  v50[2] = (uint64_t)v44;
                  *(_QWORD *)(*(_QWORD *)(v43 + 16) + 8 * (**(_QWORD **)(v43 + 16) != v43)) = v50;
                  *v50 = v43;
                  *(_QWORD *)(v43 + 16) = v50;
                  v44 = (char *)v50[2];
                  v43 = *(_QWORD *)v44;
                }
                *((_BYTE *)v50 + 24) = 1;
                v44[24] = 0;
                v54 = *(_QWORD *)(v43 + 8);
                *(_QWORD *)v44 = v54;
                if (v54)
                  *(_QWORD *)(v54 + 16) = v44;
                *(_QWORD *)(v43 + 16) = *((_QWORD *)v44 + 2);
                *(_QWORD *)(*((_QWORD *)v44 + 2) + 8 * (**((_QWORD **)v44 + 2) != (_QWORD)v44)) = v43;
                *(_QWORD *)(v43 + 8) = v44;
                goto LABEL_94;
              }
            }
            else if (!v45 || (v47 = *(unsigned __int8 *)(v45 + 24), v46 = (_BYTE *)(v45 + 24), v47))
            {
              if (*(char **)v43 == v40)
              {
                v52 = *((_QWORD *)v40 + 1);
                *(_QWORD *)v43 = v52;
                if (v52)
                {
                  *(_QWORD *)(v52 + 16) = v43;
                  v44 = *(char **)(v43 + 16);
                }
                *((_QWORD *)v40 + 2) = v44;
                *(_QWORD *)(*(_QWORD *)(v43 + 16) + 8 * (**(_QWORD **)(v43 + 16) != v43)) = v40;
                *((_QWORD *)v40 + 1) = v43;
                *(_QWORD *)(v43 + 16) = v40;
                v44 = (char *)*((_QWORD *)v40 + 2);
              }
              else
              {
                v40 = (char *)*((_QWORD *)v40 + 2);
              }
              v40[24] = 1;
              v44[24] = 0;
              v43 = *((_QWORD *)v44 + 1);
              v53 = *(char **)v43;
              *((_QWORD *)v44 + 1) = *(_QWORD *)v43;
              if (v53)
                *((_QWORD *)v53 + 2) = v44;
              *(_QWORD *)(v43 + 16) = *((_QWORD *)v44 + 2);
              *(_QWORD *)(*((_QWORD *)v44 + 2) + 8 * (**((_QWORD **)v44 + 2) != (_QWORD)v44)) = v43;
              *(_QWORD *)v43 = v44;
LABEL_94:
              *((_QWORD *)v44 + 2) = v43;
              break;
            }
            *(_BYTE *)(v43 + 24) = 1;
            v40 = v44;
            v44[24] = v44 == v41;
            *v46 = 1;
          }
          while (v44 != v41);
        }
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
      v37[56] = v23;
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v24 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A19F4000, v24, OS_LOG_TYPE_FAULT, "Couldn't get CFString for entitlement", buf, 2u);
      }
      v23 = 0;
    }
  }
  else
  {
    v23 = *((_BYTE *)v7 + 56) != 0;
  }
  os_unfair_lock_unlock(v4);
  return v23;
}

void sub_1A1A03520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  os_unfair_lock_s *v22;

  os_unfair_lock_unlock(v22);
  _Unwind_Resume(a1);
}

void CLConnectionClient::sendMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  NSObject *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD v29[6];
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[6];
  std::__shared_weak_count *v34;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v37[10];
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_1A19F4000, "CL: CLConnectionClient::sendMessage(reply) (Fallback)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v7 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v37 = 2082;
    *(_QWORD *)&v37[2] = &unk_1A1A18FAF;
    v38 = 2082;
    v39 = "activity";
    _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessage(reply)\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  sub_1A1A0569C(a1 + 8, buf);
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = sub_1A1A03A80;
  v33[3] = &unk_1E45FB240;
  v33[5] = *(_QWORD *)buf;
  v34 = *(std::__shared_weak_count **)v37;
  if (*(_QWORD *)v37)
  {
    v9 = (unint64_t *)(*(_QWORD *)v37 + 16);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v33[4] = a3;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(std::__shared_weak_count **)(a1 + 40);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = *(NSObject **)a1;
  v29[0] = v8;
  v29[1] = 3321888768;
  v29[2] = sub_1A1A038D4;
  v29[3] = &unk_1E45FB488;
  v29[5] = v11;
  v30 = v12;
  if (v12)
  {
    v16 = (unint64_t *)&v12->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = (std::__shared_weak_count *)a2[1];
  v31 = *a2;
  v32 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  v29[4] = v33;
  dispatch_async(v15, v29);
  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v30;
  if (v30)
  {
    v25 = (unint64_t *)&v30->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v12)
  {
    v27 = (unint64_t *)&v12->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  if (*(_QWORD *)v37)
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v37);
  os_activity_scope_leave(&state);
}

void sub_1A1A0383C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

uint64_t **CLConnectionMessage::isEntitled(uint64_t a1, uint64_t *a2)
{
  uint64_t **result;

  result = *(uint64_t ***)(a1 + 72);
  if (result)
    return (uint64_t **)CLConnectionEntitlementCache::isEntitled(result, a2);
  return result;
}

uint64_t sub_1A1A03868(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 40;
  sub_1A1A057B8(a1 + 56);
  return sub_1A1A057B8(v1);
}

_QWORD *sub_1A1A03890(_QWORD *result, _QWORD *a2)
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
    v3 = (unint64_t *)(v2 + 8);
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

void sub_1A1A038D4(_QWORD *a1)
{
  uint64_t *v2;
  unsigned __int8 **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned __int8 **v13;
  std::__shared_weak_count *v14;

  v2 = (uint64_t *)a1[5];
  v3 = (unsigned __int8 **)a1[7];
  v4 = (std::__shared_weak_count *)a1[8];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    v7 = (void (**)(_QWORD, _QWORD))a1[4];
    v13 = v3;
    v14 = v4;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  else
  {
    v7 = (void (**)(_QWORD, _QWORD))a1[4];
    v13 = (unsigned __int8 **)a1[7];
    v14 = 0;
  }
  sub_1A19F53EC(v2, &v13, 0, v7);
  if (v4)
  {
    v9 = (unint64_t *)&v4->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v4)
  {
    v11 = (unint64_t *)&v4->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_1A1A039C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_1A1A057B8((uint64_t)&a11);
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A039E0(_QWORD *a1)
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

void sub_1A1A03A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A03A80(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[7];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = sub_1A1A039E0;
  v9[3] = &unk_1E45FB278;
  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v2;
  v9[6] = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A1A039E0(v9);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A03B58(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

os_log_t sub_1A1A03B6C()
{
  os_log_t result;

  result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1ECE24CC8 = (uint64_t)result;
  return result;
}

os_log_t sub_1A1A03B98()
{
  os_log_t result;

  result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1ECE24CC8 = (uint64_t)result;
  return result;
}

os_log_t sub_1A1A03BC4()
{
  os_log_t result;

  result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1ECE24CC8 = (uint64_t)result;
  return result;
}

void sub_1A1A03BF0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

os_log_t sub_1A1A03C20()
{
  os_log_t result;

  result = os_log_create("com.apple.LocationSupport", "Intersilo");
  qword_1ECE24CA8 = (uint64_t)result;
  return result;
}

void sub_1A1A03C4C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

void sub_1A1A03C7C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

void sub_1A1A03CAC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.locationd.Core", "Core");
  v1 = (void *)qword_1ECE24D78;
  qword_1ECE24D78 = (uint64_t)v0;

}

void sub_1A1A03CDC()
{
  CLIntersiloInterface *v0;
  void *v1;

  v0 = objc_alloc_init(CLIntersiloInterface);
  v1 = (void *)qword_1ECE24D88;
  qword_1ECE24D88 = (uint64_t)v0;

}

void sub_1A1A03D04()
{
  CLServiceVendor *v0;
  void *v1;

  v0 = objc_alloc_init(CLServiceVendor);
  v1 = (void *)qword_1ECE24D30;
  qword_1ECE24D30 = (uint64_t)v0;

}

void sub_1A1A03D2C()
{
  id v0;
  void *v1;

  v0 = -[CLDispatchSilo initMain]([CLDispatchSilo alloc], "initMain");
  v1 = (void *)qword_1ECE24D48;
  qword_1ECE24D48 = (uint64_t)v0;

}

BOOL CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  xpc_object_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL8 result;
  void *v17;
  uint64_t v18;
  void *v19;
  void *__p[2];
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  else
    v5 = 0;
  if (*(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 24))
  {
    if (v5)
    {
      v6 = xpc_data_create((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v7 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "Attempting to send nil/null data. An error should be sent instead.", buf, 2u);
      }
      v6 = xpc_data_create(0, 0);
    }
    v8 = v6;
    v9 = *(void **)(a1 + 48);
    v10 = *(char *)(a2 + 23);
    if (v9)
    {
      if (v10 >= 0)
        v11 = (const char *)a2;
      else
        v11 = *(const char **)a2;
      xpc_dictionary_set_string(v9, "kCLConnectionMessageNameKey", v11);
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageInfoKey", v8);
      xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageIsReplyingKey", 1);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
      xpc_release(*(xpc_object_t *)(a1 + 48));
      *(_QWORD *)(a1 + 48) = 0;
    }
    else
    {
      if (v10 < 0)
      {
        sub_1A19FA49C(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)a2;
        v21 = *(_QWORD *)(a2 + 16);
      }
      v19 = sub_1A19FE8E4((const char *)__p, v8, *(void **)(a1 + 64), *(_QWORD *)(a1 + 24), 1);
      if (SHIBYTE(v21) < 0)
        operator delete(__p[0]);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v19);
      xpc_release(v19);
    }
    if (v8)
      xpc_release(v8);
    return 1;
  }
  else
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v12 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      v13 = *(char *)(a2 + 23) >= 0 ? (void *)a2 : *(void **)a2;
      v14 = *(int *)(a1 + 24);
      *(_DWORD *)buf = 68289538;
      v23 = 0;
      v24 = 2082;
      v25 = &unk_1A1A18FAF;
      v26 = 2082;
      v27 = v13;
      v28 = 2050;
      v29 = v14;
      _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to send reply message\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    }
    v15 = qword_1ECE24CC8;
    result = os_signpost_enabled((os_log_t)qword_1ECE24CC8);
    if (result)
    {
      if (*(char *)(a2 + 23) >= 0)
        v17 = (void *)a2;
      else
        v17 = *(void **)a2;
      v18 = *(int *)(a1 + 24);
      *(_DWORD *)buf = 68289538;
      v23 = 0;
      v24 = 2082;
      v25 = &unk_1A1A18FAF;
      v26 = 2082;
      v27 = v17;
      v28 = 2050;
      v29 = v18;
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to send reply message", "{\"msg%{public}.0s\":\"Unable to send reply message\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      return 0;
    }
  }
  return result;
}

void sub_1A1A040DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2)
{
  return CLConnectionMessage::sendReply(a1, a1, a2);
}

void *CLConnectionMessage::createXPCMessage(CLConnectionMessage *this)
{
  void *v2;
  void *__p[2];
  uint64_t v5;

  if (*((char *)this + 23) < 0)
  {
    sub_1A19FA49C(__p, *(void **)this, *((_QWORD *)this + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)this;
    v5 = *((_QWORD *)this + 2);
  }
  v2 = sub_1A19FE8E4((const char *)__p, *((void **)this + 7), *((void **)this + 8), 0, 0);
  if (SHIBYTE(v5) < 0)
    operator delete(__p[0]);
  return v2;
}

void sub_1A1A04184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CLConnectionClient::sendMessageSync(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  CLConnectionMessage *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  CLConnectionMessage *v22;
  std::__shared_weak_count *v23;
  __int128 v24;

  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(CLConnectionMessage **)a2;
  v7 = *(std::__shared_weak_count **)(a2 + 8);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  *a4 = 0;
  a4[1] = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 100));
  v11 = *(_QWORD *)v6;
  if (*(_QWORD *)v6)
  {
    v22 = v8;
    v23 = v7;
    if (v7)
    {
      v12 = (unint64_t *)&v7->__shared_owners_;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    CLConnection::sendMessageSync(v11, &v22, a3, &v24);
    sub_1A1A05810((uint64_t)a4, &v24);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v23;
    if (v23)
    {
      v18 = (unint64_t *)&v23->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 100));
  if (v7)
  {
    v20 = (unint64_t *)&v7->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_1A1A042FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;

  sub_1A1A057B8((uint64_t)&a11);
  sub_1A1A057B8(v11);
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void CLConnection::sendMessageSync(uint64_t a1@<X0>, CLConnectionMessage **a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  void *XPCMessage;
  BOOL v8;
  const char **v9;
  uint64_t v10;
  int v11;
  const char *v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *string;
  NSObject *v18;
  CLConnectionMessage *v19;
  NSObject *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  int v32;
  NSObject *v33;
  __int128 v35;
  _QWORD block[5];
  _QWORD v37[5];
  _BYTE buf[22];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  XPCMessage = CLConnectionMessage::createXPCMessage(*a2);
  v8 = a3 == 0;
  v9 = (const char **)MEMORY[0x1E0C81270];
  v10 = MEMORY[0x1E0C81310];
  if (v8)
    v11 = 0;
  else
    v11 = 3;
  *a4 = 0;
  a4[1] = 0;
  v12 = *v9;
  v13 = *(_xpc_connection_s **)a1;
  do
  {
    v14 = xpc_connection_send_message_with_reply_sync(v13, XPCMessage);
    v15 = MEMORY[0x1A1B1081C]();
    if (v15 != v10)
    {
      if (v15 == MEMORY[0x1E0C812F8])
      {
        v22 = *(_QWORD *)(a1 + 80);
        v21 = *(std::__shared_weak_count **)(a1 + 88);
        v23 = operator new(0x70uLL);
        v24 = v23;
        v23[1] = 0;
        v23[2] = 0;
        *v23 = &off_1E45FB0D0;
        *(_QWORD *)buf = v22;
        *(_QWORD *)&buf[8] = v21;
        if (v21)
        {
          p_shared_owners = (unint64_t *)&v21->__shared_owners_;
          do
            v26 = __ldxr(p_shared_owners);
          while (__stxr(v26 + 1, p_shared_owners));
        }
        CLConnectionMessage::CLConnectionMessage((uint64_t)(v23 + 3), v14, buf);
        if (v21)
        {
          v27 = (unint64_t *)&v21->__shared_owners_;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        *(_QWORD *)&v35 = v24 + 3;
        *((_QWORD *)&v35 + 1) = v24;
        sub_1A1A05810((uint64_t)a4, &v35);
        v29 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
        if (*((_QWORD *)&v35 + 1))
        {
          v30 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
      }
      else
      {
        if (qword_1ECE24CD0 != -1)
          dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
        v16 = qword_1ECE24CC8;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A19F4000, v16, OS_LOG_TYPE_FAULT, "Dropping unexpected response (not a dictionary)", buf, 2u);
        }
      }
      goto LABEL_32;
    }
    string = xpc_dictionary_get_string(v14, v12);
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
    v18 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_ERROR))
    {
      v19 = *a2;
      if (*((char *)*a2 + 23) < 0)
        v19 = *(CLConnectionMessage **)v19;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = string;
      _os_log_impl(&dword_1A19F4000, v18, OS_LOG_TYPE_ERROR, "Error on message reply (sync) for %{public}s (%{public}s)", buf, 0x16u);
    }
    if (v14 != (xpc_object_t)MEMORY[0x1E0C81258])
    {
      v20 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A1A0AFB4;
      block[3] = &unk_1E45FB9A0;
      block[4] = a1;
      dispatch_async(v20, block);
LABEL_32:
      v32 = 0;
      goto LABEL_33;
    }
    v32 = v11;
    if (!v11)
    {
      v33 = *(NSObject **)(a1 + 8);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = sub_1A1A0AE78;
      v37[3] = &unk_1E45FB9A0;
      v37[4] = a1;
      dispatch_async(v33, v37);
    }
LABEL_33:
    xpc_release(v14);
    v13 = *(_xpc_connection_s **)a1;
    if (!*(_QWORD *)a1)
      break;
    v11 = v32 - 1;
  }
  while (v32);
  xpc_release(XPCMessage);
}

void sub_1A1A04698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_1A1A057B8(a12);
  _Unwind_Resume(a1);
}

CLConnectionServer *CLConnectionServer::CLConnectionServer(CLConnectionServer *a1, void *a2, void *a3, const void *a4)
{
  void *v7;
  _QWORD *v8;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a1 = a3;
  *((_QWORD *)a1 + 1) = a2;
  v7 = _Block_copy(a4);
  *((_QWORD *)a1 + 3) = &unk_1E45FB0A8;
  *((_QWORD *)a1 + 2) = v7;
  v8 = operator new(0x20uLL);
  v8[2] = 0;
  *v8 = &unk_1E45FB1B0;
  v8[1] = 0;
  *((_QWORD *)a1 + 5) = v8;
  *((_DWORD *)v8 + 6) = 31337;
  *((_QWORD *)a1 + 4) = v8 + 3;
  if (!*((_QWORD *)a1 + 1))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    v10 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = &unk_1A1A18FAF;
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "fXPCService != __null";
      _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    }
    v11 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = &unk_1A1A18FAF;
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "fXPCService != __null";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connection can't be NULL", "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    }
    v12 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = &unk_1A1A18FAF;
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "fXPCService != __null";
      _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  CLConnectionServer::initializeService(a1);
  return a1;
}

void sub_1A1A053BC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_1A19F761C(v1);
  _Unwind_Resume(a1);
}

void CLConnectionServer::initializeService(CLConnectionServer *this)
{
  _xpc_connection_s *v2;
  _QWORD handler[5];

  v2 = (_xpc_connection_s *)*((_QWORD *)this + 1);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1A1A055BC;
  handler[3] = &unk_1E45FB780;
  handler[4] = this;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_resume(*((xpc_connection_t *)this + 1));
}

CLConnectionServer *CLConnectionServer::CLConnectionServer(CLConnectionServer *a1, const char *a2, NSObject *a3, const void *a4)
{
  void *v8;
  _QWORD *v9;
  const char *v10;
  xpc_connection_t mach_service;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v13;
  uint8_t v15[16];

  *(_QWORD *)a1 = a3;
  v8 = _Block_copy(a4);
  *((_QWORD *)a1 + 3) = &unk_1E45FB0A8;
  *((_QWORD *)a1 + 2) = v8;
  v9 = operator new(0x20uLL);
  v9[1] = 0;
  v9[2] = 0;
  *v9 = &unk_1E45FB1B0;
  *((_QWORD *)a1 + 5) = v9;
  *((_DWORD *)v9 + 6) = 31337;
  *((_QWORD *)a1 + 4) = v9 + 3;
  v10 = a2;
  if (a2[23] < 0)
    v10 = *(const char **)a2;
  mach_service = xpc_connection_create_mach_service(v10, a3, 1uLL);
  *((_QWORD *)a1 + 1) = mach_service;
  if (mach_service)
  {
    CLConnectionServer::initializeService(a1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (a2[23] < 0)
      a2 = *(const char **)a2;
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2), 0, 0, 1u);
  }
  else
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB560);
    v13 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A19F4000, v13, OS_LOG_TYPE_FAULT, "Couldn't create XPC service", v15, 2u);
    }
  }
  return a1;
}

void sub_1A1A055A4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_1A19F761C(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A055BC(uint64_t a1, void *a2)
{
  uint64_t *v3;
  void *v4;

  v3 = *(uint64_t **)(a1 + 32);
  v4 = (void *)MEMORY[0x1A1B10324]();
  if (a2 != (void *)MEMORY[0x1E0C81260])
    CLConnectionServer::handleEvent(v3, a2);
  objc_autoreleasePoolPop(v4);
}

void CLConnectionServer::~CLConnectionServer(CLConnectionServer *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)((char *)this + 24);
  sub_1A19F7660((uint64_t)this + 24);
  xpc_connection_cancel(*((xpc_connection_t *)this + 1));
  xpc_release(*((xpc_object_t *)this + 1));
  *((_QWORD *)this + 1) = 0;
  _Block_release(*((const void **)this + 2));
  dispatch_release(*(dispatch_object_t *)this);
  sub_1A19F761C(v2);
}

void sub_1A1A05668(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void CLConnectionServer::handleDisconnection(CLConnectionServer *this, CLConnection *a2)
{
  if (a2)
    CLConnection::deferredDelete(a2);
}

void sub_1A1A0568C(uint64_t a1)
{
  CLConnection *v1;

  v1 = *(CLConnection **)(a1 + 40);
  if (v1)
    CLConnection::deferredDelete(v1);
}

void sub_1A1A0569C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    *a2 = v2;
    a2[1] = v3;
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  else
  {
    *a2 = v2;
    a2[1] = 0;
  }
}

uint64_t sub_1A1A05720(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t sub_1A1A05744(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 48);
}

void sub_1A1A0574C(_QWORD *a1)
{
  sub_1A19F761C(a1);
  JUMPOUT(0x1A1B0FFE8);
}

void sub_1A1A05770(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E45FB1B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A1A05784(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E45FB1B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1B0FFE8);
}

uint64_t sub_1A1A057B8(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
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
  return a1;
}

uint64_t sub_1A1A05810(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
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
  return a1;
}

void sub_1A1A05874(CLConnection **a1)
{
  CLConnection *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    CLConnection::deferredDelete(v2);
}

id sub_1A1A05938()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB830);
  return (id)qword_1ECE24CA8;
}

uint64_t sub_1A1A059A8(uint64_t a1)
{
  uint64_t i;

  for (i = 0; i != -120; i -= 24)
  {
    if (*(char *)(a1 + i + 119) < 0)
      operator delete(*(void **)(a1 + i + 96));
  }
  return a1;
}

void sub_1A1A059EC(uint64_t a1, uint64_t *a2)
{
  unint64_t v2;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  void *i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  void *v35;

  v4 = *(void **)(a1 + 32);
  v5 = **(_QWORD **)(a1 + 40);
  v6 = 0x9DDFEA08EB382D69 * (((8 * v5) + 8) ^ HIDWORD(v5));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(v5) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = a2[1];
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v2 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v2 = v8 % v9;
    }
    else
    {
      v2 = v8 & (v9 - 1);
    }
    v11 = *(void ***)(*a2 + 8 * v2);
    if (v11)
    {
      for (i = *v11; i; i = *(void **)i)
      {
        v13 = *((_QWORD *)i + 1);
        if (v13 == v8)
        {
          if (*((_QWORD *)i + 2) == v5)
            goto LABEL_74;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v2)
            break;
        }
      }
    }
  }
  v14 = a2 + 2;
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v8;
  *((_QWORD *)i + 2) = v5;
  *((_QWORD *)i + 3) = 0;
  v15 = (float)(unint64_t)(a2[3] + 1);
  v16 = *((float *)a2 + 8);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = a2[1];
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v9)
    {
      v27 = vcvtps_u32_f32((float)(unint64_t)a2[3] / *((float *)a2 + 8));
      if (v9 < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = a2[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            sub_1A1A06064();
          v21 = operator new(8 * *(_QWORD *)&prime);
          v22 = (void *)*a2;
          *a2 = (uint64_t)v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          a2[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a2 + 8 * v23++) = 0;
          while (*(_QWORD *)&prime != v23);
          v24 = (_QWORD *)*v14;
          if (*v14)
          {
            v25 = v24[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a2 + 8 * v25) = v14;
            v30 = (_QWORD *)*v24;
            if (*v24)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(_QWORD *)(*a2 + 8 * v31))
                  {
                    *(_QWORD *)(*a2 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  *v24 = *v30;
                  *v30 = **(_QWORD **)(*a2 + 8 * v31);
                  **(_QWORD **)(*a2 + 8 * v31) = v30;
                  v30 = v24;
                }
                v31 = v25;
LABEL_55:
                v24 = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v35 = (void *)*a2;
        *a2 = 0;
        if (v35)
          operator delete(v35);
        v9 = 0;
        a2[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v2 = v8 % v9;
      else
        v2 = v8;
    }
    else
    {
      v2 = (v9 - 1) & v8;
    }
  }
  v32 = *a2;
  v33 = *(_QWORD **)(*a2 + 8 * v2);
  if (v33)
  {
    *(_QWORD *)i = *v33;
LABEL_72:
    *v33 = i;
    goto LABEL_73;
  }
  *(_QWORD *)i = *v14;
  *v14 = i;
  *(_QWORD *)(v32 + 8 * v2) = v14;
  if (*(_QWORD *)i)
  {
    v34 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9)
        v34 %= v9;
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (_QWORD *)(*a2 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++a2[3];
LABEL_74:
  objc_storeStrong((id *)i + 3, v4);
}

void sub_1A1A05DFC(_Unwind_Exception *a1)
{
  id *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A05EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1A1A05EE4(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = sub_1A19FDADC(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a1 + 40));
  if (v3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)v3[3]);
}

_QWORD *sub_1A1A05F2C(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1A1A05FDC();
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

void sub_1A1A05FDC()
{
  sub_1A1A05FF0("basic_string");
}

void sub_1A1A05FF0(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1A1A06040(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E45FA950, MEMORY[0x1E0DE42D0]);
}

void sub_1A1A0602C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1A1A06040(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1A1A06064()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1A1A08740()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

void sub_1A1A08770()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.locationd.Support", "Support");
  v1 = (void *)qword_1EE64C238;
  qword_1EE64C238 = (uint64_t)v0;

}

uint64_t sub_1A1A087A0(uint64_t a1)
{
  if (qword_1ECE24E28 != -1)
    dispatch_once(&qword_1ECE24E28, &unk_1E45FB5C0);
  off_1EE64C248 = (uint64_t (*)())dlsym((void *)qword_1ECE24E30, "cprofile_set_current_identifier");
  return ((uint64_t (*)(uint64_t))off_1EE64C248)(a1);
}

void *sub_1A1A08808()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CProfileRuntime.framework/CProfileRuntime", 2);
  qword_1ECE24E30 = (uint64_t)result;
  return result;
}

char *sub_1A1A08830()
{
  char *result;

  result = getenv("CPROFILE_ENABLE");
  byte_1ECE24E20 = result != 0;
  return result;
}

CLDispatchSilo *sub_1A1A08900()
{
  CLDispatchSilo *result;

  result = -[CLDispatchSilo initWithIdentifier:]([CLDispatchSilo alloc], "initWithIdentifier:", CFSTR("CLSettingsManagerInternalSilo"));
  qword_1ECE24CF0 = (uint64_t)result;
  return result;
}

void sub_1A1A08DA4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "prepareAndRunBlock:", 0);

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldFire");

}

void sub_1A1A0914C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A09164(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = pthread_self();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  CFRunLoopRun();
}

id sub_1A1A091BC()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
  return (id)qword_1ECE24CA8;
}

void sub_1A1A093A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1A1A093B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = pthread_self();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_1A1A097D4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CLRunLoopSiloThread *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v6 = objc_alloc_init(CLRunLoopSiloThread);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v6;

    if (v6)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(a1 + 40));
  }

}

uint64_t sub_1A1A0A42C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return pthread_dependency_fulfill_np();
}

_BYTE *sub_1A1A0A5F8(uint64_t a1)
{
  _BYTE *result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ack");
  result = *(_BYTE **)(a1 + 40);
  if (!result[16])
  {
    result = (_BYTE *)objc_msgSend(result, "shouldBeIdled");
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = 1;
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FB600);
      v3 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "#Idleness: Silo is being idled: %@", (uint8_t *)&v5, 0xCu);
      }
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 40), "runIdleHandlers");
    }
  }
  return result;
}

void sub_1A1A0A6F4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

void sub_1A1A0A724()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24E48;
  qword_1ECE24E48 = v0;

}

id sub_1A1A0A750()
{
  if (qword_1EE64C3D0 != -1)
    dispatch_once(&qword_1EE64C3D0, &unk_1E45FB620);
  return (id)qword_1EE64C3D8;
}

void sub_1A1A0A7D4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Timer");
  v1 = (void *)qword_1EE64C3D8;
  qword_1EE64C3D8 = (uint64_t)v0;

}

void CLConnectionEntitlementCache::getName(uint64_t a1@<X8>)
{
  sub_1A1A02BF8(a1);
}

void CLConnectionEntitlementCache::CLConnectionEntitlementCache(CLConnectionEntitlementCache *this, audit_token_t *a2)
{
  __int128 v2;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  v2 = *(_OWORD *)a2->val;
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)&a2->val[4];
  *(_OWORD *)((char *)this + 24) = v2;
  *((_DWORD *)this + 14) = 0;
}

{
  __int128 v2;

  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  v2 = *(_OWORD *)a2->val;
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)&a2->val[4];
  *(_OWORD *)((char *)this + 24) = v2;
  *((_DWORD *)this + 14) = 0;
}

uint64_t sub_1A1A0A858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  const std::locale::facet *v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  size_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[8];
  void *__p[2];
  __int128 v30;
  int v31;
  uint64_t v32[19];
  char v33;
  _BYTE v34[16];
  std::locale v35;
  void *__b[2];
  int64_t v37;

  v0 = MEMORY[0x1E0DE4FD0];
  v1 = MEMORY[0x1E0DE4FD0] + 104;
  v32[0] = MEMORY[0x1E0DE4FD0] + 104;
  v2 = MEMORY[0x1E0DE4FD0] + 64;
  v3 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
  v27 = MEMORY[0x1E0DE4FD0] + 64;
  v26[0] = v4;
  *(_QWORD *)((char *)v26 + *(_QWORD *)(v4 - 24)) = v5;
  v26[1] = 0;
  v6 = (std::ios_base *)((char *)v26 + *(_QWORD *)(v26[0] - 24));
  std::ios_base::init(v6, v28);
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  v7 = v3[5];
  v27 = v3[4];
  *(_QWORD *)((char *)&v28[-1] + *(_QWORD *)(v27 - 24)) = v7;
  v26[0] = v3[1];
  *(_QWORD *)((char *)v26 + *(_QWORD *)(v26[0] - 24)) = v3[6];
  v32[0] = v1;
  v26[0] = v0 + 24;
  v27 = v2;
  std::streambuf::basic_streambuf();
  v8 = 0;
  v28[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v30 = 0u;
  v31 = 24;
  do
  {
    std::ostream::operator<<();
    if (v8 <= 6)
    {
      v33 = 124;
      MEMORY[0x1A1B0FF34](v34, &v27);
      if (v34[0])
      {
        v9 = (char *)&v28[-1] + *(_QWORD *)(v27 - 24);
        v10 = *((_QWORD *)v9 + 5);
        v11 = *((_DWORD *)v9 + 2);
        v12 = *((_DWORD *)v9 + 36);
        if (v12 == -1)
        {
          std::ios_base::getloc((const std::ios_base *)((char *)&v28[-1] + *(_QWORD *)(v27 - 24)));
          v13 = std::locale::use_facet(&v35, MEMORY[0x1E0DE4A90]);
          v12 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
          std::locale::~locale(&v35);
          *((_DWORD *)v9 + 36) = v12;
        }
        if ((v11 & 0xB0) == 0x20)
          v14 = v34;
        else
          v14 = &v33;
        if (!v10)
          goto LABEL_31;
        v15 = *((_QWORD *)v9 + 3);
        v16 = v15 <= 1;
        v17 = v15 - 1;
        v18 = v16 ? 0 : v17;
        if (v14 - &v33 >= 1
          && (*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v10 + 96))(v10, &v33, v14 - &v33) != v14 - &v33)
        {
          goto LABEL_31;
        }
        if ((uint64_t)v18 >= 1)
        {
          if (v18 >= 0x7FFFFFFFFFFFFFF8)
            sub_1A1A05FDC();
          if (v18 >= 0x17)
          {
            v20 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v18 | 7) != 0x17)
              v20 = v18 | 7;
            v21 = v20 + 1;
            v19 = (void **)operator new(v20 + 1);
            __b[1] = (void *)v18;
            v37 = v21 | 0x8000000000000000;
            __b[0] = v19;
          }
          else
          {
            HIBYTE(v37) = v18;
            v19 = __b;
          }
          memset(v19, v12, v18);
          *((_BYTE *)v19 + v18) = 0;
          if (v37 >= 0)
            v22 = __b;
          else
            v22 = (void **)__b[0];
          v23 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v10 + 96))(v10, v22, v18);
          if (SHIBYTE(v37) < 0)
            operator delete(__b[0]);
          if (v23 != v18)
            goto LABEL_31;
        }
        if (v34 - v14 < 1
          || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v10 + 96))(v10, v14, v34 - v14) == v34 - v14)
        {
          *((_QWORD *)v9 + 3) = 0;
        }
        else
        {
LABEL_31:
          std::ios_base::clear((std::ios_base *)((char *)&v28[-1] + *(_QWORD *)(v27 - 24)), *(_DWORD *)((char *)&v28[3] + *(_QWORD *)(v27 - 24)) | 5);
        }
      }
      MEMORY[0x1A1B0FF40](v34);
    }
    ++v8;
  }
  while (v8 != 8);
  std::stringbuf::str();
  v26[0] = *MEMORY[0x1E0DE4F50];
  v24 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v26 + *(_QWORD *)(v26[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v27 = v24;
  v28[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (SBYTE7(v30) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1A1B0FFC4](v32);
}

void sub_1A1A0AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __cxa_end_catch();
  sub_1A1A0B754((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A1A0ACB4(uint64_t a1)
{
  CLConnection::handleInterruption(*(dispatch_queue_t **)(a1 + 32));
}

void CLConnection::handleInterruption(dispatch_queue_t *this)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  os_activity_scope_state_s v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  v2 = _os_activity_create(&dword_1A19F4000, "CL: CLConnection::handleInterruption", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v5);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v3 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v7 = 0;
    v8 = 2082;
    v9 = &unk_1A1A18FAF;
    v10 = 2082;
    v11 = "activity";
    _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection::handleInterruption\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::resetReplyHandlers((CLConnection *)this);
  v4 = this[6];
  if (v4)
    ((void (*)(void))v4[2].isa)();
  os_activity_scope_leave(&v5);
}

void sub_1A1A0ADFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t CLConnectionMessage::isReplying(CLConnectionMessage *this)
{
  return *((unsigned __int8 *)this + 32);
}

uint64_t CLConnectionMessage::replyHandlerIdentifier(CLConnectionMessage *this)
{
  return *((_QWORD *)this + 3);
}

uint64_t CLConnection::setHandlerForMessage(uint64_t a1, uint64_t *a2, void *a3)
{
  if (*((char *)a2 + 23) < 0)
    a2 = (uint64_t *)*a2;
  return CLConnection::setHandlerForMessage(a1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2), a3);
}

uint64_t CLConnectionMessage::getRawPayload(CLConnectionMessage *this)
{
  return *((_QWORD *)this + 7);
}

uint64_t CLConnectionMessage::getFileDescriptors(CLConnectionMessage *this)
{
  return *((_QWORD *)this + 8);
}

void sub_1A1A0AE78(uint64_t a1)
{
  dispatch_queue_t *v1;
  NSObject *v2;
  NSObject *v3;
  os_activity_scope_state_s v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = _os_activity_create(&dword_1A19F4000, "CL: CLConnection calling interruption handler in sendMessageSync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v3 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v6 = 0;
    v7 = 2082;
    v8 = &unk_1A1A18FAF;
    v9 = 2082;
    v10 = "activity";
    _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection calling interruption handler in sendMessageSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::handleInterruption(v1);
  os_activity_scope_leave(&v4);
}

void sub_1A1A0AFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A0AFB4(uint64_t a1)
{
  dispatch_queue_t *v1;
  NSObject *v2;
  NSObject *v3;
  os_activity_scope_state_s v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = _os_activity_create(&dword_1A19F4000, "CL: CLConnection calling disconnection handler in sendMessageSync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v3 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v6 = 0;
    v7 = 2082;
    v8 = &unk_1A1A18FAF;
    v9 = 2082;
    v10 = "activity";
    _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection calling disconnection handler in sendMessageSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::handleDisconnection(v1);
  os_activity_scope_leave(&v4);
}

void sub_1A1A0B0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void CLConnection::getUserName(dispatch_queue_t *this@<X0>, _QWORD *a2@<X8>)
{
  NSObject *v4;
  NSObject *v5;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(this[1]);
  v4 = _os_activity_create(&dword_1A19F4000, "CL: #MultiUser CLConnection::getUserName", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
  v5 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v8 = 0;
    v9 = 2082;
    v10 = &unk_1A1A18FAF;
    v11 = 2082;
    v12 = "activity";
    _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#MultiUser CLConnection::getUserName\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  dispatch_assert_queue_V2(this[1]);
  xpc_connection_get_audit_token();
  sub_1A1A05F2C(a2, "mobile");
  os_activity_scope_leave(&state);
}

void sub_1A1A0B248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t CLConnectionMessage::CLConnectionMessage(uint64_t a1, void *a2)
{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return CLConnectionMessage::CLConnectionMessage(a1, a2, v3);
}

{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return CLConnectionMessage::CLConnectionMessage(a1, a2, v3);
}

void sub_1A1A0B288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A1A0B2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

char *CLConnectionMessage::CLConnectionMessage(char *__dst, __int128 *a2)
{
  __int128 v3;

  if (*((char *)a2 + 23) < 0)
  {
    sub_1A19FA49C(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v3;
  }
  *((_QWORD *)__dst + 3) = 0;
  __dst[32] = 0;
  *(_OWORD *)(__dst + 40) = 0u;
  *(_OWORD *)(__dst + 56) = 0u;
  *(_OWORD *)(__dst + 72) = 0u;
  return __dst;
}

uint64_t CLConnectionMessage::getObjectOfClass(CLConnectionMessage *this, objc_class *a2)
{
  return CLConnectionMessage::getObjectOfClasses(this, (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a2));
}

void CLConnectionMessage::setFileDescriptor(id *this, int a2)
{
  int v2;

  v2 = a2;
  CLConnectionMessage::setFileDescriptors(this, &v2, 1);
}

void CLConnectionMessage::setFileDescriptors(id *this, int *a2, int a3)
{
  uint64_t v3;
  int v6;

  LODWORD(v3) = a3;

  this[8] = xpc_array_create(0, 0);
  if ((int)v3 >= 1)
  {
    v3 = v3;
    do
    {
      v6 = *a2++;
      xpc_array_set_fd(this[8], 0xFFFFFFFFFFFFFFFFLL, v6);
      --v3;
    }
    while (v3);
  }
}

uint64_t CLConnectionMessage::copyFileDescriptor(CLConnectionMessage *this, size_t a2)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 8);
  if (v2)
    return xpc_array_dup_fd(v2, a2);
  else
    return 0xFFFFFFFFLL;
}

size_t CLConnectionMessage::getNumberOfFileDescriptors(xpc_object_t *this)
{
  return xpc_array_get_count(this[8]);
}

uint64_t CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *__p[2];
  uint64_t v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    if (*(char *)(a2 + 23) >= 0)
      v7 = (const char *)a2;
    else
      v7 = *(const char **)a2;
    xpc_dictionary_set_string(v6, "kCLConnectionMessageNameKey", v7);
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageInfoKey", a3);
    v8 = 1;
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageIsReplyingKey", 1);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 24);
    if (v9)
    {
      if (*(char *)(a2 + 23) < 0)
      {
        sub_1A19FA49C(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
        v9 = *(_QWORD *)(a1 + 24);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)a2;
        v19 = *(_QWORD *)(a2 + 16);
      }
      v16 = sub_1A19FE8E4((const char *)__p, a3, *(void **)(a1 + 64), v9, 1);
      if (SHIBYTE(v19) < 0)
        operator delete(__p[0]);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v16);
      xpc_release(v16);
      return 1;
    }
    else
    {
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      v10 = qword_1ECE24CC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
      {
        v11 = *(char *)(a2 + 23) >= 0 ? (void *)a2 : *(void **)a2;
        v12 = *(int *)(a1 + 24);
        *(_DWORD *)buf = 68289538;
        v21 = 0;
        v22 = 2082;
        v23 = &unk_1A1A18FAF;
        v24 = 2082;
        v25 = v11;
        v26 = 2050;
        v27 = v12;
        _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to send reply message with raw data\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
        if (qword_1ECE24CD0 != -1)
          dispatch_once(&qword_1ECE24CD0, &unk_1E45FB640);
      }
      v13 = qword_1ECE24CC8;
      if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
      {
        if (*(char *)(a2 + 23) >= 0)
          v14 = (void *)a2;
        else
          v14 = *(void **)a2;
        v15 = *(int *)(a1 + 24);
        *(_DWORD *)buf = 68289538;
        v21 = 0;
        v22 = 2082;
        v23 = &unk_1A1A18FAF;
        v24 = 2082;
        v25 = v14;
        v26 = 2050;
        v27 = v15;
        _os_signpost_emit_with_name_impl(&dword_1A19F4000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to send reply message with raw data", "{\"msg%{public}.0s\":\"Unable to send reply message with raw data\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      }
      return 0;
    }
  }
  return v8;
}

void sub_1A1A0B6E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL CLConnectionMessage::isReply(CLConnectionMessage *this)
{
  return *((_QWORD *)this + 6) != 0;
}

void sub_1A1A0B714(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB0D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A1A0B724(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB0D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1B0FFE8);
}

uint64_t sub_1A1A0B754(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A1B0FFC4](a1 + 128);
  return a1;
}

BOOL sub_1A1A0B7DC(_QWORD *a1, _QWORD *a2)
{
  int v2;
  int v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = *((char *)a2 + 23);
  v3 = *((char *)a1 + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a1 + 23);
  else
    v4 = a1[1];
  if (v3 < 0)
    a1 = (_QWORD *)*a1;
  if (v2 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = a2[1];
  if (v2 < 0)
    a2 = (_QWORD *)*a2;
  if (v5 >= v4)
    v6 = v4;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
    return v7 < 0;
  else
    return v4 < v5;
}

void sub_1A1A0B844(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB140;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A1A0B854(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB140;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1B0FFE8);
}

id sub_1A1A0BAA4()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB660);
  return (id)qword_1ECE24CA8;
}

void sub_1A1A0CFA4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

uint64_t sub_1A1A0D0F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

void sub_1A1A0D254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  NSObject *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v24[5];
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v5 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v29 = a3;
    _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEBUG, "received daemon start notification for service %@", buf, 0xCu);
  }
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(std::__shared_weak_count **)(a2 + 16);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(std::__shared_weak_count **)(a2 + 32);
  if (v11)
  {
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
  }
  v14 = *(NSObject **)a2;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3321888768;
  v24[2] = sub_1A1A0E82C;
  v24[3] = &unk_1E45FB350;
  v24[4] = v10;
  v25 = v11;
  if (v11)
  {
    v15 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v26 = v6;
  v27 = v7;
  if (v7)
  {
    v17 = (unint64_t *)&v7->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  dispatch_async(v14, v24);
  v19 = v27;
  if (v27)
  {
    v20 = (unint64_t *)&v27->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v25)
    std::__shared_weak_count::__release_weak(v25);
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  if (v7)
  {
    v22 = (unint64_t *)&v7->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_1A1A0D450(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_BYTE *)(a1 + 97))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    }
    v3 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call start() on an unpaused CLConnectionClient", "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    }
    v4 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  *(_BYTE *)(a1 + 97) = 0;
  if (*(_QWORD *)a1)
    CLConnection::start(*(dispatch_queue_t **)a1);
}

void CLConnectionClient::pause(CLConnectionClient *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v3 = *((_QWORD *)this + 4);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  v23 = v3;
  v24 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  sub_1A1A0569C((uint64_t)this + 8, &v21);
  v6 = *(NSObject **)this;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = sub_1A1A0D864;
  v17[3] = &unk_1E45FB350;
  v17[4] = v21;
  v18 = v22;
  if (v22)
  {
    p_shared_weak_owners = &v22->__shared_weak_owners_;
    do
      v8 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v8 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v19 = v3;
  v20 = v2;
  if (v2)
  {
    v9 = (unint64_t *)&v2->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  dispatch_async(v6, v17);
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  if (v22)
    std::__shared_weak_count::__release_weak(v22);
  v14 = v24;
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
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

void sub_1A1A0D850(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 - 48);
  _Unwind_Resume(a1);
}

void sub_1A1A0D864(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = a1[6];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[5];
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A1A0D954(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A0D938(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A0D94C(uint64_t a1)
{
  sub_1A1A0D954(*(_QWORD *)(a1 + 32));
}

void sub_1A1A0D954(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_BYTE *)(a1 + 97))
  {
    if (qword_1ECE24CD0 != -1)
      dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    v2 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    }
    v3 = qword_1ECE24CC8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CC8))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call pause() on a paused CLConnectionClient", "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CD0 != -1)
        dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
    }
    v4 = qword_1ECE24CC8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = &unk_1A1A18FAF;
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "fPaused";
      _os_log_impl(&dword_1A19F4000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  *(_BYTE *)(a1 + 97) = 1;
  if (*(_QWORD *)a1)
    CLConnection::pause(*(dispatch_queue_t **)a1);
}

uint64_t sub_1A1A0DC04(uint64_t result, uint64_t a2)
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

uint64_t sub_1A1A0DC28(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 40);
}

uint64_t sub_1A1A0DC30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  if (!a3)
    return objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", a2);
  objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", (id)objc_msgSend(a3, "copy"), a2);
  result = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
    return CLConnection::setHandlerForMessage(result, a2, a3);
  return result;
}

uint64_t sub_1A1A0DCB4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t sub_1A1A0DCD8(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 48);
}

void sub_1A1A0DCE0(uint64_t *a1, void *aBlock)
{
  const void *v4;

  v4 = (const void *)a1[3];
  a1[3] = (uint64_t)_Block_copy(aBlock);
  if (*a1)
    CLConnection::setDefaultMessageHandler(*a1, aBlock);
  if (v4)
    _Block_release(v4);
}

uint64_t sub_1A1A0DD40(uint64_t result, uint64_t a2)
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

uint64_t sub_1A1A0DD64(uint64_t a1)
{
  return sub_1A1A057B8(a1 + 40);
}

void sub_1A1A0DD6C(_QWORD *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  _QWORD v8[8];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = sub_1A1A0DE60;
  v8[3] = &unk_1E45FB388;
  v1 = a1[8];
  v2 = (std::__shared_weak_count *)a1[9];
  v8[4] = a1[4];
  v8[6] = v1;
  v8[7] = v2;
  v8[1] = 3321888768;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  v8[5] = a1[5];
  v5 = a1[7];
  if (v5 && *(_QWORD *)(v5 + 8) != -1)
    sub_1A1A0DE60((uint64_t)v8);
  if (v2)
  {
    v6 = (unint64_t *)&v2->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

void sub_1A1A0DE4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A0DE60(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v2 + 40))
    sub_1A19F81B0(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void *sub_1A1A0DEAC(uint64_t a1, void *aBlock)
{
  const void *v4;
  void *result;

  v4 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = _Block_copy(aBlock);
  if (v4)
    _Block_release(v4);
  result = *(void **)a1;
  if (*(_QWORD *)a1)
    return CLConnection::setInterruptionHandler((uint64_t)result, aBlock);
  return result;
}

void CLConnectionClient::sendMessageWithCompletion(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t *p_shared_weak_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  NSObject *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD block[6];
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[7];
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v39[20];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_1A19F4000, "CL: CLConnectionClient::sendMessageWithCompletion(reply) (Fallback)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECE24CD0 != -1)
    dispatch_once(&qword_1ECE24CD0, &unk_1E45FB680);
  v7 = qword_1ECE24CC8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CC8, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v39 = 2082;
    *(_QWORD *)&v39[2] = &unk_1A1A18FAF;
    *(_WORD *)&v39[10] = 2082;
    *(_QWORD *)&v39[12] = "activity";
    _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessageWithCompletion(reply)\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  sub_1A1A0569C(a1 + 8, &v35);
  *(_QWORD *)buf = 0;
  *(_QWORD *)v39 = buf;
  *(_QWORD *)&v39[8] = 0x2020000000;
  v39[16] = 1;
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = sub_1A1A0E228;
  v33[3] = &unk_1E45FB2E8;
  v33[6] = v35;
  v34 = v36;
  if (v36)
  {
    p_shared_weak_owners = &v36->__shared_weak_owners_;
    do
      v10 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v10 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v33[4] = a3;
  v33[5] = buf;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(std::__shared_weak_count **)(a1 + 40);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = *(NSObject **)a1;
  block[0] = v8;
  block[1] = 3321888768;
  block[2] = sub_1A1A0E40C;
  block[3] = &unk_1E45FB488;
  block[5] = v11;
  v30 = v12;
  if (v12)
  {
    v16 = (unint64_t *)&v12->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = (std::__shared_weak_count *)a2[1];
  v31 = *a2;
  v32 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  block[4] = v33;
  dispatch_async(v15, block);
  v21 = v32;
  if (v32)
  {
    v22 = (unint64_t *)&v32->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v30;
  if (v30)
  {
    v25 = (unint64_t *)&v30->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v12)
  {
    v27 = (unint64_t *)&v12->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  _Block_object_dispose(buf, 8);
  if (v36)
    std::__shared_weak_count::__release_weak(v36);
  os_activity_scope_leave(&state);
}

void sub_1A1A0E210(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1A1A0E228(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[8];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = sub_1A1A0E31C;
  v9[3] = &unk_1E45FB320;
  v2 = *a2;
  v3 = (std::__shared_weak_count *)a2[1];
  v9[5] = a1[5];
  v9[6] = v2;
  v9[7] = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v9[4] = a1[4];
  v6 = a1[7];
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A1A0E31C(v9);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A0E308(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A0E31C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v1 = *(_QWORD *)(a1[5] + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    v3 = a1[6];
    if (v3)
    {
      *(_BYTE *)(v1 + 24) = 0;
      v4 = a1[4];
      v5 = (std::__shared_weak_count *)a1[7];
      v11 = v3;
      v12 = v5;
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
      }
      (*(void (**)(uint64_t, uint64_t *))(v4 + 16))(v4, &v11);
      v8 = v12;
      if (v12)
      {
        v9 = (unint64_t *)&v12->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
  }
}

void sub_1A1A0E3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A0E3D8(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void sub_1A1A0E3FC(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void sub_1A1A0E40C(uint64_t a1)
{
  uint64_t *v2;
  unsigned __int8 **v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unsigned __int8 **v8[2];

  v2 = *(uint64_t **)(a1 + 40);
  v3 = *(unsigned __int8 ***)(a1 + 64);
  v8[0] = *(unsigned __int8 ***)(a1 + 56);
  v8[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 1);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  sub_1A19F53EC(v2, v8, 1, *(void (***)(_QWORD, _QWORD))(a1 + 32));
  if (v3)
  {
    v6 = (unint64_t *)(v3 + 1);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*((void (**)(unsigned __int8 **))*v3 + 2))(v3);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v3);
    }
  }
}

void sub_1A1A0E4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1A1A057B8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void CLConnectionClient::setRequireManualCachedMessageSend(CLConnectionClient *this, char a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD block[5];
  std::__shared_weak_count *v15;
  char v16;

  v2 = *((_QWORD *)this + 4);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = *(NSObject **)this;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = sub_1A1A0E5C0;
  block[3] = &unk_1E45FB208;
  block[4] = v2;
  v15 = v3;
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v16 = a2;
  dispatch_async(v6, block);
  v9 = v15;
  if (!v15)
    goto LABEL_11;
  v10 = (unint64_t *)&v15->__shared_owners_;
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 - 1, v10));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (!v3)
      return;
  }
  else
  {
LABEL_11:
    if (!v3)
      return;
  }
  v12 = (unint64_t *)&v3->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t sub_1A1A0E5C0(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 48) ^ 1;
  return result;
}

void CLConnectionClient::sendCachedMessages(CLConnectionClient *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  uint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v3 = *((_QWORD *)this + 4);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 5);
  v23 = v3;
  v24 = v2;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  sub_1A1A0569C((uint64_t)this + 8, &v21);
  v6 = *(NSObject **)this;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = sub_1A1A0E73C;
  v17[3] = &unk_1E45FB350;
  v17[4] = v21;
  v18 = v22;
  if (v22)
  {
    p_shared_weak_owners = &v22->__shared_weak_owners_;
    do
      v8 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v8 + 1, (unint64_t *)p_shared_weak_owners));
  }
  v19 = v3;
  v20 = v2;
  if (v2)
  {
    v9 = (unint64_t *)&v2->__shared_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  dispatch_async(v6, v17);
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  if (v22)
    std::__shared_weak_count::__release_weak(v22);
  v14 = v24;
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
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

void sub_1A1A0E728(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1 - 48);
  _Unwind_Resume(a1);
}

void sub_1A1A0E73C(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = a1[6];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[5];
  if (v6 && *(_QWORD *)(v6 + 8) != -1)
    sub_1A19F81B0(v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A0E810(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A0E824(uint64_t a1)
{
  sub_1A19F81B0(*(_QWORD *)(a1 + 32));
}

void sub_1A1A0E82C(_QWORD *a1)
{
  _QWORD *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v2 = (_QWORD *)a1[6];
  v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v6 = a1[5];
  if (v6 && *(_QWORD *)(v6 + 8) != -1 && !*v2)
    sub_1A19F7FAC((uint64_t)v2);
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1A1A0E908(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

void sub_1A1A0E91C(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (!*v1)
    sub_1A19F7FAC((uint64_t)v1);
}

uint64_t sub_1A1A0E930(uint64_t a1)
{

  return sub_1A1A057B8(a1);
}

_QWORD *sub_1A1A0E95C(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  a1[2] = 0;
  a1[2] = *(id *)(a2 + 16);
  return a1;
}

void sub_1A1A0E9AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1A1A057B8(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1A1A0E9C0(_QWORD *result, uint64_t a2)
{
  char **v3;
  unint64_t v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  int64x2_t v17;
  char *v18;
  char *v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v3 = (char **)result;
  v4 = result[2];
  v5 = result[1];
  if (v5 >= v4)
  {
    v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *result) >> 3);
    v8 = v7 + 1;
    if (v7 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1A1A0EB98();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *result) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v8 = 0xAAAAAAAAAAAAAAALL;
    v22 = result + 2;
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      sub_1A1A06064();
    v10 = 3 * v8;
    v11 = (char *)operator new(24 * v8);
    v12 = &v11[24 * v7];
    v19 = v11;
    v20.i64[0] = (uint64_t)v12;
    v13 = &v11[8 * v10];
    *(_OWORD *)v12 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *((_QWORD *)v12 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    v6 = v12 + 24;
    v20.i64[1] = (uint64_t)(v12 + 24);
    v21 = v13;
    v15 = *v3;
    v14 = (unint64_t)v3[1];
    if ((char *)v14 == *v3)
    {
      v17 = vdupq_n_s64(v14);
    }
    else
    {
      v16 = 0;
      do
      {
        sub_1A1A0E95C(&v12[v16 - 24], v14 + v16 - 24);
        v16 -= 24;
      }
      while ((char *)(v14 + v16) != v15);
      v17 = *(int64x2_t *)v3;
      v12 += v16;
      v6 = (char *)v20.i64[1];
      v13 = v21;
    }
    *v3 = v12;
    v3[1] = v6;
    v20 = v17;
    v18 = v3[2];
    v3[2] = v13;
    v21 = v18;
    v19 = (char *)v17.i64[0];
    result = (_QWORD *)sub_1A19F8D84((uint64_t)&v19);
  }
  else
  {
    *(_OWORD *)v5 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    v6 = (char *)(v5 + 24);
    result[1] = v5 + 24;
  }
  v3[1] = v6;
  return result;
}

uint64_t sub_1A1A0EB6C(uint64_t a1)
{

  return sub_1A1A057B8(a1);
}

void sub_1A1A0EB98()
{
  sub_1A1A05FF0("vector");
}

uint64_t sub_1A1A0EBAC(uint64_t a1, uint64_t a2, void *a3)
{
  return CLConnection::setHandlerForMessage(**(_QWORD **)(a1 + 32), a2, a3);
}

void sub_1A1A0EBB8(uint64_t a1)
{
  sub_1A19F6CDC(*(_QWORD *)(a1 + 32));
}

void sub_1A1A0EBC0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB108;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A1A0EBD0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB108;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1B0FFE8);
}

void sub_1A1A0EC00(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 24;
        sub_1A1A0EB6C(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t CLWriteStackshot(uint64_t a1, int a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint8_t v21[16];

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (qword_1ECE24E78)
    goto LABEL_2;
  v13 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_1ECE24E78 = (uint64_t)v13;
  if (v13)
  {
    off_1ECE24E70 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v13, "WriteStackshotReport");
    v14 = dlsym((void *)qword_1ECE24E78, "SimulateCrash");
    off_1ECE24E68 = v14;
    if (off_1ECE24E70)
    {
      if (v14)
        goto LABEL_2;
    }
    else
    {
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
      v20 = qword_1EE64C238;
      if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A19F4000, v20, OS_LOG_TYPE_FAULT, "CLWriteStackshotReport is NULL", v21, 2u);
      }
      if (off_1ECE24E68)
        goto LABEL_2;
    }
    if (qword_1EE64C240 != -1)
      dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
    v18 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "CLSimulateCrash is NULL";
      goto LABEL_53;
    }
  }
  else
  {
    if (qword_1EE64C240 != -1)
      dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
    v18 = qword_1EE64C238;
    if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "Unable to load CrashReporterSupport framework.";
LABEL_53:
      _os_log_impl(&dword_1A19F4000, v18, OS_LOG_TYPE_FAULT, v19, v21, 2u);
    }
  }
LABEL_2:
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a1, 4, *(_QWORD *)v21);
  v6 = v5;
  if (a2)
  {
    v7 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))off_1ECE24E68;
    if (off_1ECE24E68)
    {
      v8 = getpid();
      if (v7(v8, 3511749773, v6))
      {
        if (qword_1EE64C240 != -1)
          dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
        v9 = qword_1EE64C238;
        if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v21 = 0;
          v10 = "Simulated a crash";
LABEL_15:
          v11 = v9;
          v12 = OS_LOG_TYPE_DEBUG;
LABEL_38:
          _os_log_impl(&dword_1A19F4000, v11, v12, v10, v21, 2u);
          return objc_msgSend(v4, "drain", *(_QWORD *)v21);
        }
        return objc_msgSend(v4, "drain", *(_QWORD *)v21);
      }
      if (qword_1EE64C240 != -1)
        dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
      v16 = qword_1EE64C238;
      if (!os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(v4, "drain", *(_QWORD *)v21);
      *(_WORD *)v21 = 0;
      v10 = "#Warning Failed to simulate a crash";
LABEL_37:
      v11 = v16;
      v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_38;
    }
    if (qword_1EE64C240 != -1)
      dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
    v15 = qword_1EE64C238;
    if (!os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
      return objc_msgSend(v4, "drain", *(_QWORD *)v21);
    *(_WORD *)v21 = 0;
    v10 = "CLSimulateCrash is NULL";
LABEL_28:
    v11 = v15;
    v12 = OS_LOG_TYPE_FAULT;
    goto LABEL_38;
  }
  if (!off_1ECE24E70)
  {
    if (qword_1EE64C240 != -1)
      dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
    v15 = qword_1EE64C238;
    if (!os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_FAULT))
      return objc_msgSend(v4, "drain", *(_QWORD *)v21);
    *(_WORD *)v21 = 0;
    v10 = "CLWriteStackshotReport is NULL";
    goto LABEL_28;
  }
  if (!off_1ECE24E70(v5, 3511749773))
  {
    if (qword_1EE64C240 != -1)
      dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
    v16 = qword_1EE64C238;
    if (!os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_DEFAULT))
      return objc_msgSend(v4, "drain", *(_QWORD *)v21);
    *(_WORD *)v21 = 0;
    v10 = "#Warning Failed to write a stackshot";
    goto LABEL_37;
  }
  if (qword_1EE64C240 != -1)
    dispatch_once(&qword_1EE64C240, &unk_1E45FB6A0);
  v9 = qword_1EE64C238;
  if (os_log_type_enabled((os_log_t)qword_1EE64C238, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    v10 = "Wrote a stackshot";
    goto LABEL_15;
  }
  return objc_msgSend(v4, "drain", *(_QWORD *)v21);
}

os_log_t sub_1A1A0F0D0()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Support", "Support");
  qword_1EE64C238 = (uint64_t)result;
  return result;
}

uint64_t getActivityModelingZone()
{
  if (qword_1ECE24E88 != -1)
    dispatch_once(&qword_1ECE24E88, &unk_1E45FB6C0);
  return qword_1ECE24E80;
}

void sub_1A1A0F13C()
{
  qword_1ECE24E80 = (uint64_t)malloc_create_zone(0, 0);
  malloc_set_zone_name((malloc_zone_t *)qword_1ECE24E80, "ActivityModelingTokenZone");
}

_BYTE *placeActivityModelingToken(const char *a1, char a2)
{
  _BYTE *v4;

  if (qword_1ECE24E88 != -1)
    dispatch_once(&qword_1ECE24E88, &unk_1E45FB6C0);
  v4 = malloc_type_zone_malloc((malloc_zone_t *)qword_1ECE24E80, 0x10uLL, 0xA44C14F2uLL);
  *v4 = a2;
  strncpy(v4 + 1, a1, 0xFuLL);
  v4[15] = 0;
  return v4;
}

void sub_1A1A0F248(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24CD8);
  _Unwind_Resume(a1);
}

void sub_1A1A0F300(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24CD8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A0FC44(uint64_t a1)
{
  qword_1EE64C750 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("syncget_addenda")));
  return +[CLAutoCohortUtilities createDirectoryAtPath:](CLAutoCohortUtilities, "createDirectoryAtPath:", qword_1EE64C750);
}

uint64_t sub_1A1A10F10()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1 = +[CLAutoCohortUtilities getUnsafeEdges](CLAutoCohortUtilities, "getUnsafeEdges");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v0, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", 0)))
          objc_msgSend(v0, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E20], "set"), objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
        objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", 0)), "addObject:", objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  result = objc_msgSend(v0, "copy");
  qword_1ECE24E90 = result;
  return result;
}

void sub_1A1A11720(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cohort:%@"), *(_QWORD *)(a1 + 32));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v3 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v4, "UTF8String"), 0, *(dispatch_queue_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

id sub_1A1A117D8()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBBB0);
  return (id)qword_1ECE24CA8;
}

_BYTE *sub_1A1A11DBC(uint64_t a1)
{
  _BYTE *result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ack");
  result = *(_BYTE **)(a1 + 40);
  if (!result[16])
  {
    result = (_BYTE *)objc_msgSend(result, "shouldBeIdled");
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = 1;
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBBB0);
      v3 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_1A19F4000, v3, OS_LOG_TYPE_DEFAULT, "#Idleness, Silo is being idled: %@", (uint8_t *)&v5, 0xCu);
      }
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 40), "runIdleHandlers");
    }
  }
  return result;
}

BOOL sub_1A1A12200(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  long double v8;
  double v9;

  objc_msgSend(a2, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextFireDelayRaw");
  if (v3)
  {
    v5 = v4;
    if (v4 != 1.79769313e308)
    {
      v6 = *(double *)(a1 + 40);
      if (v6 >= v5)
      {
        objc_msgSend(v3, "fireInterval");
        v8 = v7;
        v9 = 1.79769313e308;
        if (v8 != 1.79769313e308)
          v9 = v8 - fmod(*(double *)(a1 + 40) - v5, v8);
        objc_msgSend(v3, "setNextFireDelay:", v9);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      }
      else
      {
        objc_msgSend(v3, "setNextFireDelay:", v5 - v6);
      }
    }
  }

  return v3 != 0;
}

uint64_t sub_1A1A12384(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setHandler:", 0);
}

uint64_t sub_1A1A12444(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ack");
}

void sub_1A1A124E8()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24D58;
  qword_1ECE24D58 = v0;

}

void sub_1A1A12514()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocationSupport", "Intersilo");
  v1 = (void *)qword_1ECE24CA8;
  qword_1ECE24CA8 = (uint64_t)v0;

}

id sub_1A1A12544()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FB720);
  return (id)qword_1ECE24CA8;
}

void sub_1A1A125C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1A1A125D8(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "valid");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "offsiloHandleInvocation:selectorInfo:peer:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 64), "delegateSilo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CLProfilingIdentifySiloInvocation((uint64_t)v4, *(void **)(a1 + 48));

      return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 48), sel_invokeWithTarget_);
    }
  }
  return result;
}

void sub_1A1A1265C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A1A12898(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB178;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A1A128A8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E45FB178;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1B0FFE8);
}

void sub_1A1A12B34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1A1A12B58()
{
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
  return (id)qword_1ECE24CA8;
}

void sub_1A1A12DD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A1A12E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A1A12EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A1A12F80(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)qword_1ECE24D10, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "residentCount") - 1;
    objc_msgSend(v3, "setResidentCount:", v4);
    if (!(_DWORD)v4)
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v5 = (id)qword_1ECE24CA8;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = 68289282;
        v7[1] = 0;
        v8 = 2082;
        v9 = &unk_1A1A18FAF;
        v10 = 2114;
        v11 = v6;
        _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking terminated\", \"silo\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);

      }
      objc_msgSend((id)qword_1ECE24D10, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
  }

}

void sub_1A1A130D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A1A130FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "synCount");
  v8 = v7 - objc_msgSend(v6, "ackCount");
  if (v8 < 0)
  {
    sub_1A1A12B58();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "0 <= dewrappedDeficit";
      _os_log_impl(&dword_1A19F4000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "0 <= dewrappedDeficit";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Deltafied deficit should be non-negative", "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "0 <= dewrappedDeficit";
      _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v22 = 192;
LABEL_33:

    v26 = v22;
    v27 = "validateTrackedSilos_block_invoke";
    v25 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
    abort_report_np();
    __break(1u);
LABEL_34:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    goto LABEL_13;
  }
  if (v8 >= 3)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v9 = (id)qword_1ECE24CA8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68289282;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Heartbeat underflow; going to crash now!\", \"silo\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    if (objc_msgSend(v6, "svcClass"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(v6, "svcClass"));
      goto LABEL_16;
    }
    sub_1A1A12B58();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "record.svcClass";
      _os_log_impl(&dword_1A19F4000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "record.svcClass";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only living, non-nil services should be heart-beaten", "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v29 = 0;
      v30 = 2082;
      v31 = &unk_1A1A18FAF;
      v32 = 2082;
      v33 = "assert";
      v34 = 2081;
      v35 = "record.svcClass";
      _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v22 = 208;
    goto LABEL_33;
  }
  if (v8 != 2)
    goto LABEL_16;
  if (qword_1ECE24CB0 != -1)
    goto LABEL_34;
LABEL_13:
  v14 = (id)qword_1ECE24CA8;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289538;
    v29 = 0;
    v30 = 2082;
    v31 = &unk_1A1A18FAF;
    v32 = 2114;
    v33 = v15;
    v34 = 1026;
    LODWORD(v35) = 2;
    _os_log_impl(&dword_1A19F4000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Heartbeat underflow\", \"silo\":%{public, location:escape_only}@, \"deficit\":%{public}d}", buf, 0x22u);

  }
LABEL_16:
  objc_msgSend(v6, "silo", v25, v26, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSuspended");

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v6, "syn");
    objc_msgSend(v6, "silo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heartBeat:", v6);

  }
}

void sub_1A1A13738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_1A1A13780(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void sub_1A1A137EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A1A13818()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t buf;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1A1A02A3C;
  v9 = sub_1A1A02A04;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A1A130FC;
  v4[3] = &unk_1E45FBCC0;
  v4[4] = &v5;
  objc_msgSend((id)qword_1ECE24D10, "enumerateKeysAndObjectsUsingBlock:", v4);
  v0 = (void *)v6[5];
  if (v0)
  {
    if (byte_1ECE24CB8)
    {
      CLWriteStackshot((uint64_t)"locationd: Heartbeat underflow", 0);
      v0 = (void *)v6[5];
    }
    objc_msgSend(v0, "sortUsingComparator:", &unk_1E45FBD00);
    objc_msgSend((id)v6[5], "addObject:", objc_opt_class());
    if (byte_1ECE24D01 == 1)
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v1 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
      {
        v2 = v6[5];
        buf = 68289282;
        v12 = 2082;
        v13 = &unk_1A1A18FAF;
        v14 = 2114;
        v15 = v2;
        _os_log_impl(&dword_1A19F4000, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"locationd remains non-fatally blocked because internal install\", \"ImplicatedServicesCurrently\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      byte_1ECE24D01 = 1;
      objc_msgSend((id)v6[5], "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "becameFatallyBlocked:index:", v6[5], 0);

    }
  }
  _Block_object_dispose(&v5, 8);

}

void sub_1A1A13A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  v21 = v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A13B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A1A13B88(uint64_t a1)
{
  double v1;
  double v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(double *)&qword_1ECE24CC0;
  byte_1ECE24CB8 = *(_BYTE *)(a1 + 40);
  v2 = *(double *)(a1 + 32);
  qword_1ECE24CC0 = *(_QWORD *)&v2;
  byte_1ECE24D00 = *(_BYTE *)(a1 + 41);
  if (*(_BYTE *)(a1 + 42))
  {
    if (v2 > 0.0)
    {
      v3 = (uint64_t)(v2 * 1000000000.0);
      v4 = qword_1ECE24D18;
      v5 = dispatch_time(0, v3);
      dispatch_source_set_timer(v4, v5, v3, v3);
      if (v1 <= 0.0)
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v12 = qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
        {
          v13 = 68289282;
          v14 = 0;
          v15 = 2082;
          v16 = &unk_1A1A18FAF;
          v17 = 2050;
          v18 = qword_1ECE24CC0;
          _os_log_impl(&dword_1A19F4000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking resumed\", \"interval\":\"%{public}f\"}", (uint8_t *)&v13, 0x1Cu);
        }
        dispatch_resume((dispatch_object_t)qword_1ECE24D18);
      }
      else
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v6 = qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
        {
          v13 = 68289282;
          v14 = 0;
          v15 = 2082;
          v16 = &unk_1A1A18FAF;
          v17 = 2050;
          v18 = qword_1ECE24CC0;
          v7 = "{\"msg%{public}.0s\":\"Heartbeat tracking already enabled\", \"interval\":\"%{public}f\"}";
          v8 = v6;
          v9 = 28;
LABEL_19:
          _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v13, v9);
          return;
        }
      }
      return;
    }
  }
  else
  {
    qword_1ECE24CC0 = 0;
  }
  if (v1 <= 0.0)
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v11 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = &unk_1A1A18FAF;
      v7 = "{\"msg%{public}.0s\":\"Heartbeat tracking already disabled\"}";
      v8 = v11;
      v9 = 18;
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v10 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = &unk_1A1A18FAF;
      _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking suspended\"}", (uint8_t *)&v13, 0x12u);
    }
    dispatch_suspend((dispatch_object_t)qword_1ECE24D18);
  }
}

void sub_1A1A14550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A1A14624(_QWORD *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1[4])
  {
    sub_1A1A12B58();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v47 = 0;
      v48 = 2082;
      v49 = &unk_1A1A18FAF;
      v50 = 2082;
      v51 = "assert";
      v52 = 2081;
      v53 = "remapping";
      _os_log_impl(&dword_1A19F4000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v36))
    {
      *(_DWORD *)buf = 68289539;
      v47 = 0;
      v48 = 2082;
      v49 = &unk_1A1A18FAF;
      v50 = 2082;
      v51 = "assert";
      v52 = 2081;
      v53 = "remapping";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Service replacement map must be non-nil if set", "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    sub_1A1A12B58();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v47 = 0;
      v48 = 2082;
      v49 = &unk_1A1A18FAF;
      v50 = 2082;
      v51 = "assert";
      v52 = 2081;
      v53 = "remapping";
      _os_log_impl(&dword_1A19F4000, v37, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v39 = 451;
    v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
    v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
    abort_report_np();
    goto LABEL_67;
  }
  v1 = a1;
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1[5] + 8), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)v1 + 5) + 24));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (!v5)
    goto LABEL_16;
  v6 = *(_QWORD *)v43;
  while (2)
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v43 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v9 = (id)qword_1ECE24CA8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v11 = *((_DWORD *)v1 + 12);
        *(_DWORD *)buf = 68289538;
        v47 = 0;
        v48 = 2082;
        v49 = &unk_1A1A18FAF;
        v50 = 2082;
        v51 = (const char *)v10;
        v52 = 1026;
        LODWORD(v53) = v11;
        _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"service replacement mapping\", \"literalSvcName\":%{public, location:escape_only}s, \"MissBehavior\":%{public}d}", buf, 0x22u);
      }

      sub_1A1A005C8(*((void **)v1 + 4), *((_DWORD *)v1 + 12), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1A1A005C8(*(void **)(*((_QWORD *)v1 + 5) + 16), *(_DWORD *)(*((_QWORD *)v1 + 5) + 40), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v12)
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v21 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_log_impl(&dword_1A19F4000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v22 = (id)qword_1ECE24CA8;
        if (os_signpost_enabled(v22))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Existing services must not fail to map under new mapping and behavior", "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v1 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_log_impl(&dword_1A19F4000, (os_log_t)v1, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        v23 = 464;
        goto LABEL_33;
      }
      if (!v13)
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v24 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_log_impl(&dword_1A19F4000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v25 = (id)qword_1ECE24CA8;
        if (os_signpost_enabled(v25))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test", "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v26 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = "assert";
          v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_log_impl(&dword_1A19F4000, v26, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        v39 = 465;
        v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
        v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
        abort_report_np();
LABEL_67:
        __break(1u);
LABEL_68:
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        goto LABEL_17;
      }
      if ((objc_msgSend(v13, "isEqual:", v12) & 1) == 0)
      {
        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v27 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v28 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          v29 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68290051;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = (const char *)v28;
          v52 = 2082;
          v53 = (const char *)v29;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_log_impl(&dword_1A19F4000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v30 = (id)qword_1ECE24CA8;
        if (os_signpost_enabled(v30))
        {
          v31 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          v32 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68290051;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = (const char *)v31;
          v52 = 2082;
          v53 = (const char *)v32;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_signpost_emit_with_name_impl(&dword_1A19F4000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Old and new mappings and behaviors must agree about any service which has started", "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }

        if (qword_1ECE24CB0 != -1)
          dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
        v1 = (id)qword_1ECE24CA8;
        if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_INFO))
        {
          v33 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          v34 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 68290051;
          v47 = 0;
          v48 = 2082;
          v49 = &unk_1A1A18FAF;
          v50 = 2082;
          v51 = (const char *)v33;
          v52 = 2082;
          v53 = (const char *)v34;
          v54 = 2082;
          v55 = "assert";
          v56 = 2081;
          v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_log_impl(&dword_1A19F4000, (os_log_t)v1, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }
        v23 = 466;
LABEL_33:

        v39 = v23;
        v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
        v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
        abort_report_np();
        goto LABEL_67;
      }

      ++v7;
    }
    while (v5 != v7);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    if (v5)
      continue;
    break;
  }
LABEL_16:

  if (qword_1ECE24CB0 != -1)
    goto LABEL_68;
LABEL_17:
  v15 = qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (const char *)*((_QWORD *)v1 + 4);
    v17 = *((_DWORD *)v1 + 12);
    *(_DWORD *)buf = 68289538;
    v47 = 0;
    v48 = 2082;
    v49 = &unk_1A1A18FAF;
    v50 = 2114;
    v51 = v16;
    v52 = 1026;
    LODWORD(v53) = v17;
    _os_log_impl(&dword_1A19F4000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Configuring service replacement map\", \"ReplacementMap\":%{public, location:escape_only}@, \"MissBehavior\":%{public}d}", buf, 0x22u);
  }
  v18 = objc_msgSend(*((id *)v1 + 4), "copy", v38, v39, v40);
  v19 = *((_QWORD *)v1 + 5);
  v20 = *(void **)(v19 + 16);
  *(_QWORD *)(v19 + 16) = v18;

  *(_DWORD *)(*((_QWORD *)v1 + 5) + 40) = *((_DWORD *)v1 + 12);
}

void sub_1A1A152A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1A1A15344(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  _QWORD v40[4];
  int8x16_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  os_activity_scope_state_s state;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
      v2 = qword_1ECE24CA8;
      if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
      {
        v3 = *(const char **)(a1 + 32);
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
        *(_DWORD *)buf = 68289538;
        v51 = 0;
        v52 = 2082;
        v53 = &unk_1A1A18FAF;
        v54 = 2114;
        v55 = v3;
        v56 = 2114;
        v57 = v4;
        _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Trying to start an unavailable service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"UnavailableServices\":%{public, location:escape_only}@}", buf, 0x26u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v11 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v47 != v13)
                objc_enumerationMutation(v11);
              v15 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(*(id *)(a1 + 72), "isEqual:", objc_opt_class()))
              {
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v16);
                if (qword_1ECE24CB0 != -1)
                  dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
                v17 = qword_1ECE24CA8;
                if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
                {
                  v18 = *(const char **)(a1 + 32);
                  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
                  *(_DWORD *)buf = 68289794;
                  v51 = 0;
                  v52 = 2082;
                  v53 = &unk_1A1A18FAF;
                  v54 = 2114;
                  v55 = v18;
                  v56 = 2114;
                  v57 = v19;
                  v58 = 2114;
                  v59 = v15;
                  _os_log_impl(&dword_1A19F4000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Reusing replacement service under new name\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@, \"ReusedFromServiceName\":%{public, location:escape_only}@}", buf, 0x30u);
                }

                goto LABEL_27;
              }

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_27:

        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v20)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v20, *(_QWORD *)(a1 + 32));
        }
        else
        {
          v21 = _os_activity_create(&dword_1A19F4000, "CL: #Manufacturing service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
          os_activity_scope_enter(v21, &state);
          if (qword_1ECE24CB0 != -1)
            dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
          v22 = qword_1ECE24CA8;
          if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
          {
            v23 = *(_QWORD *)(a1 + 32);
            v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            *(_DWORD *)buf = 68289794;
            v51 = 0;
            v52 = 2082;
            v53 = &unk_1A1A18FAF;
            v54 = 2082;
            v55 = "activity";
            v56 = 2114;
            v57 = v23;
            v58 = 2114;
            v59 = v24;
            _os_log_impl(&dword_1A19F4000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Manufacturing service\", \"event\":%{public, location:escape_only}s, \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x30u);
          }
          v25 = *(id *)(a1 + 48);
          v26 = MEMORY[0x1E0C809B0];
          if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
          {
            objc_msgSend(*(id *)(a1 + 48), "getTimeCoercibleVariantInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v42[0] = v26;
            v42[1] = 3221225472;
            v42[2] = sub_1A1A15AD4;
            v42[3] = &unk_1E45FBBD8;
            v25 = v27;
            v28 = *(_QWORD *)(a1 + 40);
            v43 = v25;
            v44 = v28;
            objc_msgSend(v25, "async:", v42);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v25);

          }
          v29 = objc_alloc_init(*(Class *)(a1 + 72));
          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v31 = *(void **)(v30 + 40);
          *(_QWORD *)(v30 + 40) = v29;

          v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v32)
          {
            objc_msgSend(v32, "setSilo:", v25);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setVendor:", *(_QWORD *)(a1 + 40));
            v40[0] = v26;
            v40[1] = 3221225472;
            v40[2] = sub_1A1A15AE4;
            v40[3] = &unk_1E45FBDD8;
            v41 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            objc_msgSend(v25, "async:", v40);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32));
            v33 = objc_opt_class();
            sub_1A19F6400(v33, *(void **)(a1 + 32));
          }
          else
          {
            sub_1A1A12B58();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              v35 = *(const char **)(a1 + 32);
              v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 68289538;
              v51 = 0;
              v52 = 2082;
              v53 = &unk_1A1A18FAF;
              v54 = 2114;
              v55 = v35;
              v56 = 2114;
              v57 = v36;
              _os_log_impl(&dword_1A19F4000, v34, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Failed to alloc and init key class for service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
            }

            sub_1A1A12B58();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v37))
            {
              v38 = *(const char **)(a1 + 32);
              v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 68289538;
              v51 = 0;
              v52 = 2082;
              v53 = &unk_1A1A18FAF;
              v54 = 2114;
              v55 = v38;
              v56 = 2114;
              v57 = v39;
              _os_signpost_emit_with_name_impl(&dword_1A19F4000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to alloc and init key class for service", "{\"msg%{public}.0s\":\"Failed to alloc and init key class for service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
            }

          }
          os_activity_scope_leave(&state);

        }
      }
    }
  }
  else
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v5 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(const char **)(a1 + 32);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 68289538;
      v51 = 0;
      v52 = 2082;
      v53 = &unk_1A1A18FAF;
      v54 = 2114;
      v55 = v6;
      v56 = 2114;
      v57 = v7;
      _os_log_impl(&dword_1A19F4000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Requested service not isSupported\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
  }
}

void sub_1A1A15A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,os_activity_scope_state_s state)
{
  void *v21;
  void *v22;

  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A15AD4(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_setLatchedAbsoluteTimestamp_);
}

void sub_1A1A15AE4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setValid:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "beginService");
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
  v2 = qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4[0] = 68289282;
    v4[1] = 0;
    v5 = 2082;
    v6 = &unk_1A1A18FAF;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1A19F4000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Manufacturing service complete\", \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)v4, 0x1Cu);
  }
}

void sub_1A1A15DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;

  v28 = v27;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A1A15E24(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v11;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)objc_opt_class();
  if (v5)
  {
    objc_msgSend(v5, "getSilo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = qword_1ECE24D08;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A1A12F80;
    block[3] = &unk_1E45FBC98;
    v11 = v6;
    v8 = v6;
    dispatch_barrier_async(v7, block);

  }
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
}

uint64_t sub_1A1A15EFC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "endService");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setValid:", 0);
}

void sub_1A1A16034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A16060(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  sub_1A1A005C8(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1A1A16154(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

void sub_1A1A16284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A1A16520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1A1A1655C(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_setLatchedAbsoluteTimestamp_);
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1E0D01678]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
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

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
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

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

void _Exit(int a1)
{
  MEMORY[0x1E0C80980](*(_QWORD *)&a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4708]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
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

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E45FA980(__p);
}

uint64_t operator delete()
{
  return off_1E45FA988();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E45FA990(__sz);
}

uint64_t operator new()
{
  return off_1E45FA998();
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x1E0C83ED8](zone, name);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F28](zone, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1E0DE80C0](proto, other);
}

uint64_t pthread_dependency_fulfill_np()
{
  return MEMORY[0x1E0C84D60]();
}

uint64_t pthread_dependency_init_np()
{
  return MEMORY[0x1E0C84D68]();
}

uint64_t pthread_dependency_wait_np()
{
  return MEMORY[0x1E0C84D70]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

int xpc_array_dup_fd(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E18](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_fd(xpc_object_t xarray, size_t index, int fd)
{
  MEMORY[0x1E0C85EB8](xarray, index, *(_QWORD *)&fd);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

