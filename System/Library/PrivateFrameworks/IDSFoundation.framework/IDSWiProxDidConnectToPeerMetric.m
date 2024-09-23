@implementation IDSWiProxDidConnectToPeerMetric

- (NSString)name
{
  return (NSString *)CFSTR("WiProxDidConnectToPeer");
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
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_duration(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("duration"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_resultCode(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("resultCode"), v19);

  return (NSDictionary *)v3;
}

- (IDSWiProxDidConnectToPeerMetric)initWithDuration:(unint64_t)a3 resultCode:(unint64_t)a4
{
  IDSWiProxDidConnectToPeerMetric *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSWiProxDidConnectToPeerMetric;
  result = -[IDSWiProxDidConnectToPeerMetric init](&v7, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_resultCode = a4;
  }
  return result;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)resultCode
{
  return self->_resultCode;
}

@end
