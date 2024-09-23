@implementation IDSHandleListUpdatedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSRegistrationHandleListUpdated");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *service;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  service = self->_service;
  if (service)
    CFDictionarySetValue(v3, CFSTR("service"), service);
  return (NSDictionary *)v4;
}

- (IDSHandleListUpdatedMetric)initWithService:(id)a3
{
  id v5;
  IDSHandleListUpdatedMetric *v6;
  IDSHandleListUpdatedMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSHandleListUpdatedMetric;
  v6 = -[IDSHandleListUpdatedMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_service, a3);

  return v7;
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
