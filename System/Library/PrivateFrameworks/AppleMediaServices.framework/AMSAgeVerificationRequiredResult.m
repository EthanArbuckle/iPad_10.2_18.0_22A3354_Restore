@implementation AMSAgeVerificationRequiredResult

- (AMSAgeVerificationRequiredResult)initWithRequiredType:(unint64_t)a3
{
  AMSAgeVerificationRequiredResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSAgeVerificationRequiredResult;
  result = -[AMSAgeVerificationRequiredResult init](&v5, sel_init);
  if (result)
  {
    result->_requiredType = a3;
    result->_isVerificationRequired = a3 == 2;
  }
  return result;
}

- (BOOL)isVerificationRequired
{
  return self->_isVerificationRequired;
}

- (void)setIsVerificationRequired:(BOOL)a3
{
  self->_isVerificationRequired = a3;
}

- (unint64_t)requiredType
{
  return self->_requiredType;
}

- (void)setRequiredType:(unint64_t)a3
{
  self->_requiredType = a3;
}

@end
