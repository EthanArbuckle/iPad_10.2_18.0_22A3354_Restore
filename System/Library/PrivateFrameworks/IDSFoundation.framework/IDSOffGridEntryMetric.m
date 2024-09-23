@implementation IDSOffGridEntryMetric

- (IDSOffGridEntryMetric)initWithService:(id)a3 source:(id)a4 date:(id)a5 success:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  IDSOffGridEntryMetric *v14;
  IDSOffGridEntryMetric *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSOffGridEntryMetric;
  v14 = -[IDSOffGridEntryMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    objc_storeStrong((id *)&v15->_source, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    v15->_success = a6;
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)CFSTR("EntryPoint");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSNumber *service;
  NSString *source;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  service = self->_service;
  if (service)
    CFDictionarySetValue(v3, CFSTR("service"), service);
  source = self->_source;
  if (source)
    CFDictionarySetValue(v6, CFSTR("source"), source);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSince1970(self->_date, v4, (uint64_t)source, v5);
  objc_msgSend_numberWithDouble_(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CFDictionarySetValue(v6, CFSTR("date"), v13);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v14, self->_success, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    CFDictionarySetValue(v6, CFSTR("success"), v16);

  return (NSDictionary *)v6;
}

- (NSNumber)service
{
  return self->_service;
}

- (NSString)source
{
  return self->_source;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
