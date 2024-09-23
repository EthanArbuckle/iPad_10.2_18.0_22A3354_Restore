@implementation IDSWiFiSetupAttemptMetric

- (NSString)name
{
  return (NSString *)CFSTR("WiFiSetupAttempt");
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
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_attemptType(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("attemptType"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_msDuration(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("msDuration"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_result(self, v21, v22, v23);
  objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("result"), v27);

  objc_msgSend_client(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("client"), v31);

  return (NSDictionary *)v3;
}

- (IDSWiFiSetupAttemptMetric)initWithAttemptType:(unint64_t)a3 msDuration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6
{
  id v11;
  IDSWiFiSetupAttemptMetric *v12;
  IDSWiFiSetupAttemptMetric *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IDSWiFiSetupAttemptMetric;
  v12 = -[IDSWiFiSetupAttemptMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_attemptType = a3;
    v12->_msDuration = a4;
    v12->_result = a5;
    objc_storeStrong((id *)&v12->_client, a6);
  }

  return v13;
}

- (unint64_t)attemptType
{
  return self->_attemptType;
}

- (unint64_t)msDuration
{
  return self->_msDuration;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSString)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
