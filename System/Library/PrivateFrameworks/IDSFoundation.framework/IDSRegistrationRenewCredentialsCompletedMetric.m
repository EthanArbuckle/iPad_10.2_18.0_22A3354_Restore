@implementation IDSRegistrationRenewCredentialsCompletedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSRegistrationRenewCredentialsCompleted");
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
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_renewResult(self, v5, v6, v7);
  objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("renewResult"), v11);

  objc_msgSend_errorDomain(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("errorDomain"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_errorCode(self, v17, v18, v19);
  objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("errorCode"), v23);

  return (NSDictionary *)v3;
}

- (IDSRegistrationRenewCredentialsCompletedMetric)initWithRenewResult:(int64_t)a3 errorDomain:(id)a4 errorCode:(int64_t)a5
{
  id v9;
  IDSRegistrationRenewCredentialsCompletedMetric *v10;
  IDSRegistrationRenewCredentialsCompletedMetric *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSRegistrationRenewCredentialsCompletedMetric;
  v10 = -[IDSRegistrationRenewCredentialsCompletedMetric init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_renewResult = a3;
    objc_storeStrong((id *)&v10->_errorDomain, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (int64_t)renewResult
{
  return self->_renewResult;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
