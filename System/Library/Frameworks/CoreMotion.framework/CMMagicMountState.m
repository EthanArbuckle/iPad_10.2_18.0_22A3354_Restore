@implementation CMMagicMountState

- (CMMagicMountState)initWithMountStatus:(int64_t)a3 timestamp:(double)a4
{
  CMMagicMountState *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMMagicMountState;
  result = -[CMLogItem initWithTimestamp:](&v6, sel_initWithTimestamp_, a4);
  if (result)
    result->_mountStatus = a3;
  return result;
}

- (BOOL)isMounted
{
  return self->_mountStatus == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMagicMountState)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMMagicMountState *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMMagicMountState;
  v7 = -[CMLogItem initWithCoder:](&v9, sel_initWithCoder_);
  if (v7)
    v7->_mountStatus = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMMagicMountStateCodingKeyMountStatus"), v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMMagicMountState;
  -[CMLogItem encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_mountStatus, (uint64_t)CFSTR("kCMMagicMountStateCodingKeyMountStatus"), v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMMagicMountState;
  result = -[CMLogItem copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 2) = self->_mountStatus;
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
  unsigned int isMounted;
  int64_t mountStatus;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  isMounted = objc_msgSend_isMounted(self, v6, v7, v8, v9);
  mountStatus = self->_mountStatus;
  v17.receiver = self;
  v17.super_class = (Class)CMMagicMountState;
  -[CMLogItem timestamp](&v17, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("%@ mounted=%d, mountStatus=%ld @ %f"), v13, v14, v5, isMounted, mountStatus, v15);
}

- (int64_t)mountStatus
{
  return self->_mountStatus;
}

@end
