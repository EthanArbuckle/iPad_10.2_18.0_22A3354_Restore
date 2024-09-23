@implementation CMMotionActivityManager

- (void)queryActivityStartingFromDate:(NSDate *)start toDate:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityQueryHandler)handler
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  _QWORD v34[9];

  if (start)
  {
    if (end)
      goto LABEL_3;
  }
  else
  {
    v26 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)end, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));
    if (end)
    {
LABEL_3:
      if (queue)
        goto LABEL_4;
LABEL_8:
      v30 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
      if (handler)
        goto LABEL_5;
LABEL_9:
      v32 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
      goto LABEL_5;
    }
  }
  v28 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));
  if (!queue)
    goto LABEL_8;
LABEL_4:
  if (!handler)
    goto LABEL_9;
LABEL_5:
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v16 = (void *)objc_msgSend_initWithCapacity_(v12, v13, 16, v14, v15);
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v21 = (void *)objc_msgSend_initWithCapacity_(v17, v18, 16, v19, v20);
  objc_msgSend_paginateDatesIntoDatesFrom_datesTo_start_end_intervalLength_(CMMotionActivityManager, v22, (uint64_t)v16, (uint64_t)v21, (uint64_t)start, end, 21600.0);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_18F209048;
  v34[3] = &unk_1E2955C48;
  v34[4] = self;
  v34[5] = v16;
  v34[6] = v21;
  v34[7] = queue;
  v34[8] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v23, (uint64_t)v34, v24, v25);

}

- (void)dealloc
{
  id fHandler;
  uint64_t v4;
  NSObject *fQueue;
  uint64_t v6;
  objc_super v7;
  _QWORD block[5];

  fHandler = self->fHandler;
  if (fHandler)
    _Block_release(fHandler);

  if (self->fLocationConnection)
  {
    v4 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  fQueue = self->fQueue;
  v6 = MEMORY[0x1E0C809B0];
  self->fQueue = 0;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = sub_18F2098D4;
  block[3] = &unk_1E2955938;
  block[4] = fQueue;
  dispatch_async(fQueue, block);
  v7.receiver = self;
  v7.super_class = (Class)CMMotionActivityManager;
  -[CMMotionActivityManager dealloc](&v7, sel_dealloc);
}

+ (BOOL)isActivityAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  if ((sub_18F1F7BFC() & 0x400000) != 0)
    return 1;
  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageMotionActivityAvailable", v4, v5);
}

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  __shared_weak_count *var1;
  CLConnectionMessage **var0;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *DictionaryOfClasses;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[5];
  _QWORD v33[5];

  var1 = a3.var1;
  if (*(_QWORD *)a3.var0)
  {
    var0 = (CLConnectionMessage **)a3.var0;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v16 = (char *)objc_msgSend_setWithObjects_(v8, v13, v9, v14, v15, v10, v11, v12, 0);
    if (*var0
      && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, (NSSet *)v16)) != 0)
    {
      v20 = DictionaryOfClasses;
      v21 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v16, (uint64_t)CFSTR("CMErrorMessage"), v17, v18);
      v25 = objc_msgSend_objectForKeyedSubscript_(v20, v22, (uint64_t)CFSTR("CMMotionActivityDataArray"), v23, v24);
      if (v21)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = sub_18F3518AC;
        v31[3] = &unk_1E2955B60;
        v31[4] = v21;
        v31[5] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v26, (uint64_t)v31, v27, v28);
      }
      else if (v25)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = sub_18F20930C;
        v30[3] = &unk_1E2955B60;
        v30[4] = v25;
        v30[5] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v26, (uint64_t)v30, v27, v28);
      }
      else
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = sub_18F35190C;
        v29[3] = &unk_1E2955B10;
        v29[4] = a4;
        objc_msgSend_addOperationWithBlock_(var1, v26, (uint64_t)v29, v27, v28);
      }
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = sub_18F351860;
      v32[3] = &unk_1E2955B10;
      v32[4] = a4;
      objc_msgSend_addOperationWithBlock_(var1, v16, (uint64_t)v32, v17, v18);
    }
  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_18F351814;
    v33[3] = &unk_1E2955B10;
    v33[4] = a4;
    objc_msgSend_addOperationWithBlock_(a3.var1, a2, (uint64_t)v33, (uint64_t)a3.var1, (uint64_t)a4);
  }
}

- (CMMotionActivityManager)init
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v6[2];
  char v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, CLConnectionMessage **);
  void *v11;
  id v12;
  id location;
  void *__p[2];
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMMotionActivityManager;
  v2 = -[CMMotionActivityManager init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMMotionActivityManager", v3);
    v4 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v4;
    if (v15 < 0)
      operator delete(__p[0]);
    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = sub_18F1E3FE0;
    v11 = &unk_1E29559F8;
    objc_copyWeak(&v12, &location);
    sub_18F270374(v6, "kCLConnectionMessageMotionActivityUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(v6[0]);
    sub_18F270374(v6, "MotionActivityLite/kCLConnectionMessageMotionActivityUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(v6[0]);
    sub_18F270374(v6, "kCLConnectionMessageMotionActivityPeriodicUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0)
      operator delete(v6[0]);
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return (CMMotionActivityManager *)v2;
}

+ (void)paginateDatesIntoDatesFrom:(id)a3 datesTo:(id)a4 start:(id)a5 end:(id)a6 intervalLength:(double)a7
{
  uint64_t v9;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v9 = (uint64_t)a5;
  objc_msgSend_timeIntervalSinceDate_(a6, a2, (uint64_t)a5, (uint64_t)a4, (uint64_t)a5);
  if (v15 <= a7)
  {
    v16 = v9;
  }
  else
  {
    do
    {
      v16 = objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x1E0C99D68], v12, v9, v13, v14, a7);
      objc_msgSend_addObject_(a3, v17, v9, v18, v19);
      objc_msgSend_addObject_(a4, v20, v16, v21, v22);
      objc_msgSend_timeIntervalSinceDate_(a6, v23, v16, v24, v25);
      v9 = v16;
    }
    while (v26 > a7);
  }
  objc_msgSend_addObject_(a3, v12, v16, v13, v14);
  objc_msgSend_addObject_(a4, v27, (uint64_t)a6, v28, v29);
}

- (void)stopActivityUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F2095CC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startActivityUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMMotionActivityHandler)handler
{
  uint64_t v4;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[7];

  if (!queue)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)handler, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (handler)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)queue, (uint64_t)handler, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_3;
  }
  if (!handler)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F209320;
  v13[3] = &unk_1E2955C70;
  v13[5] = queue;
  v13[6] = handler;
  v13[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v13, (uint64_t)handler, v4);
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (void)startPeriodicActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[7];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F351A54;
  v13[3] = &unk_1E2955C70;
  v13[5] = a3;
  v13[6] = a4;
  v13[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v13, (uint64_t)a4, v4);
}

- (void)stopPeriodicActivityUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F351CAC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

+ (BOOL)isActivityLiteAvailable
{
  return ((unint64_t)sub_18F1F7BFC() >> 23) & 1;
}

- (void)startActivityLiteUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  SEL v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[7];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v5 = (const char *)a4;
  v6 = a3;
  v7 = a2;
  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, a2, (uint64_t)a3, (uint64_t)a4, v4) & 1) == 0)
  {
    if (qword_1EE16D6E0 != -1)
      dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    v13 = qword_1EE16D6E8;
    v7 = "";
    self = (CMMotionActivityManager *)"assert";
    v5 = "[CMMotionActivityManager isActivityLiteAvailable]";
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    }
    v14 = qword_1EE16D6E8;
    if (os_signpost_enabled((os_log_t)qword_1EE16D6E8))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Activity Lite is unavailable on this platform", "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    }
    v6 = qword_1EE16D6E8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v20 = 334;
    v21 = "-[CMMotionActivityManager startActivityLiteUpdatesToQueue:withHandler:]";
    v19 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreMotion/Activity/CMMotionActivityManager.mm";
    abort_report_np();
LABEL_16:
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12, v19, v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)v7, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (v5)
      goto LABEL_4;
LABEL_17:
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)v7, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_4;
  }
  if (!v6)
    goto LABEL_16;
  if (!v5)
    goto LABEL_17;
LABEL_4:
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_18F3521EC;
  v22[3] = &unk_1E2955C70;
  v22[5] = v6;
  v22[6] = v5;
  v22[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v9, (uint64_t)v22, v11, v12);
}

- (void)stopActivityLiteUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isActivityLiteAvailable(CMMotionActivityManager, a2, v2, v3, v4) & 1) == 0)
  {
    if (qword_1EE16D6E0 != -1)
      dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    v9 = qword_1EE16D6E8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    }
    v10 = qword_1EE16D6E8;
    if (os_signpost_enabled((os_log_t)qword_1EE16D6E8))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Activity Lite is unavailable on this platform", "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D6E0 != -1)
        dispatch_once(&qword_1EE16D6E0, &unk_1E2952D88);
    }
    v11 = qword_1EE16D6E8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "[CMMotionActivityManager isActivityLiteAvailable]";
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Activity Lite is unavailable on this platform\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F352694;
  v12[3] = &unk_1E2955938;
  v12[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v6, (uint64_t)v12, v7, v8);
}

- (id)filterActivities:(id)a3 withAttribute:(int64_t)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = (id)objc_opt_new();
  v7 = (id)objc_opt_new();
  if (objc_msgSend_count(a3, v8, v9, v10, v11))
  {
    v15 = 0;
    do
    {
      v16 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v12, v15, v13, v14);
      v21 = (void *)objc_msgSend_copy(v16, v17, v18, v19, v20);
      objc_msgSend_evaluateNextActivity_attribute_result_(v6, v22, (uint64_t)v21, a4, (uint64_t)v7);

      ++v15;
    }
    while (v15 < objc_msgSend_count(a3, v23, v24, v25, v26));
  }
  return v7;
}

- (void)queryActivityWithAttribute:(int64_t)a3 fromDate:(id)a4 toDate:(id)a5 toQueue:(id)a6 withHandler:(id)a7
{
  void *v14;
  const char *v15;
  _QWORD v16[9];

  if (!a7)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMMotionActivityManager.mm"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F352A10;
  v16[3] = &unk_1E2955C98;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = self;
  v16[7] = a7;
  v16[8] = a3;
  objc_msgSend_queryActivityStartingFromDate_toDate_toQueue_withHandler_(self, a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v16);
}

@end
