@implementation CMOnBodyStatus

- (CMOnBodyStatus)initWithOnBodyResult:(int)a3 confidence:(int)a4 timestamp:(double)a5
{
  CMOnBodyStatus *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMOnBodyStatus;
  result = -[CMLogItem initWithTimestamp:](&v8, sel_initWithTimestamp_, a5);
  if (result)
  {
    result->fResult = a3;
    result->fConfidence = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMOnBodyStatus)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMOnBodyStatus *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMOnBodyStatus;
  v7 = -[CMLogItem initWithCoder:](&v12, sel_initWithCoder_);
  if (v7)
  {
    v7->fResult = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("kCMOnBodyStatusResult"), v5, v6);
    v7->fConfidence = objc_msgSend_decodeIntForKey_(a3, v8, (uint64_t)CFSTR("kCMOnBodyStatusConfidence"), v9, v10);
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
  uint64_t fResult;
  uint64_t fConfidence;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  fResult = self->fResult;
  fConfidence = self->fConfidence;
  v15.receiver = self;
  v15.super_class = (Class)CMOnBodyStatus;
  -[CMLogItem timestamp](&v15, sel_timestamp);
  return (id)objc_msgSend_initWithOnBodyResult_confidence_timestamp_(v9, v12, fResult, fConfidence, v13);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMOnBodyStatus;
  -[CMLogItem encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeInt_forKey_(a3, v5, self->fResult, (uint64_t)CFSTR("kCMOnBodyStatusResult"), v6);
  objc_msgSend_encodeInt_forKey_(a3, v7, self->fConfidence, (uint64_t)CFSTR("kCMOnBodyStatusConfidence"), v8);
}

- (int64_t)result
{
  return self->fResult;
}

- (int64_t)confidence
{
  return self->fConfidence;
}

- (id)description
{
  void *v2;
  uint64_t fResult;
  uint64_t fConfidence;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CMOnBodyStatus;
  fResult = self->fResult;
  fConfidence = self->fConfidence;
  -[CMLogItem timestamp](&v10, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("result %d confidence %d timestamp %f"), v6, v7, fResult, fConfidence, v8);
}

@end
