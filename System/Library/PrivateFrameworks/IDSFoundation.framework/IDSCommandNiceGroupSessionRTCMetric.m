@implementation IDSCommandNiceGroupSessionRTCMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSCommandNiceGroupSessionRTC");
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
  const char *v20;
  uint64_t v21;
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
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_command(self, v5, v6, v7);
  objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("command"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_success(self, v13, v14, v15);
  objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("success"), v19);

  objc_msgSend_errorDomain(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("errorDomain"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_errorCode(self, v25, v26, v27);
  objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("errorCode"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_retryCount(self, v33, v34, v35);
  objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("retryCount"), v39);

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeIDSCommandNiceGroupSessionRTC;
}

- (IDSCommandNiceGroupSessionRTCMetric)initWithCommand:(int64_t)a3 success:(BOOL)a4 errorDomain:(id)a5 errorCode:(int64_t)a6 retryCount:(int64_t)a7
{
  id v13;
  IDSCommandNiceGroupSessionRTCMetric *v14;
  IDSCommandNiceGroupSessionRTCMetric *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSCommandNiceGroupSessionRTCMetric;
  v14 = -[IDSCommandNiceGroupSessionRTCMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_command = a3;
    v14->_success = a4;
    objc_storeStrong((id *)&v14->_errorDomain, a5);
    v15->_errorCode = a6;
    v15->_retryCount = a7;
  }

  return v15;
}

- (int64_t)command
{
  return self->_command;
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
