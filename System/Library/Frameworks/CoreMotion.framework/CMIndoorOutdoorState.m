@implementation CMIndoorOutdoorState

- (CMIndoorOutdoorState)initWithStartDate:(id)a3 type:(int64_t)a4 confidence:(int64_t)a5
{
  CMIndoorOutdoorState *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMIndoorOutdoorState;
  v8 = -[CMIndoorOutdoorState init](&v10, sel_init);
  if (v8)
  {
    v8->fStartDate = (NSDate *)a3;
    v8->fType = a4;
    v8->fConfidence = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIndoorOutdoorState;
  -[CMIndoorOutdoorState dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMIndoorOutdoorState)initWithCoder:(id)a3
{
  CMIndoorOutdoorState *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMIndoorOutdoorState;
  v4 = -[CMIndoorOutdoorState init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyStartDate"), v7);
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyType"), v9, v10);
    v4->fConfidence = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyConfidence"), v12, v13);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_type_confidence_, self->fStartDate, self->fType, self->fConfidence);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyStartDate"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fType, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyType"), v7);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fConfidence, (uint64_t)CFSTR("kIndoorOutdoorStateCodingKeyConfidence"), v9);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (int64_t)type
{
  return self->fType;
}

- (int64_t)confidence
{
  return self->fConfidence;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t started;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  if (qword_1ECEDFD88 != -1)
    dispatch_once(&qword_1ECEDFD88, &unk_1E2954468);
  v6 = (void *)qword_1ECEDFD80;
  started = objc_msgSend_startDate(self, a2, v2, v3, v4);
  v11 = objc_msgSend_stringFromDate_(v6, v8, started, v9, v10);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v19 = objc_msgSend_type(self, v15, v16, v17, v18);
  v24 = objc_msgSend_confidence(self, v20, v21, v22, v23);
  return (id)objc_msgSend_stringWithFormat_(v12, v25, (uint64_t)CFSTR("%@, <startDate %@, type %ld, confidence %ld>"), v26, v27, v14, v11, v19, v24);
}

@end
