@implementation CLFullAccuracySession

+ (id)fullAccuracySessionWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  CLFullAccuracySession *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;

  v10 = [CLFullAccuracySession alloc];
  v12 = (id)objc_msgSend_initWithLocationManager_purposeKey_queue_handler_(v10, v11, (uint64_t)a3, (uint64_t)a4, a5, a6);
  objc_msgSend_addIdentifiableClient_(a3, v13, (uint64_t)v12, v14);
  return v12;
}

- (CLFullAccuracySession)initWithLocationManager:(id)a3 purposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v12;
  NSObject *v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CLFullAccuracySession *v18;
  __CFBundle *MainBundle;
  const __CFDictionary *ValueForInfoDictionaryKey;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  objc_super v37;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  CLFullAccuracySession *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v40 = 0;
    v41 = 2082;
    v42 = "";
    v43 = 2082;
    v44 = "activity";
    v45 = 2114;
    v46 = v14;
    v47 = 2050;
    v48 = self;
    v49 = 2050;
    v50 = a3;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"manager\":\"%{public}p\"}", buf, 0x3Au);
  }
  v37.receiver = self;
  v37.super_class = (Class)CLFullAccuracySession;
  v18 = -[CLFullAccuracySession init](&v37, sel_init);
  if (v18)
  {
    if ((objc_msgSend_isMasquerading(a3, v15, v16, v17) & 1) == 0)
    {
      if (!sub_18F5F6244())
        NSLog(&CFSTR("Error(CLFullAccuracySession): NSLocationWhenInUseUsageDescription and NSLocationAlwaysAndWhenInUseUsageDe"
                     "scription are both missing from localized Info.plist").isa);
      MainBundle = CFBundleGetMainBundle();
      if (MainBundle)
      {
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("NSLocationTemporaryUsageDescriptionDictionary"));
        if (!ValueForInfoDictionaryKey || !CFDictionaryGetCount(ValueForInfoDictionaryKey))
          NSLog(CFSTR("Error: NSLocationTemporaryUsageDescriptionDictionary Info.plist key is either missing OR empty"));
      }
    }
    v21 = a5;
    if (!a5)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
      v22 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v40 = 0;
        v41 = 2082;
        v42 = "";
        v43 = 2050;
        v44 = (const char *)v18;
        _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession has nil callback queue; Creating locally\", \"self\":\"%{public}p\"}",
          buf,
          0x1Cu);
      }
      v21 = objc_msgSend_sharedQueue(CLLocationManager, v23, v24, v25);
    }
    v26 = objc_alloc(MEMORY[0x1E0D44528]);
    v18->_silo = (CLDispatchSilo *)objc_msgSend_initWithUnderlyingQueue_(v26, v27, (uint64_t)v21, v28);
    if (v21 != a5)
      dispatch_release(v21);
    objc_msgSend_setShouldBeRunning_(v18, v29, 1, v30);
    v18->_purposeKey = (NSString *)objc_msgSend_copy(a4, v31, v32, v33);
    objc_msgSend_setManager_(v18, v34, (uint64_t)a3, v35);
    if (a6)
      v18->_clientCallback = _Block_copy(a6);
  }
  os_activity_scope_leave(&state);
  return v18;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  CLDispatchSilo *silo;
  _QWORD v13[6];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  CLFullAccuracySession *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "activity";
    v21 = 2114;
    v22 = v11;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  silo = self->_silo;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F68AED0;
  v13[3] = &unk_1E2991118;
  v13[4] = self;
  v13[5] = a3;
  objc_msgSend_async_(silo, v9, (uint64_t)v13, v10);
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
  CLFullAccuracySession *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  _QWORD v49[6];
  id v50;
  id location;
  void *__p[2];
  char v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  CLFullAccuracySession *v61;
  _QWORD v62[3];
  _QWORD v63[4];

  v63[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (!self->_locationdConnection)
  {
    v5 = (void *)operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    v9 = objc_msgSend_queue(self->_silo, v6, v7, v8);
    MEMORY[0x194002AB4](v5, __p, v9);
    self->_locationdConnection = v5;
    if (v53 < 0)
      operator delete(__p[0]);
    objc_initWeak(&location, self);
    v49[1] = MEMORY[0x1E0C809B0];
    v49[2] = 3221225472;
    v49[3] = sub_18F68B504;
    v49[4] = &unk_1E29916F8;
    objc_copyWeak(&v50, &location);
    v49[5] = self;
    CLConnection::setDefaultMessageHandler();
    CLConnection::start((CLConnection *)self->_locationdConnection);
    v62[0] = CFSTR("kCLConnectionMessageClientKeyForIdentityValidation");
    v63[0] = objc_msgSend_identityToken(self, v10, v11, v12);
    v62[1] = CFSTR("kCLConnectionMessagePurposeKey");
    v63[1] = objc_msgSend_purposeKey(self, v13, v14, v15);
    v62[2] = CFSTR("SDKAtLeast2024");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = dyld_program_sdk_at_least();
    v63[2] = objc_msgSend_numberWithBool_(v16, v18, v17, v19);
    v49[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v63, (uint64_t)v62, 3);
    sub_18F68C700("FullAccuracySession/kCLConnectionMessage", v49, &v47);
    v46 = v48;
    if (v48)
    {
      p_shared_owners = (unint64_t *)&v48->__shared_owners_;
      do
        v22 = __ldxr(p_shared_owners);
      while (__stxr(v22 + 1, p_shared_owners));
    }
    CLConnection::sendMessage();
    if (v46)
    {
      v23 = (unint64_t *)&v46->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
    v25 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_msgSend_identityToken(self, v26, v27, v28);
      v33 = objc_msgSend_UTF8String(v29, v30, v31, v32);
      *(_DWORD *)buf = 68289538;
      v55 = 0;
      v56 = 2082;
      v57 = "";
      v58 = 2082;
      v59 = v33;
      v60 = 2050;
      v61 = self;
      _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession connection created\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
    }
    v34 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v38 = (void *)objc_msgSend_identityToken(self, v35, v36, v37);
      v42 = objc_msgSend_UTF8String(v38, v39, v40, v41);
      *(_DWORD *)buf = 68289538;
      v55 = 0;
      v56 = 2082;
      v57 = "";
      v58 = 2082;
      v59 = v42;
      v60 = 2050;
      v61 = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#fullAccuracySession connection created", "{\"msg%{public}.0s\":\"#fullAccuracySession connection created\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    v43 = v48;
    if (v48)
    {
      v44 = (unint64_t *)&v48->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
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
  CLFullAccuracySession *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  var0 = a3.var0;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
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
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CLConnectionMessage *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSSet *v15;
  void *DictionaryOfClasses;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
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
  CLFullAccuracySession *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  var0 = a3.var0;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3.var0, (uint64_t)a3.var1);
  if (objc_msgSend_shouldBeRunning(self, v6, v7, v8) && self->_clientCallback)
  {
    v9 = *(CLConnectionMessage **)var0;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v15 = (NSSet *)objc_msgSend_setWithObjects_(v10, v13, v11, v14, v12, 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v9, v15);
    v17 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v17, &state);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "activity";
      v33 = 2114;
      v34 = v21;
      v35 = 2050;
      v36 = self;
      v37 = 2113;
      v38 = DictionaryOfClasses;
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    v22 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v19, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v20);
    objc_msgSend_unsignedLongValue(v22, v23, v24, v25);
    (*((void (**)(void))self->_clientCallback + 2))();
    os_activity_scope_leave(&state);
  }
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
  CLFullAccuracySession *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (self->_locationdConnection)
  {
    if (objc_msgSend_identityToken(self, v5, v6, v7) && (objc_msgSend_shouldBeRunning(self, v8, v9, v10) & 1) == 0)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
        _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#fullAccuracySession destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#fullAccuracySession destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
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
      dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
      _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#fullAccuracySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#fullAccuracySession invalidated and destroyed connection", "{\"msg%{public}.0s\":\"#fullAccuracySession invalidated and destroyed connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
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
  CLFullAccuracySession *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  self->_locationdConnection = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F68C240;
  v17[3] = &unk_1E2991168;
  v17[4] = self;
  v17[5] = locationdConnection;
  objc_msgSend_async_(silo, v11, (uint64_t)v17, v12);
  self->_silo = 0;
  objc_msgSend_cleanup(self, v13, v14, v15);
  v16.receiver = self;
  v16.super_class = (Class)CLFullAccuracySession;
  -[CLFullAccuracySession dealloc](&v16, sel_dealloc);
  os_activity_scope_leave(&state);
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
  CLFullAccuracySession *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLFullAccuracySession #fullAccuracySession", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990650);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLFullAccuracySession #fullAccuracySession\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F68C664;
  v12[3] = &unk_1E2990DE0;
  v12[4] = self;
  objc_msgSend_async_(silo, v10, (uint64_t)v12, v11);
  os_activity_scope_leave(&state);
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
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

- (NSString)purposeKey
{
  return self->_purposeKey;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);
}

@end
