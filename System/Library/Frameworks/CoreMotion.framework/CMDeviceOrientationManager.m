@implementation CMDeviceOrientationManager

+ (BOOL)isAvailable
{
  return 1;
}

+ (void)initialize
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  CFRunLoopRef Main;
  NSObject *v18;
  char *v19;
  uint8_t buf[1640];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v7 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v3, v4, v5, v6);
    if (objc_msgSend_isMainThread(v7, v8, v9, v10, v11)
      && (objc_msgSend_isMultiThreaded(MEMORY[0x1E0CB3978], v12, v13, v14, v15) & 1) == 0)
    {
      objc_msgSend_detachNewThreadSelector_toTarget_withObject_(MEMORY[0x1E0CB3978], v16, (uint64_t)sel_dummySelector_, (uint64_t)a1, 0);
    }
    if (!qword_1ECEDFE00)
    {
      Main = CFRunLoopGetMain();
      sub_18F1E50A4(Main);
    }
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v18 = off_1ECEDEE20;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEFAULT, "Orientation Manager initialized", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "+[CMDeviceOrientationManager initialize]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
  }
}

- (CMDeviceOrientationManager)init
{
  uint64_t v3;
  CMDeviceOrientationManager *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_18F206C74;
  v11 = sub_18F206BC4;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F471420;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMDeviceOrientationManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  CMDeviceOrientationManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMDeviceOrientationManager;
  v2 = -[CMDeviceOrientationManager init](&v9, sel_init);
  if (v2)
  {
    v2->_internal = objc_alloc_init(CMDeviceOrientationManagerInternal);
    objc_msgSend_onMotionPreferencesUpdated(v2, v3, v4, v5, v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_18F4714D4, CFSTR("com.apple.backboardd.loggingchanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_18F206C74;
  v6[4] = sub_18F206BC4;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F471600;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMDeviceOrientationManager;
  -[CMDeviceOrientationManager dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  _BYTE *internal;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  internal = self->_internal;
  v4 = (void *)MEMORY[0x194001B4C]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.backboardd.loggingchanged"), 0);
  if (internal[56])
  {
    v10 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v6, v7, v8, v9);
    objc_msgSend_removeObserver_(v10, v11, (uint64_t)self, v12, v13);
  }
  objc_msgSend_stopDeviceOrientationUpdatesPrivate(self, v6, v7, v8, v9);

  objc_autoreleasePoolPop(v4);
}

- (void)onMotionPreferencesUpdated
{
  char *internal;
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int *v9;
  char v10;
  char v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _BYTE *v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  int v36;
  char *v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  v4 = sub_18F204AE4();
  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(std::__shared_weak_count **)(v4 + 32);
  *(_QWORD *)buf = v5;
  v39 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = (int *)(internal + 52);
  v10 = sub_18F1E4DFC(v5, "OrientationCallbackMode", (_DWORD *)internal + 13);
  v11 = v10;
  if (!v6)
    goto LABEL_8;
  v12 = (unint64_t *)&v6->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (v13)
  {
LABEL_8:
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  if ((v11 & 1) == 0)
LABEL_9:
    *v9 = -1;
LABEL_10:
  v14 = sub_18F204AE4();
  v15 = *(_QWORD *)(v14 + 24);
  v16 = *(std::__shared_weak_count **)(v14 + 32);
  *(_QWORD *)buf = v15;
  v39 = v16;
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v19 = internal + 56;
  v20 = sub_18F1EE944(v15, "EnableOrientationNotification", (BOOL *)internal + 56);
  v25 = v20;
  if (!v16)
    goto LABEL_17;
  v26 = (unint64_t *)&v16->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (v27)
  {
LABEL_17:
    if ((v20 & 1) != 0)
      goto LABEL_18;
LABEL_23:
    *v19 = 0;
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
  std::__shared_weak_count::__release_weak(v16);
  if ((v25 & 1) == 0)
    goto LABEL_23;
LABEL_18:
  if (*v19)
  {
    v28 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v21, v22, v23, v24);
    objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(v28, v29, (uint64_t)self, (uint64_t)sel_onNotification_, (uint64_t)CFSTR("CMSetDeviceOrientationNotification"), 0, 4);
    goto LABEL_25;
  }
LABEL_24:
  v30 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v21, v22, v23, v24);
  objc_msgSend_removeObserver_(v30, v31, (uint64_t)self, v32, v33);
LABEL_25:
  if (qword_1ECEDEE28 != -1)
    dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
  v34 = off_1ECEDEE20;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
  {
    v35 = *v9;
    v36 = *v19;
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = v35;
    LOWORD(v39) = 1026;
    *(_DWORD *)((char *)&v39 + 2) = v36;
    _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_DEFAULT, "OrientationCallbackMode,%{public}d,EnableOrientationNotification,%{public}d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onMotionPreferencesUpdated]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf)
      free(v37);
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F471A44;
  v6[3] = &unk_1E29559D0;
  v6[4] = a3;
  v6[5] = self;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

+ (BOOL)isAlwaysOn
{
  return ((unint64_t)sub_18F1F7BFC() >> 6) & 1;
}

- (BOOL)isDeviceOrientationAvailable
{
  return sub_18F47A70C() != 0;
}

- (BOOL)isDeviceOrientationActive
{
  return *((_QWORD *)self->_internal + 2) != 0;
}

- (void)startDeviceOrientationUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  _DWORD *internal;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  char *v14;
  _QWORD v15[7];
  int v16;
  int v17;
  __int16 v18;
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (qword_1ECEDEE28 != -1)
    dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
  v8 = off_1ECEDEE20;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
  {
    v9 = internal[13];
    v10 = *((unsigned __int8 *)internal + 56);
    *(_DWORD *)buf = 67240448;
    v21 = v9;
    v22 = 1026;
    v23 = v10;
    _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "Starting orientation updates, callback mode %{public}d, enable %{public}d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v12 = internal[13];
    v13 = *((unsigned __int8 *)internal + 56);
    v16 = 67240448;
    v17 = v12;
    v18 = 1026;
    v19 = v13;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager startDeviceOrientationUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  kdebug_trace();
  v11 = sub_18F204AE4();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F471EE8;
  v15[3] = &unk_1E2955BD8;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  sub_18F1F5E28(v11, (uint64_t)v15);
}

- (void)stopDeviceOrientationUpdates
{
  _DWORD *internal;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  char *v10;
  _QWORD v11[5];
  int v12;
  int v13;
  __int16 v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (qword_1ECEDEE28 != -1)
    dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
  v4 = off_1ECEDEE20;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
  {
    v5 = internal[18];
    v6 = internal[22];
    *(_DWORD *)buf = 67240448;
    v17 = v5;
    v18 = 1026;
    v19 = v6;
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEFAULT, "Stopping orientation updates, latest %{public}d, last significant %{public}d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v8 = internal[18];
    v9 = internal[22];
    v12 = 67240448;
    v13 = v8;
    v14 = 1026;
    v15 = v9;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager stopDeviceOrientationUpdates]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  v7 = sub_18F204AE4();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F472108;
  v11[3] = &unk_1E2955938;
  v11[4] = self;
  sub_18F1F5E28(v7, (uint64_t)v11);
}

- (void)start
{
  ((void (*)(CMDeviceOrientationManager *, char *, _QWORD, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_startDeviceOrientationUpdatesToQueue_withHandler_, 0, 0);
}

- (void)stop
{
  ((void (*)(CMDeviceOrientationManager *, char *))MEMORY[0x1E0DE7D20])(self, sel_stopDeviceOrientationUpdates);
}

- (void)startDeviceOrientationUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  _QWORD *internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id location;

  internal = self->_internal;
  if (objc_msgSend_isDeviceOrientationAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4))
  {
    v9 = (id)internal[4];
    if (v9 != a3)
    {

      internal[4] = a3;
    }
    v10 = (id)internal[3];
    if (v10 != a4)
    {

      internal[3] = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (internal[2])
    {
      objc_initWeak(&location, self);
      v15 = sub_18F204AE4();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_18F4722E0;
      v22[3] = &unk_1E2956628;
      objc_copyWeak(&v23, &location);
      v22[4] = internal;
      sub_18F1F6514(v15, (uint64_t)v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      v16 = (_QWORD *)operator new();
      *v16 = off_1E294C238;
      *v16 = &off_1E294C628;
      v16[1] = 0;
      v16[2] = sub_18F4710C8;
      v16[3] = self;
      internal[2] = v16;
      v17 = sub_18F47A70C();
      sub_18F1F4F0C(v17, 0, internal[2], -1.0);
      objc_msgSend_signalAndReleaseSemaphoreIfNecessaryPrivate(self, v18, v19, v20, v21);
      internal[5] = dispatch_semaphore_create(0);
      *((_BYTE *)internal + 48) = 0;
      internal[8] = 0xBFF0000000000000;
      *((_DWORD *)internal + 18) = 0;
      *((_OWORD *)internal + 5) = *((_OWORD *)internal + 4);
    }
  }
}

- (void)stopDeviceOrientationUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  int v23;

  internal = self->_internal;
  if (objc_msgSend_isDeviceOrientationAvailable(self, a2, v2, v3, v4))
  {
    if (internal[2])
    {
      v11 = sub_18F47A70C();
      v12 = internal[2];
      v13 = sub_18F204AE4();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_18F1F5EE0;
      v22[3] = &unk_1E2956E98;
      v23 = 0;
      v22[4] = v11;
      v22[5] = v12;
      sub_18F1F5E28(v13, (uint64_t)v22);
      v14 = internal[2];
      if (v14)
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
      internal[2] = 0;
    }
    v15 = (void *)internal[4];
    if (v15)
    {

      internal[4] = 0;
    }
    v16 = (void *)internal[3];
    if (v16)
    {

      internal[3] = 0;
    }
    objc_msgSend_signalAndReleaseSemaphoreIfNecessaryPrivate(self, v7, v8, v9, v10);
    *((_OWORD *)internal + 5) = *((_OWORD *)internal + 4);
    v17 = mach_absolute_time();
    *((double *)internal + 8) = sub_18F1FD20C(v17);
    *((_DWORD *)internal + 18) = 0;
    objc_msgSend_updateAggregateDictionaryPrivate(self, v18, v19, v20, v21);
  }
}

- (void)signalAndReleaseSemaphoreIfNecessaryPrivate
{
  id internal;
  NSObject *v3;

  internal = self->_internal;
  v3 = *((_QWORD *)internal + 5);
  if (v3)
  {
    if (!*((_BYTE *)internal + 48))
    {
      dispatch_semaphore_signal(v3);
      *((_BYTE *)internal + 48) = 1;
      v3 = *((_QWORD *)internal + 5);
    }
    dispatch_release(v3);
    *((_QWORD *)internal + 5) = 0;
  }
}

- (void)setDeviceOrientationCallbackModePrivate:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  *((_DWORD *)self->_internal + 13) = a3;
  v4 = sub_18F204AE4();
  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(std::__shared_weak_count **)(v4 + 32);
  v12 = v5;
  v13 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v11 = a3;
  sub_18F36C944(v5, "OrientationCallbackMode", &v11);
  if (v6)
  {
    v9 = (unint64_t *)&v6->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)onDeviceOrientation:(const Sample *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  char *v8;
  unsigned int *internal;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double timestamp;
  $393C16A032292777F0C3725FFB2C0008 *p_acceleration;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t updated;
  void *v26;
  unsigned int v27;
  int *v28;
  CMDeviceOrientation *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  $393C16A032292777F0C3725FFB2C0008 *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  char *v61;
  _QWORD v62[6];
  int v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  double v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_orientationNotificationsDisabled(self, a2, (uint64_t)a3, v3, v4))
  {
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v7 = off_1ECEDEE20;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Notifications disabled", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      LOWORD(v63) = 0;
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
  else
  {
    internal = (unsigned int *)self->_internal;
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v10 = off_1ECEDEE20;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend_stringForOrientation_(self, v11, internal[18], v12, v13);
      v18 = objc_msgSend_stringForOrientation_(self, v15, LODWORD(a3->acceleration.x), v16, v17);
      timestamp = a3->timestamp;
      *(_DWORD *)buf = 138543874;
      v70 = v14;
      v71 = 2114;
      v72 = v18;
      v73 = 2050;
      v74 = timestamp;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "Received orientation. (%{public}@ to %{public}@) Timestamp %{public}f", buf, 0x20u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      v49 = objc_msgSend_stringForOrientation_(self, v46, internal[18], v47, v48);
      v53 = objc_msgSend_stringForOrientation_(self, v50, LODWORD(a3->acceleration.x), v51, v52);
      v54 = a3->timestamp;
      v63 = 138543874;
      v64 = v49;
      v65 = 2114;
      v66 = v53;
      v67 = 2050;
      v68 = v54;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)buf)
        free(v55);
    }
    *((_OWORD *)internal + 5) = *((_OWORD *)internal + 4);
    os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
    *((_OWORD *)internal + 4) = *(_OWORD *)&a3->timestamp;
    os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
    p_acceleration = &a3->acceleration;
    kdebug_trace();
    if (!*((_BYTE *)internal + 48))
    {
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)internal + 5));
      *((_BYTE *)internal + 48) = 1;
    }
    if (*((_QWORD *)internal + 4) && *((_QWORD *)internal + 3))
    {
      updated = objc_msgSend_updateAggregateDictionaryPrivate(self, v21, v22, v23, v24);
      v26 = (void *)MEMORY[0x194001B4C](updated);
      v28 = (int *)(internal + 13);
      v27 = internal[13];
      v29 = [CMDeviceOrientation alloc];
      if (v27 == -1)
        v33 = &a3->acceleration;
      else
        v33 = ($393C16A032292777F0C3725FFB2C0008 *)(internal + 13);
      v34 = (void *)objc_msgSend_initWithOrientation_andTimestamp_(v29, v30, LODWORD(v33->x), v31, v32, a3->timestamp);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      v35 = off_1ECEDEE20;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
      {
        v39 = objc_msgSend_stringForOrientation_(self, v36, LODWORD(p_acceleration->x), v37, v38);
        v40 = *v28;
        *(_DWORD *)buf = 138543618;
        v70 = v39;
        v71 = 1026;
        LODWORD(v72) = v40;
        _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_DEFAULT, "Updating client handler: Orientation %{public}@, Callback mode: %{public}d", buf, 0x12u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE28 != -1)
          dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
        v59 = objc_msgSend_stringForOrientation_(self, v56, LODWORD(p_acceleration->x), v57, v58);
        v60 = *v28;
        v63 = 138543618;
        v64 = v59;
        v65 = 1026;
        LODWORD(v66) = v60;
        v61 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager onDeviceOrientation:]", "CoreLocation: %s\n", v61);
        if (v61 != (char *)buf)
          free(v61);
      }
      v45 = *((_QWORD *)internal + 3);
      v44 = (void *)*((_QWORD *)internal + 4);
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = sub_18F472AE8;
      v62[3] = &unk_1E2955B60;
      v62[4] = v34;
      v62[5] = v45;
      objc_msgSend_addOperationWithBlock_(v44, v41, (uint64_t)v62, v42, v43);

      objc_autoreleasePoolPop(v26);
    }
  }
}

- (id)deviceOrientationBlocking
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *internal;
  CMDeviceOrientation *v9;
  uint64_t v10;
  CFAbsoluteTime Current;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v16;
  CMDeviceOrientation *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  CMDeviceOrientation *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CMDeviceOrientation *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  dispatch_time_t v40;
  NSObject *v41;
  double v42;
  uint64_t v43;
  NSObject *v44;
  CMDeviceOrientation *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  uint64_t v60;
  int v61;
  int v62;
  __int16 v63;
  double v64;
  uint8_t buf[4];
  int v66;
  __int16 v67;
  double v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE28 != -1)
    dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
  v3 = off_1ECEDEE20;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_INFO, "Received deviceOrientationBlocking", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    LOWORD(v55) = 0;
    v49 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v49);
    if (v49 != (char *)buf)
      free(v49);
  }
  kdebug_trace();
  internal = (unsigned int *)self->_internal;
  if ((internal[13] & 0x80000000) == 0)
  {
    v9 = [CMDeviceOrientation alloc];
    v10 = internal[13];
    Current = CFAbsoluteTimeGetCurrent();
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v9, v12, v10, v13, v14, Current);
  }
  if (objc_msgSend_orientationNotificationsDisabled(self, v4, v5, v6, v7))
  {
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v16 = off_1ECEDEE20;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_FAULT, "Notifications disabled", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      LOWORD(v55) = 0;
      v50 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v50);
      if (v50 != (char *)buf)
        free(v50);
    }
    v17 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v17, v18, 0, v19, v20, 0.0);
  }
  if ((sub_18F1F7BFC() & 0x40) != 0)
  {
    v27 = sub_18F47A70C();
    v28 = sub_18F47F5E4(v27, 0);
    v30 = v29;
    os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
    *((_QWORD *)internal + 8) = v28;
    *((_QWORD *)internal + 9) = v30;
    os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
    v31 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v31, v32, v30, v33, v34, *(double *)&v28);
  }
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v21 = *((double *)internal + 8);
  v22 = internal[18];
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if ((_DWORD)v22)
  {
    v23 = [CMDeviceOrientation alloc];
    return (id)objc_msgSend_initWithOrientation_andTimestamp_(v23, v24, v22, v25, v26, v21);
  }
  v55 = 0;
  v56 = &v55;
  v57 = 0x3052000000;
  v58 = sub_18F206C74;
  v59 = sub_18F206BC4;
  v60 = 0;
  v37 = sub_18F204AE4();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = sub_18F4733D4;
  v54[3] = &unk_1E2956C30;
  v54[4] = internal;
  v54[5] = &v55;
  sub_18F1F5E28(v37, (uint64_t)v54);
  if (v56[5])
  {
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v38 = off_1ECEDEE20;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_DEFAULT, "Waiting for the first orientation to come in", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      LOWORD(v61) = 0;
      v52 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v52);
      if (v52 != (char *)buf)
        free(v52);
    }
    v39 = v56[5];
    v40 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v39, v40))
    {
      if (qword_1ECEDEE28 != -1)
        dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
      v41 = off_1ECEDEE20;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_ERROR, "Orientation blocking: timeout exceeded!", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE28 != -1)
          dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
        LOWORD(v61) = 0;
        v53 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v53);
        if (v53 != (char *)buf)
          free(v53);
      }
    }
    dispatch_release((dispatch_object_t)v56[5]);
    v56[5] = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v42 = *((double *)internal + 8);
  v43 = internal[18];
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  kdebug_trace();
  if (qword_1ECEDEE28 != -1)
    dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
  v44 = off_1ECEDEE20;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    v66 = v43;
    v67 = 2050;
    v68 = v42;
    _os_log_impl(&dword_18F1DC000, v44, OS_LOG_TYPE_DEFAULT, "Got latest sample: %{public}d @ %{public}f", buf, 0x12u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE28 != -1)
      dispatch_once(&qword_1ECEDEE28, &unk_1E2953DC8);
    v61 = 67240448;
    v62 = v43;
    v63 = 2050;
    v64 = v42;
    v51 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMDeviceOrientationManager deviceOrientationBlocking]", "CoreLocation: %s\n", v51);
    if (v51 != (char *)buf)
      free(v51);
  }
  if (v42 <= 0.0)
  {
    v35 = 0;
  }
  else
  {
    v45 = [CMDeviceOrientation alloc];
    v35 = (id)objc_msgSend_initWithOrientation_andTimestamp_(v45, v46, v43, v47, v48, v42);
  }
  _Block_object_dispose(&v55, 8);
  return v35;
}

- (BOOL)orientationNotificationsDisabled
{
  return *(_BYTE *)(sub_18F47A70C() + 33) == 0;
}

- (id)stringForOrientation:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 6)
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)"Unexpected", v3, v4);
  else
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E2958940[a3], v3, v4);
}

- (void)updateAggregateDictionaryPrivate
{
  uint64_t v2;
  uint64_t v3;
  double *internal;
  int v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  internal = (double *)self->_internal;
  v5 = *((_DWORD *)internal + 22);
  if (*((_DWORD *)internal + 18) != v5)
  {
    v6 = objc_msgSend_stringForOrientation_(self, a2, *((unsigned int *)internal + 22), v2, v3);
    v10 = (uint64_t)(internal[8] - internal[10]);
    if (v5)
      v11 = v6 == 0;
    else
      v11 = 1;
    if (!v11 && v10 >= 1 && MEMORY[0x1E0CF6398] != 0)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%@.%@Time"), v8, v9, CFSTR("com.apple.CoreMotion.DeviceOrientation"), v6);
      ADClientAddValueForScalarKey();
    }
  }
}

@end
