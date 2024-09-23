@implementation CMMediaSession

+ (BOOL)_isAvailable
{
  return 1;
}

+ (double)defaultFaceToDevicePitchAngle
{
  unsigned __int8 v2;
  int v4;
  double v5;

  v2 = atomic_load((unsigned __int8 *)&qword_1ECEDF178);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1ECEDF178))
  {
    sub_18F1F77DC();
    v4 = sub_18F1E1B00();
    v5 = 0.0;
    if (v4)
      v5 = -20.0;
    qword_1ECEDF170 = *(_QWORD *)&v5;
    __cxa_guard_release(&qword_1ECEDF178);
  }
  return *(double *)&qword_1ECEDF170;
}

- (void)_enableLoggingForReplayWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  CMSpatialLogger *value;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  int inEarStatus;
  uint64_t v57;
  double v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  self->_logForReplay = 1;
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v7 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v66 = a4;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_INFO, "[CMMediaSession] Logging to: %{private}@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v59 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v59);
    if (v59 != (char *)buf)
      free(v59);
  }
  objc_msgSend_setMcLogPath_(self, v8, (uint64_t)a4, v9, v10);
  v14 = (char *)objc_msgSend_cStringUsingEncoding_(a3, v11, 1, v12, v13);
  v18 = (char *)objc_msgSend_cStringUsingEncoding_(a4, v15, 1, v16, v17);
  v19 = (uint64_t *)operator new();
  sub_18F3620E4((uint64_t)v19, v14, v18);
  sub_18F346D8C((uint64_t **)&self->_logger, v19);
  v24 = (_QWORD *)((char *)self->_headTrackingService.__ptr_.__value_ + 37512);
  value = self->_logger.__ptr_.__value_;
  if (*v24)
    *(_QWORD *)(*v24 + 7592) = value;
  v26 = v24[1];
  if (v26)
    *(_QWORD *)(v26 + 5952) = value;
  if (objc_msgSend_returnDefaultPose(self, v20, v21, v22, v23))
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v31 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Returning default pose.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v60 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v60);
      if (v60 != (char *)buf)
        free(v60);
    }
    objc_msgSend__logEvent_(self, v32, (uint64_t)CFSTR("Returning default pose"), v33, v34);
  }
  else if (objc_msgSend_returnRandomPose(self, v27, v28, v29, v30))
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v39 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v39, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Returning random pose.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v63 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v63);
      if (v63 != (char *)buf)
        free(v63);
    }
    objc_msgSend__logEvent_(self, v40, (uint64_t)CFSTR("Returning random pose"), v41, v42);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v43 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v43, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Returning pose.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v64 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v64);
      if (v64 != (char *)buf)
        free(v64);
    }
    objc_msgSend__logEvent_(self, v44, (uint64_t)CFSTR("Returning pose"), v45, v46);
  }
  if (objc_msgSend_alwaysNotify50HzPose(self, v35, v36, v37, v38))
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v47 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v47, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Always notifying pose at 50Hz.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v61 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v61);
      if (v61 != (char *)buf)
        free(v61);
    }
    objc_msgSend__logEvent_(self, v48, (uint64_t)CFSTR("Always notify pose at 50Hz"), v49, v50);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v51 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v51, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Only notifying pose if valid and hasChanged.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v62 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _enableLoggingForReplayWithFilenamePrefix:filePath:]", "CoreLocation: %s\n", v62);
      if (v62 != (char *)buf)
        free(v62);
    }
    objc_msgSend__logEvent_(self, v52, (uint64_t)CFSTR("Only notify pose if valid and hasChanged"), v53, v54);
  }
  sub_18F365090((uint64_t *)self->_logger.__ptr_.__value_, "kRelDmMinQuiescentPeriodForBTZ", self->_minQuiescentPeriodForBTZ);
  v55 = (uint64_t *)self->_logger.__ptr_.__value_;
  inEarStatus = self->_inEarStatus;
  v57 = mach_continuous_time();
  v58 = sub_18F1FD20C(v57);
  sub_18F365620(v55, inEarStatus, v58);
}

- (void)_disableLoggingForReplay
{
  _QWORD *v2;
  uint64_t v3;

  self->_logForReplay = 0;
  v2 = (_QWORD *)((char *)self->_headTrackingService.__ptr_.__value_ + 37512);
  if (*v2)
    *(_QWORD *)(*v2 + 7592) = 0;
  v3 = v2[1];
  if (v3)
    *(_QWORD *)(v3 + 5952) = 0;
  sub_18F346D8C((uint64_t **)&self->_logger, 0);
}

- (int)_createPoseFromListenerOrientation:(const ListenerOrientation *)a3 Pose:(id *)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  unint64_t v11;
  double timestamp;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t var1;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  CMHeadTrackingService *value;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint32_t v35;
  uint64_t v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  int v47;
  CMPose *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v53[10];
  float v54;
  float v55;
  float v56;
  float32x4_t buf[102];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3->var0.elements[0];
  v8 = a3->var0.elements[1];
  v9 = a3->var0.elements[2];
  v10 = a3->var0.elements[3];
  v11 = *((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 676);
  timestamp = self->_lastAudioAccessorySample.timestamp;
  v13 = mach_absolute_time();
  v18 = sub_18F1FD20C(v13);
  if (self->_inEarStatus == 4)
    var1 = a3->var1;
  else
    var1 = 0;
  if (var1)
    v20 = objc_msgSend_returnDefaultPose(self, v14, v15, v16, v17);
  else
    v20 = 1;
  if (objc_msgSend_returnRandomPose(self, v14, v15, v16, v17))
    v25 = objc_msgSend_returnDefaultPose(self, v21, v22, v23, v24) ^ 1;
  else
    v25 = 0;
  value = self->_headTrackingService.__ptr_.__value_;
  v27 = *(_DWORD *)(*((_QWORD *)value + 4686) + 112);
  v28 = *((unsigned __int8 *)value + 16058);
  if (!v20)
  {
    v29 = v10;
    v32 = v7;
    v31 = v8;
    v30 = v9;
    if (!v25)
      goto LABEL_17;
LABEL_14:
    v33 = (double)arc4random_uniform(0x1E8481u) + -1000000.0;
    v34 = (double)arc4random_uniform(0x1E8481u) + -1000000.0;
    v35 = arc4random_uniform(0x1E8481u);
    v36 = 0;
    v37 = v33;
    v38 = v34;
    v39 = (double)v35 + -1000000.0;
    v54 = v37;
    v55 = v38;
    v56 = v39;
    v40 = 0.0;
    do
    {
      v40 = v40 + (float)(*(float *)((char *)&v54 + v36) * *(float *)((char *)&v54 + v36));
      v36 += 4;
    }
    while (v36 != 12);
    v41 = sqrtf(v40);
    v42 = v37 / v41;
    v43 = v38 / v41;
    v44 = v39 / v41;
    v45 = (float)((float)arc4random_uniform(0x8CA0u) / 100.0) * 0.017453;
    v54 = v42 * v45;
    v55 = v43 * v45;
    v56 = v44 * v45;
    sub_18F3D3AA8(buf, &v54);
    v32 = buf[0].f32[0];
    v31 = buf[0].f32[1];
    v30 = buf[0].f32[2];
    v29 = buf[0].f32[3];
    goto LABEL_17;
  }
  v29 = 1.0;
  v30 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  if (v25)
    goto LABEL_14;
LABEL_17:
  if (v27 == 2 || v28 == 0)
    v47 = 113;
  else
    v47 = 114;
  v48 = [CMPose alloc];
  *(double *)v53 = v29;
  *(double *)&v53[1] = v32;
  *(double *)&v53[2] = v31;
  *(double *)&v53[3] = v30;
  memset(&v53[4], 0, 24);
  *(double *)&v53[7] = (double)v11 * 0.000001;
  *(double *)&v53[8] = timestamp;
  *(double *)&v53[9] = v18;
  *a4 = (id)objc_msgSend_initWithPose_timestamp_(v48, v49, (uint64_t)v53, v50, v51, (double)var1);
  return v47;
}

- (BOOL)_disallowOpportunisticAnchorTrackingForFTClients:(int)a3 clientMode:(int)a4
{
  BOOL v4;
  BOOL v5;
  CMHeadTrackingService *value;
  NSObject *v7;
  char *v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3 == 1 && (a4 & 0xFFFFFFFE) == 2;
  v5 = v4;
  if (v4)
  {
    self->_scheme = 0;
    value = self->_headTrackingService.__ptr_.__value_;
    if (value)
      sub_18F3F6750(value, 0);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v7 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Disallow opportunisticAnchor tracking for FT clients.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _disallowOpportunisticAnchorTrackingForFTClients:clientMode:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  return v5;
}

- (void)_setTrackingSchemeInternal:(int)a3
{
  uint64_t v3;
  NSObject *v6;
  int scheme;
  NSObject *v8;
  char *v9;
  int v10;
  CMHeadTrackingService *value;
  char *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_scheme != a3
    && (objc_msgSend__disallowOpportunisticAnchorTrackingForFTClients_clientMode_(self, a2, *(uint64_t *)&a3, self->_analyticsClientMode, v3) & 1) == 0)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v6 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      scheme = self->_scheme;
      *(_DWORD *)buf = 67240448;
      v14 = scheme;
      v15 = 1026;
      v16 = a3;
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Tracking scheme changed - old: %{public}d new: %{public}d", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _setTrackingSchemeInternal:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
    switch(a3)
    {
      case 0:
        self->_scheme = 0;
        break;
      case 1:
        v10 = 1;
        goto LABEL_22;
      case 2:
        v10 = 2;
        goto LABEL_22;
      case 3:
        v10 = 3;
LABEL_22:
        self->_scheme = v10;
        break;
      default:
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v8 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240192;
          v14 = a3;
          _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Invalid input scheme %{public}d", buf, 8u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v9 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _setTrackingSchemeInternal:]", "CoreLocation: %s\n", v9);
          if (v9 != (char *)buf)
            free(v9);
        }
        break;
    }
    value = self->_headTrackingService.__ptr_.__value_;
    if (value)
      sub_18F3F6750(value, self->_scheme);
  }
}

- (CMMediaSession)init
{
  return (CMMediaSession *)((uint64_t (*)(CMMediaSession *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__initWithOptions_, 0);
}

- (int)_mapCMMediaSessionClientModeToRelDMClientMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4)
    return a3;
  else
    return 0;
}

- (void)_readFrontCameraToDisplayCenterOffset
{
  void *v3;
  void *v4;
  CFTypeID v5;
  NSObject *v6;
  uint8_t *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements = 0;
  self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2] = 0.0;
  v3 = (void *)MGCopyAnswer();
  if (!v3)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v8 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Anchor offset from display center is not available. Defaulting to zero.", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 == -1)
    {
LABEL_26:
      v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _readFrontCameraToDisplayCenterOffset]", "CoreLocation: %s\n");
LABEL_27:
      if (v7 != buf)
        free(v7);
      return;
    }
LABEL_29:
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    goto LABEL_26;
  }
  v4 = v3;
  v5 = CFGetTypeID(v3);
  if (v5 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v4) > 1)
  {
    v9 = v4;
    v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11, v12);
    objc_msgSend_floatValue(v13, v14, v15, v16, v17);
    v19 = v18 * 0.001;
    v23 = (void *)objc_msgSend_objectAtIndexedSubscript_(v9, v20, 1, v21, v22);
    objc_msgSend_floatValue(v23, v24, v25, v26, v27);
    self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0] = v28 * 0.001;
    self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1] = v19;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v29 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0] * 1000.0);
      v31 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1] * 1000.0);
      v32 = (float)(self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2] * 1000.0);
      *(_DWORD *)buf = 134349568;
      v34 = v30;
      v35 = 2050;
      v36 = v31;
      v37 = 2050;
      v38 = v32;
      _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Anchor offset from display center x: %{public}.1f mm, y: %{public}.1f mm, z: %{public}.1f mm", buf, 0x20u);
    }
    if (!sub_18F1FCA08(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 == -1)
      goto LABEL_26;
    goto LABEL_29;
  }
  CFRelease(v4);
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v6 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_ERROR, "[CMMediaSession] Anchor offset from display center data has wrong type. Defaulting to zero.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v7 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _readFrontCameraToDisplayCenterOffset]", "CoreLocation: %s\n");
    goto LABEL_27;
  }
}

- (id)_initWithOptions:(id)a3
{
  CMMediaSession *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  _BOOL4 v91;
  uint64_t v92;
  int v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  int v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  char v103;
  char v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  char v108;
  char v109;
  NSObject *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  char v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  char v123;
  char v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  int v128;
  __int16 v129;
  _BOOL4 v130;
  uint64_t v131;
  _BOOL4 v132;
  NSObject *v133;
  const char *v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  int v144;
  uint64_t v145;
  char v146;
  char v147;
  uint64_t v148;
  int v149;
  int v150;
  NSObject *v151;
  NSObject *v152;
  float v153;
  uint64_t v154;
  int v155;
  int v156;
  float v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v163;
  uint64_t v164;
  const char *v165;
  char *v166;
  const char *v167;
  char *v168;
  const char *v169;
  char *v170;
  const char *v171;
  char *v172;
  const char *v173;
  char *v174;
  const char *v175;
  char *v176;
  float v177;
  uint64_t v178;
  int v179;
  int v180;
  float v181;
  char *v182;
  char *v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  NSObject *v188;
  NSObject *v189;
  _DWORD v190[3];
  objc_super v191;
  _BYTE v192[12];
  _BYTE buf[18];
  __int16 v194;
  const char *v195;
  __int16 v196;
  const char *v197;
  uint64_t v198;

  v198 = *MEMORY[0x1E0C80C00];
  v191.receiver = self;
  v191.super_class = (Class)CMMediaSession;
  v5 = -[CMMediaSession init](&v191, sel_init);
  v6 = (uint64_t)v5;
  if (v5)
  {
    v5->_started = 0;
    v5->_scheme = 0;
    v5->_prevAmbienceBedRoll = 0.0;
    v5->_lastSourceTimestampMicroSeconds = 0;
    v5->_lastStateTimestamp = 0;
    v5->_lastAccessoryTimestamp = 0;
    v5->_predictionIntervalMicroseconds = 100000;
    v5->_trackingEstimatesStagnated = 0;
    v5->_lastTimesyncLostTime = 0.0;
    v5->_lidAngle = -1.0;
    *(_QWORD *)&v5->_displayCount = 0x1FFFFFFFFLL;
    v5->_clientMode = 0;
    v5->_analyticsClientMode = 0;
    *(_QWORD *)&v5->_schemePrev = 0;
    v5->_bypassWalkingAwayDistractedViewing = 0;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v7 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Creating CMMediaSession with options: %{private}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 == -1)
        goto LABEL_150;
      goto LABEL_217;
    }
    while (1)
    {
      if (a3)
      {
        if (objc_msgSend_valueForKey_(a3, v8, (uint64_t)CFSTR("CMMediaSessionClientMode"), v10, v11))
        {
          v15 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v12, (uint64_t)CFSTR("CMMediaSessionClientMode"), v13, v14);
          v20 = objc_msgSend_intValue(v15, v16, v17, v18, v19);
          v24 = objc_msgSend__mapCMMediaSessionClientModeToRelDMClientMode_((void *)v6, v21, v20, v22, v23);
          *(_DWORD *)(v6 + 328) = v24;
          *(_DWORD *)(v6 + 68) = v24;
        }
        if (objc_msgSend_valueForKey_(a3, v12, (uint64_t)CFSTR("AlwaysOnAnchor"), v13, v14))
        {
          v28 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v25, (uint64_t)CFSTR("AlwaysOnAnchor"), v26, v27);
          if (objc_msgSend_BOOLValue(v28, v29, v30, v31, v32))
            *(_DWORD *)(v6 + 80) = 2;
        }
        if (objc_msgSend_valueForKey_(a3, v25, (uint64_t)CFSTR("OpportunisticAnchor"), v26, v27))
        {
          v36 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v33, (uint64_t)CFSTR("OpportunisticAnchor"), v34, v35);
          if (objc_msgSend_BOOLValue(v36, v37, v38, v39, v40))
            *(_DWORD *)(v6 + 80) = 1;
        }
        if (objc_msgSend_valueForKey_(a3, v33, (uint64_t)CFSTR("TrackingScheme"), v34, v35))
        {
          v44 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v41, (uint64_t)CFSTR("TrackingScheme"), v42, v43);
          if (objc_msgSend_intValue(v44, v45, v46, v47, v48))
          {
            v49 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v41, (uint64_t)CFSTR("TrackingScheme"), v42, v43);
            v54 = objc_msgSend_intValue(v49, v50, v51, v52, v53);
            if (v54 <= 3)
              *(_DWORD *)(v6 + 80) = v54;
          }
        }
        if (objc_msgSend_valueForKey_(a3, v41, (uint64_t)CFSTR("AnchorRateHz"), v42, v43))
        {
          v58 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v55, (uint64_t)CFSTR("AnchorRateHz"), v56, v57);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v184 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v59, v60, v61, v62);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v184, v185, (uint64_t)a2, v6, (uint64_t)CFSTR("CMMediaSession.mm"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[AnchorRateHzValue isKindOfClass:[NSNumber class]]"));
          }
          objc_msgSend_floatValue(v58, v59, v60, v61, v62);
          *(_QWORD *)(v6 + 600) = (unint64_t)(1000000.0 / v63);
        }
        if (objc_msgSend_valueForKey_(a3, v55, (uint64_t)CFSTR("PredictionIntervalMicroseconds"), v56, v57))
        {
          v67 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v64, (uint64_t)CFSTR("PredictionIntervalMicroseconds"), v65, v66);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v186 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v68, v69, v70, v71);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v186, v187, (uint64_t)a2, v6, (uint64_t)CFSTR("CMMediaSession.mm"), 619, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[predictionIntervalMicrosecondsValue isKindOfClass:[NSNumber class]]"));
          }
          *(_QWORD *)(v6 + 72) = objc_msgSend_unsignedLongLongValue(v67, v68, v69, v70, v71);
        }
        if (objc_msgSend_valueForKey_(a3, v64, (uint64_t)CFSTR("OnlineHeadToHeadsetTransformationEstimator"), v65, v66))
        {
          v72 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v8, (uint64_t)CFSTR("OnlineHeadToHeadsetTransformationEstimator"), v10, v11);
          if (objc_msgSend_BOOLValue(v72, v73, v74, v75, v76))
            *(_BYTE *)(v6 + 100) = 1;
        }
      }
      *(_DWORD *)(v6 + 248) = -1;
      *(_DWORD *)(v6 + 264) = 0;
      *(_DWORD *)(v6 + 280) = -1;
      if ((objc_msgSend_isActivityAvailable(CMMotionActivityManager, v8, v9, v10, v11) & 1) != 0
        || objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, v77, v78, v79, v80))
      {
        *(_QWORD *)(v6 + 544) = objc_opt_new();
        *(_QWORD *)(v6 + 552) = objc_opt_new();
      }
      else
      {
        *(_OWORD *)(v6 + 544) = 0u;
      }
      v81 = (char *)operator new();
      sub_18F20CC1C(v81, CFSTR("com.apple.CoreMotion"), 1);
      v86 = *(_QWORD *)(v6 + 560);
      *(_QWORD *)(v6 + 560) = v81;
      if (v86)
        (*(void (**)(uint64_t))(*(_QWORD *)v86 + 8))(v86);
      objc_msgSend__updateTrackingSchemeSettings((void *)v6, v82, v83, v84, v85);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      a3 = (id)qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        v87 = *(_QWORD *)(v6 + 600);
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&buf[4] = v87;
        _os_log_impl(&dword_18F1DC000, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] anchor rate initialized with default: %{public}llu", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v164 = *(_QWORD *)(v6 + 600);
        *(_DWORD *)v192 = 134349056;
        *(_QWORD *)&v192[4] = v164;
        a2 = buf;
        a3 = (id)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", (const char *)a3);
        if (a3 != buf)
          free(a3);
      }
      v88 = *(_QWORD *)(v6 + 560);
      buf[0] = 0;
      v89 = sub_18F1EE9B4(v88, (uint64_t)CFSTR("TempestDisable2IMUForMac"), buf);
      v90 = buf[0] ? v89 : 0;
      *(_BYTE *)(v6 + 101) = v90;
      if (v90 != 1)
        break;
      sub_18F1F77DC();
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v188 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v194 = 2082;
        v195 = "assert";
        v196 = 2081;
        v197 = "!_disable2IMU || CLPlatformInfo::instance()->isMacBook()";
        _os_log_impl(&dword_18F1DC000, v188, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMediaSession] Only disable 2-IMU on Macs\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      }
      v189 = qword_1EE16D820;
      if (os_signpost_enabled((os_log_t)qword_1EE16D820))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v194 = 2082;
        v195 = "assert";
        v196 = 2081;
        v197 = "!_disable2IMU || CLPlatformInfo::instance()->isMacBook()";
        _os_signpost_emit_with_name_impl(&dword_18F1DC000, v189, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMediaSession] Only disable 2-IMU on Macs", "{\"msg%{public}.0s\":\"[CMMediaSession] Only disable 2-IMU on Macs\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      }
      v6 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        v194 = 2082;
        v195 = "assert";
        v196 = 2081;
        v197 = "!_disable2IMU || CLPlatformInfo::instance()->isMacBook()";
        _os_log_impl(&dword_18F1DC000, (os_log_t)v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMediaSession] Only disable 2-IMU on Macs\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
      __break(1u);
LABEL_217:
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
LABEL_150:
      *(_DWORD *)v192 = 138477827;
      *(_QWORD *)&v192[4] = a3;
      v163 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v163);
      if (v163 != buf)
        free(v163);
    }
    v91 = (sub_18F1F781C() & 4) != 0 && *(_BYTE *)(v6 + 101) == 0;
    *(_WORD *)(v6 + 284) = 0;
    *(_BYTE *)(v6 + 286) = 0;
    *(_QWORD *)(v6 + 288) = 0;
    *(_DWORD *)(v6 + 296) = 0;
    *(_DWORD *)(v6 + 320) = 0;
    v92 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v93 = sub_18F1EE9B4(v92, (uint64_t)CFSTR("HeadTrackingControllerEnabled"), buf) ^ 1;
    if (buf[0])
      v94 = 1;
    else
      v94 = v93;
    v95 = operator new();
    sub_18F44C020(v95, *(_DWORD *)(v6 + 68), *(_DWORD *)(v6 + 80), v94);
    v96 = v6 + 8;
    sub_18F3BBFBC((uint64_t *)(v6 + 8), v95);
    v97 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v98 = (uint64_t *)(v6 + 560);
    v99 = sub_18F1EE9B4(v97, (uint64_t)CFSTR("HeadTrackingInEarGatingEnabled"), buf) ^ 1;
    if (buf[0])
      LOBYTE(v99) = 1;
    *(_BYTE *)(v6 + 660) = v99;
    v100 = *v98;
    buf[0] = 0;
    v101 = sub_18F1EE9B4(v100, (uint64_t)CFSTR("TempestEnableJBLThreshold"), buf) ^ 1;
    if (buf[0])
      LOBYTE(v101) = 1;
    *(_BYTE *)(v6 + 520) = v101;
    v102 = *v98;
    buf[0] = 0;
    v103 = sub_18F1EE9B4(v102, (uint64_t)CFSTR("SimulateCameraOnOffRequest"), buf);
    if (buf[0])
      v104 = v103;
    else
      v104 = 0;
    *(_BYTE *)(v6 + 124) = v104;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v105 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v6 + 124))
        v106 = "enabled";
      else
        v106 = "disabled";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v106;
      _os_log_impl(&dword_18F1DC000, v105, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] SimulateCameraOnOffRequest: %{public}s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      if (*(_BYTE *)(v6 + 124))
        v165 = "enabled";
      else
        v165 = "disabled";
      *(_DWORD *)v192 = 136446210;
      *(_QWORD *)&v192[4] = v165;
      v166 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v166);
      if (v166 != buf)
        free(v166);
    }
    v107 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v108 = sub_18F1EE9B4(v107, (uint64_t)CFSTR("SimulatePeriodicCameraBurst"), buf);
    if (buf[0])
      v109 = v108;
    else
      v109 = 0;
    *(_BYTE *)(v6 + 125) = v109;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v110 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v6 + 125))
        v111 = "enabled";
      else
        v111 = "disabled";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v111;
      _os_log_impl(&dword_18F1DC000, v110, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] SimulatePeriodicCameraBurst: %{public}s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      if (*(_BYTE *)(v6 + 125))
        v167 = "enabled";
      else
        v167 = "disabled";
      *(_DWORD *)v192 = 136446210;
      *(_QWORD *)&v192[4] = v167;
      v168 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v168);
      if (v168 != buf)
        free(v168);
    }
    if (*(_BYTE *)(v6 + 125))
    {
      objc_msgSend__updateCameraControllerParameters((void *)v6, v112, v113, v114, v115);
      v116 = *(_QWORD *)(v6 + 8) + 27521;
      *(_BYTE *)v116 = *(_BYTE *)(v6 + 125);
      *(_QWORD *)(v116 + 3) = *(_QWORD *)(v6 + 608);
    }
    v117 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v118 = sub_18F1EE9B4(v117, (uint64_t)CFSTR("BypassCameraController"), buf);
    if (buf[0])
      v119 = v118;
    else
      v119 = 0;
    *(_BYTE *)(v6 + 127) = v119;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v120 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v6 + 127))
        v121 = "enabled";
      else
        v121 = "disabled";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v121;
      _os_log_impl(&dword_18F1DC000, v120, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] BypassCameraController state: %{public}s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      if (*(_BYTE *)(v6 + 127))
        v169 = "enabled";
      else
        v169 = "disabled";
      *(_DWORD *)v192 = 136446210;
      *(_QWORD *)&v192[4] = v169;
      v170 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v170);
      if (v170 != buf)
        free(v170);
    }
    v122 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v123 = sub_18F1EE9B4(v122, (uint64_t)CFSTR("BypassWalkingAwayDistractedViewing"), buf);
    if (buf[0])
      v124 = v123;
    else
      v124 = 0;
    *(_BYTE *)(v6 + 128) = v124;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v125 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v6 + 128))
        v126 = "enabled";
      else
        v126 = "disabled";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v126;
      _os_log_impl(&dword_18F1DC000, v125, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] BypassWalkingAwayDistractedViewing state: %{public}s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      if (*(_BYTE *)(v6 + 128))
        v171 = "enabled";
      else
        v171 = "disabled";
      *(_DWORD *)v192 = 136446210;
      *(_QWORD *)&v192[4] = v171;
      v172 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v172);
      if (v172 != buf)
        free(v172);
    }
    if (*(_BYTE *)(v6 + 128))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v96 + 37488) + 89) = 1;
    v127 = *(_QWORD *)(v6 + 560);
    *(_WORD *)buf = 0;
    v128 = sub_18F3692B0(v127, (uint64_t)CFSTR("TempestJBLThresholdMilliseconds"), buf);
    v129 = *(_WORD *)buf;
    if (!v128)
      v129 = 150;
    *(_WORD *)(v6 + 682) = v129;
    *(_WORD *)(v6 + 680) = -1;
    *(_BYTE *)(v6 + 684) = 0;
    v130 = *(_BYTE *)(*(_QWORD *)(v6 + 8) + 4) == 0;
    v131 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    if (sub_18F1EE9B4(v131, (uint64_t)CFSTR("SitStandDetectorEnabled"), buf))
      v132 = buf[0] != 0;
    else
      v132 = v130;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v133 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v134 = "disabled";
      if (v132)
        v134 = "enabled";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v134;
      _os_log_impl(&dword_18F1DC000, v133, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Sit-stand status: %{public}s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v173 = "disabled";
      if (v132)
        v173 = "enabled";
      *(_DWORD *)v192 = 136446210;
      *(_QWORD *)&v192[4] = v173;
      v174 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v174);
      if (v174 != buf)
        free(v174);
    }
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v135 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v136 = "noSrcIMU";
      if (v91)
        v136 = "hasSrcIMU";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v136;
      _os_log_impl(&dword_18F1DC000, v135, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] srcIMU status: %s", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v175 = "noSrcIMU";
      if (v91)
        v175 = "hasSrcIMU";
      *(_DWORD *)v192 = 136315138;
      *(_QWORD *)&v192[4] = v175;
      v176 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v176);
      if (v176 != buf)
        free(v176);
    }
    v137 = *(_QWORD *)(v6 + 8);
    *(_BYTE *)(v137 + 37504) = v132;
    *(_BYTE *)(v137 + 37505) = v91;
    *(_BYTE *)(v6 + 686) = 1;
    *(_BYTE *)(v6 + 100) = 0;
    sub_18F3F6924(v137, 0);
    objc_msgSend__updateUserSettings((void *)v6, v138, v139, v140, v141);
    v142 = *(_QWORD *)(v6 + 560);
    buf[0] = 0;
    v143 = (uint64_t *)(v6 + 560);
    v144 = sub_18F1EE9B4(v142, (uint64_t)CFSTR("MotionContextSessionEnabled"), buf) ^ 1;
    if (buf[0])
      LOBYTE(v144) = 1;
    *(_BYTE *)(v6 + 687) = v144;
    v145 = *v143;
    buf[0] = 0;
    v146 = sub_18F1EE9B4(v145, (uint64_t)CFSTR("HumanMotionLearningModelEnabled"), buf);
    if (buf[0])
      v147 = v146;
    else
      v147 = 0;
    *(_BYTE *)(v6 + 688) = v147;
    v148 = *v143;
    buf[0] = 0;
    v149 = sub_18F1EE9B4(v148, (uint64_t)CFSTR("TempestBypassAmbienceBedForE2ELatencyTesting"), buf);
    if (buf[0])
      v150 = v149;
    else
      v150 = 0;
    *(_BYTE *)(v6 + 704) = v150;
    if (v150 == 1)
    {
      sub_18F40F8EC(*(_QWORD *)v96 + 27344);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v151 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v151, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Bypassing ambience bed alignment. This should only be used for E2E latency testing.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        *(_WORD *)v192 = 0;
        v183 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v183);
        if (v183 != buf)
          free(v183);
      }
    }
    *(_QWORD *)(v6 + 708) = 0;
    *(_QWORD *)(v6 + 716) = 0x3F80000000000000;
    sub_18F1F77DC();
    if (sub_18F1E1B00() && MGGetSInt32Answer() == 180)
    {
      *(_QWORD *)v192 = 0;
      *(_DWORD *)&v192[8] = 1078530011;
      sub_18F3D3AA8((float32x4_t *)buf, (float *)v192);
      *(_OWORD *)(v6 + 708) = *(_OWORD *)buf;
    }
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v152 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v153 = sub_18F3D3B4C((float32x4_t *)(v6 + 708));
      v154 = 0;
      *(float *)v192 = v153;
      *(_DWORD *)&v192[4] = v155;
      *(_DWORD *)&v192[8] = v156;
      v157 = 0.0;
      do
      {
        v157 = v157 + (float)(*(float *)&v192[v154] * *(float *)&v192[v154]);
        v154 += 4;
      }
      while (v154 != 12);
      *(_DWORD *)buf = 134349056;
      *(double *)&buf[4] = (float)(sqrtf(v157) * 57.296);
      _os_log_impl(&dword_18F1DC000, v152, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] opportunistic-anchor-sensor-to-source frame alignment rotation: %{public}.2f deg", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v177 = sub_18F3D3B4C((float32x4_t *)(v6 + 708));
      v178 = 0;
      *(float *)v190 = v177;
      v190[1] = v179;
      v190[2] = v180;
      v181 = 0.0;
      do
      {
        v181 = v181 + (float)(*(float *)&v190[v178] * *(float *)&v190[v178]);
        ++v178;
      }
      while (v178 != 3);
      *(_DWORD *)v192 = 134349056;
      *(double *)&v192[4] = (float)(sqrtf(v181) * 57.296);
      v182 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _initWithOptions:]", "CoreLocation: %s\n", v182);
      if (v182 != buf)
        free(v182);
    }
    objc_msgSend__readFrontCameraToDisplayCenterOffset((void *)v6, v158, v159, v160, v161);
    *(_QWORD *)(v6 + 752) = 0;
    *(_OWORD *)(v6 + 736) = 0u;
  }
  return (id)v6;
}

- (void)_reset
{
  NSObject *v2;
  char *v3;
  uint8_t buf[1640];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_18F3F631C((uint64_t)self->_headTrackingService.__ptr_.__value_, 1);
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v2 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Resetting relDMService.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _reset]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf)
      free(v3);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  if (self->_started)
    objc_msgSend__stop(self, a2, v2, v3, v4);
  objc_msgSend__disableLoggingForReplay(self, a2, v2, v3, v4);

  v6.receiver = self;
  v6.super_class = (Class)CMMediaSession;
  -[CMMediaSession dealloc](&v6, sel_dealloc);
}

- (BOOL)_start
{
  _BOOL4 started;
  NSObject *v4;
  Dispatcher *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Dispatcher *v11;
  uint64_t v12;
  int v13;
  uint64_t *value;
  uint64_t v15;
  double v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  NSObject *v33;
  int clientMode;
  int v35;
  char *v36;
  char *v38;
  _QWORD v39[5];
  int v40;
  int v41;
  uint8_t buf[4];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  started = self->_started;
  if (self->_started)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v4 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] _start is called multiple times", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      LOWORD(v40) = 0;
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _start]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf)
        free(v38);
    }
    objc_sync_exit(self);
    return !started;
  }
  self->_started = 1;
  objc_sync_exit(self);
  v5 = (Dispatcher *)operator new();
  v5->var0 = (void **)off_1E294C238;
  v5->var0 = (void **)&off_1E294C698;
  v5->var1 = 0;
  v5[1].var0 = (void **)sub_18F3AF9F0;
  v5[1].var1 = self;
  self->_accessoryDeviceMotionConfigDispatcher = v5;
  v6 = sub_18F4317A8();
  sub_18F1F4F0C(v6, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher, -1.0);
  objc_msgSend__startDefaultsPreferenceUpdater(self, v7, v8, v9, v10);
  v11 = (Dispatcher *)operator new();
  v11->var0 = (void **)off_1E294C238;
  v11->var0 = (void **)&off_1E294C4D8;
  v11->var1 = 0;
  v11[1].var0 = (void **)sub_18F3AFA04;
  v11[1].var1 = self;
  self->_accessoryDeviceMotionInEarStatusDispatcher = v11;
  v12 = sub_18F4317A8();
  sub_18F1F4F0C(v12, 3, (uint64_t)self->_accessoryDeviceMotionInEarStatusDispatcher, -1.0);
  objc_sync_enter(self);
  if (self->_inEarStatusGatingEnabled)
  {
    sub_18F4317A8();
    v13 = sub_18F4A2BCC();
  }
  else
  {
    v13 = 4;
  }
  self->_inEarStatus = v13;
  if (self->_logForReplay)
  {
    value = (uint64_t *)self->_logger.__ptr_.__value_;
    v15 = mach_continuous_time();
    v16 = sub_18F1FD20C(v15);
    sub_18F365620(value, v13, v16);
  }
  objc_sync_exit(self);
  if (self->_inEarStatus == 4
    && (v17 = sub_18F4317A8(), v18 = (_QWORD *)sub_18F4D6638(), sub_18F4D7BF0(v18, *(_QWORD *)(v17 + 80))))
  {
    v19 = sub_18F204AE4();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_18F3AFA10;
    v39[3] = &unk_1E2955938;
    v39[4] = self;
    sub_18F1F5E28(v19, (uint64_t)v39);
  }
  else
  {
    v24 = sub_18F4317A8();
    v25 = (_QWORD *)sub_18F4D6638();
    LOBYTE(v24) = sub_18F4D7BF0(v25, *(_QWORD *)(v24 + 80));
    objc_msgSend__notifyClientHandler(self, v26, v27, v28, v29);
    if ((v24 & 1) != 0)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v30 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] #Warning Not starting head tracking because one bud is out of ear!", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      LOWORD(v40) = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _start]", "CoreLocation: %s\n", v31);
    }
    else
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v32 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_ERROR, "[CMMediaSession] Not starting head tracking because the connected device is not supported!", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_30;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      LOWORD(v40) = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _start]", "CoreLocation: %s\n", v31);
    }
    if (v31 != (char *)buf)
      free(v31);
  }
LABEL_30:
  if ((self->_clientMode & 0xFFFFFFFE) == 2)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v33 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      clientMode = self->_clientMode;
      *(_DWORD *)buf = 67109120;
      v43 = clientMode;
      _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Not starting jitterBufferLevelMonitor for clientMode %d", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v35 = self->_clientMode;
      v40 = 67109120;
      v41 = v35;
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _start]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf)
        free(v36);
    }
  }
  else
  {
    objc_msgSend__startJitterBufferLevelMonitor(self, v20, v21, v22, v23);
    self->_startedJitterBufferLevelPolling = 1;
  }
  return !started;
}

- (void)_startHeadTracking
{
  CMMediaSessionAnalyticsTracker *v3;
  CMMediaSessionAnalyticsTracker *value;
  uint64_t v5;
  double sessionStartTime;
  CMMediaSessionAnalyticsTracker *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CLDeviceMotionProperties *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  Dispatcher *v16;
  id v17;
  uint64_t v18;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v20;
  uint64_t v21;
  int analyticsClientMode;
  Dispatcher *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  CMMotionContextSession *mcSession;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  CMMotionContextSession *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  _QWORD v74[5];
  __int16 v75;
  uint8_t buf[8];
  uint64_t v77;
  uint64_t (*v78)(uint64_t);
  void *v79;
  uint64_t v80;
  Dispatcher *v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!self->_analyticsTracker.__ptr_.__value_)
  {
    v3 = (CMMediaSessionAnalyticsTracker *)operator new();
    sub_18F34AEE0((uint64_t)v3);
    value = self->_analyticsTracker.__ptr_.__value_;
    self->_analyticsTracker.__ptr_.__value_ = v3;
    if (value)
      sub_18F3BC02C(value);
  }
  v5 = mach_continuous_time();
  self->_sessionStartTime = sub_18F1FD20C(v5);
  sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_, CFSTR("sessionDuration"));
  sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 30, CFSTR("auxAndSrcQuiescent"));
  sessionStartTime = self->_sessionStartTime;
  self->_lastInBTZTime = sessionStartTime;
  self->_lastAccessoryDMTime = sessionStartTime;
  self->_previousTrackingEnabled = 1;
  self->_lastDistractedViewingStartTime = 0.0;
  v7 = self->_analyticsTracker.__ptr_.__value_;
  if (v7)
    *((_DWORD *)v7 + 375) = self->_analyticsClientMode;
  v8 = sub_18F1FE420();
  v9 = MEMORY[0x1E0C809B0];
  if (v8 && !self->_disable2IMU && !self->_deviceMotionDispatcher)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v10 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting source DM", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v75 = 0;
      v73 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v73);
      if (v73 != (char *)buf)
        free(v73);
    }
    v11 = [CLDeviceMotionProperties alloc];
    v15 = (void *)objc_msgSend_initWithMode_(v11, v12, 3, v13, v14);
    v16 = (Dispatcher *)operator new();
    v16->var0 = (void **)off_1E294C238;
    v17 = v15;
    v16->var0 = (void **)&off_1E294C350;
    v16->var1 = v17;
    v16[1].var0 = (void **)sub_18F3B02F4;
    v16[1].var1 = self;
    self->_deviceMotionDispatcher = v16;

    v18 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v20 = sub_18F204AE4();
    *(_QWORD *)buf = v9;
    v77 = 3221225472;
    v78 = sub_18F1F998C;
    v79 = &unk_1E2956F80;
    v80 = v18;
    v81 = deviceMotionDispatcher;
    v82 = 0x3F747AE140000000;
    sub_18F1F5E28(v20, (uint64_t)buf);
  }
  if (!self->_accessoryDeviceMotionDispatcher)
  {
    *(_BYTE *)(sub_18F4317A8() + 28) = 1;
    v21 = sub_18F4317A8();
    analyticsClientMode = self->_analyticsClientMode;
    *(_DWORD *)(v21 + 384) = analyticsClientMode;
    v23 = (Dispatcher *)operator new();
    v23->var0 = (void **)off_1E294C238;
    v23->var0 = (void **)&off_1E294C660;
    v23->var1 = 0;
    v23[1].var0 = (void **)sub_18F3B0308;
    v23[1].var1 = self;
    self->_accessoryDeviceMotionDispatcher = v23;
    v24 = sub_18F4317A8();
    v25 = 0.0199999996;
    if ((analyticsClientMode & 0xFFFFFFFE) == 2)
      v25 = 0.0149999997;
    sub_18F1F4F0C(v24, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher, v25);
  }
  sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 42, CFSTR("durationOfSessionHeadtracked"));
  v74[0] = v9;
  v74[1] = 3221225472;
  v74[2] = sub_18F3B031C;
  v74[3] = &unk_1E2956B98;
  v74[4] = self;
  if (objc_msgSend_isActivityAvailable(CMMotionActivityManager, v26, v27, v28, v29)
    && !self->_disable2IMU)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v40 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v40, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting Motion Activity updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v75 = 0;
      v71 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v71);
      if (v71 != (char *)buf)
        free(v71);
    }
    objc_msgSend_startActivityUpdatesToQueue_withHandler_(self->_activityManager, v41, (uint64_t)self->_activityQueue, (uint64_t)v74, v42);
  }
  else if (objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, v30, v31, v32, v33)&& !self->_disable2IMU)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v43 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v43, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting Motion Activity Lite updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v75 = 0;
      v72 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v72);
      if (v72 != (char *)buf)
        free(v72);
    }
    objc_msgSend_startActivityLiteUpdatesToQueue_withHandler_(self->_activityManager, v44, (uint64_t)self->_activityQueue, (uint64_t)v74, v45);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v34 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Motion Activity or Activity Lite updates are not available", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v75 = 0;
      v39 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _startHeadTracking]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)buf)
        free(v39);
    }
  }
  mcSession = self->_mcSession;
  if (mcSession)
    goto LABEL_45;
  if (self->_motionContextSessonEnabled)
  {
    v50 = (id)objc_opt_new();
    v54 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v51, self->_logForReplay, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v55, v54, (uint64_t)CFSTR("kCMMotionContextSessionLogMSL"), v56);
    if (self->_logForReplay)
    {
      v61 = objc_msgSend_mcLogPath(self, v57, v58, v59, v60);
      objc_msgSend_setObject_forKeyedSubscript_(v50, v62, v61, (uint64_t)CFSTR("kCMMotionContextSessionMSLFilePath"), v63);
    }
    v64 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v57, self->_humanMotionLearningModelEnabled, v59, v60);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v65, v64, (uint64_t)CFSTR("kCMMotionContextSessionUseMLModel"), v66);
    v67 = [CMMotionContextSession alloc];
    mcSession = (CMMotionContextSession *)objc_msgSend_initWithOptions_(v67, v68, (uint64_t)v50, v69, v70);
    self->_mcSession = mcSession;
    if (mcSession)
    {
LABEL_45:
      objc_msgSend_start(mcSession, v35, v36, v37, v38);
      objc_msgSend_setTrackingClientMode_(self->_mcSession, v47, *(_DWORD *)self->_headTrackingService.__ptr_.__value_, v48, v49);
    }
  }
}

- (void)_triggerUserInteractedWithDeviceEvent
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3B079C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (BOOL)_startPoseUpdatesToQueue:(id)a3 andHandler:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v7 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Starting push updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _startPoseUpdatesToQueue:andHandler:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  if (!a3)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v14 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "queue";
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    }
    v15 = qword_1EE16D820;
    if (os_signpost_enabled((os_log_t)qword_1EE16D820))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMediaSession] client queue is nil", "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    }
    v16 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "queue";
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMediaSession] client queue is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_34:
    abort_report_np();
  }
  if (!a4)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v17 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "handler";
      _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    }
    v18 = qword_1EE16D820;
    if (os_signpost_enabled((os_log_t)qword_1EE16D820))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "handler";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "[CMMediaSession] client handler is nil", "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    }
    v19 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "handler";
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"[CMMediaSession] client handler is nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_34;
  }
  self->_clientQueue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  self->_clientHandler = _Block_copy(a4);
  return objc_msgSend__start(self, v8, v9, v10, v11);
}

- (void)_stopHeadTracking
{
  uint64_t v3;
  double v4;
  CMMediaSessionAnalyticsTracker *value;
  char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CMMediaSessionAnalyticsTracker *v13;
  _OWORD *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  _OWORD *v28;
  __int128 v29;
  _OWORD *v30;
  __int128 v31;
  CMMediaSessionAnalyticsTracker *v32;
  __int128 v33;
  NSObject *v34;
  CMMediaSessionAnalyticsTracker *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CMMotionActivityManager *activityManager;
  uint64_t v41;
  uint64_t v42;
  Dispatcher *deviceMotionDispatcher;
  uint64_t v44;
  Dispatcher *v45;
  uint64_t v46;
  Dispatcher *accessoryDeviceMotionDispatcher;
  uint64_t v48;
  Dispatcher *v49;
  CMHeadTrackingService *v50;
  CMMotionContextSession *mcSession;
  double v52;
  double v53;
  double v54;
  int v55;
  char *v56;
  char *v57;
  char *v58;
  __int128 buf;
  void *v60;
  void *v61;
  uint64_t v62;
  Dispatcher *v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = mach_continuous_time();
  v4 = sub_18F1FD20C(v3);
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
  {
    v6 = (char *)self->_headTrackingService.__ptr_.__value_ + 16040;
    if (!*v6 && *((double *)value + 3) > 0.0)
    {
      v7 = v4 - self->_lastInBTZTime;
      v9 = *((double *)value + 58);
      v8 = *((double *)value + 59);
      if (v8 <= v7)
        v8 = v4 - self->_lastInBTZTime;
      if (v9 >= v7)
        v9 = v4 - self->_lastInBTZTime;
      *((double *)value + 58) = v9;
      *((double *)value + 59) = v8;
      *((double *)value + 60) = v7 + *((double *)value + 60);
      ++*((_DWORD *)value + 122);
    }
    v10 = v4 - self->_lastAccessoryDMTime;
    v12 = *((double *)value + 54);
    v11 = *((double *)value + 55);
    if (v11 <= v10)
      v11 = v4 - self->_lastAccessoryDMTime;
    if (v12 >= v10)
      v12 = v4 - self->_lastAccessoryDMTime;
    *((double *)value + 54) = v12;
    *((double *)value + 55) = v11;
    *((double *)value + 56) = v10 + *((double *)value + 56);
    ++*((_DWORD *)value + 114);
    if (!self->_previousTrackingEnabled && v6[18])
    {
      v52 = v4 - self->_lastDistractedViewingStartTime;
      v53 = *((double *)value + 79);
      if (v53 <= v52)
        v53 = v52;
      *((double *)value + 79) = v53;
      v54 = *((double *)value + 78);
      if (v54 >= v52)
        v54 = v52;
      *((double *)value + 78) = v54;
      *((double *)value + 80) = v52 + *((double *)value + 80);
      ++*((_DWORD *)value + 162);
      v55 = *((_DWORD *)value + 313);
      if (v55 != -1)
        *((_DWORD *)value + 313) = v55 + 1;
    }
    sub_18F408688((double *)value, CFSTR("sessionDuration"));
    v13 = self->_analyticsTracker.__ptr_.__value_;
    if (*((double *)v13 + 24) > 0.0)
    {
      sub_18F408688((double *)v13 + 24, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 26) > 0.0)
    {
      sub_18F408688((double *)v13 + 26, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 28) > 0.0)
    {
      sub_18F408688((double *)v13 + 28, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 30) > 0.0)
    {
      sub_18F408688((double *)v13 + 30, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 34) > 0.0)
    {
      sub_18F408688((double *)v13 + 34, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    if (*((double *)v13 + 36) > 0.0)
    {
      sub_18F408688((double *)v13 + 36, &stru_1E295ADC8);
      v13 = self->_analyticsTracker.__ptr_.__value_;
    }
    v14 = (_OWORD *)((char *)self->_headTrackingService.__ptr_.__value_ + 37416);
    *(_OWORD *)((char *)v13 + 1432) = *v14;
    *(_OWORD *)((char *)v13 + 1448) = v14[1];
    if (self->_firstAccessoryDMTime == 0.0)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v15 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        v16 = *((_QWORD *)self->_analyticsTracker.__ptr_.__value_ + 1);
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_ERROR, "[CMMediaSession] No accessory DM received during entire session of %.3f seconds", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v56 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v56);
        if (v56 != (char *)&buf)
          free(v56);
      }
      v13 = self->_analyticsTracker.__ptr_.__value_;
      *((_QWORD *)v13 + 176) = *((_QWORD *)v13 + 1);
    }
    if (self->_firstValidPoseTime == 0.0)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v17 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        v18 = *((_QWORD *)self->_analyticsTracker.__ptr_.__value_ + 1);
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_ERROR, "[CMMediaSession] No valid pose available during entire session of %.3f seconds", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v57 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v57);
        if (v57 != (char *)&buf)
          free(v57);
      }
      v13 = self->_analyticsTracker.__ptr_.__value_;
      *((_QWORD *)v13 + 177) = *((_QWORD *)v13 + 1);
    }
    v19 = *((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686);
    *((_QWORD *)v13 + 164) = *(_QWORD *)(v19 + 128);
    v20 = *(_OWORD *)(v19 + 136);
    *(_OWORD *)((char *)v13 + 828) = *(_OWORD *)(v19 + 148);
    *((_OWORD *)v13 + 51) = v20;
    v21 = *((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686);
    v22 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 848);
    v23 = *(_OWORD *)(v21 + 168);
    *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)(v21 + 180);
    *v22 = v23;
    v24 = *((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686);
    v25 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 880);
    v26 = *(_OWORD *)(v24 + 200);
    *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)(v24 + 212);
    *v25 = v26;
    v27 = *((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686);
    v28 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 912);
    v29 = *(_OWORD *)(v27 + 232);
    *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(v27 + 244);
    *v28 = v29;
    v30 = (_OWORD *)((char *)self->_analyticsTracker.__ptr_.__value_ + 944);
    v31 = *(_OWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 264);
    *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 276);
    *v30 = v31;
    v32 = self->_analyticsTracker.__ptr_.__value_;
    v33 = *(_OWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 360);
    *((_OWORD *)v32 + 86) = *(_OWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 376);
    *((_OWORD *)v32 + 85) = v33;
    sub_18F34B3C8((uint64_t)self->_analyticsTracker.__ptr_.__value_);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v34 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_ERROR, "Calling _stop and analytics tracker hasn't been created. Called without _start?", (uint8_t *)&buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v58 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _stopHeadTracking]", "CoreLocation: %s\n", v58);
      if (v58 != (char *)&buf)
        free(v58);
    }
  }
  objc_sync_enter(self);
  v35 = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (v35)
    sub_18F3BC02C(v35);
  objc_sync_exit(self);
  activityManager = self->_activityManager;
  if (activityManager)
    objc_msgSend_stopActivityUpdates(activityManager, v36, v37, v38, v39);
  v41 = MEMORY[0x1E0C809B0];
  if (self->_deviceMotionDispatcher)
  {
    v42 = sub_18F1FE420();
    deviceMotionDispatcher = self->_deviceMotionDispatcher;
    v44 = sub_18F204AE4();
    *(_QWORD *)&buf = v41;
    *((_QWORD *)&buf + 1) = 3221225472;
    v60 = sub_18F1FA1A4;
    v61 = &unk_1E2958238;
    v62 = v42;
    v63 = deviceMotionDispatcher;
    sub_18F1F5E28(v44, (uint64_t)&buf);
    v45 = self->_deviceMotionDispatcher;
    if (v45)
      (*((void (**)(Dispatcher *))v45->var0 + 1))(v45);
    self->_deviceMotionDispatcher = 0;
  }
  if (self->_accessoryDeviceMotionDispatcher)
  {
    v46 = sub_18F4317A8();
    accessoryDeviceMotionDispatcher = self->_accessoryDeviceMotionDispatcher;
    v48 = sub_18F204AE4();
    *(_QWORD *)&buf = v41;
    *((_QWORD *)&buf + 1) = 3221225472;
    v60 = sub_18F1F5EE0;
    v61 = &unk_1E2956E98;
    v64 = 0;
    v62 = v46;
    v63 = accessoryDeviceMotionDispatcher;
    sub_18F1F5E28(v48, (uint64_t)&buf);
    v49 = self->_accessoryDeviceMotionDispatcher;
    if (v49)
      (*((void (**)(Dispatcher *))v49->var0 + 1))(v49);
    self->_accessoryDeviceMotionDispatcher = 0;
    v50 = self->_headTrackingService.__ptr_.__value_;
    if (v50)
      sub_18F3F631C((uint64_t)v50, 1);
    sub_18F3B1628((uint64_t)&self->_unsyncedAuxHelper, 1);
  }
  mcSession = self->_mcSession;
  if (mcSession)
    objc_msgSend_stop(mcSession, v36, v37, v38, v39);
}

- (void)_stop
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Dispatcher *accessoryDeviceMotionInEarStatusDispatcher;
  uint64_t v10;
  Dispatcher *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  Dispatcher *accessoryDeviceMotionConfigDispatcher;
  uint64_t v20;
  Dispatcher *v21;
  NSObject *v22;
  char *v23;
  char *v24;
  _QWORD v25[5];
  __int16 v26;
  uint8_t buf[8];
  uint64_t v28;
  uint64_t *(*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  Dispatcher *v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (self->_started)
  {
    self->_started = 0;
    objc_sync_exit(self);
    if (self->_startedJitterBufferLevelPolling)
    {
      objc_msgSend__stopJitterBufferLevelMonitor(self, v3, v4, v5, v6);
      self->_startedJitterBufferLevelPolling = 0;
    }
    v7 = MEMORY[0x1E0C809B0];
    if (self->_accessoryDeviceMotionInEarStatusDispatcher)
    {
      v8 = sub_18F4317A8();
      accessoryDeviceMotionInEarStatusDispatcher = self->_accessoryDeviceMotionInEarStatusDispatcher;
      v10 = sub_18F204AE4();
      *(_QWORD *)buf = v7;
      v28 = 3221225472;
      v29 = sub_18F1F5EE0;
      v30 = &unk_1E2956E98;
      v33 = 3;
      v31 = v8;
      v32 = accessoryDeviceMotionInEarStatusDispatcher;
      sub_18F1F5E28(v10, (uint64_t)buf);
      v11 = self->_accessoryDeviceMotionInEarStatusDispatcher;
      if (v11)
        (*((void (**)(Dispatcher *))v11->var0 + 1))(v11);
      self->_accessoryDeviceMotionInEarStatusDispatcher = 0;
    }
    v12 = sub_18F204AE4();
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = sub_18F3B1C74;
    v25[3] = &unk_1E2955938;
    v25[4] = self;
    sub_18F1F5E28(v12, (uint64_t)v25);
    objc_sync_enter(self);
    objc_msgSend__stopDefaultsPreferenceUpdater(self, v13, v14, v15, v16);
    if (self->_clientQueue)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v17 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Stopping push updates", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v26 = 0;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _stop]", "CoreLocation: %s\n", v23);
        if (v23 != (char *)buf)
          free(v23);
      }
      dispatch_release((dispatch_object_t)self->_clientQueue);
      self->_clientQueue = 0;
      _Block_release(self->_clientHandler);
      self->_clientHandler = 0;
    }
    objc_sync_exit(self);
    if (self->_accessoryDeviceMotionConfigDispatcher)
    {
      v18 = sub_18F4317A8();
      accessoryDeviceMotionConfigDispatcher = self->_accessoryDeviceMotionConfigDispatcher;
      v20 = sub_18F204AE4();
      *(_QWORD *)buf = v7;
      v28 = 3221225472;
      v29 = sub_18F1F5EE0;
      v30 = &unk_1E2956E98;
      v33 = 1;
      v31 = v18;
      v32 = accessoryDeviceMotionConfigDispatcher;
      sub_18F1F5E28(v20, (uint64_t)buf);
      v21 = self->_accessoryDeviceMotionConfigDispatcher;
      if (v21)
        (*((void (**)(Dispatcher *))v21->var0 + 1))(v21);
      self->_accessoryDeviceMotionConfigDispatcher = 0;
    }
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v22 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] _stop is called multiple times", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v26 = 0;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _stop]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    objc_sync_exit(self);
  }
}

- (void)_updateMinQuiescentPeriodForBTZ
{
  CLSettings *value;
  double v4;
  NSObject *v5;
  double minQuiescentPeriodForBTZ;
  CMHeadTrackingService *v7;
  float v8;
  char *v9;
  _BYTE buf[12];
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  value = self->_motionSettings.__ptr_.__value_;
  *(_QWORD *)buf = 0;
  if (sub_18F1EEBEC((uint64_t)value, (uint64_t)CFSTR("TempestMinQuiescentPeriodForBTZ"), buf))
    v4 = *(double *)buf;
  else
    v4 = 5.0;
  if (vabdd_f64(v4, self->_minQuiescentPeriodForBTZ) > 0.0001)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v5 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      minQuiescentPeriodForBTZ = self->_minQuiescentPeriodForBTZ;
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v4;
      v11 = 2048;
      v12 = minQuiescentPeriodForBTZ;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] minQuiescentPeriodForBTZ new: %f old: %f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateMinQuiescentPeriodForBTZ]", "CoreLocation: %s\n", v9);
      if (v9 != buf)
        free(v9);
    }
    v7 = self->_headTrackingService.__ptr_.__value_;
    v8 = v4;
    *((float *)v7 + 3977) = v8;
    *((float *)v7 + 3976) = v8;
    self->_minQuiescentPeriodForBTZ = v4;
    if (self->_logForReplay)
      sub_18F365090((uint64_t *)self->_logger.__ptr_.__value_, "kRelDmMinQuiescentPeriodForBTZ", v4);
  }
}

- (void)_updateUseFwdPredictionUserSettings
{
  CLSettings *value;
  int v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 userSettingFwdPredictorEnabled;
  char *v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v4 = sub_18F1EE9B4((uint64_t)value, (uint64_t)CFSTR("TempestPreferenceFwdPredictorEnabled"), (BOOL *)buf) ^ 1;
  if (buf[0])
    v5 = 1;
  else
    v5 = v4;
  if (self->_userSettingFwdPredictorEnabled != v5)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v6 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      userSettingFwdPredictorEnabled = self->_userSettingFwdPredictorEnabled;
      *(_DWORD *)buf = 67109376;
      v10 = userSettingFwdPredictorEnabled;
      v11 = 1024;
      v12 = v5;
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Changed _userSettingFwdPredictorEnabled from %d to %d.", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUseFwdPredictionUserSettings]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
    *((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 16060) = v5;
    self->_userSettingFwdPredictorEnabled = v5;
  }
}

- (void)_updateTrackingSchemeSettings
{
  CLSettings *value;
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unsigned int v10;

  value = self->_motionSettings.__ptr_.__value_;
  v10 = 0;
  v4 = sub_18F209994((uint64_t)value, (uint64_t)CFSTR("TrackingScheme"), &v10);
  v8 = v10;
  if (v4)
    v9 = v10 == 4;
  else
    v9 = 1;
  if (!v9)
  {
    self->_hasUserDefaultTrackingScheme = 1;
    objc_msgSend__setTrackingSchemeInternal_(self, v5, v8, v6, v7);
  }
}

- (void)_updateAnchorIntervalSettings
{
  CLSettings *value;
  int v4;
  float v5;
  double v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t anchorUpdateIntervalUs;
  char *v10;
  _BYTE buf[12];
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  value = self->_motionSettings.__ptr_.__value_;
  *(_QWORD *)buf = 0;
  v4 = sub_18F1EEBEC((uint64_t)value, (uint64_t)CFSTR("AnchorRateHz"), buf);
  v5 = *(double *)buf;
  v6 = 1.0 / v5 * 1000000.0;
  if (v4)
    v7 = (unint64_t)v6;
  else
    v7 = 33333;
  if (self->_anchorUpdateIntervalUs != v7)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v8 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      anchorUpdateIntervalUs = self->_anchorUpdateIntervalUs;
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)&buf[4] = v7;
      v12 = 2050;
      v13 = anchorUpdateIntervalUs;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] anchorUpdateIntervalUs new: %{public}llu old: %{public}llu", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateAnchorIntervalSettings]", "CoreLocation: %s\n", v10);
      if (v10 != buf)
        free(v10);
    }
    self->_anchorUpdateIntervalUs = v7;
  }
}

- (void)_updateUseHeadToHeadsetTransformationEstimator
{
  CLSettings *value;
  int v4;
  int v5;
  NSObject *v6;
  _BOOL4 useHeadToHeadsetTransformationEstimator;
  char *v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v4 = sub_18F1EE9B4((uint64_t)value, (uint64_t)CFSTR("OnlineHeadToHeadsetTransformationEstimator"), (BOOL *)buf);
  if (buf[0])
    v5 = v4;
  else
    v5 = 0;
  if (self->_useHeadToHeadsetTransformationEstimator != v5)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v6 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      useHeadToHeadsetTransformationEstimator = self->_useHeadToHeadsetTransformationEstimator;
      *(_DWORD *)buf = 67240448;
      v10 = useHeadToHeadsetTransformationEstimator;
      v11 = 1026;
      v12 = v5;
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Changed _useHeadToHeadsetTransformationEstimator from %{public}d to %{public}d.", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUseHeadToHeadsetTransformationEstimator]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
    sub_18F3F6924((uint64_t)self->_headTrackingService.__ptr_.__value_, v5);
    self->_useHeadToHeadsetTransformationEstimator = v5;
  }
}

- (void)_updateCameraControllerParameters
{
  CLSettings *value;
  float v4;
  NSObject *v5;
  double cameraControllerPeriodicBurstPulseWidthSeconds;
  CLSettings *v7;
  float v8;
  NSObject *v9;
  double cameraControllerPeriodicBurstTotalWidthSeconds;
  NSObject *v11;
  char *v12;
  char *v13;
  char *v14;
  _BYTE buf[12];
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  value = self->_motionSettings.__ptr_.__value_;
  *(_QWORD *)buf = 0;
  if (sub_18F1EEBEC((uint64_t)value, (uint64_t)CFSTR("PeriodicCameraBurstPulseWidthSeconds"), buf))
    v4 = *(double *)buf;
  else
    v4 = 2.0;
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v5 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    cameraControllerPeriodicBurstPulseWidthSeconds = self->_cameraControllerPeriodicBurstPulseWidthSeconds;
    *(_DWORD *)buf = 134349312;
    *(double *)&buf[4] = v4;
    v16 = 2050;
    v17 = cameraControllerPeriodicBurstPulseWidthSeconds;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] cameraControllerPeriodicBurstPulseWidthSeconds new: %{public}f old: %{public}f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v13);
    if (v13 != buf)
      free(v13);
  }
  self->_cameraControllerPeriodicBurstPulseWidthSeconds = v4;
  v7 = self->_motionSettings.__ptr_.__value_;
  *(_QWORD *)buf = 0;
  if (sub_18F1EEBEC((uint64_t)v7, (uint64_t)CFSTR("PeriodicCameraBurstTotalWidthSeconds"), buf))
    v8 = *(double *)buf;
  else
    v8 = 5.0;
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v9 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    cameraControllerPeriodicBurstTotalWidthSeconds = self->_cameraControllerPeriodicBurstTotalWidthSeconds;
    *(_DWORD *)buf = 134349312;
    *(double *)&buf[4] = v8;
    v16 = 2050;
    v17 = cameraControllerPeriodicBurstTotalWidthSeconds;
    _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] cameraControllerPeriodicBurstTotalWidthSeconds new: %{public}f old: %{public}f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v14);
    if (v14 != buf)
      free(v14);
  }
  if (v8 >= v4)
  {
    self->_cameraControllerPeriodicBurstTotalWidthSeconds = v8;
  }
  else
  {
    *(_QWORD *)&self->_cameraControllerPeriodicBurstPulseWidthSeconds = 0x40A0000040000000;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v11 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)&buf[4] = 0x4000000000000000;
      v16 = 2050;
      v17 = 5.0;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Overriding cameraControllerPeriodicBurstParameters with defaults : %{public}f : %{public}f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateCameraControllerParameters]", "CoreLocation: %s\n", v12);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)_updateUserSettings
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CLSettings *value;
  unsigned int v13;
  uint64_t v14;
  CLSettings *v15;
  unsigned int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
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
  NSObject *v45;
  char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  CLSettings *v56;
  unsigned int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  CLSettings *v74;
  char v75;
  BOOL v76;
  NSObject *v77;
  _BOOL4 verboseLogging;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  char *v115;
  uint8_t buf[4];
  int v117;
  __int16 v118;
  int v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  sub_18F1E4D5C((uint64_t)self->_motionSettings.__ptr_.__value_);
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v3 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v117 = objc_msgSend_returnDefaultPose(self, v4, v5, v6, v7);
    v118 = 1024;
    v119 = objc_msgSend_returnRandomPose(self, v8, v9, v10, v11);
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEBUG, "[CMMediaSession] checking default and random pose preferences. Current defaultPose: %d, randomPose: %d", buf, 0xEu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    objc_msgSend_returnDefaultPose(self, v99, v100, v101, v102);
    objc_msgSend_returnRandomPose(self, v103, v104, v105, v106);
    v107 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v107);
    if (v107 != (char *)buf)
      free(v107);
  }
  value = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v13 = sub_18F1EE9B4((uint64_t)value, (uint64_t)CFSTR("TempestReturnDefaultPose"), (BOOL *)buf);
  if (buf[0])
    v14 = v13;
  else
    v14 = 0;
  v15 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v16 = sub_18F1EE9B4((uint64_t)v15, (uint64_t)CFSTR("TempestReturnRandomPose"), (BOOL *)buf);
  if (buf[0])
    v21 = v16;
  else
    v21 = 0;
  if ((_DWORD)v14 != objc_msgSend_returnDefaultPose(self, v17, v18, v19, v20)
    || (_DWORD)v21 != objc_msgSend_returnRandomPose(self, v22, v23, v24, v25))
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v26 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v117 = v14;
      v118 = 1024;
      v119 = v21;
      _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Return default/random pose preferences changed: defaultPose: %d, randomPose: %d", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v114 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v114);
      if (v114 != (char *)buf)
        free(v114);
    }
    objc_msgSend_setReturnDefaultPose_(self, v27, v14, v28, v29);
    objc_msgSend_setReturnRandomPose_(self, v30, v21, v31, v32);
    if (objc_msgSend_returnDefaultPose(self, v33, v34, v35, v36))
    {
      objc_msgSend__logEvent_(self, v37, (uint64_t)CFSTR("Returning default pose"), v39, v40);
      if (objc_msgSend_returnRandomPose(self, v41, v42, v43, v44))
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v45 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v45, OS_LOG_TYPE_ERROR, "[CMMediaSession] returning default pose overrides returning random pose preferences", buf, 2u);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v46 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v46);
          if (v46 != (char *)buf)
            free(v46);
        }
      }
    }
    else if (objc_msgSend_returnRandomPose(self, v37, v38, v39, v40))
    {
      objc_msgSend__logEvent_(self, v47, (uint64_t)CFSTR("Returning random pose"), v48, v49);
    }
    else
    {
      objc_msgSend__logEvent_(self, v47, (uint64_t)CFSTR("Returning pose"), v48, v49);
    }
  }
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v50 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEBUG))
  {
    v55 = objc_msgSend_alwaysNotify50HzPose(self, v51, v52, v53, v54);
    *(_DWORD *)buf = 67109120;
    v117 = v55;
    _os_log_impl(&dword_18F1DC000, v50, OS_LOG_TYPE_DEBUG, "[CMMediaSession] checking always notify pose preference. Current alwaysNotify50HzPose: %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    objc_msgSend_alwaysNotify50HzPose(self, v108, v109, v110, v111);
    v112 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v112);
    if (v112 != (char *)buf)
      free(v112);
  }
  v56 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v57 = sub_18F1EE9B4((uint64_t)v56, (uint64_t)CFSTR("TempestAlwaysNotify50HzPose"), (BOOL *)buf);
  if (buf[0])
    v62 = v57;
  else
    v62 = 0;
  if (objc_msgSend_alwaysNotify50HzPose(self, v58, v59, v60, v61) != (_DWORD)v62)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v63 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v117 = v62;
      _os_log_impl(&dword_18F1DC000, v63, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] always notify 50Hz pose preferences changed: alwaysNotify50HzPose: %d", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v115 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v115);
      if (v115 != (char *)buf)
        free(v115);
    }
    objc_msgSend_setAlwaysNotify50HzPose_(self, v64, v62, v65, v66);
    if (objc_msgSend_alwaysNotify50HzPose(self, v67, v68, v69, v70))
      objc_msgSend__logEvent_(self, v71, (uint64_t)CFSTR("Always notify 50Hz pose"), v72, v73);
    else
      objc_msgSend__logEvent_(self, v71, (uint64_t)CFSTR("Only notify pose if valid and hasChanged"), v72, v73);
  }
  v74 = self->_motionSettings.__ptr_.__value_;
  buf[0] = 0;
  v75 = sub_18F1EE9B4((uint64_t)v74, (uint64_t)CFSTR("TempestVerboseLogging"), (BOOL *)buf);
  if (buf[0])
    v76 = v75;
  else
    v76 = 0;
  self->_verboseLogging = v76;
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v77 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    verboseLogging = self->_verboseLogging;
    *(_DWORD *)buf = 67240192;
    v117 = verboseLogging;
    _os_log_impl(&dword_18F1DC000, v77, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] verbose logging enabled: %{public}d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v113 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateUserSettings]", "CoreLocation: %s\n", v113);
    if (v113 != (char *)buf)
      free(v113);
  }
  objc_msgSend__updateMinQuiescentPeriodForBTZ(self, v79, v80, v81, v82);
  objc_msgSend__updateUseFwdPredictionUserSettings(self, v83, v84, v85, v86);
  objc_msgSend__updateTrackingSchemeSettings(self, v87, v88, v89, v90);
  objc_msgSend__updateAnchorIntervalSettings(self, v91, v92, v93, v94);
  objc_msgSend__updateUseHeadToHeadsetTransformationEstimator(self, v95, v96, v97, v98);
}

- (void)_startDefaultsPreferenceUpdater
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  if (!self->_motionDefaults)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v7 = 0;
    self->_motionDefaults = (NSUserDefaults *)objc_msgSend_initWithSuiteName_(v3, v4, (uint64_t)CFSTR("com.apple.CoreMotion"), v5, v6);
    do
      objc_msgSend_addObserver_forKeyPath_options_context_(self->_motionDefaults, v8, (uint64_t)self, (uint64_t)off_1E2956BB8[v7++], 1, self->_motionDefaults);
    while (v7 != 9);
  }
}

- (void)_stopDefaultsPreferenceUpdater
{
  uint64_t v2;
  uint64_t i;

  if (self->_motionDefaults)
  {
    for (i = 0; i != 9; ++i)
      objc_msgSend_removeObserver_forKeyPath_(self->_motionDefaults, a2, (uint64_t)self, (uint64_t)off_1E2956BB8[i], v2);

    self->_motionDefaults = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (self->_motionDefaults == a6)
  {
    objc_msgSend__updateUserSettings(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CMMediaSession;
    -[CMMediaSession observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_startJitterBufferLevelMonitor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD handler[5];

  self->_jitterBufferLevel = -1;
  objc_msgSend__startJitterBufferLevelRetryTimer(self, a2, v2, v3, v4);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_18F3B3624;
  handler[3] = &unk_1E2956C08;
  handler[4] = self;
  notify_register_dispatch("com.apple.bluetooth.AdaptiveJitterBufferChanged", &self->_jitterBufferLevelNotificationToken, MEMORY[0x1E0C80D38], handler);
}

- (void)_stopJitterBufferLevelMonitor
{
  notify_cancel(self->_jitterBufferLevelNotificationToken);
}

- (void)_startJitterBufferLevelRetryTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3B368C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_stopJitterBufferLevelRetryTimer
{
  NSObject *jitterBufferLevelInitialUpdateTimer;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  jitterBufferLevelInitialUpdateTimer = self->_jitterBufferLevelInitialUpdateTimer;
  if (jitterBufferLevelInitialUpdateTimer)
  {
    dispatch_source_cancel(jitterBufferLevelInitialUpdateTimer);
    dispatch_release((dispatch_object_t)self->_jitterBufferLevelInitialUpdateTimer);
    self->_jitterBufferLevelInitialUpdateTimer = 0;
  }
}

- (void)_notifyClientHandler
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMHeadTrackingService *value;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int PoseFromListenerOrientation_Pose;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  CMMediaSessionAnalyticsTracker *v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  BOOL v27;
  int v28;
  int v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  CMMediaSessionAnalyticsTracker *v43;
  NSObject *v44;
  double v45;
  CMMediaSessionAnalyticsTracker *v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double printPoseTimer;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  unsigned int accessoryIMUSampleRate;
  NSObject *clientQueue;
  id clientHandler;
  _QWORD *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  double v88;
  char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unsigned int v101;
  char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  _QWORD block[6];
  int v115;
  _QWORD v116[6];
  int v117;
  void *v118;
  __int128 v119;
  uint64x2_t v120;
  __int16 v121;
  int v122;
  double v123;
  float64x2_t buf;
  double v125;
  float64x2_t v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (self->_clientQueue && self->_clientHandler)
  {
    objc_msgSend__feedPredictorEstimates(self, v3, v4, v5, v6);
    value = self->_headTrackingService.__ptr_.__value_;
    v119 = *((_OWORD *)value + 1709);
    v120 = *((uint64x2_t *)value + 1710);
    v121 = *((_WORD *)value + 13688);
    v118 = 0;
    PoseFromListenerOrientation_Pose = objc_msgSend__createPoseFromListenerOrientation_Pose_(self, v8, (uint64_t)&v119, (uint64_t)&v118, v9);
    if (self->_analyticsTracker.__ptr_.__value_ && !*((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 16058))
    {
      objc_msgSend_machAbsTimestamp(v118, v10, v11, v12, v13);
      v16 = v15;
      objc_msgSend_consumedAuxTimestamp(v118, v17, v18, v19, v20);
      v22 = self->_analyticsTracker.__ptr_.__value_;
      v23 = *((double *)v22 + 91);
      v24 = *((double *)v22 + 90);
      v25 = v16 <= v21 + 0.5;
      v26 = 1.0;
      if (!v25)
        v26 = 0.0;
      if (v23 <= v26)
        v23 = v26;
      if (v24 >= v26)
        v24 = v26;
      *((double *)v22 + 91) = v23;
      *((double *)v22 + 90) = v24;
      *((double *)v22 + 92) = v26 + *((double *)v22 + 92);
      ++*((_DWORD *)v22 + 186);
    }
    if ((_BYTE)v121)
      v27 = HIBYTE(v121) == 0;
    else
      v27 = 1;
    v28 = !v27;
    v29 = self->_notify50HzPoseDecimator + 1;
    self->_notify50HzPoseDecimator = v29;
    if (v29 == 4)
    {
      self->_notify50HzPoseDecimator = 0;
      if ((v28 & 1) != 0)
      {
LABEL_22:
        if (self->_logForReplay)
        {
          v128 = 0;
          v129 = 0;
          v130 = 0;
          buf = vmulq_f64(vcvtq_f64_u64(v120), (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL));
          v126 = vcvtq_f64_f32(*(float32x2_t *)&v119);
          v125 = *((float *)&v119 + 3);
          v127 = *((float *)&v119 + 2);
          objc_msgSend_consumedAuxTimestamp(v118, v10, v11, v12, v13);
          v128 = v30;
          objc_msgSend_receivedAuxTimestamp(v118, v31, v32, v33, v34);
          v129 = v35;
          objc_msgSend_machAbsTimestamp(v118, v36, v37, v38, v39);
          v130 = v40;
          sub_18F364254((uint64_t *)self->_logger.__ptr_.__value_, &buf);
        }
        if (self->_firstValidPoseTime == 0.0)
        {
          v41 = mach_continuous_time();
          v42 = sub_18F1FD20C(v41);
          self->_firstValidPoseTime = v42;
          v43 = self->_analyticsTracker.__ptr_.__value_;
          if (v43)
            *((double *)v43 + 177) = v42 - self->_sessionStartTime;
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v44 = qword_1EE16D820;
          if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
          {
            v45 = self->_firstValidPoseTime - self->_sessionStartTime;
            LODWORD(buf.f64[0]) = 134217984;
            *(double *)((char *)buf.f64 + 4) = v45;
            _os_log_impl(&dword_18F1DC000, v44, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] First non unit quaternion pose after %.3f seconds", (uint8_t *)&buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1EE16D818 != -1)
              dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
            v88 = self->_firstValidPoseTime - self->_sessionStartTime;
            v122 = 134217984;
            v123 = v88;
            v89 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v89);
            if (v89 != (char *)&buf)
              free(v89);
          }
        }
        v46 = self->_analyticsTracker.__ptr_.__value_;
        if (v46 && !*((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 16058))
        {
          objc_msgSend_machAbsTimestamp(v118, v10, v11, v12, v13);
          v48 = v47;
          objc_msgSend_consumedAuxTimestamp(v118, v49, v50, v51, v52);
          v54 = v48 - v53;
          v55 = *((double *)v46 + 95);
          if (v55 <= v54)
            v55 = v54;
          *((double *)v46 + 95) = v55;
          v56 = *((double *)v46 + 94);
          if (v56 >= v54)
            v56 = v54;
          *((double *)v46 + 94) = v56;
          *((double *)v46 + 96) = v54 + *((double *)v46 + 96);
          ++*((_DWORD *)v46 + 194);
        }
        printPoseTimer = self->_printPoseTimer;
        v58 = mach_continuous_time();
        if (printPoseTimer < sub_18F1FD20C(v58))
        {
          v59 = mach_continuous_time();
          self->_printPoseTimer = sub_18F1FD20C(v59) + 5.0;
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v60 = qword_1EE16D820;
          if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
          {
            v65 = (void *)objc_msgSend_description(v118, v61, v62, v63, v64);
            v70 = objc_msgSend_UTF8String(v65, v66, v67, v68, v69);
            LODWORD(buf.f64[0]) = 136380675;
            *(_QWORD *)((char *)buf.f64 + 4) = v70;
            _os_log_impl(&dword_18F1DC000, v60, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] %{private}s", (uint8_t *)&buf, 0xCu);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1EE16D818 != -1)
              dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
            v94 = (void *)objc_msgSend_description(v118, v90, v91, v92, v93);
            v99 = objc_msgSend_UTF8String(v94, v95, v96, v97, v98);
            v122 = 136380675;
            v123 = *(double *)&v99;
            v100 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v100);
            if (v100 != (char *)&buf)
              free(v100);
          }
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v71 = qword_1EE16D820;
          if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
          {
            accessoryIMUSampleRate = self->_accessoryIMUSampleRate;
            LODWORD(buf.f64[0]) = 67174657;
            HIDWORD(buf.f64[0]) = accessoryIMUSampleRate;
            _os_log_impl(&dword_18F1DC000, v71, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] current accessory samples per second: %{private}d", (uint8_t *)&buf, 8u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            if (qword_1EE16D818 != -1)
              dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
            v101 = self->_accessoryIMUSampleRate;
            v122 = 67174657;
            LODWORD(v123) = v101;
            v102 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v102);
            if (v102 != (char *)&buf)
              free(v102);
          }
        }
        clientQueue = self->_clientQueue;
        clientHandler = self->_clientHandler;
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = sub_18F3B452C;
        v116[3] = &unk_1E2956C58;
        v116[4] = v118;
        v116[5] = clientHandler;
        v117 = PoseFromListenerOrientation_Pose;
        v75 = v116;
LABEL_58:
        dispatch_async(clientQueue, v75);
        goto LABEL_59;
      }
      v28 = objc_msgSend_alwaysNotify50HzPose(self, v10, v11, v12, v13);
    }
    if (v28)
      goto LABEL_22;
    if (self->_inEarStatus != 4)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v76 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        v81 = (void *)objc_msgSend_description(v118, v77, v78, v79, v80);
        v86 = objc_msgSend_UTF8String(v81, v82, v83, v84, v85);
        LODWORD(buf.f64[0]) = 136380675;
        *(_QWORD *)((char *)buf.f64 + 4) = v86;
        _os_log_impl(&dword_18F1DC000, v76, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] %{private}s", (uint8_t *)&buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v107 = (void *)objc_msgSend_description(v118, v103, v104, v105, v106);
        v112 = objc_msgSend_UTF8String(v107, v108, v109, v110, v111);
        v122 = 136380675;
        v123 = *(double *)&v112;
        v113 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _notifyClientHandler]", "CoreLocation: %s\n", v113);
        if (v113 != (char *)&buf)
          free(v113);
      }
      clientQueue = self->_clientQueue;
      v87 = self->_clientHandler;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_18F3B4540;
      block[3] = &unk_1E2956C58;
      block[4] = v118;
      block[5] = v87;
      v115 = PoseFromListenerOrientation_Pose;
      v75 = block;
      goto LABEL_58;
    }
  }
LABEL_59:
  objc_sync_exit(self);
}

- (void)_feedSourceDeviceIMU:(const Sample *)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float y;
  int8x16_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  float32x4_t v22;
  uint64_t v23;
  float v24;
  float32x2_t v25;
  float v26;
  int32x2_t v27;
  int v28;
  uint8_t buf[1640];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = self->_accessorySampleTimer + 1.0;
  v6 = mach_continuous_time();
  if (v5 < sub_18F1FD20C(v6))
  {
    self->_accessoryIMUSampleRate = self->_accessorySamplesPerSecond;
    self->_accessorySamplesPerSecond = 0;
    v7 = mach_continuous_time();
    self->_accessorySampleTimer = sub_18F1FD20C(v7);
  }
  v27 = vdup_n_s32(0x37E5D90Du);
  v28 = 937810189;
  v8 = sub_18F1FE3CC((double *)&a3->acceleration.x);
  v9 = *((float *)&a3[1].acceleration + 3);
  v11 = v10 + *(float *)&a3[2].timestamp;
  v25.f32[0] = a3[1].acceleration.z + v8;
  v25.f32[1] = v12 + v9;
  v26 = v11;
  y = a3[2].acceleration.y;
  v23 = *(_QWORD *)((char *)&a3[2].timestamp + 4);
  v24 = y;
  v14 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->acceleration.x), *(float64x2_t *)&a3[1].timestamp);
  v22 = (float32x4_t)vextq_s8(v14, v14, 4uLL);
  sub_18F1FFE94(&v22, v22);
  objc_sync_enter(self);
  if ((HIWORD(a3[4].acceleration.y) & 0x100) != 0)
  {
    v21 = (unint64_t)(a3->timestamp * 1000000.0);
    self->_lastSourceTimestampMicroSeconds = v21;
    sub_18F3F85F4((float32x2_t *)self->_headTrackingService.__ptr_.__value_, &v22, &v25, (uint64_t)&v23, (uint64_t)&v27, v21);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v15 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Not feeding SrcDM due to uninitialized DM status.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedSourceDeviceIMU:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
  }
  if (self->_logForReplay)
    sub_18F363720((uint64_t *)self->_logger.__ptr_.__value_, &a3->timestamp);
  objc_msgSend__notifyClientHandler(self, v16, v17, v18, v19);
  objc_sync_exit(self);
}

- (void)_feedDisplayCount:(unsigned int)a3
{
  NSObject *v5;
  int displayCount;
  CMHeadTrackingService *value;
  int v8;
  NSObject *v9;
  CMMediaSessionAnalyticsTracker *v10;
  unsigned int maxDisplayCount;
  unsigned int v12;
  int v13;
  double lidAngle;
  int schemePrev;
  NSObject *v16;
  int v17;
  CMMediaSessionAnalyticsTracker *v18;
  char *v19;
  char *v20;
  char *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_displayCount != a3)
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v5 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      displayCount = self->_displayCount;
      *(_DWORD *)buf = 67240448;
      v23 = displayCount;
      v24 = 1026;
      v25 = a3;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Display count changed: from %{public}u, to %{public}u", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
    value = self->_headTrackingService.__ptr_.__value_;
    if (!value)
      goto LABEL_36;
    if (a3 <= 1)
    {
      if (a3 != 1)
      {
LABEL_36:
        self->_displayCount = a3;
        return;
      }
      lidAngle = self->_lidAngle;
      if (lidAngle < 0.0 || lidAngle >= 25.0)
      {
        schemePrev = self->_schemePrev;
        if (schemePrev)
        {
          sub_18F3F6750(value, schemePrev);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v16 = qword_1EE16D820;
          if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
          {
            v17 = self->_schemePrev;
            *(_DWORD *)buf = 67240192;
            v23 = v17;
            _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] External display detached, change tracking scheme back to %{public}d", buf, 8u);
          }
          if (sub_18F1FCA08(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE16D818 != -1)
              dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
            v21 = (char *)_os_log_send_and_compose_impl();
            sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v21);
            if (v21 != (char *)buf)
              free(v21);
          }
          v18 = self->_analyticsTracker.__ptr_.__value_;
          if (v18 && *((double *)v18 + 52) > 0.0)
            sub_18F408688((double *)v18 + 52, &stru_1E295ADC8);
        }
        goto LABEL_36;
      }
    }
    v8 = *((_DWORD *)value + 10);
    self->_schemePrev = v8;
    if (v8)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v9 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] External display attached, change tracking scheme to IMUOnly", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v20 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedDisplayCount:]", "CoreLocation: %s\n", v20);
        if (v20 != (char *)buf)
          free(v20);
      }
      sub_18F3F6750(self->_headTrackingService.__ptr_.__value_, 0);
    }
    v10 = self->_analyticsTracker.__ptr_.__value_;
    if (v10)
    {
      maxDisplayCount = self->_maxDisplayCount;
      if (maxDisplayCount < a3)
      {
        v12 = 0;
        v13 = *((_DWORD *)v10 + 331);
        do
        {
          if (v13 != -1)
          {
            *((_DWORD *)v10 + 331) = ++v13;
            maxDisplayCount = self->_maxDisplayCount;
          }
          ++v12;
        }
        while (v12 < a3 - maxDisplayCount);
        self->_maxDisplayCount = a3;
      }
      sub_18F4084AC((double *)v10 + 52, CFSTR("externalScreenDuration"));
    }
    goto LABEL_36;
  }
}

- (void)_feedLidAngle:(double)a3
{
  self->_lidAngle = a3;
}

- (void)_feedFaceKitData:(id)a3 timestamp:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
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
  void *Object;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  unsigned int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  unsigned int v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  int v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  int v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  int v164;
  int v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  int v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  float32x4_t v192;
  double v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  float v202;
  float v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  float v212;
  float v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  float32x4_t v222;
  float v223;
  float v224;
  float v225;
  unsigned __int8 v226;
  float v227;
  int v228;
  int v229;
  int v230;
  int v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  int v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  double lidAngle;
  const char *v259;
  uint64_t v260;
  NSObject *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  char *v270;
  char *v271;
  void *v272;
  int v274;
  char v275;
  char v276;
  int v277;
  uint64_t v278;
  float32x4_t v279;
  int v280;
  uint64_t v281;
  _BYTE v282[12];
  int v283;
  int v284;
  __int32 v285;
  _BYTE buf[24];
  double v287;
  float64x2_t v288;
  double v289;
  float v290;
  int v291;
  int v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  int v297;
  uint64_t v298;
  uint64_t v299;

  v299 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("rm_camera_id"), v4, v5);
  v12 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v9, (uint64_t)CFSTR("rm_tracked_faces"), v10, v11);
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v13 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349312;
    *(_QWORD *)&buf[4] = objc_msgSend_unsignedLongValue(v8, v14, v15, v16, v17);
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = objc_msgSend_count(v12, v18, v19, v20, v21);
    _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEBUG, "[CMMediaSession][Cam %{public}lu] Received %{public}lu faces", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v280 = 134349312;
    v281 = objc_msgSend_unsignedLongValue(v8, v262, v263, v264, v265);
    *(_WORD *)v282 = 2050;
    *(_QWORD *)&v282[2] = objc_msgSend_count(v12, v266, v267, v268, v269);
    v270 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedFaceKitData:timestamp:]", "CoreLocation: %s\n", v270);
    if (v270 != buf)
      free(v270);
  }
  Object = (void *)objc_msgSend_firstObject(v12, v22, v23, v24, v25);
  v30 = Object;
  if (Object)
  {
    v31 = (void *)objc_msgSend_objectForKeyedSubscript_(Object, v27, (uint64_t)CFSTR("raw_data"), v28, v29);
    v35 = (void *)objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("pose"), v33, v34);
    v39 = (void *)objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)CFSTR("rotation"), v37, v38);
    v43 = (void *)objc_msgSend_objectForKeyedSubscript_(v35, v40, (uint64_t)CFSTR("translation"), v41, v42);
    v47 = (void *)objc_msgSend_objectForKeyedSubscript_(v31, v44, (uint64_t)CFSTR("data_failure"), v45, v46);
    v51 = (void *)objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("image_too_dark"), v49, v50);
    v55 = (void *)objc_msgSend_objectForKeyedSubscript_(v47, v52, (uint64_t)CFSTR("sensor_covered"), v53, v54);
    v272 = (void *)objc_msgSend_objectForKeyedSubscript_(v30, v56, (uint64_t)CFSTR("failure_type"), v57, v58);
    v62 = (void *)objc_msgSend_objectForKeyedSubscript_(v30, v59, (uint64_t)CFSTR("confidence"), v60, v61);
    v66 = objc_msgSend_objectForKeyedSubscript_(v30, v63, (uint64_t)CFSTR("AngleInfoRoll"), v64, v65);
    if (v39 && v43)
    {
      v70 = (void *)v66;
      v71 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v67, 0, v68, v69);
      v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(v71, v72, 0, v73, v74);
      objc_msgSend_floatValue(v75, v76, v77, v78, v79);
      v81 = v80;
      v85 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v82, 1, v83, v84);
      v89 = (void *)objc_msgSend_objectAtIndexedSubscript_(v85, v86, 0, v87, v88);
      objc_msgSend_floatValue(v89, v90, v91, v92, v93);
      v95 = v94;
      v99 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v96, 2, v97, v98);
      v103 = (void *)objc_msgSend_objectAtIndexedSubscript_(v99, v100, 0, v101, v102);
      objc_msgSend_floatValue(v103, v104, v105, v106, v107);
      v109 = v108;
      v113 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v110, 0, v111, v112);
      v117 = (void *)objc_msgSend_objectAtIndexedSubscript_(v113, v114, 1, v115, v116);
      objc_msgSend_floatValue(v117, v118, v119, v120, v121);
      v123 = v122;
      v127 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v124, 1, v125, v126);
      v131 = (void *)objc_msgSend_objectAtIndexedSubscript_(v127, v128, 1, v129, v130);
      objc_msgSend_floatValue(v131, v132, v133, v134, v135);
      v137 = v136;
      v141 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v138, 2, v139, v140);
      v145 = (void *)objc_msgSend_objectAtIndexedSubscript_(v141, v142, 1, v143, v144);
      objc_msgSend_floatValue(v145, v146, v147, v148, v149);
      v151 = v150;
      v155 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v152, 0, v153, v154);
      v159 = (void *)objc_msgSend_objectAtIndexedSubscript_(v155, v156, 2, v157, v158);
      objc_msgSend_floatValue(v159, v160, v161, v162, v163);
      v165 = v164;
      v169 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v166, 1, v167, v168);
      v173 = (void *)objc_msgSend_objectAtIndexedSubscript_(v169, v170, 2, v171, v172);
      objc_msgSend_floatValue(v173, v174, v175, v176, v177);
      v179 = v178;
      v183 = (void *)objc_msgSend_objectAtIndexedSubscript_(v39, v180, 2, v181, v182);
      v187 = (void *)objc_msgSend_objectAtIndexedSubscript_(v183, v184, 2, v185, v186);
      objc_msgSend_floatValue(v187, v188, v189, v190, v191);
      v280 = v81;
      v281 = __PAIR64__(v109, v95);
      *(_DWORD *)v282 = v123;
      *(_DWORD *)&v282[4] = v137;
      *(_DWORD *)&v282[8] = v151;
      v283 = v165;
      v284 = v179;
      v285 = v192.i32[0];
      v279.i64[0] = 0;
      v279.i64[1] = 0x3F80000000000000;
      v193 = sub_18F3D49B8(&v279, (float *)&v280, v192);
      v197 = (void *)objc_msgSend_objectAtIndexedSubscript_(v43, v194, 0, v195, v196, v193);
      objc_msgSend_floatValue(v197, v198, v199, v200, v201);
      v203 = v202;
      v207 = (void *)objc_msgSend_objectAtIndexedSubscript_(v43, v204, 1, v205, v206);
      objc_msgSend_floatValue(v207, v208, v209, v210, v211);
      v213 = v212;
      v217 = (void *)objc_msgSend_objectAtIndexedSubscript_(v43, v214, 2, v215, v216);
      objc_msgSend_floatValue(v217, v218, v219, v220, v221);
      v223 = v203 * 0.001;
      v224 = v213 * 0.001;
      v225 = v222.f32[0] * 0.001;
      v226 = atomic_load((unsigned __int8 *)qword_1ECEDF180);
      if ((v226 & 1) == 0)
      {
        if (__cxa_guard_acquire(qword_1ECEDF180))
        {
          xmmword_1ECEDF190 = xmmword_18F506540;
          sub_18F1FFE94((float32x4_t *)&xmmword_1ECEDF190, (float32x4_t)xmmword_18F506540);
          __cxa_guard_release(qword_1ECEDF180);
        }
      }
      sub_18F3D3764((uint64_t)&xmmword_1ECEDF190, v279.f32, (float32x4_t *)buf, v222);
      v279 = *(float32x4_t *)buf;
      v227 = sub_18F3D39F4((float *)&xmmword_1ECEDF190, v223, v224, v225);
      v229 = v228;
      v231 = v230;
      objc_msgSend_floatValue(v62, v232, v233, v234, v235);
      v274 = v236;
      v275 = objc_msgSend_BOOLValue(v51, v237, v238, v239, v240);
      v276 = objc_msgSend_BOOLValue(v55, v241, v242, v243, v244);
      v277 = objc_msgSend_intValue(v272, v245, v246, v247, v248);
      objc_msgSend_doubleValue(v70, v249, v250, v251, v252);
      v278 = v253;
      *(_QWORD *)buf = CFAbsoluteTimeGetCurrent();
      *(double *)&buf[8] = a4;
      *(_QWORD *)&buf[16] = 0x100000002;
      v287 = v279.f32[3];
      v288 = vcvtq_f64_f32(*(float32x2_t *)v279.f32);
      v289 = v279.f32[2];
      v290 = v227;
      v291 = v229;
      v292 = v231;
      v293 = 0u;
      v294 = 0u;
      v295 = 0u;
      v296 = 0u;
      v297 = objc_msgSend_unsignedIntValue(v8, v254, v255, v256, v257);
      v298 = 0;
      lidAngle = self->_lidAngle;
      *(float *)&lidAngle = lidAngle;
      objc_msgSend__feedPoseAnchor_facePoseError_lidAngleDeg_(self, v259, (uint64_t)buf, (uint64_t)&v274, v260, lidAngle);
    }
    else if (self->_inEarStatus == 4)
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v261 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v261, OS_LOG_TYPE_ERROR, "[CMMediaSession] Rotation matrix or translation is missing", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        LOWORD(v280) = 0;
        v271 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedFaceKitData:timestamp:]", "CoreLocation: %s\n", v271);
        if (v271 != buf)
          free(v271);
      }
    }
  }
}

- (void)_feedPoseAnchor:(const Sample *)a3 facePoseError:(id *)a4 lidAngleDeg:(float)a5
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int8x16_t v13;
  float32x4_t v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  char *v23;
  float v24;
  float v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  CMMediaSessionAnalyticsTracker *v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  int var3;
  double var0;
  CMMediaSessionAnalyticsTracker *value;
  int v46;
  CMMediaSessionAnalyticsTracker *v47;
  int v48;
  CMMediaSessionAnalyticsTracker *v49;
  int v50;
  int v51;
  double v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[18];
  __int16 v64;
  uint64_t v65;
  uint8_t buf[4];
  float v67;
  _BYTE v68[10];
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v9 = *(_OWORD *)&a3[4].acceleration.z;
    v60 = *(_OWORD *)&a3[4].timestamp;
    v61 = v9;
    v62 = *(_OWORD *)&a3[5].acceleration.x;
    v10 = *(_OWORD *)&a3[2].timestamp;
    v56 = *(_OWORD *)&a3[1].acceleration.x;
    v57 = v10;
    v11 = *(_OWORD *)&a3[3].acceleration.x;
    v58 = *(_OWORD *)&a3[2].acceleration.z;
    v59 = v11;
    v12 = *(_OWORD *)&a3->acceleration.z;
    v54 = *(_OWORD *)&a3->timestamp;
    v55 = v12;
    sub_18F1F77DC();
    if ((sub_18F1E1B00() & 1) != 0)
    {
      v13 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3[1].timestamp), *(float64x2_t *)&a3[1].acceleration.z);
      *(int8x16_t *)v63 = vextq_s8(v13, v13, 4uLL);
      v14 = sub_18F1FFE94((float32x4_t *)v63, *(float32x4_t *)v63);
      sub_18F3D3764((uint64_t)&self->_cameraToSourceAlignment, (float *)v63, (float32x4_t *)buf, v14);
      v15 = sub_18F3D39F4(self->_cameraToSourceAlignment.elements, a3[2].acceleration.x, a3[2].acceleration.y, a3[2].acceleration.z);
      v18 = *(float *)buf;
      v19 = v67;
      v20 = *(float *)v68;
      *((double *)&v56 + 1) = v67;
      *(double *)&v57 = *(float *)v68;
      v21 = *(float *)&v68[4];
      *((double *)&v55 + 1) = *(float *)&v68[4];
      *(double *)&v56 = *(float *)buf;
    }
    else
    {
      v19 = *((double *)&v56 + 1);
      v20 = *(double *)&v57;
      v21 = *((double *)&v55 + 1);
      v18 = *(double *)&v56;
      v16 = *((float *)&v57 + 3);
      v15 = *((float *)&v57 + 2);
      v17 = *(float *)&v58;
    }
    v24 = v15 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[0];
    v25 = v16 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[1];
    v26 = v17 + self->_offsetFromDisplayCenterToFrontCameraInSourceFrameMeters.elements[2];
    *((float *)&v57 + 2) = v24;
    *((float *)&v57 + 3) = v25;
    *(float *)&v58 = v26;
    objc_sync_enter(self);
    if (self->_logForReplay)
      sub_18F363A48((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)&v54, (int *)a4, self->_lidAngle);
    if (!self->_simulateCameraOnOffRequest
      || self->_scheme != 1
      || self->_bypassCameraController
      || *((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 27520))
    {
      v34 = (unint64_t)(*(double *)&a3->acceleration.x * 1000000.0);
      if (a4->var3 || a4->var0 <= 0.8)
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v42 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          var3 = a4->var3;
          var0 = a4->var0;
          *(float *)buf = 1.5048e-36;
          v67 = *(float *)&var3;
          *(_WORD *)v68 = 2048;
          *(double *)&v68[2] = var0;
          v69 = 2048;
          v70 = v34;
          _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] anchor is IGNORED due to failure or low confidence. failureCode: %u, confidence: %f, timestamp: %llu", buf, 0x1Cu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v51 = a4->var3;
          v52 = a4->var0;
          *(_DWORD *)v63 = 67109632;
          *(_DWORD *)&v63[4] = v51;
          *(_WORD *)&v63[8] = 2048;
          *(double *)&v63[10] = v52;
          v64 = 2048;
          v65 = v34;
          v53 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedPoseAnchor:facePoseError:lidAngleDeg:]", "CoreLocation: %s\n", v53);
          if (v53 != (char *)buf)
            free(v53);
        }
        if (a4->var3)
        {
          value = self->_analyticsTracker.__ptr_.__value_;
          if (value)
          {
            v46 = *((_DWORD *)value + 333);
            if (v46 != -1)
              *((_DWORD *)value + 333) = v46 + 1;
          }
        }
        else if (a4->var0 <= 0.8)
        {
          v47 = self->_analyticsTracker.__ptr_.__value_;
          if (v47)
          {
            v48 = *((_DWORD *)v47 + 334);
            if (v48 != -1)
              *((_DWORD *)v47 + 334) = v48 + 1;
          }
        }
      }
      else
      {
        *(float *)&v30 = v24;
        *(float *)&v31 = v25;
        *(float *)&v32 = v26;
        *(float *)&v33 = a5;
        objc_msgSend_feedPoseAnchorWithAttitude_position_lidAngleDeg_timestampUs_(self, v27, v34, v28, v29, v18, v19, v20, v21, v30, v31, v32, v33);
        v35 = mach_absolute_time();
        v36 = sub_18F1FD20C(v35);
        v37 = (double)(unint64_t)v34 * 0.000001;
        if (v36 >= v37)
        {
          v38 = self->_analyticsTracker.__ptr_.__value_;
          if (v38)
          {
            v39 = v36 - v37;
            v40 = *((double *)v38 + 151);
            if (v40 <= v39)
              v40 = v39;
            *((double *)v38 + 151) = v40;
            v41 = *((double *)v38 + 150);
            if (v41 >= v39)
              v41 = v39;
            *((double *)v38 + 150) = v41;
            *((double *)v38 + 152) = v39 + *((double *)v38 + 152);
            ++*((_DWORD *)v38 + 306);
          }
        }
      }
      v49 = self->_analyticsTracker.__ptr_.__value_;
      v50 = *((_DWORD *)v49 + 332);
      if (v50 != -1)
        *((_DWORD *)v49 + 332) = v50 + 1;
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v22 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_ERROR, "[CMMediaSession] Missing face sample or error.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      LOWORD(v54) = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedPoseAnchor:facePoseError:lidAngleDeg:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
  }
}

- (void)feedPoseAnchorWithAttitude:(id)a3 position:()CMVector<float lidAngleDeg:(3UL>)a4 timestampUs:(float)a5
{
  int scheme;
  float v9;
  float v10;
  float v11;
  unint64_t anchorUpdateIntervalUs;
  unint64_t v14;
  unsigned int v15;
  float32_t var2;
  double sessionStartTime;
  NSObject *v18;
  CMMediaSessionAnalyticsTracker *value;
  unint64_t lastRequestingCameraTimestampUs;
  unint64_t v21;
  CMMediaSessionAnalyticsTracker *v22;
  double v23;
  double v24;
  double v25;
  char *v26;
  float v27[3];
  float32x4_t v28;
  int v29;
  double v30;
  uint8_t buf[4];
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  scheme = self->_scheme;
  if (scheme)
  {
    v9 = a4.elements[2];
    v10 = a4.elements[1];
    v11 = a4.elements[0];
    if (scheme == 1
      || ((anchorUpdateIntervalUs = self->_anchorUpdateIntervalUs, anchorUpdateIntervalUs <= 0x3A98)
        ? (v14 = 1)
        : (v14 = anchorUpdateIntervalUs - 15000),
          a6 - self->_lastFacePoseTimestampUs > v14))
    {
      *(float *)&a3.var0 = a3.var0;
      *(float *)&v15 = a3.var1;
      var2 = a3.var2;
      v28.i64[0] = __PAIR64__(v15, LODWORD(a3.var0));
      *(float *)&a3.var0 = a3.var3;
      v28.f32[2] = var2;
      v28.i32[3] = LODWORD(a3.var0);
      sub_18F1FFE94(&v28, *(float32x4_t *)&a3.var0);
      v27[0] = v11;
      v27[1] = v10;
      v27[2] = v9;
      objc_sync_enter(self);
      sub_18F3F8878((uint64_t)self->_headTrackingService.__ptr_.__value_, (float32x2_t *)&v28, v27, a6, a5);
      if (!self->_lastFacePoseTimestampUs)
      {
        sessionStartTime = self->_sessionStartTime;
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v18 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v32 = -(sessionStartTime - (double)a6 * 0.000001);
          _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Received first face pose anchor.timeToFirstFacePoseInSessionSeconds: %{public}.1f s", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v29 = 134349056;
          v30 = -(sessionStartTime - (double)a6 * 0.000001);
          v26 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession feedPoseAnchorWithAttitude:position:lidAngleDeg:timestampUs:]", "CoreLocation: %s\n", v26);
          if (v26 != (char *)buf)
            free(v26);
        }
        value = self->_analyticsTracker.__ptr_.__value_;
        if (value)
          *((double *)value + 178) = -(sessionStartTime - (double)a6 * 0.000001);
      }
      if (!self->_firstFacePoseInCameraRequestTimestampUs)
      {
        self->_firstFacePoseInCameraRequestTimestampUs = a6;
        lastRequestingCameraTimestampUs = self->_lastRequestingCameraTimestampUs;
        v21 = a6 - lastRequestingCameraTimestampUs;
        if (a6 > lastRequestingCameraTimestampUs)
        {
          v22 = self->_analyticsTracker.__ptr_.__value_;
          if (v22)
          {
            v23 = (double)v21 * 0.000001;
            v24 = *((double *)v22 + 147);
            if (v24 <= v23)
              v24 = (double)v21 * 0.000001;
            *((double *)v22 + 147) = v24;
            v25 = *((double *)v22 + 146);
            if (v25 >= v23)
              v25 = (double)v21 * 0.000001;
            *((double *)v22 + 146) = v25;
            *((double *)v22 + 148) = v23 + *((double *)v22 + 148);
            ++*((_DWORD *)v22 + 298);
          }
        }
      }
      self->_lastFacePoseTimestampUs = a6;
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)_getAuxSampleTimestamp:(const void *)a3 currentTime:(double)a4
{
  unint64_t v7;
  unint64_t v8;
  float v9;
  NSObject *v10;
  float v11;
  NSObject *v12;
  double v13;
  float v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  double lastTimesyncLostTime;
  double v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  uint8_t buf[4];
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)a3 + 27) == 2)
  {
    v7 = (unint64_t)(*((double *)a3 + 8) * 1000000.0);
    if (self->_lastAudioAccessorySample.timeSyncStatus != 2)
    {
      v8 = sub_18F48F16C((uint64_t)&self->_unsyncedAuxHelper, *((_QWORD *)a3 + 7), self->_lastSourceTimestampMicroSeconds);
      sub_18F3B1628((uint64_t)&self->_unsyncedAuxHelper, 1);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v9 = (float)((float)v7 - (float)v8) * 0.001;
      v10 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v9;
        _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "[CMMediaSession]  Timesync: Switching to use time-synced timestamp. diffMilliSeconds = %f", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v26);
        if (v26 != (char *)buf)
          free(v26);
      }
      v11 = -v9;
      if (v9 >= 0.0)
        v11 = v9;
      if (v11 > 60.0)
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v12 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v33 = v9;
          _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: large discrepency (imeSynced - unTimesynced). MS = %f", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v29 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v29);
          if (v29 != (char *)buf)
            free(v29);
        }
      }
      v13 = a4 - self->_firstAccessoryDMTime;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v14 = v13;
      v15 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v33 = v14;
        _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Timesync: First timesynced sample received after %.3f seconds", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf)
          free(v27);
      }
      if (v14 > 10.0)
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v16 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v33 = v14;
          _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: timesync arrived very late, gap %.3f seconds", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v30 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v30);
          if (v30 != (char *)buf)
            free(v30);
        }
      }
      if (self->_lastTimesyncLostTime > 0.0)
      {
        v17 = mach_continuous_time();
        v18 = sub_18F1FD20C(v17);
        lastTimesyncLostTime = self->_lastTimesyncLostTime;
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v20 = v18 - lastTimesyncLostTime;
        v21 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v33 = v20;
          _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_DEFAULT, "[CMMediaSession]  Timesync: Experienced loss of timesync during session. gap = %f", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v31 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v31);
          if (v31 != (char *)buf)
            free(v31);
        }
        self->_lastTimesyncLostTime = 0.0;
      }
    }
  }
  else
  {
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v22 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_INFO, "[CMMediaSession] Timesync: Using unsynced timestamp.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf)
        free(v25);
    }
    v7 = sub_18F48F16C((uint64_t)&self->_unsyncedAuxHelper, *((_QWORD *)a3 + 7), self->_lastSourceTimestampMicroSeconds);
    if (self->_lastAudioAccessorySample.timeSyncStatus == 2)
    {
      self->_lastTimesyncLostTime = a4;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v23 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_ERROR, "[CMMediaSession]  Timesync: Lost timesync in the middle of session. ", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v28 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _getAuxSampleTimestamp:currentTime:]", "CoreLocation: %s\n", v28);
        if (v28 != (char *)buf)
          free(v28);
      }
    }
  }
  return v7;
}

- (void)_feedAccessoryDeviceMotion:(const void *)a3
{
  uint64_t v5;
  double v6;
  NSObject *v7;
  double v8;
  CMMediaSessionAnalyticsTracker *value;
  CMMediaSessionAnalyticsTracker *v10;
  uint64_t v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  uint64_t fSize;
  unint64_t fCapacity;
  uint64_t fHead;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t AuxSampleTimestamp_currentTime;
  CMHeadTrackingService *v31;
  CMMediaSessionAnalyticsTracker *v32;
  unint64_t lastRequestingCameraTimestampUs;
  CMMediaSessionAnalyticsTracker *v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double sessionStartTime;
  double v40;
  NSObject *v41;
  CMMediaSessionAnalyticsTracker *v42;
  int v43;
  CMHeadTrackingService *v44;
  int v45;
  _DWORD *v46;
  int v47;
  NSObject *v48;
  NSObject *v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  float v55;
  float v56;
  CMHeadTrackingService *v57;
  _OWORD *v58;
  CMHeadTrackingService *v59;
  float64x2_t v60;
  __int128 v61;
  float32x4_t v62;
  __int128 v63;
  __int128 v64;
  CMMediaSessionAnalyticsTracker *v65;
  CMHeadTrackingService *v66;
  double v67;
  double v68;
  double v69;
  int v70;
  double *v71;
  CMMediaSessionAnalyticsTracker *v72;
  double v73;
  double v74;
  float lastAngleBetweenCurrentBoresightToDefault;
  double v76;
  double v77;
  double v78;
  int v79;
  CMMediaSessionAnalyticsTracker *v80;
  int v81;
  float v82;
  double v83;
  double v84;
  float32x4_t v85;
  _BOOL4 v86;
  float32x2_t **p_headTrackingService;
  float32x4_t v88;
  double v89;
  double v90;
  CMMediaSessionAnalyticsTracker *v91;
  float32x4_t v92;
  _BOOL4 v93;
  float v94;
  double v95;
  double v96;
  double v97;
  CMMediaSessionAnalyticsTracker *v98;
  int v99;
  int previousMotionActivityType;
  uint64_t v101;
  CMMediaSessionAnalyticsTracker *v102;
  double *v103;
  double v104;
  CMMediaSessionAnalyticsTracker *v105;
  int v106;
  CMMediaSessionAnalyticsTracker *v107;
  int v108;
  CMMediaSessionAnalyticsTracker *v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  CMHeadTrackingService *v114;
  double *v115;
  NSObject *v116;
  BOOL v117;
  NSObject *v118;
  double *v119;
  NSObject *v120;
  BOOL v121;
  NSObject *v122;
  double *v123;
  CMMediaSessionAnalyticsTracker *v124;
  double *v125;
  double v126;
  CMMediaSessionAnalyticsTracker *v127;
  double *v128;
  double v129;
  int v130;
  CMMediaSessionAnalyticsTracker *v131;
  int v132;
  char v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  double lastDistractedViewingEndTime;
  CMMediaSessionAnalyticsTracker *v138;
  double v139;
  double v140;
  double v141;
  unsigned int v142;
  CMMediaSessionAnalyticsTracker *v143;
  int v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  double lastDistractedViewingStartTime;
  CMMediaSessionAnalyticsTracker *v149;
  double v150;
  double v151;
  double v152;
  int v153;
  CMMediaSessionAnalyticsTracker *v154;
  int v155;
  int v156;
  NSObject *v157;
  uint64_t v158;
  NSObject *v159;
  char *v160;
  unsigned int v161;
  CMMediaSessionAnalyticsTracker *v162;
  int v163;
  CMMediaSessionAnalyticsTracker *v164;
  int v165;
  CMMediaSessionAnalyticsTracker *v166;
  int v167;
  CMMediaSessionAnalyticsTracker *v168;
  int v169;
  CMMediaSessionAnalyticsTracker *v170;
  int v171;
  CMMediaSessionAnalyticsTracker *v172;
  int v173;
  NSObject *v174;
  float v175;
  uint64_t i;
  NSObject *v177;
  float v178;
  uint64_t j;
  NSObject *v180;
  float v181;
  uint64_t k;
  NSObject *v183;
  float v184;
  uint64_t m;
  NSObject *v186;
  float v187;
  uint64_t n;
  NSObject *v189;
  float v190;
  uint64_t ii;
  NSObject *v192;
  float v193;
  uint64_t jj;
  NSObject *v195;
  float v196;
  uint64_t kk;
  NSObject *v198;
  int v199;
  BOOL v200;
  _BOOL4 previousSteadyStatePedestrian;
  NSObject *v202;
  NSObject *v203;
  NSObject *v204;
  CMMediaSessionAnalyticsTracker *v205;
  NSObject *v206;
  CMHeadTrackingService *v207;
  char v208;
  int v209;
  _BOOL4 previousKeepBoresightCentered;
  BOOL v211;
  NSObject *v212;
  CMMediaSessionAnalyticsTracker *v213;
  int v214;
  NSObject *v215;
  CMHeadTrackingService *v216;
  uint64_t v217;
  float v218;
  BOOL v219;
  uint64_t v220;
  float v221;
  BOOL v222;
  uint64_t v223;
  int v224;
  _OWORD *v225;
  _OWORD *v226;
  int v227;
  int v228;
  CMHeadTrackingService *v229;
  unint64_t v230;
  float v231;
  unint64_t lastResetCamControllerTimersTimestampUs;
  BOOL v233;
  unint64_t v234;
  float v235;
  float v236;
  CMMediaSessionAnalyticsTracker *v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  int v247;
  double v248;
  char *v249;
  char *v250;
  char *v251;
  char *v252;
  char *v253;
  char *v254;
  char *v255;
  char *v256;
  char *v257;
  char *v258;
  char *v259;
  char *v260;
  char *v261;
  char *v262;
  char *v263;
  char *v264;
  char *v265;
  char *v266;
  char *v267;
  char *v268;
  char *v269;
  char *v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  int v275;
  float32x4_t v276;
  _BYTE v277[12];
  float v278;
  float v279;
  float v280;
  uint64_t v281;
  int v282;
  uint64_t v283;
  int v284;
  int v285;
  int v286;
  CMOQuaternion v287;
  _BYTE buf[28];
  uint64_t v289;
  int v290;
  uint64_t v291;
  int v292;
  _BYTE v293[20];
  float32x4_t v294;
  char v295;
  char v296;
  char v297;
  char v298;
  int v299;
  int v300;
  _BYTE v301[48];
  uint64_t v302;

  v302 = *MEMORY[0x1E0C80C00];
  v5 = mach_continuous_time();
  v6 = sub_18F1FD20C(v5);
  if (self->_firstAccessoryDMTime == 0.0)
  {
    self->_firstAccessoryDMTime = v6;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v7 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_firstAccessoryDMTime - self->_sessionStartTime;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v8;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] First accessory DM received after %.3f seconds", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v248 = self->_firstAccessoryDMTime - self->_sessionStartTime;
      *(_DWORD *)v277 = 134217984;
      *(double *)&v277[4] = v248;
      v249 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v249);
      if (v249 != buf)
        free(v249);
    }
    value = self->_analyticsTracker.__ptr_.__value_;
    if (value)
    {
      *((double *)value + 176) = self->_firstAccessoryDMTime - self->_sessionStartTime;
      sub_18F4084AC((double *)value + 32, CFSTR("auxGyroBiasConvergenceDuration"));
    }
  }
  v10 = self->_analyticsTracker.__ptr_.__value_;
  if (v10)
  {
    v11 = 0;
    v12 = *((float *)a3 + 7);
    if (v12 < 0.0)
      v12 = -v12;
    do
    {
      v13 = *(float *)((char *)a3 + v11 + 32);
      if (v13 < 0.0)
        v13 = -v13;
      if (v13 > v12)
        v12 = v13;
      v11 += 4;
    }
    while (v11 != 8);
    if (v12 < 0.000007 && *((double *)v10 + 32) > 0.0)
    {
      sub_18F408688((double *)v10 + 32, &stru_1E295ADC8);
      v10 = self->_analyticsTracker.__ptr_.__value_;
    }
    v14 = v6 - self->_lastAccessoryDMTime;
    v16 = *((double *)v10 + 54);
    v15 = *((double *)v10 + 55);
    if (v15 <= v14)
      v15 = v6 - self->_lastAccessoryDMTime;
    if (v16 >= v14)
      v16 = v6 - self->_lastAccessoryDMTime;
    *((double *)v10 + 54) = v16;
    *((double *)v10 + 55) = v15;
    *((double *)v10 + 56) = v14 + *((double *)v10 + 56);
    ++*((_DWORD *)v10 + 114);
  }
  self->_lastAccessoryDMTime = v6;
  ++self->_accessorySamplesPerSecond;
  fSize = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fSize;
  fCapacity = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fCapacity;
  fHead = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fHead;
  if (fHead + fSize >= fCapacity)
    v20 = self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fCapacity;
  else
    v20 = 0;
  *(double *)&self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fBuffer[8 * (fHead + fSize - v20)] = *((double *)a3 + 9) + -0.0350000001 + (double)*((unint64_t *)a3 + 7) * -0.000001;
  if (fCapacity <= fSize)
  {
    if (fHead + 1 < fCapacity)
      LOWORD(fCapacity) = 0;
    self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fHead = fHead + 1 - fCapacity;
  }
  else
  {
    self->_unsyncedAuxHelper.auxAndSrcSensorTimeOffsetBuffer.fHeadAndSize.fSize = fSize + 1;
  }
  *(_QWORD *)v277 = *((_QWORD *)a3 + 2);
  *(_DWORD *)&v277[8] = *((_DWORD *)a3 + 6);
  v21 = sub_18F200A14((float *)a3);
  v23 = *((float *)a3 + 11) + v22;
  v25 = v24 + *((float *)a3 + 12);
  v278 = *((float *)a3 + 10) + v21;
  v279 = v23;
  v280 = v25;
  v281 = *((_QWORD *)a3 + 10);
  v282 = *((_DWORD *)a3 + 22);
  v283 = *(_QWORD *)((char *)a3 + 28);
  v26 = *((_DWORD *)a3 + 24);
  v284 = *((_DWORD *)a3 + 9);
  v285 = v26;
  v286 = *((_DWORD *)a3 + 23);
  v287 = *(CMOQuaternion *)a3;
  AuxSampleTimestamp_currentTime = objc_msgSend__getAuxSampleTimestamp_currentTime_(self, v27, (uint64_t)a3, v28, v29, v6);
  objc_sync_enter(self);
  v31 = self->_headTrackingService.__ptr_.__value_;
  if (*((_DWORD *)v31 + 10) == 1)
  {
    if (self->_simulateCameraOnOffRequest)
    {
      if (self->_requestingCameraOn)
      {
LABEL_66:
        LOBYTE(v32) = 1;
LABEL_67:
        self->_requestingCameraOn = (char)v32;
        v31 = self->_headTrackingService.__ptr_.__value_;
        v47 = *((unsigned __int8 *)v31 + 27520);
        if (*((_BYTE *)v31 + 27520) && !*((_DWORD *)v31 + 6884))
          *((_QWORD *)v31 + 3443) = AuxSampleTimestamp_currentTime;
        *((_DWORD *)v31 + 6884) = v47;
        goto LABEL_71;
      }
    }
    else
    {
      LODWORD(v32) = *((unsigned __int8 *)v31 + 27520);
      if (self->_requestingCameraOn == (_DWORD)v32)
        goto LABEL_67;
      if (!*((_BYTE *)v31 + 27520))
      {
        v32 = self->_analyticsTracker.__ptr_.__value_;
        if (v32)
        {
          if (*((double *)v32 + 48) > 0.0)
            sub_18F408688((double *)v32 + 48, &stru_1E295ADC8);
          LOBYTE(v32) = 0;
        }
        goto LABEL_67;
      }
    }
    lastRequestingCameraTimestampUs = self->_lastRequestingCameraTimestampUs;
    if (lastRequestingCameraTimestampUs)
    {
      v34 = self->_analyticsTracker.__ptr_.__value_;
      if (!v34)
        goto LABEL_65;
      v35 = (double)(AuxSampleTimestamp_currentTime - lastRequestingCameraTimestampUs) * 0.000001;
      v36 = v35;
      v37 = *((double *)v34 + 127);
      if (v37 <= v36)
        v37 = v36;
      *((double *)v34 + 127) = v37;
      v38 = *((double *)v34 + 126);
      if (v38 >= v36)
        v38 = v36;
      *((double *)v34 + 126) = v38;
      *((double *)v34 + 128) = *((double *)v34 + 128) + v36;
      ++*((_DWORD *)v34 + 258);
      sub_18F4084AC((double *)v34 + 48, CFSTR("cameraOnDuration"));
    }
    else
    {
      sessionStartTime = self->_sessionStartTime;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v40 = v6 - sessionStartTime;
      v41 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        *(double *)&buf[4] = v40;
        _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Requested first face pose anchor.timeToFirstFacePoseRequestInSessionSeconds: %{public}.1f s", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        *(_DWORD *)v301 = 134349056;
        *(double *)&v301[4] = v40;
        v267 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v267);
        if (v267 != buf)
          free(v267);
      }
    }
    v42 = self->_analyticsTracker.__ptr_.__value_;
    if (v42)
    {
      v43 = *((_DWORD *)v42 + 330);
      if (v43 != -1)
        *((_DWORD *)v42 + 330) = v43 + 1;
      v44 = self->_headTrackingService.__ptr_.__value_;
      if (*((_BYTE *)v44 + 27533))
      {
        v45 = *((_DWORD *)v42 + 335);
        if (v45 != -1)
        {
          v46 = (_DWORD *)((char *)v42 + 1340);
LABEL_64:
          *v46 = v45 + 1;
        }
      }
      else
      {
        if (!*((_BYTE *)v44 + 27532))
        {
          v247 = *((unsigned __int8 *)v44 + 16036);
          if (v247 == 2)
          {
            v45 = *((_DWORD *)v42 + 339);
            if (v45 == -1)
              goto LABEL_65;
            v46 = (_DWORD *)((char *)v42 + 1356);
          }
          else if (v247 == 3)
          {
            v45 = *((_DWORD *)v42 + 337);
            if (v45 == -1)
              goto LABEL_65;
            v46 = (_DWORD *)((char *)v42 + 1348);
          }
          else
          {
            v45 = *((_DWORD *)v42 + 338);
            if (v45 == -1)
              goto LABEL_65;
            v46 = (_DWORD *)((char *)v42 + 1352);
          }
          goto LABEL_64;
        }
        v45 = *((_DWORD *)v42 + 336);
        if (v45 != -1)
        {
          v46 = (_DWORD *)((char *)v42 + 1344);
          goto LABEL_64;
        }
      }
    }
LABEL_65:
    self->_lastRequestingCameraTimestampUs = AuxSampleTimestamp_currentTime;
    self->_firstFacePoseInCameraRequestTimestampUs = 0;
    goto LABEL_66;
  }
LABEL_71:
  if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    if (sub_18F410060((uint64_t)v31 + 37528, v277, AuxSampleTimestamp_currentTime))
    {
      sub_18F41091C((uint64_t)v31 + 37528, (uint64_t)buf);
      v51 = sub_18F410B24((uint64_t)v31 + 37528);
      if (*((_QWORD *)v31 + 4689))
      {
        *(_OWORD *)v301 = *(_OWORD *)sub_18F382974((uint64_t)v31 + 64);
        sub_18F38461C();
      }
      else
      {
        v52 = *((_QWORD *)v31 + 4690);
        if (v52)
          sub_18F355EC8(v52, (float32x2_t *)buf, (double)v51 * 0.000001);
      }
      if (*((_BYTE *)v31 + 37504))
      {
        v53 = *((_QWORD *)v31 + 4687);
        if (v53)
        {
          memset(v301, 0, 44);
          *(_DWORD *)&v301[44] = 1065353216;
          sub_18F1FFE94((float32x4_t *)&v301[32], (float32x4_t)0);
          *(double *)v301 = (double)v51 / 1000000.0;
          *(_QWORD *)&v301[8] = *(_QWORD *)buf;
          *(_DWORD *)&v301[16] = *(_DWORD *)&buf[8];
          v54 = sub_18F200A14((float *)&v293[4]);
          *(float *)&v301[20] = *(float *)&buf[12] - v54;
          *(float *)&v301[24] = *(float *)&buf[16] - v55;
          *(float *)&v301[28] = *(float *)&buf[20] - v56;
          *(_OWORD *)&v301[32] = *(_OWORD *)&v293[4];
          sub_18F3CEAD0(v53, (uint64_t)v301, *(float32x4_t *)&v293[4]);
        }
      }
      sub_18F44CB08((uint64_t)v31, (uint64_t)buf, v51);
    }
    sub_18F3FA2A4((uint64_t)v31, (float32x2_t *)v277, AuxSampleTimestamp_currentTime);
  }
  else
  {
    if (*((_BYTE *)v31 + 16064))
    {
      sub_18F3F631C((uint64_t)v31, 1);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v48 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v48, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Reset RelDM upon auxDM becoming uninitialized.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        *(_WORD *)v301 = 0;
        v250 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v250);
        if (v250 != buf)
          free(v250);
      }
    }
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v49 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v49, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Not feeding AuxDM due to uninitialized DM status.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      *(_WORD *)v301 = 0;
      v50 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v50);
      if (v50 != buf)
        free(v50);
    }
  }
  if (self->_logForReplay)
  {
    sub_18F3626E0((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
    v57 = self->_headTrackingService.__ptr_.__value_;
    if (*((_BYTE *)v57 + 16064))
    {
      *(_DWORD *)&v301[8] = *((_DWORD *)v57 + 4019);
      *(_QWORD *)v301 = *(_QWORD *)((char *)v57 + 16068);
      if (*((_BYTE *)v57 + 16056))
        v58 = (_OWORD *)((char *)v57 + 16108);
      else
        v58 = (_OWORD *)((char *)v57 + 16092);
      *(_OWORD *)&v301[12] = *v58;
      v276.i64[0] = 0;
      v276.i64[1] = 0x3F80000000000000;
      v272 = 0;
      v273 = 0;
      sub_18F3FF328((uint64_t)v57, &v276, (uint64_t)&v274, &v273, &v272);
      v59 = self->_headTrackingService.__ptr_.__value_;
      *(_QWORD *)buf = v273;
      *(_QWORD *)&buf[8] = v272;
      *(_QWORD *)&buf[16] = v274;
      v289 = *(_QWORD *)v301;
      *(_DWORD *)&buf[24] = v275;
      v290 = *(_DWORD *)&v301[8];
      v291 = *((_QWORD *)v57 + 2010);
      v292 = *((_DWORD *)v57 + 4022);
      *(_OWORD *)v293 = *(_OWORD *)&v301[12];
      v293[16] = *((_BYTE *)v59 + 16040);
      v293[17] = *((_BYTE *)v59 + 16056);
      v60.f64[0] = *((float64_t *)v59 + 1996);
      v60.f64[1] = *((float64_t *)v59 + 1998);
      v294 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*((float64x2_t *)v59 + 997)), v60);
      v295 = *((_BYTE *)v59 + 46);
      v296 = *((_BYTE *)v59 + 27520);
      v297 = *((_BYTE *)v59 + 16059);
      v298 = *((_BYTE *)v59 + 16058);
      v299 = *(_DWORD *)v59;
      v300 = *((unsigned __int8 *)v59 + 4);
      sub_18F363D4C((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)buf);
    }
  }
  objc_sync_exit(self);
  if (&self->_lastAudioAccessorySample != a3)
    self->_lastAudioAccessorySample.auxDM.quaternion = *(CMOQuaternion *)a3;
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[0] = *((float *)a3 + 4);
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[1] = *((float *)a3 + 5);
  self->_lastAudioAccessorySample.auxDM.rotationRate.elements[2] = *((float *)a3 + 6);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[0] = *((float *)a3 + 7);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[1] = *((float *)a3 + 8);
  self->_lastAudioAccessorySample.auxDM.biasCovariance.elements[2] = *((float *)a3 + 9);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[0] = *((float *)a3 + 10);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[1] = *((float *)a3 + 11);
  self->_lastAudioAccessorySample.auxDM.userAcceleration.elements[2] = *((float *)a3 + 12);
  self->_lastAudioAccessorySample.auxDM.status.bits = *((_WORD *)a3 + 26);
  v61 = *(_OWORD *)((char *)a3 + 56);
  self->_lastAudioAccessorySample.arrivalTimestamp = *((double *)a3 + 9);
  *(_OWORD *)&self->_lastAudioAccessorySample.sensorTime = v61;
  self->_lastAudioAccessorySample.filteredAcceleration.elements[0] = *((float *)a3 + 20);
  self->_lastAudioAccessorySample.filteredAcceleration.elements[1] = *((float *)a3 + 21);
  self->_lastAudioAccessorySample.filteredAcceleration.elements[2] = *((float *)a3 + 22);
  v62 = *(float32x4_t *)((char *)a3 + 92);
  v63 = *(_OWORD *)((char *)a3 + 108);
  v64 = *(_OWORD *)((char *)a3 + 124);
  *(_DWORD *)&self->_lastAudioAccessorySample.isGyroBiasValid = *((_DWORD *)a3 + 35);
  *(_OWORD *)&self->_lastAudioAccessorySample.timeSyncStatus = v63;
  *(_OWORD *)((char *)&self->_lastAudioAccessorySample.sampleLatency + 4) = v64;
  *(float32x4_t *)&self->_lastAudioAccessorySample.quiescentNoise = v62;
  v65 = self->_analyticsTracker.__ptr_.__value_;
  if (v65)
  {
    v66 = self->_headTrackingService.__ptr_.__value_;
    v67 = *((double *)v65 + 87);
    v68 = *((double *)v65 + 86);
    v69 = 0.0;
    if (*((_QWORD *)v66 + 676) == AuxSampleTimestamp_currentTime)
      v69 = 1.0;
    if (v67 <= v69)
      v67 = v69;
    if (v68 >= v69)
      v68 = v69;
    *((double *)v65 + 87) = v67;
    *((double *)v65 + 86) = v68;
    *((double *)v65 + 88) = v69 + *((double *)v65 + 88);
    ++*((_DWORD *)v65 + 178);
    v70 = *((unsigned __int8 *)v66 + 16040);
    if (self->_previousBTZState != v70)
    {
      v71 = (double *)((char *)v65 + 16);
      if (v70)
      {
        sub_18F4084AC(v71, CFSTR("BTZDuration"));
        v72 = self->_analyticsTracker.__ptr_.__value_;
        *(double *)v62.i64 = v6 - self->_lastInBTZTime;
        v74 = *((double *)v72 + 58);
        v73 = *((double *)v72 + 59);
        if (v73 <= *(double *)v62.i64)
          v73 = v6 - self->_lastInBTZTime;
        if (v74 >= *(double *)v62.i64)
          v74 = v6 - self->_lastInBTZTime;
        *((double *)v72 + 58) = v74;
        *((double *)v72 + 59) = v73;
        *((double *)v72 + 60) = *(double *)v62.i64 + *((double *)v72 + 60);
        ++*((_DWORD *)v72 + 122);
        lastAngleBetweenCurrentBoresightToDefault = self->_lastAngleBetweenCurrentBoresightToDefault;
        if (lastAngleBetweenCurrentBoresightToDefault < 0.0)
          lastAngleBetweenCurrentBoresightToDefault = -lastAngleBetweenCurrentBoresightToDefault;
        v76 = lastAngleBetweenCurrentBoresightToDefault;
        v77 = *((double *)v72 + 83);
        if (v77 <= v76)
          v77 = v76;
        *((double *)v72 + 83) = v77;
        v78 = *((double *)v72 + 82);
        if (v78 >= v76)
          v78 = v76;
        *((double *)v72 + 82) = v78;
        *((double *)v72 + 84) = *((double *)v72 + 84) + v76;
        ++*((_DWORD *)v72 + 170);
      }
      else
      {
        if (*v71 > 0.0)
          sub_18F408688(v71, &stru_1E295ADC8);
        self->_lastInBTZTime = v6;
      }
      v66 = self->_headTrackingService.__ptr_.__value_;
      self->_previousBTZState = *((unsigned __int8 *)v66 + 16040);
    }
    v79 = *((unsigned __int8 *)v66 + 16059);
    if (self->_previousCTState != v79)
    {
      if (*((_BYTE *)v66 + 16059))
      {
        v80 = self->_analyticsTracker.__ptr_.__value_;
        v81 = *((_DWORD *)v80 + 308);
        if (v81 != -1)
          *((_DWORD *)v80 + 308) = v81 + 1;
        v82 = self->_lastAngleBetweenCurrentBoresightToDefault;
        if (v82 < 0.0)
          v82 = -v82;
        *(double *)v62.i64 = v82;
        v83 = *((double *)v80 + 67);
        if (v83 <= *(double *)v62.i64)
          v83 = *(double *)v62.i64;
        *((double *)v80 + 67) = v83;
        v84 = *((double *)v80 + 66);
        if (v84 >= *(double *)v62.i64)
          v84 = *(double *)v62.i64;
        *((double *)v80 + 66) = v84;
        *(double *)v62.i64 = *((double *)v80 + 68) + *(double *)v62.i64;
        *((_QWORD *)v80 + 68) = v62.i64[0];
        ++*((_DWORD *)v80 + 138);
        v85.f32[0] = sub_18F3FF268((float32x2_t *)v66, v62);
        v86 = v85.f32[0] < 0.0;
        p_headTrackingService = (float32x2_t **)&self->_headTrackingService;
        v88.f32[0] = sub_18F3FF268((float32x2_t *)self->_headTrackingService.__ptr_.__value_, v85);
        if (v86)
          v88.f32[0] = -v88.f32[0];
        *(double *)v88.i64 = v88.f32[0];
        v89 = *((double *)v80 + 71);
        if (v89 <= *(double *)v88.i64)
          v89 = *(double *)v88.i64;
        *((double *)v80 + 71) = v89;
        v90 = *((double *)v80 + 70);
        if (v90 >= *(double *)v88.i64)
          v90 = *(double *)v88.i64;
        *((double *)v80 + 70) = v90;
        *(double *)v88.i64 = *((double *)v80 + 72) + *(double *)v88.i64;
        *((_QWORD *)v80 + 72) = v88.i64[0];
        ++*((_DWORD *)v80 + 146);
        v91 = self->_analyticsTracker.__ptr_.__value_;
        v92.f32[0] = sub_18F3FF2C8(*p_headTrackingService, v88);
        v93 = v92.f32[0] < 0.0;
        v94 = sub_18F3FF2C8(*p_headTrackingService, v92);
        if (v93)
          v94 = -v94;
        v95 = v94;
        v96 = *((double *)v91 + 75);
        if (v96 <= v95)
          v96 = v95;
        *((double *)v91 + 75) = v96;
        v97 = *((double *)v91 + 74);
        if (v97 >= v95)
          v97 = v95;
        *((double *)v91 + 74) = v97;
        *((double *)v91 + 76) = *((double *)v91 + 76) + v95;
        ++*((_DWORD *)v91 + 154);
        sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 16, CFSTR("CTDuration"));
        if ((*p_headTrackingService)[2007].i8[0])
        {
          v98 = self->_analyticsTracker.__ptr_.__value_;
          v99 = *((_DWORD *)v98 + 309);
          if (v99 != -1)
            *((_DWORD *)v98 + 309) = v99 + 1;
          sub_18F4084AC((double *)v98 + 18, CFSTR("CTDurationIn1IMU"));
        }
        previousMotionActivityType = self->_previousMotionActivityType;
        if (previousMotionActivityType > 51)
        {
          if (previousMotionActivityType == 52 || previousMotionActivityType == 56)
            goto LABEL_170;
        }
        else
        {
          if (!previousMotionActivityType)
          {
LABEL_178:
            if (self->_lastExitCTTime > 0.0)
            {
              v109 = self->_analyticsTracker.__ptr_.__value_;
              v110 = mach_continuous_time();
              v111 = sub_18F1FD20C(v110) - self->_lastExitCTTime;
              v113 = *((double *)v109 + 62);
              v112 = *((double *)v109 + 63);
              if (v112 <= v111)
                v112 = v111;
              if (v113 >= v111)
                v113 = v111;
              *((double *)v109 + 62) = v113;
              *((double *)v109 + 63) = v112;
              *((double *)v109 + 64) = v111 + *((double *)v109 + 64);
              ++*((_DWORD *)v109 + 130);
              self->_lastExitCTTime = 0.0;
            }
            goto LABEL_184;
          }
          if (previousMotionActivityType == 5)
            goto LABEL_170;
        }
        if ((previousMotionActivityType & 0xFFFFFFFE) != 0xA)
        {
LABEL_173:
          if (previousMotionActivityType <= 0x29
            && ((1 << previousMotionActivityType) & 0x20000000110) != 0)
          {
            v107 = self->_analyticsTracker.__ptr_.__value_;
            v108 = *((_DWORD *)v107 + 311);
            if (v108 != -1)
              *((_DWORD *)v107 + 311) = v108 + 1;
            sub_18F4084AC((double *)v107 + 22, CFSTR("CTDurationInPedestrian"));
          }
          goto LABEL_178;
        }
LABEL_170:
        v105 = self->_analyticsTracker.__ptr_.__value_;
        v106 = *((_DWORD *)v105 + 310);
        if (v106 != -1)
          *((_DWORD *)v105 + 310) = v106 + 1;
        sub_18F4084AC((double *)v105 + 20, CFSTR("CTDurationInVehicle"));
        previousMotionActivityType = self->_previousMotionActivityType;
        goto LABEL_173;
      }
      v101 = mach_continuous_time();
      self->_lastExitCTTime = sub_18F1FD20C(v101);
      v102 = self->_analyticsTracker.__ptr_.__value_;
      if (*((double *)v102 + 16) > 0.0)
      {
        sub_18F408688((double *)v102 + 16, &stru_1E295ADC8);
        v102 = self->_analyticsTracker.__ptr_.__value_;
      }
      if (*((double *)v102 + 18) > 0.0)
      {
        sub_18F408688((double *)v102 + 18, &stru_1E295ADC8);
        v102 = self->_analyticsTracker.__ptr_.__value_;
      }
      if (*((double *)v102 + 20) > 0.0)
      {
        sub_18F408688((double *)v102 + 20, &stru_1E295ADC8);
        v102 = self->_analyticsTracker.__ptr_.__value_;
      }
      v104 = *((double *)v102 + 22);
      v103 = (double *)((char *)v102 + 176);
      if (v104 > 0.0)
        sub_18F408688(v103, &stru_1E295ADC8);
    }
LABEL_184:
    self->_previousCTState = v79;
    v114 = self->_headTrackingService.__ptr_.__value_;
    if (*((_BYTE *)v114 + 27552))
    {
      if (self->_previousCTBodyTurnState == *((unsigned __int8 *)v114 + 33405))
        goto LABEL_204;
      v115 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 352);
      if (*((_BYTE *)v114 + 33405))
      {
        sub_18F4084AC(v115, CFSTR("CTBodyTurnDuration"));
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v116 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v116, OS_LOG_TYPE_INFO, "[CMMediaSession] Entering CT body turn state.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          *(_WORD *)v301 = 0;
          v261 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v261);
          if (v261 != buf)
            free(v261);
        }
        v117 = 1;
LABEL_203:
        self->_previousCTBodyTurnState = v117;
        v114 = self->_headTrackingService.__ptr_.__value_;
LABEL_204:
        if (*((_BYTE *)v114 + 12176))
        {
          if (self->_previousHeadTurnState == *((unsigned __int8 *)v114 + 12208))
            goto LABEL_224;
          v119 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 368);
          if (*((_BYTE *)v114 + 12208))
          {
            sub_18F4084AC(v119, CFSTR("HeadTurnDuration"));
            if (qword_1EE16D818 != -1)
              dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
            v120 = qword_1EE16D820;
            if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F1DC000, v120, OS_LOG_TYPE_INFO, "[CMMediaSession] Entering head turn state.", buf, 2u);
            }
            if (sub_18F1FCA08(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE16D818 != -1)
                dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
              *(_WORD *)v301 = 0;
              v262 = (char *)_os_log_send_and_compose_impl();
              sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v262);
              if (v262 != buf)
                free(v262);
            }
            v121 = 1;
LABEL_223:
            self->_previousHeadTurnState = v121;
            v114 = self->_headTrackingService.__ptr_.__value_;
LABEL_224:
            if (self->_previousTracking1IMU == *((unsigned __int8 *)v114 + 16056))
              goto LABEL_244;
            v123 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 112);
            if (*((_BYTE *)v114 + 16056))
            {
              sub_18F4084AC(v123, CFSTR("in1IMUDuration"));
              v124 = self->_analyticsTracker.__ptr_.__value_;
              if (*((double *)v124 + 10) > 0.0)
              {
                sub_18F408688((double *)v124 + 10, &stru_1E295ADC8);
                v124 = self->_analyticsTracker.__ptr_.__value_;
              }
              v126 = *((double *)v124 + 12);
              v125 = (double *)((char *)v124 + 96);
              if (v126 > 0.0)
                sub_18F408688(v125, &stru_1E295ADC8);
              goto LABEL_240;
            }
            sub_18F408688(v123, CFSTR("in1IMUDuration"));
            v127 = self->_analyticsTracker.__ptr_.__value_;
            v129 = *((double *)v127 + 18);
            v128 = (double *)((char *)v127 + 144);
            if (v129 > 0.0)
              sub_18F408688(v128, &stru_1E295ADC8);
            v130 = self->_previousMotionActivityType;
            if (v130 > 51)
            {
              if (v130 != 52 && v130 != 56)
              {
LABEL_238:
                if ((v130 & 0xFFFFFFFE) != 0xA)
                {
                  if (v130 <= 0x29 && ((1 << v130) & 0x20000000110) != 0)
                    sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 12, CFSTR("srcPedestrian2IMUDuration"));
                  goto LABEL_240;
                }
              }
            }
            else
            {
              if (!v130)
                goto LABEL_240;
              if (v130 != 5)
                goto LABEL_238;
            }
            sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 10, CFSTR("inVehicle2IMUDuration"));
LABEL_240:
            if (self->_previousTracking1IMU != -1)
            {
              v131 = self->_analyticsTracker.__ptr_.__value_;
              v132 = *((_DWORD *)v131 + 312);
              if (v132 != -1)
                *((_DWORD *)v131 + 312) = v132 + 1;
            }
            v114 = self->_headTrackingService.__ptr_.__value_;
            self->_previousTracking1IMU = *((unsigned __int8 *)v114 + 16056);
LABEL_244:
            v133 = *((_BYTE *)v114 + 16058);
            if (self->_previousTrackingEnabled)
            {
              if (*((_BYTE *)v114 + 16058))
              {
                sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 42, CFSTR("durationOfSessionHeadtracked"));
                lastDistractedViewingEndTime = self->_lastDistractedViewingEndTime;
                if (lastDistractedViewingEndTime > 0.0)
                {
                  v138 = self->_analyticsTracker.__ptr_.__value_;
                  v139 = v6 - lastDistractedViewingEndTime;
                  v140 = *((double *)v138 + 123);
                  if (v140 <= v139)
                    v140 = v139;
                  *((double *)v138 + 123) = v140;
                  v141 = *((double *)v138 + 122);
                  if (v141 >= v139)
                    v141 = v139;
                  *((double *)v138 + 122) = v141;
                  *((double *)v138 + 124) = v139 + *((double *)v138 + 124);
                  ++*((_DWORD *)v138 + 250);
                }
                v142 = *(_DWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 112);
                objc_msgSend_enterDistractedViewingSession_(self->_mcSession, v134, v142, v135, v136);
                switch(v142)
                {
                  case 3u:
                    v143 = self->_analyticsTracker.__ptr_.__value_;
                    v156 = *((_DWORD *)v143 + 325);
                    if (v156 != -1)
                      *((_DWORD *)v143 + 325) = v156 + 1;
                    break;
                  case 2u:
                    v154 = self->_analyticsTracker.__ptr_.__value_;
                    v155 = *((_DWORD *)v154 + 326);
                    if (v155 != -1)
                      *((_DWORD *)v154 + 326) = v155 + 1;
                    sub_18F4084AC((double *)v154 + 40, CFSTR("durationOfSessionDisabledDueToJBL"));
                    goto LABEL_281;
                  case 1u:
                    v143 = self->_analyticsTracker.__ptr_.__value_;
                    v144 = *((_DWORD *)v143 + 324);
                    if (v144 != -1)
                      *((_DWORD *)v143 + 324) = v144 + 1;
                    break;
                  default:
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    v157 = qword_1EE16D820;
                    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67240192;
                      *(_DWORD *)&buf[4] = v142;
                      _os_log_impl(&dword_18F1DC000, v157, OS_LOG_TYPE_ERROR, "[CMMediaSession] CALogger received invalid disable route: %{public}d", buf, 8u);
                    }
                    if (sub_18F1FCA08(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1EE16D818 != -1)
                        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                      *(_DWORD *)v301 = 67240192;
                      *(_DWORD *)&v301[4] = v142;
                      v268 = (char *)_os_log_send_and_compose_impl();
                      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v268);
                      if (v268 != buf)
                        free(v268);
                    }
                    goto LABEL_281;
                }
                sub_18F4084AC((double *)v143 + 38, CFSTR("durationOfSessionDisabledDueToWalking"));
LABEL_281:
                self->_lastTrackingDisableRoute = v142;
                v158 = 304;
LABEL_311:
                *(double *)((char *)&self->super.isa + v158) = v6;
                v114 = self->_headTrackingService.__ptr_.__value_;
                v133 = *((_BYTE *)v114 + 16058);
              }
            }
            else
            {
              if (!*((_BYTE *)v114 + 16058))
              {
                sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 42, CFSTR("durationOfSessionHeadtracked"));
                lastDistractedViewingStartTime = self->_lastDistractedViewingStartTime;
                v149 = self->_analyticsTracker.__ptr_.__value_;
                if (lastDistractedViewingStartTime > 0.0)
                {
                  v150 = v6 - lastDistractedViewingStartTime;
                  v151 = *((double *)v149 + 79);
                  if (v151 <= v150)
                    v151 = v150;
                  *((double *)v149 + 79) = v151;
                  v152 = *((double *)v149 + 78);
                  if (v152 >= v150)
                    v152 = v150;
                  *((double *)v149 + 78) = v152;
                  *((double *)v149 + 80) = v150 + *((double *)v149 + 80);
                  ++*((_DWORD *)v149 + 162);
                }
                v153 = *((_DWORD *)v149 + 313);
                if (v153 != -1)
                  *((_DWORD *)v149 + 313) = v153 + 1;
                switch(self->_lastTrackingDisableRoute)
                {
                  case 0:
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    v159 = qword_1EE16D820;
                    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_18F1DC000, v159, OS_LOG_TYPE_ERROR, "[CMMediaSession] We're ending an unknown disable route, something is wrong", buf, 2u);
                    }
                    if (sub_18F1FCA08(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1EE16D818 != -1)
                        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                      *(_WORD *)v301 = 0;
                      v160 = (char *)_os_log_send_and_compose_impl();
                      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v160);
                      if (v160 != buf)
                        free(v160);
                    }
                    break;
                  case 1:
                  case 3:
                    sub_18F408688((double *)v149 + 38, CFSTR("durationOfSessionDisabledDueToWalking"));
                    break;
                  case 2:
                    sub_18F408688((double *)v149 + 40, CFSTR("durationOfSessionDisabledDueToJBL"));
                    break;
                  default:
                    break;
                }
                v161 = *(_DWORD *)(*((_QWORD *)self->_headTrackingService.__ptr_.__value_ + 4686) + 108);
                objc_msgSend_exitDistractedViewingSession_(self->_mcSession, v145, v161, v146, v147);
                switch(v161)
                {
                  case 1u:
                    v162 = self->_analyticsTracker.__ptr_.__value_;
                    v163 = *((_DWORD *)v162 + 314);
                    if (v163 != -1)
                      *((_DWORD *)v162 + 314) = v163 + 1;
                    break;
                  case 2u:
                    v170 = self->_analyticsTracker.__ptr_.__value_;
                    v171 = *((_DWORD *)v170 + 315);
                    if (v171 != -1)
                      *((_DWORD *)v170 + 315) = v171 + 1;
                    break;
                  case 3u:
                    v166 = self->_analyticsTracker.__ptr_.__value_;
                    v167 = *((_DWORD *)v166 + 316);
                    if (v167 != -1)
                      *((_DWORD *)v166 + 316) = v167 + 1;
                    break;
                  case 4u:
                    v168 = self->_analyticsTracker.__ptr_.__value_;
                    v169 = *((_DWORD *)v168 + 317);
                    if (v169 != -1)
                      *((_DWORD *)v168 + 317) = v169 + 1;
                    break;
                  case 5u:
                    v164 = self->_analyticsTracker.__ptr_.__value_;
                    v165 = *((_DWORD *)v164 + 318);
                    if (v165 != -1)
                      *((_DWORD *)v164 + 318) = v165 + 1;
                    break;
                  case 6u:
                    v172 = self->_analyticsTracker.__ptr_.__value_;
                    v173 = *((_DWORD *)v172 + 319);
                    if (v173 != -1)
                      *((_DWORD *)v172 + 319) = v173 + 1;
                    break;
                  default:
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    v174 = qword_1EE16D820;
                    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67240192;
                      *(_DWORD *)&buf[4] = v161;
                      _os_log_impl(&dword_18F1DC000, v174, OS_LOG_TYPE_ERROR, "[CMMediaSession] CALogger received invalid re-enable route: %{public}d", buf, 8u);
                    }
                    if (sub_18F1FCA08(115, 0))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1EE16D818 != -1)
                        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                      *(_DWORD *)v301 = 67240192;
                      *(_DWORD *)&v301[4] = v161;
                      v271 = (char *)_os_log_send_and_compose_impl();
                      sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v271);
                      if (v271 != buf)
                        free(v271);
                    }
                    break;
                }
                v158 = 312;
                goto LABEL_311;
              }
              v133 = 1;
            }
            self->_previousTrackingEnabled = v133 ^ 1;
            if (!self->_previousSrcMoving)
            {
              if (!*((_DWORD *)v114 + 1328))
                goto LABEL_317;
              v175 = 0.0;
              for (i = 1316; i != 1319; ++i)
                v175 = v175 + (float)(*((float *)v114 + i) * *((float *)v114 + i));
              if (sqrtf(v175) > 0.34907)
              {
LABEL_317:
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                v177 = qword_1EE16D820;
                if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18F1DC000, v177, OS_LOG_TYPE_INFO, "[CMMediaSession] Src started moving", buf, 2u);
                }
                if (sub_18F1FCA08(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  *(_WORD *)v301 = 0;
                  v259 = (char *)_os_log_send_and_compose_impl();
                  sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v259);
                  if (v259 != buf)
                    free(v259);
                }
                sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 26, CFSTR("srcMoving"));
                if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 30) > 0.0)
                  sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 30, &stru_1E295ADC8);
                v114 = self->_headTrackingService.__ptr_.__value_;
                if (!*((_DWORD *)v114 + 1346))
                  goto LABEL_328;
                v178 = 0.0;
                for (j = 1334; j != 1337; ++j)
                  v178 = v178 + (float)(*((float *)v114 + j) * *((float *)v114 + j));
                if (sqrtf(v178) > 0.34907)
                {
LABEL_328:
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  v180 = qword_1EE16D820;
                  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18F1DC000, v180, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src started moving", buf, 2u);
                  }
                  if (sub_18F1FCA08(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    *(_WORD *)v301 = 0;
                    v265 = (char *)_os_log_send_and_compose_impl();
                    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v265);
                    if (v265 != buf)
                      free(v265);
                  }
                  sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 28, CFSTR("auxAndSrcMoving"));
                  v114 = self->_headTrackingService.__ptr_.__value_;
                }
              }
            }
            if (!self->_previousAuxMoving)
            {
              if (!*((_DWORD *)v114 + 1346))
                goto LABEL_339;
              v181 = 0.0;
              for (k = 1334; k != 1337; ++k)
                v181 = v181 + (float)(*((float *)v114 + k) * *((float *)v114 + k));
              if (sqrtf(v181) > 0.34907)
              {
LABEL_339:
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                v183 = qword_1EE16D820;
                if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18F1DC000, v183, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux started moving", buf, 2u);
                }
                if (sub_18F1FCA08(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  *(_WORD *)v301 = 0;
                  v260 = (char *)_os_log_send_and_compose_impl();
                  sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v260);
                  if (v260 != buf)
                    free(v260);
                }
                sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 24, CFSTR("auxMoving"));
                if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 30) > 0.0)
                  sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 30, &stru_1E295ADC8);
                v114 = self->_headTrackingService.__ptr_.__value_;
                if (!*((_DWORD *)v114 + 1328))
                  goto LABEL_350;
                v184 = 0.0;
                for (m = 1316; m != 1319; ++m)
                  v184 = v184 + (float)(*((float *)v114 + m) * *((float *)v114 + m));
                if (sqrtf(v184) > 0.34907)
                {
LABEL_350:
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  v186 = qword_1EE16D820;
                  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18F1DC000, v186, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src started moving", buf, 2u);
                  }
                  if (sub_18F1FCA08(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    *(_WORD *)v301 = 0;
                    v266 = (char *)_os_log_send_and_compose_impl();
                    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v266);
                    if (v266 != buf)
                      free(v266);
                  }
                  sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 28, CFSTR("auxAndSrcMoving"));
                  v114 = self->_headTrackingService.__ptr_.__value_;
                }
              }
            }
            if (self->_previousSrcMoving)
            {
              if (*((_DWORD *)v114 + 1328))
              {
                v187 = 0.0;
                for (n = 1316; n != 1319; ++n)
                  v187 = v187 + (float)(*((float *)v114 + n) * *((float *)v114 + n));
                if (sqrtf(v187) <= 0.34907)
                {
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  v189 = qword_1EE16D820;
                  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18F1DC000, v189, OS_LOG_TYPE_INFO, "[CMMediaSession] Src stopped moving", buf, 2u);
                  }
                  if (sub_18F1FCA08(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    *(_WORD *)v301 = 0;
                    v263 = (char *)_os_log_send_and_compose_impl();
                    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v263);
                    if (v263 != buf)
                      free(v263);
                  }
                  sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 26, CFSTR("srcMoving"));
                  if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 28) > 0.0)
                    sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 28, &stru_1E295ADC8);
                  v114 = self->_headTrackingService.__ptr_.__value_;
                  if (*((_DWORD *)v114 + 1346))
                  {
                    v190 = 0.0;
                    for (ii = 1334; ii != 1337; ++ii)
                      v190 = v190 + (float)(*((float *)v114 + ii) * *((float *)v114 + ii));
                    if (sqrtf(v190) <= 0.34907)
                    {
                      if (qword_1EE16D818 != -1)
                        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                      v192 = qword_1EE16D820;
                      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_18F1DC000, v192, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src entered quiescence", buf, 2u);
                      }
                      if (sub_18F1FCA08(115, 2))
                      {
                        bzero(buf, 0x65CuLL);
                        if (qword_1EE16D818 != -1)
                          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                        *(_WORD *)v301 = 0;
                        v269 = (char *)_os_log_send_and_compose_impl();
                        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v269);
                        if (v269 != buf)
                          free(v269);
                      }
                      sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 30, CFSTR("auxAndSrcQuiescent"));
                      v114 = self->_headTrackingService.__ptr_.__value_;
                    }
                  }
                }
              }
            }
            if (self->_previousAuxMoving)
            {
              if (*((_DWORD *)v114 + 1346))
              {
                v193 = 0.0;
                for (jj = 1334; jj != 1337; ++jj)
                  v193 = v193 + (float)(*((float *)v114 + jj) * *((float *)v114 + jj));
                if (sqrtf(v193) <= 0.34907)
                {
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  v195 = qword_1EE16D820;
                  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18F1DC000, v195, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux stopped moving", buf, 2u);
                  }
                  if (sub_18F1FCA08(115, 2))
                  {
                    bzero(buf, 0x65CuLL);
                    if (qword_1EE16D818 != -1)
                      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                    *(_WORD *)v301 = 0;
                    v264 = (char *)_os_log_send_and_compose_impl();
                    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v264);
                    if (v264 != buf)
                      free(v264);
                  }
                  sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 24, CFSTR("auxMoving"));
                  if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 28) > 0.0)
                    sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 28, &stru_1E295ADC8);
                  v114 = self->_headTrackingService.__ptr_.__value_;
                  if (*((_DWORD *)v114 + 1328))
                  {
                    v196 = 0.0;
                    for (kk = 1316; kk != 1319; ++kk)
                      v196 = v196 + (float)(*((float *)v114 + kk) * *((float *)v114 + kk));
                    if (sqrtf(v196) <= 0.34907)
                    {
                      if (qword_1EE16D818 != -1)
                        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                      v198 = qword_1EE16D820;
                      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_18F1DC000, v198, OS_LOG_TYPE_INFO, "[CMMediaSession] Aux and src entered quiescence", buf, 2u);
                      }
                      if (sub_18F1FCA08(115, 2))
                      {
                        bzero(buf, 0x65CuLL);
                        if (qword_1EE16D818 != -1)
                          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                        *(_WORD *)v301 = 0;
                        v270 = (char *)_os_log_send_and_compose_impl();
                        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v270);
                        if (v270 != buf)
                          free(v270);
                      }
                      sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 30, CFSTR("auxAndSrcQuiescent"));
                      v114 = self->_headTrackingService.__ptr_.__value_;
                    }
                  }
                }
              }
            }
            if (*((_BYTE *)v114 + 4))
            {
              v199 = *((unsigned __int8 *)v114 + 37449);
              v200 = *((_BYTE *)v114 + 37449) != 0;
              previousSteadyStatePedestrian = self->_previousSteadyStatePedestrian;
              if (v199 && !self->_previousSteadyStatePedestrian)
              {
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                v202 = qword_1EE16D820;
                if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18F1DC000, v202, OS_LOG_TYPE_INFO, "[CMMediaSession] entering steadyStatePedestrian", buf, 2u);
                }
                if (sub_18F1FCA08(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  *(_WORD *)v301 = 0;
                  v257 = (char *)_os_log_send_and_compose_impl();
                  sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v257);
                  if (v257 != buf)
                    free(v257);
                }
                sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 34, CFSTR("steadyStatePedestrianDuration"));
                LOBYTE(v199) = 1;
                goto LABEL_431;
              }
            }
            else
            {
              LOBYTE(v199) = 0;
              v200 = 0;
              previousSteadyStatePedestrian = self->_previousSteadyStatePedestrian;
            }
            if (!v200 && previousSteadyStatePedestrian)
            {
              if (qword_1EE16D818 != -1)
                dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
              v203 = qword_1EE16D820;
              if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F1DC000, v203, OS_LOG_TYPE_INFO, "[CMMediaSession] leaving steadyStatePedestrian", buf, 2u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                *(_WORD *)v301 = 0;
                v253 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v253);
                if (v253 != buf)
                  free(v253);
              }
              sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 34, CFSTR("steadyStatePedestrianDuration"));
              if (*((double *)self->_analyticsTracker.__ptr_.__value_ + 44) > 0.0)
                sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 44, &stru_1E295ADC8);
              if (qword_1EE16D818 != -1)
                dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
              v204 = qword_1EE16D820;
              if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F1DC000, v204, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting CT body turn state due to leaving steadyStatePedestrian.", buf, 2u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                *(_WORD *)v301 = 0;
                v255 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v255);
                if (v255 != buf)
                  free(v255);
              }
              v205 = self->_analyticsTracker.__ptr_.__value_;
              if (*((double *)v205 + 46) > 0.0)
                sub_18F408688((double *)v205 + 46, &stru_1E295ADC8);
              if (qword_1EE16D818 != -1)
                dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
              v206 = qword_1EE16D820;
              if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F1DC000, v206, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting head turn state due to leaving steadyStatePedestrian.", buf, 2u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                *(_WORD *)v301 = 0;
                v256 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v256);
                if (v256 != buf)
                  free(v256);
              }
            }
LABEL_431:
            v207 = self->_headTrackingService.__ptr_.__value_;
            v208 = *((_BYTE *)v207 + 4);
            if (v208)
            {
              v209 = *((unsigned __int8 *)v207 + 37464);
              v208 = *((_BYTE *)v207 + 37464) != 0;
              previousKeepBoresightCentered = self->_previousKeepBoresightCentered;
              if (v209)
                v211 = !previousKeepBoresightCentered;
              else
                v211 = 0;
              if (v211)
              {
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                v212 = qword_1EE16D820;
                if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18F1DC000, v212, OS_LOG_TYPE_INFO, "[CMMediaSession] entering keepBoresightCentered state.", buf, 2u);
                }
                if (sub_18F1FCA08(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1EE16D818 != -1)
                    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                  *(_WORD *)v301 = 0;
                  v258 = (char *)_os_log_send_and_compose_impl();
                  sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v258);
                  if (v258 != buf)
                    free(v258);
                }
                v213 = self->_analyticsTracker.__ptr_.__value_;
                v214 = *((_DWORD *)v213 + 327);
                if (v214 != -1)
                  *((_DWORD *)v213 + 327) = v214 + 1;
                sub_18F4084AC((double *)v213 + 36, CFSTR("keepBoresightCenteredDueToDynamicsDuration"));
                sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 42, CFSTR("durationOfSessionHeadtracked"));
                LOBYTE(v209) = 1;
                goto LABEL_454;
              }
            }
            else
            {
              LOBYTE(v209) = 0;
              previousKeepBoresightCentered = self->_previousKeepBoresightCentered;
            }
            if ((v208 & 1) == 0 && previousKeepBoresightCentered)
            {
              if (qword_1EE16D818 != -1)
                dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
              v215 = qword_1EE16D820;
              if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F1DC000, v215, OS_LOG_TYPE_INFO, "[CMMediaSession] leaving keepBoresightCentered state.", buf, 2u);
              }
              if (sub_18F1FCA08(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE16D818 != -1)
                  dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
                *(_WORD *)v301 = 0;
                v254 = (char *)_os_log_send_and_compose_impl();
                sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v254);
                if (v254 != buf)
                  free(v254);
              }
              sub_18F408688((double *)self->_analyticsTracker.__ptr_.__value_ + 36, CFSTR("keepBoresightCenteredDueToDynamicsDuration"));
              sub_18F4084AC((double *)self->_analyticsTracker.__ptr_.__value_ + 42, CFSTR("durationOfSessionHeadtracked"));
            }
LABEL_454:
            v216 = self->_headTrackingService.__ptr_.__value_;
            if (*((_DWORD *)v216 + 1346))
            {
              v217 = 0;
              v218 = 0.0;
              do
              {
                v218 = v218 + (float)(*(float *)((char *)v216 + v217 + 5336) * *(float *)((char *)v216 + v217 + 5336));
                v217 += 4;
              }
              while (v217 != 12);
              v219 = sqrtf(v218) > 0.34907;
            }
            else
            {
              v219 = 1;
            }
            self->_previousAuxMoving = v219;
            if (*((_DWORD *)v216 + 1328))
            {
              v220 = 0;
              v221 = 0.0;
              do
              {
                v221 = v221 + (float)(*(float *)((char *)v216 + v220 + 5264) * *(float *)((char *)v216 + v220 + 5264));
                v220 += 4;
              }
              while (v220 != 12);
              v222 = sqrtf(v221) > 0.34907;
            }
            else
            {
              v222 = 1;
            }
            self->_previousSrcMoving = v222;
            self->_previousSteadyStatePedestrian = v199;
            self->_previousKeepBoresightCentered = v209;
            v223 = (uint64_t)v216 + 64;
            *(_QWORD *)buf = *(_QWORD *)((char *)v216 + 16068);
            *(_DWORD *)&buf[8] = *((_DWORD *)v216 + 4019);
            v224 = *((unsigned __int8 *)v216 + 16056);
            v225 = (_OWORD *)((char *)v216 + 16108);
            v226 = (_OWORD *)((char *)v216 + 16092);
            if (v224)
              v226 = v225;
            *(_OWORD *)&buf[12] = *v226;
            *(_DWORD *)buf = sub_18F380F20(v223, (float *)buf, (float32x2_t *)&buf[12]);
            *(_DWORD *)&buf[4] = v227;
            *(_DWORD *)&buf[8] = v228;
            self->_lastAngleBetweenCurrentBoresightToDefault = sub_18F48DB10((float *)buf);
            v229 = self->_headTrackingService.__ptr_.__value_;
            v230 = *((_QWORD *)v229 + 2003);
            if (v230)
            {
              v231 = *((float *)v229 + 4008);
              if (v231 > 0.0)
              {
                lastResetCamControllerTimersTimestampUs = self->_lastResetCamControllerTimersTimestampUs;
                if (lastResetCamControllerTimersTimestampUs)
                {
                  v233 = v230 >= lastResetCamControllerTimersTimestampUs;
                  v234 = v230 - lastResetCamControllerTimersTimestampUs;
                  if (v234 != 0 && v233)
                  {
                    v235 = (float)v234 * 0.000001;
                    v236 = v235 - v231;
                    v237 = self->_analyticsTracker.__ptr_.__value_;
                    v238 = v235;
                    v239 = *((double *)v237 + 135);
                    if (v239 <= v238)
                      v239 = v238;
                    *((double *)v237 + 135) = v239;
                    v240 = *((double *)v237 + 134);
                    if (v240 >= v238)
                      v240 = v238;
                    *((double *)v237 + 134) = v240;
                    *((double *)v237 + 136) = *((double *)v237 + 136) + v238;
                    ++*((_DWORD *)v237 + 274);
                    v241 = v236;
                    v242 = *((double *)v237 + 139);
                    if (v242 <= v241)
                      v242 = v241;
                    *((double *)v237 + 139) = v242;
                    v243 = *((double *)v237 + 138);
                    if (v243 >= v241)
                      v243 = v241;
                    *((double *)v237 + 138) = v243;
                    *((double *)v237 + 140) = *((double *)v237 + 140) + v241;
                    ++*((_DWORD *)v237 + 282);
                    v244 = v231;
                    v245 = *((double *)v237 + 143);
                    if (v245 <= v244)
                      v245 = v244;
                    *((double *)v237 + 143) = v245;
                    v246 = *((double *)v237 + 142);
                    if (v246 >= v244)
                      v246 = v244;
                    *((double *)v237 + 142) = v246;
                    *((double *)v237 + 144) = *((double *)v237 + 144) + v244;
                    ++*((_DWORD *)v237 + 290);
                  }
                }
                self->_lastResetCamControllerTimersTimestampUs = v230;
              }
            }
            return;
          }
        }
        else
        {
          if (!self->_previousHeadTurnState)
            goto LABEL_224;
          v119 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 368);
        }
        if (*v119 > 0.0)
          sub_18F408688(v119, &stru_1E295ADC8);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v122 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v122, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting head turn state.", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          *(_WORD *)v301 = 0;
          v252 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v252);
          if (v252 != buf)
            free(v252);
        }
        v121 = 0;
        goto LABEL_223;
      }
    }
    else
    {
      if (!self->_previousCTBodyTurnState)
        goto LABEL_204;
      v115 = (double *)((char *)self->_analyticsTracker.__ptr_.__value_ + 352);
    }
    if (*v115 > 0.0)
      sub_18F408688(v115, &stru_1E295ADC8);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v118 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v118, OS_LOG_TYPE_INFO, "[CMMediaSession] Exiting CT body turn state.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      *(_WORD *)v301 = 0;
      v251 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryDeviceMotion:]", "CoreLocation: %s\n", v251);
      if (v251 != buf)
        free(v251);
    }
    v117 = 0;
    goto LABEL_203;
  }
}

- (void)_feedAccessoryConfig:(const void *)a3
{
  CMMediaSessionAnalyticsTracker *value;
  NSObject *v6;
  _QWORD *v7;
  int v8;
  _QWORD *v9;
  int v10;
  CMMediaSessionAnalyticsTracker *v11;
  int v12;
  NSObject *v13;
  CMMediaSessionAnalyticsTracker *v14;
  int v15;
  __int128 *v16;
  CMMediaSessionAnalyticsTracker *v17;
  int v18;
  CMMediaSessionAnalyticsTracker *v19;
  int v20;
  CMMediaSessionAnalyticsTracker *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  char *v33;
  _QWORD *v34;
  int v35;
  _QWORD *v36;
  int v37;
  char *v38;
  _BYTE v39[18];
  __int16 v40;
  _QWORD *v41;
  __int16 v42;
  int v43;
  _BYTE buf[18];
  __int16 v45;
  _QWORD *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value)
    *((_DWORD *)value + 348) = *((_DWORD *)a3 + 14);
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v6 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0)
      v7 = (_QWORD *)*v7;
    v8 = *(_DWORD *)a3;
    v9 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0)
      v9 = (_QWORD *)*v9;
    v10 = *((_DWORD *)a3 + 14);
    *(_DWORD *)buf = 67240963;
    *(_DWORD *)&buf[4] = v8;
    *(_WORD *)&buf[8] = 2081;
    *(_QWORD *)&buf[10] = v7;
    v45 = 2081;
    v46 = v9;
    v47 = 1026;
    v48 = v10;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Received accessoryDeviceMotion config. side,%{public}d,configuration,%{private}s,serialNumber,%{private}s,hardwareModel,%{public}d", buf, 0x22u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v34 = (char *)a3 + 8;
    if (*((char *)a3 + 31) < 0)
      v34 = (_QWORD *)*v34;
    v35 = *(_DWORD *)a3;
    v36 = (char *)a3 + 32;
    if (*((char *)a3 + 55) < 0)
      v36 = (_QWORD *)*v36;
    v37 = *((_DWORD *)a3 + 14);
    *(_DWORD *)v39 = 67240963;
    *(_DWORD *)&v39[4] = v35;
    *(_WORD *)&v39[8] = 2081;
    *(_QWORD *)&v39[10] = v34;
    v40 = 2081;
    v41 = v36;
    v42 = 1026;
    v43 = v37;
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v38);
    if (v38 != buf)
      free(v38);
  }
  objc_sync_enter(self);
  *(_QWORD *)v39 = 0;
  *(_QWORD *)&v39[8] = 0x3F80000000000000;
  switch(*((_DWORD *)a3 + 14))
  {
    case 1:
      v11 = self->_analyticsTracker.__ptr_.__value_;
      v12 = *(_DWORD *)a3;
      if (v11)
        *((_DWORD *)v11 + 349) = v12;
      if (v12 == 2)
        goto LABEL_55;
      if (v12 == 1)
        goto LABEL_28;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v13 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB298 must be 1 or 2.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          goto LABEL_100;
        goto LABEL_90;
      }
      goto LABEL_67;
    case 2:
      v16 = &xmmword_18F506550;
      goto LABEL_65;
    case 3:
      v17 = self->_analyticsTracker.__ptr_.__value_;
      v18 = *(_DWORD *)a3;
      if (v17)
        *((_DWORD *)v17 + 349) = v18;
      if (v18 == 2)
      {
        v16 = &xmmword_18F506580;
        goto LABEL_65;
      }
      if (v18 == 1)
      {
        v16 = &xmmword_18F506570;
        goto LABEL_65;
      }
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v31 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB688 must be 1 or 2.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 == -1)
        goto LABEL_90;
      goto LABEL_100;
    case 4:
      v19 = self->_analyticsTracker.__ptr_.__value_;
      v20 = *(_DWORD *)a3;
      if (v19)
        *((_DWORD *)v19 + 349) = v20;
      if (v20 == 2)
      {
        v16 = &xmmword_18F5065A0;
        goto LABEL_65;
      }
      if (v20 == 1)
      {
        v16 = &xmmword_18F506590;
        goto LABEL_65;
      }
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v32 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB494 must be 1 or 2.", buf, 2u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 == -1)
        goto LABEL_90;
      goto LABEL_100;
    case 5:
      v14 = self->_analyticsTracker.__ptr_.__value_;
      v15 = *(_DWORD *)a3;
      if (v14)
        *((_DWORD *)v14 + 349) = v15;
      if (v15 == 2)
      {
LABEL_55:
        v16 = &xmmword_18F5065C0;
        goto LABEL_65;
      }
      if (v15 == 1)
      {
LABEL_28:
        v16 = &xmmword_18F5065B0;
LABEL_65:
        *(_OWORD *)buf = *v16;
        sub_18F1FFE94((float32x4_t *)buf, *(float32x4_t *)buf);
        *(_OWORD *)v39 = *(_OWORD *)buf;
        goto LABEL_66;
      }
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v30 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- config side for kAccessoryHardwareModelB698 must be 1 or 2.", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
LABEL_100:
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
LABEL_90:
        v33 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v33);
        if (v33 != buf)
          free(v33);
      }
LABEL_67:
      if (self->_logForReplay)
        sub_18F364C10((uint64_t *)self->_logger.__ptr_.__value_, (int *)a3);
      objc_sync_exit(self);
      return;
    case 6:
      v16 = &xmmword_18F506560;
      goto LABEL_65;
    default:
      if (*((_BYTE *)a3 + 76))
      {
        v21 = self->_analyticsTracker.__ptr_.__value_;
        if (v21)
          *((_DWORD *)v21 + 349) = *(_DWORD *)a3;
        if (v39 != (char *)a3 + 80)
          *(_OWORD *)v39 = *((_OWORD *)a3 + 5);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v22 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *((_DWORD *)a3 + 14);
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v23;
          _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Use the H2H transformation from IORegistry for model %{public}d", buf, 8u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v27 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryConfig:]", "CoreLocation: %s\n", v27);
          if (v27 != buf)
            free(v27);
        }
LABEL_66:
        objc_msgSend__setFixedTransforms_(self, v24, (uint64_t)v39, v25, v26);
        goto LABEL_67;
      }
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v28 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        v29 = *((_DWORD *)a3 + 14);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v29;
        _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_ERROR, "[CMMediaSession] Error -- No H2H transformation for model %{public}d", buf, 8u);
      }
      if (!sub_18F1FCA08(115, 0))
        goto LABEL_67;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        goto LABEL_100;
      goto LABEL_90;
  }
}

- (void)_feedPredictorEstimates
{
  unint64_t predictionIntervalMicroseconds;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL *p_trackingEstimatesStagnated;
  BOOL v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  float32x4_t v20;
  int v21;
  unint64_t v22;
  __int128 buf;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20.i64[0] = 0;
  v20.i64[1] = 0x3F80000000000000;
  v14 = 0;
  objc_sync_enter(self);
  predictionIntervalMicroseconds = self->_predictionIntervalMicroseconds;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  v14 = mach_absolute_time() + predictionIntervalMicroseconds;
  sub_18F3FF5C4((uint64_t)self->_headTrackingService.__ptr_.__value_, &v14, &v20, (uint64_t)&v18, (uint64_t *)&v17, &v16, &v15);
  v4 = v17;
  if (self->_logForReplay)
  {
    *(_QWORD *)&buf = v17;
    *((_QWORD *)&buf + 1) = v14;
    v24 = v16;
    v25 = v18;
    v26 = v19;
    v27 = v15;
    sub_18F3640CC((uint64_t *)self->_logger.__ptr_.__value_, (uint64_t)&buf);
  }
  objc_sync_exit(self);
  if (v4)
  {
    v5 = mach_absolute_time();
    v6 = v5 > v4 + 500000;
    p_trackingEstimatesStagnated = &self->_trackingEstimatesStagnated;
    v8 = !self->_trackingEstimatesStagnated;
    if (!self->_trackingEstimatesStagnated && v5 > v4 + 500000)
    {
      *p_trackingEstimatesStagnated = 1;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v9 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_ERROR, "[CMMediaSession] Tracking stalled, likely due to data gap > 0.5s", (uint8_t *)&buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        LOWORD(v21) = 0;
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedPredictorEstimates]", "CoreLocation: %s\n", v10);
LABEL_26:
        if (v10 != (char *)&buf)
          free(v10);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
  else
  {
    v6 = 0;
    p_trackingEstimatesStagnated = &self->_trackingEstimatesStagnated;
    v8 = !self->_trackingEstimatesStagnated;
  }
  if (!v8 && !v6)
  {
    *p_trackingEstimatesStagnated = 0;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v11 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v4 - self->_lastStateTimestamp;
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Tracking stagnation ended. Gap from last estimate: %llu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v13 = v4 - self->_lastStateTimestamp;
      v21 = 134217984;
      v22 = v13;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedPredictorEstimates]", "CoreLocation: %s\n", v10);
      goto LABEL_26;
    }
  }
LABEL_22:
  self->_lastStateTimestamp = v4;
}

- (void)_feedAccessoryInEarStatus:(const int *)a3
{
  uint64_t *value;
  int v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  __int16 v25;
  uint8_t buf[1640];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_inEarStatusGatingEnabled && *a3 != self->_inEarStatus)
  {
    objc_sync_enter(self);
    if (self->_logForReplay)
    {
      value = (uint64_t *)self->_logger.__ptr_.__value_;
      v6 = *a3;
      v7 = mach_continuous_time();
      v8 = sub_18F1FD20C(v7);
      sub_18F365620(value, v6, v8);
    }
    self->_inEarStatus = *a3;
    objc_sync_exit(self);
    v9 = sub_18F4317A8();
    v10 = (_QWORD *)sub_18F4D6638();
    if ((sub_18F4D7BF0(v10, *(_QWORD *)(v9 + 80)) & 1) != 0)
    {
      if (self->_inEarStatus == 4)
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v11 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Both buds are in ear. Resuming head tracking", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v25 = 0;
          v21 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v21);
          if (v21 != (char *)buf)
            free(v21);
        }
        v12 = sub_18F204AE4();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = sub_18F3BB188;
        v24[3] = &unk_1E2955938;
        v24[4] = self;
        sub_18F1F5E28(v12, (uint64_t)v24);
      }
      else
      {
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v15 = qword_1EE16D820;
        if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] One bud is out of ear. Pausing head tracking", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D818 != -1)
            dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
          v25 = 0;
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v22);
          if (v22 != (char *)buf)
            free(v22);
        }
        v16 = sub_18F204AE4();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = sub_18F3BB190;
        v23[3] = &unk_1E2955938;
        v23[4] = self;
        sub_18F1F5E28(v16, (uint64_t)v23);
        objc_msgSend__notifyClientHandler(self, v17, v18, v19, v20);
      }
    }
    else
    {
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v13 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_ERROR, "[CMMediaSession] Ignore InEar status update because the connected device is not supported", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D818 != -1)
          dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
        v25 = 0;
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _feedAccessoryInEarStatus:]", "CoreLocation: %s\n", v14);
        if (v14 != (char *)buf)
          free(v14);
      }
    }
  }
}

- (void)_feedAdaptiveLatencyJitterBufferLevel
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3BB1F8;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (void)_updateClientMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int clientMode;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  int v23;
  char *v24;
  char *v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v5 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend__mapCMMediaSessionClientModeToRelDMClientMode_(self, a2, a3, v3, v4);
  if (self->_clientMode == (_DWORD)v7)
    return;
  if (self->_headTrackingService.__ptr_.__value_)
  {
    v8 = v7;
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v9 = qword_1EE16D820;
    if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_INFO))
    {
      clientMode = self->_clientMode;
      *(_DWORD *)buf = 67240448;
      v27 = clientMode;
      v28 = 1026;
      v29 = v5;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_INFO, "[CMMediaSession] Changing clientMode from: %{public}d to %{public}d", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    self->_clientMode = v8;
    objc_msgSend__disallowOpportunisticAnchorTrackingForFTClients_clientMode_(self, v11, self->_scheme, v8, v12);
    objc_sync_enter(self);
    sub_18F44C21C((uint64_t)self->_headTrackingService.__ptr_.__value_, self->_clientMode);
    v17 = self->_clientMode & 0xFFFFFFFE;
    if (self->_startedJitterBufferLevelPolling)
    {
      if (v17 != 2)
        goto LABEL_32;
      objc_msgSend__stopJitterBufferLevelMonitor(self, v13, v14, v15, v16);
      self->_startedJitterBufferLevelPolling = 0;
      self->_jitterBufferLevel = -1;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v18 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_clientMode;
        *(_DWORD *)buf = 67109120;
        v27 = v19;
        _os_log_impl(&dword_18F1DC000, v18, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Stop jitterBufferLevelMonitor because clientMode changed to %d", buf, 8u);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_32;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 == -1)
      {
LABEL_41:
        v25 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v25);
        if (v25 != (char *)buf)
          free(v25);
LABEL_32:
        if (self->_logForReplay)
          sub_18F365830((uint64_t *)self->_logger.__ptr_.__value_, self->_clientMode);
        objc_sync_exit(self);
        return;
      }
    }
    else
    {
      if (v17 == 2)
        goto LABEL_32;
      objc_msgSend__startJitterBufferLevelMonitor(self, v13, v14, v15, v16);
      self->_startedJitterBufferLevelPolling = 1;
      if (qword_1EE16D818 != -1)
        dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
      v22 = qword_1EE16D820;
      if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_clientMode;
        *(_DWORD *)buf = 67109120;
        v27 = v23;
        _os_log_impl(&dword_18F1DC000, v22, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Start jitterBufferLevelMonitor because clientMode changed to %d", buf, 8u);
      }
      if (!sub_18F1FCA08(115, 2))
        goto LABEL_32;
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D818 == -1)
        goto LABEL_41;
    }
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    goto LABEL_41;
  }
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v20 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_ERROR, "[CMMediaSession] Called _feedTrackingBehavior before _headTrackingService was initialized. Not able to set client mode.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMMediaSession _updateClientMode:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
  }
}

- (void)_updateTrackingScheme:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!self->_hasUserDefaultTrackingScheme)
    objc_msgSend__setTrackingSchemeInternal_(self, a2, a3, v3, v4);
}

- (void)_feedScreenUnlockedEvent:(BOOL)a3
{
  _BOOL4 v3;
  CMMediaSessionAnalyticsTracker *value;
  double *v6;
  NSObject *v7;
  char *v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  value = self->_analyticsTracker.__ptr_.__value_;
  if (value && (*((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 44) != 0) != a3)
  {
    v6 = (double *)((char *)value + 400);
    if (a3)
    {
      if (*v6 > 0.0)
        sub_18F408688(v6, &stru_1E295ADC8);
    }
    else
    {
      sub_18F4084AC(v6, CFSTR("lockScreenDuration"));
    }
  }
  *((_BYTE *)self->_headTrackingService.__ptr_.__value_ + 44) = v3;
  if (qword_1EE16D818 != -1)
    dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
  v7 = qword_1EE16D820;
  if (os_log_type_enabled((os_log_t)qword_1EE16D820, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v10 = v3;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "[CMMediaSession] Screen state changed. isScreenUnlocked, %{public}d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D818 != -1)
      dispatch_once(&qword_1EE16D818, &unk_1E29531A8);
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMMediaSession _feedScreenUnlockedEvent:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf)
      free(v8);
  }
}

- (AudioAccessorySample)_getLastAudioAccessorySample
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[2].timestamp;
  retstr->auxDM.quaternion = *(CMOQuaternion *)&self[2].auxDM.userAcceleration.elements[2];
  *(_OWORD *)retstr->auxDM.rotationRate.elements = v3;
  *(_OWORD *)&retstr->auxDM.biasCovariance.elements[1] = *(_OWORD *)self[2].filteredAcceleration.elements;
  v4 = *(__int128 *)((char *)&self[3].auxDM.quaternion + 8);
  *(_OWORD *)&retstr->filteredAcceleration.elements[2] = *(_OWORD *)&self[2].gyroBias[2];
  *(_OWORD *)&retstr->sensorLocation = v4;
  *(_OWORD *)&retstr->sampleLatency = *(_OWORD *)&self[3].auxDM.rotationRate.elements[2];
  v5 = *(_OWORD *)&self[2].sampleLatency;
  *(_OWORD *)&retstr->sensorTime = *(_OWORD *)&self[2].sensorLocation;
  *(_QWORD *)((char *)&retstr->auxDM.userAcceleration.elements[1] + 2) = *(_QWORD *)((char *)&self[2].quiescentNoise + 2);
  *(_QWORD *)&retstr->gyroBias[2] = *(_QWORD *)self[3].auxDM.userAcceleration.elements;
  *(_OWORD *)&retstr->arrivalTimestamp = v5;
  return self;
}

- (void)_logEvent:(id)a3
{
  const char *v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_logForReplay)
  {
    objc_sync_enter(self);
    if (objc_msgSend_getCString_maxLength_encoding_(a3, v5, (uint64_t)v6, 1024, 1))
      sub_18F3645A0();
    objc_sync_exit(self);
  }
}

- (void)_setFixedTransforms:(const CMOQuaternion *)a3
{
  CMHeadTrackingService *value;
  _QWORD *v5;
  CMOQuaternion *v6;
  BOOL v7;
  uint64_t v8;
  CMOQuaternion *v9;

  value = self->_headTrackingService.__ptr_.__value_;
  v5 = (_QWORD *)((char *)value + 37496);
  sub_18F3FEDF4((uint64_t)value, (float32x2_t *)a3);
  v6 = (CMOQuaternion *)(*v5 + 76);
  if (*v5)
    v7 = v6 == a3;
  else
    v7 = 1;
  if (!v7)
    *v6 = *a3;
  v8 = v5[3];
  v7 = v8 == 0;
  v9 = (CMOQuaternion *)(v8 + 4968);
  if (!v7 && v9 != a3)
    *v9 = *a3;
}

- (BOOL)isRequestingCameraOn
{
  return self->_requestingCameraOn;
}

- (void)setRequestingCameraOn:(BOOL)a3
{
  self->_requestingCameraOn = a3;
}

- (unsigned)accessoryIMUSampleRate
{
  return self->_accessoryIMUSampleRate;
}

- (void)setAccessoryIMUSampleRate:(unsigned int)a3
{
  self->_accessoryIMUSampleRate = a3;
}

- (float)prevAmbienceBedRoll
{
  return self->_prevAmbienceBedRoll;
}

- (void)setPrevAmbienceBedRoll:(float)a3
{
  self->_prevAmbienceBedRoll = a3;
}

- (BOOL)returnDefaultPose
{
  return self->_returnDefaultPose;
}

- (void)setReturnDefaultPose:(BOOL)a3
{
  self->_returnDefaultPose = a3;
}

- (BOOL)returnRandomPose
{
  return self->_returnRandomPose;
}

- (void)setReturnRandomPose:(BOOL)a3
{
  self->_returnRandomPose = a3;
}

- (BOOL)alwaysNotify50HzPose
{
  return self->_alwaysNotify50HzPose;
}

- (void)setAlwaysNotify50HzPose:(BOOL)a3
{
  self->_alwaysNotify50HzPose = a3;
}

- (NSString)mcLogPath
{
  return (NSString *)objc_getProperty(self, a2, 776, 1);
}

- (void)setMcLogPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 776);
}

- (void).cxx_destruct
{
  CLSettings *value;
  CMMediaSessionAnalyticsTracker *v4;

  sub_18F346D8C((uint64_t **)&self->_logger, 0);
  value = self->_motionSettings.__ptr_.__value_;
  self->_motionSettings.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLSettings *))(*(_QWORD *)value + 8))(value);
  v4 = self->_analyticsTracker.__ptr_.__value_;
  self->_analyticsTracker.__ptr_.__value_ = 0;
  if (v4)
    sub_18F3BC02C(v4);
  sub_18F3BBFBC((uint64_t *)&self->_headTrackingService, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *(_QWORD *)((char *)self + 84) = 0;
  *(_QWORD *)((char *)self + 92) = 0x3F80000000000000;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0xA00000000;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 43) = 0x3F80000000000000;
  *((_WORD *)self + 194) = 0;
  *((_QWORD *)self + 70) = 0;
  *((_QWORD *)self + 81) = 0;
  *(_QWORD *)((char *)self + 708) = 0;
  *(_QWORD *)((char *)self + 716) = 0x3F80000000000000;
  return self;
}

@end
