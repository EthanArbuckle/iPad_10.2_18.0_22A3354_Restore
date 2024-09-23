@implementation CMCameraWorkoutSession

- (CMCameraWorkoutSession)init
{
  uint64_t v2;
  uint64_t v3;

  return (CMCameraWorkoutSession *)objc_msgSend_initWithOptions_(self, a2, MEMORY[0x1E0C9AA70], v2, v3);
}

- (CMCameraWorkoutSession)initWithOptions:(id)a3
{
  CMCameraWorkoutSession *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CMCameraWorkoutSession *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  _BOOL4 logAirpodsDM;
  _BOOL4 logDM;
  _BOOL4 logAccel;
  _BOOL4 logGyro;
  NSObject *v65;
  uint64_t *v66;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  _BOOL4 v74;
  _BOOL4 v75;
  _BOOL4 v76;
  _BOOL4 v77;
  char *v78;
  char *v79;
  objc_super v80;
  int v81;
  _BYTE v82[10];
  char *v83;
  _BOOL4 v84;
  uint8_t buf[4];
  _BYTE v86[10];
  char *v87;
  _BOOL4 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v80.receiver = self;
  v80.super_class = (Class)CMCameraWorkoutSession;
  v4 = -[CMCameraWorkoutSession init](&v80, sel_init);
  v8 = v4;
  if (a3 && v4)
  {
    v9 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v5, (uint64_t)CFSTR("kCMCameraWorkoutSessionMSLPrefix"), v6, v7);
    v13 = (char *)objc_msgSend_cStringUsingEncoding_(v9, v10, 1, v11, v12);
    v17 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v14, (uint64_t)CFSTR("kCMCameraWorkoutSessionMSLPath"), v15, v16);
    v21 = (char *)objc_msgSend_cStringUsingEncoding_(v17, v18, 1, v19, v20);
    v25 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v22, (uint64_t)CFSTR("kCMCameraWorkoutSessionLogAirPodsDM"), v23, v24);
    v8->_logAirpodsDM = objc_msgSend_BOOLValue(v25, v26, v27, v28, v29);
    v33 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v30, (uint64_t)CFSTR("kCMCameraWorkoutSessionLogDM"), v31, v32);
    v8->_logDM = objc_msgSend_BOOLValue(v33, v34, v35, v36, v37);
    v41 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v38, (uint64_t)CFSTR("kCMCameraWorkoutSessionLogAccel"), v39, v40);
    v8->_logAccel = objc_msgSend_BOOLValue(v41, v42, v43, v44, v45);
    v49 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v46, (uint64_t)CFSTR("kCMCameraWorkoutSessionLogGyro"), v47, v48);
    v8->_logGyro = objc_msgSend_BOOLValue(v49, v50, v51, v52, v53);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v54 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend_description(a3, v55, v56, v57, v58);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v86 = v59;
      _os_log_impl(&dword_18F1DC000, v54, OS_LOG_TYPE_DEFAULT, "[camera] options:%@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v72 = objc_msgSend_description(a3, v68, v69, v70, v71);
      v81 = 138412290;
      *(_QWORD *)v82 = v72;
      v73 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v73);
      if (v73 != (char *)buf)
        free(v73);
    }
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v60 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      logAirpodsDM = v8->_logAirpodsDM;
      logDM = v8->_logDM;
      logAccel = v8->_logAccel;
      logGyro = v8->_logGyro;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v86 = logAirpodsDM;
      *(_WORD *)&v86[4] = 1024;
      *(_DWORD *)&v86[6] = logDM;
      LOWORD(v87) = 1024;
      *(_DWORD *)((char *)&v87 + 2) = logAccel;
      HIWORD(v87) = 1024;
      v88 = logGyro;
      _os_log_impl(&dword_18F1DC000, v60, OS_LOG_TYPE_DEFAULT, "[camera] Logging,airpodsDM,%d,DM,%d,accel,%d,gyro,%d", buf, 0x1Au);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v74 = v8->_logAirpodsDM;
      v75 = v8->_logDM;
      v76 = v8->_logAccel;
      v77 = v8->_logGyro;
      v81 = 67109888;
      *(_DWORD *)v82 = v74;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v75;
      LOWORD(v83) = 1024;
      *(_DWORD *)((char *)&v83 + 2) = v76;
      HIWORD(v83) = 1024;
      v84 = v77;
      v78 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v78);
      if (v78 != (char *)buf)
        free(v78);
    }
    v8->_audioAccessoryManager = (CMAudioAccessoryManager *)objc_opt_new();
    if (v13 && v21)
    {
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v65 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380931;
        *(_QWORD *)v86 = v13;
        *(_WORD *)&v86[8] = 2081;
        v87 = v21;
        _os_log_impl(&dword_18F1DC000, v65, OS_LOG_TYPE_DEFAULT, "[camera] Logging MSL prefix:%{private}s path:%{private}s", buf, 0x16u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954288);
        v81 = 136380931;
        *(_QWORD *)v82 = v13;
        *(_WORD *)&v82[8] = 2081;
        v83 = v21;
        v79 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession initWithOptions:]", "CoreLocation: %s\n", v79);
        if (v79 != (char *)buf)
          free(v79);
      }
      v66 = (uint64_t *)operator new();
      sub_18F346F54(v66, v13, v21);
      sub_18F4B6C3C((uint64_t **)&v8->_logger, v66);
    }
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_stop(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)CMCameraWorkoutSession;
  -[CMCameraWorkoutSession dealloc](&v6, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  CLDeviceMotionProperties *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  Dispatcher *v15;
  id v16;
  uint64_t v17;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v19;
  Dispatcher *v20;
  uint64_t v21;
  NSObject *v22;
  Dispatcher *v23;
  uint64_t v24;
  NSObject *v25;
  Dispatcher *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CMAudioAccessoryManager *audioAccessoryManager;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CMAudioAccessoryManager *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  OS_dispatch_source *v50;
  NSObject *logCountersTimer;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  _QWORD handler[5];
  _QWORD v60[5];
  int v61;
  uint64_t v62;
  __int128 buf;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  CMCameraWorkoutSession *v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D878 != -1)
    dispatch_once(&qword_1EE16D878, &unk_1E2954288);
  v3 = qword_1EE16D880;
  if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[camera] Starting session]", (uint8_t *)&buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    LOWORD(v61) = 0;
    v52 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v52);
    if (v52 != (char *)&buf)
      free(v52);
  }
  v8 = MEMORY[0x1E0C809B0];
  if (self->_logDM && !self->_deviceMotionDispatcher)
  {
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v9 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "[camera] Starting source DM", (uint8_t *)&buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      LOWORD(v61) = 0;
      v58 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v58);
      if (v58 != (char *)&buf)
        free(v58);
    }
    v10 = [CLDeviceMotionProperties alloc];
    v14 = (void *)objc_msgSend_initWithMode_(v10, v11, 7, v12, v13);
    v15 = (Dispatcher *)operator new();
    v15->var0 = (void **)off_1E294C238;
    v16 = v14;
    v15->var0 = (void **)&off_1E294C350;
    v15->var1 = v16;
    v15[1].var0 = (void **)sub_18F4B5550;
    v15[1].var1 = self;
    self->_deviceMotionDispatcher = v15;

    v17 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v19 = sub_18F204AE4();
    *(_QWORD *)&buf = v8;
    *((_QWORD *)&buf + 1) = 3221225472;
    v64 = (uint64_t)sub_18F1F998C;
    v65 = (void (*)(uint64_t, uint64_t))&unk_1E2956F80;
    v66 = (void (*)(uint64_t))v17;
    v67 = (CMCameraWorkoutSession *)deviceMotionDispatcher;
    v68 = 0x3F747AE140000000;
    sub_18F1F5E28(v19, (uint64_t)&buf);
  }
  if (self->_logAccel)
  {
    v20 = (Dispatcher *)operator new();
    v20->var0 = (void **)off_1E294C238;
    v20->var0 = (void **)&off_1E294C3C0;
    v20->var1 = 0;
    v20[1].var0 = (void **)sub_18F4B5564;
    v20[1].var1 = self;
    self->_accelerometerDispatcher = v20;
    v21 = sub_18F1DFF7C();
    sub_18F1F4F0C(v21, 0, (uint64_t)self->_accelerometerDispatcher, 0.00999999978);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v22 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = 0x3F847AE140000000;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEFAULT, "[camera] Logging accelerometer at interval, %f", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v61 = 134217984;
      v62 = 0x3F847AE140000000;
      v53 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v53);
      if (v53 != (char *)&buf)
        free(v53);
    }
  }
  if (self->_logGyro)
  {
    v23 = (Dispatcher *)operator new();
    v23->var0 = (void **)off_1E294C238;
    v23->var0 = (void **)&off_1E294C820;
    v23->var1 = 0;
    v23[1].var0 = (void **)sub_18F4B5578;
    v23[1].var1 = self;
    self->_gyroDispatcher = v23;
    v24 = sub_18F1EF73C();
    sub_18F1F4F0C(v24, 0, (uint64_t)self->_gyroDispatcher, 0.00499999989);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v25 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = 0x3F747AE140000000;
      _os_log_impl(&dword_18F1DC000, v25, OS_LOG_TYPE_INFO, "[camera] Logging gyro at interval, %f", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v61 = 134217984;
      v62 = 0x3F747AE140000000;
      v54 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v54);
      if (v54 != (char *)&buf)
        free(v54);
    }
    v26 = (Dispatcher *)operator new();
    v26->var0 = (void **)off_1E294C238;
    v26->var0 = (void **)&off_1E294C7E8;
    v26->var1 = 0;
    v26[1].var0 = (void **)sub_18F4B558C;
    v26[1].var1 = self;
    self->_gyroTemperatureDispatcher = v26;
    v27 = sub_18F1EF73C();
    sub_18F1F4F0C(v27, 1, (uint64_t)self->_gyroTemperatureDispatcher, 1.0);
    if (qword_1EE16D878 != -1)
      dispatch_once(&qword_1EE16D878, &unk_1E2954288);
    v28 = qword_1EE16D880;
    if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = 0x3FF0000000000000;
      _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_INFO, "[camera] Logging gyro temperature at interval, %f", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v61 = 134217984;
      v62 = 0x3FF0000000000000;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)&buf)
        free(v55);
    }
  }
  if (self->_logAirpodsDM)
  {
    if (objc_msgSend__isAudioAccessoryDeviceMotionAvailable(self->_audioAccessoryManager, v4, v5, v6, v7))
    {
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v29 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_DEFAULT, "[camera] Starting accessory DM", (uint8_t *)&buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954288);
        LOWORD(v61) = 0;
        v56 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v56);
        if (v56 != (char *)&buf)
          free(v56);
      }
      audioAccessoryManager = self->_audioAccessoryManager;
      v35 = objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v30, v31, v32, v33);
      objc_msgSend__startAudioAccessoryDeviceMotionStatusUpdatesToQueue_withHandler_(audioAccessoryManager, v36, v35, (uint64_t)&unk_1E29590E0, v37);
      objc_msgSend__setAudioAccessoryDeviceMotionUpdateInterval_(self->_audioAccessoryManager, v38, v39, v40, v41, 0.0199999996);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v64 = 0x3052000000;
      v65 = sub_18F206CA8;
      v66 = sub_18F206BE0;
      v67 = self;
      v42 = self->_audioAccessoryManager;
      v47 = objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v43, v44, v45, v46);
      v60[0] = v8;
      v60[1] = 3221225472;
      v60[2] = sub_18F4B55A0;
      v60[3] = &unk_1E29590A0;
      v60[4] = &buf;
      objc_msgSend__startAudioAccessoryDeviceMotionUpdatesToQueue_lowLatencyMode_withHandler_(v42, v48, v47, 1, (uint64_t)v60);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v49 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18F1DC000, v49, OS_LOG_TYPE_ERROR, "[camera] audio accessory not available", (uint8_t *)&buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954288);
        LOWORD(v61) = 0;
        v57 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMCameraWorkoutSession start]", "CoreLocation: %s\n", v57);
        if (v57 != (char *)&buf)
          free(v57);
      }
    }
  }
  v50 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  self->_logCountersTimer = v50;
  dispatch_source_set_timer((dispatch_source_t)v50, 0, 0x3B9ACA00uLL, 0x5F5E100uLL);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v64 = 0x3052000000;
  v65 = sub_18F206CA8;
  v66 = sub_18F206BE0;
  v67 = self;
  logCountersTimer = self->_logCountersTimer;
  handler[0] = v8;
  handler[1] = 3221225472;
  handler[2] = sub_18F4B55BC;
  handler[3] = &unk_1E2956858;
  handler[4] = &buf;
  dispatch_source_set_event_handler(logCountersTimer, handler);
  dispatch_activate((dispatch_object_t)self->_logCountersTimer);
  _Block_object_dispose(&buf, 8);
}

- (void)logCounters
{
  NSObject *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D878 != -1)
    dispatch_once(&qword_1EE16D878, &unk_1E2954288);
  v3 = qword_1EE16D880;
  if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
  {
    v4 = atomic_load(&self->_accelCount.__a_.__a_value);
    v5 = atomic_load(&self->_gyroCount.__a_.__a_value);
    v6 = atomic_load(&self->_dmCount.__a_.__a_value);
    v7 = atomic_load(&self->_airpodsDmCount.__a_.__a_value);
    v8 = atomic_load(&self->_skeletonCount.__a_.__a_value);
    v9 = atomic_load(&self->_facePoseCount.__a_.__a_value);
    v10 = atomic_load(&self->_watchActiveCalorieCount.__a_.__a_value);
    v11 = atomic_load(&self->_watchHeartRateCount.__a_.__a_value);
    v12 = atomic_load(&self->_heartRateReferenceCount.__a_.__a_value);
    v13 = atomic_load(&self->_fitnessMachineSampleCount.__a_.__a_value);
    v14[0] = 68291586;
    v14[1] = 0;
    v15 = 2082;
    v16 = "";
    v17 = 1026;
    v18 = v4;
    v19 = 1026;
    v20 = v5;
    v21 = 1026;
    v22 = v6;
    v23 = 1026;
    v24 = v7;
    v25 = 1026;
    v26 = v8;
    v27 = 1026;
    v28 = v9;
    v29 = 1026;
    v30 = v10;
    v31 = 1026;
    v32 = v11;
    v33 = 1026;
    v34 = v12;
    v35 = 1026;
    v36 = v13;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"[camera] total count\", \"accel\":%{public}u, \"gyro\":%{public}u, \"dm\":%{public}u, \"airpodsDm\":%{public}u, \"skeleton\":%{public}u, \"facePose\":%{public}u, \"watchActiveCalorie\":%{public}u, \"watchHeartRate\":%{public}u, \"heartRateReference\":%{public}u, \"fitnessMachineSample\":%{public}u}", (uint8_t *)v14, 0x4Eu);
  }
}

- (void)stop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v9;
  Dispatcher *v10;
  uint64_t v11;
  Dispatcher *accelerometerDispatcher;
  uint64_t v13;
  Dispatcher *v14;
  uint64_t v15;
  Dispatcher *gyroDispatcher;
  uint64_t v17;
  Dispatcher *v18;
  uint64_t v19;
  Dispatcher *gyroTemperatureDispatcher;
  uint64_t v21;
  Dispatcher *v22;
  NSObject *logCountersTimer;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  Dispatcher *v29;
  int v30;

  v6 = MEMORY[0x1E0C809B0];
  if (self->_deviceMotionDispatcher)
  {
    v7 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v9 = sub_18F204AE4();
    v24 = v6;
    v25 = 3221225472;
    v26 = sub_18F1FA1A4;
    v27 = &unk_1E2958238;
    v28 = v7;
    v29 = deviceMotionDispatcher;
    sub_18F1F5E28(v9, (uint64_t)&v24);
    v10 = self->_deviceMotionDispatcher;
    if (v10)
      (*((void (**)(Dispatcher *))v10->var0 + 1))(v10);
    self->_deviceMotionDispatcher = 0;
  }
  if (self->_accelerometerDispatcher)
  {
    v11 = sub_18F1DFF7C();
    accelerometerDispatcher = self->_accelerometerDispatcher;
    v13 = sub_18F204AE4();
    v24 = v6;
    v25 = 3221225472;
    v26 = sub_18F1F5EE0;
    v27 = &unk_1E2956E98;
    v30 = 0;
    v28 = v11;
    v29 = accelerometerDispatcher;
    sub_18F1F5E28(v13, (uint64_t)&v24);
    v14 = self->_accelerometerDispatcher;
    if (v14)
      (*((void (**)(Dispatcher *))v14->var0 + 1))(v14);
    self->_accelerometerDispatcher = 0;
  }
  if (self->_gyroDispatcher)
  {
    v15 = sub_18F1EF73C();
    gyroDispatcher = self->_gyroDispatcher;
    v17 = sub_18F204AE4();
    v24 = v6;
    v25 = 3221225472;
    v26 = sub_18F1F5EE0;
    v27 = &unk_1E2956E98;
    v30 = 0;
    v28 = v15;
    v29 = gyroDispatcher;
    sub_18F1F5E28(v17, (uint64_t)&v24);
    v18 = self->_gyroDispatcher;
    if (v18)
      (*((void (**)(Dispatcher *))v18->var0 + 1))(v18);
    self->_gyroDispatcher = 0;
  }
  if (self->_gyroTemperatureDispatcher)
  {
    v19 = sub_18F1EF73C();
    gyroTemperatureDispatcher = self->_gyroTemperatureDispatcher;
    v21 = sub_18F204AE4();
    v24 = v6;
    v25 = 3221225472;
    v26 = sub_18F1F5EE0;
    v27 = &unk_1E2956E98;
    v30 = 1;
    v28 = v19;
    v29 = gyroTemperatureDispatcher;
    sub_18F1F5E28(v21, (uint64_t)&v24);
    v22 = self->_gyroTemperatureDispatcher;
    if (v22)
      (*((void (**)(Dispatcher *))v22->var0 + 1))(v22);
    self->_gyroTemperatureDispatcher = 0;
  }
  logCountersTimer = self->_logCountersTimer;
  if (logCountersTimer)
  {
    dispatch_source_cancel(logCountersTimer);
    self->_logCountersTimer = 0;
  }
  MEMORY[0x1E0DE7D20](self->_audioAccessoryManager, sel__stopAudioAccessoryDeviceMotionUpdates, v2, v3, v4);
}

- (id)stats
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  _QWORD v54[10];
  _QWORD v55[11];

  v55[10] = *MEMORY[0x1E0C80C00];
  v54[0] = CFSTR("accelCount");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = atomic_load(&self->_accelCount.__a_.__a_value);
  v55[0] = objc_msgSend_numberWithUnsignedInt_(v5, a2, v6, v2, v3);
  v54[1] = CFSTR("gyroCount");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = atomic_load(&self->_gyroCount.__a_.__a_value);
  v55[1] = objc_msgSend_numberWithUnsignedInt_(v7, v9, v8, v10, v11);
  v54[2] = CFSTR("dmCount");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = atomic_load(&self->_dmCount.__a_.__a_value);
  v55[2] = objc_msgSend_numberWithUnsignedInt_(v12, v14, v13, v15, v16);
  v54[3] = CFSTR("airpodsDmCount");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = atomic_load(&self->_airpodsDmCount.__a_.__a_value);
  v55[3] = objc_msgSend_numberWithUnsignedInt_(v17, v19, v18, v20, v21);
  v54[4] = CFSTR("skeletonCount");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  v23 = atomic_load(&self->_skeletonCount.__a_.__a_value);
  v55[4] = objc_msgSend_numberWithUnsignedInt_(v22, v24, v23, v25, v26);
  v54[5] = CFSTR("facePoseCount");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  v28 = atomic_load(&self->_facePoseCount.__a_.__a_value);
  v55[5] = objc_msgSend_numberWithUnsignedInt_(v27, v29, v28, v30, v31);
  v54[6] = CFSTR("watchCalorieCount");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  v33 = atomic_load(&self->_watchActiveCalorieCount.__a_.__a_value);
  v55[6] = objc_msgSend_numberWithUnsignedInt_(v32, v34, v33, v35, v36);
  v54[7] = CFSTR("watchHeartRateCount");
  v37 = (void *)MEMORY[0x1E0CB37E8];
  v38 = atomic_load(&self->_watchHeartRateCount.__a_.__a_value);
  v55[7] = objc_msgSend_numberWithUnsignedInt_(v37, v39, v38, v40, v41);
  v54[8] = CFSTR("heartRateReferenceCount");
  v42 = (void *)MEMORY[0x1E0CB37E8];
  v43 = atomic_load(&self->_heartRateReferenceCount.__a_.__a_value);
  v55[8] = objc_msgSend_numberWithUnsignedInt_(v42, v44, v43, v45, v46);
  v54[9] = CFSTR("fitnessMachineSampleCount");
  v47 = (void *)MEMORY[0x1E0CB37E8];
  v48 = atomic_load(&self->_fitnessMachineSampleCount.__a_.__a_value);
  v55[9] = objc_msgSend_numberWithUnsignedInt_(v47, v49, v48, v50, v51);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v52, (uint64_t)v55, (uint64_t)v54, 10);
}

- (void)feedSkeleton:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  atomic<unsigned int> *p_skeletonCount;
  unsigned int v61;

  v7 = objc_msgSend_skeleton2D(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_localMachtime(a3, v8, v9, v10, v11);
  v13 = v12;
  objc_msgSend_globalMachtime(a3, v14, v15, v16, v17);
  objc_msgSend__feed2DSkeleton_localMachtime_globalMachtime_(self, v18, v7, v19, v20, v13, v21);
  v26 = objc_msgSend_skeleton3DLifted(a3, v22, v23, v24, v25);
  objc_msgSend_localMachtime(a3, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_globalMachtime(a3, v33, v34, v35, v36);
  objc_msgSend__feed3DLiftedSkeleton_localMachtime_globalMachtime_(self, v37, v26, v38, v39, v32, v40);
  v45 = objc_msgSend_skeleton3DRetargeted(a3, v41, v42, v43, v44);
  objc_msgSend_localMachtime(a3, v46, v47, v48, v49);
  v51 = v50;
  objc_msgSend_globalMachtime(a3, v52, v53, v54, v55);
  objc_msgSend__feed3DRetargetedSkeleton_localMachtime_globalMachtime_(self, v56, v45, v57, v58, v51, v59);
  p_skeletonCount = &self->_skeletonCount;
  do
    v61 = __ldaxr(&p_skeletonCount->__a_.__a_value);
  while (__stlxr(v61 + 1, &p_skeletonCount->__a_.__a_value));
}

- (void)_feed2DSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[34];

  v49[33] = *MEMORY[0x1E0C80C00];
  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, v5, v6, *(_QWORD *)&a4, *(_QWORD *)&a5))
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v9, v12, v10, v11);
        v18 = objc_msgSend_type(v13, v14, v15, v16, v17);
        v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, v12, v20, v21);
        objc_msgSend_position(v22, v23, v24, v25, v26);
        v49[v18 + 2] = v27;
        v31 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v28, v12, v29, v30);
        objc_msgSend_confidence(v31, v32, v33, v34, v35);
        *((_DWORD *)&v49[21] + v18) = v36;
        v40 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v37, v12, v38, v39);
        *((_BYTE *)&v49[30] + v18 + 4) = objc_msgSend_visible(v40, v41, v42, v43, v44);
        ++v12;
      }
      while (objc_msgSend_count(a3, v45, v46, v47, v48) > v12);
    }
    sub_18F3475C8((uint64_t *)self->_logger.__ptr_.__value_, v49);
  }
}

- (void)_feed3DLiftedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, v5, v6, *(_QWORD *)&a4, *(_QWORD *)&a5))
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v9, v12, v10, v11);
        v18 = objc_msgSend_type(v13, v14, v15, v16, v17);
        v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, v12, v20, v21);
        objc_msgSend_position(v22, v23, v24, v25, v26);
        *((_OWORD *)&v32 + v18 + 1) = v27;
        ++v12;
      }
      while (objc_msgSend_count(a3, v28, v29, v30, v31) > v12);
    }
    sub_18F3479F8((uint64_t *)self->_logger.__ptr_.__value_, &v32);
  }
}

- (void)_feed3DRetargetedSkeleton:(id)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if (self->_logger.__ptr_.__value_)
  {
    if (objc_msgSend_count(a3, a2, (uint64_t)a3, v5, v6, *(_QWORD *)&a4, *(_QWORD *)&a5))
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v9, v12, v10, v11);
        v18 = objc_msgSend_type(v13, v14, v15, v16, v17);
        v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, v12, v20, v21);
        objc_msgSend_position(v22, v23, v24, v25, v26);
        v27 = &v42 + 2 * v18;
        *((_OWORD *)v27 + 1) = v28;
        v32 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v29, v12, v30, v31);
        objc_msgSend_quaternion(v32, v33, v34, v35, v36);
        *((_OWORD *)v27 + 26) = v37;
        ++v12;
      }
      while (objc_msgSend_count(a3, v38, v39, v40, v41) > v12);
    }
    sub_18F347EB0((uint64_t *)self->_logger.__ptr_.__value_, &v42);
  }
}

- (void)feedFacePose:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  float v14;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float v24;
  unsigned int v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float v34;
  float32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float v43;
  unsigned int v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t i;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  int v172;
  char *v173;
  char *v174;
  char *v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  char *v179;
  char *v180;
  int v181;
  uint64_t *value;
  double v183;
  double v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  uint64_t *v190;
  double v191;
  double v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  double v197;
  atomic<unsigned int> *p_facePoseCount;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  void *__p;
  char *v205;
  char *v206;
  int v207;
  char v208;
  __int16 v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  _QWORD v213[3];
  float64x2_t v214;
  float64x2_t v215;
  unint64_t v216;
  int v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  int v222;
  unint64_t v223;
  int v224;
  unint64_t v225;
  int v226;
  uint64_t v227;
  uint64_t v228;

  objc_msgSend_rotation(a3, a2, (uint64_t)a3, v3, v4);
  v14 = *(float *)&v13.i32[2] + (float)(*(float *)v11.i32 + *(float *)&v12.i32[1]);
  if (v14 >= 0.0)
  {
    v24 = sqrtf(v14 + 1.0);
    *(float *)&v25 = v24 + v24;
    v26 = vrecpe_f32((float32x2_t)v25);
    v27 = vmul_f32(v26, vrecps_f32((float32x2_t)v25, v26));
    v28.i32[0] = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
    v39 = vmul_n_f32(vsub_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v12, vuzp1q_s32(v12, v13)), (float32x2_t)*(_OWORD *)&vtrn2q_s32(v13, vzip2q_s32(v13, v11))), v28.f32[0]);
    v29.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v11.i8, 1), *(float32x2_t *)v12.i8).u32[0];
    v29.i32[1] = v25;
    v28.i32[1] = 0.25;
    v42 = vmul_f32(v29, v28);
  }
  else if (*(float *)v11.i32 < *(float *)&v12.i32[1] || *(float *)v11.i32 < *(float *)&v13.i32[2])
  {
    v16 = 1.0 - *(float *)v11.i32;
    if (*(float *)&v12.i32[1] >= *(float *)&v13.i32[2])
    {
      v43 = sqrtf(*(float *)&v12.i32[1] + (float)(v16 - *(float *)&v13.i32[2]));
      *(float *)&v44 = v43 + v43;
      v45 = vrecpe_f32((float32x2_t)v44);
      v46 = vmul_f32(v45, vrecps_f32((float32x2_t)v44, v45));
      v47.i32[0] = vmul_f32(v46, vrecps_f32((float32x2_t)v44, v46)).u32[0];
      v46.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v11.i8, 1), *(float32x2_t *)v12.i8).u32[0];
      v46.i32[1] = v44;
      v48 = (float32x2_t)vrev64_s32(*(int32x2_t *)v13.i8);
      v49 = (float32x2_t)vzip2q_s32(v12, v11).u64[0];
      v50.i32[0] = vadd_f32(v48, v49).u32[0];
      v50.i32[1] = vsub_f32(v48, v49).i32[1];
      v42 = vmul_n_f32(v50, v47.f32[0]);
      v47.i32[1] = 0.25;
      v39 = vmul_f32(v46, v47);
    }
    else
    {
      v17 = (float32x2_t)__PAIR64__(v11.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)&v13.i32[2] + (float)(v16 - *(float *)&v12.i32[1]))));
      v18 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v11, v12), *(float32x2_t *)v13.i8);
      v19 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 0);
      v20 = vsub_f32(*(float32x2_t *)v11.i8, v19);
      v19.i32[0] = 2.0;
      v19.i32[0] = vmul_f32(v17, v19).u32[0];
      v19.i32[1] = v20.i32[1];
      v21 = vrecpe_f32((float32x2_t)v19.u32[0]);
      v22 = vmul_f32(v21, vrecps_f32((float32x2_t)v19.u32[0], v21));
      v20.i32[0] = vmul_f32(v22, vrecps_f32((float32x2_t)v19.u32[0], v22)).u32[0];
      v39 = vmul_n_f32(v18, v20.f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
      _D2.i32[1] = v20.i32[0];
      v42 = vmul_f32(v19, _D2);
    }
  }
  else
  {
    v30 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 0);
    v31 = vadd_f32(*(float32x2_t *)v11.i8, v30);
    v30.i32[0] = 2.0;
    v30.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v11.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v11.i32+ (float)((float)(1.0 - *(float *)&v12.i32[1]) - *(float *)&v13.i32[2])))), v30).u32[0];
    v30.i32[1] = v31.i32[1];
    v32 = vrecpe_f32((float32x2_t)v30.u32[0]);
    v33 = vmul_f32(v32, vrecps_f32((float32x2_t)v30.u32[0], v32));
    LODWORD(v34) = vmul_f32(v33, vrecps_f32((float32x2_t)v30.u32[0], v33)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.f32[1] = v34;
    v39 = vmul_f32(v30, _D5);
    v40 = (float32x2_t)vzip2q_s32(v11, v12).u64[0];
    v41.i32[0] = vadd_f32(v40, *(float32x2_t *)v13.i8).u32[0];
    v41.i32[1] = vsub_f32(v40, *(float32x2_t *)&v13).i32[1];
    v42 = vmul_n_f32(v41, v34);
  }
  objc_msgSend_localMachtime(a3, v7, v8, v9, v10);
  v213[0] = v51;
  objc_msgSend_localMachtime(a3, v52, v53, v54, v55);
  v213[1] = v56;
  v213[2] = 0x100000002;
  v214 = vcvtq_f64_f32(v39);
  v215 = vcvtq_f64_f32(v42);
  objc_msgSend_translation(a3, v57, v58, v59, v60);
  v200 = v61;
  objc_msgSend_translation(a3, v62, v63, v64, v65);
  v216 = __PAIR64__(v66, v200);
  objc_msgSend_translation(a3, v67, v68, v69, v70);
  v217 = v71;
  v218 = 0;
  v220 = 0;
  v219 = 0;
  objc_msgSend_gaze(a3, v72, v73, v74, v75);
  v201 = v76;
  objc_msgSend_gaze(a3, v77, v78, v79, v80);
  v221 = __PAIR64__(v81, v201);
  objc_msgSend_gaze(a3, v82, v83, v84, v85);
  v222 = v86;
  objc_msgSend_leftEyePosition(a3, v87, v88, v89, v90);
  v202 = v91;
  objc_msgSend_leftEyePosition(a3, v92, v93, v94, v95);
  v223 = __PAIR64__(v96, v202);
  objc_msgSend_leftEyePosition(a3, v97, v98, v99, v100);
  v224 = v101;
  objc_msgSend_rightEyePosition(a3, v102, v103, v104, v105);
  v203 = v106;
  objc_msgSend_rightEyePosition(a3, v107, v108, v109, v110);
  v225 = __PAIR64__(v111, v203);
  objc_msgSend_rightEyePosition(a3, v112, v113, v114, v115);
  v226 = v116;
  v227 = 0;
  v228 = 0;
  v210 = 0;
  objc_msgSend_confidence(a3, v117, v118, v119, v120);
  v207 = v121;
  v208 = objc_msgSend_tooDark(a3, v122, v123, v124, v125);
  v209 = objc_msgSend_sensorCovered(a3, v126, v127, v128, v129);
  v211 = objc_msgSend_failureCode(a3, v130, v131, v132, v133);
  objc_msgSend_roll(a3, v134, v135, v136, v137);
  v212 = v138;
  __p = 0;
  v205 = 0;
  v206 = 0;
  v143 = (void *)objc_msgSend_blendShapeWeights(a3, v139, v140, v141, v142);
  if (objc_msgSend_count(v143, v144, v145, v146, v147))
  {
    for (i = 0; ; ++i)
    {
      v153 = (void *)objc_msgSend_blendShapeWeights(a3, (const char *)v148, v149, v150, v151);
      if (objc_msgSend_count(v153, v154, v155, v156, v157) <= i)
        break;
      v162 = (void *)objc_msgSend_blendShapeWeights(a3, v158, v159, v160, v161);
      v166 = (void *)objc_msgSend_objectAtIndexedSubscript_(v162, v163, i, v164, v165);
      objc_msgSend_floatValue(v166, v167, v168, v169, v170);
      v172 = v171;
      v173 = v205;
      if (v205 >= v206)
      {
        v175 = (char *)__p;
        v176 = (v205 - (_BYTE *)__p) >> 2;
        v177 = v176 + 1;
        if ((unint64_t)(v176 + 1) >> 62)
          sub_18F26F8C0();
        v178 = v206 - (_BYTE *)__p;
        if ((v206 - (_BYTE *)__p) >> 1 > v177)
          v177 = v178 >> 1;
        if ((unint64_t)v178 >= 0x7FFFFFFFFFFFFFFCLL)
          v148 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v148 = v177;
        if (v148)
        {
          v179 = (char *)sub_18F26FB8C((uint64_t)&v206, v148);
          v175 = (char *)__p;
          v173 = v205;
        }
        else
        {
          v179 = 0;
        }
        v180 = &v179[4 * v176];
        *(_DWORD *)v180 = v172;
        v174 = v180 + 4;
        while (v173 != v175)
        {
          v181 = *((_DWORD *)v173 - 1);
          v173 -= 4;
          *((_DWORD *)v180 - 1) = v181;
          v180 -= 4;
        }
        __p = v180;
        v205 = v174;
        v206 = &v179[4 * v148];
        if (v175)
          operator delete(v175);
      }
      else
      {
        *(_DWORD *)v205 = v171;
        v174 = v173 + 4;
      }
      v205 = v174;
    }
    value = (uint64_t *)self->_logger.__ptr_.__value_;
    objc_msgSend_localMachtime(a3, v158, v159, v160, v161);
    v184 = v183;
    objc_msgSend_globalMachtime(a3, v185, v186, v187, v188);
    sub_18F348EA0(value, &__p, v184, v189);
  }
  v190 = (uint64_t *)self->_logger.__ptr_.__value_;
  objc_msgSend_localMachtime(a3, (const char *)v148, v149, v150, v151);
  v192 = v191;
  objc_msgSend_globalMachtime(a3, v193, v194, v195, v196);
  sub_18F34864C(v190, (uint64_t)v213, (uint64_t)&v207, v192, v197);
  p_facePoseCount = &self->_facePoseCount;
  do
    v199 = __ldaxr(&p_facePoseCount->__a_.__a_value);
  while (__stlxr(v199 + 1, &p_facePoseCount->__a_.__a_value));
  if (__p)
  {
    v205 = (char *)__p;
    operator delete(__p);
  }
}

- (void)feedWatchActiveCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t *value;
  atomic<unsigned int> *p_watchActiveCalorieCount;
  unsigned int v8;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F348AA0(value, a3, a4, a5);
  p_watchActiveCalorieCount = &self->_watchActiveCalorieCount;
  do
    v8 = __ldaxr(&p_watchActiveCalorieCount->__a_.__a_value);
  while (__stlxr(v8 + 1, &p_watchActiveCalorieCount->__a_.__a_value));
}

- (void)feedWatchBasalCalories:(float)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t *value;
  atomic<unsigned int> *p_watchBasalCalorieCount;
  unsigned int v8;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F348BB4(value, a3, a4, a5);
  p_watchBasalCalorieCount = &self->_watchBasalCalorieCount;
  do
    v8 = __ldaxr(&p_watchBasalCalorieCount->__a_.__a_value);
  while (__stlxr(v8 + 1, &p_watchBasalCalorieCount->__a_.__a_value));
}

- (void)feedWatchHeartRate:(float)a3 confidence:(float)a4 localMachtime:(double)a5 globalMachtime:(double)a6
{
  uint64_t *value;
  atomic<unsigned int> *p_watchHeartRateCount;
  unsigned int v9;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F348CC8(value, a3, a4, a5, a6);
  p_watchHeartRateCount = &self->_watchHeartRateCount;
  do
    v9 = __ldaxr(&p_watchHeartRateCount->__a_.__a_value);
  while (__stlxr(v9 + 1, &p_watchHeartRateCount->__a_.__a_value));
}

- (void)feedHeartRateReference:(unsigned __int16)a3 localMachtime:(double)a4 globalMachtime:(double)a5
{
  uint64_t *value;
  atomic<unsigned int> *p_heartRateReferenceCount;
  unsigned int v8;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34A8C4(value, a3, a4, a5);
  p_heartRateReferenceCount = &self->_heartRateReferenceCount;
  do
    v8 = __ldaxr(&p_heartRateReferenceCount->__a_.__a_value);
  while (__stlxr(v8 + 1, &p_heartRateReferenceCount->__a_.__a_value));
}

- (void)feedWorkoutEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint8_t buf[8];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_logger.__ptr_.__value_)
  {
    v7 = objc_msgSend_eventType(a3, a2, (uint64_t)a3, v3, v4);
    if (v7 >= 6)
    {
      if (qword_1EE16D878 != -1)
        dispatch_once(&qword_1EE16D878, &unk_1E2954288);
      v13 = qword_1EE16D880;
      if (os_log_type_enabled((os_log_t)qword_1EE16D880, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = objc_msgSend_eventType(a3, v14, v15, v16, v17);
        _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEFAULT, "[camera] Received unsupported event: %d", buf, 8u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D878 != -1)
          dispatch_once(&qword_1EE16D878, &unk_1E2954288);
        objc_msgSend_eventType(a3, v28, v29, v30, v31);
        v32 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMCameraWorkoutSession feedWorkoutEvent:]", "CoreLocation: %s\n", v32);
        if (v32 != (char *)buf)
          free(v32);
      }
      v12 = 23;
    }
    else
    {
      v12 = *(_QWORD *)&asc_18F5098D8[8 * v7];
    }
    objc_msgSend_localMachtime(a3, v8, v9, v10, v11);
    *(_QWORD *)buf = v18;
    objc_msgSend_localMachtime(a3, v19, v20, v21, v22);
    v35 = v23;
    v36 = objc_msgSend_workoutType(a3, v24, v25, v26, v27);
    v34 = v12;
    sub_18F34A9D4((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t *)buf);
  }
}

- (void)feedBodyMetrics:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *value;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _DWORD v36[11];
  _BYTE v37[20];

  if (self->_logger.__ptr_.__value_)
  {
    *(_OWORD *)v37 = 0u;
    v7 = objc_msgSend_biologicalSex(a3, a2, (uint64_t)a3, v3, v4, 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v37[12]);
    if (v7 <= 3)
      v36[1] = v7;
    objc_msgSend_heightMeters(a3, v8, v9, v10, v11);
    *(float *)&v12 = v12;
    v36[2] = LODWORD(v12);
    objc_msgSend_weightKG(a3, v13, v14, v15, v16);
    *(float *)&v17 = v17;
    v36[3] = LODWORD(v17);
    objc_msgSend_vo2max(a3, v18, v19, v20, v21);
    *(float *)&v22 = v22;
    v36[4] = LODWORD(v22);
    *(float *)&v36[5] = (float)(int)objc_msgSend_age(a3, v23, v24, v25, v26);
    v37[4] = objc_msgSend_betaBlockerUse(a3, v27, v28, v29, v30);
    value = (uint64_t *)self->_logger.__ptr_.__value_;
    objc_msgSend_localMachtime(a3, v32, v33, v34, v35);
    sub_18F3491D4(value, (uint64_t)v36);
  }
}

- (void)feedFitnessMachineSample:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  atomic<unsigned int> *p_fitnessMachineSampleCount;
  unsigned int v117;
  uint64_t v118[3];
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;

  if (self->_logger.__ptr_.__value_)
  {
    objc_msgSend_localMachtime(a3, a2, (uint64_t)a3, v3, v4);
    v118[0] = v7;
    objc_msgSend_globalMachtime(a3, v8, v9, v10, v11);
    v118[1] = v12;
    objc_msgSend_elapsedTime(a3, v13, v14, v15, v16);
    v118[2] = v17;
    objc_msgSend_energy(a3, v18, v19, v20, v21);
    v119 = v22;
    objc_msgSend_treadmillDistance(a3, v23, v24, v25, v26);
    v120 = v27;
    objc_msgSend_indoorBikeDistance(a3, v28, v29, v30, v31);
    v121 = v32;
    objc_msgSend_crossTrainerDistance(a3, v33, v34, v35, v36);
    v122 = v37;
    v123 = objc_msgSend_floors(a3, v38, v39, v40, v41);
    v124 = objc_msgSend_stepCount(a3, v42, v43, v44, v45);
    objc_msgSend_strideCount(a3, v46, v47, v48, v49);
    v125 = v50;
    objc_msgSend_instantaneousSpeed(a3, v51, v52, v53, v54);
    v126 = v55;
    objc_msgSend_averageSpeed(a3, v56, v57, v58, v59);
    v127 = v60;
    objc_msgSend_instantaneousPace(a3, v61, v62, v63, v64);
    v128 = v65;
    objc_msgSend_averagePace(a3, v66, v67, v68, v69);
    v129 = v70;
    objc_msgSend_elevationGain(a3, v71, v72, v73, v74);
    v130 = v75;
    objc_msgSend_inclination(a3, v76, v77, v78, v79);
    v131 = v80;
    objc_msgSend_resistanceLevel(a3, v81, v82, v83, v84);
    v132 = v85;
    objc_msgSend_instantaneousPower(a3, v86, v87, v88, v89);
    v133 = v90;
    objc_msgSend_averagePower(a3, v91, v92, v93, v94);
    v134 = v95;
    objc_msgSend_instantaneousCadence(a3, v96, v97, v98, v99);
    v135 = v100;
    objc_msgSend_averageCadence(a3, v101, v102, v103, v104);
    v136 = v105;
    objc_msgSend_instantaneousHeartRate(a3, v106, v107, v108, v109);
    v137 = v110;
    objc_msgSend_averageHeartRate(a3, v111, v112, v113, v114);
    v138 = v115;
    sub_18F34AB30((uint64_t *)self->_logger.__ptr_.__value_, v118);
  }
  p_fitnessMachineSampleCount = &self->_fitnessMachineSampleCount;
  do
    v117 = __ldaxr(&p_fitnessMachineSampleCount->__a_.__a_value);
  while (__stlxr(v117 + 1, &p_fitnessMachineSampleCount->__a_.__a_value));
}

- (void)_feedAccessoryConfig:(const void *)a3
{
  uint64_t *value;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F349D7C(value, (int *)a3);
}

- (void)_feedAccessoryInEarStatus:(int)a3
{
  uint64_t *value;
  uint64_t v5;
  double v6;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
  {
    v5 = mach_continuous_time();
    v6 = sub_18F1FD20C(v5);
    sub_18F349C84(value, a3, v6);
  }
}

- (void)_feedDeviceMotion:(const Sample *)a3
{
  uint64_t *value;
  atomic<unsigned int> *p_dmCount;
  unsigned int v6;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34A1FC(value, &a3->timestamp, 7);
  p_dmCount = &self->_dmCount;
  do
    v6 = __ldaxr(&p_dmCount->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_dmCount->__a_.__a_value));
}

- (void)_feedAccel:(const Sample *)a3
{
  uint64_t *value;
  atomic<unsigned int> *p_accelCount;
  unsigned int v6;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34A530(value, (uint64_t *)a3);
  p_accelCount = &self->_accelCount;
  do
    v6 = __ldaxr(&p_accelCount->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_accelCount->__a_.__a_value));
}

- (void)_feedGyro:(const Sample *)a3
{
  uint64_t *value;
  atomic<unsigned int> *p_gyroCount;
  unsigned int v6;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34A644(value, (uint64_t *)a3);
  p_gyroCount = &self->_gyroCount;
  do
    v6 = __ldaxr(&p_gyroCount->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_gyroCount->__a_.__a_value));
}

- (void)_feedGyroTemperature:(const Temperature *)a3
{
  uint64_t *value;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34A7EC(value, (uint64_t)a3);
}

- (void)_feedHeadAccessoryDeviceMotion:(id)a3
{
  uint64_t *value;
  atomic<unsigned int> *p_airpodsDmCount;
  unsigned int v6;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F34930C(value, a3);
  p_airpodsDmCount = &self->_airpodsDmCount;
  do
    v6 = __ldaxr(&p_airpodsDmCount->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_airpodsDmCount->__a_.__a_value));
}

- (void)flushMsl
{
  uint64_t *value;

  value = (uint64_t *)self->_logger.__ptr_.__value_;
  if (value)
    sub_18F349158(value);
}

- (void).cxx_destruct
{
  sub_18F4B6C3C((uint64_t **)&self->_logger, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
