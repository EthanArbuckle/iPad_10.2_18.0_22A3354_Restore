@implementation CMVO2MaxRetrocomputeManager

- (CMVO2MaxRetrocomputeManager)init
{
  CMVO2MaxRetrocomputeManager *v2;
  CMVO2MaxRetrocomputeManager *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMVO2MaxRetrocomputeManager;
  v2 = -[CMVO2MaxRetrocomputeManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fStartedUpdates = 0;
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMVO2MaxRetrocomputeManager", 0);
    v4 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, __p, v3->fInternalQueue);
    v3->fLocationdConnection = (void *)v4;
    if (v11 < 0)
      operator delete(__p[0]);
    objc_msgSend_connect(v3, v5, v6, v7, v8);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_disconnect(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)CMVO2MaxRetrocomputeManager;
  -[CMVO2MaxRetrocomputeManager dealloc](&v6, sel_dealloc);
}

- (void)connect
{
  id v3;
  id location;

  CLConnectionClient::setDefaultMessageHandler();
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
    dispatch_release((dispatch_object_t)self->fInternalQueue);
    self->fInternalQueue = 0;
  }
}

- (void)retrocomputeStatusWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  void *v22;
  const char *v23;
  char *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[8];
  std::__shared_weak_count *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMVO2MaxRetrocomputeManager.mm"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, (uint64_t)CFSTR("CMErrorDomain"), 108, 0);
LABEL_25:
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, v27[3], 0, 0, v18);
    goto LABEL_26;
  }
  if (!self->fLocationdConnection)
  {
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v19 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "Error in retrocomputeStatusWithHandler: invalid locationd connection", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMVO2MaxRetrocomputeManager retrocomputeStatusWithHandler:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
    goto LABEL_25;
  }
  objc_msgSend_copy(a3, v7, v8, v9, v10);
  sub_18F337958("kCLConnectionMessageVO2MaxRetrocomputeStatusQuery", buf);
  v25 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v25)
  {
    v13 = (unint64_t *)&v25->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v15 = v31;
  if (v31)
  {
    v16 = (unint64_t *)&v31->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_26:
  _Block_object_dispose(&v26, 8);
}

- (void)retrocomputeStateWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v23;
  const char *v24;
  char *v25;
  std::__shared_weak_count *v26;
  uint8_t buf[8];
  std::__shared_weak_count *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMVO2MaxRetrocomputeManager.mm"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (self->fLocationdConnection)
    {
      objc_msgSend_copy(a3, v7, v8, v9, v10);
      sub_18F337958("kCLConnectionMessageVO2MaxRetrocomputeStatusQuery", buf);
      v26 = v28;
      if (v28)
      {
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v26)
      {
        v13 = (unint64_t *)&v26->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v15 = v28;
      if (v28)
      {
        v16 = (unint64_t *)&v28->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
    }
    else
    {
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v19 = qword_1EE16D410;
      if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "Error in retrocomputeStateWithHandler: invalid locationd connection", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D418 != -1)
          dispatch_once(&qword_1EE16D418, &unk_1E2957300);
        v25 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMVO2MaxRetrocomputeManager retrocomputeStateWithHandler:]", "CoreLocation: %s\n", v25);
        if (v25 != (char *)buf)
          free(v25);
      }
      v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
      (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v21);
    }
  }
  else
  {
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, (uint64_t)CFSTR("CMErrorDomain"), 108, 0);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v18);
  }
}

- (void)triggerRetrocomputeWithHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  char *v18;
  std::__shared_weak_count *v19;
  uint8_t buf[8];
  std::__shared_weak_count *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend_copy(a3, v4, v5, v6, v7);
    sub_18F3ED7F0("kCLConnectionMessageTriggerVO2MaxRetrocompute", buf);
    v19 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v19)
    {
      v10 = (unint64_t *)&v19->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v12 = v21;
    if (v21)
    {
      v13 = (unint64_t *)&v21->__shared_owners_;
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
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v15 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEBUG, "VO2MaxRetrocompute is not enabled", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager triggerRetrocomputeWithHandler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, (uint64_t)CFSTR("CMErrorDomain"), 108, 0);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v17);
  }
}

- (void)startRetrocomputeStatusUpdates
{
  NSObject *v3;
  NSObject *fInternalQueue;
  NSObject *v5;
  id Weak;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD block[5];
  __int16 v14;
  uint8_t buf[1640];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v3 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Starting retrocompute status updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v14 = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager startRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F40B004;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_async(fInternalQueue, block);
  }
  else
  {
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v5 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEBUG, "Not starting retrocompute status updates; VO2MaxRetrocompute is not enabled",
        buf,
        2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v14 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager startRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      Weak = objc_loadWeak((id *)&self->_delegate);
      v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, (uint64_t)CFSTR("CMErrorDomain"), 108, 0);
      objc_msgSend_vo2MaxRetrocomputeManager_updateFailedWithError_(Weak, v9, (uint64_t)self, v8, v10);
    }
  }
}

- (void)stopRetrocomputeStatusUpdates
{
  NSObject *v3;
  NSObject *fInternalQueue;
  NSObject *v5;
  char *v6;
  char *v7;
  _QWORD block[5];
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v3 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping retrocompute status updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v9 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager stopRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf)
        free(v6);
    }
    fInternalQueue = self->fInternalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F40BA54;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_async(fInternalQueue, block);
  }
  else
  {
    if (qword_1EE16D418 != -1)
      dispatch_once(&qword_1EE16D418, &unk_1E2957300);
    v5 = qword_1EE16D410;
    if (os_log_type_enabled((os_log_t)qword_1EE16D410, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEBUG, "Not attempting to stop retrocompute status updates; VO2MaxRetrocompute is not enabled",
        buf,
        2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D418 != -1)
        dispatch_once(&qword_1EE16D418, &unk_1E2957300);
      v9 = 0;
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMVO2MaxRetrocomputeManager stopRetrocomputeStatusUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
}

- (CMVO2MaxRetrocomputeDelegate)delegate
{
  return (CMVO2MaxRetrocomputeDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
