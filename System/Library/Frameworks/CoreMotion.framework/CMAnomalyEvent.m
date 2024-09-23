@implementation CMAnomalyEvent

- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10
{
  CMAnomalyEvent *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMAnomalyEvent;
  result = -[CMAnomalyEvent init](&v19, sel_init);
  if (result)
  {
    result->_absoluteTimestamp = a4;
    result->_updateTimestamp = a5;
    result->_state = a6;
    result->_response = a7;
    result->_resolution = a8;
    result->_acknowledgement = 0;
    result->_identifier = a3;
    result->_sosState = a9;
    result->_operatingMode = a10;
  }
  return result;
}

- (CMAnomalyEvent)initWithIdentifier:(unint64_t)a3 absoluteTimestamp:(double)a4 updateTimestamp:(double)a5 state:(int64_t)a6 response:(int64_t)a7 resolution:(int64_t)a8 sosState:(int64_t)a9 operatingMode:(int64_t)a10 acknowledgement:(BOOL)a11
{
  CMAnomalyEvent *result;

  result = (CMAnomalyEvent *)objc_msgSend_initWithIdentifier_absoluteTimestamp_updateTimestamp_state_response_resolution_sosState_operatingMode_(self, a2, a3, a6, a7, a8, a9, a10, a4, a5);
  if (result)
    result->_acknowledgement = a11;
  return result;
}

- (CMAnomalyEvent)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMAnomalyEvent *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
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
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CMAnomalyEvent;
  v7 = -[CMAnomalyEvent init](&v35, sel_init);
  if (v7)
  {
    v7->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, (uint64_t)CFSTR("kCMAnomalyEventAopTimestamp"), v5, v6);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("kCMAnomalyEventAbsTimestamp"), v9, v10);
    v7->_absoluteTimestamp = v11;
    objc_msgSend_decodeDoubleForKey_(a3, v12, (uint64_t)CFSTR("kCMAnomalyEventUpdTimestamp"), v13, v14);
    v7->_updateTimestamp = v15;
    v7->_state = objc_msgSend_decodeIntegerForKey_(a3, v16, (uint64_t)CFSTR("kCMAnomalyEventState"), v17, v18);
    v7->_response = objc_msgSend_decodeIntegerForKey_(a3, v19, (uint64_t)CFSTR("kCMAnomalyEventResponse"), v20, v21);
    v7->_resolution = objc_msgSend_decodeIntegerForKey_(a3, v22, (uint64_t)CFSTR("kCMAnomalyEventResolution"), v23, v24);
    v7->_acknowledgement = objc_msgSend_decodeBoolForKey_(a3, v25, (uint64_t)CFSTR("kCMAnomalyEventIsAcknowledged"), v26, v27);
    v7->_sosState = objc_msgSend_decodeIntegerForKey_(a3, v28, (uint64_t)CFSTR("kCMAnomalyEventSOSState"), v29, v30);
    v7->_operatingMode = objc_msgSend_decodeIntegerForKey_(a3, v31, (uint64_t)CFSTR("kCMAnomalyEventOperatingMode"), v32, v33);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  BOOL acknowledgement;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  acknowledgement = self->_acknowledgement;
  return (id)objc_msgSend_initWithIdentifier_absoluteTimestamp_updateTimestamp_state_response_resolution_sosState_operatingMode_acknowledgement_(v9, v10, self->_identifier, self->_state, self->_response, self->_resolution, self->_sosState, self->_operatingMode, self->_absoluteTimestamp, self->_updateTimestamp, acknowledgement);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, (uint64_t)CFSTR("kCMAnomalyEventAopTimestamp"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCMAnomalyEventAbsTimestamp"), v7, v8, self->_absoluteTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCMAnomalyEventUpdTimestamp"), v10, v11, self->_updateTimestamp);
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->_state, (uint64_t)CFSTR("kCMAnomalyEventState"), v13);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->_response, (uint64_t)CFSTR("kCMAnomalyEventResponse"), v15);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_resolution, (uint64_t)CFSTR("kCMAnomalyEventResolution"), v17);
  objc_msgSend_encodeBool_forKey_(a3, v18, self->_acknowledgement, (uint64_t)CFSTR("kCMAnomalyEventIsAcknowledged"), v19);
  objc_msgSend_encodeInteger_forKey_(a3, v20, self->_sosState, (uint64_t)CFSTR("kCMAnomalyEventSOSState"), v21);
  objc_msgSend_encodeInteger_forKey_(a3, v22, self->_operatingMode, (uint64_t)CFSTR("kCMAnomalyEventOperatingMode"), v23);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->_absoluteTimestamp);
}

- (NSDate)updateDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->_updateTimestamp);
}

- (id)debugDescription
{
  unint64_t v3;
  const __CFString *v4;
  unint64_t response;
  const __CFString *v6;
  unint64_t resolution;
  const __CFString *v8;
  unint64_t sosState;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = self->_state - 1;
  if (v3 > 2)
    v4 = CFSTR("Undefined");
  else
    v4 = off_1E2958148[v3];
  response = self->_response;
  if (response > 5)
    v6 = CFSTR("Undefined");
  else
    v6 = off_1E2958160[response];
  resolution = self->_resolution;
  if (resolution > 2)
    v8 = CFSTR("Undefined");
  else
    v8 = off_1E2958190[resolution];
  sosState = self->_sosState;
  if (sosState > 4)
    v10 = CFSTR("Undefined");
  else
    v10 = off_1E29581A8[sosState];
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v18 = objc_msgSend_date(self, v14, v15, v16, v17);
  return (id)objc_msgSend_stringWithFormat_(v11, v19, (uint64_t)CFSTR("%@,<date %@ identifier %llu state %@ response %@ resolution %@ absoluteTimestamp %f updated %f SOS Call %@>"), v20, v21, v13, v18, self->_identifier, v4, v6, v8, *(_QWORD *)&self->_absoluteTimestamp, *(_QWORD *)&self->_updateTimestamp, v10);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_date(self, v6, v7, v8, v9);
  return (id)objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("%@,<date %@ identifier %llu state %d response %d resolution %d absoluteTimestamp %f updated %f SOS Call state %d>"), v12, v13, v5, v10, self->_identifier, self->_state, self->_response, self->_resolution, *(_QWORD *)&self->_absoluteTimestamp, *(_QWORD *)&self->_updateTimestamp, self->_sosState);
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)response
{
  return self->_response;
}

- (void)setResponse:(int64_t)a3
{
  self->_response = a3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (BOOL)isAcknowledgement
{
  return self->_acknowledgement;
}

- (void)setAcknowledgement:(BOOL)a3
{
  self->_acknowledgement = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->_absoluteTimestamp = a3;
}

- (double)updateTimestamp
{
  return self->_updateTimestamp;
}

- (void)setUpdateTimestamp:(double)a3
{
  self->_updateTimestamp = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (int64_t)sosState
{
  return self->_sosState;
}

- (void)setSosState:(int64_t)a3
{
  self->_sosState = a3;
}

- (int64_t)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int64_t)a3
{
  self->_operatingMode = a3;
}

@end
