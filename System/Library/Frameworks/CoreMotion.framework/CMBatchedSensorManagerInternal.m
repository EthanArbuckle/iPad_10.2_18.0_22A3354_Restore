@implementation CMBatchedSensorManagerInternal

+ (BOOL)areBatchedSensorsSupported
{
  sub_18F1F77DC();
  return 0;
}

- (CMBatchedSensorManagerInternal)init
{
  CMBatchedSensorManagerInternal *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CMBatchedSensorManagerInternal *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMBatchedSensorManagerInternal;
  v2 = -[CMBatchedSensorManagerInternal init](&v15, sel_init);
  v6 = v2;
  if (v2)
  {
    v2->_accelHandler = 0;
    v2->_queue = 0;
    v2->_dataQueue = 0;
    v2->_connection = 0;
    v2->_available = 0;
    objc_msgSend_setAccelBatch_(v2, v3, 0, v4, v5);
    v6->_deviceMotionHandler = 0;
    objc_msgSend_setDeviceMotionBatch_(v6, v7, 0, v8, v9);
    objc_msgSend__connect(v6, v10, v11, v12, v13);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend_setAccelBatch_(self, a2, 0, v2, v3);
  objc_msgSend_setDeviceMotionBatch_(self, v5, 0, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)CMBatchedSensorManagerInternal;
  -[CMBatchedSensorManagerInternal dealloc](&v8, sel_dealloc);
}

- (void)_connect
{
  void *v3;
  uint64_t v4;
  const char *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  _QWORD v14[11];
  void *__p;
  std::__shared_weak_count *v16;
  char v17;
  void *v18[2];
  char v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!self->_connection)
  {
    self->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMBatchedSensorManager.Internal", 0);
    v3 = (void *)operator new();
    sub_18F270374(v18, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, v18, self->_queue);
    self->_connection = v3;
    if (v19 < 0)
      operator delete(v18[0]);
    self->_dataQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMBatchedSensorManager.Data", 0);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start((CLConnectionClient *)self->_connection);
    dispatch_sync((dispatch_queue_t)self->_queue, &unk_1E29553E8);
    sub_18F270374(&__p, "kCLConnectionMessageBatchedSensorAvailabilityUpdate");
    v4 = MEMORY[0x1E0C809B0];
    v14[6] = MEMORY[0x1E0C809B0];
    v14[7] = 3221225472;
    v14[8] = sub_18F4CF864;
    v14[9] = &unk_1E2955DD8;
    v14[10] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v17 < 0)
      operator delete(__p);
    sub_18F270374(&__p, "kCLConnectionMessageBatchedSensorError");
    v14[1] = v4;
    v14[2] = 3221225472;
    v14[3] = sub_18F4CFA34;
    v14[4] = &unk_1E2955DD8;
    v14[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v17 < 0)
      operator delete(__p);
    v20 = CFSTR("kCLConnectionMessageSubscribeKey");
    v21[0] = MEMORY[0x1E0C9AAB0];
    v14[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v21, (uint64_t)&v20, 1);
    sub_18F4850E8("kCLConnectionMessageBatchedSensorAvailabilityUpdate", v14, &__p);
    v13 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v13)
    {
      v8 = (unint64_t *)&v13->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v10 = v16;
    if (v16)
    {
      v11 = (unint64_t *)&v16->__shared_owners_;
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

- (void)_teardown
{
  uint64_t v3;
  void *__p[2];
  char v5;

  sub_18F270374(__p, "kCLConnectionMessageBatchedSensorAvailabilityUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p[0]);
  sub_18F270374(__p, "kCLConnectionMessageBatchedAccelerometer");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p[0]);
  sub_18F270374(__p, "kCLConnectionMessageBatchedSensorError");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p[0]);
  sub_18F270374(__p, "kCLConnectionMessageBatchedDeviceMotion");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p[0]);
  if (self->_connection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
    self->_connection = 0;
  }

  self->_queue = 0;
  self->_dataQueue = 0;
}

- (void)_startAccelerometerUpdates
{
  ((void (*)(CMBatchedSensorManagerInternal *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__startAccelerometerUpdatesWithHandler_, 0);
}

- (void)_startAccelerometerUpdatesWithHandler:(id)a3
{
  NSObject *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id accelHandler;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *dataQueue;
  NSObject *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  std::__shared_weak_count *v40;
  _QWORD block[5];
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[8];
  std::__shared_weak_count *v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v5 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v6, v7, v8, v9, v10);
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[framework-accel] attempting to start updates to queue, supported %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v32 = (void *)objc_opt_class();
    LODWORD(v44) = 67109120;
    HIDWORD(v44) = objc_msgSend_areBatchedSensorsSupported(v32, v33, v34, v35, v36);
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf)
      free(v37);
  }
  v11 = (void *)objc_opt_class();
  if ((objc_msgSend_areBatchedSensorsSupported(v11, v12, v13, v14, v15) & 1) != 0)
  {
    accelHandler = self->_accelHandler;
    if (accelHandler != a3)
    {

      self->_accelHandler = (id)objc_msgSend_copy(a3, v17, v18, v19, v20);
    }
    if (self->_connection)
    {
      if (qword_1EE16D948 != -1)
        dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
      v21 = qword_1EE16D950;
      if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEFAULT, "[framework-accel] starting updates to queue", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D948 != -1)
          dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
        LOWORD(v44) = 0;
        v38 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v38);
        if (v38 != (char *)buf)
          free(v38);
      }
      sub_18F270374(buf, "kCLConnectionMessageBatchedAccelerometer");
      CLConnectionClient::setHandlerForMessage();
      if (v47 < 0)
        operator delete(*(void **)buf);
      v42 = CFSTR("kCLConnectionMessageSubscribeKey");
      v43 = MEMORY[0x1E0C9AAB0];
      v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)&v43, (uint64_t)&v42, 1);
      sub_18F352D1C("kCLConnectionMessageBatchedAccelerometer", &v44, buf);
      v40 = v46;
      if (v46)
      {
        p_shared_owners = (unint64_t *)&v46->__shared_owners_;
        do
          v24 = __ldxr(p_shared_owners);
        while (__stxr(v24 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v40)
      {
        v25 = (unint64_t *)&v40->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      v27 = v46;
      if (v46)
      {
        v28 = (unint64_t *)&v46->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
    else
    {
      if (qword_1EE16D948 != -1)
        dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
      v31 = qword_1EE16D950;
      if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_ERROR, "framework-accel] no connection", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D948 != -1)
          dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
        LOWORD(v44) = 0;
        v39 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMBatchedSensorManagerInternal _startAccelerometerUpdatesWithHandler:]", "CoreLocation: %s\n", v39);
        if (v39 != (char *)buf)
          free(v39);
      }
    }
    self->_accelActive = 1;
  }
  else if (a3)
  {
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4D04D4;
    block[3] = &unk_1E2955B10;
    block[4] = a3;
    dispatch_async(dataQueue, block);
  }
}

- (void)_stopAccelerometerUpdates
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id accelHandler;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  std::__shared_weak_count *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[8];
  std::__shared_weak_count *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v3 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v4, v5, v6, v7, v8);
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[framework-accel] stopping updates, supported %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v25 = (void *)objc_opt_class();
    LODWORD(v34) = 67109120;
    HIDWORD(v34) = objc_msgSend_areBatchedSensorsSupported(v25, v26, v27, v28, v29);
    v30 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _stopAccelerometerUpdates]", "CoreLocation: %s\n", v30);
    if (v30 != (char *)buf)
      free(v30);
  }
  v9 = (void *)objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v9, v10, v11, v12, v13))
  {
    accelHandler = self->_accelHandler;
    if (accelHandler)
    {

      self->_accelHandler = 0;
    }
    if (self->_connection)
    {
      v32 = CFSTR("kCLConnectionMessageSubscribeKey");
      v33 = MEMORY[0x1E0C9AAA0];
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)&v33, (uint64_t)&v32, 1);
      sub_18F352D1C("kCLConnectionMessageBatchedAccelerometer", &v34, buf);
      v31 = v36;
      if (v36)
      {
        p_shared_owners = (unint64_t *)&v36->__shared_owners_;
        do
          v19 = __ldxr(p_shared_owners);
        while (__stxr(v19 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        v20 = (unint64_t *)&v31->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v22 = v36;
      if (v36)
      {
        v23 = (unint64_t *)&v36->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
    self->_accelActive = 0;
    objc_msgSend_setAccelBatch_(self, v14, 0, v15, v16);
  }
}

+ (id)_newArrayByUnpackingAccelerometerBatch:(shared_ptr<CLConnectionMessage>)a3
{
  id v3;
  int length;
  int v5;
  NSObject *v6;
  void *v7;
  size_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  size_t bytes;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  void *v17;
  CMAccelerometerData *v18;
  double v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *Object;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  uint8_t buf[4];
  int v204;
  _BYTE v205[12];
  unint64_t v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  __int16 v211;
  uint64_t v212;
  __int16 v213;
  uint64_t v214;
  __int16 v215;
  uint64_t v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  uint64_t v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  int v224;
  uint64_t v225;

  v225 = *MEMORY[0x1E0C80C00];
  v3 = (id)CLConnectionMessage::getRawPayload(*(CLConnectionMessage **)a3.var0);
  xpc_data_get_bytes_ptr(v3);
  length = xpc_data_get_length(v3);
  v5 = length / 20;
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v6 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    v204 = length;
    *(_WORD *)v205 = 1026;
    *(_DWORD *)&v205[2] = length / 20;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[framework-accel] Received msg size %{public}d num %{public}d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v125 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingAccelerometerBatch:]", "CoreLocation: %s\n", v125);
    if (v125 != (char *)buf)
      free(v125);
  }
  v7 = (void *)objc_opt_new();
  if (length < 20)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      bytes = xpc_data_get_bytes(v3, buf, v8, 0x14uLL);
      v13 = *(_DWORD *)buf;
      v14 = v204;
      v15 = *(_DWORD *)v205;
      v8 += 20;
      v16 = *(_QWORD *)&v205[4];
      v17 = (void *)MEMORY[0x194001B4C](bytes);
      v18 = [CMAccelerometerData alloc];
      LODWORD(v19) = v13;
      LODWORD(v20) = v14;
      LODWORD(v21) = v15;
      v26 = (id)objc_msgSend_initWithAcceleration_andTimestamp_(v18, v22, v23, v24, v25, v19, v20, v21, (double)v16 * 0.000000999999997);
      objc_msgSend_addObject_(v7, v27, (uint64_t)v26, v28, v29);
      objc_autoreleasePoolPop(v17);
      if (v11)
        v10 = v16;
      else
        v9 = v16;
      ++v11;
    }
    while (v5 != v11);
  }
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v30 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    Object = (void *)objc_msgSend_firstObject(v7, v31, v32, v33, v34);
    objc_msgSend_timestamp(Object, v36, v37, v38, v39);
    v41 = v40;
    v46 = (void *)objc_msgSend_lastObject(v7, v42, v43, v44, v45);
    objc_msgSend_timestamp(v46, v47, v48, v49, v50);
    v52 = v51;
    v57 = (void *)objc_msgSend_firstObject(v7, v53, v54, v55, v56);
    objc_msgSend_acceleration(v57, v58, v59, v60, v61);
    v63 = v62;
    v68 = (void *)objc_msgSend_firstObject(v7, v64, v65, v66, v67);
    objc_msgSend_acceleration(v68, v69, v70, v71, v72);
    v74 = v73;
    v79 = (void *)objc_msgSend_firstObject(v7, v75, v76, v77, v78);
    objc_msgSend_acceleration(v79, v80, v81, v82, v83);
    v85 = v84;
    v90 = (void *)objc_msgSend_lastObject(v7, v86, v87, v88, v89);
    objc_msgSend_acceleration(v90, v91, v92, v93, v94);
    v96 = v95;
    v101 = (void *)objc_msgSend_lastObject(v7, v97, v98, v99, v100);
    objc_msgSend_acceleration(v101, v102, v103, v104, v105);
    v107 = v106;
    v112 = (void *)objc_msgSend_lastObject(v7, v108, v109, v110, v111);
    objc_msgSend_acceleration(v112, v113, v114, v115, v116);
    v118 = v117;
    v123 = objc_msgSend_count(v7, v119, v120, v121, v122);
    *(_DWORD *)buf = 67243008;
    v204 = v5;
    *(_WORD *)v205 = 2050;
    *(_QWORD *)&v205[2] = v9;
    *(_WORD *)&v205[10] = 2050;
    v206 = v10;
    v207 = 2050;
    v208 = v41;
    v209 = 2050;
    v210 = v52;
    v211 = 2050;
    v212 = v63;
    v213 = 2050;
    v214 = v74;
    v215 = 2050;
    v216 = v85;
    v217 = 2050;
    v218 = v96;
    v219 = 2050;
    v220 = v107;
    v221 = 2050;
    v222 = v118;
    v223 = 1026;
    v224 = v123;
    _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_DEFAULT, "[framework-accel] Looped %{public}d times range [%{public}llu %{public}llu], timeS [%{public}f %{public}f], first sample [%{public}f %{public}f %{public}f], last sample [%{public}f %{public}f %{public}f], size %{public}d", buf, 0x72u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v130 = (void *)objc_msgSend_firstObject(v7, v126, v127, v128, v129);
    objc_msgSend_timestamp(v130, v131, v132, v133, v134);
    v139 = (void *)objc_msgSend_lastObject(v7, v135, v136, v137, v138);
    objc_msgSend_timestamp(v139, v140, v141, v142, v143);
    v148 = (void *)objc_msgSend_firstObject(v7, v144, v145, v146, v147);
    objc_msgSend_acceleration(v148, v149, v150, v151, v152);
    v157 = (void *)objc_msgSend_firstObject(v7, v153, v154, v155, v156);
    objc_msgSend_acceleration(v157, v158, v159, v160, v161);
    v166 = (void *)objc_msgSend_firstObject(v7, v162, v163, v164, v165);
    objc_msgSend_acceleration(v166, v167, v168, v169, v170);
    v175 = (void *)objc_msgSend_lastObject(v7, v171, v172, v173, v174);
    objc_msgSend_acceleration(v175, v176, v177, v178, v179);
    v184 = (void *)objc_msgSend_lastObject(v7, v180, v181, v182, v183);
    objc_msgSend_acceleration(v184, v185, v186, v187, v188);
    v193 = (void *)objc_msgSend_lastObject(v7, v189, v190, v191, v192);
    objc_msgSend_acceleration(v193, v194, v195, v196, v197);
    objc_msgSend_count(v7, v198, v199, v200, v201);
    v202 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingAccelerometerBatch:]", "CoreLocation: %s\n", v202);
    if (v202 != (char *)buf)
      free(v202);
  }

  return v7;
}

- (void)_startDeviceMotionUpdates
{
  ((void (*)(CMBatchedSensorManagerInternal *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__startDeviceMotionUpdatesWithHandler_, 0);
}

- (void)_startDeviceMotionUpdatesWithHandler:(id)a3
{
  NSObject *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id deviceMotionHandler;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *dataQueue;
  NSObject *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  std::__shared_weak_count *v40;
  _QWORD block[5];
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[8];
  std::__shared_weak_count *v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v5 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v6, v7, v8, v9, v10);
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[framework-dm] attempting to start updates to queue, supported %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v32 = (void *)objc_opt_class();
    LODWORD(v44) = 67109120;
    HIDWORD(v44) = objc_msgSend_areBatchedSensorsSupported(v32, v33, v34, v35, v36);
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf)
      free(v37);
  }
  v11 = (void *)objc_opt_class();
  if ((objc_msgSend_areBatchedSensorsSupported(v11, v12, v13, v14, v15) & 1) != 0)
  {
    deviceMotionHandler = self->_deviceMotionHandler;
    if (deviceMotionHandler != a3)
    {

      self->_deviceMotionHandler = (id)objc_msgSend_copy(a3, v17, v18, v19, v20);
    }
    if (self->_connection)
    {
      if (qword_1EE16D948 != -1)
        dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
      v21 = qword_1EE16D950;
      if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEFAULT, "[framework-dm] starting updates to queue", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D948 != -1)
          dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
        LOWORD(v44) = 0;
        v38 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v38);
        if (v38 != (char *)buf)
          free(v38);
      }
      sub_18F270374(buf, "kCLConnectionMessageBatchedDeviceMotion");
      CLConnectionClient::setHandlerForMessage();
      if (v47 < 0)
        operator delete(*(void **)buf);
      v42 = CFSTR("kCLConnectionMessageSubscribeKey");
      v43 = MEMORY[0x1E0C9AAB0];
      v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)&v43, (uint64_t)&v42, 1);
      sub_18F3515BC("kCLConnectionMessageBatchedDeviceMotion", &v44, buf);
      v40 = v46;
      if (v46)
      {
        p_shared_owners = (unint64_t *)&v46->__shared_owners_;
        do
          v24 = __ldxr(p_shared_owners);
        while (__stxr(v24 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v40)
      {
        v25 = (unint64_t *)&v40->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      v27 = v46;
      if (v46)
      {
        v28 = (unint64_t *)&v46->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
    else
    {
      if (qword_1EE16D948 != -1)
        dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
      v31 = qword_1EE16D950;
      if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_ERROR, "framework-dm] no connection", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D948 != -1)
          dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
        LOWORD(v44) = 0;
        v39 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMBatchedSensorManagerInternal _startDeviceMotionUpdatesWithHandler:]", "CoreLocation: %s\n", v39);
        if (v39 != (char *)buf)
          free(v39);
      }
    }
    self->_deviceMotionActive = 1;
  }
  else if (a3)
  {
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4D1704;
    block[3] = &unk_1E2955B10;
    block[4] = a3;
    dispatch_async(dataQueue, block);
  }
}

- (void)_stopDeviceMotionUpdates
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id deviceMotionHandler;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  std::__shared_weak_count *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[8];
  std::__shared_weak_count *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v3 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend_areBatchedSensorsSupported(v4, v5, v6, v7, v8);
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "[framework-dm] stopping updates, supported %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v25 = (void *)objc_opt_class();
    LODWORD(v34) = 67109120;
    HIDWORD(v34) = objc_msgSend_areBatchedSensorsSupported(v25, v26, v27, v28, v29);
    v30 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMBatchedSensorManagerInternal _stopDeviceMotionUpdates]", "CoreLocation: %s\n", v30);
    if (v30 != (char *)buf)
      free(v30);
  }
  v9 = (void *)objc_opt_class();
  if (objc_msgSend_areBatchedSensorsSupported(v9, v10, v11, v12, v13))
  {
    deviceMotionHandler = self->_deviceMotionHandler;
    if (deviceMotionHandler)
    {

      self->_deviceMotionHandler = 0;
    }
    if (self->_connection)
    {
      v32 = CFSTR("kCLConnectionMessageSubscribeKey");
      v33 = MEMORY[0x1E0C9AAA0];
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)&v33, (uint64_t)&v32, 1);
      sub_18F3515BC("kCLConnectionMessageBatchedDeviceMotion", &v34, buf);
      v31 = v36;
      if (v36)
      {
        p_shared_owners = (unint64_t *)&v36->__shared_owners_;
        do
          v19 = __ldxr(p_shared_owners);
        while (__stxr(v19 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v31)
      {
        v20 = (unint64_t *)&v31->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v22 = v36;
      if (v36)
      {
        v23 = (unint64_t *)&v36->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
    self->_deviceMotionActive = 0;
    objc_msgSend_setDeviceMotionBatch_(self, v14, 0, v15, v16);
  }
}

+ (id)_newArrayByUnpackingDeviceMotionBatch:(shared_ptr<CLConnectionMessage>)a3
{
  id v3;
  int length;
  uint64_t v5;
  NSObject *v6;
  size_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  size_t bytes;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  float32x2_t v18;
  id v19;
  uint64_t v20;
  CMDeviceMotion *v21;
  __int128 v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *Object;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  char *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  char *v220;
  void *v221;
  uint64_t v222;
  uint64_t v223;
  double v224;
  float64x2_t v225;
  double v226;
  int v227;
  __int128 v228;
  int v229;
  __int128 v230;
  __int128 v231;
  int v232;
  int v233;
  __int16 v234;
  unint64_t v235;
  __int16 v236;
  unint64_t v237;
  __int16 v238;
  uint64_t v239;
  __int16 v240;
  uint64_t v241;
  __int16 v242;
  uint64_t v243;
  __int16 v244;
  uint64_t v245;
  __int16 v246;
  uint64_t v247;
  __int16 v248;
  uint64_t v249;
  __int16 v250;
  uint64_t v251;
  __int16 v252;
  uint64_t v253;
  __int16 v254;
  int v255;
  uint8_t buf[8];
  _BYTE v257[20];
  _BYTE v258[12];
  _BYTE v259[10];
  uint64_t v260;
  __int16 v261;
  uint64_t v262;
  __int16 v263;
  uint64_t v264;
  __int16 v265;
  uint64_t v266;
  __int16 v267;
  uint64_t v268;
  __int16 v269;
  uint64_t v270;
  __int16 v271;
  int v272;
  uint64_t v273;

  v273 = *MEMORY[0x1E0C80C00];
  v3 = (id)CLConnectionMessage::getRawPayload(*(CLConnectionMessage **)a3.var0);
  xpc_data_get_bytes_ptr(v3);
  length = xpc_data_get_length(v3);
  v5 = (length / 50);
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v6 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = length;
    *(_WORD *)v257 = 1026;
    *(_DWORD *)&v257[2] = length / 50;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[framework-dm] Received msg size %{public}d num %{public}d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v232 = 67240448;
    v233 = length;
    v234 = 1026;
    LODWORD(v235) = length / 50;
    v126 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingDeviceMotionBatch:]", "CoreLocation: %s\n", v126);
    if (v126 != (char *)buf)
      free(v126);
  }
  v221 = (void *)objc_opt_new();
  if (length < 50)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      bytes = xpc_data_get_bytes(v3, buf, v7, 0x32uLL);
      v12 = *(_DWORD *)&v257[16];
      v13 = *(_DWORD *)v258;
      v222 = *(_QWORD *)&v258[4];
      v223 = *(_QWORD *)&v257[8];
      v14 = v5;
      v15 = *(_QWORD *)&v259[2];
      v7 += 50;
      v16 = *(float *)&v257[4];
      v17 = *(float *)v257;
      v18 = *(float32x2_t *)buf;
      v19 = v3;
      v20 = MEMORY[0x194001B4C](bytes);
      v21 = [CMDeviceMotion alloc];
      v224 = v16;
      v225 = vcvtq_f64_f32(v18);
      v226 = v17;
      v227 = v13;
      *(_QWORD *)&v22 = v222;
      *((_QWORD *)&v22 + 1) = v223;
      v228 = v22;
      v229 = v12;
      v230 = 0u;
      v231 = 0u;
      v26 = (id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v21, v23, (uint64_t)&v224, v24, v25, 0.0, (double)v15 * 0.000000999999997);
      objc_msgSend_addObject_(v221, v27, (uint64_t)v26, v28, v29);
      v30 = (void *)v20;
      v3 = v19;
      objc_autoreleasePoolPop(v30);
      if (v10)
        v9 = v15;
      else
        v8 = v15;
      v5 = v14;
      ++v10;
    }
    while ((_DWORD)v14 != v10);
  }
  if (qword_1EE16D948 != -1)
    dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
  v31 = qword_1EE16D950;
  if (os_log_type_enabled((os_log_t)qword_1EE16D950, OS_LOG_TYPE_DEFAULT))
  {
    Object = (void *)objc_msgSend_firstObject(v221, v32, v33, v34, v35);
    objc_msgSend_timestamp(Object, v37, v38, v39, v40);
    v42 = v41;
    v47 = (void *)objc_msgSend_lastObject(v221, v43, v44, v45, v46);
    objc_msgSend_timestamp(v47, v48, v49, v50, v51);
    v53 = v52;
    v58 = (void *)objc_msgSend_firstObject(v221, v54, v55, v56, v57);
    objc_msgSend_userAcceleration(v58, v59, v60, v61, v62);
    v64 = v63;
    v69 = (void *)objc_msgSend_firstObject(v221, v65, v66, v67, v68);
    objc_msgSend_userAcceleration(v69, v70, v71, v72, v73);
    v75 = v74;
    v80 = (void *)objc_msgSend_firstObject(v221, v76, v77, v78, v79);
    objc_msgSend_userAcceleration(v80, v81, v82, v83, v84);
    v86 = v85;
    v91 = (void *)objc_msgSend_lastObject(v221, v87, v88, v89, v90);
    objc_msgSend_userAcceleration(v91, v92, v93, v94, v95);
    v97 = v96;
    v102 = (void *)objc_msgSend_lastObject(v221, v98, v99, v100, v101);
    objc_msgSend_userAcceleration(v102, v103, v104, v105, v106);
    v108 = v107;
    v113 = (void *)objc_msgSend_lastObject(v221, v109, v110, v111, v112);
    objc_msgSend_userAcceleration(v113, v114, v115, v116, v117);
    v119 = v118;
    v124 = objc_msgSend_count(v221, v120, v121, v122, v123);
    *(_DWORD *)buf = 67243008;
    *(_DWORD *)&buf[4] = v5;
    *(_WORD *)v257 = 2050;
    *(_QWORD *)&v257[2] = v8;
    *(_WORD *)&v257[10] = 2050;
    *(_QWORD *)&v257[12] = v9;
    *(_WORD *)v258 = 2050;
    *(_QWORD *)&v258[2] = v42;
    *(_WORD *)&v258[10] = 2050;
    *(_QWORD *)v259 = v53;
    *(_WORD *)&v259[8] = 2050;
    v260 = v64;
    v261 = 2050;
    v262 = v75;
    v263 = 2050;
    v264 = v86;
    v265 = 2050;
    v266 = v97;
    v267 = 2050;
    v268 = v108;
    v269 = 2050;
    v270 = v119;
    v271 = 1026;
    v272 = v124;
    _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEFAULT, "[framework-dm] Looped %{public}d times range [%{public}llu %{public}llu], timeS [%{public}f %{public}f], first sample [%{public}f %{public}f %{public}f], last sample [%{public}f %{public}f %{public}f], size %{public}d", buf, 0x72u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D948 != -1)
      dispatch_once(&qword_1EE16D948, &unk_1E2944F00);
    v131 = (void *)objc_msgSend_firstObject(v221, v127, v128, v129, v130);
    objc_msgSend_timestamp(v131, v132, v133, v134, v135);
    v137 = v136;
    v142 = (void *)objc_msgSend_lastObject(v221, v138, v139, v140, v141);
    objc_msgSend_timestamp(v142, v143, v144, v145, v146);
    v148 = v147;
    v153 = (void *)objc_msgSend_firstObject(v221, v149, v150, v151, v152);
    objc_msgSend_userAcceleration(v153, v154, v155, v156, v157);
    v159 = v158;
    v164 = (void *)objc_msgSend_firstObject(v221, v160, v161, v162, v163);
    objc_msgSend_userAcceleration(v164, v165, v166, v167, v168);
    v170 = v169;
    v175 = (void *)objc_msgSend_firstObject(v221, v171, v172, v173, v174);
    objc_msgSend_userAcceleration(v175, v176, v177, v178, v179);
    v181 = v180;
    v186 = (void *)objc_msgSend_lastObject(v221, v182, v183, v184, v185);
    objc_msgSend_userAcceleration(v186, v187, v188, v189, v190);
    v192 = v191;
    v197 = (void *)objc_msgSend_lastObject(v221, v193, v194, v195, v196);
    objc_msgSend_userAcceleration(v197, v198, v199, v200, v201);
    v203 = v202;
    v208 = (void *)objc_msgSend_lastObject(v221, v204, v205, v206, v207);
    objc_msgSend_userAcceleration(v208, v209, v210, v211, v212);
    v214 = v213;
    v219 = objc_msgSend_count(v221, v215, v216, v217, v218);
    v232 = 67243008;
    v233 = v5;
    v234 = 2050;
    v235 = v8;
    v236 = 2050;
    v237 = v9;
    v238 = 2050;
    v239 = v137;
    v240 = 2050;
    v241 = v148;
    v242 = 2050;
    v243 = v159;
    v244 = 2050;
    v245 = v170;
    v246 = 2050;
    v247 = v181;
    v248 = 2050;
    v249 = v192;
    v250 = 2050;
    v251 = v203;
    v252 = 2050;
    v253 = v214;
    v254 = 1026;
    v255 = v219;
    v220 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMBatchedSensorManagerInternal _newArrayByUnpackingDeviceMotionBatch:]", "CoreLocation: %s\n", v220);
    if (v220 != (char *)buf)
      free(v220);
  }

  return v221;
}

- (NSArray)accelBatch
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccelBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)deviceMotionBatch
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceMotionBatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

@end
