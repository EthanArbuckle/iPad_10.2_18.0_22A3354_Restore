@implementation PDSRegistrationAbandonedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSRegistrationAbandoned");
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
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_failureReason(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("failiureReason"), v7);

  objc_msgSend_registrationReason(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("registrationReason"), v11);

  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v12, v13, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss zzz"), v14);
  objc_msgSend_heartbeatDate(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v12, v19, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    CFDictionarySetValue(v3, CFSTR("plannedHeartbeatDate"), v21);

  return (NSDictionary *)v3;
}

- (PDSRegistrationAbandonedMetric)initWithFailureReason:(id)a3 registrationReason:(id)a4 heartbeatDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PDSRegistrationAbandonedMetric *v12;
  PDSRegistrationAbandonedMetric *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDSRegistrationAbandonedMetric;
  v12 = -[PDSRegistrationAbandonedMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_failureReason, a3);
    objc_storeStrong((id *)&v13->_registrationReason, a4);
    objc_storeStrong((id *)&v13->_heartbeatDate, a5);
  }

  return v13;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (NSNumber)registrationReason
{
  return self->_registrationReason;
}

- (NSDate)heartbeatDate
{
  return self->_heartbeatDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatDate, 0);
  objc_storeStrong((id *)&self->_registrationReason, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end
