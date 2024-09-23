@implementation IDSRegistrationDailyPNRStatusMetric

- (NSString)name
{
  return (NSString *)CFSTR("PNRRegStatus");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  NSString *pnrMechanism;
  NSNumber *errorCode;
  void *v14;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_pnrCurrentlyRegistered, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v3, CFSTR("pnr_registered"), v6);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v7, self->_pnrRegisteredToday, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v3, CFSTR("pnr_activation_reregistration"), v9);

  pnrMechanism = self->_pnrMechanism;
  if (pnrMechanism)
    CFDictionarySetValue(v3, CFSTR("transport"), pnrMechanism);
  errorCode = self->_errorCode;
  if (errorCode)
    CFDictionarySetValue(v3, CFSTR("error_codes"), errorCode);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, self->_hasMultipleSIMs, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    CFDictionarySetValue(v3, CFSTR("has_multiple_sims"), v14);

  return (NSDictionary *)v3;
}

- (IDSRegistrationDailyPNRStatusMetric)initWithPNRCurrentlyRegistered:(BOOL)a3 pnrRegisteredToday:(BOOL)a4 pnrMechanism:(id)a5 errorCode:(id)a6 hasMultipleSIMs:(BOOL)a7
{
  id v13;
  id v14;
  IDSRegistrationDailyPNRStatusMetric *v15;
  IDSRegistrationDailyPNRStatusMetric *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSRegistrationDailyPNRStatusMetric;
  v15 = -[IDSRegistrationDailyPNRStatusMetric init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_pnrCurrentlyRegistered = a3;
    v15->_pnrRegisteredToday = a4;
    objc_storeStrong((id *)&v15->_pnrMechanism, a5);
    objc_storeStrong((id *)&v16->_errorCode, a6);
    v16->_hasMultipleSIMs = a7;
  }

  return v16;
}

- (BOOL)pnrCurrentlyRegistered
{
  return self->_pnrCurrentlyRegistered;
}

- (BOOL)pnrRegisteredToday
{
  return self->_pnrRegisteredToday;
}

- (NSString)pnrMechanism
{
  return self->_pnrMechanism;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (BOOL)hasMultipleSIMs
{
  return self->_hasMultipleSIMs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_pnrMechanism, 0);
}

@end
