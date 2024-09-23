@implementation IDSLocalMessageDeliveryConnectionResetMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSLocalMessageDeliveryConnectionReset");
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
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  const char *v53;
  double v54;
  void *v55;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_isToDefaultPairedDevice(self, v9, v10, v11);
  objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("isToDefaultPairedDevice"), v15);

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
  v36 = objc_msgSend_deliveryError(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("deliveryError"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v44 = objc_msgSend_RTT(self, v41, v42, v43);
  objc_msgSend_numberWithUnsignedLongLong_(v40, v45, v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("RTT"), v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  v52 = objc_msgSend_priority(self, v49, v50, v51);
  objc_msgSend_numberWithUnsignedLongLong_(v48, v53, v52, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("priority"), v55);

  return (NSDictionary *)v3;
}

- (IDSLocalMessageDeliveryConnectionResetMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9
{
  id v16;
  IDSLocalMessageDeliveryConnectionResetMetric *v17;
  IDSLocalMessageDeliveryConnectionResetMetric *v18;
  objc_super v20;

  v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IDSLocalMessageDeliveryConnectionResetMetric;
  v17 = -[IDSLocalMessageDeliveryConnectionResetMetric init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_service, a3);
    v18->_isToDefaultPairedDevice = a4;
    v18->_messageSize = a5;
    v18->_linkType = a6;
    v18->_deliveryError = a7;
    v18->_RTT = a8;
    v18->_priority = a9;
  }

  return v18;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)deliveryError
{
  return self->_deliveryError;
}

- (unint64_t)RTT
{
  return self->_RTT;
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
