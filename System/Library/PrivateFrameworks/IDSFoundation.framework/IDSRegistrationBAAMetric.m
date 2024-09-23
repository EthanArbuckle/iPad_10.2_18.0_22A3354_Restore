@implementation IDSRegistrationBAAMetric

- (IDSRegistrationBAAMetric)initWithSuccess:(BOOL)a3 error:(id)a4 deviceID:(id)a5
{
  id v9;
  id v10;
  IDSRegistrationBAAMetric *v11;
  IDSRegistrationBAAMetric *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSRegistrationBAAMetric;
  v11 = -[IDSRegistrationBAAMetric init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_deviceID, a5);
  }

  return v12;
}

- (NSString)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const __CFString *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_success(self, v7, v8, v9))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend_error(self, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("%@: <success: %@, error: %@, deviceID: %@>"), v20, v6, v13, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (NSString)name
{
  return (NSString *)CFSTR("BAASuccess");
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
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;
  void *v36;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_success(self, v5, v6, v7);
  objc_msgSend_numberWithBool_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("Success"), v11);

  objc_msgSend_error(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_error(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_domain(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      CFDictionarySetValue(v3, CFSTR("ErrorDomain"), v23);

    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_error(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_code(v28, v29, v30, v31);
    objc_msgSend_numberWithInteger_(v24, v33, v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      CFDictionarySetValue(v3, CFSTR("ErrorCode"), v35);

  }
  objc_msgSend_deviceID(self, v16, v17, v18);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    CFDictionarySetValue(v3, CFSTR("DeviceID"), v36);

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationBAA;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
