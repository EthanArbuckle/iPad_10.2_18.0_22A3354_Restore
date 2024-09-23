@implementation CLLocationManager

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  _QWORD *p_cache;
  void *v8;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v8 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
    goto LABEL_6;
  p_cache = &OBJC_METACLASS___CLAssertion.cache;
  if (qword_1ECD8E758 != -1)
    goto LABEL_20;
  while (1)
  {
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[235] != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      p_cache = buf;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
LABEL_6:
    if (a4 && a5)
      break;
    v8 = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    self = (CLLocationManager *)&OBJC_METACLASS___CLAssertion.cache;
    v16 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v17 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    a4 = (id)qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v11 = objc_alloc(MEMORY[0x1E0D44528]);
  v13 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v11, v12, (uint64_t)a5, 1);
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v14, 0, (uint64_t)v8, 0, a4, v13);
}

- (id)_initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v13 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v7 = objc_alloc(MEMORY[0x1E0D44528]);
  v9 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v7, v8, (uint64_t)a4, 1);
  return (id)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v10, 0, 0, 0, a3, v9);
}

- (void)setHeadingOrientation:(CLDeviceOrientation)headingOrientation
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
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
  CLLocationManager *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v6, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    v23 = 2114;
    v24 = v8;
    v25 = 2050;
    v26 = self;
    v27 = 2050;
    v28 = headingOrientation;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"orientation\":%{public, location:CLDeviceOrientation}lld}", buf, 0x3Au);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  if ((headingOrientation - 1) <= 3)
  {
    *((_DWORD *)internal + 56) = headingOrientation;
    if (objc_msgSend_updatingHeading(*((void **)internal + 4), v10, v11, v12))
      objc_msgSend_startUpdatingHeading(self, v13, v14, v15);
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v16);
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  _QWORD *p_cache;
  void *v8;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v8 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
    goto LABEL_6;
  p_cache = &OBJC_METACLASS___CLAssertion.cache;
  if (qword_1ECD8E758 != -1)
    goto LABEL_20;
  while (1)
  {
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[235] != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      p_cache = buf;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
LABEL_6:
    if (a4 && a5)
      break;
    v8 = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    self = (CLLocationManager *)&OBJC_METACLASS___CLAssertion.cache;
    v16 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v17 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    a4 = (id)qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v11 = objc_alloc(MEMORY[0x1E0D44528]);
  v13 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v11, v12, (uint64_t)a5, 1);
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v14, (uint64_t)v8, 0, 0, a4, v13);
}

- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  CLLocationManager *v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v6, &v18);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    v25 = 2114;
    v26 = v8;
    v27 = 2050;
    v28 = self;
    v29 = 1026;
    v30 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setAllowsAlteredAccessoryLocations_(internal[4], v10, v3, v11);
  if (objc_msgSend_updatingLocation(internal[4], v12, v13, v14))
    objc_msgSend_startUpdatingLocation(self, v15, v16, v17);
  objc_sync_exit(self);
  os_activity_scope_leave(&v18);
}

- (void)setActivityType:(CLActivityType)activityType
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
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
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  os_activity_scope_state_s state;
  int v87;
  uint64_t v88;
  __int16 v89;
  CLActivityType v90;
  uint8_t buf[4];
  _BYTE v92[24];
  __int16 v93;
  NSString *v94;
  __int16 v95;
  CLLocationManager *v96;
  __int16 v97;
  CLActivityType v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)v92 = 0;
    *(_WORD *)&v92[4] = 2082;
    *(_QWORD *)&v92[6] = "";
    *(_WORD *)&v92[14] = 2082;
    *(_QWORD *)&v92[16] = "activity";
    v93 = 2114;
    v94 = v8;
    v95 = 2050;
    v96 = self;
    v97 = 2050;
    v98 = activityType;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"activityType\":%{public, location:CLActivityType}lld}", buf, 0x3Au);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v11, v12, v13);
    v18 = (void *)objc_msgSend_bundleIdentifier(v14, v15, v16, v17);
    v22 = objc_msgSend_UTF8String(v18, v19, v20, v21);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v92 = v22;
    *(_WORD *)&v92[8] = 2048;
    *(_QWORD *)&v92[10] = activityType;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEBUG, "Client,%s,setActivityType,%ld", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v76 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v73, v74, v75);
    v80 = (void *)objc_msgSend_bundleIdentifier(v76, v77, v78, v79);
    v84 = objc_msgSend_UTF8String(v80, v81, v82, v83);
    v87 = 136315394;
    v88 = v84;
    v89 = 2048;
    v90 = activityType;
    v85 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager setActivityType:]", "CoreLocation: %s\n", v85);
    if (v85 != (char *)buf)
      free(v85);
  }
  objc_msgSend_setActivityType_(*((void **)internal + 4), v23, activityType, v24);
  switch(activityType)
  {
    case CLActivityTypeFitness:
      objc_msgSend_setAllowsMapCorrection_(*((void **)internal + 4), v25, 1, v27);
      CLClientSetAllowsMapCorrection(*((_QWORD *)internal + 1), 1);
      LODWORD(activityType) = 3;
      break;
    case CLActivityTypeAirborne:
      objc_msgSend_setAllowsMapCorrection_(*((void **)internal + 4), v25, 0, v27);
      LODWORD(activityType) = 5;
      break;
    case CLActivityTypeOtherNavigation:
      v28 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v25, v26, v27);
      v32 = (void *)objc_msgSend_bundleIdentifier(v28, v29, v30, v31);
      if ((objc_msgSend_containsString_(v32, v33, (uint64_t)CFSTR("com.apple.Maps"), v34) & 1) != 0
        || (v38 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v35, v36, v37),
            v42 = (void *)objc_msgSend_bundleIdentifier(v38, v39, v40, v41),
            (objc_msgSend_isEqualToString_(v42, v43, (uint64_t)CFSTR("com.apple.NanoMaps"), v44) & 1) != 0))
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v47 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
        {
          v51 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v48, v49, v50);
          v55 = (void *)objc_msgSend_bundleIdentifier(v51, v52, v53, v54);
          v59 = objc_msgSend_UTF8String(v55, v56, v57, v58);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v92 = v59;
          _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_DEBUG, "Client,%s,setActivityType,allowing map correction", buf, 0xCu);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v63 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v60, v61, v62);
          v67 = (void *)objc_msgSend_bundleIdentifier(v63, v64, v65, v66);
          v71 = objc_msgSend_UTF8String(v67, v68, v69, v70);
          v87 = 136315138;
          v88 = v71;
          v72 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager setActivityType:]", "CoreLocation: %s\n", v72);
          if (v72 != (char *)buf)
            free(v72);
        }
      }
      else
      {
        objc_msgSend_setAllowsMapCorrection_(*((void **)internal + 4), v45, 0, v46);
      }
      LODWORD(activityType) = 2;
      break;
  }
  sub_18F5B5290(*((_QWORD *)internal + 1), activityType);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  id internal;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  CLLocationManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    v28 = 2114;
    v29 = v9;
    v30 = 2050;
    v31 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  v11 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self, v13);
  objc_msgSend_cancelLocationRequest(internal, v14, v15, v16);
  objc_msgSend_invalidate(internal, v17, v18, v19);

  v20.receiver = self;
  v20.super_class = (Class)CLLocationManager;
  -[CLLocationManager dealloc](&v20, sel_dealloc);
  os_activity_scope_leave(&state);
}

- (void)requestWhenInUseAuthorization
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  _QWORD **internal;
  NSObject *v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  CLLocationManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v4, &v11);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = v8;
    v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x400000, v7);
  internal = (_QWORD **)self->_internal;
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v10 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting when in use authorization\"}", buf, 0x12u);
  }
  CLClientRequestAuthorization(internal[1], 4);
  os_activity_scope_leave(&v11);
}

- (void)onWillEnterForeground:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v8;
    v18 = 2050;
    v19 = self;
    v20 = 2113;
    v21 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  os_activity_scope_leave(&v9);
}

+ (BOOL)headingAvailable
{
  uint64_t v2;
  char v3;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v2);
  v3 = sub_18F5C81CC();
  if ((v3 & 1) != 0)
    sub_18F5CC0B8();
  return v3 & 1;
}

- (void)startMonitoringSignificantLocationChanges
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  uint64_t *internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 256, v7);
  internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v10, v11, v12);
  sub_18F5BA160(internal[1], 0, 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&v13);
}

- (BOOL)_limitsPrecision
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_limitsPrecision(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (CLLocationAccuracy)desiredAccuracy
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  double v10;
  double v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v9;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_desiredAccuracy(*((void **)self->_internal + 4), v6, v7, v8);
  v11 = v10;
  os_activity_scope_leave(&v13);
  return v11;
}

- (void)setDistanceFilter:(CLLocationDistance)distanceFilter
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  __int16 v30;
  CLLocationDistance v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v6, &v19);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v8;
    v28 = 2050;
    v29 = self;
    v30 = 2050;
    v31 = distanceFilter;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"distance\":\"%{public}f\"}", buf, 0x3Au);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setDistanceFilter_(internal[4], v10, v11, v12, distanceFilter);
  if (objc_msgSend_updatingLocation(internal[4], v13, v14, v15))
    objc_msgSend_startUpdatingLocation(self, v16, v17, v18);
  objc_sync_exit(self);
  os_activity_scope_leave(&v19);
}

- (void)setDelegate:(id)delegate
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  CLLocationManager *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = v10;
    v20 = 2050;
    v21 = self;
    v22 = 2050;
    v23 = delegate;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", buf, 0x3Au);
  }
  objc_msgSend_setDelegate_(self->_internal, v8, (uint64_t)delegate, v9);
  os_activity_scope_leave(&v11);
}

- (void)onDidBecomeActive:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v22[32];
  CLLocationManager *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v22 = 2082;
    *(_QWORD *)&v22[2] = "";
    *(_WORD *)&v22[10] = 2082;
    *(_QWORD *)&v22[12] = "activity";
    *(_WORD *)&v22[20] = 2114;
    *(_QWORD *)&v22[22] = v11;
    *(_WORD *)&v22[30] = 2050;
    v23 = self;
    v24 = 2113;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  v12 = (void *)objc_msgSend_name(a3, v8, v9, v10);
  if (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("UIApplicationDidBecomeActiveNotification"), v14))
  {
    v17 = *((_QWORD *)self->_internal + 1);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_18F5CCFAC;
    v19[3] = &unk_1E2990DE0;
    v19[4] = self;
    if (v17)
    {
      v18 = *(void **)(v17 + 232);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)v22 = 3221225472;
      *(_QWORD *)&v22[8] = sub_18F5CCF7C;
      *(_QWORD *)&v22[16] = &unk_1E2990E30;
      *(_QWORD *)&v22[24] = v19;
      objc_msgSend_async_(v18, v15, (uint64_t)buf, v16);
    }
  }
  os_activity_scope_leave(&state);
}

- (NSSet)monitoredRegions
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  _QWORD *internal;
  _QWORD *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSSet *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSSet *v19;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  CLLocationManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v4, &v21);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    v28 = 2114;
    v29 = v8;
    v30 = 2050;
    v31 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x10000, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  v10 = (_QWORD *)internal[1];
  objc_sync_exit(self);
  v11 = sub_18F5BD6F8(v10);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E20]);
    v15 = (NSSet *)objc_msgSend_initWithArray_(v12, v13, (uint64_t)v11, v14);

    if (!v15)
      goto LABEL_10;
    goto LABEL_9;
  }
  v16 = objc_alloc(MEMORY[0x1E0C99E20]);
  v15 = (NSSet *)objc_msgSend_initWithCapacity_(v16, v17, 0, v18);
  if (v15)
LABEL_9:
    v19 = v15;
LABEL_10:
  os_activity_scope_leave(&v21);
  return v15;
}

- (void)setDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  __int16 v30;
  CLLocationAccuracy v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v6, &v19);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v8;
    v28 = 2050;
    v29 = self;
    v30 = 2050;
    v31 = desiredAccuracy;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"accuracy\":\"%{public}f\"}", buf, 0x3Au);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setDesiredAccuracy_(internal[4], v10, v11, v12, desiredAccuracy);
  if (objc_msgSend_updatingLocation(internal[4], v13, v14, v15))
    objc_msgSend_startUpdatingLocation(self, v16, v17, v18);
  objc_sync_exit(self);
  os_activity_scope_leave(&v19);
}

- (void)startUpdatingHeading
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  os_activity_scope_state_s state;
  int v31;
  uint64_t v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  const char *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  CLLocationManager *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)v34 = 0;
    *(_WORD *)&v34[4] = 2082;
    *(_QWORD *)&v34[6] = "";
    v35 = 2082;
    v36 = "activity";
    v37 = 2114;
    v38 = v8;
    v39 = 2050;
    v40 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 64, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v10, v11, v12);
  objc_msgSend_setUpdatingHeading_(*((void **)internal + 4), v13, 1, v14);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v15 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_headingFilter(*((void **)internal + 4), v16, v17, v18);
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)v34 = v19;
    _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "Start updating heading. HeadingFilter, %{public}.2f", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    objc_msgSend_headingFilter(*((void **)internal + 4), v25, v26, v27);
    v31 = 134349056;
    v32 = v28;
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager startUpdatingHeading]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf)
      free(v29);
  }
  v23 = *((_QWORD *)internal + 1);
  objc_msgSend_headingFilter(*((void **)internal + 4), v20, v21, v22);
  CLClientStartHeadingUpdates(v23, *((_DWORD *)internal + 56), v24);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)resumeLocationUpdates
{
  void **internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  internal = (void **)self->_internal;
  objc_sync_enter(self);
  if (objc_msgSend_paused(internal[4], v4, v5, v6))
    objc_msgSend_startUpdatingLocation(self, v7, v8, v9);
  objc_sync_exit(self);
}

- (void)startUpdatingLocation
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  char *internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  char *v51;
  _QWORD v52[7];
  __int16 v53;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v56[32];
  CLLocationManager *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v56 = 2082;
    *(_QWORD *)&v56[2] = "";
    *(_WORD *)&v56[10] = 2082;
    *(_QWORD *)&v56[12] = "activity";
    *(_WORD *)&v56[20] = 2114;
    *(_QWORD *)&v56[22] = v8;
    *(_WORD *)&v56[30] = 2050;
    v57 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 4, v7);
  internal = (char *)self->_internal;
  v13 = objc_msgSend_delegate(internal, v10, v11, v12);
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v14, v15, v16);
  if (objc_msgSend_requestingLocation(*((void **)internal + 4), v17, v18, v19))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v23 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "Canceling requestLocation", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v53 = 0;
      v51 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager startUpdatingLocation]", "CoreLocation: %s\n", v51);
      if (v51 != (char *)buf)
        free(v51);
    }
    objc_msgSend_cancelLocationRequest(internal, v24, v25, v26);
  }
  if ((objc_msgSend_updatingLocation(*((void **)internal + 4), v20, v21, v22) & 1) == 0)
  {
    objc_msgSend_setUpdatingLocation_(*((void **)internal + 4), v27, 1, v29);
    *(_QWORD *)(internal + 60) = 0xBFF0000000000000;
  }
  if (objc_msgSend_paused(*((void **)internal + 4), v27, v28, v29))
  {
    objc_msgSend_setPaused_(*((void **)internal + 4), v30, 0, v32);
    v33 = *((_QWORD *)internal + 1);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_18F5DDF60;
    v52[3] = &unk_1E29911F8;
    v52[4] = self;
    v52[5] = v13;
    v52[6] = internal;
    if (v33)
    {
      v34 = *(void **)(v33 + 232);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)v56 = 3221225472;
      *(_QWORD *)&v56[8] = sub_18F5CCF7C;
      *(_QWORD *)&v56[16] = &unk_1E2990E30;
      *(_QWORD *)&v56[24] = v52;
      objc_msgSend_async_(v34, v30, (uint64_t)buf, v32);
    }
  }
  v35 = *((_QWORD *)internal + 1);
  objc_msgSend_distanceFilter(*((void **)internal + 4), v30, v31, v32);
  v37 = v36;
  objc_msgSend_desiredAccuracy(*((void **)internal + 4), v38, v39, v40);
  v42 = v41;
  v46 = objc_msgSend_dynamicAccuracyReductionEnabled(*((void **)internal + 4), v43, v44, v45);
  v50 = objc_msgSend_allowsAlteredAccessoryLocations(*((void **)internal + 4), v47, v48, v49);
  CLClientStartLocationUpdatesWithDynamicAccuracyReductionAndAlteredAccessoryLocations_0(v35, (int)v42, v46, v50, v37);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)onClientEvent:(int)a3 supportInfo:(id)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  if (self->_internal)
  {
    switch(a3)
    {
      case 0:
        v17 = copyLocationsFromLocationMessagePayload(a4, a2, *(uint64_t *)&a3, (uint64_t)a4);
        v8 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v6, (uint64_t)CFSTR("ForceMapMatching"), v7);
        v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
        v15 = objc_msgSend_objectForKeyedSubscript_(a4, v13, (uint64_t)CFSTR("kCLClientEventKey"), v14);
        objc_msgSend_onClientEventLocation_forceMapMatching_type_(self, v16, (uint64_t)v17, v12, v15);

        break;
      case 1:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegistration_, a4, a4);
        break;
      case 3:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventLocationUnavailable_, a4, a4);
        break;
      case 12:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventHeading_, a4, a4);
        break;
      case 13:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventHeadingCalibration_, a4, a4);
        break;
      case 20:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegion_, a4, a4);
        break;
      case 21:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegionState_, a4, a4);
        break;
      case 22:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegionError_, a4, a4);
        break;
      case 23:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRanging_, a4, a4);
        break;
      case 24:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRangingError_, a4, a4);
        break;
      case 25:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventError_, a4, a4);
        break;
      case 27:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventAuthStatus_, a4, a4);
        break;
      case 28:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegionResponseDelayed_, a4, a4);
        break;
      case 29:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventRegionSetupCompleted_, a4, a4);
        break;
      case 30:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventAutopauseStatus_, a4, a4);
        break;
      case 31:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventBatch_, a4, a4);
        break;
      case 32:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventInterrupted_, a4, a4);
        break;
      case 33:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventVehicleSpeed_, a4, a4);
        break;
      case 34:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventVehicleHeading_, a4, a4);
        break;
      case 35:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventSignificantLocationVisit_, a4, a4);
        break;
      case 36:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventSignificantLocationVisitStateRequest_, a4, a4);
        break;
      case 40:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventPlaceInferenceResult_, a4, a4);
        break;
      case 41:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventPlaceInferenceError_, a4, a4);
        break;
      case 42:
        MEMORY[0x1E0DE7D20](self, sel_onClientEventNoLocationWatchdog_, a4, a4);
        break;
      default:
        return;
    }
  }
}

- (void)onClientEventLocation:(id)a3 forceMapMatching:(BOOL)a4 type:(id)a5
{
  char *internal;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *Object;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  int v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  BOOL v40;
  double v41;
  double v42;
  NSObject *v43;
  CLLocationManager *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  NSString *v55;
  NSObject *v56;
  const char *v57;
  void *v58;
  CLLocation *v59;
  const char *v60;
  uint64_t v61;
  NSString *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  NSObject *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  int v79;
  _OWORD v80[2];
  __int128 v81;
  __int128 v82;
  _OWORD v83[2];
  __int128 v84;
  __int128 v85;
  _OWORD v86[2];
  _BYTE buf[20];
  _BYTE v88[56];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  v10 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, a4);
  if (!objc_msgSend_count(a3, v11, v12, v13))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v24 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_FAULT, "Location event received with empty payload", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      LOWORD(v80[0]) = 0;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventLocation:forceMapMatching:type:]", "CoreLocation: %s\n", v25);
      goto LABEL_80;
    }
    return;
  }
  if ((objc_msgSend_allowsMapCorrection(*((void **)internal + 4), v14, v15, v16) & 1) == 0 && !a4)
    objc_msgSend_makeObjectsPerformSelector_(a3, v17, (uint64_t)sel_unmatch, v19);
  v85 = 0u;
  memset(v86, 0, 28);
  v84 = 0u;
  v82 = 0u;
  memset(v83, 0, sizeof(v83));
  v81 = 0u;
  memset(v80, 0, sizeof(v80));
  Object = (void *)objc_msgSend_lastObject(a3, v17, v18, v19);
  if (Object)
  {
    objc_msgSend_clientLocation(Object, v21, v22, v23);
  }
  else
  {
    v85 = 0u;
    memset(v86, 0, 28);
    v84 = 0u;
    v82 = 0u;
    memset(v83, 0, sizeof(v83));
    v81 = 0u;
    memset(v80, 0, sizeof(v80));
  }
  if (objc_msgSend_count(a3, v21, v22, v23) != 1)
    goto LABEL_40;
  if (*(double *)(internal + 60) < 0.0 || !sub_18F5C4758((uint64_t)(internal + 40), (uint64_t)v80, 0))
  {
    if (*(double *)(internal + 116) > *(double *)((char *)v83 + 12))
    {
      if (a5)
      {
        v29 = (void *)*((_QWORD *)internal + 25);
        if (v29)
        {
          if ((objc_msgSend_isEqualToString_(v29, v26, (uint64_t)a5, v27) & 1) == 0)
          {
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            v69 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v69, OS_LOG_TYPE_DEFAULT, "New location predates old location, and the event types differ; discarding",
                buf,
                2u);
            }
            if (!sub_18F5C4AE0(115, 2))
              return;
            bzero(buf, 0x65CuLL);
            if (qword_1ECD8E758 == -1)
            {
LABEL_79:
              v25 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventLocation:forceMapMatching:type:]", "CoreLocation: %s\n", v25);
LABEL_80:
              if (v25 != buf)
                free(v25);
              return;
            }
LABEL_82:
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            goto LABEL_79;
          }
        }
      }
    }
    if (*(double *)((char *)&v80[1] + 4) < 0.0)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v30 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_DEFAULT, "Invalid location passed to client", buf, 2u);
      }
      if (!sub_18F5C4AE0(115, 2))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 == -1)
        goto LABEL_79;
      goto LABEL_82;
    }
LABEL_40:
    v31 = (void *)*((_QWORD *)internal + 25);
    if (v31)

    v32 = a5;
    v33 = *((_DWORD *)internal + 14);
    v34 = *(double *)(internal + 60);
    v74 = *(_OWORD *)(internal + 132);
    v75 = *(_OWORD *)(internal + 148);
    v76 = *(_OWORD *)(internal + 164);
    v77 = *(_OWORD *)(internal + 180);
    v78 = *(_OWORD *)(internal + 40);
    v70 = *(_OWORD *)(internal + 68);
    v71 = *(_OWORD *)(internal + 84);
    v72 = *(_OWORD *)(internal + 100);
    v73 = *(_OWORD *)(internal + 116);
    v35 = v80[1];
    *(_OWORD *)(internal + 40) = v80[0];
    v36 = v83[0];
    *(_OWORD *)(internal + 120) = v83[1];
    *(_OWORD *)(internal + 104) = v36;
    v37 = v81;
    *(_OWORD *)(internal + 88) = v82;
    *(_OWORD *)(internal + 72) = v37;
    *(_OWORD *)(internal + 180) = *(_OWORD *)((char *)v86 + 12);
    *(_OWORD *)(internal + 168) = v86[0];
    v38 = v84;
    *(_OWORD *)(internal + 152) = v85;
    *(_OWORD *)(internal + 136) = v38;
    v39 = *(double *)((char *)v80 + 4);
    v40 = *(double *)((char *)v80 + 4) != 0.0;
    v41 = *(double *)((char *)v80 + 12);
    v42 = *(double *)((char *)&v80[1] + 4);
    if (*(double *)((char *)v80 + 12) == 0.0)
      v40 = 0;
    *((_QWORD *)internal + 25) = v32;
    v79 = v33;
    *(_OWORD *)(internal + 56) = v35;
    if (v42 >= 0.0 && !v40)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v43 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 1026;
        *(_DWORD *)v88 = v39 != 0.0;
        *(_WORD *)&v88[4] = 1026;
        *(_DWORD *)&v88[6] = v41 != 0.0;
        *(_WORD *)&v88[10] = 1040;
        *(_DWORD *)&v88[12] = 156;
        *(_WORD *)&v88[16] = 2097;
        *(_QWORD *)&v88[18] = v80;
        _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NullIsland onClientEventLocation:forceMapMatching: got a latitude or longitude that was exactly zero\", \"latIsNonzero\":%{public}hhd, \"lonIsNonzero\":%{public}hhd, \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x2Eu);
      }
    }
    v44 = self;
    objc_sync_enter(self);
    if (objc_msgSend_requestingLocation(*((void **)internal + 4), v45, v46, v47))
    {
      objc_msgSend_desiredAccuracy(*((void **)internal + 4), v48, v49, v50);
      if ((*(double *)((char *)&v80[1] + 4) > fmax(v54, 10.0)
         || CFAbsoluteTimeGetCurrent() - *(double *)((char *)v83 + 12) >= 60.0)
        && (objc_msgSend_limitsPrecision(*((void **)internal + 4), v51, v52, v53) & 1) == 0)
      {
LABEL_71:
        objc_sync_exit(self);
        return;
      }
      objc_msgSend_cancelLocationRequest(internal, v51, v52, v53);
      CLClientStopLocationUpdates_0(*((_QWORD *)internal + 1));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      entr_act_modify();
      v55 = NSStringFromSelector(sel_locationManager_didUpdateLocations_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v56 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290563;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)v88 = self;
        *(_WORD *)&v88[8] = 2050;
        *(_QWORD *)&v88[10] = v10;
        *(_WORD *)&v88[18] = 2114;
        *(_QWORD *)&v88[20] = v55;
        *(_WORD *)&v88[28] = 1040;
        *(_DWORD *)&v88[30] = 156;
        *(_WORD *)&v88[34] = 2097;
        *(_QWORD *)&v88[36] = v80;
        *(_WORD *)&v88[44] = 2114;
        *(_QWORD *)&v88[46] = a5;
        _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"location\":%{private, location:CLClientLocation}.*P, \"eventType\":%{public, location:escape_only}@}", buf, 0x4Au);
      }
      objc_msgSend_locationManager_didUpdateLocations_(v10, v57, (uint64_t)self, (uint64_t)a3);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v34 >= 0.0)
      {
        v59 = [CLLocation alloc];
        *(_OWORD *)buf = v78;
        *(_DWORD *)&buf[16] = v79;
        *(double *)v88 = v34;
        v90 = v74;
        v91 = v75;
        v92 = v76;
        v93 = v77;
        *(_OWORD *)&v88[8] = v70;
        *(_OWORD *)&v88[24] = v71;
        *(_OWORD *)&v88[40] = v72;
        v89 = v73;
        v58 = (void *)objc_msgSend_initWithClientLocation_(v59, v60, (uint64_t)buf, v61);
      }
      else
      {
        v58 = 0;
      }
      entr_act_modify();
      v62 = NSStringFromSelector(sel_locationManager_didUpdateToLocation_fromLocation_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v63 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)v88 = self;
        *(_WORD *)&v88[8] = 2050;
        *(_QWORD *)&v88[10] = v10;
        *(_WORD *)&v88[18] = 2114;
        *(_QWORD *)&v88[20] = v62;
        _os_log_impl(&dword_18F5B3000, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
      }
      v67 = objc_msgSend_lastObject(a3, v64, v65, v66);
      objc_msgSend_locationManager_didUpdateToLocation_fromLocation_(v10, v68, (uint64_t)self, v67, v58);

    }
    else
    {
      entr_act_modify();
    }
    goto LABEL_71;
  }
  if (!*((_DWORD *)internal + 43))
    *((_DWORD *)internal + 43) = DWORD1(v86[0]);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v28 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_DEBUG, "New location is identical to old location; discarding",
      buf,
      2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 == -1)
      goto LABEL_79;
    goto LABEL_82;
  }
}

- (void)onClientEventAuthStatus:(id)a3
{
  uint64_t v3;
  char *internal;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int isAuthorizedForWidgetUpdates;
  int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  CLLocationManager *v27;
  NSString *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  NSString *v34;
  NSObject *v35;
  const char *v36;
  NSString *v37;
  NSObject *v38;
  const char *v39;
  __int16 v40;
  unsigned int v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  CLLocationManager *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  NSString *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  internal = (char *)self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v41 = 0;
  v40 = 0;
  if (CLClientGetAuthorizationStatusAndCorrectiveCompensation((CFDictionaryRef)a3, &v41, &v40, (_BYTE *)&v40 + 1))
  {
    v8 = v41;
    if (v41 != 3)
      *(_QWORD *)(internal + 60) = 0xBFF0000000000000;
    objc_sync_enter(self);
    if (objc_msgSend_previousAuthorizationStatusValid(*((void **)internal + 4), v9, v10, v11)
      && objc_msgSend_previousAuthorizationStatus(*((void **)internal + 4), v12, v13, v14) == (_DWORD)v8
      && (v16 = objc_msgSend_limitsPrecision(*((void **)internal + 4), v12, v15, v14), v40 == v16)
      && (isAuthorizedForWidgetUpdates = objc_msgSend_isAuthorizedForWidgetUpdates(*((void **)internal + 4), v12, v17, v14), HIBYTE(v40) == isAuthorizedForWidgetUpdates))
    {
      objc_sync_exit(self);
    }
    else
    {
      v19 = v40;
      objc_msgSend_setLimitsPrecision_(*((void **)internal + 4), v12, (_BYTE)v40 != 0, v14);
      objc_msgSend_setPreviousAuthorizationStatus_(*((void **)internal + 4), v20, v8, v21);
      objc_msgSend_setPreviousAuthorizationStatusValid_(*((void **)internal + 4), v22, 1, v23);
      v24 = HIBYTE(v40);
      objc_msgSend_setIsAuthorizedForWidgetUpdates_(*((void **)internal + 4), v25, HIBYTE(v40) != 0, v26);
      objc_sync_exit(self);
      v27 = self;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v28 = NSStringFromSelector(sel_locationManagerDidChangeAuthorization_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v29 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68290562;
          v43 = 0;
          v44 = 2082;
          v45 = "";
          v46 = 2050;
          v47 = self;
          v48 = 2050;
          v49 = v7;
          v50 = 2114;
          v51 = v28;
          v52 = 2050;
          v53 = v8;
          v54 = 1026;
          v55 = v19 != 0;
          v56 = 1026;
          v57 = v24 != 0;
          _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"authorizationStatus\":%{public, location:CLClientAuthorizationStatus}lld, \"limitsPrecision\":%{public}hhd, \"isAuthorizedForWidgetUpdates\":%{public}hhd}", buf, 0x46u);
        }
        objc_msgSend_locationManagerDidChangeAuthorization_(v7, v30, (uint64_t)self, v31);
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v34 = NSStringFromSelector(sel_locationManager_didReceiveApproval_);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v35 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290050;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2050;
            v47 = self;
            v48 = 2050;
            v49 = v7;
            v50 = 2114;
            v51 = v34;
            v52 = 1026;
            LODWORD(v53) = v8 == 3;
            _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"approved\":%{public}hhd}", buf, 0x36u);
          }
          objc_msgSend_locationManager_didReceiveApproval_(v7, v36, (uint64_t)self, (_DWORD)v8 == 3);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v37 = NSStringFromSelector(sel_locationManager_didChangeAuthorizationStatus_);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v38 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290562;
            v43 = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2050;
            v47 = self;
            v48 = 2050;
            v49 = v7;
            v50 = 2114;
            v51 = v37;
            v52 = 2050;
            v53 = v8;
            v54 = 1026;
            v55 = v19 != 0;
            v56 = 1026;
            v57 = v24 != 0;
            _os_log_impl(&dword_18F5B3000, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"authorizationStatus\":%{public, location:CLClientAuthorizationStatus}lld, \"limitsPrecision\":%{public}hhd, \"isAuthorizedForWidgetUpdates\":%{public}hhd}", buf, 0x46u);
          }
          objc_msgSend_locationManager_didChangeAuthorizationStatus_(v7, v39, (uint64_t)self, v8);
        }
      }
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v32 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_FAULT, "could not get updated authorization status", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventAuthStatus:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf)
        free(v33);
    }
  }
}

- (CLAuthorizationStatus)authorizationStatus
{
  void **internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CLAuthorizationStatus v10;
  int v11;
  CLAuthorizationStatus v12;
  CLAuthorizationStatus v14;

  objc_sync_enter(self);
  internal = (void **)self->_internal;
  if (objc_msgSend_previousAuthorizationStatusValid(internal[4], v4, v5, v6))
  {
    v10 = objc_msgSend_previousAuthorizationStatus(internal[4], v7, v8, v9);
  }
  else
  {
    objc_msgSend_collectMetricForFunction_(self, v7, 0x80000, v9);
    v14 = kCLAuthorizationStatusNotDetermined;
    v11 = sub_18F5CCD00(*((_QWORD *)internal[1] + 45), *((_QWORD *)internal[1] + 46), (uint64_t)&v14);
    v12 = v14;
    if ((v14 - 1) >= 4)
      v12 = kCLAuthorizationStatusNotDetermined;
    if (v11)
      v10 = v12;
    else
      v10 = kCLAuthorizationStatusNotDetermined;
  }
  objc_sync_exit(self);
  return v10;
}

- (void)onClientEventHeading:(id)a3
{
  uint64_t v3;
  uint64_t *internal;
  void *v6;
  CLHeading *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE buf[48];
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  internal = (uint64_t *)self->_internal;
  v6 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  if (CLClientGetHeading(internal[1], (uint64_t)&v16))
  {
    objc_sync_enter(self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = [CLHeading alloc];
      *(_OWORD *)&buf[32] = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      *(_OWORD *)buf = v16;
      *(_OWORD *)&buf[16] = v17;
      v10 = (void *)objc_msgSend_initWithClientHeading_(v7, v8, (uint64_t)buf, v9);
      entr_act_modify();
      v11 = NSStringFromSelector(sel_locationManager_didUpdateHeading_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v12 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        *(_WORD *)&buf[8] = 2082;
        *(_DWORD *)&buf[4] = 0;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v6;
        *(_WORD *)&buf[38] = 2114;
        *(_QWORD *)&buf[40] = v11;
        LOWORD(v23) = 2114;
        *(_QWORD *)((char *)&v23 + 2) = v10;
        _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"heading\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didUpdateHeading_(v6, v13, (uint64_t)self, (uint64_t)v10);

    }
    else
    {
      entr_act_modify();
    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "could not get updated heading", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventHeading:]", "CoreLocation: %s\n", v15);
      if (v15 != buf)
        free(v15);
    }
  }
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 bundlePath:(id)a4 websiteIdentifier:(id)a5 delegate:(id)a6 silo:(id)a7
{
  CLLocationManager *v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  CLLocationManagerInternal *v23;
  const char *v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  char *v46;
  NSObject *v47;
  int v48;
  int v49;
  int v50;
  unsigned int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  os_activity_scope_state_s state;
  objc_super v74;
  __int16 v75;
  uint8_t buf[4];
  int v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  NSString *v83;
  __int16 v84;
  CLLocationManager *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)CLLocationManager;
  v13 = -[CLLocationManager init](&v74, sel_init);
  if (v13)
  {
    v14 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      v20 = objc_msgSend_UTF8String(a4, v17, v18, v19);
      *(_DWORD *)buf = 68290306;
      v77 = 0;
      v78 = 2082;
      v79 = "";
      v80 = 2082;
      v81 = "activity";
      v82 = 2114;
      v83 = v16;
      v84 = 2050;
      v85 = v13;
      v86 = 2114;
      v87 = a3;
      v88 = 2082;
      v89 = v20;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"bundlePath\":%{public, location:escape_only}s}", buf, 0x44u);
    }
    if (!a7)
    {
      v21 = objc_alloc(MEMORY[0x1E0D44538]);
      a7 = (id)objc_msgSend_initWithCurrentRunLoopAndIdentifier_bePermissive_(v21, v22, (uint64_t)CFSTR("CLLocationManager-runloop"), 1);
    }
    v23 = [CLLocationManagerInternal alloc];
    v25 = (_QWORD *)objc_msgSend_initWithInfo_bundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(v23, v24, (uint64_t)v13, (uint64_t)a3, a4, a5, a6, a7);
    v13->_internal = v25;
    v29 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v26, v27, v28);
    v32 = (void *)objc_msgSend_objectForInfoDictionaryKey_(v29, v30, (uint64_t)CFSTR("NSExtension"), v31);
    v35 = (void *)objc_msgSend_objectForKey_(v32, v33, (uint64_t)CFSTR("NSExtensionPointIdentifier"), v34);
    if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("com.apple.widgetkit-extension"), v37))
    {
      v41 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v38, v39, v40);
      if (sub_18F5F61EC(v41, v42, v43, v44))
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v45 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_DEBUG, "Widget has NSWidgetWantsLocation key in its Info.plist", buf, 2u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v75 = 0;
          v46 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "void verifyWidgetKitExtension()", "CoreLocation: %s\n", v46);
          if (v46 != (char *)buf)
            free(v46);
        }
      }
      else
      {
        NSLog(CFSTR("This widget has attempted to access privacy-sensitive data without specifying a need. The widget's Info.plist must contain a “%@” key with any number other than 0"), CFSTR("NSWidgetWantsLocation"));
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v47 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v77 = 0;
          v78 = 2082;
          v79 = "";
          _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning widget is missing NSWidgetWantsLocation key in its Info.plist\"}", buf, 0x12u);
        }
      }
    }
    sub_18F5CC0B8();
    v48 = sub_18F5CC0F8();
    v49 = _CFExecutableLinkedOnOrAfter();
    if (v48)
      v50 = 5;
    else
      v50 = 1;
    if (v49)
      v51 = v50;
    else
      v51 = 2;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      v54 = v25[1];
      if (v54)
      {
        if (*(_BYTE *)(v54 + 16))
          objc_msgSend_setAllowsBackgroundLocationUpdates_(v13, v52, 1, v53);
      }
    }
    sub_18F5CC198((_QWORD *)v25[1]);
    if (sub_18F5CC08C())
      objc_msgSend_setPausesLocationUpdatesAutomatically_(v25, v55, v51, v56);
    else
      objc_msgSend_setPausesLocationUpdatesAutomatically_(v25, v55, 3, v56);
    v60 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v57, v58, v59);
    objc_msgSend_addObserver_selector_name_object_(v60, v61, (uint64_t)v13, (uint64_t)sel_onDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    v65 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v62, v63, v64);
    objc_msgSend_addObserver_selector_name_object_(v65, v66, (uint64_t)v13, (uint64_t)sel_onWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    v70 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v67, v68, v69);
    objc_msgSend_addObserver_selector_name_object_(v70, v71, (uint64_t)v13, (uint64_t)sel_onDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    os_activity_scope_leave(&state);
  }
  return v13;
}

- (void)onClientEventRegistration:(id)a3
{
  uint64_t v3;
  void **internal;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  os_activity_scope_state_s state;
  _BYTE v61[128];
  uint64_t buf;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  NSString *v68;
  __int16 v69;
  CLLocationManager *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  internal = (void **)self->_internal;
  v8 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"), v3);
  objc_msgSend_setClientKeyForIdentityValidation_(internal, v9, v8, v10);
  v13 = objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("kCLConnectionMessageMonitorLedgerAccessKey"), v12);
  objc_msgSend_setMonitorLedgerAccessKey_(internal, v14, v13, v15);
  objc_sync_enter(self);
  v16 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v17 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v21 = NSStringFromSelector(a2);
    v25 = objc_msgSend_clientKeyForIdentityValidation(internal, v22, v23, v24);
    buf = 68290050;
    v63 = 2082;
    v64 = "";
    v65 = 2082;
    v66 = "activity";
    v67 = 2114;
    v68 = v21;
    v69 = 2050;
    v70 = self;
    v71 = 2114;
    v72 = v25;
    _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"clientKey\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  v26 = (void *)objc_msgSend_clientKeyForIdentityValidation(internal, v18, v19, v20);
  if ((objc_msgSend_isEqualToString_(v26, v27, (uint64_t)CFSTR("icom.apple.Home.HomeControlService:"), v28) & 1) != 0
    || (v32 = (void *)objc_msgSend_clientKeyForIdentityValidation(internal, v29, v30, v31),
        objc_msgSend_isEqualToString_(v32, v33, (uint64_t)CFSTR("icom.apple.Spotlight:"), v34)))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v38 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      buf = 68289026;
      v63 = 2082;
      v64 = "";
      _os_log_impl(&dword_18F5B3000, v38, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"This CLLocationManager resolved to an invalid location client.\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v39 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      buf = 68289026;
      v63 = 2082;
      v64 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "This CLLocationManager resolved to an invalid location client.", "{\"msg%{public}.0s\":\"This CLLocationManager resolved to an invalid location client.\"}", (uint8_t *)&buf, 0x12u);
    }
  }
  v40 = (void *)objc_msgSend_copy(internal[35], v35, v36, v37);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v56, (uint64_t)v61, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v57 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i) + 16))();
        v49 = objc_msgSend_clientKeyForIdentityValidation(internal, v46, v47, v48);
        v53 = objc_msgSend_monitorLedgerAccessKey(internal, v50, v51, v52);
        objc_msgSend_updateIdentityToken_withStorageToken_(v45, v54, v49, v53);
      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v55, (uint64_t)&v56, (uint64_t)v61, 16);
    }
    while (v42);
  }

  os_activity_scope_leave(&state);
  objc_sync_exit(self);
}

- (CLAccuracyAuthorization)accuracyAuthorization
{
  void **internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  CLAccuracyAuthorization v11;
  char v13;

  objc_sync_enter(self);
  internal = (void **)self->_internal;
  if (objc_msgSend_previousAuthorizationStatusValid(internal[4], v4, v5, v6))
  {
    v10 = objc_msgSend_limitsPrecision(internal[4], v7, v8, v9);
  }
  else
  {
    objc_msgSend_collectMetricForFunction_(self, v7, 0x100000, v9);
    v13 = 0;
    sub_18F5B7288(*((_QWORD *)internal[1] + 45), *((_QWORD *)internal[1] + 46), (uint64_t)&v13);
    v10 = v13 == 0;
  }
  v11 = (unint64_t)v10;
  objc_sync_exit(self);
  return v11;
}

+ (int)_authorizationStatusForBundleIdentifier:(id)a3 bundlePath:(id)a4
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v9;

  v9 = 0;
  if ((unint64_t)a3 | (unint64_t)a4)
    v4 = a3;
  else
    v4 = (id)qword_1EE172A60;
  if ((unint64_t)a3 | (unint64_t)a4)
    v5 = a4;
  else
    v5 = (id)qword_1EE172A68;
  v6 = sub_18F5CCD00((uint64_t)v4, (uint64_t)v5, (uint64_t)&v9);
  v7 = v9;
  if ((v9 - 1) >= 4)
    v7 = 0;
  if (v6)
    return v7;
  else
    return 0;
}

- (BOOL)isAuthorizedForWidgetUpdates
{
  void **internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char isAuthorizedForWidgetUpdates;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v16;

  objc_sync_enter(self);
  internal = (void **)self->_internal;
  if (objc_msgSend_previousAuthorizationStatusValid(internal[4], v4, v5, v6))
  {
    isAuthorizedForWidgetUpdates = objc_msgSend_isAuthorizedForWidgetUpdates(internal[4], v7, v8, v9);
  }
  else
  {
    objc_msgSend_collectMetricForFunction_(self, v7, 0x200000, v9);
    v16 = 0;
    sub_18F6E1A78(*((_QWORD *)internal[1] + 45), *((_QWORD *)internal[1] + 46), (uint64_t)&v16);
    v14 = objc_msgSend_authorizationStatus(self, v11, v12, v13);
    isAuthorizedForWidgetUpdates = v14 == 3 || v14 == 4 && v16 == 3;
  }
  objc_sync_exit(self);
  return isAuthorizedForWidgetUpdates;
}

- (CLLocationManager)init
{
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, 0, 0, 0, 0, 0);
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  uint64_t v7;

  v7 = objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  return (CLLocationManager *)MEMORY[0x1E0DE7D20](self, sel_initWithEffectiveBundlePath_delegate_onQueue_, v7, a4);
}

- (CLLocationDistance)distanceFilter
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  double v10;
  double v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v9;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_distanceFilter(*((void **)self->_internal + 4), v6, v7, v8);
  v11 = v10;
  os_activity_scope_leave(&v13);
  return v11;
}

+ (BOOL)locationServicesEnabled
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 1, v2);
  return CLClientIsLocationServicesEnabled() != 0;
}

+ (CLAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_collectMetricForFunction_(a1, a2, 0x80000, v2);
  return objc_msgSend__authorizationStatus(a1, v4, v5, v6);
}

+ (int)authorizationStatusForBundlePath:(id)a3
{
  return MEMORY[0x1E0DE7D20](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_, 0, a3);
}

+ (int)authorizationStatusForBundleIdentifier:(id)a3
{
  return MEMORY[0x1E0DE7D20](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_, a3, 0);
}

+ (int)authorizationStatusForBundle:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, v3);
  return objc_msgSend_authorizationStatusForBundlePath_(a1, v6, v5, v7);
}

+ (int)_authorizationStatus
{
  return MEMORY[0x1E0DE7D20](a1, sel__authorizationStatusForBundleIdentifier_bundlePath_, 0, 0);
}

- (CLLocationManager)initWithIdentifier:(id)a3
{
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, 0, 0, 0, 0, 0);
}

- (CLLocationManager)initWithWebsiteIdentifier:(id)a3
{
  NSObject *v5;
  char *v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil websiteIdentifier", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithWebsiteIdentifier:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, 0, 0, a3, 0, 0);
}

- (CLLocationManager)initWithWebsiteIdentifier:(id)a3 delegate:(id)a4 onQueue:(id)a5
{
  _QWORD *p_cache;
  void *v8;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v8 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
    goto LABEL_6;
  p_cache = &OBJC_METACLASS___CLAssertion.cache;
  if (qword_1ECD8E758 != -1)
    goto LABEL_20;
  while (1)
  {
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil websiteIdentifier", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (p_cache[235] != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      p_cache = buf;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithWebsiteIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
LABEL_6:
    if (a4 && a5)
      break;
    v8 = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    self = (CLLocationManager *)&OBJC_METACLASS___CLAssertion.cache;
    v16 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v17 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    a4 = (id)qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2082;
      v24 = "assert";
      v25 = 2081;
      v26 = "delegate && queue";
      _os_log_impl(&dword_18F5B3000, (os_log_t)a4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_20:
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v11 = objc_alloc(MEMORY[0x1E0D44528]);
  v13 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v11, v12, (uint64_t)a5, 1);
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v14, 0, 0, v8, a4, v13);
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3 websiteIdentifier:(id)a4
{
  NSObject *v7;
  char *v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:websiteIdentifier:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, (uint64_t)a3, 0, a4, 0, 0);
}

- (CLLocationManager)initWithEffectiveBundleIdentifier:(id)a3
{
  NSObject *v5;
  char *v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil identifier", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundleIdentifier:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, (uint64_t)a3, 0, 0, 0, 0);
}

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3
{
  NSObject *v5;
  char *v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
  return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, a2, 0, (uint64_t)a3, 0, 0, 0);
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, v3);
  return (CLLocationManager *)MEMORY[0x1E0DE7D20](self, sel_initWithEffectiveBundlePath_, v5, v6);
}

- (CLLocationManager)initWithEffectiveBundlePath:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6
{
  _QWORD *p_cache;
  NSObject *v9;
  const char *v10;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v23;
  id v24;
  const char *v25;
  id v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  char *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v9 = a4;
  v10 = (const char *)a3;
  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    p_cache = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 == -1)
      goto LABEL_11;
    goto LABEL_44;
  }
  if ((objc_msgSend_containsObject_(&unk_1E29B5B68, a2, (uint64_t)a3, (uint64_t)a4) & 1) != 0)
  {
    while (1)
    {
      if (v9)
      {
        if ((objc_msgSend_containsObject_(&unk_1E29B5B68, v12, (uint64_t)v9, v13) & 1) == 0)
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v20 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289282;
            v33 = 0;
            v34 = 2082;
            v35 = "";
            v36 = 2114;
            v37 = (const char *)v9;
            _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported limiting identifier\", \"identifier\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          }
          v21 = qword_1ECD8E750;
          if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
          {
            *(_DWORD *)buf = 68289282;
            v33 = 0;
            v34 = 2082;
            v35 = "";
            v36 = 2114;
            v37 = (const char *)v9;
            v16 = "initializing CLLocationManager with unsupported limiting identifier";
            v17 = "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported limiting identifier\", \"identi"
                  "fier\":%{public, location:escape_only}@}";
            v18 = v21;
            goto LABEL_23;
          }
          return 0;
        }
      }
      else
      {
        p_cache = &OBJC_METACLASS___CLAssertion.cache;
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v23 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil limiting identifier", buf, 2u);
        }
        if (sub_18F5C4AE0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          p_cache = buf;
          v31 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v31);
          if (v31 != (char *)buf)
            free(v31);
        }
      }
      if (a5 && a6)
      {
        v24 = objc_alloc(MEMORY[0x1E0D44528]);
        v26 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v24, v25, (uint64_t)a6, 1);
        return (CLLocationManager *)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v27, (uint64_t)v9, (uint64_t)v10, 0, a5, v26);
      }
      v10 = (const char *)&OBJC_METACLASS___CLAssertion.cache;
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      a5 = &OBJC_METACLASS___CLAssertion.cache;
      v28 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2082;
        v37 = "assert";
        v38 = 2081;
        v39 = "delegate && queue";
        _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v29 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289539;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2082;
        v37 = "assert";
        v38 = 2081;
        v39 = "delegate && queue";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "delegate and queue must not be nil", "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v9 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2082;
        v37 = "assert";
        v38 = 2081;
        v39 = "delegate && queue";
        _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"delegate and queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
LABEL_44:
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
LABEL_11:
      v19 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_FAULT, "initializing CLLocationManager with a nil bundle path", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (p_cache[235] != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        p_cache = buf;
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:]", "CoreLocation: %s\n", v30);
        if (v30 != (char *)buf)
          free(v30);
      }
    }
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v14 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289282;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported bundle path\", \"bundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v15 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2114;
    v37 = v10;
    v16 = "initializing CLLocationManager with unsupported bundle path";
    v17 = "{\"msg%{public}.0s\":\"initializing CLLocationManager with unsupported bundle path\", \"bundlePath\":%{public,"
          " location:escape_only}@}";
    v18 = v15;
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x1Cu);
  }
  return 0;
}

- (CLLocationManager)initWithEffectiveBundle:(id)a3 limitingBundleIdentifier:(id)a4 delegate:(id)a5 onQueue:(id)a6
{
  uint64_t v8;

  v8 = objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  return (CLLocationManager *)MEMORY[0x1E0DE7D20](self, sel_initWithEffectiveBundlePath_limitingBundleIdentifier_delegate_onQueue_, v8, a4);
}

- (id)initOnQueue:(id)a3
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
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
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "queue";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v11 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "queue";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queue must not be nil", "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2082;
      v18 = "assert";
      v19 = 2081;
      v20 = "queue";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"queue must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  v5 = objc_alloc(MEMORY[0x1E0D44528]);
  v7 = (id)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v5, v6, (uint64_t)a3, 1);
  return (id)objc_msgSend_initWithEffectiveBundleIdentifier_bundlePath_websiteIdentifier_delegate_silo_(self, v8, 0, 0, 0, 0, v7);
}

+ (id)sharedManager
{
  id result;

  result = (id)qword_1EE172C40;
  if (!qword_1EE172C40)
  {
    result = objc_alloc_init(CLLocationManager);
    qword_1EE172C40 = (uint64_t)result;
  }
  return result;
}

+ (id)sharedQueue
{
  if (qword_1EE172CB8 != -1)
    dispatch_once(&qword_1EE172CB8, &unk_1E29911D0);
  return (id)qword_1EE172CB0;
}

+ (id)weakSharedInstance
{
  id Weak;
  CLLocationManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_sync_enter(a1);
  Weak = objc_loadWeak(&qword_1EE172CA8);
  if (!Weak)
  {
    v4 = [CLLocationManager alloc];
    v8 = objc_msgSend_sharedQueue(CLLocationManager, v5, v6, v7);
    Weak = (id)objc_msgSend_initOnQueue_(v4, v9, v8, v10);
    objc_storeWeak(&qword_1EE172CA8, Weak);
  }
  objc_sync_exit(a1);
  return Weak;
}

+ (BOOL)reportLocationUtilityEvent:(int)a3 atDate:(id)a4
{
  return sub_18F6DFC20(*(uint64_t *)&a3, (const char *)a4, *(uint64_t *)&a3, (uint64_t)a4) != 0;
}

+ (void)resetLocationAuthorizationForBundleId:(id)a3 orBundlePath:(id)a4
{
  sub_18F6DFC54((uint64_t)a3, (uint64_t)a4);
}

+ (BOOL)locationServicesEnabled:(BOOL)a3
{
  return ((uint64_t (*)(id, char *, BOOL))MEMORY[0x1E0DE7D20])(a1, sel_locationServicesEnabled, a3);
}

+ (void)setLocationServicesEnabled:(BOOL)a3
{
  uint64_t v3;

  sub_18F6E171C(a3, a2, a3, v3);
}

+ (id)setAuthorizationPromptMapDisplayEnabled:(BOOL)a3
{
  uint64_t v3;

  return (id)sub_18F6E1A4C(a3, a2, a3, v3);
}

+ (BOOL)authorizationPromptMapDisplayEnabled
{
  return CLClientIsAuthorizationPromptMapDisplayEnabled() != 0;
}

+ (BOOL)significantLocationChangeMonitoringAvailable
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v2);
  return 1;
}

+ (BOOL)isMonitoringAvailableForClass:(Class)regionClass
{
  uint64_t v3;
  unsigned int v6;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v3);
  if ((Class)objc_opt_class() == regionClass)
  {
    v6 = 3;
  }
  else if ((Class)objc_opt_class() == regionClass)
  {
    v6 = 0;
  }
  else if ((Class)objc_opt_class() == regionClass)
  {
    v6 = 2;
  }
  else
  {
    if ((Class)objc_opt_class() != regionClass && (Class)objc_opt_class() != regionClass)
      return 0;
    v6 = 1;
  }
  return sub_18F5CF1FC(0, v6) != 0;
}

+ (BOOL)regionMonitoringAvailable
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v2);
  sub_18F5CC0B8();
  return (sub_18F6718D4() >> 8) & 1;
}

+ (BOOL)regionMonitoringEnabled
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v2);
  return sub_18F5CF240() != 0;
}

+ (BOOL)isRangingAvailable
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 2, v2);
  sub_18F5CC0B8();
  return (sub_18F6718D4() >> 22) & 1;
}

- (id)delegate
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = (void *)objc_msgSend_delegate(self->_internal, v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setPausesLocationUpdatesAutomatically:(BOOL)pausesLocationUpdatesAutomatically
{
  _BOOL4 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  os_activity_scope_state_s v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  CLLocationManager *v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v3 = pausesLocationUpdatesAutomatically;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v26.opaque[0] = 0;
  v26.opaque[1] = 0;
  os_activity_scope_enter(v6, &v26);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
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
    v37 = 1026;
    v38 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"pausesLocationUpdatesAutomatically\":%{public}hhd}", buf, 0x36u);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  if (!sub_18F5CC08C())
  {
    v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 981, CFSTR("Non-UI clients cannot be autopaused"));
  }
  sub_18F5CC0B8();
  if (sub_18F5CC0F8())
  {
    if (v3)
      objc_msgSend_setPausesLocationUpdatesAutomatically_(internal, v13, 6, v14);
    else
      objc_msgSend_setPausesLocationUpdatesAutomatically_(internal, v13, 4, v14);
    if (objc_msgSend_paused(internal[4], v15, v16, v17)
      && objc_msgSend_pausesLocationUpdatesAutomatically(internal[4], v18, v19, v20) <= 4)
    {
      objc_msgSend_startUpdatingLocation(self, v21, v22, v23);
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v26);
}

- (BOOL)pausesLocationUpdatesAutomatically
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  BOOL v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_PausesLocationUpdatesAutomatically(self->_internal, v6, v7, v8) > 4;
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)allowsBackgroundLocationUpdates
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  CLLocationManager *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v3 = allowsBackgroundLocationUpdates;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    v23 = 2114;
    v24 = v8;
    v25 = 2050;
    v26 = self;
    v27 = 1026;
    v28 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"allows\":%{public}hhd}", buf, 0x36u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  if (v3)
  {
    v12 = internal[1];
    if ((!v12 || !*(_BYTE *)(v12 + 16)) && !_CFMZEnabled())
    {
      v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v13, v11);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!stayUp || CLClientIsBackgroundable(internal->fClient) || _CFMZEnabled()"));
    }
  }
  objc_msgSend_setAllowsBackgroundLocationUpdates_(internal, v10, v3, v11);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (BOOL)allowsBackgroundLocationUpdates
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_allowsBackgroundLocationUpdates(self->_internal, v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)showsBackgroundLocationIndicator
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = showsBackgroundLocationIndicator;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    v23 = 1026;
    v24 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"shows\":%{public}hhd}", buf, 0x36u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setShowsBackgroundLocationIndicator_(internal, v10, v3, v11);
  objc_sync_exit(self);
  os_activity_scope_leave(&v12);
}

- (BOOL)showsBackgroundLocationIndicator
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_showsBackgroundLocationIndicator(self->_internal, v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

+ (BOOL)mapCorrectionAvailable
{
  sub_18F5CC0B8();
  return sub_18F6729D4();
}

- (CLLocation)location
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  char *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CLLocation *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const char *v30;
  uint64_t v31;
  CLLocation *v32;
  os_activity_scope_state_s v34;
  _BYTE buf[48];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v34.opaque[0] = 0;
  v34.opaque[1] = 0;
  os_activity_scope_enter(v4, &v34);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2050;
    *(_QWORD *)&buf[40] = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = (char *)self->_internal;
  objc_sync_enter(self);
  v11 = *(double *)(internal + 44);
  v12 = *(double *)(internal + 52);
  v13 = v12 != 0.0 && v11 != 0.0;
  if (*(double *)(internal + 60) >= 0.0 && !v13)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v11 != 0.0;
      *(_WORD *)&buf[24] = 1026;
      *(_DWORD *)&buf[26] = v12 != 0.0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NullIsland Either the latitude or longitude was exactly 0! That's highly unlikely: refreshing property\", \"latIsNonzero\":%{public}hhd, \"lonIsNonzero\":%{public}hhd}", buf, 0x1Eu);
    }
  }
  if (!objc_msgSend_updatingLocation(*((void **)internal + 4), v8, v9, v10)
    || *(double *)(internal + 60) < 0.0
    || v11 == 0.0
    || v12 == 0.0)
  {
    v19 = objc_msgSend_dynamicAccuracyReductionEnabled(*((void **)internal + 4), v15, v16, v17);
    v23 = objc_msgSend_allowsAlteredAccessoryLocations(*((void **)internal + 4), v20, v21, v22);
    if (!CLClientRetrieveLocationWithDynamicAccuracyReductionAndAlteredAccessoryLocations(*((_QWORD *)internal + 1), v19, v23, (uint64_t)(internal + 40)))
    {
      v32 = 0;
      goto LABEL_30;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v24 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(_QWORD *)&buf[26] = internal + 40;
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"No valid, cached location. Fetched from daemon\", \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 156;
      *(_WORD *)&buf[24] = 2097;
      *(_QWORD *)&buf[26] = internal + 40;
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"We have a valid, cached location. Fetching from internal state\", \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x22u);
    }
  }
  v25 = [CLLocation alloc];
  v26 = *(_OWORD *)(internal + 152);
  v39 = *(_OWORD *)(internal + 136);
  v40 = v26;
  v41[0] = *(_OWORD *)(internal + 168);
  *(_OWORD *)((char *)v41 + 12) = *(_OWORD *)(internal + 180);
  v27 = *(_OWORD *)(internal + 88);
  *(_OWORD *)&buf[32] = *(_OWORD *)(internal + 72);
  v36 = v27;
  v28 = *(_OWORD *)(internal + 120);
  v37 = *(_OWORD *)(internal + 104);
  v38 = v28;
  v29 = *(_OWORD *)(internal + 56);
  *(_OWORD *)buf = *(_OWORD *)(internal + 40);
  *(_OWORD *)&buf[16] = v29;
  v32 = (CLLocation *)(id)objc_msgSend_initWithClientLocation_(v25, v30, (uint64_t)buf, v31);
LABEL_30:
  objc_sync_exit(self);
  os_activity_scope_leave(&v34);
  return v32;
}

- (BOOL)locationServicesAvailable
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  CLLocationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    v15 = 2114;
    v16 = v6;
    v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 1;
}

- (BOOL)locationServicesEnabled
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  BOOL v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = CLClientIsLocationServicesEnabled() != 0;
  os_activity_scope_leave(&v9);
  return v7;
}

- (BOOL)locationServicesApproved
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  BOOL v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend__authorizationStatus(CLLocationManager, v6, v7, v8) == 3;
  os_activity_scope_leave(&v12);
  return v10;
}

- (double)expectedGpsUpdateInterval
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  CLLocationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    v15 = 2114;
    v16 = v6;
    v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 1.0;
}

- (void)setSupportInfo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  char *v10;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  CLLocationManager *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = v8;
    v20 = 2050;
    v21 = self;
    v22 = 1026;
    v23 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"supportInfo\":%{public}hhd}", buf, 0x36u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_FAULT, "Obsolete", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager setSupportInfo:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf)
      free(v10);
  }
  os_activity_scope_leave(&state);
}

- (BOOL)supportInfo
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  CLLocationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    v15 = 2114;
    v16 = v6;
    v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v8);
  return 0;
}

- (__CLClient)internalClient
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  __CLClient *v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (__CLClient *)*((_QWORD *)self->_internal + 1);
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)setPrivateMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v11;
    v21 = 2050;
    v22 = self;
    v23 = 1026;
    v24 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"privateMode\":%{public}hhd}", buf, 0x36u);
  }
  sub_18F6E1080(v3, v8, v9, v10);
  os_activity_scope_leave(&v12);
}

- (BOOL)privateMode
{
  NSObject *v4;
  NSObject *v5;
  _BOOL8 v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  BOOL v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  v6 = os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v10;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v11 = sub_18F6E10AC(v6, v7, v8, v9) != 0;
  os_activity_scope_leave(&v13);
  return v11;
}

- (void)setPurpose:(NSString *)purpose
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    v21 = 2113;
    v22 = purpose;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"purpose\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5CE648(internal[1], (const __CFString *)purpose);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (NSString)purpose
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  _QWORD **internal;
  NSString *v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = (_QWORD **)self->_internal;
  objc_sync_enter(self);
  v8 = (NSString *)sub_18F5CE728(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
  return v8;
}

- (CLActivityType)activityType
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  unint64_t v10;
  CLActivityType v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v9;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_activityType(*((void **)self->_internal + 4), v6, v7, v8);
  if (v10 <= 1)
    v11 = CLActivityTypeOther;
  else
    v11 = v10;
  os_activity_scope_leave(&v13);
  return v11;
}

- (void)markAsHavingReceivedLocation
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  CLLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = "activity";
    v14 = 2114;
    v15 = v6;
    v16 = 2050;
    v17 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientMarkAsHavingReceivedLocation(*((_QWORD *)self->_internal + 1));
  os_activity_scope_leave(&v7);
}

+ (BOOL)_checkAndExerciseAuthorizationForBundleID:(id)a3 error:(id *)a4
{
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  os_activity_scope_state_s v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v8, &v17);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v14 = objc_msgSend_UTF8String(a3, v11, v12, v13);
    *(_DWORD *)buf = 68290050;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    v24 = 2114;
    v25 = v10;
    v26 = 2050;
    v27 = a1;
    v28 = 2082;
    v29 = v14;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"bundleID\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v15 = sub_18F6E306C((uint64_t)a3, 0, 5120, (uint64_t)a4);
  os_activity_scope_leave(&v17);
  return v15;
}

+ (BOOL)_checkAndExerciseAuthorizationForBundle:(id)a3 error:(id *)a4
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  char v23;
  os_activity_scope_state_s v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter(v8, &v25);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v17 = (void *)objc_msgSend_bundlePath(a3, v14, v15, v16);
    v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
    *(_DWORD *)buf = 68290050;
    v27 = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2082;
    v31 = "activity";
    v32 = 2114;
    v33 = v13;
    v34 = 2050;
    v35 = a1;
    v36 = 2082;
    v37 = v21;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"bundlePath\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v22 = (const char *)objc_msgSend_bundlePath(a3, v10, v11, v12);
  v23 = sub_18F6E306C(0, v22, 5120, (uint64_t)a4);
  os_activity_scope_leave(&v25);
  return v23;
}

- (void)startUpdatingLocationWithPrompt
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientSetShowLocationPrompt(*((_QWORD *)self->_internal + 1), 1);
  objc_msgSend_startUpdatingLocation(self, v7, v8, v9);
  os_activity_scope_leave(&v10);
}

- (void)stopUpdatingLocation
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  CLLocationManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v4, &v21);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2082;
    v27 = "activity";
    v28 = 2114;
    v29 = v8;
    v30 = 2050;
    v31 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 8, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  if (objc_msgSend_requestingLocation(*((void **)internal + 4), v10, v11, v12))
    objc_msgSend_cancelLocationRequest(internal, v13, v14, v15);
  objc_msgSend_setUpdatingLocation_(*((void **)internal + 4), v13, 0, v15);
  if (objc_msgSend_paused(*((void **)internal + 4), v16, v17, v18))
    objc_msgSend_setPaused_(*((void **)internal + 4), v19, 0, v20);
  CLClientStopLocationUpdates_0(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&v21);
}

- (void)requestLocation
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  char *internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  char *v49;
  _QWORD v50[5];
  __int16 v51;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v54[32];
  CLLocationManager *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v54 = 2082;
    *(_QWORD *)&v54[2] = "";
    *(_WORD *)&v54[10] = 2082;
    *(_QWORD *)&v54[12] = "activity";
    *(_WORD *)&v54[20] = 2114;
    *(_QWORD *)&v54[22] = v8;
    *(_WORD *)&v54[30] = 2050;
    v55 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 16, v7);
  internal = (char *)self->_internal;
  objc_msgSend_delegate(internal, v10, v11, v12);
  objc_sync_enter(self);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v45 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1333, CFSTR("Delegate must respond to locationManager:didUpdateLocations:"));
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v47 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v47, v48, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1335, CFSTR("Delegate must respond to locationManager:didFailWithError:"));
  }
  if ((objc_msgSend_requestingLocation(*((void **)internal + 4), v16, v17, v18) & 1) != 0
    || (objc_msgSend_updatingLocation(*((void **)internal + 4), v19, v20, v21) & 1) != 0
    || objc_msgSend_batchingLocation(*((void **)internal + 4), v22, v23, v24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v27 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v27, OS_LOG_TYPE_DEFAULT, "Ignoring requestLocation due to ongoing location.", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v51 = 0;
      v49 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager requestLocation]", "CoreLocation: %s\n", v49);
      if (v49 != (char *)buf)
        free(v49);
    }
  }
  else
  {
    objc_msgSend_setRequestingLocation_(*((void **)internal + 4), v25, 1, v26);
    *(_QWORD *)(internal + 60) = 0xBFF0000000000000;
    v28 = *((_QWORD *)internal + 1);
    v29 = *((double *)internal + 27);
    v30 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_18F5DE728;
    v50[3] = &unk_1E2990DE0;
    v50[4] = self;
    v34 = (void *)objc_msgSend_newTimer(*(void **)(v28 + 232), v31, v32, v33);
    *(_QWORD *)buf = v30;
    *(_QWORD *)v54 = 3221225472;
    *(_QWORD *)&v54[8] = sub_18F5D5694;
    *(_QWORD *)&v54[16] = &unk_1E2990E30;
    *(_QWORD *)&v54[24] = v50;
    objc_msgSend_setHandler_(v34, v35, (uint64_t)buf, v36);
    objc_msgSend_setNextFireDelay_(v34, v37, v38, v39, v29);
    *((_QWORD *)internal + 26) = v34;
    v40 = *((_QWORD *)internal + 1);
    objc_msgSend_desiredAccuracy(*((void **)internal + 4), v41, v42, v43);
    CLClientStartLocationUpdatesWithDynamicAccuracyReductionAndAlteredAccessoryLocations_0(v40, (int)v44, 0, 0, -1.0);
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)allowDeferredLocationUpdatesUntilTraveled:(CLLocationDistance)distance timeout:(NSTimeInterval)timeout
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  id internal;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  char *v34;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  CLLocationManager *v45;
  __int16 v46;
  CLLocationDistance v47;
  __int16 v48;
  NSTimeInterval v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290306;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2082;
    v41 = "activity";
    v42 = 2114;
    v43 = v12;
    v44 = 2050;
    v45 = self;
    v46 = 2050;
    v47 = distance;
    v48 = 2050;
    v49 = timeout;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"distance\":\"%{public}f\", \"timeout_s\":\"%{public}.09f\"}", buf, 0x44u);
  }
  objc_msgSend_collectMetricForFunction_(self, v10, 32, v11);
  internal = self->_internal;
  objc_msgSend_delegate(internal, v14, v15, v16);
  objc_sync_enter(self);
  if (objc_msgSend_requestingLocation(*((void **)internal + 4), v17, v18, v19))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v22 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "Canceling requestLocation.", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager allowDeferredLocationUpdatesUntilTraveled:timeout:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf)
        free(v34);
    }
    objc_msgSend_cancelLocationRequest(internal, v23, v24, v25);
  }
  objc_msgSend_setBatchingLocation_(*((void **)internal + 4), v20, 1, v21);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v32 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1365, CFSTR("Delegate must respond to locationManager:didUpdateLocations:"));
  }
  v29 = *((_QWORD *)internal + 1);
  if (!v29 || !*(_BYTE *)(v29 + 16))
  {
    v30 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1367, CFSTR("Application must support the location background mode (in app's Info.plist, {UIBackgroundModes=(location);}"));
    v29 = *((_QWORD *)internal + 1);
  }
  sub_18F5D40A0(v29, distance, timeout);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)disallowDeferredLocationUpdates
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 32, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D41E4(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

+ (BOOL)deferredLocationUpdatesAvailable
{
  uint64_t v2;

  objc_msgSend_collectMetricForFunction_(a1, a2, 32, v2);
  sub_18F5CC0B8();
  return 0;
}

- (BOOL)headingAvailable
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  char v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = sub_18F5C81CC();
  if ((v7 & 1) != 0)
    sub_18F5CC0B8();
  os_activity_scope_leave(&v9);
  return v7 & 1;
}

- (void)setHeadingFilter:(CLLocationDegrees)headingFilter
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  os_activity_scope_state_s v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  CLLocationManager *v30;
  __int16 v31;
  CLLocationDegrees v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter(v6, &v20);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2082;
    v26 = "activity";
    v27 = 2114;
    v28 = v8;
    v29 = 2050;
    v30 = self;
    v31 = 2050;
    v32 = headingFilter;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"filter\":\"%{public}f\"}", buf, 0x3Au);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  v13 = 360.0;
  if (headingFilter <= 360.0)
    v13 = headingFilter;
  if (headingFilter <= 0.0)
    v13 = -1.0;
  objc_msgSend_setHeadingFilter_(internal[4], v10, v11, v12, v13);
  if (objc_msgSend_updatingHeading(internal[4], v14, v15, v16))
    objc_msgSend_startUpdatingHeading(self, v17, v18, v19);
  objc_sync_exit(self);
  os_activity_scope_leave(&v20);
}

- (CLLocationDegrees)headingFilter
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  double v10;
  double v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v9;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_headingFilter(*((void **)self->_internal + 4), v6, v7, v8);
  v11 = v10;
  os_activity_scope_leave(&v13);
  return v11;
}

- (CLDeviceOrientation)headingOrientation
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  CLDeviceOrientation v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = *((_DWORD *)self->_internal + 56);
  os_activity_scope_leave(&v9);
  return v7;
}

- (CLHeading)heading
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  uint64_t *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CLHeading *v11;
  CLHeading *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  os_activity_scope_state_s state;
  int v41;
  uint64_t v42;
  _BYTE buf[48];
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2050;
    *(_QWORD *)&buf[40] = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = (uint64_t *)self->_internal;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v8, v9, v10);
  LODWORD(internal) = CLClientGetHeading(internal[1], (uint64_t)&v34);
  objc_sync_exit(self);
  v11 = 0;
  if ((_DWORD)internal && *(double *)&v37 > 0.0)
  {
    v12 = [CLHeading alloc];
    *(_OWORD *)&buf[32] = v36;
    v44 = v37;
    v45 = v38;
    v46 = v39;
    *(_OWORD *)buf = v34;
    *(_OWORD *)&buf[16] = v35;
    v11 = (CLHeading *)(id)objc_msgSend_initWithClientHeading_(v12, v13, (uint64_t)buf, v14);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)objc_msgSend_description(v11, v16, v17, v18);
      v23 = objc_msgSend_UTF8String(v19, v20, v21, v22);
      *(_DWORD *)buf = 136380675;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEBUG, "heading, %{private}s", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v28 = (void *)objc_msgSend_description(v11, v25, v26, v27);
      v32 = objc_msgSend_UTF8String(v28, v29, v30, v31);
      v41 = 136380675;
      v42 = v32;
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager heading]", "CoreLocation: %s\n", v33);
      if (v33 != buf)
        free(v33);
    }
  }
  os_activity_scope_leave(&state);
  return v11;
}

- (void)stopUpdatingHeading
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
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
  CLLocationManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "activity";
    v21 = 2114;
    v22 = v8;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 128, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setUpdatingHeading_(*((void **)internal + 4), v10, 0, v11);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v12 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEFAULT, "Stop updating heading", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager stopUpdatingHeading]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  CLClientStopHeadingUpdates(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)dismissHeadingCalibrationDisplay
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  _QWORD *internal;
  NSObject *v8;
  char *v9;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Compass Calibration HUD", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager dismissHeadingCalibrationDisplay]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  CLClientShowHeadingCalibration(internal[1], 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_startMonitoringSignificantLocationChangesOfDistance:(double)a3 withPowerBudget:(int)a4
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  int v11;
  double v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v11 = a4;
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  *(_QWORD *)((char *)internal + 60) = 0xBFF0000000000000;
  sub_18F5BA160(internal[1], &v12, &v11);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)stopMonitoringSignificantLocationChanges
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 512, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5CFC08(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)startMonitoringLocationPushesWithCompletion:(void *)completion
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  _QWORD *internal;
  uint64_t v12;
  uint64_t v13;
  os_activity_scope_state_s v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  CLLocationManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v6, &v14);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "activity";
    v21 = 2114;
    v22 = v10;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 1024, v9);
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5CEC74(internal[1], (const char *)completion, v12, v13);
  objc_sync_exit(self);
  os_activity_scope_leave(&v14);
}

- (void)stopMonitoringLocationPushes
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 2048, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5CEE9C(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)startMonitoringForRegion:(CLRegion *)region desiredAccuracy:(CLLocationAccuracy)accuracy
{
  ((void (*)(CLLocationManager *, char *, CLRegion *))MEMORY[0x1E0DE7D20])(self, sel_startMonitoringForRegion_, region);
}

- (void)startMonitoringForRegion:(CLRegion *)region
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  CLRegion *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CLRegion *v18;
  uint64_t v19;
  BOOL v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *internal;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
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
  uint64_t v47;
  char *v48;
  _QWORD v49[7];
  os_activity_scope_state_s state;
  int v51;
  uint64_t v52;
  _BYTE buf[40];
  CLLocationManager *v54;
  __int16 v55;
  CLRegion *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v10;
    *(_WORD *)&buf[38] = 2050;
    v54 = self;
    v55 = 2113;
    v56 = region;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 4096, v9);
  v11 = region == 0;
  if (!region)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v13 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = region;
  else
    v14 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = region;
  else
    v18 = 0;
  if (v14)
  {
    v19 = objc_msgSend_UUID(v14, v15, v16, v17);
    if (region)
      v20 = v19 == 0;
    else
      v20 = 1;
    v11 = v20;
  }
  else if (v18)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v21 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      v25 = (void *)objc_msgSend_vertices(v18, v22, v23, v24);
      v29 = objc_msgSend_count(v25, v26, v27, v28);
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_DEBUG, "Number of vertices %{public}lu", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v43 = (void *)objc_msgSend_vertices(v18, v40, v41, v42);
      v47 = objc_msgSend_count(v43, v44, v45, v46);
      v51 = 134349056;
      v52 = v47;
      v48 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager startMonitoringForRegion:]", "CoreLocation: %s\n", v48);
      if (v48 != buf)
        free(v48);
    }
  }
  internal = (uint64_t *)self->_internal;
  v31 = objc_msgSend_delegate(internal, v15, v16, v17);
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v32, v33, v34);
  if (v11 || !sub_18F5D0030(internal[1], region, v36, v37))
  {
    v38 = internal[1];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_18F5E0810;
    v49[3] = &unk_1E29911F8;
    v49[4] = self;
    v49[5] = v31;
    v49[6] = region;
    if (v38)
    {
      v39 = *(void **)(v38 + 232);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_18F5CCF7C;
      *(_QWORD *)&buf[24] = &unk_1E2990E30;
      *(_QWORD *)&buf[32] = v49;
      objc_msgSend_async_(v39, v35, (uint64_t)buf, v37);
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopMonitoringForRegion:(CLRegion *)region
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  _QWORD *internal;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
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
  CLLocationManager *v26;
  __int16 v27;
  CLRegion *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v6, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    v23 = 2114;
    v24 = v10;
    v25 = 2050;
    v26 = self;
    v27 = 2113;
    v28 = region;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x2000, v9);
  if (region)
  {
    internal = self->_internal;
    objc_sync_enter(self);
    sub_18F5D06EC(internal[1], region, v12, v13);
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v15 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  os_activity_scope_leave(&v16);
}

- (void)requestStateForRegion:(CLRegion *)region
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t *internal;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  __int16 v30;
  CLRegion *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v6, &v19);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v10;
    v28 = 2050;
    v29 = self;
    v30 = 2113;
    v31 = region;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x4000, v9);
  if (region)
  {
    internal = (uint64_t *)self->_internal;
    objc_sync_enter(self);
    objc_msgSend_performCourtesyPromptIfNeeded(internal, v12, v13, v14);
    sub_18F5D17D8(internal[1], region, v15, v16);
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v18 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  os_activity_scope_leave(&v19);
}

- (CLLocationDistance)maximumRegionMonitoringDistance
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x8000, v7);
  objc_sync_enter(self);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
  return 2128000.0;
}

- (void)startRangingBeaconsInRegion:(CLBeaconRegion *)region
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t *internal;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  id v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[7];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v73[32];
  CLLocationManager *v74;
  __int16 v75;
  CLBeaconRegion *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v73 = 2082;
    *(_QWORD *)&v73[2] = "";
    *(_WORD *)&v73[10] = 2082;
    *(_QWORD *)&v73[12] = "activity";
    *(_WORD *)&v73[20] = 2114;
    *(_QWORD *)&v73[22] = v10;
    *(_WORD *)&v73[30] = 2050;
    v74 = self;
    v75 = 2113;
    v76 = region;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x20000, v9);
  v14 = region == 0;
  if (!region)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v16 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is nil", "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
    }
  }
  v17 = (void *)objc_msgSend_onBehalfOfBundleId(region, v11, v12, v13);
  if (objc_msgSend_length(v17, v18, v19, v20))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v24 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_msgSend_onBehalfOfBundleId(region, v25, v26, v27);
      v32 = objc_msgSend_UTF8String(v28, v29, v30, v31);
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      *(_WORD *)&v73[10] = 2082;
      *(_QWORD *)&v73[12] = v32;
      _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Cannot start ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v33 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v34 = (void *)objc_msgSend_onBehalfOfBundleId(region, v21, v22, v23);
      v38 = objc_msgSend_UTF8String(v34, v35, v36, v37);
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      *(_WORD *)&v73[10] = 2082;
      *(_QWORD *)&v73[12] = v38;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot start ranging beacons on behalf of another app", "{\"msg%{public}.0s\":\"Cannot start ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v14 = 1;
  }
  if (objc_msgSend_type(region, v21, v22, v23))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v42 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      _os_log_impl(&dword_18F5B3000, v42, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v43 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v73 = 2082;
      *(_QWORD *)&v73[2] = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Region is not an instance of CLBeaconRegion", "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
    }
    v14 = 1;
  }
  internal = (uint64_t *)self->_internal;
  v45 = objc_msgSend_delegate(internal, v39, v40, v41);
  objc_sync_enter(self);
  if (v14)
    goto LABEL_33;
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v46, v47, v48);
  v52 = (void *)objc_msgSend_rangedRegions(internal, v49, v50, v51);
  objc_msgSend_removeObject_(v52, v53, (uint64_t)region, v54);
  v58 = (void *)objc_msgSend_rangedRegions(internal, v55, v56, v57);
  objc_msgSend_addObject_(v58, v59, (uint64_t)region, v60);
  v61 = objc_alloc(MEMORY[0x1E0C99E20]);
  v65 = objc_msgSend_rangedRegions(internal, v62, v63, v64);
  v67 = (id)objc_msgSend_initWithSet_copyItems_(v61, v66, v65, 1);
  if (!sub_18F5D2D6C(internal[1], v67, 1))
  {
LABEL_33:
    v68 = internal[1];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = sub_18F5E172C;
    v70[3] = &unk_1E29911F8;
    v70[4] = self;
    v70[5] = v45;
    v70[6] = region;
    if (v68)
    {
      v69 = *(void **)(v68 + 232);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)v73 = 3221225472;
      *(_QWORD *)&v73[8] = sub_18F5CCF7C;
      *(_QWORD *)&v73[16] = &unk_1E2990E30;
      *(_QWORD *)&v73[24] = v70;
      objc_msgSend_async_(v69, v46, (uint64_t)buf, v48);
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopRangingBeaconsInRegion:(CLBeaconRegion *)region
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t *internal;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  id v59;
  os_activity_scope_state_s v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  NSString *v68;
  __int16 v69;
  CLLocationManager *v70;
  __int16 v71;
  CLBeaconRegion *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v60.opaque[0] = 0;
  v60.opaque[1] = 0;
  os_activity_scope_enter(v6, &v60);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v65 = 2082;
    v66 = "activity";
    v67 = 2114;
    v68 = v10;
    v69 = 2050;
    v70 = self;
    v71 = 2113;
    v72 = region;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x20000, v9);
  if (!region)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v43 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v62 = 0;
      v63 = 2082;
      v64 = "";
      _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is nil\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v44 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      goto LABEL_31;
    *(_DWORD *)buf = 68289026;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v39 = "Region is nil";
    v40 = "{\"msg%{public}.0s\":\"Region is nil\"}";
    goto LABEL_29;
  }
  v14 = (void *)objc_msgSend_onBehalfOfBundleId(region, v11, v12, v13);
  if (!objc_msgSend_length(v14, v15, v16, v17))
  {
    if (!objc_msgSend_type(region, v18, v19, v20))
    {
      internal = (uint64_t *)self->_internal;
      objc_sync_enter(self);
      v50 = (void *)objc_msgSend_rangedRegions(internal, v47, v48, v49);
      objc_msgSend_removeObject_(v50, v51, (uint64_t)region, v52);
      v53 = objc_alloc(MEMORY[0x1E0C99E20]);
      v57 = objc_msgSend_rangedRegions(internal, v54, v55, v56);
      v59 = (id)objc_msgSend_initWithSet_copyItems_(v53, v58, v57, 1);
      sub_18F5D2D6C(internal[1], v59, 0);
      objc_sync_exit(self);
      goto LABEL_31;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v45 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v62 = 0;
      v63 = 2082;
      v64 = "";
      _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v44 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      goto LABEL_31;
    *(_DWORD *)buf = 68289026;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v39 = "Region is not an instance of CLBeaconRegion";
    v40 = "{\"msg%{public}.0s\":\"Region is not an instance of CLBeaconRegion\"}";
LABEL_29:
    v41 = v44;
    v42 = 18;
    goto LABEL_30;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v21 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend_onBehalfOfBundleId(region, v22, v23, v24);
    v29 = objc_msgSend_UTF8String(v25, v26, v27, v28);
    *(_DWORD *)buf = 68289282;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v65 = 2082;
    v66 = (const char *)v29;
    _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Cannot stop ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  v30 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    v34 = (void *)objc_msgSend_onBehalfOfBundleId(region, v31, v32, v33);
    v38 = objc_msgSend_UTF8String(v34, v35, v36, v37);
    *(_DWORD *)buf = 68289282;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v65 = 2082;
    v66 = (const char *)v38;
    v39 = "Cannot stop ranging beacons on behalf of another app";
    v40 = "{\"msg%{public}.0s\":\"Cannot stop ranging beacons on behalf of another app\", \"onBehalfOf\":%{public, locati"
          "on:escape_only}s}";
    v41 = v30;
    v42 = 28;
LABEL_30:
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v41, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v39, v40, buf, v42);
  }
LABEL_31:
  os_activity_scope_leave(&v60);
}

- (void)startRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *internal;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  CLBeaconRegion *v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  CLBeaconIdentityConstraint *v44;
  _QWORD v45[7];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  os_activity_scope_state_s state;
  uint8_t v51[128];
  uint8_t buf[8];
  _BYTE v53[32];
  CLLocationManager *v54;
  __int16 v55;
  CLBeaconIdentityConstraint *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_QWORD *)buf = 68290051;
    *(_WORD *)v53 = 2082;
    *(_QWORD *)&v53[2] = "";
    *(_WORD *)&v53[10] = 2082;
    *(_QWORD *)&v53[12] = "activity";
    *(_WORD *)&v53[20] = 2114;
    *(_QWORD *)&v53[22] = v10;
    *(_WORD *)&v53[30] = 2050;
    v54 = self;
    v55 = 2113;
    v56 = constraint;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"constraint\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x20000, v9);
  if (!constraint)
  {
    v41 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1856, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("constraint"));
  }
  internal = (uint64_t *)self->_internal;
  v43 = objc_msgSend_delegate(internal, v11, v12, v13);
  objc_sync_enter(self);
  v18 = (void *)objc_msgSend_rangedConstraints(internal, v15, v16, v17);
  objc_msgSend_addObject_(v18, v19, (uint64_t)constraint, v20);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = constraint;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = (void *)objc_msgSend_rangedConstraints(internal, v22, v23, v24);
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v46, (uint64_t)v51, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v31 = [CLBeaconRegion alloc];
        v33 = (id)objc_msgSend_initWithBeaconIdentityConstraint_identifier_(v31, v32, v30, (uint64_t)&stru_1E2993188);
        objc_msgSend_addObject_(v21, v34, (uint64_t)v33, v35);
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v36, (uint64_t)&v46, (uint64_t)v51, 16);
    }
    while (v27);
  }
  if (!sub_18F5D2D6C(internal[1], v21, 1))
  {
    v39 = internal[1];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_18F5E21D0;
    v45[3] = &unk_1E29911F8;
    v45[4] = self;
    v45[5] = v43;
    v45[6] = v44;
    if (v39)
    {
      v40 = *(void **)(v39 + 232);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)v53 = 3221225472;
      *(_QWORD *)&v53[8] = sub_18F5CCF7C;
      *(_QWORD *)&v53[16] = &unk_1E2990E30;
      *(_QWORD *)&v53[24] = v45;
      objc_msgSend_async_(v40, v37, (uint64_t)buf, v38);
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopRangingBeaconsSatisfyingConstraint:(CLBeaconIdentityConstraint *)constraint
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *internal;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  CLBeaconRegion *v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  os_activity_scope_state_s state;
  _BYTE v44[128];
  uint64_t buf;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  NSString *v51;
  __int16 v52;
  CLLocationManager *v53;
  __int16 v54;
  CLBeaconIdentityConstraint *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    buf = 68290051;
    v46 = 2082;
    v47 = "";
    v48 = 2082;
    v49 = "activity";
    v50 = 2114;
    v51 = v10;
    v52 = 2050;
    v53 = self;
    v54 = 2113;
    v55 = constraint;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"constraint\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v8, 0x20000, v9);
  if (!constraint)
  {
    v37 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 1891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("constraint != nil"));
  }
  internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  v18 = (void *)objc_msgSend_rangedConstraints(internal, v15, v16, v17);
  objc_msgSend_removeObject_(v18, v19, (uint64_t)constraint, v20);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = (void *)objc_msgSend_rangedConstraints(internal, v22, v23, v24);
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v39, (uint64_t)v44, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v31 = [CLBeaconRegion alloc];
        v33 = (id)objc_msgSend_initWithBeaconIdentityConstraint_identifier_(v31, v32, v30, (uint64_t)&stru_1E2993188);
        objc_msgSend_addObject_(v21, v34, (uint64_t)v33, v35);
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v36, (uint64_t)&v39, (uint64_t)v44, 16);
    }
    while (v27);
  }
  sub_18F5D2D6C(internal[1], v21, 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (NSSet)rangedBeaconConstraints
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v4, &v19);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v8;
    v28 = 2050;
    v29 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x20000, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  v13 = (void *)objc_msgSend_rangedConstraints(internal, v10, v11, v12);
  v17 = (NSSet *)(id)objc_msgSend_copy(v13, v14, v15, v16);
  objc_sync_exit(self);
  os_activity_scope_leave(&v19);
  return v17;
}

- (NSSet)rangedRegions
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  os_activity_scope_state_s v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v4, &v19);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v8;
    v28 = 2050;
    v29 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x20000, v7);
  internal = self->_internal;
  objc_sync_enter(self);
  v13 = (void *)objc_msgSend_rangedRegions(internal, v10, v11, v12);
  v17 = (NSSet *)(id)objc_msgSend_copy(v13, v14, v15, v16);
  objc_sync_exit(self);
  os_activity_scope_leave(&v19);
  return v17;
}

+ (BOOL)isPeerRangingAvailable
{
  return 1;
}

+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10
{
  id v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setValue_forKey_(v16, v17, (uint64_t)a3, 0x1E2995688);
  objc_msgSend_setValue_forKey_(v16, v18, (uint64_t)a4, 0x1E2995708);
  objc_msgSend_setValue_forKey_(v16, v19, (uint64_t)a5, 0x1E2995728);
  objc_msgSend_setValue_forKey_(v16, v20, (uint64_t)a6, 0x1E29956A8);
  objc_msgSend_setValue_forKey_(v16, v21, (uint64_t)a7, 0x1E29956C8);
  objc_msgSend_setValue_forKey_(v16, v22, (uint64_t)a8, 0x1E2995748);
  objc_msgSend_setValue_forKey_(v16, v23, (uint64_t)a9, 0x1E29956E8);
  objc_msgSend_setValue_forKey_(v16, v24, (uint64_t)a10, 0x1E2995768);
  return v16;
}

- (id)getMicroLocationInternalVersion
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  id v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received internal version get request\"}", buf, 0x12u);
  }
  v8 = (id)CLCopyMicroLocationInternalVersion();
  os_activity_scope_leave(&v10);
  return v8;
}

- (void)exportMicroLocationDatabaseTablesWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  _QWORD *internal;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v16[32];
  CLLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2082;
    *(_QWORD *)&v16[12] = "activity";
    *(_WORD *)&v16[20] = 2114;
    *(_QWORD *)&v16[22] = v8;
    *(_WORD *)&v16[30] = 2050;
    v17 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v9 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to export copy of MiLo DB tables\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  v11 = internal[1];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F5E2F74;
  v13[3] = &unk_1E2991220;
  v13[4] = a3;
  v12 = *(_QWORD *)(v11 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v16 = 3221225472;
  *(_QWORD *)&v16[8] = sub_18F5D4DB8;
  *(_QWORD *)&v16[16] = &unk_1E2990E80;
  *(_QWORD *)&v16[24] = v12;
  v17 = (CLLocationManager *)v13;
  sub_18F5D5CC0(v11, "kCLConnectionMessageMicroLocationExportDatabaseTables", 0, 0, (uint64_t)buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)exportMicroLocationDataForMigrationWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  _QWORD *internal;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v16[32];
  CLLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2082;
    *(_QWORD *)&v16[12] = "activity";
    *(_WORD *)&v16[20] = 2114;
    *(_QWORD *)&v16[22] = v8;
    *(_WORD *)&v16[30] = 2050;
    v17 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v9 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to export copy of MiLo DB tables for migration\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  v11 = internal[1];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F5E33B4;
  v13[3] = &unk_1E2991220;
  v13[4] = a3;
  v12 = *(_QWORD *)(v11 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v16 = 3221225472;
  *(_QWORD *)&v16[8] = sub_18F5D4F38;
  *(_QWORD *)&v16[16] = &unk_1E2990E80;
  *(_QWORD *)&v16[24] = v12;
  v17 = (CLLocationManager *)v13;
  sub_18F5D5CC0(v11, "kCLConnectionMessageMicroLocationExportDataForMigration", 0, 0, (uint64_t)buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)requestMicroLocationStaticSourcesStatisticsWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  _QWORD *internal;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v16[32];
  CLLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2082;
    *(_QWORD *)&v16[12] = "activity";
    *(_WORD *)&v16[20] = 2114;
    *(_QWORD *)&v16[22] = v8;
    *(_WORD *)&v16[30] = 2050;
    v17 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v9 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v16 = 2082;
    *(_QWORD *)&v16[2] = "";
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to get per anchor per cluster measured value statistics\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  v11 = internal[1];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F5E37F4;
  v13[3] = &unk_1E2991220;
  v13[4] = a3;
  v12 = *(_QWORD *)(v11 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v16 = 3221225472;
  *(_QWORD *)&v16[8] = sub_18F5D50B8;
  *(_QWORD *)&v16[16] = &unk_1E2990E80;
  *(_QWORD *)&v16[24] = v12;
  v17 = (CLLocationManager *)v13;
  sub_18F5D5CC0(v11, "kCLConnectionMessageMicroLocationRequestStaticSourcesStatistics", 0, 0, (uint64_t)buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)requestMicroLocationLearningWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  _QWORD *internal;
  uint64_t v11;
  uint64_t v12;
  os_activity_scope_state_s v13;
  uint8_t buf[8];
  _BYTE v15[32];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v6, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v15 = 2082;
    *(_QWORD *)&v15[2] = "";
    *(_WORD *)&v15[10] = 2082;
    *(_QWORD *)&v15[12] = "activity";
    *(_WORD *)&v15[20] = 2114;
    *(_QWORD *)&v15[22] = v8;
    *(_WORD *)&v15[30] = 2050;
    v16 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v9 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v15 = 2082;
    *(_QWORD *)&v15[2] = "";
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received learning request\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  v11 = internal[1];
  v12 = *(_QWORD *)(v11 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v15 = 3221225472;
  *(_QWORD *)&v15[8] = sub_18F5D5238;
  *(_QWORD *)&v15[16] = &unk_1E2990E80;
  *(_QWORD *)&v15[24] = v12;
  v16 = a3;
  sub_18F5D5CC0(v11, "kCLConnectionMessageMicroLocationRequestLearning", 0, 0, (uint64_t)buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&v13);
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3 withCompletion:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *internal;
  uint64_t v28;
  uint64_t v29;
  id v30;
  CLLocationManager *v31;
  CLLocationManager *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  os_activity_scope_state_s state;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[2];
  uint8_t buf[8];
  _BYTE v47[32];
  CLLocationManager *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_QWORD *)buf = 68289794;
    *(_WORD *)v47 = 2082;
    *(_QWORD *)&v47[2] = "";
    *(_WORD *)&v47[10] = 2082;
    *(_QWORD *)&v47[12] = "activity";
    *(_WORD *)&v47[20] = 2114;
    *(_QWORD *)&v47[22] = v10;
    *(_WORD *)&v47[30] = 2050;
    v48 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v11 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)buf = 68289026;
    *(_WORD *)v47 = 2082;
    *(_QWORD *)&v47[2] = "";
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received localization scan request\"}", buf, 0x12u);
  }
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  v13 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v45, 2);
  v31 = (CLLocationManager *)a4;
  v32 = self;
  v14 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16 = (void *)objc_msgSend_initWithDictionary_copyItems_(v14, v15, (uint64_t)a3, 1);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v17, (uint64_t)&v38, (uint64_t)v44, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v18, (uint64_t)&v34, (uint64_t)v43, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v35;
LABEL_16:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v13);
            objc_msgSend_objectForKeyedSubscript_(v16, v18, v22, v23);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v24 == ++v26)
            {
              v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v18, (uint64_t)&v34, (uint64_t)v43, 16);
              if (v24)
                goto LABEL_16;
              goto LABEL_22;
            }
          }
        }
        else
        {
LABEL_22:
          objc_msgSend_removeObjectForKey_(v16, v18, v22, v23);
        }
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v38, (uint64_t)v44, 16);
    }
    while (v19);
  }
  internal = v32->_internal;
  objc_sync_enter(v32);
  v28 = internal[1];
  v29 = *(_QWORD *)(v28 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v47 = 3221225472;
  *(_QWORD *)&v47[8] = sub_18F5D4824;
  *(_QWORD *)&v47[16] = &unk_1E2990E80;
  *(_QWORD *)&v47[24] = v29;
  v48 = v31;
  sub_18F5D5CC0(v28, "kCLConnectionMessageRequestMicroLocation", (uint64_t)v16, 0, (uint64_t)buf);
  objc_sync_exit(v32);
  v30 = v16;
  os_activity_scope_leave(&state);
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_requestCurrentMicroLocationWithAdditionalInformation_withCompletion_, a3, 0);
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_requestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_, a3, 0);
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  NSObject *v8;
  NSString *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *internal;
  uint64_t v36;
  uint64_t v37;
  CLLocationManager *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  os_activity_scope_state_s state;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[3];
  uint8_t buf[8];
  _BYTE v53[32];
  CLLocationManager *v54;
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_QWORD *)buf = 68289794;
    *(_WORD *)v53 = 2082;
    *(_QWORD *)&v53[2] = "";
    *(_WORD *)&v53[10] = 2082;
    *(_QWORD *)&v53[12] = "activity";
    *(_WORD *)&v53[20] = 2114;
    *(_QWORD *)&v53[22] = v9;
    *(_WORD *)&v53[30] = 2050;
    v54 = self;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v10 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v53 = 2082;
    *(_QWORD *)&v53[2] = "";
    *(_WORD *)&v53[10] = 1026;
    *(_DWORD *)&v53[12] = v4;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received recording scan request\", \"forced:\":%{public}hhd}", buf, 0x18u);
  }
  if (!a3)
    a3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = (id)objc_msgSend_initWithDictionary_copyItems_(v11, v12, (uint64_t)a3, 1);
  v15 = v13;
  if (v4)
    objc_msgSend_setValue_forKey_(v13, v14, MEMORY[0x1E0C9AAB0], 0x1E2995868);
  else
    objc_msgSend_setValue_forKey_(v13, v14, MEMORY[0x1E0C9AAA0], 0x1E2995868);
  if (!objc_msgSend_objectForKey_(v15, v16, 0x1E2995888, v17))
  {
    v21 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v18, v19, v20);
    objc_msgSend_setValue_forKey_(v15, v22, v21, 0x1E2995888);
  }
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v51[2] = objc_opt_class();
  v24 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v51, 3);
  v38 = self;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v25, (uint64_t)&v44, (uint64_t)v50, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(a3);
        v30 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v40, (uint64_t)v49, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v41;
LABEL_23:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v41 != v33)
              objc_enumerationMutation(v24);
            objc_msgSend_objectForKeyedSubscript_(v15, v26, v30, v31);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v32 == ++v34)
            {
              v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v40, (uint64_t)v49, 16);
              if (v32)
                goto LABEL_23;
              goto LABEL_29;
            }
          }
        }
        else
        {
LABEL_29:
          objc_msgSend_removeObjectForKey_(v15, v26, v30, v31);
        }
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v26, (uint64_t)&v44, (uint64_t)v50, 16);
    }
    while (v27);
  }
  internal = v38->_internal;
  objc_sync_enter(v38);
  v36 = internal[1];
  v37 = *(_QWORD *)(v36 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v53 = 3221225472;
  *(_QWORD *)&v53[8] = sub_18F5D4824;
  *(_QWORD *)&v53[16] = &unk_1E2990E80;
  *(_QWORD *)&v53[24] = v37;
  v54 = 0;
  sub_18F5D5CC0(v36, "kCLConnectionMessageRequestMicroLocationRecordingScan", (uint64_t)v15, 0, (uint64_t)buf);
  objc_sync_exit(v38);
  os_activity_scope_leave(&state);
}

- (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  NSObject *v9;
  NSObject *v10;
  NSString *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  id v19;
  const char *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *internal;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  CLLocationManager *v39;
  CLLocationManager *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  os_activity_scope_state_s state;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[3];
  uint8_t buf[8];
  _BYTE v55[32];
  CLLocationManager *v56;
  uint64_t v57;

  v6 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_QWORD *)buf = 68289794;
    *(_WORD *)v55 = 2082;
    *(_QWORD *)&v55[2] = "";
    *(_WORD *)&v55[10] = 2082;
    *(_QWORD *)&v55[12] = "activity";
    *(_WORD *)&v55[20] = 2114;
    *(_QWORD *)&v55[22] = v11;
    *(_WORD *)&v55[30] = 2050;
    v56 = self;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v12 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)buf = 68289282;
    *(_WORD *)v55 = 2082;
    *(_QWORD *)&v55[2] = "";
    *(_WORD *)&v55[10] = 1026;
    *(_DWORD *)&v55[12] = v6;
    _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received recording scan request\", \"forced:\":%{public}hhd}", buf, 0x18u);
  }
  v16 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v13, v14, v15);
  if (!a3)
    a3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  v19 = (id)objc_msgSend_initWithDictionary_copyItems_(v17, v18, (uint64_t)a3, 1);
  objc_msgSend_setValue_forKey_(v19, v20, v16, 0x1E2995888);
  if (v6)
    objc_msgSend_setValue_forKey_(v19, v21, MEMORY[0x1E0C9AAB0], 0x1E2995868);
  else
    objc_msgSend_setValue_forKey_(v19, v21, MEMORY[0x1E0C9AAA0], 0x1E2995868);
  v39 = (CLLocationManager *)a5;
  v40 = self;
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v53[2] = objc_opt_class();
  v23 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v53, 3);
  v38 = (void *)v16;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v24, (uint64_t)&v46, (uint64_t)v52, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(a3);
        v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v42, (uint64_t)v51, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v43;
LABEL_21:
          v33 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v32)
              objc_enumerationMutation(v23);
            objc_msgSend_objectForKeyedSubscript_(v19, v25, v29, v30);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v31 == ++v33)
            {
              v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v42, (uint64_t)v51, 16);
              if (v31)
                goto LABEL_21;
              goto LABEL_27;
            }
          }
        }
        else
        {
LABEL_27:
          objc_msgSend_removeObjectForKey_(v19, v25, v29, v30);
        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v25, (uint64_t)&v46, (uint64_t)v52, 16);
    }
    while (v26);
  }
  internal = v40->_internal;
  objc_sync_enter(v40);
  v35 = internal[1];
  v36 = *(_QWORD *)(v35 + 232);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)v55 = 3221225472;
  *(_QWORD *)&v55[8] = sub_18F5D4824;
  *(_QWORD *)&v55[16] = &unk_1E2990E80;
  *(_QWORD *)&v55[24] = v36;
  v56 = v39;
  sub_18F5D5CC0(v35, "kCLConnectionMessageRequestMicroLocationRecordingScan", (uint64_t)v19, 0, (uint64_t)buf);
  objc_sync_exit(v40);
  os_activity_scope_leave(&state);
  return v38;
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  _QWORD *internal;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_activity_scope_state_s v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  CLLocationManager *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v24.opaque[0] = 0;
  v24.opaque[1] = 0;
  os_activity_scope_enter(v10, &v24);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v11 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2082;
    v30 = "activity";
    v31 = 2114;
    v32 = v12;
    v33 = 2050;
    v34 = self;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v13 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received truth label donation request for a recording trigger\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  v15 = internal[1];
  v19 = (const char *)objc_msgSend_UUIDString(a3, v16, v17, v18);
  v23 = objc_msgSend_UUIDString(a4, v20, v21, v22);
  sub_18F5D4980(v15, v19, v23, (uint64_t)a5);
  objc_sync_exit(self);
  os_activity_scope_leave(&v24);
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  NSString *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  NSObject *v22;
  _QWORD *internal;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  os_activity_scope_state_s v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  CLLocationManager *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v29.opaque[0] = 0;
  v29.opaque[1] = 0;
  os_activity_scope_enter(v12, &v29);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2082;
    v37 = "activity";
    v38 = 2114;
    v39 = v16;
    v40 = 2050;
    v41 = self;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (objc_msgSend_compare_(a4, v14, (uint64_t)a5, v15) == 1)
  {
    if (a6)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = CFSTR("donateTruthTagLabelForClient failed because startDate is later than endDate");
      v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)&v31, (uint64_t)&v30, 1);
      v21 = (id)objc_msgSend_initWithDomain_code_userInfo_(v17, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 5, v19);
      (*((void (**)(id, id))a6 + 2))(a6, v21);
    }
  }
  else
  {
    if (qword_1EE1720B8 != -1)
      dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
    v22 = qword_1EE1720C0;
    if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      v33 = 0;
      v34 = 2082;
      v35 = "";
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received truth label donation request between Dates\"}", buf, 0x12u);
    }
    internal = self->_internal;
    objc_sync_enter(self);
    v24 = internal[1];
    v28 = (const char *)objc_msgSend_UUIDString(a3, v25, v26, v27);
    sub_18F5D4B90(v24, v28, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&v29);
}

- (void)startTranscriptSessionInstantlyWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D0868(internal[1], (const char *)1, 0, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)startTranscriptSessionWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D0868(internal[1], (const char *)1, 1, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)endTranscriptSessionWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D0868(internal[1], 0, 0, (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)fetchTranscriptLocationsWithRadius:(double)a3 sampleCount:(int)a4 center:(CLLocationCoordinate2D)a5 completionHandler:(id)a6
{
  double longitude;
  double latitude;
  const char *v9;
  NSObject *v13;
  NSObject *v14;
  NSString *v15;
  _QWORD *internal;
  uint64_t v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  CLLocationManager *v28;
  uint64_t v29;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v9 = *(const char **)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v13 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v13, &v18);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v14 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    v25 = 2114;
    v26 = v15;
    v27 = 2050;
    v28 = self;
    _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D09D4(internal[1], v9, (uint64_t)a6, v17, a3, latitude, longitude);
  objc_sync_exit(self);
  os_activity_scope_leave(&v18);
}

- (void)requestHistoricalLocationsWithPurposeKey:(NSString *)purposeKey sampleCount:(NSInteger)sampleCount completionHandler:(void *)handler
{
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSString *v14;
  _QWORD *internal;
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
  CLLocationManager *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v10, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v11 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = "activity";
    v23 = 2114;
    v24 = v14;
    v25 = 2050;
    v26 = self;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v12, 0x40000, v13);
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D0E14(internal[1], (const char *)purposeKey, sampleCount, (uint64_t)handler);
  objc_sync_exit(self);
  os_activity_scope_leave(&v16);
}

- (void)willPromptForTranscriptSessionWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D11F4(internal[1], (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

- (void)isConsideredInRemoteAreaWithCompletion:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  _QWORD *internal;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v6, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v8;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D14FC(internal[1], (uint64_t)a3);
  objc_sync_exit(self);
  os_activity_scope_leave(&v10);
}

+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8
{
  id v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setValue_forKey_(v14, v15, (uint64_t)a3, 0x1E2995788);
  objc_msgSend_setValue_forKey_(v14, v16, (uint64_t)a4, 0x1E29957A8);
  objc_msgSend_setValue_forKey_(v14, v17, (uint64_t)a5, 0x1E29957C8);
  objc_msgSend_setValue_forKey_(v14, v18, (uint64_t)a6, 0x1E29957E8);
  objc_msgSend_setValue_forKey_(v14, v19, (uint64_t)a7, 0x1E2995808);
  objc_msgSend_setValue_forKey_(v14, v20, (uint64_t)a8, 0x1E2995828);
  return v14;
}

+ (id)metadataForMicroLocationTruthTagEventWithTagUUID:(id)a3
{
  id v4;
  const char *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setValue_forKey_(v4, v5, (uint64_t)a3, 0x1E2995848);
  return v4;
}

- (void)purgeMicroLocationSemiSupervisedData
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  _QWORD *internal;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to purge semi-supervised models\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D5394(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v9);
}

- (void)purgeMicroLocationData
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  _QWORD *internal;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (qword_1EE1720B8 != -1)
    dispatch_once(&qword_1EE1720B8, &unk_1E2991368);
  v7 = qword_1EE1720C0;
  if (os_log_type_enabled((os_log_t)qword_1EE1720C0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"received request to purge MicroLocation data\"}", buf, 0x12u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D53F4(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v9);
}

- (void)resetApps
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  CLLocationManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v4, &v11);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = v6;
    v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = objc_sync_enter(self);
  sub_18F6DFDC4(v7, v8, v9, v10);
  objc_sync_exit(self);
  os_activity_scope_leave(&v11);
}

- (id)appsUsingLocation
{
  return 0;
}

+ (id)activeLocationClientsWithInfo
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = a1;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (id)CLCopyActiveClientsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

- (id)appsUsingLocationWithDetails
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (id)CLCopyAppsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

+ (id)userLocationClientsWithInfo
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = a1;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (id)CLCopyAppsUsingLocation();
  os_activity_scope_leave(&v9);
  return v7;
}

- (id)appLocationInfo
{
  return CLClientGetClientDictionary(*((_QWORD *)self->_internal + 1));
}

+ (id)_archivedAuthorizationDecisionsWithError:(id *)a3
{
  return (id)CLGetArchivedAuthorizationDecisions((uint64_t)a3);
}

+ (id)_applyArchivedAuthorizationDecisions:(id)a3
{
  return (id)CLApplyArchivedAuthorizationDecisions((uint64_t)a3);
}

- (id)technologiesInUse
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v4, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v6;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = (id)CLCopyTechnologiesInUse();
  v11 = (void *)objc_msgSend_setWithArray_(v7, v9, (uint64_t)v8, v10);
  os_activity_scope_leave(&v13);
  return v11;
}

- (id)_zAxisStatistics
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id v7;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v6;
    v18 = 2050;
    v19 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v7 = (id)CLCopyZaxisStats();
  os_activity_scope_leave(&v9);
  return v7;
}

- (void)addIdentifiableClient:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  os_activity_scope_state_s state;
  id location;
  uint8_t buf[8];
  _BYTE v27[30];
  __int16 v28;
  CLLocationManager *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v27 = 2082;
    *(_QWORD *)&v27[2] = "";
    *(_WORD *)&v27[10] = 2082;
    *(_QWORD *)&v27[12] = "activity";
    *(_WORD *)&v27[20] = 2114;
    *(_QWORD *)&v27[22] = v8;
    v28 = 2050;
    v29 = self;
    v30 = 2050;
    v31 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"client\":\"%{public}p\"}", buf, 0x3Au);
  }
  if (a3)
  {
    internal = (void **)self->_internal;
    objc_initWeak(&location, a3);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)v27 = 3221225472;
    *(_QWORD *)&v27[8] = sub_18F5D9B58;
    *(_QWORD *)&v27[16] = &unk_1E2991190;
    objc_copyWeak((id *)&v27[24], &location);
    v10 = _Block_copy(buf);
    objc_destroyWeak((id *)&v27[24]);
    objc_destroyWeak(&location);
    objc_sync_enter(self);
    objc_msgSend_addObject_(internal[35], v11, (uint64_t)v10, v12);
    objc_sync_exit(self);
    objc_msgSend_setWeakClient_(a3, v13, (uint64_t)v10, v14);
    v18 = objc_msgSend_clientKeyForIdentityValidation(internal, v15, v16, v17);
    v22 = objc_msgSend_monitorLedgerAccessKey(internal, v19, v20, v21);
    objc_msgSend_updateIdentityToken_withStorageToken_(a3, v23, v18, v22);
  }
  os_activity_scope_leave(&state);
}

- (void)removeIdentifiableClient:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *internal;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  os_activity_scope_state_s v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  CLLocationManager *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v26.opaque[0] = 0;
  v26.opaque[1] = 0;
  os_activity_scope_enter(v6, &v26);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    v15 = objc_msgSend_weakClient(a3, v12, v13, v14);
    *(_DWORD *)buf = 68290306;
    v28 = 0;
    v29 = 2082;
    v30 = "";
    v31 = 2082;
    v32 = "activity";
    v33 = 2114;
    v34 = v11;
    v35 = 2050;
    v36 = self;
    v37 = 2050;
    v38 = a3;
    v39 = 2050;
    v40 = v15;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"client\":\"%{public}p\", \"weakClient\":\"%{public}p\"}", buf, 0x44u);
  }
  if (a3 && objc_msgSend_weakClient(a3, v8, v9, v10))
  {
    internal = self->_internal;
    objc_sync_enter(self);
    v17 = (void *)internal[35];
    v21 = objc_msgSend_weakClient(a3, v18, v19, v20);
    objc_msgSend_removeObject_(v17, v22, v21, v23);
    objc_msgSend_setWeakClient_(a3, v24, 0, v25);
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&v26);
}

- (NSString)processName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, v2, v3);
  return (NSString *)objc_msgSend_processName(v4, v5, v6, v7);
}

- (void)onLocationRequestTimeout
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char *internal;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  CLLocation *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  NSObject *v36;
  const char *v37;
  os_activity_scope_state_s v38;
  _BYTE buf[48];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[2];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v38.opaque[0] = 0;
  v38.opaque[1] = 0;
  os_activity_scope_enter(v4, &v38);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v9;
    *(_WORD *)&buf[38] = 2050;
    *(_QWORD *)&buf[40] = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = (char *)self->_internal;
  v11 = (void *)objc_msgSend_delegate(internal, v6, v7, v8);
  objc_sync_enter(self);
  if (objc_msgSend_requestingLocation(*((void **)internal + 4), v12, v13, v14))
  {
    objc_msgSend_cancelLocationRequest(internal, v15, v16, v17);
    CLClientStopLocationUpdates_0(*((_QWORD *)internal + 1));
    if (*(double *)(internal + 60) >= 0.0)
    {
      v23 = [CLLocation alloc];
      v24 = internal + 40;
      v25 = *(_OWORD *)(internal + 152);
      v43 = *(_OWORD *)(internal + 136);
      v44 = v25;
      v45[0] = *(_OWORD *)(internal + 168);
      *(_OWORD *)((char *)v45 + 12) = *(_OWORD *)(internal + 180);
      v26 = *(_OWORD *)(internal + 88);
      *(_OWORD *)&buf[32] = *(_OWORD *)(internal + 72);
      v40 = v26;
      v27 = *(_OWORD *)(internal + 120);
      v41 = *(_OWORD *)(internal + 104);
      v42 = v27;
      v28 = *(_OWORD *)(internal + 56);
      *(_OWORD *)buf = *(_OWORD *)(internal + 40);
      *(_OWORD *)&buf[16] = v28;
      v31 = (void *)objc_msgSend_initWithClientLocation_(v23, v29, (uint64_t)buf, v30);
      v34 = objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v32, (uint64_t)v31, v33);
      entr_act_modify();
      v35 = NSStringFromSelector(sel_locationManager_didUpdateLocations_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v36 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v11;
        *(_WORD *)&buf[38] = 2114;
        *(_QWORD *)&buf[40] = v35;
        LOWORD(v40) = 1040;
        *(_DWORD *)((char *)&v40 + 2) = 156;
        WORD3(v40) = 2097;
        *((_QWORD *)&v40 + 1) = v24;
        _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - request timeout\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"location\":%{private, location:CLClientLocation}.*P}", buf, 0x40u);
      }
      objc_msgSend_locationManager_didUpdateLocations_(v11, v37, (uint64_t)self, v34);

    }
    else
    {
      v18 = NSStringFromSelector(sel_locationManager_didFailWithError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v19 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = self;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v11;
        *(_WORD *)&buf[38] = 2114;
        *(_QWORD *)&buf[40] = v18;
        _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - request timeout\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
      }
      v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("kCLErrorDomain"), 0, 0);
      objc_msgSend_locationManager_didFailWithError_(v11, v22, (uint64_t)self, v21);
    }
  }
  objc_sync_exit(self);
  os_activity_scope_leave(&v38);
}

- (void)onClientEventLocationUnavailable:(id)a3
{
  uint64_t v3;
  void **internal;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  CLLocationManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  internal = (void **)self->_internal;
  v6 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_requestingLocation(internal[4], v7, v8, v9) & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = NSStringFromSelector(sel_locationManager_didFailWithError_);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v11 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 68289794;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2050;
      v19 = self;
      v20 = 2050;
      v21 = v6;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate - location unavailable\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)v15, 0x30u);
    }
    v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("kCLErrorDomain"), 0, 0);
    objc_msgSend_locationManager_didFailWithError_(v6, v14, (uint64_t)self, v13);
  }
}

- (void)onClientEventHeadingCalibration:(id)a3
{
  uint64_t v3;
  uint64_t *internal;
  void *v6;
  NSString *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  char *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CLLocationManager *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  internal = (uint64_t *)self->_internal;
  v6 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  objc_sync_enter(self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = NSStringFromSelector(sel_locationManagerShouldDisplayHeadingCalibration_);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v8 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289794;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2050;
      v20 = self;
      v21 = 2050;
      v22 = v6;
      v23 = 2114;
      v24 = v7;
      _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", buf, 0x30u);
    }
    if (objc_msgSend_locationManagerShouldDisplayHeadingCalibration_(v6, v9, (uint64_t)self, v10))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v11 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "CL: Invoking Compass Calibration HUD", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v13 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventHeadingCalibration:]", "CoreLocation: %s\n", v13);
        if (v13 != (char *)buf)
          free(v13);
      }
      if (!CLClientShowHeadingCalibration(internal[1], 1))
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v12 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEBUG, "Could not show heading calibration", buf, 2u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v14 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventHeadingCalibration:]", "CoreLocation: %s\n", v14);
          if (v14 != (char *)buf)
            free(v14);
        }
      }
    }
  }
  objc_sync_exit(self);
}

- (void)onClientEventPlaceInferenceResult:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *internal;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CLGeocoder *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  _QWORD v24[7];
  __int16 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "in onClientEventPlaceInferenceResult for CLPlaceInferenceSubscription", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v25 = 0;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventPlaceInferenceResult:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf)
      free(v23);
  }
  internal = self->_internal;
  v9 = objc_msgSend_objectForKey_(a3, v6, (uint64_t)CFSTR("kCLConnectionMessagePlaceInferencePlaceInferenceKey"), v7);
  if (v9)
  {
    objc_msgSend_callPlaceInferenceHandlerWithResult_error_(self, v10, v9, 0);
  }
  else
  {
    v12 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("kCLConnectionMessagePlaceInferencePlaceInferenceFallbackLocationKey"), v11);
    if (v12)
    {
      v13 = v12;
      v14 = objc_alloc_init(CLGeocoder);
      objc_msgSend__setResponseSilo_(v14, v15, internal[36], v16);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = sub_18F5E7C0C;
      v24[3] = &unk_1E2991248;
      v24[4] = v14;
      v24[5] = self;
      v24[6] = v13;
      objc_msgSend_reverseGeocodeLocation_completionHandler_(v14, v17, v13, (uint64_t)v24);
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Got a place inference result without a result!?\"}", buf, 0x12u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v19 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got a place inference result without a result!?", "{\"msg%{public}.0s\":\"Got a place inference result without a result!?\"}", buf, 0x12u);
      }
      v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 5, 0);
      objc_msgSend_callPlaceInferenceHandlerWithResult_error_(self, v22, 0, v21);
    }
  }
}

- (void)onClientEventPlaceInferenceError:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  char *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "in onClientEventPlaceInferenceError for CLPlaceInferenceSubscription", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventPlaceInferenceError:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  v9 = objc_msgSend_objectForKey_(a3, v6, (uint64_t)CFSTR("kCLConnectionMessageError"), v7);
  if (!v9)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Got a place inference error without an error!?\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v11 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got a place inference error without an error!?", "{\"msg%{public}.0s\":\"Got a place inference error without an error!?\"}", buf, 0x12u);
    }
    v9 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 5, 0);
  }
  objc_msgSend_callPlaceInferenceHandlerWithResult_error_(self, v8, 0, v9);
}

- (void)callPlaceInferenceHandlerWithResult:(id)a3 error:(id)a4
{
  id *internal;
  void (**v8)(id, id, id);
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  internal = (id *)self->_internal;
  objc_sync_enter(self);
  v8 = (void (**)(id, id, id))internal[31];
  internal[31] = 0;
  objc_sync_exit(self);
  if (v8)
  {
    v8[2](v8, a3, a4);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v9 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289026;
      v10[1] = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Got place inference result without a handler block\"}", (uint8_t *)v10, 0x12u);
    }
  }
}

- (void)onClientEventError:(id)a3
{
  uint64_t v3;
  id internal;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSString *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  CLLocationManager *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v26 = 0;
  v25 = 0;
  if (CLClientGetError(a3, (uint64_t)&v25, v8, v9))
  {
    if ((_DWORD)v25 == 1)
    {
      if (dyld_program_sdk_at_least()
        && objc_msgSend_requestingLocation(*((void **)internal + 4), v10, v11, v12))
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v13 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location access was denied; bailing early cancelling requestLocation\"}",
            buf,
            0x12u);
        }
        objc_msgSend_cancelLocationRequest(internal, v14, v15, v16);
        CLClientStopLocationUpdates_0(*((_QWORD *)internal + 1));
      }
      else
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v19 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289026;
          v28 = 0;
          v29 = 2082;
          v30 = "";
          _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Location access was denied; but not bailing early\"}",
            buf,
            0x12u);
        }
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, (uint64_t)CFSTR("kCLErrorDomain"), (int)v25, 0);
      v22 = NSStringFromSelector(sel_locationManager_didFailWithError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v23 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        v29 = 2082;
        v28 = 0;
        v30 = "";
        v31 = 2050;
        v32 = self;
        v33 = 2050;
        v34 = v7;
        v35 = 2114;
        v36 = v22;
        v37 = 2114;
        v38 = v21;
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didFailWithError_(v7, v24, (uint64_t)self, v21);
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_FAULT, "could not get error", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventError:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
  }
}

- (void)onClientEventRegion:(id)a3
{
  uint64_t v3;
  _QWORD *internal;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  NSString *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  NSString *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  NSString *v73;
  NSObject *v74;
  const char *v75;
  char v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  NSString *v94;
  NSObject *v95;
  const char *v96;
  NSObject *v97;
  NSObject *v98;
  char v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  _BYTE *v116;
  NSString *v117;
  NSObject *v118;
  const char *v119;
  int v120;
  id v121;
  uint8_t buf[4];
  int v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  CLLocationManager *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  NSString *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  uint64_t v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v121 = 0;
  v120 = 0;
  if (sub_18F5D2A30((CFDictionaryRef)a3, &v121, &v120))
  {
    v8 = v121;
    if (v121)
    {
      v9 = v121;
      if (v120 == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v37 = internal[1];
          v38 = (void *)objc_msgSend_identifier(v8, v34, v35, v36);
          v42 = (_BYTE *)objc_msgSend_UTF8String(v38, v39, v40, v41);
          v46 = (void *)objc_msgSend_onBehalfOfBundleId(v8, v43, v44, v45);
          v50 = (_BYTE *)objc_msgSend_UTF8String(v46, v47, v48, v49);
          sub_18F5D56A0(v37, 4, 720896, 1, v42, v50);
          v51 = NSStringFromSelector(sel_locationManager_didExit_completion_);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v52 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290051;
            v123 = 0;
            v124 = 2082;
            v125 = "";
            v126 = 2050;
            v127 = self;
            v128 = 2050;
            v129 = v7;
            v130 = 2114;
            v131 = v51;
            v132 = 2113;
            v133 = v8;
            _os_log_impl(&dword_18F5B3000, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend_locationManager_didExit_completion_(v7, v53, (uint64_t)self, (uint64_t)v8, &unk_1E2991268);
        }
        else
        {
          v76 = objc_opt_respondsToSelector();
          v77 = internal[1];
          v81 = (void *)objc_msgSend_identifier(v8, v78, v79, v80);
          v85 = (_BYTE *)objc_msgSend_UTF8String(v81, v82, v83, v84);
          v89 = (void *)objc_msgSend_onBehalfOfBundleId(v8, v86, v87, v88);
          v93 = (_BYTE *)objc_msgSend_UTF8String(v89, v90, v91, v92);
          if ((v76 & 1) != 0)
          {
            sub_18F5D56A0(v77, 4, 720896, 1, v85, v93);
            v94 = NSStringFromSelector(sel_locationManager_didExitRegion_);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            v95 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68290051;
              v123 = 0;
              v124 = 2082;
              v125 = "";
              v126 = 2050;
              v127 = self;
              v128 = 2050;
              v129 = v7;
              v130 = 2114;
              v131 = v94;
              v132 = 2113;
              v133 = v8;
              _os_log_impl(&dword_18F5B3000, v95, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
            }
            objc_msgSend_locationManager_didExitRegion_(v7, v96, (uint64_t)self, (uint64_t)v8);
          }
          else
          {
            sub_18F5D56A0(v77, 4, 720896, 0, v85, v93);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            v98 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v123 = 0;
              v124 = 2082;
              v125 = "";
              v126 = 2050;
              v127 = self;
              _os_log_impl(&dword_18F5B3000, v98, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring event, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
            }
          }
        }
        v54 = 2;
      }
      else if (v120)
      {
        v54 = 0;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = internal[1];
          v14 = (void *)objc_msgSend_identifier(v8, v10, v11, v12);
          v18 = (_BYTE *)objc_msgSend_UTF8String(v14, v15, v16, v17);
          v22 = (void *)objc_msgSend_onBehalfOfBundleId(v8, v19, v20, v21);
          v26 = (_BYTE *)objc_msgSend_UTF8String(v22, v23, v24, v25);
          sub_18F5D56A0(v13, 4, 655360, 1, v18, v26);
          v27 = NSStringFromSelector(sel_locationManager_didEnter_completion_);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v28 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290051;
            v123 = 0;
            v124 = 2082;
            v125 = "";
            v126 = 2050;
            v127 = self;
            v128 = 2050;
            v129 = v7;
            v130 = 2114;
            v131 = v27;
            v132 = 2113;
            v133 = v8;
            _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
          }
          objc_msgSend_locationManager_didEnter_completion_(v7, v29, (uint64_t)self, (uint64_t)v8, &unk_1E2991268);
        }
        else
        {
          v55 = objc_opt_respondsToSelector();
          v56 = internal[1];
          v60 = (void *)objc_msgSend_identifier(v8, v57, v58, v59);
          v64 = (_BYTE *)objc_msgSend_UTF8String(v60, v61, v62, v63);
          v68 = (void *)objc_msgSend_onBehalfOfBundleId(v8, v65, v66, v67);
          v72 = (_BYTE *)objc_msgSend_UTF8String(v68, v69, v70, v71);
          if ((v55 & 1) != 0)
          {
            sub_18F5D56A0(v56, 4, 655360, 1, v64, v72);
            v73 = NSStringFromSelector(sel_locationManager_didEnterRegion_);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            v74 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68290051;
              v123 = 0;
              v124 = 2082;
              v125 = "";
              v126 = 2050;
              v127 = self;
              v128 = 2050;
              v129 = v7;
              v130 = 2114;
              v131 = v73;
              v132 = 2113;
              v133 = v8;
              _os_log_impl(&dword_18F5B3000, v74, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
            }
            objc_msgSend_locationManager_didEnterRegion_(v7, v75, (uint64_t)self, (uint64_t)v8);
          }
          else
          {
            sub_18F5D56A0(v56, 4, 655360, 0, v64, v72);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
            v97 = qword_1ECD8E750;
            if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v123 = 0;
              v124 = 2082;
              v125 = "";
              v126 = 2050;
              v127 = self;
              _os_log_impl(&dword_18F5B3000, v97, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring event, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
            }
          }
        }
        v54 = 1;
      }
      v99 = objc_opt_respondsToSelector();
      v100 = internal[1];
      v104 = (void *)objc_msgSend_identifier(v8, v101, v102, v103);
      v108 = (_BYTE *)objc_msgSend_UTF8String(v104, v105, v106, v107);
      v112 = (void *)objc_msgSend_onBehalfOfBundleId(v8, v109, v110, v111);
      v116 = (_BYTE *)objc_msgSend_UTF8String(v112, v113, v114, v115);
      if ((v99 & 1) != 0)
      {
        sub_18F5D56A0(v100, 4, 720896, 1, v108, v116);
        v117 = NSStringFromSelector(sel_locationManager_didDetermineState_forRegion_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v118 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68290307;
          v123 = 0;
          v124 = 2082;
          v125 = "";
          v126 = 2050;
          v127 = self;
          v128 = 2050;
          v129 = v7;
          v130 = 2114;
          v131 = v117;
          v132 = 2113;
          v133 = v8;
          v134 = 2050;
          v135 = v54;
          _os_log_impl(&dword_18F5B3000, v118, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"state\":%{public, location:CLRegionState}lld}", buf, 0x44u);
        }
        objc_msgSend_locationManager_didDetermineState_forRegion_(v7, v119, (uint64_t)self, v54, v8);
      }
      else
      {
        sub_18F5D56A0(v100, 4, 720896, 0, v108, v116);
      }

    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v32 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        v123 = 0;
        v124 = 2082;
        v125 = "";
        _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegion, unable to fetch region\"}", buf, 0x12u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v33 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289026;
        v123 = 0;
        v124 = 2082;
        v125 = "";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegion, unable to fetch region", "{\"msg%{public}.0s\":\"Fence: onClientEventRegion, unable to fetch region\"}", buf, 0x12u);
      }
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v30 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegion:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)buf)
        free(v31);
    }
  }
}

- (void)onClientEventRegionState:(id)a3
{
  uint64_t v3;
  _QWORD *internal;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  NSObject *v33;
  unsigned int v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  NSString *v52;
  NSObject *v53;
  const char *v54;
  unsigned int v55;
  id v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  NSString *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v56 = 0;
  v55 = 0;
  if (sub_18F5D2AC4((CFDictionaryRef)a3, &v56, &v55))
  {
    v8 = v56;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v19 = internal[1];
      v20 = (void *)objc_msgSend_identifier(v56, v9, v10, v11);
      v24 = (_BYTE *)objc_msgSend_UTF8String(v20, v21, v22, v23);
      v28 = (void *)objc_msgSend_onBehalfOfBundleId(v56, v25, v26, v27);
      v32 = (_BYTE *)objc_msgSend_UTF8String(v28, v29, v30, v31);
      sub_18F5D56A0(v19, 4, 720896, 0, v24, v32);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v33 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v58 = 0;
        v59 = 2082;
        v60 = "";
        v61 = 2050;
        v62 = (unint64_t)self;
        _os_log_impl(&dword_18F5B3000, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring state request, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
      goto LABEL_37;
    }
    v12 = sub_18F5E96A4();
    if (v12 < 4)
    {
      v16 = v55;
      if (v55 != 1)
      {
        if (v55 == 2)
        {
          v16 = 2;
        }
        else
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
          v37 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289282;
            v58 = 0;
            v59 = 2082;
            v60 = "";
            v61 = 2050;
            v62 = v55;
            _os_log_impl(&dword_18F5B3000, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Fence: onClientEventRegionState, unknown state\", \"regionState\":%{public, location:CLClientRegionState}lld}", buf, 0x1Cu);
          }
          v16 = 0;
        }
      }
      v38 = internal[1];
      v39 = (void *)objc_msgSend_identifier(v56, v13, v14, v15);
      v43 = (_BYTE *)objc_msgSend_UTF8String(v39, v40, v41, v42);
      v47 = (void *)objc_msgSend_onBehalfOfBundleId(v56, v44, v45, v46);
      v51 = (_BYTE *)objc_msgSend_UTF8String(v47, v48, v49, v50);
      sub_18F5D56A0(v38, 4, 720896, 1, v43, v51);
      v52 = NSStringFromSelector(sel_locationManager_didDetermineState_forRegion_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v53 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290307;
        v58 = 0;
        v59 = 2082;
        v60 = "";
        v61 = 2050;
        v62 = (unint64_t)self;
        v63 = 2050;
        v64 = v7;
        v65 = 2114;
        v66 = v52;
        v67 = 2113;
        v68 = v56;
        v69 = 2050;
        v70 = v16;
        _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"state\":%{public, location:CLRegionState}lld}", buf, 0x44u);
      }
      objc_msgSend_locationManager_didDetermineState_forRegion_(v7, v54, (uint64_t)self, v16, v56);
LABEL_37:

      return;
    }
    v34 = v12;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v35 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v58 = 0;
      v59 = 2082;
      v60 = "";
      v61 = 2050;
      v62 = v34;
      _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegionState, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v36 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v58 = 0;
      v59 = 2082;
      v60 = "";
      v61 = 2050;
      v62 = v34;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegionState, unknown region type", "{\"msg%{public}.0s\":\"Fence: onClientEventRegionState, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_FAULT, "could not get the region state", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionState:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
  }
}

- (void)onClientEventRegionError:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  CLLocationManager *v10;
  const char *v11;
  uint64_t v12;
  NSString *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v21 = 0;
  v20 = 0;
  v19 = 0;
  if (sub_18F5D2B64((CFDictionaryRef)a3, &v21, &v19))
  {
    v7 = v21;
    if (sub_18F5E96A4() >= 4)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v8 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2050;
        v27 = 4;
        _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Fence: onClientEventRegionError, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v9 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289282;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2050;
        v27 = 4;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Fence: onClientEventRegionError, unknown region type", "{\"msg%{public}.0s\":\"Fence: onClientEventRegionError, unknown region type\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      }
    }
    v10 = self;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("kCLErrorDomain"), (int)v19, 0);
      v13 = NSStringFromSelector(sel_locationManager_monitoringDidFailForRegion_withError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v14 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290307;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2050;
        v27 = (uint64_t)self;
        v28 = 2050;
        v29 = v6;
        v30 = 2114;
        v31 = v13;
        v32 = 2113;
        v33 = v21;
        v34 = 2114;
        v35 = v12;
        _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
      }
      objc_msgSend_locationManager_monitoringDidFailForRegion_withError_(v6, v15, (uint64_t)self, (uint64_t)v21, v12);
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v23 = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2050;
        v27 = (uint64_t)self;
        _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring failure, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
    }

  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v16 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionError:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf)
        free(v17);
    }
  }
}

- (void)onClientEventRanging:(id)a3
{
  uint64_t v3;
  id internal;
  void *v7;
  char v8;
  int v9;
  int v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSString *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  char *v44;
  NSString *v45;
  NSObject *v46;
  const char *v47;
  id v48;
  id v49;
  id v50;
  void *cf;
  id v52;
  _QWORD v53[5];
  __int16 v54;
  void *v55;
  id v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  CLLocationManager *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  NSString *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = v9;
  if ((v8 & 1) != 0 || (v9 & 1) != 0)
  {
    v55 = 0;
    v56 = 0;
    if (sub_18F5D319C((CFDictionaryRef)a3, &v56, (CFTypeRef *)&v55))
    {
      v50 = v56;
      v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
      cf = v55;
      v15 = objc_msgSend_count(v55, v12, v13, v14);
      v52 = (id)objc_msgSend_initWithCapacity_(v11, v16, v15, v17);
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = sub_18F5EA168;
      v53[3] = &unk_1E2991290;
      v53[4] = v52;
      objc_msgSend_enumerateObjectsUsingBlock_(cf, v18, (uint64_t)v53, v19);
      v20 = (void *)MEMORY[0x1E0C99D20];
      v22 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v21, (uint64_t)CFSTR("proximity"), 1);
      v24 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v23, (uint64_t)CFSTR("accuracy"), 1);
      v27 = objc_msgSend_arrayWithObjects_(v20, v25, v22, v26, v24, 0);
      objc_msgSend_sortUsingDescriptors_(v52, v28, v27, v29);
      entr_act_modify();
      v33 = objc_msgSend_beaconIdentityConstraint(v50, v30, v31, v32);
      objc_sync_enter(self);
      v37 = (void *)objc_msgSend_rangedConstraints(internal, v34, v35, v36);
      LODWORD(v22) = objc_msgSend_containsObject_(v37, v38, v33, v39);
      objc_sync_exit(self);
      if ((v10 & v22) == 1)
      {
        v40 = NSStringFromSelector(sel_locationManager_didRangeBeacons_satisfyingConstraint_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v41 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68290051;
          v58 = 0;
          v59 = 2082;
          v60 = "";
          v61 = 2050;
          v62 = self;
          v63 = 2050;
          v64 = v7;
          v65 = 2114;
          v66 = v40;
          v67 = 2113;
          v68 = v33;
          _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"constraint\":%{private, location:escape_only}@}", buf, 0x3Au);
        }
        objc_msgSend_locationManager_didRangeBeacons_satisfyingConstraint_(v7, v42, (uint64_t)self, (uint64_t)v52, v33);
      }
      else if ((v8 & 1) != 0)
      {
        v45 = NSStringFromSelector(sel_locationManager_didRangeBeacons_inRegion_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v46 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68290051;
          v58 = 0;
          v59 = 2082;
          v60 = "";
          v61 = 2050;
          v62 = self;
          v63 = 2050;
          v64 = v7;
          v65 = 2114;
          v66 = v45;
          v67 = 2113;
          v68 = (uint64_t)v50;
          _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
        }
        objc_msgSend_locationManager_didRangeBeacons_inRegion_(v7, v47, (uint64_t)self, (uint64_t)v52, v50);
      }
      v48 = v56;
      v49 = v52;
      CFRelease(cf);
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v43 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_FAULT, "could not get ranged beacons", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v54 = 0;
        v44 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRanging:]", "CoreLocation: %s\n", v44);
        if (v44 != (char *)buf)
          free(v44);
      }
    }
  }
  else
  {
    entr_act_modify();
  }
}

- (void)onClientEventRangingError:(id)a3
{
  uint64_t v3;
  void *v6;
  char v7;
  char v8;
  char v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  char *v24;
  NSString *v25;
  NSObject *v26;
  const char *v27;
  id v28;
  uint64_t v29;
  int v30;
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  CLLocationManager *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v7 = objc_opt_respondsToSelector();
  v8 = objc_opt_respondsToSelector();
  v9 = v8;
  if ((v7 & 1) != 0 || (v8 & 1) != 0)
  {
    v31 = 0;
    v30 = 0;
    v29 = 0;
    if (sub_18F5D3284((CFDictionaryRef)a3, &v31, &v29))
    {
      v10 = v31;
      v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("kCLErrorDomain"), (int)v29, 0);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2050;
        v37 = self;
        v38 = 2050;
        v39 = v6;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering range error to client's delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", buf, 0x26u);
      }
      v14 = v31;
      v15 = v31;
      if ((v9 & 1) != 0)
      {
        v19 = objc_msgSend_beaconIdentityConstraint(v14, v16, v17, v18);
        v20 = NSStringFromSelector(sel_locationManager_didFailRangingBeaconsForConstraint_error_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v21 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68290307;
          v33 = 0;
          v34 = 2082;
          v35 = "";
          v36 = 2050;
          v37 = self;
          v38 = 2050;
          v39 = v6;
          v40 = 2114;
          v41 = v20;
          v42 = 2113;
          v43 = v19;
          v44 = 2114;
          v45 = v12;
          _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"constraint\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
        }
        objc_msgSend_locationManager_didFailRangingBeaconsForConstraint_error_(v6, v22, (uint64_t)self, v19, v12);
      }
      else
      {
        v25 = NSStringFromSelector(sel_locationManager_rangingBeaconsDidFailForRegion_withError_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v26 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68290307;
          v33 = 0;
          v34 = 2082;
          v35 = "";
          v36 = 2050;
          v37 = self;
          v38 = 2050;
          v39 = v6;
          v40 = 2114;
          v41 = v25;
          v42 = 2113;
          v43 = (uint64_t)v14;
          v44 = 2114;
          v45 = v12;
          _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
        }
        objc_msgSend_locationManager_rangingBeaconsDidFailForRegion_withError_(v6, v27, (uint64_t)self, (uint64_t)v14, v12);
      }
      v28 = v31;
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v23 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_FAULT, "could not get ranging error", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRangingError:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf)
          free(v24);
      }
    }
  }
}

- (void)onClientEventRegionResponseDelayed:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  id v8;
  CLLocationManager *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  uint64_t v16;
  NSString *v17;
  NSObject *v18;
  const char *v19;
  char v20;
  id v21;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  CLLocationManager *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v21 = 0;
  v22 = 0;
  v20 = 0;
  if (sub_18F5D2C08((CFDictionaryRef)a3, &v22, &v20, &v21))
  {
    v7 = v22;
    v8 = v21;
    v9 = self;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v20)
      {
        v11 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v10, (uint64_t)v21, (uint64_t)CFSTR("kCLErrorUserInfoAlternateRegionKey"));
        v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("kCLErrorDomain"), 7, v11);
      }
      else
      {
        v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, (uint64_t)CFSTR("kCLErrorDomain"), 7, 0);
      }
      v16 = v13;
      v17 = NSStringFromSelector(sel_locationManager_monitoringDidFailForRegion_withError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290307;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        v27 = 2050;
        v28 = self;
        v29 = 2050;
        v30 = v6;
        v31 = 2114;
        v32 = v17;
        v33 = 2113;
        v34 = v22;
        v35 = 2114;
        v36 = v16;
        _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x44u);
      }
      objc_msgSend_locationManager_monitoringDidFailForRegion_withError_(v6, v19, (uint64_t)self, (uint64_t)v22, v16);
    }

  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionResponseDelayed:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
  }
}

- (void)onClientEventNoLocationWatchdog:(id)a3
{
  uint64_t v3;
  void *v6;
  double v7;
  NSString *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  double v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CLLocationManager *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v15 = 0.0;
  if (sub_18F5D2CFC((CFDictionaryRef)a3, &v15))
  {
    v7 = v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = NSStringFromSelector(sel_locationManager_didNotReceiveLocationUpdatesForRegionMonitoringInInterval_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v9 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2050;
        v21 = self;
        v22 = 2050;
        v23 = v6;
        v24 = 2114;
        v25 = v8;
        v26 = 2050;
        v27 = v7;
        _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"duration_s\":\"%{public}.09f\"}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didNotReceiveLocationUpdatesForRegionMonitoringInInterval_(v6, v10, (uint64_t)self, v11, v7);
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v14 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2050;
        v21 = self;
        _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Delivering region monitoring watchdog, no delegate\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_FAULT, "could not get updated paused state", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventNoLocationWatchdog:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
  }
}

- (void)onClientEventRegionSetupCompleted:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v16 = 0;
  if (CLClientPopulateRegionFromInfo(&v16, (const __CFDictionary *)a3))
  {
    v7 = v16;
    v8 = v16;
    if (sub_18F5E96A4() >= 4)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v14 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2050;
        v22 = 4;
        _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Client region type is not supported.\n\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v15 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289282;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2050;
        v22 = 4;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Client region type is not supported.\n", "{\"msg%{public}.0s\":\"Client region type is not supported.\n\", \"regionType\":%{public, location:CLClientRegionType}lld}", buf, 0x1Cu);
      }
    }
    else if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = NSStringFromSelector(sel_locationManager_didStartMonitoringForRegion_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v10 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290051;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2050;
        v22 = (uint64_t)self;
        v23 = 2050;
        v24 = v6;
        v25 = 2114;
        v26 = v9;
        v27 = 2113;
        v28 = v7;
        _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"region\":%{private, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didStartMonitoringForRegion_(v6, v11, (uint64_t)self, (uint64_t)v7);
    }

  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_FAULT, "could not get region monitoring event", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventRegionSetupCompleted:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf)
        free(v13);
    }
  }
}

- (void)pauseLocationUpdates:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void **internal;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  _DWORD v22[2];
  __int16 v23;
  const char *v24;
  __int16 v25;
  CLLocationManager *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  internal = (void **)self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, a3, v3);
  objc_sync_enter(self);
  if (objc_msgSend_updatingLocation(internal[4], v8, v9, v10))
  {
    if (objc_msgSend_pausesLocationUpdatesAutomatically(internal[4], v11, v12, v13) > 4 || v4)
    {
      objc_msgSend_stopUpdatingLocationAutoPaused(internal, v14, v15, v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        entr_act_modify();
        v18 = NSStringFromSelector(sel_locationManagerDidPauseLocationUpdates_);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
        v19 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          v22[0] = 68289794;
          v22[1] = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2050;
          v26 = self;
          v27 = 2050;
          v28 = v7;
          v29 = 2114;
          v30 = v18;
          _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@}", (uint8_t *)v22, 0x30u);
        }
        objc_msgSend_locationManagerDidPauseLocationUpdates_(v7, v20, (uint64_t)self, v21);
      }
      else
      {
        entr_act_modify();
      }
    }
  }
  objc_sync_exit(self);
}

- (void)onDidEnterBackground:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290051;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v8;
    v18 = 2050;
    v19 = self;
    v20 = 2113;
    v21 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"notification\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  os_activity_scope_leave(&v9);
}

- (void)onClientEventAutopauseStatus:(id)a3
{
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v9 = 0;
  if (sub_18F5D3BF0((CFDictionaryRef)a3, (_BYTE *)&v9 + 1, &v9))
  {
    if (HIBYTE(v9))
      objc_msgSend_pauseLocationUpdates_(self, v5, (_BYTE)v9 != 0, v6);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "could not get updated paused state", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventAutopauseStatus:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
  objc_sync_exit(self);
}

- (void)onClientEventBatch:(id)a3
{
  uint64_t v3;
  id internal;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  NSString *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  char *v34;
  BOOL v35;
  uint64_t v36;
  int v37;
  int v38;
  const char *v39;
  uint8_t buf[4];
  _BYTE v41[14];
  __int16 v42;
  CLLocationManager *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  v37 = 0;
  v36 = 0;
  v35 = 0;
  if (sub_18F5D42C4(*((_QWORD *)internal + 1), (const __CFDictionary *)a3, &v35, &v36))
  {
    if (v35)
      v9 = 0;
    else
      v9 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, (uint64_t)CFSTR("kCLErrorDomain"), (int)v36, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      entr_act_modify();
      v12 = NSStringFromSelector(sel_locationManager_didFinishDeferredUpdatesWithError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        *(_WORD *)&v41[4] = 2082;
        *(_DWORD *)v41 = 0;
        *(_QWORD *)&v41[6] = "";
        v42 = 2050;
        v43 = self;
        v44 = 2050;
        v45 = v7;
        v46 = 2114;
        v47 = v12;
        v48 = 2114;
        v49 = v9;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didFinishDeferredUpdatesWithError_(v7, v14, (uint64_t)self, (uint64_t)v9);
    }
    else
    {
      entr_act_modify();
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
      {
        v19 = (void *)objc_msgSend_description(v9, v16, v17, v18);
        v23 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22);
      }
      else
      {
        v23 = "success";
      }
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v41 = v23;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "Finished deferred updates: %s", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      if (v9)
      {
        v29 = (void *)objc_msgSend_description(v9, v26, v27, v28);
        v33 = (const char *)objc_msgSend_UTF8String(v29, v30, v31, v32);
      }
      else
      {
        v33 = "success";
      }
      v38 = 136315138;
      v39 = v33;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager onClientEventBatch:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf)
        free(v34);
    }
    objc_msgSend_setBatchingLocation_(*((void **)internal + 4), v24, 0, v25);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "could not get batch result", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      LOWORD(v38) = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventBatch:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
}

- (void)onClientEventInterrupted:(id)a3
{
  uint64_t v3;
  id internal;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  CLLocationManager *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  v6 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  objc_sync_enter(self);
  if (objc_msgSend_batchingLocation(*((void **)internal + 4), v7, v8, v9))
  {
    v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, (uint64_t)CFSTR("kCLErrorDomain"), 11, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      entr_act_modify();
      v13 = NSStringFromSelector(sel_locationManager_didFinishDeferredUpdatesWithError_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v14 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        v36 = 2082;
        v35 = 0;
        v37 = "";
        v38 = 2050;
        v39 = self;
        v40 = 2050;
        v41 = v6;
        v42 = 2114;
        v43 = v13;
        v44 = 2114;
        v45 = v12;
        _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didFinishDeferredUpdatesWithError_(v6, v15, (uint64_t)self, v12);
    }
    else
    {
      entr_act_modify();
    }
    objc_msgSend_setBatchingLocation_(*((void **)internal + 4), v16, 0, v17);
  }
  if (*((_QWORD *)internal + 31))
    sub_18F5CFCD4(*((_QWORD *)internal + 1), *((_DWORD *)internal + 64));
  objc_msgSend_setClientKeyForIdentityValidation_(internal, v10, 0, v11);
  v21 = (void *)objc_msgSend_copy(*((void **)internal + 35), v18, v19, v20);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i) + 16))();
        objc_msgSend_updateIdentityToken_withStorageToken_(v26, v27, 0, 0);
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v28, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v23);
  }

  objc_sync_exit(self);
}

- (void)onClientEventVehicleSpeed:(id)a3
{
  uint64_t v3;
  void *v6;
  CLVehicleSpeed *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CLLocationManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v17 = 0u;
  v18 = 0u;
  if (sub_18F5D44DC((CFDictionaryRef)a3, (UInt8 *)&v17))
  {
    objc_sync_enter(self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = [CLVehicleSpeed alloc];
      v11 = (void *)objc_msgSend_initWithClientVehicleSpeed_(v7, v8, v9, v10, v17, v18);
      v12 = NSStringFromSelector(sel_locationManager_didUpdateVehicleSpeed_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        v21 = 2082;
        v20 = 0;
        v22 = "";
        v23 = 2050;
        v24 = self;
        v25 = 2050;
        v26 = v6;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"vehicleSpeed\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didUpdateVehicleSpeed_(v6, v14, (uint64_t)self, (uint64_t)v11);

    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_FAULT, "could not get updated vehicle speed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventVehicleSpeed:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
  }
}

- (void)onClientEventVehicleHeading:(id)a3
{
  uint64_t v3;
  void *v6;
  CLVehicleHeading *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  char *v16;
  double v17;
  double v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CLLocationManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  v17 = 0.0;
  v18 = 0.0;
  if (sub_18F5D4584((CFDictionaryRef)a3, (UInt8 *)&v17))
  {
    objc_sync_enter(self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = [CLVehicleHeading alloc];
      v11 = (void *)objc_msgSend_initWithClientVehicleHeading_(v7, v8, v9, v10, v17, v18);
      v12 = NSStringFromSelector(sel_locationManager_didUpdateVehicleHeading_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v13 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        v21 = 2082;
        v20 = 0;
        v22 = "";
        v23 = 2050;
        v24 = self;
        v25 = 2050;
        v26 = v6;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"vehicleHeading\":%{public, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didUpdateVehicleHeading_(v6, v14, (uint64_t)self, (uint64_t)v11);

    }
    objc_sync_exit(self);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_FAULT, "could not get updated vehicle heading", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationManager onClientEventVehicleHeading:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
  }
}

- (void)onClientEventSignificantLocationVisit:(id)a3
{
  uint64_t v3;
  uint64_t *internal;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  CLVisit *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CLLocationManager *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  CLLocationManager *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  internal = (uint64_t *)self->_internal;
  v7 = (void *)objc_msgSend_delegate(internal, a2, (uint64_t)a3, v3);
  objc_sync_enter(self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend_objectForKey_(a3, v8, (uint64_t)CFSTR("kCLConnectionMessageSignificantLocationVisitKey"), v9);
    v27 = 0;
    v11 = objc_alloc(MEMORY[0x1E0CB3710]);
    v13 = objc_msgSend_initForReadingFromData_error_(v11, v12, v10, (uint64_t)&v27);
    if (v27)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v14 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        v29 = 0;
        v30 = 2082;
        v31 = "";
        v32 = 2114;
        v33 = v27;
        _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      }
      v15 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        *(_DWORD *)buf = 68289282;
        v29 = 0;
        v30 = 2082;
        v31 = "";
        v32 = 2114;
        v33 = v27;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]", "{\"msg%{public}.0s\":\"Unarchiver error in -[CLLocationManager onClientEventSignificantLocationVisit:]\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      v16 = (void *)v13;
      v17 = [CLVisit alloc];
      v20 = (void *)objc_msgSend_initWithCoder_(v17, v18, (uint64_t)v16, v19);
      sub_18F5D56A0(internal[1], 6, 917504, 1, 0, 0);
      v21 = NSStringFromSelector(sel_locationManager_didVisit_);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v22 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290051;
        v29 = 0;
        v30 = 2082;
        v31 = "";
        v32 = 2050;
        v33 = self;
        v34 = 2050;
        v35 = v7;
        v36 = 2114;
        v37 = v21;
        v38 = 2113;
        v39 = v20;
        _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", buf, 0x3Au);
      }
      objc_msgSend_locationManager_didVisit_(v7, v23, (uint64_t)self, (uint64_t)v20);
      objc_msgSend_finishDecoding(v16, v24, v25, v26);

    }
  }
  else
  {
    sub_18F5D56A0(internal[1], 6, 917504, 0, 0, 0);
  }
  objc_sync_exit(self);
}

- (void)onClientEventSignificantLocationVisitStateRequest:(id)a3
{
  uint64_t v3;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  CLVisit *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  CLLocationManager *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_delegate(self->_internal, a2, (uint64_t)a3, v3);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    v23 = 68289538;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2050;
    v28 = self;
    v29 = 2050;
    v30 = v6;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Processing Significant Location Visit State Request Event\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\"}", (uint8_t *)&v23, 0x26u);
  }
  objc_sync_enter(self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (id)objc_msgSend_objectForKey_(a3, v8, (uint64_t)CFSTR("kCLConnectionMessageSignificantLocationVisitStateKey"), v9);
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3710]);
      v13 = (id)objc_msgSend_initForReadingFromData_error_(v11, v12, (uint64_t)v10, 0);
      v14 = [CLVisit alloc];
      v10 = (id)objc_msgSend_initWithCoder_(v14, v15, (uint64_t)v13, v16);
      objc_msgSend_finishDecoding(v13, v17, v18, v19);
    }
    v20 = NSStringFromSelector(sel_locationManager_didReportVisit_);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v21 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 68290051;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2050;
      v28 = self;
      v29 = 2050;
      v30 = v6;
      v31 = 2114;
      v32 = v20;
      v33 = 2113;
      v34 = v10;
      _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLLocationManager invoking #delegate\", \"self\":\"%{public}p\", \"delegate\":\"%{public}p\", \"selector\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v23, 0x3Au);
    }
    objc_msgSend_locationManager_didReportVisit_(v6, v22, (uint64_t)self, (uint64_t)v10);
  }
  objc_sync_exit(self);
}

- (BOOL)isAuthorizedForPreciseLocation
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v3 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization\"}", (uint8_t *)&v9, 0x12u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  }
  v4 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization", "{\"msg%{public}.0s\":\"isAuthorizedForPreciseLocation is deprecated and will be removed in the next seed. use accuracyAuthorization\"}", (uint8_t *)&v9, 0x12u);
  }
  return objc_msgSend_accuracyAuthorization(self, v5, v6, v7) == 0;
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundleIdentifier:(id)a4
{
  sub_18F6DFAB0((uint64_t)a4, 0, a3);
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundlePath:(id)a4
{
  sub_18F6DFAB0(0, (uint64_t)a4, a3);
}

+ (void)setAuthorizationStatus:(BOOL)a3 forBundle:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;

  v4 = a3;
  v6 = objc_msgSend_bundlePath(a4, a2, a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatus_forBundlePath_, v4, v6);
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E40A0((uint64_t)a4, 0, 0, 0, *(uint64_t *)&a3, 0);
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundlePath:(id)a4
{
  sub_18F6E40A0(0, (uint64_t)a4, 0, 0, *(uint64_t *)&a3, 0);
}

+ (void)setAuthorizationStatusByType:(int)a3 forBundle:(id)a4
{
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend_bundlePath(a4, a2, *(uint64_t *)&a3, (uint64_t)a4);
  MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatusByType_forBundlePath_, v4, v6);
}

+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundleIdentifier:(id)a5
{
  sub_18F6E40A0((uint64_t)a5, 0, 0, 0, *(uint64_t *)&a3, *(uint64_t *)&a4);
}

+ (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  uint64_t v3;

  sub_18F6E4274(*(uint64_t *)&a3, a2, *(uint64_t *)&a3, v3);
}

+ (void)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 forBundle:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v7 = objc_msgSend_bundlePath(a5, a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
  sub_18F6E40A0(0, v7, 0, 0, v6, v5);
}

+ (void)setIncidentalUseMode:(int)a3 forBundle:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a3;
  v5 = objc_msgSend_bundlePath(a4, a2, *(uint64_t *)&a3, (uint64_t)a4);
  sub_18F6E42D4(0, v5, v4);
}

+ (void)setIncidentalUseMode:(int)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E42D4((uint64_t)a4, 0, *(uint64_t *)&a3);
}

+ (void)getIncidentalUseMode:(int *)a3 forBundle:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend_bundlePath(a4, a2, (uint64_t)a3, (uint64_t)a4);
  sub_18F6E1A78(0, v5, (uint64_t)a3);
}

+ (void)getIncidentalUseMode:(int *)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E1A78((uint64_t)a4, 0, (uint64_t)a3);
}

+ (void)setLocationButtonUseMode:(int)a3 forBundle:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a3;
  v5 = objc_msgSend_bundlePath(a4, a2, *(uint64_t *)&a3, (uint64_t)a4);
  sub_18F6E3F34(0, v5, v4);
}

+ (void)setLocationButtonUseMode:(int)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E3F34((uint64_t)a4, 0, *(uint64_t *)&a3);
}

+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleIdentifier:(id)a9 error:(id *)a10
{
  sub_18F6E1BE4((uint64_t)a9, 0, (uint64_t)a3, *(uint64_t *)&a7, *(uint64_t *)&a8, (uint64_t)a10, a4, a5, a6);
}

+ (void)registerCircularInterestZoneWithId:(id)a3 latitue:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundle:(id)a9 error:(id *)a10
{
  uint64_t v11;
  uint64_t v12;
  const char *v17;

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v17 = (const char *)objc_msgSend_bundlePath(a9, a2, (uint64_t)a3, *(uint64_t *)&a7);
  sub_18F6E1BE4(0, v17, (uint64_t)a3, v12, v11, (uint64_t)a10, a4, a5, a6);
}

+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleIdentifier:(id)a7 error:(id *)a8
{
  sub_18F6E1C74((uint64_t)a7, 0, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, (uint64_t)a8);
}

+ (void)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundle:(id)a7 error:(id *)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v13;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v13 = (const char *)objc_msgSend_bundlePath(a7, a2, (uint64_t)a3, *(uint64_t *)&a4);
  sub_18F6E1C74(0, v13, (uint64_t)a3, v11, v10, v9, (uint64_t)a8);
}

+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundleIdentifier:(id)a6
{
  sub_18F6E40A0((uint64_t)a6, 0, (uint64_t)a5, 0, *(uint64_t *)&a3, *(uint64_t *)&a4);
}

+ (void)setAuthorizationStatus:(int)a3 withCorrectiveCompensation:(int)a4 forInterestZoneWithId:(id)a5 registeredForBundle:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = objc_msgSend_bundlePath(a6, a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
  sub_18F6E40A0(0, v9, (uint64_t)a5, 0, v8, v7);
}

+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleIdentifier:(id)a5 error:(id *)a6
{
  sub_18F6E1CF4((uint64_t)a5, 0, (uint64_t)a4, a3, (uint64_t)a6);
}

+ (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundle:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  const char *v9;

  v8 = a3;
  v9 = (const char *)objc_msgSend_bundlePath(a5, a2, a3, (uint64_t)a4);
  sub_18F6E1CF4(0, v9, (uint64_t)a4, v8, (uint64_t)a6);
}

+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundleIdentifier:(id)a4 error:(id *)a5
{
  sub_18F6E1D58((uint64_t)a4, 0, (uint64_t)a3, (uint64_t)a5);
}

+ (void)deleteInterestZoneWithId:(id)a3 registeredForBundle:(id)a4 error:(id *)a5
{
  const char *v7;

  v7 = (const char *)objc_msgSend_bundlePath(a4, a2, (uint64_t)a3, (uint64_t)a4);
  sub_18F6E1D58(0, v7, (uint64_t)a3, (uint64_t)a5);
}

+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  sub_18F6E3AC8((uint64_t)a4, 0, v4, a3, 0, 0);
}

+ (void)setTemporaryAuthorizationGranted:(BOOL)a3 forBundle:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  __int128 v6;

  v4 = a3;
  v5 = objc_msgSend_bundlePath(a4, a2, a3, (uint64_t)a4, 0, 0, 0, 0);
  sub_18F6E3AC8(0, v5, &v6, v4, 0, 0);
}

+ (void)grantTemporaryAuthorizationUsingLocationButtonToClientWithAuditToken:(id *)a3 voiceInteractionEnabled:(BOOL)a4
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  sub_18F6E3AC8(0, 0, v5, 1, 1, a4);
}

+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E3C64((uint64_t)a4, 0, a3);
}

+ (void)setTemporaryFullAccuracyAuthorizationGranted:(BOOL)a3 forBundlePath:(id)a4
{
  sub_18F6E3C64(0, (uint64_t)a4, a3);
}

+ (void)tearDownLocationAuthorizationPromptForBundleId:(id)a3
{
  sub_18F6E3DD0((uint64_t)a3, 0);
}

+ (void)tearDownLocationAuthorizationPromptForBundlePath:(id)a3
{
  sub_18F6E3DD0(0, (uint64_t)a3);
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundleIdentifier:(id)a4
{
  sub_18F6E4440((uint64_t)a4, 0, a3, (uint64_t)a4);
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forBundle:(id)a4
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (const char *)objc_msgSend_bundlePath(a4, a2, a3, (uint64_t)a4);
  sub_18F6E4440(0, v5, v4, v6);
}

+ (void)setDefaultEffectiveBundleIdentifier:(id)a3
{
  sub_18F5CDF98((CFStringRef)a3);
}

+ (void)setDefaultEffectiveBundle:(id)a3
{
  uint64_t v3;
  const __CFString *v4;

  v4 = (const __CFString *)objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, v3);
  sub_18F5CDFE0(v4);
}

- (void)requestWhenInUseAuthorizationWithPrompt
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v4, &v10);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  CLClientSetShowLocationPrompt(*((_QWORD *)self->_internal + 1), 1);
  objc_msgSend_requestWhenInUseAuthorization(self, v7, v8, v9);
  os_activity_scope_leave(&v10);
}

- (void)requestWhenInUseAuthorizationWithPurposeKey:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  const char *v13;
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
  CLLocationManager *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
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
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a3)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 3982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("purposeKey"));
  }
  sub_18F5CE9E8(*((_QWORD **)self->_internal + 1), (uint64_t)a3, 4);
  os_activity_scope_leave(&state);
}

- (void)requestAlwaysAuthorization
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;
  const char *Name;
  _QWORD **internal;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    Name = sel_getName(a2);
    *(_DWORD *)buf = 68290050;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    v23 = 2082;
    v24 = Name;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"SEL\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  objc_msgSend_collectMetricForFunction_(self, v6, 0x800000, v7);
  internal = (_QWORD **)self->_internal;
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v11 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting always authorization\"}", buf, 0x12u);
  }
  CLClientRequestAuthorization(internal[1], 3);
  os_activity_scope_leave(&v12);
}

- (void)changeFencesStateMatchingHandoffTags:(id)a3 forDeviceID:(id)a4 completion:(id)a5
{
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  CLLocationManager *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v10, &v18);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v11 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    v25 = 2114;
    v26 = v15;
    v27 = 2050;
    v28 = self;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v16 = *((_QWORD *)self->_internal + 1);
  v17 = objc_msgSend_UUIDString(a4, v12, v13, v14);
  sub_18F5CE7D8(v16, (const char *)a3, v17, (uint64_t)a5);
  os_activity_scope_leave(&v18);
}

- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__requestTemporaryFullAccuracyWithUsageDescription_completion_, a3, 0);
}

- (void)_requestTemporaryFullAccuracyWithUsageDescription:(id)a3 completion:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  _QWORD *internal;
  NSObject *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v8, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v10;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v12 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Requesting temporary accuracy increase\"}", buf, 0x12u);
  }
  CLClientRequestTemporaryPrecise(internal[1], (const char *)a3, 0, (uint64_t)a4);
  os_activity_scope_leave(&v13);
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v5 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v9, 0x12u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  }
  v6 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey", "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v9, 0x12u);
  }
  objc_msgSend_requestTemporaryFullAccuracyAuthorizationWithPurposeKey_(self, v7, (uint64_t)a3, v8);
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v7 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
  {
    v10 = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v10, 0x12u);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  }
  v8 = qword_1ECD8E740;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
  {
    v10 = 68289026;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey", "{\"msg%{public}.0s\":\"requestTemporaryPreciseLocationAuthorizationWithPurposeKey is deprecated and will be removed in the next seed. use requestTemporaryFullAccuracyAuthorizationWithPurposeKey\"}", (uint8_t *)&v10, 0x12u);
  }
  objc_msgSend_requestTemporaryFullAccuracyAuthorizationWithPurposeKey_completion_(self, v9, (uint64_t)a3, (uint64_t)a4);
}

- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey
{
  uint64_t v3;
  const char *v6;

  objc_msgSend_collectMetricForFunction_(self, a2, 0x1000000, v3);
  objc_msgSend_requestTemporaryFullAccuracyAuthorizationWithPurposeKey_completion_(self, v6, (uint64_t)purposeKey, 0);
}

- (void)requestTemporaryFullAccuracyAuthorizationWithPurposeKey:(NSString *)purposeKey completion:(void *)completion
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSString *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v8, &v13);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v12;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_collectMetricForFunction_(self, v10, 0x1000000, v11);
  CLClientRequestTemporaryPrecise(*((_QWORD *)self->_internal + 1), 0, (uint64_t)purposeKey, (uint64_t)completion);
  os_activity_scope_leave(&v13);
}

- (BOOL)isLocationServicesPreferencesDialogEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_allowsLocationPrompts(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setLocationServicesPreferencesDialogEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    v23 = 1026;
    v24 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  internal = self->_internal;
  sub_18F5D36F4(*((_QWORD *)internal + 1), v3);
  objc_msgSend_setAllowsLocationPrompts_(*((void **)internal + 4), v10, v3, v11);
  os_activity_scope_leave(&v12);
}

- (BOOL)isDynamicAccuracyReductionEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_dynamicAccuracyReductionEnabled(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  void **internal;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  CLLocationManager *v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v6, &v18);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2082;
    v24 = "activity";
    v25 = 2114;
    v26 = v8;
    v27 = 2050;
    v28 = self;
    v29 = 1026;
    v30 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"enabled\":%{public}hhd}", buf, 0x36u);
  }
  internal = (void **)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setDynamicAccuracyReductionEnabled_(internal[4], v10, v3, v11);
  if (objc_msgSend_updatingLocation(internal[4], v12, v13, v14))
    objc_msgSend_startUpdatingLocation(self, v15, v16, v17);
  objc_sync_exit(self);
  os_activity_scope_leave(&v18);
}

- (BOOL)allowsAlteredAccessoryLocations
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_allowsAlteredAccessoryLocations(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)registerAsLocationClient
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  CLLocationManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = "activity";
    v14 = 2114;
    v15 = v6;
    v16 = 2050;
    v17 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  sub_18F5D4448(*((_QWORD *)self->_internal + 1));
  os_activity_scope_leave(&v7);
}

+ (BOOL)dumpLogsWithMessage:(id)a3
{
  uint64_t v3;

  return sub_18F6E1F2C((uint64_t)a3, a2, (uint64_t)a3, v3) != 0;
}

+ (void)dumpDiagnosticFilesWithHandler:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  char *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  __int16 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    if (qword_1ECD8E758 == -1)
      goto LABEL_3;
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v19 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "handler";
      _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v20 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "handler";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "must pass handler to dumpDiagnosticFilesWithHandler", "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    }
    v3 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = "assert";
      v31 = 2081;
      v32 = "handler";
      _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"must pass handler to dumpDiagnosticFilesWithHandler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
LABEL_3:
  v4 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEFAULT, "dumpDiagnosticFiles called, trying to make an xpc call", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v24 = 0;
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLLocationManager dumpDiagnosticFilesWithHandler:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
  }
  v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v7 = (void *)objc_msgSend_initWithMachServiceName_options_(v5, v6, (uint64_t)CFSTR("com.apple.locationd.diagnostic"), 4096);
  v10 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v8, (uint64_t)&unk_1EE18FE88, v9);
  objc_msgSend_setRemoteObjectInterface_(v7, v11, v10, v12);
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18F5EEE80;
  v23[3] = &unk_1E29912B8;
  v23[4] = v7;
  v16 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v14, (uint64_t)v23, v15);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = sub_18F5EF034;
  v22[3] = &unk_1E29912E0;
  v22[4] = v7;
  v22[5] = v3;
  objc_msgSend_copyRegisteredFilesWithHandler_(v16, v17, (uint64_t)v22, v18);
}

+ (BOOL)shutdownDaemon
{
  uint64_t v2;
  uint64_t v3;

  return sub_18F6E1EF4((uint64_t)a1, a2, v2, v3) != 0;
}

+ (BOOL)bundleSupported:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend_bundlePath(a3, a2, (uint64_t)a3, v3);
  return a3 != 0;
}

+ (BOOL)advertiseAsBeacon:(id)a3 withPower:(id)a4
{
  return CLStartStopAdvertisingBeacon((uint64_t)a3, (uint64_t)a4);
}

- (void)setIsActuallyAWatchKitExtension:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  CLLocationManager *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v6, &v9);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "activity";
    v16 = 2114;
    v17 = v8;
    v18 = 2050;
    v19 = self;
    v20 = 1026;
    v21 = v3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"isActuallyAWatchKitExtension\":%{public}hhd}", buf, 0x36u);
  }
  sub_18F5CFA30(*((_QWORD *)self->_internal + 1), v3);
  os_activity_scope_leave(&v9);
}

+ (id)_getClientTransientAuthorizationInfoForBundleId:(id)a3 error:(id *)a4
{
  return (id)CLGetClientTransientAuthorizationInfo((uint64_t)a3, 0, (uint64_t)a4);
}

+ (id)_getClientTransientAuthorizationInfoForBundlePath:(id)a3 error:(id *)a4
{
  return (id)CLGetClientTransientAuthorizationInfo(0, (uint64_t)a3, (uint64_t)a4);
}

+ (id)_setClientTransientAuthorizationInfoForBundleId:(id)a3 data:(id)a4
{
  return (id)CLSetClientTransientAuthorizationInfo((uint64_t)a3, 0, (uint64_t)a4);
}

+ (id)_setClientTransientAuthorizationInfoForBundlePath:(id)a3 data:(id)a4
{
  return (id)CLSetClientTransientAuthorizationInfo(0, (uint64_t)a3, (uint64_t)a4);
}

- (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_, a5, *(_QWORD *)&a6);
}

- (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__historicalUpdaterWithDateInterval_sampleCount_queue_handler_, a3, *(_QWORD *)&a4);
}

- (id)liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__liveUpdaterWithConfiguration_queue_handler_, a3, a4);
}

- (id)liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__liveUpdaterWithConfiguration_queue_handler_, 0, a3);
}

- (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  if (!a4)
    objc_msgSend_queue(*((void **)self->_internal + 36), a2, a3, 0);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_liveUpdaterWithConfiguration_locationManager_queue_handler_, a3, self);
}

- (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__liveUpdaterWithConfiguration_queue_handler_, 0, a3);
}

- (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a4;
  if (!a5)
    objc_msgSend_queue(*((void **)self->_internal + 36), a2, (uint64_t)a3, *(uint64_t *)&a4);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_historicalUpdaterWithDateInterval_sampleCount_locationManager_queue_handler_, a3, v6);
}

- (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  uint64_t v8;

  v8 = *(_QWORD *)&a6;
  if (!a7)
    objc_msgSend_queue(*((void **)self->_internal + 36), a2, (uint64_t)a5, *(uint64_t *)&a6);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_historicalUpdaterWithCenter_radius_dateInterval_sampleCount_locationManager_queue_handler_, a5, v8);
}

- (id)backgroundActivitySession
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = objc_msgSend_queue(*((void **)self->_internal + 36), a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](CLBackgroundActivitySession, sel_sessionWithLocationManager_queue_handler_, self, v5);
}

- (id)serviceSession
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_queue(*((void **)self->_internal + 36), a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](CLServiceSession, sel_sessionWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_, self, 1);
}

- (id)privilegedServiceSession
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_queue(*((void **)self->_internal + 36), a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](CLServiceSession, sel_sessionWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_, self, 2);
}

- (BOOL)isMasquerading
{
  return *(_BYTE *)(*((_QWORD *)self->_internal + 1) + 17) != 0;
}

- (void)requestMonitorWithConfiguration:(id)a3 completion:(id)a4
{
  MEMORY[0x1E0DE7D20](CLMonitor, sel_requestWithConfiguration_locationManager_completion_, a3, self);
}

- (void)collectMetricForFunction:(unint64_t)a3
{
  sub_18F5BF2A4(*((_QWORD *)self->_internal + 1), a3);
}

+ (void)collectMetricForFunction:(unint64_t)a3
{
  sub_18F5BF2A4(0, a3);
}

- (void)startUpdatingVehicleSpeed
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  CLLocationManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = "activity";
    v22 = 2114;
    v23 = v6;
    v24 = 2050;
    v25 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v8, v9, v10);
  objc_msgSend_setUpdatingVehicleSpeed_(*((void **)internal + 4), v11, 1, v12);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "Start updating vehicle speed", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) startUpdatingVehicleSpeed]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  CLClientStartVehicleSpeedUpdates(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopUpdatingVehicleSpeed
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id internal;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v6;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setUpdatingVehicleSpeed_(*((void **)internal + 4), v8, 0, v9);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "Stop updating vehicle speed", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) stopUpdatingVehicleSpeed]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  CLClientStopVehicleSpeedUpdates(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)startUpdatingVehicleHeading
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  CLLocationManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = "activity";
    v22 = 2114;
    v23 = v6;
    v24 = 2050;
    v25 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v8, v9, v10);
  objc_msgSend_setUpdatingVehicleHeading_(*((void **)internal + 4), v11, 1, v12);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "Start updating vehicle heading", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) startUpdatingVehicleHeading]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  CLClientStartVehicleHeadingUpdates(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)stopUpdatingVehicleHeading
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id internal;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v6;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  objc_msgSend_setUpdatingVehicleHeading_(*((void **)internal + 4), v8, 0, v9);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "Stop updating vehicle heading", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(VehicleData) stopUpdatingVehicleHeading]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  CLClientStopVehicleHeadingUpdates(*((_QWORD *)internal + 1));
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (BOOL)isMatchInfoEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char matched;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  matched = objc_msgSend_matchInfoEnabled(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return matched;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  CLClientSetMatchInfoEnabled(*((_QWORD *)internal + 1), v3);
  objc_msgSend_setMatchInfoEnabled_(*((void **)internal + 4), v10, v3, v11);
  os_activity_scope_leave(&v12);
}

- (BOOL)_isGroundAltitudeEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_groundAltitudeEnabled(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)_setGroundAltitudeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  sub_18F5D34D8(*((_QWORD *)internal + 1), v3);
  objc_msgSend_setGroundAltitudeEnabled_(*((void **)internal + 4), v10, v3, v11);
  os_activity_scope_leave(&v12);
}

- (id)_groundAltitudeAtLocation:(id)a3
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  _QWORD *internal;
  _CLLocationGroundAltitude *v14;
  const char *v15;
  uint64_t v16;
  os_activity_scope_state_s v17;
  _BYTE buf[38];
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v6, &v17);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "activity";
    *(_WORD *)&buf[28] = 2114;
    *(_QWORD *)&buf[30] = v11;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (a3)
  {
    if (objc_msgSend__isGroundAltitudeEnabled(self, v8, v9, v10)
      && (internal = self->_internal,
          memset(buf, 0, 32),
          CLClientGetGroundAltitudeAtLocation(internal[1], (uint64_t)a3, (uint64_t)buf))
      && *(double *)&buf[8] > 0.0)
    {
      v14 = [_CLLocationGroundAltitude alloc];
      a3 = (id)objc_msgSend_initWithEstimate_uncertainty_undulation_undulationModel_(v14, v15, *(unsigned int *)&buf[24], v16, *(double *)buf, *(double *)&buf[8], *(double *)&buf[16]);
    }
    else
    {
      a3 = 0;
    }
  }
  os_activity_scope_leave(&v17);
  return a3;
}

- (BOOL)_isFusionInfoEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_fusionInfoEnabled(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)_setFusionInfoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  sub_18F5D358C(*((_QWORD *)internal + 1), v3);
  objc_msgSend_setFusionInfoEnabled_(*((void **)internal + 4), v10, v3, v11);
  os_activity_scope_leave(&v12);
}

- (BOOL)isTrackRunInfoEnabled
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  char v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v4, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  v10 = objc_msgSend_trackRunInfoEnabled(*((void **)self->_internal + 4), v6, v7, v8);
  os_activity_scope_leave(&v12);
  return v10;
}

- (void)setTrackRunInfoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  id internal;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  CLLocationManager *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v6, &v12);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = "activity";
    v19 = 2114;
    v20 = v8;
    v21 = 2050;
    v22 = self;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  sub_18F5D3640(*((_QWORD *)internal + 1), v3);
  objc_msgSend_setTrackRunInfoEnabled_(*((void **)internal + 4), v10, v3, v11);
  os_activity_scope_leave(&v12);
}

- (void)startMonitoringVisits
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  uint64_t *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  CLLocationManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v4, &v11);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = v6;
    v20 = 2050;
    v21 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = (uint64_t *)self->_internal;
  objc_sync_enter(self);
  objc_msgSend_performCourtesyPromptIfNeeded(internal, v8, v9, v10);
  sub_18F5CFDC8(internal[1], 0);
  objc_sync_exit(self);
  os_activity_scope_leave(&v11);
}

- (void)stopMonitoringVisits
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  _QWORD *internal;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  CLLocationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    v15 = 2114;
    v16 = v6;
    v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5CFEB4(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)_startLeechingVisits
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  _QWORD *internal;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  CLLocationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v4, &v8);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = "activity";
    v15 = 2114;
    v16 = v6;
    v17 = 2050;
    v18 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  *(_DWORD *)buf = 1;
  sub_18F5CFDC8(internal[1], buf);
  objc_sync_exit(self);
  os_activity_scope_leave(&v8);
}

- (void)_requestVisitState
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  _QWORD *internal;
  NSObject *v8;
  char *v9;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  CLLocationManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  internal = self->_internal;
  objc_sync_enter(self);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "#slv: Request visit state", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(CLVisitExtensions) _requestVisitState]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  sub_18F5CFF80(internal[1]);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (id)_startPlaceInferencesCommonLogic:(unint64_t)a3 handler:(id)a4
{
  _QWORD *internal;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v20;
  _QWORD v21[6];
  __int16 v22;
  uint8_t buf[8];
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "Setup PlaceInferences common logic", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v22 = 0;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _startPlaceInferencesCommonLogic:handler:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  objc_sync_enter(self);
  v12 = (void *)internal[33];
  if (v12 && (objc_msgSend_fireInterval(v12, v9, v10, v11), v13 != 1.79769313e308) || internal[31])
  {
    v14 = (void *)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, (uint64_t)CFSTR("kCLErrorDomain"), 10, 0);
    objc_sync_exit(self);
    if (v14)
    {
      v17 = internal[1];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_18F5F1A60;
      v21[3] = &unk_1E2990E58;
      v21[4] = v14;
      v21[5] = a4;
      if (v17)
      {
        v18 = *(void **)(v17 + 232);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = sub_18F5CCF7C;
        v26 = &unk_1E2990E30;
        v27 = v21;
        objc_msgSend_async_(v18, v15, (uint64_t)buf, v16);
      }
    }
  }
  else
  {
    internal[31] = objc_msgSend_copy(a4, v9, v10, v11);
    internal[32] = a3;
    objc_sync_exit(self);
    return 0;
  }
  return v14;
}

- (void)_fetchPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  _QWORD *internal;
  NSObject *v15;
  void *v16;
  const char *v17;
  char *v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  CLLocationManager *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = "activity";
    v26 = 2114;
    v27 = v13;
    v28 = 2050;
    v29 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a4)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 4562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeInferenceHandler"));
  }
  internal = self->_internal;
  if (!objc_msgSend__startPlaceInferencesCommonLogic_handler_(self, v10, a3, (uint64_t)a4))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "Start oneshot PlaceInferences", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _fetchPlaceInferencesWithFidelityPolicy:handler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
    sub_18F5CFCD4(internal[1], a3);
  }
  os_activity_scope_leave(&state);
}

- (void)_fetchContinuousPlaceInferencesWithFidelityPolicy:(unint64_t)a3 handler:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  id internal;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  _QWORD v26[6];
  id v27[2];
  os_activity_scope_state_s state;
  id buf;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  CLLocationManager *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    buf = (id)68289794;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = "activity";
    v34 = 2114;
    v35 = v13;
    v36 = 2050;
    v37 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x30u);
  }
  if (!a4)
  {
    v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 4575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeInferenceHandler"));
  }
  internal = self->_internal;
  if (!objc_msgSend__startPlaceInferencesCommonLogic_handler_(self, v10, a3, (uint64_t)a4))
  {
    objc_sync_enter(self);
    if (!*((_QWORD *)internal + 33))
      *((_QWORD *)internal + 33) = objc_msgSend_newTimer(*((void **)internal + 36), v15, v16, v17);
    objc_initWeak(&buf, self);
    v18 = (void *)*((_QWORD *)internal + 33);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F5F2038;
    v26[3] = &unk_1E2991308;
    objc_copyWeak(v27, &buf);
    v26[4] = internal;
    v26[5] = a4;
    v27[1] = (id)a3;
    objc_msgSend_setHandler_(v18, v19, (uint64_t)v26, v20);
    objc_msgSend_setNextFireDelay_interval_(*((void **)internal + 33), v21, v22, v23, 0.0, 20.0);
    objc_destroyWeak(v27);
    objc_destroyWeak(&buf);
    objc_sync_exit(self);
  }
  os_activity_scope_leave(&state);
}

- (void)_stopFetchingContinuousPlaceInferences
{
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  id internal;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  CLLocationManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2082;
    v19 = "activity";
    v20 = 2114;
    v21 = v6;
    v22 = 2050;
    v23 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    internal = self->_internal;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  }
  else
  {
    internal = self->_internal;
  }
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "Stop continuous PlaceInferences", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationManager(_CLPlaceInferenceExtensions) _stopFetchingContinuousPlaceInferences]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  objc_sync_enter(self);
  sub_18F5CFD4C(*((_QWORD *)internal + 1));
  objc_msgSend_setNextFireDelay_interval_(*((void **)internal + 33), v9, v10, v11, 1.79769313e308, 1.79769313e308);

  *((_QWORD *)internal + 31) = 0;
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  _QWORD *internal;
  void *v15;
  const char *v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  CLLocationManager *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationManager", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2991328);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2082;
    v23 = "activity";
    v24 = 2114;
    v25 = v13;
    v26 = 2050;
    v27 = self;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationManager\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if (!a4)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLLocationManager.m"), 4626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  internal = self->_internal;
  objc_sync_enter(self);
  sub_18F5D5454(internal[1], (const char *)a3, (uint64_t)a4);
  objc_sync_exit(self);
  os_activity_scope_leave(&state);
}

- (void)_updateVLLocalizationResult:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v4 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)a3, 1, &v13);
  if (v13)
    v8 = 1;
  else
    v8 = v4 == 0;
  if (v8)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29906B0);
    v9 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLVLLocalizationResult\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29906B0);
    }
    v10 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v13;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLVLLocalizationResult", "{\"msg%{public}.0s\":\"Could not serialize _CLVLLocalizationResult\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    v11 = v4;
    v12 = objc_msgSend_internalClient(self, v5, v6, v7);
    CLClientUpdateVLLocalizationResult(v12, v11);
  }
}

+ (uint64_t)updatePromptedLatitude:(uint64_t)a3 longitude:(uint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_sharedServiceClient(CLLocationInternalClient, a2, a3, a4);
  return MEMORY[0x1E0DE7D20](v4, sel_updatePromptedLatitude_longitude_, v5, v6);
}

- (void)_updateARSessionState:(unint64_t)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, (uint64_t)&v12, 8);
  if (v4)
  {
    v8 = v4;
    v9 = objc_msgSend_internalClient(self, v5, v6, v7);
    CLClientUpdateARSessionState(v9, v8);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990910);
    v10 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLARSessionState\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990910);
    }
    v11 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLARSessionState", "{\"msg%{public}.0s\":\"Could not serialize _CLARSessionState\"}", buf, 0x12u);
    }
  }
}

- (void)_updateVIOEstimation:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v4 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)a3, 1, &v13);
  if (v13)
    v8 = 1;
  else
    v8 = v4 == 0;
  if (v8)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990A30);
    v9 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Could not serialize _CLVIOEstimation\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990A30);
    }
    v10 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v13;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Could not serialize _CLVIOEstimation", "{\"msg%{public}.0s\":\"Could not serialize _CLVIOEstimation\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    v11 = v4;
    v12 = objc_msgSend_internalClient(self, v5, v6, v7);
    CLClientUpdateVIOEstimation(v12, v11);
  }
}

+ (void)setStatusBarIconEnabled:(BOOL)a3 forLocationEntityClass:(unint64_t)a4
{
  uint64_t v4;

  v4 = 0;
  switch(a4)
  {
    case 1uLL:
      v4 = 1;
      break;
    case 2uLL:
      v4 = 2;
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v4 = 3;
      break;
    case 8uLL:
      v4 = 4;
      break;
    default:
      if (a4 == 16)
        v4 = 5;
      else
        v4 = 0;
      break;
  }
  sub_18F6E1F58(v4, (const char *)a3, a3, a4);
}

+ (BOOL)isStatusBarIconEnabledForLocationEntityClass:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v6;

  v6 = 0;
  v4 = 0;
  switch(a3)
  {
    case 1uLL:
      v4 = 1;
      break;
    case 2uLL:
      v4 = 2;
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v4 = 3;
      break;
    case 8uLL:
      v4 = 4;
      break;
    default:
      if (a3 == 16)
        v4 = 5;
      else
        v4 = 0;
      break;
  }
  sub_18F6E1F8C(v4, (const char *)&v6, a3, v3);
  return v6;
}

+ (unint64_t)primaryEntityClassForLocationDictionary:(id)a3
{
  uint64_t v3;

  return qword_18F775C18[sub_18F706D64(a3, (const char *)1, (uint64_t)a3, v3)];
}

+ (unint64_t)entityClassesForLocationDictionary:(id)a3
{
  uint64_t v3;
  unint64_t result;

  result = objc_msgSend_primaryEntityClassForLocationDictionary_(a1, a2, (uint64_t)a3, v3);
  if ((result & 0x3C) != 0)
    result |= 6uLL;
  return result;
}

+ (BOOL)isLocationActiveForLocationDictionary:(id)a3
{
  uint64_t v3;

  return objc_msgSend_activeLocationServiceTypesForLocationDictionary_(a1, a2, (uint64_t)a3, v3) != 0;
}

+ (unint64_t)activeLocationServiceTypesForLocationDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isEntityAuthorizedForLocationDictionary_(a1, a2, (uint64_t)a3, v3))
    v7 = 2;
  else
    v7 = 0;
  v8 = sub_18F7068E8(a3, (const char *)v7, v5, v6);
  if (v8 == 3)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990AF0);
    v10 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      v12 = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = a3;
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Dictionary utilites reported the arrow is in max state?!\", \"clientRecord\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990AF0);
    }
    v11 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      v12 = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = a3;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Dictionary utilites reported the arrow is in max state?!", "{\"msg%{public}.0s\":\"Dictionary utilites reported the arrow is in max state?!\", \"clientRecord\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    }
    return 0;
  }
  else if (v8 == 2)
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

+ (id)dateLocationLastUsedForLocationDictionary:(id)a3
{
  uint64_t v3;

  return (id)sub_18F706BC8(a3, a2, (uint64_t)a3, v3);
}

+ (BOOL)hasUsedBackgroundLocationServices:(id)a3
{
  uint64_t v3;

  return sub_18F706A28(a3, a2, (uint64_t)a3, v3);
}

+ (BOOL)isEntityAuthorizedForLocationDictionary:(id)a3
{
  uint64_t v3;

  return (objc_msgSend_entityAuthorizationForLocationDictionary_(a1, a2, (uint64_t)a3, v3) & 6) != 0;
}

+ (unint64_t)entityAuthorizationForLocationDictionary:(id)a3
{
  uint64_t v3;

  return sub_18F7062AC(a3, a2, (uint64_t)a3, v3);
}

+ (unint64_t)allowableAuthorizationForLocationDictionary:(id)a3
{
  uint64_t v3;

  return sub_18F706AE4(a3, a2, (uint64_t)a3, v3);
}

+ (BOOL)correctiveCompensationStatusForLocationDictionary:(id)a3
{
  uint64_t v3;

  return sub_18F706B14(a3, a2, (uint64_t)a3, v3);
}

+ (unint64_t)incidentalUseModeForLocationDictionary:(id)a3
{
  uint64_t v3;

  return (unint64_t)sub_18F706B3C(a3, a2, (uint64_t)a3, v3);
}

+ (id)interestZonesIdentifierListForLocationDictionary:(id)a3
{
  uint64_t v3;
  id result;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  result = (id)sub_18F706B68(a3, a2, (uint64_t)a3, v3);
  if (result)
    return (id)objc_msgSend_allKeys(result, v5, v6, v7);
  return result;
}

+ (id)interestZoneDictionaryIdentifiedById:(id)a3 forLocationDictionary:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;

  v6 = (void *)sub_18F706B68(a4, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend_objectForKey_(v6, v7, (uint64_t)a3, v8))
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      v13 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)a3, v11);
      v9 = (void *)objc_msgSend_dictionaryWithDictionary_(v12, v14, v13, v15);
      objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)a3, (uint64_t)CFSTR("ZoneId"));
      v19 = objc_msgSend_objectForKey_(a4, v17, (uint64_t)CFSTR("BundleId"), v18);
      objc_msgSend_setObject_forKey_(v9, v20, v19, (uint64_t)CFSTR("BundleId"));
      v23 = objc_msgSend_objectForKey_(a4, v21, (uint64_t)CFSTR("BundlePath"), v22);
      objc_msgSend_setObject_forKey_(v9, v24, v23, (uint64_t)CFSTR("BundlePath"));
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

+ (BOOL)isInterestZoneReleventForLocationDictionary:(id)a3
{
  uint64_t v3;

  return sub_18F706B74(a3, a2, (uint64_t)a3, v3);
}

+ (void)setEntityAuthorized:(BOOL)a3 forLocationDictionary:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v7 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("BundleId"), (uint64_t)a4);
  v10 = objc_msgSend_objectForKey_(a4, v8, (uint64_t)CFSTR("BundlePath"), v9);
  if (v7)
  {
    MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatus_forBundleIdentifier_, v5, v7);
  }
  else if (v10)
  {
    v13 = objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v11, v10, v12);
    MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatus_forBundle_, v5, v13);
  }
}

+ (void)setEntityAuthorization:(unint64_t)a3 forLocationDictionary:(id)a4
{
  MEMORY[0x1E0DE7D20](a1, sel_setEntityAuthorization_withCorrectiveCompensationType_forLocationDictionary_, a3, 0);
}

+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensation:(BOOL)a4 forLocationDictionary:(id)a5
{
  uint64_t v5;

  if (a4)
    v5 = 2;
  else
    v5 = 1;
  MEMORY[0x1E0DE7D20](a1, sel_setEntityAuthorization_withCorrectiveCompensationType_forLocationDictionary_, a3, v5);
}

+ (void)setEntityAuthorization:(unint64_t)a3 withCorrectiveCompensationType:(int)a4 forLocationDictionary:(id)a5
{
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)&a4;
  v9 = objc_msgSend_objectForKey_(a5, a2, (uint64_t)CFSTR("BundleId"), *(uint64_t *)&a4);
  v12 = objc_msgSend_objectForKey_(a5, v10, (uint64_t)CFSTR("BundlePath"), v11);
  v15 = objc_msgSend_objectForKey_(a5, v13, (uint64_t)CFSTR("ZoneId"), v14);
  if (a3 > 4)
  {
    v18 = 2;
    if (v15)
    {
LABEL_3:
      if (v9)
      {
        MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatus_withCorrectiveCompensation_forInterestZoneWithId_registeredForBundleIdentifier_, v18, v6);
      }
      else if (v12)
      {
        objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v16, v12, v17);
        MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatus_withCorrectiveCompensation_forInterestZoneWithId_registeredForBundle_, v18, v6);
      }
      return;
    }
  }
  else
  {
    v18 = dword_18F775C60[a3];
    if (v15)
      goto LABEL_3;
  }
  if (v9)
  {
    MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatusByType_withCorrectiveCompensation_forBundleIdentifier_, v18, v6);
  }
  else if (v12)
  {
    objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v16, v12, v17);
    MEMORY[0x1E0DE7D20](a1, sel_setAuthorizationStatusByType_withCorrectiveCompensation_forBundle_, v18, v6);
  }
}

+ (BOOL)backgroundIndicatorEnabledForLocationDictionary:(id)a3
{
  uint64_t v3;

  return sub_18F706B9C(a3, a2, (uint64_t)a3, v3);
}

+ (void)setBackgroundIndicatorEnabled:(BOOL)a3 forLocationDictionary:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v7 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("BundleId"), (uint64_t)a4);
  v10 = objc_msgSend_objectForKey_(a4, v8, (uint64_t)CFSTR("BundlePath"), v9);
  if (v7)
  {
    MEMORY[0x1E0DE7D20](a1, sel_setBackgroundIndicatorEnabled_forBundleIdentifier_, v5, v7);
  }
  else if (v10)
  {
    v13 = objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v11, v10, v12);
    MEMORY[0x1E0DE7D20](a1, sel_setBackgroundIndicatorEnabled_forBundle_, v5, v13);
  }
}

@end
