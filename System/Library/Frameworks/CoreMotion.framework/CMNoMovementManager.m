@implementation CMNoMovementManager

- (CMNoMovementManager)init
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMNoMovementManager;
  v2 = -[CMNoMovementManager init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMNoMovementManager", 0);
    sub_18F331ACC((uint64_t *)v2 + 1, 0);
  }
  return (CMNoMovementManager *)v2;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *fInternalQueue;
  objc_super v8;
  _QWORD block[5];

  dispatch_queue_set_specific((dispatch_queue_t)self->fInternalQueue, &unk_1EE16E718, &unk_1EE16E718, 0);
  if (dispatch_get_specific(&unk_1EE16E718) == &unk_1EE16E718)
  {
    objc_msgSend__disconnect(self, v3, v4, v5, v6);
  }
  else
  {
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F337BDC;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(fInternalQueue, block);
  }
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v8.receiver = self;
  v8.super_class = (Class)CMNoMovementManager;
  -[CMNoMovementManager dealloc](&v8, sel_dealloc);
}

+ (BOOL)isAvailable
{
  sub_18F1F77DC();
  return 0;
}

- (void)setDelegate:(id)a3
{
  NSObject *fInternalQueue;
  NSObject *v4;
  char *v5;
  _QWORD block[6];
  uint8_t buf[1640];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F337DC0;
  block[3] = &unk_1E29559D0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(fInternalQueue, block);
  if (qword_1EE16D968 != -1)
    dispatch_once(&qword_1EE16D968, &unk_1E2955068);
  v4 = qword_1EE16D970;
  if (os_log_type_enabled((os_log_t)qword_1EE16D970, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEBUG, "[CMNoMovementManager] set delegate", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D968 != -1)
      dispatch_once(&qword_1EE16D968, &unk_1E2955068);
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMNoMovementManager setDelegate:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
}

- (void)requestLatestStateUpdate
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F337E64;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_connect
{
  uint64_t v3;
  const char *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  char *v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  _QWORD v17[5];
  id v18;
  id location;
  void *__p[2];
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->fInternalQueue);
  if (!self->fLocationdConnection.__ptr_.__value_)
  {
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, self->fInternalQueue);
    if (v21 < 0)
      operator delete(__p[0]);
    sub_18F331ACC((uint64_t *)&self->fLocationdConnection, v3);
    objc_initWeak(&location, self);
    v17[1] = MEMORY[0x1E0C809B0];
    v17[2] = 3221225472;
    v17[3] = sub_18F33834C;
    v17[4] = &unk_1E29559F8;
    objc_copyWeak(&v18, &location);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(self->fLocationdConnection.__ptr_.__value_);
    v22 = CFSTR("kCLConnectionMessageSubscribeKey");
    v23[0] = MEMORY[0x1E0C9AAB0];
    v17[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v23, (uint64_t)&v22, 1);
    sub_18F338DB4(&v15, v17);
    v14 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v14)
    {
      v7 = (unint64_t *)&v14->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (qword_1EE16D968 != -1)
      dispatch_once(&qword_1EE16D968, &unk_1E2955068);
    v9 = qword_1EE16D970;
    if (os_log_type_enabled((os_log_t)qword_1EE16D970, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "[CMNoMovementManager] started connection", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D968 != -1)
        dispatch_once(&qword_1EE16D968, &unk_1E2955068);
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMNoMovementManager _connect]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)__p)
        free(v13);
    }
    v10 = v16;
    if (v16)
    {
      v11 = (unint64_t *)&v16->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)_disconnect
{
  const char *v3;
  uint64_t *p_fLocationdConnection;
  CLConnectionClient *value;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  uint8_t buf[1640];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->fInternalQueue);
  v20 = CFSTR("kCLConnectionMessageSubscribeKey");
  v21[0] = MEMORY[0x1E0C9AAA0];
  v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v21, (uint64_t)&v20, 1);
  sub_18F338DB4(&v16, &v18);
  value = self->fLocationdConnection.__ptr_.__value_;
  p_fLocationdConnection = (uint64_t *)&self->fLocationdConnection;
  if (value)
  {
    v15 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v15)
    {
      v8 = (unint64_t *)&v15->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  sub_18F331ACC(p_fLocationdConnection, 0);
  if (qword_1EE16D968 != -1)
    dispatch_once(&qword_1EE16D968, &unk_1E2955068);
  v10 = qword_1EE16D970;
  if (os_log_type_enabled((os_log_t)qword_1EE16D970, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "[CMNoMovementManager] ended connection", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D968 != -1)
      dispatch_once(&qword_1EE16D968, &unk_1E2955068);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMNoMovementManager _disconnect]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  v11 = v17;
  if (v17)
  {
    v12 = (unint64_t *)&v17->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  CLConnectionMessage *v10;
  objc_class *v11;
  uint64_t ObjectOfClass;
  NSObject *fInternalQueue;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  _QWORD block[6];
  int v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  var0 = (CLConnectionMessage **)a3.var0;
  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D968 != -1)
    dispatch_once(&qword_1EE16D968, &unk_1E2955068);
  v5 = qword_1EE16D970;
  if (os_log_type_enabled((os_log_t)qword_1EE16D970, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CLConnectionMessage::name(*var0);
    if (*(char *)(v6 + 23) >= 0)
      v7 = v6;
    else
      v7 = *(_QWORD *)v6;
    *(_DWORD *)buf = 136315138;
    v23 = v7;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[CMNoMovementManager] received message, now handling %s", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D968 != -1)
      dispatch_once(&qword_1EE16D968, &unk_1E2955068);
    v15 = CLConnectionMessage::name(*var0);
    if (*(char *)(v15 + 23) >= 0)
      v16 = v15;
    else
      v16 = *(_QWORD *)v15;
    v20 = 136315138;
    v21 = v16;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMNoMovementManager _handleMessage:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v8 = (_QWORD *)CLConnectionMessage::name(*var0);
  v9 = *((char *)v8 + 23);
  if (v9 < 0)
  {
    if (v8[1] != 43)
      return;
    v8 = (_QWORD *)*v8;
  }
  else if (v9 != 43)
  {
    return;
  }
  if (!memcmp(v8, "kCLConnectionMessageCheckInNoMovementUpdate", 0x2BuLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *var0;
      v11 = (objc_class *)objc_opt_class();
      ObjectOfClass = CLConnectionMessage::getObjectOfClass(v10, v11);
      fInternalQueue = self->fInternalQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_18F338C04;
      block[3] = &unk_1E29559D0;
      block[4] = self;
      block[5] = ObjectOfClass;
      dispatch_async(fInternalQueue, block);
    }
    else
    {
      if (qword_1EE16D968 != -1)
        dispatch_once(&qword_1EE16D968, &unk_1E2955068);
      v14 = qword_1EE16D970;
      if (os_log_type_enabled((os_log_t)qword_1EE16D970, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_ERROR, "[CMNoMovementManager] delegate does not respond to didStateUpdate", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D968 != -1)
          dispatch_once(&qword_1EE16D968, &unk_1E2955068);
        LOWORD(v20) = 0;
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMNoMovementManager _handleMessage:]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf)
          free(v18);
      }
    }
  }
}

- (CMNoMovementManagerDelegate)delegate
{
  return (CMNoMovementManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  sub_18F331ACC((uint64_t *)&self->fLocationdConnection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
