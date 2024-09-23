@implementation IDSOTRSessionNegotiationMetric

- (NSString)name
{
  return (NSString *)CFSTR("OTRSessionNegotiation");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSString *service;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  service = self->_service;
  if (service)
    CFDictionarySetValue(v3, CFSTR("service"), service);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend_priority(self, v4, (uint64_t)service, v5);
  objc_msgSend_numberWithUnsignedLongLong_(v8, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    CFDictionarySetValue(v6, CFSTR("priority"), v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend_duration(self, v14, v15, v16);
  objc_msgSend_numberWithUnsignedLongLong_(v13, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v6, CFSTR("duration"), v20);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend_result(self, v22, v23, v24);
  objc_msgSend_numberWithUnsignedInt_(v21, v26, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v6, CFSTR("result"), v28);

  return (NSDictionary *)v6;
}

- (IDSOTRSessionNegotiationMetric)initWithService:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6
{
  id v11;
  IDSOTRSessionNegotiationMetric *v12;
  IDSOTRSessionNegotiationMetric *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSOTRSessionNegotiationMetric;
  v12 = -[IDSOTRSessionNegotiationMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    v13->_priority = a4;
    v13->_duration = a5;
    v13->_result = a6;
  }

  return v13;
}

- (NSString)service
{
  return self->_service;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
