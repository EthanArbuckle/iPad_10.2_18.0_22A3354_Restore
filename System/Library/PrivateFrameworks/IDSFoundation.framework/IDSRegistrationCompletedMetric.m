@implementation IDSRegistrationCompletedMetric

- (IDSRegistrationCompletedMetric)initWithRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6 circleStatus:(int64_t)a7
{
  id v12;
  IDSRegistrationCompletedMetric *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  IDSRegistrationCompletedMetric *v17;
  uint64_t v18;
  NSString *serviceIdentifier;
  objc_super v21;

  v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSRegistrationCompletedMetric;
  v13 = -[IDSRegistrationCompletedMetric init](&v21, sel_init);
  v17 = v13;
  if (v13)
  {
    v13->_registrationType = a3;
    v18 = objc_msgSend_copy(v12, v14, v15, v16);
    serviceIdentifier = v17->_serviceIdentifier;
    v17->_serviceIdentifier = (NSString *)v18;

    v17->_wasSuccessful = a5;
    v17->_registrationError = a6;
    v17->_circleStatus = a7;
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)CFSTR("RegistrationCompleted");
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
  v8 = objc_msgSend_registrationType(self, v5, v6, v7);
  objc_msgSend_numberWithInt_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("ErrorDomain"), v11);

  objc_msgSend_serviceIdentifier(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("ServiceIdentifier"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_wasSuccessful(self, v17, v18, v19);
  objc_msgSend_numberWithBool_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("WasSuccessful"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_registrationError(self, v25, v26, v27);
  objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("IDSRegistrationError"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_circleStatus(self, v33, v34, v35);
  objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("CircleStatus"), v39);

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555931;
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
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  v7 = objc_msgSend_registrationType(self, v4, v5, v6);
  objc_msgSend_setRegistrationType_(v3, v8, v7, v9);
  objc_msgSend_serviceIdentifier(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceIdentifier_(v3, v14, (uint64_t)v13, v15);

  v19 = objc_msgSend_wasSuccessful(self, v16, v17, v18);
  objc_msgSend_setWasSuccessful_(v3, v20, v19, v21);
  v25 = objc_msgSend_registrationError(self, v22, v23, v24);
  objc_msgSend_setRegistrationError_(v3, v26, v25, v27);
  v31 = objc_msgSend_circleStatus(self, v28, v29, v30);
  objc_msgSend_setCircleStatus_(v3, v32, v31, v33);
  return (NSCopying *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationCompletion;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (int64_t)registrationError
{
  return self->_registrationError;
}

- (int64_t)circleStatus
{
  return self->_circleStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
