@implementation IDSWiProxConnectionSuccessMetric

- (NSString)name
{
  return (NSString *)CFSTR("WiProxConnectionSuccess");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_duration(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("duration"), v11);

  return (NSDictionary *)v3;
}

- (IDSWiProxConnectionSuccessMetric)initWithDuration:(unint64_t)a3
{
  IDSWiProxConnectionSuccessMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSWiProxConnectionSuccessMetric;
  result = -[IDSWiProxConnectionSuccessMetric init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end
