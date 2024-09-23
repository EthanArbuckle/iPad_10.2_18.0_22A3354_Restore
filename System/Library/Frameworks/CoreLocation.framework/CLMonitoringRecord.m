@implementation CLMonitoringRecord

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_initRecordWithCondition_identifier_options_, a3, a4);
}

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend_initRecordWithCondition_identifier_options_initialState_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0);
}

- (id)initRecordWithMonitoringRecord:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_msgSend_condition(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_options(a3, v7, v8, v9);
  objc_msgSend_lastEvent(a3, v11, v12, v13);
  return (id)MEMORY[0x1E0DE7D20](self, sel_initRecordWithCondition_options_event_, v6, v10);
}

- (id)initRecordWithCondition:(id)a3 identifier:(id)a4 options:(unint64_t)a5 initialState:(unint64_t)a6
{
  CLMonitoringEvent *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v11 = [CLMonitoringEvent alloc];
  v15 = objc_msgSend_date(MEMORY[0x1E0C99D68], v12, v13, v14);
  v17 = (id)objc_msgSend_initWithIdentifier_refinement_state_date_diagnostics_(v11, v16, (uint64_t)a4, 0, a6, v15, 0);
  return (id)MEMORY[0x1E0DE7D20](self, sel_initRecordWithCondition_options_event_, a3, a5);
}

- (id)initRecordWithCondition:(id)a3 options:(unint64_t)a4 event:(id)a5
{
  CLMonitoringRecord *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLMonitoringRecord;
  v8 = -[CLMonitoringRecord init](&v10, sel_init);
  if (v8)
  {
    v8->_condition = (CLCondition *)a3;
    v8->_options = a4;
    v8->_lastEvent = (CLMonitoringEvent *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_condition = 0;
  self->_lastEvent = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLMonitoringRecord;
  -[CLMonitoringRecord dealloc](&v3, sel_dealloc);
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
  uint64_t Event;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;

  if ((objc_msgSend_requiresSecureCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CLMonitoringRecord.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  }
  v10 = objc_msgSend_condition(self, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLMonitoringRecordCondition"));
  Event = objc_msgSend_lastEvent(self, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(a3, v16, Event, (uint64_t)CFSTR("kCLMonitoringRecordLastEvent"));
  v20 = objc_msgSend_options(self, v17, v18, v19);
  objc_msgSend_encodeInteger_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCLMonitoringRecordMonitoringOptions"));
}

- (CLMonitoringRecord)initWithCoder:(id)a3
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
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v23;
  const char *v24;

  if ((objc_msgSend_requiresSecureCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v23 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CLMonitoringRecord.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v10, v14, v11, v15, v12, v13, 0);
  self->_condition = (CLCondition *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLMonitoringRecordCondition"));
  v18 = objc_opt_class();
  self->_lastEvent = (CLMonitoringEvent *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("kCLMonitoringRecordLastEvent"));
  self->_options = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCLMonitoringRecordMonitoringOptions"), v21);
  return self;
}

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  void *Event;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  Event = (void *)objc_msgSend_lastEvent(self, a2, v2, v3);
  return (NSString *)objc_msgSend_identifier(Event, v5, v6, v7);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t Event;
  const char *v26;
  uint64_t v27;

  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v9 = (void *)objc_msgSend_condition(self, v6, v7, v8);
  v13 = objc_msgSend_description(v9, v10, v11, v12);
  objc_msgSend_appendString_(v5, v14, v13, v15);
  v19 = objc_msgSend_options(self, v16, v17, v18);
  objc_msgSend_appendFormat_(v5, v20, (uint64_t)CFSTR(", options: %lu"), v21, v19);
  Event = objc_msgSend_lastEvent(self, v22, v23, v24);
  objc_msgSend_appendFormat_(v5, v26, (uint64_t)CFSTR(", lastEvent: %@"), v27, Event);
  return v5;
}

- (void)updateEvent:(id)a3
{
  CLMonitoringEvent *v4;

  v4 = (CLMonitoringEvent *)a3;

  self->_lastEvent = v4;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *Event;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  Event = (void *)objc_msgSend_lastEvent(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_identifier(Event, v6, v7, v8);
  v13 = objc_msgSend_hash(v9, v10, v11, v12);
  v17 = (void *)objc_msgSend_condition(self, v14, v15, v16);
  return objc_msgSend_hash(v17, v18, v19, v20) ^ v13;
}

- (BOOL)isEqual:(id)a3
{
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
  int isEqual;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *Event;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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

  if (self == a3)
  {
    LOBYTE(isEqual) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend_condition(self, v5, v6, v7);
      v12 = objc_msgSend_condition(a3, v9, v10, v11);
      isEqual = objc_msgSend_isEqual_(v8, v13, v12, v14);
      if (isEqual)
      {
        Event = (void *)objc_msgSend_lastEvent(self, v16, v17, v18);
        v23 = (void *)objc_msgSend_identifier(Event, v20, v21, v22);
        v27 = (void *)objc_msgSend_lastEvent(a3, v24, v25, v26);
        v31 = objc_msgSend_identifier(v27, v28, v29, v30);
        LOBYTE(isEqual) = objc_msgSend_isEqualToString_(v23, v32, v31, v33);
      }
    }
    else
    {
      LOBYTE(isEqual) = 0;
    }
  }
  return isEqual;
}

- (CLCondition)condition
{
  return (CLCondition *)objc_getProperty(self, a2, 8, 1);
}

- (CLMonitoringEvent)lastEvent
{
  return (CLMonitoringEvent *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)options
{
  return self->_options;
}

@end
