@implementation IDSQRAllocationMetric

- (NSString)name
{
  return (NSString *)CFSTR("QRAllocation");
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
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t hasRecipientAccepted;
  const char *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
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

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_duration(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("duration"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_result(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("result"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  hasRecipientAccepted = objc_msgSend_hasRecipientAccepted(self, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInt_(v20, v25, hasRecipientAccepted, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("hasRecipientAccepted"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_payloadSize(self, v29, v30, v31);
  objc_msgSend_numberWithUnsignedInt_(v28, v33, v32, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("payloadSize"), v35);

  objc_msgSend_topic(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("topic"), v39);

  objc_msgSend_service(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("service"), v43);

  return (NSDictionary *)v3;
}

- (IDSQRAllocationMetric)initWithDuration:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8
{
  id v15;
  id v16;
  IDSQRAllocationMetric *v17;
  IDSQRAllocationMetric *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)IDSQRAllocationMetric;
  v17 = -[IDSQRAllocationMetric init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_duration = a3;
    v17->_result = a4;
    v17->_hasRecipientAccepted = a5;
    v17->_payloadSize = a6;
    objc_storeStrong((id *)&v17->_topic, a7);
    objc_storeStrong((id *)&v18->_service, a8);
  }

  return v18;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)hasRecipientAccepted
{
  return self->_hasRecipientAccepted;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
