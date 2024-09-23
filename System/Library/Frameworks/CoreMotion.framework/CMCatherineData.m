@implementation CMCatherineData

- (CMCatherineData)initWithCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5
{
  CMCatherineData *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMCatherineData;
  result = -[CMLogItem initWithTimestamp:](&v8, sel_initWithTimestamp_, a5);
  if (result)
  {
    result->_catherine = a3;
    result->_confidence = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMCatherineData;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMCatherineData;
  result = -[CMLogItem copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_catherine;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_confidence;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCatherineData)initWithCoder:(id)a3
{
  CMCatherineData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CMCatherineData;
  v4 = -[CMLogItem initWithCoder:](&v24, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMCatherineDataCodingKeyCatherine"), v7);
    objc_msgSend_doubleValue(v8, v9, v10, v11, v12);
    v4->_catherine = v13;
    v14 = objc_opt_class();
    v17 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMCatherineDataCodingKeyConfidence"), v16);
    objc_msgSend_doubleValue(v17, v18, v19, v20, v21);
    v4->_confidence = v22;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CMCatherineData;
  -[CMLogItem encodeWithCoder:](&v19, sel_encodeWithCoder_);
  v9 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, self->_catherine);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCMCatherineDataCodingKeyCatherine"), v11);
  v16 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, v14, v15, self->_confidence);
  objc_msgSend_encodeObject_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMCatherineDataCodingKeyConfidence"), v18);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  double catherine;
  double confidence;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  catherine = self->_catherine;
  confidence = self->_confidence;
  v13.receiver = self;
  v13.super_class = (Class)CMCatherineData;
  -[CMLogItem timestamp](&v13, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@,<catherine %f confidence %f @ %f>"), v9, v10, v5, *(_QWORD *)&catherine, *(_QWORD *)&confidence, v11);
}

- (double)catherine
{
  return self->_catherine;
}

- (double)confidence
{
  return self->_confidence;
}

@end
