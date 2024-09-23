@implementation CMWaterSubmersionEvent

- (CMWaterSubmersionEvent)initWithEvent:(int64_t)a3 andDate:(id)a4
{
  CMWaterSubmersionEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMWaterSubmersionEvent;
  v6 = -[CMWaterSubmersionEvent init](&v8, sel_init);
  if (v6)
  {
    v6->_date = (NSDate *)a4;
    v6->_state = a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMWaterSubmersionEvent;
  -[CMWaterSubmersionEvent dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_state(self, v10, v11, v12, v13);
  v19 = objc_msgSend_date(self, v15, v16, v17, v18);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithEvent_andDate_, v14, v19, v20);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterSubmersionEvent)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWaterSubmersionEvent *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMWaterSubmersionEvent;
  v7 = -[CMWaterSubmersionEvent init](&v12, sel_init);
  if (v7)
  {
    v7->_state = (int)objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("kCMWaterSubmersionEvent"), v5, v6);
    v8 = objc_opt_class();
    v7->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMWaterSubmersionEventDate"), v10);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v7 = objc_msgSend_state(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_encodeInteger_forKey_(a3, v8, v7, (uint64_t)CFSTR("kCMWaterSubmersionEvent"), v9);
  v14 = objc_msgSend_date(self, v10, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMWaterSubmersionEventDate"), v16);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend_state(self, a2, v2, v3, v4);
  v12 = objc_msgSend_date(self, v8, v9, v10, v11);
  return (id)objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("CMWaterSubmersionEvent (event:%d, date:%@)"), v14, v15, v7, v12);
}

- (NSDate)date
{
  return self->_date;
}

- (CMWaterSubmersionState)state
{
  return self->_state;
}

@end
