@implementation IDSLocalDeliveryMessageReceivedMetric

- (NSString)name
{
  return (NSString *)CFSTR("LocalDeliveryMessageReceived");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_isFromDefaultPairedDevice(self, v9, v10, v11);
  objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("isFromDefaultPairedDevice"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_messageSize(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("messageSize"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_linkType(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("linkType"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_priority(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("priority"), v39);

  return (NSDictionary *)v3;
}

- (IDSLocalDeliveryMessageReceivedMetric)initWithService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7
{
  id v13;
  IDSLocalDeliveryMessageReceivedMetric *v14;
  IDSLocalDeliveryMessageReceivedMetric *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSLocalDeliveryMessageReceivedMetric;
  v14 = -[IDSLocalDeliveryMessageReceivedMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    v15->_isFromDefaultPairedDevice = a4;
    v15->_messageSize = a5;
    v15->_linkType = a6;
    v15->_priority = a7;
  }

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
