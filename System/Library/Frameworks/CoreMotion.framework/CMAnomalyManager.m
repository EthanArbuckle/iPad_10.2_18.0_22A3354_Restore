@implementation CMAnomalyManager

- (void)setDelegate:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_delegate)
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
    v5 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_INFO))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code unregistered delegate, unregistering for anomaly detection\"}", (uint8_t *)&v13, 0x12u);
    }
    objc_msgSend__registerForAnomalyDetection_(self, v6, 0, v7, v8);
  }

  self->fLastReceivedEvent = objc_alloc_init(CMAnomalyEvent);
  self->fLastDispatchedEvent = objc_alloc_init(CMAnomalyEvent);
  self->_delegate = (CMAnomalyDelegate *)a3;
  if (a3)
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
    v9 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_INFO))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code registered delegate, registering for anomaly detection\"}", (uint8_t *)&v13, 0x12u);
    }
    objc_msgSend__registerForAnomalyDetection_(self, v10, 1, v11, v12);
  }
}

+ (BOOL)isAnomalyDetectionAvailable
{
  _BOOL4 v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((sub_18F1F7BFC() & 0x8000000000) != 0)
  {
    v2 = 1;
  }
  else
  {
    if (qword_1ECEDF910 != -1)
      dispatch_once(&qword_1ECEDF910, &unk_1E2953688);
    v2 = byte_1ECEDF908 != 0;
  }
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v3 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289538;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 1026;
    v9 = v2;
    v10 = 1026;
    v11 = byte_1ECEDF908;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMAnomalyManager: checking availability\", \"available\":%{public}hhd, \"forced\":%{public}hhd}", (uint8_t *)v5, 0x1Eu);
  }
  return v2;
}

- (CMAnomalyManager)init
{
  CMAnomalyManager *v2;
  CMAnomalyManager *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *__p;
  char v9;
  void *v10[2];
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMAnomalyManager;
  v2 = -[CMAnomalyManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fRegisteredForNotification = 0;
    v2->fLastReceivedEvent = objc_alloc_init(CMAnomalyEvent);
    v3->fLastDispatchedEvent = objc_alloc_init(CMAnomalyEvent);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAnomalyManagerPrivateQueue", v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->fAppQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAnomalyManagerAppQueue", v5);
    v6 = operator new();
    sub_18F270374(v10, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v6, v10, v3->fPrivateQueue);
    v3->fLocationdConnection = (void *)v6;
    if (v11 < 0)
      operator delete(v10[0]);
    sub_18F270374(&__p, "kCLConnectionMessageAnomalyEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v9 < 0)
      operator delete(__p);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start((CLConnectionClient *)v3->fLocationdConnection);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *fPrivateQueue;
  NSObject *fAppQueue;
  objc_super v8;
  void *__p;
  char v10;

  objc_msgSend__registerForAnomalyDetection_(self, a2, 0, v2, v3);
  sub_18F270374(&__p, "kCLConnectionMessageAnomalyEvent");
  CLConnectionClient::setHandlerForMessage();
  if (v10 < 0)
    operator delete(__p);
  if (self->fLocationdConnection)
  {
    v5 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v5, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  fPrivateQueue = self->fPrivateQueue;
  if (fPrivateQueue)
  {
    dispatch_release(fPrivateQueue);
    self->fPrivateQueue = 0;
  }
  fAppQueue = self->fAppQueue;
  if (fAppQueue)
  {
    dispatch_release(fAppQueue);
    self->fAppQueue = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)CMAnomalyManager;
  -[CMAnomalyManager dealloc](&v8, sel_dealloc);
}

- (void)startAnomalyDetection
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v2 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_FAULT))
  {
    v4 = 68289026;
    v5 = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  }
  v3 = qword_1EE16D830;
  if (os_signpost_enabled((os_log_t)qword_1EE16D830))
  {
    v4 = 68289026;
    v5 = 0;
    v6 = 2082;
    v7 = "";
    _os_signpost_emit_with_name_impl(&dword_18F1DC000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to startAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
  }
}

- (void)stopAnomalyDetection
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  int v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v2 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_FAULT))
  {
    v4 = 68289026;
    v5 = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  }
  v3 = qword_1EE16D830;
  if (os_signpost_enabled((os_log_t)qword_1EE16D830))
  {
    v4 = 68289026;
    v5 = 0;
    v6 = 2082;
    v7 = "";
    _os_signpost_emit_with_name_impl(&dword_18F1DC000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to stopAnomalyDetection which was deprecated\"}", (uint8_t *)&v4, 0x12u);
  }
}

- (void)_registerForAnomalyDetection:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v5 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 68289282;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v3;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: registering for anomaly detection\", \"registerFlag\":%{public}hhd}", (uint8_t *)v9, 0x18u);
  }
  self->fRegisteredForNotification = v3;
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v6, (uint64_t)self->fLastReceivedEvent, v7, v8);
}

- (void)ackAnomalyEvent:(id)a3 withResolution:(int64_t)a4
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v4 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_FAULT))
  {
    v6 = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated\"}", (uint8_t *)&v6, 0x12u);
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  }
  v5 = qword_1EE16D830;
  if (os_signpost_enabled((os_log_t)qword_1EE16D830))
  {
    v6 = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_signpost_emit_with_name_impl(&dword_18F1DC000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated", "{\"msg%{public}.0s\":\"CMAnomalyManager: client code tried to ackAnomalyEvent which was deprecated\"}", (uint8_t *)&v6, 0x12u);
  }
}

- (void)_sendRegistrationForAnomalyEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 fRegisteredForNotification;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  _BOOL4 v45;
  void *v46;
  CFAbsoluteTime Current;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *fPrivateQueue;
  _QWORD v53[6];
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4))
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
    v7 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
    {
      fRegisteredForNotification = self->fRegisteredForNotification;
      v13 = objc_msgSend_identifier(a3, v8, v9, v10, v11);
      objc_msgSend_absoluteTimestamp(a3, v14, v15, v16, v17);
      v19 = v18;
      objc_msgSend_updateTimestamp(a3, v20, v21, v22, v23);
      *(_DWORD *)buf = 68291075;
      v55 = 0;
      v56 = 2082;
      v57 = "";
      v58 = 1026;
      v59 = fRegisteredForNotification;
      v60 = 2050;
      v61 = v13;
      v62 = 2049;
      v63 = v19;
      v64 = 2049;
      v65 = v40;
      v66 = 2049;
      v67 = objc_msgSend_state(a3, v24, v25, v26, v27);
      v68 = 2049;
      v69 = objc_msgSend_response(a3, v28, v29, v30, v31);
      v70 = 2049;
      v71 = objc_msgSend_resolution(a3, v32, v33, v34, v35);
      v72 = 2049;
      v73 = objc_msgSend_sosState(a3, v36, v37, v38, v39);
      v41 = "{\"msg%{public}.0s\":\"CMAnomalyManager: sendRegistrationForAnomalyEvent with event\", \"registerFlag\":%{pu"
            "blic}hhd, \"identifier\":%{public}llu, \"anomaly timestamp\":\"%{private}f\", \"update timestamp\":\"%{priva"
            "te}f\", \"state\":%{private}ld, \"response\":%{private}ld, \"resolution\":%{private}ld, \"sosState\":%{private}ld}";
      v42 = v7;
      v43 = 94;
LABEL_10:
      _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_DEBUG, v41, buf, v43);
    }
  }
  else
  {
    if (qword_1EE16D828 != -1)
      dispatch_once(&qword_1EE16D828, &unk_1E2957200);
    v44 = qword_1EE16D830;
    if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
    {
      v45 = self->fRegisteredForNotification;
      *(_DWORD *)buf = 68289282;
      v55 = 0;
      v56 = 2082;
      v57 = "";
      v58 = 1026;
      v59 = v45;
      v41 = "{\"msg%{public}.0s\":\"CMAnomalyManager: sendRegistrationForAnomalyEvent with no event\", \"registerFlag\":%{public}hhd}";
      v42 = v44;
      v43 = 24;
      goto LABEL_10;
    }
  }
  v46 = (void *)objc_msgSend_copy(a3, v8, v9, v10, v11);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setUpdateTimestamp_(v46, v48, v49, v50, v51, Current);
  fPrivateQueue = self->fPrivateQueue;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = sub_18F403660;
  v53[3] = &unk_1E29559D0;
  v53[4] = self;
  v53[5] = v46;
  dispatch_async(fPrivateQueue, v53);

}

+ (int64_t)getAnomalyFeatureEnablingStrategyForUserAge:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  int64_t result;

  objc_msgSend_doubleValue(a3, a2, (uint64_t)a3, v3, v4);
  result = 0;
  if (a3 && v6 >= 0.0)
  {
    if (v6 >= 18.0)
    {
      if (v6 >= 55.0)
      {
        if (v6 >= 65.0)
          return 5;
        else
          return 4;
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)respondToAnomalyEvent:(id)a3 withResponse:(int64_t)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v25 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));
  }
  if (objc_msgSend_response(a3, a2, (uint64_t)a3, a4, v4) && objc_msgSend_response(a3, v9, v10, v11, v12) != a4)
  {
    v33 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.response == CMAnomalyEventResponseNone || event.response == response"));
  }
  if (!objc_msgSend_identifier(a3, v9, v10, v11, v12))
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.identifier != 0"));
  }
  if (a4 <= 0)
  {
    v29 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response > CMAnomalyEventResponseNone"));
  }
  else if ((unint64_t)a4 >= 6)
  {
    v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response <= CMAnomalyEventResponseAutomaticActionRequested"));
  }
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v17 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = objc_msgSend_identifier(a3, v18, v19, v20, v21);
    v41 = 2049;
    v42 = a4;
    _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: respondToAnomalyEvent\", \"identifier\":%{public}llu, \"response\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setResponse_(a3, v18, a4, v20, v21);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v22, (uint64_t)a3, v23, v24);
}

- (void)resolveAnomalyEvent:(id)a3 withResolution:(int64_t)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v25 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));
  }
  if (objc_msgSend_resolution(a3, a2, (uint64_t)a3, a4, v4) && objc_msgSend_resolution(a3, v9, v10, v11, v12) != a4)
  {
    v33 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.resolution == CMAnomalyEventResolutionNone || event.resolution == resolution"));
  }
  if (!objc_msgSend_identifier(a3, v9, v10, v11, v12))
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.identifier != 0"));
  }
  if (a4 <= 0)
  {
    v29 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolution > CMAnomalyEventResolutionNone"));
  }
  else if ((unint64_t)a4 >= 3)
  {
    v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolution <= CMAnomalyEventResolutionCanceled"));
  }
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v17 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = objc_msgSend_identifier(a3, v18, v19, v20, v21);
    v41 = 2049;
    v42 = a4;
    _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: resolveAnomalyEvent\", \"identifier\":%{public}llu, \"resolution\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setResolution_(a3, v18, a4, v20, v21);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v22, (uint64_t)a3, v23, v24);
}

- (void)updateAnomalyEventSOSCallState:(id)a3 withSOSSCallState:(int64_t)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
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
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v39 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));
  }
  if (!objc_msgSend_identifier(a3, a2, (uint64_t)a3, a4, v4))
  {
    v41 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.identifier != 0"));
  }
  if ((unint64_t)(a4 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    v43 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(sosCallState >= CMAnomalyEventResponseSOSCallInitiated) && (sosCallState <= CMAnomalyEventResponseSOSCallFailed)"));
  }
  if (objc_msgSend_resolution(a3, v9, v10, v11, v12) != 1)
  {
    v45 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.resolution == CMAnomalyEventResolutionCompleted"));
  }
  if (objc_msgSend_response(a3, v13, v14, v15, v16) != 1 && objc_msgSend_response(a3, v17, v18, v19, v20) != 5)
  {
    v47 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(event.response == CMAnomalyEventResponseConfirmedActionRequested) || (event.response == CMAnomalyEventResponseAutomaticActionRequested)"));
  }
  if ((unint64_t)(a4 - 2) >= 3)
  {
    if (a4 == 1 && objc_msgSend_sosState(a3, v17, v18, v19, v20))
    {
      v49 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v27, v28, v29, v30);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v49, v50, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.sosState == CMAnomalyEventResponseSOSCallNone"));
    }
  }
  else if (objc_msgSend_sosState(a3, v17, v18, v19, v20) != 1)
  {
    v25 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22, v23, v24);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAnomalyManager.mm"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event.sosState == CMAnomalyEventResponseSOSCallInitiated"));
  }
  if (qword_1EE16D828 != -1)
    dispatch_once(&qword_1EE16D828, &unk_1E2957200);
  v31 = qword_1EE16D830;
  if (os_log_type_enabled((os_log_t)qword_1EE16D830, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289539;
    v52 = 0;
    v53 = 2082;
    v54 = "";
    v55 = 2050;
    v56 = objc_msgSend_identifier(a3, v32, v33, v34, v35);
    v57 = 2049;
    v58 = a4;
    _os_log_impl(&dword_18F1DC000, v31, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CMAnomalyManager: updateAnomalyEventSOSCallState\", \"identifier\":%{public}llu, \"sosCallState\":%{private}ld}", buf, 0x26u);
  }
  objc_msgSend_setSosState_(a3, v32, a4, v34, v35);
  objc_msgSend__sendRegistrationForAnomalyEvent_(self, v36, (uint64_t)a3, v37, v38);
}

- (CMAnomalyDelegate)delegate
{
  return self->_delegate;
}

@end
