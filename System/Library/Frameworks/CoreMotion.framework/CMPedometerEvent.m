@implementation CMPedometerEvent

- (CMPedometerEvent)initWithEventDate:(id)a3 type:(int64_t)a4
{
  CMPedometerEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMPedometerEvent;
  v6 = -[CMPedometerEvent init](&v8, sel_init);
  if (v6)
  {
    v6->fDate = (NSDate *)a3;
    v6->fType = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPedometerEvent;
  -[CMPedometerEvent dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithEventDate_type_, self->fDate, self->fType, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedometerEvent)initWithCoder:(id)a3
{
  CMPedometerEvent *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMPedometerEvent;
  v4 = -[CMPedometerEvent init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMPedometerEventKeyEventDate"), v7);
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMPedometerEventKeyEventType"), v9, v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fDate, (uint64_t)CFSTR("kCMPedometerEventKeyEventDate"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fType, (uint64_t)CFSTR("kCMPedometerEventKeyEventType"), v7);
}

+ (id)eventStringFromType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Resume");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("Pause");
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
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_date(self, v6, v7, v8, v9);
  v15 = objc_msgSend_type(self, v11, v12, v13, v14);
  v19 = objc_msgSend_eventStringFromType_(CMPedometerEvent, v16, v15, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("%@,<eventDate, %@, eventType, %@>"), v21, v22, v5, v10, v19);
}

- (NSDate)date
{
  return self->fDate;
}

- (CMPedometerEventType)type
{
  return self->fType;
}

@end
