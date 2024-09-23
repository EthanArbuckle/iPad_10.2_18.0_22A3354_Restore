@implementation IDSLocalMessageSentMetric

- (IDSLocalMessageSentMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(int64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  IDSLocalMessageSentMetric *v15;
  double v16;
  uint64_t v17;
  NSString *service;
  objc_super v20;

  v12 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IDSLocalMessageSentMetric;
  v15 = -[IDSLocalMessageSentMetric init](&v20, sel_init);
  if (v15)
  {
    v17 = objc_msgSend_copy(v12, v13, v14, v16);
    service = v15->_service;
    v15->_service = (NSString *)v17;

    v15->_isToDefaultPairedDevice = a4;
    v15->_messageSize = a5;
    v15->_linkType = a6;
    v15->_priority = a7;
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)CFSTR("LocalMessageSent");
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
  v12 = objc_msgSend_isToDefaultPairedDevice(self, v9, v10, v11);
  objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("isToDefaultPairedDevice"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_messageSize(self, v17, v18, v19);
  objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
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
  objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("priority"), v39);

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555908;
}

- (NSCopying)awdRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unsigned int v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setService_(v3, v8, (uint64_t)v7, v9);

  v13 = objc_msgSend_isToDefaultPairedDevice(self, v10, v11, v12);
  objc_msgSend_setIsToDefaultPairedDevice_(v3, v14, v13, v15);
  v19 = objc_msgSend_messageSize(self, v16, v17, v18);
  objc_msgSend_setMessageSize_(v3, v20, v19, v21);
  v25 = objc_msgSend_linkType(self, v22, v23, v24);
  objc_msgSend_setLinkType_(v3, v26, v25, v27);
  v31 = objc_msgSend_priority(self, v28, v29, v30);
  objc_msgSend_setPriority_(v3, v32, v31, v33);
  return (NSCopying *)v3;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (int64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
