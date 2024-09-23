@implementation IDSQuickRelayMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSQuickRelayEvent");
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
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_type(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("type"), v7);

  objc_msgSend_subType(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("subType"), v11);

  objc_msgSend_duration(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("duration"), v15);

  objc_msgSend_resultCode(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("resultCode"), v19);

  objc_msgSend_providerType(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("providerType"), v23);

  objc_msgSend_transportType(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("transportType"), v27);

  objc_msgSend_interfaceType(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("interfaceType"), v31);

  objc_msgSend_skeEnabled(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("skeEnabled"), v35);

  objc_msgSend_isInitiator(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("isInitiator"), v39);

  objc_msgSend_protocolVersion(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("protocolVersion"), v43);

  objc_msgSend_retryCount(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("retryCount"), v47);

  objc_msgSend_serviceName(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    CFDictionarySetValue(v3, CFSTR("serviceName"), v51);

  objc_msgSend_subServiceName(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("subServiceName"), v55);

  objc_msgSend_participantCount(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    CFDictionarySetValue(v3, CFSTR("participantCount"), v59);

  return (NSDictionary *)v3;
}

- (IDSQuickRelayMetric)initWithType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  IDSQuickRelayMetric *v26;
  IDSQuickRelayMetric *v27;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v40 = a4;
  v30 = a5;
  v39 = a5;
  v31 = a6;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v35 = a9;
  v34 = a10;
  v33 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v42.receiver = self;
  v42.super_class = (Class)IDSQuickRelayMetric;
  v26 = -[IDSQuickRelayMetric init](&v42, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_type, a3);
    objc_storeStrong((id *)&v27->_subType, a4);
    objc_storeStrong((id *)&v27->_duration, v30);
    objc_storeStrong((id *)&v27->_resultCode, v31);
    objc_storeStrong((id *)&v27->_providerType, a7);
    objc_storeStrong((id *)&v27->_transportType, a8);
    objc_storeStrong((id *)&v27->_interfaceType, a9);
    objc_storeStrong((id *)&v27->_skeEnabled, a10);
    objc_storeStrong((id *)&v27->_isInitiator, a11);
    objc_storeStrong((id *)&v27->_protocolVersion, a12);
    objc_storeStrong((id *)&v27->_retryCount, a13);
    objc_storeStrong((id *)&v27->_serviceName, a14);
    objc_storeStrong((id *)&v27->_subServiceName, a15);
    objc_storeStrong((id *)&v27->_participantCount, a16);
  }

  return v27;
}

- (NSNumber)type
{
  return self->_type;
}

- (NSNumber)subType
{
  return self->_subType;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)resultCode
{
  return self->_resultCode;
}

- (NSNumber)providerType
{
  return self->_providerType;
}

- (NSNumber)transportType
{
  return self->_transportType;
}

- (NSNumber)interfaceType
{
  return self->_interfaceType;
}

- (NSNumber)skeEnabled
{
  return self->_skeEnabled;
}

- (NSNumber)isInitiator
{
  return self->_isInitiator;
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)subServiceName
{
  return self->_subServiceName;
}

- (NSNumber)participantCount
{
  return self->_participantCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantCount, 0);
  objc_storeStrong((id *)&self->_subServiceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_isInitiator, 0);
  objc_storeStrong((id *)&self->_skeEnabled, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_providerType, 0);
  objc_storeStrong((id *)&self->_resultCode, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_subType, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
