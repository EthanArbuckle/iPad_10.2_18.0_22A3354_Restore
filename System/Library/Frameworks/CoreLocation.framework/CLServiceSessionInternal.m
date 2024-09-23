@implementation CLServiceSessionInternal

+ (id)passiveSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_, a3, 0);
}

+ (id)whenInUseSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_, a3, 1);
}

+ (id)alwaysSessionWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](CLServiceSessionInternal, sel_sessionWithLocationManager_type_queue_handler_, a3, 2);
}

+ (id)sessionWithLocationManager:(id)a3 type:(int)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v8;
  CLServiceSessionInternal *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;

  v8 = *(_QWORD *)&a4;
  v10 = [CLServiceSessionInternal alloc];
  v12 = (id)objc_msgSend_initWithLocationManager_serviceSessionType_queue_handler_(v10, v11, (uint64_t)a3, v8, a5, a6);
  objc_msgSend_addIdentifiableClient_(a3, v13, (uint64_t)v12, v14);
  return v12;
}

- (CLServiceSessionInternal)initWithLocationManager:(id)a3 serviceSessionType:(int)a4 queue:(id)p_cache handler:(id)a6
{
  const char *v8;
  CLServiceSessionInternal *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  const char *v18;
  uint64_t v19;
  __CFBundle *MainBundle;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  os_activity_scope_state_s state;
  objc_super v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  CLServiceSessionInternal *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  LODWORD(v8) = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)CLServiceSessionInternal;
  v11 = -[CLServiceSessionInternal init](&v33, sel_init);
  if (!v11)
    return v11;
  if (!p_cache)
  {
    p_cache = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    a2 = (SEL)&OBJC_METACLASS___CLAssertion.cache;
    v27 = qword_1ECD8E750;
    a3 = &off_18F771000;
    v8 = "assert";
    a6 = "queue";
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2082;
      v39 = "assert";
      v40 = 2081;
      v41 = "queue";
      _os_log_impl(&dword_18F5B3000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    }
    v28 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2082;
      v39 = "assert";
      v40 = 2081;
      v41 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queue cannot be nil while creating ExplicitServiceSession", "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    }
    v11 = (CLServiceSessionInternal *)qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v35 = 0;
      v36 = 2082;
      v37 = "";
      v38 = 2082;
      v39 = "assert";
      v40 = 2081;
      v41 = "queue";
      _os_log_impl(&dword_18F5B3000, &v11->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"queue cannot be nil while creating ExplicitServiceSession\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    v30 = 98;
    v31 = "-[CLServiceSessionInternal initWithLocationManager:serviceSessionType:queue:handler:]";
    v29 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Framework/CoreLocation/CLServiceSessionInternal.mm";
    abort_report_np();
    __break(1u);
    goto LABEL_28;
  }
  v12 = _os_activity_create(&dword_18F5B3000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1ECD8E758 != -1)
LABEL_28:
    dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2082;
    v39 = "activity";
    v40 = 2114;
    v41 = (const char *)v17;
    v42 = 2050;
    v43 = v11;
    v44 = 2050;
    v45 = a3;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"manager\":\"%{public}p\"}", buf, 0x3Au);
  }
  if ((objc_msgSend_isMasquerading(a3, v14, v15, v16, v29, v30, v31) & 1) == 0)
  {
    if (!sub_18F5F6244())
      NSLog(&CFSTR("Error(CLServiceSessionInternal): NSLocationWhenInUseUsageDescription and NSLocationAlwaysAndWhenInUseUsageD"
                   "escription are both missing from localized Info.plist").isa);
    if ((_DWORD)v8 == 2)
    {
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        if (!CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("NSLocationAlwaysAndWhenInUseUsageDescription")))
          NSLog(CFSTR("Error(Privileged-CLServiceSessionInternal): NSLocationAlwaysAndWhenInUseUsageDescription missing from Info.plist"));
      }
    }
  }
  objc_msgSend_setShouldBeRunning_(v11, v18, 1, v19);
  v21 = objc_alloc(MEMORY[0x1E0D44528]);
  v11->_silo = (CLDispatchSilo *)objc_msgSend_initWithUnderlyingQueue_(v21, v22, (uint64_t)p_cache, v23);
  objc_msgSend_setManager_(v11, v24, (uint64_t)a3, v25);
  v11->_sessionType = (int)v8;
  if (a6)
    v11->_clientCallback = _Block_copy(a6);
  os_activity_scope_leave(&state);
  return v11;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  CLDispatchSilo *silo;
  _QWORD v5[6];

  silo = self->_silo;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F678500;
  v5[3] = &unk_1E2991118;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend_async_(silo, a2, (uint64_t)v5, (uint64_t)a4);
}

- (void)cleanup
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)objc_msgSend_manager(self, a2, v2, v3);
  objc_msgSend_removeIdentifiableClient_(v5, v6, (uint64_t)self, v7);
  objc_msgSend_manageConnection(self, v8, v9, v10);
  objc_msgSend_setIdentityToken_(self, v11, 0, v12);
  objc_msgSend_setStorageToken_(self, v13, 0, v14);
  _Block_release(self->_clientCallback);
  self->_clientCallback = 0;
  objc_msgSend_setManager_(self, v15, 0, v16);

  self->_silo = 0;
}

- (void)invalidate
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  CLDispatchSilo *silo;
  const char *v10;
  uint64_t v11;
  _QWORD v12[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLServiceSessionInternal *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v8;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F678750;
  v12[3] = &unk_1E2990DE0;
  v12[4] = self;
  objc_msgSend_async_(silo, v10, (uint64_t)v12, v11);
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  CLDispatchSilo *silo;
  void *locationdConnection;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  CLServiceSessionInternal *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    v25 = 2114;
    v26 = v8;
    v27 = 2050;
    v28 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F678934;
  v17[3] = &unk_1E2991168;
  v17[4] = self;
  v17[5] = locationdConnection;
  objc_msgSend_async_(silo, v11, (uint64_t)v17, v12);
  self->_silo = 0;
  objc_msgSend_cleanup(self, v13, v14, v15);
  v16.receiver = self;
  v16.super_class = (Class)CLServiceSessionInternal;
  -[CLServiceSessionInternal dealloc](&v16, sel_dealloc);
  os_activity_scope_leave(&state);
}

- (void)manageConnection
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  CLServiceSessionInternal *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLServiceSession #serviceSession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    v23 = 2114;
    v24 = v9;
    v25 = 2050;
    v26 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLServiceSession #serviceSession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_assertInside(self->_silo, v6, v7, v8);
  if (objc_msgSend_identityToken(self, v10, v11, v12) && (objc_msgSend_shouldBeRunning(self, v13, v14, v15) & 1) != 0)
    objc_msgSend_createConnection(self, v13, v14, v15);
  else
    objc_msgSend_destroyConnection(self, v13, v14, v15);
  os_activity_scope_leave(&v16);
}

- (void)createConnection
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  _QWORD v53[6];
  id v54;
  id location;
  void *__p[2];
  char v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  CLServiceSessionInternal *v65;
  _QWORD v66[3];
  _QWORD v67[4];

  v67[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (!self->_locationdConnection)
  {
    v5 = (void *)operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    v9 = objc_msgSend_queue(self->_silo, v6, v7, v8);
    MEMORY[0x194002AB4](v5, __p, v9);
    self->_locationdConnection = v5;
    if (v57 < 0)
      operator delete(__p[0]);
    objc_initWeak(&location, self);
    v53[1] = MEMORY[0x1E0C809B0];
    v53[2] = 3221225472;
    v53[3] = sub_18F6791B8;
    v53[4] = &unk_1E29916F8;
    objc_copyWeak(&v54, &location);
    v53[5] = self;
    CLConnection::setDefaultMessageHandler();
    CLConnection::start((CLConnection *)self->_locationdConnection);
    v66[0] = CFSTR("kCLConnectionMessageClientKeyForIdentityValidation");
    v67[0] = objc_msgSend_identityToken(self, v10, v11, v12);
    v66[1] = CFSTR("SessionType");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend_sessionType(self, v14, v15, v16);
    v67[1] = objc_msgSend_numberWithUnsignedInt_(v13, v18, v17, v19);
    v66[2] = CFSTR("SDKAtLeast2024");
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = dyld_program_sdk_at_least();
    v67[2] = objc_msgSend_numberWithBool_(v20, v22, v21, v23);
    v53[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v67, (uint64_t)v66, 3);
    sub_18F679BE0("ServiceSession/kCLConnectionMessage", v53, &v51);
    v50 = v52;
    if (v52)
    {
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v26 = __ldxr(p_shared_owners);
      while (__stxr(v26 + 1, p_shared_owners));
    }
    CLConnection::sendMessage();
    if (v50)
    {
      v27 = (unint64_t *)&v50->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    v29 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_msgSend_identityToken(self, v30, v31, v32);
      v37 = objc_msgSend_UTF8String(v33, v34, v35, v36);
      *(_DWORD *)buf = 68289538;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2082;
      v63 = v37;
      v64 = 2050;
      v65 = self;
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#serviceSession connection created\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    }
    v38 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v42 = (void *)objc_msgSend_identityToken(self, v39, v40, v41);
      v46 = objc_msgSend_UTF8String(v42, v43, v44, v45);
      *(_DWORD *)buf = 68289538;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2082;
      v63 = v46;
      v64 = 2050;
      v65 = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession connection created", "{\"msg%{public}.0s\":\"#serviceSession connection created\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    v47 = v52;
    if (v52)
    {
      v48 = (unint64_t *)&v52->__shared_owners_;
      do
        v49 = __ldaxr(v48);
      while (__stlxr(v49 - 1, v48));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
}

- (void)destroyConnection
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  CLConnection *locationdConnection;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint8_t buf[8];
  _BYTE v56[10];
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  CLServiceSessionInternal *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (self->_locationdConnection)
  {
    if (objc_msgSend_identityToken(self, v5, v6, v7) && (objc_msgSend_shouldBeRunning(self, v8, v9, v10) & 1) == 0)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
      v11 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_msgSend_identityToken(self, v12, v13, v14);
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v56 = 2082;
        *(_QWORD *)&v56[2] = "";
        v57 = 2082;
        v58 = objc_msgSend_UTF8String(v15, v16, v17, v18);
        v59 = 2050;
        v60 = self;
        _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#serviceSession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
      }
      v19 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        v23 = (void *)objc_msgSend_identityToken(self, v20, v21, v22);
        v27 = objc_msgSend_UTF8String(v23, v24, v25, v26);
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v56 = 2082;
        *(_QWORD *)&v56[2] = "";
        v57 = 2082;
        v58 = v27;
        v59 = 2050;
        v60 = self;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#serviceSession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      sub_18F619E48("kCLConnectionMessageDestroyUponDisconnection", buf);
      v54 = *(std::__shared_weak_count **)v56;
      if (*(_QWORD *)v56)
      {
        v28 = (unint64_t *)(*(_QWORD *)v56 + 8);
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      CLConnection::sendMessage();
      if (v54)
      {
        p_shared_owners = (unint64_t *)&v54->__shared_owners_;
        do
          v31 = __ldaxr(p_shared_owners);
        while (__stlxr(v31 - 1, p_shared_owners));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
      }
      v32 = *(std::__shared_weak_count **)v56;
      if (*(_QWORD *)v56)
      {
        v33 = (unint64_t *)(*(_QWORD *)v56 + 8);
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
    }
    locationdConnection = (CLConnection *)self->_locationdConnection;
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    v36 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_msgSend_identityToken(self, v37, v38, v39);
      v44 = objc_msgSend_UTF8String(v40, v41, v42, v43);
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v56 = 2082;
      *(_QWORD *)&v56[2] = "";
      v57 = 2082;
      v58 = v44;
      v59 = 2050;
      v60 = self;
      _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#serviceSession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
    }
    v45 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v49 = (void *)objc_msgSend_identityToken(self, v46, v47, v48);
      v53 = objc_msgSend_UTF8String(v49, v50, v51, v52);
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v56 = 2082;
      *(_QWORD *)&v56[2] = "";
      v57 = 2082;
      v58 = v53;
      v59 = 2050;
      v60 = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession invalidated and destroyed connection", "{\"msg%{public}.0s\":\"#serviceSession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage *var0;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int v14;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  CLConnectionMessage *v24;
  std::__shared_weak_count *v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  CLServiceSessionInternal *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  var0 = a3.var0;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLBackgroundActivitySession #backgroundActivitySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990550);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    v9 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
    if (*(char *)(v9 + 23) >= 0)
      v10 = v9;
    else
      v10 = *(_QWORD *)v9;
    *(_DWORD *)buf = 68290050;
    v28 = 0;
    v29 = 2082;
    v30 = "";
    v31 = 2082;
    v32 = "activity";
    v33 = 2114;
    v34 = v8;
    v35 = 2050;
    v36 = self;
    v37 = 2082;
    v38 = v10;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLBackgroundActivitySession #backgroundActivitySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v11 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v14 = *(char *)(v11 + 23);
  if (v14 < 0)
  {
    if (*(_QWORD *)(v11 + 8) != 31)
      goto LABEL_23;
    v11 = *(_QWORD *)v11;
  }
  else if (v14 != 31)
  {
    goto LABEL_23;
  }
  if (*(_QWORD *)v11 == 0x656E6E6F434C436BLL
    && *(_QWORD *)(v11 + 8) == 0x73654D6E6F697463
    && *(_QWORD *)(v11 + 16) == 0x6761694465676173
    && *(_QWORD *)(v11 + 23) == 0x73636974736F6E67)
  {
    v18 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v24 = *(CLConnectionMessage **)var0;
    v25 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    objc_msgSend_handleMessageDiagnostics_(self, v12, (uint64_t)&v24, v13);
    v21 = v25;
    if (v25)
    {
      v22 = (unint64_t *)&v25->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
LABEL_23:
  os_activity_scope_leave(&state);
}

- (void)handleMessageDiagnostics:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage *var0;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLConnectionMessage *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSSet *v13;
  void *DictionaryOfClasses;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  var0 = a3.var0;
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3.var0, (uint64_t)a3.var1);
  if (objc_msgSend_shouldBeRunning(self, v5, v6, v7))
  {
    if (self->_clientCallback)
    {
      v8 = *(CLConnectionMessage **)var0;
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      v13 = (NSSet *)objc_msgSend_setWithObjects_(v9, v11, v10, v12, 0);
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v8, v13);
      v17 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v15, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v16);
      objc_msgSend_unsignedLongValue(v17, v18, v19, v20);
      (*((void (**)(void))self->_clientCallback + 2))();
    }
  }
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CLLocationManager)manager
{
  return self->manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (id)weakClient
{
  return objc_loadWeak(&self->weakClient);
}

- (void)setWeakClient:(id)a3
{
  objc_storeWeak(&self->weakClient, a3);
}

- (BOOL)shouldBeRunning
{
  return self->_shouldBeRunning;
}

- (void)setShouldBeRunning:(BOOL)a3
{
  self->_shouldBeRunning = a3;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);
}

@end
