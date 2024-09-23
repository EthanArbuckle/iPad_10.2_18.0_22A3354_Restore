@implementation CMWakeGestureManager

+ (id)sharedManager
{
  if (qword_1ECEDF0B0 != -1)
    dispatch_once(&qword_1ECEDF0B0, &unk_1E2953108);
  return (id)qword_1ECEDF0B8;
}

+ (BOOL)isWakeGestureAvailable
{
  NSObject *v2;
  int v3;
  int v4;
  uint8_t *v5;
  NSObject *v6;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (sub_18F4E0194())
  {
    sub_18F1F77DC();
    if (!sub_18F1E1B00())
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v2 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_FAULT, "wake gesture should not be default-enabled on iPad", buf, 2u);
    }
    v3 = sub_18F1FCA08(115, 0);
    LOBYTE(v4) = 0;
    if (v3)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMWakeGestureManager isWakeGestureAvailable]", "CoreLocation: %s\n");
LABEL_19:
      if (v5 != buf)
        free(v5);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v6 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "WakeGesture does not run on this platform", buf, 2u);
    }
    v4 = sub_18F1FCA08(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "+[CMWakeGestureManager isWakeGestureAvailable]", "CoreLocation: %s\n");
      goto LABEL_19;
    }
  }
  return v4;
}

+ (BOOL)isWakeGestureOverrideEnabled
{
  return 0;
}

+ (BOOL)hasSlowBootArgs
{
  if (qword_1EE16E720 != -1)
    dispatch_once(&qword_1EE16E720, &unk_1E2955388);
  return byte_1EE16DDF8;
}

- (void)setDelegate:(id)a3
{
  NSObject *fDispatchQ;
  _QWORD block[5];

  objc_storeWeak((id *)&self->fUpdatedDelegate, a3);
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F395578;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fDispatchQ, block);
}

- (CMWakeGestureDelegate)delegate
{
  return (CMWakeGestureDelegate *)objc_loadWeak((id *)&self->fUpdatedDelegate);
}

- (CMWakeGestureManager)initWithQueue:(id)a3
{
  unsigned __int8 *v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  mach_port_t v39;
  IONotificationPort *v40;
  io_service_t MatchingService;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  int *v48;
  char v49;
  unint64_t *v50;
  unint64_t v51;
  NSObject *v52;
  int v53;
  uint64_t v55;
  int v56;
  char *v57;
  int v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  objc_super v64;
  int v65;
  uint64_t v66;
  __int16 v67;
  int v68;
  _BYTE buf[1638];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)CMWakeGestureManager;
  v4 = -[CMWakeGestureManager init](&v64, sel_init);
  if (sub_18F4E0194())
  {
    if (!v4)
      return (CMWakeGestureManager *)v4;
    v5 = (_QWORD *)operator new();
    *v5 = &off_1E294ACE0;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = 0;
    v6 = *((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v5;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    *((_QWORD *)v4 + 6) = 0;
    *((_QWORD *)v4 + 11) = 0;
    if (a3)
    {
      dispatch_retain((dispatch_object_t)a3);
      *((_QWORD *)v4 + 1) = a3;
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v7 = qword_1ECEDEE10;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_INFO))
      {
        v8 = *((_QWORD *)v4 + 1);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_INFO, "CLGestureService with external dispatch queue %p", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_24;
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 == -1)
      {
LABEL_72:
        v62 = *((_QWORD *)v4 + 1);
        v65 = 134217984;
        v66 = v62;
        v63 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v63);
        if (v63 != buf)
          free(v63);
LABEL_24:
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = (void *)objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v14, v15, v16, v17);
        v23 = objc_msgSend_processName(v18, v19, v20, v21, v22);
        v27 = (void *)objc_msgSend_initWithString_(v13, v24, v23, v25, v26);
        *((_QWORD *)v4 + 14) = v27;
        v4[120] = objc_msgSend_isEqualToString_(v27, v28, (uint64_t)CFSTR("SpringBoard"), v29, v30);
        if (qword_1ECEDEE18 != -1)
          dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
        v31 = qword_1ECEDEE10;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *((_QWORD *)v4 + 14);
          v33 = v4[120];
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 1026;
          *(_DWORD *)&buf[14] = v33;
          _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEFAULT, "Process: %{public}@, IsPrimary: %{public}d", buf, 0x12u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE18 != -1)
            dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
          v55 = *((_QWORD *)v4 + 14);
          v56 = v4[120];
          v65 = 138543618;
          v66 = v55;
          v67 = 1026;
          v68 = v56;
          v57 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v57);
          if (v57 != buf)
            free(v57);
        }
        objc_msgSend_loadPreferences(v4, v34, v35, v36, v37);
        if (v4[120])
        {
          v38 = (_QWORD *)operator new();
          *v38 = off_1E294C238;
          *v38 = &off_1E294C548;
          v38[1] = 0;
          v38[2] = sub_18F3962D0;
          v38[3] = v4;
          *((_QWORD *)v4 + 4) = v38;
          if (qword_1EE16E8C8 != -1)
            dispatch_once(&qword_1EE16E8C8, &unk_1E2954208);
          sub_18F1F4F0C(qword_1EE16E8C0, 0, *((_QWORD *)v4 + 4), -1.0);
          v39 = *MEMORY[0x1E0CBBAA8];
          v40 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
          *((_QWORD *)v4 + 9) = v40;
          IONotificationPortSetDispatchQueue(v40, *((dispatch_queue_t *)v4 + 1));
          MatchingService = IOServiceGetMatchingService(v39, (CFDictionaryRef)&unk_1E298C0A0);
          *((_DWORD *)v4 + 21) = MatchingService;
          if (IOServiceAddInterestNotification(*((IONotificationPortRef *)v4 + 9), MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)j__objc_msgSend_onBacklightServiceUpdated_, v4, (io_object_t *)v4 + 20))
          {
            if (qword_1ECEDEE18 != -1)
              dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
            v42 = qword_1ECEDEE10;
            if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_DEFAULT, "Failed to register for backlight service notification", buf, 2u);
            }
            if (sub_18F1FCA08(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1ECEDEE18 != -1)
                dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
              LOWORD(v65) = 0;
              v61 = (char *)_os_log_send_and_compose_impl();
              sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v61);
              if (v61 != buf)
                free(v61);
            }
          }
        }
        *((_QWORD *)v4 + 8) = 0;
        v4[128] = 1;
        v43 = sub_18F204AE4();
        v44 = *(_QWORD *)(v43 + 24);
        v45 = *(std::__shared_weak_count **)(v43 + 32);
        *(_QWORD *)buf = v44;
        *(_QWORD *)&buf[8] = v45;
        if (v45)
        {
          p_shared_owners = (unint64_t *)&v45->__shared_owners_;
          do
            v47 = __ldxr(p_shared_owners);
          while (__stxr(v47 + 1, p_shared_owners));
        }
        v48 = (int *)(v4 + 132);
        v49 = sub_18F1E4DFC(v44, "NightStandThreshold", (_DWORD *)v4 + 33);
        if (v45)
        {
          v50 = (unint64_t *)&v45->__shared_owners_;
          do
            v51 = __ldaxr(v50);
          while (__stlxr(v51 - 1, v50));
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
        }
        if ((v49 & 1) == 0)
          *v48 = 0;
        if (qword_1ECEDEE18 != -1)
          dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
        v52 = qword_1ECEDEE10;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
        {
          v53 = *v48;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v53;
          _os_log_impl(&dword_18F1DC000, v52, OS_LOG_TYPE_DEFAULT, "NightStandThreshold (STD),Override,%{public}d", buf, 8u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE18 != -1)
            dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
          v58 = *v48;
          v65 = 67240192;
          LODWORD(v66) = v58;
          v59 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v59);
          if (v59 != buf)
            free(v59);
        }
        v4[136] = 0;
        return (CMWakeGestureManager *)v4;
      }
    }
    else
    {
      v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      *((_QWORD *)v4 + 1) = dispatch_queue_create("com.apple.CoreMotion.CMWakeGesturePhonePrivateQueue", v10);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v11 = qword_1ECEDEE10;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_INFO))
      {
        v12 = *((_QWORD *)v4 + 1);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_INFO, "CLGestureService with internally created dispatch queue %p", buf, 0xCu);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_24;
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 == -1)
        goto LABEL_72;
    }
    dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    goto LABEL_72;
  }
  if (qword_1ECEDEE18 != -1)
    dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
  v9 = qword_1ECEDEE10;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "Could not create instance of CLGestureService. Is wake gesture supported on this platform?", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    LOWORD(v65) = 0;
    v60 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMWakeGestureManager initWithQueue:]", "CoreLocation: %s\n", v60);
    if (v60 != buf)
      free(v60);
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *fDispatchQ;
  int fLockScreenToken;
  objc_super v8;

  objc_msgSend_stopWakeGestureUpdates(self, a2, v2, v3, v4);
  fDispatchQ = self->fDispatchQ;
  if (fDispatchQ)
  {
    dispatch_release(fDispatchQ);
    self->fDispatchQ = 0;
  }
  fLockScreenToken = self->fLockScreenToken;
  if (fLockScreenToken != -1)
    notify_cancel(fLockScreenToken);
  v8.receiver = self;
  v8.super_class = (Class)CMWakeGestureManager;
  -[CMWakeGestureManager dealloc](&v8, sel_dealloc);
}

- (void)startWakeGestureUpdates
{
  NSObject *v3;
  NSObject *fDispatchQ;
  NSObject *v5;
  char *v6;
  char *v7;
  _QWORD block[5];
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (sub_18F4E0194())
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v3 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Start Wake Gesture Updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v9 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager startWakeGestureUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf)
        free(v6);
    }
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F396640;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_async(fDispatchQ, block);
  }
  else
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v5 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_FAULT, "Unable to start wake gesture updates, service does not exist", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v9 = 0;
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWakeGestureManager startWakeGestureUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
}

- (void)stopWakeGestureUpdates
{
  NSObject *v3;
  NSObject *fDispatchQ;
  NSObject *v5;
  char *v6;
  char *v7;
  _QWORD block[5];
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (sub_18F4E0194())
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v3 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stop Wake Gesture Updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v9 = 0;
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager stopWakeGestureUpdates]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf)
        free(v6);
    }
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F396AA8;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(fDispatchQ, block);
  }
  else
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v5 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_FAULT, "Unable to start wake gesture updates, service does not exist", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v9 = 0;
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWakeGestureManager stopWakeGestureUpdates]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
}

- (void)setBacklightState:(int64_t)a3
{
  _BOOL4 v5;
  CFAbsoluteTime Current;
  uint64_t v7;
  BOOL fIsDisplayActive;
  uint64_t v9;
  NSObject *fDispatchQ;
  NSObject *v11;
  char *v12;
  _QWORD block[6];
  BOOL v14;
  BOOL v15;
  _QWORD v16[4];
  BOOL v17;
  __int16 v18;
  uint8_t buf[1640];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->fIsRunningInPrimaryProcess)
  {
    v5 = (unint64_t)(a3 - 1) < 2;
    Current = -1.0;
    if ((unint64_t)(a3 - 1) <= 1)
      Current = CFAbsoluteTimeGetCurrent();
    self->fLastDisplayOnTime = Current;
    v7 = MEMORY[0x1E0C809B0];
    fIsDisplayActive = v5;
    if (self->fIsDisplayActive != v5)
    {
      v9 = sub_18F204AE4();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = sub_18F396DD4;
      v16[3] = &unk_1E29564D0;
      v17 = v5;
      sub_18F1F6514(v9, (uint64_t)v16);
      fIsDisplayActive = self->fIsDisplayActive;
    }
    self->fIsDisplayActive = v5;
    fDispatchQ = self->fDispatchQ;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = sub_18F396F80;
    block[3] = &unk_1E29564F8;
    v14 = v5;
    v15 = fIsDisplayActive;
    block[4] = self;
    block[5] = a3;
    dispatch_async(fDispatchQ, block);
  }
  else
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v11 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_FAULT, "Only set backlight from primary process.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v18 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMWakeGestureManager setBacklightState:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
}

+ (int64_t)toState:(unsigned __int8)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return qword_18F506140[(char)(a3 - 1)];
}

+ (unsigned)toRaw:(int64_t)a3
{
  unsigned int v3;

  v3 = 0x2030100u >> (8 * a3);
  if ((unint64_t)a3 >= 4)
    LOBYTE(v3) = 0;
  return v3 & 3;
}

- (BOOL)simulateGestureWithDelay:(double)a3 Duration:(double)a4
{
  NSObject *fDispatchQ;
  char v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F397254;
  block[3] = &unk_1E2956520;
  block[4] = &v8;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(fDispatchQ, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)simulateGesture:(int64_t)a3 after:(double)a4
{
  NSObject *fDispatchQ;
  _QWORD block[7];

  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F397368;
  block[3] = &unk_1E2956548;
  block[4] = self;
  block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(fDispatchQ, block);
}

- (BOOL)setNightStandWakeEnabled:(BOOL)a3 withConfiguration:(int64_t)a4
{
  _BOOL4 v5;
  int fNightStandThreshold;
  int v8;
  NSObject *v9;
  NSObject *fDispatchQ;
  char *v12;
  _QWORD block[4];
  int v14;
  char v15;
  int v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  int v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  self->fNightStandModeEnabled = 0;
  if (a3)
  {
    self->fNightStandModeEnabled = 1;
    if (a4 == 1)
    {
      LOBYTE(fNightStandThreshold) = 24;
    }
    else if (a4 == 2)
    {
      LOBYTE(fNightStandThreshold) = 10;
    }
    else
    {
      fNightStandThreshold = self->fNightStandThreshold;
    }
    v8 = 3;
  }
  else
  {
    v8 = 0;
    LOBYTE(fNightStandThreshold) = 0;
  }
  if (qword_1ECEDEE18 != -1)
    dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
  v9 = qword_1ECEDEE10;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240960;
    v25 = v8;
    v26 = 1026;
    v27 = v5;
    v28 = 2050;
    v29 = a4;
    v30 = 1026;
    v31 = fNightStandThreshold;
    _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "Setting night stand mode on phone,%{public}d,enable,%{public}d,config,%{public}ld,option,%{public}d", buf, 0x1Eu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v16 = 67240960;
    v17 = v8;
    v18 = 1026;
    v19 = v5;
    v20 = 2050;
    v21 = a4;
    v22 = 1026;
    v23 = fNightStandThreshold;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager setNightStandWakeEnabled:withConfiguration:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F397810;
  block[3] = &unk_1E2956568;
  v14 = v8;
  v15 = fNightStandThreshold;
  dispatch_async(fDispatchQ, block);
  return 1;
}

- (void)invokeDelegateWithState:(int64_t)a3
{
  NSObject *fDispatchQ;
  _QWORD v4[6];

  fDispatchQ = self->fDispatchQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F397A04;
  v4[3] = &unk_1E2956590;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fDispatchQ, v4);
}

- (void)loadPreferences
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  BOOL *p_fEnableLatencyAlert;
  char v9;
  char v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  int *p_fLatencyAlertThreshold;
  char v19;
  char v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  BOOL *p_fEnableAudioAlert;
  char v29;
  char v30;
  unint64_t *v31;
  unint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  int v35;
  _BOOL4 v36;
  char *v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = sub_18F204AE4();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(std::__shared_weak_count **)(v3 + 32);
  *(_QWORD *)buf = v4;
  v39 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  p_fEnableLatencyAlert = &self->fEnableLatencyAlert;
  v9 = sub_18F1EE944(v4, "EnableWakeGestureLatencyAlert", &self->fEnableLatencyAlert);
  v10 = v9;
  if (!v5)
    goto LABEL_8;
  v11 = (unint64_t *)&v5->__shared_owners_;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (v12)
  {
LABEL_8:
    if ((v9 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  if ((v10 & 1) == 0)
LABEL_9:
    *p_fEnableLatencyAlert = 0;
LABEL_10:
  v13 = sub_18F204AE4();
  v14 = *(_QWORD *)(v13 + 24);
  v15 = *(std::__shared_weak_count **)(v13 + 32);
  *(_QWORD *)buf = v14;
  v39 = v15;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  p_fLatencyAlertThreshold = &self->fLatencyAlertThreshold;
  v19 = sub_18F1E4DFC(v14, "WakeGestureLatencyAlertThreshold", &self->fLatencyAlertThreshold);
  v20 = v19;
  if (!v15)
    goto LABEL_17;
  v21 = (unint64_t *)&v15->__shared_owners_;
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (v22)
  {
LABEL_17:
    if ((v19 & 1) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  if ((v20 & 1) == 0)
LABEL_18:
    *p_fLatencyAlertThreshold = 500;
LABEL_19:
  v23 = sub_18F204AE4();
  v24 = *(_QWORD *)(v23 + 24);
  v25 = *(std::__shared_weak_count **)(v23 + 32);
  *(_QWORD *)buf = v24;
  v39 = v25;
  if (v25)
  {
    v26 = (unint64_t *)&v25->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  p_fEnableAudioAlert = &self->fEnableAudioAlert;
  v29 = sub_18F1EE944(v24, "EnableWakeGestureHaptic", p_fEnableAudioAlert);
  v30 = v29;
  if (!v25)
    goto LABEL_26;
  v31 = (unint64_t *)&v25->__shared_owners_;
  do
    v32 = __ldaxr(v31);
  while (__stlxr(v32 - 1, v31));
  if (v32)
  {
LABEL_26:
    if ((v29 & 1) != 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  if ((v30 & 1) == 0)
LABEL_27:
    *p_fEnableAudioAlert = 0;
LABEL_28:
  if (qword_1ECEDEE18 != -1)
    dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
  v33 = qword_1ECEDEE10;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_INFO))
  {
    v34 = *p_fEnableLatencyAlert;
    v35 = *p_fLatencyAlertThreshold;
    v36 = *p_fEnableAudioAlert;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v34;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v35;
    HIWORD(v39) = 1024;
    v40 = v36;
    _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_INFO, "Loaded Preferences. Latency Alert: %d, Latency Threshold: %d, Audio Alert: %d", buf, 0x14u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager loadPreferences]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf)
      free(v37);
  }
}

- (void)playAlert
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1E0C92150] && self->fIsRunningInPrimaryProcess)
  {
    dispatch_async((dispatch_queue_t)self->fDispatchQ, &unk_1E2955288);
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v2 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_DEBUG, "Vibrate", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v3 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager playAlert]", "CoreLocation: %s\n", v3);
      if (v3 != (char *)buf)
        free(v3);
    }
  }
}

- (void)logWakeLatency
{
  void *v3;
  double v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int hasSlowBootArgs;
  NSObject *v18;
  const __CFString *v19;
  char *v20;
  size_t v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->fIsRunningInPrimaryProcess)
  {
    v21 = 8;
    v22 = 0;
    sysctlbyname("machdep.wake_abstime", &v22, &v21, 0, 0);
    v3 = (void *)IORegistryEntrySearchCFProperty(self->backlightService, "IOService", CFSTR("displayOnTimestamp"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    if (v3)
    {
      v4 = sub_18F1FD20C(v22);
      v9 = objc_msgSend_unsignedLongLongValue(v3, v5, v6, v7, v8);
      v10 = sub_18F1FD20C(v9);
      v11 = (unint64_t)((v4 - self->fWakePacketTimestamp) * 1000.0);
      v12 = (unint64_t)((v10 - v4) * 1000.0);
      hasSlowBootArgs = objc_msgSend_hasSlowBootArgs(CMWakeGestureManager, v13, v14, v15, v16);
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v18 = qword_1ECEDEE10;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        v30 = hasSlowBootArgs;
        v31 = 2048;
        v32 = v11;
        v33 = 2048;
        v34 = v12;
        _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEFAULT, "hasSlowBootArgs,%d,gesture2xnu,%llu,xnu2Backlight,%llu", buf, 0x1Cu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE18 != -1)
          dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
        v23 = 67109632;
        v24 = hasSlowBootArgs;
        v25 = 2048;
        v26 = v11;
        v27 = 2048;
        v28 = v12;
        v20 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager logWakeLatency]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf)
          free(v20);
      }
      if ((hasSlowBootArgs & 1) == 0)
        AnalyticsSendEventLazy();
      if (self->fEnableLatencyAlert && v11 + v12 > self->fLatencyAlertThreshold)
      {
        v19 = CFStringCreateWithFormat(0, 0, CFSTR("Slow boot-args? %d\ngesture2xnu: %llums\nxnu2Backlight: %llums"), hasSlowBootArgs, v11, v12);
        CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, CFSTR("Wake Delay"), v19, 0);
        CFRelease(v19);
      }
    }

  }
}

- (void)sendWakeTriggerAnalytics:(id)a3 withDisplay:(int)a4
{
  AnalyticsSendEventLazy();
}

+ (id)stringForNotification:(unsigned __int8)a3
{
  if (a3 > 8u)
    return &stru_1E295ADC8;
  else
    return off_1E2956670[(char)a3];
}

+ (id)stringForMode:(unsigned __int8)a3
{
  if (a3 > 3u)
    return &stru_1E295ADC8;
  else
    return off_1E29566B8[(char)a3];
}

+ (id)stringForStartPose:(unsigned __int8)a3
{
  if (a3 > 8u)
    return &stru_1E295ADC8;
  else
    return off_1E29566D8[(char)a3];
}

+ (id)stringForViewPose:(unsigned __int8)a3
{
  if (a3 > 9u)
    return &stru_1E295ADC8;
  else
    return off_1E2956720[(char)a3];
}

- (void)onNotificationControl:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  signed int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  char *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3, v4);
  v10 = (void *)objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("CMSendWakeGestureState"), v8, v9);
  if (v10)
  {
    v15 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
    v16 = v15;
    if (v15 < 5)
    {
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v20 = qword_1ECEDEE10;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v26) = v15;
        _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_INFO, "Gesture state updated to %{public}d", buf, 8u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE18 != -1)
          dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMWakeGestureManager onNotificationControl:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf)
          free(v24);
      }
      objc_msgSend_invokeDelegateWithState_(self, v21, v16, v22, v23);
    }
    else
    {
      if (qword_1ECEDEE18 != -1)
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
      v17 = qword_1ECEDEE10;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349056;
        v26 = v15;
        _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_FAULT, "Gesture state %{public}zd is invalid!", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE18 == -1)
        {
LABEL_16:
          v19 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMWakeGestureManager onNotificationControl:]", "CoreLocation: %s\n", v19);
          if (v19 != (char *)buf)
            free(v19);
          return;
        }
LABEL_29:
        dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
        goto LABEL_16;
      }
    }
  }
  else
  {
    if (qword_1ECEDEE18 != -1)
      dispatch_once(&qword_1ECEDEE18, &unk_1E2943860);
    v18 = qword_1ECEDEE10;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_FAULT, "Invalid CMSendWakeGestureNotification payload!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE18 == -1)
        goto LABEL_16;
      goto LABEL_29;
    }
  }
}

- (void)onWakeUpdated:(const Sample *)a3
{
  double v5;
  _OWORD *v6;
  NSObject *fDispatchQ;
  _QWORD block[5];
  id v9[3];
  _OWORD v10[2];
  id location;
  _OWORD v12[2];

  v5 = (double)*(unint64_t *)&a3->timestamp;
  v6 = *(_OWORD **)&a3->acceleration.x;
  v12[0] = *v6;
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)v6 + 12);
  objc_initWeak(&location, self);
  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F398D04;
  block[3] = &unk_1E2956600;
  objc_copyWeak(v9, &location);
  block[4] = self;
  v10[0] = v12[0];
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v12 + 12);
  v9[1] = *(id *)&v5;
  v9[2] = (id)a3;
  dispatch_async(fDispatchQ, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)onPowerStateUpdated:(const Sample *)a3
{
  NSObject *fDispatchQ;
  _QWORD block[5];
  id v7;
  id location;

  if (LODWORD(a3->timestamp) == -536870272 || LODWORD(a3->timestamp) == -536870288)
  {
    objc_initWeak(&location, self);
    fDispatchQ = self->fDispatchQ;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F3998A4;
    block[3] = &unk_1E2956628;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_async(fDispatchQ, block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)onBacklightServiceUpdated:(unsigned int)a3
{
  NSObject *fDispatchQ;
  _QWORD v6[5];
  id v7;
  unsigned int v8;
  id location;

  objc_initWeak(&location, self);
  fDispatchQ = self->fDispatchQ;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F39997C;
  v6[3] = &unk_1E2956650;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v6[4] = self;
  dispatch_async(fDispatchQ, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  CMWakeGestureVisitor *value;

  objc_destroyWeak((id *)&self->fDelegate);
  objc_destroyWeak((id *)&self->fUpdatedDelegate);
  value = self->fWakeGestureVisitor.__ptr_.__value_;
  self->fWakeGestureVisitor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CMWakeGestureVisitor *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (void)reenableDetectedStateRecognition
{
  NSObject *fDispatchQ;
  _QWORD block[5];

  fDispatchQ = self->fDispatchQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F399A84;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fDispatchQ, block);
}

+ (id)stringForGestureState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("Invalid");
  else
    return off_1E29594F0[a3];
}

@end
