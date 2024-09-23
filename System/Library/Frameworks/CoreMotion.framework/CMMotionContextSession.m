@implementation CMMotionContextSession

+ (BOOL)isAvailable
{
  return 1;
}

- (CMMotionContextSession)init
{
  uint64_t v2;
  uint64_t v3;

  return (CMMotionContextSession *)objc_msgSend_initWithOptions_(self, a2, 0, v2, v3);
}

- (CMMotionContextSession)initWithOptions:(id)a3
{
  char *v4;
  double *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  char *v50;
  char *v51;
  objc_super v52;
  int v53;
  id v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)CMMotionContextSession;
  v4 = -[CMMotionContextSession init](&v52, sel_init);
  v5 = (double *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 3194) = 0;
    *(_OWORD *)(v4 + 12904) = 0u;
    v4[12780] = 1;
    v4[12944] = 0;
    *((_QWORD *)v4 + 1620) = 0;
    *((_QWORD *)v4 + 1607) = 0;
    *((_OWORD *)v4 + 811) = 0u;
    *((_DWORD *)v4 + 3248) = 0;
    v6 = mach_continuous_time();
    v5[1608] = sub_18F1FD20C(v6);
    *((_BYTE *)v5 + 12996) = 0;
    *((_DWORD *)v5 + 3250) = 0;
    if (a3)
    {
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v7 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = a3;
        _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Options dictionary: %@", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        v53 = 138412290;
        v54 = a3;
        v50 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession initWithOptions:]", "CoreLocation: %s\n", v50);
        if (v50 != (char *)buf)
          free(v50);
      }
      if (objc_msgSend_valueForKey_(a3, v8, (uint64_t)CFSTR("kCMMotionContextSessionLogMSL"), v9, v10))
      {
        v14 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v11, (uint64_t)CFSTR("kCMMotionContextSessionLogMSL"), v12, v13);
        v19 = objc_msgSend_BOOLValue(v14, v15, v16, v17, v18);
        *((_BYTE *)v5 + 16) = v19;
        if (v19)
        {
          v20 = objc_msgSend_objectForKeyedSubscript_(a3, v11, (uint64_t)CFSTR("kCMMotionContextSessionMSLFilePath"), v12, v13);
          if (objc_msgSend_valueForKey_(a3, v21, (uint64_t)CFSTR("kCMMotionContextSessionMSLFilePrefix"), v22, v23))
          {
            v27 = objc_msgSend_objectForKeyedSubscript_(a3, v24, (uint64_t)CFSTR("kCMMotionContextSessionMSLFilePrefix"), v25, v26);
            v31 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("Spatial_%@"), v29, v30, v27);
          }
          else
          {
            v31 = CFSTR("MotionContext");
          }
          if (qword_1EE16D8D8 != -1)
            dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
          v32 = qword_1EE16D8E0;
          if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = (id)v31;
            _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] MSL file prefix: %@", buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D8D8 != -1)
              dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
            v53 = 138412290;
            v54 = (id)v31;
            v51 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession initWithOptions:]", "CoreLocation: %s\n", v51);
            if (v51 != (char *)buf)
              free(v51);
          }
          objc_msgSend_initLoggerWithPrefix_filePath_(v5, v33, (uint64_t)v31, v20, v34);
        }
      }
      if (objc_msgSend_valueForKey_(a3, v11, (uint64_t)CFSTR("kCMMotionContextSessionUseMLModel"), v12, v13))
      {
        v38 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v35, (uint64_t)CFSTR("kCMMotionContextSessionUseMLModel"), v36, v37);
        if (objc_msgSend_BOOLValue(v38, v39, v40, v41, v42))
        {
          v47 = (char *)objc_msgSend_UTF8String(CFSTR("/System/Library/PrivateFrameworks/CoreMotionModels.framework/HumanMotionModels/hml.espresso/hml.mlmodelc"), v43, v44, v45, v46);
          v48 = (_QWORD *)operator new();
          sub_18F3C34E0((uint64_t)v48, v47);
          sub_18F342B14((_QWORD **)v5 + 1617, v48);
        }
      }
    }
  }
  return (CMMotionContextSession *)v5;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  CMMotionContextSessionAnalyticsTracker *value;
  CLDeviceMotionProperties *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Dispatcher *v11;
  id v12;
  uint64_t v13;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v15;
  NSObject *v16;
  Dispatcher *v17;
  uint64_t v18;
  Dispatcher *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  CMPdrMLModel *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  Dispatcher *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v3 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEBUG, "Starting CMMotionContextSession", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession start]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf)
      free(v25);
  }
  if (!self->_analyticsTracker.__ptr_.__value_)
  {
    v4 = operator new();
    *(_QWORD *)(v4 + 304) = 0;
    *(_OWORD *)(v4 + 272) = 0u;
    *(_OWORD *)(v4 + 288) = 0u;
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
    *(_OWORD *)(v4 + 208) = 0u;
    *(_OWORD *)(v4 + 224) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 192) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 24) = xmmword_18F504010;
    *(_DWORD *)(v4 + 48) = 0;
    *(_OWORD *)(v4 + 56) = xmmword_18F504010;
    *(_DWORD *)(v4 + 80) = 0;
    *(_OWORD *)(v4 + 88) = xmmword_18F504010;
    *(_DWORD *)(v4 + 112) = 0;
    *(_OWORD *)(v4 + 120) = xmmword_18F504010;
    *(_DWORD *)(v4 + 144) = 0;
    *(_OWORD *)(v4 + 152) = xmmword_18F504010;
    *(_DWORD *)(v4 + 176) = 0;
    *(_OWORD *)(v4 + 184) = xmmword_18F504010;
    *(_DWORD *)(v4 + 208) = 0;
    *(_OWORD *)(v4 + 216) = xmmword_18F504010;
    *(_DWORD *)(v4 + 240) = 0;
    *(_OWORD *)(v4 + 248) = xmmword_18F504010;
    *(_DWORD *)(v4 + 272) = 0;
    *(_QWORD *)(v4 + 280) = 0x7FEFFFFFFFFFFFFFLL;
    *(_QWORD *)(v4 + 288) = 0x10000000000000;
    *(_DWORD *)(v4 + 304) = 0;
    *(_QWORD *)(v4 + 312) = 0xFFFFFFFF00000000;
    value = self->_analyticsTracker.__ptr_.__value_;
    self->_analyticsTracker.__ptr_.__value_ = (CMMotionContextSessionAnalyticsTracker *)v4;
    if (value)
      MEMORY[0x194001438](value, 0x1000C406BA0FAAELL);
  }
  if (!self->_deviceMotionDispatcher)
  {
    v6 = [CLDeviceMotionProperties alloc];
    v10 = (void *)objc_msgSend_initWithMode_(v6, v7, 7, v8, v9);
    v11 = (Dispatcher *)operator new();
    v11->var0 = (void **)off_1E294C238;
    v12 = v10;
    v11->var0 = (void **)&off_1E294C350;
    v11->var1 = v12;
    v11[1].var0 = (void **)sub_18F342090;
    v11[1].var1 = self;
    self->_deviceMotionDispatcher = v11;

    v13 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v15 = sub_18F204AE4();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = sub_18F1F998C;
    v31 = &unk_1E2956F80;
    v32 = v13;
    v33 = deviceMotionDispatcher;
    v34 = 0x3F747AE140000000;
    sub_18F1F5E28(v15, (uint64_t)buf);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v16 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEBUG, "Subscribing to DM\n", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v26 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession start]", "CoreLocation: %s\n", v26);
      if (v26 != (char *)buf)
        free(v26);
    }
  }
  if (!self->_accessoryDeviceMotionConfigDispatcher)
  {
    v17 = (Dispatcher *)operator new();
    v17->var0 = (void **)off_1E294C238;
    v17->var0 = (void **)&off_1E294C698;
    v17->var1 = 0;
    v17[1].var0 = (void **)sub_18F3420A4;
    v17[1].var1 = self;
    self->_accessoryDeviceMotionConfigDispatcher = v17;
    v18 = sub_18F4317A8();
    sub_18F1F4F0C(v18, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher, -1.0);
  }
  if (!self->_accessoryDeviceMotionDispatcher)
  {
    *(_BYTE *)(sub_18F4317A8() + 28) = 1;
    v19 = (Dispatcher *)operator new();
    v19->var0 = (void **)off_1E294C238;
    v19->var0 = (void **)&off_1E294C660;
    v19->var1 = 0;
    v19[1].var0 = (void **)sub_18F3420B8;
    v19[1].var1 = self;
    self->_accessoryDeviceMotionDispatcher = v19;
    v20 = sub_18F4317A8();
    v21 = sub_18F1F4F0C(v20, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher, 0.0199999996);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v22 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v21;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEBUG, "Subscribing to accessoryDM: success: %d\n", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession start]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)buf)
        free(v27);
    }
  }
  v23 = self->hmlModel.__ptr_.__value_;
  if (v23)
  {
    *((_BYTE *)v23 + 1560) = 0;
    *((_QWORD *)v23 + 194) = 0;
  }
  *(_QWORD *)&self->_totalSessionTime = 0;
  v24 = mach_continuous_time();
  self->_currentTime = sub_18F1FD20C(v24);
  objc_sync_exit(self);
}

- (void)stop
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v7;
  Dispatcher *v8;
  uint64_t v9;
  Dispatcher *accessoryDeviceMotionConfigDispatcher;
  uint64_t v11;
  Dispatcher *v12;
  uint64_t v13;
  Dispatcher *accessoryDeviceMotionDispatcher;
  uint64_t v15;
  Dispatcher *v16;
  CMMotionContextSessionAnalyticsTracker *value;
  int auxSampleCounter;
  float v19;
  NSObject *v20;
  CMMotionContextSessionAnalyticsTracker *v21;
  char *v22;
  char *v23;
  __int128 buf;
  void *v25;
  void *v26;
  uint64_t v27;
  Dispatcher *v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v3 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEBUG, "Stopping CMMotionContextSession", (uint8_t *)&buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession stop]", "CoreLocation: %s\n", v22);
    if (v22 != (char *)&buf)
      free(v22);
  }
  v4 = MEMORY[0x1E0C809B0];
  if (self->_deviceMotionDispatcher)
  {
    v5 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v7 = sub_18F204AE4();
    *(_QWORD *)&buf = v4;
    *((_QWORD *)&buf + 1) = 3221225472;
    v25 = sub_18F1FA1A4;
    v26 = &unk_1E2958238;
    v27 = v5;
    v28 = deviceMotionDispatcher;
    sub_18F1F5E28(v7, (uint64_t)&buf);
    v8 = self->_deviceMotionDispatcher;
    if (v8)
      (*((void (**)(Dispatcher *))v8->var0 + 1))(v8);
    self->_deviceMotionDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionConfigDispatcher)
  {
    v9 = sub_18F4317A8();
    accessoryDeviceMotionConfigDispatcher = self->_accessoryDeviceMotionConfigDispatcher;
    v11 = sub_18F204AE4();
    *(_QWORD *)&buf = v4;
    *((_QWORD *)&buf + 1) = 3221225472;
    v25 = sub_18F1F5EE0;
    v26 = &unk_1E2956E98;
    v29 = 1;
    v27 = v9;
    v28 = accessoryDeviceMotionConfigDispatcher;
    sub_18F1F5E28(v11, (uint64_t)&buf);
    v12 = self->_accessoryDeviceMotionConfigDispatcher;
    if (v12)
      (*((void (**)(Dispatcher *))v12->var0 + 1))(v12);
    self->_accessoryDeviceMotionConfigDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionDispatcher)
  {
    v13 = sub_18F4317A8();
    accessoryDeviceMotionDispatcher = self->_accessoryDeviceMotionDispatcher;
    v15 = sub_18F204AE4();
    *(_QWORD *)&buf = v4;
    *((_QWORD *)&buf + 1) = 3221225472;
    v25 = sub_18F1F5EE0;
    v26 = &unk_1E2956E98;
    v29 = 0;
    v27 = v13;
    v28 = accessoryDeviceMotionDispatcher;
    sub_18F1F5E28(v15, (uint64_t)&buf);
    v16 = self->_accessoryDeviceMotionDispatcher;
    if (v16)
      (*((void (**)(Dispatcher *))v16->var0 + 1))(v16);
    self->_accessoryDeviceMotionDispatcher = 0;
  }
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
  {
    auxSampleCounter = self->_auxSampleCounter;
    if (auxSampleCounter)
    {
      v19 = self->_totalSessionTime / (float)auxSampleCounter;
      if (v19 < 0.04)
      {
        sub_18F43E374(value);
LABEL_28:
        v21 = self->_analyticsTracker.__ptr_.__value_;
        self->_analyticsTracker.__ptr_.__value_ = 0;
        if (v21)
          MEMORY[0x194001438](v21, 0x1000C406BA0FAAELL);
        goto LABEL_30;
      }
    }
    else
    {
      v19 = 3.4028e38;
    }
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v20 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(double *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_DEFAULT, "Not sending invalid CA metrics due to aux sample drops. avgAuxInterval %{public}f\n", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession stop]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)&buf)
        free(v23);
    }
    goto LABEL_28;
  }
LABEL_30:
  objc_sync_exit(self);
}

- (void)setAlgType:(int)a3
{
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_pdr.fAlgType = a3;
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v4 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v7 = a3;
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEFAULT, "[CMPdr] Setting Pdr algoType to %d\n", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "void CMPdr::setAlgType(Pdr::AlgType)", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
}

- (void)setSpeedEstType:(int)a3
{
  NSObject *v5;
  CMPdrEstimatorOnHead *value;
  NSObject *v7;
  char *v8;
  char *v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v5 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = a3;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Setting Pdr speed estimator to %d\n", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession setSpeedEstType:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf)
      free(v8);
  }
  if (!self->_pdr.fAlgType)
  {
    value = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
    if (value)
    {
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v7 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = a3;
        _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[DoTEstimator] Setting speedType, %d\n", buf, 8u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "void CMPdrEstimatorOnHead::setSpeedEstimationType(Pdr::SpeedEstimationType)", "CoreLocation: %s\n", v9);
        if (v9 != (char *)buf)
          free(v9);
      }
      *((_DWORD *)value + 14) = a3;
    }
  }
}

- (void)enableMLModel:(BOOL)a3
{
  BOOL *p_enableMLModel;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  CMPdrMLModel *value;

  p_enableMLModel = &self->_enableMLModel;
  if (self->_enableMLModel != a3)
  {
    v4 = a3;
    objc_sync_enter(self);
    *p_enableMLModel = v4;
    if (self->hmlModel.__ptr_.__value_)
    {
      if (!v4)
        sub_18F342B14(&self->hmlModel, 0);
    }
    else if (v4)
    {
      v10 = (char *)objc_msgSend_UTF8String(CFSTR("/System/Library/PrivateFrameworks/CoreMotionModels.framework/HumanMotionModels/hml.espresso/hml.mlmodelc"), v6, v7, v8, v9);
      v11 = (_QWORD *)operator new();
      sub_18F3C34E0((uint64_t)v11, v10);
      sub_18F342B14(&self->hmlModel, v11);
      value = self->hmlModel.__ptr_.__value_;
      *((_BYTE *)value + 1560) = 0;
      *((_QWORD *)value + 194) = 0;
    }
    objc_sync_exit(self);
  }
}

- (void)enterDistractedViewingSession:(int)a3
{
  CMVector<double, 2UL> *p_position;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_lastTrackingDisableRoute = a3;
  if ((a3 | 2) == 3)
  {
    p_position = &self->_result.position;
    self->_inDVEvent = 1;
    *(_QWORD *)&self->_distanceTravelledPerDVEvent = 0;
    v6 = mach_continuous_time();
    self->_distractedViewingEnterTime = sub_18F1FD20C(v6);
    self->_initialPosition = *p_position;
    self->_initialHeadingDegrees = self->_result.directionOfTravelDegrees;
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v7 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = a3;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] entered DV event via route %d", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession enterDistractedViewingSession:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
}

- (void)exitDistractedViewingSession:(int)a3
{
  CMMotionContextSessionAnalyticsTracker *value;
  uint64_t v6;
  double v7;
  double v8;
  float v9;
  float distanceTravelledPerDVEvent;
  double v11;
  double v12;
  float v13;
  float v14;
  CMMotionContextSessionAnalyticsTracker *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double stepCountPerDVEvent;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _DWORD *v35;
  int v36;
  _DWORD *v37;
  int v38;
  int v39;
  int v40;
  NSObject *v41;
  char *v42;
  uint8_t buf[1640];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((self->_lastTrackingDisableRoute | 2) == 3 && (a3 - 1) <= 1)
  {
    value = self->_analyticsTracker.__ptr_.__value_;
    if (*(_DWORD *)value != -1)
      ++*(_DWORD *)value;
    v6 = mach_continuous_time();
    v7 = sub_18F1FD20C(v6);
    v8 = self->_result.position.elements[0] - self->_initialPosition.elements[0];
    v9 = sqrt(v8 * v8+ (self->_result.position.elements[1] - self->_initialPosition.elements[1])* (self->_result.position.elements[1] - self->_initialPosition.elements[1]));
    distanceTravelledPerDVEvent = self->_distanceTravelledPerDVEvent;
    v11 = 0.0;
    v12 = 0.0;
    if (distanceTravelledPerDVEvent != 0.0)
      v12 = (float)(v9 / distanceTravelledPerDVEvent);
    v13 = self->_result.directionOfTravelDegrees - self->_initialHeadingDegrees;
    v14 = v7 - self->_distractedViewingEnterTime;
    if (v14 > 0.0)
      v11 = (float)((float)self->_stepCountPerDVEvent / v14);
    v15 = self->_analyticsTracker.__ptr_.__value_;
    v16 = v9;
    v18 = *((double *)v15 + 3);
    v17 = *((double *)v15 + 4);
    if (v17 <= v16)
      v17 = v16;
    if (v18 >= v16)
      v18 = v16;
    *((double *)v15 + 3) = v18;
    *((double *)v15 + 4) = v17;
    *((double *)v15 + 5) = *((double *)v15 + 5) + v16;
    ++*((_DWORD *)v15 + 12);
    v19 = distanceTravelledPerDVEvent;
    v21 = *((double *)v15 + 7);
    v20 = *((double *)v15 + 8);
    if (v20 <= v19)
      v20 = v19;
    if (v21 >= v19)
      v21 = v19;
    *((double *)v15 + 7) = v21;
    *((double *)v15 + 8) = v20;
    *((double *)v15 + 9) = *((double *)v15 + 9) + v19;
    ++*((_DWORD *)v15 + 20);
    v23 = *((double *)v15 + 11);
    v22 = *((double *)v15 + 12);
    if (v22 <= v12)
      v22 = v12;
    if (v23 >= v12)
      v23 = v12;
    *((double *)v15 + 11) = v23;
    *((double *)v15 + 12) = v22;
    *((double *)v15 + 13) = v12 + *((double *)v15 + 13);
    ++*((_DWORD *)v15 + 28);
    v24 = v13;
    v26 = *((double *)v15 + 15);
    v25 = *((double *)v15 + 16);
    if (v25 <= v24)
      v25 = v24;
    if (v26 >= v24)
      v26 = v24;
    *((double *)v15 + 15) = v26;
    *((double *)v15 + 16) = v25;
    *((double *)v15 + 17) = *((double *)v15 + 17) + v24;
    ++*((_DWORD *)v15 + 36);
    stepCountPerDVEvent = (double)self->_stepCountPerDVEvent;
    v29 = *((double *)v15 + 19);
    v28 = *((double *)v15 + 20);
    if (v28 <= stepCountPerDVEvent)
      v28 = (double)self->_stepCountPerDVEvent;
    if (v29 >= stepCountPerDVEvent)
      v29 = (double)self->_stepCountPerDVEvent;
    *((double *)v15 + 19) = v29;
    *((double *)v15 + 20) = v28;
    *((double *)v15 + 21) = *((double *)v15 + 21) + stepCountPerDVEvent;
    ++*((_DWORD *)v15 + 44);
    v31 = *((double *)v15 + 23);
    v30 = *((double *)v15 + 24);
    if (v30 <= v11)
      v30 = v11;
    if (v31 >= v11)
      v31 = v11;
    *((double *)v15 + 23) = v31;
    *((double *)v15 + 24) = v30;
    *((double *)v15 + 25) = v11 + *((double *)v15 + 25);
    ++*((_DWORD *)v15 + 52);
    v32 = v14;
    v34 = *((double *)v15 + 31);
    v33 = *((double *)v15 + 32);
    if (v33 <= v32)
      v33 = v32;
    if (v34 >= v32)
      v34 = v32;
    *((double *)v15 + 31) = v34;
    *((double *)v15 + 32) = v33;
    *((double *)v15 + 33) = *((double *)v15 + 33) + v32;
    ++*((_DWORD *)v15 + 68);
    self->_inDVEvent = 0;
    if (self->_lastTrackingDisableRoute == 1)
    {
      v35 = (_DWORD *)((char *)v15 + 4);
      v36 = *((_DWORD *)v15 + 1);
    }
    else
    {
      v35 = (_DWORD *)((char *)v15 + 8);
      v36 = *((_DWORD *)v15 + 2);
    }
    if (v36 != -1)
      *v35 = v36 + 1;
    if (a3 == 1)
    {
      v39 = *((_DWORD *)v15 + 3);
      v37 = (_DWORD *)((char *)v15 + 12);
      v38 = v39;
    }
    else
    {
      v40 = *((_DWORD *)v15 + 4);
      v37 = (_DWORD *)((char *)v15 + 16);
      v38 = v40;
    }
    if (v38 != -1)
      *v37 = v38 + 1;
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v41 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] stop logging CA metrics for a DV event.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v42 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession exitDistractedViewingSession:]", "CoreLocation: %s\n", v42);
      if (v42 != (char *)buf)
        free(v42);
    }
  }
}

- (void)setTrackingClientMode:(int)a3
{
  CMMotionContextSessionAnalyticsTracker *value;

  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
    *((_DWORD *)value + 79) = a3;
}

- (void)initLoggerWithPrefix:(id)a3 filePath:(id)a4
{
  uint64_t v4;
  char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v13 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "prefix";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v14 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "prefix";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No prefix provided", "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v15 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2082;
      v21 = "assert";
      v22 = 2081;
      v23 = "prefix";
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"No prefix provided\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  v7 = (char *)objc_msgSend_cStringUsingEncoding_(a3, a2, 1, (uint64_t)a4, v4);
  v11 = (char *)objc_msgSend_cStringUsingEncoding_(a4, v8, 1, v9, v10);
  v12 = (uint64_t *)operator new();
  sub_18F3620E4((uint64_t)v12, v7, v11);
  sub_18F346D8C((uint64_t **)&self->_logger, v12);
}

- (void)notifyStepCountClient:(const void *)a3
{
  id stepCountClientHandler;
  NSObject *stepCountClientQueue;
  _QWORD v7[6];

  if (self->_stepCountClientHandler)
  {
    if (self->_stepCountClientQueue)
    {
      objc_sync_enter(self);
      stepCountClientHandler = self->_stepCountClientHandler;
      stepCountClientQueue = self->_stepCountClientQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18F3434CC;
      v7[3] = &unk_1E2955AA8;
      v7[4] = stepCountClientHandler;
      v7[5] = a3;
      dispatch_sync(stepCountClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)notifyPdrClient:(const void *)a3
{
  id pdrClientHandler;
  NSObject *pdrClientQueue;
  _QWORD v7[6];

  if (self->_pdrClientQueue)
  {
    if (self->_pdrClientHandler)
    {
      objc_sync_enter(self);
      pdrClientHandler = self->_pdrClientHandler;
      pdrClientQueue = self->_pdrClientQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18F343574;
      v7[3] = &unk_1E2955AA8;
      v7[4] = pdrClientHandler;
      v7[5] = a3;
      dispatch_sync(pdrClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)notifyMotionContextClient:(int)a3
{
  id motionContextClientHandler;
  NSObject *motionContextClientQueue;
  _QWORD v7[5];
  int v8;

  if (self->_motionContextClientHandler)
  {
    if (self->_motionContextClientQueue)
    {
      objc_sync_enter(self);
      motionContextClientHandler = self->_motionContextClientHandler;
      motionContextClientQueue = self->_motionContextClientQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18F34362C;
      v7[3] = &unk_1E2955A80;
      v7[4] = motionContextClientHandler;
      v8 = a3;
      dispatch_sync(motionContextClientQueue, v7);
      objc_sync_exit(self);
    }
  }
}

- (void)startStepCountUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  NSObject *v7;
  NSObject *stepCountClientQueue;
  id stepCountClientHandler;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v7 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession startStepCountUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  if (!a3)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v11 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v12 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v13 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v14 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v15 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v16 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  stepCountClientQueue = self->_stepCountClientQueue;
  if (stepCountClientQueue)
    dispatch_release(stepCountClientQueue);
  stepCountClientHandler = self->_stepCountClientHandler;
  if (stepCountClientHandler)
    _Block_release(stepCountClientHandler);
  self->_stepCountClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_stepCountClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)startPdrUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  NSObject *v7;
  NSObject *pdrClientQueue;
  id pdrClientHandler;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v7 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession startPdrUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  if (!a3)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v11 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v12 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v13 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v14 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v15 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v16 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  pdrClientQueue = self->_pdrClientQueue;
  if (pdrClientQueue)
    dispatch_release(pdrClientQueue);
  pdrClientHandler = self->_pdrClientHandler;
  if (pdrClientHandler)
    _Block_release(pdrClientHandler);
  self->_pdrClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_pdrClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)startMotionContextUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  NSObject *v7;
  NSObject *motionContextClientQueue;
  id motionContextClientHandler;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v7 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Starting push updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession startMotionContextUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  if (!a3)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v11 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v12 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v13 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "queue";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_38:
    abort_report_np();
    __break(1u);
  }
  if (!a4)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v14 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v15 = qword_1EE16D8E0;
    if (os_signpost_enabled((os_log_t)qword_1EE16D8E0))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMotionContextSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    }
    v16 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = "assert";
      v23 = 2081;
      v24 = "handler";
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMotionContextSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_38;
  }
  objc_sync_enter(self);
  motionContextClientQueue = self->_motionContextClientQueue;
  if (motionContextClientQueue)
    dispatch_release(motionContextClientQueue);
  motionContextClientHandler = self->_motionContextClientHandler;
  if (motionContextClientHandler)
    _Block_release(motionContextClientHandler);
  self->_motionContextClientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_motionContextClientHandler = _Block_copy(a4);
  objc_sync_exit(self);
}

- (void)feedSourceDeviceIMU:(const Sample *)a3
{
  if (self->_logMSL)
    sub_18F363720((uint64_t *)self->_logger.__ptr_.__value_, &a3->timestamp);
}

- (void)feedAudioAccessoryIMU:(const void *)a3
{
  double v5;
  float v6;
  int v7;
  int v8;
  float32x4_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL *p_drawPositionOnStart;
  float32x4_t v14;
  CMMotionContextSessionAnalyticsTracker *value;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  float v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  NSObject *v30;
  CMMotionContextLogger *v31;
  float32x2_t v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  CFAbsoluteTime Current;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int motionContextState_low;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  float v47;
  CMMotionContextLogger *v48;
  int fAlgType;
  uint64_t v50;
  CFAbsoluteTime v51;
  uint64_t v52;
  CMMotionContextLogger *v53;
  uint64_t v54;
  CFAbsoluteTime v55;
  _QWORD *v56;
  unsigned int v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CMMotionContextLogger *v63;
  uint64_t v64;
  uint64_t v65;
  CFAbsoluteTime v66;
  char *v67;
  char *v68;
  int v69;
  char *v70;
  char *v71;
  float64x2_t v72;
  float32x2_t v73;
  float v74;
  __int128 v75;
  int v76;
  int v77;
  float32x4_t v78;
  __int128 v79;
  double v80;
  CMVector<double, 2UL> v81;
  float32x4_t v82;
  CMOQuaternion v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87[2];
  int v88;
  uint64_t v89;
  int v90;
  __int128 v91;
  _BYTE v92[32];
  uint8_t buf[4];
  double v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  CFAbsoluteTime v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char v104;
  float64x2_t __src;
  double v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  if (self->_logMSL)
    sub_18F3626E0((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
  v5 = *((double *)a3 + 8);
  v6 = v5 - self->_currentTime;
  self->_totalSessionTime = self->_totalSessionTime + v6;
  *(double *)v87 = v5;
  v87[1] = *((_QWORD *)a3 + 2);
  v7 = *((_DWORD *)a3 + 6);
  v89 = *((_QWORD *)a3 + 5);
  v8 = *((_DWORD *)a3 + 12);
  v88 = v7;
  v90 = v8;
  v91 = *(_OWORD *)a3;
  sub_18F460240((uint64_t)&self->_accessoryActivity, (uint64_t)v87, (uint64_t)&v84);
  sub_18F3E4E1C((uint64_t)&self->_pdr, v87, &v86, (uint64_t)&v79, v9);
  p_drawPositionOnStart = &self->_drawPositionOnStart;
  *(_OWORD *)&self->_result.step = v79;
  self->_result.endImpulse = v80;
  self->_result.position = v81;
  v14 = v82;
  *(float32x4_t *)&self->_result.stepsCount = v82;
  if (&self->_result != (PdrResults *)&v79)
  {
    v14 = (float32x4_t)v83;
    self->_result.attitude = v83;
  }
  if (self->_inDVEvent)
  {
    value = self->_analyticsTracker.__ptr_.__value_;
    v16 = v6;
    v18 = *((double *)value + 35);
    v17 = *((double *)value + 36);
    if (v17 <= v6)
      v17 = v6;
    if (v18 >= v16)
      v18 = v6;
    *((double *)value + 35) = v18;
    *((double *)value + 36) = v17;
    *((double *)value + 37) = *((double *)value + 37) + v16;
    ++*((_DWORD *)value + 76);
    v19 = *(double *)&v82.i64[1];
    v21 = *((double *)value + 27);
    v20 = *((double *)value + 28);
    if (v20 <= *(double *)&v82.i64[1])
      v20 = *(double *)&v82.i64[1];
    if (v21 >= *(double *)&v82.i64[1])
      v21 = *(double *)&v82.i64[1];
    *((double *)value + 27) = v21;
    *((double *)value + 28) = v20;
    *(double *)v14.i64 = v19 + *((double *)value + 29);
    *((_QWORD *)value + 29) = v14.i64[0];
    ++*((_DWORD *)value + 60);
  }
  if (self->hmlModel.__ptr_.__value_)
  {
    v22 = *((_DWORD *)a3 + 3);
    v14.f32[0] = -*((float *)a3 + 2);
    *(float32x2_t *)v78.f32 = vneg_f32(*(float32x2_t *)a3);
    v78.i64[1] = __PAIR64__(v22, v14.u32[0]);
    sub_18F1FFE94(&v78, v14);
    v23 = sub_18F3D39F4(v78.f32, *((float *)a3 + 10), *((float *)a3 + 11), *((float *)a3 + 12));
    v25 = v24;
    v27 = v26;
    LODWORD(v75) = sub_18F3D39F4(v78.f32, *((float *)a3 + 4), *((float *)a3 + 5), *((float *)a3 + 6));
    *(_QWORD *)((char *)&v75 + 4) = __PAIR64__(v29, v28);
    *((float *)&v75 + 3) = v23;
    v76 = v25;
    v77 = v27;
    if (sub_18F3C3ED8((uint64_t)self->hmlModel.__ptr_.__value_, &v75, (uint64_t)&v73))
    {
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v30 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v94 = v73.f32[0];
        v95 = 2048;
        v96 = v73.f32[1];
        v97 = 2048;
        v98 = v74;
        _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] HML model predict velocity,.x,%.3f,.y,%.3f,.z,%.3f", buf, 0x20u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        *(_DWORD *)v92 = 134218496;
        *(double *)&v92[4] = v73.f32[0];
        *(_WORD *)&v92[12] = 2048;
        *(double *)&v92[14] = v73.f32[1];
        *(_WORD *)&v92[22] = 2048;
        *(double *)&v92[24] = v74;
        v71 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v71);
        if (v71 != (char *)buf)
          free(v71);
      }
      if (self->_logMSL)
      {
        v31 = self->_logger.__ptr_.__value_;
        v32 = v73;
        v33 = v74;
        v34 = *((_QWORD *)a3 + 8);
        v35 = *((_QWORD *)v31 + 1);
        *(_QWORD *)v92 = (char *)v31 + 8;
        (*(void (**)(uint64_t))(v35 + 16))((uint64_t)v31 + 8);
        *(_WORD *)&v92[16] = 256;
        if (*(_QWORD *)v31)
        {
          sub_18F2B6BD0(buf);
          sub_18F2C6B28(buf);
          Current = CFAbsoluteTimeGetCurrent();
          v104 |= 1u;
          v99 = Current;
          v37 = v102;
          *(_BYTE *)(v102 + 40) |= 1u;
          *(_QWORD *)(v37 + 32) = v34;
          __src = vcvtq_f64_f32(v32);
          v106 = v33;
          sub_18F346988((char *)(v102 + 8), (char *)&__src, (uint64_t)&v107, 3uLL);
          sub_18F2A9EF0(*(_QWORD *)v31, (uint64_t)buf);
          sub_18F2B9670((PB::Base *)buf);
        }
        (*(void (**)(uint64_t))(*((_QWORD *)v31 + 1) + 24))((uint64_t)v31 + 8);
      }
    }
  }
  v38 = v84;
  if (self->_motionContextState != v84)
  {
    self->_motionContextState = v84;
    objc_msgSend_notifyMotionContextClient_(self, v10, v38, v11, v12);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v39 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
    {
      motionContextState_low = LOBYTE(self->_motionContextState);
      *(_DWORD *)buf = 67109120;
      LODWORD(v94) = motionContextState_low;
      _os_log_impl(&dword_18F1DC000, v39, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] MotionContext state changes to %u ", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v69 = LOBYTE(self->_motionContextState);
      *(_DWORD *)v92 = 67109120;
      *(_DWORD *)&v92[4] = v69;
      v70 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
  }
  if ((_BYTE)v79)
  {
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v41 = qword_1EE16D8E0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v94 = v81.elements[0];
      v95 = 2048;
      v96 = v81.elements[1];
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_DEBUG, "[cmMotionContext] notifying step count: %2.2f,%2.2f\n", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      *(_DWORD *)v92 = 134218240;
      *(double *)&v92[4] = v81.elements[0];
      *(_WORD *)&v92[12] = 2048;
      *(double *)&v92[14] = v81.elements[1];
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAudioAccessoryIMU:]", "CoreLocation: %s\n", v68);
      if (v68 != (char *)buf)
        free(v68);
    }
    objc_msgSend_notifyStepCountClient_(self, v42, (uint64_t)&v79, v43, v44);
    ++self->_stepCountPerDVEvent;
  }
  v45 = v81.elements[0] - self->_prevPDRPosition.elements[0];
  v46 = v81.elements[1] - self->_prevPDRPosition.elements[1];
  if (*p_drawPositionOnStart || sqrt(v45 * v45 + v46 * v46) > 0.3)
  {
    objc_msgSend_notifyPdrClient_(self, v10, (uint64_t)&v79, v11, v12);
    self->_prevPDRPosition = v81;
    *p_drawPositionOnStart = 0;
    if (self->_inDVEvent)
    {
      v47 = sqrt(v45 * v45 + v46 * v46) + self->_distanceTravelledPerDVEvent;
      self->_distanceTravelledPerDVEvent = v47;
    }
  }
  if (self->_logMSL)
  {
    v48 = self->_logger.__ptr_.__value_;
    fAlgType = self->_pdr.fAlgType;
    v50 = *((_QWORD *)v48 + 1);
    *(_QWORD *)v92 = (char *)v48 + 8;
    (*(void (**)(uint64_t))(v50 + 16))((uint64_t)v48 + 8);
    *(_WORD *)&v92[16] = 256;
    if (*(_QWORD *)v48)
    {
      sub_18F2B6BD0(buf);
      sub_18F2C6AC4(buf);
      v51 = CFAbsoluteTimeGetCurrent();
      v104 |= 1u;
      v99 = v51;
      v52 = v101;
      *(_BYTE *)(v101 + 12) |= 1u;
      *(_DWORD *)(v52 + 8) = fAlgType;
      sub_18F2A9EF0(*(_QWORD *)v48, (uint64_t)buf);
      sub_18F2B9670((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((_QWORD *)v48 + 1) + 24))((uint64_t)v48 + 8);
    v53 = self->_logger.__ptr_.__value_;
    v54 = *((_QWORD *)v53 + 1);
    *(_QWORD *)v92 = (char *)v53 + 8;
    (*(void (**)(uint64_t))(v54 + 16))((uint64_t)v53 + 8);
    *(_WORD *)&v92[16] = 256;
    if (*(_QWORD *)v53)
    {
      sub_18F2B6BD0(buf);
      sub_18F2C6A60(buf);
      v55 = CFAbsoluteTimeGetCurrent();
      v104 |= 1u;
      v99 = v55;
      v56 = v100;
      v57 = v84;
      *((_BYTE *)v100 + 28) |= 2u;
      *((_DWORD *)v56 + 6) = v57;
      v58 = v100;
      v59 = v85;
      *((_BYTE *)v100 + 28) |= 1u;
      v58[2] = v59;
      sub_18F300F24(v100);
      v60 = v100[1];
      *(_BYTE *)(v60 + 20) |= 2u;
      *(_DWORD *)(v60 + 16) = 0;
      v61 = v86;
      v62 = v100[1];
      *(_BYTE *)(v62 + 20) |= 1u;
      *(_QWORD *)(v62 + 8) = v61;
      sub_18F2A9EF0(*(_QWORD *)v53, (uint64_t)buf);
      sub_18F2B9670((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((_QWORD *)v53 + 1) + 24))((uint64_t)v53 + 8);
    v63 = self->_logger.__ptr_.__value_;
    v72 = (float64x2_t)v81;
    v64 = v87[0];
    v65 = *((_QWORD *)v63 + 1);
    *(_QWORD *)&__src.f64[0] = (char *)v63 + 8;
    (*(void (**)(uint64_t))(v65 + 16))((uint64_t)v63 + 8);
    LOWORD(v106) = 256;
    if (*(_QWORD *)v63)
    {
      sub_18F2B6BD0(buf);
      sub_18F2C68D0(buf);
      v66 = CFAbsoluteTimeGetCurrent();
      v104 |= 1u;
      v99 = v66;
      v67 = v103;
      v103[64] |= 1u;
      *((_QWORD *)v67 + 7) = v64;
      *(float64x2_t *)v92 = vcvtq_f64_f32(*(float32x2_t *)v83.elements);
      *(float64x2_t *)&v92[16] = vcvtq_f64_f32(*(float32x2_t *)&v83.elements[2]);
      sub_18F346988(v103 + 8, v92, (uint64_t)buf, 4uLL);
      *(float64x2_t *)v92 = vcvtq_f64_f32(vcvt_f32_f64(v72));
      *(_QWORD *)&v92[16] = 0;
      sub_18F346988(v103 + 32, v92, (uint64_t)&v92[24], 3uLL);
      sub_18F2A9EF0(*(_QWORD *)v63, (uint64_t)buf);
      sub_18F2B9670((PB::Base *)buf);
    }
    (*(void (**)(uint64_t))(*((_QWORD *)v63 + 1) + 24))((uint64_t)v63 + 8);
  }
  self->_currentTime = *((double *)a3 + 8);
  ++self->_auxSampleCounter;
}

- (void)feedAccessoryConfig:(const void *)a3
{
  NSObject *v5;
  _QWORD *v6;
  int v7;
  _QWORD *v8;
  int v9;
  NSObject *v10;
  __int128 *v11;
  int v12;
  NSObject *v13;
  int v14;
  char *v15;
  NSObject *v16;
  int v17;
  char *v18;
  CMSitStandDetector *v19;
  NSObject *v20;
  uint64_t v21;
  CMPdrEstimatorOnHead *v22;
  NSObject *v23;
  CMMotionContextLogger *value;
  CFAbsoluteTime Current;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  int v38;
  _BYTE buf[18];
  __int16 v40;
  _QWORD *v41;
  __int16 v42;
  int v43;
  _QWORD *v44;
  CFAbsoluteTime v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8D8 != -1)
    dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
  v5 = qword_1EE16D8E0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0)
      v6 = (_QWORD *)*v6;
    v7 = *(_DWORD *)a3;
    v8 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0)
      v8 = (_QWORD *)*v8;
    v9 = *((_DWORD *)a3 + 14);
    *(_DWORD *)buf = 67240963;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)&buf[8] = 2081;
    *(_QWORD *)&buf[10] = v6;
    v40 = 2081;
    v41 = v8;
    v42 = 1026;
    v43 = v9;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Received accessoryDeviceMotion config. side,%{public}d,configuration,%{private}s,serialNumber,%{private}s,hardwareModel,%{public}d", buf, 0x22u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8D8 != -1)
      dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
    v35 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v35);
    if (v35 != buf)
      free(v35);
  }
  objc_sync_enter(self);
  switch(*((_DWORD *)a3 + 14))
  {
    case 1:
      if (*(_DWORD *)a3 == 2)
        goto LABEL_41;
      if (*(_DWORD *)a3 == 1)
        goto LABEL_22;
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v10 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB298 must be 1 or 2.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8D8 != -1)
          goto LABEL_105;
        goto LABEL_48;
      }
      goto LABEL_67;
    case 2:
      v11 = &xmmword_18F504024;
      goto LABEL_51;
    case 3:
      if (*(_DWORD *)a3 == 2)
      {
        v11 = &xmmword_18F504054;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
        v11 = &xmmword_18F504044;
        goto LABEL_51;
      }
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v33 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB688 must be 1 or 2.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 == -1)
        goto LABEL_48;
      goto LABEL_105;
    case 4:
      if (*(_DWORD *)a3 == 2)
      {
        v11 = &xmmword_18F504074;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
        v11 = &xmmword_18F504064;
        goto LABEL_51;
      }
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v34 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB494 must be 1 or 2.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 == -1)
        goto LABEL_48;
      goto LABEL_105;
    case 5:
      if (*(_DWORD *)a3 == 2)
      {
LABEL_41:
        v11 = &xmmword_18F504094;
        goto LABEL_51;
      }
      if (*(_DWORD *)a3 == 1)
      {
LABEL_22:
        v11 = &xmmword_18F504084;
LABEL_51:
        *(_OWORD *)buf = *v11;
        sub_18F1FFE94((float32x4_t *)buf, *(float32x4_t *)buf);
        v37 = *(_QWORD *)buf;
        v38 = *(_DWORD *)&buf[8];
        v12 = *(_DWORD *)&buf[12];
        goto LABEL_52;
      }
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v32 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- config side for kAccessoryHardwareModelB698 must be 1 or 2.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8D8 != -1)
LABEL_105:
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
LABEL_48:
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v18);
LABEL_103:
        if (v18 != buf)
          free(v18);
      }
LABEL_67:
      objc_sync_exit(self);
      if (self->_logMSL)
      {
        value = self->_logger.__ptr_.__value_;
        if (*(_QWORD *)value)
        {
          (*(void (**)(uint64_t))(*((_QWORD *)value + 1) + 16))((uint64_t)value + 8);
          sub_18F2B6BD0(buf);
          sub_18F2C7618(buf);
          Current = CFAbsoluteTimeGetCurrent();
          v46 |= 1u;
          v45 = Current;
          sub_18F2767B0(v44);
          v26 = v44[4];
          v27 = *(_DWORD *)a3;
          *(_BYTE *)(v26 + 32) |= 2u;
          *(_DWORD *)(v26 + 28) = v27;
          v28 = v44[4];
          sub_18F346B38(v28);
          std::string::operator=(*(std::string **)(v28 + 8), (const std::string *)((char *)a3 + 8));
          v29 = v44[4];
          sub_18F346B98(v29);
          std::string::operator=(*(std::string **)(v29 + 16), (const std::string *)((char *)a3 + 32));
          v30 = v44[4];
          v31 = *((_DWORD *)a3 + 14);
          *(_BYTE *)(v30 + 32) |= 1u;
          *(_DWORD *)(v30 + 24) = v31;
          sub_18F2A9EF0(*(_QWORD *)value, (uint64_t)buf);
          sub_18F2B9670((PB::Base *)buf);
          (*(void (**)(uint64_t))(*((_QWORD *)value + 1) + 24))((uint64_t)value + 8);
        }
      }
      return;
    case 6:
      v11 = &xmmword_18F504034;
      goto LABEL_51;
    default:
      if (*((_BYTE *)a3 + 76))
      {
        v37 = *((_QWORD *)a3 + 10);
        v38 = *((_DWORD *)a3 + 22);
        v12 = *((_DWORD *)a3 + 23);
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        v13 = qword_1EE16D8E0;
        if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *((_DWORD *)a3 + 14);
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v14;
          _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Use the H2H transformation from IORegistry for model %{public}d", buf, 8u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D8D8 != -1)
            dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
          v15 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v15);
          if (v15 != buf)
            free(v15);
        }
LABEL_52:
        *(_QWORD *)&self->_accessoryActivity.fAccessoryStepDetector.fHeadsetOrientation.elements[2] = v37;
        LODWORD(self->_accessoryActivity.fAccessoryStepDetector.fStepModel.timeSinceLastStepSecRatio[0]) = v38;
        HIDWORD(self->_accessoryActivity.fAccessoryStepDetector.fStepModel.timeSinceLastStepSecRatio[0]) = v12;
        v19 = self->_accessoryActivity.fSitStandDetector.__ptr_.__value_;
        if (v19)
        {
          *(_QWORD *)((char *)v19 + 76) = v37;
          *((_DWORD *)v19 + 21) = v38;
          *((_DWORD *)v19 + 22) = v12;
        }
        self->_anon_31e0[0] = 1;
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        v20 = qword_1EE16D8E0;
        if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_DEFAULT, "[CMPdr] This should only be called if using accessoryDM.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D8D8 != -1)
            dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
          v36 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "void CMPdr::setHeadsetOrientation(const CMOQuaternion &)", "CoreLocation: %s\n", v36);
          if (v36 != buf)
            free(v36);
        }
        v21 = (uint64_t)self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
        if (!v21)
        {
          v21 = operator new();
          sub_18F43F2A0(v21, (uint64_t)&self->_pdr);
          v22 = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
          self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_ = (CMPdrEstimatorOnHead *)v21;
          if (v22)
          {
            sub_18F346A80((uint64_t)&self->_pdr.fPdrEstimatorOnHead, (uint64_t)v22);
            v21 = (uint64_t)self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
          }
        }
        *(_QWORD *)(v21 + 8) = v37;
        *(_DWORD *)(v21 + 16) = v38;
        *(_DWORD *)(v21 + 20) = v12;
        *(_BYTE *)(v21 + 24) = 1;
        if (qword_1EE16D8D8 != -1)
          dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
        v23 = qword_1EE16D8E0;
        if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_DEFAULT, "[CMMotionContextSession] Setting H2H transform", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D8D8 != -1)
            dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
          v18 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMotionContextSession feedAccessoryConfig:]", "CoreLocation: %s\n", v18);
          goto LABEL_103;
        }
        goto LABEL_67;
      }
      if (qword_1EE16D8D8 != -1)
        dispatch_once(&qword_1EE16D8D8, &unk_1E2952D08);
      v16 = qword_1EE16D8E0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8E0, OS_LOG_TYPE_ERROR))
      {
        v17 = *((_DWORD *)a3 + 14);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v17;
        _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_ERROR, "[CMMotionContextSession] Error -- No H2H transformation for model %{public}d", buf, 8u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8D8 != -1)
        goto LABEL_105;
      goto LABEL_48;
  }
}

- (uint64_t)feedARKitWorldPoseWithTimestamp:(int32x4_t)a3 pose:(int32x4_t)a4 status:(float32x4_t)a5
{
  float v10;
  float v12;
  float v13;
  unsigned int v14;
  float32x2_t v15;
  float32x2_t v16;
  unsigned __int32 v17;
  unsigned __int32 v18;
  float v19;
  unsigned int v20;
  float32x2_t v21;
  float32x2_t v22;
  float v23;
  float v24;
  unsigned int v25;
  float32x2_t v26;
  float32x2_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  unsigned int v34;
  float32x2_t v35;
  float32x2_t v36;
  uint64_t *v37;
  uint64_t v38;
  CFAbsoluteTime Current;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v46[45];
  uint64_t v47;
  CFAbsoluteTime v48;
  char v49;
  uint64_t *v50;
  __int16 v51;
  double __src[4];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 16))
  {
    v10 = a5.f32[2] + (float)(*(float *)a3.i32 + *(float *)&a4.i32[1]);
    if (v10 >= 0.0)
    {
      v19 = sqrtf(v10 + 1.0);
      *(float *)&v20 = v19 + v19;
      v21 = vrecpe_f32((float32x2_t)v20);
      v22 = vmul_f32(v21, vrecps_f32((float32x2_t)v20, v21));
      LODWORD(v23) = vmul_f32(v22, vrecps_f32((float32x2_t)v20, v22)).u32[0];
      v29 = vmuls_lane_f32(v23, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
      v30 = vmuls_n_f32(vsubq_f32(a5, (float32x4_t)vdupq_laneq_s32(a3, 2)).f32[0], v23);
      v31 = vmuls_n_f32(vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], v23);
      v32 = *(float *)&v20 * 0.25;
    }
    else if (*(float *)a3.i32 < *(float *)&a4.i32[1] || *(float *)a3.i32 < a5.f32[2])
    {
      v12 = 1.0 - *(float *)a3.i32;
      if (*(float *)&a4.i32[1] >= a5.f32[2])
      {
        v33 = sqrtf(*(float *)&a4.i32[1] + (float)(v12 - a5.f32[2]));
        *(float *)&v34 = v33 + v33;
        v35 = vrecpe_f32((float32x2_t)v34);
        v36 = vmul_f32(v35, vrecps_f32((float32x2_t)v34, v35));
        v17 = vmul_f32(v36, vrecps_f32((float32x2_t)v34, v36)).u32[0];
        v29 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], *(float *)&v17);
        v30 = *(float *)&v34 * 0.25;
        v31 = vmuls_lane_f32(*(float *)&v17, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
        v18 = vsubq_f32(a5, (float32x4_t)vdupq_laneq_s32(a3, 2)).u32[0];
      }
      else
      {
        v13 = sqrtf(a5.f32[2] + (float)(v12 - *(float *)&a4.i32[1]));
        *(float *)&v14 = v13 + v13;
        v15 = vrecpe_f32((float32x2_t)v14);
        v16 = vmul_f32(v15, vrecps_f32((float32x2_t)v14, v15));
        v17 = vmul_f32(v16, vrecps_f32((float32x2_t)v14, v16)).u32[0];
        v29 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(a3, 2), a5).f32[0], *(float *)&v17);
        v30 = vmuls_lane_f32(*(float *)&v17, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
        v31 = *(float *)&v14 * 0.25;
        v18 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).u32[0];
      }
      v32 = vmuls_n_f32(*(float *)&v18, *(float *)&v17);
    }
    else
    {
      v24 = sqrtf(*(float *)a3.i32 + (float)((float)(1.0 - *(float *)&a4.i32[1]) - a5.f32[2]));
      *(float *)&v25 = v24 + v24;
      v26 = vrecpe_f32((float32x2_t)v25);
      v27 = vmul_f32(v26, vrecps_f32((float32x2_t)v25, v26));
      LODWORD(v28) = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
      v29 = *(float *)&v25 * 0.25;
      v30 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a3.i8, 1), (float32x4_t)a4).f32[0], v28);
      v31 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(a3, 2), a5).f32[0], v28);
      v32 = vmuls_lane_f32(v28, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32(a4, 2), a5), 1);
    }
    v37 = *(uint64_t **)(result + 8);
    v38 = v37[1];
    v50 = v37 + 1;
    (*(void (**)(uint64_t *))(v38 + 16))(v37 + 1);
    v51 = 256;
    if (*v37)
    {
      sub_18F2B6BD0(v46);
      sub_18F2C69FC(v46);
      Current = CFAbsoluteTimeGetCurrent();
      v49 |= 1u;
      v48 = Current;
      v40 = v47;
      *(_BYTE *)(v47 + 56) |= 1u;
      *(double *)(v40 + 32) = a2;
      v41 = v47;
      *(_BYTE *)(v47 + 56) |= 4u;
      *(_DWORD *)(v41 + 44) = a6.n128_u32[0];
      v42 = v47;
      *(_BYTE *)(v47 + 56) |= 8u;
      *(_DWORD *)(v42 + 48) = a6.n128_u32[1];
      v43 = v47;
      *(_BYTE *)(v47 + 56) |= 0x10u;
      *(_DWORD *)(v43 + 52) = a6.n128_u32[2];
      __src[0] = v29;
      __src[1] = v30;
      __src[2] = v31;
      __src[3] = v32;
      sub_18F346988((char *)(v47 + 8), (char *)__src, (uint64_t)&v53, 4uLL);
      v44 = v47;
      *(_BYTE *)(v47 + 56) |= 2u;
      *(_DWORD *)(v44 + 40) = a8;
      sub_18F2A9EF0(*v37, (uint64_t)v46);
      sub_18F2B9670((PB::Base *)v46);
    }
    return (*(uint64_t (**)(uint64_t *))(v37[1] + 24))(v37 + 1);
  }
  return result;
}

- (void)feedGPSLocationWithTimestamp:(double)a3 course:(double)a4 speed:(double)a5 latitude:(double)a6 longitude:(double)a7 horizontalAccuracy:(double)a8
{
  CMMotionContextLogger *value;
  CFAbsoluteTime Current;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[251];
  uint64_t v23;
  char v24;

  if (self->_logMSL)
  {
    value = self->_logger.__ptr_.__value_;
    (*(void (**)(uint64_t, SEL))(*((_QWORD *)value + 1) + 16))((uint64_t)value + 8, a2);
    if (*(_QWORD *)value)
    {
      sub_18F2B6BD0(v22);
      sub_18F2C7424(v22);
      Current = CFAbsoluteTimeGetCurrent();
      v24 |= 1u;
      *(CFAbsoluteTime *)&v22[77] = Current;
      v16 = v23;
      *(_DWORD *)(v23 + 180) |= 0x800u;
      *(double *)(v16 + 96) = a3;
      v17 = v23;
      *(_DWORD *)(v23 + 180) |= 2u;
      *(double *)(v17 + 16) = a4;
      v18 = v23;
      *(_DWORD *)(v23 + 180) |= 0x200u;
      *(double *)(v18 + 80) = a5;
      v19 = v23;
      *(_DWORD *)(v23 + 180) |= 0x40u;
      *(double *)(v19 + 56) = a6;
      v20 = v23;
      *(_DWORD *)(v23 + 180) |= 0x80u;
      *(double *)(v20 + 64) = a7;
      v21 = v23;
      *(_DWORD *)(v23 + 180) |= 0x20u;
      *(double *)(v21 + 48) = a8;
      sub_18F2A9EF0(*(_QWORD *)value, (uint64_t)v22);
      sub_18F2B9670((PB::Base *)v22);
    }
    (*(void (**)(uint64_t))(*((_QWORD *)value + 1) + 24))((uint64_t)value + 8);
  }
}

- (void).cxx_destruct
{
  CMMotionContextSessionAnalyticsTracker *value;
  CMSitStandDetector *v4;
  CMDoTEstimatorInHandTexting *v5;
  CMDoTEstimatorHandSwing *v6;
  CMPdrEstimatorOnBody *v7;
  CMPdrEstimatorOnHead *v8;

  value = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x194001438](value, 0x1000C406BA0FAAELL);
  sub_18F342B14(&self->hmlModel, 0);
  v4 = self->_accessoryActivity.fSitStandDetector.__ptr_.__value_;
  if (v4)
    *((_OWORD *)v4 + 682) = 0u;
  *(_OWORD *)&self->_accessoryActivity.fAccessoryStepDetector.fCallbackInfo = 0u;
  sub_18F44CEA0((uint64_t *)&self->_accessoryActivity.fSitStandDetector, 0);
  v5 = self->_pdr.fPdrEstimatorTexting.__ptr_.__value_;
  self->_pdr.fPdrEstimatorTexting.__ptr_.__value_ = 0;
  if (v5)
    sub_18F346BF8((uint64_t)&self->_pdr.fPdrEstimatorTexting, (uint64_t)v5);
  v6 = self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_;
  self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_ = 0;
  if (v6)
    MEMORY[0x194001438](v6, 0x1060C40CBE98382);
  v7 = self->_pdr.fPdrEstimatorOnBody.__ptr_.__value_;
  self->_pdr.fPdrEstimatorOnBody.__ptr_.__value_ = 0;
  if (v7)
    sub_18F346C60((uint64_t)&self->_pdr.fPdrEstimatorOnBody, (uint64_t)v7);
  v8 = self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_;
  self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_ = 0;
  if (v8)
    sub_18F346A80((uint64_t)&self->_pdr.fPdrEstimatorOnHead, (uint64_t)v8);
  sub_18F346D8C((uint64_t **)&self->_logger, 0);
}

- (id).cxx_construct
{
  self->_logger.__ptr_.__value_ = 0;
  sub_18F3D53D4((uint64_t)&self->_pdr);
  self->_pdr.fAlgType = 0;
  *(_OWORD *)&self->_pdr.fDirectionalityDetector._lastStartImpulseTimestamp = 0u;
  self->_pdr.fDirectionalityDetector._lastStepDirectionRadians = NAN;
  self->_pdr.fDirectionalityDetector._lastPosition = 0u;
  *(_QWORD *)&self->_pdr.fDirectionalityDetector._inertialBuffer.fHeadAndSize.fHead = 0xF500000000;
  *(_OWORD *)&self->_pdr.fPdrEstimatorOnHead.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_pdr.fPdrEstimatorHandSwing.__ptr_.__value_ = 0u;
  sub_18F45FE08((uint64_t)&self->_accessoryActivity, 1);
  self->_result.step = 0;
  self->_result.startImpulse = NAN;
  self->_result.endImpulse = NAN;
  *(_QWORD *)&self->_result.stepsCount = 0;
  *(_QWORD *)self->_result.attitude.elements = 0;
  self->_result.speedMps = 0.0;
  *(_QWORD *)&self->_result.attitude.elements[2] = 0x3F80000000000000;
  self->hmlModel.__ptr_.__value_ = 0;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  return self;
}

@end
