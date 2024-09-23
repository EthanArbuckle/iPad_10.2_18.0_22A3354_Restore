@implementation CMMagicMountManagerInternal

- (CMMagicMountManagerInternal)init
{
  CMMagicMountManagerInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMMagicMountManagerInternal;
  result = -[CMMagicMountManagerInternal init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_serviceEnabled = 256;
    result->_magicMountStateQueue = 0;
    result->_magicMountStateDispatcher = 0;
    result->_magicMountStateHandler = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMMagicMountManagerInternal;
  -[CMMagicMountManagerInternal dealloc](&v2, sel_dealloc);
}

- (void)teardownPrivate
{
  void *connection;
  uint64_t v4;

  connection = self->_connection;
  if (connection)
  {
    v4 = MEMORY[0x194001018](connection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
    self->_connection = 0;
  }

  self->_connectionQueue = 0;
}

- (void)connect
{
  void *v3;
  void *__p[2];
  char v5;

  if (!self->_connection)
  {
    self->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMMagicMountManager", 0);
    v3 = (void *)operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, self->_connectionQueue);
    self->_connection = v3;
    if (v5 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start((CLConnectionClient *)self->_connection);
    dispatch_sync((dispatch_queue_t)self->_connectionQueue, &unk_1E29548C8);
  }
}

- (void)sendServiceRequestPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 serviceEnabled;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  objc_msgSend_connect(self, v3, v4, v5, v6);
  serviceEnabled = self->_serviceEnabled;
  v23 = CFSTR("CMMagicMountServiceEnable");
  v24[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, serviceEnabled, v9, v10);
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v24, (uint64_t)&v23, 1);
  sub_18F40D5FC("kCLConnectionMessageMagicMountServiceRequest", &v22, &v20);
  v19 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v19)
  {
    v14 = (unint64_t *)&v19->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v16 = v21;
  if (v21)
  {
    v17 = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

- (void)sendAPWakesRequestPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 apWakesAllowed;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  char *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  uint8_t buf[4];
  _BOOL4 v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  objc_msgSend_connect(self, v3, v4, v5, v6);
  apWakesAllowed = self->_apWakesAllowed;
  v29 = CFSTR("CMMagicMountAPWakesAllowed");
  v30[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, apWakesAllowed, v9, v10);
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v30, (uint64_t)&v29, 1);
  sub_18F40D5FC("kCLConnectionMessageMagicMountAPWakesAllowed", &v24, &v22);
  if (qword_1EE16D808 != -1)
    dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
  v12 = qword_1EE16D810;
  if (os_log_type_enabled((os_log_t)qword_1EE16D810, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    v28 = apWakesAllowed;
    _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEBUG, "Sending AP wakes request, allowed =  %{public}d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D808 != -1)
      dispatch_once(&qword_1EE16D808, &unk_1E2958F38);
    v25 = 67240192;
    v26 = apWakesAllowed;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMagicMountManagerInternal sendAPWakesRequestPrivate]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
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

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
