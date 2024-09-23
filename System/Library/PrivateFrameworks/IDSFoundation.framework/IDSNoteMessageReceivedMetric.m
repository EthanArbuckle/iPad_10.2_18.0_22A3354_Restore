@implementation IDSNoteMessageReceivedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSNoteMessageReceived");
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
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service"), v7);

  objc_msgSend_accountType(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("accountType"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_fromStorage(self, v13, v14, v15);
  objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("fromStorage"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_serverTimestamp(self, v21, v22, v23);
  objc_msgSend_numberWithDouble_(v20, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("serverTimestamp"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localTimeDelta(self, v29, v30, v31);
  objc_msgSend_numberWithDouble_(v28, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("localTimeDelta"), v35);

  return (NSDictionary *)v3;
}

- (IDSNoteMessageReceivedMetric)initWithService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7
{
  id v13;
  id v14;
  IDSNoteMessageReceivedMetric *v15;
  IDSNoteMessageReceivedMetric *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSNoteMessageReceivedMetric;
  v15 = -[IDSNoteMessageReceivedMetric init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_service, a3);
    objc_storeStrong((id *)&v16->_accountType, a4);
    v16->_fromStorage = a5;
    v16->_serverTimestamp = a6;
    v16->_localTimeDelta = a7;
  }

  return v16;
}

- (NSString)service
{
  return self->_service;
}

- (NSNumber)accountType
{
  return self->_accountType;
}

- (BOOL)fromStorage
{
  return self->_fromStorage;
}

- (double)serverTimestamp
{
  return self->_serverTimestamp;
}

- (double)localTimeDelta
{
  return self->_localTimeDelta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
