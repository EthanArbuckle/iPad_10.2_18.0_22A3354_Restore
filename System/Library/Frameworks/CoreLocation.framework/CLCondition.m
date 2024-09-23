@implementation CLCondition

- (id)initCondition
{
  uint64_t v2;
  objc_super v5;

  objc_msgSend_setIsMonitoring_(self, a2, 0, v2);
  v5.receiver = self;
  v5.super_class = (Class)CLCondition;
  return -[CLCondition init](&v5, sel_init);
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  self->_refinement = 0;
  self->_authorizationContext = 0;
  objc_msgSend_setCkp_(self, v3, 0, v4);
  objc_msgSend_setOnConditionUpdateCallbackHandler_(self, v5, 0, v6);

  self->_identifier = 0;
  self->_universe = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLCondition;
  -[CLCondition dealloc](&v7, sel_dealloc);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLCondition;
  return -[CLCondition copy](&v4, sel_copy, a3);
}

- (CLCondition)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLCondition;
  return -[CLCondition init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCallbackHandler:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t updated;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t MonitoringState;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend_setOnConditionUpdateCallbackHandler_(self, a2, (uint64_t)a3, v3);
  if (objc_msgSend_onConditionUpdateCallbackHandler(self, v5, v6, v7))
  {
    updated = objc_msgSend_onConditionUpdateCallbackHandler(self, v8, v9, v10);
    v15 = objc_msgSend_monitoredIdentifier(self, v12, v13, v14);
    MonitoringState = objc_msgSend_lastMonitoringState(self, v16, v17, v18);
    v23 = objc_msgSend_refinement(self, v20, v21, v22);
    (*(void (**)(uint64_t, uint64_t, CLCondition *, uint64_t, uint64_t))(updated + 16))(updated, v15, self, MonitoringState, v23);
  }
}

- (BOOL)isAuthorized
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v3 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base isAuthorized directly", "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v4 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base isAuthorized directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
  }
}

- (void)startMonitoring
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v3 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base startMonitoring directly", "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v4 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base startMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
  }
}

- (void)stopMonitoring
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v3 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call base stopMonitoring directly", "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v4 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2082;
      v10 = "assert";
      v11 = 2081;
      v12 = "false";
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call base stopMonitoring directly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
  }
}

- (NSString)monitoredIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_identifier(self, a2, v2, v3);
  v8 = objc_msgSend_rangeOfString_(v5, v6, (uint64_t)CFSTR("@"), v7);
  v12 = objc_msgSend_identifier(self, v9, v10, v11);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (NSString *)v12;
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    v17 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      v30 = 68289282;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2114;
      v35 = objc_msgSend_identifier(self, v18, v19, v20);
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor ill formatted identifier name\", \"fenceName\":%{public, location:escape_only}@}", (uint8_t *)&v30, 0x1Cu);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990CB0);
    }
    v21 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      v25 = objc_msgSend_identifier(self, v22, v23, v24);
      v30 = 68289282;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2114;
      v35 = v25;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor ill formatted identifier name", "{\"msg%{public}.0s\":\"#monitor ill formatted identifier name\", \"fenceName\":%{public, location:escape_only}@}", (uint8_t *)&v30, 0x1Cu);
    }
    return v16;
  }
  else
  {
    v27 = (void *)objc_msgSend_identifier(self, v13, v14, v15);
    return (NSString *)objc_msgSend_substringFromIndex_(v27, v28, v8 + 1, v29);
  }
}

- (CLClientKeyPath)ckp
{
  return self->_ckp;
}

- (void)setCkp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLClientManagerAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setAuthorizationContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)onConditionUpdateCallbackHandler
{
  return self->_onConditionUpdateCallbackHandler;
}

- (void)setOnConditionUpdateCallbackHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  self->_universe = (CLIntersiloUniverse *)a3;
}

- (CLCondition)refinement
{
  return self->_refinement;
}

- (void)setRefinement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unint64_t)lastMonitoringState
{
  return self->_lastMonitoringState;
}

- (void)setLastMonitoringState:(unint64_t)a3
{
  self->_lastMonitoringState = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

@end
