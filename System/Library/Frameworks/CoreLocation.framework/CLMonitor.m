@implementation CLMonitor

- (CLMonitor)initWithLedgerName:(id)a3 path:(id)a4 onSilo:(id)a5 authIdentity:(id)a6 locationManager:(id)a7 handler:(id)a8
{
  CLMonitor *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  const char *v22;
  uint64_t v23;
  _BOOL8 v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CLDispatchSilo *silo;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  CLConditionLedger *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  os_activity_scope_state_s v63;
  objc_super v64;
  _QWORD v65[5];
  _QWORD v66[5];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  NSString *v74;
  __int16 v75;
  CLMonitor *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)CLMonitor;
  v15 = -[CLMonitor init](&v64, sel_init);
  if (v15)
  {
    v16 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v16, &v63);

    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 68290307;
      v68 = 0;
      v69 = 2082;
      v70 = "";
      v71 = 2082;
      v72 = "activity";
      v73 = 2114;
      v74 = v21;
      v75 = 2050;
      v76 = v15;
      v77 = 2114;
      v78 = a3;
      v79 = 2113;
      v80 = a6;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"authIdentity\":%{private, location:escape_only}@}", buf, 0x44u);
    }
    v15->_name = (NSString *)objc_msgSend_copy(a3, v18, v19, v20);
    v15->_silo = (CLDispatchSilo *)a5;
    objc_msgSend_setManager_(v15, v22, (uint64_t)a7, v23);
    v24 = a4 != 0;
    v27 = objc_msgSend_objectForKeyedSubscript_(a6, v25, (uint64_t)CFSTR("kCLMonitorIdentityTokenKey"), v26);
    v30 = objc_msgSend_objectForKeyedSubscript_(a6, v28, (uint64_t)CFSTR("kCLMonitorLedgerAccessKey"), v29);
    v34 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v31, v32, v33);
    v66[0] = a3;
    v65[0] = CFSTR("kCLMonitorLedgerNameKey");
    v65[1] = CFSTR("kCLMonitorLedgerProcessNameKey");
    v38 = (void *)objc_msgSend_manager(v15, v35, v36, v37);
    v42 = objc_msgSend_processName(v38, v39, v40, v41);
    v65[2] = CFSTR("kCLMonitorDispatchSiloKey");
    silo = v15->_silo;
    v66[1] = v42;
    v66[2] = silo;
    v65[3] = CFSTR("kCLMonitorIdentityTokenKey");
    v65[4] = CFSTR("kCLMonitorLedgerAccessKey");
    v66[3] = v27;
    v66[4] = v30;
    v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v44, (uint64_t)v66, (uint64_t)v65, 5);
    objc_msgSend_addEntriesFromDictionary_(v34, v46, v45, v47);
    if (a4)
    {
      v51 = (void *)objc_msgSend_copy(a4, v48, v49, v50);
      objc_msgSend_setObject_forKeyedSubscript_(v34, v52, (uint64_t)v51, (uint64_t)CFSTR("kCLMonitorLedgerPathKey"));

    }
    objc_msgSend_setIdentityToken_(v15, v48, v27, v50);
    objc_msgSend_setStorageToken_(v15, v53, v30, v54);
    v55 = [CLConditionLedger alloc];
    v15->_conditionLedger = (CLConditionLedger *)objc_msgSend_initWithStoreType_domain_monitorConfiguration_(v55, v56, v24, v24, v34);
    objc_msgSend_setMonitoringEventHandler_(v15, v57, (uint64_t)a8, v58);
    objc_msgSend_createConnection(v15, v59, v60, v61);
    os_activity_scope_leave(&v63);
  }
  return v15;
}

- (void)dealloc
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  CLDispatchSilo *silo;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  objc_super v34;
  _QWORD block[6];
  os_activity_scope_state_s state;
  uint8_t buf[8];
  _BYTE v38[30];
  __int16 v39;
  CLMonitor *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    v13 = (void *)objc_msgSend_name(self, v10, v11, v12);
    v17 = objc_msgSend_UTF8String(v13, v14, v15, v16);
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v38 = 2082;
    *(_QWORD *)&v38[2] = "";
    *(_WORD *)&v38[10] = 2082;
    *(_QWORD *)&v38[12] = "activity";
    *(_WORD *)&v38[20] = 2114;
    *(_QWORD *)&v38[22] = v9;
    v39 = 2050;
    v40 = self;
    v41 = 2082;
    v42 = v17;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}s}", buf, 0x3Au);
  }
  v18 = (void *)objc_msgSend_manager(self, v6, v7, v8);
  objc_msgSend_removeIdentifiableClient_(v18, v19, (uint64_t)self, v20);
  _Block_release(self->_eventHandler);
  self->_eventHandler = 0;
  objc_msgSend_setIdentityToken_(self, v21, 0, v22);
  objc_msgSend_setStorageToken_(self, v23, 0, v24);

  self->_conditionLedger = 0;
  objc_msgSend_setManager_(self, v25, 0, v26);
  objc_msgSend_removeMonitorName_(CLMonitor, v27, (uint64_t)self->_name, v28);

  self->_name = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v38 = buf;
  *(_QWORD *)&v38[8] = 0x2020000000;
  silo = self->_silo;
  *(_QWORD *)&v38[16] = self->_locationdConnection;
  v33 = objc_msgSend_queue(silo, v30, v31, v32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6E815C;
  block[3] = &unk_1E2992AC0;
  block[4] = silo;
  block[5] = buf;
  dispatch_async(v33, block);

  self->_silo = 0;
  v34.receiver = self;
  v34.super_class = (Class)CLMonitor;
  -[CLMonitor dealloc](&v34, sel_dealloc);
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_name(self, a2, v2, v3);
  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (NSArray)monitoredIdentifiers
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
  NSArray *v13;
  os_activity_scope_state_s v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  CLMonitor *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &v15);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68289794;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = "activity";
    v22 = 2114;
    v23 = v9;
    v24 = 2050;
    v25 = self;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  objc_msgSend_assertInside(self->_silo, v6, v7, v8);
  v13 = (NSArray *)objc_msgSend_allMonitoringIdentifiers(self->_conditionLedger, v10, v11, v12);
  os_activity_scope_leave(&v15);
  return v13;
}

- (id)_getMonitoredIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD83C;
  v16 = sub_18F5CD7B0;
  v17 = 0;
  v17 = objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v8 = objc_msgSend_queue(self->_silo, v5, v6, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6E856C;
  v11[3] = &unk_1E2992AC0;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v8, v11);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)_getMonitoringRecords
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD83C;
  v16 = sub_18F5CD7B0;
  v17 = 0;
  v17 = objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = objc_msgSend_queue(self->_silo, v5, v6, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6E866C;
  v11[3] = &unk_1E2992AC0;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v8, v11);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)setMonitoringEventHandler:(id)a3
{
  void *v4;
  id eventHandler;

  v4 = _Block_copy(a3);
  eventHandler = self->_eventHandler;
  if (eventHandler)
    _Block_release(eventHandler);
  self->_eventHandler = v4;
}

- (void)addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6
{
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CLMonitoringRecord *v45;
  const char *v46;
  void *inited;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t MonitorConfiguration;
  const char *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *p_shared_owners;
  NSObject *v70;
  unint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  __int16 v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  CLMonitor *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  unint64_t v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v12 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v13 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    v87 = 2082;
    v88 = "";
    v89 = 2082;
    v90 = "activity";
    v91 = 2114;
    v92 = (uint64_t)v17;
    v93 = 2050;
    v94 = self;
    v95 = 2114;
    v96 = a4;
    v97 = 2050;
    v98 = a6;
    _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"assumedState\":%{public, location:CLMonitoringState}lld}", buf, 0x44u);
  }
  objc_msgSend_assertInside(self->_silo, v14, v15, v16);
  v20 = (void *)objc_msgSend_monitoringRecordForIdentifier_(self->_conditionLedger, v18, (uint64_t)a4, v19);
  v24 = v20;
  if (v20)
  {
    v25 = (void *)objc_msgSend_condition(v20, v21, v22, v23);
    if (objc_msgSend_isEqual_(v25, v26, (uint64_t)a3, v27))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
      v28 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend_UTF8String(a4, v29, v30, v31);
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        v87 = 2082;
        v88 = "";
        v89 = 2082;
        v90 = (const char *)v32;
        v91 = 2113;
        v92 = (uint64_t)a3;
        v33 = "{\"msg%{public}.0s\":\"#monitor given identifier and condition is currently monitored\", \"identifier\":%{"
              "public, location:escape_only}s, \"condition\":%{private, location:escape_only}@}";
        v34 = v28;
        v35 = 38;
LABEL_44:
        _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
        goto LABEL_45;
      }
      goto LABEL_45;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v36 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend_UTF8String(a4, v37, v38, v39);
      v44 = objc_msgSend_condition(v24, v41, v42, v43);
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v87 = 2082;
      v88 = "";
      v89 = 2082;
      v90 = (const char *)v40;
      v91 = 2113;
      v92 = v44;
      _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor removing currently monitored condition\", \"identifier\":%{public, location:escape_only}s, \"toBeRemoved\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    objc_msgSend_removeConditionFromMonitoringWithIdentifier_(self, v37, (uint64_t)a4, v39);
  }
  v45 = [CLMonitoringRecord alloc];
  inited = (void *)objc_msgSend_initRecordWithCondition_identifier_options_initialState_(v45, v46, (uint64_t)a3, (uint64_t)a4, a5, a6);
  objc_msgSend_addRecordForMonitoring_identifier_persist_(self->_conditionLedger, v48, (uint64_t)inited, (uint64_t)a4, 1);
  if (!objc_msgSend_identityToken(self, v49, v50, v51))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v76 = qword_1ECD8E750;
    if (!os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      goto LABEL_45;
    v80 = objc_msgSend_UTF8String(a4, v77, v78, v79);
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v87 = 2082;
    v88 = "";
    v89 = 2082;
    v90 = (const char *)v80;
    v33 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized to monitor just yet.\", \"identifier\":%{public, loca"
          "tion:escape_only}s}";
LABEL_43:
    v34 = v76;
    v35 = 28;
    goto LABEL_44;
  }
  if (self->_locationdConnection)
  {
    v55 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v52, v53, v54);
    v59 = objc_msgSend_identityToken(self, v56, v57, v58);
    objc_msgSend_setObject_forKeyedSubscript_(v55, v60, v59, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"));
    objc_msgSend_setObject_forKeyedSubscript_(v55, v61, (uint64_t)inited, (uint64_t)CFSTR("kCLConnectionMessageMonitorMonitoringRecordKey"));
    MonitorConfiguration = objc_msgSend_getMonitorConfiguration(self, v62, v63, v64);
    objc_msgSend_addEntriesFromDictionary_(v55, v66, MonitorConfiguration, v67);
    v68 = (std::__shared_weak_count *)operator new(0x70uLL);
    v68->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v68->__shared_owners_;
    v68->__shared_weak_owners_ = 0;
    v68->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
    sub_18F5D5990(buf, "Monitor/kCLConnectionMessageMonitorAdd");
    MEMORY[0x194002B44](&v68[1], buf, v55);
    if (SBYTE3(v90) < 0)
      operator delete(*(void **)buf);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v70 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v87 = 2082;
      v88 = "";
      v89 = 2114;
      v90 = (const char *)a4;
      v91 = 2113;
      v92 = (uint64_t)inited;
      _os_log_impl(&dword_18F5B3000, v70, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor add record for monitoring\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    do
      v71 = __ldxr(p_shared_owners);
    while (__stxr(v71 + 1, p_shared_owners));
    CLConnection::sendMessage();
    if (v68)
    {
      v72 = (unint64_t *)&v68->__shared_owners_;
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }

    if (v68)
    {
      v74 = (unint64_t *)&v68->__shared_owners_;
      do
        v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
    goto LABEL_45;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v76 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v84 = objc_msgSend_UTF8String(a4, v81, v82, v83);
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v87 = 2082;
    v88 = "";
    v89 = 2082;
    v90 = (const char *)v84;
    v33 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to add for monitoring\", \"identifier\":%{pub"
          "lic, location:escape_only}s}";
    goto LABEL_43;
  }
LABEL_45:
  os_activity_scope_leave(&state);
}

- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier assumedState:(CLMonitoringState)state
{
  MEMORY[0x1E0DE7D20](self, sel_addConditionForMonitoring_identifier_options_assumedState_, condition, identifier);
}

- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_addConstraintForMonitoring_identifier_assumedState_, a3, a4);
}

- (void)addConstraintForMonitoring:(id)a3 identifier:(id)a4 assumedState:(unint64_t)a5
{
  MEMORY[0x1E0DE7D20](self, sel_addConditionForMonitoring_identifier_assumedState_, a3, a4);
}

- (void)_addConditionForMonitoring:(id)a3 identifier:(id)a4 options:(unint64_t)a5 assumedState:(unint64_t)a6
{
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[6];
  id v16[3];
  id location;

  objc_initWeak(&location, self);
  v14 = objc_msgSend_queue(self->_silo, v11, v12, v13);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F6E8E80;
  v15[3] = &unk_1E2992AE8;
  objc_copyWeak(v16, &location);
  v15[4] = a3;
  v15[5] = a4;
  v16[1] = (id)a5;
  v16[2] = (id)a6;
  dispatch_async(v14, v15);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)addConditionForMonitoring:(CLCondition *)condition identifier:(NSString *)identifier
{
  MEMORY[0x1E0DE7D20](self, sel_addConditionForMonitoring_identifier_options_assumedState_, condition, identifier);
}

- (void)removeConditionFromMonitoringWithIdentifier:(NSString *)identifier
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t MonitorConfiguration;
  const char *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  NSObject *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  __int16 v53;
  const char *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  CLMonitor *v60;
  __int16 v61;
  NSString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&buf[4] = 0;
    v53 = 2082;
    v54 = "";
    v55 = 2082;
    v56 = (NSString *)"activity";
    v57 = 2114;
    v58 = v11;
    v59 = 2050;
    v60 = self;
    v61 = 2114;
    v62 = identifier;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
  objc_msgSend_assertInside(self->_silo, v8, v9, v10);
  objc_msgSend_removeRecordFromMonitoringWithIdentifier_(self->_conditionLedger, v12, (uint64_t)identifier, v13);
  if (objc_msgSend_identityToken(self, v14, v15, v16))
  {
    if (self->_locationdConnection)
    {
      v20 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19);
      v24 = objc_msgSend_identityToken(self, v21, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v20, v25, v24, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"));
      objc_msgSend_setObject_forKeyedSubscript_(v20, v26, (uint64_t)identifier, (uint64_t)CFSTR("kCLConnectionMessageMonitorIdentifierKey"));
      MonitorConfiguration = objc_msgSend_getMonitorConfiguration(self, v27, v28, v29);
      objc_msgSend_addEntriesFromDictionary_(v20, v31, MonitorConfiguration, v32);
      v33 = (std::__shared_weak_count *)operator new(0x70uLL);
      v33->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      v33->__shared_weak_owners_ = 0;
      v33->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "Monitor/kCLConnectionMessageMonitorRemove");
      MEMORY[0x194002B44](&v33[1], buf, v20);
      if (SBYTE3(v56) < 0)
        operator delete(*(void **)buf);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
      v35 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 0;
        v53 = 2082;
        v54 = "";
        v55 = 2114;
        v56 = identifier;
        _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove record with identifier from monitoring\", \"identifier\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      do
        v36 = __ldxr(p_shared_owners);
      while (__stxr(v36 + 1, p_shared_owners));
      CLConnection::sendMessage();
      if (v33)
      {
        v37 = (unint64_t *)&v33->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      if (v33)
      {
        v39 = (unint64_t *)&v33->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      goto LABEL_33;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v41 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend_UTF8String(identifier, v47, v48, v49);
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2082;
      v56 = (NSString *)v50;
      v46 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to remove from monitoring\", \"identifier\"
            ":%{public, location:escape_only}s}";
      goto LABEL_32;
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v41 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend_UTF8String(identifier, v42, v43, v44);
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      v53 = 2082;
      v54 = "";
      v55 = 2082;
      v56 = (NSString *)v45;
      v46 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized to remove from monitor just yet.\", \"identifier\":"
            "%{public, location:escape_only}s}";
LABEL_32:
      _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_DEFAULT, v46, buf, 0x1Cu);
    }
  }
LABEL_33:
  os_activity_scope_leave(&state);
}

- (void)_removeConditionFromMonitoringWithIdentifier:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v8 = objc_msgSend_queue(self->_silo, v5, v6, v7);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6E9454;
  block[3] = &unk_1E2992B10;
  objc_copyWeak(&v10, &location);
  block[4] = a3;
  dispatch_async(v8, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t MonitorConfiguration;
  const char *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  NSObject *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  const char *v40;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  CLMonitor *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_18F5B3000, "CL: CLMonitor #monitor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v9 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 68290306;
    *(_DWORD *)&buf[4] = 0;
    v43 = 2082;
    v44 = "";
    v45 = 2082;
    v46 = "activity";
    v47 = 2114;
    v48 = v11;
    v49 = 2050;
    v50 = self;
    v51 = 2114;
    v52 = a4;
    v53 = 2114;
    v54 = a3;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMonitor #monitor\", \"event\":%{public, location:escape_only}s, \"_cmd\":%{public, location:escape_only}@, \"self\":\"%{public}p\", \"identifier\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}@}", buf, 0x44u);
  }
  objc_msgSend_updateEvent_forIdentifier_(self->_conditionLedger, v10, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_identityToken(self, v12, v13, v14))
  {
    if (self->_locationdConnection)
    {
      v18 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16, v17);
      v22 = objc_msgSend_identityToken(self, v19, v20, v21);
      objc_msgSend_setObject_forKeyedSubscript_(v18, v23, v22, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"));
      objc_msgSend_setObject_forKeyedSubscript_(v18, v24, (uint64_t)a3, (uint64_t)CFSTR("kCLConnectionMessageMonitorEventKey"));
      MonitorConfiguration = objc_msgSend_getMonitorConfiguration(self, v25, v26, v27);
      objc_msgSend_addEntriesFromDictionary_(v18, v29, MonitorConfiguration, v30);
      v31 = (std::__shared_weak_count *)operator new(0x70uLL);
      v31->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      v31->__shared_weak_owners_ = 0;
      v31->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "Monitor/kCLConnectionMessageMonitorUpdateEvent");
      MEMORY[0x194002B44](&v31[1], buf, v18);
      if (SBYTE3(v46) < 0)
        operator delete(*(void **)buf);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
      v33 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        v43 = 2082;
        v44 = "";
        v45 = 2114;
        v46 = (const char *)a4;
        v47 = 2113;
        v48 = a3;
        _os_log_impl(&dword_18F5B3000, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor sync updated event to daemon\", \"identifier\":%{public, location:escape_only}@, \"event\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      do
        v34 = __ldxr(p_shared_owners);
      while (__stxr(v34 + 1, p_shared_owners));
      CLConnection::sendMessage();
      if (v31)
      {
        v35 = (unint64_t *)&v31->__shared_owners_;
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      if (v31)
      {
        v37 = (unint64_t *)&v31->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      goto LABEL_33;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v39 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v43 = 2082;
      v44 = "";
      v45 = 2114;
      v46 = (const char *)a4;
      v47 = 2113;
      v48 = a3;
      v40 = "{\"msg%{public}.0s\":\"#monitor No valid connection to locationd to update event\", \"identifier\":%{public,"
            " location:escape_only}@, \"event\":%{private, location:escape_only}@}";
      goto LABEL_32;
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v39 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      v43 = 2082;
      v44 = "";
      v45 = 2114;
      v46 = (const char *)a4;
      v47 = 2113;
      v48 = a3;
      v40 = "{\"msg%{public}.0s\":\"#monitor Client is not authorized just yet.\", \"identifier\":%{public, location:esca"
            "pe_only}@, \"event\":%{private, location:escape_only}@}";
LABEL_32:
      _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0x26u);
    }
  }
LABEL_33:
  os_activity_scope_leave(&state);
}

- (void)updateEventReceivedFromDaemon:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *Event;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
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
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  id v75;
  CLMonitoringEvent *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  _DWORD v112[2];
  __int16 v113;
  const char *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)a3, v3);
  Event = (void *)objc_msgSend_lastEvent(a3, v6, v7, v8);
  v13 = objc_msgSend_identifier(Event, v10, v11, v12);
  v16 = (void *)objc_msgSend_monitoringRecordForIdentifier_(self, v14, v13, v15);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v17 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v112[0] = 68289539;
    v112[1] = 0;
    v113 = 2082;
    v114 = "";
    v115 = 2113;
    v116 = a3;
    v117 = 2113;
    v118 = v16;
    _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor updatingEventReceivedFromDaemon\", \"newRecordReceivedFromDaemon\":%{private, location:escape_only}@, \"existingRecord\":%{private, location:escape_only}@}", (uint8_t *)v112, 0x26u);
  }
  v21 = (void *)objc_msgSend_monitoredIdentifiers(self, v18, v19, v20);
  if (objc_msgSend_containsObject_(v21, v22, v13, v23)
    && (v27 = (void *)objc_msgSend_condition(a3, v24, v25, v26),
        v31 = objc_msgSend_condition(v16, v28, v29, v30),
        objc_msgSend_isEqual_(v27, v32, v31, v33)))
  {
    v35 = (void *)objc_msgSend_lastEvent(a3, v24, v34, v26);
    if (objc_msgSend_state(v35, v36, v37, v38))
    {
      v42 = (void *)objc_msgSend_lastEvent(a3, v39, v40, v41);
      v46 = objc_msgSend_state(v42, v43, v44, v45);
      v50 = (void *)objc_msgSend_lastEvent(v16, v47, v48, v49);
      v54 = v46 != objc_msgSend_state(v50, v51, v52, v53);
    }
    else
    {
      v54 = 0;
    }
    v55 = (void *)objc_msgSend_lastEvent(a3, v39, v40, v41);
    if (objc_msgSend_refinement(v55, v56, v57, v58))
    {
      v62 = (void *)objc_msgSend_lastEvent(a3, v59, v60, v61);
      v66 = objc_msgSend_refinement(v62, v63, v64, v65);
      v70 = (void *)objc_msgSend_lastEvent(v16, v67, v68, v69);
      v74 = v66 != objc_msgSend_refinement(v70, v71, v72, v73);
    }
    else
    {
      v74 = 0;
    }
    if (v54 || v74)
    {
      v75 = (id)objc_msgSend_lastEvent(a3, v59, v60, v61);
    }
    else
    {
      v76 = [CLMonitoringEvent alloc];
      v80 = (void *)objc_msgSend_lastEvent(v16, v77, v78, v79);
      v84 = objc_msgSend_refinement(v80, v81, v82, v83);
      v88 = (void *)objc_msgSend_lastEvent(v16, v85, v86, v87);
      v92 = objc_msgSend_state(v88, v89, v90, v91);
      v96 = (void *)objc_msgSend_lastEvent(v16, v93, v94, v95);
      v100 = objc_msgSend_date(v96, v97, v98, v99);
      v104 = (void *)objc_msgSend_lastEvent(a3, v101, v102, v103);
      v108 = objc_msgSend_diagnosticMask(v104, v105, v106, v107);
      v75 = (id)objc_msgSend_initWithIdentifier_refinement_state_date_diagnostics_(v76, v109, v13, v84, v92, v100, v108);
    }
    v110 = (uint64_t)v75;
    (*((void (**)(void))self->_eventHandler + 2))();
    objc_msgSend_updateEvent_forIdentifier_(self, v111, v110, v13);
  }
  else
  {
    objc_msgSend_removeConditionFromMonitoringWithIdentifier_(self, v24, v13, v26);
  }
}

- (CLMonitoringRecord)monitoringRecordForIdentifier:(NSString *)identifier
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_assertInside(self->_silo, a2, (uint64_t)identifier, v3);
  return (CLMonitoringRecord *)objc_msgSend_monitoringRecordForIdentifier_(self->_conditionLedger, v6, (uint64_t)identifier, v7);
}

- (void)manageConnection
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (objc_msgSend_identityToken(self, v5, v6, v7))
    objc_msgSend_createConnection(self, v8, v9, v10);
  else
    objc_msgSend_destroyConnection(self, v8, v9, v10);
}

- (void)createConnection
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t MonitorConfiguration;
  const char *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  void *locationdConnection;
  unint64_t *v41;
  unint64_t v42;
  NSObject *v43;
  id v44;
  id location;
  void *__p[2];
  char v47;
  uint8_t buf[8];
  __int16 v49;
  const char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  if (!self->_locationdConnection)
  {
    if (objc_msgSend_identityToken(self, v5, v6, v7))
    {
      v8 = (void *)operator new();
      sub_18F5D5990(__p, "com.apple.locationd.registration");
      v12 = objc_msgSend_queue(self->_silo, v9, v10, v11);
      MEMORY[0x194002AB4](v8, __p, v12);
      self->_locationdConnection = v8;
      if (v47 < 0)
        operator delete(__p[0]);
      objc_initWeak(&location, self);
      objc_copyWeak(&v44, &location);
      CLConnection::setDefaultMessageHandler();
      CLConnection::start((CLConnection *)self->_locationdConnection);
      v16 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15);
      v20 = objc_msgSend_identityToken(self, v17, v18, v19);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v21, v20, (uint64_t)CFSTR("kCLConnectionMessageClientKeyForIdentityValidation"));
      v22 = (void *)MEMORY[0x1E0CB37E8];
      v23 = dyld_program_sdk_at_least();
      v26 = objc_msgSend_numberWithBool_(v22, v24, v23, v25);
      objc_msgSend_setObject_forKeyedSubscript_(v16, v27, v26, (uint64_t)CFSTR("SDKAtLeast2024"));
      MonitorConfiguration = objc_msgSend_getMonitorConfiguration(self, v28, v29, v30);
      objc_msgSend_addEntriesFromDictionary_(v16, v32, MonitorConfiguration, v33);
      v34 = (std::__shared_weak_count *)operator new(0x70uLL);
      v34->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v34->__shared_owners_;
      v34->__shared_weak_owners_ = 0;
      v34->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
      sub_18F5D5990(buf, "Monitor/kCLConnectionMessage");
      MEMORY[0x194002B44](&v34[1], buf, v16);
      if (SBYTE3(v52) < 0)
        operator delete(*(void **)buf);
      do
        v36 = __ldxr(p_shared_owners);
      while (__stxr(v36 + 1, p_shared_owners));
      CLConnection::sendMessage();
      if (v34)
      {
        v37 = (unint64_t *)&v34->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
      v39 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        locationdConnection = self->_locationdConnection;
        *(_QWORD *)buf = 68289282;
        v49 = 2082;
        v50 = "";
        v51 = 2050;
        v52 = locationdConnection;
        _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor connection created\", \"connection\":\"%{public}p\"}", buf, 0x1Cu);
      }
      if (v34)
      {
        v41 = (unint64_t *)&v34->__shared_owners_;
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
      v43 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)buf = 68289026;
        v49 = 2082;
        v50 = "";
        _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Client is not authorized just yet to create connection\"}", buf, 0x12u);
      }
    }
  }
}

- (void)destroyConnection
{
  uint64_t v2;
  uint64_t v3;
  CLConnection *locationdConnection;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  CLConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assertInside(self->_silo, a2, v2, v3);
  locationdConnection = (CLConnection *)self->_locationdConnection;
  if (locationdConnection)
  {
    self->_locationdConnection = 0;
    CLConnection::deferredDelete(locationdConnection);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v6 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289282;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2050;
      v11 = locationdConnection;
      _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor destroying connection\", \"connection\":\"%{public}p\"}", (uint8_t *)v7, 0x1Cu);
    }
  }
}

- (void)handleMessageMonitor:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  _QWORD *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  CLConnectionMessage *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSSet *v18;
  void *DictionaryOfClasses;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  var0 = (CLConnectionMessage **)a3.var0;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)a3.var0);
  v6 = *((char *)v5 + 23);
  if (v6 < 0)
  {
    if (v5[1] != 46)
      goto LABEL_7;
    v5 = (_QWORD *)*v5;
  }
  else if (v6 != 46)
  {
    goto LABEL_7;
  }
  if (!memcmp(v5, "Monitor/kCLConnectionMessageMonitorUpdateEvent", 0x2EuLL))
  {
    v13 = *var0;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v18 = (NSSet *)objc_msgSend_setWithObjects_(v14, v16, v15, v17, 0);
    DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v13, v18);
    v22 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v20, (uint64_t)CFSTR("kCLConnectionMessageMonitorMonitoringRecordKey"), v21);
    MEMORY[0x1E0DE7D20](self, sel_updateEventReceivedFromDaemon_, v22, v23);
    return;
  }
LABEL_7:
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    v8 = CLConnectionMessage::name(*var0);
    v9 = *(char *)(v8 + 23) >= 0 ? v8 : *(_QWORD *)v8;
    *(_DWORD *)buf = 68289282;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2082;
    v29 = v9;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unsupported message received\", \"message\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
  }
  v10 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    v11 = CLConnectionMessage::name(*var0);
    if (*(char *)(v11 + 23) >= 0)
      v12 = v11;
    else
      v12 = *(_QWORD *)v11;
    *(_DWORD *)buf = 68289282;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2082;
    v29 = v12;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unsupported message received", "{\"msg%{public}.0s\":\"#monitor unsupported message received\", \"message\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
}

- (id)getMonitorConfiguration
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_msgSend_allMonitoringRecordsByIdentifier(self->_conditionLedger, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, v7, (uint64_t)CFSTR("kCLConnectionMessageMonitorLedger"));
  v12 = objc_msgSend_identityToken(self, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, v12, (uint64_t)CFSTR("kCLConnectionMessageMonitorIdentityTokenKey"));
  v17 = objc_msgSend_name(self, v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, v17, (uint64_t)CFSTR("kCLConnectionMessageMonitorNameKey"));
  v22 = (void *)objc_msgSend_manager(self, v19, v20, v21);
  v26 = objc_msgSend_processName(v22, v23, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, v26, (uint64_t)CFSTR("kCLConnectionMessageMonitorProcessNameKey"));
  return v3;
}

- (void)updateIdentityToken:(id)a3 withStorageToken:(id)a4
{
  CLDispatchSilo *silo;
  _QWORD v5[7];

  silo = self->_silo;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F6EA6F8;
  v5[3] = &unk_1E29911F8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  objc_msgSend_async_(silo, a2, (uint64_t)v5, (uint64_t)a4);
}

+ (void)_requestMonitorWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint8_t buf[4];
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  v13 = (void *)objc_msgSend_name(a3, v10, v11, v12);
  if ((sub_18F5F5984(v13, v14, v15, v16) & 1) == 0)
  {
    v42 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitor.mm"), 508, CFSTR("Monitor name is not valid"));
  }
  if (!a5)
  {
    v44 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitor.mm"), 511, CFSTR("Monitor completion handler is nil"));
  }
  if (!objc_msgSend_eventHandler(a3, v17, v18, v19))
  {
    v46 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21, v22);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitor.mm"), 514, CFSTR("Monitoring event handler is nil"));
  }
  v23 = objc_msgSend_name(a3, v20, v21, v22);
  if (objc_msgSend_isMonitorNameInUse_(CLMonitor, v24, v23, v25))
  {
    v48 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27, v28);
    v52 = objc_msgSend_name(a3, v49, v50, v51);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v53, (uint64_t)a2, (uint64_t)a1, CFSTR("CLMonitor.mm"), 517, CFSTR("Monitor named %@ is already in use"), v52);
  }
  if (!a4)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    v54 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v58 = 0;
      v59 = 2082;
      v60 = "";
      v61 = 2082;
      v62 = "assert";
      v63 = 2081;
      v64 = "locationManager";
      _os_log_impl(&dword_18F5B3000, v54, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    }
    v55 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      v58 = 0;
      v59 = 2082;
      v60 = "";
      v61 = 2082;
      v62 = "assert";
      v63 = 2081;
      v64 = "locationManager";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v55, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLLocationManager must not be nil", "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DA50);
    }
    v56 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v58 = 0;
      v59 = 2082;
      v60 = "";
      v61 = 2082;
      v62 = "assert";
      v63 = 2081;
      v64 = "locationManager";
      _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLLocationManager must not be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  if ((objc_msgSend_isMasquerading(a4, v26, v27, v28) & 1) == 0 && !sub_18F5F6244())
    NSLog(&CFSTR("Error(CLMonitor): NSLocationWhenInUseUsageDescription and NSLocationAlwaysAndWhenInUseUsageDescription are bo"
                 "th missing from localized Info.plist").isa);
  objc_msgSend_setManager_(a3, v29, (uint64_t)a4, v30);
  objc_msgSend_setVendingHandler_(a3, v31, (uint64_t)a5, v32);
  v36 = objc_msgSend_name(a3, v33, v34, v35);
  objc_msgSend_addMonitorName_(CLMonitor, v37, v36, v38);
  v39 = a3;
  objc_msgSend_addIdentifiableClient_(a4, v40, (uint64_t)v39, v41);
  objc_sync_exit(a1);
}

+ (void)requestWithConfiguration:(id)a3 locationManager:(id)a4 completion:(id)a5
{
  MEMORY[0x1E0DE7D20](CLMonitor, sel__requestMonitorWithConfiguration_locationManager_completion_, a3, a4);
}

+ (void)requestMonitorWithConfiguration:(CLMonitorConfiguration *)config completion:(void *)completionHandler
{
  uint64_t v5;

  v5 = objc_msgSend_weakSharedInstance(CLLocationManager, a2, (uint64_t)config, (uint64_t)completionHandler);
  MEMORY[0x1E0DE7D20](CLMonitor, sel__requestMonitorWithConfiguration_locationManager_completion_, config, v5);
}

+ (id)sharedMonitorSet
{
  if (qword_1ECD8F8B8 != -1)
    dispatch_once(&qword_1ECD8F8B8, &unk_1E29909B0);
  return (id)qword_1ECD8F8B0;
}

+ (BOOL)isMonitorNameInUse:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE172C48);
  v7 = (void *)objc_msgSend_sharedMonitorSet(CLMonitor, v4, v5, v6);
  LOBYTE(a3) = objc_msgSend_containsObject_(v7, v8, (uint64_t)a3, v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE172C48);
  return (char)a3;
}

+ (void)addMonitorName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE172C48);
  v7 = (void *)objc_msgSend_sharedMonitorSet(CLMonitor, v4, v5, v6);
  objc_msgSend_addObject_(v7, v8, (uint64_t)a3, v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE172C48);
}

+ (void)removeMonitorName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE172C48);
  v7 = (void *)objc_msgSend_sharedMonitorSet(CLMonitor, v4, v5, v6);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)a3, v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE172C48);
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

- (NSString)name
{
  return self->_name;
}

- (NSString)monitorName
{
  return self->_monitorName;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->weakClient);
}

@end
