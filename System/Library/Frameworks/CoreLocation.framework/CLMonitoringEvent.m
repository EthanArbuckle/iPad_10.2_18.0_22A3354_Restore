@implementation CLMonitoringEvent

- (CLMonitoringEvent)initWithIdentifier:(id)a3 refinement:(id)a4 state:(unint64_t)a5 date:(id)a6 diagnostics:(unint64_t)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CLMonitoringEvent *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLMonitoringEvent;
  v15 = -[CLMonitoringEvent init](&v17, sel_init);
  if (v15)
  {
    v15->_identifier = (NSString *)objc_msgSend_copy(a3, v12, v13, v14);
    v15->_refinement = (CLCondition *)a4;
    v15->_state = a5;
    v15->_date = (NSDate *)a6;
    v15->_diagnosticMask = a7;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  self->_identifier = 0;
  self->_refinement = 0;

  self->_date = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLMonitoringEvent;
  -[CLMonitoringEvent dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;

  if ((objc_msgSend_requiresSecureCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v32 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, CFSTR("CLMonitoringEvent.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  }
  v10 = objc_msgSend_identifier(self, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMonitoringEventIdentifier"));
  v15 = objc_msgSend_refinement(self, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(a3, v16, v15, (uint64_t)CFSTR("kCLMonitoringEventRefinement"));
  v20 = objc_msgSend_state(self, v17, v18, v19);
  objc_msgSend_encodeInteger_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCLMonitoringEventState"));
  v25 = objc_msgSend_date(self, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(a3, v26, v25, (uint64_t)CFSTR("kCLMonitoringEventDate"));
  v30 = objc_msgSend_diagnosticMask(self, v27, v28, v29);
  objc_msgSend_encodeInteger_forKey_(a3, v31, v30, (uint64_t)CFSTR("kCLMonitoringEventDiagnosticMask"));
}

- (CLMonitoringEvent)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v27;
  const char *v28;

  if ((objc_msgSend_requiresSecureCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v27 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, (uint64_t)self, CFSTR("CLMonitoringEvent.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v10, v14, v11, v15, v12, v13, 0);
  v17 = objc_opt_class();
  self->_identifier = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCLMonitoringEventIdentifier"));
  self->_refinement = (CLCondition *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v19, v16, (uint64_t)CFSTR("kCLMonitoringEventRefinement"));
  self->_state = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCLMonitoringEventState"), v21);
  v22 = objc_opt_class();
  self->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, (uint64_t)CFSTR("kCLMonitoringEventDate"));
  self->_diagnosticMask = objc_msgSend_decodeIntegerForKey_(a3, v24, (uint64_t)CFSTR("kCLMonitoringEventDiagnosticMask"), v25);
  return self;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v3;

  self->_state = a3;
  self->_date = (NSDate *)(id)objc_msgSend_now(MEMORY[0x1E0C99D68], a2, a3, v3);
}

- (void)updateDiagnosticMask:(unint64_t)a3
{
  self->_diagnosticMask = a3;
}

- (void)updateMonitoringState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)description
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
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v9 = objc_msgSend_identifier(self, v6, v7, v8);
  v13 = objc_msgSend_state(self, v10, v11, v12);
  if (v13 >= 4)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E29902D0);
    v18 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unsupported monitoring state\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E29902D0);
    }
    v19 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unsupported monitoring state", "{\"msg%{public}.0s\":\"Unsupported monitoring state\"}", buf, 0x12u);
    }
    v17 = CFSTR(".unsupported state");
  }
  else
  {
    v17 = off_1E29916D0[v13];
  }
  v20 = (void *)objc_msgSend_refinement(self, v14, v15, v16);
  v24 = objc_msgSend_description(v20, v21, v22, v23);
  v28 = (void *)objc_msgSend_date(self, v25, v26, v27);
  v32 = objc_msgSend_description(v28, v29, v30, v31);
  v36 = objc_msgSend_diagnosticMask(self, v33, v34, v35);
  objc_msgSend_appendFormat_(v5, v37, (uint64_t)CFSTR("CLMonitoringEvent(identifier: %@, state: %@, refinement: %@, date: %@, diagnosticMask: %d)"), v38, v9, v17, v24, v32, v36);
  return v5;
}

- (BOOL)authorizationDenied
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if ((objc_msgSend_authorizationDeniedGlobally(self, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return objc_msgSend_diagnosticMask(self, v5, v6, v7) & 1;
}

- (BOOL)authorizationDeniedGlobally
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 1) & 1;
}

- (BOOL)authorizationRestricted
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 2) & 1;
}

- (BOOL)insufficientlyInUse
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 4) & 1;
}

- (BOOL)accuracyLimited
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 6) & 1;
}

- (BOOL)conditionUnsupported
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 7) & 1;
}

- (BOOL)conditionLimitExceeded
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 8) & 1;
}

- (BOOL)persistenceUnavailable
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 9) & 1;
}

- (BOOL)serviceSessionRequired
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_diagnosticMask(self, a2, v2, v3) >> 12) & 1;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CLCondition)refinement
{
  return (CLCondition *)objc_getProperty(self, a2, 24, 1);
}

- (CLMonitoringState)state
{
  return self->_state;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)authorizationRequestInProgress
{
  return self->_authorizationRequestInProgress;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

@end
