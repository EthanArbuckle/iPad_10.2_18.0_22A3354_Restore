@implementation CMMotionAlarmManagerInternal

- (CMMotionAlarmManagerInternal)init
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *__p[2];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMMotionAlarmManagerInternal;
  v2 = -[CMMotionAlarmManagerInternal init](&v12, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMMotionAlarmManager", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v11 < 0)
      operator delete(__p[0]);
    *((_QWORD *)v2 + 3) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_BYTE *)v2 + 32) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    v9 = MEMORY[0x1E0C809B0];
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
    objc_msgSend__startListeners(v2, v4, v5, v6, v7, v9, 3221225472, sub_18F3E1388, &unk_1E2955938, v2);
  }
  return (CMMotionAlarmManagerInternal *)v2;
}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3E1620;
  block[3] = &unk_1E2955938;
  block[4] = a1;
  if (qword_1ECEDF8D8 != -1)
    dispatch_once(&qword_1ECEDF8D8, block);
  return (id)qword_1ECEDF8E0;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend__teardown(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)CMMotionAlarmManagerInternal;
  -[CMMotionAlarmManagerInternal dealloc](&v6, sel_dealloc);
}

- (void)_teardown
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D3F8 != -1)
    dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
  v3 = qword_1EE16D3F0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_INFO, "Tearing down CMMotionAlarmManagerInternal", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionAlarmManagerInternal _teardown]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  objc_msgSend__stopListeners(self, v4, v5, v6, v7);
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  if (self->fLocationdConnection)
  {
    v8 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v8, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;

  self->fAlarms = 0;
}

- (void)_startListeners
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3E18AC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_stopListeners
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3E1B9C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (BOOL)_registerAlarm:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *fAlarms;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  BOOL v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  char *v53;
  char *v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  const __CFString *v57;
  id v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint8_t buf[8];
  std::__shared_weak_count *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!objc_msgSend_manager(a3, v7, v8, v9, v10)
    || (v15 = (void *)objc_msgSend_manager(a3, v11, v12, v13, v14), !objc_msgSend_delegate(v15, v16, v17, v18, v19)))
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v41 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_ERROR, "Unable to register motion alarm. No delegate assigned.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(v56) = 0;
      v53 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _registerAlarm:error:]", "CoreLocation: %s\n", v53);
      if (v53 != (char *)buf)
        free(v53);
    }
    if (a4)
    {
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      v62 = CFSTR("Missing alarm manager and/or delegate");
      v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)&v62, (uint64_t)&v61, 1);
      v46 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v43, v45, (uint64_t)CFSTR("CMErrorDomain"), 103, v44);
LABEL_33:
      v40 = 0;
      *a4 = v46;
      goto LABEL_35;
    }
LABEL_34:
    v40 = 0;
    goto LABEL_35;
  }
  if (!a3 || !objc_msgSend_name(a3, v20, v21, v22, v23))
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v47 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v47, OS_LOG_TYPE_ERROR, "Unable to register motion alarm. Invalid alarm object.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(v56) = 0;
      v54 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _registerAlarm:error:]", "CoreLocation: %s\n", v54);
      if (v54 != (char *)buf)
        free(v54);
    }
    if (a4)
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = CFSTR("Invalid alarm object");
      v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)&v60, (uint64_t)&v59, 1);
      v46 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(v49, v51, (uint64_t)CFSTR("CMErrorDomain"), 107, v50);
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  fAlarms = self->fAlarms;
  v29 = objc_msgSend_name(a3, v24, v25, v26, v27);
  objc_msgSend_setObject_forKey_(fAlarms, v30, (uint64_t)a3, v29, v31);
  v57 = CFSTR("CMMotionAlarmKey");
  v58 = a3;
  v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)&v58, (uint64_t)&v57, 1);
  sub_18F352BEC("kCLConnectionMessageMotionAlarmRegister", &v56, buf);
  v55 = v64;
  if (v64)
  {
    p_shared_owners = (unint64_t *)&v64->__shared_owners_;
    do
      v34 = __ldxr(p_shared_owners);
    while (__stxr(v34 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v55)
  {
    v35 = (unint64_t *)&v55->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  v37 = v64;
  if (v64)
  {
    v38 = (unint64_t *)&v64->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  v40 = 1;
LABEL_35:
  objc_sync_exit(self);
  return v40;
}

- (BOOL)_unregisterAlarm:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  BOOL v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  char *v42;
  char *v43;
  id v44[2];
  std::__shared_weak_count *v45;
  _QWORD *v46;
  std::__shared_weak_count *v47;
  const __CFString *v48;
  id v49;
  void *__p[2];
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!objc_msgSend_manager(a3, v7, v8, v9, v10)
    || (v15 = (void *)objc_msgSend_manager(a3, v11, v12, v13, v14), !objc_msgSend_delegate(v15, v16, v17, v18, v19)))
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v36 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v36, OS_LOG_TYPE_ERROR, "Unable to unregister motion alarm. No delegate assigned.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(v46) = 0;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _unregisterAlarm:error:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)__p)
        free(v42);
    }
    if (a4)
    {
      v38 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
LABEL_34:
      v35 = 0;
      *a4 = v38;
      goto LABEL_36;
    }
LABEL_35:
    v35 = 0;
    goto LABEL_36;
  }
  if (!a3 || !objc_msgSend_name(a3, v20, v21, v22, v23))
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v39 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v39, OS_LOG_TYPE_ERROR, "Unable to unregister motion alarm. Invalid alarm object.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(v46) = 0;
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _unregisterAlarm:error:]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)__p)
        free(v43);
    }
    if (a4)
    {
      v38 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v40, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v48 = CFSTR("CMMotionAlarmKey");
  v49 = a3;
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)&v49, (uint64_t)&v48, 1);
  v26 = (std::__shared_weak_count *)operator new(0x70uLL);
  v26->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v26->__shared_owners_;
  v26->__shared_weak_owners_ = 0;
  v26->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageMotionAlarmUnregister");
  MEMORY[0x19400103C](&v26[1], __p, v25);
  if (v51 < 0)
    operator delete(__p[0]);
  v46 = &v26[1].__vftable;
  v47 = v26;
  objc_initWeak(__p, self);
  v44[1] = &v26[1];
  v45 = v26;
  do
    v28 = __ldxr(p_shared_owners);
  while (__stxr(v28 + 1, p_shared_owners));
  objc_copyWeak(v44, __p);
  CLConnectionClient::sendMessage();
  v29 = v45;
  if (v45)
  {
    v30 = (unint64_t *)&v45->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  objc_destroyWeak(v44);
  objc_destroyWeak(__p);
  v32 = v47;
  if (v47)
  {
    v33 = (unint64_t *)&v47->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = 1;
LABEL_36:
  objc_sync_exit(self);
  return v35;
}

- (BOOL)_acknowledgeAlarm:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  char *v23;
  id v24[2];
  std::__shared_weak_count *v25;
  uint64_t v26;
  id location;
  const __CFString *v28;
  uint64_t v29;
  uint8_t buf[8];
  std::__shared_weak_count *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v10 = objc_msgSend_objectForKey_(self->fAlarms, v7, (uint64_t)a3, v8, v9);
  if (v10)
  {
    objc_initWeak(&location, self);
    v28 = CFSTR("CMMotionAlarmKey");
    v29 = v10;
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)&v29, (uint64_t)&v28, 1);
    sub_18F3E4CEC("kCLConnectionMessageMotionAlarmAcknowledge", &v26, buf);
    v24[1] = *(id *)buf;
    v25 = v31;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    objc_copyWeak(v24, &location);
    CLConnectionClient::sendMessage();
    v14 = v25;
    if (v25)
    {
      v15 = (unint64_t *)&v25->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    objc_destroyWeak(v24);
    v17 = v31;
    if (v31)
    {
      v18 = (unint64_t *)&v31->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v20 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_ERROR, "Unable to acknowledge alarm, alarm does not exist.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(location) = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _acknowledgeAlarm:error:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
    if (a4)
      *a4 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v21, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
  }
  objc_sync_exit(self);
  return v10 != 0;
}

- (BOOL)_launchRemoteAppWithError:(id *)a3 delegate:(id)a4
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *__p[2];
  char v14;

  objc_sync_enter(self);
  v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageMotionAlarmLaunchRemoteApplication");
  MEMORY[0x19400103C](&v5[1], __p, MEMORY[0x1E0C9AA70]);
  if (v14 < 0)
    operator delete(__p[0]);
  do
    v7 = __ldxr(p_shared_owners);
  while (__stxr(v7 + 1, p_shared_owners));
  CLConnectionClient::sendMessage();
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (v5)
  {
    v10 = (unint64_t *)&v5->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  objc_sync_exit(self);
  return 1;
}

- (void)_handleAlarmFire:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *fAlarms;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _QWORD *v40;
  NSObject *v41;
  char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD v53[5];
  _QWORD block[6];
  int v55;
  uint64_t v56;
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("CMMotionAlarmKey"), v3, v4);
  if (v7 && (v12 = v7, objc_msgSend_name(v7, v8, v9, v10, v11)))
  {
    objc_sync_enter(self);
    fAlarms = self->fAlarms;
    v18 = objc_msgSend_name(v12, v14, v15, v16, v17);
    v22 = (void *)objc_msgSend_objectForKey_(fAlarms, v19, v18, v20, v21);
    v27 = v22;
    if (v22 && (objc_msgSend_isValid(v22, v23, v24, v25, v26) & 1) != 0)
    {
      objc_msgSend_copyPropertiesFromAlarm_(v27, v28, (uint64_t)v12, v29, v30);
      v34 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v31, (uint64_t)CFSTR("CMErrorMessage"), v32, v33);
      if (objc_msgSend_intValue(v34, v35, v36, v37, v38) == 100)
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = sub_18F3E4904;
        v53[3] = &unk_1E2955938;
        v53[4] = v27;
        v39 = MEMORY[0x1E0C80D38];
        v40 = v53;
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_18F3E485C;
        block[3] = &unk_1E29559D0;
        block[4] = v27;
        block[5] = v34;
        v39 = MEMORY[0x1E0C80D38];
        v40 = block;
      }
      dispatch_async(v39, v40);
    }
    else
    {
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      v43 = qword_1EE16D3F0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = objc_msgSend_name(v12, v44, v45, v46, v47);
        _os_log_impl(&dword_18F1DC000, v43, OS_LOG_TYPE_ERROR, "Unable to fire motion alarm %@. Could not locate valid alarm to fire.", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D3F8 != -1)
          dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
        v55 = 138412290;
        v56 = objc_msgSend_name(v12, v48, v49, v50, v51);
        v52 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _handleAlarmFire:]", "CoreLocation: %s\n", v52);
        if (v52 != (char *)buf)
          free(v52);
      }
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
    v41 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_ERROR, "Unable to fire motion alarm. Received invalid message response.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29450C8);
      LOWORD(v55) = 0;
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarmManagerInternal _handleAlarmFire:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf)
        free(v42);
    }
  }
}

@end
