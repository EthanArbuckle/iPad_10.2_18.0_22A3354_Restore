@implementation CLMiLoConnectionInternal

- (CLMiLoConnectionInternal)initWithInfo:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  CLMiLoConnectionInternal *v8;
  CLMiLoConnectionInternal *v9;
  uint64_t v10;
  id v12;
  id location[6];
  void *__p[2];
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLMiLoConnectionInternal;
  v8 = -[CLMiLoConnectionInternal init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLMiLoConnectionDelegate *)a4;
    if (a5)
    {
      v8->_delegateQueue = (OS_dispatch_queue *)a5;
      dispatch_retain((dispatch_object_t)a5);
    }
    else
    {
      v8->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MiLoConnection.privateQueue", 0);
    }
    v9->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MiLoConnection.internalQueue", 0);
    v9->_sender = (CLMiLoConnection *)a3;
    v9->_connectedServiceIdentifier = 0;
    v10 = operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v10, __p, v9->_internalQueue);
    v9->_locationdConnection = (void *)v10;
    if (v15 < 0)
      operator delete(__p[0]);
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = sub_18F70A7DC;
    location[4] = &unk_1E2992D38;
    location[5] = v9;
    CLConnectionClient::setDefaultMessageHandler();
    objc_initWeak(location, v9);
    objc_copyWeak(&v12, location);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start((CLConnectionClient *)v9->_locationdConnection);
    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  return v9;
}

+ (BOOL)_isKnownNonActionableMessage:(void *)a3
{
  const std::string *v4;
  const std::string *v5;
  BOOL result;

  result = 0;
  if (a3)
  {
    v4 = (const std::string *)CLConnectionMessage::name((CLConnectionMessage *)a3);
    if (!std::string::compare(v4, "LocationManager/kCLConnectionMessageRegistration"))
      return 1;
    v5 = (const std::string *)CLConnectionMessage::name((CLConnectionMessage *)a3);
    if (!std::string::compare(v5, "kCLConnectionMessageAuthorizationStatus"))
      return 1;
  }
  return result;
}

- (void)_invalidateLocationClient
{
  NSObject *v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_locationdConnection)
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v3 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      v6 = 2082;
      v7 = "";
      _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"invalidating location client...\"}", (uint8_t *)v5, 0x12u);
    }
    CLConnectionClient::setInterruptionHandler();
    if (self->_locationdConnection)
    {
      v4 = MEMORY[0x194002B2C]();
      MEMORY[0x194002D30](v4, 0xB0C40BC2CC919);
    }
    self->_locationdConnection = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_delegateQueue);
  dispatch_release((dispatch_object_t)self->_internalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoConnectionInternal;
  -[CLMiLoConnectionInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSUUID *connectedServiceIdentifier;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD v25[2];
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v25[0] = 68289282;
    v25[1] = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2082;
    v29 = objc_msgSend_UTF8String(v7, v8, v9, v10);
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"tearing down:\", \"class\":%{public, location:escape_only}s}", (uint8_t *)v25, 0x1Cu);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    objc_msgSend__disconnectServiceWithIdentifier_(self, v4, (uint64_t)connectedServiceIdentifier, v5);

    self->_connectedServiceIdentifier = 0;
    objc_msgSend__unsetHandlerForMiLoPredictionEvents(self, v12, v13, v14);
  }
  objc_msgSend__unregisterForMiloServiceEvents(self, v4, (uint64_t)connectedServiceIdentifier, v5);
  objc_msgSend__unregisterForMiLoDebugResponseEvents(self, v15, v16, v17);
  objc_msgSend__unregisterForMiLoConnectionStatusEvents(self, v18, v19, v20);
  objc_msgSend__unregisterForMiLoGenericEvents(self, v21, v22, v23);
  if (self->_locationdConnection)
  {
    v24 = MEMORY[0x194002B2C]();
    MEMORY[0x194002D30](v24, 0xB0C40BC2CC919);
  }
  self->_locationdConnection = 0;
}

- (void)_registerForMiLoServiceEvents
{
  NSObject *v3;
  const char *v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  _QWORD v13[6];
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[8];
  _BYTE v17[10];
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    *(_WORD *)v17 = 2082;
    *(_QWORD *)&v17[2] = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"registering for kCLConnectionMessageMiLoServiceEvent\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoServiceEvent");
    v13[1] = MEMORY[0x1E0C809B0];
    v13[2] = 3221225472;
    v13[3] = sub_18F70B378;
    v13[4] = &unk_1E2992D38;
    v13[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v18 < 0)
      operator delete(*(void **)buf);
    v14 = CFSTR("kCLConnectionMessageSubscribeKey");
    v15 = MEMORY[0x1E0C9AAB0];
    v13[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)&v15, (uint64_t)&v14, 1);
    sub_18F71A60C(buf, v13);
    v12 = *(std::__shared_weak_count **)v17;
    if (*(_QWORD *)v17)
    {
      v5 = (unint64_t *)(*(_QWORD *)v17 + 8);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }
    CLConnectionClient::sendMessage();
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v9 = *(std::__shared_weak_count **)v17;
    if (*(_QWORD *)v17)
    {
      v10 = (unint64_t *)(*(_QWORD *)v17 + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

- (void)_unregisterForMiloServiceEvents
{
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint8_t buf[8];
  _BYTE v18[10];
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self->_locationdConnection != 0;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v18 = 2082;
    *(_QWORD *)&v18[2] = "";
    v19 = 1026;
    v20 = v4;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"unregistering for kCLConnectionMessageMiLoServiceEvent\", \"Locationd Connection valid\":%{public}hhd}", buf, 0x18u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoServiceEvent");
    CLConnectionClient::setHandlerForMessage();
    if (SHIBYTE(v20) < 0)
      operator delete(*(void **)buf);
    v15 = CFSTR("kCLConnectionMessageSubscribeKey");
    v16 = MEMORY[0x1E0C9AAA0];
    v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)&v16, (uint64_t)&v15, 1);
    sub_18F71A60C(buf, &v14);
    v13 = *(std::__shared_weak_count **)v18;
    if (*(_QWORD *)v18)
    {
      v6 = (unint64_t *)(*(_QWORD *)v18 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    CLConnectionClient::sendMessage();
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v10 = *(std::__shared_weak_count **)v18;
    if (*(_QWORD *)v18)
    {
      v11 = (unint64_t *)(*(_QWORD *)v18 + 8);
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
}

- (void)_setHandlerForMiLoPredictionEvents
{
  NSObject *v3;
  uint8_t buf[8];
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoPredictionEventUpdate\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoPredictionEventUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(*(void **)buf);
  }
}

- (void)_unsetHandlerForMiLoPredictionEvents
{
  NSObject *v3;
  void *__p;
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageRegisterMiLoPredictionEvent\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(&__p, "kCLConnectionMessageMiLoPredictionEventUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(__p);
  }
}

- (void)_registerForMiLoDebugResponseEvents
{
  NSObject *v3;
  uint8_t buf[8];
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoServiceDebugResponse\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoServiceDebugResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(*(void **)buf);
  }
}

- (void)_unregisterForMiLoDebugResponseEvents
{
  NSObject *v3;
  void *__p;
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoServiceDebugResponse\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(&__p, "kCLConnectionMessageMiLoServiceDebugResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(__p);
  }
}

- (void)_registerForMiLoGenericEvents
{
  NSObject *v3;
  uint8_t buf[8];
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"set handler for kCLConnectionMessageMiLoGenericEventResponse\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoGenericEventResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(*(void **)buf);
  }
}

- (void)_unregisterForMiLoGenericEvents
{
  NSObject *v3;
  void *__p;
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoGenericEventResponse\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(&__p, "kCLConnectionMessageMiLoGenericEventResponse");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(__p);
  }
}

- (void)_registerForMiLoConnectionStatusEvents
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint8_t buf[8];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "set handler for kCLConnectionMessageMiLoConnectionStatusEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _registerForMiLoConnectionStatusEvents]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoConnectionStatusEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v9 < 0)
      operator delete(*(void **)buf);
    objc_msgSend__queryMiLoConnectionStatus(self, v4, v5, v6);
  }
}

- (void)_unregisterForMiLoConnectionStatusEvents
{
  NSObject *v3;
  void *__p;
  __int16 v5;
  const char *v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    __p = (void *)68289026;
    v5 = 2082;
    v6 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"unset handler for kCLConnectionMessageMiLoConnectionStatusEvent\"}", (uint8_t *)&__p, 0x12u);
  }
  if (self->_locationdConnection)
  {
    sub_18F5D5990(&__p, "kCLConnectionMessageMiLoConnectionStatusEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(__p);
  }
}

- (void)_notifyClientDidUpdateMiLoConnectionStatus:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CAB4;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidUpdateServiceStatus:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CB38;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidCreateServiceWithServiceIdentifier:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CBBC;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientCreateServiceDidFailWithError:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CC40;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDeleteServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4
{
  NSObject *delegateQueue;
  _QWORD block[7];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F70CCD4;
    block[3] = &unk_1E29911F8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidDeleteServiceWithServiceIdentifier:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CD60;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDidFindMyServicesWithServiceDescriptors:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CDE4;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientConnectServiceDidFailWithServiceIdentifier:(id)a3 withError:(id)a4
{
  NSObject *delegateQueue;
  _QWORD block[7];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F70CE78;
    block[3] = &unk_1E29911F8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidUpdatePrediction:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CF04;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientQueryServiceDidFailWithError:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70CF88;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientDisconnectServiceDidFailWithError:(id)a3 serviceIdentifier:(id)a4
{
  NSObject *delegateQueue;
  _QWORD block[7];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F70D01C;
    block[3] = &unk_1E29911F8;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidCompleteClientRequest:(id)a3 withError:(id)a4
{
  NSObject *delegateQueue;
  _QWORD block[7];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F70D0B8;
    block[3] = &unk_1E29911F8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(delegateQueue, block);
  }
}

- (void)_notifyClientDidExportDatabaseWithResponse:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70D144;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientOfGenericEventResponse:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70D22C;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientQueryMiLoConnectionStatusDidFailWithError:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70D308;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_notifyClientRecordingMetaInfo:(id)a3
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F70D38C;
    v6[3] = &unk_1E2991118;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(delegateQueue, v6);
  }
}

- (void)_handleDaemonEvent:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  CLMiLoServiceStatus *v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  NSObject *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  NSObject *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSObject *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  NSObject *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  void *v200;
  NSObject *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  NSObject *v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  NSObject *v240;
  const char *v241;
  uint64_t v242;
  const char *v243;
  void *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  const char *v250;
  uint64_t v251;
  const char *v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  NSObject *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  NSObject *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  NSObject *v300;
  NSObject *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  unint64_t v310;
  const char *v311;
  uint64_t v312;
  const char *v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  NSObject *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  NSObject *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  NSObject *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  NSObject *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  NSObject *v368;
  const char *v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  void *v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  unint64_t v380;
  const char *v381;
  uint64_t v382;
  const char *v383;
  void *v384;
  NSObject *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  unint64_t v411;
  const char *v412;
  uint64_t v413;
  const char *v414;
  void *v415;
  NSObject *v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  NSObject *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  NSObject *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  const char *v446;
  uint64_t v447;
  NSObject *v448;
  NSObject *v449;
  NSObject *v450;
  NSObject *v451;
  NSObject *v452;
  NSObject *v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  NSObject *v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  NSObject *v470;
  char *v471;
  char *v472;
  char *v473;
  char *v474;
  char *v475;
  char *v476;
  char *v477;
  uint64_t v478;
  const __CFString *v479;
  uint64_t v480;
  const __CFString *v481;
  uint64_t v482;
  const __CFString *v483;
  uint64_t v484;
  const __CFString *v485;
  uint64_t v486;
  const __CFString *v487;
  uint64_t v488;
  const __CFString *v489;
  uint64_t v490;
  const __CFString *v491;
  uint64_t v492;
  const __CFString *v493;
  uint64_t v494;
  const __CFString *v495;
  uint8_t buf[4];
  int v497;
  __int16 v498;
  const char *v499;
  __int16 v500;
  uint64_t v501;
  __int16 v502;
  uint64_t v503;
  __int16 v504;
  uint64_t v505;
  uint64_t v506;

  v506 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, _handleDaemonEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v472 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v472);
    if (v472 != (char *)buf)
      free(v472);
  }
  if (self->_delegate)
  {
    if (a3)
    {
      if (objc_msgSend_objectForKeyedSubscript_(a3, v6, 0x1E2997748, v7))
      {
        v10 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v8, 0x1E2997748, v9);
        v14 = objc_msgSend_integerValue(v10, v11, v12, v13);
        v17 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v15, 0x1E2997768, v16);
        v21 = v17;
        switch(v14)
        {
          case 1:
            v22 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v18, 0x1E2997788, v20);
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v23 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              v27 = (void *)objc_msgSend_UUIDString(v22, v24, v25, v26);
              v31 = objc_msgSend_UTF8String(v27, v28, v29, v30);
              *(_DWORD *)buf = 68289282;
              v497 = 0;
              v498 = 2082;
              v499 = "";
              v500 = 2082;
              v501 = v31;
              _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"create service success\", \"service identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            }
            objc_msgSend__notifyClientDidCreateServiceWithServiceIdentifier_(self, v24, (uint64_t)v22, v26);
            return;
          case 2:
            if (v17)
            {
              v71 = (void *)MEMORY[0x1E0CB35C8];
              v72 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v492 = *MEMORY[0x1E0CB2D50];
              v76 = objc_msgSend_integerValue(v21, v73, v74, v75);
              v493 = sub_18F70ADE4(v76);
              v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v77, (uint64_t)&v493, (uint64_t)&v492, 1);
              v80 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v71, v79, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v72, v78);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v81 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v85 = objc_msgSend_integerValue(v21, v82, v83, v84);
                v89 = (void *)objc_msgSend_localizedDescription(v80, v86, v87, v88);
                v93 = objc_msgSend_UTF8String(v89, v90, v91, v92);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v85;
                v502 = 2082;
                v503 = v93;
                _os_log_impl(&dword_18F5B3000, v81, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"create service fail\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v94 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v98 = objc_msgSend_integerValue(v21, v95, v96, v97);
                v102 = (void *)objc_msgSend_localizedDescription(v80, v99, v100, v101);
                v106 = objc_msgSend_UTF8String(v102, v103, v104, v105);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v98;
                v502 = 2082;
                v503 = v106;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v94, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "create service fail", "{\"msg%{public}.0s\":\"create service fail\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              objc_msgSend__notifyClientCreateServiceDidFailWithError_(self, v95, (uint64_t)v80, v97);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v448 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v448, OS_LOG_TYPE_FAULT, "create service failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
                  goto LABEL_234;
                goto LABEL_201;
              }
            }
            return;
          case 3:
            v107 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v18, 0x1E2997788, v20);
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v108 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              v112 = (void *)objc_msgSend_UUIDString(v107, v109, v110, v111);
              v116 = objc_msgSend_UTF8String(v112, v113, v114, v115);
              *(_DWORD *)buf = 68289282;
              v497 = 0;
              v498 = 2082;
              v499 = "";
              v500 = 2082;
              v501 = v116;
              _os_log_impl(&dword_18F5B3000, v108, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"delete service success\", \"service identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
            }
            objc_msgSend__notifyClientDidDeleteServiceWithServiceIdentifier_(self, v109, (uint64_t)v107, v111);
            return;
          case 4:
            if (v17)
            {
              v117 = (void *)MEMORY[0x1E0CB35C8];
              v118 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v490 = *MEMORY[0x1E0CB2D50];
              v122 = objc_msgSend_integerValue(v21, v119, v120, v121);
              v491 = sub_18F70ADE4(v122);
              v124 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v123, (uint64_t)&v491, (uint64_t)&v490, 1);
              v126 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v117, v125, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v118, v124);
              v129 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v127, 0x1E2997788, v128);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v130 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v134 = objc_msgSend_integerValue(v21, v131, v132, v133);
                v138 = (void *)objc_msgSend_localizedDescription(v126, v135, v136, v137);
                v142 = objc_msgSend_UTF8String(v138, v139, v140, v141);
                v146 = (void *)objc_msgSend_UUIDString(v129, v143, v144, v145);
                v150 = objc_msgSend_UTF8String(v146, v147, v148, v149);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v134;
                v502 = 2082;
                v503 = v142;
                v504 = 2082;
                v505 = v150;
                _os_log_impl(&dword_18F5B3000, v130, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"delete service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v151 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v155 = objc_msgSend_integerValue(v21, v152, v153, v154);
                v159 = (void *)objc_msgSend_localizedDescription(v126, v156, v157, v158);
                v163 = objc_msgSend_UTF8String(v159, v160, v161, v162);
                v167 = (void *)objc_msgSend_UUIDString(v129, v164, v165, v166);
                v171 = objc_msgSend_UTF8String(v167, v168, v169, v170);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v155;
                v502 = 2082;
                v503 = v163;
                v504 = 2082;
                v505 = v171;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v151, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delete service failed", "{\"msg%{public}.0s\":\"delete service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              objc_msgSend__notifyClientDeleteServiceDidFailWithServiceIdentifier_withError_(self, v152, (uint64_t)v129, (uint64_t)v126);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v449 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v449, OS_LOG_TYPE_FAULT, "delete service failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
                  goto LABEL_234;
                goto LABEL_201;
              }
            }
            return;
          case 5:
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v172 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v172, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleQueryMyServices", buf, 2u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v474 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v474);
              if (v474 != (char *)buf)
                free(v474);
            }
            v175 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v173, 0x1E29977A8, v174);
            v178 = (void *)objc_msgSend_valueForKey_(v175, v176, (uint64_t)CFSTR("serviceIdentifier"), v177);
            v181 = (void *)objc_msgSend_componentsJoinedByString_(v178, v179, (uint64_t)CFSTR(", "), v180);
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v182 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              v186 = objc_msgSend_count(v175, v183, v184, v185);
              v190 = objc_msgSend_UTF8String(v181, v187, v188, v189);
              *(_DWORD *)buf = 68289538;
              v497 = 0;
              v498 = 2082;
              v499 = "";
              v500 = 2050;
              v501 = v186;
              v502 = 2082;
              v503 = v190;
              _os_log_impl(&dword_18F5B3000, v182, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"query services success\", \"size\":%{public}ld, \"service descriptors\":%{public, location:escape_only}s}", buf, 0x26u);
            }
            objc_msgSend__notifyClientDidFindMyServicesWithServiceDescriptors_(self, v183, (uint64_t)v175, v185);
            return;
          case 6:
            if (v17)
            {
              v191 = (void *)MEMORY[0x1E0CB35C8];
              v192 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v488 = *MEMORY[0x1E0CB2D50];
              v196 = objc_msgSend_integerValue(v21, v193, v194, v195);
              v489 = sub_18F70ADE4(v196);
              v198 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v197, (uint64_t)&v489, (uint64_t)&v488, 1);
              v200 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v191, v199, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v192, v198);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v201 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v205 = objc_msgSend_integerValue(v21, v202, v203, v204);
                v209 = (void *)objc_msgSend_localizedDescription(v200, v206, v207, v208);
                v213 = objc_msgSend_UTF8String(v209, v210, v211, v212);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v205;
                v502 = 2082;
                v503 = v213;
                _os_log_impl(&dword_18F5B3000, v201, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"query services failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v214 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v218 = objc_msgSend_integerValue(v21, v215, v216, v217);
                v222 = (void *)objc_msgSend_localizedDescription(v200, v219, v220, v221);
                v226 = objc_msgSend_UTF8String(v222, v223, v224, v225);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v218;
                v502 = 2082;
                v503 = v226;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v214, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "query services failed", "{\"msg%{public}.0s\":\"query services failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              objc_msgSend__notifyClientQueryServiceDidFailWithError_(self, v215, (uint64_t)v200, v217);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v450 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v450, OS_LOG_TYPE_FAULT, "query services failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
                  goto LABEL_234;
                goto LABEL_201;
              }
            }
            return;
          case 7:
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v227 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v227, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleServiceStatusChanged", buf, 2u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v475 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v475);
              if (v475 != (char *)buf)
                free(v475);
            }
            v230 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v228, 0x1E29977C8, v229);
            if (objc_msgSend_serviceState(v230, v231, v232, v233))
            {
              if (objc_msgSend_serviceState(v230, v234, v235, v236) == 2)
              {
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v240 = qword_1EE1720C0;
                if (!os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_209;
                *(_DWORD *)buf = 68289026;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v243 = "{\"msg%{public}.0s\":\"service state: invalidated\"}";
              }
              else
              {
                if (objc_msgSend_serviceState(v230, v237, v238, v239) != 1)
                  goto LABEL_209;
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v240 = qword_1EE1720C0;
                if (!os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_209;
                *(_DWORD *)buf = 68289026;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v243 = "{\"msg%{public}.0s\":\"service state: suspended\"}";
              }
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v240 = qword_1EE1720C0;
              if (!os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
                goto LABEL_209;
              *(_DWORD *)buf = 68289026;
              v497 = 0;
              v498 = 2082;
              v499 = "";
              v243 = "{\"msg%{public}.0s\":\"service state: running\"}";
            }
            _os_log_impl(&dword_18F5B3000, v240, OS_LOG_TYPE_DEFAULT, v243, buf, 0x12u);
LABEL_209:
            objc_msgSend__notifyClientDidUpdateServiceStatus_(self, v241, (uint64_t)v230, v242);
            return;
          case 8:
            if (v17)
            {
              v244 = (void *)MEMORY[0x1E0CB35C8];
              v245 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v486 = *MEMORY[0x1E0CB2D50];
              v249 = objc_msgSend_integerValue(v21, v246, v247, v248);
              v487 = sub_18F70ADE4(v249);
              v251 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v250, (uint64_t)&v487, (uint64_t)&v486, 1);
              v253 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v244, v252, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v245, v251);
              v256 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v254, 0x1E2997788, v255);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v257 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v261 = objc_msgSend_integerValue(v21, v258, v259, v260);
                v265 = (void *)objc_msgSend_localizedDescription(v253, v262, v263, v264);
                v269 = objc_msgSend_UTF8String(v265, v266, v267, v268);
                v273 = (void *)objc_msgSend_UUIDString(v256, v270, v271, v272);
                v277 = objc_msgSend_UTF8String(v273, v274, v275, v276);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v261;
                v502 = 2082;
                v503 = v269;
                v504 = 2082;
                v505 = v277;
                _os_log_impl(&dword_18F5B3000, v257, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"connect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v278 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v282 = objc_msgSend_integerValue(v21, v279, v280, v281);
                v286 = (void *)objc_msgSend_localizedDescription(v253, v283, v284, v285);
                v290 = objc_msgSend_UTF8String(v286, v287, v288, v289);
                v294 = (void *)objc_msgSend_UUIDString(v256, v291, v292, v293);
                v298 = objc_msgSend_UTF8String(v294, v295, v296, v297);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v282;
                v502 = 2082;
                v503 = v290;
                v504 = 2082;
                v505 = v298;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v278, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "connect to service failed", "{\"msg%{public}.0s\":\"connect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              if (objc_msgSend_isEqual_(v256, v279, (uint64_t)self->_connectedServiceIdentifier, v281))
              {
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v300 = qword_1EE1720C0;
                if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  v497 = 0;
                  v498 = 2082;
                  v499 = "";
                  _os_log_impl(&dword_18F5B3000, v300, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service failed, clear connectedServiceIdentifier\"}", buf, 0x12u);
                }

                self->_connectedServiceIdentifier = 0;
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v301 = qword_1EE1720C0;
                if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  v497 = 0;
                  v498 = 2082;
                  v499 = "";
                  _os_log_impl(&dword_18F5B3000, v301, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service failed, unset handler for prediction events\"}", buf, 0x12u);
                }
                objc_msgSend__unsetHandlerForMiLoPredictionEvents(self, v302, v303, v304);
              }
              objc_msgSend__notifyClientConnectServiceDidFailWithServiceIdentifier_withError_(self, v299, (uint64_t)v256, (uint64_t)v253);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v451 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v451, OS_LOG_TYPE_FAULT, "connect service failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
                  goto LABEL_234;
                goto LABEL_201;
              }
            }
            return;
          case 9:
            if (v17)
            {
              v305 = (void *)MEMORY[0x1E0CB35C8];
              v306 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v484 = *MEMORY[0x1E0CB2D50];
              v310 = objc_msgSend_integerValue(v21, v307, v308, v309);
              v485 = sub_18F70ADE4(v310);
              v312 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v311, (uint64_t)&v485, (uint64_t)&v484, 1);
              v314 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v305, v313, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v306, v312);
              v317 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v315, 0x1E2997788, v316);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v318 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v322 = objc_msgSend_integerValue(v21, v319, v320, v321);
                v326 = (void *)objc_msgSend_localizedDescription(v314, v323, v324, v325);
                v330 = objc_msgSend_UTF8String(v326, v327, v328, v329);
                v334 = (void *)objc_msgSend_UUIDString(v317, v331, v332, v333);
                v338 = objc_msgSend_UTF8String(v334, v335, v336, v337);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v322;
                v502 = 2082;
                v503 = v330;
                v504 = 2082;
                v505 = v338;
                _os_log_impl(&dword_18F5B3000, v318, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"disconnect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v339 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v343 = objc_msgSend_integerValue(v21, v340, v341, v342);
                v347 = (void *)objc_msgSend_localizedDescription(v314, v344, v345, v346);
                v351 = objc_msgSend_UTF8String(v347, v348, v349, v350);
                v355 = (void *)objc_msgSend_UUIDString(v317, v352, v353, v354);
                v359 = objc_msgSend_UTF8String(v355, v356, v357, v358);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v343;
                v502 = 2082;
                v503 = v351;
                v504 = 2082;
                v505 = v359;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v339, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "disconnect to service failed", "{\"msg%{public}.0s\":\"disconnect to service failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s, \"service id\":%{public, location:escape_only}s}", buf, 0x30u);
              }
              if (!self->_connectedServiceIdentifier)
              {
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v360 = qword_1EE1720C0;
                if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  v497 = 0;
                  v498 = 2082;
                  v499 = "";
                  _os_log_impl(&dword_18F5B3000, v360, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service failed, reset connectedServiceIdentifier\"}", buf, 0x12u);
                }
                self->_connectedServiceIdentifier = (NSUUID *)objc_msgSend_copy(v317, v361, v362, v363);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
                v364 = qword_1EE1720C0;
                if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 68289026;
                  v497 = 0;
                  v498 = 2082;
                  v499 = "";
                  _os_log_impl(&dword_18F5B3000, v364, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service failed, set handler for prediction events\"}", buf, 0x12u);
                }
                objc_msgSend__setHandlerForMiLoPredictionEvents(self, v365, v366, v367);
              }
              objc_msgSend__notifyClientDisconnectServiceDidFailWithError_serviceIdentifier_(self, v340, (uint64_t)v314, (uint64_t)v317);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v452 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v452, OS_LOG_TYPE_FAULT, "connect to service failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
                  goto LABEL_234;
                goto LABEL_201;
              }
            }
            return;
          case 10:
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v368 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v368, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleDidCompleteClientRequest", buf, 2u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v476 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v476);
              if (v476 != (char *)buf)
                free(v476);
            }
            v374 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v369, 0x1E2997808, v370);
            if (v21)
            {
              v375 = (void *)MEMORY[0x1E0CB35C8];
              v376 = objc_msgSend_integerValue(v21, v371, v372, v373);
              v482 = *MEMORY[0x1E0CB2D50];
              v380 = objc_msgSend_integerValue(v21, v377, v378, v379);
              v483 = sub_18F70ADE4(v380);
              v382 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v381, (uint64_t)&v483, (uint64_t)&v482, 1);
              v384 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v375, v383, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v376, v382);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v385 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
              {
                v389 = (void *)objc_msgSend_UUIDString(v374, v386, v387, v388);
                v393 = objc_msgSend_UTF8String(v389, v390, v391, v392);
                v397 = objc_msgSend_integerValue(v21, v394, v395, v396);
                v401 = (void *)objc_msgSend_localizedDescription(v384, v398, v399, v400);
                v405 = objc_msgSend_UTF8String(v401, v402, v403, v404);
                *(_DWORD *)buf = 68289794;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2082;
                v501 = v393;
                v502 = 2050;
                v503 = v397;
                v504 = 2082;
                v505 = v405;
                _os_log_impl(&dword_18F5B3000, v385, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"client request complete with status code\", \"request id\":%{public, location:escape_only}s, \"status code\":%{public}ld, \"status message\":%{public, location:escape_only}s}", buf, 0x30u);
              }
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v453 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v457 = (void *)objc_msgSend_UUIDString(v374, v454, v455, v456);
                v461 = objc_msgSend_UTF8String(v457, v458, v459, v460);
                *(_DWORD *)buf = 68289282;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2082;
                v501 = v461;
                _os_log_impl(&dword_18F5B3000, v453, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"client request complete without status code\", \"request id\":%{public, location:escape_only}s}", buf, 0x1Cu);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v462 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v465 = (void *)objc_msgSend_UUIDString(v374, v386, v463, v464);
                v469 = objc_msgSend_UTF8String(v465, v466, v467, v468);
                *(_DWORD *)buf = 68289282;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2082;
                v501 = v469;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v462, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "client request complete without status code", "{\"msg%{public}.0s\":\"client request complete without status code\", \"request id\":%{public, location:escape_only}s}", buf, 0x1Cu);
              }
              v384 = 0;
            }
            objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v386, (uint64_t)v374, (uint64_t)v384);
            return;
          case 12:
            if (v17)
            {
              v406 = (void *)MEMORY[0x1E0CB35C8];
              v407 = objc_msgSend_integerValue(v17, v18, v19, v20);
              v480 = *MEMORY[0x1E0CB2D50];
              v411 = objc_msgSend_integerValue(v21, v408, v409, v410);
              v481 = sub_18F70ADE4(v411);
              v413 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v412, (uint64_t)&v481, (uint64_t)&v480, 1);
              v415 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v406, v414, (uint64_t)CFSTR("kCLErrorDomainPrivate"), v407, v413);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v416 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
              {
                v420 = objc_msgSend_integerValue(v21, v417, v418, v419);
                v424 = (void *)objc_msgSend_localizedDescription(v415, v421, v422, v423);
                v428 = objc_msgSend_UTF8String(v424, v425, v426, v427);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v420;
                v502 = 2082;
                v503 = v428;
                _os_log_impl(&dword_18F5B3000, v416, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"query MiLo connection status failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
                if (qword_1EE1720B8 != -1)
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              }
              v429 = qword_1EE1720C0;
              if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
              {
                v433 = objc_msgSend_integerValue(v21, v430, v431, v432);
                v437 = (void *)objc_msgSend_localizedDescription(v415, v434, v435, v436);
                v441 = objc_msgSend_UTF8String(v437, v438, v439, v440);
                *(_DWORD *)buf = 68289538;
                v497 = 0;
                v498 = 2082;
                v499 = "";
                v500 = 2050;
                v501 = v433;
                v502 = 2082;
                v503 = v441;
                _os_signpost_emit_with_name_impl(&dword_18F5B3000, v429, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "query MiLo connection status failed", "{\"msg%{public}.0s\":\"query MiLo connection status failed\", \"error code\":%{public}ld, \"error message\":%{public, location:escape_only}s}", buf, 0x26u);
              }
              objc_msgSend__notifyClientQueryMiLoConnectionStatusDidFailWithError_(self, v430, (uint64_t)v415, v432);
            }
            else
            {
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v470 = qword_1EE1720C0;
              if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v470, OS_LOG_TYPE_FAULT, "query MiLo connection status failed but no error code returned", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 0))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE1720B8 != -1)
LABEL_234:
                  dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
LABEL_201:
                v471 = (char *)_os_log_send_and_compose_impl();
                sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v471);
                if (v471 != (char *)buf)
                  free(v471);
              }
            }
            return;
          case 13:
            if (qword_1EE1720B8 != -1)
              dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
            v442 = qword_1EE1720C0;
            if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v442, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceEvent, handleRecordingMetaInfo", buf, 2u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE1720B8 != -1)
                dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
              v477 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v477);
              if (v477 != (char *)buf)
                free(v477);
            }
            v445 = objc_msgSend_objectForKeyedSubscript_(a3, v443, 0x1E2997928, v444);
            objc_msgSend__notifyClientRecordingMetaInfo_(self, v446, v445, v447);
            return;
          default:
            return;
        }
      }
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v38 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
      {
        v42 = (void *)objc_msgSend_allKeys(a3, v39, v40, v41);
        v45 = (void *)objc_msgSend_componentsJoinedByString_(v42, v43, (uint64_t)CFSTR(","), v44);
        v49 = objc_msgSend_UTF8String(v45, v46, v47, v48);
        *(_DWORD *)buf = 68289282;
        v497 = 0;
        v498 = 2082;
        v499 = "";
        v500 = 2082;
        v501 = v49;
        _os_log_impl(&dword_18F5B3000, v38, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"unrecognized service event dictionary received\", \"DictionaryKeys\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v50 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        v54 = (void *)objc_msgSend_allKeys(a3, v51, v52, v53);
        v57 = (void *)objc_msgSend_componentsJoinedByString_(v54, v55, (uint64_t)CFSTR(","), v56);
        v61 = objc_msgSend_UTF8String(v57, v58, v59, v60);
        *(_DWORD *)buf = 68289282;
        v497 = 0;
        v498 = 2082;
        v499 = "";
        v500 = 2082;
        v501 = v61;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "unrecognized service event dictionary received", "{\"msg%{public}.0s\":\"unrecognized service event dictionary received\", \"DictionaryKeys\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      v62 = (void *)MEMORY[0x1E0CB35C8];
      v478 = *MEMORY[0x1E0CB2D50];
      v479 = CFSTR("Internal error");
      v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)&v479, (uint64_t)&v478, 1);
      v37 = objc_msgSend_errorWithDomain_code_userInfo_(v62, v64, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v63);
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v32 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_FAULT, "nil service event dictionary received", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
        v473 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v473);
        if (v473 != (char *)buf)
          free(v473);
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v494 = *MEMORY[0x1E0CB2D50];
      v495 = CFSTR("Empty daemon response dictionary");
      v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)&v495, (uint64_t)&v494, 1);
      v37 = objc_msgSend_errorWithDomain_code_userInfo_(v34, v36, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 4, v35);
    }
    v65 = v37;
    v66 = [CLMiLoServiceStatus alloc];
    v68 = (id)objc_msgSend_initWithServiceState_suspendReasons_serviceDescriptor_currentLocationOfInterestUuid_currentLocationOfInterestType_error_serviceQualityInfo_places_metaInfo_(v66, v67, 2, 0, 0, 0, 0, v65, 0, 0, 0);
    objc_msgSend__notifyClientDidUpdateServiceStatus_(self, v69, (uint64_t)v68, v70);
  }
}

- (void)_handlePredictionUpdateEvent:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  CLMiLoServiceStatus *v30;
  const char *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  const __CFString *v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoPredictionEvent, _handlePredictionEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v35 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf)
      free(v35);
  }
  if (a3)
  {
    v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v6, 0x1E29977E8, v7);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v9 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_msgSend_requestIdentifier(v8, v10, v11, v12);
      v17 = (void *)objc_msgSend_UUIDString(v13, v14, v15, v16);
      v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
      *(_DWORD *)buf = 136315138;
      v52 = v21;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "_handlePredictionEvent, requestIdentifier %s", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v39 = (void *)objc_msgSend_requestIdentifier(v8, v36, v37, v38);
      v43 = (void *)objc_msgSend_UUIDString(v39, v40, v41, v42);
      objc_msgSend_UTF8String(v43, v44, v45, v46);
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v47);
      if (v47 != (char *)buf)
        free(v47);
    }
    objc_msgSend__notifyClientDidUpdatePrediction_(self, v22, (uint64_t)v8, v23);
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v24 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_FAULT, "nil prediction event dictionary received", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v48 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handlePredictionUpdateEvent:]", "CoreLocation: %s\n", v48);
      if (v48 != (char *)buf)
        free(v48);
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("Empty daemon response dictionary");
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v50, (uint64_t)&v49, 1);
    v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 4, v27);
    v30 = [CLMiLoServiceStatus alloc];
    v32 = (id)objc_msgSend_initWithServiceState_suspendReasons_serviceDescriptor_currentLocationOfInterestUuid_currentLocationOfInterestType_error_serviceQualityInfo_places_metaInfo_(v30, v31, 2, 0, 0, 0, 0, v29, 0, 0, 0);
    objc_msgSend__notifyClientDidUpdateServiceStatus_(self, v33, (uint64_t)v32, v34);
  }
}

- (void)_handleDebugResponseEvent:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  char *v16;
  uint8_t buf[1640];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoServiceDebugResponse, _handleDebugResponseEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleDebugResponseEvent:]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf)
      free(v15);
  }
  if (a3)
  {
    v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v6, 0x1E29978E8, v7);
    if (objc_msgSend_exportDatabaseTablesResult(v8, v9, v10, v11))
      objc_msgSend__notifyClientDidExportDatabaseWithResponse_(self, v12, (uint64_t)v8, v13);
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v14 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "nil debug respoinse event dictionary received", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleDebugResponseEvent:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
  }
}

- (void)_handleMiLoConnectionStatusEvent:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoConnectionStatusEvent, _handleMiLoConnectionStatusEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  if (a3)
  {
    v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v6, 0x1E2997908, v7);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v9 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend_connectionState(v8, v10, v11, v12);
      *(_DWORD *)buf = 134217984;
      v24 = v13;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "_handleMiLoConnectionStatusEvent, connectionState %lu", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      objc_msgSend_connectionState(v8, v18, v19, v20);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
    objc_msgSend__notifyClientDidUpdateMiLoConnectionStatus_(self, v14, (uint64_t)v8, v15);
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v16 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_FAULT, "nil connection status event dictionary received", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleMiLoConnectionStatusEvent:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
  }
}

- (void)_handleGenericEvent:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "kCLConnectionMessageMiLoGenericEventResponse, _handleGenericEvent", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf)
      free(v25);
  }
  if (a3)
  {
    v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v6, 0x1E2997948, v7);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v9 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend_eventType(v8, v10, v11, v12);
      v17 = (void *)objc_msgSend_genericEventDescription(v8, v14, v15, v16);
      v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
      *(_DWORD *)buf = 67109378;
      v39 = v13;
      v40 = 2080;
      v41 = v21;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "_handleGenericEvent, eventType %u, description %s", buf, 0x12u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      objc_msgSend_eventType(v8, v26, v27, v28);
      v32 = (void *)objc_msgSend_genericEventDescription(v8, v29, v30, v31);
      objc_msgSend_UTF8String(v32, v33, v34, v35);
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf)
        free(v36);
    }
    objc_msgSend__notifyClientOfGenericEventResponse_(self, v22, (uint64_t)v8, v23);
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v24 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_FAULT, "nil generic event response event dictionary received", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v37 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _handleGenericEvent:]", "CoreLocation: %s\n", v37);
      if (v37 != (char *)buf)
        free(v37);
    }
  }
}

- (void)_createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4
{
  NSObject *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[8];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v47[0]) = 2082;
    *(_QWORD *)((char *)v47 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, creating a service\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    v9 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v8, (uint64_t)a4, 1, 0);
    v13 = v9;
    if (!v9 || !objc_msgSend_length(v9, v10, v11, v12))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = CFSTR("Invalid parameter");
      v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)&v45, (uint64_t)&v44, 1);
      v18 = objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 3, v16);
      objc_msgSend__notifyClientCreateServiceDidFailWithError_(self, v19, v18, v20);
    }
    v42[0] = 0x1E2997708;
    v42[1] = 0x1E2997728;
    v43[0] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, a3, v14);
    v43[1] = v13;
    v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v43, (uint64_t)v42, 2);
    sub_18F71A6C0(buf, "kCLConnectionMessageMiLoCreateService", &v39);
    v38 = (std::__shared_weak_count *)v47[0];
    if (v47[0])
    {
      v22 = (unint64_t *)(v47[0] + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    CLConnectionClient::sendMessage();
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v25 = __ldaxr(p_shared_owners);
      while (__stlxr(v25 - 1, p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    v26 = (std::__shared_weak_count *)v47[0];
    if (v47[0])
    {
      v27 = (unint64_t *)(v47[0] + 8);
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
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v29 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v47[0]) = 2082;
      *(_QWORD *)((char *)v47 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to create a service with internal error\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v30 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v47[0]) = 2082;
      *(_QWORD *)((char *)v47 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to create a service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to create a service with internal error\"}", buf, 0x12u);
    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Internal error");
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)&v41, (uint64_t)&v40, 1);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v33);
    objc_msgSend__notifyClientCreateServiceDidFailWithError_(self, v36, v35, v37);
  }
}

- (void)_deleteServiceWithIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  __CFString *v26;
  id v27;
  uint8_t buf[8];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v29[0]) = 2082;
    *(_QWORD *)((char *)v29 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, deleting a service\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    v26 = CFSTR("CLMiLoConnectionServiceIdentifier");
    v27 = a3;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)&v27, (uint64_t)&v26, 1);
    sub_18F71A6C0(buf, "kCLConnectionMessageMiLoDeleteService", &v23);
    v22 = (std::__shared_weak_count *)v29[0];
    if (v29[0])
    {
      v7 = (unint64_t *)(v29[0] + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    CLConnectionClient::sendMessage();
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v11 = (std::__shared_weak_count *)v29[0];
    if (v29[0])
    {
      v12 = (unint64_t *)(v29[0] + 8);
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
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v14 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v29[0]) = 2082;
      *(_QWORD *)((char *)v29 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to delete a service with internal error\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v15 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v29[0]) = 2082;
      *(_QWORD *)((char *)v29 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to delete a service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to delete a service with internal error\"}", buf, 0x12u);
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Internal error");
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)&v25, (uint64_t)&v24, 1);
    v20 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v18);
    objc_msgSend__notifyClientDeleteServiceDidFailWithServiceIdentifier_withError_(self, v21, (uint64_t)a3, v20);
  }
}

- (void)_queryMyServices
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[8];
  __int16 v23;
  const char *v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v23 = 2082;
    v24 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, query my services, kCLConnectionMessageMiLoQueryMyServices\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    v4 = (std::__shared_weak_count *)operator new(0x70uLL);
    v4->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
    sub_18F5D5990(buf, "kCLConnectionMessageMiLoQueryMyServices");
    MEMORY[0x194002B44](&v4[1], buf, MEMORY[0x1E0C9AA70]);
    if (v25 < 0)
      operator delete(*(void **)buf);
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    CLConnectionClient::sendMessage();
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
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v11 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v23 = 2082;
      v24 = "";
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to query my services with internal error\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v12 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v23 = 2082;
      v24 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to query my services with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to query my services with internal error\"}", buf, 0x12u);
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Internal error");
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)&v21, (uint64_t)&v20, 1);
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v15);
    objc_msgSend__notifyClientQueryServiceDidFailWithError_(self, v18, v17, v19);
  }
}

- (void)_queryMiLoConnectionStatus
{
  NSObject *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[8];
  std::__shared_weak_count *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v3 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "SPI request, query MiLo connection status, kCLConnectionMessageMiLoQueryConnectionStatus", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    LOWORD(v22) = 0;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMiLoConnectionInternal _queryMiLoConnectionStatus]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  if (self->_locationdConnection)
  {
    v22 = MEMORY[0x1E0C9AA70];
    sub_18F71A774(buf, "kCLConnectionMessageMiLoQueryConnectionStatus", &v22);
    v21 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v21)
    {
      v6 = (unint64_t *)&v21->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v8 = v26;
    if (v26)
    {
      v9 = (unint64_t *)&v26->__shared_owners_;
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
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v11 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_ERROR, "SPI request, failed to query MiLo connection status with internal error", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      LOWORD(v22) = 0;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLMiLoConnectionInternal _queryMiLoConnectionStatus]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Internal error");
    v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)&v24, (uint64_t)&v23, 1);
    v16 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v14);
    objc_msgSend__notifyClientQueryMiLoConnectionStatusDidFailWithError_(self, v17, v16, v18);
  }
}

- (void)_connectServiceWithIdentifier:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  __CFString *v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[8];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v46[0]) = 2082;
    *(_QWORD *)((char *)v46 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"SPI request, connect to a service, kCLConnectionMessageMiLoConnectToService\"}", buf, 0x12u);
  }
  if (self->_connectedServiceIdentifier)
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v6 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v46[0]) = 2082;
      *(_QWORD *)((char *)v46 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to connect to service because this connection object is already connected to a service\"}", buf, 0x12u);
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("Already connected to another service");
    v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)&v44, (uint64_t)&v43, 1);
    v11 = objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 9, v9);
    objc_msgSend__notifyClientConnectServiceDidFailWithServiceIdentifier_withError_(self, v12, (uint64_t)a3, v11);
  }
  else if (self->_locationdConnection)
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v13 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v46[0]) = 2082;
      *(_QWORD *)((char *)v46 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service, set connectedServiceIdentifier\"}", buf, 0x12u);
    }
    self->_connectedServiceIdentifier = (NSUUID *)objc_msgSend_copy(a3, v14, v15, v16);
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v17 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v46[0]) = 2082;
      *(_QWORD *)((char *)v46 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"connect to service, set handler for prediction updates\"}", buf, 0x12u);
    }
    objc_msgSend__setHandlerForMiLoPredictionEvents(self, v18, v19, v20);
    v41 = CFSTR("CLMiLoConnectionServiceIdentifier");
    v42 = a3;
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v42, (uint64_t)&v41, 1);
    sub_18F68C700("kCLConnectionMessageMiLoConnectToService", &v38, buf);
    v37 = (std::__shared_weak_count *)v46[0];
    if (v46[0])
    {
      v22 = (unint64_t *)(v46[0] + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    CLConnectionClient::sendMessage();
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v25 = __ldaxr(p_shared_owners);
      while (__stlxr(v25 - 1, p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v26 = (std::__shared_weak_count *)v46[0];
    if (v46[0])
    {
      v27 = (unint64_t *)(v46[0] + 8);
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
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v29 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v46[0]) = 2082;
      *(_QWORD *)((char *)v46 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to connect to services with internal error\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v30 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v46[0]) = 2082;
      *(_QWORD *)((char *)v46 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to connect to services with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to connect to services with internal error\"}", buf, 0x12u);
    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Internal error");
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)&v40, (uint64_t)&v39, 1);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v33);
    objc_msgSend__notifyClientConnectServiceDidFailWithServiceIdentifier_withError_(self, v36, (uint64_t)a3, v35);
  }
}

- (void)_disconnectServiceWithIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSUUID *connectedServiceIdentifier;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const __CFString *v46;
  __CFString *v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint8_t buf[8];
  __int16 v54;
  const char *v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    v54 = 2082;
    v55 = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, disconnect to a service, kCLConnectionMessageMiLoDisconnectToService\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if ((objc_msgSend_isEqual_(a3, v6, (uint64_t)connectedServiceIdentifier, v7) & 1) != 0)
    {
      if (self->_locationdConnection)
      {
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
        v9 = qword_1EE1720C0;
        if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
        {
          *(_QWORD *)buf = 68289026;
          v54 = 2082;
          v55 = "";
          _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"disconnect to service, clear connectedServiceIdentifier\"}", buf, 0x12u);
          if (qword_1EE1720B8 != -1)
            dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
        }
        v10 = qword_1EE1720C0;
        if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
        {
          *(_QWORD *)buf = 68289026;
          v54 = 2082;
          v55 = "";
          _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"disconnect to service, unset handler for prediction updates\"}", buf, 0x12u);
        }
        objc_msgSend__unsetHandlerForMiLoPredictionEvents(self, v11, v12, v13);
        v47 = CFSTR("CLMiLoConnectionServiceIdentifier");
        v48 = a3;
        v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)&v48, (uint64_t)&v47, 1);
        v16 = (std::__shared_weak_count *)operator new(0x70uLL);
        v16->__shared_owners_ = 0;
        p_shared_owners = (unint64_t *)&v16->__shared_owners_;
        v16->__shared_weak_owners_ = 0;
        v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
        sub_18F5D5990(buf, "kCLConnectionMessageMiLoDisconnectToService");
        MEMORY[0x194002B44](&v16[1], buf, v15);
        if (v56 < 0)
          operator delete(*(void **)buf);
        do
          v18 = __ldxr(p_shared_owners);
        while (__stxr(v18 + 1, p_shared_owners));
        CLConnectionClient::sendMessage();
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

        self->_connectedServiceIdentifier = 0;
        if (v16)
        {
          v21 = (unint64_t *)&v16->__shared_owners_;
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
      }
      else
      {
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
        v37 = qword_1EE1720C0;
        if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
        {
          *(_QWORD *)buf = 68289026;
          v54 = 2082;
          v55 = "";
          _os_log_impl(&dword_18F5B3000, v37, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect service with internal error\"}", buf, 0x12u);
          if (qword_1EE1720B8 != -1)
            dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
        }
        v38 = qword_1EE1720C0;
        if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
        {
          *(_QWORD *)buf = 68289026;
          v54 = 2082;
          v55 = "";
          _os_signpost_emit_with_name_impl(&dword_18F5B3000, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to disconnect service with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to disconnect service with internal error\"}", buf, 0x12u);
        }
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v45 = *MEMORY[0x1E0CB2D50];
        v46 = CFSTR("Internal error");
        v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v39, (uint64_t)&v46, (uint64_t)&v45, 1);
        v43 = objc_msgSend_errorWithDomain_code_userInfo_(v40, v42, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v41);
        objc_msgSend__notifyClientDisconnectServiceDidFailWithError_serviceIdentifier_(self, v44, v43, (uint64_t)a3);
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v30 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)buf = 68289026;
        v54 = 2082;
        v55 = "";
        _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect to a service because connected to a different service\"}", buf, 0x12u);
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Invalid parameter");
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)&v50, (uint64_t)&v49, 1);
      v35 = objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 3, v33);
      objc_msgSend__notifyClientDisconnectServiceDidFailWithError_serviceIdentifier_(self, v36, v35, (uint64_t)a3);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v23 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)buf = 68289026;
      v54 = 2082;
      v55 = "";
      _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"SPI request, failed to disconnect to a service because this connection object hasn't connected to a service\"}", buf, 0x12u);
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("Not connected to any service");
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v52, (uint64_t)&v51, 1);
    v28 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v26);
    objc_msgSend__notifyClientDisconnectServiceDidFailWithError_serviceIdentifier_(self, v29, v28, (uint64_t)a3);
  }
}

- (void)_requestMiLoPredictionWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSUUID *connectedServiceIdentifier;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v39 = 2082;
    v40 = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, single shot MiLo prediction, kCLConnectionMessageMiLoSingleShotPrediction\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v34[0] = 0x1E2997788;
      v34[1] = 0x1E2997808;
      v35[0] = connectedServiceIdentifier;
      v35[1] = a3;
      v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v35, (uint64_t)v34, 2);
      v9 = (std::__shared_weak_count *)operator new(0x70uLL);
      v9->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      v9->__shared_weak_owners_ = 0;
      v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "kCLConnectionMessageMiLoSingleShotPrediction");
      MEMORY[0x194002B44](&v9[1], buf, v8);
      if (v41 < 0)
        operator delete(*(void **)buf);
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
      if (v9)
      {
        v12 = (unint64_t *)&v9->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      if (v9)
      {
        v14 = (unint64_t *)&v9->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v24 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        v39 = 2082;
        v40 = "";
        _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v25 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        v39 = 2082;
        v40 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request a single shot prediction with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction with internal error\"}", buf, 0x12u);
      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("Internal error");
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)&v33, (uint64_t)&v32, 1);
      v30 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v28);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v31, (uint64_t)a3, v30);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v16 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v39 = 2082;
      v40 = "";
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v17 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v39 = 2082;
      v40 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request a single shot prediction, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request a single shot prediction, not connected to service yet\"}", buf, 0x12u);
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Not connected to any service");
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)&v37, (uint64_t)&v36, 1);
    v22 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v20);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v23, (uint64_t)a3, v22);
  }
}

- (void)_requestObservationWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4
{
  NSObject *v7;
  const char *v8;
  NSUUID *connectedServiceIdentifier;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[8];
  __int16 v47;
  const char *v48;
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v47 = 2082;
    v48 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, request observation, kCLConnectionMessageRequestObservation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v10 = (void *)MEMORY[0x1E0C99E08];
      v42[0] = 0x1E2997788;
      v42[1] = 0x1E2997808;
      v43[0] = connectedServiceIdentifier;
      v43[1] = a3;
      v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v43, (uint64_t)v42, 2);
      v14 = (void *)objc_msgSend_dictionaryWithDictionary_(v10, v12, v11, v13);
      v16 = v14;
      if (a4)
        objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)a4, 0x1E2997828);
      v17 = (std::__shared_weak_count *)operator new(0x70uLL);
      v17->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      v17->__shared_weak_owners_ = 0;
      v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "kCLConnectionMessageRequestObservation");
      MEMORY[0x194002B44](&v17[1], buf, v16);
      if (v49 < 0)
        operator delete(*(void **)buf);
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
      if (v17)
      {
        v20 = (unint64_t *)&v17->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      if (v17)
      {
        v22 = (unint64_t *)&v17->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v32 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        v47 = 2082;
        v48 = "";
        _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v33 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        v47 = 2082;
        v48 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request observation with internal error\"}", buf, 0x12u);
      }
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      v41 = CFSTR("Internal error");
      v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)&v41, (uint64_t)&v40, 1);
      v38 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v37, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v36);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v39, (uint64_t)a3, v38);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v24 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v47 = 2082;
      v48 = "";
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v25 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v47 = 2082;
      v48 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D50];
    v45 = CFSTR("Not connected to any service");
    v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)&v45, (uint64_t)&v44, 1);
    v30 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v28);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v31, (uint64_t)a3, v30);
  }
}

- (void)_labelEventWithRequestIdentifier:(id)a3 placeIdentifier:(id)a4 observationIdentifier:(id)a5
{
  NSObject *v9;
  const char *v10;
  NSUUID *connectedServiceIdentifier;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const __CFString *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[8];
  __int16 v43;
  const char *v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v9 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v43 = 2082;
    v44 = "";
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, label an observation, kCLConnectionMessageLabelSignleObservation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v38[0] = 0x1E2997788;
      v38[1] = 0x1E2997808;
      v39[0] = connectedServiceIdentifier;
      v39[1] = a3;
      v38[2] = 0x1E2997828;
      v38[3] = 0x1E2997848;
      v39[2] = a4;
      v39[3] = a5;
      v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v39, (uint64_t)v38, 4);
      v13 = (std::__shared_weak_count *)operator new(0x70uLL);
      v13->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      v13->__shared_weak_owners_ = 0;
      v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "kCLConnectionMessageLabelSignleObservation");
      MEMORY[0x194002B44](&v13[1], buf, v12);
      if (v45 < 0)
        operator delete(*(void **)buf);
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
      if (v13)
      {
        v16 = (unint64_t *)&v13->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (v13)
      {
        v18 = (unint64_t *)&v13->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v28 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        v43 = 2082;
        v44 = "";
        _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label an observation with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v29 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        v43 = 2082;
        v44 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label an observation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to label an observation with internal error\"}", buf, 0x12u);
      }
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Internal error");
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)&v37, (uint64_t)&v36, 1);
      v34 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v32);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v35, (uint64_t)a3, v34);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v20 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v43 = 2082;
      v44 = "";
      _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v21 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v43 = 2082;
      v44 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request observation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request observation, not connected to service yet\"}", buf, 0x12u);
    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Not connected to any service");
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)&v41, (uint64_t)&v40, 1);
    v26 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v24);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v27, (uint64_t)a3, v26);
  }
}

- (void)_labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5 requestIdentifier:(id)a6
{
  NSObject *v11;
  const char *v12;
  NSUUID *connectedServiceIdentifier;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const __CFString *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[8];
  __int16 v45;
  const char *v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v11 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v45 = 2082;
    v46 = "";
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, label observations between dates, kCLConnectionMessageLabelObservationsBetweenDates\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v40[0] = 0x1E2997788;
      v40[1] = 0x1E2997808;
      v41[0] = connectedServiceIdentifier;
      v41[1] = a6;
      v40[2] = 0x1E2997828;
      v40[3] = 0x1E2997868;
      v41[2] = a5;
      v41[3] = a3;
      v40[4] = 0x1E2997888;
      v41[4] = a4;
      v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v41, (uint64_t)v40, 5);
      v15 = (std::__shared_weak_count *)operator new(0x70uLL);
      v15->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "kCLConnectionMessageLabelObservationsBetweenDates");
      MEMORY[0x194002B44](&v15[1], buf, v14);
      if (v47 < 0)
        operator delete(*(void **)buf);
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
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
      if (v15)
      {
        v20 = (unint64_t *)&v15->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v30 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        v45 = 2082;
        v46 = "";
        _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v31 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        v45 = 2082;
        v46 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label observations between dates with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates with internal error\"}", buf, 0x12u);
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = CFSTR("Internal error");
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)&v39, (uint64_t)&v38, 1);
      v36 = objc_msgSend_errorWithDomain_code_userInfo_(v33, v35, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v34);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v37, (uint64_t)a6, v36);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v22 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v45 = 2082;
      v46 = "";
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v23 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v45 = 2082;
      v46 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to label observations between dates, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to label observations between dates, not connected to service yet\"}", buf, 0x12u);
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("Not connected to any service");
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v43, (uint64_t)&v42, 1);
    v28 = objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v26);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v29, (uint64_t)a6, v28);
  }
}

- (void)_removeLabels:(id)a3 withRequestIdentifier:(id)a4
{
  NSObject *v7;
  const char *v8;
  NSUUID *connectedServiceIdentifier;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[8];
  __int16 v41;
  const char *v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    v41 = 2082;
    v42 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, remove labels, kCLConnectionMessageRemoveLabels\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v36[0] = 0x1E2997788;
      v36[1] = 0x1E2997808;
      v37[0] = connectedServiceIdentifier;
      v37[1] = a4;
      v36[2] = 0x1E29978A8;
      v37[2] = a3;
      v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v37, (uint64_t)v36, 3);
      v11 = (std::__shared_weak_count *)operator new(0x70uLL);
      v11->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "kCLConnectionMessageRemoveLabels");
      MEMORY[0x194002B44](&v11[1], buf, v10);
      if (v43 < 0)
        operator delete(*(void **)buf);
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
      if (v11)
      {
        v14 = (unint64_t *)&v11->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (v11)
      {
        v16 = (unint64_t *)&v11->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v26 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        v41 = 2082;
        v42 = "";
        _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v27 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        v41 = 2082;
        v42 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
      }
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("Internal error");
      v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)&v35, (uint64_t)&v34, 1);
      v32 = objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v30);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v33, (uint64_t)a4, v32);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v18 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      v41 = 2082;
      v42 = "";
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v19 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      v41 = 2082;
      v42 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels, not connected to service yet\"}", buf, 0x12u);
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Not connected to any service");
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v39, (uint64_t)&v38, 1);
    v24 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v22);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v25, (uint64_t)a4, v24);
  }
}

- (void)_removeCustomLocationOfInterestFromMonitoringWithIdentifier:(id)a3 withRequestIdentifier:(id)a4
{
  NSObject *v7;
  const char *v8;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[8];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v42[0]) = 2082;
    *(_QWORD *)((char *)v42 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, remove a custom LOI, kCLConnectionMessageRemoveCustomLOI\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v37[0] = 0x1E2997788;
      v37[1] = 0x1E2997808;
      v38[0] = connectedServiceIdentifier;
      v38[1] = a4;
      v37[2] = 0x1E2997968;
      v38[2] = a3;
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v38, (uint64_t)v37, 3);
      sub_18F679BE0("kCLConnectionMessageRemoveCustomLOI", &v34, buf);
      v33 = (std::__shared_weak_count *)v42[0];
      if (v42[0])
      {
        v10 = (unint64_t *)(v42[0] + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      CLConnectionClient::sendMessage();
      if (v33)
      {
        p_shared_owners = (unint64_t *)&v33->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v14 = (std::__shared_weak_count *)v42[0];
      if (v42[0])
      {
        v15 = (unint64_t *)(v42[0] + 8);
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
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v25 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v42[0]) = 2082;
        *(_QWORD *)((char *)v42 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v26 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v42[0]) = 2082;
        *(_QWORD *)((char *)v42 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove labels with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to remove labels with internal error\"}", buf, 0x12u);
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("Internal error");
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)&v36, (uint64_t)&v35, 1);
      v31 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v29);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v32, (uint64_t)a4, v31);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v17 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v42[0]) = 2082;
      *(_QWORD *)((char *)v42 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to remove a custom LOI, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v18 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v42[0]) = 2082;
      *(_QWORD *)((char *)v42 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to remove a custom LOI, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to remove a custom LOI, not connected to service yet\"}", buf, 0x12u);
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Not connected to any service");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)&v40, (uint64_t)&v39, 1);
    v23 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v22, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v21);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v24, (uint64_t)a4, v23);
  }
}

- (void)_startUpdatingMicroLocationWithConfiguration:(id)a3 withRequestIdentifier:(id)a4
{
  NSObject *v7;
  const char *v8;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[8];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v42[0]) = 2082;
    *(_QWORD *)((char *)v42 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, start updating MicroLocation, kCLConnectionMessageStartUpdatingMicroLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v37[0] = 0x1E2997788;
      v37[1] = 0x1E2997808;
      v38[0] = connectedServiceIdentifier;
      v38[1] = a4;
      v37[2] = 0x1E29978C8;
      v38[2] = a3;
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v38, (uint64_t)v37, 3);
      sub_18F6879CC("kCLConnectionMessageStartUpdatingMicroLocation", &v34, buf);
      v33 = (std::__shared_weak_count *)v42[0];
      if (v42[0])
      {
        v10 = (unint64_t *)(v42[0] + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      CLConnectionClient::sendMessage();
      if (v33)
      {
        p_shared_owners = (unint64_t *)&v33->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v14 = (std::__shared_weak_count *)v42[0];
      if (v42[0])
      {
        v15 = (unint64_t *)(v42[0] + 8);
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
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v25 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v42[0]) = 2082;
        *(_QWORD *)((char *)v42 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to tart updating MicroLocation with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v26 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v42[0]) = 2082;
        *(_QWORD *)((char *)v42 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to tart updating MicroLocation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to tart updating MicroLocation with internal error\"}", buf, 0x12u);
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("Internal error");
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)&v36, (uint64_t)&v35, 1);
      v31 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v29);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v32, (uint64_t)a4, v31);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v17 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v42[0]) = 2082;
      *(_QWORD *)((char *)v42 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to start updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v18 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v42[0]) = 2082;
      *(_QWORD *)((char *)v42 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to start updating MicroLocation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to start updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Not connected to any service");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)&v40, (uint64_t)&v39, 1);
    v23 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v22, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v21);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v24, (uint64_t)a4, v23);
  }
}

- (void)_stopUpdatingMicroLocationWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v40[0]) = 2082;
    *(_QWORD *)((char *)v40 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, stop updating MicroLocation, kCLConnectionMessageStopUpdatingMicroLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v35[0] = 0x1E2997788;
      v35[1] = 0x1E2997808;
      v36[0] = connectedServiceIdentifier;
      v36[1] = a3;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v36, (uint64_t)v35, 2);
      sub_18F71A774(buf, "kCLConnectionMessageStopUpdatingMicroLocation", &v32);
      v31 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v8 = (unint64_t *)(v40[0] + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v12 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v13 = (unint64_t *)(v40[0] + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v23 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v24 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to stop updating MicroLocation with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation with internal error\"}", buf, 0x12u);
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Internal error");
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v34, (uint64_t)&v33, 1);
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v27);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v30, (uint64_t)a3, v29);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v15 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v16 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to stop updating MicroLocation, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to stop updating MicroLocation, not connected to service yet\"}", buf, 0x12u);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Not connected to any service");
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v38, (uint64_t)&v37, 1);
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v19);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v22, (uint64_t)a3, v21);
  }
}

- (void)_requestModelLearningWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v40[0]) = 2082;
    *(_QWORD *)((char *)v40 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request MiLo Learning\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v35[0] = 0x1E2997788;
      v35[1] = 0x1E2997808;
      v36[0] = connectedServiceIdentifier;
      v36[1] = a3;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v36, (uint64_t)v35, 2);
      sub_18F68C700("kCLConnectionMessageRequestModelLearning", &v32, buf);
      v31 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v8 = (unint64_t *)(v40[0] + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v12 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v13 = (unint64_t *)(v40[0] + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v23 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request MicroLocation learning with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v24 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request MicroLocation learning with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request MicroLocation learning with internal error\"}", buf, 0x12u);
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Internal error");
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v34, (uint64_t)&v33, 1);
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v27);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v30, (uint64_t)a3, v29);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v15 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request MiLo learning, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v16 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request MiLo learning, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request MiLo learning, not connected to service yet\"}", buf, 0x12u);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Not connected to any service");
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v38, (uint64_t)&v37, 1);
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v19);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v22, (uint64_t)a3, v21);
  }
}

- (void)_purgeAllMiLoDataWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  __CFString *v26;
  id v27;
  uint8_t buf[8];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v29[0]) = 2082;
    *(_QWORD *)((char *)v29 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request Purge MiLo Data\"}", buf, 0x12u);
  }
  if (self->_locationdConnection)
  {
    v26 = CFSTR("CLMiLoConnectionRequestIdentifier");
    v27 = a3;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)&v27, (uint64_t)&v26, 1);
    sub_18F68C700("kCLConnectionMessageRequestPurgeMiLoData", &v23, buf);
    v22 = (std::__shared_weak_count *)v29[0];
    if (v29[0])
    {
      v7 = (unint64_t *)(v29[0] + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    CLConnectionClient::sendMessage();
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v11 = (std::__shared_weak_count *)v29[0];
    if (v29[0])
    {
      v12 = (unint64_t *)(v29[0] + 8);
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
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v14 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v29[0]) = 2082;
      *(_QWORD *)((char *)v29 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request Purge MiLo Data with internal error\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v15 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v29[0]) = 2082;
      *(_QWORD *)((char *)v29 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request Purge MiLo Data with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request Purge MiLo Data with internal error\"}", buf, 0x12u);
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Internal error");
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)&v25, (uint64_t)&v24, 1);
    v20 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v18);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v21, (uint64_t)a3, v20);
  }
}

- (void)_requestExportDatabaseWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v40[0]) = 2082;
    *(_QWORD *)((char *)v40 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Request Export MiLo Database\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v35[0] = 0x1E2997788;
      v35[1] = 0x1E2997808;
      v36[0] = connectedServiceIdentifier;
      v36[1] = a3;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v36, (uint64_t)v35, 2);
      sub_18F71A828(buf, "kCLConnectionMessageRequestMiLoExportDatabaseTables", &v32);
      v31 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v8 = (unint64_t *)(v40[0] + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v12 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v13 = (unint64_t *)(v40[0] + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v23 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request Export MiLo Database with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v24 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request Export MiLo Database with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to request Export MiLo Database with internal error\"}", buf, 0x12u);
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Internal error");
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v34, (uint64_t)&v33, 1);
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v27);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v30, (uint64_t)a3, v29);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v15 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to Export MiLo Database, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v16 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to Export MiLo Database, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to Export MiLo Database, not connected to service yet\"}", buf, 0x12u);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Not connected to any service");
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v38, (uint64_t)&v37, 1);
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v19);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v22, (uint64_t)a3, v21);
  }
}

- (void)_createCustomLocationOfInterestAtCurrentLocationWithRequestIdentifier:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSUUID *connectedServiceIdentifier;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
  v5 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)buf = 68289026;
    LOWORD(v40[0]) = 2082;
    *(_QWORD *)((char *)v40 + 2) = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SPI request, enable MiLo at current location, kCLConnectionMessageMiLoEnableMiLoAtCurrentLocation\"}", buf, 0x12u);
  }
  connectedServiceIdentifier = self->_connectedServiceIdentifier;
  if (connectedServiceIdentifier)
  {
    if (self->_locationdConnection)
    {
      v35[0] = 0x1E2997788;
      v35[1] = 0x1E2997808;
      v36[0] = connectedServiceIdentifier;
      v36[1] = a3;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v36, (uint64_t)v35, 2);
      sub_18F71A828(buf, "kCLConnectionMessageMiLoEnableMiLoAtCurrentLocation", &v32);
      v31 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v8 = (unint64_t *)(v40[0] + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v12 = (std::__shared_weak_count *)v40[0];
      if (v40[0])
      {
        v13 = (unint64_t *)(v40[0] + 8);
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    else
    {
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      v23 = qword_1EE1720C0;
      if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to enable MiLo at current location with internal error\"}", buf, 0x12u);
        if (qword_1EE1720B8 != -1)
          dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
      }
      v24 = qword_1EE1720C0;
      if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
      {
        *(_QWORD *)buf = 68289026;
        LOWORD(v40[0]) = 2082;
        *(_QWORD *)((char *)v40 + 2) = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to enable MiLo at current location with internal error", "{\"msg%{public}.0s\":\"SPI request, failed to enable MiLo at current location with internal error\"}", buf, 0x12u);
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Internal error");
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)&v34, (uint64_t)&v33, 1);
      v29 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 0, v27);
      objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v30, (uint64_t)a3, v29);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    v15 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"SPI request, failed to request enablingMiLo at current location, not connected to service yet\"}", buf, 0x12u);
      if (qword_1EE1720B8 != -1)
        dispatch_once(&qword_1EE1720B8, &unk_1E2990B90);
    }
    v16 = qword_1EE1720C0;
    if (os_signpost_enabled((os_log_t)qword_1EE1720C0))
    {
      *(_QWORD *)buf = 68289026;
      LOWORD(v40[0]) = 2082;
      *(_QWORD *)((char *)v40 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SPI request, failed to request enablingMiLo at current location, not connected to service yet", "{\"msg%{public}.0s\":\"SPI request, failed to request enablingMiLo at current location, not connected to service yet\"}", buf, 0x12u);
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Not connected to any service");
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v38, (uint64_t)&v37, 1);
    v21 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 10, v19);
    objc_msgSend__notifyClientDidCompleteClientRequest_withError_(self, v22, (uint64_t)a3, v21);
  }
}

@end
