@implementation IDSMagnetDataCorruptionRecoveryTimeInMsMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSMagnetDataCorruptionRecoveryTimeInMs");
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
  v8 = objc_msgSend_recoveryTime(self, v5, v6, v7);
  objc_msgSend_numberWithLongLong_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("recoveryTime"), v11);

  return (NSDictionary *)v3;
}

- (IDSMagnetDataCorruptionRecoveryTimeInMsMetric)initWithRecoveryTime:(int64_t)a3
{
  IDSMagnetDataCorruptionRecoveryTimeInMsMetric *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSMagnetDataCorruptionRecoveryTimeInMsMetric;
  result = -[IDSMagnetDataCorruptionRecoveryTimeInMsMetric init](&v5, sel_init);
  if (result)
    result->_recoveryTime = a3;
  return result;
}

- (int64_t)recoveryTime
{
  return self->_recoveryTime;
}

@end
