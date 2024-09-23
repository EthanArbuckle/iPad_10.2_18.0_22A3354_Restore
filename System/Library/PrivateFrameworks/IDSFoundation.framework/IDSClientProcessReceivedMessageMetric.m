@implementation IDSClientProcessReceivedMessageMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSClientProcessReceivedMessage");
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

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_serviceIdentifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("serviceIdentifier"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_messageSize(self, v9, v10, v11);
  objc_msgSend_numberWithUnsignedLongLong_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("messageSize"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_deltaTime(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("deltaTime"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_priority(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("priority"), v31);

  return (NSDictionary *)v3;
}

- (IDSClientProcessReceivedMessageMetric)initWithServiceIdentifier:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6
{
  id v11;
  IDSClientProcessReceivedMessageMetric *v12;
  IDSClientProcessReceivedMessageMetric *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSClientProcessReceivedMessageMetric;
  v12 = -[IDSClientProcessReceivedMessageMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceIdentifier, a3);
    v13->_messageSize = a4;
    v13->_deltaTime = a5;
    v13->_priority = a6;
  }

  return v13;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)deltaTime
{
  return self->_deltaTime;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
