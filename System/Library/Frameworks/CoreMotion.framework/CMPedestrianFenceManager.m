@implementation CMPedestrianFenceManager

+ (BOOL)isAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_availableFenceTypes(CMPedestrianFenceManager, a2, v2, v3, v4) != 0;
}

+ (unint64_t)availableFenceTypes
{
  uint64_t v2;

  sub_18F1F77DC();
  if (sub_18F375EC4())
    v2 = 2;
  else
    v2 = 0;
  sub_18F1F77DC();
  return v2 | sub_18F375F70();
}

- (void)startSession
{
  ((void (*)(CMPedestrianFenceManager *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_startSessionWithStatusHandler_, 0);
}

- (void)startSessionWithStatusHandler:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  uint8_t buf[1640];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D908 != -1)
    dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
  v5 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Starting pedestrian fence session", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager startSessionWithStatusHandler:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  v10 = (void *)objc_msgSend__internal(self, v6, v7, v8, v9);
  objc_msgSend__setInSession_withStatusHandler_(v10, v11, 1, (uint64_t)a3, v12);
}

- (void)endSession
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D908 != -1)
    dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
  v3 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Ending pedestrian fence session", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager endSession]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  v8 = (void *)objc_msgSend__internal(self, v4, v5, v6, v7);
  objc_msgSend__setInSession_withStatusHandler_(v8, v9, 0, 0, v10);
}

- (void)setFence:(id)a3 withRadius:(float)a4 withCompletion:(id)a5
{
  uint64_t v5;
  NSObject *v6;
  const char *v8;
  SEL v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint8_t buf[4];
  _BYTE v37[24];
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v6 = a5;
  v8 = (const char *)a3;
  v9 = a2;
  v40 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3, (uint64_t)a5, v5) & 1) != 0)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v28 = qword_1EE16D910;
    v9 = "";
    self = (CMPedestrianFenceManager *)"assert";
    v8 = "[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v37 = 0;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = "";
      *(_WORD *)&v37[14] = 2082;
      *(_QWORD *)&v37[16] = "assert";
      v38 = 2081;
      v39 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v29 = qword_1EE16D910;
    if (os_signpost_enabled((os_log_t)qword_1EE16D910))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v37 = 0;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = "";
      *(_WORD *)&v37[14] = 2082;
      *(_QWORD *)&v37[16] = "assert";
      v38 = 2081;
      v39 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v6 = qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v37 = 0;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = "";
      *(_WORD *)&v37[14] = 2082;
      *(_QWORD *)&v37[16] = "assert";
      v38 = 2081;
      v39 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v34 = 236;
    v35 = "-[CMPedestrianFenceManager setFence:withRadius:withCompletion:]";
    v33 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  v30 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13, v14, v33, v34, v35);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)v9, (uint64_t)self, (uint64_t)CFSTR("CMPedestrianFenceManager.mm"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
LABEL_3:
  if (qword_1EE16D908 != -1)
    dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
  v15 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v37 = v8;
    *(_WORD *)&v37[8] = 2050;
    *(double *)&v37[10] = a4;
    _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "Setting pedestrian fence: fenceID,%{public}@,radiusMeters,%{public}f", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v32 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager setFence:withRadius:withCompletion:]", "CoreLocation: %s\n", v32);
    if (v32 != (char *)buf)
      free(v32);
  }
  *(float *)&v20 = a4;
  v21 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v16, v17, v18, v19, v20);
  v26 = (void *)objc_msgSend__internal(self, v22, v23, v24, v25);
  objc_msgSend__setFence_withRadius_wake_delay_withCompletion_(v26, v27, (uint64_t)v8, v21, 1, 0, v6);
}

- (void)clearFence:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint8_t buf[4];
  _BYTE v22[14];
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3, v3, v4) & 1) != 0)
  {
    if (qword_1EE16D908 == -1)
      goto LABEL_3;
  }
  else
  {
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v15 = qword_1EE16D910;
    self = (CMPedestrianFenceManager *)"[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v16 = qword_1EE16D910;
    if (os_signpost_enabled((os_log_t)qword_1EE16D910))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v5 = qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v19 = 246;
    v20 = "-[CMPedestrianFenceManager clearFence:]";
    v18 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
LABEL_3:
  v7 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v22 = v5;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Clearing pedestrian fence: fenceID,%{public}@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    LODWORD(v19) = 12;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager clearFence:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v12 = (void *)objc_msgSend__internal(self, v8, v9, v10, v11, v18, v19, v20);
  objc_msgSend__clearFence_force_(v12, v13, (uint64_t)v5, 0, v14);
}

- (void)simulateFence:(id)a3 withExitAfterDelay:(double)a4 wake:(BOOL)a5 withCompletion:(id)a6
{
  NSObject *v6;
  uint64_t v7;
  const char *v9;
  SEL v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  float v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint8_t buf[4];
  _BYTE v38[24];
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v6 = a6;
  v7 = a5;
  v9 = (const char *)a3;
  v10 = a2;
  v41 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3, a5, (uint64_t)a6) & 1) != 0)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v29 = qword_1EE16D910;
    v10 = "l22MagneticAccessoryType2E";
    self = (CMPedestrianFenceManager *)"";
    v9 = "assert";
    v7 = (uint64_t)"[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v38 = 0;
      *(_WORD *)&v38[4] = 2082;
      *(_QWORD *)&v38[6] = "";
      *(_WORD *)&v38[14] = 2082;
      *(_QWORD *)&v38[16] = "assert";
      v39 = 2081;
      v40 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v30 = qword_1EE16D910;
    if (os_signpost_enabled((os_log_t)qword_1EE16D910))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v38 = 0;
      *(_WORD *)&v38[4] = 2082;
      *(_QWORD *)&v38[6] = "";
      *(_WORD *)&v38[14] = 2082;
      *(_QWORD *)&v38[16] = "assert";
      v39 = 2081;
      v40 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v6 = qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v38 = 0;
      *(_WORD *)&v38[4] = 2082;
      *(_QWORD *)&v38[6] = "";
      *(_WORD *)&v38[14] = 2082;
      *(_QWORD *)&v38[16] = "assert";
      v39 = 2081;
      v40 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v35 = 253;
    v36 = "-[CMPedestrianFenceManager simulateFence:withExitAfterDelay:wake:withCompletion:]";
    v34 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14, v15, v34, v35, v36);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)v10, (uint64_t)self, (uint64_t)CFSTR("CMPedestrianFenceManager.mm"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
LABEL_3:
  if (qword_1EE16D908 != -1)
    dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
  v16 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    v17 = a4;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v38 = v9;
    *(_WORD *)&v38[8] = 2050;
    *(double *)&v38[10] = v17;
    *(_WORD *)&v38[18] = 1026;
    *(_DWORD *)&v38[20] = v7;
    _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEFAULT, "Simulating fence exit: fenceID,%{public}@,delay,%{public}f,shouldWake,%{public}d", buf, 0x1Cu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v33 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager simulateFence:withExitAfterDelay:wake:withCompletion:]", "CoreLocation: %s\n", v33);
    if (v33 != (char *)buf)
      free(v33);
  }
  v22 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v18, v19, v20, v21, a4);
  v27 = (void *)objc_msgSend__internal(self, v23, v24, v25, v26);
  objc_msgSend__setFence_withRadius_wake_delay_withCompletion_(v27, v28, (uint64_t)v9, 0, v7, v22, v6);
}

- (void)forceClearFence:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint8_t buf[4];
  _BYTE v22[14];
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, (uint64_t)a3, v3, v4) & 1) != 0)
  {
    if (qword_1EE16D908 == -1)
      goto LABEL_3;
  }
  else
  {
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v15 = qword_1EE16D910;
    self = (CMPedestrianFenceManager *)"[CMPedestrianFenceManager isAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v16 = qword_1EE16D910;
    if (os_signpost_enabled((os_log_t)qword_1EE16D910))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v5 = qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v19 = 263;
    v20 = "-[CMPedestrianFenceManager forceClearFence:]";
    v18 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
LABEL_3:
  v7 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v22 = v5;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Force clearing pedestrian fence: fenceID,%{public}@", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    LODWORD(v19) = 12;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager forceClearFence:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v12 = (void *)objc_msgSend__internal(self, v8, v9, v10, v11, v18, v19, v20);
  objc_msgSend__clearFence_force_(v12, v13, (uint64_t)v5, 1, v14);
}

- (void)forceClearAllFences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
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
  if ((objc_msgSend_isAvailable(CMPedestrianFenceManager, a2, v2, v3, v4) & 1) != 0)
  {
    if (qword_1EE16D908 == -1)
      goto LABEL_3;
  }
  else
  {
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    v14 = qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    v15 = qword_1EE16D910;
    if (os_signpost_enabled((os_log_t)qword_1EE16D910))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "[CMPedestrianFenceManager isAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PedestrianFence is not available on this platform", "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D908 != -1)
        dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    }
    self = (CMPedestrianFenceManager *)qword_1EE16D910;
    if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2082;
      v25 = "assert";
      v26 = 2081;
      v27 = "[CMPedestrianFenceManager isAvailable]";
      _os_log_impl(&dword_18F1DC000, &self->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"PedestrianFence is not available on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v18 = 270;
    v19 = "-[CMPedestrianFenceManager forceClearAllFences]";
    v17 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/PedestrianFence/CMPedestrianFenceManager.mm";
    abort_report_np();
  }
  dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
LABEL_3:
  v6 = qword_1EE16D910;
  if (os_log_type_enabled((os_log_t)qword_1EE16D910, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "Force clearing all fences", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D908 != -1)
      dispatch_once(&qword_1EE16D908, &unk_1E2958B30);
    LODWORD(v18) = 2;
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPedestrianFenceManager forceClearAllFences]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf)
      free(v16);
  }
  v11 = (void *)objc_msgSend__internal(self, v7, v8, v9, v10, v17, v18, v19);
  objc_msgSend__clearFence_force_(v11, v12, 0, 1, v13);
}

- (CMPedestrianFenceManager)init
{
  CMPedestrianFenceManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMPedestrianFenceManager;
  v2 = -[CMPedestrianFenceManager init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMPedestrianFenceManagerInternal);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMPedestrianFenceManager;
  -[CMPedestrianFenceManager dealloc](&v3, sel_dealloc);
}

- (CMPedestrianFenceManagerInternal)_internal
{
  return (CMPedestrianFenceManagerInternal *)self->_internal;
}

@end
