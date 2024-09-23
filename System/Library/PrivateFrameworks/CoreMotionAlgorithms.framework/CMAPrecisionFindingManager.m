@implementation CMAPrecisionFindingManager

- (CMAPrecisionFindingManager)initWithDelegate:(id)a3 dispatchQueue:(id)a4
{
  CMAPrecisionFindingManager *v6;
  CMAPrecisionFindingManager *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CMAPrecisionFindingManager;
  v6 = -[CMAPrecisionFindingManager init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    dispatch_retain((dispatch_object_t)a4);
    v7->_delegateQueue = (OS_dispatch_queue *)a4;
    v7->_analyticsManager = objc_alloc_init(CMAPrecisionFindingAnalytics);
    v8 = objc_alloc(MEMORY[0x24BDBCF50]);
    v11 = (void *)objc_msgSend_initWithSuiteName_(v8, v9, (uint64_t)CFSTR("com.apple.CoreMotionAlgorithms.Msl.nearbyd"), v10);
    objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)CFSTR("private/var/mobile/Library/Caches/com.apple.CoreMotionAlgorithms/"), (uint64_t)CFSTR("FileBasePath"));
    objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("LoggingEnabled"));

    v14 = objc_alloc(MEMORY[0x24BDBCF50]);
    v17 = (void *)objc_msgSend_initWithSuiteName_(v14, v15, (uint64_t)CFSTR("com.apple.CoreMotionAlgorithms"), v16);
    v20 = objc_msgSend_objectForKey_(v17, v18, (uint64_t)CFSTR("NumParticlesDeviceFinding"), v19);
    if (v20)
    {
      v21 = (void *)v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_msgSend_unsignedLongLongValue(v21, v22, v23, v24);
        sub_21B891668((uint64_t)&v7->_positionEstimator, v25);
      }
    }

    sub_21B890A68();
    v7->_analyticsDownsampler.fMinimumToleratedDt = 99500;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  self->_delegateQueue = 0;

  v3.receiver = self;
  v3.super_class = (Class)CMAPrecisionFindingManager;
  -[CMAPrecisionFindingManager dealloc](&v3, sel_dealloc);
}

- (void)startDeviceFindingUpdates
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[16];

  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v3 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B72A000, v3, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,starting updates.", v6, 2u);
  }
  objc_msgSend_setDeviceFindingClient_(self, v4, 1, v5);
}

- (void)stopDeviceFindingUpdates
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint8_t v6[16];

  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v3 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B72A000, v3, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,stopping updates.", v6, 2u);
  }
  objc_msgSend_setDeviceFindingClient_(self, v4, 0, v5);
}

- (void)updateDeviceMotion:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  unint64_t v60;
  unint64_t fMinimumToleratedDt;
  os_log_type_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD v80[6];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD v87[5];
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  _BYTE buf[32];
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_deviceFindingClient(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_timestamp(a3, v6, v7, v8);
    *(_QWORD *)&v89 = v9;
    objc_msgSend_quaternion(a3, v10, v11, v12);
    *((_QWORD *)&v89 + 1) = v13;
    objc_msgSend_quaternion(a3, v14, v15, v16);
    *(_QWORD *)&v90 = v17;
    objc_msgSend_quaternion(a3, v18, v19, v20);
    *((_QWORD *)&v90 + 1) = v21;
    objc_msgSend_quaternion(a3, v22, v23, v24);
    *(_QWORD *)&v91 = v25;
    objc_msgSend_rotationRate(a3, v26, v27, v28);
    *((_QWORD *)&v91 + 1) = v29;
    objc_msgSend_rotationRate(a3, v30, v31, v32);
    *(_QWORD *)&v92 = v33;
    objc_msgSend_rotationRate(a3, v34, v35, v36);
    *((_QWORD *)&v92 + 1) = v37;
    objc_msgSend_acceleration(a3, v38, v39, v40);
    *(_QWORD *)&v93 = v41;
    objc_msgSend_acceleration(a3, v42, v43, v44);
    *((_QWORD *)&v93 + 1) = v45;
    objc_msgSend_acceleration(a3, v46, v47, v48);
    v94 = v49;
    sub_21B891698((uint64_t)&self->_positionEstimator, (uint64_t)&v89);
    sub_21B890B00((double *)&v89);
    v53 = (void *)objc_msgSend_analyticsManager(self, v50, v51, v52);
    v87[2] = v91;
    v87[3] = v92;
    v87[4] = v93;
    v88 = v94;
    v87[0] = v89;
    v87[1] = v90;
    objc_msgSend_feedDeviceMotion_(v53, v54, (uint64_t)v87, v55);
    objc_msgSend_timestamp(a3, v56, v57, v58);
    v60 = (unint64_t)(v59 * 1000000.0);
    fMinimumToleratedDt = self->_deviceMotionDownsampler.fMinimumToleratedDt;
    if (fMinimumToleratedDt && self->_deviceMotionDownsampler.fLastTimestamp + fMinimumToleratedDt > v60)
    {
      v62 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v62 = OS_LOG_TYPE_DEFAULT;
      self->_deviceMotionDownsampler.fLastTimestamp = v60;
    }
    if (qword_25518E1C0 != -1)
      dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
    v63 = qword_25518E1C8;
    if (os_log_type_enabled((os_log_t)qword_25518E1C8, v62))
    {
      objc_msgSend_timestamp(a3, v64, v65, v66);
      *(_DWORD *)buf = 134351616;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = *((_QWORD *)&v89 + 1);
      *(_WORD *)&buf[22] = 2050;
      *(_QWORD *)&buf[24] = v90;
      v96 = 2050;
      v97 = *((_QWORD *)&v90 + 1);
      v98 = 2050;
      v99 = v91;
      v100 = 2050;
      v101 = *((_QWORD *)&v91 + 1);
      v102 = 2050;
      v103 = v92;
      v104 = 2050;
      v105 = *((_QWORD *)&v92 + 1);
      v106 = 2050;
      v107 = v93;
      v108 = 2050;
      v109 = *((_QWORD *)&v93 + 1);
      v110 = 2050;
      v111 = v94;
      _os_log_impl(&dword_21B72A000, v63, v62, "CMAPrecisionFindingManager,timestamp,%{public}f,quaternion.x,%{public}f,quaternion.y,%{public}f,quaternion.z,%{public}f,quaternion.w,%{public}f,rotationRate.x,%{public}f,rotationRate.y,%{public}f,rotationRate.z,%{public}f,acceleration.x,%{public}f,acceleration.y,%{public}f,acceleration.z,%{public}f", buf, 0x70u);
    }
    objc_msgSend_delegate(self, v64, v65, v66);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v71 = *(_OWORD *)&self->_positionEstimator.fPosition.horizontalAngleUncertainty;
      *(_OWORD *)buf = *(_OWORD *)&self->_positionEstimator.fPosition.timestamp;
      *(_OWORD *)&buf[16] = v71;
      v72 = *(_OWORD *)&self->_positionEstimator.fParticleFilterState.stateEstimate.__elems_[1];
      v85 = *(_OWORD *)&self->_positionEstimator.fParticleFilterState.timestamp;
      v86 = v72;
      v73 = objc_msgSend_delegateQueue(self, v68, v69, v70);
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = sub_21B8983D0;
      v80[3] = &unk_24DF3B160;
      v81 = *(_OWORD *)buf;
      v82 = *(_OWORD *)&buf[16];
      v83 = v85;
      v84 = v86;
      v80[4] = self;
      v80[5] = a3;
      dispatch_async(v73, v80);
    }
    objc_msgSend_timestamp(a3, v68, v69, v70);
    v78 = (unint64_t)(v77 * 1000000.0);
    v79 = self->_analyticsDownsampler.fMinimumToleratedDt;
    if (!v79 || self->_analyticsDownsampler.fLastTimestamp + v79 <= v78)
    {
      self->_analyticsDownsampler.fLastTimestamp = v78;
      objc_msgSend_updateAnalytics(self, v74, v75, v76);
    }
  }
}

- (void)updatePeerState:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  v11 = v6;
  v12 = objc_msgSend_motionState(a3, v7, v8, v9);
  sub_21B89232C((uint64_t)&self->_positionEstimator, (uint64_t)&v11);
  sub_21B890CCC(&v11);
  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v10 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v14 = v11;
    v15 = 1026;
    v16 = v12;
    _os_log_impl(&dword_21B72A000, v10, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,peerState,%{public}d", buf, 0x12u);
  }
}

- (void)updateRanging:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  _OWORD v30[2];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  *(_QWORD *)&v32 = v6;
  objc_msgSend_range(a3, v7, v8, v9);
  *((_QWORD *)&v32 + 1) = v10;
  objc_msgSend_rangeError(a3, v11, v12, v13);
  *(_QWORD *)&v33 = v14;
  objc_msgSend_rssi(a3, v15, v16, v17);
  *((_QWORD *)&v33 + 1) = v18;
  v34 = (unsigned __int16)objc_msgSend_cycleIndex(a3, v19, v20, v21);
  v22 = sub_21B891FFC((uint64_t)&self->_positionEstimator, (uint64_t)&v32);
  v26 = (void *)objc_msgSend_analyticsManager(self, v23, v24, v25, v22);
  v30[0] = v32;
  v30[1] = v33;
  v31 = v34;
  objc_msgSend_feedRange_(v26, v27, (uint64_t)v30, v28);
  sub_21B890D68((double *)&v32);
  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v29 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349824;
    v36 = v32;
    v37 = 2050;
    v38 = *((_QWORD *)&v32 + 1);
    v39 = 2050;
    v40 = *((_QWORD *)&v33 + 1);
    v41 = 1026;
    v42 = (unsigned __int16)v34;
    _os_log_impl(&dword_21B72A000, v29, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,range,%{public}f,rssi,%{public}f,cycleIndex,%{public}d", buf, 0x26u);
  }
}

- (void)updateWatchOrientation:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3);
  v20 = v6;
  LODWORD(v21) = objc_msgSend_wrist(a3, v7, v8, v9);
  HIDWORD(v21) = objc_msgSend_crown(a3, v10, v11, v12);
  v13 = sub_21B89239C((uint64_t)&self->_positionEstimator, (uint64_t)&v20);
  v17 = (void *)objc_msgSend_analyticsManager(self, v14, v15, v16, v13);
  objc_msgSend_feedWatchOrientation_(v17, v18, v20, v21);
  sub_21B890E90((uint64_t)&v20);
  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v19 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    v23 = v20;
    v24 = 1026;
    v25 = v21;
    v26 = 1026;
    v27 = HIDWORD(v21);
    _os_log_impl(&dword_21B72A000, v19, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,timestamp,%{public}f,wrist,%{public}d,crown,%{public}d,", buf, 0x18u);
  }
}

- (void)updateAltimeterData:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_machAbsoluteTimestamp(a3, a2, (uint64_t)a3, v3, 0);
  v17 = v6;
  objc_msgSend_relativeAltitude(a3, v7, v8, v9);
  v18 = v10;
  objc_msgSend_pressure(a3, v11, v12, v13);
  v19 = v14;
  sub_21B892484((uint64_t)&self->_positionEstimator, (uint64_t)&v16);
  sub_21B891038(&v16);
  if (qword_25518E1C0 != -1)
    dispatch_once(&qword_25518E1C0, &unk_24DF3B180);
  v15 = qword_25518E1C8;
  if (os_log_type_enabled((os_log_t)qword_25518E1C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    v21 = v17;
    v22 = 2050;
    v23 = v19;
    v24 = 2050;
    v25 = v18;
    _os_log_impl(&dword_21B72A000, v15, OS_LOG_TYPE_DEFAULT, "CMAPrecisionFindingManager,machAbsoluteTimestamp,%{public}f,pressure,%{public}f,relativeAltitude,%{public}f", buf, 0x20u);
  }
}

- (void)updateAnalytics
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  NSObject *v12;
  _QWORD block[5];
  _OWORD v14[2];
  uint64_t v15;

  objc_msgSend_delegate(self, a2, v2, v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_positionEstimator.fAcceptedRange.__engaged_)
    {
      v8 = (void *)objc_msgSend_analyticsManager(self, v5, v6, v7);
      if (!self->_positionEstimator.fAcceptedRange.__engaged_)
        sub_21B8992D4();
      v11 = *(_OWORD *)&self->_positionEstimator.fAcceptedRange.var0.__val_.rangeError;
      v14[0] = *(_OWORD *)&self->_positionEstimator.fAcceptedRange.var0.__null_state_;
      v14[1] = v11;
      v15 = *(_QWORD *)&self->_positionEstimator.fAcceptedRange.var0.__val_.cycleIndex;
      objc_msgSend_feedAcceptedRange_(v8, v9, (uint64_t)v14, v10);
    }
    v12 = objc_msgSend_delegateQueue(self, v5, v6, v7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21B899140;
    block[3] = &unk_24DF3AF48;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

- (CMAPrecisionFindingDelegate)delegate
{
  return (CMAPrecisionFindingDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 21584);
}

- (BOOL)deviceFindingClient
{
  return self->_deviceFindingClient;
}

- (void)setDeviceFindingClient:(BOOL)a3
{
  self->_deviceFindingClient = a3;
}

- (CMAPrecisionFindingAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 21592);
}

- (void).cxx_destruct
{
  double *begin;
  void *v4;

  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_positionEstimator.fParticleFilter.fParticleFilter.fWeights.__begin_;
  if (begin)
  {
    self->_positionEstimator.fParticleFilter.fParticleFilter.fWeights.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_positionEstimator.fParticleFilter.fParticleFilter.fParticles.__begin_;
  if (v4)
  {
    self->_positionEstimator.fParticleFilter.fParticleFilter.fParticles.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  sub_21B891664(&self->_positionEstimator, a2);
  *(_OWORD *)&self->_deviceMotionDownsampler.fMinimumToleratedDt = xmmword_21B8A1650;
  self->_deviceMotionDownsampler._vptr$CMDownsampler = (void **)&off_24DF3B1B0;
  self->_positionDownsampler.fLastTimestamp = 0;
  self->_positionDownsampler.fMinimumToleratedDt = 39500;
  self->_positionDownsampler._vptr$CMDownsampler = (void **)&off_24DF3B1B0;
  *(_OWORD *)&self->_analyticsDownsampler.fMinimumToleratedDt = xmmword_21B8A1650;
  self->_analyticsDownsampler._vptr$CMDownsampler = (void **)&off_24DF3B1B0;
  return self;
}

@end
