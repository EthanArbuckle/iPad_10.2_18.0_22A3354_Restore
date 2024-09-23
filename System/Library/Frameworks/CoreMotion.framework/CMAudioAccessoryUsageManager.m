@implementation CMAudioAccessoryUsageManager

+ (BOOL)isAvailable
{
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

+ (int64_t)isAuthorized
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, (uint64_t)CFSTR("com.apple.bluetooth.system"), v2, v3);
}

- (CMAudioAccessoryUsageManager)init
{
  NSObject *v3;
  id v4;
  char *v6;
  objc_super v7;
  __int16 v8;
  uint8_t buf[1640];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
  v3 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager init", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager init]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf)
      free(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CMAudioAccessoryUsageManager;
  v4 = -[CMAudioAccessoryUsageManager init](&v7, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMAudioAccessoryUsage", 0);
    sub_18F331ACC((uint64_t *)v4 + 1, 0);
  }
  return (CMAudioAccessoryUsageManager *)v4;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *dispatchQueue;
  char *v9;
  objc_super v10;
  _QWORD block[5];
  __int16 v12;
  uint8_t buf[1640];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
  v3 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager dealloc", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v12 = 0;
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager dealloc]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_dispatchQueue, &unk_1EE16E71C, &unk_1EE16E71C, 0);
  if (dispatch_get_specific(&unk_1EE16E71C) == &unk_1EE16E71C)
  {
    objc_msgSend__disconnect(self, v4, v5, v6, v7);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F339294;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  self->_dispatchQueue = 0;
  v10.receiver = self;
  v10.super_class = (Class)CMAudioAccessoryUsageManager;
  -[CMAudioAccessoryUsageManager dealloc](&v10, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  NSObject *v5;
  NSObject *dispatchQueue;
  char *v7;
  _QWORD block[6];
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
  v5 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] CMAudioAccessoryUsageManager setDelegate", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v9 = 0;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager setDelegate:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F33946C;
  block[3] = &unk_1E29559D0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_connect
{
  NSObject *v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  std::__shared_weak_count *v16;
  _QWORD v17[5];
  id v18;
  id location;
  const __CFString *v20;
  uint64_t v21;
  uint8_t buf[8];
  std::__shared_weak_count *v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_locationConnection.__ptr_.__value_)
  {
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v3 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager - requested connection, but already registered", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      LOWORD(location) = 0;
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _connect]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf)
        free(v4);
    }
  }
  else
  {
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v5 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager - connecting", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      LOWORD(location) = 0;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _connect]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
    v6 = operator new();
    sub_18F270374(buf, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v6, buf, self->_dispatchQueue);
    if (v24 < 0)
      operator delete(*(void **)buf);
    sub_18F331ACC((uint64_t *)&self->_locationConnection, v6);
    objc_initWeak(&location, self);
    v17[1] = MEMORY[0x1E0C809B0];
    v17[2] = 3221225472;
    v17[3] = sub_18F3399C8;
    v17[4] = &unk_1E29559F8;
    objc_copyWeak(&v18, &location);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(self->_locationConnection.__ptr_.__value_);
    v20 = CFSTR("kCLConnectionMessageSubscribeKey");
    v21 = MEMORY[0x1E0C9AAB0];
    v17[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)&v21, (uint64_t)&v20, 1);
    sub_18F33AE44("kCLConnectionMessageAudioAccessoryUsageMetricsSubscription", v17, buf);
    v16 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v16)
    {
      v10 = (unint64_t *)&v16->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
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
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  NSObject *v5;
  _QWORD *v6;
  int v7;
  _QWORD *v8;
  int v9;
  CLConnectionMessage *v10;
  objc_class *v11;
  uint64_t ObjectOfClass;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t Dictionary;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[6];
  __int16 v53;
  uint64_t v54;
  const __CFString *v55;
  uint8_t buf[1640];
  uint64_t v57;

  var0 = (CLConnectionMessage **)a3.var0;
  v57 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
  v5 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager handleMessage", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v53 = 0;
    v48 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v48);
    if (v48 != (char *)buf)
      free(v48);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = (_QWORD *)CLConnectionMessage::name(*var0);
  v7 = *((char *)v6 + 23);
  if (v7 < 0)
  {
    if (v6[1] != 52)
      goto LABEL_12;
    v6 = (_QWORD *)*v6;
LABEL_11:
    if (memcmp(v6, "kCLConnectionMessageAudioAccessoryUsageMetricsUpdate", 0x34uLL))
      goto LABEL_12;
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      Dictionary = CLConnectionMessage::getDictionary(*var0);
      if (Dictionary)
      {
        v26 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v21, v22, v23, v24);
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = sub_18F33A83C;
        v51[3] = &unk_1E29559D0;
        v51[4] = self;
        v51[5] = Dictionary;
        objc_msgSend_addOperationWithBlock_(v26, v27, (uint64_t)v51, v28, v29);
        goto LABEL_12;
      }
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      v33 = qword_1ECEDEE30;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Error, nil dictionary received.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE38 != -1)
          dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
        v53 = 0;
        v49 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v49);
        if (v49 != (char *)buf)
          free(v49);
      }
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v54 = *MEMORY[0x1E0CB2D50];
        v55 = CFSTR("No data received from callback.");
        v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)&v55, (uint64_t)&v54, 1);
        v39 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v37, 112, v36, v38);
        v44 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v40, v41, v42, v43);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = sub_18F33A810;
        v52[3] = &unk_1E29559D0;
        v52[4] = self;
        v52[5] = v39;
        objc_msgSend_addOperationWithBlock_(v44, v45, (uint64_t)v52, v46, v47);
        return;
      }
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      v35 = qword_1ECEDEE30;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to errorOccurred.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 == -1)
      {
LABEL_29:
        v53 = 0;
        v31 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v31);
LABEL_57:
        if (v31 != (char *)buf)
          free(v31);
        return;
      }
    }
    else
    {
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      v30 = qword_1ECEDEE30;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to didReceiveUsageMetrics, refuse message.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 == -1)
        goto LABEL_29;
    }
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    goto LABEL_29;
  }
  if (v7 == 52)
    goto LABEL_11;
LABEL_12:
  v8 = (_QWORD *)CLConnectionMessage::name(*var0);
  v9 = *((char *)v8 + 23);
  if (v9 < 0)
  {
    if (v8[1] != 51)
      return;
    v8 = (_QWORD *)*v8;
  }
  else if (v9 != 51)
  {
    return;
  }
  if (!memcmp(v8, "kCLConnectionMessageAudioAccessoryUsageMetricsError", 0x33uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *var0;
      v11 = (objc_class *)objc_opt_class();
      ObjectOfClass = CLConnectionMessage::getObjectOfClass(v10, v11);
      v17 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v13, v14, v15, v16);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_18F33A868;
      v50[3] = &unk_1E29559D0;
      v50[4] = self;
      v50[5] = ObjectOfClass;
      objc_msgSend_addOperationWithBlock_(v17, v18, (uint64_t)v50, v19, v20);
      return;
    }
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v32 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] CMAudioAccessoryUsageManager: Delegate does not respond to errorOccurred, refuse message.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      v53 = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMAudioAccessoryUsageManager _handleMessage:]", "CoreLocation: %s\n", v31);
      goto LABEL_57;
    }
  }
}

- (void)_disconnect
{
  NSObject *v3;
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
  char *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint8_t buf[1640];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
  v3 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] CMAudioAccessoryUsageManager _disconnect", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    LOWORD(v16) = 0;
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _disconnect]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v19 = CFSTR("kCLConnectionMessageSubscribeKey");
  v20 = MEMORY[0x1E0C9AAA0];
  v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)&v20, (uint64_t)&v19, 1);
  sub_18F33AE44("kCLConnectionMessageAudioAccessoryUsageMetricsSubscription", &v18, &v16);
  if (objc_loadWeak((id *)&self->_delegate) && self->_locationConnection.__ptr_.__value_)
  {
    v15 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v15)
    {
      v7 = (unint64_t *)&v15->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
    v9 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_INFO, "[HeadphoneUsage] Cannot send a disconnect message, delegate or connection is already invalid.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E29552A8);
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMAudioAccessoryUsageManager _disconnect]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf)
        free(v14);
    }
  }
  sub_18F331ACC((uint64_t *)&self->_locationConnection, 0);
  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
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

- (void)requestAudioAccessoryUsageUpdatesWithHandler:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  if ((objc_msgSend_isAvailable(v4, v5, v6, v7, v8) & 1) != 0)
  {
    v10 = (void *)objc_opt_class();
    if (objc_msgSend_isAuthorized(v10, v11, v12, v13, v14))
    {
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
      return;
    }
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Necessary entitlement missing: 'com.apple.bluetooth.system'.");
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)&v24, (uint64_t)&v23, 1);
    v19 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v21, 110, v20, v22);
  }
  else
  {
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("CMAudioAccessoryUsageManager not available on this platform");
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v26, (uint64_t)&v25, 1);
    v19 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v17, 109, v16, v18);
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v19);
}

- (CMAudioAccessoryUsageDelegate)delegate
{
  return (CMAudioAccessoryUsageDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (int64_t)isAuthorized
{
  return self->_authorizationStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  sub_18F331ACC((uint64_t *)&self->_locationConnection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
