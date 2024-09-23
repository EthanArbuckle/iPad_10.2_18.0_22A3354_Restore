@implementation CMWakeGestureEvent

- (CMWakeGestureEvent)initWithState:(int64_t)a3 type:(int64_t)a4 orientation:(int)a5 timestamp:(double)a6
{
  CMWakeGestureEvent *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMWakeGestureEvent;
  result = -[CMLogItem initWithTimestamp:](&v10, sel_initWithTimestamp_, a6);
  if (result)
  {
    result->_state = a3;
    result->_type = a4;
    result->_orientation = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWakeGestureEvent)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMWakeGestureEvent *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMWakeGestureEvent;
  v7 = -[CMLogItem initWithCoder:](&v15, sel_initWithCoder_);
  if (v7)
  {
    v7->_state = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyState"), v5, v6);
    v7->_type = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyType"), v9, v10);
    v7->_orientation = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyOrientation"), v12, v13);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMWakeGestureEvent;
  -[CMLogItem encodeWithCoder:](&v11, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_state, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyState"), v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_type, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyType"), v8);
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->_orientation, (uint64_t)CFSTR("kCMWakeGestureEventCodingKeyOrientation"), v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMWakeGestureEvent;
  result = -[CMLogItem copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 3) = self->_state;
    *((_QWORD *)result + 4) = self->_type;
    *((_DWORD *)result + 4) = self->_orientation;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  int64_t state;
  int64_t type;
  uint64_t orientation;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  state = self->_state;
  type = self->_type;
  v14.receiver = self;
  v14.super_class = (Class)CMWakeGestureEvent;
  orientation = self->_orientation;
  -[CMLogItem timestamp](&v14, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ state=%ld, type=%ld, orientation=%d, @ %f"), v10, v11, v5, state, type, orientation, v12);
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (int)orientation
{
  return self->_orientation;
}

@end
