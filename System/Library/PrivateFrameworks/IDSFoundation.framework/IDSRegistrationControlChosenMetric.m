@implementation IDSRegistrationControlChosenMetric

- (IDSRegistrationControlChosenMetric)initWithControlRegistrationType:(int64_t)a3 registrationControlStatus:(int64_t)a4 isInterestingRegion:(BOOL)a5
{
  IDSRegistrationControlChosenMetric *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IDSRegistrationControlChosenMetric;
  result = -[IDSRegistrationControlChosenMetric init](&v9, sel_init);
  if (result)
  {
    result->_controlRegistrationType = a3;
    result->_registrationControlStatus = a4;
    result->_isInterestingRegion = a5;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("RegistrationControlChosen");
}

- (unsigned)awdIdentifier
{
  return 2555937;
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
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t isInterestingRegion;
  const char *v20;
  double v21;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  v7 = objc_msgSend_controlRegistrationType(self, v4, v5, v6);
  objc_msgSend_setRegistrationType_(v3, v8, v7, v9);
  v13 = objc_msgSend_registrationControlStatus(self, v10, v11, v12);
  objc_msgSend_setRegistrationControlStatus_(v3, v14, v13, v15);
  isInterestingRegion = objc_msgSend_isInterestingRegion(self, v16, v17, v18);
  objc_msgSend_setIsInterestingRegion_(v3, v20, isInterestingRegion, v21);
  return (NSCopying *)v3;
}

- (int64_t)controlRegistrationType
{
  return self->_controlRegistrationType;
}

- (int64_t)registrationControlStatus
{
  return self->_registrationControlStatus;
}

- (BOOL)isInterestingRegion
{
  return self->_isInterestingRegion;
}

@end
