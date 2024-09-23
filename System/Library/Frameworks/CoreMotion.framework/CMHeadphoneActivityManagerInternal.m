@implementation CMHeadphoneActivityManagerInternal

- (CMHeadphoneActivityManagerInternal)init
{
  CMHeadphoneActivityManagerInternal *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMHeadphoneActivityManagerInternal;
  v2 = -[CMHeadphoneActivityManagerInternal init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMHeadphoneMotionManager", v3);
    v2->_activityConnectionClient = 0;
    v2->_statusConnectionClient = 0;
    *(_WORD *)&v2->_activityActive = 0;
    *(_WORD *)&v2->_statusActive = 0;
    v2->_deviceConnected = 0;
    v2->_startTime = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMHeadphoneActivityManagerInternal;
  -[CMHeadphoneActivityManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)connectActivity
{
  RMConnectionClient *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activityConnectionClient)
  {
    v3 = (RMConnectionClient *)sub_18F386354((id *)[RMConnectionClient alloc], self->_dispatchQueue, CFSTR("com.apple.relatived.public"), &unk_1E2953F48);
    self->_activityConnectionClient = v3;
    sub_18F386A7C((uint64_t)v3);
  }
}

- (void)disconnectActivity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sub_18F386EAC((uint64_t)self->_activityConnectionClient);

  self->_activityConnectionClient = 0;
}

- (void)connectStatus
{
  RMConnectionClient *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusConnectionClient)
  {
    v3 = (RMConnectionClient *)sub_18F386354((id *)[RMConnectionClient alloc], self->_dispatchQueue, CFSTR("com.apple.relatived.status"), &unk_1E2958BB8);
    self->_statusConnectionClient = v3;
    sub_18F386A7C((uint64_t)v3);
  }
}

- (void)disconnectStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sub_18F386EAC((uint64_t)self->_statusConnectionClient);

  self->_statusConnectionClient = 0;
}

- (void)updatePreferences
{
  char *v3;
  CLSettings *value;
  char v5;
  CLSettings *v6;
  unique_ptr<CLSettings, std::default_delete<CLSettings>> *p_motionSettings;
  BOOL v8;
  int v9;
  float v10;
  uint64_t v11;
  int v12;
  float v13;
  uint64_t v14;
  int v15;
  float v16;
  uint64_t v17;
  int v18;
  float v19;
  NSObject *v20;
  const char *v21;
  double accessoryAccelInterval;
  double accessoryGyroInterval;
  double accessoryDeviceMotionInterval;
  double sourceDeviceMotionInterval;
  char *v26;
  _BYTE buf[12];
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (char *)operator new();
  sub_18F20CC1C(v3, CFSTR("com.apple.CoreMotion"), 1);
  value = self->_motionSettings.__ptr_.__value_;
  self->_motionSettings.__ptr_.__value_ = (CLSettings *)v3;
  if (value)
  {
    (*(void (**)(CLSettings *))(*(_QWORD *)value + 8))(value);
    v3 = (char *)self->_motionSettings.__ptr_.__value_;
  }
  buf[0] = 0;
  v5 = sub_18F1EE9B4((uint64_t)v3, (uint64_t)CFSTR("HeadphoneActivityEnableMSL"), buf);
  p_motionSettings = &self->_motionSettings;
  v6 = self->_motionSettings.__ptr_.__value_;
  if (buf[0])
    v8 = v5;
  else
    v8 = 0;
  self->_enableMSL = v8;
  *(_QWORD *)buf = 0;
  v9 = sub_18F1EEBEC((uint64_t)v6, (uint64_t)CFSTR("HeadphoneActivityAccelInterval"), buf);
  v10 = *(double *)buf;
  if (!v9)
    v10 = 0.0;
  self->_accessoryAccelInterval = v10;
  v11 = (uint64_t)p_motionSettings->__ptr_.__value_;
  *(_QWORD *)buf = 0;
  v12 = sub_18F1EEBEC(v11, (uint64_t)CFSTR("HeadphoneActivityGyroInterval"), buf);
  v13 = *(double *)buf;
  if (!v12)
    v13 = 0.0;
  self->_accessoryGyroInterval = v13;
  v14 = (uint64_t)p_motionSettings->__ptr_.__value_;
  *(_QWORD *)buf = 0;
  v15 = sub_18F1EEBEC(v14, (uint64_t)CFSTR("HeadphoneActivitySourceDeviceMotionInterval"), buf);
  v16 = *(double *)buf;
  if (!v15)
    v16 = 0.005;
  self->_sourceDeviceMotionInterval = v16;
  v17 = (uint64_t)p_motionSettings->__ptr_.__value_;
  *(_QWORD *)buf = 0;
  v18 = sub_18F1EEBEC(v17, (uint64_t)CFSTR("HeadphoneActivityDeviceMotionInterval"), buf);
  v19 = *(double *)buf;
  if (!v18)
    v19 = *(float *)"\nף<";
  self->_accessoryDeviceMotionInterval = v19;
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E2958C20);
  v20 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEFAULT))
  {
    v21 = "Enabled";
    if (!self->_enableMSL)
      v21 = "Disabled";
    accessoryAccelInterval = self->_accessoryAccelInterval;
    accessoryGyroInterval = self->_accessoryGyroInterval;
    accessoryDeviceMotionInterval = self->_accessoryDeviceMotionInterval;
    sourceDeviceMotionInterval = self->_sourceDeviceMotionInterval;
    *(_DWORD *)buf = 136447234;
    *(_QWORD *)&buf[4] = v21;
    v28 = 2050;
    v29 = accessoryAccelInterval;
    v30 = 2050;
    v31 = accessoryGyroInterval;
    v32 = 2050;
    v33 = accessoryDeviceMotionInterval;
    v34 = 2050;
    v35 = sourceDeviceMotionInterval;
    _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneActivityManager] Preference,MSL,%{public}s,accel,%{public}.3f,gyro,%{public}.3f,devicemotion,%{public}.3f,source devicemotion,%{public}.3f", buf, 0x34u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E2958C20);
    v26 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal updatePreferences]", "CoreLocation: %s\n", v26);
    if (v26 != buf)
      free(v26);
  }
}

- (BOOL)mslLoggingEnabledPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend_updatePreferences(self, v3, v4, v5, v6);
  return self->_enableMSL;
}

- (void)startMslLoggingPrivateWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  Dispatcher *v21;
  Dispatcher *value;
  Dispatcher *v23;
  Dispatcher *v24;
  Dispatcher *v25;
  Dispatcher *v26;
  uint64_t v27;
  Dispatcher *v28;
  Dispatcher *v29;
  uint64_t v30;
  CLDeviceMotionProperties *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  Dispatcher *v36;
  id v37;
  Dispatcher *v38;
  uint64_t v39;
  Dispatcher *v40;
  float sourceDeviceMotionInterval;
  uint64_t v42;
  char *v43;
  uint8_t buf[8];
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  uint64_t v48;
  Dispatcher *v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend_updatePreferences(self, v7, v8, v9, v10);
  if (self->_enableMSL)
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
    v11 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneActivityManager] Starting MSL Logging", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal startMslLoggingPrivateWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
    v15 = (char *)objc_msgSend_cStringUsingEncoding_(a3, v12, 1, v13, v14);
    v19 = (char *)objc_msgSend_cStringUsingEncoding_(a4, v16, 1, v17, v18);
    v20 = (uint64_t *)operator new();
    sub_18F3620E4((uint64_t)v20, v15, v19);
    sub_18F346D8C((uint64_t **)&self->fLogger, v20);
    if (!self->_accessoryAccelerometerDispatcher.__ptr_.__value_)
    {
      v21 = (Dispatcher *)operator new();
      v21->var0 = (void **)off_1E294C238;
      v21->var0 = (void **)&off_1E294C740;
      v21->var1 = 0;
      v21[1].var0 = (void **)sub_18F48B270;
      v21[1].var1 = self;
      value = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
      self->_accessoryAccelerometerDispatcher.__ptr_.__value_ = v21;
      if (value)
        (*((void (**)(Dispatcher *))value->var0 + 1))(value);
      if (qword_1EE16E9D8 != -1)
        dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
      sub_18F1F4F0C(qword_1EE16E9D0, 0, (uint64_t)self->_accessoryAccelerometerDispatcher.__ptr_.__value_, self->_accessoryAccelInterval);
    }
    if (!self->_accessoryGyroDispatcher.__ptr_.__value_)
    {
      v23 = (Dispatcher *)operator new();
      v23->var0 = (void **)off_1E294C238;
      v23->var0 = (void **)&off_1E294C3F8;
      v23->var1 = 0;
      v23[1].var0 = (void **)sub_18F48B28C;
      v23[1].var1 = self;
      v24 = self->_accessoryGyroDispatcher.__ptr_.__value_;
      self->_accessoryGyroDispatcher.__ptr_.__value_ = v23;
      if (v24)
        (*((void (**)(Dispatcher *))v24->var0 + 1))(v24);
      if (qword_1EE16EA10 != -1)
        dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
      sub_18F1F4F0C(qword_1EE16EA08, 0, (uint64_t)self->_accessoryGyroDispatcher.__ptr_.__value_, self->_accessoryGyroInterval);
    }
    if (!self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
    {
      v25 = (Dispatcher *)operator new();
      v25->var0 = (void **)off_1E294C238;
      v25->var0 = (void **)&off_1E294C660;
      v25->var1 = 0;
      v25[1].var0 = (void **)sub_18F48B2A8;
      v25[1].var1 = self;
      v26 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = v25;
      if (v26)
        (*((void (**)(Dispatcher *))v26->var0 + 1))(v26);
      v27 = sub_18F4317A8();
      sub_18F1F4F0C(v27, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_, self->_accessoryDeviceMotionInterval);
    }
    if (!self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
    {
      v28 = (Dispatcher *)operator new();
      v28->var0 = (void **)off_1E294C238;
      v28->var0 = (void **)&off_1E294C698;
      v28->var1 = 0;
      v28[1].var0 = (void **)sub_18F48B2B4;
      v28[1].var1 = self;
      v29 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = v28;
      if (v29)
        (*((void (**)(Dispatcher *))v29->var0 + 1))(v29);
      v30 = sub_18F4317A8();
      sub_18F1F4F0C(v30, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_, -1.0);
    }
    if (!self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      v31 = [CLDeviceMotionProperties alloc];
      v35 = (void *)objc_msgSend_initWithMode_(v31, v32, 3, v33, v34);
      v36 = (Dispatcher *)operator new();
      v36->var0 = (void **)off_1E294C238;
      v37 = v35;
      v36->var0 = (void **)&off_1E294C350;
      v36->var1 = v37;
      v36[1].var0 = (void **)sub_18F48B504;
      v36[1].var1 = self;
      v38 = self->_deviceMotionDispatcher.__ptr_.__value_;
      self->_deviceMotionDispatcher.__ptr_.__value_ = v36;
      if (v38)
        (*((void (**)(Dispatcher *))v38->var0 + 1))(v38);
      v39 = sub_18F1FE420();
      v40 = self->_deviceMotionDispatcher.__ptr_.__value_;
      sourceDeviceMotionInterval = self->_sourceDeviceMotionInterval;
      v42 = sub_18F204AE4();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = sub_18F1F998C;
      v47 = &unk_1E2956F80;
      v48 = v39;
      v49 = v40;
      v50 = sourceDeviceMotionInterval;
      sub_18F1F5E28(v42, (uint64_t)buf);

    }
    self->_isGyroBiasValid = 0;
  }
}

- (void)stopMslLoggingPrivate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  Dispatcher *value;
  uint64_t v7;
  Dispatcher *v8;
  uint64_t v9;
  Dispatcher *v10;
  uint64_t v11;
  Dispatcher *v12;
  uint64_t v13;
  Dispatcher *v14;
  uint64_t v15;
  Dispatcher *v16;
  uint64_t v17;
  Dispatcher *v18;
  uint64_t v19;
  Dispatcher *v20;
  uint64_t v21;
  Dispatcher *v22;
  uint64_t v23;
  Dispatcher *v24;
  char *v25;
  uint8_t buf[8];
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  Dispatcher *v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_enableMSL)
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
    v3 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneActivityManager] Stopping MSL Logging.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal stopMslLoggingPrivate]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
    v4 = MEMORY[0x1E0C809B0];
    if (self->_accessoryAccelerometerDispatcher.__ptr_.__value_)
    {
      if (qword_1EE16E9D8 != -1)
        dispatch_once(&qword_1EE16E9D8, &unk_1E2953D28);
      v5 = qword_1EE16E9D0;
      value = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
      v7 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v27 = 3221225472;
      v28 = sub_18F1F5EE0;
      v29 = &unk_1E2956E98;
      v32 = 0;
      v30 = v5;
      v31 = value;
      sub_18F1F5E28(v7, (uint64_t)buf);
      v8 = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
      self->_accessoryAccelerometerDispatcher.__ptr_.__value_ = 0;
      if (v8)
        (*((void (**)(Dispatcher *))v8->var0 + 1))(v8);
    }
    if (self->_accessoryGyroDispatcher.__ptr_.__value_)
    {
      if (qword_1EE16EA10 != -1)
        dispatch_once(&qword_1EE16EA10, &unk_1E29544E8);
      v9 = qword_1EE16EA08;
      v10 = self->_accessoryGyroDispatcher.__ptr_.__value_;
      v11 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v27 = 3221225472;
      v28 = sub_18F1F5EE0;
      v29 = &unk_1E2956E98;
      v32 = 0;
      v30 = v9;
      v31 = v10;
      sub_18F1F5E28(v11, (uint64_t)buf);
      v12 = self->_accessoryGyroDispatcher.__ptr_.__value_;
      self->_accessoryGyroDispatcher.__ptr_.__value_ = 0;
      if (v12)
        (*((void (**)(Dispatcher *))v12->var0 + 1))(v12);
    }
    if (self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
    {
      v13 = sub_18F4317A8();
      v14 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
      v15 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v27 = 3221225472;
      v28 = sub_18F1F5EE0;
      v29 = &unk_1E2956E98;
      v32 = 0;
      v30 = v13;
      v31 = v14;
      sub_18F1F5E28(v15, (uint64_t)buf);
      v16 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
      if (v16)
        (*((void (**)(Dispatcher *))v16->var0 + 1))(v16);
    }
    if (self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
    {
      v17 = sub_18F4317A8();
      v18 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      v19 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v27 = 3221225472;
      v28 = sub_18F1F5EE0;
      v29 = &unk_1E2956E98;
      v32 = 1;
      v30 = v17;
      v31 = v18;
      sub_18F1F5E28(v19, (uint64_t)buf);
      v20 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
      if (v20)
        (*((void (**)(Dispatcher *))v20->var0 + 1))(v20);
    }
    if (self->_deviceMotionDispatcher.__ptr_.__value_)
    {
      v21 = sub_18F1FE420();
      v22 = self->_deviceMotionDispatcher.__ptr_.__value_;
      v23 = sub_18F204AE4();
      *(_QWORD *)buf = v4;
      v27 = 3221225472;
      v28 = sub_18F1FA1A4;
      v29 = &unk_1E2958238;
      v30 = v21;
      v31 = v22;
      sub_18F1F5E28(v23, (uint64_t)buf);
      v24 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
      self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
      if (v24)
        (*((void (**)(Dispatcher *))v24->var0 + 1))(v24);
    }
    sub_18F346D8C((uint64_t **)&self->fLogger, 0);
  }
}

- (void)onAudioAccessoryDeviceMotion:(const void *)a3
{
  uint64_t *value;
  NSObject *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  _DWORD *v12;
  char *v13;
  uint8_t buf[8];
  _BYTE v15[20];
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  value = (uint64_t *)self->fLogger.__ptr_.__value_;
  if (value)
    sub_18F3626E0(value, (int *)a3);
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E2958C20);
  v6 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_DEBUG))
  {
    v7 = *((unsigned __int8 *)a3 + 141);
    v8 = *((float *)a3 + 32);
    v9 = *((float *)a3 + 33);
    v10 = *((float *)a3 + 34);
    *(_DWORD *)buf = 67240961;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)v15 = 2049;
    *(double *)&v15[2] = v8;
    *(_WORD *)&v15[10] = 2049;
    *(double *)&v15[12] = v9;
    v16 = 2049;
    v17 = v10;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEBUG, "[CMHeadphoneActivityManager] Received DM6 packet,activity,%{public}u,gyro bias,[%{private}.4f,%{private}.4f,%{private}.4f]", buf, 0x26u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E2958C20);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMHeadphoneActivityManagerInternal onAudioAccessoryDeviceMotion:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  if (!self->_isGyroBiasValid && *((_BYTE *)a3 + 140))
  {
    v11 = *((_DWORD *)a3 + 34);
    v12 = operator new(0x10uLL);
    *(_QWORD *)buf = v12;
    *(_QWORD *)&v15[8] = v12 + 4;
    *(_QWORD *)v12 = *((_QWORD *)a3 + 16);
    v12[2] = v11;
    v12[3] = 1106247680;
    *(_QWORD *)v15 = v12 + 4;
    if (self->fLogger.__ptr_.__value_)
    {
      sub_18F365BD4();
      v12 = *(_DWORD **)buf;
      self->_isGyroBiasValid = 1;
      if (!v12)
        return;
    }
    else
    {
      self->_isGyroBiasValid = 1;
    }
    *(_QWORD *)v15 = v12;
    operator delete(v12);
  }
}

- (void).cxx_destruct
{
  Dispatcher *value;
  Dispatcher *v4;
  Dispatcher *v5;
  Dispatcher *v6;
  Dispatcher *v7;
  CLSettings *v8;

  sub_18F346D8C((uint64_t **)&self->fLogger, 0);
  value = self->_deviceMotionDispatcher.__ptr_.__value_;
  self->_deviceMotionDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(Dispatcher *))value->var0 + 1))(value);
  v4 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*((void (**)(Dispatcher *))v4->var0 + 1))(v4);
  v5 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v5)
    (*((void (**)(Dispatcher *))v5->var0 + 1))(v5);
  v6 = self->_accessoryGyroDispatcher.__ptr_.__value_;
  self->_accessoryGyroDispatcher.__ptr_.__value_ = 0;
  if (v6)
    (*((void (**)(Dispatcher *))v6->var0 + 1))(v6);
  v7 = self->_accessoryAccelerometerDispatcher.__ptr_.__value_;
  self->_accessoryAccelerometerDispatcher.__ptr_.__value_ = 0;
  if (v7)
    (*((void (**)(Dispatcher *))v7->var0 + 1))(v7);
  v8 = self->_motionSettings.__ptr_.__value_;
  self->_motionSettings.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(CLSettings *))(*(_QWORD *)v8 + 8))(v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  return self;
}

@end
