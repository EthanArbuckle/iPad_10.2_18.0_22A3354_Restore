@implementation IDSRegistrationAuthenticationParametersReceivedMetric

- (IDSRegistrationAuthenticationParametersReceivedMetric)initWithErrorCode:(int64_t)a3 timeIntervalSinceAuthenticationParameterRequest:(double)a4
{
  IDSRegistrationAuthenticationParametersReceivedMetric *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSRegistrationAuthenticationParametersReceivedMetric;
  result = -[IDSRegistrationAuthenticationParametersReceivedMetric init](&v7, sel_init);
  if (result)
  {
    result->_errorCode = a3;
    result->_timeIntervalSinceAuthenticationParameterRequest = a4;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("RegistrationAuthenticationParametersReceived");
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
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_errorCode(self, v5, v6, v7);
  objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("ErrorCode"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceAuthenticationParameterRequest(self, v13, v14, v15);
  objc_msgSend_numberWithDouble_(v12, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("TimeIntervalSinceRequest"), v19);

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555936;
}

- (NSCopying)awdRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  v7 = objc_msgSend_errorCode(self, v4, v5, v6);
  objc_msgSend_setError_(v3, v8, v7, v9);
  objc_msgSend_timeIntervalSinceAuthenticationParameterRequest(self, v10, v11, v12);
  objc_msgSend_setTimeIntervalSinceRequest_(v3, v14, (unint64_t)(v13 * 1000.0), v13 * 1000.0);
  return (NSCopying *)v3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (double)timeIntervalSinceAuthenticationParameterRequest
{
  return self->_timeIntervalSinceAuthenticationParameterRequest;
}

@end
