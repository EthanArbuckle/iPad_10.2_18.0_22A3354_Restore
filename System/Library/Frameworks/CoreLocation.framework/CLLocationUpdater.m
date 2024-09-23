@implementation CLLocationUpdater

+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel__historicalUpdaterWithCenter_radius_dateInterval_sampleCount_queue_handler_, a5, *(_QWORD *)&a6);
}

+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel__historicalUpdaterWithDateInterval_sampleCount_queue_handler_, a3, *(_QWORD *)&a4);
}

+ (CLLocationUpdater)liveUpdaterWithConfiguration:(CLLiveUpdateConfiguration)configuration queue:(dispatch_queue_t)queue handler:(void *)handler
{
  return (CLLocationUpdater *)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel__liveUpdaterWithConfiguration_queue_handler_, configuration, queue);
}

+ (CLLocationUpdater)liveUpdaterWithQueue:(dispatch_queue_t)queue handler:(void *)handler
{
  return (CLLocationUpdater *)MEMORY[0x1E0DE7D20](a1, sel__liveUpdaterWithConfiguration_queue_handler_, 0, queue);
}

+ (id)_liveUpdaterWithConfiguration:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v6;

  v6 = objc_msgSend_weakSharedInstance(CLLocationManager, a2, a3, (uint64_t)a4);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_liveUpdaterWithConfiguration_locationManager_queue_handler_, a3, v6);
}

+ (id)_liveUpdaterWithQueue:(id)a3 handler:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel__liveUpdaterWithConfiguration_queue_handler_, 0, a3);
}

+ (id)_historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v6;

  v6 = *(_QWORD *)&a4;
  objc_msgSend_weakSharedInstance(CLLocationManager, a2, (uint64_t)a3, *(uint64_t *)&a4);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_historicalUpdaterWithDateInterval_sampleCount_locationManager_queue_handler_, a3, v6);
}

+ (id)_historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 queue:(id)a7 handler:(id)a8
{
  uint64_t v8;

  v8 = *(_QWORD *)&a6;
  objc_msgSend_weakSharedInstance(CLLocationManager, a2, (uint64_t)a5, *(uint64_t *)&a6);
  return (id)MEMORY[0x1E0DE7D20](CLLocationUpdater, sel_historicalUpdaterWithCenter_radius_dateInterval_sampleCount_locationManager_queue_handler_, a5, v8);
}

- (CLLocationUpdater)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7
{
  CLLocationUpdater *v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  os_activity_scope_state_s v35;
  objc_super v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  CLLocationUpdater *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)CLLocationUpdater;
  v13 = -[CLLocationUpdater init](&v36, sel_init);
  if (v13)
  {
    v14 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v14, &v35);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290563;
      v38 = 0;
      v39 = 2082;
      v40 = "";
      v41 = 2082;
      v42 = "activity";
      v43 = 2114;
      v44 = v16;
      v45 = 2050;
      v46 = v13;
      v47 = 2082;
      v48 = a3;
      v49 = 2113;
      v50 = a4;
      v51 = 2050;
      v52 = a5;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s, \"messagePayload\":%{private, location:escape_only}@, \"manager\":\"%{public}p\"}", buf, 0x4Eu);
    }
    if (!a6)
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      v17 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v38 = 0;
        v39 = 2082;
        v40 = "";
        v41 = 2050;
        v42 = (const char *)v13;
        _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater has nil callback queue; Creating locally\", \"self\":\"%{public}p\"}",
          buf,
          0x1Cu);
      }
      a6 = (id)objc_msgSend_sharedQueue(CLLocationManager, v18, v19, v20);
    }
    v21 = objc_alloc(MEMORY[0x1E0D44528]);
    v13->_silo = (CLDispatchSilo *)objc_msgSend_initWithUnderlyingQueue_bePermissive_(v21, v22, (uint64_t)a6, 0);
    objc_msgSend_setManager_(v13, v23, (uint64_t)a5, v24);
    v13->_messageName = (NSString *)(id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v25, (uint64_t)a3, v26);
    v13->_mutableMsgDictionary = (NSMutableDictionary *)objc_msgSend_mutableCopy(a4, v27, v28, v29);
    objc_msgSend_setIdentityToken_(v13, v30, 0, v31);
    objc_msgSend_setShouldBeRunning_(v13, v32, 0, v33);
    v13->_lastTimestamp = 0.0;
    if (a7)
      v13->_clientCallback = _Block_copy(a7);
    os_activity_scope_leave(&v35);
  }
  return v13;
}

+ (id)liveUpdaterWithConfiguration:(int64_t)a3 locationManager:(id)a4 queue:(id)a5 handler:(id)a6
{
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CLLocationUpdater *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isMasquerading(a4, a2, a3, (uint64_t)a4) & 1) == 0 && !sub_18F5F6244())
    NSLog(&CFSTR("Error(CLLocationUpdater): NSLocationWhenInUseUsageDescription and NSLocationAlwaysAndWhenInUseUsageDescriptio"
                 "n are both missing from localized Info.plist").isa);
  v28 = CFSTR("config");
  v29[0] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a3, v11);
  v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v29, (uint64_t)&v28, 1);
  v14 = [CLLocationUpdater alloc];
  v16 = (id)objc_msgSend_initWithRegistrationMessageName_messagePayload_locationManager_queue_handler_(v14, v15, (uint64_t)"LocationUpdaterLive/kCLConnectionMessage", v13, a4, a5, a6);
  objc_msgSend_addIdentifiableClient_(a4, v17, (uint64_t)v16, v18);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v19 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2050;
    v27 = v16;
    _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater liveUpdaterWithConfiguration:queue:handler: created\", \"updater\":\"%{public}p\"}", (uint8_t *)&v22, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v20 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    v22 = 68289282;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2050;
    v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater liveUpdaterWithConfiguration:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater liveUpdaterWithConfiguration:queue:handler: created\", \"updater\":\"%{public}p\"}", (uint8_t *)&v22, 0x1Cu);
  }
  return v16;
}

+ (id)historicalUpdaterWithDateInterval:(id)a3 sampleCount:(int)a4 locationManager:(id)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v8;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CLLocationUpdater *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  _QWORD v33[4];
  _QWORD v34[4];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v27 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v36 = 0;
      v37 = 2082;
      v38 = "";
      v39 = 2050;
      v40 = a1;
      _os_log_impl(&dword_18F5B3000, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, interestInterval must be valid\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v28 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      return 0;
    *(_DWORD *)buf = 68289282;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = a1;
    v29 = "#locationUpdater, interestInterval must be valid";
    v30 = "{\"msg%{public}.0s\":\"#locationUpdater, interestInterval must be valid\", \"self\":\"%{public}p\"}";
    goto LABEL_24;
  }
  v8 = *(_QWORD *)&a4;
  if (a4 <= 0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v31 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v36 = 0;
      v37 = 2082;
      v38 = "";
      v39 = 2050;
      v40 = a1;
      _os_log_impl(&dword_18F5B3000, v31, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v28 = qword_1ECD8E750;
    if (!os_signpost_enabled((os_log_t)qword_1ECD8E750))
      return 0;
    *(_DWORD *)buf = 68289282;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = a1;
    v29 = "#locationUpdater, sampleCount must be greater than 0";
    v30 = "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}";
LABEL_24:
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v29, v30, buf, 0x1Cu);
    return 0;
  }
  v34[0] = &unk_1E29B5BC8;
  v34[1] = objc_msgSend_startDate(a3, a2, (uint64_t)a3, *(uint64_t *)&a4, CFSTR("kCLConnectionMessageTranscriptFetchRadiusKey"), CFSTR("kCLConnectionMessageLocationUpdaterStartDateKey"));
  v33[2] = CFSTR("kCLConnectionMessageLocationUpdaterEndDateKey");
  v34[2] = objc_msgSend_endDate(a3, v13, v14, v15);
  v33[3] = CFSTR("kCLConnectionMessageTranscriptFetchSampleCountKey");
  v34[3] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v16, v8, v17);
  v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v34, (uint64_t)v33, 4);
  v20 = [CLLocationUpdater alloc];
  v22 = (id)objc_msgSend_initWithRegistrationMessageName_messagePayload_locationManager_queue_handler_(v20, v21, (uint64_t)"LocationUpdaterHistorical/kCLConnectionMessage", v19, a5, a6, a7);
  objc_msgSend_addIdentifiableClient_(a5, v23, (uint64_t)v22, v24);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v25 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = v22;
    _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v26 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v36 = 0;
    v37 = 2082;
    v38 = "";
    v39 = 2050;
    v40 = v22;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithDateInterval:sampleCount:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
  }
  return v22;
}

+ (id)historicalUpdaterWithCenter:(CLLocationCoordinate2D)a3 radius:(double)a4 dateInterval:(id)a5 sampleCount:(int)a6 locationManager:(id)a7 queue:(id)a8 handler:(id)a9
{
  uint64_t v12;
  id v13;
  double longitude;
  double latitude;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  CLLocationUpdater *v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  _QWORD v54[6];
  _QWORD v55[6];
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v12 = *(_QWORD *)&a6;
  v13 = a5;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v62 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    v22 = objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v19, v20, v21);
    v26 = objc_msgSend_now(MEMORY[0x1E0C99D68], v23, v24, v25);
    v13 = (id)objc_msgSend_initWithStartDate_endDate_(v18, v27, v22, v26);
  }
  if ((int)v12 <= 0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v51 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v57 = 0;
      v58 = 2082;
      v59 = "";
      v60 = 2050;
      v61 = a1;
      _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v52 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v57 = 0;
      v58 = 2082;
      v59 = "";
      v60 = 2050;
      v61 = a1;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v52, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater, sampleCount must be greater than 0", "{\"msg%{public}.0s\":\"#locationUpdater, sampleCount must be greater than 0\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    }
    return 0;
  }
  else
  {
    v55[0] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, (uint64_t)a5, *(uint64_t *)&a6, latitude, CFSTR("kCLConnectionMessageTranscriptFetchCenterLatitudeKey"));
    v54[1] = CFSTR("kCLConnectionMessageTranscriptFetchCenterLongitudeKey");
    v55[1] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v28, v29, v30, longitude);
    v54[2] = CFSTR("kCLConnectionMessageTranscriptFetchRadiusKey");
    v55[2] = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v31, v32, v33, a4);
    v54[3] = CFSTR("kCLConnectionMessageLocationUpdaterStartDateKey");
    v55[3] = objc_msgSend_startDate(v13, v34, v35, v36);
    v54[4] = CFSTR("kCLConnectionMessageLocationUpdaterEndDateKey");
    v55[4] = objc_msgSend_endDate(v13, v37, v38, v39);
    v54[5] = CFSTR("kCLConnectionMessageTranscriptFetchSampleCountKey");
    v55[5] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v40, v12, v41);
    v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)v55, (uint64_t)v54, 6);
    v44 = [CLLocationUpdater alloc];
    v46 = (id)objc_msgSend_initWithRegistrationMessageName_messagePayload_locationManager_queue_handler_(v44, v45, (uint64_t)"LocationUpdaterHistorical/kCLConnectionMessage", v43, a7, a8, a9);
    objc_msgSend_addIdentifiableClient_(a7, v47, (uint64_t)v46, v48);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v49 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v57 = 0;
      v58 = 2082;
      v59 = "";
      v60 = 2050;
      v61 = v46;
      _os_log_impl(&dword_18F5B3000, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v50 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v57 = 0;
      v58 = 2082;
      v59 = "";
      v60 = 2050;
      v61 = v46;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created", "{\"msg%{public}.0s\":\"#locationUpdater historicalUpdaterWithCenter:radius:dateInterval:sampleCount:queue:handler: created\", \"updater\":\"%{public}p\"}", buf, 0x1Cu);
    }
  }
  return v46;
}

- (void)pause
{
  uint64_t v2;
  NSObject *v5;
  NSObject *v6;
  NSString *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  CLDispatchSilo *silo;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CLLocationUpdater *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  CLLocationUpdater *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_setShouldBeRunning_(self, a2, 0, v2);
  v5 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v6 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = (CLLocationUpdater *)"activity";
    v21 = 2114;
    v22 = v7;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater pause is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v9 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2050;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater pause is called", "{\"msg%{public}.0s\":\"#locationUpdater pause is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  silo = self->_silo;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F616490;
  v13[3] = &unk_1E2990DE0;
  v13[4] = self;
  objc_msgSend_async_(silo, v10, (uint64_t)v13, v11);
  os_activity_scope_leave(&state);
}

- (void)resume
{
  uint64_t v2;
  NSObject *v5;
  NSObject *v6;
  NSString *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  CLDispatchSilo *silo;
  _QWORD v13[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CLLocationUpdater *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  CLLocationUpdater *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_setShouldBeRunning_(self, a2, 1, v2);
  v5 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v6 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = (CLLocationUpdater *)"activity";
    v21 = 2114;
    v22 = v7;
    v23 = 2050;
    v24 = self;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v8 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2050;
    v20 = self;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater resume is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v9 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2050;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater resume is called", "{\"msg%{public}.0s\":\"#locationUpdater resume is called\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  silo = self->_silo;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F61675C;
  v13[3] = &unk_1E2990DE0;
  v13[4] = self;
  objc_msgSend_async_(silo, v10, (uint64_t)v13, v11);
  os_activity_scope_leave(&state);
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
  CLLocationUpdater *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
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
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  silo = self->_silo;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F616ACC;
  v13[3] = &unk_1E2991118;
  v13[4] = self;
  v13[5] = a3;
  objc_msgSend_async_(silo, v9, (uint64_t)v13, v10);
  os_activity_scope_leave(&state);
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

  self->_mutableMsgDictionary = 0;
  self->_messageName = 0;
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
  CLLocationUpdater *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F616D34;
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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[5];
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
  CLLocationUpdater *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_setShouldBeRunning_(self, v6, 0, v7);
  silo = self->_silo;
  locationdConnection = self->_locationdConnection;
  v11 = MEMORY[0x1E0C809B0];
  self->_locationdConnection = 0;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_18F616F18;
  v18[3] = &unk_1E29910D0;
  v18[4] = locationdConnection;
  objc_msgSend_async_(silo, v12, (uint64_t)v18, v13);
  self->_silo = 0;
  objc_msgSend_cleanup(self, v14, v15, v16);
  v17.receiver = self;
  v17.super_class = (Class)CLLocationUpdater;
  -[CLLocationUpdater dealloc](&v17, sel_dealloc);
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
  CLLocationUpdater *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v16);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
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
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_assertInside(self->_silo, v6, v7, v8);
  if (objc_msgSend_shouldBeRunning(self, v10, v11, v12)
    && objc_msgSend_identityToken(self, v13, v14, v15))
  {
    objc_msgSend_createConnection(self, v13, v14, v15);
  }
  else
  {
    objc_msgSend_destroyConnection(self, v13, v14, v15);
  }
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
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  double v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  double lastTimestamp;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  double v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  NSMutableDictionary *mutableMsgDictionary;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  std::__shared_weak_count *v73;
  id v74;
  id location;
  void *__p[2];
  char v77;
  uint8_t buf[8];
  __int16 v79;
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  CLLocationUpdater *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (!self->_locationdConnection)
  {
    if (!self->_clientCallback)
    {
      if (qword_1ECD8E758 != -1)
        goto LABEL_45;
      while (1)
      {
        v70 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
        {
          *(_QWORD *)buf = 68289539;
          v79 = 2082;
          v80 = "";
          v81 = 2082;
          v82 = "assert";
          v83 = 2081;
          v84 = (CLLocationUpdater *)"_clientCallback != nullptr";
          _os_log_impl(&dword_18F5B3000, v70, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
        }
        v71 = qword_1ECD8E750;
        if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
        {
          *(_QWORD *)buf = 68289539;
          v79 = 2082;
          v80 = "";
          v81 = 2082;
          v82 = "assert";
          v83 = 2081;
          v84 = (CLLocationUpdater *)"_clientCallback != nullptr";
          _os_signpost_emit_with_name_impl(&dword_18F5B3000, v71, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater client callback handler should not be nil when attempting to -resume", "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
        }
        v72 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
        {
          *(_QWORD *)buf = 68289539;
          v79 = 2082;
          v80 = "";
          v81 = 2082;
          v82 = "assert";
          v83 = 2081;
          v84 = (CLLocationUpdater *)"_clientCallback != nullptr";
          _os_log_impl(&dword_18F5B3000, v72, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#locationUpdater client callback handler should not be nil when attempting to -resume\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        abort_report_np();
        __break(1u);
LABEL_45:
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      }
    }
    v5 = (void *)operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    v9 = objc_msgSend_queue(self->_silo, v6, v7, v8);
    MEMORY[0x194002AB4](v5, __p, v9);
    self->_locationdConnection = v5;
    if (v77 < 0)
      operator delete(__p[0]);
    objc_initWeak(&location, self);
    objc_copyWeak(&v74, &location);
    CLConnection::setDefaultMessageHandler();
    CLConnection::start((CLConnection *)self->_locationdConnection);
    if (objc_msgSend_identityToken(self, v10, v11, v12))
    {
      v16 = objc_msgSend_identityToken(self, v13, v14, v15);
      objc_msgSend_setObject_forKeyedSubscript_(self->_mutableMsgDictionary, v17, v16, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"));
    }
    v18 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_mutableMsgDictionary, v13, (uint64_t)CFSTR("kCLConnectionMessageLocationUpdaterStartDateKey"), v15);
    v24 = (id)objc_msgSend_objectForKeyedSubscript_(self->_mutableMsgDictionary, v19, (uint64_t)CFSTR("kCLConnectionMessageLocationUpdaterEndDateKey"), v20);
    if (v24)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(v18, v21, v22, v23);
      if (v25 <= self->_lastTimestamp)
      {
        v26 = objc_alloc(MEMORY[0x1E0C99D68]);
        v30 = (id)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v26, v27, v28, v29, self->_lastTimestamp);
        lastTimestamp = self->_lastTimestamp;
        objc_msgSend_timeIntervalSinceReferenceDate(v24, v32, v33, v34);
        if (lastTimestamp >= v36)
        {
          v37 = objc_alloc(MEMORY[0x1E0C99D68]);
          v24 = (id)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v37, v38, v39, v40, self->_lastTimestamp);
        }
        objc_msgSend_setObject_forKeyedSubscript_(self->_mutableMsgDictionary, v35, (uint64_t)v30, (uint64_t)CFSTR("kCLConnectionMessageLocationUpdaterStartDateKey"));
        objc_msgSend_setObject_forKeyedSubscript_(self->_mutableMsgDictionary, v41, (uint64_t)v24, (uint64_t)CFSTR("kCLConnectionMessageLocationUpdaterEndDateKey"));
      }
    }
    v42 = (void *)MEMORY[0x1E0CB37E8];
    v43 = dyld_program_sdk_at_least();
    v46 = objc_msgSend_numberWithBool_(v42, v44, v43, v45);
    objc_msgSend_setObject_forKeyedSubscript_(self->_mutableMsgDictionary, v47, v46, (uint64_t)CFSTR("SDKAtLeast2024"));
    v51 = (char *)objc_msgSend_UTF8String(self->_messageName, v48, v49, v50);
    mutableMsgDictionary = self->_mutableMsgDictionary;
    v53 = (std::__shared_weak_count *)operator new(0x70uLL);
    v53->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v53->__shared_owners_;
    v53->__shared_weak_owners_ = 0;
    v53->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
    sub_18F5D5990(buf, v51);
    MEMORY[0x194002B44](&v53[1], buf, mutableMsgDictionary);
    if (SBYTE3(v82) < 0)
      operator delete(*(void **)buf);
    v73 = v53;
    do
      v55 = __ldxr(p_shared_owners);
    while (__stxr(v55 + 1, p_shared_owners));
    CLConnection::sendMessage();
    if (v53)
    {
      v56 = (unint64_t *)&v53->__shared_owners_;
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v58 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v62 = objc_msgSend_identityToken(self, v59, v60, v61);
      *(_QWORD *)buf = 68289538;
      v79 = 2082;
      v80 = "";
      v81 = 2114;
      v82 = (const char *)v62;
      v83 = 2050;
      v84 = self;
      _os_log_impl(&dword_18F5B3000, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater connection created\", \"identityToken\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v63 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v67 = objc_msgSend_identityToken(self, v64, v65, v66);
      *(_QWORD *)buf = 68289538;
      v79 = 2082;
      v80 = "";
      v81 = 2114;
      v82 = (const char *)v67;
      v83 = 2050;
      v84 = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater connection created", "{\"msg%{public}.0s\":\"#locationUpdater connection created\", \"identityToken\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    if (v73)
    {
      v68 = (unint64_t *)&v73->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
    objc_destroyWeak(&v74);
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
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
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
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
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
  CLConnection *locationdConnection;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  uint8_t buf[4];
  int v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  CLLocationUpdater *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (self->_locationdConnection)
  {
    if (objc_msgSend_identityToken(self, v5, v6, v7) && (objc_msgSend_shouldBeRunning(self, v8, v9, v10) & 1) == 0)
    {
      sub_18F619E48("kCLConnectionMessageDestroyUponDisconnection", &v66);
      v64 = v66;
      v65 = v67;
      if (v67)
      {
        p_shared_owners = (unint64_t *)&v67->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      CLConnection::sendMessage();
      if (v65)
      {
        v13 = (unint64_t *)&v65->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
          std::__shared_weak_count::__release_weak(v65);
        }
      }
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      v15 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_msgSend_identityToken(self, v16, v17, v18, v64);
        v23 = objc_msgSend_UTF8String(v19, v20, v21, v22);
        *(_DWORD *)buf = 68289538;
        v69 = 0;
        v70 = 2082;
        v71 = "";
        v72 = 2082;
        v73 = v23;
        v74 = 2050;
        v75 = self;
        _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      }
      v24 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        v28 = (void *)objc_msgSend_identityToken(self, v25, v26, v27);
        v32 = objc_msgSend_UTF8String(v28, v29, v30, v31);
        *(_DWORD *)buf = 68289538;
        v69 = 0;
        v70 = 2082;
        v71 = "";
        v72 = 2082;
        v73 = v32;
        v74 = 2050;
        v75 = self;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater destroyUponDisconnection(DIC)", "{\"msg%{public}.0s\":\"#locationUpdater destroyUponDisconnection(DIC)\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      v33 = v67;
      if (v67)
      {
        v34 = (unint64_t *)&v67->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v36 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_msgSend_identityToken(self, v37, v38, v39);
      v44 = objc_msgSend_UTF8String(v40, v41, v42, v43);
      *(_DWORD *)buf = 68289538;
      v69 = 0;
      v70 = 2082;
      v71 = "";
      v72 = 2082;
      v73 = v44;
      v74 = 2050;
      v75 = self;
      _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v45 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v49 = (void *)objc_msgSend_identityToken(self, v46, v47, v48);
      v53 = objc_msgSend_UTF8String(v49, v50, v51, v52);
      *(_DWORD *)buf = 68289538;
      v69 = 0;
      v70 = 2082;
      v71 = "";
      v72 = 2082;
      v73 = v53;
      v74 = 2050;
      v75 = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v45, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater destroying connection", "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    locationdConnection = (CLConnection *)self->_locationdConnection;
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v55 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (void *)objc_msgSend_identityToken(self, v56, v57, v58);
      v63 = objc_msgSend_UTF8String(v59, v60, v61, v62);
      *(_DWORD *)buf = 68289538;
      v69 = 0;
      v70 = 2082;
      v71 = "";
      v72 = 2082;
      v73 = v63;
      v74 = 2050;
      v75 = self;
      _os_log_impl(&dword_18F5B3000, v55, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater destroying connection\", \"identityToken\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
    }
  }
}

- (void)handleMessageLocation:(shared_ptr<CLConnectionMessage>)a3
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
  uint64_t v21;
  NSString *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CLUpdate *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  CLLocationUpdater *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  var0 = a3.var0;
  v63 = *MEMORY[0x1E0C80C00];
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
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      v52 = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2082;
      v56 = "activity";
      v57 = 2114;
      v58 = v22;
      v59 = 2050;
      v60 = self;
      v61 = 2113;
      v62 = DictionaryOfClasses;
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    v23 = copyLocationsFromLocationMessagePayload(DictionaryOfClasses, v19, v20, v21);
    if (objc_msgSend_count(v23, v24, v25, v26))
      v29 = objc_msgSend_objectAtIndexedSubscript_(v23, v27, 0, v28);
    else
      v29 = 0;
    v30 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v27, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v28);
    v34 = objc_msgSend_unsignedLongValue(v30, v31, v32, v33);
    v35 = [CLUpdate alloc];
    v37 = (void *)objc_msgSend_initWithLocation_diagnostics_(v35, v36, v29, v34);
    (*((void (**)(void))self->_clientCallback + 2))();
    v41 = (void *)objc_msgSend_location(v37, v38, v39, v40);
    v45 = (void *)objc_msgSend_timestamp(v41, v42, v43, v44);
    objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48);
    self->_lastTimestamp = v49;

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageLocationUnavailable:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage *var0;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CLConnectionMessage *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSSet *v17;
  void *DictionaryOfClasses;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CLUpdate *v29;
  const char *v30;
  void *v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  CLLocationUpdater *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  CLLocationUpdater *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  var0 = a3.var0;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3.var0, (uint64_t)a3.var1);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v6 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v34 = 0;
    v35 = 2082;
    v36 = "";
    v37 = 2050;
    v38 = self;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater location unavailable\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v7 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v34 = 0;
    v35 = 2082;
    v36 = "";
    v37 = 2050;
    v38 = self;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater location unavailable", "{\"msg%{public}.0s\":\"#locationUpdater location unavailable\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  if (objc_msgSend_shouldBeRunning(self, v8, v9, v10) && self->_clientCallback)
  {
    v11 = *(CLConnectionMessage **)var0;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v17 = (NSSet *)objc_msgSend_setWithObjects_(v12, v15, v13, v16, v14, 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v11, v17);
    v19 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v19, &state);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v20 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 2082;
      v38 = (CLLocationUpdater *)"activity";
      v39 = 2114;
      v40 = v23;
      v41 = 2050;
      v42 = self;
      v43 = 2113;
      v44 = DictionaryOfClasses;
      _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    v24 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v21, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v22);
    v28 = objc_msgSend_unsignedLongValue(v24, v25, v26, v27);
    v29 = [CLUpdate alloc];
    v31 = (void *)objc_msgSend_initWithLocation_diagnostics_(v29, v30, 0, v28);
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageHistoricalLocations:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  CLUpdate *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  const char *v55;
  CLUpdate *v56;
  const char *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  os_activity_scope_state_s state;
  _BYTE v64[128];
  uint64_t buf;
  __int16 v66;
  const char *v67;
  __int16 v68;
  _BYTE v69[18];
  __int16 v70;
  CLLocationUpdater *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  var0 = (CLConnectionMessage **)a3.var0;
  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3.var0, (uint64_t)a3.var1);
  if (objc_msgSend_shouldBeRunning(self, v6, v7, v8) && self->_clientCallback)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v15 = (NSSet *)objc_msgSend_setWithObjects_(v9, v13, v10, v14, v11, v12, 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15);
    v17 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v17, &state);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      buf = 68290051;
      v66 = 2082;
      v67 = "";
      v68 = 2082;
      *(_QWORD *)v69 = "activity";
      *(_WORD *)&v69[8] = 2114;
      *(_QWORD *)&v69[10] = v21;
      v70 = 2050;
      v71 = self;
      v72 = 2113;
      v73 = DictionaryOfClasses;
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Au);
    }
    v22 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v19, (uint64_t)CFSTR("Locations"), v20);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v23 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend_count(v22, v24, v25, v26);
      buf = 68289538;
      v66 = 2082;
      v67 = "";
      v68 = 1026;
      *(_DWORD *)v69 = v27;
      *(_WORD *)&v69[4] = 2050;
      *(_QWORD *)&v69[6] = self;
      _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historical received historicalLocations\", \"Count\":%{public}d, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x22u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v28 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      v32 = objc_msgSend_count(v22, v29, v30, v31);
      buf = 68289538;
      v66 = 2082;
      v67 = "";
      v68 = 1026;
      *(_DWORD *)v69 = v32;
      *(_WORD *)&v69[4] = 2050;
      *(_QWORD *)&v69[6] = self;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historical received historicalLocations", "{\"msg%{public}.0s\":\"#locationUpdater historical received historicalLocations\", \"Count\":%{public}d, \"self\":\"%{public}p\"}", (uint8_t *)&buf, 0x22u);
    }
    v33 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v29, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v31);
    v37 = objc_msgSend_unsignedLongValue(v33, v34, v35, v36);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v38, (uint64_t)&v59, (uint64_t)v64, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v60 != v40)
            objc_enumerationMutation(v22);
          v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v43 = (void *)MEMORY[0x1940032C4]();
          v44 = [CLUpdate alloc];
          v46 = (void *)objc_msgSend_initWithLocation_diagnostics_(v44, v45, (uint64_t)v42, v37);
          (*((void (**)(void))self->_clientCallback + 2))();

          v50 = (void *)objc_msgSend_timestamp(v42, v47, v48, v49);
          objc_msgSend_timeIntervalSinceReferenceDate(v50, v51, v52, v53);
          self->_lastTimestamp = v54;
          objc_autoreleasePoolPop(v43);
        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v55, (uint64_t)&v59, (uint64_t)v64, 16);
      }
      while (v39);
    }
    v56 = [CLUpdate alloc];
    v58 = (void *)objc_msgSend_initWithLocation_diagnostics_(v56, v57, 0, v37);
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)handleMessageHistoricalLocationsFinished:(shared_ptr<CLConnectionMessage>)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void (**clientCallback)(id, _QWORD);
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CLLocationUpdater *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3.var0, (uint64_t)a3.var1);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  v4 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2050;
    v15 = self;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#locationUpdater historical delivery completed\", \"self\":\"%{public}p\"}", (uint8_t *)&v10, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v5 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    v10 = 68289282;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2050;
    v15 = self;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater historical delivery completed", "{\"msg%{public}.0s\":\"#locationUpdater historical delivery completed\", \"self\":\"%{public}p\"}", (uint8_t *)&v10, 0x1Cu);
  }
  clientCallback = (void (**)(id, _QWORD))self->_clientCallback;
  if (clientCallback)
    clientCallback[2](clientCallback, 0);
  objc_msgSend_invalidate(self, v6, v7, v8);
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
  uint64_t v26;
  CLUpdate *v27;
  const char *v28;
  void *v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  CLLocationUpdater *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  var0 = a3.var0;
  v43 = *MEMORY[0x1E0C80C00];
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
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290051;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      v35 = 2082;
      v36 = "activity";
      v37 = 2114;
      v38 = v21;
      v39 = 2050;
      v40 = self;
      v41 = 2113;
      v42 = DictionaryOfClasses;
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"payload\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    v22 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v19, (uint64_t)CFSTR("kCLConnectionMessageDiagnosticsKey"), v20);
    v26 = objc_msgSend_unsignedLongValue(v22, v23, v24, v25);
    v27 = [CLUpdate alloc];
    v29 = (void *)objc_msgSend_initWithLocation_diagnostics_(v27, v28, 0, v26);
    (*((void (**)(void))self->_clientCallback + 2))();

    os_activity_scope_leave(&state);
  }
}

- (void)setHandler:(id)a3
{
  CLLocationUpdater *v3;
  void **p_cache;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_clientCallback)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    v7 = qword_1ECD8E750;
    p_cache = (void **)"assert";
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "_clientCallback == nullptr";
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v8 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "_clientCallback == nullptr";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater should initially be nil", "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    }
    v3 = (CLLocationUpdater *)qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2082;
      v14 = "assert";
      v15 = 2081;
      v16 = "_clientCallback == nullptr";
      _os_log_impl(&dword_18F5B3000, &v3->super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#locationUpdater should initially be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_22:
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
    goto LABEL_5;
  }
  v3 = self;
  if (a3)
  {
    self->_clientCallback = _Block_copy(a3);
    return;
  }
  p_cache = &OBJC_METACLASS___CLAssertion.cache;
  if (qword_1ECD8E758 != -1)
    goto LABEL_22;
LABEL_5:
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2050;
    v14 = (const char *)v3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#locationUpdater can't set a nil handler\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    if (p_cache[235] != (void *)-1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
  }
  v6 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2050;
    v14 = (const char *)v3;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater can't set a nil handler", "{\"msg%{public}.0s\":\"#locationUpdater can't set a nil handler\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
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
  _QWORD *v18;
  int v19;
  _QWORD *v20;
  int v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  _QWORD *v30;
  int v31;
  const char *v32;
  uint64_t v33;
  _QWORD *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  int v41;
  NSObject *v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  uint64_t v49;
  const char *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t *v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t *v66;
  CLConnectionMessage *v67;
  std::__shared_weak_count *v68;
  CLConnectionMessage *v69;
  std::__shared_weak_count *v70;
  CLConnectionMessage *v71;
  std::__shared_weak_count *v72;
  CLConnectionMessage *v73;
  std::__shared_weak_count *v74;
  CLConnectionMessage *v75;
  std::__shared_weak_count *v76;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  CLLocationUpdater *v85;
  __int16 v86;
  CLLocationUpdater *v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  var0 = a3.var0;
  v90 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLLocationUpdater #locationUpdater", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
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
    v79 = 0;
    v80 = 2082;
    v81 = "";
    v82 = 2082;
    v83 = "activity";
    v84 = 2114;
    v85 = (CLLocationUpdater *)v8;
    v86 = 2050;
    v87 = self;
    v88 = 2082;
    v89 = v10;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLLocationUpdater #locationUpdater\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"message\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v11 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v14 = *(char *)(v11 + 23);
  if (v14 < 0)
  {
    if (*(_QWORD *)(v11 + 8) != 28)
      goto LABEL_23;
    v11 = *(_QWORD *)v11;
  }
  else if (v14 != 28)
  {
    goto LABEL_23;
  }
  if (*(_QWORD *)v11 == 0x656E6E6F434C436BLL
    && *(_QWORD *)(v11 + 8) == 0x73654D6E6F697463
    && *(_QWORD *)(v11 + 16) == 0x61636F4C65676173
    && *(_DWORD *)(v11 + 24) == 1852795252)
  {
    goto LABEL_32;
  }
LABEL_23:
  v18 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v19 = *((char *)v18 + 23);
  if (v19 < 0)
  {
    if (v18[1] != 39)
      goto LABEL_29;
    v18 = (_QWORD *)*v18;
LABEL_28:
    if (memcmp(v18, "kCLConnectionMessageCompensatedLocation", 0x27uLL))
      goto LABEL_29;
LABEL_32:
    v22 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v75 = *(CLConnectionMessage **)var0;
    v76 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
    }
    objc_msgSend_handleMessageLocation_(self, v12, (uint64_t)&v75, v13);
    v25 = v76;
    if (!v76)
      goto LABEL_111;
    v26 = (unint64_t *)&v76->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    goto LABEL_109;
  }
  if (v19 == 39)
    goto LABEL_28;
LABEL_29:
  v20 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v21 = *((char *)v20 + 23);
  if (v21 < 0)
  {
    if (v20[1] != 39)
      goto LABEL_42;
    v20 = (_QWORD *)*v20;
  }
  else if (v21 != 39)
  {
    goto LABEL_42;
  }
  if (!memcmp(v20, "kCLConnectionMessageHistoricalLocations", 0x27uLL))
  {
    v51 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v73 = *(CLConnectionMessage **)var0;
    v74 = v51;
    if (v51)
    {
      v52 = (unint64_t *)&v51->__shared_owners_;
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
    objc_msgSend_handleMessageHistoricalLocations_(self, v28, (uint64_t)&v73, v29);
    v25 = v74;
    if (!v74)
      goto LABEL_111;
    v54 = (unint64_t *)&v74->__shared_owners_;
    do
      v27 = __ldaxr(v54);
    while (__stlxr(v27 - 1, v54));
    goto LABEL_109;
  }
LABEL_42:
  v30 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v31 = *((char *)v30 + 23);
  if (v31 < 0)
  {
    if (v30[1] != 47)
      goto LABEL_48;
    v30 = (_QWORD *)*v30;
  }
  else if (v31 != 47)
  {
    goto LABEL_48;
  }
  if (!memcmp(v30, "kCLConnectionMessageHistoricalLocationsFinished", 0x2FuLL))
  {
    v55 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v71 = *(CLConnectionMessage **)var0;
    v72 = v55;
    if (v55)
    {
      v56 = (unint64_t *)&v55->__shared_owners_;
      do
        v57 = __ldxr(v56);
      while (__stxr(v57 + 1, v56));
    }
    objc_msgSend_handleMessageHistoricalLocationsFinished_(self, v32, (uint64_t)&v71, v33);
    v25 = v72;
    if (!v72)
      goto LABEL_111;
    v58 = (unint64_t *)&v72->__shared_owners_;
    do
      v27 = __ldaxr(v58);
    while (__stlxr(v27 - 1, v58));
    goto LABEL_109;
  }
LABEL_48:
  v34 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v35 = *((char *)v34 + 23);
  if (v35 < 0)
  {
    if (v34[1] != 39)
      goto LABEL_54;
    v34 = (_QWORD *)*v34;
    goto LABEL_53;
  }
  if (v35 == 39)
  {
LABEL_53:
    if (memcmp(v34, "kCLConnectionMessageLocationUnavailable", 0x27uLL))
      goto LABEL_54;
    v59 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v69 = *(CLConnectionMessage **)var0;
    v70 = v59;
    if (v59)
    {
      v60 = (unint64_t *)&v59->__shared_owners_;
      do
        v61 = __ldxr(v60);
      while (__stxr(v61 + 1, v60));
    }
    objc_msgSend_handleMessageLocationUnavailable_(self, v36, (uint64_t)&v69, v37);
    v25 = v70;
    if (!v70)
      goto LABEL_111;
    v62 = (unint64_t *)&v70->__shared_owners_;
    do
      v27 = __ldaxr(v62);
    while (__stlxr(v27 - 1, v62));
LABEL_109:
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
    goto LABEL_111;
  }
LABEL_54:
  v38 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
  v41 = *(char *)(v38 + 23);
  if (v41 < 0)
  {
    if (*(_QWORD *)(v38 + 8) != 31)
    {
LABEL_69:
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      v45 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
      {
        v46 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
        v47 = *(char *)(v46 + 23) >= 0 ? (const char *)v46 : *(const char **)v46;
        *(_DWORD *)buf = 68289538;
        v79 = 0;
        v80 = 2082;
        v81 = "";
        v82 = 2082;
        v83 = v47;
        v84 = 2050;
        v85 = self;
        _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#locationUpdater received unhandled message\", \"Message\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990310);
      }
      v48 = qword_1ECD8E750;
      if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
      {
        v49 = CLConnectionMessage::name(*(CLConnectionMessage **)var0);
        if (*(char *)(v49 + 23) >= 0)
          v50 = (const char *)v49;
        else
          v50 = *(const char **)v49;
        *(_DWORD *)buf = 68289538;
        v79 = 0;
        v80 = 2082;
        v81 = "";
        v82 = 2082;
        v83 = v50;
        v84 = 2050;
        v85 = self;
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#locationUpdater received unhandled message", "{\"msg%{public}.0s\":\"#locationUpdater received unhandled message\", \"Message\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x26u);
      }
      goto LABEL_111;
    }
    v38 = *(_QWORD *)v38;
  }
  else if (v41 != 31)
  {
    goto LABEL_69;
  }
  if (*(_QWORD *)v38 != 0x656E6E6F434C436BLL
    || *(_QWORD *)(v38 + 8) != 0x73654D6E6F697463
    || *(_QWORD *)(v38 + 16) != 0x6761694465676173
    || *(_QWORD *)(v38 + 23) != 0x73636974736F6E67)
  {
    goto LABEL_69;
  }
  v63 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v67 = *(CLConnectionMessage **)var0;
  v68 = v63;
  if (v63)
  {
    v64 = (unint64_t *)&v63->__shared_owners_;
    do
      v65 = __ldxr(v64);
    while (__stxr(v65 + 1, v64));
  }
  objc_msgSend_handleMessageDiagnostics_(self, v39, (uint64_t)&v67, v40);
  v25 = v68;
  if (v68)
  {
    v66 = (unint64_t *)&v68->__shared_owners_;
    do
      v27 = __ldaxr(v66);
    while (__stlxr(v27 - 1, v66));
    goto LABEL_109;
  }
LABEL_111:
  os_activity_scope_leave(&state);
}

- (NSString)identityToken
{
  return self->identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSData)storageToken
{
  return self->storageToken;
}

- (void)setStorageToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CLLocationManager)manager
{
  return self->manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
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

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);
  sub_18F619CEC(&self->_callbackDropManager._vptr$CLCallbackDropManager);
}

- (id).cxx_construct
{
  char *v3;

  self->_callbackDropManager._vptr$CLCallbackDropManager = (void **)&off_1E298F6F8;
  v3 = (char *)operator new(0x20uLL);
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &off_1E298FF28;
  self->_callbackDropManager.fToken.__cntrl_ = (__shared_weak_count *)v3;
  *((_DWORD *)v3 + 6) = 31337;
  self->_callbackDropManager.fToken.__ptr_ = (int *)(v3 + 24);
  return self;
}

@end
