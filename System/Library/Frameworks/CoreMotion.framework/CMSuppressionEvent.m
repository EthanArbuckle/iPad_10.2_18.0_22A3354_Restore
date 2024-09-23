@implementation CMSuppressionEvent

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 timestamp:(double)a5
{
  return (CMSuppressionEvent *)MEMORY[0x1E0DE7D20](self, sel_initWithEventType_reason_facedownState_timestamp_, a3, a4, 0);
}

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6
{
  return (CMSuppressionEvent *)objc_msgSend_initWithEventType_reason_facedownState_timestamp_timeSinceLastFacedownStatic_(self, a2, a3, a4, 0, a6, 0.0);
}

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6 timeSinceLastFacedownStatic:(double)a7
{
  CMSuppressionEvent *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMSuppressionEvent;
  result = -[CMLogItem initWithTimestamp:](&v12, sel_initWithTimestamp_, a6);
  if (result)
  {
    result->fType = a3;
    result->fReason = a4;
    result->fFacedownState = a5;
    result->fTimeSinceLastFacedownStatic = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSuppressionEvent)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSuppressionEvent *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMSuppressionEvent;
  v7 = -[CMLogItem initWithCoder:](&v24, sel_initWithCoder_);
  if (v7)
  {
    v7->fType = objc_msgSend_decodeObjectForKey_(a3, v4, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyType"), v5, v6);
    v7->fReason = objc_msgSend_decodeObjectForKey_(a3, v8, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyReason"), v9, v10);
    v7->fFacedownState = objc_msgSend_decodeObjectForKey_(a3, v11, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyFacedownState"), v12, v13);
    v17 = (void *)objc_msgSend_decodeObjectForKey_(a3, v14, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyTimeSinceLastFacedownStatic"), v15, v16);
    objc_msgSend_doubleValue(v17, v18, v19, v20, v21);
    v7->fTimeSinceLastFacedownStatic = v22;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CMSuppressionEvent;
  -[CMLogItem encodeWithCoder:](&v30, sel_encodeWithCoder_);
  v8 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, self->fType, v6, v7);
  objc_msgSend_encodeObject_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyType"), v10);
  v14 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v11, self->fReason, v12, v13);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyReason"), v16);
  v20 = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v17, self->fReason, v18, v19);
  objc_msgSend_encodeObject_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyFacedownState"), v22);
  v27 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v23, v24, v25, v26, self->fTimeSinceLastFacedownStatic);
  objc_msgSend_encodeObject_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCMSuppressionEventCodingKeyTimeSinceLastFacedownStatic"), v29);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMSuppressionEvent;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMSuppressionEvent;
  result = -[CMLogItem copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 2) = self->fType;
    *((_QWORD *)result + 3) = self->fReason;
  }
  return result;
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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double fTimeSinceLastFacedownStatic;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v6, self->fType, v7, v8);
  v13 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v10, self->fReason, v11, v12);
  v17 = objc_msgSend_stringForEventFacedownState_(CMSuppressionEvent, v14, self->fFacedownState, v15, v16);
  fTimeSinceLastFacedownStatic = self->fTimeSinceLastFacedownStatic;
  v24.receiver = self;
  v24.super_class = (Class)CMSuppressionEvent;
  -[CMLogItem timestamp](&v24, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v19, (uint64_t)CFSTR("%@ %@ %@ %@ timeSinceLastFacedownStatic=%f @ %f"), v20, v21, v5, v9, v13, v17, *(_QWORD *)&fTimeSinceLastFacedownStatic, v22);
}

- (int64_t)type
{
  return self->fType;
}

- (unint64_t)reason
{
  return self->fReason;
}

- (unint64_t)facedownState
{
  return self->fFacedownState;
}

- (double)timeSinceLastFacedownStatic
{
  return self->fTimeSinceLastFacedownStatic;
}

+ (id)stringForEventType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 3)
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)"Unexpected", v3, v4);
  else
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E29570E8[a3], v3, v4);
}

+ (id)stringForEventReason:(unint64_t)a3
{
  char v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (!a3)
    return CFSTR("Unknown");
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v4;
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_4;
LABEL_10:
    objc_msgSend_addObject_(v9, v5, (uint64_t)CFSTR("SmartPowerNap"), v7, v8);
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend_addObject_(v4, v5, (uint64_t)CFSTR("ViewObstructed"), v7, v8);
  if ((v3 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v3 & 4) != 0)
LABEL_5:
    objc_msgSend_addObject_(v9, v5, (uint64_t)CFSTR("DevicePresence"), v7, v8);
LABEL_6:
  if (!objc_msgSend_count(v9, v5, v6, v7, v8))
    __assert_rtn("+[CMSuppressionEvent stringForEventReason:]", "CMSuppressionEvent.m", 185, "[reasons count]");
  v13 = (void *)objc_msgSend_componentsJoinedByString_(v9, v10, (uint64_t)CFSTR(","), v11, v12);

  return v13;
}

+ (id)stringForEventFacedownState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 3)
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)"Unexpected", v3, v4);
  else
    return (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)off_1E2957108[a3], v3, v4);
}

@end
