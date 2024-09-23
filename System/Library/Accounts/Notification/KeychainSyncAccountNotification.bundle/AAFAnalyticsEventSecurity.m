@implementation AAFAnalyticsEventSecurity

- (BOOL)permittedToSendMetrics
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend_isAAAFoundationAvailable(self, a2, v2)
    && objc_msgSend_isAuthKitAvailable(self, v4, v5)
    && (objc_msgSend_areTestsEnabled(self, v6, v7) & 1) == 0)
  {
    return MEMORY[0x24BEDD108](self, sel_canSendMetrics, v8);
  }
  else
  {
    return 0;
  }
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 eventName:(id)a7 testsAreEnabled:(BOOL)a8 canSendMetrics:(BOOL)a9 category:(id)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  AAFAnalyticsEventSecurity *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  void *v26;
  objc_class *v27;
  id v28;
  const char *v29;
  const char *v30;
  void *inited;
  _QWORD *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  const char *v53;
  AAFAnalyticsEvent *event;
  AAFAnalyticsEventSecurity *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  objc_super v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v10 = a8;
  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v57 = a4;
  v60 = a5;
  v17 = a6;
  v58 = a7;
  v59 = a10;
  if (objc_msgSend_isAAAFoundationAvailable(AAFAnalyticsEventSecurity, v18, v19)
    && objc_msgSend_isAuthKitAvailable(AAFAnalyticsEventSecurity, v20, v21)
    && a9
    && !v10)
  {
    v65.receiver = self;
    v65.super_class = (Class)AAFAnalyticsEventSecurity;
    v22 = -[AAFAnalyticsEventSecurity init](&v65, sel_init);
    if (v22)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = dispatch_queue_create("com.apple.security.aafanalyticsevent.queue", v23);
      queue = v22->_queue;
      v22->_queue = (OS_dispatch_queue *)v24;

      v22->_areTestsEnabled = 0;
      v22->_canSendMetrics = a9;
      *(_WORD *)&v22->_isAAAFoundationAvailable = 257;
      v72 = 0;
      v73 = &v72;
      v74 = 0x2050000000;
      v26 = (void *)qword_25414BF90;
      v75 = qword_25414BF90;
      if (!qword_25414BF90)
      {
        v67 = MEMORY[0x24BDAC760];
        v68 = 3221225472;
        v69 = (uint64_t)sub_230F30384;
        v70 = &unk_24FFB6038;
        v71 = &v72;
        sub_230F30384((uint64_t)&v67);
        v26 = (void *)v73[3];
      }
      v27 = objc_retainAutorelease(v26);
      _Block_object_dispose(&v72, 8);
      v28 = [v27 alloc];
      inited = (void *)objc_msgSend_initWithEventName_eventCategory_initData_(v28, v29, (uint64_t)v58, v59, 0);
      if (v60 && (objc_msgSend_isEqualToString_(v60, v30, (uint64_t)&stru_24FFB64F0) & 1) == 0)
      {
        v67 = 0;
        v68 = (uint64_t)&v67;
        v69 = 0x2020000000;
        v32 = (_QWORD *)qword_25414BFB8;
        v70 = (void *)qword_25414BFB8;
        if (!qword_25414BFB8)
        {
          v33 = (void *)sub_230F303F0();
          v32 = dlsym(v33, "kAAFFlowId");
          *(_QWORD *)(v68 + 24) = v32;
          qword_25414BFB8 = (uint64_t)v32;
        }
        _Block_object_dispose(&v67, 8);
        if (!v32)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        objc_msgSend_setObject_forKeyedSubscript_(inited, v34, (uint64_t)v60, *v32);
      }
      if (v17 && (objc_msgSend_isEqualToString_(v17, v30, (uint64_t)&stru_24FFB64F0) & 1) == 0)
      {
        sub_230F304B0();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(inited, v42, (uint64_t)v17, v35);
      }
      else
      {
        objc_msgSend_fetchDeviceSessionIDFromAuthKit_(AAFAnalyticsEventSecurity, v30, (uint64_t)v57);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        sub_230F304B0();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(inited, v37, (uint64_t)v35, v36);

      }
      if (v16)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend_allKeys(v16, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v61, v76, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v62 != v49)
                objc_enumerationMutation(v45);
              v51 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend_objectForKeyedSubscript_(v16, v47, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(inited, v53, (uint64_t)v52, v51);

            }
            v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v61, v76, 16);
          }
          while (v48);
        }

      }
      event = v22->_event;
      v22->_event = (AAFAnalyticsEvent *)inited;

    }
  }
  else
  {
    v66.receiver = self;
    v66.super_class = (Class)AAFAnalyticsEventSecurity;
    v22 = -[AAFAnalyticsEventSecurity init](&v66, sel_init);
    if (v22)
    {
      v22->_isAAAFoundationAvailable = objc_msgSend_isAAAFoundationAvailable(AAFAnalyticsEventSecurity, v38, v39);
      v22->_isAuthKitAvailable = objc_msgSend_isAuthKitAvailable(AAFAnalyticsEventSecurity, v40, v41);
      v22->_areTestsEnabled = v10;
      v22->_canSendMetrics = a9;
    }
  }
  v55 = v22;

  return v55;
}

- (AAFAnalyticsEventSecurity)initWithCKKSMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 testsAreEnabled:(BOOL)a6 category:(id)a7 sendMetric:(BOOL)a8
{
  return (AAFAnalyticsEventSecurity *)objc_msgSend_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_(self, a2, (uint64_t)a3, a4, 0, 0, a5, a6, a8, a7);
}

- (AAFAnalyticsEventSecurity)initWithKeychainCircleMetrics:(id)a3 altDSID:(id)a4 eventName:(id)a5 category:(id)a6
{
  char v7;

  v7 = 1;
  return (AAFAnalyticsEventSecurity *)objc_msgSend_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_(self, a2, (uint64_t)a3, a4, 0, 0, a5, 0, v7, a6);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v9 = a3;
  if (objc_msgSend_permittedToSendMetrics(self, v4, v5))
  {
    objc_msgSend_queue(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230F30344;
    block[3] = &unk_24FFB5F78;
    block[4] = self;
    v11 = v9;
    dispatch_sync(v8, block);

  }
}

- (void)addMetrics:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  AAFAnalyticsEventSecurity *v12;

  v4 = a3;
  if (objc_msgSend_permittedToSendMetrics(self, v5, v6))
  {
    objc_msgSend_queue(self, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_230F30210;
    v10[3] = &unk_24FFB5F78;
    v11 = v4;
    v12 = self;
    dispatch_async(v9, v10);

  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AAFAnalyticsEvent)event
{
  return (AAFAnalyticsEvent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)areTestsEnabled
{
  return self->_areTestsEnabled;
}

- (void)setAreTestsEnabled:(BOOL)a3
{
  self->_areTestsEnabled = a3;
}

- (BOOL)canSendMetrics
{
  return self->_canSendMetrics;
}

- (void)setCanSendMetrics:(BOOL)a3
{
  self->_canSendMetrics = a3;
}

- (BOOL)isAAAFoundationAvailable
{
  return self->_isAAAFoundationAvailable;
}

- (void)setIsAAAFoundationAvailable:(BOOL)a3
{
  self->_isAAAFoundationAvailable = a3;
}

- (BOOL)isAuthKitAvailable
{
  return self->_isAuthKitAvailable;
}

- (void)setIsAuthKitAvailable:(BOOL)a3
{
  self->_isAuthKitAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (BOOL)isAAAFoundationAvailable
{
  if (qword_25414BF58 != -1)
    dispatch_once(&qword_25414BF58, &unk_24FFB5F30);
  return byte_25414BF50;
}

+ (BOOL)isAuthKitAvailable
{
  if (qword_25414BF68 != -1)
    dispatch_once(&qword_25414BF68, &unk_24FFB5F50);
  return byte_25414BF60;
}

+ (id)fetchDeviceSessionIDFromAuthKit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  void *v17;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v4 = (void *)qword_25414BFA8;
  v23 = qword_25414BFA8;
  if (!qword_25414BFA8)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v25 = sub_230F307CC;
    v26 = &unk_24FFB6038;
    v27 = &v20;
    sub_230F307CC((uint64_t)&buf);
    v4 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v20, 8);
  objc_msgSend_sharedInstance(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v3)
  {
    v19 = 0;
    objc_msgSend_authKitAccountWithAltDSID_error_(v8, v9, (uint64_t)v3, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    if (v13)
    {
      secLogObjForScope();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_230F2E000, v14, OS_LOG_TYPE_DEFAULT, "authKitAccountWithAltDSID returned error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend_primaryAuthKitAccount(v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend_accountAccessTelemetryOptInForAccount_(v11, v15, (uint64_t)v12))
  {
    objc_msgSend_telemetryDeviceSessionIDForAccount_(v11, v16, (uint64_t)v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
