@implementation CMMotionManager

- (void)stopDeviceMotionUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *internal;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];

  internal = (char *)self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, v2, v3, v4))
  {
    *(_WORD *)(internal + 315) = 0;
    if (*((_QWORD *)internal + 32))
    {
      v12 = sub_18F1FE420();
      v13 = *((_QWORD *)internal + 32);
      v14 = sub_18F204AE4();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_18F1FA1A4;
      v19[3] = &unk_1E2958238;
      v19[4] = v12;
      v19[5] = v13;
      sub_18F1F5E28(v14, (uint64_t)v19);
      v15 = *((_QWORD *)internal + 32);
      if (v15)
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
      *((_QWORD *)internal + 32) = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)internal + 80);
      if (v16)
        v11 = sub_18F209C14(v16, 4);
    }
    v17 = (void *)*((_QWORD *)internal + 35);
    if (v17)
    {

      *((_QWORD *)internal + 35) = 0;
    }
    v18 = (void *)*((_QWORD *)internal + 34);
    if (v18)
    {

      *((_QWORD *)internal + 34) = 0;
    }
    objc_msgSend_dismissDeviceMovementDisplay(self, v7, v8, v9, v10, v11);
    internal[314] = 0;
  }
}

- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F1F5758;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  v6[5] = referenceFrame;
  sub_18F1F6514(v5, (uint64_t)v6);
}

- (void)didBecomeActive:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F1F5794;
  v6[3] = &unk_1E29559D0;
  v6[4] = self;
  v6[5] = a3;
  sub_18F1F6514(v5, (uint64_t)v6);
}

- (void)setDeviceMotionUpdateInterval:(NSTimeInterval)deviceMotionUpdateInterval
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F1F5784;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = deviceMotionUpdateInterval;
  sub_18F1F5E28(v5, (uint64_t)v6);
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
  }
}

- (void)setNotificationCallback:(void *)a3 info:(void *)a4
{
  uint64_t v4;
  CFRunLoopRef Current;
  uint64_t v9;
  _QWORD *internal;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v19;
  const char *v20;
  _QWORD v21[5];
  _QWORD v22[7];
  _QWORD v23[6];
  int v24;

  if ((a3 != 0) != (a4 != 0))
  {
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionManager.mm"), 2657, CFSTR("-[CMMotionManager setNotificationCallback:info:] won't take these parameters."));
  }
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4))
  {
    Current = CFRunLoopGetCurrent();
    sub_18F204AE4();
    if (Current == *(CFRunLoopRef *)qword_1ECEDFE08)
    {
      internal = self->_internal;
      v11 = (void *)internal[73];
      if (v11 != a3 || (void *)internal[74] != a4)
      {
        if (v11 || internal[74])
        {
          v12 = sub_18F1FE420();
          v13 = internal[75];
          v14 = sub_18F204AE4();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = sub_18F1F5EE0;
          v23[3] = &unk_1E2956E98;
          v24 = 6;
          v23[4] = v12;
          v23[5] = v13;
          sub_18F1F5E28(v14, (uint64_t)v23);
          v15 = internal[75];
          if (v15)
            (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
          internal[75] = 0;
        }
        internal[73] = a3;
        internal[74] = a4;
        if (a3)
        {
          v16 = (_QWORD *)operator new();
          *v16 = off_1E294C238;
          *v16 = &off_1E294C318;
          v16[1] = 0;
          v16[2] = sub_18F1E5B70;
          v16[3] = internal;
          internal[75] = v16;
          v17 = sub_18F1FE420();
          sub_18F1F4F0C(v17, 6, internal[75], -1.0);
        }
      }
    }
    else
    {
      v9 = sub_18F204AE4();
      if (a3)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = sub_18F2095BC;
        v22[3] = &unk_1E2956548;
        v22[4] = self;
        v22[5] = a3;
        v22[6] = a4;
        sub_18F1F6514(v9, (uint64_t)v22);
      }
      else
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = sub_18F3A58C0;
        v21[3] = &unk_1E2955938;
        v21[4] = self;
        sub_18F1F5E28(v9, (uint64_t)v21);
      }
    }
  }
}

- (CMMotionManager)init
{
  uint64_t v3;
  CMMotionManager *v4;
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
  v10 = sub_18F206C04;
  v11 = sub_18F206B78;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F1F4FDC;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMMotionManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setSidebandTimeSyncHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_block_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _QWORD v30[6];
  _QWORD block[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[8];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  dispatch_semaphore_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isSidebandSensorFusionAvailable(self, a2, (uint64_t)a3, v3, v4))
  {
    internal = self->_internal;
    v8 = MEMORY[0x1E0C809B0];
    if (a3)
    {
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x3052000000;
      v44 = sub_18F206C04;
      v45 = sub_18F206B78;
      v46 = 0;
      v46 = dispatch_semaphore_create(0);
      v9 = sub_18F204AE4();
      v40[0] = v8;
      v40[1] = 3221225472;
      v40[2] = sub_18F1E1054;
      v40[3] = &unk_1E29569C0;
      v40[4] = internal;
      v40[5] = &v51;
      v40[6] = &v47;
      v40[7] = &v41;
      sub_18F1F5E28(v9, (uint64_t)v40);
      v10 = dispatch_queue_create("OscarTimeWait", 0);
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = sub_18F3A5830;
      block[3] = &unk_1E29569E8;
      block[4] = &v36;
      block[5] = &v32;
      v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v10, v11);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v12 = off_1ECEDEE70;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: Waiting for time sync", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE78 != -1)
          dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
        LOWORD(v55) = 0;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v23);
        if (v23 != (char *)buf)
          free(v23);
      }
      while (dispatch_semaphore_wait((dispatch_semaphore_t)v42[5], 0))
      {
        v13 = dispatch_time(0, 250000000);
        if (!dispatch_block_wait(v11, v13))
        {
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v19 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v37[3];
            v21 = v33[3];
            *(_DWORD *)buf = 134218240;
            v60 = v20;
            v61 = 2048;
            v62 = v21;
            _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: Framework TimeSync machTimestamp,%llu,oscarTimestamp,%llu", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v27 = v37[3];
            v28 = v33[3];
            v55 = 134218240;
            v56 = v27;
            v57 = 2048;
            v58 = v28;
            v29 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v29);
            if (v29 != (char *)buf)
              free(v29);
          }
          v17 = v37 + 3;
          v18 = v33;
          goto LABEL_23;
        }
        usleep(0x2710u);
      }
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v14 = off_1ECEDEE70;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v52[3];
        v16 = v48[3];
        *(_DWORD *)buf = 134218240;
        v60 = v15;
        v61 = 2048;
        v62 = v16;
        _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_DEFAULT, "[MotionManager] setSidebandTimeSyncHandler: Framework TimeSync machTimestamp,%llu,oscarTimestamp,%llu", buf, 0x16u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE78 != -1)
          dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
        v24 = v52[3];
        v25 = v48[3];
        v55 = 134218240;
        v56 = v24;
        v57 = 2048;
        v58 = v25;
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setSidebandTimeSyncHandler:]", "CoreLocation: %s\n", v26);
        if (v26 != (char *)buf)
          free(v26);
      }
      v17 = v52 + 3;
      v18 = v48;
LABEL_23:
      (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, *v17, v18[3]);
      dispatch_release(v10);
      _Block_release(v11);
      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v41, 8);
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);
    }
    if (internal[71])
    {
      v22 = sub_18F204AE4();
      v30[0] = v8;
      v30[1] = 3221225472;
      v30[2] = sub_18F3A5848;
      v30[3] = &unk_1E2955B38;
      v30[4] = internal;
      v30[5] = a3;
      sub_18F1F5E28(v22, (uint64_t)v30);
    }
  }
}

- (id)initPrivate
{
  CMMotionManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMMotionManager;
  v2 = -[CMMotionManager init](&v11, sel_init);
  if (v2)
  {
    v2->_internal = objc_alloc_init(CMMotionManagerInternal);
    v7 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5, v6);
    objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)v2, (uint64_t)sel_willResignActive_, (uint64_t)CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend_addObserver_selector_name_object_(v7, v9, (uint64_t)v2, (uint64_t)sel_didBecomeActive_, (uint64_t)CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  }
  return v2;
}

- (BOOL)isDeviceMotionAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (sub_18F1F7758() & 1) == 0
      && objc_msgSend_availableAttitudeReferenceFrames(CMMotionManager, v2, v3, v4, v5) != 0;
}

+ (CMAttitudeReferenceFrame)availableAttitudeReferenceFrames
{
  sub_18F1F77DC();
  if ((sub_18F1F781C() & 4) == 0)
    return 0;
  if ((sub_18F1F7BD4() & 1) == 0 && (sub_18F1F781C() & 1) == 0)
    return 1;
  sub_18F1F77DC();
  return 15;
}

- (void)startDeviceMotionUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  char *internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  CLDeviceMotionProperties *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFAbsoluteTime *v46;
  char v47;
  _QWORD v48[7];

  internal = (char *)self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, a3, (uint64_t)a4, (uint64_t)a5)
    && *((double *)internal + 33) > 0.0
    && (objc_msgSend_availableAttitudeReferenceFrames(CMMotionManager, v10, v11, v12, v13) & a3) != 0)
  {
    if (objc_msgSend_isDeviceMotionActive(self, v14, v15, v16, v17) && *((_QWORD *)internal + 38) != a3)
      objc_msgSend_stopDeviceMotionUpdates(self, v18, v19, v20, v21);
    *((_QWORD *)internal + 38) = a3;
    internal[360] = 0;
    v22 = mach_absolute_time();
    *((double *)internal + 40) = sub_18F1FD20C(v22);
    if ((unint64_t)(*((_QWORD *)internal + 38) - 1) > 1)
    {
      if (!internal[314])
        *(_WORD *)(internal + 313) = 257;
    }
    else
    {
      objc_msgSend_dismissDeviceMovementDisplay(self, v23, v24, v25, v26);
    }
    v27 = (id)*((_QWORD *)internal + 35);
    if (v27 != a4)
    {

      *((_QWORD *)internal + 35) = a4;
    }
    v28 = (id)*((_QWORD *)internal + 34);
    if (v28 != a5)
    {

      *((_QWORD *)internal + 34) = objc_msgSend_copy(a5, v29, v30, v31, v32);
    }
    if (!*((_QWORD *)internal + 32))
    {
      switch(*((_QWORD *)internal + 38))
      {
        case 1:
          v33 = *((_DWORD *)internal + 144);
          if (internal[537])
          {
            if (v33 == 2)
              v34 = 67;
            else
              v34 = 3;
          }
          else if (v33 == 1)
          {
            v34 = 34;
          }
          else
          {
            v34 = 2;
          }
          goto LABEL_27;
        case 2:
          v34 = 7;
          goto LABEL_27;
        case 4:
          v34 = 15;
          goto LABEL_27;
        case 8:
          v34 = 143;
LABEL_27:
          *((_DWORD *)internal + 74) = v34;
          break;
        default:
          break;
      }
      v35 = [CLDeviceMotionProperties alloc];
      v39 = (void *)objc_msgSend_initWithMode_(v35, v36, *((unsigned int *)internal + 74), v37, v38);
      v40 = (_QWORD *)operator new();
      *v40 = off_1E294C238;
      v41 = v39;
      *v40 = &off_1E294C350;
      v40[1] = v41;
      v40[2] = sub_18F1FD7A8;
      v40[3] = self;
      *((_QWORD *)internal + 32) = v40;

      v42 = sub_18F1FE420();
      v43 = *((_QWORD *)internal + 32);
      v44 = *((_QWORD *)internal + 33);
      v45 = sub_18F204AE4();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = sub_18F1F998C;
      v48[3] = &unk_1E2956F80;
      v48[4] = v42;
      v48[5] = v43;
      v48[6] = v44;
      sub_18F1F5E28(v45, (uint64_t)v48);
      v46 = (CFAbsoluteTime *)*((_QWORD *)internal + 80);
      if (v46)
      {
        v47 = *(_BYTE *)v46;
        if (!*(_BYTE *)v46)
        {
          v46[1] = CFAbsoluteTimeGetCurrent();
          v47 = *(_BYTE *)v46;
        }
        *(_BYTE *)v46 = v47 | 4;
      }
    }
  }
}

- (void)setDeviceMotionUpdateIntervalPrivate:(double)a3
{
  double *internal;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[33] = a3;
  if (*((_QWORD *)internal + 32))
  {
    v4 = sub_18F1FE420();
    v5 = *((_QWORD *)internal + 32);
    v6 = *((_QWORD *)internal + 33);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F1F955C;
    v8[3] = &unk_1E2956F80;
    v8[4] = v4;
    v8[5] = v5;
    v8[6] = v6;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)didBecomeActivePrivate:(id)a3
{
  _QWORD *internal;
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  internal = self->_internal;
  v5 = (_QWORD *)sub_18F1FE420();
  if (v5)
    sub_18F1F9458(v5, 1);
  v10 = internal[80];
  if (v10)
    *(CFAbsoluteTime *)(v10 + 8) = CFAbsoluteTimeGetCurrent();
  *((_BYTE *)internal + 624) = 1;
  if (*((_BYTE *)internal + 314))
  {
    if (!*((_BYTE *)internal + 313))
      objc_msgSend_showDeviceMovementDisplay(self, v6, v7, v8, v9);
  }
}

- (CMDeviceMotion)deviceMotion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *internal;
  uint64_t v7;
  float32x4_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CMDeviceMotion *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CMDeviceMotion *v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  char *v29;
  _OWORD v31[5];
  uint64_t v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  CMDeviceMotion *v42;
  __int16 v43;
  double v44;
  uint8_t buf[4];
  CMDeviceMotion *v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (!objc_msgSend_isDeviceMotionActive(self, a2, v2, v3, v4))
    return 0;
  if (!internal[74])
    return 0;
  v7 = sub_18F1FE420();
  *(float *)&v9 = sub_18F1FE474(v7, internal[74], (uint64_t)&v33, v8);
  objc_msgSend_applyNorthReference_(self, v10, (uint64_t)&v33, v11, v12, v9);
  objc_msgSend_applyInitialReference_(self, v13, (uint64_t)&v33, v14, v15);
  if (!objc_msgSend_deviceMotionInitialized_(CMMotionManager, v16, (uint64_t)&v33, v17, v18))
    return 0;
  v19 = [CMDeviceMotion alloc];
  v31[2] = v36;
  v31[3] = v37;
  v31[4] = v38;
  v32 = v39;
  v31[0] = v34;
  v31[1] = v35;
  v23 = (CMDeviceMotion *)(id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v19, v20, (uint64_t)v31, v21, v22, COERCE_DOUBLE(__PAIR64__(DWORD1(v34), v40)), v33);
  if (qword_1ECEDEE78 != -1)
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
  v24 = off_1ECEDEE70;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
  {
    v25 = mach_absolute_time();
    v26 = sub_18F1FD20C(v25);
    *(_DWORD *)buf = 138412546;
    v46 = v23;
    v47 = 2048;
    v48 = v26;
    _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_DEBUG, "CMDeviceMotion: %@,now,%f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v27 = mach_absolute_time();
    v28 = sub_18F1FD20C(v27);
    v41 = 138412546;
    v42 = v23;
    v43 = 2048;
    v44 = v28;
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager deviceMotion]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf)
      free(v29);
  }
  return v23;
}

- (void)onDeviceMotion:(const Sample *)a3
{
  uint64_t v3;
  uint64_t v4;
  id internal;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CMDeviceMotion *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  double v38;
  char *v39;
  _QWORD v40[6];
  _OWORD v41[5];
  uint64_t v42;
  _BYTE v43[96];
  Sample v44;
  int v45;
  void *v46;
  __int16 v47;
  double v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v8 = *(_OWORD *)&a3[3].acceleration.x;
  *(_OWORD *)&v43[64] = *(_OWORD *)&a3[2].acceleration.z;
  *(_OWORD *)&v43[80] = v8;
  v44 = a3[4];
  v9 = *(_OWORD *)&a3->acceleration.z;
  *(_OWORD *)v43 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&v43[16] = v9;
  v10 = *(_OWORD *)&a3[2].timestamp;
  *(_OWORD *)&v43[32] = *(_OWORD *)&a3[1].acceleration.x;
  *(_OWORD *)&v43[48] = v10;
  if (objc_msgSend_northAlignedReferenceFrame_(CMMotionManager, a2, *((_QWORD *)internal + 38), v3, v4))
  {
    if (*(int *)&v43[76] < 1)
    {
      if (*(_DWORD *)&v43[76] != -1)
      {
        *((_BYTE *)internal + 313) = 0;
        objc_msgSend_showDeviceMovementDisplay(self, v11, v12, v13, v14);
        if (!*((_BYTE *)internal + 315))
          *((_BYTE *)internal + 315) = objc_msgSend_sendDeviceMotionError_(self, v11, 101, v13, v14);
      }
    }
    else
    {
      *((_BYTE *)internal + 315) = 0;
      *((_BYTE *)internal + 313) = 1;
      objc_msgSend_dismissDeviceMovementDisplay(self, v11, v12, v13, v14);
    }
  }
  objc_msgSend_applyNorthReference_(self, v11, (uint64_t)v43, v13, v14);
  v18 = objc_msgSend_applyInitialReference_(self, v15, (uint64_t)v43, v16, v17);
  if (*((_QWORD *)internal + 35))
  {
    if (*((_QWORD *)internal + 34))
    {
      if ((HIWORD(v44.acceleration.y) & 0x100) != 0)
      {
        v19.n128_u64[0] = *(_QWORD *)v43;
        if (*(double *)v43 > 0.0)
        {
          v20 = *((double *)internal + 36);
          if (v20 <= 0.0
            || (v21 = *(double *)v43 - v20,
                v22 = *((double *)internal + 33),
                v19.n128_f64[0] = v21 - v22,
                v19.n128_f64[0] >= v22 * -0.1))
          {
            v23 = (void *)MEMORY[0x194001B4C](v18, v19);
            v24 = [CMDeviceMotion alloc];
            v41[2] = *(_OWORD *)&v43[40];
            v41[3] = *(_OWORD *)&v43[56];
            v41[4] = *(_OWORD *)&v43[72];
            v42 = *(_QWORD *)&v43[88];
            v41[0] = *(_OWORD *)&v43[8];
            v41[1] = *(_OWORD *)&v43[24];
            v28 = (void *)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v24, v25, (uint64_t)v41, v26, v27, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v43[12], LODWORD(v44.timestamp))), *(double *)v43);
            v29 = *((_QWORD *)internal + 34);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v30 = off_1ECEDEE70;
            if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
            {
              v31 = mach_absolute_time();
              v32 = sub_18F1FD20C(v31);
              *(_DWORD *)buf = 138412546;
              v50 = v28;
              v51 = 2048;
              v52 = v32;
              _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_DEBUG, "CMDeviceMotion: %@,now,%f", buf, 0x16u);
            }
            if (sub_18F1FCA08(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1ECEDEE78 != -1)
                dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
              v37 = mach_absolute_time();
              v38 = sub_18F1FD20C(v37);
              v45 = 138412546;
              v46 = v28;
              v47 = 2048;
              v48 = v38;
              v39 = (char *)_os_log_send_and_compose_impl();
              sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onDeviceMotion:]", "CoreLocation: %s\n", v39);
              if (v39 != (char *)buf)
                free(v39);
            }
            v36 = (void *)*((_QWORD *)internal + 35);
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = sub_18F2068C0;
            v40[3] = &unk_1E2955B60;
            v40[4] = v28;
            v40[5] = v29;
            objc_msgSend_addOperationWithBlock_(v36, v33, (uint64_t)v40, v34, v35);

            objc_autoreleasePoolPop(v23);
            *((_QWORD *)internal + 36) = *(_QWORD *)&a3->timestamp;
          }
        }
      }
    }
  }
}

- (void)applyNorthReference:(Sample *)a3
{
  double *internal;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;

  internal = (double *)self->_internal;
  if (*((_QWORD *)internal + 38) == 8 && *(double *)(sub_18F1FE420() + 88) < 0.0)
  {
    if (!*((_BYTE *)internal + 316) && a3->timestamp - internal[40] > 1.0)
      *((_BYTE *)internal + 316) = objc_msgSend_sendDeviceMotionError_(self, v6, 102, v7, v8);
    a3->timestamp = -1.0;
  }
  v9 = -1.0;
  v10 = -1.0;
  if ((unint64_t)(*((_QWORD *)internal + 38) - 1) >= 2)
  {
    if (a3[3].acceleration.y >= 0.0)
      return;
    v9 = 0.0;
    v10 = 180.0;
  }
  a3[3].acceleration.y = v9;
  *(float *)&a3[4].timestamp = v10;
}

- (void)applyInitialReference:(Sample *)a3
{
  uint64_t v3;
  uint64_t v4;
  float64x2_t *internal;
  __int128 v7;
  _BYTE v8[32];

  internal = (float64x2_t *)self->_internal;
  if ((unint64_t)(*(_QWORD *)&internal[19].f64[0] - 1) <= 1
    && objc_msgSend_deviceMotionInitialized_(CMMotionManager, a2, (uint64_t)a3, v3, v4))
  {
    if (!LOBYTE(internal[22].f64[1]))
    {
      sub_18F1E26B4((uint64_t)v8, (double *)&a3->acceleration.x);
      internal[21] = vnegq_f64(*(float64x2_t *)&v8[8]);
      internal[22].f64[0] = -*(double *)&v8[24];
      internal[20].f64[1] = *(float64_t *)v8;
      LOBYTE(internal[22].f64[1]) = 1;
    }
    sub_18F1FDF60((double *)v8, (double *)&a3->acceleration.x, &internal[20].f64[1]);
    v7 = *(_OWORD *)&v8[16];
    *(_OWORD *)&a3->acceleration.x = *(_OWORD *)v8;
    *(_OWORD *)&a3[1].timestamp = v7;
  }
}

+ (BOOL)deviceMotionInitialized:(Sample *)a3
{
  return HIBYTE(a3[4].acceleration.y) & (a3->timestamp > 0.0);
}

+ (BOOL)northAlignedReferenceFrame:(unint64_t)a3
{
  _BOOL8 v3;

  LOBYTE(v3) = 1;
  if (a3 != 8 && a3 != 4)
  {
    if (a3 == 2)
      return ((unint64_t)sub_18F1F7BFC() >> 4) & 1;
    else
      LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isDeviceMotionActive
{
  return *((_QWORD *)self->_internal + 32) != 0;
}

- (void)dismissDeviceMovementDisplay
{
  _BYTE *internal;
  NSObject *v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal[312])
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v3 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "CM: Dismissing Compass Calibration HUD", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager dismissDeviceMovementDisplay]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf)
        free(v4);
    }
    sub_18F44A240();
    internal[312] = 0;
  }
}

- (void)setDeviceMotionCallback:(void *)a3 info:(void *)a4 interval:(double)a5 fsync:(BOOL)a6
{
  _BOOL4 v6;
  CFRunLoopRef Current;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *internal;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CLDeviceMotionProperties *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _QWORD v45[8];
  BOOL v46;
  _QWORD v47[8];
  BOOL v48;
  int v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  double v56;
  __int16 v57;
  _BOOL4 v58;
  _BYTE buf[24];
  void *v60;
  __int128 v61;
  double v62;
  uint64_t v63;

  v6 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  Current = CFRunLoopGetCurrent();
  sub_18F204AE4();
  if (Current == *(CFRunLoopRef *)qword_1ECEDFE08)
  {
    if (objc_msgSend_isDeviceMotionAvailable(self, v12, v13, v14, v15))
    {
      internal = self->_internal;
      internal[65] = a3;
      internal[66] = a4;
      v24 = internal[64];
      if (a5 <= 0.0)
      {
        if (v24)
        {
          v28 = sub_18F1FE420();
          v29 = internal[64];
          v30 = sub_18F204AE4();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_18F1FA1A4;
          v60 = &unk_1E2958238;
          *(_QWORD *)&v61 = v28;
          *((_QWORD *)&v61 + 1) = v29;
          sub_18F1F5E28(v30, (uint64_t)buf);
          v31 = internal[64];
          if (v31)
            (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
          internal[64] = 0;
        }
      }
      else if (v24)
      {
        v25 = sub_18F1FE420();
        v26 = internal[64];
        v27 = sub_18F204AE4();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_18F1F955C;
        v60 = &unk_1E2956F80;
        *(_QWORD *)&v61 = v25;
        *((_QWORD *)&v61 + 1) = v26;
        v62 = a5;
        sub_18F1F5E28(v27, (uint64_t)buf);
      }
      else
      {
        objc_msgSend_updateDeviceMotionMode(self, v19, v20, v21, v22);
        v32 = [CLDeviceMotionProperties alloc];
        v36 = (void *)objc_msgSend_initWithMode_(v32, v33, *((unsigned int *)internal + 74), v34, v35);
        v37 = (_QWORD *)operator new();
        *v37 = off_1E294C238;
        v38 = v36;
        *v37 = &off_1E294C350;
        v37[1] = v38;
        v37[2] = sub_18F20120C;
        v37[3] = internal;
        internal[64] = v37;

        v39 = sub_18F1FE420();
        v40 = internal[64];
        v41 = sub_18F204AE4();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_18F1F998C;
        v60 = &unk_1E2956F80;
        *(_QWORD *)&v61 = v39;
        *((_QWORD *)&v61 + 1) = v40;
        v62 = a5;
        sub_18F1F5E28(v41, (uint64_t)buf);
      }
      v42 = sub_18F1EF73C();
      sub_18F203474(v42, v6);
    }
  }
  else
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v16 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_INFO))
    {
      sub_18F204AE4();
      v17 = *(_QWORD *)_CFGetProgname();
      *(_DWORD *)buf = 136447234;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2050;
      v60 = a4;
      LOWORD(v61) = 2050;
      *(double *)((char *)&v61 + 2) = a5;
      WORD5(v61) = 1026;
      HIDWORD(v61) = v6;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_INFO, "%{public}s calling setDeviceMotionCallback:%{public}p info:%{public}p interval:%{public}f fsync:%{public}d", buf, 0x30u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      sub_18F204AE4();
      v43 = *(_QWORD *)_CFGetProgname();
      v49 = 136447234;
      v50 = v43;
      v51 = 2050;
      v52 = a3;
      v53 = 2050;
      v54 = a4;
      v55 = 2050;
      v56 = a5;
      v57 = 1026;
      v58 = v6;
      v44 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setDeviceMotionCallback:info:interval:fsync:]", "CoreLocation: %s\n", v44);
      if (v44 != buf)
        free(v44);
    }
    v18 = sub_18F204AE4();
    if (a5 <= 0.0)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = sub_18F209478;
      v47[3] = &unk_1E2956948;
      v47[4] = self;
      v47[5] = a3;
      v47[6] = a4;
      *(double *)&v47[7] = a5;
      v48 = v6;
      sub_18F1F5E28(v18, (uint64_t)v47);
    }
    else
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = sub_18F1F576C;
      v45[3] = &unk_1E2956948;
      v45[4] = self;
      v45[5] = a3;
      v45[6] = a4;
      *(double *)&v45[7] = a5;
      v46 = v6;
      sub_18F1F6514(v18, (uint64_t)v45);
    }
  }
}

- (void)stopDeviceMotionUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F209834;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)startDeviceMotionUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F209800;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startDeviceMotionUpdatesUsingReferenceFrame:(CMAttitudeReferenceFrame)referenceFrame toQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F209154;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = queue;
  v10[6] = handler;
  v10[7] = referenceFrame;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)setPowerConservationMode:(int)a3
{
  id internal;
  uint64_t v6;
  _QWORD v7[6];
  int v8;

  internal = self->_internal;
  v6 = sub_18F204AE4();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F209624;
  v7[3] = &unk_1E2956A10;
  v7[4] = self;
  v7[5] = internal;
  v8 = a3;
  sub_18F1F6514(v6, (uint64_t)v7);
}

- (void)setGyroUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[25] = a3;
  v4 = (char *)(internal + 25);
  if (*((_QWORD *)internal + 24))
  {
    v5 = sub_18F1EF73C();
    v6 = *((_QWORD *)internal + 24);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)setGyroUpdateInterval:(NSTimeInterval)gyroUpdateInterval
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F2098AC;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = gyroUpdateInterval;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (void)setAccelerometerUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[3] = a3;
  v4 = (char *)(internal + 3);
  if (*((_QWORD *)internal + 2))
  {
    v5 = sub_18F1DFF7C();
    v6 = *((_QWORD *)internal + 2);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)setAccelerometerUpdateInterval:(NSTimeInterval)accelerometerUpdateInterval
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F2095AC;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = accelerometerUpdateInterval;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (BOOL)isSidebandSensorFusionAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return ((unint64_t)sub_18F1F7BFC() >> 29) & 1;
  return v2;
}

- (id)initUsingGyroOnlySensorFusion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  result = (id)objc_msgSend_init(self, a2, v2, v3, v4);
  if (result)
    *(_WORD *)(*((_QWORD *)result + 1) + 536) = 0;
  return result;
}

- (NSTimeInterval)deviceMotionUpdateInterval
{
  return *((double *)self->_internal + 33);
}

- (CMAttitudeReferenceFrame)attitudeReferenceFrame
{
  return *((_QWORD *)self->_internal + 38);
}

+ (void)setVirtualAlmondDevice:(id)a3
{
  id v4;

  if (sub_18F375AB0())
  {
    v4 = a3;

    qword_1EE16E728 = (uint64_t)v4;
  }
}

+ (id)virtualAlmondDevice
{
  return (id)qword_1EE16E728;
}

- (void)setUseAccelerometer:(BOOL)a3
{
  *((_BYTE *)self->_internal + 537) = a3;
}

- (BOOL)useAccelerometer
{
  return *((_BYTE *)self->_internal + 537);
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
  v6[3] = sub_18F206C04;
  v6[4] = sub_18F206B78;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F3A10FC;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMMotionManager;
  -[CMMotionManager dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  void **internal;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  internal = (void **)self->_internal;
  v4 = (void *)MEMORY[0x194001B4C]();

  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6, v7, v8);
  objc_msgSend_removeObserver_(v9, v10, (uint64_t)self, v11, v12);
  objc_msgSend_cancelAllOperations(internal[5], v13, v14, v15, v16);
  objc_msgSend_cancelAllOperations(internal[27], v17, v18, v19, v20);
  objc_msgSend_cancelAllOperations(internal[35], v21, v22, v23, v24);
  objc_msgSend_cancelAllOperations(internal[77], v25, v26, v27, v28);
  objc_msgSend_cancelAllOperations(internal[49], v29, v30, v31, v32);
  objc_msgSend_cancelAllOperations(internal[13], v33, v34, v35, v36);
  objc_msgSend_stopAccelerometerUpdatesPrivate(self, v37, v38, v39, v40);
  objc_msgSend_stopGyroUpdatesPrivate(self, v41, v42, v43, v44);
  objc_msgSend_stopDeviceMotionUpdatesPrivate(self, v45, v46, v47, v48);
  objc_msgSend__stopDeviceMotionErrorUpdates(self, v49, v50, v51, v52);
  objc_msgSend_stopMagnetometerUpdatesPrivate(self, v53, v54, v55, v56);
  objc_msgSend_stopAmbientPressureUpdatesPrivate(self, v57, v58, v59, v60);
  objc_msgSend_teardownPrivate(self->_internal, v61, v62, v63, v64);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)isAccelerometerAvailable
{
  _BOOL4 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return (sub_18F1F781C() >> 2) & 1;
  return v2;
}

- (BOOL)isAccelerometerActive
{
  return *((_QWORD *)self->_internal + 2) != 0;
}

- (NSTimeInterval)accelerometerUpdateInterval
{
  return *((double *)self->_internal + 3);
}

- (CMAccelerometerData)accelerometerData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMAccelerometerData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 7);
  v4 = *((_DWORD *)internal + 16);
  v5 = *((_DWORD *)internal + 17);
  v6 = *((_DWORD *)internal + 18);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMAccelerometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (CMAccelerometerData *)(id)objc_msgSend_initWithAcceleration_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)startAccelerometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A1304;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startAccelerometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAccelerometerHandler)handler
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A1388;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)stopAccelerometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A13F8;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)startAccelerometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  CFAbsoluteTime *v17;
  char v18;

  internal = self->_internal;
  if (objc_msgSend_isAccelerometerAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 3) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 5);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 5) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 4);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 4) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 2))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C3C0;
      v15[1] = 0;
      v15[2] = sub_18F3A0D80;
      v15[3] = self;
      *((_QWORD *)internal + 2) = v15;
      v16 = sub_18F1DFF7C();
      sub_18F1F4F0C(v16, 0, *((_QWORD *)internal + 2), *((double *)internal + 3));
      v17 = (CFAbsoluteTime *)*((_QWORD *)internal + 80);
      if (v17)
      {
        v18 = *(_BYTE *)v17;
        if (!*(_BYTE *)v17)
        {
          v17[1] = CFAbsoluteTimeGetCurrent();
          v18 = *(_BYTE *)v17;
        }
        *(_BYTE *)v17 = v18 | 1;
      }
    }
  }
}

- (void)stopAccelerometerUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  int v14;

  internal = self->_internal;
  if (objc_msgSend_isAccelerometerAvailable(self, a2, v2, v3, v4))
  {
    if (internal[2])
    {
      v6 = sub_18F1DFF7C();
      v7 = internal[2];
      v8 = sub_18F204AE4();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_18F1F5EE0;
      v13[3] = &unk_1E2956E98;
      v14 = 0;
      v13[4] = v6;
      v13[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v13);
      v9 = internal[2];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[2] = 0;
      v10 = (unsigned __int8 *)internal[80];
      if (v10)
        sub_18F209C14(v10, 1);
    }
    v11 = (void *)internal[5];
    if (v11)
    {

      internal[5] = 0;
    }
    v12 = (void *)internal[4];
    if (v12)
    {

      internal[4] = 0;
    }
  }
}

- (BOOL)isAmbientPressureAvailable
{
  _BOOL4 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return (sub_18F1F781C() >> 4) & 1;
  return v2;
}

- (void)setAmbientPressureUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3A168C;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)ambientPressureUpdateInterval
{
  return *((double *)self->_internal + 11);
}

- (BOOL)isAmbientPressureActive
{
  return *((_QWORD *)self->_internal + 10) != 0;
}

- (void)startAmbientPressureUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A171C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A17A0;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)stopAmbientPressureUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A1810;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (CMAmbientPressureData)ambientPressureData
{
  id internal;
  double v3;
  int v4;
  int v5;
  CMAmbientPressureData *v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 15);
  v4 = *((_DWORD *)internal + 32);
  v5 = *((_DWORD *)internal + 33);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v6 = [CMAmbientPressureData alloc];
  LODWORD(v7) = v4;
  LODWORD(v8) = v5;
  return (CMAmbientPressureData *)(id)objc_msgSend_initWithPressure_andTimestamp_(v6, v9, v10, v11, v12, v7, v8, v3);
}

- (BOOL)readRawAmbientPressureSamplesFromDB:(id)a3 toQueue:(id)a4 where:(id)a5 withHandler:(id)a6
{
  char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  char v18;
  NSObject *v19;
  char *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  _QWORD v29[6];
  _QWORD v30[6];
  __int128 v31;
  uint64_t v32;
  _BYTE v33[72];
  _BYTE __p[12];
  char v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = (char *)objc_msgSend_UTF8String(a3, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  sub_18F270374(__p, v10);
  v36 = 0uLL;
  v37 = 0;
  v31 = 0uLL;
  v32 = 0;
  sub_18F3D01D0((uint64_t)v33, __p, &v36, &v31);
  if (v35 < 0)
    operator delete(*(void **)__p);
  if (!v33[0])
  {
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2956AD0);
    v19 = qword_1EE16D6C0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__p = 138412290;
      *(_QWORD *)&__p[4] = a3;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_FAULT, "%@ is invalid", __p, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D6C8 != -1)
        dispatch_once(&qword_1EE16D6C8, &unk_1E2956AD0);
      LODWORD(v36) = 138412290;
      *(_QWORD *)((char *)&v36 + 4) = a3;
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager readRawAmbientPressureSamplesFromDB:toQueue:where:withHandler:]", "CoreLocation: %s\n", v20);
      if (v20 != __p)
        free(v20);
    }
    goto LABEL_18;
  }
  v15 = (char *)objc_msgSend_UTF8String(a5, v11, v12, v13, v14);
  sub_18F270374(__p, v15);
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_18F3A1BE4;
  v30[3] = &unk_1E2956880;
  v30[4] = a4;
  v30[5] = a6;
  v17 = sub_18F3D0F7C((uint64_t)v33, (const void **)__p, (uint64_t)v30);
  v18 = v17;
  if (v35 < 0)
  {
    operator delete(*(void **)__p);
    if ((v18 & 1) == 0)
    {
LABEL_18:
      v27 = 0;
      goto LABEL_19;
    }
  }
  else if ((v17 & 1) == 0)
  {
    goto LABEL_18;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v21, v22, (uint64_t)CFSTR("CMErrorDomain"), 109, 0);
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = sub_18F3A1C7C;
  v29[3] = &unk_1E2955B60;
  v29[4] = v23;
  v29[5] = a6;
  objc_msgSend_addOperationWithBlock_(a4, v24, (uint64_t)v29, v25, v26);

  v27 = 1;
LABEL_19:
  sub_18F3D0000((uint64_t)v33);
  return v27;
}

- (id)computeNonlinearPRTTFromDB:(id)a3 where:(id)a4
{
  uint64_t v4;
  char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  char v15;
  NSObject *v17;
  char *v18;
  _BYTE v19[222];
  _BYTE buf[12];
  __int16 v21;
  id v22;
  char v23;
  _BYTE v24[12];
  __int16 v25;
  id v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = (char *)objc_msgSend_UTF8String(a3, a2, (uint64_t)a3, (uint64_t)a4, v4);
  sub_18F270374(buf, v7);
  v12 = (char *)objc_msgSend_UTF8String(a4, v8, v9, v10, v11);
  sub_18F270374(v24, v12);
  v15 = sub_18F3D1430(buf, (std::string::size_type)v24, (uint64_t)v19);
  if (v27 < 0)
    operator delete(*(void **)v24);
  if (v23 < 0)
  {
    operator delete(*(void **)buf);
    if ((v15 & 1) != 0)
      return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)v19, 222, v14);
  }
  else if ((v15 & 1) != 0)
  {
    return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)v19, 222, v14);
  }
  if (qword_1EE16D6C8 != -1)
    dispatch_once(&qword_1EE16D6C8, &unk_1E2956AD0);
  v17 = qword_1EE16D6C0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = a3;
    v21 = 2112;
    v22 = a4;
    _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_FAULT, "Failed to calculate PRTT for %@ WHERE %@", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2956AD0);
    *(_DWORD *)v24 = 138412546;
    *(_QWORD *)&v24[4] = a3;
    v25 = 2112;
    v26 = a4;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager computeNonlinearPRTTFromDB:where:]", "CoreLocation: %s\n", v18);
    if (v18 != buf)
      free(v18);
  }
  return 0;
}

- (void)setCompensatedAmbientPressureUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3A1F90;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (double)compensatedAmbientPressureUpdateInterval
{
  return *((double *)self->_internal + 18);
}

- (BOOL)isCompensatedAmbientPressureActive
{
  return *((_QWORD *)self->_internal + 17) != 0;
}

- (void)startCompensatedAmbientPressureUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A2020;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startCompensatedAmbientPressureUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A20A4;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)stopCompensatedAmbientPressureUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A2114;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (CMAmbientPressureData)compensatedAmbientPressureData
{
  id internal;
  double v3;
  int v4;
  int v5;
  CMAmbientPressureData *v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 22);
  v4 = *((_DWORD *)internal + 46);
  v5 = *((_DWORD *)internal + 47);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v6 = [CMAmbientPressureData alloc];
  LODWORD(v7) = v4;
  LODWORD(v8) = v5;
  return (CMAmbientPressureData *)(id)objc_msgSend_initWithPressure_andTimestamp_(v6, v9, v10, v11, v12, v7, v8, v3);
}

- (void)setAmbientPressureUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[11] = a3;
  v4 = (char *)(internal + 11);
  if (*((_QWORD *)internal + 10))
  {
    v5 = sub_18F1DFF3C();
    v6 = *((_QWORD *)internal + 10);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)startAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  internal = self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 11) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 13);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 13) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 12);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 12) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 10))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C2A8;
      v15[1] = 0;
      v15[2] = sub_18F3A0D68;
      v15[3] = self;
      *((_QWORD *)internal + 10) = v15;
      v16 = sub_18F1DFF3C();
      sub_18F1F4F0C(v16, 0, *((_QWORD *)internal + 10), *((double *)internal + 11));
    }
  }
}

- (void)stopAmbientPressureUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, v2, v3, v4))
  {
    if (internal[10])
    {
      v6 = sub_18F1DFF3C();
      v7 = internal[10];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 0;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[10];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[10] = 0;
    }
    v10 = (void *)internal[13];
    if (v10)
    {

      internal[13] = 0;
    }
    v11 = (void *)internal[12];
    if (v11)
    {

      internal[12] = 0;
    }
  }
}

- (void)setCompensatedAmbientPressureUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[18] = a3;
  v4 = (char *)(internal + 18);
  if (*((_QWORD *)internal + 17))
  {
    v5 = sub_18F1DFF3C();
    v6 = *((_QWORD *)internal + 17);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)startCompensatedAmbientPressureUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  id internal;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  internal = self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, (uint64_t)a3, (uint64_t)a4, v4)
    && *((double *)internal + 18) > 0.0)
  {
    v9 = (id)*((_QWORD *)internal + 20);
    if (v9 != a3)
    {

      *((_QWORD *)internal + 20) = a3;
    }
    v10 = (id)*((_QWORD *)internal + 19);
    if (v10 != a4)
    {

      *((_QWORD *)internal + 19) = objc_msgSend_copy(a4, v11, v12, v13, v14);
    }
    if (!*((_QWORD *)internal + 17))
    {
      v15 = (_QWORD *)operator new();
      *v15 = off_1E294C238;
      *v15 = &off_1E294C2A8;
      v15[1] = 0;
      v15[2] = sub_18F3A0D74;
      v15[3] = self;
      *((_QWORD *)internal + 17) = v15;
      v16 = sub_18F1DFF3C();
      sub_18F1F4F0C(v16, 1, *((_QWORD *)internal + 17), *((double *)internal + 18));
    }
  }
}

- (void)stopCompensatedAmbientPressureUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *internal;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  int v13;

  internal = self->_internal;
  if (objc_msgSend_isAmbientPressureAvailable(self, a2, v2, v3, v4))
  {
    if (internal[17])
    {
      v6 = sub_18F1DFF3C();
      v7 = internal[17];
      v8 = sub_18F204AE4();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_18F1F5EE0;
      v12[3] = &unk_1E2956E98;
      v13 = 1;
      v12[4] = v6;
      v12[5] = v7;
      sub_18F1F5E28(v8, (uint64_t)v12);
      v9 = internal[17];
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      internal[17] = 0;
    }
    v10 = (void *)internal[20];
    if (v10)
    {

      internal[20] = 0;
    }
    v11 = (void *)internal[19];
    if (v11)
    {

      internal[19] = 0;
    }
  }
}

- (BOOL)isGyroAvailable
{
  return (sub_18F1F7758() & 1) == 0 && (sub_18F1F7BFC() & 0x100000) == 0;
}

- (BOOL)isGyroActive
{
  return *((_QWORD *)self->_internal + 24) != 0;
}

- (NSTimeInterval)gyroUpdateInterval
{
  return *((double *)self->_internal + 25);
}

- (CMGyroData)gyroData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMGyroData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 29);
  v4 = *((_DWORD *)internal + 60);
  v5 = *((_DWORD *)internal + 61);
  v6 = *((_DWORD *)internal + 62);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMGyroData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (CMGyroData *)(id)objc_msgSend_initWithRotationRate_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)startGyroUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A27AC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startGyroUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMGyroHandler)handler
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A2830;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)stopGyroUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A28A0;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)startGyroUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  CFAbsoluteTime *v16;
  char v17;

  internal = self->_internal;
  if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F7BFC() & 0x100000) == 0 && *((double *)internal + 25) > 0.0)
  {
    v8 = (id)*((_QWORD *)internal + 27);
    if (v8 != a3)
    {

      *((_QWORD *)internal + 27) = a3;
    }
    v9 = (id)*((_QWORD *)internal + 26);
    if (v9 != a4)
    {

      *((_QWORD *)internal + 26) = objc_msgSend_copy(a4, v10, v11, v12, v13);
    }
    if (!*((_QWORD *)internal + 24))
    {
      v14 = (_QWORD *)operator new();
      *v14 = off_1E294C238;
      *v14 = &off_1E294C820;
      v14[1] = 0;
      v14[2] = sub_18F3A0D8C;
      v14[3] = self;
      *((_QWORD *)internal + 24) = v14;
      v15 = sub_18F1EF73C();
      sub_18F1F4F0C(v15, 0, *((_QWORD *)internal + 24), *((double *)internal + 25));
      v16 = (CFAbsoluteTime *)*((_QWORD *)internal + 80);
      if (v16)
      {
        v17 = *(_BYTE *)v16;
        if (!*(_BYTE *)v16)
        {
          v16[1] = CFAbsoluteTimeGetCurrent();
          v17 = *(_BYTE *)v16;
        }
        *(_BYTE *)v16 = v17 | 2;
      }
    }
  }
}

- (void)stopGyroUpdatesPrivate
{
  _QWORD *internal;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  int v11;

  internal = self->_internal;
  if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F7BFC() & 0x100000) == 0)
  {
    if (internal[24])
    {
      v3 = sub_18F1EF73C();
      v4 = internal[24];
      v5 = sub_18F204AE4();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_18F1F5EE0;
      v10[3] = &unk_1E2956E98;
      v11 = 0;
      v10[4] = v3;
      v10[5] = v4;
      sub_18F1F5E28(v5, (uint64_t)v10);
      v6 = internal[24];
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      internal[24] = 0;
      v7 = (unsigned __int8 *)internal[80];
      if (v7)
        sub_18F209C14(v7, 2);
    }
    v8 = (void *)internal[27];
    if (v8)
    {

      internal[27] = 0;
    }
    v9 = (void *)internal[26];
    if (v9)
    {

      internal[26] = 0;
    }
  }
}

- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMDeviceMotionHandler)handler
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A2B20;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_18F1F6514(v7, (uint64_t)v8);
}

+ (void)dumpDb:(int64_t)a3 toURL:(id)a4 onCompletion:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  CLConnectionMessage *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD v35[6];
  CLConnectionMessage *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  CLConnectionMessage *v39;
  std::__shared_weak_count *v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5);
  if (!v11)
  {
    v43 = CFSTR("CMReturnCode");
    v44[0] = MEMORY[0x1E0C9AAA0];
    v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v44, (uint64_t)&v43, 1);
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v12);
  }
  v41 = CFSTR("CMDatabaseType");
  v42 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v9, v10);
  v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)&v42, (uint64_t)&v41, 1);
  sub_18F36022C("kCLConnectionMessageWriteDbToFile", &v38, &v39);
  v14 = v39;
  objc_msgSend_fileDescriptor(v11, v15, v16, v17, v18);
  CLConnectionMessage::setFileDescriptor(v14);
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v26 = objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v21, 0);
  v36 = v39;
  v37 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v28 = __ldxr(p_shared_owners);
    while (__stxr(v28 + 1, p_shared_owners));
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_18F3A2DC4;
  v35[3] = &unk_1E29568D0;
  v35[4] = a4;
  v35[5] = a5;
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v25, (uint64_t)&v36, v26, (uint64_t)v35);
  v29 = v37;
  if (v37)
  {
    v30 = (unint64_t *)&v37->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v40;
  if (v40)
  {
    v33 = (unint64_t *)&v40->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
}

- (void)rebuildGytt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id internal;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];

  internal = self->_internal;
  if (objc_msgSend_isDeviceMotionAvailable(self, a2, v2, v3, v4))
  {
    objc_msgSend_stopDeviceMotionUpdates(self, v7, v8, v9, v10);
    v11 = sub_18F204AE4();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18F3A2EC8;
    v12[3] = &unk_1E29559D0;
    v12[4] = internal;
    v12[5] = self;
    sub_18F1F6514(v11, (uint64_t)v12);
  }
}

- (int)gyttNumTemperatures
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (void *)sub_18F20CA68();
  v7 = (void *)objc_msgSend_vendor(v2, v3, v4, v5, v6);
  v11 = objc_msgSend_proxyForService_(v7, v8, (uint64_t)CFSTR("CLGyroCalibrationDatabase"), v9, v10);
  if (v11)
    return MEMORY[0x1E0DE7D20](v11, sel_syncgetNumTemperatures, v12, v13, v14);
  else
    return -2;
}

- (BOOL)isMagnetometerAvailable
{
  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return sub_18F1F781C() & 1;
}

- (BOOL)isMagnetometerActive
{
  return *((_QWORD *)self->_internal + 46) != 0;
}

- (void)setMagnetometerUpdateInterval:(NSTimeInterval)magnetometerUpdateInterval
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3A3110;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(NSTimeInterval *)&v6[5] = magnetometerUpdateInterval;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (NSTimeInterval)magnetometerUpdateInterval
{
  return *((double *)self->_internal + 47);
}

- (CMMagnetometerData)magnetometerData
{
  id internal;
  double v3;
  int v4;
  int v5;
  int v6;
  CMMagnetometerData *v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v3 = *((double *)internal + 51);
  v4 = *((_DWORD *)internal + 104);
  v5 = *((_DWORD *)internal + 105);
  v6 = *((_DWORD *)internal + 106);
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (v3 <= 0.0)
    return 0;
  v7 = [CMMagnetometerData alloc];
  LODWORD(v8) = v4;
  LODWORD(v9) = v5;
  LODWORD(v10) = v6;
  return (CMMagnetometerData *)(id)objc_msgSend_initWithMagneticField_andTimestamp_(v7, v11, v12, v13, v14, v8, v9, v10, v3);
}

- (void)startMagnetometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A321C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startMagnetometerUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMagnetometerHandler)handler
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A32A0;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = queue;
  v8[6] = handler;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)stopMagnetometerUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A3310;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)setMagnetometerUpdateIntervalPrivate:(double)a3
{
  double *internal;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];
  int v9;

  internal = (double *)self->_internal;
  if (a3 < 0.01)
    a3 = 0.01;
  internal[47] = a3;
  if (*((_QWORD *)internal + 46))
  {
    v4 = (char *)(internal + 47);
    v5 = sub_18F3DA7B4();
    v6 = *((_QWORD *)internal + 46);
    v7 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F20741C;
    v8[3] = &unk_1E2956EB8;
    v9 = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = v4;
    sub_18F1F5E28(v7, (uint64_t)v8);
  }
}

- (void)startMagnetometerUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  id internal;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  CFAbsoluteTime *v16;
  char v17;

  internal = self->_internal;
  if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F781C() & 1) != 0 && *((double *)internal + 47) > 0.0)
  {
    v8 = (id)*((_QWORD *)internal + 49);
    if (v8 != a3)
    {

      *((_QWORD *)internal + 49) = a3;
    }
    v9 = (id)*((_QWORD *)internal + 48);
    if (v9 != a4)
    {

      *((_QWORD *)internal + 48) = objc_msgSend_copy(a4, v10, v11, v12, v13);
    }
    if (!*((_QWORD *)internal + 46))
    {
      v14 = (_QWORD *)operator new();
      *v14 = off_1E294C238;
      *v14 = &off_1E294C388;
      v14[1] = 0;
      v14[2] = sub_18F3A0DB0;
      v14[3] = self;
      *((_QWORD *)internal + 46) = v14;
      v15 = sub_18F3DA7B4();
      sub_18F1F4F0C(v15, 0, *((_QWORD *)internal + 46), *((double *)internal + 47));
      v16 = (CFAbsoluteTime *)*((_QWORD *)internal + 80);
      if (v16)
      {
        v17 = *(_BYTE *)v16;
        if (!*(_BYTE *)v16)
        {
          v16[1] = CFAbsoluteTimeGetCurrent();
          v17 = *(_BYTE *)v16;
        }
        *(_BYTE *)v16 = v17 | 8;
      }
    }
  }
}

- (void)stopMagnetometerUpdatesPrivate
{
  uint64_t *internal;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  void *v6;
  void *v7;

  internal = (uint64_t *)self->_internal;
  if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F781C() & 1) != 0)
  {
    if (internal[46])
    {
      v3 = sub_18F3DA7B4();
      sub_18F1F5DB4(v3, 0, internal[46]);
      v4 = internal[46];
      if (v4)
        (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
      internal[46] = 0;
      v5 = (unsigned __int8 *)internal[80];
      if (v5)
        sub_18F209C14(v5, 8);
    }
    v6 = (void *)internal[49];
    if (v6)
    {

      internal[49] = 0;
    }
    v7 = (void *)internal[48];
    if (v7)
    {

      internal[48] = 0;
    }
  }
}

- (void)setShowsDeviceMovementDisplay:(BOOL)showsDeviceMovementDisplay
{
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3A35D4;
  v6[3] = &unk_1E29568F8;
  v6[4] = self;
  v7 = showsDeviceMovementDisplay;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (BOOL)showsDeviceMovementDisplay
{
  return *((_BYTE *)self->_internal + 432);
}

- (void)setShowsDeviceMovementDisplayPrivate:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  *((_BYTE *)self->_internal + 432) = a3;
  if (!a3)
    objc_msgSend_dismissDeviceMovementDisplay(self, a2, a3, v3, v4);
}

- (void)showDeviceMovementDisplay
{
  _BYTE *internal;
  NSObject *v4;
  char *v5;
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((sub_18F1F7BFC() & 0x10) == 0)
  {
    internal = self->_internal;
    if (internal[432])
    {
      if (internal[624] && !internal[312] && !internal[313] && internal[314])
      {
        if (qword_1ECEDEE78 != -1)
          dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
        v4 = off_1ECEDEE70;
        if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEFAULT, "CM: Invoking Compass Calibration HUD", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v5 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager showDeviceMovementDisplay]", "CoreLocation: %s\n", v5);
          if (v5 != (char *)buf)
            free(v5);
        }
        if (sub_18F449F68())
          internal[312] = 1;
      }
    }
  }
}

- (id)initUsing6AxisSensorFusion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  result = (id)objc_msgSend_init(self, a2, v2, v3, v4);
  if (result)
    *(_WORD *)(*((_QWORD *)result + 1) + 536) = 256;
  return result;
}

- (void)setAccelerometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  CFRunLoopRef Current;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *internal;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[8];
  _QWORD v27[8];
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  int v36;

  v28 = a5;
  Current = CFRunLoopGetCurrent();
  sub_18F204AE4();
  if (Current != *(CFRunLoopRef *)qword_1ECEDFE08)
  {
    v14 = sub_18F204AE4();
    if (a5 > 0.0)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_18F3A3A84;
      v26[3] = &unk_1E2956920;
      v26[4] = self;
      v26[5] = a3;
      v26[6] = a4;
      *(double *)&v26[7] = a5;
      sub_18F1F6514(v14, (uint64_t)v26);
      return;
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_18F3A3A70;
    v27[3] = &unk_1E2956920;
    v27[4] = self;
    v27[5] = a3;
    v27[6] = a4;
    *(double *)&v27[7] = a5;
    v19 = v27;
LABEL_9:
    sub_18F1F5E28(v14, (uint64_t)v19);
    return;
  }
  if (!objc_msgSend_isAccelerometerAvailable(self, v10, v11, v12, v13))
    return;
  internal = (uint64_t *)self->_internal;
  internal[56] = (uint64_t)a3;
  internal[57] = (uint64_t)a4;
  v16 = internal[55];
  if (a5 > 0.0)
  {
    if (!v16)
    {
      v24 = (_QWORD *)operator new();
      *v24 = off_1E294C238;
      *v24 = &off_1E294C3C0;
      v24[1] = 0;
      v24[2] = sub_18F3A0DBC;
      v24[3] = internal;
      internal[55] = (uint64_t)v24;
      v25 = sub_18F1DFF7C();
      sub_18F1F4F0C(v25, 0, internal[55], a5);
      return;
    }
    v17 = sub_18F1DFF7C();
    v18 = internal[55];
    v14 = sub_18F204AE4();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = sub_18F20741C;
    v32 = &unk_1E2956EB8;
    v36 = 0;
    v33 = v17;
    v34 = v18;
    v35 = &v28;
    v19 = &v29;
    goto LABEL_9;
  }
  if (v16)
  {
    v20 = sub_18F1DFF7C();
    v21 = internal[55];
    v22 = sub_18F204AE4();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = sub_18F1F5EE0;
    v32 = &unk_1E2956E98;
    LODWORD(v35) = 0;
    v33 = v20;
    v34 = v21;
    sub_18F1F5E28(v22, (uint64_t)&v29);
    v23 = internal[55];
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
    internal[55] = 0;
  }
}

- (void)setGyroDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  CFRunLoopRef Current;
  uint64_t v10;
  uint64_t *internal;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[8];
  _QWORD v19[8];
  double v20;

  v20 = a5;
  Current = CFRunLoopGetCurrent();
  sub_18F204AE4();
  if (Current == *(CFRunLoopRef *)qword_1ECEDFE08)
  {
    if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F7BFC() & 0x100000) == 0)
    {
      internal = (uint64_t *)self->_internal;
      internal[59] = (uint64_t)a3;
      internal[60] = (uint64_t)a4;
      v12 = internal[58];
      if (a5 <= 0.0)
      {
        if (v12)
        {
          v14 = sub_18F1EF73C();
          sub_18F1F5DB4(v14, 0, internal[58]);
          v15 = internal[58];
          if (v15)
            (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
          internal[58] = 0;
        }
      }
      else if (v12)
      {
        v13 = sub_18F1EF73C();
        sub_18F20C0C4(v13, 0, internal[58], (uint64_t)&v20);
      }
      else
      {
        v16 = (_QWORD *)operator new();
        *v16 = off_1E294C238;
        *v16 = &off_1E294C820;
        v16[1] = 0;
        v16[2] = sub_18F3A0E00;
        v16[3] = internal;
        internal[58] = (uint64_t)v16;
        v17 = sub_18F1EF73C();
        sub_18F1F4F0C(v17, 0, internal[58], a5);
      }
    }
  }
  else
  {
    v10 = sub_18F204AE4();
    if (a5 <= 0.0)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_18F3A3C88;
      v19[3] = &unk_1E2956920;
      v19[4] = self;
      v19[5] = a3;
      v19[6] = a4;
      *(double *)&v19[7] = a5;
      sub_18F1F5E28(v10, (uint64_t)v19);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_18F3A3C9C;
      v18[3] = &unk_1E2956920;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      *(double *)&v18[7] = a5;
      sub_18F1F6514(v10, (uint64_t)v18);
    }
  }
}

- (void)setMagnetometerDataCallback:(void *)a3 info:(void *)a4 interval:(double)a5
{
  CFRunLoopRef Current;
  uint64_t v10;
  uint64_t *internal;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[8];
  _QWORD v19[8];
  double v20;

  v20 = a5;
  Current = CFRunLoopGetCurrent();
  sub_18F204AE4();
  if (Current == *(CFRunLoopRef *)qword_1ECEDFE08)
  {
    if ((sub_18F1F7758() & 1) == 0 && (sub_18F1F781C() & 1) != 0)
    {
      internal = (uint64_t *)self->_internal;
      internal[62] = (uint64_t)a3;
      internal[63] = (uint64_t)a4;
      v12 = internal[61];
      if (a5 <= 0.0)
      {
        if (v12)
        {
          v14 = sub_18F3DA7B4();
          sub_18F1F5DB4(v14, 0, internal[61]);
          v15 = internal[61];
          if (v15)
            (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
          internal[61] = 0;
        }
      }
      else if (v12)
      {
        v13 = sub_18F3DA7B4();
        sub_18F20C0C4(v13, 0, internal[61], (uint64_t)&v20);
      }
      else
      {
        v16 = (_QWORD *)operator new();
        *v16 = off_1E294C238;
        *v16 = &off_1E294C388;
        v16[1] = 0;
        v16[2] = sub_18F3A0E44;
        v16[3] = internal;
        internal[61] = (uint64_t)v16;
        v17 = sub_18F3DA7B4();
        sub_18F1F4F0C(v17, 0, internal[61], a5);
      }
    }
  }
  else
  {
    v10 = sub_18F204AE4();
    if (a5 <= 0.0)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_18F3A3EA0;
      v19[3] = &unk_1E2956920;
      v19[4] = self;
      v19[5] = a3;
      v19[6] = a4;
      *(double *)&v19[7] = a5;
      sub_18F1F5E28(v10, (uint64_t)v19);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_18F3A3EB4;
      v18[3] = &unk_1E2956920;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      *(double *)&v18[7] = a5;
      sub_18F1F6514(v10, (uint64_t)v18);
    }
  }
}

- (void)updateDeviceMotionMode
{
  _QWORD *internal;
  uint64_t v3;
  int v4;
  int v5;

  internal = self->_internal;
  if (*((_BYTE *)internal + 536))
  {
    v3 = internal[38];
    if (v3 == 8)
    {
      v4 = 143;
    }
    else if (v3 == 4)
    {
      v4 = 15;
    }
    else
    {
      v4 = 7;
    }
  }
  else
  {
    v5 = *((_DWORD *)internal + 144);
    if (*((_BYTE *)internal + 537))
    {
      if (v5 == 2)
        v4 = 67;
      else
        v4 = 3;
    }
    else if (v5 == 1)
    {
      v4 = 34;
    }
    else
    {
      v4 = 2;
    }
  }
  *((_DWORD *)internal + 74) = v4;
}

- (void)connect
{
  id internal;
  uint64_t v3;
  void *__p[2];
  char v5;

  internal = self->_internal;
  if (!*((_QWORD *)internal + 68))
  {
    *((_QWORD *)internal + 69) = dispatch_queue_create("com.apple.CoreMotion.CMMotionManager", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)internal + 69));
    *((_QWORD *)internal + 68) = v3;
    if (v5 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)internal + 68));
    dispatch_sync(*((dispatch_queue_t *)internal + 69), &unk_1E2953188);
  }
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3
{
  return objc_msgSend_setSidebandSensorFusionEnable_measureLatency_withSnoopHandler_(self, a2, a3, 0, 0);
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 withSnoopHandler:(id)a4
{
  return objc_msgSend_setSidebandSensorFusionEnable_measureLatency_withSnoopHandler_(self, a2, a3, 0, (uint64_t)a4);
}

- (BOOL)setSidebandSensorFusionEnable:(BOOL)a3 measureLatency:(BOOL)a4 withSnoopHandler:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  CFRunLoopRef Current;
  uint64_t v10;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id internal;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSSet *v39;
  void *DictionaryOfClasses;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  void *v59;
  NSObject *v60;
  char *v61;
  CFRunLoopTimerRef *v62;
  _QWORD *v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  _QWORD *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  char *v73;
  char *v74;
  char *v75;
  std::__shared_weak_count *v76;
  CLConnectionMessage *v77;
  std::__shared_weak_count *v78;
  uint64_t v79;
  _QWORD v80[7];
  BOOL v81;
  BOOL v82;
  _QWORD v83[3];
  _QWORD v84[3];
  uint64_t v85;
  std::__shared_weak_count *v86;
  _BOOL4 v87;
  __int128 buf;
  uint64_t v89;
  char v90;
  _BYTE v91[12];
  uint64_t v92;

  v6 = a4;
  v7 = a3;
  v92 = *MEMORY[0x1E0C80C00];
  Current = CFRunLoopGetCurrent();
  sub_18F204AE4();
  if (Current == *(CFRunLoopRef *)qword_1ECEDFE08)
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v12 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67240704;
      DWORD1(buf) = v7;
      WORD4(buf) = 1026;
      *(_DWORD *)((char *)&buf + 10) = v6;
      HIWORD(buf) = 1026;
      LODWORD(v89) = a5 != 0;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "[SidebandSensorFusion] requesting from framework,enabled,%{public}d,measureLatency,%{public}d,snoop,%{public}d", (uint8_t *)&buf, 0x14u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      LODWORD(v85) = 67240704;
      HIDWORD(v85) = v7;
      LOWORD(v86) = 1026;
      *(_DWORD *)((char *)&v86 + 2) = v6;
      HIWORD(v86) = 1026;
      v87 = a5 != 0;
      v73 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v73);
      if (v73 != (char *)&buf)
        free(v73);
    }
    objc_msgSend_connect(self, v13, v14, v15, v16);
    internal = self->_internal;
    v18 = CFAbsoluteTimeGetCurrent();
    v83[0] = CFSTR("CMSidebandSensorFusionEnable");
    v84[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v19, v7, v20, v21);
    v83[1] = CFSTR("CMSidebandSensorFusionLatency");
    v84[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v22, v6, v23, v24);
    v83[2] = CFSTR("CMSidebandSensorFusionSnoop");
    v84[2] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v25, a5 != 0, v26, v27);
    v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v84, (uint64_t)v83, 3);
    sub_18F3ABE2C("kCLConnectionMessageSidebandSensorFusionEnable", &v79, &v85);
    v76 = v86;
    if (v86)
    {
      p_shared_owners = (unint64_t *)&v86->__shared_owners_;
      do
        v30 = __ldxr(p_shared_owners);
      while (__stxr(v30 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessageSync();
    if (v76)
    {
      v31 = (unint64_t *)&v76->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
        std::__shared_weak_count::__release_weak(v76);
      }
    }
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v39 = (NSSet *)objc_msgSend_setWithObjects_(v33, v36, v34, v37, v38, v35, 0);
    if (v77)
    {
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v77, v39);
      v44 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v41, (uint64_t)CFSTR("CMSidebandSensorFusionSuccess"), v42, v43);
      LODWORD(self) = objc_msgSend_BOOLValue(v44, v45, v46, v47, v48);
    }
    else
    {
      LODWORD(self) = 0;
    }
    v49 = vabdd_f64(CFAbsoluteTimeGetCurrent(), v18);
    if (v49 > 5.0)
    {
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v50 = off_1ECEDEE70;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134349056;
        *(double *)((char *)&buf + 4) = v49;
        _os_log_impl(&dword_18F1DC000, v50, OS_LOG_TYPE_ERROR, "[SidebandSensorFusion] setSidebandSensorFusionEnable took longer than expected,%{public}f", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1ECEDEE78 != -1)
          dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
        *(_DWORD *)v91 = 134349056;
        *(double *)&v91[4] = v49;
        v75 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v75);
        if (v75 != (char *)&buf)
          free(v75);
      }
    }
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v51 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67240192;
      DWORD1(buf) = (_DWORD)self;
      _os_log_impl(&dword_18F1DC000, v51, OS_LOG_TYPE_DEFAULT, "[SidebandSensorFusion] requesting from framework,success,%{public}d", (uint8_t *)&buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      *(_DWORD *)v91 = 67240192;
      *(_DWORD *)&v91[4] = (_DWORD)self;
      v74 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager setSidebandSensorFusionEnable:measureLatency:withSnoopHandler:]", "CoreLocation: %s\n", v74);
      if (v74 != (char *)&buf)
        free(v74);
    }
    if ((_DWORD)self)
    {
      *((_BYTE *)internal + 560) = v7;
      *((_BYTE *)internal + 561) = v6;
      *((_BYTE *)internal + 562) = a5 != 0;
      if (a5)
      {
        if (!*((_QWORD *)internal + 71))
        {
          v56 = operator new();
          sub_18F1E15C0(v56);
          v57 = *((_QWORD *)internal + 71);
          *((_QWORD *)internal + 71) = v56;
          if (v57)
            (*(void (**)(uint64_t))(*(_QWORD *)v57 + 8))(v57);
        }
      }
      v58 = (uint64_t *)*((_QWORD *)internal + 71);
      if (v58)
      {
        v59 = (void *)v58[7];
        v58[7] = objc_msgSend_copy(a5, v52, v53, v54, v55);

        if (!v58[3])
        {
          if ((sub_18F1F7BFC() & 0x80) != 0)
          {
            v62 = (CFRunLoopTimerRef *)operator new();
            sub_18F1E1F84(v62, 1, 1);
            *v62 = (CFRunLoopTimerRef)&off_1E294AF78;
            sub_18F3ABC8C(v58 + 5, (uint64_t)v62);
            v63 = (_QWORD *)v58[5];
            *(_QWORD *)v91 = 0x70000FF0CLL;
            v91[8] = 0;
            sub_18F1E9BC8(v63, (uint64_t)v91, (uint64_t *)&buf);
            sub_18F346DC8((uint64_t)(v58 + 3), &buf);
            v64 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
            if (*((_QWORD *)&buf + 1))
            {
              v65 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
              do
                v66 = __ldaxr(v65);
              while (__stlxr(v66 - 1, v65));
              if (!v66)
              {
                ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
                std::__shared_weak_count::__release_weak(v64);
              }
            }
            sub_18F203148(v58[3], (uint64_t)sub_18F3A48E4, (uint64_t)v58);
          }
          else
          {
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v60 = off_1ECEDEE70;
            if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_FAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_18F1DC000, v60, OS_LOG_TYPE_FAULT, "platform does not support devmotion3 data", (uint8_t *)&buf, 2u);
            }
            if (sub_18F1FCA08(115, 0))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_1ECEDEE78 != -1)
                dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
              *(_WORD *)v91 = 0;
              v61 = (char *)_os_log_send_and_compose_impl();
              sub_18F419700("Generic", 1, 0, 0, "void CLIspDataVisitor::setIspDataHandler(CMSidebandSensorFusionSnoopHandler)", "CoreLocation: %s\n", v61);
              if (v61 != (char *)&buf)
                free(v61);
            }
          }
        }
        v67 = (_QWORD *)*((_QWORD *)internal + 71);
        if (!v67[7] && !v67[8])
        {
          *((_QWORD *)internal + 71) = 0;
          (*(void (**)(_QWORD *))(*v67 + 8))(v67);
        }
      }
    }
    if (v78)
    {
      v68 = (unint64_t *)&v78->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)())v78->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v78);
      }
    }
    v70 = v86;
    if (v86)
    {
      v71 = (unint64_t *)&v86->__shared_owners_;
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v89 = 0x2020000000;
    v90 = 0;
    v10 = sub_18F204AE4();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = sub_18F3A57CC;
    v80[3] = &unk_1E2956970;
    v80[5] = a5;
    v80[6] = &buf;
    v81 = v7;
    v82 = v6;
    v80[4] = self;
    sub_18F1F5E28(v10, (uint64_t)v80);
    LOBYTE(self) = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  return (char)self;
}

- (BOOL)setMotionThreadPriority:(int)a3
{
  uint64_t v4;

  v4 = sub_18F204AE4();
  return sub_18F3DE3F8(v4, a3);
}

- (void)_startDeviceMotionErrorUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v8;
  _QWORD v9[8];

  v8 = sub_18F204AE4();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F3A596C;
  v9[3] = &unk_1E29568A8;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  v9[7] = a2;
  sub_18F1F5E28(v8, (uint64_t)v9);
}

- (void)_stopDeviceMotionErrorUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A5AF8;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (id)predictedDeviceMotionAtTimestamp:(double)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  __objc2_class *v6;
  NSObject *v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class *internal;
  _QWORD *v14;
  float32x4_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject v23;
  NSObject v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject v32;
  CMDeviceMotion *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  NSObject *v38;
  float32x2_t v39;
  uint64_t v40;
  double v41;
  float32x2_t v42;
  uint64_t v43;
  double v44;
  char *v45;
  NSObject *v46;
  NSObject v47;
  int cache;
  NSObject v49;
  int v50;
  NSObject *v51;
  NSObject v52;
  NSObject *v54;
  NSObject *v55;
  NSObject v56;
  char *v57;
  NSObject v58;
  char *v59;
  _OWORD v60[5];
  uint64_t v61;
  float32x2_t v62;
  int v63;
  int v64;
  Class isa;
  __int16 v66;
  float32x2_t v67;
  __int16 v68;
  double v69;
  __int16 v70;
  int v71;
  _BYTE v72[24];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  unsigned int v78;
  unsigned __int16 v79;
  uint8_t buf[4];
  _BYTE v81[34];
  uint64_t v82;

  v7 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isPredictedDeviceMotionAvailable(self, a2, (uint64_t)a4, v4, v5) & 1) == 0)
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    internal = CMVO2MaxRetrocomputeState;
    v54 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v81 = 0;
      *(_WORD *)&v81[4] = 2082;
      *(_QWORD *)&v81[6] = "";
      *(_WORD *)&v81[14] = 2082;
      *(_QWORD *)&v81[16] = "assert";
      *(_WORD *)&v81[24] = 2081;
      *(_QWORD *)&v81[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_log_impl(&dword_18F1DC000, v54, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    }
    v55 = off_1ECEDEE70;
    if (os_signpost_enabled((os_log_t)off_1ECEDEE70))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v81 = 0;
      *(_WORD *)&v81[4] = 2082;
      *(_QWORD *)&v81[6] = "";
      *(_WORD *)&v81[14] = 2082;
      *(_QWORD *)&v81[16] = "assert";
      *(_WORD *)&v81[24] = 2081;
      *(_QWORD *)&v81[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v55, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call", "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    }
    v7 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v81 = 0;
      *(_WORD *)&v81[4] = 2082;
      *(_QWORD *)&v81[6] = "";
      *(_WORD *)&v81[14] = 2082;
      *(_QWORD *)&v81[16] = "assert";
      *(_WORD *)&v81[24] = 2081;
      *(_QWORD *)&v81[26] = "[self isPredictedDeviceMotionAvailable]";
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Predicted device motion is not available! Check -[CMMotionManager isPredictedDeviceMotionAvailable] before making this call\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    goto LABEL_56;
  }
  internal = (__objc2_class *)self->_internal;
  if (!LODWORD(internal[7].cache))
  {
    v7->isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v10, 109, v11, v12);
    v6 = CMVO2MaxRetrocomputeState;
    if (qword_1ECEDEE78 == -1)
    {
LABEL_32:
      v46 = off_1ECEDEE70;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
      {
        v47.isa = v7->isa;
        cache = (int)internal[7].cache;
        *(_DWORD *)buf = 138412546;
        *v81 = v47;
        *(_WORD *)&v81[8] = 1024;
        *(_DWORD *)&v81[10] = cache;
        _os_log_impl(&dword_18F1DC000, v46, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,mode,%d", buf, 0x12u);
      }
      if (!sub_18F1FCA08(115, 2))
        return 0;
      bzero(buf, 0x65CuLL);
      if (v6[92].vtable != (void *)-1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v49.isa = v7->isa;
      v50 = (int)internal[7].cache;
      *(_DWORD *)v72 = 138412546;
      *&v72[4] = v49;
      *(_WORD *)&v72[12] = 1024;
      *(_DWORD *)&v72[14] = v50;
      goto LABEL_60;
    }
LABEL_56:
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    goto LABEL_32;
  }
  v79 = 0;
  v63 = 100;
  v62 = (float32x2_t)0xBFF0000000000000;
  v14 = (_QWORD *)sub_18F1FE420();
  *(double *)v15.i64 = a3;
  sub_18F4736FC(v14, (int)internal[7].cache, (uint64_t)v72, &v63, &v62, v15);
  objc_msgSend_applyNorthReference_(self, v16, (uint64_t)v72, v17, v18);
  if (internal[7].vtable == (void *)8 && *(double *)(sub_18F1FE420() + 88) < 0.0)
  {
    v7->isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v19, 102, v20, v21);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v22 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v23.isa = v7->isa;
      *(_DWORD *)buf = 138412290;
      *v81 = v23;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 2))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v24.isa = v7->isa;
    v64 = 138412290;
    isa = v24.isa;
LABEL_60:
    v57 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v57);
    if (v57 != (char *)buf)
      free(v57);
    return 0;
  }
  if ((objc_msgSend_deviceMotionInitialized_(CMMotionManager, v19, (uint64_t)v72, v20, v21) & 1) == 0)
  {
    v7->isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v25, 109, v26, v27);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v51 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v52.isa = v7->isa;
      *(_DWORD *)buf = 138413058;
      *v81 = v52;
      *(_WORD *)&v81[8] = 2048;
      *(float32x2_t *)&v81[10] = v62;
      *(_WORD *)&v81[18] = 2048;
      *(double *)&v81[20] = a3;
      *(_WORD *)&v81[28] = 1024;
      *(_DWORD *)&v81[30] = v79;
      _os_log_impl(&dword_18F1DC000, v51, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f,timestamp,%f,status,%#02x", buf, 0x26u);
    }
    if (!sub_18F1FCA08(115, 2))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v56.isa = v7->isa;
    v64 = 138413058;
    isa = v56.isa;
    v66 = 2048;
    v67 = v62;
    v68 = 2048;
    v69 = a3;
    v70 = 1024;
    v71 = v79;
    goto LABEL_60;
  }
  if (objc_msgSend_northAlignedReferenceFrame_(CMMotionManager, v25, (uint64_t)internal[7].vtable, v26, v27)&& DWORD1(v76) != -1&& SDWORD1(v76) <= 0)
  {
    v7->isa = (Class)objc_msgSend_CMErrorWithCode_(CMErrorUtils, v28, 101, v29, v30);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v31 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
    {
      v32.isa = v7->isa;
      *(_DWORD *)buf = 138412546;
      *v81 = v32;
      *(_WORD *)&v81[8] = 2048;
      *(float32x2_t *)&v81[10] = v62;
      _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v58.isa = v7->isa;
      v64 = 138412546;
      isa = v58.isa;
      v66 = 2048;
      v67 = v62;
      v59 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v59);
      if (v59 != (char *)buf)
        free(v59);
    }
  }
  v33 = [CMDeviceMotion alloc];
  v60[2] = v74;
  v60[3] = v75;
  v60[4] = v76;
  v61 = v77;
  v60[0] = *(_OWORD *)&v72[8];
  v60[1] = v73;
  v37 = (objc_class *)(id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v33, v34, (uint64_t)v60, v35, v36, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v72[12], v78)), *(double *)v72);
  if (qword_1ECEDEE78 != -1)
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
  v38 = off_1ECEDEE70;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
  {
    v39 = v62;
    v40 = mach_absolute_time();
    v41 = sub_18F1FD20C(v40);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v81 = v37;
    *(_WORD *)&v81[8] = 2048;
    *(float32x2_t *)&v81[10] = v39;
    *(_WORD *)&v81[18] = 2048;
    *(double *)&v81[20] = v41;
    _os_log_impl(&dword_18F1DC000, v38, OS_LOG_TYPE_DEBUG, "Predicted CMDeviceMotion: %@,lastSampleTimestamp,%f,now,%f", buf, 0x20u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v42 = v62;
    v43 = mach_absolute_time();
    v44 = sub_18F1FD20C(v43);
    v64 = 138412802;
    isa = v37;
    v66 = 2048;
    v67 = v42;
    v68 = 2048;
    v69 = v44;
    v45 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager predictedDeviceMotionAtTimestamp:error:]", "CoreLocation: %s\n", v45);
    if (v45 != (char *)buf)
      free(v45);
  }
  return v37;
}

- (void)onAccelerometer:(const Sample *)a3
{
  char *internal;
  __int128 v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CMAccelerometerData *v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  _QWORD v29[6];
  int v30;
  void *v31;
  __int16 v32;
  double v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  *((_QWORD *)internal + 9) = *(_QWORD *)&a3->acceleration.z;
  *(_OWORD *)(internal + 56) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 5))
  {
    if (*((_QWORD *)internal + 4))
    {
      v6.n128_u64[0] = *(_QWORD *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        v7 = *((double *)internal + 6);
        if (v7 <= 0.0
          || (v8 = v6.n128_f64[0] - v7,
              v9 = *((double *)internal + 3),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          v10 = (void *)MEMORY[0x194001B4C](v6);
          v11 = [CMAccelerometerData alloc];
          *(float *)&v12 = a3->acceleration.x;
          *(float *)&v13 = a3->acceleration.y;
          *(float *)&v14 = a3->acceleration.z;
          v19 = (void *)objc_msgSend_initWithAcceleration_andTimestamp_(v11, v15, v16, v17, v18, v12, v13, v14, a3->timestamp);
          v20 = *((_QWORD *)internal + 4);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v21 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
          {
            v22 = mach_absolute_time();
            *(_DWORD *)buf = 138412546;
            v35 = v19;
            v36 = 2048;
            v37 = sub_18F1FD20C(v22);
            _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEBUG, "CMAccelerometerData: %@,now,%f", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v27 = mach_absolute_time();
            v30 = 138412546;
            v31 = v19;
            v32 = 2048;
            v33 = sub_18F1FD20C(v27);
            v28 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onAccelerometer:]", "CoreLocation: %s\n", v28);
            if (v28 != (char *)buf)
              free(v28);
          }
          v26 = (void *)*((_QWORD *)internal + 5);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = sub_18F3A68A0;
          v29[3] = &unk_1E2955B60;
          v29[4] = v19;
          v29[5] = v20;
          objc_msgSend_addOperationWithBlock_(v26, v23, (uint64_t)v29, v24, v25);

          objc_autoreleasePoolPop(v10);
          *((_QWORD *)internal + 6) = *(_QWORD *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onGyro:(const Sample *)a3
{
  char *internal;
  __int128 v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CMGyroData *v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  _QWORD v29[6];
  int v30;
  void *v31;
  __int16 v32;
  double v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  *((_QWORD *)internal + 31) = *(_QWORD *)&a3->acceleration.z;
  *(_OWORD *)(internal + 232) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 27))
  {
    if (*((_QWORD *)internal + 26))
    {
      v6.n128_u64[0] = *(_QWORD *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        v7 = *((double *)internal + 28);
        if (v7 <= 0.0
          || (v8 = v6.n128_f64[0] - v7,
              v9 = *((double *)internal + 25),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          v10 = (void *)MEMORY[0x194001B4C](v6);
          v11 = [CMGyroData alloc];
          *(float *)&v12 = a3->acceleration.x;
          *(float *)&v13 = a3->acceleration.y;
          *(float *)&v14 = a3->acceleration.z;
          v19 = (void *)objc_msgSend_initWithRotationRate_andTimestamp_(v11, v15, v16, v17, v18, v12, v13, v14, a3->timestamp);
          v20 = *((_QWORD *)internal + 26);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v21 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
          {
            v22 = mach_absolute_time();
            *(_DWORD *)buf = 138412546;
            v35 = v19;
            v36 = 2048;
            v37 = sub_18F1FD20C(v22);
            _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEBUG, "CMGyroData: %@,now,%f", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v27 = mach_absolute_time();
            v30 = 138412546;
            v31 = v19;
            v32 = 2048;
            v33 = sub_18F1FD20C(v27);
            v28 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onGyro:]", "CoreLocation: %s\n", v28);
            if (v28 != (char *)buf)
              free(v28);
          }
          v26 = (void *)*((_QWORD *)internal + 27);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = sub_18F3A6B84;
          v29[3] = &unk_1E2955B60;
          v29[4] = v19;
          v29[5] = v20;
          objc_msgSend_addOperationWithBlock_(v26, v23, (uint64_t)v29, v24, v25);

          objc_autoreleasePoolPop(v10);
          *((_QWORD *)internal + 28) = *(_QWORD *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onFactoryGyro:(const Sample *)a3
{
  __n128 v3;
  char *internal;
  double v6;
  double v7;
  double v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  float v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  char v27;
  float x;
  float y;
  float z;
  double v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  NSObject *v37;
  float v38;
  uint64_t v39;
  float v40;
  NSObject *v41;
  CMRotationRateData *v42;
  double v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CMGyroData *v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  NSObject *v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  double v67;
  char *v68;
  uint64_t v69;
  char *v70;
  float v71;
  float v72;
  char *v73;
  float v74;
  _QWORD v75[9];
  _DWORD v76[3];
  int v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  uint8_t buf[4];
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  uint64_t v89;
  _QWORD v90[4];

  v90[1] = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  if (!*((_QWORD *)internal + 86))
    return;
  if (!*((_QWORD *)internal + 85))
    return;
  v3.n128_u64[0] = *(_QWORD *)&a3->timestamp;
  if (a3->timestamp <= 0.0)
    return;
  v6 = *((double *)internal + 87);
  if (v6 > 0.0)
  {
    v7 = v3.n128_f64[0] - v6;
    v8 = *((double *)internal + 82);
    v3.n128_f64[0] = v7 - v8;
    if (v3.n128_f64[0] < v8 * -0.1)
      return;
  }
  v10 = (void *)MEMORY[0x194001B4C](v3);
  v11 = *((_QWORD *)internal + 85);
  v12 = *((float *)internal + 176);
  v13 = v12 >= 21475000.0 || v12 <= 0.0;
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0CB2D50];
    v90[0] = CFSTR("Invalid gyro temperature value.");
    v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v90, (uint64_t)&v89, 1);
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("CMErrorDomainFactory"), 8, v15);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v18 = qword_1ECEDEE60;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_ERROR))
    {
      v19 = *((float *)internal + 176);
      v20 = mach_absolute_time();
      *(_DWORD *)buf = 134218240;
      v84 = v19;
      v85 = 2048;
      v86 = sub_18F1FD20C(v20);
      _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_ERROR, "Invalid gyro temperature value: %f,now,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE68 != -1)
        dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
      v21 = *((float *)internal + 176);
      v22 = mach_absolute_time();
      v77 = 134218240;
      v78 = v21;
      v79 = 2048;
      v80 = sub_18F1FD20C(v22);
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
  }
  else
  {
    v17 = 0;
  }
  if (!internal[708])
  {
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v24 = qword_1ECEDEE60;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEBUG))
    {
      v25 = mach_absolute_time();
      v26 = sub_18F1FD20C(v25);
      *(_DWORD *)buf = 134217984;
      v84 = v26;
      _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_DEBUG, "Fit not computed,now,%f", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE68 != -1)
        dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
      v69 = mach_absolute_time();
      v77 = 134217984;
      v78 = sub_18F1FD20C(v69);
      v70 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
  }
  if (internal[708])
    v27 = v13;
  else
    v27 = 1;
  if ((v27 & 1) != 0)
    goto LABEL_33;
  x = a3->acceleration.x;
  y = a3->acceleration.y;
  z = a3->acceleration.z;
  if ((sub_18F1F7BFC() & 0x20000) != 0)
  {
    sub_18F46EE0C((float *)(internal + 709), *((float *)internal + 176));
    if (qword_1ECEDEE68 != -1)
    {
      v74 = v34;
      v71 = v32;
      v72 = v33;
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
      v33 = v72;
      v32 = v71;
      v34 = v74;
    }
    v35 = v32 * 57.296;
    v36 = v33 * 57.296;
    v37 = qword_1ECEDEE60;
    v38 = v34 * 57.296;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v84 = v35;
      v85 = 2048;
      v86 = v36;
      v87 = 2048;
      v88 = v38;
      _os_log_impl(&dword_18F1DC000, v37, OS_LOG_TYPE_DEBUG, "Fit bias: %f,%f,%f deg/s", buf, 0x20u);
    }
    if (!sub_18F1FCA08(115, 2))
      goto LABEL_48;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    goto LABEL_67;
  }
  if ((sub_18F1F7BFC() & 0x10000) != 0)
  {
    v39 = 0;
    v40 = *((float *)internal + 176);
    do
    {
      *(float *)&v76[v39] = *(float *)&internal[v39 * 4 + 1004] + (float)(v40 * *(float *)&internal[v39 * 4 + 992]);
      ++v39;
    }
    while (v39 != 3);
    v35 = *(float *)v76;
    v36 = *(float *)&v76[1];
    v38 = *(float *)&v76[2];
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v41 = qword_1ECEDEE60;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v84 = v35;
      v85 = 2048;
      v86 = v36;
      v87 = 2048;
      v88 = v38;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_DEBUG, "Fit bias: %f,%f,%f deg/s", buf, 0x20u);
    }
    if (!sub_18F1FCA08(115, 2))
      goto LABEL_48;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
LABEL_67:
    v77 = 134218496;
    v78 = v35;
    v79 = 2048;
    v80 = v36;
    v81 = 2048;
    v82 = v38;
    v73 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v73);
    if (v73 != (char *)buf)
      free(v73);
LABEL_48:
    v42 = [CMRotationRateData alloc];
    *(float *)&v43 = x - v35;
    *(float *)&v44 = y - v36;
    *(float *)&v45 = z - v38;
    v31 = COERCE_DOUBLE(objc_msgSend_initWithRotationRate_andTimestamp_(v42, v46, v47, v48, v49, v43, v44, v45, a3->timestamp));
    goto LABEL_49;
  }
LABEL_33:
  v31 = 0.0;
LABEL_49:
  v50 = [CMGyroData alloc];
  *(float *)&v51 = a3->acceleration.x;
  *(float *)&v52 = a3->acceleration.y;
  *(float *)&v53 = a3->acceleration.z;
  v58 = COERCE_DOUBLE(objc_msgSend_initWithRotationRate_andTimestamp_(v50, v54, v55, v56, v57, v51, v52, v53, a3->timestamp));
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v59 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEBUG))
  {
    v60 = mach_absolute_time();
    v61 = sub_18F1FD20C(v60);
    *(_DWORD *)buf = 138412802;
    v84 = v31;
    v85 = 2112;
    v86 = v58;
    v87 = 2048;
    v88 = v61;
    _os_log_impl(&dword_18F1DC000, v59, OS_LOG_TYPE_DEBUG, "CMFactoryGyroData: %@,%@,now,%f", buf, 0x20u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v66 = mach_absolute_time();
    v67 = sub_18F1FD20C(v66);
    v77 = 138412802;
    v78 = v31;
    v79 = 2112;
    v80 = v58;
    v81 = 2048;
    v82 = v67;
    v68 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyro:]", "CoreLocation: %s\n", v68);
    if (v68 != (char *)buf)
      free(v68);
  }
  v65 = (void *)*((_QWORD *)internal + 86);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = sub_18F3A7574;
  v75[3] = &unk_1E2956A38;
  v75[7] = v17;
  v75[8] = v11;
  *(double *)&v75[4] = v31;
  *(double *)&v75[5] = v58;
  v75[6] = internal;
  objc_msgSend_addOperationWithBlock_(v65, v62, (uint64_t)v75, v63, v64);

  objc_autoreleasePoolPop(v10);
  *((_QWORD *)internal + 28) = *(_QWORD *)&a3->timestamp;
}

- (void)onFactoryGyroTemperature:(const Temperature *)a3
{
  os_unfair_lock_s *internal;
  NSObject *v5;
  double var1;
  double var0;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  internal = (os_unfair_lock_s *)self->_internal;
  os_unfair_lock_lock(internal + 2);
  internal[176]._os_unfair_lock_opaque = (uint32_t)LODWORD(a3->var1);
  os_unfair_lock_unlock(internal + 2);
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v5 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEBUG))
  {
    var1 = a3->var1;
    var0 = a3->var0;
    v8 = mach_absolute_time();
    *(_DWORD *)buf = 134218496;
    v12 = var1;
    v13 = 2048;
    v14 = var0;
    v15 = 2048;
    v16 = sub_18F1FD20C(v8);
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEBUG, "Factory gyro temp sample: %f,timestamp,%f,now,%f", buf, 0x20u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v9 = mach_absolute_time();
    sub_18F1FD20C(v9);
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onFactoryGyroTemperature:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
}

- (void)onMagnetometer:(const Sample *)a3
{
  char *internal;
  __int128 v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CMMagnetometerData *v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  _QWORD v29[6];
  int v30;
  void *v31;
  __int16 v32;
  double v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  v5 = *(_OWORD *)&a3->timestamp;
  *((_QWORD *)internal + 53) = *(_QWORD *)&a3->acceleration.z;
  *(_OWORD *)(internal + 408) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 49))
  {
    if (*((_QWORD *)internal + 48))
    {
      v6.n128_u64[0] = *(_QWORD *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        v7 = *((double *)internal + 50);
        if (v7 <= 0.0
          || (v8 = v6.n128_f64[0] - v7,
              v9 = *((double *)internal + 47),
              v6.n128_f64[0] = v8 - v9,
              v6.n128_f64[0] >= v9 * -0.1))
        {
          v10 = (void *)MEMORY[0x194001B4C](v6);
          v11 = [CMMagnetometerData alloc];
          *(float *)&v12 = a3->acceleration.x;
          *(float *)&v13 = a3->acceleration.y;
          *(float *)&v14 = a3->acceleration.z;
          v19 = (void *)objc_msgSend_initWithMagneticField_andTimestamp_(v11, v15, v16, v17, v18, v12, v13, v14, a3->timestamp);
          v20 = *((_QWORD *)internal + 48);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v21 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
          {
            v22 = mach_absolute_time();
            *(_DWORD *)buf = 138412546;
            v35 = v19;
            v36 = 2048;
            v37 = sub_18F1FD20C(v22);
            _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEBUG, "CMMagnetometerData: %@,now,%f", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v27 = mach_absolute_time();
            v30 = 138412546;
            v31 = v19;
            v32 = 2048;
            v33 = sub_18F1FD20C(v27);
            v28 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onMagnetometer:]", "CoreLocation: %s\n", v28);
            if (v28 != (char *)buf)
              free(v28);
          }
          v26 = (void *)*((_QWORD *)internal + 49);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = sub_18F3A7A88;
          v29[3] = &unk_1E2955B60;
          v29[4] = v19;
          v29[5] = v20;
          objc_msgSend_addOperationWithBlock_(v26, v23, (uint64_t)v29, v24, v25);

          objc_autoreleasePoolPop(v10);
          *((_QWORD *)internal + 50) = *(_QWORD *)&a3->timestamp;
        }
      }
    }
  }
}

- (BOOL)sendDeviceMotionError:(int)a3
{
  uint64_t v3;
  _QWORD *internal;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v23;
  _QWORD v24[6];
  _QWORD v25[6];
  int v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v5 = internal[35];
  if (v5)
    LODWORD(v5) = internal[34] != 0;
  v6 = internal[77];
  if (v6)
    LODWORD(v6) = internal[76] != 0;
  v7 = v5 | v6;
  if ((v5 | v6) == 1)
  {
    v8 = (void *)MEMORY[0x194001B4C]();
    v12 = objc_msgSend_CMErrorWithCode_(CMErrorUtils, v9, v3, v10, v11);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v13 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEFAULT, "CMError: %{public}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v26 = 138543362;
      v27 = v12;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager sendDeviceMotionError:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
    v17 = internal[34];
    v18 = MEMORY[0x1E0C809B0];
    if (v17)
    {
      v19 = (void *)internal[35];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_18F3A7D20;
      v25[3] = &unk_1E2955B60;
      v25[4] = v12;
      v25[5] = v17;
      objc_msgSend_addOperationWithBlock_(v19, v14, (uint64_t)v25, v15, v16);
    }
    v20 = internal[76];
    if (v20)
    {
      v21 = (void *)internal[77];
      v24[0] = v18;
      v24[1] = 3221225472;
      v24[2] = sub_18F3A7D34;
      v24[3] = &unk_1E2955B60;
      v24[4] = v12;
      v24[5] = v20;
      objc_msgSend_addOperationWithBlock_(v21, v14, (uint64_t)v24, v15, v16);
    }
    objc_autoreleasePoolPop(v8);
  }
  return v7;
}

- (void)onAmbientPressure:(const Sample *)a3
{
  char *internal;
  __n128 v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CMAmbientPressureData *v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[6];
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  *(_OWORD *)(internal + 120) = *(_OWORD *)&a3->timestamp;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 13))
  {
    if (*((_QWORD *)internal + 12))
    {
      v5.n128_u64[0] = *(_QWORD *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        v6 = *((double *)internal + 14);
        if (v6 <= 0.0
          || (v7 = v5.n128_f64[0] - v6,
              v8 = *((double *)internal + 11),
              v5.n128_f64[0] = v7 - v8,
              v5.n128_f64[0] >= v8 * -0.1))
        {
          v9 = (void *)MEMORY[0x194001B4C](v5);
          v10 = [CMAmbientPressureData alloc];
          *(float *)&v11 = a3->acceleration.x;
          *(float *)&v12 = a3->acceleration.y;
          v17 = (void *)objc_msgSend_initWithPressure_andTimestamp_(v10, v13, v14, v15, v16, v11, v12, a3->timestamp);
          v18 = *((_QWORD *)internal + 12);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v19 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
          {
            v20 = mach_absolute_time();
            *(_DWORD *)buf = 138412546;
            v33 = v17;
            v34 = 2048;
            v35 = sub_18F1FD20C(v20);
            _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_DEBUG, "CMAmbientPressureData: %@,now,%f", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v25 = mach_absolute_time();
            v28 = 138412546;
            v29 = v17;
            v30 = 2048;
            v31 = sub_18F1FD20C(v25);
            v26 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onAmbientPressure:]", "CoreLocation: %s\n", v26);
            if (v26 != (char *)buf)
              free(v26);
          }
          v24 = (void *)*((_QWORD *)internal + 13);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = sub_18F3A8008;
          v27[3] = &unk_1E2955B60;
          v27[4] = v17;
          v27[5] = v18;
          objc_msgSend_addOperationWithBlock_(v24, v21, (uint64_t)v27, v22, v23);

          objc_autoreleasePoolPop(v9);
          *((_QWORD *)internal + 14) = *(_QWORD *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)onCompensatedAmbientPressure:(const Sample *)a3
{
  id internal;
  __n128 v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CMAmbientPressureData *v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[6];
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  os_unfair_lock_lock((os_unfair_lock_t)internal + 2);
  *((_OWORD *)internal + 11) = *(_OWORD *)&a3->timestamp;
  os_unfair_lock_unlock((os_unfair_lock_t)internal + 2);
  if (*((_QWORD *)internal + 20))
  {
    if (*((_QWORD *)internal + 19))
    {
      v5.n128_u64[0] = *(_QWORD *)&a3->timestamp;
      if (a3->timestamp > 0.0)
      {
        v6 = *((double *)internal + 21);
        if (v6 <= 0.0
          || (v7 = v5.n128_f64[0] - v6,
              v8 = *((double *)internal + 18),
              v5.n128_f64[0] = v7 - v8,
              v5.n128_f64[0] >= v8 * -0.1))
        {
          v9 = (void *)MEMORY[0x194001B4C](v5);
          v10 = [CMAmbientPressureData alloc];
          *(float *)&v11 = a3->acceleration.x;
          *(float *)&v12 = a3->acceleration.y;
          v17 = (void *)objc_msgSend_initWithPressure_andTimestamp_(v10, v13, v14, v15, v16, v11, v12, a3->timestamp);
          v18 = *((_QWORD *)internal + 19);
          if (qword_1ECEDEE78 != -1)
            dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
          v19 = off_1ECEDEE70;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEBUG))
          {
            v20 = mach_absolute_time();
            *(_DWORD *)buf = 138412546;
            v33 = v17;
            v34 = 2048;
            v35 = sub_18F1FD20C(v20);
            _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_DEBUG, "CMCompensatedAmbientPressureData: %@,now,%f", buf, 0x16u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECEDEE78 != -1)
              dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
            v25 = mach_absolute_time();
            v28 = 138412546;
            v29 = v17;
            v30 = 2048;
            v31 = sub_18F1FD20C(v25);
            v26 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager onCompensatedAmbientPressure:]", "CoreLocation: %s\n", v26);
            if (v26 != (char *)buf)
              free(v26);
          }
          v24 = (void *)*((_QWORD *)internal + 20);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = sub_18F3A82E0;
          v27[3] = &unk_1E2955B60;
          v27[4] = v17;
          v27[5] = v18;
          objc_msgSend_addOperationWithBlock_(v24, v21, (uint64_t)v27, v22, v23);

          objc_autoreleasePoolPop(v9);
          *((_QWORD *)internal + 21) = *(_QWORD *)&a3->timestamp;
        }
      }
    }
  }
}

- (void)willResignActive:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3A8358;
  v6[3] = &unk_1E29559D0;
  v6[4] = self;
  v6[5] = a3;
  sub_18F1F6514(v5, (uint64_t)v6);
}

- (void)willResignActivePrivate:(id)a3
{
  _QWORD *internal;
  _QWORD *v4;
  uint64_t v5;

  internal = self->_internal;
  v4 = (_QWORD *)sub_18F1FE420();
  if (v4)
    sub_18F1F9458(v4, 0);
  v5 = internal[80];
  if (v5)
  {
    *(CFAbsoluteTime *)(v5 + 16) = CFAbsoluteTimeGetCurrent();
    sub_18F209C68(v5);
    *(CFAbsoluteTime *)(v5 + 8) = CFAbsoluteTimeGetCurrent();
  }
  *((_BYTE *)internal + 624) = 0;
}

+ (BOOL)supportsGyroMiniCalibration
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = sub_18F1EF73C();
  if (v2)
  {
    v3 = (void *)sub_18F20CA68();
    v8 = (void *)objc_msgSend_vendor(v3, v4, v5, v6, v7);
    v12 = objc_msgSend_proxyForService_(v8, v9, (uint64_t)CFSTR("CLGyroCalibrationDatabase"), v10, v11);
    LOBYTE(v2) = MEMORY[0x1E0DE7D20](v12, sel_syncgetSupportsMiniCalibration, v13, v14, v15);
  }
  return v2;
}

+ (BOOL)startGyroMiniCalibration
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  char *v37;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  _QWORD *v40;
  std::__shared_weak_count *v41;
  int v42;
  int v43;
  void *__p[2];
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (std::__shared_weak_count *)operator new(0x70uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageStartMiniCal");
  MEMORY[0x194001030](&v2[1], __p);
  if (v45 < 0)
    operator delete(__p[0]);
  v40 = &v2[1].__vftable;
  v41 = v2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v11 = objc_msgSend_setWithObjects_(v4, v7, v5, v8, v9, v6, 0);
  v38 = &v2[1].__vftable;
  v39 = v2;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v17 = (void *)objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v10, (uint64_t)&v38, v11, v12);
  v18 = v39;
  if (v39)
  {
    v19 = (unint64_t *)&v39->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
  if (v21)
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v22 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_FAULT))
    {
      v27 = objc_msgSend_intValue(v21, v23, v24, v25, v26);
      LODWORD(__p[0]) = 67240192;
      HIDWORD(__p[0]) = v27;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_FAULT, "Unable to start minical. Error code %{public}d", (uint8_t *)__p, 8u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
      v36 = objc_msgSend_intValue(v21, v32, v33, v34, v35);
      v42 = 67240192;
      v43 = v36;
      v37 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMMotionManager startGyroMiniCalibration]", "CoreLocation: %s\n", v37);
      if (v37 != (char *)__p)
        free(v37);
    }
  }
  v28 = v41;
  if (v41)
  {
    v29 = (unint64_t *)&v41->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  return v21 == 0;
}

+ (BOOL)configureM7Activity:(BOOL)a3 stepCounting:(BOOL)a4 activityForceCodeTransition:(BOOL)a5 stepCountingForceCodeTransition:(BOOL)a6 threshold:(BOOL)a7 onBodyDetection:(BOOL)a8 ispMode:(unsigned __int8)a9 predictionInterval:(float)a10 logLevel:(char)a11 proactiveRevisitTime:(unsigned __int16)a12
{
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v12 = 0x10000000000;
  if (!a8)
    v12 = 0;
  v13 = v12 | ((unint64_t)a9 << 48);
  v14 = 0x100000000;
  if (!a7)
    v14 = 0;
  v15 = 0x1000000;
  if (!a6)
    v15 = 0;
  v16 = v14 | v15;
  v17 = 0x10000;
  if (!a5)
    v17 = 0;
  v18 = v16 | v17;
  v19 = 256;
  if (!a4)
    v19 = 0;
  return sub_18F45BC9C(v13 | v18 | v19 | a3, (const char *)(((unint64_t)a11 << 32) | ((unint64_t)a12 << 48) | LODWORD(a10)), a3, a4, a5) != 0;
}

+ ($27EAB7405FCF4138B96BF1D57C6DB1C9)gyroCalibrationDatabaseGetBiasFit
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  $27EAB7405FCF4138B96BF1D57C6DB1C9 *result;

  v4 = (void *)sub_18F20CA68();
  v9 = (void *)objc_msgSend_vendor(v4, v5, v6, v7, v8);
  v13 = (void *)objc_msgSend_proxyForService_(v9, v10, (uint64_t)CFSTR("CLGyroCalibrationDatabase"), v11, v12);
  result = ($27EAB7405FCF4138B96BF1D57C6DB1C9 *)objc_msgSend_syncgetBiasFit_(v13, v14, (uint64_t)retstr, v15, v16);
  if ((result & 1) == 0)
  {
    bzero(retstr, 0x140uLL);
    retstr->var0 = 1;
    retstr->var1 = -1.79769313e308;
  }
  return result;
}

+ ($27EAB7405FCF4138B96BF1D57C6DB1C9)gyroCalibrationDatabaseGetBiasFitAndEstimate:(SEL)a3 atTemperature:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  $27EAB7405FCF4138B96BF1D57C6DB1C9 *result;
  float v10;
  __int32 v11;
  float32x2_t v12;
  float v13;
  _BYTE __dst[282];

  *(_OWORD *)&retstr->var5.var1.var1[255] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[271] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[223] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[239] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[191] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[207] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[159] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[175] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[127] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[143] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[95] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[111] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[63] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[79] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[31] = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[47] = 0u;
  *(_OWORD *)&retstr->var5.var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var5.var1.var1[15] = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = ($27EAB7405FCF4138B96BF1D57C6DB1C9 *)objc_msgSend_gyroCalibrationDatabaseGetBiasFit(CMMotionManager, a3, (uint64_t)a4, v5, v6);
  if (a4)
  {
    if (retstr->var0 == 2)
    {
      memcpy(__dst, (char *)&retstr->var5.var0.var0.var0 + 1, sizeof(__dst));
      result = ($27EAB7405FCF4138B96BF1D57C6DB1C9 *)sub_18F46EE0C((float *)__dst, a5);
      v12.i32[1] = v11;
      *(float64x2_t *)&a4->var0 = vcvtq_f64_f32(vmul_f32(v12, (float32x2_t)vdup_n_s32(0x42652EE1u)));
      v10 = v13 * 57.296;
      goto LABEL_6;
    }
    if (retstr->var0 == 1)
    {
      *(float64x2_t *)&a4->var0 = vcvtq_f64_f32(vmla_n_f32(*(float32x2_t *)&retstr->var5.var1.var1[11], *(float32x2_t *)&retstr->var5.var0.var0.var0, a5));
      v10 = retstr->var5.var0.var1.var2 + (float)(retstr->var5.var0.var0.var2 * a5);
LABEL_6:
      a4->var2 = v10;
      return result;
    }
    a4->var0 = 0.0;
    a4->var1 = 0.0;
    a4->var2 = 0.0;
  }
  return result;
}

+ (BOOL)hasRunMiniCal
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_featureAvailability_(CMMotionUtils, a2, (uint64_t)"kCLConnectionMessageHasRunMiniCal", v2, v3);
}

- (BOOL)isDeviceMotionLiteAvailable
{
  sub_18F1F7758();
  return 0;
}

- (void)startDeviceMotionLiteUpdatesForDeviceID:(id)a3 usingConfiguration:(id)a4 toQueue:(id)a5 withFusedHandler:(id)a6
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE78 != -1)
    goto LABEL_11;
  while (1)
  {
    v6 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "0";
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    }
    v7 = off_1ECEDEE70;
    if (os_signpost_enabled((os_log_t)off_1ECEDEE70))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "0";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API", "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    }
    v8 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "0";
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Motion manager can not start device motion lite updates, use isDeviceMotionLiteAvailable before using this API\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
  }
}

- (void)startDeviceMotionLiteFusedUpdatesForDeviceID:(id)a3 toQueue:(id)a4 withHandler:(id)a5
{
  NSObject *v6;
  char *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE78 != -1)
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
  v6 = off_1ECEDEE70;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a3;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "Motion manager asked to start device motion lite updates for device id %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startDeviceMotionLiteFusedUpdatesForDeviceID:toQueue:withHandler:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
}

- (void)stopDeviceMotionLiteUpdatesForDeviceID:(id)a3
{
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE78 != -1)
    dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
  v4 = off_1ECEDEE70;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = a3;
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEFAULT, "Motion manager asked to stop device motion lite updates for device id %@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2956AF0);
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager stopDeviceMotionLiteUpdatesForDeviceID:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3A8F54;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3A8FF4;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[7] = a4;
  v10[6] = a5;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)startFactoryGyroUpdatesToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6
{
  uint64_t v11;
  _QWORD v12[9];

  v11 = sub_18F204AE4();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F3A9094;
  v12[3] = &unk_1E2956A60;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[8] = a4;
  v12[6] = a5;
  v12[7] = a6;
  sub_18F1F6514(v11, (uint64_t)v12);
}

- (void)stopFactoryGyroUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A9108;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)startDeviceMotionUpdatesForKeyboardMotionToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 sendFrequency:(double)a5 andHandler:(id)a6
{
  uint64_t v11;
  _QWORD v12[9];

  v11 = sub_18F204AE4();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F3A9198;
  v12[3] = &unk_1E2956A88;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[7] = a4;
  *(double *)&v12[8] = a5;
  v12[6] = a6;
  sub_18F1F6514(v11, (uint64_t)v12);
}

- (void)stopDeviceMotionUpdatesForKeyboardMotion
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3A920C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startFactoryGyroUpdatesPrivateToQueue:(id)a3 atUpdateInterval:(double)a4 withHandler:(id)a5 residualHandler:(id)a6
{
  double *internal;
  NSObject *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  char *v25;
  float *v26;
  float *v27;
  float *v28;
  float *v29;
  unint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  NSObject *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  float *v42;
  char *v43;
  double *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  std::__shared_weak_count_vtbl *v58;
  std::__shared_weak_count *v59;
  unint64_t *p_shared_owners;
  unint64_t v61;
  char *v62;
  float *v63;
  float v64;
  unsigned int v65;
  unsigned int v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  __int128 v71;
  char *v72;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  float *v83;
  char *v84;
  __int128 v85;
  uint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  NSObject *v96;
  char *v97;
  uint64_t i;
  float v99;
  NSObject *v100;
  char *v101;
  uint64_t j;
  NSObject *v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  _QWORD *v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  CFAbsoluteTime *v120;
  char v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  float *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  float v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  double v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  double v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  double v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  double v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  char *v231;
  char *v232;
  char *v233;
  char *v234;
  CMMotionManager *v235;
  id v236;
  double *v237;
  _QWORD v238[6];
  _QWORD v239[7];
  std::__shared_weak_count *v240;
  _QWORD v241[6];
  id v242;
  void *v243;
  float *v244;
  uint64_t v245;
  std::__shared_weak_count_vtbl *v246;
  std::__shared_weak_count *v247;
  _QWORD v248[4];
  _QWORD v249[4];
  uint64_t v250;
  uint64_t v251;
  void *__p[4];
  __int16 v253;
  double v254;
  __int16 v255;
  double v256;
  __int16 v257;
  double v258;
  _OWORD __src[18];
  uint8_t buf[64];
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _BYTE v264[28];
  uint64_t v265;

  v265 = *MEMORY[0x1E0C80C00];
  internal = (double *)self->_internal;
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v12 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    *(double *)&buf[4] = a4;
    _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "Starting factory gyro updates at rate: %{public}f", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    LODWORD(__src[0]) = 134349056;
    *(double *)((char *)__src + 4) = a4;
    v231 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v231);
    if (v231 != (char *)buf)
      free(v231);
  }
  if (a4 > 0.0)
  {
    internal[82] = a4;
    v13 = (id)*((_QWORD *)internal + 86);
    if (v13 != a3)
    {

      *((_QWORD *)internal + 86) = a3;
    }
    v14 = (id)*((_QWORD *)internal + 85);
    if (v14 != a5)
    {

      *((_QWORD *)internal + 85) = objc_msgSend_copy(a5, v15, v16, v17, v18);
    }
    v243 = 0;
    v244 = 0;
    v245 = 0;
    v242 = 0;
    sub_18F49B79C((float **)&v243, &v242);
    if (v242)
    {
      if (qword_1ECEDEE68 != -1)
        dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
      v19 = qword_1ECEDEE60;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v242;
        _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "Error found while reading GYTT: %@", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        LODWORD(__src[0]) = 138412290;
        *(_QWORD *)((char *)__src + 4) = v242;
        v232 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v232);
        if (v232 != (char *)buf)
          free(v232);
      }
      v23 = (void *)*((_QWORD *)internal + 86);
      if (v23 && *((_QWORD *)internal + 85))
      {
        v241[0] = MEMORY[0x1E0C809B0];
        v241[1] = 3221225472;
        v241[2] = sub_18F3AAD10;
        v241[3] = &unk_1E29559D0;
        v241[4] = internal;
        v241[5] = v242;
        objc_msgSend_addOperationWithBlock_(v23, v20, (uint64_t)v241, v21, v22);
      }
LABEL_175:
      if (v243)
      {
        v244 = (float *)v243;
        operator delete(v243);
      }
      return;
    }
    v235 = self;
    v236 = a6;
    v237 = internal;
    v27 = (float *)v243;
    v26 = v244;
    if (v243 == v244)
    {
      v28 = 0;
      v29 = 0;
    }
    else
    {
      v28 = 0;
      v29 = 0;
      v30 = 0;
      do
      {
        v32 = *v27;
        v31 = v27[1];
        v34 = v27[2];
        v33 = v27[3];
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        v35 = qword_1ECEDEE60;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218752;
          *(double *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2048;
          *(double *)&buf[24] = v34;
          *(_WORD *)&buf[32] = 2048;
          *(double *)&buf[34] = v33;
          _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_DEFAULT, "GYTT temperature,%f,bias.x,%f,bias.y,%f,bias.z,%f", buf, 0x2Au);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE68 != -1)
            dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
          LODWORD(__src[0]) = 134218752;
          *(double *)((char *)__src + 4) = v32;
          WORD6(__src[0]) = 2048;
          *(double *)((char *)__src + 14) = v31;
          WORD3(__src[1]) = 2048;
          *((double *)&__src[1] + 1) = v34;
          LOWORD(__src[2]) = 2048;
          *(double *)((char *)&__src[2] + 2) = v33;
          v43 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v43);
          if (v43 != (char *)buf)
            free(v43);
        }
        if ((unint64_t)v29 >= v30)
        {
          v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)v28) >> 3) + 1;
          if (v36 > 0xAAAAAAAAAAAAAAALL)
            sub_18F26F8C0();
          if (0x5555555555555556 * ((uint64_t)(v30 - (_QWORD)v28) >> 3) > v36)
            v36 = 0x5555555555555556 * ((uint64_t)(v30 - (_QWORD)v28) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v30 - (_QWORD)v28) >> 3) >= 0x555555555555555)
            v37 = 0xAAAAAAAAAAAAAAALL;
          else
            v37 = v36;
          if (v37)
            v37 = (unint64_t)sub_18F3ABF84(v37);
          else
            v38 = 0;
          v39 = v37 + 8 * (((char *)v29 - (char *)v28) >> 3);
          *(float *)v39 = v32;
          *(float *)(v39 + 4) = v31;
          *(float *)(v39 + 8) = v34;
          *(float *)(v39 + 12) = v33;
          *(_QWORD *)(v39 + 16) = 0;
          if (v29 == v28)
          {
            v42 = (float *)(v37 + 8 * (((char *)v29 - (char *)v28) >> 3));
          }
          else
          {
            v40 = v37 + 8 * (((char *)v29 - (char *)v28) >> 3);
            do
            {
              v41 = *(_OWORD *)(v29 - 6);
              v42 = (float *)(v40 - 24);
              *(_QWORD *)(v40 - 8) = *((_QWORD *)v29 - 1);
              *(_OWORD *)(v40 - 24) = v41;
              v29 -= 6;
              v40 -= 24;
            }
            while (v29 != v28);
          }
          v30 = v37 + 24 * v38;
          v29 = (float *)(v39 + 24);
          if (v28)
            operator delete(v28);
          v28 = v42;
        }
        else
        {
          *v29 = v32;
          v29[1] = v31;
          v29[2] = v34;
          v29[3] = v33;
          *((_QWORD *)v29 + 2) = 0;
          v29 += 6;
        }
        v27 += 4;
      }
      while (v27 != v26);
    }
    v44 = v237;
    if ((sub_18F1F7BFC() & 0x20000) == 0)
    {
      if ((sub_18F1F7BFC() & 0x10000) == 0)
      {
        v48 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("Missing gyro linearity information. Please file a radar against CoreMotion Factory | All to add support for this device."), v46, v47);
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v250 = *MEMORY[0x1E0CB2D50];
        v251 = v48;
        v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v50, (uint64_t)&v251, (uint64_t)&v250, 1);
        v242 = (id)objc_msgSend_initWithDomain_code_userInfo_(v49, v52, (uint64_t)CFSTR("CMErrorDomainFactory"), 2, v51);
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        v53 = qword_1ECEDEE60;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl(&dword_18F1DC000, v53, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE68 != -1)
            dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
          LODWORD(__src[0]) = 138543362;
          *(_QWORD *)((char *)__src + 4) = v48;
          v234 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v234);
          if (v234 != (char *)buf)
            free(v234);
          v44 = v237;
        }
        v57 = (void *)*((_QWORD *)v44 + 86);
        if (v57 && *((_QWORD *)v44 + 85))
        {
          v239[0] = MEMORY[0x1E0C809B0];
          v239[1] = 3221225472;
          v239[2] = sub_18F3AAD2C;
          v239[3] = &unk_1E29559D0;
          v239[4] = v44;
          v239[5] = v242;
          objc_msgSend_addOperationWithBlock_(v57, v54, (uint64_t)v239, v55, v56);
        }
LABEL_173:
        if (v28)
          operator delete(v28);
        goto LABEL_175;
      }
      memset(__p, 0, 24);
      sub_18F48F978(v28, v29, 0, 0, (float *)__p);
      if (qword_1ECEDEE68 != -1)
        dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
      v115 = qword_1ECEDEE60;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134350336;
        *(double *)&buf[4] = *(float *)__p;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = *((float *)__p + 1);
        *(_WORD *)&buf[22] = 2050;
        *(double *)&buf[24] = *(float *)&__p[1];
        *(_WORD *)&buf[32] = 2050;
        *(double *)&buf[34] = *((float *)&__p[1] + 1);
        *(_WORD *)&buf[42] = 2050;
        *(double *)&buf[44] = *(float *)&__p[2];
        *(_WORD *)&buf[52] = 2050;
        *(double *)&buf[54] = *((float *)&__p[2] + 1);
        _os_log_impl(&dword_18F1DC000, v115, OS_LOG_TYPE_DEFAULT, "Linear fit slope:%{public}f,%{public}f,%{public}f intercept:%{public}f,%{public}f,%{public}f", buf, 0x3Eu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        LODWORD(__src[0]) = 134350336;
        *(double *)((char *)__src + 4) = *(float *)__p;
        WORD6(__src[0]) = 2050;
        *(double *)((char *)__src + 14) = *((float *)__p + 1);
        WORD3(__src[1]) = 2050;
        *((double *)&__src[1] + 1) = *(float *)&__p[1];
        LOWORD(__src[2]) = 2050;
        *(double *)((char *)&__src[2] + 2) = *((float *)&__p[1] + 1);
        WORD5(__src[2]) = 2050;
        *(double *)((char *)&__src[2] + 12) = *(float *)&__p[2];
        WORD2(__src[3]) = 2050;
        *(double *)((char *)&__src[3] + 6) = *((float *)&__p[2] + 1);
        v233 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v233);
        if (v233 != (char *)buf)
          free(v233);
        v44 = v237;
      }
      *((_BYTE *)v44 + 708) = 1;
      *((_OWORD *)v44 + 62) = *(_OWORD *)__p;
      v44[126] = *(double *)&__p[2];
LABEL_155:
      if (!*((_QWORD *)v44 + 83))
      {
        v116 = (_QWORD *)operator new();
        *v116 = off_1E294C238;
        *v116 = &off_1E294C7E8;
        v116[1] = 0;
        v116[2] = sub_18F3A0DA4;
        v116[3] = v235;
        *((_QWORD *)v44 + 83) = v116;
        v117 = sub_18F1EF73C();
        sub_18F1F4F0C(v117, 1, *((_QWORD *)v44 + 83), v44[84]);
      }
      if (!*((_QWORD *)v44 + 81))
      {
        v118 = (_QWORD *)operator new();
        *v118 = off_1E294C238;
        *v118 = &off_1E294C820;
        v118[1] = 0;
        v118[2] = sub_18F3A0D98;
        v118[3] = v235;
        *((_QWORD *)v44 + 81) = v118;
        v119 = sub_18F1EF73C();
        sub_18F1F4F0C(v119, 0, *((_QWORD *)v44 + 81), v44[82]);
        v120 = (CFAbsoluteTime *)*((_QWORD *)v44 + 80);
        if (v120)
        {
          v121 = *(_BYTE *)v120;
          if (!*(_BYTE *)v120)
          {
            v120[1] = CFAbsoluteTimeGetCurrent();
            v121 = *(_BYTE *)v120;
          }
          *(_BYTE *)v120 = v121 | 2;
        }
      }
      if (v236 && *((_QWORD *)v44 + 86))
      {
        v122 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v111, v112, v113, v114);
        v127 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v123, v124, v125, v126);
        v132 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130, v131);
        v140 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v133, v134, v135, v136);
        if (v28 != v29)
        {
          v141 = v28;
          do
          {
            if ((sub_18F1F7BFC() & 0x20000) != 0)
            {
              sub_18F46EE0C((float *)((char *)v237 + 709), *v141);
              v177 = v176;
              v179 = v178;
              *(float *)&v181 = (float)(v180 * 57.296) - v141[1];
              v186 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v182, v183, v184, v185, v181);
              objc_msgSend_addObject_(v122, v187, v186, v188, v189);
              *(float *)&v190 = (float)(v177 * 57.296) - v141[2];
              v195 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v191, v192, v193, v194, v190);
              objc_msgSend_addObject_(v127, v196, v195, v197, v198);
              *(float *)&v199 = (float)(v179 * 57.296) - v141[3];
              v204 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v200, v201, v202, v203, v199);
              objc_msgSend_addObject_(v132, v205, v204, v206, v207);
            }
            else
            {
              v147 = 0;
              v148 = *v141;
              do
              {
                *(float *)&buf[v147] = *(float *)((char *)v237 + v147 + 1004)
                                     + (float)(v148 * *(float *)((char *)v237 + v147 + 992));
                v147 += 4;
              }
              while (v147 != 12);
              *(float *)&v146 = *(float *)buf - v141[1];
              v149 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v142, v143, v144, v145, v146);
              objc_msgSend_addObject_(v122, v150, v149, v151, v152);
              *(float *)&v153 = *(float *)&buf[4] - v141[2];
              v158 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v154, v155, v156, v157, v153);
              objc_msgSend_addObject_(v127, v159, v158, v160, v161);
              *(float *)&v162 = *(float *)&buf[8] - v141[3];
              v167 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v163, v164, v165, v166, v162);
              objc_msgSend_addObject_(v132, v168, v167, v169, v170);
            }
            *(float *)&v175 = *v141;
            v208 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v171, v172, v173, v174, v175);
            objc_msgSend_addObject_(v140, v209, v208, v210, v211);
            v141 += 6;
          }
          while (v141 != v29);
        }
        v212 = objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v137, (uint64_t)v122, v138, v139);
        v216 = objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v213, (uint64_t)v127, v214, v215);
        v220 = objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v217, (uint64_t)v132, v218, v219);
        v224 = objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v221, (uint64_t)v140, v222, v223);
        v248[0] = CFSTR("x");
        v248[1] = CFSTR("y");
        v249[0] = v212;
        v249[1] = v216;
        v248[2] = CFSTR("z");
        v248[3] = CFSTR("temperature");
        v249[2] = v220;
        v249[3] = v224;
        v226 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v225, (uint64_t)v249, (uint64_t)v248, 4);
        v227 = (void *)*((_QWORD *)v237 + 86);
        v238[0] = MEMORY[0x1E0C809B0];
        v238[1] = 3221225472;
        v238[2] = sub_18F3AAD48;
        v238[3] = &unk_1E2955B60;
        v238[4] = v226;
        v238[5] = v236;
        objc_msgSend_addOperationWithBlock_(v227, v228, (uint64_t)v238, v229, v230);
      }
      goto LABEL_173;
    }
    v58 = (std::__shared_weak_count_vtbl *)operator new();
    v58->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&off_1E294A990;
    memset(__src, 0, 282);
    v239[6] = v58;
    v59 = (std::__shared_weak_count *)operator new();
    v59->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v59->__shared_owners_;
    v59->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952810;
    v59->__shared_weak_owners_ = 0;
    v59[1].__vftable = v58;
    v240 = v59;
    memset(__src, 0, 282);
    v246 = v58;
    v247 = v59;
    do
      v61 = __ldxr(p_shared_owners);
    while (__stxr(v61 + 1, p_shared_owners));
    v263 = 0u;
    memset(v264, 0, sizeof(v264));
    v261 = 0u;
    v262 = 0u;
    memset(buf, 0, sizeof(buf));
    memset(__p, 0, 24);
    v62 = (char *)operator new(0x1068uLL);
    __p[0] = v62;
    __p[2] = v62 + 4200;
    bzero(v62, 0x1068uLL);
    __p[1] = v62 + 4200;
    if (v28 == v29)
    {
LABEL_83:
      v68 = 0;
      v69 = v62 + 24;
      while (v68 % 5 < *(_DWORD *)&buf[4 * (v68 / 5uLL)])
      {
        ++v68;
        v69 += 24;
        if (v68 == 175)
          goto LABEL_98;
      }
      if ((v68 & 0x7FFFFFFFFFFFFFFELL) != 0xAE)
      {
        v70 = v68 - 174;
        do
        {
          if (((int)v70 + 175) % 5u < *(_DWORD *)&buf[4 * ((v70 + 175) / 5uLL)])
          {
            v71 = *(_OWORD *)v69;
            v72 = &v62[24 * v68];
            *((_QWORD *)v72 + 2) = *((_QWORD *)v69 + 2);
            *(_OWORD *)v72 = v71;
            ++v68;
          }
          v69 += 24;
        }
        while (!__CFADD__(v70++, 1));
      }
      if (v68 != 175)
      {
        v74 = &v62[24 * v68];
        v75 = -24 * v68 + 4200;
        if (&v74[v75] != v62 + 4200)
        {
          v76 = 8 * (v75 >> 3);
          do
          {
            v77 = *(_OWORD *)&v74[v76];
            *((_QWORD *)v74 + 2) = *(_QWORD *)&v74[v76 + 16];
            *(_OWORD *)v74 = v77;
            v74 += 24;
            v75 -= 24;
          }
          while (v76 != v75);
        }
        __p[1] = v74;
      }
LABEL_98:
      sub_18F46F4F8((uint64_t)__p, 0, (uint64_t)__src);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      do
        v78 = __ldaxr(p_shared_owners);
      while (__stlxr(v78 - 1, p_shared_owners));
      if (!v78)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
      memset(buf, 0, 24);
      if (v29 != v28)
      {
        v79 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)v28) >> 3);
        if (v79 > 0xAAAAAAAAAAAAAAALL)
          sub_18F26F8C0();
        v80 = (char *)sub_18F3ABF84(v79);
        v81 = 0;
        *(_QWORD *)buf = v80;
        *(_QWORD *)&buf[16] = &v80[24 * v82];
        v83 = v28;
        v84 = v80;
        do
        {
          v85 = *(_OWORD *)v83;
          *((_QWORD *)v84 + 2) = *((_QWORD *)v83 + 2);
          *(_OWORD *)v84 = v85;
          v84 += 24;
          v83 += 6;
          v81 += 24;
        }
        while (v83 != v29);
        *(_QWORD *)&buf[8] = &v80[v81];
      }
      sub_18F46FE1C((uint64_t)__src, (uint64_t *)buf, 0, 0.0);
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      if (v240)
      {
        v86 = &v240->__shared_owners_;
        do
          v87 = __ldaxr((unint64_t *)v86);
        while (__stlxr(v87 - 1, (unint64_t *)v86));
        if (!v87)
        {
          ((void (*)(std::__shared_weak_count *))v240->__on_zero_shared)(v240);
          std::__shared_weak_count::__release_weak(v240);
        }
      }
      v88 = 4;
      do
      {
        v89 = (char *)__src + v88;
        v90 = *(float *)((char *)__src + v88);
        v91 = *(float *)((char *)__src + v88 + 4);
        v93 = *(float *)((char *)__src + v88 + 8);
        v92 = *(float *)((char *)__src + v88 + 12);
        v94 = *(float *)((char *)&__src[1] + v88);
        v95 = *(float *)((char *)&__src[1] + v88 + 4);
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        v96 = qword_1ECEDEE60;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219264;
          *(double *)&buf[4] = v90;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v91;
          *(_WORD *)&buf[22] = 2048;
          *(double *)&buf[24] = v93;
          *(_WORD *)&buf[32] = 2048;
          *(double *)&buf[34] = v92;
          *(_WORD *)&buf[42] = 2048;
          *(double *)&buf[44] = v94;
          *(_WORD *)&buf[52] = 2048;
          *(double *)&buf[54] = v95;
          _os_log_impl(&dword_18F1DC000, v96, OS_LOG_TYPE_DEFAULT, "Nonlinear Fit slope:%f,%f,%f intercept:%f,%f,%f", buf, 0x3Eu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE68 != -1)
            dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
          LODWORD(__p[0]) = 134219264;
          *(double *)((char *)__p + 4) = v90;
          WORD2(__p[1]) = 2048;
          *(double *)((char *)&__p[1] + 6) = v91;
          HIWORD(__p[2]) = 2048;
          *(double *)&__p[3] = v93;
          v253 = 2048;
          v254 = v92;
          v255 = 2048;
          v256 = v94;
          v257 = 2048;
          v258 = v95;
          v97 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v97);
          if (v97 != (char *)buf)
            free(v97);
        }
        v88 += 24;
      }
      while (v89 + 24 != (char *)&__src[12] + 4);
      for (i = 196; i != 224; i += 4)
      {
        v99 = *(float *)((char *)__src + i);
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        v100 = qword_1ECEDEE60;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          *(double *)&buf[4] = v99;
          _os_log_impl(&dword_18F1DC000, v100, OS_LOG_TYPE_DEFAULT, "Nonlinear fit temperature: %{public}f", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE68 != -1)
            dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
          LODWORD(__p[0]) = 134349056;
          *(double *)((char *)__p + 4) = v99;
          v101 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v101);
          if (v101 != (char *)buf)
            free(v101);
        }
      }
      for (j = 0; j != 18; ++j)
      {
        if (qword_1ECEDEE68 != -1)
          dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
        v103 = qword_1ECEDEE60;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
        {
          v104 = *((unsigned __int8 *)&__src[14] + j + 4);
          v105 = *((unsigned __int8 *)&__src[15] + j + 6);
          v106 = *((unsigned __int8 *)&__src[16] + j + 8);
          *(_DWORD *)buf = 67240704;
          *(_DWORD *)&buf[4] = v104;
          *(_WORD *)&buf[8] = 1026;
          *(_DWORD *)&buf[10] = v105;
          *(_WORD *)&buf[14] = 1026;
          *(_DWORD *)&buf[16] = v106;
          _os_log_impl(&dword_18F1DC000, v103, OS_LOG_TYPE_DEFAULT, "Nonlinear fit error:%{public}u %{public}u %{public}u", buf, 0x14u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE68 != -1)
            dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
          v107 = *((unsigned __int8 *)&__src[14] + j + 4);
          v108 = *((unsigned __int8 *)&__src[15] + j + 6);
          v109 = *((unsigned __int8 *)&__src[16] + j + 8);
          LODWORD(__p[0]) = 67240704;
          HIDWORD(__p[0]) = v107;
          LOWORD(__p[1]) = 1026;
          *(_DWORD *)((char *)&__p[1] + 2) = v108;
          HIWORD(__p[1]) = 1026;
          LODWORD(__p[2]) = v109;
          v110 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v110);
          if (v110 != (char *)buf)
            free(v110);
        }
      }
      v44 = v237;
      *((_BYTE *)v237 + 708) = 1;
      memcpy((char *)v237 + 709, __src, 0x11AuLL);
      goto LABEL_155;
    }
    v63 = v28;
    while (1)
    {
      v64 = *v63;
      v65 = (int)(float)(*v63 * 0.5);
      if (v65 <= 0x22)
      {
        v66 = *(_DWORD *)&buf[4 * v65];
        *(_DWORD *)&buf[4 * v65] = v66 + 1;
        if (v66 < 5)
          goto LABEL_81;
        v66 = (*(uint64_t (**)(std::__shared_weak_count_vtbl *))v58->~__shared_weak_count)(v58);
        if (v66 <= 4)
          break;
      }
LABEL_82:
      v63 += 6;
      if (v63 == v29)
        goto LABEL_83;
    }
    v64 = *v63;
LABEL_81:
    v67 = &v62[120 * v65 + 24 * v66];
    *(float *)v67 = v64;
    *((float *)v67 + 1) = v63[1];
    *((float *)v67 + 2) = v63[2];
    *((float *)v67 + 3) = v63[3];
    *((_QWORD *)v67 + 2) = *((_QWORD *)v63 + 2);
    goto LABEL_82;
  }
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v24 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    *(double *)&buf[4] = a4;
    _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_ERROR, "Invalid update interval: %{public}f", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    LODWORD(__src[0]) = 134349056;
    *(double *)((char *)__src + 4) = a4;
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMMotionManager startFactoryGyroUpdatesPrivateToQueue:atUpdateInterval:withHandler:residualHandler:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf)
      free(v25);
  }
}

- (void)stopFactoryGyroUpdatesPrivate
{
  char *internal;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char *v16;
  uint8_t buf[8];
  uint64_t v18;
  uint64_t *(*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v3 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping factory gyro updates.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager stopFactoryGyroUpdatesPrivate]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf)
      free(v16);
  }
  *(_OWORD *)(internal + 975) = 0u;
  *(_OWORD *)(internal + 948) = 0u;
  *(_OWORD *)(internal + 964) = 0u;
  *(_OWORD *)(internal + 916) = 0u;
  *(_OWORD *)(internal + 932) = 0u;
  *(_OWORD *)(internal + 884) = 0u;
  *(_OWORD *)(internal + 900) = 0u;
  *(_OWORD *)(internal + 852) = 0u;
  *(_OWORD *)(internal + 868) = 0u;
  *(_OWORD *)(internal + 820) = 0u;
  *(_OWORD *)(internal + 836) = 0u;
  *(_OWORD *)(internal + 788) = 0u;
  *(_OWORD *)(internal + 804) = 0u;
  *(_OWORD *)(internal + 756) = 0u;
  *(_OWORD *)(internal + 772) = 0u;
  *(_OWORD *)(internal + 724) = 0u;
  *(_OWORD *)(internal + 740) = 0u;
  *(_OWORD *)(internal + 708) = 0u;
  v4 = MEMORY[0x1E0C809B0];
  if (*((_QWORD *)internal + 81))
  {
    v5 = sub_18F1EF73C();
    v6 = *((_QWORD *)internal + 81);
    v7 = sub_18F204AE4();
    *(_QWORD *)buf = v4;
    v18 = 3221225472;
    v19 = sub_18F1F5EE0;
    v20 = &unk_1E2956E98;
    v23 = 0;
    v21 = v5;
    v22 = v6;
    sub_18F1F5E28(v7, (uint64_t)buf);
    v8 = *((_QWORD *)internal + 81);
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    *((_QWORD *)internal + 81) = 0;
    v9 = (unsigned __int8 *)*((_QWORD *)internal + 80);
    if (v9)
      sub_18F209C14(v9, 2);
  }
  if (*((_QWORD *)internal + 83))
  {
    v10 = sub_18F1EF73C();
    v11 = *((_QWORD *)internal + 83);
    v12 = sub_18F204AE4();
    *(_QWORD *)buf = v4;
    v18 = 3221225472;
    v19 = sub_18F1F5EE0;
    v20 = &unk_1E2956E98;
    v23 = 1;
    v21 = v10;
    v22 = v11;
    sub_18F1F5E28(v12, (uint64_t)buf);
    v13 = *((_QWORD *)internal + 83);
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    *((_QWORD *)internal + 83) = 0;
  }
  v14 = (void *)*((_QWORD *)internal + 86);
  if (v14)
  {

    *((_QWORD *)internal + 86) = 0;
  }
  v15 = (void *)*((_QWORD *)internal + 85);
  if (v15)
  {

    *((_QWORD *)internal + 85) = 0;
  }
}

- (void)startDeviceMotionUpdatesForKeyboardMotionPrivateToQueue:(id)a3 withGravityDeltaThreshold:(double)a4 notificationFrequency:(double)a5 andHandler:(id)a6
{
  float *internal;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  double v16;
  int v17;
  double v18;
  double v19;
  float v20;
  float v21;
  CLDeviceMotionProperties *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  _QWORD v35[8];
  uint8_t buf[1640];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  internal = (float *)self->_internal;
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v12 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEFAULT, "Starting keyboard motion updates.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    LOWORD(v35[0]) = 0;
    v34 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager startDeviceMotionUpdatesForKeyboardMotionPrivateToQueue:withGravityDeltaThreshold:notificationFrequency:andHandler:]", "CoreLocation: %s\n", v34);
    if (v34 != (char *)buf)
      free(v34);
  }
  if (sub_18F1E1B00())
  {
    v13 = (id)*((_QWORD *)internal + 128);
    if (v13 != a3)
    {

      *((_QWORD *)internal + 128) = a3;
    }
    v14 = (id)*((_QWORD *)internal + 127);
    if (v14 != a6)
    {

      *((_QWORD *)internal + 127) = a6;
    }
    sub_18F20CC1C((char *)buf, CFSTR("com.apple.CoreMotion"), 1);
    v35[0] = 0;
    v15 = sub_18F1EEBEC((uint64_t)buf, (uint64_t)CFSTR("KeyboardMotionGravityThreshold"), v35);
    v16 = *(double *)v35;
    v35[0] = 0;
    v17 = sub_18F1EEBEC((uint64_t)buf, (uint64_t)CFSTR("KeyboardMotionGravitySendFrequency"), v35);
    if (v15)
      v18 = v16;
    else
      v18 = a4;
    v19 = *(double *)v35;
    if (!v17)
      v19 = a5;
    v20 = v18;
    v21 = v19;
    internal[265] = v20;
    internal[266] = v21;
    if (!*((_QWORD *)internal + 129))
    {
      v22 = [CLDeviceMotionProperties alloc];
      v26 = (void *)objc_msgSend_initWithMode_(v22, v23, 3, v24, v25);
      v27 = (_QWORD *)operator new();
      *v27 = off_1E294C238;
      v28 = v26;
      *v27 = &off_1E294C350;
      v27[1] = v28;
      v27[2] = sub_18F3A0E88;
      v27[3] = self;
      *((_QWORD *)internal + 129) = v27;

      v29 = sub_18F1FE420();
      v30 = *((_QWORD *)internal + 129);
      v31 = sub_18F204AE4();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_18F1F998C;
      v35[3] = &unk_1E2956F80;
      v35[4] = v29;
      v35[5] = v30;
      v35[6] = 0x3F847AE140000000;
      sub_18F1F5E28(v31, (uint64_t)v35);
    }
    sub_18F1F77DC();
    if (sub_18F1E1B00())
    {
      if (!*((_QWORD *)internal + 134))
      {
        v32 = (_QWORD *)operator new();
        *v32 = off_1E294C238;
        *v32 = &off_1E294C778;
        v32[1] = 0;
        v32[2] = nullsub_36;
        v32[3] = self;
        *((_QWORD *)internal + 134) = v32;
        v33 = sub_18F3DD3D0();
        sub_18F1F4F0C(v33, 0, *((_QWORD *)internal + 134), -1.0);
      }
    }
    sub_18F387C84((uint64_t)buf);
  }
}

- (void)stopDeviceMotionUpdatesForKeyboardMotionPrivate
{
  _QWORD *internal;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char *v15;
  uint8_t buf[8];
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (qword_1ECEDEE68 != -1)
    dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
  v3 = qword_1ECEDEE60;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping keyboard motion updates.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE68 != -1)
      dispatch_once(&qword_1ECEDEE68, &unk_1E2956B50);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionManager stopDeviceMotionUpdatesForKeyboardMotionPrivate]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf)
      free(v15);
  }
  if (sub_18F1E1B00())
  {
    v4 = MEMORY[0x1E0C809B0];
    if (internal[129])
    {
      v5 = sub_18F1FE420();
      v6 = internal[129];
      v7 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v17 = 3221225472;
      v18 = sub_18F1FA1A4;
      v19 = &unk_1E2958238;
      v20 = v5;
      v21 = v6;
      sub_18F1F5E28(v7, (uint64_t)buf);
      v8 = internal[129];
      if (v8)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      internal[129] = 0;
    }
    if (internal[134])
    {
      v9 = sub_18F3DD3D0();
      v10 = internal[134];
      v11 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v17 = 3221225472;
      v18 = sub_18F1F5EE0;
      v19 = &unk_1E2956E98;
      v22 = 0;
      v20 = v9;
      v21 = v10;
      sub_18F1F5E28(v11, (uint64_t)buf);
      v12 = internal[134];
      if (v12)
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      internal[134] = 0;
    }
    v13 = (void *)internal[128];
    if (v13)
    {

      internal[128] = 0;
    }
    v14 = (void *)internal[127];
    if (v14)
    {

      internal[127] = 0;
    }
  }
}

- (BOOL)sendDeviceMotionHostGravityToKeyboard:(id *)a3
{
  void *v4;
  const char *v5;
  unsigned __int8 var2;
  char v8;
  int v9;
  unsigned __int8 v10;

  v4 = *(void **)(sub_18F3DD3D0() + 48);
  if (v4)
  {
    var2 = a3->var2;
    v8 = 114;
    v9 = *(_DWORD *)a3->var0;
    v10 = var2;
    LOBYTE(v4) = objc_msgSend_setReport_payload_length_(v4, v5, 114, (uint64_t)&v8, 6);
  }
  return (char)v4;
}

- (void)onDeviceMotionForKeyboardMotion:(const Sample *)a3
{
  id internal;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float v14;
  double timestamp;
  double v16;
  BOOL v17;
  int v18;
  _BOOL4 v19;
  float v20;
  int v21;
  _BOOL4 v22;
  char v23;
  char v24;
  char v25;
  int v26;
  void *v27;
  int v28;
  _QWORD v29[5];
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;

  internal = self->_internal;
  v5 = sub_18F1FE3CC((double *)&a3->acceleration.x);
  v7 = v6;
  v9 = v8;
  v13 = sub_18F3AB86C(v5, v6, v8, *((float *)internal + 262), *((float *)internal + 263), *((float *)internal + 264));
  v14 = *((float *)internal + 265);
  timestamp = a3->timestamp;
  v16 = *((double *)internal + 130);
  if (v16 < 0.0
    || ((float)(v14 * 0.017453) > 0.0 ? (v17 = *(float *)&v13 <= (float)(v14 * 0.017453)) : (v17 = 1),
        !v17 || timestamp - v16 > (float)(1.0 / *((float *)internal + 266))))
  {
    v18 = v14 > 0.0;
    v19 = v14 >= 255.0;
    if (v14 < 255.0)
      v18 = 0;
    v20 = *((float *)internal + 266);
    if (v14 <= 0.0)
      v19 = 1;
    v21 = v20 > 0.0;
    v22 = v20 >= 255.0;
    if (v20 < 255.0)
      v21 = 0;
    v23 = vcvts_n_s32_f32(v5 + 1.0, 7uLL);
    v24 = vcvts_n_s32_f32(v7 + 1.0, 7uLL);
    v25 = vcvts_n_s32_f32(v9 + 1.0, 7uLL);
    if (v20 <= 0.0)
      v22 = 1;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[2] = sub_18F3ABAE4;
    v29[3] = &unk_1E2956AB0;
    v26 = v21 << 31 >> 31;
    if (!v22)
      LOBYTE(v26) = (int)v20;
    v27 = (void *)*((_QWORD *)internal + 128);
    v29[1] = 3221225472;
    v28 = v18 << 31 >> 31;
    v29[4] = internal;
    v30 = v23;
    v31 = v24;
    v32 = v25;
    if (!v19)
      LOBYTE(v28) = (int)v14;
    v33 = v26;
    v34 = v28;
    objc_msgSend_addOperationWithBlock_(v27, v10, (uint64_t)v29, v11, v12, COERCE_DOUBLE(3221225472));
    *((float *)internal + 262) = v5;
    *((float *)internal + 263) = v7;
    *((float *)internal + 264) = v9;
    *((double *)internal + 130) = timestamp;
  }
}

@end
