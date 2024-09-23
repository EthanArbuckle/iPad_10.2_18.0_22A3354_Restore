@implementation IDSSessionStartedMetric

- (NSString)name
{
  return (NSString *)CFSTR("SessionStarted");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  objc_msgSend_protocolVersionNumber(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("protocolVersionNumber"), v11);

  objc_msgSend_serviceName(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("serviceName"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_clientType(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("clientType"), v23);

  return (NSDictionary *)v3;
}

- (IDSSessionStartedMetric)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6
{
  id v11;
  id v12;
  id v13;
  IDSSessionStartedMetric *v14;
  IDSSessionStartedMetric *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSSessionStartedMetric;
  v14 = -[IDSSessionStartedMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guid, a3);
    objc_storeStrong((id *)&v15->_protocolVersionNumber, a4);
    objc_storeStrong((id *)&v15->_serviceName, a5);
    v15->_clientType = a6;
  }

  return v15;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)protocolVersionNumber
{
  return self->_protocolVersionNumber;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_protocolVersionNumber, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
