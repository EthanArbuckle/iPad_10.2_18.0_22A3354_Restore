@implementation CMADeviceMotionVisionFusionPlayer

- (CMADeviceMotionVisionFusionPlayer)init
{
  CMADeviceMotionVisionFusionPlayer *v2;
  CMADeviceMotionVisionFusionPlayer *v3;
  uint64_t v4;
  CMVLFDeviceMotionFuser *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMADeviceMotionVisionFusionPlayer;
  v2 = -[CMADeviceMotionVisionFusionPlayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fusionEnabled = 1;
    sub_21B88198C("/System/Library/Frameworks/CoreLocation.framework/Support/WMM.dat");
    v3->fMagneticDeclination = 0.0;
    v3->fMagneticDeclinationTimestamp = -1.0;
    v4 = operator new();
    sub_21B8851FC(v4);
    value = v3->fVLFDeviceMotionFuser.__ptr_.__value_;
    v3->fVLFDeviceMotionFuser.__ptr_.__value_ = (CMVLFDeviceMotionFuser *)v4;
    if (value)
    {
      *((_QWORD *)value + 22) = &off_24DF3AB88;
      MEMORY[0x220766390]();
    }
  }
  return v3;
}

- (void)setEnableFusion:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v4 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isPlayerActive(self, a2, a3, v3))
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v6 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disable";
      if (v4)
        v7 = "enable";
      v8 = 136315138;
      v9 = v7;
      _os_log_impl(&dword_21B72A000, v6, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, cannot %s fusion while player is active", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    self->_fusionEnabled = v4;
  }
}

- (void)start
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint8_t v12[16];

  objc_sync_enter(self);
  if (objc_msgSend_isPlayerActive(self, v3, v4, v5))
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v9 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21B72A000, v9, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, player is already active - nothing to start", v12, 2u);
    }
  }
  else
  {
    objc_msgSend_reset(self, v6, v7, v8);
    objc_msgSend_setPlayerActive_(self, v10, 1, v11);
  }
  objc_sync_exit(self);
}

- (void)stop
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v3, v4, v5) & 1) != 0)
  {
    objc_msgSend_setPlayerActive_(self, v6, 0, v7);
  }
  else
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v8 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21B72A000, v8, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, player is already inactive - nothing to stop", v9, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)updateARSessionState:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v5, v6, v7) & 1) != 0)
  {
    objc_msgSend_setArSessionActive_(self, v8, a3 == 1, v9);
  }
  else
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v10 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21B72A000, v10, OS_LOG_TYPE_DEFAULT, "#warning CMADeviceMotionVisionFusionPlayer, ignoring AR Session State update, player is inactive - need to start the player", v11, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)updateVLLocalizationResult:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMVLFDeviceMotionFuser *value;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;

  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v5, v6, v7) & 1) != 0)
  {
    value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
    if (value)
    {
      sub_21B8856C4((uint64_t)value, a3, v8, v9);
      goto LABEL_13;
    }
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v11 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v12 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring VL update, fuser is nil";
      v13 = (uint8_t *)&v14;
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v11 = qword_25518E1E8;
    if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v12 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring VL update, player is inactive - need to start the player";
      v13 = (uint8_t *)&v15;
LABEL_12:
      _os_log_impl(&dword_21B72A000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
LABEL_13:
  objc_sync_exit(self);
}

- (void)updateLocation:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  double v38;
  _BYTE v39[20];
  float v40;
  uint8_t buf[4];
  double v42;
  double v43;
  double v44;

  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v5, v6, v7) & 1) == 0)
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v36 = qword_25518E1E8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, player is inactive - need to start the player";
LABEL_23:
    _os_log_impl(&dword_21B72A000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_24;
  }
  if (!a3)
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v36 = qword_25518E1E8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, location is nil";
    goto LABEL_23;
  }
  if ((objc_msgSend_isARSessionActive(self, v8, v9, v10) & 1) == 0)
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v36 = qword_25518E1E8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, AR session is not active";
    goto LABEL_23;
  }
  if (self->fVLFDeviceMotionFuser.__ptr_.__value_)
  {
    v14 = objc_msgSend_clientLocation(a3, v11, v12, v13);
    v18 = sub_21B88C144(v14, v15, v16, v17);
    objc_msgSend_clientLocation(a3, v19, v20, v21);
    v22 = v43;
    objc_msgSend_clientLocation(a3, v23, v24, v25);
    v26 = v42;
    objc_msgSend_clientLocation(a3, v27, v28, v29);
    v30 = fmax(v22, 0.0);
    v31 = v26;
    v32 = v38;
    if (!sub_21B8819A0((uint64_t)v39, v31, v32, v30, v18))
    {
      self->fMagneticDeclination = v40;
      objc_msgSend_clientLocation(a3, v33, v34, v35);
      self->fMagneticDeclinationTimestamp = v44;
      *((_DWORD *)self->fVLFDeviceMotionFuser.__ptr_.__value_ + 2) = LODWORD(self->fMagneticDeclination);
    }
    goto LABEL_24;
  }
  if (qword_25518E1E0 != -1)
    dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
  v36 = qword_25518E1E8;
  if (os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v37 = "#warning CMADeviceMotionVisionFusionPlayer, ignoring location update, fuser is nil";
    goto LABEL_23;
  }
LABEL_24:
  objc_sync_exit(self);
}

- (id)getFusedDeviceMotionFrom:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_getFusedDeviceMotionFrom_andAttitudeReferenceFrame_, a3, 4);
}

- (id)getFusedDeviceMotionFrom:(id)a3 andAttitudeReferenceFrame:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  float v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  float v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  float v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  float v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  float v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  float v78;
  float v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  float v87;
  NSObject *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  CMVLFDeviceMotionFuser *value;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  CMVLFDeviceMotionFuser *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  double v125;
  double v126;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  const char *v133;
  uint64_t v134;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t buf[8];
  double v148;
  double v149;
  double v150;
  int v151;
  float v152;
  float v153;
  int v154;
  float v155;
  float v156;
  __int128 v157;
  __int128 v158;

  objc_sync_enter(self);
  if ((objc_msgSend_isPlayerActive(self, v7, v8, v9) & 1) == 0)
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v88 = qword_25518E1E8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v89 = "#warning CMADeviceMotionVisionFusionPlayer, cannot get fused device motion, player is inactive - need to start the player";
    goto LABEL_10;
  }
  if (!objc_msgSend_isFusionEnabled(self, v10, v11, v12))
    goto LABEL_22;
  if (!self->fVLFDeviceMotionFuser.__ptr_.__value_)
  {
    if (qword_25518E1E0 != -1)
      dispatch_once(&qword_25518E1E0, &unk_24DF3AEF8);
    v88 = qword_25518E1E8;
    if (!os_log_type_enabled((os_log_t)qword_25518E1E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v89 = "#warning CMADeviceMotionVisionFusionPlayer, cannot get fused device motion, fuser is nil";
LABEL_10:
    _os_log_impl(&dword_21B72A000, v88, OS_LOG_TYPE_DEFAULT, v89, buf, 2u);
LABEL_11:
    a3 = 0;
    goto LABEL_22;
  }
  v158 = 0u;
  v157 = 0u;
  v16 = (void *)objc_msgSend_attitude(a3, v13, v14, v15);
  objc_msgSend_quaternion(v16, v17, v18, v19);
  v21 = v20;
  *(double *)buf = v21;
  v25 = (void *)objc_msgSend_attitude(a3, v22, v23, v24);
  objc_msgSend_quaternion(v25, v26, v27, v28);
  *(float *)&v29 = v29;
  v148 = *(float *)&v29;
  v33 = (void *)objc_msgSend_attitude(a3, v30, v31, v32);
  objc_msgSend_quaternion(v33, v34, v35, v36);
  v38 = v37;
  v149 = v38;
  v42 = (void *)objc_msgSend_attitude(a3, v39, v40, v41);
  objc_msgSend_quaternion(v42, v43, v44, v45);
  v47 = v46;
  v150 = v47;
  objc_msgSend_userAcceleration(a3, v48, v49, v50);
  *(float *)&v51 = v51;
  v151 = LODWORD(v51);
  objc_msgSend_userAcceleration(a3, v52, v53, v54);
  v56 = v55;
  v152 = v56;
  objc_msgSend_userAcceleration(a3, v57, v58, v59);
  v61 = v60;
  v153 = v61;
  objc_msgSend_rotationRate(a3, v62, v63, v64);
  *(float *)&v65 = v65;
  v154 = LODWORD(v65);
  objc_msgSend_rotationRate(a3, v66, v67, v68);
  v70 = v69;
  v155 = v70;
  objc_msgSend_rotationRate(a3, v71, v72, v73);
  v78 = v77;
  v156 = v78;
  if (a3)
  {
    objc_msgSend_magneticField(a3, v74, v75, v76);
    v79 = *(double *)&v137;
    *(float *)&v157 = v79;
    objc_msgSend_magneticField(a3, v80, v81, v82);
    v83 = *((double *)&v145 + 1);
    *((float *)&v157 + 1) = v83;
    objc_msgSend_magneticField(a3, v84, v85, v86);
    v87 = *(double *)&v144;
  }
  else
  {
    v137 = 0u;
    v138 = 0u;
    v145 = 0u;
    v146 = 0u;
    *(_QWORD *)&v157 = 0;
    v87 = 0.0;
    v143 = 0u;
    v144 = 0u;
  }
  *((float *)&v157 + 2) = v87;
  HIDWORD(v157) = objc_msgSend_magneticFieldCalibrationLevel(a3, v74, v75, v76);
  LOBYTE(v158) = objc_msgSend_doingYawCorrection(a3, v90, v91, v92);
  BYTE1(v158) = objc_msgSend_doingBiasEstimation(a3, v93, v94, v95);
  BYTE2(v158) = 1;
  objc_msgSend_heading(a3, v96, v97, v98);
  *(float *)&v99 = v99;
  DWORD1(v158) = LODWORD(v99);
  BYTE8(v158) = objc_msgSend_fusedWithVision(a3, v100, v101, v102);
  BYTE9(v158) = objc_msgSend_usingVisionCorrections(a3, v103, v104, v105);
  HIDWORD(v158) = 0;
  if (a4 == 8)
    sub_21B88F8A4((uint64_t)buf, self->fMagneticDeclination, self->fMagneticDeclinationTimestamp);
  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  objc_msgSend_headingAccuracy(a3, v106, v107, v108);
  v111 = v110;
  objc_msgSend_timestamp(a3, v112, v113, v114);
  v116 = v115;
  *(float *)&v115 = v111;
  sub_21B885200((uint64_t)value, (uint64_t)buf, *(float *)&v115, v116);
  v120 = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  v121 = *((_OWORD *)v120 + 1);
  v122 = *((_OWORD *)v120 + 2);
  v123 = *((_OWORD *)v120 + 3);
  v124 = *((_OWORD *)v120 + 5);
  v140 = *((_OWORD *)v120 + 4);
  v141 = v124;
  v142 = *((_QWORD *)v120 + 12);
  v138 = v122;
  v139 = v123;
  v137 = v121;
  if (a4 == 8)
    sub_21B88F794((uint64_t)&v137, self->fMagneticDeclination, self->fMagneticDeclinationTimestamp);
  objc_msgSend_headingAccuracy(a3, v117, v118, v119);
  v126 = v125;
  v127 = objc_alloc(MEMORY[0x24BDC13B0]);
  objc_msgSend_timestamp(a3, v128, v129, v130, v137, v138, v139, v140, v141, v142);
  v132 = v131;
  *(float *)&v131 = v126;
  a3 = (id)objc_msgSend_initWithDeviceMotion_internal_timestamp_(v127, v133, (uint64_t)&v136, v134, v131, v132);
LABEL_22:
  objc_sync_exit(self);
  return a3;
}

- (void)reset
{
  CMVLFDeviceMotionFuser *value;

  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  if (value)
    sub_21B8851AC((uint64_t)value);
  self->fMagneticDeclination = 0.0;
  self->fMagneticDeclinationTimestamp = -1.0;
}

- (float)magneticDeclination
{
  return self->fMagneticDeclination;
}

- (BOOL)isFusionEnabled
{
  return self->_fusionEnabled;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (BOOL)isPlayerActive
{
  return self->_playerActive;
}

- (void)setPlayerActive:(BOOL)a3
{
  self->_playerActive = a3;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (void).cxx_destruct
{
  CMVLFDeviceMotionFuser *value;

  value = self->fVLFDeviceMotionFuser.__ptr_.__value_;
  self->fVLFDeviceMotionFuser.__ptr_.__value_ = 0;
  if (value)
  {
    *((_QWORD *)value + 22) = &off_24DF3AB88;
    JUMPOUT(0x220766390);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
