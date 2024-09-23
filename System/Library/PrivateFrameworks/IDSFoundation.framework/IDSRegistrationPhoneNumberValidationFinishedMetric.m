@implementation IDSRegistrationPhoneNumberValidationFinishedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSRegistrationPhoneNumberValidationFinished");
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
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_registrationError(self, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInt_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("registrationError"), v15);

  objc_msgSend_validationDuration(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("validationDuration"), v19);

  objc_msgSend_numberOfSMSSent(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("numberOfSMSSent"), v23);

  return (NSDictionary *)v3;
}

- (IDSRegistrationPhoneNumberValidationFinishedMetric)initWithGuid:(id)a3 registrationError:(unsigned int)a4 validationDuration:(id)a5 numberOfSMSSent:(id)a6
{
  id v11;
  id v12;
  id v13;
  IDSRegistrationPhoneNumberValidationFinishedMetric *v14;
  IDSRegistrationPhoneNumberValidationFinishedMetric *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSRegistrationPhoneNumberValidationFinishedMetric;
  v14 = -[IDSRegistrationPhoneNumberValidationFinishedMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guid, a3);
    v15->_registrationError = a4;
    objc_storeStrong((id *)&v15->_validationDuration, a5);
    objc_storeStrong((id *)&v15->_numberOfSMSSent, a6);
  }

  return v15;
}

- (NSString)guid
{
  return self->_guid;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (NSNumber)validationDuration
{
  return self->_validationDuration;
}

- (NSNumber)numberOfSMSSent
{
  return self->_numberOfSMSSent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSMSSent, 0);
  objc_storeStrong((id *)&self->_validationDuration, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
