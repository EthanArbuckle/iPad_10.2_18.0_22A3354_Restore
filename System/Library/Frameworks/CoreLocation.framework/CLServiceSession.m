@implementation CLServiceSession

+ (id)sessionRequiringAuthorization:(int64_t)a3
{
  CLServiceSession *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v4 = [CLServiceSession alloc];
  v8 = objc_msgSend_weakSharedInstance(CLLocationManager, v5, v6, v7);
  v12 = objc_msgSend_sharedQueue(CLLocationManager, v9, v10, v11);
  return (id)objc_msgSend_initWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_(v4, v13, v8, a3, 0, v12, 0);
}

+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3
{
  CLServiceSession *v4;
  const char *v5;

  v4 = [CLServiceSession alloc];
  return (id)objc_msgSend_initDisconnectedSessionWithAuthorizationRequirement_fullAccuracyPurposeKey_(v4, v5, a3, 0);
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 queue:(id)a4 handler:(id)a5
{
  CLServiceSession *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v8 = [CLServiceSession alloc];
  v12 = objc_msgSend_weakSharedInstance(CLLocationManager, v9, v10, v11);
  return (id)objc_msgSend_initWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_(v8, v13, v12, a3, 0, a4, a5);
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  CLServiceSession *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v6 = [CLServiceSession alloc];
  v10 = objc_msgSend_weakSharedInstance(CLLocationManager, v7, v8, v9);
  v14 = objc_msgSend_sharedQueue(CLLocationManager, v11, v12, v13);
  return (id)objc_msgSend_initWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_(v6, v15, v10, a3, a4, v14, 0);
}

+ (id)disconnectedSessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  CLServiceSession *v6;
  const char *v7;

  v6 = [CLServiceSession alloc];
  return (id)objc_msgSend_initDisconnectedSessionWithAuthorizationRequirement_fullAccuracyPurposeKey_(v6, v7, a3, (uint64_t)a4);
}

+ (id)sessionRequiringAuthorization:(int64_t)a3 fullAccuracyPurposeKey:(id)a4 queue:(id)a5 handler:(id)a6
{
  CLServiceSession *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v10 = [CLServiceSession alloc];
  v14 = objc_msgSend_weakSharedInstance(CLLocationManager, v11, v12, v13);
  return (id)objc_msgSend_initWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_(v10, v15, v14, a3, a4, a5, a6);
}

+ (id)sessionWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7
{
  CLServiceSession *v12;
  const char *v13;

  v12 = [CLServiceSession alloc];
  return (id)objc_msgSend_initWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_handler_(v12, v13, (uint64_t)a3, a4, a5, a6, a7);
}

- (void)setupSessionInternalWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6
{
  uint64_t v6;
  uint64_t v9;
  CLServiceSessionInternal *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  CLServiceSessionInternal *v16;
  CLFullAccuracySession *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t buf;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = (uint64_t)a6;
  v9 = (uint64_t)a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    v9 = objc_msgSend_weakSharedInstance(CLLocationManager, a2, 0, a4);
    if (v6)
      goto LABEL_3;
  }
  v6 = objc_msgSend_sharedQueue(CLLocationManager, a2, (uint64_t)a3, a4);
LABEL_3:
  switch(a4)
  {
    case 2:
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_18F6BEBFC;
      v21[3] = &unk_1E2992498;
      v21[4] = self;
      v11 = (CLServiceSessionInternal *)objc_msgSend_alwaysSessionWithLocationManager_queue_handler_(CLServiceSessionInternal, a2, v9, v6, v21);
      goto LABEL_11;
    case 1:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = sub_18F6BEBEC;
      v22[3] = &unk_1E2992498;
      v22[4] = self;
      v11 = (CLServiceSessionInternal *)objc_msgSend_whenInUseSessionWithLocationManager_queue_handler_(CLServiceSessionInternal, a2, v9, v6, v22);
      goto LABEL_11;
    case 0:
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = sub_18F6BEBDC;
      v23[3] = &unk_1E2992498;
      v23[4] = self;
      v11 = (CLServiceSessionInternal *)objc_msgSend_passiveSessionWithLocationManager_queue_handler_(CLServiceSessionInternal, a2, v9, v6, v23);
LABEL_11:
      self->_serviceSessionInternal = v11;
      goto LABEL_12;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
  v18 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
  {
    buf = 68289282;
    v25 = 2082;
    v26 = "";
    v27 = 1026;
    v28 = a4;
    _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Invalid AuthorizationRequirementType for CLServiceSession\", \"authorizationRequirement\":%{public}d}", (uint8_t *)&buf, 0x18u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
  }
  v19 = qword_1ECD8E750;
  if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
  {
    buf = 68289282;
    v25 = 2082;
    v26 = "";
    v27 = 1026;
    v28 = a4;
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalid AuthorizationRequirementType for CLServiceSession", "{\"msg%{public}.0s\":\"Invalid AuthorizationRequirementType for CLServiceSession\", \"authorizationRequirement\":%{public}d}", (uint8_t *)&buf, 0x18u);
  }
LABEL_12:
  if (objc_msgSend_length(a5, v12, v13, v14))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_18F6BEC0C;
    v20[3] = &unk_1E2992498;
    v20[4] = self;
    self->_fullAccuracySession = (CLFullAccuracySession *)objc_msgSend_fullAccuracySessionWithLocationManager_purposeKey_queue_handler_(CLFullAccuracySession, v15, v9, (uint64_t)a5, v6, v20);
  }
  v16 = self->_serviceSessionInternal;
  v17 = self->_fullAccuracySession;
}

- (id)initDisconnectedSessionWithAuthorizationRequirement:(int64_t)a3 fullAccuracyPurposeKey:(id)a4
{
  CLServiceSession *v6;
  CLServiceSession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLServiceSession;
  v6 = -[CLServiceSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_aggregatedDiagnosticMask = -1;
    v6->_authorizationRequirement = a3;
    v6->_fullAccuracyPurposeKey = (NSString *)a4;
  }
  return v7;
}

- (CLServiceSession)initWithLocationManager:(id)a3 authorizationRequirement:(int64_t)a4 fullAccuracyPurposeKey:(id)a5 queue:(id)a6 handler:(id)a7
{
  CLServiceSession *v12;
  const char *v13;
  CLServiceSession *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLServiceSession;
  v12 = -[CLServiceSession init](&v16, sel_init);
  v14 = v12;
  if (v12)
  {
    v12->_aggregatedDiagnosticMask = -1;
    if (a7)
      v12->_clientCallback = _Block_copy(a7);
    objc_msgSend_setupSessionInternalWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_(v14, v13, (uint64_t)a3, a4, a5, a6);
  }
  return v14;
}

- (void)setHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t authorizationRequirement;
  NSString *fullAccuracyPurposeKey;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  CLServiceSession *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_clientCallback)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "_clientCallback == nullptr";
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    }
    v16 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "_clientCallback == nullptr";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession should initially be nil", "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    }
    v17 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "_clientCallback == nullptr";
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#serviceSession should initially be nil\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
LABEL_25:
    abort_report_np();
  }
  if (!a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "handler != nullptr";
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    }
    v19 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "handler != nullptr";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#serviceSession can't set a nil handler", "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    }
    v20 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2050;
      v26 = self;
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "handler != nullptr";
      _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#serviceSession can't set a nil handler\", \"self\":\"%{public}p\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    goto LABEL_25;
  }
  self->_clientCallback = _Block_copy(a3);
  v7 = objc_msgSend_weakSharedInstance(CLLocationManager, v4, v5, v6);
  authorizationRequirement = self->_authorizationRequirement;
  fullAccuracyPurposeKey = self->_fullAccuracyPurposeKey;
  v13 = objc_msgSend_sharedQueue(CLLocationManager, v10, v11, v12);
  objc_msgSend_setupSessionInternalWithLocationManager_authorizationRequirement_fullAccuracyPurposeKey_queue_(self, v14, v7, authorizationRequirement, fullAccuracyPurposeKey, v13);
}

- (void)handleDiagnosticUpdate
{
  unint64_t v3;
  uint64_t v4;
  unint64_t aggregatedDiagnosticMask;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  CLServiceSessionDiagnostic *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CLServiceSession *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = self->_fullAccuracySessionDiagnosticMask | self->_serviceSessionDiagnosticMask;
  if (self->_aggregatedDiagnosticMask == v3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    v4 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      aggregatedDiagnosticMask = self->_aggregatedDiagnosticMask;
      *(_DWORD *)buf = 68289538;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2050;
      v19 = self;
      v20 = 1026;
      v21 = aggregatedDiagnosticMask;
      v6 = "{\"msg%{public}.0s\":\"#serviceSession skip diagnosticUpdate delivery - new and old aggregatedMask are same\"
           ", \"self\":\"%{public}p\", \"aggregatedDiagnosticMask\":%{public}d}";
      v7 = v4;
      v8 = 34;
LABEL_12:
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    self->_aggregatedDiagnosticMask = v3;
    if (self->_clientCallback)
    {
      v9 = [CLServiceSessionDiagnostic alloc];
      v13 = (id)objc_msgSend_initWithDiagnostics_(v9, v10, v3, v11);
      (*((void (**)(void))self->_clientCallback + 2))();

      return;
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990850);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2050;
      v19 = self;
      v6 = "{\"msg%{public}.0s\":\"#serviceSession skip diagnosticUpdate delivery - no callback handler\", \"self\":\"%{public}p\"}";
      v7 = v12;
      v8 = 28;
      goto LABEL_12;
    }
  }
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_invalidate(self->_serviceSessionInternal, a2, v2, v3);
  objc_msgSend_invalidate(self->_fullAccuracySession, v5, v6, v7);
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_clientCallback);
  self->_clientCallback = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLServiceSession;
  -[CLServiceSession dealloc](&v3, sel_dealloc);
}

@end
