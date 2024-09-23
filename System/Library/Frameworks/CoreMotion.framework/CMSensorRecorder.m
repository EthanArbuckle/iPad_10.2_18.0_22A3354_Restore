@implementation CMSensorRecorder

+ (BOOL)isRecordingAvailableForType:(int)a3
{
  uint64_t v3;
  char v4;
  CLSensorRecorderSensorAvailable *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  char *v39;
  _QWORD *v40;
  std::__shared_weak_count *v41;
  _QWORD *v42;
  std::__shared_weak_count *v43;
  void *__p[2];
  char v45;
  uint64_t v46;

  v3 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  v5 = objc_alloc_init(CLSensorRecorderSensorAvailable);
  objc_msgSend_setDataType_(v5, v6, v3, v7, v8);
  v9 = (std::__shared_weak_count *)operator new(0x70uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderSensorAvailable");
  MEMORY[0x19400103C](&v9[1], __p, v5);
  if (v45 < 0)
    operator delete(__p[0]);
  v42 = &v9[1].__vftable;
  v43 = v9;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v18 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v16, v13, 0);
  v40 = &v9[1].__vftable;
  v41 = v9;
  do
    v20 = __ldxr(p_shared_owners);
  while (__stxr(v20 + 1, p_shared_owners));
  v21 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v17, (uint64_t)&v40, v18, v19);
  v25 = (void *)v21;
  v26 = v41;
  if (!v41)
    goto LABEL_11;
  v27 = (unint64_t *)&v41->__shared_owners_;
  do
    v28 = __ldaxr(v27);
  while (__stlxr(v28 - 1, v27));
  if (v28)
  {
LABEL_11:
    if (v21)
      goto LABEL_12;
LABEL_15:
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v30 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_FAULT, "Response invalid.", (uint8_t *)__p, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v39 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMSensorRecorder isRecordingAvailableForType:]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)__p)
        free(v39);
    }
    v29 = 0;
    goto LABEL_21;
  }
  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
  std::__shared_weak_count::__release_weak(v26);
  if (!v25)
    goto LABEL_15;
LABEL_12:
  v29 = (void *)objc_msgSend_objectForKeyedSubscript_(v25, v22, (uint64_t)CFSTR("CMAvailable"), v23, v24);
  if (!v29)
    goto LABEL_15;
LABEL_21:

  v4 = objc_msgSend_BOOLValue(v29, v31, v32, v33, v34);
  v35 = v43;
  if (v43)
  {
    v36 = (unint64_t *)&v43->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  return v4;
}

+ (BOOL)isAccelerometerRecordingAvailable
{
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](a1, sel_isRecordingAvailableForType_, 0, v3, v4);
}

+ (BOOL)isGyroRecordingAvailable
{
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](a1, sel_isRecordingAvailableForType_, 1, v3, v4);
}

+ (BOOL)isPressureRecordingAvailable
{
  uint64_t v3;
  uint64_t v4;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return MEMORY[0x1E0DE7D20](a1, sel_isRecordingAvailableForType_, 2, v3, v4);
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

+ (BOOL)isAuthorizedForRecording
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  char v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  char *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  void *__p[2];
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = operator new();
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderAuthorized");
  MEMORY[0x194001030](v2, __p);
  sub_18F391794(&v36, v2);
  if (v39 < 0)
    operator delete(__p[0]);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v3, v6, v4, v7, v8, v5, 0);
  v34 = v36;
  v35 = v37;
  if (v37)
  {
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v34, v10, v11);
  v18 = (void *)v14;
  v19 = v35;
  if (!v35)
    goto LABEL_10;
  v20 = (unint64_t *)&v35->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (v18)
    {
LABEL_11:
      v22 = (void *)objc_msgSend_objectForKeyedSubscript_(v18, v15, (uint64_t)CFSTR("CMAuthorized"), v16, v17);
      if (v22)
        goto LABEL_20;
    }
  }
  else
  {
LABEL_10:
    if (v14)
      goto LABEL_11;
  }
  if (qword_1EE16D848 != -1)
    dispatch_once(&qword_1EE16D848, &unk_1E2945168);
  v27 = qword_1EE16D850;
  if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_18F1DC000, v27, OS_LOG_TYPE_FAULT, "Response invalid.", (uint8_t *)__p, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v33 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "+[CMSensorRecorder isAuthorizedForRecording]", "CoreLocation: %s\n", v33);
    if (v33 != (char *)__p)
      free(v33);
  }
  v22 = 0;
LABEL_20:
  v28 = objc_msgSend_BOOLValue(v22, v23, v24, v25, v26);
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
  return v28;
}

- (id)accelerometerDataSinceId:(unint64_t)a3
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CMSensorDataList *v8;
  const char *v9;
  uint64_t v10;

  v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4, v6, v7);
  v8 = [CMSensorDataList alloc];
  return (id)objc_msgSend_initWithIdentifier_andType_(v8, v9, a3, 0, v10);
}

- (id)gyroDataSinceId:(unint64_t)a3
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CMSensorDataList *v8;
  const char *v9;
  uint64_t v10;

  v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4, v6, v7);
  v8 = [CMSensorDataList alloc];
  return (id)objc_msgSend_initWithIdentifier_andType_(v8, v9, a3, 1, v10);
}

- (id)pressureDataSinceId:(unint64_t)a3
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CMSensorDataList *v8;
  const char *v9;
  uint64_t v10;

  v4 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v5, (uint64_t)v4, v6, v7);
  v8 = [CMSensorDataList alloc];
  return (id)objc_msgSend_initWithIdentifier_andType_(v8, v9, a3, 2, v10);
}

- (CMSensorDataList)accelerometerDataFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
  return (CMSensorDataList *)MEMORY[0x1E0DE7D20](self, sel_sensorDataFromDate_toDate_forType_, fromDate, toDate, 0);
}

- (id)gyroDataFromDate:(id)a3 toDate:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_sensorDataFromDate_toDate_forType_, a3, a4, 1);
}

- (id)pressureDataFromDate:(id)a3 toDate:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_sensorDataFromDate_toDate_forType_, a3, a4, 2);
}

- (BOOL)validateTimesFromDate:(id *)a3 toDate:(id)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double Current;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;

  if (!a3)
  {
    v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startTime"));
  }
  if (*a3)
  {
    if (a4)
      goto LABEL_5;
  }
  else
  {
    v33 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("*startTime"));
    if (a4)
      goto LABEL_5;
  }
  v35 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endTime"));
LABEL_5:
  objc_msgSend_timeIntervalSinceDate_(a4, a2, (uint64_t)*a3, (uint64_t)a4, v4);
  if (v13 < 0.0)
  {
    v37 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 644, CFSTR("startTime must be <= to endTime"));
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_timeIntervalSinceReferenceDate(*a3, v15, v16, v17, v18);
  if (Current - v23 >= 259200.0)
  {
    v39 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20, v21, v22);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 645, CFSTR("startTime must be within 3 days of today."));
  }
  objc_msgSend_timeIntervalSinceDate_(a4, v19, (uint64_t)*a3, v21, v22);
  v29 = v28;
  if (v28 > 43200.0)
    *a3 = (id)objc_msgSend_dateByAddingTimeInterval_(a4, v24, v25, v26, v27, -43200.0);
  return v29 > 43200.0;
}

- (id)sensorDataFromDate:(id)a3 toDate:(id)a4 forType:(int)a5
{
  uint64_t v5;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  CMSensorDataList *v26;
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
  objc_class *v42;
  NSString *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  id v56;
  int v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v5 = *(_QWORD *)&a5;
  v65 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (objc_msgSend_validateTimesFromDate_toDate_(self, a2, (uint64_t)&v56, (uint64_t)a4, *(uint64_t *)&a5))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v8 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v15 = objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
      v16 = NSStringFromSelector(a2);
      v21 = objc_msgSend_UTF8String(v16, v17, v18, v19, v20);
      *(_DWORD *)buf = 136446466;
      v62 = v15;
      v63 = 2082;
      v64 = v21;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "#Notice -[%{public}s %{public}s] fromDate has been adjusted so that the duration requested is <= 12 hours.", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      v48 = objc_msgSend_UTF8String(v43, v44, v45, v46, v47);
      v49 = NSStringFromSelector(a2);
      v54 = objc_msgSend_UTF8String(v49, v50, v51, v52, v53);
      v57 = 136446466;
      v58 = v48;
      v59 = 2082;
      v60 = v54;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSensorRecorder sensorDataFromDate:toDate:forType:]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)buf)
        free(v55);
    }
  }
  v22 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v23, (uint64_t)v22, v24, v25);
  v26 = [CMSensorDataList alloc];
  objc_msgSend_timeIntervalSinceReferenceDate(v56, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_timeIntervalSinceReferenceDate(a4, v33, v34, v35, v36);
  return (id)objc_msgSend_initFrom_to_withType_(v26, v37, v5, v38, v39, v32, v40);
}

- (BOOL)sendAccelDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3, a4, a5);
}

- (BOOL)sendGyroDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3, a4, a5);
}

- (BOOL)sendPressureDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_sendSensorDataToUrl_fromDate_toDate_forType_, a3, a4, a5);
}

- (BOOL)sendSensorDataToUrl:(id)a3 fromDate:(id)a4 toDate:(id)a5 forType:(int)a6
{
  uint64_t v6;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMSensorRecorderInternal *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  objc_class *v69;
  NSString *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSString *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  id v89;
  int v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v6 = *(_QWORD *)&a6;
  v98 = *MEMORY[0x1E0C80C00];
  v89 = a4;
  if (objc_msgSend_validateTimesFromDate_toDate_(self, a2, (uint64_t)&v89, (uint64_t)a5, (uint64_t)a5))
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v10 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v17 = objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
      v18 = NSStringFromSelector(a2);
      v23 = objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
      *(_DWORD *)buf = 136446466;
      v95 = v17;
      v96 = 2082;
      v97 = v23;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "#Notice -[%{public}s %{public}s] fromDate has been adjusted so that the duration requested is <= 12 hours.", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v69 = (objc_class *)objc_opt_class();
      v70 = NSStringFromClass(v69);
      v75 = objc_msgSend_UTF8String(v70, v71, v72, v73, v74);
      v76 = NSStringFromSelector(a2);
      v81 = objc_msgSend_UTF8String(v76, v77, v78, v79, v80);
      v90 = 136446466;
      v91 = v75;
      v92 = 2082;
      v93 = v81;
      v82 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSensorRecorder sendSensorDataToUrl:fromDate:toDate:forType:]", "CoreLocation: %s\n", v82);
      if (v82 != (char *)buf)
        free(v82);
    }
  }
  v24 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v25, (uint64_t)v24, v26, v27);
  v31 = objc_msgSend_fileHandleForWritingToURL_(CMMotionUtils, v28, (uint64_t)a3, v29, v30);
  if (v31)
  {
    v32 = v31;
    v33 = objc_alloc_init(CMSensorRecorderInternal);
    objc_msgSend_timeIntervalSinceReferenceDate(v89, v34, v35, v36, v37);
    v39 = v38;
    objc_msgSend_timeIntervalSinceReferenceDate(a5, v40, v41, v42, v43);
    v51 = objc_msgSend_writeSensorDataToFile_from_to_forType_(v33, v44, v32, v6, v45, v39, v46);
    if ((v51 & 1) == 0)
    {
      v52 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v47, v48, v49, v50);
      objc_msgSend_removeItemAtURL_error_(v52, v53, (uint64_t)a3, 0, v54);
    }

  }
  else
  {
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v55 = qword_1EE16D850;
    if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_DEFAULT))
    {
      v60 = objc_msgSend_absoluteString(a3, v56, v57, v58, v59);
      *(_DWORD *)buf = 138543362;
      v95 = v60;
      _os_log_impl(&dword_18F1DC000, v55, OS_LOG_TYPE_DEFAULT, "#Notice Unable to get file handle for URL %{public}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D848 != -1)
        dispatch_once(&qword_1EE16D848, &unk_1E2945168);
      v87 = objc_msgSend_absoluteString(a3, v83, v84, v85, v86);
      v90 = 138543362;
      v91 = v87;
      v88 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSensorRecorder sendSensorDataToUrl:fromDate:toDate:forType:]", "CoreLocation: %s\n", v88);
      if (v88 != (char *)buf)
        free(v88);
    }
    v65 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v61, v62, v63, v64);
    objc_msgSend_removeItemAtURL_error_(v65, v66, (uint64_t)a3, 0, v67);
    return 0;
  }
  return v51;
}

- (void)recordAccelerometerForDuration:(NSTimeInterval)duration
{
  ((void (*)(CMSensorRecorder *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_recordDataType_forDuration_, 0);
}

- (void)recordGyroForDuration:(double)a3
{
  ((void (*)(CMSensorRecorder *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_recordDataType_forDuration_, 1);
}

- (void)recordPressureForDuration:(double)a3
{
  ((void (*)(CMSensorRecorder *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_recordDataType_forDuration_, 2);
}

- (void)recordDataType:(int)a3 forDuration:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CLSensorRecorderRecordSensorTypeFor *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  void *v46;
  const char *v47;
  char *v48;
  _QWORD *v49;
  std::__shared_weak_count *v50;
  _QWORD *v51;
  std::__shared_weak_count *v52;
  void *__p[2];
  char v54;
  uint64_t v55;

  v7 = *(_QWORD *)&a3;
  v55 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0.0)
  {
    v46 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, v4, v5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 726, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duration > 0.0"));
  }
  v9 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v10, (uint64_t)v9, v11, v12);
  v13 = objc_alloc_init(CLSensorRecorderRecordSensorTypeFor);
  objc_msgSend_setDuration_(v13, v14, v15, v16, v17, a4);
  objc_msgSend_setDataType_(v13, v18, v7, v19, v20);
  v21 = (std::__shared_weak_count *)operator new(0x70uLL);
  v21->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v21->__shared_owners_;
  v21->__shared_weak_owners_ = 0;
  v21->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "kCLConnectionMessageSensorRecorderRecordFor");
  MEMORY[0x19400103C](&v21[1], __p, v13);
  if (v54 < 0)
    operator delete(__p[0]);
  v51 = &v21[1].__vftable;
  v52 = v21;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v30 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v25, 0);
  v49 = &v21[1].__vftable;
  v50 = v21;
  do
    v32 = __ldxr(p_shared_owners);
  while (__stxr(v32 + 1, p_shared_owners));
  v33 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v29, (uint64_t)&v49, v30, v31);
  v37 = (void *)v33;
  v38 = v50;
  if (!v50)
    goto LABEL_11;
  v39 = (unint64_t *)&v50->__shared_owners_;
  do
    v40 = __ldaxr(v39);
  while (__stlxr(v40 - 1, v39));
  if (!v40)
  {
    ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
    std::__shared_weak_count::__release_weak(v38);
    if (v37)
    {
LABEL_12:
      if (!objc_msgSend_objectForKey_(v37, v34, (uint64_t)CFSTR("CMErrorMessage"), v35, v36))
        goto LABEL_18;
    }
  }
  else
  {
LABEL_11:
    if (v33)
      goto LABEL_12;
  }
  if (qword_1EE16D848 != -1)
    dispatch_once(&qword_1EE16D848, &unk_1E2945168);
  v41 = qword_1EE16D850;
  if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_FAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_FAULT, "Response invalid.", (uint8_t *)__p, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v48 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMSensorRecorder recordDataType:forDuration:]", "CoreLocation: %s\n", v48);
    if (v48 != (char *)__p)
      free(v48);
  }
LABEL_18:

  v42 = v52;
  if (v52)
  {
    v43 = (unint64_t *)&v52->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
}

- (id)accelerometerDataFrom:(id)a3 to:(id)a4
{
  return 0;
}

- (id)accelerometerDataSince:(unint64_t)a3
{
  return 0;
}

- (BOOL)setSensorSampleRate:(unsigned int)a3 forType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CMSensorRecorderInternal *v12;
  const char *v13;
  uint64_t v14;
  char v15;
  void *v18;
  const char *v19;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  if (a3 >= 0x65)
  {
    v18 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 762, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rate <= 100"));
  }
  v8 = NSStringFromSelector(a2);
  objc_msgSend_tccServiceMotionAccessWithLabel_(CMMotionUtils, v9, (uint64_t)v8, v10, v11);
  v12 = objc_alloc_init(CMSensorRecorderInternal);
  v15 = objc_msgSend_setSensorSampleRate_forType_(v12, v13, v6, v5, v14);

  return v15;
}

- (BOOL)setAccelSampleRate:(unsigned int)a3
{
  uint64_t v3;

  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 0, v3);
}

- (BOOL)setGyroSampleRate:(unsigned int)a3
{
  uint64_t v3;

  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 1, v3);
}

- (BOOL)setPressureSampleRate:(unsigned int)a3
{
  uint64_t v3;

  return objc_msgSend_setSensorSampleRate_forType_(self, a2, *(uint64_t *)&a3, 2, v3);
}

@end
